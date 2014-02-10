Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id B71656DCFF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 21:17:08 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0S00ET3TSCCE20@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	10 Feb 2014 15:17:01 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B3A8D2016F; Mon,
	10 Feb 2014 16:17:00 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2014 16:16:53 -0500
Message-id: <1392067015-16328-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1392067015-16328-1-git-send-email-denis@denix.org>
References: <1392067015-16328-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH 1/3] packagegroup-qt5-toolchain-target: add Qt5 SDK target packages
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
X-List-Received-Date: Mon, 10 Feb 2014 21:17:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-qt5-toolchain-target.bb           | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 recipes-core/packagegroups/packagegroup-qt5-toolchain-target.bb

diff --git a/recipes-core/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-core/packagegroups/packagegroup-qt5-toolchain-target.bb
new file mode 100644
index 0000000..2f3dff6
--- /dev/null
+++ b/recipes-core/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Target packages for Qt5 SDK"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} += " \
+        packagegroup-core-standalone-sdk-target \
+        libsqlite3-dev \
+        qtbase-mkspecs \
+        qtdeclarative-mkspecs \
+        qtscript-mkspecs \
+        qtwebkit-mkspecs \
+        qt3d-mkspecs \
+        qtlocation-mkspecs \
+        qtsensors-mkspecs \
+        qtsvg-mkspecs \
+        qtxmlpatterns-mkspecs \
+        qtbase-dev \
+        qtdeclarative-dev \
+        qtscript-dev \
+        qtwebkit-dev \
+        qt3d-dev \
+        qtlocation-dev \
+        qtsensors-dev \
+        qtsvg-dev \
+        qtxmlpatterns-dev \
+"
-- 
1.8.3.2


