Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id E4D2E601A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2015 08:07:09 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so10806393wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2015 00:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=8eDbvmQTwmLTHB0voBQdKa9EptOSVN9g81weRn0M7n0=;
	b=TOabl1Z0VGqMfrTalyDZFcXWd76We1wv6JnClf21euhAyIyzhXIbUd+uoPceHktT46
	hq1lotB3nKi7XS8X7cHvBNm7hth9x5exgcAXttnilA5oyvuIHguZ/fsMKyuEHfrAdrRA
	4M+j/pyY40LjOYyDH3ko8ASizbJzhBHiEavKTLosx3H0ifBiFBrecbbcsDBfzcOS7sAD
	1mEMWRIoAr+XKxL2gFoAGvdblhFuknhlRZCyVKtPt5TANPfVVWD3ybmbVKh7Hwn/UVmC
	j1EilHFuIh1/33GTL6fK39DUOQx8U8iLGy1v+ycr86RsAQGaxsGR7gwrLdbGk0ISyyyL
	syGg==
X-Received: by 10.28.225.84 with SMTP id y81mr2166802wmg.87.1448525229868;
	Thu, 26 Nov 2015 00:07:09 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	cw3sm26674885wjb.26.2015.11.26.00.07.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Nov 2015 00:07:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Nov 2015 09:06:38 +0100
Message-Id: <1448525199-27504-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448525199-27504-1-git-send-email-schnitzeltony@googlemail.com>
References: <1448525199-27504-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][jethro] qtbase: align target qmake paths/mkspec
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
X-List-Received-Date: Thu, 26 Nov 2015 08:07:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With this we can setup qt-creator to build/debug on target again.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...configure-paths-for-target-qmake-properly.patch | 76 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch

diff --git a/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch
new file mode 100644
index 0000000..efd27a5
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch
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
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 0ba8ac8..3ef5923 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -26,6 +26,7 @@ SRC_URI += "\
     file://0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
     file://0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch \
+    file://0011-configure-paths-for-target-qmake-properly.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
2.1.0


