Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by mail.openembedded.org (Postfix) with ESMTP id D7E856D4ED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 04:33:49 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MWU008H2SO3M030@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	25 Nov 2013 22:33:49 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3EB322001F; Mon,
	25 Nov 2013 23:33:39 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Nov 2013 23:33:37 -0500
Message-id: <1385440417-13357-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1385430478-31824-3-git-send-email-denis@denix.org>
References: <1385430478-31824-3-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCHv2 2/2] nativesdk-qttools: add nativesdk version of qttools necessary for SDK tools
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
X-List-Received-Date: Tue, 26 Nov 2013 04:33:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - remove license workarounds

 recipes-qt/qt5/nativesdk-qttools.inc      | 25 +++++++++++++++++++++++++
 recipes-qt/qt5/nativesdk-qttools_5.1.1.bb |  7 +++++++
 2 files changed, 32 insertions(+)
 create mode 100644 recipes-qt/qt5/nativesdk-qttools.inc
 create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.1.1.bb

diff --git a/recipes-qt/qt5/nativesdk-qttools.inc b/recipes-qt/qt5/nativesdk-qttools.inc
new file mode 100644
index 0000000..e9b2949
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qttools.inc
@@ -0,0 +1,25 @@
+DEPENDS = "nativesdk-qtbase qtbase-native"
+
+QT_MODULE = "qttools"
+
+require nativesdk-qt5.inc
+
+SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
+
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
+
+FILES_${PN}-dbg = " \
+    ${OE_QMAKE_PATH_BINS}/.debug \
+"
+
+FILES_${PN} = " \
+    ${OE_QMAKE_PATH_BINS}/* \
+"
+
+do_configure() {
+    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
+}
+
+do_install() {
+    oe_runmake install INSTALL_ROOT=${D}
+}
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb b/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
new file mode 100644
index 0000000..b56f430
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
@@ -0,0 +1,7 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qttools-${PV}:"
+
+SRC_URI[md5sum] = "022073d32ff9d408de0182b5d1f01781"
+SRC_URI[sha256sum] = "2b42c6d5feeccffb67e890b86a150bae64dd2ff550be39a3cc449ee0e95462b6"
-- 
1.8.3.2


