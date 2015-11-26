Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 860FB601B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2015 08:07:10 +0000 (UTC)
Received: by wmww144 with SMTP id w144so10770624wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2015 00:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=il1N6KHNgnIrO0083XbGlq+PRzAcm9ZYO7taBnPgyz4=;
	b=wb8NA1uHHrQ4BP5HIoO+NysHNJwSw934n6WSlxHWU0Tmk+gyWLsFaFP8uZ3cjMV3wX
	IxAsJwF+yt4J917GlPa4IldMhTdoBsynwCH/4YxVQdRug4LhcDUdUbqsYqr5rUv6jZ03
	dsxVDMsfpohh9oslDjUx1PcQdEbJZs+4lI8vVUhXZ7vw4wG4UnCcKyzJDvNDdRvYr316
	OQAiXhzYSey2ekJ0AAYt9B3a1+wa15xxwCzPosshCvCl+M5m+NTh0+Ve4Df6Q0EvuELC
	FJHYP2jb5Nhhm1wFcbnBqAP82I83Uk9XTM5l2PxwOBqROTb8vL5bOvAf27d3xGEWCCs+
	0ixQ==
X-Received: by 10.194.222.104 with SMTP id ql8mr13992094wjc.157.1448525230675; 
	Thu, 26 Nov 2015 00:07:10 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	cw3sm26674885wjb.26.2015.11.26.00.07.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Nov 2015 00:07:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Nov 2015 09:06:39 +0100
Message-Id: <1448525199-27504-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448525199-27504-1-git-send-email-schnitzeltony@googlemail.com>
References: <1448525199-27504-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][master 2/2] align target qmake paths/mkspec
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
X-List-Received-Date: Thu, 26 Nov 2015 08:07:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  4 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  5 +-
 ...configure-paths-for-target-qmake-properly.patch | 76 ++++++++++++++++++++++
 ...build-uic.patch => 0009-Always-build-uic.patch} |  0
 ...xternal-hostbindir-option-for-native-sdk.patch} |  0
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 6 files changed, 82 insertions(+), 4 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
 rename recipes-qt/qt5/qtbase/{0008-Always-build-uic.patch => 0009-Always-build-uic.patch} (100%)
 rename recipes-qt/qt5/qtbase/{0009-Add-external-hostbindir-option-for-native-sdk.patch => 0010-Add-external-hostbindir-option-for-native-sdk.patch} (100%)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index f712af7..3d4900e 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -33,8 +33,8 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0008-Always-build-uic.patch \
-    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0009-Always-build-uic.patch \
+    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index e27d34b..14e8516 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -23,12 +23,13 @@ SRC_URI += "\
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
+    file://0008-configure-paths-for-target-qmake-properly.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0008-Always-build-uic.patch \
-    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0009-Always-build-uic.patch \
+    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 CLEANBROKEN = "1"
diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
new file mode 100644
index 0000000..efd27a5
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
@@ -0,0 +1,76 @@
+From fb519b08f564a8a640b1b2f2b6a3bd54a83e19e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 13 Nov 2015 12:36:11 +0100
+Subject: [PATCH] configure paths/mkspecs for target qmake properly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+to use this patch in all qtbase/qtbase-native(sdk) changes ore made
+conditionally based on QT_CROSS_COMPILE
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure | 23 +++++++++++++++++++----
+ 1 file changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 6edfffd..de74a29 100755
+--- a/configure
++++ b/configure
+@@ -3857,8 +3857,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
+     QMAKE_CONFIG="$QMAKE_CONFIG compile_examples"
+ fi
+ 
+-shortxspec=`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
+-shortspec=`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
++if [ "$QT_CROSS_COMPILE" = "yes" ] ; then
++    shortxspec=linux-g++
++    shortspec=linux-g++
++else
++    shortxspec=`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
++    shortspec=`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
++fi
+ 
+ QT_CONFIGURE_STR_OFF=0
+ 
+@@ -3891,7 +3896,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
+ 
+ QT_CONFIGURE_STR_OFFSETS=
+ QT_CONFIGURE_STRS=
+-addConfStr "$CFG_SYSROOT"
++if [ "$QT_CROSS_COMPILE" = "yes" ] ; then
++    addConfStr ""
++else
++    addConfStr "$CFG_SYSROOT"
++fi
+ addConfStr "$QT_REL_HOST_BINS"
+ addConfStr "$QT_REL_HOST_LIBS"
+ addConfStr "$QT_REL_HOST_DATA"
+@@ -3903,6 +3912,12 @@ addConfStr "$shortspec"
+ #-------------------------------------------------------------------------------
+ [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/global"
+ 
++if [ "$QT_CROSS_COMPILE" = "yes" ] ; then
++    QT_TARGET_PREFIX=$QT_EXT_PREFIX
++else
++    QT_TARGET_PREFIX=$QT_HOST_PREFIX
++fi
++
+ cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
+ /* License Info */
+ static const char qt_configure_licensee_str          [256 + 12] = "qt_lcnsuser=$Licensee";
+@@ -3915,7 +3930,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
+ static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
+ #ifdef QT_BUILD_QMAKE
+ static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
+-static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
++static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_TARGET_PREFIX";
+ #endif
+ 
+ static const short qt_configure_str_offsets[] = {
+-- 
+2.1.0
+
diff --git a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
similarity index 100%
rename from recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
diff --git a/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
similarity index 100%
rename from recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
rename to recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index fdc73e1..20627c8 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -19,6 +19,7 @@ SRC_URI += "\
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
+    file://0008-configure-paths-for-target-qmake-properly.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
2.1.0


