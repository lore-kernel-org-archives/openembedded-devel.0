Received: from [209.85.220.213] (helo=mail-fx0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsfx-0000ej-4V
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:46:49 +0200
Received: by mail-fx0-f213.google.com with SMTP id 9so74430fxm.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=SoBn73cQLbXpcThNkkYCRqfDM7JZ7+iT3x9JTig/kyI=;
	b=RYCt59BA+iUBcqTG0IuxOBPI6T0E3SMFKgv8MjrBr6IDGHlcKLfaz6s19Cdr1qHGNz
	v7PO94PbjT1WSvy06fLi29W62VGChgmSVMRjmcwJCT9vZ176GKtSLUfQcGePnBLuAfdy
	17vbrfN89MVy7/l/fPwa83j8KwwQvYgLGcThM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TQMkG8/Y2cv4sk+KsyWMIfLPScpzgJ6v/XQBtss7xIu5FyYWXRg839EMkINjFrq6dq
	fyVGQLlTsJSZ721TYJvc5bTXKacLnivteWcnmrrVwTXXUxDpxkkCl+iBP22RQ6ufas32
	HMMpQeo80iqxWrYw9gHZQ66PGuaEsCsULOPXE=
Received: by 10.103.215.15 with SMTP id s15mr673280muq.118.1244043471820;
	Wed, 03 Jun 2009 08:37:51 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id j6sm5274082mue.31.2009.06.03.08.37.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:37:51 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:15 +0300
Message-Id: <1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 05/12] qt4-x11-free: generalize recipes, port them to INC_PR
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
X-List-Received-Date: Wed, 03 Jun 2009 15:46:49 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4-x11-free.inc                       |   34 +++++++++++++++++++
 recipes/qt4/qt4-x11-free/0003-no-tools.patch       |   18 ++++++++++
 .../qt4-x11-free/0006-freetype-host-includes.patch |   20 +++++++++++
 .../qt4-x11-free/0007-openssl-host-includes.patch  |   20 +++++++++++
 recipes/qt4/qt4-x11-free/0008-qt-lib-infix.patch   |   34 +++++++++++++++++++
 recipes/qt4/qt4-x11-free_4.4.3.bb                  |   35 ++------------------
 recipes/qt4/qt4-x11-free_4.5.1.bb                  |   33 ++-----------------
 7 files changed, 132 insertions(+), 62 deletions(-)
 create mode 100644 recipes/qt4/qt4-x11-free.inc
 create mode 100644 recipes/qt4/qt4-x11-free/0003-no-tools.patch
 create mode 100644 recipes/qt4/qt4-x11-free/0006-freetype-host-includes.patch
 create mode 100644 recipes/qt4/qt4-x11-free/0007-openssl-host-includes.patch
 create mode 100644 recipes/qt4/qt4-x11-free/0008-qt-lib-infix.patch

diff --git a/recipes/qt4/qt4-x11-free.inc b/recipes/qt4/qt4-x11-free.inc
new file mode 100644
index 0000000..23fa33f
--- /dev/null
+++ b/recipes/qt4/qt4-x11-free.inc
@@ -0,0 +1,34 @@
+DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
+SECTION = "x11/libs"
+PRIORITY = "optional"
+HOMEPAGE = "http://www.trolltech.com"
+LICENSE = "GPL QPL"
+DEPENDS += "virtual/libx11 fontconfig xft libxext libxrender libxrandr libxcursor"
+PROVIDES = "qt4x11"
+
+INC_PR = "r10"
+
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
+           file://0001-cross-compile.patch;patch=1 \
+           file://0002-fix-resinit-declaration.patch;patch=1 \
+           file://0003-no-tools.patch;patch=1 \
+           file://0004-no-qmake.patch;patch=1 \
+           file://0006-freetype-host-includes.patch;patch=1 \
+           file://0007-openssl-host-includes.patch;patch=1 \ 
+           file://0008-qt-lib-infix.patch;patch=1 \
+           file://g++.conf \
+           file://linux.conf \
+           "
+S = "${WORKDIR}/qt-x11-opensource-src-${PV}"
+
+
+QT_CONFIG_FLAGS += "-no-xinerama -no-xkb -no-opengl"
+QT_BASE_NAME = "qt4"
+QT_BASE_LIB  = "libqt"
+QT_DIR_NAME = "qt4"
+QT_LIBINFIX = ""
+
+require qt4.inc
+
+inherit qt4x11
+
diff --git a/recipes/qt4/qt4-x11-free/0003-no-tools.patch b/recipes/qt4/qt4-x11-free/0003-no-tools.patch
new file mode 100644
index 0000000..3829ffc
--- /dev/null
+++ b/recipes/qt4/qt4-x11-free/0003-no-tools.patch
@@ -0,0 +1,18 @@
+Index: qt-embedded-linux-opensource-src-4.5.0/src/src.pro
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.0.orig/src/src.pro	2009-02-25 22:32:41.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/src/src.pro	2009-03-26 17:11:07.000000000 +0100
+@@ -6,12 +6,9 @@
+ wince*:{
+   SRC_SUBDIRS += src_corelib src_xml src_gui src_sql src_network src_script src_testlib
+ } else {
+-    SRC_SUBDIRS += src_tools_bootstrap src_tools_moc src_tools_rcc src_tools_uic src_corelib src_xml src_network src_gui src_sql src_script src_testlib
++    SRC_SUBDIRS += src_corelib src_xml src_network src_gui src_sql src_script src_testlib
+     contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_qt3support
+     contains(QT_CONFIG, dbus):SRC_SUBDIRS += src_dbus
+-    !cross_compile {
+-        contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_tools_uic3
+-    }
+ }
+ win32:!contains(QT_EDITION, OpenSource|Console): {
+     SRC_SUBDIRS += src_activeqt
diff --git a/recipes/qt4/qt4-x11-free/0006-freetype-host-includes.patch b/recipes/qt4/qt4-x11-free/0006-freetype-host-includes.patch
new file mode 100644
index 0000000..987c425
--- /dev/null
+++ b/recipes/qt4/qt4-x11-free/0006-freetype-host-includes.patch
@@ -0,0 +1,20 @@
+From c9ab62bd9a56643574b3ae6e59e0ca776d4860d2 Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 4 Jun 2007 14:48:50 +0200
+Subject: [PATCH] freetype host includes
+
+---
+ config.tests/unix/freetype/freetype.pri |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/freetype/freetype.pri	2009-02-25 22:32:32.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri	2009-03-26 17:14:16.000000000 +0100
+@@ -1,5 +1,5 @@
+ !cross_compile {
+-    TRY_INCLUDEPATHS = /include /usr/include $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
++    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
+     # LSB doesn't allow using headers from /include or /usr/include
+     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
+     for(p, TRY_INCLUDEPATHS) {
diff --git a/recipes/qt4/qt4-x11-free/0007-openssl-host-includes.patch b/recipes/qt4/qt4-x11-free/0007-openssl-host-includes.patch
new file mode 100644
index 0000000..3409cc0
--- /dev/null
+++ b/recipes/qt4/qt4-x11-free/0007-openssl-host-includes.patch
@@ -0,0 +1,20 @@
+From d45943adb443ad4b85ca4504952dee743c675e1e Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 4 Jun 2007 14:58:34 +0200
+Subject: [PATCH] openssl host includes
+
+---
+ config.tests/unix/openssl/openssl.pri |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/openssl/openssl.pri
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/openssl/openssl.pri	2009-02-25 22:32:32.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/openssl/openssl.pri	2009-03-26 17:16:28.000000000 +0100
+@@ -1,5 +1,5 @@
+ !cross_compile {
+-    TRY_INCLUDEPATHS = /include /usr/include /usr/local/include $$QMAKE_INCDIR $$INCLUDEPATH
++    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
+     # LSB doesn't allow using headers from /include or /usr/include
+     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
+     for(p, TRY_INCLUDEPATHS) {
diff --git a/recipes/qt4/qt4-x11-free/0008-qt-lib-infix.patch b/recipes/qt4/qt4-x11-free/0008-qt-lib-infix.patch
new file mode 100644
index 0000000..3efaff3
--- /dev/null
+++ b/recipes/qt4/qt4-x11-free/0008-qt-lib-infix.patch
@@ -0,0 +1,34 @@
+Index: qt-embedded-linux-opensource-src-4.5.0/mkspecs/features/uitools.prf
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.0.orig/mkspecs/features/uitools.prf	2009-02-25 22:32:34.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/mkspecs/features/uitools.prf	2009-03-26 17:17:27.000000000 +0100
+@@ -2,10 +2,10 @@
+ qt:load(qt)
+ 
+ # Include the correct version of the UiLoader library
+-QTUITOOLS_LINKAGE = -lQtUiTools
++QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}
+ CONFIG(debug, debug|release) {
+-    mac: QTUITOOLS_LINKAGE = -lQtUiTools_debug
+-    win32: QTUITOOLS_LINKAGE = -lQtUiToolsd
++    mac: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}_debug
++    win32: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}d
+ }
+ LIBS += $$QTUITOOLS_LINKAGE
+ 
+Index: qt-embedded-linux-opensource-src-4.5.0/tools/designer/src/uitools/uitools.pro
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.0.orig/tools/designer/src/uitools/uitools.pro	2009-02-25 22:32:42.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/tools/designer/src/uitools/uitools.pro	2009-03-26 17:17:27.000000000 +0100
+@@ -1,5 +1,5 @@
+ TEMPLATE = lib
+-TARGET = $$qtLibraryTarget(QtUiTools)
++TARGET = QtUiTools
+ QT += xml
+ CONFIG += qt staticlib
+ DESTDIR = ../../../../lib
+@@ -39,3 +39,4 @@
+    QMAKE_PKGCONFIG_REQUIRES += QtXml
+ }
+ 
++TARGET = $$qtLibraryTarget($$TARGET$$QT_LIBINFIX) #do this towards the end
diff --git a/recipes/qt4/qt4-x11-free_4.4.3.bb b/recipes/qt4/qt4-x11-free_4.4.3.bb
index 08a56a4..a3538c9 100644
--- a/recipes/qt4/qt4-x11-free_4.4.3.bb
+++ b/recipes/qt4/qt4-x11-free_4.4.3.bb
@@ -1,32 +1,3 @@
-DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
-SECTION = "x11/libs"
-PRIORITY = "optional"
-HOMEPAGE = "http://www.trolltech.com"
-LICENSE = "GPL QPL"
-DEPENDS += "virtual/libx11 fontconfig xft libxext libxrender libxrandr libxcursor"
-PROVIDES = "qt4x11"
-PR = "r10"
-
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
-           file://0001-cross-compile.patch;patch=1 \
-           file://0002-fix-resinit-declaration.patch;patch=1 \
-           file://0003-no-tools.patch;patch=1 \
-           file://0004-no-qmake.patch;patch=1 \
-           file://0006-freetype-host-includes.patch;patch=1 \
-           file://0007-openssl-host-includes.patch;patch=1 \ 
-           file://0008-qt-lib-infix.patch;patch=1 \
-           file://g++.conf \
-           file://linux.conf \
-           "
-S = "${WORKDIR}/qt-x11-opensource-src-${PV}"
-
-
-QT_CONFIG_FLAGS += "-no-xinerama -no-tablet -no-xkb -no-opengl"
-QT_BASE_NAME = "qt4"
-QT_BASE_LIB  = "libqt"
-QT_DIR_NAME = "qt4"
-QT_LIBINFIX = ""
-
-require qt4.inc
-
-inherit qt4x11
+include qt4-x11-free.inc
+PR = "${INC_PR}.1"
+QT_CONFIG_FLAGS += "-no-tablet"
diff --git a/recipes/qt4/qt4-x11-free_4.5.1.bb b/recipes/qt4/qt4-x11-free_4.5.1.bb
index af3a7c7..1cc637a 100644
--- a/recipes/qt4/qt4-x11-free_4.5.1.bb
+++ b/recipes/qt4/qt4-x11-free_4.5.1.bb
@@ -1,31 +1,4 @@
-DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
-SECTION = "x11/libs"
-PRIORITY = "optional"
-HOMEPAGE = "http://www.trolltech.com"
-LICENSE = "GPL LGPL QPL"
-DEPENDS += "virtual/libx11 fontconfig xft libxext libxrender libxrandr libxcursor"
-PROVIDES = "qt4x11"
+include qt4-x11-free.inc
+LICENSE += "LGPL"
+PR = "${INC_PR}.1"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
-           file://0001-cross-compile.patch;patch=1 \
-           file://0002-fix-resinit-declaration.patch;patch=1 \
-           file://${PV}/0003-no-tools.patch;patch=1 \
-           file://0004-no-qmake.patch;patch=1 \
-           file://${PV}/0006-freetype-host-includes.patch;patch=1 \
-           file://${PV}/0007-openssl-host-includes.patch;patch=1 \ 
-           file://${PV}/0008-qt-lib-infix.patch;patch=1 \
-           file://g++.conf \
-           file://linux.conf \
-           "
-S = "${WORKDIR}/qt-x11-opensource-src-${PV}"
-
-
-QT_CONFIG_FLAGS += "-no-xinerama -no-xkb -no-opengl"
-QT_BASE_NAME = "qt4"
-QT_BASE_LIB  = "libqt"
-QT_DIR_NAME = "qt4"
-QT_LIBINFIX = ""
-
-require qt4.inc
-
-inherit qt4x11
-- 
1.6.3.1



