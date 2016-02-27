Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 05CDA77383
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 22:04:35 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p65so1700449wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 14:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HagRc8k8pz1yynjvXFiAh+pde3Mc3WTQxAUS9IfpPdQ=;
	b=QKC35hNnLwPzHVJfd7MvQrPjWpznD24NbXU0FsTheEtDm90/yDKyXDpESpWHBV8I1x
	nBfo6eh+3oM8LllhFzzOrI5hDwZ3M5x07yTntW+He+wxHkNGhSJEQ2dSfpgYA3X6ffFd
	YLl556rt5Vq0jnDX26bAHGiO0DhvQ7x3z5l0ML2Ekuey0O4+Xw+Iwi902bm5THtyXPWc
	S4PeuzlhqLAXpPFhQV5lsoUGxfmlQPs6x34Bvn0luszh1MOpMD+D/RbsAlo1lCOKHlAO
	QGWuhpr9jVyHejEyffsh23pUtwTkDdw9IYDzQHEhOYQ5zwArib6yPZGd3gy7ds2dRT09
	zxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HagRc8k8pz1yynjvXFiAh+pde3Mc3WTQxAUS9IfpPdQ=;
	b=YXjG/CTi1GVCaI/o9mTUrhUO6LB8xmYvcRpZFvGFQF2sbnXG4UVnNDWBArjjZA5vdp
	K6Y8I6XIBm4I9kLcX++Mtq3oVL/h944WB5Xzn3C4Uu8T8VrMjUsfFWHUa5c9eIrwqet7
	bdqweF6BYgxRv6NNH3ZRQP10kPSrZMyxVL2yR5RCk6aVcrNx93n21JCoEbsFsv8SJkxz
	YzDJ9E/CHjBeGMhtxdO3Cj+8sCxcKc5DJTXlIZd0W80EeSYJ0RNsRbPXAuvVXz4cIuKg
	AwfVVIRzxfNHzoZXcHbCW8Ycw7gwPO9UtFWkKMqTNt+byiGuiPt3/iUsZcVsk/04Ca01
	JP1w==
X-Gm-Message-State: AD7BkJKNI0KkaOeAJAP2P8o2kyPoqJn5rmbO3UgLQ5zkuGvB8URRegSpxSX3pTY3YDN3ew==
X-Received: by 10.194.112.34 with SMTP id in2mr8676288wjb.160.1456610675957;
	Sat, 27 Feb 2016 14:04:35 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cb2sm18583398wjc.16.2016.02.27.14.04.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Feb 2016 14:04:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Feb 2016 23:06:01 +0100
Message-Id: <1456610761-7337-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-qt5] recipes: use new EXTRA_CONF_PACKAGECONFIG instead of EXTRA_OECONF
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
X-List-Received-Date: Sat, 27 Feb 2016 22:04:36 -0000

* this fixes builds for DISTROs which include no-static-libraries.inc

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
index 5b39a26..a9a7543 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -82,7 +82,7 @@ QT_CONFIG_FLAGS += " \
     -no-pch \
     -no-rpath \
     -pkg-config \
-    ${EXTRA_OECONF} \
+    ${EXTRA_CONF_PACKAGECONFIG} \
 "
 
 # qtbase is exception, as these are used as install path for sysroots
@@ -201,7 +201,7 @@ do_configure() {
         -xplatform linux-oe-g++ \
         ${QT_CONFIG_FLAGS}
 
-    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_CONF_PACKAGECONFIG was ${EXTRA_CONF_PACKAGECONFIG}"
 }
 
 do_install() {
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index a19422b..3d4b678 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -20,7 +20,7 @@ PACKAGECONFIG_class-native ??= "tools-only"
 PACKAGECONFIG_class-nativesdk ??= "tools-only"
 PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
 
-EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
+EXTRA_QMAKEVARS_PRE += "${EXTRA_CONF_PACKAGECONFIG}"
 
 FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.bez \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index be71349..0565136 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -40,7 +40,7 @@ do_generate_qt_config_file() {
     :
 }
 
-EXTRA_OECONF = " \
+EXTRA_CONF_PACKAGECONFIG = " \
     -prefix ${prefix} \
     -sysroot ${STAGING_DIR_NATIVE} \
     -no-gcc-sysroot \
@@ -90,8 +90,8 @@ export OE_QMAKE_AR
 export OE_QMAKE_STRIP
 
 do_configure_prepend() {
-    MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
-    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+    MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${EXTRA_CONF_PACKAGECONFIG} || die "Configuring qt failed. EXTRA_CONF_PACKAGECONFIG was ${EXTRA_CONF_PACKAGECONFIG}"
+    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_CONF_PACKAGECONFIG was ${EXTRA_CONF_PACKAGECONFIG}"
 }
 
 do_install() {
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 1edd750..82d2bc6 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -132,7 +132,7 @@ QT_CONFIG_FLAGS += " \
     -no-pch \
     -no-rpath \
     -pkg-config \
-    ${EXTRA_OECONF} \
+    ${EXTRA_CONF_PACKAGECONFIG} \
 "
 
 do_generate_qt_config_file_append() {
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index fb0b502..82754c9 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -18,7 +18,7 @@ inherit bluetooth
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
 PACKAGECONFIG[bluez] = "CONFIG+=OE_BLUEZ_ENABLED,,${BLUEZ}"
 
-EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
+EXTRA_QMAKEVARS_PRE += "${EXTRA_CONF_PACKAGECONFIG}"
 
 do_configure_prepend() {
     # disable bluez test if it isn't enabled by PACKAGECONFIG
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 868e051..943c006 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -16,7 +16,7 @@ inherit bluetooth
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
 PACKAGECONFIG[bluez] = "CONFIG+=OE_BLUEZ_ENABLED,,${BLUEZ}"
 
-EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
+EXTRA_QMAKEVARS_PRE += "${EXTRA_CONF_PACKAGECONFIG}"
 
 do_configure_prepend() {
     # disable bluez test if it isn't enabled by PACKAGECONFIG
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index b493dfe..af5b9fc 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG[libxslt] = "WEBENGINE_CONFIG+=use_system_libxslt,,libxslt"
 PACKAGECONFIG[speex] = "WEBENGINE_CONFIG+=use_system_speex,,speex"
 PACKAGECONFIG[vpx] = "WEBENGINE_CONFIG+=use_system_vpx,,libvpx"
 
-EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
+EXTRA_QMAKEVARS_PRE += "${EXTRA_CONF_PACKAGECONFIG}"
 
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_x86 = "(.*)"
@@ -77,7 +77,7 @@ do_configure() {
     export CC_host="gcc"
     export CXX_host="g++"
     export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
-    export QMAKE_CACHE_EVAL="${EXTRA_OECONF}"
+    export QMAKE_CACHE_EVAL="${EXTRA_CONF_PACKAGECONFIG}"
 
     # Disable autodetection from sysroot:
     sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g; s/config_srtp:/false:/g; s/config_snappy:/false:/g; s/packagesExist(nss):/false:/g; s/packagesExist(minizip, zlib):/false:/g; s/packagesExist(libwebp,libwebpdemux):/false:/g; s/packagesExist(libxml-2.0,libxslt):/false:/g; s/^ *packagesExist($$package):/false:/g' ${S}/tools/qmake/mkspecs/features/configure.prf
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index ae1a67f..0324c0c 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG[libxrender] = "OE_LIBXRENDER_ENABLED,,libxrender"
 PACKAGECONFIG[fontconfig] = "OE_FONTCONFIG_ENABLED,,fontconfig"
 
 do_configure_prepend() {
-    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
+    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_CONF_PACKAGECONFIG}"
     # disable gstreamer-1.0 test if it isn't enabled by PACKAGECONFIG
     sed -e 's/\s\(packagesExist(".*\<gstreamer-1.0\>.*")\)/ OE_GSTREAMER_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
     # disable gstreamer-0.10 test if it isn't enabled by PACKAGECONFIG
-- 
2.7.1


