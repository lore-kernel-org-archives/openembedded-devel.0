Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UaxaF-000705-0d
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 May 2013 02:22:48 +0200
Received: by mail-oa0-f43.google.com with SMTP id o6so5609409oag.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 17:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=ihIfUqJ8QJ7p6P/htmtwmJv6i8hQa5DWVYpxmVLNGUA=;
	b=YROHF3+XTfGiD9HVwZHuNhlu5qDkuLWgpyspEVWOlEfOfbGThTX9cfLFDeQKMgBJbI
	9S0sScNCe5oKM7nzgI5I5IhfRv2LUT+l3nKIQ6OBjPESjmsbxu5lfSTZ2dXJ+PTPjghc
	NAV7yvdK0XZ34f6GqNfGsMUtJBKW57AqWRyxrY1Z+vZjPx7EytL72TBh9H3wa6OwlFPp
	l0ihYItiDNtMXkKAgwLFA5vkKARNSYdkjoCcceZdbHJf6b3YhrOzn2CJTQ3r7URRAhG4
	pZHOD93CbiMO3HbKMP3EstnzTiR7sDAw1kRZQUNISZl+zKQKpE6aHfHF5fLxGEVtCnn+
	MMiA==
X-Received: by 10.60.80.197 with SMTP id t5mr5571062oex.1.1368230676182;
	Fri, 10 May 2013 17:04:36 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id bh8sm5279243obb.11.2013.05.10.17.04.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 17:04:34 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2013 17:04:22 -0700
Message-Id: <1368230662-18958-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkpYkkIuc2/BZgpIsR3VM/jaIQrKSJHZQmNEdFGLLEzjOdIv84r0qdP5ZYiV0pJ4I0sfveZ
Subject: [meta-oe][PATCH] connman: updated libconnman-qt to 1.0.7
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
X-List-Received-Date: Sat, 11 May 2013 00:22:50 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

This new recipe version requires the changes in this patch:
http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg38148.html

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 ...-to-disable-qml-plugin-and-test-program-t.patch | 37 ------------
 .../libconnman-qt/libconnman-qt_0.4.0.bb           | 69 ----------------------
 .../libconnman-qt/libconnman-qt_1.0.7.bb           | 67 +++++++++++++++++++++
 3 files changed, 67 insertions(+), 106 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
 delete mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
 create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb

diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
deleted file mode 100644
index 6ec084d..0000000
--- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
-From: "Felipe F. Tonello" <ftonello@cercacor.com>
-Date: Mon, 7 Jan 2013 17:13:22 -0800
-Subject: [PATCH] added flags to disable qml plugin and test program to
- compile
-
-This is usefull when there is no need to compile test program and qml plugin.
-
-Upstream-Status: Accepted
-
-Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
----
- connman-qt.pro |   11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/connman-qt.pro b/connman-qt.pro
-index 7d9ec99..425c41f 100644
---- a/connman-qt.pro
-+++ b/connman-qt.pro
-@@ -1,4 +1,13 @@
- TEMPLATE = subdirs
--SUBDIRS += libconnman-qt test plugin
-+SUBDIRS += libconnman-qt
- CONFIG += ordered
- 
-+# CONFIG flag to disable test program
-+!notest {
-+    SUBDIRS += test
-+}
-+
-+# CONFIG flag to disable qml plugin
-+!noplugin {
-+    SUBDIRS += plugin
-+}
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
deleted file mode 100644
index 50c149f..0000000
--- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
+++ /dev/null
@@ -1,69 +0,0 @@
-DESCRIPTION = "Qt Library for ConnMan"
-HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
-
-SECTION = "qt/lib"
-
-PR = "r0"
-
-inherit qt4x11 pkgconfig
-
-RDEPENDS_${PN} = "connman"
-RDEPENDS_${PN}-plugin = "${PN}"
-
-PROVIDES += "${PN}-plugin"
-
-PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
-RRECOMMENDS_${PN} = "${PN}-plugin"
-
-BRANCH = "master"
-# this matches 0.4.0 tag
-SRCREV = "3af5bd38d82255942f582398160a5d3354346ca3"
-
-SRC_URI = " \
-    git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
-    file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
-"
-
-S = "${WORKDIR}/git"
-
-QT_IMPORTS_DIR = "${libdir}/qt4/imports"
-# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
-PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
-
-EXTRA_QMAKEVARS_PRE = " \
-    CONFIG+=notest \
-"
-
-do_configure_prepend() {
-    # Hack *.pro variables
-    find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
-}
-
-do_install() {
-    export INSTALL_ROOT=${D}
-    oe_runmake install
-}
-
-FILES_${PN} = " \
-    ${libdir}/libconnman-qt4${SOLIBS} \
-"
-
-FILES_${PN}-dev = " \
-    ${includedir}/connman-qt/* \
-    ${libdir}/libconnman-qt4${SOLIBSDEV} \
-    ${libdir}/libconnman-qt4.prl \
-    ${libdir}/pkgconfig/connman-qt4.pc \
-    ${libdir}/connman-qt4.pc \
-"
-
-FILES_${PN}-plugin = " \
-    ${PLUGINS_TARGET}/qmldir \
-    ${PLUGINS_TARGET}/lib*.so \
-"
-
-FILES_${PN}-plugin-dbg = " \
-    ${PLUGINS_TARGET}/.debug \
-    ${PLUGINS_TARGET}/.debug/* \
-"
diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
new file mode 100644
index 0000000..65a2731
--- /dev/null
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
@@ -0,0 +1,67 @@
+DESCRIPTION = "Qt Library for ConnMan"
+HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
+
+SECTION = "qt/lib"
+
+PR = "r0"
+
+inherit qt4x11 pkgconfig
+
+RDEPENDS_${PN} = "connman"
+RDEPENDS_${PN}-plugin = "${PN}"
+
+PROVIDES += "${PN}-plugin"
+
+PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
+RRECOMMENDS_${PN} = "${PN}-plugin"
+
+BRANCH = "master"
+SRCREV = "6a5e4f981112a90a8c19d82bd671da389d2af993"
+
+SRC_URI = " \
+    git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
+"
+
+S = "${WORKDIR}/git"
+
+QT_IMPORTS_DIR = "${libdir}/qt4/imports"
+# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
+PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
+
+EXTRA_QMAKEVARS_PRE = " \
+    CONFIG+=notest \
+"
+
+do_configure_prepend() {
+    # Hack *.pro variables
+    find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
+}
+
+do_install() {
+    export INSTALL_ROOT=${D}
+    oe_runmake install
+}
+
+FILES_${PN} = " \
+    ${libdir}/libconnman-qt4${SOLIBS} \
+"
+
+FILES_${PN}-dev = " \
+    ${includedir}/connman-qt/* \
+    ${libdir}/libconnman-qt4${SOLIBSDEV} \
+    ${libdir}/libconnman-qt4.prl \
+    ${libdir}/pkgconfig/connman-qt4.pc \
+    ${libdir}/connman-qt4.pc \
+"
+
+FILES_${PN}-plugin = " \
+    ${PLUGINS_TARGET}/qmldir \
+    ${PLUGINS_TARGET}/lib*.so \
+"
+
+FILES_${PN}-plugin-dbg = " \
+    ${PLUGINS_TARGET}/.debug \
+    ${PLUGINS_TARGET}/.debug/* \
+"
-- 
1.8.1.4



