Return-Path: <daniel.klauer@gin.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CD6E7B5ED
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 10:54:39 +0000 (UTC)
Received: from good-out-03.clustermail.de (good-out-03.clustermail.de [212.223.36.1])
 by mx.groups.io with SMTP id smtpd.web10.15501.1696416871520275223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 03:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gin.de, ip: 212.223.36.1, mailfrom: daniel.klauer@gin.de)
Received: from [10.0.0.9] (helo=frontend.clustermail.de)
	by smtpout-01.clustermail.de with esmtp (Exim 4.96)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1qnzWO-0005Yg-1t
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2023 12:54:28 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
	(Exim 4.96)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1qnzWN-0005ai-2X
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2023 12:54:28 +0200
Received: from daniel-desktop2.fritz.box (10.176.8.48) by
 Win2012-02.gin-domain.local (10.160.128.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.48; Wed, 4 Oct 2023 12:54:27 +0200
From: Daniel Klauer <daniel.klauer@gin.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] graphviz: Fix build to not use $prefix as search dir
Date: Wed, 4 Oct 2023 12:54:03 +0200
Message-ID: <20231004105403.6508-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.176.8.48]
X-ClientProxiedBy: Win2012-02.gin-domain.local (10.160.128.12) To
 Win2012-02.gin-domain.local (10.160.128.12)
X-EsetResult: clean, is OK
X-EsetId: 37303A29342AAB58657262
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 10:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105330

The graphviz configure script used $prefix/include and $prefix/lib search
directories, thus bypassing the recipe sysroot, which could lead to build
contamination or failures. The added patch (backported from graphviz 9.0.0)
fixes this.

Due to the $prefix != /usr check in the configure script, this issue only
showed up for recipe build variants which use a different prefix value,
such as nativesdk-graphviz (prefix = SDKPATHNATIVE/...) or graphviz-native
(prefix = STAGING_DIR_NATIVE/...). Using STAGING_DIR_NATIVE is probably not
a problem, since it is recipe-specific anyways, but using SDKPATHNATIVE
may be a problem, if it happens to exist and contains headers/libraries.
Even though this may be unlikely with the default SDKPATH =
"/usr/local/oe-sdk-hardcoded-buildpath" value used in bitbake.conf,
the problem can still be triggered, especially if the paths like prefix
or SDKPATH are customized in a build.

Link: https://gitlab.com/graphviz/graphviz/-/issues/2442
Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
---
 ...-not-put-prefix-based-paths-in-compi.patch | 58 +++++++++++++++++++
 .../graphviz/graphviz_8.1.0.bb                |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/0001-Autotools-fix-do-not-put-prefix-based-paths-in-compi.patch

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Autotools-fix-do-not-put-prefix-based-paths-in-compi.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Autotools-fix-do-not-put-prefix-based-paths-in-compi.patch
new file mode 100644
index 000000000..0d3f41270
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Autotools-fix-do-not-put-prefix-based-paths-in-compi.patch
@@ -0,0 +1,58 @@
+From 671e0d091b40ef7deb4a9d43e0dbed2a44edbec8 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Sat, 9 Sep 2023 01:03:04 -0700
+Subject: [PATCH] Autotools: fix: do not put '$prefix' based paths in
+ compilation flags
+
+This was causing problems with cross-compilation with a dedicated sysroot,
+because compilation would incorrectly use headers and libraries from the
+`--prefix` path. The `--prefix` path is meant to indicate a target path to
+install to, not a path from which to source dependent libraries.
+
+Gitlab: fixes #2442
+Reported-by: Daniel Klauer
+Suggested-by: Daniel Klauer
+
+Upstream-Status: Backport [https://gitlab.com/graphviz/graphviz/-/commit/012d250a903e13114bce3ba40995fb957fed7848]
+Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
+---
+ CHANGELOG.md | 3 +++
+ configure.ac | 8 --------
+ 2 files changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/CHANGELOG.md b/CHANGELOG.md
+index b9b7e8e08..3a15fd256 100644
+--- a/CHANGELOG.md
++++ b/CHANGELOG.md
+@@ -39,6 +39,9 @@ and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0
+   longer fails due to missing PHP files. #2388
+ - Syntax for a loop in `gvmap.sh` has been corrected. This was a regression in
+   Graphviz 2.50.0. #2404
++- The Autotools build system no longer uses headers and libraries from the
++  `--prefix` path given on the command line. This previously caused
++  cross-compilation to incorrectly pick up host headers and libraries. #2442
+ 
+ ## [8.0.5] – 2023-04-30
+ 
+diff --git a/configure.ac b/configure.ac
+index 573a3ee5d..7d53346de 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -190,14 +190,6 @@ if test "x${prefix}" = "xNONE"; then
+ 	AC_SUBST([prefix])
+ fi
+ 
+-# automatically check for other dependencies in $prefix first
+-if test "x${prefix}" != "x/usr"; then
+-	CPPFLAGS="$CPPFLAGS -I${prefix}/include"
+-	LDFLAGS="$LDFLAGS -L${prefix}/lib"
+-	PKG_CONFIG_PATH="$prefix/lib/pkgconfig$PATHSEPARATOR$PKG_CONFIG_PATH"
+-	export PKG_CONFIG_PATH
+-fi
+-
+ dnl -----------------------------------
+ # Static/Shared binaries
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
index ccc114007..4d40ee4de 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
@@ -19,6 +19,7 @@ DEPENDS:append:class-nativesdk = " ${BPN}-native"
 inherit autotools-brokensep pkgconfig gettext qemu
 
 SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
+           file://0001-Autotools-fix-do-not-put-prefix-based-paths-in-compi.patch \
            "
 # Use native mkdefs
 SRC_URI:append:class-target = "\
-- 
2.34.1


