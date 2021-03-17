Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web12.1296.1616021885101100380
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 15:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: vctlabs.com, ip: 207.154.65.135, mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 0335C28039B; Wed, 17 Mar 2021 15:58:02 -0700 (PDT)
Date: Wed, 17 Mar 2021 15:58:02 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH] openjdk-8: use relative path to build-aux in configure.ac
Message-ID: <20210317225802.logo2goqzs4f5na3@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This autoconf error has been present a long time, though it used to be non-fatal:

  autoreconf: configure.ac: creating directory $TOPDIR/common/autoconf/build-aux
  autoreconf: error: cannot create $TOPDIR/common/autoconf/build-aux: No such file or directory

Recently it started leading to a second fatal error:

  Error in tempfile() using template $TOPDIR/common/autoconf/build-aux/XXXXXXXXXX:
         Parent directory ($TOPDIR/common/autoconf/build-aux/) does not exist

Fix by patching configure.ac to take into account that bitbake is
calling autoreconf directly from its parent directory rather than
the top level of source.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 .../openjdk/openjdk-8-release-common.inc      |  1 +
 .../0014-autoconf-fix-build-aux-path.patch    | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0014-autoconf-fix-build-aux-path.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
index a3747cf..db6a4ab 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -10,6 +10,7 @@ PATCHES_URI = "\
     file://0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch \
     file://0010-autoconf-remove-shell-variables-from-autoheader.patch \
     file://0013-autoconf-remove-Werror.patch \
+    file://0014-autoconf-fix-build-aux-path.patch \
     ${HOTSPOT_UB_PATCH} \
     file://2001-jdk-comparison-between-pointer-and-integer.patch \
     file://2002-jdk-Allow-using-a-system-installed-libjpeg.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-8/0014-autoconf-fix-build-aux-path.patch b/recipes-core/openjdk/patches-openjdk-8/0014-autoconf-fix-build-aux-path.patch
new file mode 100644
index 0000000..45dbcd8
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0014-autoconf-fix-build-aux-path.patch
@@ -0,0 +1,30 @@
+From 2246166945819a68d1c9facd1698c9ef430611a6 Mon Sep 17 00:00:00 2001
+From: "S. Lockwood-Childs" <sjl@vctlabs.com>
+Date: Wed, 17 Mar 2021 15:21:54 -0700
+Subject: [PATCH] autoconf: fix build-aux path
+
+Unlike the upstream build wrapper script, bitbake recipe calls
+autoconf directly from common/autoreconf directory. Adjust the
+path to build-aux directory accordingly.
+
+Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
+---
+ common/autoconf/configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common/autoconf/configure.ac b/common/autoconf/configure.ac
+index 67a230591f..00f3b0ef7e 100644
+--- a/common/autoconf/configure.ac
++++ b/common/autoconf/configure.ac
+@@ -33,7 +33,7 @@
+ AC_PREREQ([2.69])
+ AC_INIT(OpenJDK, jdk8, build-dev@openjdk.java.net,,http://openjdk.java.net)
+ 
+-AC_CONFIG_AUX_DIR([$TOPDIR/common/autoconf/build-aux])
++AC_CONFIG_AUX_DIR([build-aux])
+ m4_include([build-aux/pkg.m4])
+ 
+ # Include these first...
+-- 
+2.17.1
+
-- 
2.20.1

