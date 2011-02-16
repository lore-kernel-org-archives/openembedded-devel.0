Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <m.schuknecht@DResearch.de>) id 1Pphnd-00037i-IE
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 14:52:09 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 4D3C9491282
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:26:40 +0100 (CET)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 16 Feb 2011 14:26:40 +0100
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10022)
	id CEFE37208C; Wed, 16 Feb 2011 14:26:39 +0100 (CET)
From: Mario Schuknecht <m.schuknecht@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 14:26:14 +0100
Message-Id: <1297862774-31036-1-git-send-email-m.schuknecht@dresearch.de>
X-Mailer: git-send-email 1.7.1
X-OriginalArrivalTime: 16 Feb 2011 13:26:40.0340 (UTC)
	FILETIME=[250F0940:01CBCDDD]
Subject: [PATCH] u-boot-2009.03: Fix sector table direction for AMIC (hipox machine only)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Feb 2011 13:52:09 -0000

Signed-off-by: Mario Schuknecht <m.schuknecht@dresearch.de>
---
 .../u-boot-2009.03/hipox/11-cfi-amic-fixup.patch   |   11 +++++++++++
 recipes/u-boot/u-boot_2009.03.bb                   |    1 +
 2 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch

diff --git a/recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch b/recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch
new file mode 100644
index 0000000..a7432a5
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch
@@ -0,0 +1,11 @@
+diff -Nurd u-boot-2009.03.orig//drivers/mtd/cfi_flash.c u-boot-2009.03/drivers/mtd/cfi_flash.c
+--- u-boot-2009.03.orig//drivers/mtd/cfi_flash.c	2011-02-11 15:18:38.000000000 +0100
++++ u-boot-2009.03/drivers/mtd/cfi_flash.c	2011-02-11 15:19:06.000000000 +0100
+@@ -1883,6 +1883,7 @@
+ 		/* Do manufacturer-specific fixups */
+ 		switch (info->manufacturer_id) {
+ 		case 0x0001:
++		case 0x0037: // AMIC
+ 		case 0x00da: // Winbond
+ 			flash_fixup_amd(info, &qry);
+ 			break;
diff --git a/recipes/u-boot/u-boot_2009.03.bb b/recipes/u-boot/u-boot_2009.03.bb
index 2cbded9..d6e9768 100644
--- a/recipes/u-boot/u-boot_2009.03.bb
+++ b/recipes/u-boot/u-boot_2009.03.bb
@@ -14,6 +14,7 @@ SRC_URI_append_hipox = "file://00-hipox.patch \
 	file://03-hipox-direct-switch.patch \
 	file://04-hipox-env.patch \
 	file://10-hipox-boot-abort-key.patch \
+	file://11-cfi-amic-fixup.patch \
 "
 
 TARGET_LDFLAGS = ""
-- 
1.7.1



