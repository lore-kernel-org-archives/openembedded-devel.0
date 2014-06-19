Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99DDE7014A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:20:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5J9K8O5017938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:20:08 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 19 Jun 2014 02:20:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jun 2014 17:20:23 +0800
Message-ID: <1403169623-9216-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe v2] dialog: inherit brokensep and use pkg-config to detect ncurses
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jun 2014 09:20:15 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. inherit autotools-brokensep, or else configuration will fail since B!=S 
2. use pkg-config to detect ncurses, since ncurses-config no longer works

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-extended/dialog/dialog.inc         |    6 ++-
 .../use-pkg-config-for-ncurses-detection.patch     |   40 ++++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch

diff --git a/meta-oe/recipes-extended/dialog/dialog.inc b/meta-oe/recipes-extended/dialog/dialog.inc
index c1c28fd..995d6c0 100644
--- a/meta-oe/recipes-extended/dialog/dialog.inc
+++ b/meta-oe/recipes-extended/dialog/dialog.inc
@@ -8,12 +8,14 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz"
+SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \
+           file://use-pkg-config-for-ncurses-detection.patch \
+          "
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
 
-inherit autotools
+inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF = "--with-ncurses \
                 --disable-rpath-hack"
diff --git a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
new file mode 100644
index 0000000..b5b4b3c
--- /dev/null
+++ b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
@@ -0,0 +1,40 @@
+Subject: [PATCH] use pkg-config for ncurses detection.
+
+Upstream-Status: Inappropriate [configuration]
+
+This is a workaround to make dialog be able to build after ncurses-config
+does not work, since the configure file is called directly in dialog bb
+file, and autoconf can not work, make a workaround in configure file.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index 24e28c1..c78735d 100755
+--- a/configure
++++ b/configure
+@@ -9976,8 +9976,8 @@ fi
+ 
+ if test "$NCURSES_CONFIG" != none ; then
+ 
+-CPPFLAGS="$CPPFLAGS `$NCURSES_CONFIG --cflags`"
+-LIBS="`$NCURSES_CONFIG --libs` $LIBS"
++CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "ncurses" 2>&1`"
++LIBS="`pkg-config --short-errors --print-errors --libs "ncurses" 2>&1` $LIBS"
+ 
+ # even with config script, some packages use no-override for curses.h
+ 
+@@ -10096,7 +10096,7 @@ cat >>confdefs.h <<EOF
+ #define $cf_nculib_ROOT 1
+ EOF
+ 
+-cf_cv_ncurses_version=`$NCURSES_CONFIG --version`
++cf_cv_ncurses_version=`pkg-config --short-errors --print-errors --modversion "ncurses"`
+ 
+ else
+ 
+-- 
+1.7.10.4
+
-- 
1.7.10.4


