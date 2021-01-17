Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.21188.1610905608728140333
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aK/iIV8q;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id c79so8828627pfc.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LXwIK1ZeTnVJbTb/+32yCbMJbE0eXitXUeFnNzjOPdw=;
        b=aK/iIV8qDaLq2EdVd/T+HKE41mW2EyR6q1yQJuQ6zqh2GBX0Q6s2+rMI/iJb1tQO8g
         84/F6CecE/kAPOCTeSP8jOJTgytQN/FDrGjK0TutJM3QtNj2fM5kKui7puQYd8fiUoxA
         GqVb8nN1vCh/Xuns8p4vcn+NNzX6W8mKlhU77nqkumVGCSUYZVpUcXx1O2+gtSFlah+F
         kvBfWyQ/Dh7fJL9k3wnF/N0OQz/Un5fibxvbIooZsCY9I4gusii/MDbOSUPAA198GBWE
         iRY9ZfpKX2GeAkyVmw2m3MknW5/XXqSzayx5q1nrfCT+8OqpmZVV4i7R+palFyl2alBb
         xXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LXwIK1ZeTnVJbTb/+32yCbMJbE0eXitXUeFnNzjOPdw=;
        b=ZTy59NYPZBmtOwqrEBkkmteICB4h4WGfRWp3jYPFMT40XbiuIvout6a5lVnop2OwiL
         7qd+8cF+dsGEJ0wecMPbmV0YZ6b0wcCoEcewGK83iDgxeuEagdj2zryyNWsvp7rtx73o
         u29cVtzbxvRsFP1zl8TyMVSseKQfX/2htV2ADnPaKbAq9ANwgQEYAArg07I5gAaUKzLp
         0ObPT+keztIuefSQRTuc1CzspO/kj8AgWF4dk2Q0zl0p4VPRPp7x9ZML4lXkmsO6hSTD
         /f0JufnCWhC2I7175wa03HXmS8009J7fo9Oa3xfsyzyXBp1ACocQooVdFpdBRPZ4x8tq
         r9FA==
X-Gm-Message-State: AOAM532Gf23ajjOVkGNQE8fzDVCvqFPFd6D9/sDHI5KD/m2L+7ysqGqJ
	coYK+FFGQUgvSf6YveGXXrgxqR9jZTG5KQ==
X-Google-Smtp-Source: ABdhPJwWF0a17pVAZVvnaUPDtMojrSywhgakX50tmeGKnGOPU7rZyF1kdOmEEJQEXHcsTmQ+P6URAQ==
X-Received: by 2002:a63:3049:: with SMTP id w70mr22307893pgw.224.1610905608020;
        Sun, 17 Jan 2021 09:46:48 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:47 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 16/28] lua: fix CVE-2020-24371
Date: Sun, 17 Jan 2021 09:46:14 -0800
Message-Id: <e43ecf32978226883271296c97fcbfa2fc1542d0.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Wenlin Kang <wenlin.kang@windriver.com>

Source: openembedded.org
MR: 105165
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded gatesgarth
ChangeID: 747161877824daae061bc4fb458f55ab033f62f4
Description:

Fix CVE-2020-24371

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...rriers-cannot-be-active-during-sweep.patch | 90 +++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua_5.3.5.bb     |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch

diff --git a/meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch b/meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
new file mode 100644
index 0000000000..a302874d76
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
@@ -0,0 +1,90 @@
+From 1e6df25ac28dcd89f0324177bb55019422404b44 Mon Sep 17 00:00:00 2001
+From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
+Date: Thu, 3 Sep 2020 15:32:17 +0800
+Subject: [PATCH] Fixed bug: barriers cannot be active during sweep
+
+Barriers cannot be active during sweep, even in generational mode.
+(Although gen. mode is not incremental, it can hit a barrier when
+deleting a thread and closing its upvalues.)  The colors of objects are
+being changed during sweep and, therefore, cannot be trusted.
+
+Upstream-Status: Backport [https://github.com/lua/lua/commit/a6da1472c0c5e05ff249325f979531ad51533110]
+CVE: CVE-2020-24371
+
+[Adjust code KGC_INC -> KGC_NORMAL, refer 69371c4b84becac09c445aae01d005b49658ef82]
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ src/lgc.c | 33 ++++++++++++++++++++++++---------
+ 1 file changed, 24 insertions(+), 9 deletions(-)
+
+diff --git a/src/lgc.c b/src/lgc.c
+index 973c269..7af23d5 100644
+--- a/src/lgc.c
++++ b/src/lgc.c
+@@ -142,10 +142,17 @@ static int iscleared (global_State *g, const TValue *o) {
+ 
+ 
+ /*
+-** barrier that moves collector forward, that is, mark the white object
+-** being pointed by a black object. (If in sweep phase, clear the black
+-** object to white [sweep it] to avoid other barrier calls for this
+-** same object.)
++** Barrier that moves collector forward, that is, marks the white object
++** 'v' being pointed by the black object 'o'.  In the generational
++** mode, 'v' must also become old, if 'o' is old; however, it cannot
++** be changed directly to OLD, because it may still point to non-old
++** objects. So, it is marked as OLD0. In the next cycle it will become
++** OLD1, and in the next it will finally become OLD (regular old). By
++** then, any object it points to will also be old.  If called in the
++** incremental sweep phase, it clears the black object to white (sweep
++** it) to avoid other barrier calls for this same object. (That cannot
++** be done is generational mode, as its sweep does not distinguish
++** whites from deads.)
+ */
+ void luaC_barrier_ (lua_State *L, GCObject *o, GCObject *v) {
+   global_State *g = G(L);
+@@ -154,7 +161,8 @@ void luaC_barrier_ (lua_State *L, GCObject *o, GCObject *v) {
+     reallymarkobject(g, v);  /* restore invariant */
+   else {  /* sweep phase */
+     lua_assert(issweepphase(g));
+-    makewhite(g, o);  /* mark main obj. as white to avoid other barriers */
++    if (g->gckind == KGC_NORMAL)  /* incremental mode? */
++      makewhite(g, o);  /* mark 'o' as white to avoid other barriers */
+   }
+ }
+ 
+@@ -299,10 +307,15 @@ static void markbeingfnz (global_State *g) {
+ 
+ 
+ /*
+-** Mark all values stored in marked open upvalues from non-marked threads.
+-** (Values from marked threads were already marked when traversing the
+-** thread.) Remove from the list threads that no longer have upvalues and
+-** not-marked threads.
++** For each non-marked thread, simulates a barrier between each open
++** upvalue and its value. (If the thread is collected, the value will be
++** assigned to the upvalue, but then it can be too late for the barrier
++** to act. The "barrier" does not need to check colors: A non-marked
++** thread must be young; upvalues cannot be older than their threads; so
++** any visited upvalue must be young too.) Also removes the thread from
++** the list, as it was already visited. Removes also threads with no
++** upvalues, as they have nothing to be checked. (If the thread gets an
++** upvalue later, it will be linked in the list again.)
+ */
+ static void remarkupvals (global_State *g) {
+   lua_State *thread;
+@@ -313,9 +326,11 @@ static void remarkupvals (global_State *g) {
+       p = &thread->twups;  /* keep marked thread with upvalues in the list */
+     else {  /* thread is not marked or without upvalues */
+       UpVal *uv;
++      lua_assert(!isold(thread) || thread->openupval == NULL);
+       *p = thread->twups;  /* remove thread from the list */
+       thread->twups = thread;  /* mark that it is out of list */
+       for (uv = thread->openupval; uv != NULL; uv = uv->u.open.next) {
++        lua_assert(getage(uv) <= getage(thread));
+         if (uv->u.open.touched) {
+           markvalue(g, uv->v);  /* remark upvalue's value */
+           uv->u.open.touched = 0;
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
index 4f89579c78..7d84ea60b6 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://0001-Allow-building-lua-without-readline-on-Linux.patch \
            file://CVE-2020-15888.patch \
            file://CVE-2020-15945.patch \
+           file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
-- 
2.17.1

