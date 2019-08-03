Return-Path: <denis@denix.org>
X-Greylist: delayed 533 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 03 Aug 2019 19:54:00 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3046D7C1
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2019 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 67C6F40BDC;
	Sat,  3 Aug 2019 19:45:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PBm0_HdcA4xI; Sat,  3 Aug 2019 19:45:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C05F40AB7;
	Sat,  3 Aug 2019 19:45:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7E643171F4B;
	Sat,  3 Aug 2019 15:45:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Aug 2019 15:44:59 -0400
Message-Id: <1564861499-24954-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-filesystems][PATCH] ufs-tool: add tool to access UFS (Universal Flash Storage) devices
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
X-List-Received-Date: Sat, 03 Aug 2019 19:54:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-utils/ufs-tool/ufs-tool_git.bb           | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb

diff --git a/meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb b/meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb
new file mode 100644
index 0000000..e074b51
--- /dev/null
+++ b/meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Tool to access UFS (Universal Flash Storage) devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+PV = "1.3+git${SRCPV}"
+
+BRANCH ?= "dev"
+
+SRCREV = "8b00e33003b57d7071943f63863fcf8cc48d5be9"
+
+SRC_URI = "git://github.com/westerndigitalcorporation/ufs-tool.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/ufs-tool ${D}${bindir}/
+}
-- 
2.7.4


