Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id D9ED57E5F9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jun 2019 03:16:55 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u22so7315139pfm.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 20:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ltahs203Xm7uFW7ltAxMspIs1Egg993EiGIxi7yQypM=;
	b=f2oTl9K3zz5z+5XVBoYtHNZ6INfB8cj+ruu0o4cS+kYKz0LbAInGkOYj4kAy3hwn0T
	LR/t03yxQFN5+tL9NO6Eh3uVXBFccKyaDW6pnxooCcneBJ6VExKXr4bQGUTLeg1Vqu1y
	6+3CkCr7syQE67MCjBB/IhUsdIwJKanKfMKnfZGTF5W5LXspR9wk8TdU+qpXYZ/MhmhQ
	+AOLhgjSkPLNtM2wlJlLq2RRwt7tYMVhtgI7TVI683QBbWBnnP9mISvYZhduDz67TfCv
	Qy/VUWO2dnOPZH0ebNJUVGMx5MHdl81TL5JK52pt3S6XFlpaCP9+FusnOR/36zxmFewA
	G6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ltahs203Xm7uFW7ltAxMspIs1Egg993EiGIxi7yQypM=;
	b=HCXesihQAZhgMlguelRogIXBKD9L59+PqUfgqXNtv2SFCHDr4RsYOWEoXuSXzUP//c
	W8cB8IFkemPQNDzG3efz9o2FsaAxvY6o58lnRHyi7TliDGCuTpxWIRJqKFoy8hsKBrtC
	CWeKJ33qNvig/W5U+Z2+AWzPyFRgEyoQ9xha0vkA4ErdMkXkl96oxNhoxzP3qKjYngqt
	/BvQmA5wKaPq4MDNwzkwzpiGBGLmyIeei3zD9XYzLkfk3PVGhhla6mt93RWn7Cx4UZN+
	ydJijeM174Dg1+mgV3c3zeOtu/5L34rVjve1LyrO/huDsio/ClQfbqdG1kdpgyTJdWvH
	n85w==
X-Gm-Message-State: APjAAAVE1B/mrMdxxpDi4lcIa+bm0+qN6c3mFqYBq5C8QjD+ge050K07
	HqLj4yETZEqzegW3frroCSHev0iP
X-Google-Smtp-Source: APXvYqxDFoL/3ozxNOgl7AdHuDkdmGZUrPata9OY11c/VuAyPPxkjFGy3wfxmVQbeauqLeQF2POlZA==
X-Received: by 2002:a65:62cc:: with SMTP id m12mr12936479pgv.237.1559359016591;
	Fri, 31 May 2019 20:16:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d8eb:da43:9914:3fc9])
	by smtp.gmail.com with ESMTPSA id
	f10sm12609244pgo.14.2019.05.31.20.16.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 May 2019 20:16:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 May 2019 20:16:54 -0700
Message-Id: <1559359014-14129-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe[thud][PATCH] lua: Security fix for CVE-2019-6706
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Jun 2019 03:16:56 -0000

Source: lua.org
MR: 97553
Type: Security Fix
Disposition: Backport from http://lua.2524044.n2.nabble.com/CVE-2019-6706-use-after-free-in-lua-upvaluejoin-function-tc7685575.html
ChangeID: c939b7edcb54274ab0aeebcb7e3dc9f17cc09c2d
Description:

Affects < 5.3.5
Fixes:
CVE-2019-6706

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/lua/lua/CVE-2019-6706.patch   | 32 ++++++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua_5.3.4.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2019-6706.patch

diff --git a/meta-oe/recipes-devtools/lua/lua/CVE-2019-6706.patch b/meta-oe/recipes-devtools/lua/lua/CVE-2019-6706.patch
new file mode 100644
index 0000000..cfe48af
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua/CVE-2019-6706.patch
@@ -0,0 +1,32 @@
+CVE-2019-6706: use-after-free in lua_upvaluejoin function 
+
+Upstream-Status: Backport
+http://lua.2524044.n2.nabble.com/CVE-2019-6706-use-after-free-in-lua-upvaluejoin-function-tc7685575.html
+CVE: CVE-2019-6706
+Affects < 5.3.5
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: lua-5.3.4/src/lapi.c
+===================================================================
+--- lua-5.3.4.orig/src/lapi.c
++++ lua-5.3.4/src/lapi.c
+@@ -1285,14 +1285,14 @@ LUA_API void *lua_upvalueid (lua_State *
+ 
+ LUA_API void lua_upvaluejoin (lua_State *L, int fidx1, int n1,
+                                             int fidx2, int n2) {
+-  LClosure *f1;
+-  UpVal **up1 = getupvalref(L, fidx1, n1, &f1);
++  UpVal **up1 = getupvalref(L, fidx1, n1, NULL); /* the last parameter not needed */
+   UpVal **up2 = getupvalref(L, fidx2, n2, NULL);
++  if (*up1 == *up2) return; /* Already joined */
++  (*up2)->refcount++;
++  if (upisopen(*up2)) (*up2)->u.open.touched = 1;
++  luaC_upvalbarrier(L, *up2);
+   luaC_upvdeccount(L, *up1);
+   *up1 = *up2;
+-  (*up1)->refcount++;
+-  if (upisopen(*up1)) (*up1)->u.open.touched = 1;
+-  luaC_upvalbarrier(L, *up1);
+ }
+ 
+ 
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
index 8f4e8fe..978c203 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
@@ -7,6 +7,7 @@ HOMEPAGE = "http://www.lua.org/"
 DEPENDS = "readline"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
+           file://CVE-2019-6706.patch \
            "
 SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
            'http://www.lua.org/tests/lua-${PV}-tests.tar.gz;name=tarballtest \
-- 
2.7.4


