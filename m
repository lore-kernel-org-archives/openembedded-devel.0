Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.21306.1610905607316650486
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pLwp/oLd;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id e9so3190785plh.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OSlpA/U6BkCcR0c7nAPEKXj+URV+WqSVi+ftgJqxevc=;
        b=pLwp/oLdsR6Bbgw1YChwBdmr4GJA6jrlzis5XbJByt3KzMzcJOBLjJ+bOP9MziVLrI
         /nUUrj1oL8uLbqclYPvrTFf3vFGLRNuP0msKGWYkcqhUpygyfoVfyctHK26WUqLbS62Y
         G4Qgz9rTc9JqDGBePkkYFJYPKkDe4RfGGg/WD38bN+E6hYvjd/K9ycmGb+q9xjVPcGi8
         rt/SIG8+LYG9n/+iSDTmP3D6fk7BKpjUlge+eRlf6C4RYmxpfy34PdMB+fFYMjZAE4kf
         LHDB7YK+i/pK1iSwK3F0Hvp3a3o2wtA0ovRPoerSWP9kgv9P3wpzbERTeZlix2eWDPnA
         DYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OSlpA/U6BkCcR0c7nAPEKXj+URV+WqSVi+ftgJqxevc=;
        b=a9vddyHdHZ+wTtMgA+zj20Xbtdw+Twvrj2ABZyL6wkrV132/ZzkmpCo8XPsWN8Yagb
         hgFfujAbcy61e4gcwTbPyb3F5rueXoAtL1nGB6VEpIoncf+VfarDAEgtPJztJzKuuwn5
         TQIG7JgH7tzOP8o0BIGobLBQ2L6GjBBS07G2hHR3ale8hVJj5kp4dm3hfMTzXGCRJekS
         OI4M21h10qWbs2J3yKkBB2d5LGJpk8EiopalHMVPEtt5/8hd/H+Or4UlbUwqUVfeEMzZ
         rM95oyKiWHI5CudUe0ilxwnjMW8Xeg0s/bJ72TebmsRdS4HdrKGzPKP15OlWasOu9Hnt
         7zpQ==
X-Gm-Message-State: AOAM532gqMydIjiPBmfNR+qzQpFkjLEWEQyOZg0KRvZasB7LmNd74Bzv
	6wldwCojWcbPXqBMlvWwEOqW7nATM3kIZA==
X-Google-Smtp-Source: ABdhPJwBNgbgf4V47EXFnYiuUzKXZpwZsk9vndSVz9dm+t2AR+D8VvDKcfR/EvGC1gJba7iUVKFS/w==
X-Received: by 2002:a17:90b:517:: with SMTP id r23mr3848765pjz.188.1610905606613;
        Sun, 17 Jan 2021 09:46:46 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:46 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 15/28] lua: fix CVE-2020-15945
Date: Sun, 17 Jan 2021 09:46:13 -0800
Message-Id: <61922b26e0a7a36a9367590a82c3871feb855fc8.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Wenlin Kang <wenlin.kang@windriver.com>

Source: openembedded.org
MR: 104897
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded gatesgarth
ChangeID: 6c43941d116bbb9f0d62ca5376da24ae03eb9eab
Description:

Fixes CVE-2020-15945

Backport with modifications to apply successfully.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../lua/lua/CVE-2020-15945.patch              | 167 ++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua_5.3.5.bb     |   1 +
 2 files changed, 168 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2020-15945.patch

diff --git a/meta-oe/recipes-devtools/lua/lua/CVE-2020-15945.patch b/meta-oe/recipes-devtools/lua/lua/CVE-2020-15945.patch
new file mode 100644
index 0000000000..89ce491487
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua/CVE-2020-15945.patch
@@ -0,0 +1,167 @@
+From d8d344365945a534f700c82c5dd26f704f89fef3 Mon Sep 17 00:00:00 2001
+From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
+Date: Wed, 5 Aug 2020 16:59:58 +0800
+Subject: [PATCH] Fixed bug: invalid 'oldpc' when returning to a function
+
+The field 'L->oldpc' is not always updated when control returns to a
+function; an invalid value can seg. fault when computing 'changedline'.
+(One example is an error in a finalizer; control can return to
+'luaV_execute' without executing 'luaD_poscall'.) Instead of trying to
+fix all possible corner cases, it seems safer to be resilient to invalid
+values for 'oldpc'. Valid but wrong values at most cause an extra call
+to a line hook.
+
+CVE: CVE-2020-15945
+
+[Adjust the code to be applicable to the tree]
+
+Upstream-Status: Backport [https://github.com/lua/lua/commit/a2195644d89812e5b157ce7bac35543e06db05e3]
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+Signed-off-by: Joe Slater <joe.slater@@windriver.com>
+
+---
+ src/ldebug.c | 30 +++++++++++++++---------------
+ src/ldebug.h |  4 ++++
+ src/ldo.c    |  2 +-
+ src/lstate.c |  1 +
+ src/lstate.h |  2 +-
+ 5 files changed, 22 insertions(+), 17 deletions(-)
+
+diff --git a/src/ldebug.c b/src/ldebug.c
+index 239affb..832b16c 100644
+--- a/src/ldebug.c
++++ b/src/ldebug.c
+@@ -34,9 +34,8 @@
+ #define noLuaClosure(f)		((f) == NULL || (f)->c.tt == LUA_TCCL)
+ 
+ 
+-/* Active Lua function (given call info) */
+-#define ci_func(ci)		(clLvalue((ci)->func))
+-
++/* inverse of 'pcRel' */
++#define invpcRel(pc, p)                ((p)->code + (pc) + 1)
+ 
+ static const char *funcnamefromcode (lua_State *L, CallInfo *ci,
+                                     const char **name);
+@@ -71,20 +70,18 @@ static void swapextra (lua_State *L) {
+ 
+ /*
+ ** This function can be called asynchronously (e.g. during a signal).
+-** Fields 'oldpc', 'basehookcount', and 'hookcount' (set by
+-** 'resethookcount') are for debug only, and it is no problem if they
+-** get arbitrary values (causes at most one wrong hook call). 'hookmask'
+-** is an atomic value. We assume that pointers are atomic too (e.g., gcc
+-** ensures that for all platforms where it runs). Moreover, 'hook' is
+-** always checked before being called (see 'luaD_hook').
++** Fields 'basehookcount' and 'hookcount' (set by 'resethookcount')
++** are for debug only, and it is no problem if they get arbitrary
++** values (causes at most one wrong hook call). 'hookmask' is an atomic
++** value. We assume that pointers are atomic too (e.g., gcc ensures that
++** for all platforms where it runs). Moreover, 'hook' is always checked
++** before being called (see 'luaD_hook').
+ */
+ LUA_API void lua_sethook (lua_State *L, lua_Hook func, int mask, int count) {
+   if (func == NULL || mask == 0) {  /* turn off hooks? */
+     mask = 0;
+     func = NULL;
+   }
+-  if (isLua(L->ci))
+-    L->oldpc = L->ci->u.l.savedpc;
+   L->hook = func;
+   L->basehookcount = count;
+   resethookcount(L);
+@@ -665,7 +662,10 @@ l_noret luaG_runerror (lua_State *L, const char *fmt, ...) {
+ void luaG_traceexec (lua_State *L) {
+   CallInfo *ci = L->ci;
+   lu_byte mask = L->hookmask;
++  const Proto *p = ci_func(ci)->p;
+   int counthook = (--L->hookcount == 0 && (mask & LUA_MASKCOUNT));
++  /* 'L->oldpc' may be invalid; reset it in this case */
++  int oldpc = (L->oldpc < p->sizecode) ? L->oldpc : 0;
+   if (counthook)
+     resethookcount(L);  /* reset count */
+   else if (!(mask & LUA_MASKLINE))
+@@ -677,15 +677,15 @@ void luaG_traceexec (lua_State *L) {
+   if (counthook)
+     luaD_hook(L, LUA_HOOKCOUNT, -1);  /* call count hook */
+   if (mask & LUA_MASKLINE) {
+-    Proto *p = ci_func(ci)->p;
+     int npc = pcRel(ci->u.l.savedpc, p);
+     int newline = getfuncline(p, npc);
+     if (npc == 0 ||  /* call linehook when enter a new function, */
+-        ci->u.l.savedpc <= L->oldpc ||  /* when jump back (loop), or when */
+-        newline != getfuncline(p, pcRel(L->oldpc, p)))  /* enter a new line */
++        ci->u.l.savedpc <= invpcRel(oldpc, p) ||  /* when jump back (loop), or when */
++        newline != getfuncline(p, oldpc))  /* enter a new line */
+       luaD_hook(L, LUA_HOOKLINE, newline);  /* call line hook */
++
++    L->oldpc = npc;  /* 'pc' of last call to line hook */
+   }
+-  L->oldpc = ci->u.l.savedpc;
+   if (L->status == LUA_YIELD) {  /* did hook yield? */
+     if (counthook)
+       L->hookcount = 1;  /* undo decrement to zero */
+diff --git a/src/ldebug.h b/src/ldebug.h
+index 0e31546..c224cc4 100644
+--- a/src/ldebug.h
++++ b/src/ldebug.h
+@@ -13,6 +13,10 @@
+ 
+ #define pcRel(pc, p)	(cast(int, (pc) - (p)->code) - 1)
+ 
++/* Active Lua function (given call info) */
++#define ci_func(ci)            (clLvalue((ci)->func))
++
++
+ #define getfuncline(f,pc)	(((f)->lineinfo) ? (f)->lineinfo[pc] : -1)
+ 
+ #define resethookcount(L)	(L->hookcount = L->basehookcount)
+diff --git a/src/ldo.c b/src/ldo.c
+index 90b695f..f66ac1a 100644
+--- a/src/ldo.c
++++ b/src/ldo.c
+@@ -382,7 +382,7 @@ int luaD_poscall (lua_State *L, CallInfo *ci, StkId firstResult, int nres) {
+       luaD_hook(L, LUA_HOOKRET, -1);
+       firstResult = restorestack(L, fr);
+     }
+-    L->oldpc = ci->previous->u.l.savedpc;  /* 'oldpc' for caller function */
++    L->oldpc = pcRel(ci->u.l.savedpc, ci_func(ci)->p);  /* 'oldpc' for caller function */
+   }
+   res = ci->func;  /* res == final position of 1st result */
+   L->ci = ci->previous;  /* back to caller */
+diff --git a/src/lstate.c b/src/lstate.c
+index 9194ac3..3573e36 100644
+--- a/src/lstate.c
++++ b/src/lstate.c
+@@ -236,6 +236,7 @@ static void preinit_thread (lua_State *L, global_State *g) {
+   L->nny = 1;
+   L->status = LUA_OK;
+   L->errfunc = 0;
++  L->oldpc = 0;
+ }
+ 
+ 
+diff --git a/src/lstate.h b/src/lstate.h
+index a469466..d75eadf 100644
+--- a/src/lstate.h
++++ b/src/lstate.h
+@@ -164,7 +164,6 @@ struct lua_State {
+   StkId top;  /* first free slot in the stack */
+   global_State *l_G;
+   CallInfo *ci;  /* call info for current function */
+-  const Instruction *oldpc;  /* last pc traced */
+   StkId stack_last;  /* last free slot in the stack */
+   StkId stack;  /* stack base */
+   UpVal *openupval;  /* list of open upvalues in this stack */
+@@ -174,6 +173,7 @@ struct lua_State {
+   CallInfo base_ci;  /* CallInfo for first level (C calling Lua) */
+   volatile lua_Hook hook;
+   ptrdiff_t errfunc;  /* current error handling function (stack index) */
++  int oldpc;  /* last pc traced */
+   int stacksize;
+   int basehookcount;
+   int hookcount;
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
index d3461b06de..4f89579c78 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
            file://0001-Allow-building-lua-without-readline-on-Linux.patch \
            file://CVE-2020-15888.patch \
+           file://CVE-2020-15945.patch \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
-- 
2.17.1

