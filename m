Received: from [209.85.218.228] (helo=mail-bw0-f228.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MMHch-0000Qx-Nc
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 10:26:27 +0200
Received: by bwz28 with SMTP id 28so798606bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jul 2009 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=nmZGVO4LWuha/2y5RZmXD9BZiCp6yQ7OnWOhcXa0jEs=;
	b=IKOdsKwvYoN1+WgTDdfFDMOfR1EmXEiIF48f+RTmwoYERQYU/ZWTTzAWpOfEqQlG8A
	eEmY6jh5IA7LdYgpvWQubYNH9AHDDVsijUS0fKK3tIFuVvSEnRAL9lVTqkkSKMhAWFxt
	xeSzZ8STHyqidHMEpmNfOfTgts3VixS0TUUBs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=psgRjzxIKVuxF45uGnHQc0yTN9bXeiqP6To1N9F1naY2uFfUfhLrxBEy6kbupZLkS2
	h6g3ufus8Cmy0ogISDu3xenJ7mz5hAFDpE5kLY2PGXaqVhrpy3bTkdmHkpBE33waOEFY
	oUtdRaavYX7RvwkOA2UnkvOV0nuFpDXfWg4J4=
Received: by 10.103.121.19 with SMTP id y19mr6141720mum.103.1246522465804;
	Thu, 02 Jul 2009 01:14:25 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id e9sm10144043muf.2.2009.07.02.01.14.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Jul 2009 01:14:25 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jul 2009 11:14:18 +0300
Message-Id: <1246522458-18500-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] qt4: updated version to 4.5.2.
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
X-List-Received-Date: Thu, 02 Jul 2009 08:26:28 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/checksums.ini                                 |    8 ++
 recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch |   18 -----
 .../0006-freetype-host-includes.patch              |   20 ------
 .../0007-openssl-host-includes.patch               |   20 ------
 .../qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch |   34 ---------
 .../0010-no-simpledecoration-example.patch         |    9 ---
 recipes/qt4/qt4-embedded-4.5.2/0003-no-tools.patch |   18 +++++
 .../0006-freetype-host-includes.patch              |   20 ++++++
 .../0007-openssl-host-includes.patch               |   20 ++++++
 .../qt4/qt4-embedded-4.5.2/0008-qt-lib-infix.patch |   34 +++++++++
 .../0010-no-simpledecoration-example.patch         |    9 +++
 recipes/qt4/qt4-embedded_4.5.1.bb                  |    6 --
 recipes/qt4/qt4-embedded_4.5.2.bb                  |    6 ++
 recipes/qt4/qt4-tools-native_4.5.1.bb              |    4 -
 recipes/qt4/qt4-tools-native_4.5.2.bb              |    4 +
 recipes/qt4/qt4-tools-sdk_4.5.1.bb                 |   72 --------------------
 recipes/qt4/qt4-tools-sdk_4.5.2.bb                 |   72 ++++++++++++++++++++
 recipes/qt4/qt4-x11-free_4.5.1.bb                  |    4 -
 recipes/qt4/qt4-x11-free_4.5.2.bb                  |    4 +
 19 files changed, 195 insertions(+), 187 deletions(-)
 delete mode 100644 recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch
 delete mode 100644 recipes/qt4/qt4-embedded-4.5.1/0006-freetype-host-includes.patch
 delete mode 100644 recipes/qt4/qt4-embedded-4.5.1/0007-openssl-host-includes.patch
 delete mode 100644 recipes/qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch
 delete mode 100644 recipes/qt4/qt4-embedded-4.5.1/0010-no-simpledecoration-example.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.5.2/0003-no-tools.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.5.2/0006-freetype-host-includes.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.5.2/0007-openssl-host-includes.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.5.2/0008-qt-lib-infix.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.5.2/0010-no-simpledecoration-example.patch
 delete mode 100644 recipes/qt4/qt4-embedded_4.5.1.bb
 create mode 100644 recipes/qt4/qt4-embedded_4.5.2.bb
 delete mode 100644 recipes/qt4/qt4-tools-native_4.5.1.bb
 create mode 100644 recipes/qt4/qt4-tools-native_4.5.2.bb
 delete mode 100644 recipes/qt4/qt4-tools-sdk_4.5.1.bb
 create mode 100644 recipes/qt4/qt4-tools-sdk_4.5.2.bb
 delete mode 100644 recipes/qt4/qt4-x11-free_4.5.1.bb
 create mode 100644 recipes/qt4/qt4-x11-free_4.5.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index b2027d4..f1ae3f9 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -20754,6 +20754,10 @@ sha256=4f6319c6031af47ef81fef08f465e4db61c0f169f5eb9bbc8f060cc3db3ffafa
 md5=43e7384c59625af0830032348f672a1d
 sha256=f525ad885675f4c2413d67d9a5efaf7c34862d88c796fe7e7e2d05a42a1a66c8
 
+[ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-4.5.2.tar.bz2]
+md5=62186345c609a72b89f16d83bc7a130f
+sha256=272301a27e2f7bcd44c8d09f496e1c749c80b86d9489ea9c30bb265bf2dd02fc
+
 [ftp://ftp.trolltech.com/qt/source/qt-x11-free-3.3.5.tar.bz2]
 md5=05d04688c0c0230ed54e89102d689ca4
 sha256=aac89e862c74b2f3ead768e50e9fa7ada1e4225fe9d1d9e05723a3279259eb96
@@ -20810,6 +20814,10 @@ sha256=61831af6b71c7bd4e1ef542071225835d8c741fa8e079bceab8c83f712e396a1
 md5=f81a94e2ab7713b2d375d4e5cfc8e051
 sha256=aa3f5a459d042681a321f33e8d99468337a00674d68b8a512e0078625c1f51da
 
+[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.5.2.tar.gz]
+md5=d8bcc070a58db25c228b7729ffad4550
+sha256=4e4c8619335cac14ba0c52d1555fab549a562fb774c1c08dcbd2be9de38120a2
+
 [ftp://ftp.trolltech.com/qt/source/qtopia-core-opensource-src-4.2.0.tar.gz]
 md5=9519eccf0638c9962f73a7b20da77e0e
 sha256=8fdbc7da376b22796879d6e3b756f71a8800ed1b35fc88aa76cddffd6f1fd883
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch b/recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch
deleted file mode 100644
index 3829ffc..0000000
--- a/recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Index: qt-embedded-linux-opensource-src-4.5.0/src/src.pro
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/src/src.pro	2009-02-25 22:32:41.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/src/src.pro	2009-03-26 17:11:07.000000000 +0100
-@@ -6,12 +6,9 @@
- wince*:{
-   SRC_SUBDIRS += src_corelib src_xml src_gui src_sql src_network src_script src_testlib
- } else {
--    SRC_SUBDIRS += src_tools_bootstrap src_tools_moc src_tools_rcc src_tools_uic src_corelib src_xml src_network src_gui src_sql src_script src_testlib
-+    SRC_SUBDIRS += src_corelib src_xml src_network src_gui src_sql src_script src_testlib
-     contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_qt3support
-     contains(QT_CONFIG, dbus):SRC_SUBDIRS += src_dbus
--    !cross_compile {
--        contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_tools_uic3
--    }
- }
- win32:!contains(QT_EDITION, OpenSource|Console): {
-     SRC_SUBDIRS += src_activeqt
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0006-freetype-host-includes.patch b/recipes/qt4/qt4-embedded-4.5.1/0006-freetype-host-includes.patch
deleted file mode 100644
index 987c425..0000000
--- a/recipes/qt4/qt4-embedded-4.5.1/0006-freetype-host-includes.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From c9ab62bd9a56643574b3ae6e59e0ca776d4860d2 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 4 Jun 2007 14:48:50 +0200
-Subject: [PATCH] freetype host includes
-
----
- config.tests/unix/freetype/freetype.pri |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/freetype/freetype.pri	2009-02-25 22:32:32.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri	2009-03-26 17:14:16.000000000 +0100
-@@ -1,5 +1,5 @@
- !cross_compile {
--    TRY_INCLUDEPATHS = /include /usr/include $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-+    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-     # LSB doesn't allow using headers from /include or /usr/include
-     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-     for(p, TRY_INCLUDEPATHS) {
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0007-openssl-host-includes.patch b/recipes/qt4/qt4-embedded-4.5.1/0007-openssl-host-includes.patch
deleted file mode 100644
index 3409cc0..0000000
--- a/recipes/qt4/qt4-embedded-4.5.1/0007-openssl-host-includes.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From d45943adb443ad4b85ca4504952dee743c675e1e Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 4 Jun 2007 14:58:34 +0200
-Subject: [PATCH] openssl host includes
-
----
- config.tests/unix/openssl/openssl.pri |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/openssl/openssl.pri
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/openssl/openssl.pri	2009-02-25 22:32:32.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/openssl/openssl.pri	2009-03-26 17:16:28.000000000 +0100
-@@ -1,5 +1,5 @@
- !cross_compile {
--    TRY_INCLUDEPATHS = /include /usr/include /usr/local/include $$QMAKE_INCDIR $$INCLUDEPATH
-+    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
-     # LSB doesn't allow using headers from /include or /usr/include
-     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
-     for(p, TRY_INCLUDEPATHS) {
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch b/recipes/qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch
deleted file mode 100644
index 3efaff3..0000000
--- a/recipes/qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Index: qt-embedded-linux-opensource-src-4.5.0/mkspecs/features/uitools.prf
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/mkspecs/features/uitools.prf	2009-02-25 22:32:34.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/mkspecs/features/uitools.prf	2009-03-26 17:17:27.000000000 +0100
-@@ -2,10 +2,10 @@
- qt:load(qt)
- 
- # Include the correct version of the UiLoader library
--QTUITOOLS_LINKAGE = -lQtUiTools
-+QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}
- CONFIG(debug, debug|release) {
--    mac: QTUITOOLS_LINKAGE = -lQtUiTools_debug
--    win32: QTUITOOLS_LINKAGE = -lQtUiToolsd
-+    mac: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}_debug
-+    win32: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}d
- }
- LIBS += $$QTUITOOLS_LINKAGE
- 
-Index: qt-embedded-linux-opensource-src-4.5.0/tools/designer/src/uitools/uitools.pro
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/tools/designer/src/uitools/uitools.pro	2009-02-25 22:32:42.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/tools/designer/src/uitools/uitools.pro	2009-03-26 17:17:27.000000000 +0100
-@@ -1,5 +1,5 @@
- TEMPLATE = lib
--TARGET = $$qtLibraryTarget(QtUiTools)
-+TARGET = QtUiTools
- QT += xml
- CONFIG += qt staticlib
- DESTDIR = ../../../../lib
-@@ -39,3 +39,4 @@
-    QMAKE_PKGCONFIG_REQUIRES += QtXml
- }
- 
-+TARGET = $$qtLibraryTarget($$TARGET$$QT_LIBINFIX) #do this towards the end
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0010-no-simpledecoration-example.patch b/recipes/qt4/qt4-embedded-4.5.1/0010-no-simpledecoration-example.patch
deleted file mode 100644
index 070b4ac..0000000
--- a/recipes/qt4/qt4-embedded-4.5.1/0010-no-simpledecoration-example.patch
+++ /dev/null
@@ -1,9 +0,0 @@
---- qt-embedded-linux-opensource-src-4.5.0.orig/examples/qws/qws.pro	2009-02-25 22:32:34.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/examples/qws/qws.pro	2009-03-26 19:53:19.000000000 +0100
-@@ -1,5 +1,5 @@
- TEMPLATE      = subdirs
--SUBDIRS       = framebuffer mousecalibration simpledecoration
-+SUBDIRS       = framebuffer mousecalibration
- 
- # install
- sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS README *.pro
diff --git a/recipes/qt4/qt4-embedded-4.5.2/0003-no-tools.patch b/recipes/qt4/qt4-embedded-4.5.2/0003-no-tools.patch
new file mode 100644
index 0000000..3829ffc
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.5.2/0003-no-tools.patch
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
diff --git a/recipes/qt4/qt4-embedded-4.5.2/0006-freetype-host-includes.patch b/recipes/qt4/qt4-embedded-4.5.2/0006-freetype-host-includes.patch
new file mode 100644
index 0000000..987c425
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.5.2/0006-freetype-host-includes.patch
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
diff --git a/recipes/qt4/qt4-embedded-4.5.2/0007-openssl-host-includes.patch b/recipes/qt4/qt4-embedded-4.5.2/0007-openssl-host-includes.patch
new file mode 100644
index 0000000..3409cc0
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.5.2/0007-openssl-host-includes.patch
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
diff --git a/recipes/qt4/qt4-embedded-4.5.2/0008-qt-lib-infix.patch b/recipes/qt4/qt4-embedded-4.5.2/0008-qt-lib-infix.patch
new file mode 100644
index 0000000..3efaff3
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.5.2/0008-qt-lib-infix.patch
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
diff --git a/recipes/qt4/qt4-embedded-4.5.2/0010-no-simpledecoration-example.patch b/recipes/qt4/qt4-embedded-4.5.2/0010-no-simpledecoration-example.patch
new file mode 100644
index 0000000..070b4ac
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.5.2/0010-no-simpledecoration-example.patch
@@ -0,0 +1,9 @@
+--- qt-embedded-linux-opensource-src-4.5.0.orig/examples/qws/qws.pro	2009-02-25 22:32:34.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/examples/qws/qws.pro	2009-03-26 19:53:19.000000000 +0100
+@@ -1,5 +1,5 @@
+ TEMPLATE      = subdirs
+-SUBDIRS       = framebuffer mousecalibration simpledecoration
++SUBDIRS       = framebuffer mousecalibration
+ 
+ # install
+ sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS README *.pro
diff --git a/recipes/qt4/qt4-embedded_4.5.1.bb b/recipes/qt4/qt4-embedded_4.5.1.bb
deleted file mode 100644
index dff754c..0000000
--- a/recipes/qt4/qt4-embedded_4.5.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include qt4-embedded.inc
-
-PR = "${INC_PR}.1"
-
-LICENSE += "LGPL"
-SRC_URI += "file://0010-no-simpledecoration-example.patch;patch=1"
diff --git a/recipes/qt4/qt4-embedded_4.5.2.bb b/recipes/qt4/qt4-embedded_4.5.2.bb
new file mode 100644
index 0000000..dff754c
--- /dev/null
+++ b/recipes/qt4/qt4-embedded_4.5.2.bb
@@ -0,0 +1,6 @@
+include qt4-embedded.inc
+
+PR = "${INC_PR}.1"
+
+LICENSE += "LGPL"
+SRC_URI += "file://0010-no-simpledecoration-example.patch;patch=1"
diff --git a/recipes/qt4/qt4-tools-native_4.5.1.bb b/recipes/qt4/qt4-tools-native_4.5.1.bb
deleted file mode 100644
index d1962bf..0000000
--- a/recipes/qt4/qt4-tools-native_4.5.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require qt4-tools-native.inc
-PR = "${INC_PR}.1"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
diff --git a/recipes/qt4/qt4-tools-native_4.5.2.bb b/recipes/qt4/qt4-tools-native_4.5.2.bb
new file mode 100644
index 0000000..d1962bf
--- /dev/null
+++ b/recipes/qt4/qt4-tools-native_4.5.2.bb
@@ -0,0 +1,4 @@
+require qt4-tools-native.inc
+PR = "${INC_PR}.1"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
diff --git a/recipes/qt4/qt4-tools-sdk_4.5.1.bb b/recipes/qt4/qt4-tools-sdk_4.5.1.bb
deleted file mode 100644
index db919fd..0000000
--- a/recipes/qt4/qt4-tools-sdk_4.5.1.bb
+++ /dev/null
@@ -1,72 +0,0 @@
-DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "zlib-native dbus-native"
-SECTION = "libs"
-HOMEPAGE = "http://www.trolltech.com"
-PRIORITY = "optional"
-LICENSE = "GPL"
-
-inherit sdk
-
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
-           file://configure-lflags.patch;patch=1 \
-           file://qt-config.patch;patch=1 \
-           file://g++.conf \
-           file://linux.conf"
-S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
-
-# FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflags dbus-1"
-EXTRA_OECONF = "-prefix ${prefix} \
-                -qt-libjpeg -qt-gif -system-zlib \
-                -no-libjpeg -no-libpng \
-                -no-accessibility \
-                -no-cups \
-                -no-exceptions  \
-                -no-nas-sound \
-                -no-nis \
-                -verbose -release -fast -static \
-                -qt3support \
-                -I${STAGING_DIR_NATIVE}/usr/include \
-                -I${STAGING_DIR_NATIVE}/usr/include/dbus-1.0 \
-                -I${STAGING_DIR_NATIVE}/usr/lib/dbus-1.0/include"
-
-# yank default -e, otherwise we get the following error:
-# moc_qbuffer.cpp: No such file or directory
-EXTRA_OEMAKE = " "
-
-do_configure() {
-   (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
-}
-
-TOBUILD = "\
-  src/tools/bootstrap \
-  src/tools/moc \
-  src/corelib \
-  src/sql \
-  src/dbus \
-  src/qt3support \
-  src/xml \
-  src/tools/uic \
-  src/tools/rcc \
-  src/network \
-  src/gui \
-  src/tools/uic3 \
-  tools/linguist/lrelease \
-  tools/linguist/lupdate \
-  tools/qdbus \
-"
-
-do_compile() {
-    for i in ${TOBUILD}; do
-        cd ${S}/$i && oe_runmake CC="${CC}" CXX="${CXX}"
-    done
-}
-
-do_stage() {
-    install -d ${STAGING_BINDIR_NATIVE}/
-    install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2
-    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
-        install -m 0755 bin/${i} ${STAGING_BINDIR_NATIVE}/${i}4
-    done
-}
-
-
diff --git a/recipes/qt4/qt4-tools-sdk_4.5.2.bb b/recipes/qt4/qt4-tools-sdk_4.5.2.bb
new file mode 100644
index 0000000..db919fd
--- /dev/null
+++ b/recipes/qt4/qt4-tools-sdk_4.5.2.bb
@@ -0,0 +1,72 @@
+DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
+DEPENDS = "zlib-native dbus-native"
+SECTION = "libs"
+HOMEPAGE = "http://www.trolltech.com"
+PRIORITY = "optional"
+LICENSE = "GPL"
+
+inherit sdk
+
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+           file://configure-lflags.patch;patch=1 \
+           file://qt-config.patch;patch=1 \
+           file://g++.conf \
+           file://linux.conf"
+S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
+
+# FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflags dbus-1"
+EXTRA_OECONF = "-prefix ${prefix} \
+                -qt-libjpeg -qt-gif -system-zlib \
+                -no-libjpeg -no-libpng \
+                -no-accessibility \
+                -no-cups \
+                -no-exceptions  \
+                -no-nas-sound \
+                -no-nis \
+                -verbose -release -fast -static \
+                -qt3support \
+                -I${STAGING_DIR_NATIVE}/usr/include \
+                -I${STAGING_DIR_NATIVE}/usr/include/dbus-1.0 \
+                -I${STAGING_DIR_NATIVE}/usr/lib/dbus-1.0/include"
+
+# yank default -e, otherwise we get the following error:
+# moc_qbuffer.cpp: No such file or directory
+EXTRA_OEMAKE = " "
+
+do_configure() {
+   (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+}
+
+TOBUILD = "\
+  src/tools/bootstrap \
+  src/tools/moc \
+  src/corelib \
+  src/sql \
+  src/dbus \
+  src/qt3support \
+  src/xml \
+  src/tools/uic \
+  src/tools/rcc \
+  src/network \
+  src/gui \
+  src/tools/uic3 \
+  tools/linguist/lrelease \
+  tools/linguist/lupdate \
+  tools/qdbus \
+"
+
+do_compile() {
+    for i in ${TOBUILD}; do
+        cd ${S}/$i && oe_runmake CC="${CC}" CXX="${CXX}"
+    done
+}
+
+do_stage() {
+    install -d ${STAGING_BINDIR_NATIVE}/
+    install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2
+    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
+        install -m 0755 bin/${i} ${STAGING_BINDIR_NATIVE}/${i}4
+    done
+}
+
+
diff --git a/recipes/qt4/qt4-x11-free_4.5.1.bb b/recipes/qt4/qt4-x11-free_4.5.1.bb
deleted file mode 100644
index 1cc637a..0000000
--- a/recipes/qt4/qt4-x11-free_4.5.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include qt4-x11-free.inc
-LICENSE += "LGPL"
-PR = "${INC_PR}.1"
-
diff --git a/recipes/qt4/qt4-x11-free_4.5.2.bb b/recipes/qt4/qt4-x11-free_4.5.2.bb
new file mode 100644
index 0000000..1cc637a
--- /dev/null
+++ b/recipes/qt4/qt4-x11-free_4.5.2.bb
@@ -0,0 +1,4 @@
+include qt4-x11-free.inc
+LICENSE += "LGPL"
+PR = "${INC_PR}.1"
+
-- 
1.6.3.3



