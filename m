Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4786BC20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 04:33:49 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MWU00K8QSOCRO03@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	25 Nov 2013 22:33:49 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 85ACD2008E; Mon,
	25 Nov 2013 23:33:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Nov 2013 23:33:44 -0500
Message-id: <1385440424-13435-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH] qttools-native: remove previous license workaround
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
X-List-Received-Date: Tue, 26 Nov 2013 04:33:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Previously license files were missing for qttools module, so we used to point
to generic files with same license.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/qttools-native.inc      | 7 -------
 recipes-qt/qt5/qttools-native_5.1.1.bb | 5 -----
 2 files changed, 12 deletions(-)

diff --git a/recipes-qt/qt5/qttools-native.inc b/recipes-qt/qt5/qttools-native.inc
index cc1e056..03b88cd 100644
--- a/recipes-qt/qt5/qttools-native.inc
+++ b/recipes-qt/qt5/qttools-native.inc
@@ -1,10 +1,3 @@
-# doesn't have GFDL-1.3 like qtbase, LICENSE files are missing in 5.0.0 and 5.0.1, this is for 5.0.2 and git
-LICENSE = "LGPL-2.1 | GPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-"
-
 DEPENDS = "qtbase-native"
 
 QT_MODULE = "qttools"
diff --git a/recipes-qt/qt5/qttools-native_5.1.1.bb b/recipes-qt/qt5/qttools-native_5.1.1.bb
index 82b8c01..e10484e 100644
--- a/recipes-qt/qt5/qttools-native_5.1.1.bb
+++ b/recipes-qt/qt5/qttools-native_5.1.1.bb
@@ -1,10 +1,5 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
-# LICENSE files are missing in 5.0.0 and 5.0.1
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
-                    file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891 \
-"
-
 SRC_URI[md5sum] = "022073d32ff9d408de0182b5d1f01781"
 SRC_URI[sha256sum] = "2b42c6d5feeccffb67e890b86a150bae64dd2ff550be39a3cc449ee0e95462b6"
-- 
1.8.3.2


