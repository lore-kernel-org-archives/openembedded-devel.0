Received: from mail-ob0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U4xN8-00071Z-K8
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 18:40:54 +0100
Received: by mail-ob0-f178.google.com with SMTP id wd20so6350122obb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 09:24:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=0RU0zPWJu/apEPebXAtFC762zAABUosB5QV75PfpV1U=;
	b=kPuLXMbafJA02KIeEZappwtiAt8NZYWxI2iatxx07ijW/Fno+/V5zTwN+Co9i+ie0+
	ocfitQzRO/U2v1LsnNoToHQTAT7hXLZH13e42sf4GQFMzvkHzT1B/Mab9s/Tjx8jmGTg
	m0tADgDHY5BBiQNvFI3wY5aJ88gnKLAU7bW8zL3jB9y/Wgl26kkWcA+1UihFDGi+UvRj
	3Gpz3RodaVlnWBQdoDHO2jcHoMq+PAejqTwGE0q+Q4jVaN/B0jWI4/WM7yxXvcJabYPM
	RRHSElUfUOhqjwWjmZ8DLNr3rXay94lhojzOcFnZ4yLlRjgZiC1cKZNfqxWRB2V7N8bC
	HFXg==
X-Received: by 10.182.160.106 with SMTP id xj10mr11016503obb.98.1360603495882; 
	Mon, 11 Feb 2013 09:24:55 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id el2sm49631494obc.9.2013.02.11.09.24.53
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 09:24:54 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 09:25:53 -0800
Message-Id: <1360603554-31515-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQn8/HyrjKj94kWGuwCdMDgBAqpcGO2OghNLUV6b9nIgBDH9MsM7CLcHtBdqxvZS//HrcZRJ
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [meta-oe][PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Mon, 11 Feb 2013 17:40:54 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

This recipe provides the Qt library and QML plugins for connman.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 ...-to-disable-qml-plugin-and-test-program-t.patch |   37 +++++++++++
 .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69 ++++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
 create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb

diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
new file mode 100644
index 0000000..6ec084d
--- /dev/null
+++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
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
diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
new file mode 100644
index 0000000..2c33b49
--- /dev/null
+++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
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
+# this is for users to bbappend this recipe and change it
+BRANCH = "master"
+TAG = "${PV}"
+SRCREV = "${AUTOREV}"
+
+SRC_URI = " \
+  git://github.com/nemomobile/${PN}.git;branch=${BRANCH};tag=${TAG} \
+  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
+"
+
+S = "${WORKDIR}/git"
+
+QT_IMPORTS_DIR = "${libdir}/qt4/imports"
+# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
+PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
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
+  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
+}
-- 
1.7.9.5



