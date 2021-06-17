Received: from good-out-02.clustermail.de (good-out-02.clustermail.de [212.223.35.18])
 by mx.groups.io with SMTP id smtpd.web08.159.1623936081403903156
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 06:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gin.de, ip: 212.223.35.18, mailfrom: daniel.klauer@gin.de)
Received: from [10.0.0.12] (helo=frontend.clustermail.de)
	by smtpout-01.clustermail.de with esmtp (Exim 4.94.2)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1ltrxG-0001rX-E4
	for openembedded-devel@lists.openembedded.org; Thu, 17 Jun 2021 15:21:16 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.94.2)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1ltrxG-0003Wh-5o
	for openembedded-devel@lists.openembedded.org; Thu, 17 Jun 2021 15:21:10 +0200
Received: from daniel-desktop.gin-domain.local (10.160.138.39) by
 Win2012-02.gin-domain.local (10.160.128.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Thu, 17 Jun 2021 15:21:09 +0200
From: "Daniel Klauer" <daniel.klauer@gin.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] spidev-test: Update common-licenses reference
Date: Thu, 17 Jun 2021 15:20:40 +0200
Message-ID: <20210617132040.639982-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (10.160.128.12) To
 Win2012-02.gin-domain.local (10.160.128.12)
X-EsetResult: clean, is OK
X-EsetId: 37303A294DBFF7666D7665
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The license files were renamed in oe-core to match the SPDX names.

Most recipes here were already updated in commit ed54f12e19
("recipes: Update common-licenses references to match new names"),
but spidev-test was still missing.

Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
---
 meta-oe/recipes-kernel/spidev-test/spidev-test.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
index 662630291..974cb1e93 100644
--- a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
+++ b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Test SPI devices"
 DESCRIPTION = "SPI testing utility using the spidev driver"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 PROVIDES = "virtual/spidev-test"
 
 inherit bash-completion kernelsrc kernel-arch
-- 
2.27.0

