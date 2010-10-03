Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NPo-0002lY-OF
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:11:43 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id EB89D1D363F6;
	Sun,  3 Oct 2010 14:11:22 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:11:21 +0200
Message-Id: <1286107883-10714-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1286107883-10714-1-git-send-email-ynezz@true.cz>
References: <1286107883-10714-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] lua5.1: add bitwise operators patch and fix version in pkg-config file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Oct 2010 12:11:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/lua/lua5.1/bitwise_operators.patch |  620 ++++++++++++++++++++++=
++++++
 recipes/lua/lua5.1/lua5.1.pc               |    2 +-
 recipes/lua/lua5.1_5.1.4.bb                |    3 +-
 3 files changed, 623 insertions(+), 2 deletions(-)
 create mode 100644 recipes/lua/lua5.1/bitwise_operators.patch

diff --git a/recipes/lua/lua5.1/bitwise_operators.patch b/recipes/lua/lua=
5.1/bitwise_operators.patch
new file mode 100644
index 0000000..138a2bd
--- /dev/null
+++ b/recipes/lua/lua5.1/bitwise_operators.patch
@@ -0,0 +1,620 @@
+Index: lua-5.1.4/src/lcode.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/lcode.c	2007-12-28 16:32:23.000000000 +0100
++++ lua-5.1.4/src/lcode.c	2009-01-27 21:15:39.000000000 +0100
+@@ -650,6 +650,17 @@
+     case OP_POW: r =3D luai_numpow(v1, v2); break;
+     case OP_UNM: r =3D luai_numunm(v1); break;
+     case OP_LEN: return 0;  /* no constant folding for 'len' */
++#if defined(LUA_BITWISE_OPERATORS)
++    case OP_BOR: luai_logor(r, v1, v2); break;
++    case OP_BAND: luai_logand(r, v1, v2); break;
++    case OP_BXOR: luai_logxor(r, v1, v2);  break;
++    case OP_BLSHFT: luai_loglshft(r, v1, v2); break;
++    case OP_BRSHFT: luai_logrshft(r, v1, v2); break;
++    case OP_BNOT: luai_lognot(r, v1); break;
++    case OP_INTDIV:
++      if (v2 =3D=3D 0) return 0;  /* do not attempt to divide by 0 */
++      r =3D luai_numintdiv(v1, v2); break;
++#endif
+     default: lua_assert(0); r =3D 0; break;
+   }
+   if (luai_numisnan(r)) return 0;  /* do not attempt to produce NaN */
+@@ -662,7 +673,11 @@
+   if (constfolding(op, e1, e2))
+     return;
+   else {
++#if defined(LUA_BITWISE_OPERATORS)
++    int o2 =3D (op !=3D OP_UNM && op !=3D OP_LEN && op !=3D OP_BNOT) ? =
luaK_exp2RK(fs, e2) : 0;
++#else
+     int o2 =3D (op !=3D OP_UNM && op !=3D OP_LEN) ? luaK_exp2RK(fs, e2)=
 : 0;
++#endif
+     int o1 =3D luaK_exp2RK(fs, e1);
+     if (o1 > o2) {
+       freeexp(fs, e1);
+@@ -698,6 +713,14 @@
+   expdesc e2;
+   e2.t =3D e2.f =3D NO_JUMP; e2.k =3D VKNUM; e2.u.nval =3D 0;
+   switch (op) {
++#if defined(LUA_BITWISE_OPERATORS)
++    case OPR_BNOT: {
++      if (e->k =3D=3D VK)
++        luaK_exp2anyreg(fs, e);  /* cannot operate on non-numeric const=
ants */
++      codearith(fs, OP_BNOT, e, &e2);
++      break;
++    }
++#endif
+     case OPR_MINUS: {
+       if (!isnumeral(e))
+         luaK_exp2anyreg(fs, e);  /* cannot operate on non-numeric const=
ants */
+@@ -778,6 +801,14 @@
+     case OPR_DIV: codearith(fs, OP_DIV, e1, e2); break;
+     case OPR_MOD: codearith(fs, OP_MOD, e1, e2); break;
+     case OPR_POW: codearith(fs, OP_POW, e1, e2); break;
++#if defined(LUA_BITWISE_OPERATORS)
++    case OPR_BOR: codearith(fs, OP_BOR, e1, e2); break;
++    case OPR_BAND: codearith(fs, OP_BAND, e1, e2); break;
++    case OPR_BXOR: codearith(fs, OP_BXOR, e1, e2); break;
++    case OPR_BLSHFT: codearith(fs, OP_BLSHFT, e1, e2); break;
++    case OPR_BRSHFT: codearith(fs, OP_BRSHFT, e1, e2); break;
++    case OPR_INTDIV: codearith(fs, OP_INTDIV, e1, e2); break;
++#endif
+     case OPR_EQ: codecomp(fs, OP_EQ, 1, e1, e2); break;
+     case OPR_NE: codecomp(fs, OP_EQ, 0, e1, e2); break;
+     case OPR_LT: codecomp(fs, OP_LT, 1, e1, e2); break;
+Index: lua-5.1.4/src/lcode.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/lcode.h	2007-12-27 14:02:25.000000000 +0100
++++ lua-5.1.4/src/lcode.h	2009-01-27 21:15:39.000000000 +0100
+@@ -25,6 +25,9 @@
+ */
+ typedef enum BinOpr {
+   OPR_ADD, OPR_SUB, OPR_MUL, OPR_DIV, OPR_MOD, OPR_POW,
++#if defined(LUA_BITWISE_OPERATORS)
++  OPR_BOR, OPR_BAND, OPR_BXOR, OPR_BLSHFT, OPR_BRSHFT, OPR_INTDIV,
++#endif
+   OPR_CONCAT,
+   OPR_NE, OPR_EQ,
+   OPR_LT, OPR_LE, OPR_GT, OPR_GE,
+@@ -33,8 +36,11 @@
+ } BinOpr;
+=20
+=20
++#if defined(LUA_BITWISE_OPERATORS)
++typedef enum UnOpr { OPR_BNOT, OPR_MINUS, OPR_NOT, OPR_LEN, OPR_NOUNOPR=
 } UnOpr;
++#else
+ typedef enum UnOpr { OPR_MINUS, OPR_NOT, OPR_LEN, OPR_NOUNOPR } UnOpr;
+-
++#endif
+=20
+ #define getcode(fs,e)	((fs)->f->code[(e)->u.s.info])
+=20
+Index: lua-5.1.4/src/ldebug.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/ldebug.c	2008-05-08 18:56:26.000000000 +0200
++++ lua-5.1.4/src/ldebug.c	2009-01-27 21:15:39.000000000 +0100
+@@ -592,6 +592,16 @@
+   luaG_typeerror(L, p2, "perform arithmetic on");
+ }
+=20
++#if defined (LUA_BITWISE_OPERATORS)
++void luaG_logicerror (lua_State *L, const TValue *p1, const TValue *p2)=
 {
++  TValue temp;
++  if (luaV_tonumber(p1, &temp) =3D=3D NULL)
++    p2 =3D p1;  /* first operand is wrong */
++  luaG_typeerror(L, p2, "perform bitwise operation on");
++}
++#endif
++
++
+=20
+ int luaG_ordererror (lua_State *L, const TValue *p1, const TValue *p2) =
{
+   const char *t1 =3D luaT_typenames[ttype(p1)];
+Index: lua-5.1.4/src/ldebug.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/ldebug.h	2007-12-27 14:02:25.000000000 +0100
++++ lua-5.1.4/src/ldebug.h	2009-01-27 21:15:39.000000000 +0100
+@@ -30,4 +30,9 @@
+ LUAI_FUNC int luaG_checkcode (const Proto *pt);
+ LUAI_FUNC int luaG_checkopenop (Instruction i);
+=20
++#if defined (LUA_BITWISE_OPERATORS)
++LUAI_FUNC void luaG_logicerror (lua_State *L, const TValue *p1,
++                                              const TValue *p2);
++#endif
++
+ #endif
+Index: lua-5.1.4/src/llex.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/llex.c	2007-12-27 14:02:25.000000000 +0100
++++ lua-5.1.4/src/llex.c	2009-01-27 21:15:39.000000000 +0100
+@@ -39,7 +39,11 @@
+     "end", "false", "for", "function", "if",
+     "in", "local", "nil", "not", "or", "repeat",
+     "return", "then", "true", "until", "while",
++#if defined(LUA_BITWISE_OPERATORS)
++    "..", "...", "=3D=3D", ">=3D", ">>", "<=3D", "<<", "^^", "~=3D", "!=
=3D"
++#else
+     "..", "...", "=3D=3D", ">=3D", "<=3D", "~=3D",
++#endif
+     "<number>", "<name>", "<string>", "<eof>",
+     NULL
+ };
+@@ -371,6 +375,30 @@
+         if (ls->current !=3D '=3D') return '=3D';
+         else { next(ls); return TK_EQ; }
+       }
++#if defined(LUA_BITWISE_OPERATORS)
++      case '<': {
++        next(ls);
++        if (ls->current =3D=3D '=3D') { next(ls); return TK_LE; }
++        else if (ls->current =3D=3D '<') { next(ls); return TK_LSHFT; }
++        else  return '<';
++      }
++      case '>': {
++        next(ls);
++        if (ls->current =3D=3D '=3D') { next(ls); return TK_GE; }
++        else if (ls->current =3D=3D '>') { next(ls); return TK_RSHFT; }
++        else return '>';
++      }
++      case '^': {
++        next(ls);
++        if (ls->current !=3D '^') return '^';
++        else { next(ls); return TK_XOR; }
++      }
++      case '!': {
++        next(ls);
++        if (ls->current !=3D '=3D') return '!';
++        else { next(ls); return TK_NE; }
++      }
++#else
+       case '<': {
+         next(ls);
+         if (ls->current !=3D '=3D') return '<';
+@@ -379,8 +407,9 @@
+       case '>': {
+         next(ls);
+         if (ls->current !=3D '=3D') return '>';
+-        else { next(ls); return TK_GE; }
++        else  { next(ls); return TK_GE; }
+       }
++#endif
+       case '~': {
+         next(ls);
+         if (ls->current !=3D '=3D') return '~';
+Index: lua-5.1.4/src/llex.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/llex.h	2007-12-27 14:02:25.000000000 +0100
++++ lua-5.1.4/src/llex.h	2009-01-27 21:15:39.000000000 +0100
+@@ -28,7 +28,11 @@
+   TK_IF, TK_IN, TK_LOCAL, TK_NIL, TK_NOT, TK_OR, TK_REPEAT,
+   TK_RETURN, TK_THEN, TK_TRUE, TK_UNTIL, TK_WHILE,
+   /* other terminal symbols */
++#if defined(LUA_BITWISE_OPERATORS)
++  TK_CONCAT, TK_DOTS, TK_EQ, TK_GE, TK_LSHFT, TK_LE, TK_RSHFT, TK_XOR, =
TK_NE, TK_CNE, TK_NUMBER,
++#else
+   TK_CONCAT, TK_DOTS, TK_EQ, TK_GE, TK_LE, TK_NE, TK_NUMBER,
++#endif
+   TK_NAME, TK_STRING, TK_EOS
+ };
+=20
+Index: lua-5.1.4/src/lopcodes.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/lopcodes.c	2007-12-27 14:02:25.000000000 +0100
++++ lua-5.1.4/src/lopcodes.c	2009-01-27 21:15:39.000000000 +0100
+@@ -32,6 +32,15 @@
+   "DIV",
+   "MOD",
+   "POW",
++#if defined(LUA_BITWISE_OPERATORS)
++  "BOR",
++  "BAND",
++  "OP_BXOR"
++  "BLSHFT",
++  "BRSHFT",
++  "BNOT",
++  "INTDIV",
++#endif
+   "UNM",
+   "NOT",
+   "LEN",
+@@ -78,6 +87,15 @@
+  ,opmode(0, 1, OpArgK, OpArgK, iABC)		/* OP_DIV */
+  ,opmode(0, 1, OpArgK, OpArgK, iABC)		/* OP_MOD */
+  ,opmode(0, 1, OpArgK, OpArgK, iABC)		/* OP_POW */
++#if defined(LUA_BITWISE_OPERATORS)
++ ,opmode(0, 1, OpArgK, OpArgK, iABC)		/* OP_BOR */
++ ,opmode(0, 1, OpArgK, OpArgK, iABC)		/* OP_BAND */
++ ,opmode(0, 1, OpArgK, OpArgK, iABC)		/* OP_BXOR */
++ ,opmode(0, 1, OpArgK, OpArgK, iABC)		/* OP_BLSHFT */
++ ,opmode(0, 1, OpArgK, OpArgK, iABC)		/* OP_BRSHFT */
++ ,opmode(0, 1, OpArgR, OpArgN, iABC)		/* OP_BNOT */
++ ,opmode(0, 1, OpArgK, OpArgK, iABC)		/* OP_INTDIV */
++#endif
+  ,opmode(0, 1, OpArgR, OpArgN, iABC)		/* OP_UNM */
+  ,opmode(0, 1, OpArgR, OpArgN, iABC)		/* OP_NOT */
+  ,opmode(0, 1, OpArgR, OpArgN, iABC)		/* OP_LEN */
+Index: lua-5.1.4/src/lopcodes.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/lopcodes.h	2007-12-27 14:02:25.000000000 +0100
++++ lua-5.1.4/src/lopcodes.h	2009-01-27 21:15:39.000000000 +0100
+@@ -174,10 +174,20 @@
+ OP_DIV,/*	A B C	R(A) :=3D RK(B) / RK(C)				*/
+ OP_MOD,/*	A B C	R(A) :=3D RK(B) % RK(C)				*/
+ OP_POW,/*	A B C	R(A) :=3D RK(B) ^ RK(C)				*/
++#if defined(LUA_BITWISE_OPERATORS)
++OP_BOR,/*	A B C	R(A) :=3D RK(B) | RK(C)				*/
++OP_BAND,/*	A B C	R(A) :=3D RK(B) & RK(C)				*/
++OP_BXOR,/*	A B C	R(A) :=3D RK(B) ^| RK(C)				*/
++OP_BLSHFT,/*	A B C	R(A) :=3D RK(B) << RK(C)				*/
++OP_BRSHFT,/*	A B C	R(A) :=3D RK(B) >> RK(C)				*/
++OP_BNOT,/*	A B	R(A) :=3D ~ R(B)				*/
++OP_INTDIV,/*	A B C	R(A) :=3D RK(B) \ RK(C)				*/
++#endif
+ OP_UNM,/*	A B	R(A) :=3D -R(B)					*/
+ OP_NOT,/*	A B	R(A) :=3D not R(B)				*/
+ OP_LEN,/*	A B	R(A) :=3D length of R(B)				*/
+=20
++
+ OP_CONCAT,/*	A B C	R(A) :=3D R(B).. ... ..R(C)			*/
+=20
+ OP_JMP,/*	sBx	pc+=3DsBx					*/
+@@ -186,8 +196,8 @@
+ OP_LT,/*	A B C	if ((RK(B) <  RK(C)) ~=3D A) then pc++  		*/
+ OP_LE,/*	A B C	if ((RK(B) <=3D RK(C)) ~=3D A) then pc++  		*/
+=20
+-OP_TEST,/*	A C	if not (R(A) <=3D> C) then pc++			*/=20
+-OP_TESTSET,/*	A B C	if (R(B) <=3D> C) then R(A) :=3D R(B) else pc++	*/=20
++OP_TEST,/*	A C	if not (R(A) <=3D> C) then pc++			*/
++OP_TESTSET,/*	A B C	if (R(B) <=3D> C) then R(A) :=3D R(B) else pc++	*/
+=20
+ OP_CALL,/*	A B C	R(A), ... ,R(A+C-2) :=3D R(A)(R(A+1), ... ,R(A+B-1)) *=
/
+ OP_TAILCALL,/*	A B C	return R(A)(R(A+1), ... ,R(A+B-1))		*/
+@@ -197,8 +207,8 @@
+ 			if R(A) <?=3D R(A+1) then { pc+=3DsBx; R(A+3)=3DR(A) }*/
+ OP_FORPREP,/*	A sBx	R(A)-=3DR(A+2); pc+=3DsBx				*/
+=20
+-OP_TFORLOOP,/*	A C	R(A+3), ... ,R(A+2+C) :=3D R(A)(R(A+1), R(A+2));=20
+-                        if R(A+3) ~=3D nil then R(A+2)=3DR(A+3) else pc=
++	*/=20
++OP_TFORLOOP,/*	A C	R(A+3), ... ,R(A+2+C) :=3D R(A)(R(A+1), R(A+2));
++                        if R(A+3) ~=3D nil then R(A+2)=3DR(A+3) else pc=
++	*/
+ OP_SETLIST,/*	A B C	R(A)[(C-1)*FPF+i] :=3D R(A+i), 1 <=3D i <=3D B	*/
+=20
+ OP_CLOSE,/*	A 	close all variables in the stack up to (>=3D) R(A)*/
+Index: lua-5.1.4/src/lparser.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/lparser.c	2007-12-28 16:32:23.000000000 +0100
++++ lua-5.1.4/src/lparser.c	2009-01-27 21:15:39.000000000 +0100
+@@ -780,6 +780,9 @@
+     case TK_NOT: return OPR_NOT;
+     case '-': return OPR_MINUS;
+     case '#': return OPR_LEN;
++#if defined(LUA_BITWISE_OPERATORS)
++    case '~': return OPR_BNOT;
++#endif
+     default: return OPR_NOUNOPR;
+   }
+ }
+@@ -793,6 +796,14 @@
+     case '/': return OPR_DIV;
+     case '%': return OPR_MOD;
+     case '^': return OPR_POW;
++#if defined(LUA_BITWISE_OPERATORS)
++    case '|': return OPR_BOR;
++    case '&': return OPR_BAND;
++    case TK_XOR: return OPR_BXOR;
++    case TK_LSHFT: return OPR_BLSHFT;
++    case TK_RSHFT: return OPR_BRSHFT;
++    case '\\': return OPR_INTDIV;
++#endif
+     case TK_CONCAT: return OPR_CONCAT;
+     case TK_NE: return OPR_NE;
+     case TK_EQ: return OPR_EQ;
+@@ -812,6 +823,9 @@
+   lu_byte right; /* right priority */
+ } priority[] =3D {  /* ORDER OPR */
+    {6, 6}, {6, 6}, {7, 7}, {7, 7}, {7, 7},  /* `+' `-' `/' `%' */
++#if defined(LUA_BITWISE_OPERATORS)
++   {6, 6}, {6, 6}, {6, 6}, {7, 7}, {7, 7}, {7, 7}, /* `|' `&' `!' `<<' =
`>>' `\' */
++#endif
+    {10, 9}, {5, 4},                 /* power and concat (right associat=
ive) */
+    {3, 3}, {3, 3},                  /* equality and inequality */
+    {3, 3}, {3, 3}, {3, 3}, {3, 3},  /* order */
+Index: lua-5.1.4/src/ltm.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/ltm.c	2007-12-27 14:02:25.000000000 +0100
++++ lua-5.1.4/src/ltm.c	2009-01-27 21:15:39.000000000 +0100
+@@ -34,6 +34,9 @@
+     "__add", "__sub", "__mul", "__div", "__mod",
+     "__pow", "__unm", "__len", "__lt", "__le",
+     "__concat", "__call"
++#if defined(LUA_BITWISE_OPERATORS)
++    ,"__or", "__and", "__xor", "__shl", "__shr", "__not", "__intdiv"
++#endif
+   };
+   int i;
+   for (i=3D0; i<TM_N; i++) {
+Index: lua-5.1.4/src/ltm.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/ltm.h	2007-12-27 14:02:25.000000000 +0100
++++ lua-5.1.4/src/ltm.h	2009-01-27 21:15:39.000000000 +0100
+@@ -33,6 +33,15 @@
+   TM_LE,
+   TM_CONCAT,
+   TM_CALL,
++#if defined(LUA_BITWISE_OPERATORS)
++  TM_BOR,
++  TM_BAND,
++  TM_BXOR,
++  TM_BLSHFT,
++  TM_BRSHFT,
++  TM_BNOT,
++  TM_INTDIV,
++#endif
+   TM_N		/* number of elements in the enum */
+ } TMS;
+=20
+Index: lua-5.1.4/src/lua.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/lua.h	2008-08-06 15:30:12.000000000 +0200
++++ lua-5.1.4/src/lua.h	2009-01-27 21:16:39.000000000 +0100
+@@ -17,7 +17,7 @@
+=20
+=20
+ #define LUA_VERSION	"Lua 5.1"
+-#define LUA_RELEASE	"Lua 5.1.4"
++#define LUA_RELEASE	"Lua 5.1.4+bitwiseops"
+ #define LUA_VERSION_NUM	501
+ #define LUA_COPYRIGHT	"Copyright (C) 1994-2008 Lua.org, PUC-Rio"
+ #define LUA_AUTHORS 	"R. Ierusalimschy, L. H. de Figueiredo & W. Celes"
+Index: lua-5.1.4/src/luaconf.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/luaconf.h	2008-02-11 17:25:08.000000000 +0100
++++ lua-5.1.4/src/luaconf.h	2009-01-27 21:15:39.000000000 +0100
+@@ -2,6 +2,7 @@
+ ** $Id: luaconf.h,v 1.82.1.7 2008/02/11 16:25:08 roberto Exp $
+ ** Configuration file for Lua
+ ** See Copyright Notice in lua.h
++** Added logic operators : & | ^^ (xor) << >> ~, arithmetic operator \ =
(integer division) and !=3D as an alternative to ~=3D
+ */
+=20
+=20
+@@ -209,6 +210,12 @@
+ */
+ #define LUA_IDSIZE	60
+=20
++/*
++@@ LUA_BITWISE_OPERATORS enable logical operators | & ^| >> << ~ on lua=
_Number
++@* but also arithmetic operator \ (integer division) and !=3D as an ale=
rnative to ~=3D
++*/
++#define LUA_BITWISE_OPERATORS
++
+=20
+ /*
+ ** {=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+@@ -216,6 +223,7 @@
+ ** =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ */
+=20
++
+ #if defined(lua_c) || defined(luaall_c)
+=20
+ /*
+@@ -526,25 +534,6 @@
+=20
+=20
+ /*
+-@@ The luai_num* macros define the primitive operations over numbers.
+-*/
+-#if defined(LUA_CORE)
+-#include <math.h>
+-#define luai_numadd(a,b)	((a)+(b))
+-#define luai_numsub(a,b)	((a)-(b))
+-#define luai_nummul(a,b)	((a)*(b))
+-#define luai_numdiv(a,b)	((a)/(b))
+-#define luai_nummod(a,b)	((a) - floor((a)/(b))*(b))
+-#define luai_numpow(a,b)	(pow(a,b))
+-#define luai_numunm(a)		(-(a))
+-#define luai_numeq(a,b)		((a)=3D=3D(b))
+-#define luai_numlt(a,b)		((a)<(b))
+-#define luai_numle(a,b)		((a)<=3D(b))
+-#define luai_numisnan(a)	(!luai_numeq((a), (a)))
+-#endif
+-
+-
+-/*
+ @@ lua_number2int is a macro to convert lua_Number to int.
+ @@ lua_number2integer is a macro to convert lua_Number to lua_Integer.
+ ** CHANGE them if you know a faster way to convert a lua_Number to
+@@ -560,7 +549,7 @@
+ /* On a Microsoft compiler, use assembler */
+ #if defined(_MSC_VER)
+=20
+-#define lua_number2int(i,d)   __asm fld d   __asm fistp i
++#define lua_number2int(i,d)   { __asm fld d   __asm fistp i }
+ #define lua_number2integer(i,n)		lua_number2int(i, n)
+=20
+ /* the next trick should work on any Pentium, but sometimes clashes
+@@ -582,6 +571,38 @@
+=20
+ #endif
+=20
++
++/*
++@@ The luai_num* macros define the primitive operations over numbers.
++*/
++#if defined(LUA_CORE)
++#include <math.h>
++#define luai_numadd(a,b)	((a)+(b))
++#define luai_numsub(a,b)	((a)-(b))
++#define luai_nummul(a,b)	((a)*(b))
++#define luai_numdiv(a,b)	((a)/(b))
++#ifdef LUA_BITWISE_OPERATORS
++#define luai_numintdiv(a,b)	(floor((a)/(b)))
++#endif
++#define luai_nummod(a,b)	((a) - floor((a)/(b))*(b))
++#define luai_numpow(a,b)	(pow(a,b))
++#define luai_numunm(a)		(-(a))
++#define luai_numeq(a,b)		((a)=3D=3D(b))
++#define luai_numlt(a,b)		((a)<(b))
++#define luai_numle(a,b)		((a)<=3D(b))
++#define luai_numisnan(a)	(!luai_numeq((a), (a)))
++
++#if defined(LUA_BITWISE_OPERATORS)
++#define luai_logor(r, a, b)	{ lua_Integer ai,bi; lua_number2int(ai,a); =
lua_number2int(bi,b); r =3D ai|bi; }
++#define luai_logand(r, a,b)	{ lua_Integer ai,bi; lua_number2int(ai,a); =
lua_number2int(bi,b); r =3D ai&bi; }
++#define luai_logxor(r, a,b)	{ lua_Integer ai,bi; lua_number2int(ai,a); =
lua_number2int(bi,b); r =3D ai^bi; }
++#define luai_lognot(r,a)	{ lua_Integer ai; lua_number2int(ai,a); r =3D =
~ai; }
++#define luai_loglshft(r, a,b)	{ lua_Integer ai,bi; lua_number2int(ai,a)=
; lua_number2int(bi,b); r =3D ai<<bi; }
++#define luai_logrshft(r, a,b)	{ lua_Integer ai,bi; lua_number2int(ai,a)=
; lua_number2int(bi,b); r =3D ai>>bi; }
++#endif
++
++#endif
++
+ /* }=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
+=20
+=20
+Index: lua-5.1.4/src/lvm.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/lvm.c	2007-12-28 16:32:23.000000000 +0100
++++ lua-5.1.4/src/lvm.c	2009-01-27 21:15:39.000000000 +0100
+@@ -325,6 +325,9 @@
+       case TM_MOD: setnvalue(ra, luai_nummod(nb, nc)); break;
+       case TM_POW: setnvalue(ra, luai_numpow(nb, nc)); break;
+       case TM_UNM: setnvalue(ra, luai_numunm(nb)); break;
++#if defined(LUA_BITWISE_OPERATORS)
++      case TM_INTDIV: setnvalue(ra, luai_numintdiv(nb, nc)); break;
++#endif
+       default: lua_assert(0); break;
+     }
+   }
+@@ -332,7 +335,30 @@
+     luaG_aritherror(L, rb, rc);
+ }
+=20
+-
++#if defined(LUA_BITWISE_OPERATORS)
++static void Logic (lua_State *L, StkId ra, const TValue *rb,
++                   const TValue *rc, TMS op) {
++  TValue tempb, tempc;
++  const TValue *b, *c;
++  if ((b =3D luaV_tonumber(rb, &tempb)) !=3D NULL &&
++      (c =3D luaV_tonumber(rc, &tempc)) !=3D NULL) {
++    lua_Number nb =3D nvalue(b), nc =3D nvalue(c);
++    lua_Integer r;
++    switch (op) {
++      case TM_BLSHFT: luai_loglshft(r, nb, nc); break;
++      case TM_BRSHFT: luai_logrshft(r, nb, nc); break;
++      case TM_BOR: luai_logor(r, nb, nc); break;
++      case TM_BAND: luai_logand(r, nb, nc); break;
++      case TM_BXOR: luai_logxor(r, nb, nc); break;
++      case TM_BNOT: luai_lognot(r, nb); break;
++      default: lua_assert(0); r =3D 0; break;
++    }
++    setnvalue(ra, r);
++  }
++  else if (!call_binTM(L, rb, rc, ra, op))
++    luaG_logicerror(L, rb, rc);
++}
++#endif
+=20
+ /*
+ ** some macros for common tasks in `luaV_execute'
+@@ -369,6 +395,22 @@
+       }
+=20
+=20
++#if defined(LUA_BITWISE_OPERATORS)
++#define logic_op(op,tm) { \
++        TValue *rb =3D RKB(i); \
++        TValue *rc =3D RKC(i); \
++        if (ttisnumber(rb) && ttisnumber(rc)) { \
++          lua_Integer r; \
++          lua_Number nb =3D nvalue(rb), nc =3D nvalue(rc); \
++          op(r, nb, nc); \
++          setnvalue(ra, r); \
++        } \
++        else \
++          Protect(Logic(L, ra, rb, rc, tm)); \
++      }
++#endif
++
++
+=20
+ void luaV_execute (lua_State *L, int nexeccalls) {
+   LClosure *cl;
+@@ -502,6 +544,45 @@
+         }
+         continue;
+       }
++#if defined(LUA_BITWISE_OPERATORS)
++      case OP_BOR: {
++        logic_op(luai_logor, TM_BOR);
++        continue;
++      }
++      case OP_BAND: {
++        logic_op(luai_logand, TM_BAND);
++        continue;
++      }
++      case OP_BXOR: {
++        logic_op(luai_logxor, TM_BXOR);
++        continue;
++      }
++      case OP_BLSHFT: {
++        logic_op(luai_loglshft, TM_BLSHFT);
++        continue;
++      }
++      case OP_BRSHFT: {
++        logic_op(luai_logrshft, TM_BRSHFT);
++        continue;
++      }
++      case OP_BNOT: {
++        TValue *rb =3D RB(i);
++        if (ttisnumber(rb)) {
++          lua_Integer r;
++          lua_Number nb =3D nvalue(rb);
++          luai_lognot(r, nb);
++          setnvalue(ra, r);
++        }
++        else {
++          Protect(Logic(L, ra, rb, rb, TM_BNOT));
++        }
++        continue;
++      }
++      case OP_INTDIV: {
++        arith_op(luai_numintdiv, TM_DIV);
++        continue;
++      }
++#endif
+       case OP_NOT: {
+         int res =3D l_isfalse(RB(i));  /* next assignment may change th=
is value */
+         setbvalue(ra, res);
+Index: lua-5.1.4/test/bitwisepatchtest.lua
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ lua-5.1.4/test/bitwisepatchtest.lua	2009-01-27 21:15:39.000000000 +0=
100
+@@ -0,0 +1,24 @@
++hex=3Dfunction (i) return "0x"..string.format("%X", i) end
++print(hex(0x54|0x55))
++print(hex(0x54&0x66))
++print(hex(0x54^|0x66))
++print(hex(~0x54))
++print(hex(0xF<< 4))
++print(hex(0xF0>> 4))
++a,b=3D0x54,0x55
++print(hex(a),"|",hex(b), "=3D",hex(a|b))
++print(hex(a),"|","0x55", "=3D",hex(a|0x55))
++print(hex(a),"|","0x5|0x50 (", hex(0x5|0x50), ") =3D",hex(a|(0x5|0x50))=
)
++a,b=3D0x54,0x66
++print(hex(a),"&",hex(b), "=3D",hex(a&b))
++print(hex(a),"&","0x66", "=3D",hex(a&0x66))
++print(hex(a),"^|",hex(b), "=3D",hex(a^|b))
++print(hex(a),"^|","0x66", "=3D",hex(a^|0x66))
++print("~"..hex(a),"=3D",hex(~a))
++a,b=3D0xF,0xF0
++print(hex(a).."<<4","=3D",hex(a<<4))
++print(hex(b)..">>4","=3D",hex(b>>4))
++a,b=3D0xF,4
++print(hex(a).."<<"..b,"=3D",hex(a<<b))
++a,b=3D0xF0,4
++print(hex(a)..">>"..b,"=3D",hex(a>>b))
diff --git a/recipes/lua/lua5.1/lua5.1.pc b/recipes/lua/lua5.1/lua5.1.pc
index 80db250..41d5801 100644
--- a/recipes/lua/lua5.1/lua5.1.pc
+++ b/recipes/lua/lua5.1/lua5.1.pc
@@ -4,7 +4,7 @@ includedir=3D${prefix}/include
=20
 Name: Lua
 Description: Lua language engine
-Version: 5.1.3
+Version: 5.1.4
 Requires:
 Libs: -L${libdir} -llua
 Libs.private: -lm
diff --git a/recipes/lua/lua5.1_5.1.4.bb b/recipes/lua/lua5.1_5.1.4.bb
index c4e5c9d..75b48f4 100644
--- a/recipes/lua/lua5.1_5.1.4.bb
+++ b/recipes/lua/lua5.1_5.1.4.bb
@@ -4,8 +4,9 @@ LICENSE =3D "MIT"
 HOMEPAGE =3D "http://www.lua.org/"
=20
 DEPENDS +=3D "readline"
-PR =3D "r5"
+PR =3D "r6"
 SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz \
+           file://bitwise_operators.patch \
            file://lua5.1.pc"
 S =3D "${WORKDIR}/lua-${PV}"
=20
--=20
1.7.0.4



