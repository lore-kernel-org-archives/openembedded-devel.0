Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.17787.1595957488058030966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 10:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06SHVQ0R016690
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2020 10:31:27 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Jul 2020
 10:31:07 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] lua: Security Advisory - lua - CVE-2020-15888
Date: Tue, 28 Jul 2020 10:31:07 -0700
Message-ID: <20200728173107.35777-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Backport fix from https://github.com/lua/lua.git.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../lua/lua/CVE-2020-15888.patch              | 45 +++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua_5.3.5.bb     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch

diff --git a/meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch b/meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch
new file mode 100644
index 000000000..60a412597
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch
@@ -0,0 +1,45 @@
+From 6298903e35217ab69c279056f925fb72900ce0b7 Mon Sep 17 00:00:00 2001
+From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
+Date: Mon, 6 Jul 2020 12:11:54 -0300
+Subject: [PATCH] Keep minimum size when shrinking a stack
+
+When shrinking a stack (during GC), do not make it smaller than the
+initial stack size.
+---
+ ldo.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+==== end of original header ====
+
+CVE: CVE-2020-15888
+
+Upstream-Status: backport [https://github.com/lua/lua.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+====
+diff --git a/ldo.c b/ldo.c
+index c563b1d9..a89ac010 100644
+--- a/src/ldo.c
++++ b/src/ldo.c
+@@ -220,7 +220,7 @@ static int stackinuse (lua_State *L) {
+ 
+ void luaD_shrinkstack (lua_State *L) {
+   int inuse = stackinuse(L);
+-  int goodsize = inuse + (inuse / 8) + 2*EXTRA_STACK;
++  int goodsize = inuse + BASIC_STACK_SIZE;
+   if (goodsize > LUAI_MAXSTACK)
+     goodsize = LUAI_MAXSTACK;  /* respect stack limit */
+   if (L->stacksize > LUAI_MAXSTACK)  /* had been handling stack overflow? */
+@@ -229,8 +229,7 @@ void luaD_shrinkstack (lua_State *L) {
+     luaE_shrinkCI(L);  /* shrink list */
+   /* if thread is currently not handling a stack overflow and its
+      good size is smaller than current size, shrink its stack */
+-  if (inuse <= (LUAI_MAXSTACK - EXTRA_STACK) &&
+-      goodsize < L->stacksize)
++  if (inuse <= (LUAI_MAXSTACK - EXTRA_STACK) && goodsize < L->stacksize)
+     luaD_reallocstack(L, goodsize);
+   else  /* don't change stack */
+     condmovestack(L,{},{});  /* (change only for debugging) */
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
index a23a4a5da..d3461b06d 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
@@ -7,6 +7,7 @@ HOMEPAGE = "http://www.lua.org/"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
            file://0001-Allow-building-lua-without-readline-on-Linux.patch \
+           file://CVE-2020-15888.patch \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
-- 
2.17.1

