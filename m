Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1OL0cM-000332-3K
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 23:09:22 +0200
Received: by mail-fx0-f47.google.com with SMTP id 9so1447079fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 14:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Rgslymtbrry2pTcYuyHFnlDQQIcxu+Z36d5Q84a/ubA=;
	b=ieXfVa76jokg5LxIU605NfaP78M2o5C2Q7F8xnRkD/0+8d3dq0vWkV1d3qeaI8VrTZ
	mfNLuKVSy0ko1Z/DswewEdp4o854EvtorpN1Xgk1qDp1L24V/SUsZmKutoN77OjaPqwm
	+CFc9QIFeU21Ik7Kzdpwlc9xDheAi1yP0R9cA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lZhgGyO2905A1hB5wnS96niOI+AK7zyicKOS4boDZtz/0B5nhRz70vI47gWQQ8lCtG
	okaS+K9GYIf0TaZ7KbBfWO4qwB/GtkTLVo+NAPYSjSR3lCGT+tmawj0/PrFLTyhtys40
	Ey8F6uyXbjnYTZf7T02xaGq5n7JAn7nPdlw10=
Received: by 10.87.47.23 with SMTP id z23mr19704445fgj.28.1275771906256;
	Sat, 05 Jun 2010 14:05:06 -0700 (PDT)
Received: from localhost.localdomain (z0701.wist.uni-linz.ac.at
	[193.171.42.194])
	by mx.google.com with ESMTPS id 9sm3782882fks.26.2010.06.05.14.05.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Jun 2010 14:05:06 -0700 (PDT)
From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Jun 2010 23:04:31 +0200
Message-Id: <1275771871-5163-3-git-send-email-matgnt@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275771871-5163-1-git-send-email-matgnt@gmail.com>
References: <1275771871-5163-1-git-send-email-matgnt@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] qt4: Add qt4-x11-free_4.7.0-beta1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jun 2010 21:09:23 -0000

Several patches to disable not working parts in the beta version:
* tools/assistant
* examples/designer
* examples/dbus-remotecontrolledcar
* examples/help
* examples/declarative
* demos/browser
* demos/qtdemos
* demos/affine

* DEFAULT_PREFERENCE = "-1"
* New Qt Module / Lib "QtDeclarative" added for packaging.
* Qmlviewer named "qml" added to the tools package.
---
 recipes/qt4/qt-4.7.0-beta1.inc                     |   73 ++++++++++++++++++++
 .../0001-Added-Openembedded-crossarch-option.patch |   44 ++++++++++++
 .../0002-Disable-tools-assistant.patch             |   25 +++++++
 .../0003-Disable-examples-designer.patch           |   24 +++++++
 ...isable-exaqmples-dbus-remotecontrolledcar.patch |   26 +++++++
 .../0005-Disable-examples-help.patch               |   25 +++++++
 .../0006-Disable-demos-browser.patch               |   24 +++++++
 .../0007-Disable-demos-qtdemos.patch               |   25 +++++++
 .../0008-Disable-examples-declarative.patch        |   24 +++++++
 .../qt-4.7.0-beta1/0009-Disable-demos-affine.patch |   24 +++++++
 recipes/qt4/qt4-x11-free_4.7.0-beta1.bb            |   14 ++++
 11 files changed, 328 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qt4/qt-4.7.0-beta1.inc
 create mode 100644 recipes/qt4/qt-4.7.0-beta1/0001-Added-Openembedded-crossarch-option.patch
 create mode 100644 recipes/qt4/qt-4.7.0-beta1/0002-Disable-tools-assistant.patch
 create mode 100644 recipes/qt4/qt-4.7.0-beta1/0003-Disable-examples-designer.patch
 create mode 100644 recipes/qt4/qt-4.7.0-beta1/0004-Disable-exaqmples-dbus-remotecontrolledcar.patch
 create mode 100644 recipes/qt4/qt-4.7.0-beta1/0005-Disable-examples-help.patch
 create mode 100644 recipes/qt4/qt-4.7.0-beta1/0006-Disable-demos-browser.patch
 create mode 100644 recipes/qt4/qt-4.7.0-beta1/0007-Disable-demos-qtdemos.patch
 create mode 100644 recipes/qt4/qt-4.7.0-beta1/0008-Disable-examples-declarative.patch
 create mode 100644 recipes/qt4/qt-4.7.0-beta1/0009-Disable-demos-affine.patch
 create mode 100644 recipes/qt4/qt4-x11-free_4.7.0-beta1.bb

diff --git a/recipes/qt4/qt-4.7.0-beta1.inc b/recipes/qt4/qt-4.7.0-beta1.inc
new file mode 100644
index 0000000..c691981
--- /dev/null
+++ b/recipes/qt4/qt-4.7.0-beta1.inc
@@ -0,0 +1,73 @@
+DEFAULT_PREFERENCE = "-1"
+LICENSE = "LGPLv2.1 GPLv3"
+
+FILESPATHPKG .= ":qt-${PV}"
+
+SRC_URI = "\
+	ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+	file://0004-no-qmake.patch \
+	file://hack-out-pg_config.patch \
+	file://0006-freetype-host-includes.patch \
+	file://0001-Added-Openembedded-crossarch-option.patch \
+	file://0002-Disable-tools-assistant.patch \
+	file://0003-Disable-examples-designer.patch \
+	file://0004-Disable-exaqmples-dbus-remotecontrolledcar.patch \
+	file://0005-Disable-examples-help.patch \
+	file://0006-Disable-demos-browser.patch \
+	file://0007-Disable-demos-qtdemos.patch \
+	file://0008-Disable-examples-declarative.patch \
+	file://0009-Disable-demos-affine.patch \
+	file://g++.conf \
+	file://linux.conf \
+           "
+
+S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
+
+QT_LIB_NAMES += "QtDeclarative"
+FILES_${QT_BASE_NAME}-tools                += "${bindir}/qml"
+
+do_configure_prepend() {
+    for pro in $(find ${S} -name "*.pro") ; do
+        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $pro
+    done
+
+    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
+    sed -i \
+    -e /QMAKE_MOC\ /d \
+    -e /QMAKE_UIC\ /d \
+    -e /QMAKE_UIC3\ /d \
+    -e /QMAKE_RCC\ /d \
+    ${S}/configure
+}
+
+do_configure_append() {
+    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makefile
+}
+
+QT_GLFLAGS ?= ""
+QT_CONFIG_FLAGS += " -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
+
+do_compile() {
+    # Fixup missing wsegl header in some SGX SDKs
+    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
+        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/QWSWSEGL/
+    fi
+
+    unset CFLAGS CXXFLAGS
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
+
+    oe_runmake ${EXTRA_ENV}
+}
+
+do_install_append() {
+	install -d ${D}${bindir}
+	for i in rcc uic moc ; do
+		install -m 0755 ${S}/bin/$i ${D}${bindir}/
+	done
+}
+
+SRC_URI[md5sum] = "128dae41b23bb427b735548c7864703a"
+SRC_URI[sha256sum] = "1107de986e4dda7795d094a2a3b5d85027d780b9b63e9860957cb1d6c56c8929"
diff --git a/recipes/qt4/qt-4.7.0-beta1/0001-Added-Openembedded-crossarch-option.patch b/recipes/qt4/qt-4.7.0-beta1/0001-Added-Openembedded-crossarch-option.patch
new file mode 100644
index 0000000..71a04a5
--- /dev/null
+++ b/recipes/qt4/qt-4.7.0-beta1/0001-Added-Openembedded-crossarch-option.patch
@@ -0,0 +1,44 @@
+From b1ba119f6a824dc01bd42ee00dba4a1653867b72 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
+Date: Wed, 12 May 2010 16:52:45 +0200
+Subject: [PATCH 1/9] Added Openembedded "-crossarch" option
+
+---
+ configure |    7 ++++++-
+ 1 files changed, 6 insertions(+), 1 deletions(-)
+
+diff --git a/configure b/configure
+index facd192..9d15136 100755
+--- a/configure
++++ b/configure
+@@ -954,7 +954,7 @@ while [ "$#" -gt 0 ]; do
+         shift
+         VAL=$1
+         ;;
+-    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config)
++    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-crossarch)
+         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
+         shift
+         VAL="$1"
+@@ -1443,6 +1443,9 @@ while [ "$#" -gt 0 ]; do
+     xplatform)
+         XPLATFORM="$VAL"
+         ;;
++	crossarch)
++		CROSSARCH="$VAL"
++		;;
+     debug-and-release)
+         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
+             CFG_DEBUG_RELEASE="$VAL"
+@@ -2918,6 +2921,8 @@ elif [ "$PLATFORM_MAC" = "yes" ] || [ -z "$CFG_ARCH" ]; then
+     CFG_ARCH=$CFG_HOST_ARCH
+ fi
+ 
++CFG_ARCH="$CROSSARCH"
++
+ if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
+     if [ "$OPT_VERBOSE" = "yes" ]; then
+         echo "    '$CFG_ARCH' is supported"
+-- 
+1.7.0.4
+
diff --git a/recipes/qt4/qt-4.7.0-beta1/0002-Disable-tools-assistant.patch b/recipes/qt4/qt-4.7.0-beta1/0002-Disable-tools-assistant.patch
new file mode 100644
index 0000000..1a5da67
--- /dev/null
+++ b/recipes/qt4/qt-4.7.0-beta1/0002-Disable-tools-assistant.patch
@@ -0,0 +1,25 @@
+From f107d9957f8382dfc2c7b28248eee2d628342a93 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
+Date: Wed, 12 May 2010 19:41:13 +0200
+Subject: [PATCH 2/9] Disable tools/assistant
+
+---
+ tools/tools.pro |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/tools/tools.pro b/tools/tools.pro
+index 7598962..1d35a3f 100644
+--- a/tools/tools.pro
++++ b/tools/tools.pro
+@@ -9,7 +9,7 @@ TEMPLATE        = subdirs
+         } else:wince* {
+             SUBDIRS = qtestlib designer
+         } else {
+-            SUBDIRS = assistant \
++            SUBDIRS = \
+                       pixeltool \
+                       porting \
+                       qtestlib \
+-- 
+1.7.0.4
+
diff --git a/recipes/qt4/qt-4.7.0-beta1/0003-Disable-examples-designer.patch b/recipes/qt4/qt-4.7.0-beta1/0003-Disable-examples-designer.patch
new file mode 100644
index 0000000..51fa4a6
--- /dev/null
+++ b/recipes/qt4/qt-4.7.0-beta1/0003-Disable-examples-designer.patch
@@ -0,0 +1,24 @@
+From 82aaf21a465d0d693916c4b82932371a090482a7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
+Date: Wed, 12 May 2010 20:33:11 +0200
+Subject: [PATCH 3/9] Disable examples/designer
+
+---
+ examples/examples.pro |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/examples/examples.pro b/examples/examples.pro
+index 43cad55..785c35c 100644
+--- a/examples/examples.pro
++++ b/examples/examples.pro
+@@ -53,7 +53,6 @@ contains(QT_CONFIG, script): SUBDIRS += script
+ contains(QT_CONFIG, phonon):!static: SUBDIRS += phonon
+ embedded:SUBDIRS += qws
+ !wince*:!symbian: {
+-    !contains(QT_EDITION, Console):!contains(QT_CONFIG, no-gui):contains(QT_BUILD_PARTS, tools):SUBDIRS += designer
+     contains(QT_BUILD_PARTS, tools):!contains(QT_CONFIG, no-gui):SUBDIRS += qtestlib help
+ } else {
+     contains(QT_BUILD_PARTS, tools):!contains(QT_CONFIG, no-gui):SUBDIRS += qtestlib
+-- 
+1.7.0.4
+
diff --git a/recipes/qt4/qt-4.7.0-beta1/0004-Disable-exaqmples-dbus-remotecontrolledcar.patch b/recipes/qt4/qt-4.7.0-beta1/0004-Disable-exaqmples-dbus-remotecontrolledcar.patch
new file mode 100644
index 0000000..cef56ef
--- /dev/null
+++ b/recipes/qt4/qt-4.7.0-beta1/0004-Disable-exaqmples-dbus-remotecontrolledcar.patch
@@ -0,0 +1,26 @@
+From 753cc5766d51c5b7d599fada569d6b262f2a3b1a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
+Date: Wed, 12 May 2010 20:49:30 +0200
+Subject: [PATCH 4/9] Disable exaqmples/dbus/remotecontrolledcar
+
+---
+ examples/dbus/dbus.pro |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/examples/dbus/dbus.pro b/examples/dbus/dbus.pro
+index e599334..daa89b0 100644
+--- a/examples/dbus/dbus.pro
++++ b/examples/dbus/dbus.pro
+@@ -4,8 +4,7 @@ SUBDIRS = listnames \
+ 	  complexpingpong
+ 
+ !contains(QT_CONFIG, no-gui) {
+-    SUBDIRS += dbus-chat \
+-               remotecontrolledcar
++    SUBDIRS += dbus-chat
+ }
+ 
+ # install
+-- 
+1.7.0.4
+
diff --git a/recipes/qt4/qt-4.7.0-beta1/0005-Disable-examples-help.patch b/recipes/qt4/qt-4.7.0-beta1/0005-Disable-examples-help.patch
new file mode 100644
index 0000000..026f2b0
--- /dev/null
+++ b/recipes/qt4/qt-4.7.0-beta1/0005-Disable-examples-help.patch
@@ -0,0 +1,25 @@
+From c7f749b564b473f0160a201c769153cfcaf3bc0b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
+Date: Thu, 13 May 2010 14:27:22 +0200
+Subject: [PATCH 5/9] Disable examples/help
+
+---
+ examples/examples.pro |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/examples/examples.pro b/examples/examples.pro
+index 785c35c..e37f580 100644
+--- a/examples/examples.pro
++++ b/examples/examples.pro
+@@ -53,7 +53,7 @@ contains(QT_CONFIG, script): SUBDIRS += script
+ contains(QT_CONFIG, phonon):!static: SUBDIRS += phonon
+ embedded:SUBDIRS += qws
+ !wince*:!symbian: {
+-    contains(QT_BUILD_PARTS, tools):!contains(QT_CONFIG, no-gui):SUBDIRS += qtestlib help
++    contains(QT_BUILD_PARTS, tools):!contains(QT_CONFIG, no-gui):SUBDIRS += qtestlib
+ } else {
+     contains(QT_BUILD_PARTS, tools):!contains(QT_CONFIG, no-gui):SUBDIRS += qtestlib
+ }
+-- 
+1.7.0.4
+
diff --git a/recipes/qt4/qt-4.7.0-beta1/0006-Disable-demos-browser.patch b/recipes/qt4/qt-4.7.0-beta1/0006-Disable-demos-browser.patch
new file mode 100644
index 0000000..e863f12
--- /dev/null
+++ b/recipes/qt4/qt-4.7.0-beta1/0006-Disable-demos-browser.patch
@@ -0,0 +1,24 @@
+From 11657d8c4b964b7c16b1d216522a92d6280007e1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
+Date: Thu, 13 May 2010 15:53:29 +0200
+Subject: [PATCH 6/9] Disable /demos/browser
+
+---
+ demos/demos.pro |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/demos/demos.pro b/demos/demos.pro
+index 5e8a4ea..8008ccb 100644
+--- a/demos/demos.pro
++++ b/demos/demos.pro
+@@ -56,7 +56,6 @@ wince*:SUBDIRS += demos_sqlbrowser
+ }
+ }
+ contains(QT_CONFIG, phonon):!static:SUBDIRS += demos_mediaplayer
+-contains(QT_CONFIG, webkit):contains(QT_CONFIG, svg):!symbian:SUBDIRS += demos_browser
+ contains(QT_CONFIG, multimedia):SUBDIRS += demos_multimedia
+ contains(QT_CONFIG, declarative):SUBDIRS += demos_declarative
+ 
+-- 
+1.7.0.4
+
diff --git a/recipes/qt4/qt-4.7.0-beta1/0007-Disable-demos-qtdemos.patch b/recipes/qt4/qt-4.7.0-beta1/0007-Disable-demos-qtdemos.patch
new file mode 100644
index 0000000..6bef4c2
--- /dev/null
+++ b/recipes/qt4/qt-4.7.0-beta1/0007-Disable-demos-qtdemos.patch
@@ -0,0 +1,25 @@
+From 6a4b829736399fef4a6f1d3223cf0d813caf7062 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
+Date: Thu, 13 May 2010 16:00:06 +0200
+Subject: [PATCH 7/9] Disable demos/qtdemos
+
+---
+ demos/demos.pro |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/demos/demos.pro b/demos/demos.pro
+index 8008ccb..a0691bc 100644
+--- a/demos/demos.pro
++++ b/demos/demos.pro
+@@ -51,7 +51,7 @@ wince*|symbian|embedded|x11: SUBDIRS += demos_embedded
+ 
+ !cross_compile:{
+ contains(QT_BUILD_PARTS, tools):{
+-!wince*:SUBDIRS += demos_sqlbrowser demos_qtdemo
++!wince*:SUBDIRS += demos_sqlbrowser
+ wince*:SUBDIRS += demos_sqlbrowser
+ }
+ }
+-- 
+1.7.0.4
+
diff --git a/recipes/qt4/qt-4.7.0-beta1/0008-Disable-examples-declarative.patch b/recipes/qt4/qt-4.7.0-beta1/0008-Disable-examples-declarative.patch
new file mode 100644
index 0000000..06e1562
--- /dev/null
+++ b/recipes/qt4/qt-4.7.0-beta1/0008-Disable-examples-declarative.patch
@@ -0,0 +1,24 @@
+From 1b855a946a1d060c52ddb04f308fb25f1d391b6a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
+Date: Thu, 13 May 2010 19:49:45 +0200
+Subject: [PATCH 8/9] Disable examples/declarative
+
+---
+ examples/examples.pro |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/examples/examples.pro b/examples/examples.pro
+index e37f580..8681a41 100644
+--- a/examples/examples.pro
++++ b/examples/examples.pro
+@@ -60,7 +60,6 @@ embedded:SUBDIRS += qws
+ contains(QT_CONFIG, opengl): SUBDIRS += opengl
+ contains(QT_CONFIG, openvg): SUBDIRS += openvg
+ contains(QT_CONFIG, dbus): SUBDIRS += dbus
+-contains(QT_CONFIG, declarative): SUBDIRS += declarative
+ win32: SUBDIRS += activeqt
+ contains(QT_CONFIG, xmlpatterns):!contains(QT_CONFIG, no-gui): SUBDIRS += xmlpatterns
+ contains(DEFINES, QT_NO_CURSOR): SUBDIRS -= mainwindows
+-- 
+1.7.0.4
+
diff --git a/recipes/qt4/qt-4.7.0-beta1/0009-Disable-demos-affine.patch b/recipes/qt4/qt-4.7.0-beta1/0009-Disable-demos-affine.patch
new file mode 100644
index 0000000..c4efdda
--- /dev/null
+++ b/recipes/qt4/qt-4.7.0-beta1/0009-Disable-demos-affine.patch
@@ -0,0 +1,24 @@
+From ab87c21fab1b2bb3e593a27e4a08ba66e689f724 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
+Date: Thu, 13 May 2010 20:46:18 +0200
+Subject: [PATCH 9/9] Disable demos/affine
+
+---
+ demos/demos.pro |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/demos/demos.pro b/demos/demos.pro
+index a0691bc..082a77d 100644
+--- a/demos/demos.pro
++++ b/demos/demos.pro
+@@ -6,7 +6,6 @@ SUBDIRS     = \
+             demos_deform \
+             demos_gradients \
+             demos_pathstroke \
+-            demos_affine \
+             demos_composition \
+             demos_books \
+             demos_interview \
+-- 
+1.7.0.4
+
diff --git a/recipes/qt4/qt4-x11-free_4.7.0-beta1.bb b/recipes/qt4/qt4-x11-free_4.7.0-beta1.bb
new file mode 100644
index 0000000..250d4cc
--- /dev/null
+++ b/recipes/qt4/qt4-x11-free_4.7.0-beta1.bb
@@ -0,0 +1,14 @@
+DEFAULT_PREFERENCE = "-1"
+
+require qt4-x11-free.inc
+PR = "${INC_PR}.0"
+
+QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+
+require qt-${PV}.inc
+
+QT_CONFIG_FLAGS += " \
+ -no-embedded \
+ -xrandr \
+ -x11"
+
-- 
1.7.0.4



