Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TdoP7-0003y8-EM
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 21:38:45 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so10263303lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 12:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=GknU/p5eT/5UGk15NDVo51ZT0EmZSmkPQluWWZrY3A8=;
	b=mj6u8PrdeNDsNBBbpwJ1v7jAyDLaLoScWObpPFVYP5ejn6K5WZlV3Qtoh+geNux0nW
	rHtcngMfGTEsfhjQqV99Z9bdObk0rXbCqQ1ISP2ixmf8lSd8o0Clk+GwXr0MDc26T3AI
	FHfZsZ4U11tfey+EcG4yvwKkVi+bCWY40jR6+VghbkNqqOMGSze6c81zfQWNoGOWZopM
	UwWC8DKIYwYY3hhyYkME4wu71pVO64aku5Zx7+KkpkwgF+RcwdaVy4rjyK5h5Yg9uFTA
	2Vilwh4Xzjwc8P2CaN5/6glh5pIe/YgSgJIWCO2kMVXWQPBBXr/Tf42jPEcNo9U63IWd
	5yNA==
Received: by 10.152.108.37 with SMTP id hh5mr19447618lab.52.1354134270580;
	Wed, 28 Nov 2012 12:24:30 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id b7sm153632lbk.17.2012.11.28.12.24.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 12:24:29 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TdoBH-0005CU-Qa; Wed, 28 Nov 2012 22:24:27 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Nov 2012 22:24:20 +0200
Message-Id: <1354134260-19880-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] lua: update to upstream version 5.1.5
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
X-List-Received-Date: Wed, 28 Nov 2012 20:38:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

COPYRIǴHT: (C) years now up to 2012

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../lua/lua5.1/bitwise_operators.patch             |  143 +++++++++-----------
 meta-oe/recipes-devtools/lua/lua5.1/lua5.1.pc      |    2 +-
 .../lua/{lua5.1_5.1.4.bb => lua5.1_5.1.5.bb}       |    8 +-
 3 files changed, 69 insertions(+), 84 deletions(-)
 rename meta-oe/recipes-devtools/lua/{lua5.1_5.1.4.bb => lua5.1_5.1.5.bb} (84%)

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
similarity index 84%
rename from meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
rename to meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
index eca7755..60f3edd 100644
--- a/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
+++ b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=90c3badc6055c699194c4a7cea583296"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=59bdd99bb82238f238cf5c65c21604fd"
 HOMEPAGE = "http://www.lua.org/"
 
 DEPENDS += "readline"
-PR = "r10"
+PR = "r0"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://bitwise_operators.patch \
            file://lua5.1.pc \
@@ -41,5 +41,5 @@ do_install () {
 }
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "d0870f2de55d59c1c8419f36e8fac150"
-SRC_URI[sha256sum] = "b038e225eaf2a5b57c9bcc35cd13aa8c6c8288ef493d52970c9545074098af3a"
+SRC_URI[md5sum] = "2e115fe26e435e33b0d5c022e4490567"
+SRC_URI[sha256sum] = "2640fc56a795f29d28ef15e13c34a47e223960b0240e8cb0a82d9b0738695333"
-- 
1.7.10.4



