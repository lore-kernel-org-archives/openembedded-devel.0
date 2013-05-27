Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id D92FB6A4EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2013 23:43:38 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 232F94B0015
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 01:43:34 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2013 01:43:53 +0200
Message-Id: <1369698233-4500-8-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369698233-4500-1-git-send-email-eric@eukrea.com>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 8/8] qtbase: add option to enable tslib support
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
X-List-Received-Date: Mon, 27 May 2013 23:43:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- the tslib support is not enabled by default and configure doesn't have any option
to active it, so add the option to the build system,
- patch tslib support to get the device from the environment variable
(patch taken from https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/tslib.patch
- provide variable to enable tslib support in a bbappend (disabled by default)
- tested on an i.MX5x target with qt 5.0.2

TODO : test with 5.0, 5.0.1 and _git

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../0001-configure-add-tslib-support.patch         |   78 ++++++++++++++++++++
 ...tslib-device-to-be-read-from-env-variable.patch |   34 +++++++++
 recipes-qt/qt5/qtbase.inc                          |    8 +-
 recipes-qt/qt5/qtbase_5.0.2.bb                     |    2 +
 4 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/qt5/qtbase-5.0.2/0001-configure-add-tslib-support.patch
 create mode 100644 recipes-qt/qt5/qtbase-5.0.2/0001-enables-tslib-device-to-be-read-from-env-variable.patch

diff --git a/recipes-qt/qt5/qtbase-5.0.2/0001-configure-add-tslib-support.patch b/recipes-qt/qt5/qtbase-5.0.2/0001-configure-add-tslib-support.patch
new file mode 100644
index 0000000..3407f60
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-5.0.2/0001-configure-add-tslib-support.patch
@@ -0,0 +1,78 @@
+From b4edefdc1fb5ba67b202fad7df5a8def554d16fd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Mon, 27 May 2013 18:45:03 +0200
+Subject: [PATCH] configure: add tslib support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Eric Bénard <eric@eukrea.com>
+---
+ configure                       | 24 ++++++++++++++++++++++++
+ src/plugins/generic/generic.pro |  4 ++++
+ 2 files changed, 28 insertions(+)
+
+diff --git a/configure b/configure
+index 2ea1ea4..727fed9 100755
+--- a/configure
++++ b/configure
+@@ -810,6 +810,7 @@ CFG_KMS=auto
+ CFG_LIBUDEV=auto
+ CFG_OBSOLETE_WAYLAND=no
+ CFG_EVDEV=auto
++CFG_TSLIB=auto
+ CFG_NIS=auto
+ CFG_CUPS=auto
+ CFG_ICONV=auto
+@@ -1782,6 +1783,13 @@ while [ "$#" -gt 0 ]; do
+             UNKNOWN_OPT=yes
+         fi
+         ;;
++    tslib)
++        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
++            CFG_TSLIB="$VAL"
++        else
++            UNKNOWN_OPT=yes
++        fi
++        ;;
+     cups)
+         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
+             CFG_CUPS="$VAL"
+@@ -4775,6 +4783,22 @@ if [ "$CFG_EVDEV" = "no" ]; then
+     QMakeVar add DEFINES QT_NO_EVDEV
+ fi
+ 
++if [ "$CFG_TSLIB" != "no" ]; then
++    if compileTest unix/tslib "tslib"; then
++        CFG_TSLIB=yes
++        QT_CONFIG="$QT_CONFIG tslib"
++    elif [ "$CFG_TSLIB" = "yes" ]; then
++        echo "The tslib functionality test failed!"
++        exit 1
++    else
++        CFG_TSLIB=no
++    fi
++fi
++if [ "$CFG_TSLIB" = "no" ]; then
++    QMakeVar add DEFINES QT_NO_TSLIB
++fi
++
++
+ # Check we actually have X11 :-)
+ if compileTest x11/xlib "XLib"; then
+     QT_CONFIG="$QT_CONFIG xlib"
+diff --git a/src/plugins/generic/generic.pro b/src/plugins/generic/generic.pro
+index 078db2f..18a8295 100644
+--- a/src/plugins/generic/generic.pro
++++ b/src/plugins/generic/generic.pro
+@@ -5,3 +5,7 @@ TEMPLATE = subdirs
+ contains(QT_CONFIG, evdev) {
+     SUBDIRS += evdevmouse evdevtouch evdevkeyboard evdevtablet
+ }
++
++contains(QT_CONFIG, tslib) {
++    SUBDIRS += tslib
++}
+-- 
+1.8.1.4
+
diff --git a/recipes-qt/qt5/qtbase-5.0.2/0001-enables-tslib-device-to-be-read-from-env-variable.patch b/recipes-qt/qt5/qtbase-5.0.2/0001-enables-tslib-device-to-be-read-from-env-variable.patch
new file mode 100644
index 0000000..77ddcba
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-5.0.2/0001-enables-tslib-device-to-be-read-from-env-variable.patch
@@ -0,0 +1,34 @@
+From cb7d4b978d7b29e3f4ef5dba1ca1319ccd289a0d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Mon, 27 May 2013 18:32:37 +0200
+Subject: [PATCH] enables tslib device to be read from env variable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+from :
+https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/tslib.patch
+
+Signed-off-by: Eric Bénard <eric@eukrea.com>
+---
+ src/plugins/generic/tslib/qtslib.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/plugins/generic/tslib/qtslib.cpp b/src/plugins/generic/tslib/qtslib.cpp
+index 6986fd5..2ed4a69 100644
+--- a/src/plugins/generic/tslib/qtslib.cpp
++++ b/src/plugins/generic/tslib/qtslib.cpp
+@@ -64,7 +64,9 @@ QTsLibMouseHandler::QTsLibMouseHandler(const QString &key,
+     qDebug() << "QTsLibMouseHandler" << key << specification;
+     setObjectName(QLatin1String("TSLib Mouse Handler"));
+ 
+-    QByteArray device = "/dev/input/event1";
++    QByteArray device = qgetenv("TSLIB_TSDEVICE");
++    if(device.isEmpty())
++       device = "/dev/input/event1";
+     if (specification.startsWith("/dev/"))
+         device = specification.toLocal8Bit();
+ 
+-- 
+1.8.1.4
+
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 4b4fb10..12d1a7f 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -15,7 +15,7 @@ SRC_URI += " \
     file://0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
 "
 
-DEPENDS += "qtbase-native freetype jpeg libpng zlib openssl glib-2.0 ${ICU} udev ${XCB_DEPENDS} ${GL_DEPENDS}"
+DEPENDS += "qtbase-native freetype jpeg libpng zlib openssl glib-2.0 ${ICU} udev ${XCB_DEPENDS} ${GL_DEPENDS} ${TSLIB_DEPENDS}"
 
 # to provide xcb/xcb_icccm.h, xcb/xcb_image.h, xcb/xcb_keysyms.h and dbus/dbus.h
 # XCB_DEPENDS += "xcb-util-wm xcb-util-image xcb-util-keysyms dbus"
@@ -40,6 +40,11 @@ QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -p
 GL_DEPENDS ?= "virtual/libgl"
 QT_GLFLAGS ?= "-opengl"
 
+# if you want to enable tslib in your .bbappend, don't forget to add tslib dependencies
+# TSLIB_DEPENDS = "tslib"
+# QT_TSLIB = "-tslib"
+QT_TSLIB ?= "-no-tslib"
+
 QT_XML ?= "-xmlpatterns"
 QT_WEBKIT ?= "-webkit"
 QT_PHONON ?= "-phonon"
@@ -72,6 +77,7 @@ QT_CONFIG_FLAGS += " \
     ${QT_GLFLAGS} \
     ${QT_TESTS} \
     ${QT_EXAMPLES} \
+    ${QT_TSLIB} \
 "
 
 INC_PR = "r1"
diff --git a/recipes-qt/qt5/qtbase_5.0.2.bb b/recipes-qt/qt5/qtbase_5.0.2.bb
index 357c06e..2cd94dd 100644
--- a/recipes-qt/qt5/qtbase_5.0.2.bb
+++ b/recipes-qt/qt5/qtbase_5.0.2.bb
@@ -5,6 +5,8 @@ PR = "${INC_PR}.0"
 
 SRC_URI += "file://0004-Disable-mkv8snapshot.patch \
     file://0001-qtbase-allow-build-of-examples.patch \
+    file://0001-enables-tslib-device-to-be-read-from-env-variable.patch \
+    file://0001-configure-add-tslib-support.patch \
     "
 
 SRC_URI[md5sum] = "a4fec8ed03867c4ee4fe5a46001a11f0"
-- 
1.7.10.4


