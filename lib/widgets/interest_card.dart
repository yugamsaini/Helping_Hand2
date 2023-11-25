import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InterestCard extends StatefulWidget {
  final String text;
  final Icon icon;
  final double size;
  List<String> list;

  InterestCard({super.key, required this.text, required this.icon, required this.size, required this.list});

  @override
  State<InterestCard> createState() => _InterestCardState();
}

class _InterestCardState extends State<InterestCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          if(widget.list.contains(widget.text)){
            widget.list.remove(widget.text);
            isTapped = false;
          }
          else{
            widget.list.add(widget.text);
            isTapped = true;
          }
        });
      },
      child: Container(
        // color: Colors.teal[400],
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), 
          color: isTapped ? const Color.fromARGB(255, 182, 193, 248) : Colors.white,
          border: Border.all(color: const Color(0xffBBBBD6))
          
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon,
              Text(widget.text, style: TextStyle(fontSize: widget.size, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            ],
          ),
        )
      ),
    );
  }
}