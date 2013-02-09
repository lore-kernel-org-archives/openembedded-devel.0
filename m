Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U3zUS-0007Cj-Eq
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2013 02:44:28 +0100
Received: by mail-ob0-f171.google.com with SMTP id x4so4390661obh.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 17:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=gG/IJt35SIrfJso//Arr6UwhWRkYqp0/DPy7QEyzBa0=;
	b=T5f63WZlqw6NmjSV70Ov+C8MAiss7BsnoxIs/pDDvLAL6UF9mSRSUm2O5YPngz7WMw
	pRBcQemZvdvsuZ9EsizlmkIPTsYDdOVZ5AIy4MXiBUdmgBW4x3szLQ0zZn5YruhK3ksQ
	f/ZM+x8Uz6m6DCtZJe5CW7MazPlBlcScaDuJXMAho4nltqlpp+DokoHrMKrWOPp0I24X
	fwWM6gfT7ruaD78xWX6IMlx9EV+CdqwWybmFi3Ino9e6qq36t5ef4NrDi5PnXlD9fIUe
	AF9ZYNSUBdtGV8tHygkxvMAbEVHAxTptBjXi4qJ32smEA3FaLvuk1rNQtKYHJxVmeaEJ
	oCKA==
X-Received: by 10.182.95.133 with SMTP id dk5mr5877676obb.14.1360373313470;
	Fri, 08 Feb 2013 17:28:33 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id dl6sm39965871obb.5.2013.02.08.17.28.31
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 17:28:32 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 17:29:45 -0800
Message-Id: <1360373385-27667-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkKAsYh2bOFYu40R9mEJHMKsVKEj5w8hIbuu/BTHSPfu8n/Zdm95/yfsJahYyfsYgbGSizB
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
X-List-Received-Date: Sat, 09 Feb 2013 01:44:29 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

This recipe provides the Qt library and QML plugins for connman.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 ...-to-disable-qml-plugin-and-test-program-t.patch |   35 ++++++++++
 .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69 ++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
 create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb

diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
new file mode 100644
index 0000000..74c27e4
--- /dev/null
+++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
@@ -0,0 +1,35 @@
+From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
+From: "Felipe F. Tonello" <ftonello@cercacor.com>
+Date: Mon, 7 Jan 2013 17:13:22 -0800
+Subject: [PATCH] added flags to disable qml plugin and test program to
+ compile
+
+This is usefull when there is no need to compile test program and qml plugin.
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



