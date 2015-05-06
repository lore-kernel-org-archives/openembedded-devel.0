Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7075D60138
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 02:23:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t462NsY6000723
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 May 2015 19:23:54 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 5 May 2015 19:23:54 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 May 2015 10:23:52 +0800
Message-ID: <1430879032-26800-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-oe][v2] dialog: upgrade to 1.2-20150225
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
X-List-Received-Date: Wed, 06 May 2015 02:23:55 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. upgrade it to 1.2-20150225
2. update the use-pkg-config-for-ncurses-detection.patch
3. remove dialog-static recipe file, since dialog will generate the static
library.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../dialog/dialog-static_1.1-20120706.bb           |  6 -----
 .../recipes-extended/dialog/dialog_1.1-20120706.bb |  4 ----
 .../dialog/{dialog.inc => dialog_1.2-20150225.bb}  |  3 +++
 .../use-pkg-config-for-ncurses-detection.patch     | 28 ++++++++--------------
 4 files changed, 13 insertions(+), 28 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
 delete mode 100644 meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
 rename meta-oe/recipes-extended/dialog/{dialog.inc => dialog_1.2-20150225.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
deleted file mode 100644
index 595f323..0000000
--- a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require dialog.inc
-
-LDFLAGS += "-static"
-
-SRC_URI[md5sum] = "2e538305977178eb085a9859511c299d"
-SRC_URI[sha256sum] = "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44d079cb87cf0ce2f5"
diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
deleted file mode 100644
index c87fb61..0000000
--- a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dialog.inc
-
-SRC_URI[md5sum] = "2e538305977178eb085a9859511c299d"
-SRC_URI[sha256sum] = "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44d079cb87cf0ce2f5"
diff --git a/meta-oe/recipes-extended/dialog/dialog.inc b/meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog.inc
rename to meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
index 995d6c0..88af59f 100644
--- a/meta-oe/recipes-extended/dialog/dialog.inc
+++ b/meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
@@ -8,6 +8,9 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
+SRC_URI[md5sum] = "38ef59a7daa5459119cb06777c735e4b"
+SRC_URI[sha256sum] = "6844b13a7a1fea568a8d5bb3004e1af90888cd4a5e8c2ded2c38f34fcc7397ff"
+
 SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \
            file://use-pkg-config-for-ncurses-detection.patch \
           "
diff --git a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
index a2354ad..0a25a7f 100644
--- a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
+++ b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-detection.patch
@@ -8,33 +8,25 @@ file, and autoconf can not work, make a workaround in configure file.
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 ---
- configure |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ configure | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 24e28c1..c78735d 100755
+index 8afe3d7..a54bcc1 100755
 --- a/configure
 +++ b/configure
-@@ -9976,8 +9976,8 @@ fi
+@@ -11567,9 +11567,8 @@ fi
  
  if test "$NCURSES_CONFIG" != none ; then
  
 -CPPFLAGS="$CPPFLAGS `$NCURSES_CONFIG --cflags`"
--LIBS="`$NCURSES_CONFIG --libs` $LIBS"
+-
+-cf_add_libs="`$NCURSES_CONFIG --libs`"
 +CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "ncurses" 2>/dev/null`"
-+LIBS="`pkg-config --short-errors --print-errors --libs "ncurses" 2>/dev/null` $LIBS"
- 
- # even with config script, some packages use no-override for curses.h
- 
-@@ -10096,7 +10096,7 @@ cat >>confdefs.h <<EOF
- #define $cf_nculib_ROOT 1
- EOF
- 
--cf_cv_ncurses_version=`$NCURSES_CONFIG --version`
-+cf_cv_ncurses_version=`pkg-config --short-errors --print-errors --modversion "ncurses"`
- 
- else
- 
++cf_add_libs="`pkg-config --short-errors --print-errors --libs "ncurses" 2>/dev/null` $LIBS"
+ # Filter out duplicates - this happens with badly-designed ".pc" files...
+ for cf_add_1lib in $LIBS
+ do
 -- 
 1.7.10.4
 
-- 
2.1.0


