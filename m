Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 311 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Sep 2016 12:39:04 UTC
Received: from atl4mhfb04.myregisteredsite.com
	(atl4mhfb04.myregisteredsite.com [209.17.115.120])
	by mail.openembedded.org (Postfix) with ESMTP id 56EC5601D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 12:39:04 +0000 (UTC)
Received: from atl4mhob10.myregisteredsite.com
	(atl4mhob10.myregisteredsite.com [209.17.115.48])
	by atl4mhfb04.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	u8NCXqEO017478 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 08:33:53 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.206])
	by atl4mhob10.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	u8NCXqD2010362 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 08:33:53 -0400
Received: (qmail 26199 invoked by uid 0); 23 Sep 2016 12:33:52 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 23 Sep 2016 12:33:52 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Sep 2016 14:33:49 +0200
Message-Id: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] phytool: Add recipe
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
X-List-Received-Date: Fri, 23 Sep 2016 12:39:06 -0000

A nice tool to directly read, write and interpret ethernet PHY data.
Very useful when debugging PHY or MDIO problems, which ethtool does
not do.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-networking/recipes-support/phytool/phytool.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-support/phytool/phytool.bb

diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
new file mode 100644
index 0000000..9d541b7
--- /dev/null
+++ b/meta-networking/recipes-support/phytool/phytool.bb
@@ -0,0 +1,14 @@
+SUMMARY = "PHY interface tool for Linux"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+PV = "1.0.1"
+SRCREV = "1a3ea62a218206e9faf3b27fb5d01c85692024c8"
+SRC_URI = "git://github.com/wkz/phytool.git"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}${prefix}/bin
+	oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
+}
-- 
1.9.1


