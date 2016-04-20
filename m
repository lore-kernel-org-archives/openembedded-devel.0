Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E6EE56FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:58:20 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id e201so42146147wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 01:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xUH/dnDYKqRA5pa/ifcONqkgV69HKHy8mWEgfCfTp+Y=;
	b=leAhKKh7Qv8R9/2PNaMCo+bNz9vGxBYXWJ4R4OhzBLIvYYElzOJnkHcSSlGvvA8g78
	UjbHW7xIMnat8mLOKJPj7i6MapPZmMj3MyGpABoFiXAR1qGWK/RhzMiFrluOmFjWXjiz
	da3lYbiL+lB7JvHS0Mx/sGfka3KcEjGS04kI6i7MnAtD+Q/grH9apnpaqDediHCrHCmT
	JFxTNV7rcg3XLRLL11BXPMyfMXmK+EEFp6gghzNHw4fDFSVMrrqUSYZDkGW7rY19XdtH
	HrTG2OYAPc346LEwLfxK7U7kxfnNNqCOg6SdISqKoPg1u0fuPxRJ+dc/P+h+E9M4ve9N
	0MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xUH/dnDYKqRA5pa/ifcONqkgV69HKHy8mWEgfCfTp+Y=;
	b=LSHQrUQNJM1P7eNZFugibluIpuyu5KX63zxzCbdX8Usi/Mf80RO4Qvk72JaeRL0D7Q
	oMFsx1YiT8gPgJihLxlE49hex32FH093m+6+zmO3pjFV+y2obCsDewZEXN7WtAtC5R4x
	y5vizFL8aPSZ7KPXEB/89jjtQsxGQYO2ijG6if+J8RfzKkBzHAdYj9VlQHcnPIlgskUX
	eG/2xDrzJXdvXoezXWJqRtX/U3o/Enoa3OjTENilkwpN5vSwxt8oR/2VH4cZiZWftKQj
	oWI07OuBO8Z+DgW9jcKjZdYZS1U1n77MYd98xxq7BoxN1k5PrSvFjacudbyMIiH/ir+9
	g36g==
X-Gm-Message-State: AOPr4FW70IEbv/iZiS20w1F9I32H0PSPCKn/oyzSgMoXTUlas6njOmg2LuuXZitynw2Zgg==
X-Received: by 10.28.210.73 with SMTP id j70mr8597169wmg.48.1461142700693;
	Wed, 20 Apr 2016 01:58:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kq9sm4448676wjc.26.2016.04.20.01.58.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Apr 2016 01:58:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2016 11:00:17 +0200
Message-Id: <1461142817-3929-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][meta-qt5] recipes: use new PACKAGECONFIG_CONFARGS instead of EXTRA_OECONF
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
X-List-Received-Date: Wed, 20 Apr 2016 08:58:22 -0000

* this fixes builds for DISTROs which include no-static-libraries.inc
* this change depends on oe-core change:
  http://patchwork.openembedded.org/patch/116719/
  which was merged in this form:
  http://patchwork.openembedded.org/patch/120513/
  to Yocto 2.1, if you want to use latest meta-qt5 with older oe-core
  you need to append EXTRA_OECONF to PACKAGECONFIG_CONFARGS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 4 ++--
 recipes-qt/qt5/qt3d_git.bb             | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb    | 6 +++---
 recipes-qt/qt5/qtbase_git.bb           | 2 +-
 recipes-qt/qt5/qtconnectivity_git.bb   | 2 +-
 recipes-qt/qt5/qtsystems_git.bb        | 2 +-
 recipes-qt/qt5/qtwebengine_git.bb      | 4 ++--
 recipes-qt/qt5/qtwebkit_git.bb         | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 35d922e..0bdfde5 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -82,7 +82,7 @@ QT_CONFIG_FLAGS += " \
     -no-pch \
     -no-rpath \
     -pkg-config \
-    ${EXTRA_OECONF} \
+    ${PACKAGECONFIG_CONFARGS} \
 "
 
 # qtbase is exception, as these are used as install path for sysroots
@@ -201,7 +201,7 @@ do_configure() {
         -xplatform linux-oe-g++ \
         ${QT_CONFIG_FLAGS}
 
-    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
 }
 
 do_install() {
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index a19422b..af8fe4d 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -20,7 +20,7 @@ PACKAGECONFIG_class-native ??= "tools-only"
 PACKAGECONFIG_class-nativesdk ??= "tools-only"
 PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
 
-EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
+EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
 FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.bez \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 057edd4..9f3b015 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -40,7 +40,7 @@ do_generate_qt_config_file() {
     :
 }
 
-EXTRA_OECONF = " \
+PACKAGECONFIG_CONFARGS = " \
     -prefix ${prefix} \
     -sysroot ${STAGING_DIR_NATIVE} \
     -no-gcc-sysroot \
@@ -90,8 +90,8 @@ export OE_QMAKE_AR
 export OE_QMAKE_STRIP
 
 do_configure_prepend() {
-    MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
-    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+    MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${PACKAGECONFIG_CONFARGS} || die "Configuring qt failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
+    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
 }
 
 do_install() {
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index bf56741..98f6378 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -135,7 +135,7 @@ QT_CONFIG_FLAGS += " \
     -no-pch \
     -no-rpath \
     -pkg-config \
-    ${EXTRA_OECONF} \
+    ${PACKAGECONFIG_CONFARGS} \
 "
 
 do_generate_qt_config_file_append() {
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index cf6d3c5..17bd169 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -18,7 +18,7 @@ inherit bluetooth
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
 PACKAGECONFIG[bluez] = "CONFIG+=OE_BLUEZ_ENABLED,,${BLUEZ}"
 
-EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
+EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
 do_configure_prepend() {
     # disable bluez test if it isn't enabled by PACKAGECONFIG
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 868e051..656895e 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -16,7 +16,7 @@ inherit bluetooth
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
 PACKAGECONFIG[bluez] = "CONFIG+=OE_BLUEZ_ENABLED,,${BLUEZ}"
 
-EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
+EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
 do_configure_prepend() {
     # disable bluez test if it isn't enabled by PACKAGECONFIG
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 8f5276f..c045174 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG[libxslt] = "WEBENGINE_CONFIG+=use_system_libxslt,,libxslt"
 PACKAGECONFIG[speex] = "WEBENGINE_CONFIG+=use_system_speex,,speex"
 PACKAGECONFIG[vpx] = "WEBENGINE_CONFIG+=use_system_vpx,,libvpx"
 
-EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
+EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_x86 = "(.*)"
@@ -75,7 +75,7 @@ do_configure() {
     export CC_host="gcc"
     export CXX_host="g++"
     export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
-    export QMAKE_CACHE_EVAL="${EXTRA_OECONF}"
+    export QMAKE_CACHE_EVAL="${PACKAGECONFIG_CONFARGS}"
 
     # Disable autodetection from sysroot:
     sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g; s/config_srtp:/false:/g; s/config_snappy:/false:/g; s/packagesExist(nss):/false:/g; s/packagesExist(minizip, zlib):/false:/g; s/packagesExist(libwebp,libwebpdemux):/false:/g; s/packagesExist(libxml-2.0,libxslt):/false:/g; s/^ *packagesExist($$package):/false:/g' ${S}/tools/qmake/mkspecs/features/configure.prf
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 04cefad..4e61cca 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG[qtwebchannel] = "OE_QTWEBCHANNEL_ENABLED,,qtwebchannel"
 PACKAGECONFIG[libwebp] = "OE_LIBWEBP_ENABLED,,libwebp"
 
 do_configure_prepend() {
-    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
+    export QMAKE_CACHE_EVAL="CONFIG+=${PACKAGECONFIG_CONFARGS}"
     # disable gstreamer-1.0 test if it isn't enabled by PACKAGECONFIG
     sed -e 's/\s\(packagesExist(".*\<gstreamer-1.0\>.*")\)/ OE_GSTREAMER_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
     # disable gstreamer-0.10 test if it isn't enabled by PACKAGECONFIG
-- 
2.8.1


