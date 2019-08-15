Return-Path: <r01007@nxp.com>
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6017E555
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 06:54:36 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 238CF1A00EA;
	Thu, 15 Aug 2019 08:54:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
	[165.114.16.14])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A89551A0084;
	Thu, 15 Aug 2019 08:54:35 +0200 (CEST)
Received: from yb6 (yb6.am.freescale.net [10.81.19.196])
	by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 89CAA402F1;
	Thu, 15 Aug 2019 14:54:33 +0800 (SGT)
Received: by yb6 (Postfix, from userid 1004)
	id BDAD12E02A55; Thu, 15 Aug 2019 01:54:32 -0500 (CDT)
From: Jun Zhu <junzhu@nxp.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2019 01:54:30 -0500
Message-Id: <20190815065430.32384-1-junzhu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [meta-oe][warrior][PATCH] packagegroup-tools-bluetooth: Fix blank RDEPENDS list
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
X-List-Received-Date: Thu, 15 Aug 2019 06:54:36 -0000

This reverts commit 521a3b0326c56b212ddbb5bf68998e57b498de14, which causes
the blank RDEPENDS-${PN} for this packagegroup.
---
 .../packagegroups/packagegroup-tools-bluetooth.bb                     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index 913e311..f2a16dc 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -31,3 +31,7 @@ RDEPENDS_bluez5 = " \
          pulseaudio-module-loopback', \
         '', d)} \
 "
+
+# Install bluez4 tools or bluez5 tools depending on what is specified in the distro.
+# Otherwise install nothing.
+RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
-- 
2.7.4


