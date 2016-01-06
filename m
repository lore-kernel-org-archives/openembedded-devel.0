Return-Path: <maciej.borzecki@open-rnd.pl>
X-Greylist: delayed 469 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Jan 2016 11:45:43 UTC
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id E19A4606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:45:43 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id E7ED81AB13D;
	Wed,  6 Jan 2016 12:37:52 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Wed,  6 Jan 2016 12:37:16 +0100
Message-Id: <1452080236-16613-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-oe][PATCH] mozjs: fix linking issues on i586
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
X-List-Received-Date: Wed, 06 Jan 2016 11:45:44 -0000

When building for qemux86 on a x86 host, there's a possibility that the build
will try to link with incorrect libraries. Due to problematic -rpath-link the
linker may try to use host libraries if they are present and are arch
compatible.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 ...010-fix-cross-compilation-on-i586-targets.patch | 46 ++++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
new file mode 100644
index 0000000000000000000000000000000000000000..6432e1fb7b5ec86fa81a6275d3ad44a1d8370082
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
@@ -0,0 +1,46 @@
+From a452138a1dd274bfad381a701729783360dc86fb Mon Sep 17 00:00:00 2001
+From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
+Date: Tue, 5 Jan 2016 22:04:17 +0100
+Subject: [PATCH] fix cross compilation on i586 targets
+
+Remove offending -Wl,-rpath-link that may cause host libraries to be picked
+during linking. The patch applies a fix to configure.in. So as not to
+regenerate configure, similar fix is applied there.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
+---
+ js/src/configure    | 2 +-
+ js/src/configure.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/js/src/configure b/js/src/configure
+index d019b0fdba44233596541de94307010d85a8e32e..5aa40f757a3dbb7d6887175046f44212c15c2eac 100755
+--- a/js/src/configure
++++ b/js/src/configure
+@@ -5555,7 +5555,7 @@ TARGET_MD_ARCH=unix
+ DIRENT_INO=d_ino
+ MOZ_USER_DIR=".mozilla"
+ 
+-MOZ_FIX_LINK_PATHS='-Wl,-rpath-link,$(LIBXUL_DIST)/bin -Wl,-rpath-link,$(prefix)/lib'
++MOZ_FIX_LINK_PATHS='-Wl,-rpath-link,$(LIBXUL_DIST)/bin'
+ 
+ MOZ_COMPONENT_NSPR_LIBS='-L$(LIBXUL_DIST)/bin $(NSPR_LIBS)'
+ 
+diff --git a/js/src/configure.in b/js/src/configure.in
+index 0673aca12f6d83035549ade2a4a83906bf91f0f0..39b22724f9535ac1a6dba04658c91e4ef667fc47 100644
+--- a/js/src/configure.in
++++ b/js/src/configure.in
+@@ -919,7 +919,7 @@ TARGET_MD_ARCH=unix
+ DIRENT_INO=d_ino
+ MOZ_USER_DIR=".mozilla"
+ 
+-MOZ_FIX_LINK_PATHS='-Wl,-rpath-link,$(LIBXUL_DIST)/bin -Wl,-rpath-link,$(prefix)/lib'
++MOZ_FIX_LINK_PATHS='-Wl,-rpath-link,$(LIBXUL_DIST)/bin'
+ 
+ MOZ_COMPONENT_NSPR_LIBS='-L$(LIBXUL_DIST)/bin $(NSPR_LIBS)'
+ 
+-- 
+2.5.0
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index bb71707492731871e09870e4e820390a38bd5bd0..be4b50b8eb4e17fcc22299803479903f2a2915ea 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://0001-regenerate-configure.patch;patchdir=../../ \ 
     file://fix-the-compile-error-of-powerpc64.patch;patchdir=../../ \
     file://fix_milestone_compile_issue.patch \
+    file://0010-fix-cross-compilation-on-i586-targets.patch;patchdir=../../ \
   "
 
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
-- 
2.5.0


