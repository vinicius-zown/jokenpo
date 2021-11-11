// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';
import "package:flutter/material.dart";

class jogo extends StatefulWidget {
  const jogo({Key? key}) : super(key: key);

  @override
  _jogoState createState() => _jogoState();
}

class _jogoState extends State<jogo> {
  var _imagemApp = AssetImage("assets/imagens/padrao.png");
  var _mensagem = "Escolha sua opção";
  void _opcaoSelecionada(String escolhaUser) {
    print("Opção selecionada: " + escolhaUser);

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuário: " + escolhaUser);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("assets/imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("assets/imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("assets/imagens/tesoura.png");
        });
        break;
    }

    if ((escolhaUser == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUser == "tesoura" && escolhaApp == "papel") ||
        (escolhaUser == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Você ganhou! 🥳";
      });
    } else if ((escolhaUser == "tesoura" && escolhaApp == "pedra") ||
        (escolhaUser == "papel" && escolhaApp == "tesoura") ||
        (escolhaUser == "pedra" && escolhaApp == "papel")) {
      setState(() {
        this._mensagem = "Você perdeu! 😕";
      });
    } else {
      setState(() {
        this._mensagem = "Empatou! 😐";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("JokenPô"),
      ),
      // ignore: duplicate_ignore
      body: Column(children: [
        // ignore: prefer_const_constructors
        Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))),
        Image(
          image: this._imagemApp,
        ),
        Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _opcaoSelecionada("pedra"),
              child: Image.asset(
                "assets/imagens/pedra.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () => _opcaoSelecionada("papel"),
              child: Image.asset(
                "assets/imagens/papel.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () => _opcaoSelecionada("tesoura"),
              child: Image.asset(
                "assets/imagens/tesoura.png",
                height: 100,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
