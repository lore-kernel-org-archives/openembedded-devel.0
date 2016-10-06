Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob14.myregisteredsite.com
	(atl4mhob14.myregisteredsite.com [209.17.115.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3380471A57
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 05:59:05 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.206])
	by atl4mhob14.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	u965x4ia001445 for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Oct 2016 01:59:04 -0400
Received: (qmail 5316 invoked by uid 0); 6 Oct 2016 05:59:04 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 6 Oct 2016 05:59:04 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Oct 2016 07:59:01 +0200
Message-Id: <1475733541-3401-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH v3] phytool: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Oct 2016 05:59:08 -0000

A nice tool to directly read, write and interpret ethernet PHY data.
Very useful when debugging PHY or MDIO problems, which ethtool does
not do.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
v3: Add SRCPV to PV
    Indent using spaces instead of tab
v2: Fix LICENSE filename and checksum
    Honor LDFLAGS value (patch accepted upstream)
 meta-networking/recipes-support/phytool/phytool.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-support/phytool/phytool.bb

diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
new file mode 100644
index 0000000..e4391df
--- /dev/null
+++ b/meta-networking/recipes-support/phytool/phytool.bb
@@ -0,0 +1,14 @@
+SUMMARY = "PHY interface tool for Linux"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
+
+PV = "1.0.1+git${SRCPV}"
+SRCREV = "3149bfdb4f513e2f0da0a7d0bc5d0873578696f2"
+SRC_URI = "git://github.com/wkz/phytool.git"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${prefix}/bin
+    oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
+}
-- 
1.9.1


