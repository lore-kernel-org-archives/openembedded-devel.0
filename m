Received: from mail-ye0-f174.google.com ([209.85.213.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U8FI3-0003Vk-9U
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 20:25:16 +0100
Received: by mail-ye0-f174.google.com with SMTP id m3so1534991yen.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 11:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=egvMRd8BR035XgHb/kNCRSBvWLO8CHJGvbn/7M+o/zg=;
	b=abWepVXCCEDNGb//HbIAx89YRCgjSX1w7Z6S0cFxR5zh2XiihgWbIXR69wkhuNVHL3
	ByWmjjeg88xZ5PqwRGeH09ok5seebguDQVnBGHqjugBU5zfxipTZT4DqbdwqUnMljs6U
	4bxkYM4Imfp6eXWOJoZGjbLE/zmDem838sEvEeZc91AJDJ+uPK/31ugMvREL2lDwT0xT
	JiD6u9ZKN3EcIHMHOApNNECYAKjQyWJwXR6B9PQ/6eDCihDQHH6yuXaD0tVTLI0e2UBQ
	TMNaLIbr1zmPXnytysmTAayGeuZZc6sjQe31Twmo+KfV8WjwtoTrEtA/dkb4YcqDBjZI
	H7rw==
X-Received: by 10.236.131.169 with SMTP id m29mr38277821yhi.114.1361387343856; 
	Wed, 20 Feb 2013 11:09:03 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id
	b62sm134830099yhf.13.2013.02.20.11.09.01
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 11:09:02 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2013 11:08:58 -0800
Message-Id: <1361387338-6553-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmqhsfkFGmRxF61fVsWQco/icPWOlDBfBloN6B30X+J4Qjq90y8y5n6B5zztJDDA1T3d9gP
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [meta-oe][PATCH] libconnman-qt: fixed directory typo
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
X-List-Received-Date: Wed, 20 Feb 2013 19:25:16 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 ...-to-disable-qml-plugin-and-test-program-t.patch |   37 +++++++++++
 .../libconnman-qt/libconnman-qt_0.4.0.bb           |   69 ++++++++++++++++++++
 ...-to-disable-qml-plugin-and-test-program-t.patch |   37 -----------
 .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69 --------------------
 4 files changed, 106 insertions(+), 106 deletions(-)
 create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
 create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
 delete mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
 delete mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb

diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
new file mode 100644
index 0000000..6ec084d
--- /dev/null
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
@@ -0,0 +1,37 @@
+From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
+From: "Felipe F. Tonello" <ftonello@cercacor.com>
+Date: Mon, 7 Jan 2013 17:13:22 -0800
+Subject: [PATCH] added flags to disable qml plugin and test program to
+ compile
+
+This is usefull when there is no need to compile test program and qml plugin.
+
+Upstream-Status: Accepted
+
+Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
+---
+ connman-qt.pro |   11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/connman-qt.pro b/connman-qt.pro
+index 7d9ec99..425c41f 100644
+--- a/connman-qt.pro
++++ b/connman-qt.pro
+@@ -1,4 +1,13 @@
+ TEMPLATE = subdirs
+-SUBDIRS += libconnman-qt test plugin
++SUBDIRS += libconnman-qt
+ CONFIG += ordered
+ 
++# CONFIG flag to disable test program
++!notest {
++    SUBDIRS += test
++}
++
++# CONFIG flag to disable qml plugin
++!noplugin {
++    SUBDIRS += plugin
++}
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
new file mode 100644
index 0000000..d15d8d7
--- /dev/null
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
@@ -0,0 +1,69 @@
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
+# this matches 0.4.0 tag
+SRCREV = "3af5bd38d82255942f582398160a5d3354346ca3"
+
+SRC_URI = " \
+  git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
+  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
+"
+
+S = "${WORKDIR}/git"
+
+QT_IMPORTS_DIR = "${libdir}/qt4/imports"
+# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
+PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
+
+EXTRA_QMAKEVARS_PRE = " \
+  CONFIG+=notest \
+"
+
+do_configure_prepend() {
+  # Hack *.pro variables
+  find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
+}
+
+do_install() {
+  export INSTALL_ROOT=${D}
+  oe_runmake install
+}
+
+FILES_${PN} = " \
+  ${libdir}/libconnman-qt4${SOLIBS} \
+"
+
+FILES_${PN}-dev = " \
+  ${includedir}/connman-qt/* \
+  ${libdir}/libconnman-qt4${SOLIBSDEV} \
+  ${libdir}/libconnman-qt4.prl \
+  ${libdir}/pkgconfig/connman-qt4.pc \
+  ${libdir}/connman-qt4.pc \
+"
+
+FILES_${PN}-plugin = " \
+  ${PLUGINS_TARGET}/qmldir \
+  ${PLUGINS_TARGET}/lib*.so \
+"
+
+FILES_${PN}-plugin-dbg = " \
+  ${PLUGINS_TARGET}/.debug \
+  ${PLUGINS_TARGET}/.debug/* \
+"
diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
deleted file mode 100644
index 6ec084d..0000000
--- a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
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
diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
deleted file mode 100644
index d15d8d7..0000000
--- a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
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
-  git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
-  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
-"
-
-S = "${WORKDIR}/git"
-
-QT_IMPORTS_DIR = "${libdir}/qt4/imports"
-# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
-PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
-
-EXTRA_QMAKEVARS_PRE = " \
-  CONFIG+=notest \
-"
-
-do_configure_prepend() {
-  # Hack *.pro variables
-  find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
-}
-
-do_install() {
-  export INSTALL_ROOT=${D}
-  oe_runmake install
-}
-
-FILES_${PN} = " \
-  ${libdir}/libconnman-qt4${SOLIBS} \
-"
-
-FILES_${PN}-dev = " \
-  ${includedir}/connman-qt/* \
-  ${libdir}/libconnman-qt4${SOLIBSDEV} \
-  ${libdir}/libconnman-qt4.prl \
-  ${libdir}/pkgconfig/connman-qt4.pc \
-  ${libdir}/connman-qt4.pc \
-"
-
-FILES_${PN}-plugin = " \
-  ${PLUGINS_TARGET}/qmldir \
-  ${PLUGINS_TARGET}/lib*.so \
-"
-
-FILES_${PN}-plugin-dbg = " \
-  ${PLUGINS_TARGET}/.debug \
-  ${PLUGINS_TARGET}/.debug/* \
-"
-- 
1.7.9.5



