Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIiA-0005oR-Fz
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:16 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1964856eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=scxxFEo5+yufTyEYy0HWq094HzKYqqLAUcLKNFXZJTQ=;
	b=nrE6uQGn2JxB3V40di7MVXHPBuBaI+L3l4w9HWRyDHlx5Q91awBq8PduLW3Lul1X5J
	VDwMJjP7oqN8WhgFROE4lsPJwVCp6yyM4o9E4ZXAaRVfyif+vVR534Ql+dlInqvVMbY5
	Vp3UuwGz25Nrr2+OSjXm3WUtHXXfoPJCh+7jrRRaGlDh6uGJhMDVEhxgm7+poKTEznKZ
	swoQ85UR2QVM2Kkz59YmPiQbjHeCYqQym9N7do7Le77JQZKE4oMLPKZ9GOBgUat178KW
	i5NNrzyJ6wiVIK0XXRHBBY82q30BiP7OWlHLq3aCY0j7865n4FnxzmQOX0Vlk+GsPbu+
	kqYw==
Received: by 10.14.225.72 with SMTP id y48mr33618616eep.46.1355680715462;
	Sun, 16 Dec 2012 09:58:35 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm23876496eeg.4.2012.12.16.09.58.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:58:01 +0100
Message-Id: <22194abb92ba5dcc13291306eba468739bfae984.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 18/26] lua: update to upstream version 5.1.5
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:16 -0000

From: Marko Lindqvist <cazfi74@gmail.com>

* COPYRIGHT: md5sum changed only because (C) years now up to 2012.
* MJ: removed trailing whitespaces

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../lua/lua5.1/bitwise_operators.patch             | 143 +++++++++------------
 meta-oe/recipes-devtools/lua/lua5.1/lua5.1.pc      |   2 +-
 .../lua/{lua5.1_5.1.4.bb => lua5.1_5.1.5.bb}       |   9 +-
 3 files changed, 69 insertions(+), 85 deletions(-)
 rename meta-oe/recipes-devtools/lua/{lua5.1_5.1.4.bb => lua5.1_5.1.5.bb} (75%)

diff --git a/meta-oe/recipes-devtools/lua/lua5.1/bitwise_operators.patch b/meta-oe/recipes-devtools/lua/lua5.1/bitwise_operators.patch
index 138a2bd..4f0331e 100644
--- a/meta-oe/recipes-devtools/lua/lua5.1/bitwise_operators.patch
+++ b/meta-oe/recipes-devtools/lua/lua5.1/bitwise_operators.patch
@@ -1,8 +1,7 @@
-Index: lua-5.1.4/src/lcode.c
-===================================================================
---- lua-5.1.4.orig/src/lcode.c	2007-12-28 16:32:23.000000000 +0100
-+++ lua-5.1.4/src/lcode.c	2009-01-27 21:15:39.000000000 +0100
-@@ -650,6 +650,17 @@
+diff -Nurd lua-5.1.5/src/lcode.c lua-5.1.5/src/lcode.c
+--- lua-5.1.5/src/lcode.c	2011-01-31 16:53:16.000000000 +0200
++++ lua-5.1.5/src/lcode.c	2012-11-28 21:12:23.958419501 +0200
+@@ -642,6 +642,17 @@
      case OP_POW: r = luai_numpow(v1, v2); break;
      case OP_UNM: r = luai_numunm(v1); break;
      case OP_LEN: return 0;  /* no constant folding for 'len' */
@@ -20,7 +19,7 @@ Index: lua-5.1.4/src/lcode.c
      default: lua_assert(0); r = 0; break;
    }
    if (luai_numisnan(r)) return 0;  /* do not attempt to produce NaN */
-@@ -662,7 +673,11 @@
+@@ -654,7 +665,11 @@
    if (constfolding(op, e1, e2))
      return;
    else {
@@ -32,7 +31,7 @@ Index: lua-5.1.4/src/lcode.c
      int o1 = luaK_exp2RK(fs, e1);
      if (o1 > o2) {
        freeexp(fs, e1);
-@@ -698,6 +713,14 @@
+@@ -690,6 +705,14 @@
    expdesc e2;
    e2.t = e2.f = NO_JUMP; e2.k = VKNUM; e2.u.nval = 0;
    switch (op) {
@@ -47,7 +46,7 @@ Index: lua-5.1.4/src/lcode.c
      case OPR_MINUS: {
        if (!isnumeral(e))
          luaK_exp2anyreg(fs, e);  /* cannot operate on non-numeric constants */
-@@ -778,6 +801,14 @@
+@@ -770,6 +793,14 @@
      case OPR_DIV: codearith(fs, OP_DIV, e1, e2); break;
      case OPR_MOD: codearith(fs, OP_MOD, e1, e2); break;
      case OPR_POW: codearith(fs, OP_POW, e1, e2); break;
@@ -62,10 +61,9 @@ Index: lua-5.1.4/src/lcode.c
      case OPR_EQ: codecomp(fs, OP_EQ, 1, e1, e2); break;
      case OPR_NE: codecomp(fs, OP_EQ, 0, e1, e2); break;
      case OPR_LT: codecomp(fs, OP_LT, 1, e1, e2); break;
-Index: lua-5.1.4/src/lcode.h
-===================================================================
---- lua-5.1.4.orig/src/lcode.h	2007-12-27 14:02:25.000000000 +0100
-+++ lua-5.1.4/src/lcode.h	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/lcode.h lua-5.1.5/src/lcode.h
+--- lua-5.1.5/src/lcode.h	2007-12-27 15:02:25.000000000 +0200
++++ lua-5.1.5/src/lcode.h	2012-11-28 21:12:23.958419501 +0200
 @@ -25,6 +25,9 @@
  */
  typedef enum BinOpr {
@@ -89,10 +87,9 @@ Index: lua-5.1.4/src/lcode.h
  
  #define getcode(fs,e)	((fs)->f->code[(e)->u.s.info])
  
-Index: lua-5.1.4/src/ldebug.c
-===================================================================
---- lua-5.1.4.orig/src/ldebug.c	2008-05-08 18:56:26.000000000 +0200
-+++ lua-5.1.4/src/ldebug.c	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/ldebug.c lua-5.1.5/src/ldebug.c
+--- lua-5.1.5/src/ldebug.c	2008-05-08 19:56:26.000000000 +0300
++++ lua-5.1.5/src/ldebug.c	2012-11-28 21:12:23.958419501 +0200
 @@ -592,6 +592,16 @@
    luaG_typeerror(L, p2, "perform arithmetic on");
  }
@@ -110,10 +107,9 @@ Index: lua-5.1.4/src/ldebug.c
  
  int luaG_ordererror (lua_State *L, const TValue *p1, const TValue *p2) {
    const char *t1 = luaT_typenames[ttype(p1)];
-Index: lua-5.1.4/src/ldebug.h
-===================================================================
---- lua-5.1.4.orig/src/ldebug.h	2007-12-27 14:02:25.000000000 +0100
-+++ lua-5.1.4/src/ldebug.h	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/ldebug.h lua-5.1.5/src/ldebug.h
+--- lua-5.1.5/src/ldebug.h	2007-12-27 15:02:25.000000000 +0200
++++ lua-5.1.5/src/ldebug.h	2012-11-28 21:12:23.958419501 +0200
 @@ -30,4 +30,9 @@
  LUAI_FUNC int luaG_checkcode (const Proto *pt);
  LUAI_FUNC int luaG_checkopenop (Instruction i);
@@ -124,10 +120,9 @@ Index: lua-5.1.4/src/ldebug.h
 +#endif
 +
  #endif
-Index: lua-5.1.4/src/llex.c
-===================================================================
---- lua-5.1.4.orig/src/llex.c	2007-12-27 14:02:25.000000000 +0100
-+++ lua-5.1.4/src/llex.c	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/llex.c lua-5.1.5/src/llex.c
+--- lua-5.1.5/src/llex.c	2009-11-23 16:58:22.000000000 +0200
++++ lua-5.1.5/src/llex.c	2012-11-28 21:12:23.958419501 +0200
 @@ -39,7 +39,11 @@
      "end", "false", "for", "function", "if",
      "in", "local", "nil", "not", "or", "repeat",
@@ -140,7 +135,7 @@ Index: lua-5.1.4/src/llex.c
      "<number>", "<name>", "<string>", "<eof>",
      NULL
  };
-@@ -371,6 +375,30 @@
+@@ -373,6 +377,30 @@
          if (ls->current != '=') return '=';
          else { next(ls); return TK_EQ; }
        }
@@ -171,7 +166,7 @@ Index: lua-5.1.4/src/llex.c
        case '<': {
          next(ls);
          if (ls->current != '=') return '<';
-@@ -379,8 +407,9 @@
+@@ -381,8 +409,9 @@
        case '>': {
          next(ls);
          if (ls->current != '=') return '>';
@@ -182,10 +177,9 @@ Index: lua-5.1.4/src/llex.c
        case '~': {
          next(ls);
          if (ls->current != '=') return '~';
-Index: lua-5.1.4/src/llex.h
-===================================================================
---- lua-5.1.4.orig/src/llex.h	2007-12-27 14:02:25.000000000 +0100
-+++ lua-5.1.4/src/llex.h	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/llex.h lua-5.1.5/src/llex.h
+--- lua-5.1.5/src/llex.h	2007-12-27 15:02:25.000000000 +0200
++++ lua-5.1.5/src/llex.h	2012-11-28 21:12:23.962419499 +0200
 @@ -28,7 +28,11 @@
    TK_IF, TK_IN, TK_LOCAL, TK_NIL, TK_NOT, TK_OR, TK_REPEAT,
    TK_RETURN, TK_THEN, TK_TRUE, TK_UNTIL, TK_WHILE,
@@ -198,10 +192,9 @@ Index: lua-5.1.4/src/llex.h
    TK_NAME, TK_STRING, TK_EOS
  };
  
-Index: lua-5.1.4/src/lopcodes.c
-===================================================================
---- lua-5.1.4.orig/src/lopcodes.c	2007-12-27 14:02:25.000000000 +0100
-+++ lua-5.1.4/src/lopcodes.c	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/lopcodes.c lua-5.1.5/src/lopcodes.c
+--- lua-5.1.5/src/lopcodes.c	2007-12-27 15:02:25.000000000 +0200
++++ lua-5.1.5/src/lopcodes.c	2012-11-28 21:12:23.962419499 +0200
 @@ -32,6 +32,15 @@
    "DIV",
    "MOD",
@@ -234,10 +227,9 @@ Index: lua-5.1.4/src/lopcodes.c
   ,opmode(0, 1, OpArgR, OpArgN, iABC)		/* OP_UNM */
   ,opmode(0, 1, OpArgR, OpArgN, iABC)		/* OP_NOT */
   ,opmode(0, 1, OpArgR, OpArgN, iABC)		/* OP_LEN */
-Index: lua-5.1.4/src/lopcodes.h
-===================================================================
---- lua-5.1.4.orig/src/lopcodes.h	2007-12-27 14:02:25.000000000 +0100
-+++ lua-5.1.4/src/lopcodes.h	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/lopcodes.h lua-5.1.5/src/lopcodes.h
+--- lua-5.1.5/src/lopcodes.h	2007-12-27 15:02:25.000000000 +0200
++++ lua-5.1.5/src/lopcodes.h	2012-11-28 21:12:23.962419499 +0200
 @@ -174,10 +174,20 @@
  OP_DIV,/*	A B C	R(A) := RK(B) / RK(C)				*/
  OP_MOD,/*	A B C	R(A) := RK(B) % RK(C)				*/
@@ -281,10 +273,9 @@ Index: lua-5.1.4/src/lopcodes.h
  OP_SETLIST,/*	A B C	R(A)[(C-1)*FPF+i] := R(A+i), 1 <= i <= B	*/
  
  OP_CLOSE,/*	A 	close all variables in the stack up to (>=) R(A)*/
-Index: lua-5.1.4/src/lparser.c
-===================================================================
---- lua-5.1.4.orig/src/lparser.c	2007-12-28 16:32:23.000000000 +0100
-+++ lua-5.1.4/src/lparser.c	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/lparser.c lua-5.1.5/src/lparser.c
+--- lua-5.1.5/src/lparser.c	2011-10-21 22:31:42.000000000 +0300
++++ lua-5.1.5/src/lparser.c	2012-11-28 21:12:23.962419499 +0200
 @@ -780,6 +780,9 @@
      case TK_NOT: return OPR_NOT;
      case '-': return OPR_MINUS;
@@ -320,10 +311,9 @@ Index: lua-5.1.4/src/lparser.c
     {10, 9}, {5, 4},                 /* power and concat (right associative) */
     {3, 3}, {3, 3},                  /* equality and inequality */
     {3, 3}, {3, 3}, {3, 3}, {3, 3},  /* order */
-Index: lua-5.1.4/src/ltm.c
-===================================================================
---- lua-5.1.4.orig/src/ltm.c	2007-12-27 14:02:25.000000000 +0100
-+++ lua-5.1.4/src/ltm.c	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/ltm.c lua-5.1.5/src/ltm.c
+--- lua-5.1.5/src/ltm.c	2007-12-27 15:02:25.000000000 +0200
++++ lua-5.1.5/src/ltm.c	2012-11-28 21:12:23.962419499 +0200
 @@ -34,6 +34,9 @@
      "__add", "__sub", "__mul", "__div", "__mod",
      "__pow", "__unm", "__len", "__lt", "__le",
@@ -334,10 +324,9 @@ Index: lua-5.1.4/src/ltm.c
    };
    int i;
    for (i=0; i<TM_N; i++) {
-Index: lua-5.1.4/src/ltm.h
-===================================================================
---- lua-5.1.4.orig/src/ltm.h	2007-12-27 14:02:25.000000000 +0100
-+++ lua-5.1.4/src/ltm.h	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/ltm.h lua-5.1.5/src/ltm.h
+--- lua-5.1.5/src/ltm.h	2007-12-27 15:02:25.000000000 +0200
++++ lua-5.1.5/src/ltm.h	2012-11-28 21:12:23.962419499 +0200
 @@ -33,6 +33,15 @@
    TM_LE,
    TM_CONCAT,
@@ -354,23 +343,9 @@ Index: lua-5.1.4/src/ltm.h
    TM_N		/* number of elements in the enum */
  } TMS;
  
-Index: lua-5.1.4/src/lua.h
-===================================================================
---- lua-5.1.4.orig/src/lua.h	2008-08-06 15:30:12.000000000 +0200
-+++ lua-5.1.4/src/lua.h	2009-01-27 21:16:39.000000000 +0100
-@@ -17,7 +17,7 @@
- 
- 
- #define LUA_VERSION	"Lua 5.1"
--#define LUA_RELEASE	"Lua 5.1.4"
-+#define LUA_RELEASE	"Lua 5.1.4+bitwiseops"
- #define LUA_VERSION_NUM	501
- #define LUA_COPYRIGHT	"Copyright (C) 1994-2008 Lua.org, PUC-Rio"
- #define LUA_AUTHORS 	"R. Ierusalimschy, L. H. de Figueiredo & W. Celes"
-Index: lua-5.1.4/src/luaconf.h
-===================================================================
---- lua-5.1.4.orig/src/luaconf.h	2008-02-11 17:25:08.000000000 +0100
-+++ lua-5.1.4/src/luaconf.h	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/src/luaconf.h lua-5.1.5/src/luaconf.h
+--- lua-5.1.5/src/luaconf.h	2008-02-11 18:25:08.000000000 +0200
++++ lua-5.1.5/src/luaconf.h	2012-11-28 21:12:23.962419499 +0200
 @@ -2,6 +2,7 @@
  ** $Id: luaconf.h,v 1.82.1.7 2008/02/11 16:25:08 roberto Exp $
  ** Configuration file for Lua
@@ -474,11 +449,22 @@ Index: lua-5.1.4/src/luaconf.h
  /* }================================================================== */
  
  
-Index: lua-5.1.4/src/lvm.c
-===================================================================
---- lua-5.1.4.orig/src/lvm.c	2007-12-28 16:32:23.000000000 +0100
-+++ lua-5.1.4/src/lvm.c	2009-01-27 21:15:39.000000000 +0100
-@@ -325,6 +325,9 @@
+diff -Nurd lua-5.1.5/src/lua.h lua-5.1.5/src/lua.h
+--- lua-5.1.5/src/lua.h	2012-01-13 22:36:20.000000000 +0200
++++ lua-5.1.5/src/lua.h	2012-11-28 21:13:01.266418680 +0200
+@@ -17,7 +17,7 @@
+ 
+ 
+ #define LUA_VERSION	"Lua 5.1"
+-#define LUA_RELEASE	"Lua 5.1.5"
++#define LUA_RELEASE	"Lua 5.1.5+bitwiseops"
+ #define LUA_VERSION_NUM	501
+ #define LUA_COPYRIGHT	"Copyright (C) 1994-2012 Lua.org, PUC-Rio"
+ #define LUA_AUTHORS 	"R. Ierusalimschy, L. H. de Figueiredo & W. Celes"
+diff -Nurd lua-5.1.5/src/lvm.c lua-5.1.5/src/lvm.c
+--- lua-5.1.5/src/lvm.c	2011-08-17 23:43:11.000000000 +0300
++++ lua-5.1.5/src/lvm.c	2012-11-28 21:12:23.966419498 +0200
+@@ -329,6 +329,9 @@
        case TM_MOD: setnvalue(ra, luai_nummod(nb, nc)); break;
        case TM_POW: setnvalue(ra, luai_numpow(nb, nc)); break;
        case TM_UNM: setnvalue(ra, luai_numunm(nb)); break;
@@ -488,7 +474,7 @@ Index: lua-5.1.4/src/lvm.c
        default: lua_assert(0); break;
      }
    }
-@@ -332,7 +335,30 @@
+@@ -336,7 +339,30 @@
      luaG_aritherror(L, rb, rc);
  }
  
@@ -520,7 +506,7 @@ Index: lua-5.1.4/src/lvm.c
  
  /*
  ** some macros for common tasks in `luaV_execute'
-@@ -369,6 +395,22 @@
+@@ -373,6 +399,22 @@
        }
  
  
@@ -543,7 +529,7 @@ Index: lua-5.1.4/src/lvm.c
  
  void luaV_execute (lua_State *L, int nexeccalls) {
    LClosure *cl;
-@@ -502,6 +544,45 @@
+@@ -506,6 +548,45 @@
          }
          continue;
        }
@@ -589,10 +575,9 @@ Index: lua-5.1.4/src/lvm.c
        case OP_NOT: {
          int res = l_isfalse(RB(i));  /* next assignment may change this value */
          setbvalue(ra, res);
-Index: lua-5.1.4/test/bitwisepatchtest.lua
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ lua-5.1.4/test/bitwisepatchtest.lua	2009-01-27 21:15:39.000000000 +0100
+diff -Nurd lua-5.1.5/test/bitwisepatchtest.lua lua-5.1.5/test/bitwisepatchtest.lua
+--- lua-5.1.5/test/bitwisepatchtest.lua	1970-01-01 02:00:00.000000000 +0200
++++ lua-5.1.5/test/bitwisepatchtest.lua	2012-11-28 21:12:23.966419498 +0200
 @@ -0,0 +1,24 @@
 +hex=function (i) return "0x"..string.format("%X", i) end
 +print(hex(0x54|0x55))
diff --git a/meta-oe/recipes-devtools/lua/lua5.1/lua5.1.pc b/meta-oe/recipes-devtools/lua/lua5.1/lua5.1.pc
index 41d5801..64c03d2 100644
--- a/meta-oe/recipes-devtools/lua/lua5.1/lua5.1.pc
+++ b/meta-oe/recipes-devtools/lua/lua5.1/lua5.1.pc
@@ -4,7 +4,7 @@ includedir=${prefix}/include
 
 Name: Lua
 Description: Lua language engine
-Version: 5.1.4
+Version: 5.1.5
 Requires:
 Libs: -L${libdir} -llua
 Libs.private: -lm
diff --git a/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
similarity index 75%
rename from meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
rename to meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
index 0dc81db..9da9e95 100644
--- a/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
+++ b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
@@ -1,11 +1,10 @@
 DESCRIPTION = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=90c3badc6055c699194c4a7cea583296"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=59bdd99bb82238f238cf5c65c21604fd"
 HOMEPAGE = "http://www.lua.org/"
 
 DEPENDS += "readline"
-PR = "r11"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://bitwise_operators.patch \
            file://lua5.1.pc \
@@ -20,7 +19,7 @@ SRC_URI_append_libc-uclibc = "${UCLIBC_PATCHES}"
 TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
 EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -DLUA_USE_LINUX -fPIC' MYLDFLAGS='${LDFLAGS}'"
 
-do_configure_prepend() {                                                                                                                                     
+do_configure_prepend() {
 	sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
 }
 
@@ -45,5 +44,5 @@ do_install () {
 }
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "d0870f2de55d59c1c8419f36e8fac150"
-SRC_URI[sha256sum] = "b038e225eaf2a5b57c9bcc35cd13aa8c6c8288ef493d52970c9545074098af3a"
+SRC_URI[md5sum] = "2e115fe26e435e33b0d5c022e4490567"
+SRC_URI[sha256sum] = "2640fc56a795f29d28ef15e13c34a47e223960b0240e8cb0a82d9b0738695333"
-- 
1.8.0.2



