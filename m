Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.18208.1610492904153179979
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 15:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V+Mr0/j1;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id t6so2286784plq.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 15:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LXwIK1ZeTnVJbTb/+32yCbMJbE0eXitXUeFnNzjOPdw=;
        b=V+Mr0/j1ESGKej1Pdv3qbQp25QLKg+plv+YRoagYveGlr/T5IrDlmrid6RoOzUiPFB
         UEYcuUihteo/y45tuACiUFSTkzY+xUdQ6NKOaHDEe+NfgZICmtgnYPC1p78JeJxvIIGd
         XMZywv0LxEwULF9HfTBCgAkuPoKyr57NYvYpa1JtiFiRnxQoJmyVhTWRjeYvJpsj0CO9
         V806J5WiW2hZ/ppu+um2TMTih6v/FBDKuwdcr+k6bfCdF7uxpnlaejW7jdcY2lIzENwe
         bMv8XnJJoJf5otlfPvPHTNPN7LiqzMMNc0ZxvORE/Sh/5VOkbA0ZnkacT5AKR7rOPSpH
         QeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LXwIK1ZeTnVJbTb/+32yCbMJbE0eXitXUeFnNzjOPdw=;
        b=kVVseTtaF/i9YtjFPG2muHlO1UhT+ELGdWANAFAW+FCKObGmp0EOA9/JQV9EZKMAv6
         nUcoc9GFrYY18fRsKloDo/XfhcyPi+uXxuvXS7DbTrBX2xlSCF/zruAPt5ZWQkOIamoT
         8NlVk1KpsjXIVjaGeM87EUEvclTzs2sGOZznrwb8MQj7W40CGSPTP0kv1uktfh1jhzk/
         uGTyw/Fm3SMKSIlNslnTIftlXvTdHthXaS9mbPnwuoME2ixDgoDjZHLmevMlcRLiOIjX
         D6d/BZzEl4owA8+ISHfrWouFhGAYOuk0WIgV0rCwPrzyHBtlJqlH5A7KdMGQ7KrYaM34
         Lkow==
X-Gm-Message-State: AOAM530iH/WF7FdD4blzrND/5NM/mRfrxSZt/dOUPAUoibZwGzWWvH4n
	oIIRxLBPputD9CXWCpCm7qSigS8KLcopkg==
X-Google-Smtp-Source: ABdhPJyBAomTVswJVVHUj6Kpi1KRpt7ShBRfuHO441bFzsirm8Dc7H8hzgTiV2c+muDfZ1Rq/a+hvQ==
X-Received: by 2002:a17:902:ed14:b029:da:9da4:3091 with SMTP id b20-20020a170902ed14b02900da9da43091mr1263971pld.29.1610492903442;
        Tue, 12 Jan 2021 15:08:23 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:2960:99d5:cba5:7114])
        by smtp.gmail.com with ESMTPSA id d203sm165622pfd.148.2021.01.12.15.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 15:08:23 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wenlin Kang <wenlin.kang@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH 2/2] lua: fix CVE-2020-24371
Date: Tue, 12 Jan 2021 15:08:20 -0800
Message-Id: <20210112230820.5071-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112230820.5071-1-akuster808@gmail.com>
References: <20210112230820.5071-1-akuster808@gmail.com>

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

