Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2ECC433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:48 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.2732.1633977707590874772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mMvdbQyV;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id u18so59282870wrg.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a2ioVtqDTYhzqASC/fPVaFzGedSmgS1Sb78FlEpB/Eo=;
        b=mMvdbQyVbr/qTwX6ZZtC6bIgVWdNLKwuUGcCIZP2IsSgiLJH4t2BCo+S8KatDsQuPc
         5ZZvhHbRRXoDFzZA7UCxovCFPF6nJrG5IFuDPbZahfwF1HZbrCTKY5EgYVrgy7i/H2C7
         tCW303rqhdYqbgWGIbkZIvN5Tj8sxdpnP/62E/IU18qh4+Mo6goTVWn0OhUwjxLygTHU
         k3tHhR4BKE5mKB0lQGDJ+JXLgohh7B+TLMxrHB3a4jyvPYt0KFuqE4+1vfpuVEcxtTfh
         j4wdQyi2MS6oZQG35eKT086JL7pI/mzouSLpRfyteoD/kMLiihF+l6ZFD6ikkIHaqlpu
         V8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a2ioVtqDTYhzqASC/fPVaFzGedSmgS1Sb78FlEpB/Eo=;
        b=OznPIOPVIJLbqdxW25WgMZf1sh48agwqe2EGLltYZOSqfKhfKnrpYV5eDOGp4M8aJL
         bH/1Q0cYgUQfGprkdwR2IO31GMdRTep+OG6eAP18UktvAR5r0lL1eT3JegY7ryr3/7Qc
         fhDb4/ni/K8ZzAa0CDf55kVW7hC65MggfqmR9RjS1r63skfVv27QV4/CbK3LdFDXrCmK
         89PMHk3du2UbafZvJK76Gq7Xcdsim44ROHKr2c/a/AbaScRkjLByiSWIXU22NolSKNoL
         0TropSrOpb1E8tMzS3SdrN4rz2ZO0cD9rEfAdXLfCRfgaGkkhxxuWdF+bqPd7PHxsrlu
         GstA==
X-Gm-Message-State: AOAM531X42aLQxFvPcj6+xiIFWsQjswA6j7808qAdMZNHJqjclNj0iqE
	U6CS6tXkTjF/Y9/qSqfbZiFOIxCoyFsljA==
X-Google-Smtp-Source: 
 ABdhPJxPH+TM/jPTYZPMRNM+O1SPh4jJpj/Ba8tE08IhD5f3qxv7wJlxAPsiXAYC89ql6vI2NtRexg==
X-Received: by 2002:a1c:2c2:: with SMTP id 185mr682570wmc.85.1633977705712;
        Mon, 11 Oct 2021 11:41:45 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Wenlin Kang <wenlin.kang@windriver.com>,
	Joe Slater <joe.slater@windriver.com>
Subject: [PATCH 01/24] lua: remove recipe as it is now in oe-core
Date: Mon, 11 Oct 2021 20:41:17 +0200
Message-Id: <20211011184140.653609-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93215

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ilding-lua-without-readline-on-Linux.patch | 59 ------------
 ...rriers-cannot-be-active-during-sweep.patch | 90 -------------------
 .../lua/lua/CVE-2020-15888.patch              | 45 ----------
 meta-oe/recipes-devtools/lua/lua/lua.pc.in    | 10 ---
 meta-oe/recipes-devtools/lua/lua/run-ptest    | 19 ----
 meta-oe/recipes-devtools/lua/lua_5.3.6.bb     | 66 --------------
 6 files changed, 289 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
 delete mode 100644 meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
 delete mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch
 delete mode 100644 meta-oe/recipes-devtools/lua/lua/lua.pc.in
 delete mode 100644 meta-oe/recipes-devtools/lua/lua/run-ptest
 delete mode 100644 meta-oe/recipes-devtools/lua/lua_5.3.6.bb

diff --git a/meta-oe/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch b/meta-oe/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
deleted file mode 100644
index e76790086..000000000
--- a/meta-oe/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 601ef636fc4dfb2af3e7fda88d8ea1c1d92affe4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 2 Oct 2019 17:54:15 +0200
-Subject: [PATCH] Allow building lua without readline on Linux
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile      | 2 +-
- src/Makefile  | 3 +++
- src/luaconf.h | 5 +++++
- 3 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 119110d..9f6df45 100644
---- a/Makefile
-+++ b/Makefile
-@@ -36,7 +36,7 @@ RM= rm -f
- # == END OF USER SETTINGS -- NO NEED TO CHANGE ANYTHING BELOW THIS LINE =======
- 
- # Convenience platforms targets.
--PLATS= aix bsd c89 freebsd generic linux macosx mingw posix solaris
-+PLATS= aix bsd c89 freebsd generic linux linux-no-readline macosx mingw posix solaris
- 
- # What to install.
- TO_BIN= lua luac
-diff --git a/src/Makefile b/src/Makefile
-index 64c78f7..5c0428a 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -109,6 +109,9 @@ generic: $(ALL)
- linux:
- 	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX" SYSLIBS="-Wl,-E -ldl -lreadline"
- 
-+linux-no-readline:
-+	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX_NO_READLINE" SYSLIBS="-Wl,-E -ldl"
-+
- macosx:
- 	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_MACOSX" SYSLIBS="-lreadline"
- 
-diff --git a/src/luaconf.h b/src/luaconf.h
-index 9eeeea6..d71ca25 100644
---- a/src/luaconf.h
-+++ b/src/luaconf.h
-@@ -64,6 +64,11 @@
- #define LUA_USE_READLINE	/* needs some extra libraries */
- #endif
- 
-+#if defined(LUA_USE_LINUX_NO_READLINE)
-+#define LUA_USE_POSIX
-+#define LUA_USE_DLOPEN		/* needs an extra library: -ldl */
-+#endif
-+
- 
- #if defined(LUA_USE_MACOSX)
- #define LUA_USE_POSIX
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch b/meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
deleted file mode 100644
index a302874d7..000000000
--- a/meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 1e6df25ac28dcd89f0324177bb55019422404b44 Mon Sep 17 00:00:00 2001
-From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
-Date: Thu, 3 Sep 2020 15:32:17 +0800
-Subject: [PATCH] Fixed bug: barriers cannot be active during sweep
-
-Barriers cannot be active during sweep, even in generational mode.
-(Although gen. mode is not incremental, it can hit a barrier when
-deleting a thread and closing its upvalues.)  The colors of objects are
-being changed during sweep and, therefore, cannot be trusted.
-
-Upstream-Status: Backport [https://github.com/lua/lua/commit/a6da1472c0c5e05ff249325f979531ad51533110]
-CVE: CVE-2020-24371
-
-[Adjust code KGC_INC -> KGC_NORMAL, refer 69371c4b84becac09c445aae01d005b49658ef82]
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
----
- src/lgc.c | 33 ++++++++++++++++++++++++---------
- 1 file changed, 24 insertions(+), 9 deletions(-)
-
-diff --git a/src/lgc.c b/src/lgc.c
-index 973c269..7af23d5 100644
---- a/src/lgc.c
-+++ b/src/lgc.c
-@@ -142,10 +142,17 @@ static int iscleared (global_State *g, const TValue *o) {
- 
- 
- /*
--** barrier that moves collector forward, that is, mark the white object
--** being pointed by a black object. (If in sweep phase, clear the black
--** object to white [sweep it] to avoid other barrier calls for this
--** same object.)
-+** Barrier that moves collector forward, that is, marks the white object
-+** 'v' being pointed by the black object 'o'.  In the generational
-+** mode, 'v' must also become old, if 'o' is old; however, it cannot
-+** be changed directly to OLD, because it may still point to non-old
-+** objects. So, it is marked as OLD0. In the next cycle it will become
-+** OLD1, and in the next it will finally become OLD (regular old). By
-+** then, any object it points to will also be old.  If called in the
-+** incremental sweep phase, it clears the black object to white (sweep
-+** it) to avoid other barrier calls for this same object. (That cannot
-+** be done is generational mode, as its sweep does not distinguish
-+** whites from deads.)
- */
- void luaC_barrier_ (lua_State *L, GCObject *o, GCObject *v) {
-   global_State *g = G(L);
-@@ -154,7 +161,8 @@ void luaC_barrier_ (lua_State *L, GCObject *o, GCObject *v) {
-     reallymarkobject(g, v);  /* restore invariant */
-   else {  /* sweep phase */
-     lua_assert(issweepphase(g));
--    makewhite(g, o);  /* mark main obj. as white to avoid other barriers */
-+    if (g->gckind == KGC_NORMAL)  /* incremental mode? */
-+      makewhite(g, o);  /* mark 'o' as white to avoid other barriers */
-   }
- }
- 
-@@ -299,10 +307,15 @@ static void markbeingfnz (global_State *g) {
- 
- 
- /*
--** Mark all values stored in marked open upvalues from non-marked threads.
--** (Values from marked threads were already marked when traversing the
--** thread.) Remove from the list threads that no longer have upvalues and
--** not-marked threads.
-+** For each non-marked thread, simulates a barrier between each open
-+** upvalue and its value. (If the thread is collected, the value will be
-+** assigned to the upvalue, but then it can be too late for the barrier
-+** to act. The "barrier" does not need to check colors: A non-marked
-+** thread must be young; upvalues cannot be older than their threads; so
-+** any visited upvalue must be young too.) Also removes the thread from
-+** the list, as it was already visited. Removes also threads with no
-+** upvalues, as they have nothing to be checked. (If the thread gets an
-+** upvalue later, it will be linked in the list again.)
- */
- static void remarkupvals (global_State *g) {
-   lua_State *thread;
-@@ -313,9 +326,11 @@ static void remarkupvals (global_State *g) {
-       p = &thread->twups;  /* keep marked thread with upvalues in the list */
-     else {  /* thread is not marked or without upvalues */
-       UpVal *uv;
-+      lua_assert(!isold(thread) || thread->openupval == NULL);
-       *p = thread->twups;  /* remove thread from the list */
-       thread->twups = thread;  /* mark that it is out of list */
-       for (uv = thread->openupval; uv != NULL; uv = uv->u.open.next) {
-+        lua_assert(getage(uv) <= getage(thread));
-         if (uv->u.open.touched) {
-           markvalue(g, uv->v);  /* remark upvalue's value */
-           uv->u.open.touched = 0;
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch b/meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch
deleted file mode 100644
index 60a412597..000000000
--- a/meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 6298903e35217ab69c279056f925fb72900ce0b7 Mon Sep 17 00:00:00 2001
-From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
-Date: Mon, 6 Jul 2020 12:11:54 -0300
-Subject: [PATCH] Keep minimum size when shrinking a stack
-
-When shrinking a stack (during GC), do not make it smaller than the
-initial stack size.
----
- ldo.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-==== end of original header ====
-
-CVE: CVE-2020-15888
-
-Upstream-Status: backport [https://github.com/lua/lua.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-====
-diff --git a/ldo.c b/ldo.c
-index c563b1d9..a89ac010 100644
---- a/src/ldo.c
-+++ b/src/ldo.c
-@@ -220,7 +220,7 @@ static int stackinuse (lua_State *L) {
- 
- void luaD_shrinkstack (lua_State *L) {
-   int inuse = stackinuse(L);
--  int goodsize = inuse + (inuse / 8) + 2*EXTRA_STACK;
-+  int goodsize = inuse + BASIC_STACK_SIZE;
-   if (goodsize > LUAI_MAXSTACK)
-     goodsize = LUAI_MAXSTACK;  /* respect stack limit */
-   if (L->stacksize > LUAI_MAXSTACK)  /* had been handling stack overflow? */
-@@ -229,8 +229,7 @@ void luaD_shrinkstack (lua_State *L) {
-     luaE_shrinkCI(L);  /* shrink list */
-   /* if thread is currently not handling a stack overflow and its
-      good size is smaller than current size, shrink its stack */
--  if (inuse <= (LUAI_MAXSTACK - EXTRA_STACK) &&
--      goodsize < L->stacksize)
-+  if (inuse <= (LUAI_MAXSTACK - EXTRA_STACK) && goodsize < L->stacksize)
-     luaD_reallocstack(L, goodsize);
-   else  /* don't change stack */
-     condmovestack(L,{},{});  /* (change only for debugging) */
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/lua/lua/lua.pc.in b/meta-oe/recipes-devtools/lua/lua/lua.pc.in
deleted file mode 100644
index c27e86e85..000000000
--- a/meta-oe/recipes-devtools/lua/lua/lua.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-libdir=${prefix}/lib
-includedir=${prefix}/include
-
-Name: Lua
-Description: Lua language engine
-Version: @VERSION@
-Requires:
-Libs: -L${libdir} -llua -lm -ldl
-Cflags: -I${includedir}
diff --git a/meta-oe/recipes-devtools/lua/lua/run-ptest b/meta-oe/recipes-devtools/lua/lua/run-ptest
deleted file mode 100644
index 8e085e1af..000000000
--- a/meta-oe/recipes-devtools/lua/lua/run-ptest
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/sh
-
-cd test
-lua -e"_U=true" all.lua > lua-test.tmp
-
-echo "--- test output ---"
-cat lua-test.tmp
-echo ""
-echo ""
-echo "--- ptest result ---"
-
-grep "final OK \!\!\!" lua-test.tmp > /dev/null
-if [ $? -eq 0 ]; then
-   echo "PASS: lua"
-else
-   echo "FAIL: lua"
-fi
-
-rm -f lua-test.tmp
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
deleted file mode 100644
index af3054dcb..000000000
--- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-DESCRIPTION = "Lua is a powerful light-weight programming language designed \
-for extending applications."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=f43d8ee6bc4df18ef8b276439cc4a153"
-HOMEPAGE = "http://www.lua.org/"
-
-SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
-           file://lua.pc.in \
-           file://0001-Allow-building-lua-without-readline-on-Linux.patch \
-           file://CVE-2020-15888.patch \
-           file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch \
-           "
-
-# if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
-PV_testsuites = "5.3.4"
-
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
-           'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest \
-            file://run-ptest \
-           ', '', d)}"
-
-SRC_URI[tarballsrc.md5sum] = "83f23dbd5230140a3770d5f54076948d"
-SRC_URI[tarballsrc.sha256sum] = "fc5fd69bb8736323f026672b1b7235da613d7177e72558893a0bdcd320466d60"
-SRC_URI[tarballtest.md5sum] = "b14fe3748c1cb2d74e3acd1943629ba3"
-SRC_URI[tarballtest.sha256sum] = "b80771238271c72565e5a1183292ef31bd7166414cd0d43a8eb79845fa7f599f"
-
-inherit pkgconfig binconfig ptest
-
-PACKAGECONFIG ??= "readline"
-PACKAGECONFIG[readline] = ",,readline"
-
-TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
-EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}'"
-
-do_configure:prepend() {
-    sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
-    sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
-}
-
-do_compile () {
-    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'readline', 'linux', 'linux-no-readline', d)}
-}
-
-do_install () {
-    oe_runmake \
-        'INSTALL_TOP=${D}${prefix}' \
-        'INSTALL_BIN=${D}${bindir}' \
-        'INSTALL_INC=${D}${includedir}/' \
-        'INSTALL_MAN=${D}${mandir}/man1' \
-        'INSTALL_SHARE=${D}${datadir}/lua' \
-        'INSTALL_LIB=${D}${libdir}' \
-        'INSTALL_CMOD=${D}${libdir}/lua/5.3' \
-        install
-    install -d ${D}${libdir}/pkgconfig
-
-    sed -e s/@VERSION@/${PV}/ ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
-    install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
-    rmdir ${D}${datadir}/lua/5.3
-    rmdir ${D}${datadir}/lua
-}
-
-do_install_ptest () {
-        cp -R --no-dereference --preserve=mode,links -v ${WORKDIR}/lua-${PV_testsuites}-tests ${D}${PTEST_PATH}/test
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


