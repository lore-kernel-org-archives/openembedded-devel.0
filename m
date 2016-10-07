Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob12.myregisteredsite.com
	(atl4mhob12.myregisteredsite.com [209.17.115.50])
	by mail.openembedded.org (Postfix) with ESMTP id ED13960603
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 06:36:21 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob12.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	u976aLOM020484 for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Oct 2016 02:36:21 -0400
Received: (qmail 31719 invoked by uid 0); 7 Oct 2016 06:36:21 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 7 Oct 2016 06:36:20 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Oct 2016 08:36:17 +0200
Message-Id: <1475822177-8530-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
References: <1475733541-3401-1-git-send-email-mike.looijmans@topic.nl>
	<nt7e9d$9p0$2@blaine.gmane.org>
In-Reply-To: <nt7e9d$9p0$2@blaine.gmane.org>
Subject: [meta-networking][PATCH v5] phytool: Add recipe
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
X-List-Received-Date: Fri, 07 Oct 2016 06:36:24 -0000

A nice tool to directly read, write and interpret ethernet PHY data.
Very useful when debugging PHY or MDIO problems, which ethtool does
not do.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
v5: Correct revision, v4 got sent with the v3 patch contents
v4: Add comment on why $bindir is not being used
v3: Add SRCPV to PV
    Indent using spaces instead of tab
v2: Fix LICENSE filename and checksum
    Honor LDFLAGS value (patch accepted upstream)
 meta-networking/recipes-support/phytool/phytool.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-networking/recipes-support/phytool/phytool.bb

diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
new file mode 100644
index 0000000..4ed3ed1
--- /dev/null
+++ b/meta-networking/recipes-support/phytool/phytool.bb
@@ -0,0 +1,15 @@
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
+# The Makefile has "$PREFIX/bin" hardcoded into it, hence not using $bindir here
+do_install() {
+    install -d ${D}${prefix}/bin
+    oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
+}
-- 
1.9.1


