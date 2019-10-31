Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 19EDD7F76B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 01:15:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,248,1569254400"; d="scan'208";a="77711805"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 09:15:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CA7E54CE1510
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:07:33 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 31 Oct 2019 09:15:32 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 17:09:50 +0800
Message-ID: <1572512990-46235-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: CA7E54CE1510.A72DA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH v2] libowfat: upgrade 0.31 -> 0.32
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
X-List-Received-Date: Thu, 31 Oct 2019 01:15:36 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/ncp/{libowfat_0.31.bb => libowfat_0.32.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/ncp/{libowfat_0.31.bb => libowfat_0.32.bb} (80%)

diff --git a/meta-networking/recipes-support/ncp/libowfat_0.31.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
similarity index 80%
rename from meta-networking/recipes-support/ncp/libowfat_0.31.bb
rename to meta-networking/recipes-support/ncp/libowfat_0.32.bb
index 4b072f7..a5e2c21 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.31.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "120798fab86cfd72dc6b12284d248dd0"
-SRC_URI[sha256sum] = "d1e4ac1cfccbb7dc51d77d96398e6302d229ba7538158826c84cb4254c7e8a12"
+SRC_URI[md5sum] = "ee015ccf45cb2bc61c942642038c2bdc"
+SRC_URI[sha256sum] = "f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1"
 
 EXTRA_OEMAKE = "\
     DIET= \
@@ -19,7 +19,7 @@ EXTRA_OEMAKE = "\
 do_install() {
     make install \
         DESTDIR=${D} \
-        INCLUDEDIR=${includedir}/${BPN} \
+        INCLUDEDIR=${includedir} \
         LIBDIR=${libdir} \
         MAN3DIR=${mandir}/man3
 }
-- 
2.7.4




