Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob09.myregisteredsite.com
	(atl4mhob09.myregisteredsite.com [209.17.115.47])
	by mail.openembedded.org (Postfix) with ESMTP id 36BDF6078D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 06:31:34 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.204])
	by atl4mhob09.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	u976VYrN022343 for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Oct 2016 02:31:34 -0400
Received: (qmail 30390 invoked by uid 0); 7 Oct 2016 06:31:34 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 7 Oct 2016 06:31:33 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Oct 2016 08:31:29 +0200
Message-Id: <1475821889-22696-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
References: <1475733541-3401-1-git-send-email-mike.looijmans@topic.nl>
	<nt7e9d$9p0$2@blaine.gmane.org>
In-Reply-To: <nt7e9d$9p0$2@blaine.gmane.org>
Subject: [meta-networking][PATCH v4] phytool: Add recipe
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
X-List-Received-Date: Fri, 07 Oct 2016 06:31:35 -0000

A nice tool to directly read, write and interpret ethernet PHY data.
Very useful when debugging PHY or MDIO problems, which ethtool does
not do.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
v4: Add comment on why $bindir is not being used
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


