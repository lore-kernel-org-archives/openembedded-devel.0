Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by mail.openembedded.org (Postfix) with ESMTP id E34896DD0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 01:48:29 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MWU002DFL0QLC30@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	25 Nov 2013 19:48:29 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A78EA201CF; Mon,
	25 Nov 2013 20:48:25 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Nov 2013 20:47:58 -0500
Message-id: <1385430478-31824-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1385430478-31824-1-git-send-email-denis@denix.org>
References: <1385430478-31824-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH 2/2] nativesdk-qttools: add nativesdk version of qttools necessary for SDK tools
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
X-List-Received-Date: Tue, 26 Nov 2013 01:48:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/nativesdk-qttools.inc      | 32 +++++++++++++++++++++++++++++++
 recipes-qt/qt5/nativesdk-qttools_5.1.1.bb | 12 ++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 recipes-qt/qt5/nativesdk-qttools.inc
 create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.1.1.bb

diff --git a/recipes-qt/qt5/nativesdk-qttools.inc b/recipes-qt/qt5/nativesdk-qttools.inc
new file mode 100644
index 0000000..30bb357
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qttools.inc
@@ -0,0 +1,32 @@
+# doesnt have GFDL-1.3 like qtbase, LICENSE files are missing in 5.0.0 and 5.0.1, this is for 5.0.2 and git
+LICENSE = "LGPL-2.1 | GPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+"
+
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
index 0000000..8aca56e
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+# LICENSE files are missing in 5.0.0 and 5.0.1
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
+                    file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891 \
+"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qttools-${PV}:"
+
+SRC_URI[md5sum] = "022073d32ff9d408de0182b5d1f01781"
+SRC_URI[sha256sum] = "2b42c6d5feeccffb67e890b86a150bae64dd2ff550be39a3cc449ee0e95462b6"
-- 
1.8.3.2


