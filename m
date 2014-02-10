Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id E095B6E8C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 21:17:08 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0S00D8MTSCNI30@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	10 Feb 2014 15:17:01 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C0065204E2; Mon,
	10 Feb 2014 16:17:00 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2014 16:16:54 -0500
Message-id: <1392067015-16328-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1392067015-16328-1-git-send-email-denis@denix.org>
References: <1392067015-16328-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH 2/3] nativesdk-packagegroup-qt5-toolchain-host: add Qt5 SDK host tools
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
 .../packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-core/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb

diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb b/recipes-core/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb
new file mode 100644
index 0000000..eb0af67
--- /dev/null
+++ b/recipes-core/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Host packages for Qt Embedded SDK"
+LICENSE = "MIT"
+
+inherit packagegroup nativesdk
+
+RDEPENDS_${PN} += " \
+        nativesdk-packagegroup-sdk-host \
+        nativesdk-qtbase-tools \
+        nativesdk-qttools \
+"
-- 
1.8.3.2


