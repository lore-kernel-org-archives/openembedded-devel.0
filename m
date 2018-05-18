Return-Path: <prvs=669850acc=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE5B74B8F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 07:50:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,413,1520895600"; 
   d="scan'208";a="1449377"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 May 2018 09:50:09 +0200
Message-ID: <20180518075009.4612-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-oe][PATCH v2] stm32flash: add recipe
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
X-List-Received-Date: Fri, 18 May 2018 07:50:26 -0000
Content-Type: text/plain

Add recipe for version 0.5 of stm32flash, an open source flash program for
STM32 using the ST serial bootloader.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb

diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
new file mode 100644
index 000000000..7f1a7823a
--- /dev/null
+++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Open source flash program for STM32 using the ST serial bootloader"
+HOMEPAGE = "https://sourceforge.net/projects/stm32flash/"
+BUGTRACKER = "https://sourceforge.net/p/stm32flash/tickets/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit autotools-brokensep
+
+EXTRA_OEMAKE = "PREFIX=${prefix}"
+
+S = "${WORKDIR}/${PN}"
+
+SRC_URI = "https://prdownloads.sourceforge.net/stm32flash/stm32flash-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "40f673502949f3bb655d2bcc539d7b6a"
+SRC_URI[sha256sum] = "97aa9422ef02e82f7da9039329e21a437decf972cb3919ad817f70ac9a49e306"
-- 
2.11.0


