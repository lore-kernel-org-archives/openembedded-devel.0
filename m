Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 39227750E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 22:39:20 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id 94-v6so302377wrf.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2018 15:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9TyJ57ftjqfyJ/BV8Ha3nNut9f65EqrlgYw+TLXmLvY=;
	b=Mm2r7iRcwPfvHDbbd+ik1iVYnp04lw0AQNNhRJustaA5RxMEmMGSeQ88PEVYb/4iMH
	iA5l1nRWJu7pHWZlbcy8J4iF5Pmr/iyhhvberGs+RqQlwgY0r/eT+4xnTo/Ht169YYvs
	ZMurxdht0H3tySdGg072ZiAGh82PR41dWqYemgF+vLk2KR2PtHpCvUKHEs521h9pEmq2
	Lsc9nLA1X435+VAfoSjm8vcTS/umYdBi4uFKP/lFYW1Thj4lF5oQf8LyzRj51NcppA1r
	Du83RGT11ogyAF91IZ8exsDltTHetkNju/3p1g5/8qo5Iwv72oqMVNaJ6piT9/VB9yGG
	nVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9TyJ57ftjqfyJ/BV8Ha3nNut9f65EqrlgYw+TLXmLvY=;
	b=Fz85oKjrwt0I0jTslKJduq+KYGK6GEI1Er93KNF2WqUPh4aVJ9alixdVLcF8q0kRyX
	IzjI4PkRbTWj7WctYgzNmEwJeZ5ECWhWNkNYrYaQHrDhgdpvq2bR+EwZgCxREENcxS6q
	Gr3l7TpLIxtaAWSR3i0rEr1eAGzlJb6JTPIuOYIV1RFWOjr6Omhif9Z8tJxnot6ygOP3
	NviBd1cPIp6NENFt6o/FYjVuxPA2i+26gXKtRMgxb66mDB6QiWEU6yN/XpWDAS/POqb7
	2zxtXh+9HP9m391hUljofReP5TAHdLalGgofyYkE6BGxxnWZV4PSDQRa1gosGXux4ilD
	RJ3Q==
X-Gm-Message-State: ALKqPwe0NdbE/PsYDA1lUTQhzOf2EAA/qwHFBxwlMc4QMkplaw3gi2/c
	SK+Z8SdtzVp4YWmGwKmVoZDhIQ==
X-Google-Smtp-Source: ADUXVKLIxQn4AFsU/Gh2o52uNuwER5TqtGTmnFVNySz74T0mP4VIXuR7Z6wwg3vTLbI7EbN2sKM22Q==
X-Received: by 2002:adf:ae59:: with SMTP id
	u25-v6mr17321924wrd.157.1528151960358; 
	Mon, 04 Jun 2018 15:39:20 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BDFF922C7357F7E96A0E4D9.dip0.t-ipconnect.de.
	[2003:f0:7bdf:f922:c735:7f7e:96a0:e4d9])
	by smtp.gmail.com with ESMTPSA id
	g129-v6sm109160wmf.5.2018.06.04.15.39.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Jun 2018 15:39:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jun 2018 00:39:11 +0200
Message-Id: <20180604223911.14561-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtwebkit: do not skip build - use cmake as build system
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
X-List-Received-Date: Mon, 04 Jun 2018 22:39:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

log.do_configure says:

| The WebKit build was disabled for the following reasons:
|     * cross-compilation of QtWebKit with qmake is not supported yet
|    * Missing cmake from PATH
|    * Using cmake version , but at least cmake 2.8.12 is required to build QtWebKit.

and build was finished without errors (but surprisingly fast). Looking into
qtwebkit, it seems they have changed to cmake build system and Webkit.pro is
just a wrapper for preparing and running cmake.

For the transition the packageconfigs were translated as close as possible.
'libxcomposite' and 'libxrender' were merged to 'x11' - there is only one
option 'ENABLE_X11_TARGET' available for both.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Do-not-skip-build-for-cross-compile.patch | 31 +++++++++++++
 recipes-qt/qt5/qtwebkit_git.bb                     | 51 ++++++++++------------
 2 files changed, 54 insertions(+), 28 deletions(-)
 create mode 100644 recipes-qt/qt5/qtwebkit/0001-Do-not-skip-build-for-cross-compile.patch

diff --git a/recipes-qt/qt5/qtwebkit/0001-Do-not-skip-build-for-cross-compile.patch b/recipes-qt/qt5/qtwebkit/0001-Do-not-skip-build-for-cross-compile.patch
new file mode 100644
index 0000000..dac4815
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0001-Do-not-skip-build-for-cross-compile.patch
@@ -0,0 +1,31 @@
+From d9f4d11ffdf1e8b5485aefc3556b1bef3e009587 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 4 Jun 2018 10:35:46 +0200
+Subject: [PATCH] Do not skip build for cross-compile
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ Tools/qmake/mkspecs/features/functions.prf | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Tools/qmake/mkspecs/features/functions.prf b/Tools/qmake/mkspecs/features/functions.prf
+index e3f42cec4..797b7085f 100644
+--- a/Tools/qmake/mkspecs/features/functions.prf
++++ b/Tools/qmake/mkspecs/features/functions.prf
+@@ -53,8 +53,6 @@ defineReplace(appleSdkVersion) {
+ defineTest(isPlatformSupported) {
+     !qtHaveModule(widgets): skipBuild("QtWidgets module is required to build QtWebKit.")
+ 
+-    cross_compile: skipBuild("cross-compilation of QtWebKit with qmake is not supported yet")
+-
+     requiredPrograms = cmake gperf python perl bison ruby flex
+     for(program, requiredPrograms): \
+         !programExistsInPath($$program): \
+-- 
+2.14.3
+
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 36c967f..0cf68ca 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,6 +1,8 @@
 require qt5.inc
 require qt5-git.inc
 
+SRC_URI += "file://0001-Do-not-skip-build-for-cross-compile.patch"
+
 LICENSE = "BSD & LGPLv2+ | GPL-2.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
@@ -9,6 +11,8 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-native"
 
+inherit cmake_qt5 perlnative pythonnative
+
 # qemuarm build fails with:
 # | {standard input}: Assembler messages:
 # | {standard input}:106: Error: invalid immediate: 983040 is out of range
@@ -24,41 +28,32 @@ ARM_INSTRUCTION_SET_armv7a = "thumb"
 ARM_INSTRUCTION_SET_armv7r = "thumb"
 ARM_INSTRUCTION_SET_armv7ve = "thumb"
 
-PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxcomposite libxrender', '', d)} \
-    fontconfig \
+EXTRA_OECMAKE = " \
+    -DPORT=Qt \
+    -DECM_MKSPECS_INSTALL_DIR=${libdir}${QT_DIR_NAME}/mkspecs/modules \
+    -DQML_INSTALL_DIR=${OE_QMAKE_PATH_QML} \
 "
-PACKAGECONFIG[gstreamer] = "OE_GSTREAMER_ENABLED,,gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[gstreamer010] = "OE_GSTREAMER010_ENABLED,,gstreamer gst-plugins-base"
-PACKAGECONFIG[qtlocation] = "OE_QTLOCATION_ENABLED,,qtlocation"
-PACKAGECONFIG[qtmultimedia] = "OE_QTMULTIMEDIA_ENABLED,,qtmultimedia"
-PACKAGECONFIG[qtsensors] = "OE_QTSENSORS_ENABLED,,qtsensors"
-PACKAGECONFIG[qtwebchannel] = "OE_QTWEBCHANNEL_ENABLED,,qtwebchannel"
-PACKAGECONFIG[libwebp] = "OE_LIBWEBP_ENABLED,,libwebp"
-PACKAGECONFIG[libxcomposite] = "OE_LIBXCOMPOSITE_ENABLED,,libxcomposite"
-PACKAGECONFIG[libxrender] = "OE_LIBXRENDER_ENABLED,,libxrender"
-PACKAGECONFIG[fontconfig] = "OE_FONTCONFIG_ENABLED,,fontconfig"
-
-do_configure_prepend() {
-    export QMAKE_CACHE_EVAL="CONFIG+=${PACKAGECONFIG_CONFARGS}"
-}
 
-# Forcibly enable ICU, so qtbase doesn't need it.
-EXTRA_QMAKEVARS_PRE += "QT_CONFIG+=icu"
+PACKAGECONFIG ??= "qtlocation qtmultimedia qtsensors qtwebchannel \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+    fontconfig \
+"
 
-# qtwebkit gets terribly big when linking with all debug info, disable by default
-QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
-EXTRA_QMAKEVARS_PRE += "${QTWEBKIT_DEBUG}"
+# gstreamer conflicts with qtmultimedia!
+PACKAGECONFIG[gstreamer] = "-DUSE_GSTREAMER=ON,-DUSE_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[qtlocation] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,qtlocation"
+PACKAGECONFIG[qtmultimedia] = "-DUSE_QT_MULTIMEDIA=ON,-DUSE_QT_MULTIMEDIA=OFF,qtmultimedia"
+PACKAGECONFIG[qtsensors] = "-DENABLE_DEVICE_ORIENTATION=ON,-DENABLE_DEVICE_ORIENTATION=OFF,qtsensors"
+PACKAGECONFIG[qtwebchannel] = "-DENABLE_QT_WEBCHANNEL=ON,-DENABLE_QT_WEBCHANNEL=OFF,qtwebchannel"
+PACKAGECONFIG[libwebp] = ",,libwebp"
+PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,libxcomposite libxrender"
+PACKAGECONFIG[fontconfig] = "-DENABLE_TEST_SUPPORT=ON,-DENABLE_TEST_SUPPORT=OFF,fontconfig"
+# hyphen is only in meta-office currently!
+PACKAGECONFIG[hyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,hyphen"
 
 # remove default ${PN}-examples* set in qt5.inc, because they conflicts with ${PN} from separate webkit-examples recipe
 PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples"
 
-# make sure rb files are used from sysroot, not from host
-# ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
-# we need to replace it too (a bit longer version without importing re)
-RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
-export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
-
 QT_MODULE_BRANCH = "dev"
 
 SRCREV = "beaeeb99881184fd368c121fcbb1a31c78b794a3"
-- 
2.14.3


