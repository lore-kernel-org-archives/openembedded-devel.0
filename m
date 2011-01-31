Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk19O-0001q6-L4
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 22:19:07 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 619D6EB2BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 22:18:13 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Al8wAJu1Rk1T4zjzPGdsb2JhbACkeAwBAQEBNS+9boVOBIwh
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="1710715218"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 31 Jan 2011 22:18:13 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 22:18:08 +0100
Message-Id: <1296508688-5770-8-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1296508688-5770-7-git-send-email-ulf.samuelsson@atmel.com>
References: <1296508688-5770-1-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-2-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-3-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-4-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-5-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-6-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-7-git-send-email-ulf.samuelsson@atmel.com>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v3 08/08] Remove some patches, which was moved by previous linux patch
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
X-List-Received-Date: Mon, 31 Jan 2011 21:19:07 -0000


Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 ....30-001-configurable-partition-size.patch.patch |  362 --------------------
 .../at91/linux-2.6.30-002-mach-at91-Kconfig.patch  |  196 -----------
 .../at91/linux-2.6.30-003-sam9m10g45ek.patch       |   29 --
 3 files changed, 0 insertions(+), 587 deletions(-)
 delete mode 100644 recipes/linux/linux-2.6.30/at91/linux-2.6.30-001-configurable-partition-size.patch.patch
 delete mode 100644 recipes/linux/linux-2.6.30/at91/linux-2.6.30-002-mach-at91-Kconfig.patch
 delete mode 100644 recipes/linux/linux-2.6.30/at91/linux-2.6.30-003-sam9m10g45ek.patch

diff --git a/recipes/linux/linux-2.6.30/at91/linux-2.6.30-001-configurable-partition-size.patch.patch b/recipes/linux/linux-2.6.30/at91/linux-2.6.30-001-configurable-partition-size.patch.patch
deleted file mode 100644
index ae24d12..0000000
--- a/recipes/linux/linux-2.6.30/at91/linux-2.6.30-001-configurable-partition-size.patch.patch
+++ /dev/null
@@ -1,362 +0,0 @@
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-at572d940hf_ek.c linux-2.6.30/arch/arm/mach-at91/board-at572d940hf_ek.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-at572d940hf_ek.c	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-at572d940hf_ek.c	2010-03-14 11:28:55.000000000 +0100
-@@ -114,10 +114,20 @@
-  */
- static struct mtd_partition __initdata eb_nand_partition[] = {
- 	{
--		.name	= "Partition 1",
--		.offset	= 0,
-+		.name   = "Bootstrap",
-+		.offset = 0,
-+		.size   = 4 * SZ_1M,
-+	},
-+	{
-+		.name	= "Root File System",
-+		.offset	= MTDPART_OFS_NXTBLK,
-+		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
-+	},
-+	{
-+		.name	= "Data",
-+		.offset	= MTDPART_OFS_NXTBLK,
- 		.size	= MTDPART_SIZ_FULL,
--	}
-+	},
- };
- 
- static struct mtd_partition * __init nand_partitions(int size, int *num_partitions)
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-cap9adk.c linux-2.6.30/arch/arm/mach-at91/board-cap9adk.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-cap9adk.c	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-cap9adk.c	2010-03-14 11:28:36.000000000 +0100
-@@ -167,8 +167,18 @@
-  */
- static struct mtd_partition __initdata cap9adk_nand_partitions[] = {
- 	{
--		.name	= "NAND partition",
--		.offset	= 0,
-+		.name   = "Bootstrap",
-+		.offset = 0,
-+		.size   = 4 * SZ_1M,
-+	},
-+	{
-+		.name	= "Root File System",
-+		.offset	= MTDPART_OFS_NXTBLK,
-+		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
-+	},
-+	{
-+		.name	= "Data",
-+		.offset	= MTDPART_OFS_NXTBLK,
- 		.size	= MTDPART_SIZ_FULL,
- 	},
- };
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-dk.c linux-2.6.30/arch/arm/mach-at91/board-dk.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-dk.c	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-dk.c	2010-03-14 11:28:43.000000000 +0100
-@@ -314,8 +314,18 @@
- 
- static struct mtd_partition __initdata dk_nand_partition[] = {
- 	{
--		.name	= "NAND Partition 1",
--		.offset	= 0,
-+		.name   = "Bootstrap",
-+		.offset = 0,
-+		.size   = 4 * SZ_1M,
-+	},
-+	{
-+		.name	= "Root File System",
-+		.offset	= MTDPART_OFS_NXTBLK,
-+		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
-+	},
-+	{
-+		.name	= "Data",
-+		.offset	= MTDPART_OFS_NXTBLK,
- 		.size	= MTDPART_SIZ_FULL,
- 	},
- };
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9260ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9260ek.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9260ek.c	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-sam9260ek.c	2010-03-14 11:26:57.000000000 +0100
-@@ -177,12 +177,17 @@
-  */
- static struct mtd_partition __initdata ek_nand_partition[] = {
- 	{
--		.name	= "Partition 1",
--		.offset	= 0,
--		.size	= SZ_256K,
-+		.name   = "Bootstrap",
-+		.offset = 0,
-+		.size   = 4 * SZ_1M,
- 	},
- 	{
--		.name	= "Partition 2",
-+		.name	= "Root File System",
-+		.offset	= MTDPART_OFS_NXTBLK,
-+		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
-+	},
-+	{
-+		.name	= "Data",
- 		.offset	= MTDPART_OFS_NXTBLK,
- 		.size	= MTDPART_SIZ_FULL,
- 	},
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9261ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9261ek.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9261ek.c	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-sam9261ek.c	2010-03-14 11:26:57.000000000 +0100
-@@ -184,12 +184,17 @@
-  */
- static struct mtd_partition __initdata ek_nand_partition[] = {
- 	{
--		.name	= "Partition 1",
--		.offset	= 0,
--		.size	= SZ_256K,
-+		.name   = "Bootstrap",
-+		.offset = 0,
-+		.size   = 4 * SZ_1M,
- 	},
- 	{
--		.name	= "Partition 2",
-+		.name	= "Root File System",
-+		.offset	= MTDPART_OFS_NXTBLK,
-+		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
-+	},
-+	{
-+		.name	= "Data",
- 		.offset	= MTDPART_OFS_NXTBLK,
- 		.size	= MTDPART_SIZ_FULL,
- 	},
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9263ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9263ek.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9263ek.c	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-sam9263ek.c	2010-03-14 11:26:57.000000000 +0100
-@@ -174,12 +174,17 @@
-  */
- static struct mtd_partition __initdata ek_nand_partition[] = {
- 	{
--		.name	= "Partition 1",
--		.offset	= 0,
--		.size	= SZ_64M,
-+		.name   = "Bootstrap",
-+		.offset = 0,
-+		.size   = 4 * SZ_1M,
- 	},
- 	{
--		.name	= "Partition 2",
-+		.name	= "Root File System",
-+		.offset	= MTDPART_OFS_NXTBLK,
-+		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
-+	},
-+	{
-+		.name	= "Data",
- 		.offset	= MTDPART_OFS_NXTBLK,
- 		.size	= MTDPART_SIZ_FULL,
- 	},
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c linux-2.6.30/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c	2010-03-14 11:28:29.000000000 +0100
-@@ -130,12 +130,12 @@
- 		.size   = 4 * SZ_1M,
- 	},
- 	{
--		.name	= "Partition 1",
-+		.name	= "Root File System",
- 		.offset	= MTDPART_OFS_NXTBLK,
--		.size	= 60 * SZ_1M,
-+		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
- 	},
- 	{
--		.name	= "Partition 2",
-+		.name	= "Data",
- 		.offset	= MTDPART_OFS_NXTBLK,
- 		.size	= MTDPART_SIZ_FULL,
- 	},
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9g20ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9g20ek.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9g20ek.c	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-sam9g20ek.c	2010-03-14 11:26:57.000000000 +0100
-@@ -129,12 +129,12 @@
- 		.size   = 4 * SZ_1M,
- 	},
- 	{
--		.name	= "Partition 1",
-+		.name	= "Root File System",
- 		.offset	= MTDPART_OFS_NXTBLK,
--		.size	= 60 * SZ_1M,
-+		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
- 	},
- 	{
--		.name	= "Partition 2",
-+		.name	= "Data",
- 		.offset	= MTDPART_OFS_NXTBLK,
- 		.size	= MTDPART_SIZ_FULL,
- 	},
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9m10g45ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9m10g45ek.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9m10g45ek.c	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-sam9m10g45ek.c	2010-03-14 11:26:57.000000000 +0100
-@@ -133,12 +133,17 @@
-  */
- static struct mtd_partition __initdata ek_nand_partition[] = {
- 	{
--		.name	= "Partition 1",
--		.offset	= 0,
--		.size	= SZ_64M,
-+		.name   = "Bootstrap",
-+		.offset = 0,
-+		.size   = 4 * SZ_1M,
- 	},
- 	{
--		.name	= "Partition 2",
-+		.name	= "Root File System",
-+		.offset	= MTDPART_OFS_NXTBLK,
-+		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
-+	},
-+	{
-+		.name	= "Data",
- 		.offset	= MTDPART_OFS_NXTBLK,
- 		.size	= MTDPART_SIZ_FULL,
- 	},
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9rlek.c linux-2.6.30/arch/arm/mach-at91/board-sam9rlek.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9rlek.c	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-sam9rlek.c	2010-03-14 11:26:57.000000000 +0100
-@@ -83,12 +83,17 @@
-  */
- static struct mtd_partition __initdata ek_nand_partition[] = {
- 	{
--		.name	= "Partition 1",
--		.offset	= 0,
--		.size	= SZ_256K,
-+		.name   = "Bootstrap",
-+		.offset = 0,
-+		.size   = 4 * SZ_1M,
- 	},
- 	{
--		.name	= "Partition 2",
-+		.name	= "Root File System",
-+		.offset	= MTDPART_OFS_NXTBLK,
-+		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
-+	},
-+	{
-+		.name	= "Data",
- 		.offset	= MTDPART_OFS_NXTBLK,
- 		.size	= MTDPART_SIZ_FULL,
- 	},
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/Kconfig linux-2.6.30/arch/arm/mach-at91/Kconfig
---- linux-2.6.30-0rig/arch/arm/mach-at91/Kconfig	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/Kconfig	2010-03-14 11:32:54.000000000 +0100
-@@ -96,6 +96,7 @@
- config ARCH_AT91RM9200DK
- 	bool "Atmel AT91RM9200-DK Development board"
- 	depends on ARCH_AT91RM9200
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using Atmel's AT91RM9200-DK Development board.
- 	  (Discontinued)
-@@ -213,6 +214,7 @@
- config MACH_AT91SAM9260EK
- 	bool "Atmel AT91SAM9260-EK / AT91SAM9XE Evaluation Kit"
- 	depends on ARCH_AT91SAM9260
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using Atmel's AT91SAM9260-EK or AT91SAM9XE Evaluation Kit
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3933>
-@@ -278,6 +280,7 @@
- config MACH_AT91SAM9261EK
- 	bool "Atmel AT91SAM9261-EK Evaluation Kit"
- 	depends on ARCH_AT91SAM9261
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using Atmel's AT91SAM9261-EK Evaluation Kit.
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3820>
-@@ -293,6 +296,7 @@
- config MACH_AT91SAM9G10EK
- 	bool "Atmel AT91SAM9G10-EK Evaluation Kit"
- 	depends on ARCH_AT91SAM9G10
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using Atmel's AT91SAM9G10-EK Evaluation Kit.
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4588>
-@@ -308,6 +312,7 @@
- config MACH_AT91SAM9263EK
- 	bool "Atmel AT91SAM9263-EK Evaluation Kit"
- 	depends on ARCH_AT91SAM9263
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using Atmel's AT91SAM9263-EK Evaluation Kit.
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4057>
-@@ -350,6 +355,7 @@
- config MACH_AT91SAM9RLEK
- 	bool "Atmel AT91SAM9RL-EK Evaluation Kit"
- 	depends on ARCH_AT91SAM9RL
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using Atmel's AT91SAM9RL-EK Evaluation Kit.
- 
-@@ -364,6 +370,7 @@
- config MACH_AT91SAM9G20EK
- 	bool "Atmel AT91SAM9G20-EK Evaluation Kit"
- 	depends on ARCH_AT91SAM9G20
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using Atmel's AT91SAM9G20-EK Evaluation Kit
- 	  that embeds only one SD/MMC slot.
-@@ -371,6 +378,7 @@
- config MACH_AT91SAM9G20EK_2MMC
- 	bool "Atmel AT91SAM9G20-EK Evaluation Kit with 2 SD/MMC Slots"
- 	depends on ARCH_AT91SAM9G20
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using an Atmel AT91SAM9G20-EK Evaluation Kit
- 	  with 2 SD/MMC Slots. This is the case for AT91SAM9G20-EK rev. C and
-@@ -408,6 +416,7 @@
- config MACH_AT91SAM9G45EKES
- 	bool "Atmel AT91SAM9G45-EKES Evaluation Kit"
- 	depends on ARCH_AT91SAM9G45
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using Atmel's AT91SAM9G45-EKES Evaluation Kit.
- 	  "ES" at the end of the name means that this board is an
-@@ -424,6 +433,7 @@
- config MACH_AT91SAM9M10EKES
-         bool "Atmel AT91SAM9M10-EKES Evaluation Kit"
-         depends on ARCH_AT91SAM9M10
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-         help
-           Select this if you are using Atmel's AT91SAM9M10-EKES Evaluation Kit.
-           "ES" at the end of the name means that this board is an
-@@ -440,6 +450,7 @@
- config MACH_AT91CAP9ADK
- 	bool "Atmel AT91CAP9A-DK Evaluation Kit"
- 	depends on ARCH_AT91CAP9
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using Atmel's AT91CAP9A-DK Evaluation Kit.
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4138>
-@@ -455,6 +466,7 @@
- config MACH_AT572D940HFEB
- 	bool "AT572D940HF-EK"
- 	depends on ARCH_AT572D940HF
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
- 	help
- 	  Select this if you are using Atmel's AT572D940HF-EK evaluation kit.
- 	  <http://www.atmel.com/products/diopsis/default.asp>
-@@ -494,6 +506,24 @@
- 	  On AT91SAM926x boards both types of NAND flash can be present
- 	  (8 and 16 bit data bus width).
- 
-+config MTD_NAND_ATMEL_ROOTFS_SIZE
-+	int "Size NAND rootfs in MB"
-+	range 8 250
-+	depends on MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	default "124"
-+	help
-+	  Many Atmel development boards has a NAND Flash, 
-+	  divided into three partitions.
-+          1) Boot partition (4 MB)
-+	  2) Root FS
-+	  3) Data partition
-+	  This allows you to configure the size of the root fs
-+	  with the remainder ending up in the data partition.
-+	  The legal values are between 8 and 250
-+
-+config MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	bool
-+
- # ----------------------------------------------------------
- 
- comment "AT91 Feature Selections"
diff --git a/recipes/linux/linux-2.6.30/at91/linux-2.6.30-002-mach-at91-Kconfig.patch b/recipes/linux/linux-2.6.30/at91/linux-2.6.30-002-mach-at91-Kconfig.patch
deleted file mode 100644
index a2d3965..0000000
--- a/recipes/linux/linux-2.6.30/at91/linux-2.6.30-002-mach-at91-Kconfig.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/Kconfig linux-2.6.30/arch/arm/mach-at91/Kconfig
---- linux-2.6.30-0rig/arch/arm/mach-at91/Kconfig	2010-03-14 11:41:36.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/Kconfig	2010-03-14 12:00:27.000000000 +0100
-@@ -97,6 +97,7 @@
- 	bool "Atmel AT91RM9200-DK Development board"
- 	depends on ARCH_AT91RM9200
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Atmel's AT91RM9200-DK Development board.
- 	  (Discontinued)
-@@ -104,6 +105,7 @@
- config MACH_AT91RM9200EK
- 	bool "Atmel AT91RM9200-EK Evaluation Kit"
- 	depends on ARCH_AT91RM9200
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Atmel's AT91RM9200-EK Evaluation Kit.
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3507>
-@@ -172,6 +174,7 @@
- config MACH_ECBAT91
- 	bool "emQbit ECB_AT91 SBC"
- 	depends on ARCH_AT91RM9200
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using emQbit's ECB_AT91 board.
- 	  <http://wiki.emqbit.com/free-ecb-at91>
-@@ -215,6 +218,8 @@
- 	bool "Atmel AT91SAM9260-EK / AT91SAM9XE Evaluation Kit"
- 	depends on ARCH_AT91SAM9260
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Atmel's AT91SAM9260-EK or AT91SAM9XE Evaluation Kit
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3933>
-@@ -229,6 +234,7 @@
- config MACH_SAM9_L9260
- 	bool "Olimex SAM9-L9260 board"
- 	depends on ARCH_AT91SAM9260
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Olimex's SAM9-L9260 board based on the Atmel AT91SAM9260.
- 	  <http://www.olimex.com/dev/sam9-L9260.html>
-@@ -281,6 +287,8 @@
- 	bool "Atmel AT91SAM9261-EK Evaluation Kit"
- 	depends on ARCH_AT91SAM9261
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Atmel's AT91SAM9261-EK Evaluation Kit.
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3820>
-@@ -297,6 +305,8 @@
- 	bool "Atmel AT91SAM9G10-EK Evaluation Kit"
- 	depends on ARCH_AT91SAM9G10
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Atmel's AT91SAM9G10-EK Evaluation Kit.
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4588>
-@@ -313,6 +323,8 @@
- 	bool "Atmel AT91SAM9263-EK Evaluation Kit"
- 	depends on ARCH_AT91SAM9263
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Atmel's AT91SAM9263-EK Evaluation Kit.
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4057>
-@@ -334,6 +346,7 @@
- config MACH_TOTEMNOVA
- 	bool "TotemNova Micronova industrial supervisor"
- 	depends on ARCH_AT91SAM9263
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Micronova's TotemNova industrial supervisor
- 	  <http://www.micronovasrl.com>
-@@ -341,6 +354,7 @@
- config MACH_NEOCORE926
- 	bool "Adeneo NEOCORE926"
- 	depends on ARCH_AT91SAM9263
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using the Adeneo Neocore 926 board.
- 
-@@ -371,6 +385,8 @@
- 	bool "Atmel AT91SAM9G20-EK Evaluation Kit"
- 	depends on ARCH_AT91SAM9G20
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Atmel's AT91SAM9G20-EK Evaluation Kit
- 	  that embeds only one SD/MMC slot.
-@@ -379,6 +395,7 @@
- 	bool "Atmel AT91SAM9G20-EK Evaluation Kit with 2 SD/MMC Slots"
- 	depends on ARCH_AT91SAM9G20
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
- 	help
- 	  Select this if you are using an Atmel AT91SAM9G20-EK Evaluation Kit
- 	  with 2 SD/MMC Slots. This is the case for AT91SAM9G20-EK rev. C and
-@@ -417,13 +434,23 @@
- 	bool "Atmel AT91SAM9G45-EKES Evaluation Kit"
- 	depends on ARCH_AT91SAM9G45
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
- 	help
- 	  Select this if you are using Atmel's AT91SAM9G45-EKES Evaluation Kit.
- 	  "ES" at the end of the name means that this board is an
- 	  Engineering Sample.
- 
--endif
-+config MACH_AT91SAM9M10G45EK
-+	bool "Atmel AT91SAM9M10G45-EK Evaluation Kit"
-+	depends on ARCH_AT91SAM9G45
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-+	help
-+	  Select this if you are using Atmel's AT91SAM9M10G45-EK Evaluation Kit.
-+	  "ES2" at the end of the name means that this board is an
-+	  Engineering Sample.
- 
-+endif
- # ----------------------------------------------------------
- 
- if ARCH_AT91SAM9M10
-@@ -434,11 +461,22 @@
-         bool "Atmel AT91SAM9M10-EKES Evaluation Kit"
-         depends on ARCH_AT91SAM9M10
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-         help
-           Select this if you are using Atmel's AT91SAM9M10-EKES Evaluation Kit.
-           "ES" at the end of the name means that this board is an
-           Engineering Sample.
- 
-+config MACH_AT91SAM9M10G45EK
-+	bool "Atmel AT91SAM9M10G45-EK Evaluation Kit"
-+       depends on ARCH_AT91SAM9M10
-+	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-+	help
-+	  Select this if you are using Atmel's AT91SAM9M10G45-EK Evaluation Kit.
-+	  "ES2" at the end of the name means that this board is an
-+	  Engineering Sample.
-+
- endif
- 
- # ----------------------------------------------------------
-@@ -451,6 +489,8 @@
- 	bool "Atmel AT91CAP9A-DK Evaluation Kit"
- 	depends on ARCH_AT91CAP9
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Atmel's AT91CAP9A-DK Evaluation Kit.
- 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4138>
-@@ -467,6 +507,8 @@
- 	bool "AT572D940HF-EK"
- 	depends on ARCH_AT572D940HF
- 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
-+	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-+	select	MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Select this if you are using Atmel's AT572D940HF-EK evaluation kit.
- 	  <http://www.atmel.com/products/diopsis/default.asp>
-@@ -495,17 +537,23 @@
- 
- config MTD_AT91_DATAFLASH_CARD
- 	bool "Enable DataFlash Card support"
--	depends on (ARCH_AT91RM9200DK || MACH_AT91RM9200EK || MACH_AT91SAM9260EK || MACH_AT91SAM9261EK || MACH_AT91SAM9G10EK || MACH_AT91SAM9263EK || MACH_AT91SAM9G20EK || MACH_ECBAT91 || MACH_SAM9_L9260 || MACH_AT91CAP9ADK || MACH_AT572D940HFEB || MACH_TOTEMNOVA || MACH_NEOCORE926)
-+	depends on MTD_ALLOW_DATAFLASHCARD
- 	help
- 	  Enable support for the DataFlash card.
- 
-+config MTD_ALLOW_DATAFLASHCARD
-+	bool
-+
- config MTD_NAND_ATMEL_BUSWIDTH_16
- 	bool "Enable 16-bit data bus interface to NAND flash"
--	depends on (MACH_AT91SAM9260EK || MACH_AT91SAM9261EK || MACH_AT91SAM9G10EK || MACH_AT91SAM9263EK || MACH_AT91SAM9G20EK || MACH_AT91SAM9G20EK_2MMC || MACH_AT91SAM9G45EKES || MACH_AT91CAP9ADK || MACH_AT572D940HFEB)
-+	depends on MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
- 	help
- 	  On AT91SAM926x boards both types of NAND flash can be present
- 	  (8 and 16 bit data bus width).
- 
-+config MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
-+	bool
-+
- config MTD_NAND_ATMEL_ROOTFS_SIZE
- 	int "Size NAND rootfs in MB"
- 	range 8 250
diff --git a/recipes/linux/linux-2.6.30/at91/linux-2.6.30-003-sam9m10g45ek.patch b/recipes/linux/linux-2.6.30/at91/linux-2.6.30-003-sam9m10g45ek.patch
deleted file mode 100644
index 05a81bf..0000000
--- a/recipes/linux/linux-2.6.30/at91/linux-2.6.30-003-sam9m10g45ek.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9m10g45ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9m10g45ek.c
---- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9m10g45ek.c	2010-03-14 11:41:36.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/board-sam9m10g45ek.c	2010-03-14 12:07:05.000000000 +0100
-@@ -432,9 +432,13 @@
- 
- #if defined(CONFIG_MACH_AT91SAM9G45EKES)
- MACHINE_START(AT91SAM9G45EKES, "Atmel AT91SAM9G45-EKES")
--#else
-+#endif
-+#if defined(CONFIG_MACH_AT91SAM9M10EKES)
- MACHINE_START(AT91SAM9M10EKES, "Atmel AT91SAM9M10-EKES")
- #endif
-+#if defined(CONFIG_MACH_AT91SAM9M10G45EK)
-+MACHINE_START(AT91SAM9M10G45EK, "Atmel AT91SAM9M10G45-EK")
-+#endif
- 	/* Maintainer: Atmel */
- 	.phys_io	= AT91_BASE_SYS,
- 	.io_pg_offst	= (AT91_VA_BASE_SYS >> 18) & 0xfffc,
-diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/Makefile linux-2.6.30/arch/arm/mach-at91/Makefile
---- linux-2.6.30-0rig/arch/arm/mach-at91/Makefile	2010-03-14 11:13:34.000000000 +0100
-+++ linux-2.6.30/arch/arm/mach-at91/Makefile	2010-03-14 12:08:01.000000000 +0100
-@@ -74,6 +74,7 @@
- # AT91SAM9G45 board-specific support
- obj-$(CONFIG_MACH_AT91SAM9G45EKES) += board-sam9m10g45ek.o
- obj-$(CONFIG_MACH_AT91SAM9M10EKES) += board-sam9m10g45ek.o
-+obj-$(CONFIG_MACH_AT91SAM9M10G45EK) += board-sam9m10g45ek.o
- 
- # AT91CAP9 board-specific support
- obj-$(CONFIG_MACH_AT91CAP9ADK)	+= board-cap9adk.o
-- 
1.6.3.3



