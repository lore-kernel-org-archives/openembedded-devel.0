Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by mx.groups.io with SMTP id smtpd.web12.28583.1631535053143511253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Sep 2021 05:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=coTNR4TL;
 spf=pass (domain: gmx.de, ip: 212.227.15.18, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1631535051;
	bh=TaPDk+/JrNJjmaX0b0M7JQpWzPaKnTC3eAnuNNF6JI4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=coTNR4TLFEijHeYm7+GCaki/2TKEQ0YNyA1jn7n/0F+v1+MffKCus6BWGgYpfYA0k
	 1v16ERoJgAIUubk8CaGAOEqhYdHC/9KEvJIlBxn/nQkEFQZa7h28DdsRpP/3nhMxmM
	 ZHKY/uKLt5k9EcevXmaUxIQxYH1wfmuFE0E+tOfM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.57.223]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3siA-1n7vEh0njs-00zn25; Mon, 13
 Sep 2021 14:10:51 +0200
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan-Simon Moeller <dl9pf@gmx.de>
Subject: [meta-oe][PATCH][v2] Remove patch that produces a segfault in the ptest of lua
Date: Mon, 13 Sep 2021 14:10:37 +0200
Message-Id: <20210913121037.61581-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:MxrqinkZcKkkJ16IjzeMKElFZ28fXMi4ci3Hm2duNbnnKJGe+mI
 MS7PRCufYmVqJY5zRmj+cu1qIApftsGr7QJnr1+00Afln1dhn7BjSyR4Gt9ExUltCerFk2M
 DpcJzFYrNbygvwjCjxMsVAmo3GXx0YGkRXj6JG2rKDBWUgLvHGLesN/PjKhoPm/ebHbZyI0
 //unIzBXIvVCRBZb6aELw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vgi16reCaCE=:RJMkYHIri7E30i3dATzht8
 PfKGasR6ZZ3XDOTWRxqxtawsi+J+QQyr4Ai79ez9ltmPwjpkAdQc2pmtlPYbImjQtU4y6/2aE
 MrNQKJzYpvSW/177KmzxxgHvaVbSXdjbeLBphKaSyMjm5qLYZK0BTYMvwDF78YOYhFTxf5W1z
 m0i5Sa7ifzV6z5uZsV+mSPq26uPuTPoMZ2J45abhpXWqQri/kQGUoO1UHpTdFPFaAKfppG6qA
 dA69Jf9t7u2dlQL54HLwXlOchpf9YcEyLI5wgX+AI3tGEOObs8o4mK+c4qM+HmZcQUxCHU0hy
 /MhPUeX3+d9GuCl9CKeyfMFpzH42QF1ZXD0m0rwhuSMtVQ5pQDnztIl9s9Z+PU8IN+ZY4RZxF
 i700tM3mSHx/xwzWZYDResv72cu/tEaD3W4ifRKCe5EXG9V056NIQpElDFM9yb2uxxpHoauCe
 NikLUudzghdGrNIzk/d73QumKSSiLT0DRMkHrmf1SHFMIaviv9AOJBo35xBYDK/v/kNmbnznc
 2lfxGeMeQrX8WNr3dIOG4Adk9yWuaokEmA0eBHBYg34ez6KzCM/LM2WFTDlXtQ6A9J/ba1QZQ
 l2llYGGq0J0f3l/iL7iD60vFGcz3I8UtYsRY2xsM170Ob5zGmbigRIGxnChr3o4jgs4uwfYtx
 7wbCYQoW1nSix3/SalIn+6BY9ApoxIAxEa/JERT7JaBq+6OrMqcRmAfGjevC1X7+qAWRvQRXq
 rUPPecQNo13aiDP2qL51BimReKDWqO/v79M3S1ZAb1G9xYt9F1vw3Ywucj6Qhva1uw9QTf4sY
 +70550twDbXrhUY8hangKVKeZ3nLP1rDtt0Gd7tkirlewynxi37FMihxYPHUnMTe23Ik3gHz6
 SsdWwa3q3G6n5+3zD07RLvqfKeE+NAvOZAQ9wuMCi0toUMY7AQz1g9CFbWO2kQhRnnndLuhWg
 68MucH6FCbT35E/3+iWbXoaEa8zxfGJvdc2AqHKLw0j8c8RQYnbhjoJgpzii2d9aLLnr75Uur
 1m9wjvEWycqWdyg7IjFHHkAtPaXHrlwNO71CB1CNE0svA09cRp3dSNw8VkOZigyrYx2Th4J/v
 Q5c9n9+7ugSu/BXjzLEPx45JehoXHtsEUWy3GNWm2GtokIH3R0lf4Bk/k0mDmWvq0tGHsXBnP
 Et0Yo=
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon Moeller <dl9pf@gmx.de>

The patch file CVE-2020-15945.patch does cause a segfault in the lua ptest=
 (db.lua test).
According to upstream developers the patch is not correct and causes the s=
egfault.

Reproduce: build core-image-minimal with lua and ptest-pkgs on .
Run: ptest-runner lua

This test passes if the patch is removed.

Please also backport to dunfell as well.

Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
=2D--
 .../lua/lua/CVE-2020-15945.patch              | 167 ------------------
 meta-oe/recipes-devtools/lua/lua_5.3.6.bb     |   1 -
 2 files changed, 168 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2020-15945.patch

diff --git a/meta-oe/recipes-devtools/lua/lua/CVE-2020-15945.patch b/meta-=
oe/recipes-devtools/lua/lua/CVE-2020-15945.patch
deleted file mode 100644
index 89ce49148..000000000
=2D-- a/meta-oe/recipes-devtools/lua/lua/CVE-2020-15945.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From d8d344365945a534f700c82c5dd26f704f89fef3 Mon Sep 17 00:00:00 2001
-From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
-Date: Wed, 5 Aug 2020 16:59:58 +0800
-Subject: [PATCH] Fixed bug: invalid 'oldpc' when returning to a function
-
-The field 'L->oldpc' is not always updated when control returns to a
-function; an invalid value can seg. fault when computing 'changedline'.
-(One example is an error in a finalizer; control can return to
-'luaV_execute' without executing 'luaD_poscall'.) Instead of trying to
-fix all possible corner cases, it seems safer to be resilient to invalid
-values for 'oldpc'. Valid but wrong values at most cause an extra call
-to a line hook.
-
-CVE: CVE-2020-15945
-
-[Adjust the code to be applicable to the tree]
-
-Upstream-Status: Backport [https://github.com/lua/lua/commit/a2195644d898=
12e5b157ce7bac35543e06db05e3]
-
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
-Signed-off-by: Joe Slater <joe.slater@@windriver.com>
-
=2D---
- src/ldebug.c | 30 +++++++++++++++---------------
- src/ldebug.h |  4 ++++
- src/ldo.c    |  2 +-
- src/lstate.c |  1 +
- src/lstate.h |  2 +-
- 5 files changed, 22 insertions(+), 17 deletions(-)
-
-diff --git a/src/ldebug.c b/src/ldebug.c
-index 239affb..832b16c 100644
=2D--- a/src/ldebug.c
-+++ b/src/ldebug.c
-@@ -34,9 +34,8 @@
- #define noLuaClosure(f)		((f) =3D=3D NULL || (f)->c.tt =3D=3D LUA_TCCL)
-
-
=2D-/* Active Lua function (given call info) */
=2D-#define ci_func(ci)		(clLvalue((ci)->func))
=2D-
-+/* inverse of 'pcRel' */
-+#define invpcRel(pc, p)                ((p)->code + (pc) + 1)
-
- static const char *funcnamefromcode (lua_State *L, CallInfo *ci,
-                                     const char **name);
-@@ -71,20 +70,18 @@ static void swapextra (lua_State *L) {
-
- /*
- ** This function can be called asynchronously (e.g. during a signal).
=2D-** Fields 'oldpc', 'basehookcount', and 'hookcount' (set by
=2D-** 'resethookcount') are for debug only, and it is no problem if they
=2D-** get arbitrary values (causes at most one wrong hook call). 'hookmas=
k'
=2D-** is an atomic value. We assume that pointers are atomic too (e.g., g=
cc
=2D-** ensures that for all platforms where it runs). Moreover, 'hook' is
=2D-** always checked before being called (see 'luaD_hook').
-+** Fields 'basehookcount' and 'hookcount' (set by 'resethookcount')
-+** are for debug only, and it is no problem if they get arbitrary
-+** values (causes at most one wrong hook call). 'hookmask' is an atomic
-+** value. We assume that pointers are atomic too (e.g., gcc ensures that
-+** for all platforms where it runs). Moreover, 'hook' is always checked
-+** before being called (see 'luaD_hook').
- */
- LUA_API void lua_sethook (lua_State *L, lua_Hook func, int mask, int cou=
nt) {
-   if (func =3D=3D NULL || mask =3D=3D 0) {  /* turn off hooks? */
-     mask =3D 0;
-     func =3D NULL;
-   }
=2D-  if (isLua(L->ci))
=2D-    L->oldpc =3D L->ci->u.l.savedpc;
-   L->hook =3D func;
-   L->basehookcount =3D count;
-   resethookcount(L);
-@@ -665,7 +662,10 @@ l_noret luaG_runerror (lua_State *L, const char *fmt=
, ...) {
- void luaG_traceexec (lua_State *L) {
-   CallInfo *ci =3D L->ci;
-   lu_byte mask =3D L->hookmask;
-+  const Proto *p =3D ci_func(ci)->p;
-   int counthook =3D (--L->hookcount =3D=3D 0 && (mask & LUA_MASKCOUNT));
-+  /* 'L->oldpc' may be invalid; reset it in this case */
-+  int oldpc =3D (L->oldpc < p->sizecode) ? L->oldpc : 0;
-   if (counthook)
-     resethookcount(L);  /* reset count */
-   else if (!(mask & LUA_MASKLINE))
-@@ -677,15 +677,15 @@ void luaG_traceexec (lua_State *L) {
-   if (counthook)
-     luaD_hook(L, LUA_HOOKCOUNT, -1);  /* call count hook */
-   if (mask & LUA_MASKLINE) {
=2D-    Proto *p =3D ci_func(ci)->p;
-     int npc =3D pcRel(ci->u.l.savedpc, p);
-     int newline =3D getfuncline(p, npc);
-     if (npc =3D=3D 0 ||  /* call linehook when enter a new function, */
=2D-        ci->u.l.savedpc <=3D L->oldpc ||  /* when jump back (loop), or=
 when */
=2D-        newline !=3D getfuncline(p, pcRel(L->oldpc, p)))  /* enter a n=
ew line */
-+        ci->u.l.savedpc <=3D invpcRel(oldpc, p) ||  /* when jump back (l=
oop), or when */
-+        newline !=3D getfuncline(p, oldpc))  /* enter a new line */
-       luaD_hook(L, LUA_HOOKLINE, newline);  /* call line hook */
-+
-+    L->oldpc =3D npc;  /* 'pc' of last call to line hook */
-   }
=2D-  L->oldpc =3D ci->u.l.savedpc;
-   if (L->status =3D=3D LUA_YIELD) {  /* did hook yield? */
-     if (counthook)
-       L->hookcount =3D 1;  /* undo decrement to zero */
-diff --git a/src/ldebug.h b/src/ldebug.h
-index 0e31546..c224cc4 100644
=2D--- a/src/ldebug.h
-+++ b/src/ldebug.h
-@@ -13,6 +13,10 @@
-
- #define pcRel(pc, p)	(cast(int, (pc) - (p)->code) - 1)
-
-+/* Active Lua function (given call info) */
-+#define ci_func(ci)            (clLvalue((ci)->func))
-+
-+
- #define getfuncline(f,pc)	(((f)->lineinfo) ? (f)->lineinfo[pc] : -1)
-
- #define resethookcount(L)	(L->hookcount =3D L->basehookcount)
-diff --git a/src/ldo.c b/src/ldo.c
-index 90b695f..f66ac1a 100644
=2D--- a/src/ldo.c
-+++ b/src/ldo.c
-@@ -382,7 +382,7 @@ int luaD_poscall (lua_State *L, CallInfo *ci, StkId f=
irstResult, int nres) {
-       luaD_hook(L, LUA_HOOKRET, -1);
-       firstResult =3D restorestack(L, fr);
-     }
=2D-    L->oldpc =3D ci->previous->u.l.savedpc;  /* 'oldpc' for caller fun=
ction */
-+    L->oldpc =3D pcRel(ci->u.l.savedpc, ci_func(ci)->p);  /* 'oldpc' for=
 caller function */
-   }
-   res =3D ci->func;  /* res =3D=3D final position of 1st result */
-   L->ci =3D ci->previous;  /* back to caller */
-diff --git a/src/lstate.c b/src/lstate.c
-index 9194ac3..3573e36 100644
=2D--- a/src/lstate.c
-+++ b/src/lstate.c
-@@ -236,6 +236,7 @@ static void preinit_thread (lua_State *L, global_Stat=
e *g) {
-   L->nny =3D 1;
-   L->status =3D LUA_OK;
-   L->errfunc =3D 0;
-+  L->oldpc =3D 0;
- }
-
-
-diff --git a/src/lstate.h b/src/lstate.h
-index a469466..d75eadf 100644
=2D--- a/src/lstate.h
-+++ b/src/lstate.h
-@@ -164,7 +164,6 @@ struct lua_State {
-   StkId top;  /* first free slot in the stack */
-   global_State *l_G;
-   CallInfo *ci;  /* call info for current function */
=2D-  const Instruction *oldpc;  /* last pc traced */
-   StkId stack_last;  /* last free slot in the stack */
-   StkId stack;  /* stack base */
-   UpVal *openupval;  /* list of open upvalues in this stack */
-@@ -174,6 +173,7 @@ struct lua_State {
-   CallInfo base_ci;  /* CallInfo for first level (C calling Lua) */
-   volatile lua_Hook hook;
-   ptrdiff_t errfunc;  /* current error handling function (stack index) *=
/
-+  int oldpc;  /* last pc traced */
-   int stacksize;
-   int basehookcount;
-   int hookcount;
=2D--
-2.13.3
-
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-d=
evtools/lua/lua_5.3.6.bb
index f830e0925..af3054dcb 100644
=2D-- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=
=3Dtarballsrc \
            file://lua.pc.in \
            file://0001-Allow-building-lua-without-readline-on-Linux.patch=
 \
            file://CVE-2020-15888.patch \
-           file://CVE-2020-15945.patch \
            file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.p=
atch \
            "

=2D-
2.32.0

