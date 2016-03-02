Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 58035755F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 10:18:15 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l68so70725509wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 02:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pgQrTF9mEwqlLC8KormImj+RidQaiyWLPcNuLYOsS50=;
	b=YjrA4m7268TARD+WfrMMGoitHqYMp9+9vPZpehup2otdGu3cxd3HrS3FqF0SJmmRJI
	/2tCtLlvaSRmt4W6GzBoYhFuy1jHsPB5YfOU+Q0xiCKKA7FWJx8VrrSFWx8gbE3MDOYI
	Pr5hOQaI07Qddl+hzuf27LULvM3qWKgYAFVc1/dALSAeilMrdw9tKhPCXqm7nH41ajkL
	eUyQCcFwt83dHPwu4KabgdR8rAB/0tfIqYq4ca7qJS5ljIpVVketgGWmuoYAD4EmPIQR
	muvoFFGfXzf6KdduY8WkbGB9MUJSNLVrfhgTqew4CsNFfO1XKNvu2fvOOIpFmiheFO4Q
	ujeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pgQrTF9mEwqlLC8KormImj+RidQaiyWLPcNuLYOsS50=;
	b=QJuuUAswknRyjoBcyC2N8k4JhajSjnOPwDNh34S0bAzsj78KO5HzuO73US3sUC4Rsy
	T8jh2ctQThOvJ3xJ+xgdWx0wByR1GSiVyVSjQ/ccyM5XvCbUc8uCSEraSXedbGZAc3vf
	qstcUV+mtiMd7WGUGsh4ixokICkjxcaxUm+kX9tyr1cPTg+15Noa6UqDEPI3g7kTUebq
	K2xlnbJFstBBYAroLeDFGbzy/A6FFuua7sXIUaeJT+kjsvS9ygNNKsk52iOfsS3KyC6k
	7O6VpwGZ4vUbEYprLvf7ICf9aFKfhea5Rkj0L0e0xUt+x58FpoZoLgCUxme/C6hcZ/5g
	FCew==
X-Gm-Message-State: AD7BkJL8nNQOS5T0NJ50vrdDqVXckn+vUUnlzEXIHFQDjp/wUVWHy3bgBIVsI6nWlFy4Ig==
X-Received: by 10.195.12.42 with SMTP id en10mr24825910wjd.13.1456913895545;
	Wed, 02 Mar 2016 02:18:15 -0800 (PST)
Received: from localhost ([86.49.34.37]) by smtp.gmail.com with ESMTPSA id
	m6sm35054226wje.21.2016.03.02.02.18.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 02:18:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2016 11:20:08 +0100
Message-Id: <1456914009-19771-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCHv2][meta-qt5 1/2] recipes: use new EXTRA_CONF_PACKAGECONFIG instead of EXTRA_OECONF
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
X-List-Received-Date: Wed, 02 Mar 2016 10:18:15 -0000

* this fixes builds for DISTROs which include no-static-libraries.inc
* this change depends on oe-core change:
  http://patchwork.openembedded.org/patch/116719/
  which will probably be merged in Yocto 2.1, if you want to use
  latest meta-qt5 with older oe-core you need to append
  EXTRA_OECONF to EXTRA_CONF_PACKAGECONFIG

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
index 35d922e..606078a 100644
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
index 057edd4..a05f07e 100644
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
index bf56741..f9ca1b9 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -135,7 +135,7 @@ QT_CONFIG_FLAGS += " \
     -no-pch \
     -no-rpath \
     -pkg-config \
-    ${EXTRA_OECONF} \
+    ${EXTRA_CONF_PACKAGECONFIG} \
 "
 
 do_generate_qt_config_file_append() {
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index cf6d3c5..6ce1c18 100644
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
index d2975ef..47486e2 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG[libxslt] = "WEBENGINE_CONFIG+=use_system_libxslt,,libxslt"
 PACKAGECONFIG[speex] = "WEBENGINE_CONFIG+=use_system_speex,,speex"
 PACKAGECONFIG[vpx] = "WEBENGINE_CONFIG+=use_system_vpx,,libvpx"
 
-EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
+EXTRA_QMAKEVARS_PRE += "${EXTRA_CONF_PACKAGECONFIG}"
 
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_x86 = "(.*)"
@@ -74,7 +74,7 @@ do_configure() {
     export CC_host="gcc"
     export CXX_host="g++"
     export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
-    export QMAKE_CACHE_EVAL="${EXTRA_OECONF}"
+    export QMAKE_CACHE_EVAL="${EXTRA_CONF_PACKAGECONFIG}"
 
     # Disable autodetection from sysroot:
     sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g; s/config_srtp:/false:/g; s/config_snappy:/false:/g; s/packagesExist(nss):/false:/g; s/packagesExist(minizip, zlib):/false:/g; s/packagesExist(libwebp,libwebpdemux):/false:/g; s/packagesExist(libxml-2.0,libxslt):/false:/g; s/^ *packagesExist($$package):/false:/g' ${S}/tools/qmake/mkspecs/features/configure.prf
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 04cefad..79f830d 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG[qtwebchannel] = "OE_QTWEBCHANNEL_ENABLED,,qtwebchannel"
 PACKAGECONFIG[libwebp] = "OE_LIBWEBP_ENABLED,,libwebp"
 
 do_configure_prepend() {
-    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
+    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_CONF_PACKAGECONFIG}"
     # disable gstreamer-1.0 test if it isn't enabled by PACKAGECONFIG
     sed -e 's/\s\(packagesExist(".*\<gstreamer-1.0\>.*")\)/ OE_GSTREAMER_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
     # disable gstreamer-0.10 test if it isn't enabled by PACKAGECONFIG
-- 
2.7.2


