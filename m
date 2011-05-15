Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLWNY-0001bX-RM
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 10:08:49 +0200
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id DC6C4EAA3E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 09:39:47 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ais3AD6Cz01T4zkqPGdsb2JhbACmFAsBAQEBNzK8MAGMDYYZBJARjnc
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="11310692"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.42])
	by ipb3.telenor.se with ESMTP; 15 May 2011 09:39:47 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 09:39:44 +0200
Message-Id: <1305445184-3972-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] Update AT91 linux-2.6.30 support
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
X-List-Received-Date: Sun, 15 May 2011 08:08:49 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Support use of exp.4 patch for SAM9M10EKES
Download exp.4 patchset and apply each patch
Add MCI patch to allow use of H&D Wireless HDG104 Wi-Fi SIP

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 ...ux-2.6.30-001-configurable-partition-size.patch |  362 ++++++++++++++++++
 .../exp.2/linux-2.6.30-002-mach-at91-Kconfig.patch |  196 ++++++++++
 .../at91/exp.2/linux-2.6.30-003-sam9m10g45ek.patch |   29 ++
 .../exp.4/0001-Configurable-partition-size.patch   |  403 ++++++++++++++++++++
 .../exp.4/0002-mach-at91-KConfig-cleanup.patch     |  202 ++++++++++
 recipes/linux/linux_2.6.30.bb                      |   47 +++-
 6 files changed, 1237 insertions(+), 2 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-001-configurable-partition-size.patch
 create mode 100644 recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-002-mach-at91-Kconfig.patch
 create mode 100644 recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-003-sam9m10g45ek.patch
 create mode 100644 recipes/linux/linux-2.6.30/at91/exp.4/0001-Configurable-partition-size.patch
 create mode 100644 recipes/linux/linux-2.6.30/at91/exp.4/0002-mach-at91-KConfig-cleanup.patch

diff --git a/recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-001-configurable-partition-size.patch b/recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-001-configurable-partition-size.patch
new file mode 100644
index 0000000..ae24d12
--- /dev/null
+++ b/recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-001-configurable-partition-size.patch
@@ -0,0 +1,362 @@
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-at572d940hf_ek.c linux-2.6.30/arch/arm/mach-at91/board-at572d940hf_ek.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-at572d940hf_ek.c	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-at572d940hf_ek.c	2010-03-14 11:28:55.000000000 +0100
+@@ -114,10 +114,20 @@
+  */
+ static struct mtd_partition __initdata eb_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
++	},
++	{
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
++		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+-	}
++	},
+ };
+ 
+ static struct mtd_partition * __init nand_partitions(int size, int *num_partitions)
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-cap9adk.c linux-2.6.30/arch/arm/mach-at91/board-cap9adk.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-cap9adk.c	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-cap9adk.c	2010-03-14 11:28:36.000000000 +0100
+@@ -167,8 +167,18 @@
+  */
+ static struct mtd_partition __initdata cap9adk_nand_partitions[] = {
+ 	{
+-		.name	= "NAND partition",
+-		.offset	= 0,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
++	},
++	{
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
++		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+ };
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-dk.c linux-2.6.30/arch/arm/mach-at91/board-dk.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-dk.c	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-dk.c	2010-03-14 11:28:43.000000000 +0100
+@@ -314,8 +314,18 @@
+ 
+ static struct mtd_partition __initdata dk_nand_partition[] = {
+ 	{
+-		.name	= "NAND Partition 1",
+-		.offset	= 0,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
++	},
++	{
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
++		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+ };
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9260ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9260ek.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9260ek.c	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-sam9260ek.c	2010-03-14 11:26:57.000000000 +0100
+@@ -177,12 +177,17 @@
+  */
+ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
+-		.size	= SZ_256K,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9261ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9261ek.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9261ek.c	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-sam9261ek.c	2010-03-14 11:26:57.000000000 +0100
+@@ -184,12 +184,17 @@
+  */
+ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
+-		.size	= SZ_256K,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9263ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9263ek.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9263ek.c	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-sam9263ek.c	2010-03-14 11:26:57.000000000 +0100
+@@ -174,12 +174,17 @@
+  */
+ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
+-		.size	= SZ_64M,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c linux-2.6.30/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c	2010-03-14 11:28:29.000000000 +0100
+@@ -130,12 +130,12 @@
+ 		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 1",
++		.name	= "Root File System",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+-		.size	= 60 * SZ_1M,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9g20ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9g20ek.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9g20ek.c	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-sam9g20ek.c	2010-03-14 11:26:57.000000000 +0100
+@@ -129,12 +129,12 @@
+ 		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 1",
++		.name	= "Root File System",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+-		.size	= 60 * SZ_1M,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9m10g45ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9m10g45ek.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9m10g45ek.c	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-sam9m10g45ek.c	2010-03-14 11:26:57.000000000 +0100
+@@ -133,12 +133,17 @@
+  */
+ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
+-		.size	= SZ_64M,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9rlek.c linux-2.6.30/arch/arm/mach-at91/board-sam9rlek.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9rlek.c	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-sam9rlek.c	2010-03-14 11:26:57.000000000 +0100
+@@ -83,12 +83,17 @@
+  */
+ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
+-		.size	= SZ_256K,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/Kconfig linux-2.6.30/arch/arm/mach-at91/Kconfig
+--- linux-2.6.30-0rig/arch/arm/mach-at91/Kconfig	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/Kconfig	2010-03-14 11:32:54.000000000 +0100
+@@ -96,6 +96,7 @@
+ config ARCH_AT91RM9200DK
+ 	bool "Atmel AT91RM9200-DK Development board"
+ 	depends on ARCH_AT91RM9200
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91RM9200-DK Development board.
+ 	  (Discontinued)
+@@ -213,6 +214,7 @@
+ config MACH_AT91SAM9260EK
+ 	bool "Atmel AT91SAM9260-EK / AT91SAM9XE Evaluation Kit"
+ 	depends on ARCH_AT91SAM9260
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9260-EK or AT91SAM9XE Evaluation Kit
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3933>
+@@ -278,6 +280,7 @@
+ config MACH_AT91SAM9261EK
+ 	bool "Atmel AT91SAM9261-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9261
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9261-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3820>
+@@ -293,6 +296,7 @@
+ config MACH_AT91SAM9G10EK
+ 	bool "Atmel AT91SAM9G10-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G10
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G10-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4588>
+@@ -308,6 +312,7 @@
+ config MACH_AT91SAM9263EK
+ 	bool "Atmel AT91SAM9263-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9263
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9263-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4057>
+@@ -350,6 +355,7 @@
+ config MACH_AT91SAM9RLEK
+ 	bool "Atmel AT91SAM9RL-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9RL
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9RL-EK Evaluation Kit.
+ 
+@@ -364,6 +370,7 @@
+ config MACH_AT91SAM9G20EK
+ 	bool "Atmel AT91SAM9G20-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G20
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G20-EK Evaluation Kit
+ 	  that embeds only one SD/MMC slot.
+@@ -371,6 +378,7 @@
+ config MACH_AT91SAM9G20EK_2MMC
+ 	bool "Atmel AT91SAM9G20-EK Evaluation Kit with 2 SD/MMC Slots"
+ 	depends on ARCH_AT91SAM9G20
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using an Atmel AT91SAM9G20-EK Evaluation Kit
+ 	  with 2 SD/MMC Slots. This is the case for AT91SAM9G20-EK rev. C and
+@@ -408,6 +416,7 @@
+ config MACH_AT91SAM9G45EKES
+ 	bool "Atmel AT91SAM9G45-EKES Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G45
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G45-EKES Evaluation Kit.
+ 	  "ES" at the end of the name means that this board is an
+@@ -424,6 +433,7 @@
+ config MACH_AT91SAM9M10EKES
+         bool "Atmel AT91SAM9M10-EKES Evaluation Kit"
+         depends on ARCH_AT91SAM9M10
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+         help
+           Select this if you are using Atmel's AT91SAM9M10-EKES Evaluation Kit.
+           "ES" at the end of the name means that this board is an
+@@ -440,6 +450,7 @@
+ config MACH_AT91CAP9ADK
+ 	bool "Atmel AT91CAP9A-DK Evaluation Kit"
+ 	depends on ARCH_AT91CAP9
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91CAP9A-DK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4138>
+@@ -455,6 +466,7 @@
+ config MACH_AT572D940HFEB
+ 	bool "AT572D940HF-EK"
+ 	depends on ARCH_AT572D940HF
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT572D940HF-EK evaluation kit.
+ 	  <http://www.atmel.com/products/diopsis/default.asp>
+@@ -494,6 +506,24 @@
+ 	  On AT91SAM926x boards both types of NAND flash can be present
+ 	  (8 and 16 bit data bus width).
+ 
++config MTD_NAND_ATMEL_ROOTFS_SIZE
++	int "Size NAND rootfs in MB"
++	range 8 250
++	depends on MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	default "124"
++	help
++	  Many Atmel development boards has a NAND Flash, 
++	  divided into three partitions.
++          1) Boot partition (4 MB)
++	  2) Root FS
++	  3) Data partition
++	  This allows you to configure the size of the root fs
++	  with the remainder ending up in the data partition.
++	  The legal values are between 8 and 250
++
++config MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	bool
++
+ # ----------------------------------------------------------
+ 
+ comment "AT91 Feature Selections"
diff --git a/recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-002-mach-at91-Kconfig.patch b/recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-002-mach-at91-Kconfig.patch
new file mode 100644
index 0000000..a2d3965
--- /dev/null
+++ b/recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-002-mach-at91-Kconfig.patch
@@ -0,0 +1,196 @@
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/Kconfig linux-2.6.30/arch/arm/mach-at91/Kconfig
+--- linux-2.6.30-0rig/arch/arm/mach-at91/Kconfig	2010-03-14 11:41:36.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/Kconfig	2010-03-14 12:00:27.000000000 +0100
+@@ -97,6 +97,7 @@
+ 	bool "Atmel AT91RM9200-DK Development board"
+ 	depends on ARCH_AT91RM9200
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91RM9200-DK Development board.
+ 	  (Discontinued)
+@@ -104,6 +105,7 @@
+ config MACH_AT91RM9200EK
+ 	bool "Atmel AT91RM9200-EK Evaluation Kit"
+ 	depends on ARCH_AT91RM9200
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91RM9200-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3507>
+@@ -172,6 +174,7 @@
+ config MACH_ECBAT91
+ 	bool "emQbit ECB_AT91 SBC"
+ 	depends on ARCH_AT91RM9200
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using emQbit's ECB_AT91 board.
+ 	  <http://wiki.emqbit.com/free-ecb-at91>
+@@ -215,6 +218,8 @@
+ 	bool "Atmel AT91SAM9260-EK / AT91SAM9XE Evaluation Kit"
+ 	depends on ARCH_AT91SAM9260
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9260-EK or AT91SAM9XE Evaluation Kit
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3933>
+@@ -229,6 +234,7 @@
+ config MACH_SAM9_L9260
+ 	bool "Olimex SAM9-L9260 board"
+ 	depends on ARCH_AT91SAM9260
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Olimex's SAM9-L9260 board based on the Atmel AT91SAM9260.
+ 	  <http://www.olimex.com/dev/sam9-L9260.html>
+@@ -281,6 +287,8 @@
+ 	bool "Atmel AT91SAM9261-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9261
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9261-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3820>
+@@ -297,6 +305,8 @@
+ 	bool "Atmel AT91SAM9G10-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G10
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G10-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4588>
+@@ -313,6 +323,8 @@
+ 	bool "Atmel AT91SAM9263-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9263
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9263-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4057>
+@@ -334,6 +346,7 @@
+ config MACH_TOTEMNOVA
+ 	bool "TotemNova Micronova industrial supervisor"
+ 	depends on ARCH_AT91SAM9263
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Micronova's TotemNova industrial supervisor
+ 	  <http://www.micronovasrl.com>
+@@ -341,6 +354,7 @@
+ config MACH_NEOCORE926
+ 	bool "Adeneo NEOCORE926"
+ 	depends on ARCH_AT91SAM9263
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using the Adeneo Neocore 926 board.
+ 
+@@ -371,6 +385,8 @@
+ 	bool "Atmel AT91SAM9G20-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G20
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G20-EK Evaluation Kit
+ 	  that embeds only one SD/MMC slot.
+@@ -379,6 +395,7 @@
+ 	bool "Atmel AT91SAM9G20-EK Evaluation Kit with 2 SD/MMC Slots"
+ 	depends on ARCH_AT91SAM9G20
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
+ 	help
+ 	  Select this if you are using an Atmel AT91SAM9G20-EK Evaluation Kit
+ 	  with 2 SD/MMC Slots. This is the case for AT91SAM9G20-EK rev. C and
+@@ -417,13 +434,23 @@
+ 	bool "Atmel AT91SAM9G45-EKES Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G45
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G45-EKES Evaluation Kit.
+ 	  "ES" at the end of the name means that this board is an
+ 	  Engineering Sample.
+ 
+-endif
++config MACH_AT91SAM9M10G45EK
++	bool "Atmel AT91SAM9M10G45-EK Evaluation Kit"
++	depends on ARCH_AT91SAM9G45
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	help
++	  Select this if you are using Atmel's AT91SAM9M10G45-EK Evaluation Kit.
++	  "ES2" at the end of the name means that this board is an
++	  Engineering Sample.
+ 
++endif
+ # ----------------------------------------------------------
+ 
+ if ARCH_AT91SAM9M10
+@@ -434,11 +461,22 @@
+         bool "Atmel AT91SAM9M10-EKES Evaluation Kit"
+         depends on ARCH_AT91SAM9M10
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
+         help
+           Select this if you are using Atmel's AT91SAM9M10-EKES Evaluation Kit.
+           "ES" at the end of the name means that this board is an
+           Engineering Sample.
+ 
++config MACH_AT91SAM9M10G45EK
++	bool "Atmel AT91SAM9M10G45-EK Evaluation Kit"
++       depends on ARCH_AT91SAM9M10
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	help
++	  Select this if you are using Atmel's AT91SAM9M10G45-EK Evaluation Kit.
++	  "ES2" at the end of the name means that this board is an
++	  Engineering Sample.
++
+ endif
+ 
+ # ----------------------------------------------------------
+@@ -451,6 +489,8 @@
+ 	bool "Atmel AT91CAP9A-DK Evaluation Kit"
+ 	depends on ARCH_AT91CAP9
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91CAP9A-DK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4138>
+@@ -467,6 +507,8 @@
+ 	bool "AT572D940HF-EK"
+ 	depends on ARCH_AT572D940HF
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT572D940HF-EK evaluation kit.
+ 	  <http://www.atmel.com/products/diopsis/default.asp>
+@@ -495,17 +537,23 @@
+ 
+ config MTD_AT91_DATAFLASH_CARD
+ 	bool "Enable DataFlash Card support"
+-	depends on (ARCH_AT91RM9200DK || MACH_AT91RM9200EK || MACH_AT91SAM9260EK || MACH_AT91SAM9261EK || MACH_AT91SAM9G10EK || MACH_AT91SAM9263EK || MACH_AT91SAM9G20EK || MACH_ECBAT91 || MACH_SAM9_L9260 || MACH_AT91CAP9ADK || MACH_AT572D940HFEB || MACH_TOTEMNOVA || MACH_NEOCORE926)
++	depends on MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Enable support for the DataFlash card.
+ 
++config MTD_ALLOW_DATAFLASHCARD
++	bool
++
+ config MTD_NAND_ATMEL_BUSWIDTH_16
+ 	bool "Enable 16-bit data bus interface to NAND flash"
+-	depends on (MACH_AT91SAM9260EK || MACH_AT91SAM9261EK || MACH_AT91SAM9G10EK || MACH_AT91SAM9263EK || MACH_AT91SAM9G20EK || MACH_AT91SAM9G20EK_2MMC || MACH_AT91SAM9G45EKES || MACH_AT91CAP9ADK || MACH_AT572D940HFEB)
++	depends on MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
+ 	help
+ 	  On AT91SAM926x boards both types of NAND flash can be present
+ 	  (8 and 16 bit data bus width).
+ 
++config MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	bool
++
+ config MTD_NAND_ATMEL_ROOTFS_SIZE
+ 	int "Size NAND rootfs in MB"
+ 	range 8 250
diff --git a/recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-003-sam9m10g45ek.patch b/recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-003-sam9m10g45ek.patch
new file mode 100644
index 0000000..05a81bf
--- /dev/null
+++ b/recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-003-sam9m10g45ek.patch
@@ -0,0 +1,29 @@
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9m10g45ek.c linux-2.6.30/arch/arm/mach-at91/board-sam9m10g45ek.c
+--- linux-2.6.30-0rig/arch/arm/mach-at91/board-sam9m10g45ek.c	2010-03-14 11:41:36.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/board-sam9m10g45ek.c	2010-03-14 12:07:05.000000000 +0100
+@@ -432,9 +432,13 @@
+ 
+ #if defined(CONFIG_MACH_AT91SAM9G45EKES)
+ MACHINE_START(AT91SAM9G45EKES, "Atmel AT91SAM9G45-EKES")
+-#else
++#endif
++#if defined(CONFIG_MACH_AT91SAM9M10EKES)
+ MACHINE_START(AT91SAM9M10EKES, "Atmel AT91SAM9M10-EKES")
+ #endif
++#if defined(CONFIG_MACH_AT91SAM9M10G45EK)
++MACHINE_START(AT91SAM9M10G45EK, "Atmel AT91SAM9M10G45-EK")
++#endif
+ 	/* Maintainer: Atmel */
+ 	.phys_io	= AT91_BASE_SYS,
+ 	.io_pg_offst	= (AT91_VA_BASE_SYS >> 18) & 0xfffc,
+diff -urN linux-2.6.30-0rig/arch/arm/mach-at91/Makefile linux-2.6.30/arch/arm/mach-at91/Makefile
+--- linux-2.6.30-0rig/arch/arm/mach-at91/Makefile	2010-03-14 11:13:34.000000000 +0100
++++ linux-2.6.30/arch/arm/mach-at91/Makefile	2010-03-14 12:08:01.000000000 +0100
+@@ -74,6 +74,7 @@
+ # AT91SAM9G45 board-specific support
+ obj-$(CONFIG_MACH_AT91SAM9G45EKES) += board-sam9m10g45ek.o
+ obj-$(CONFIG_MACH_AT91SAM9M10EKES) += board-sam9m10g45ek.o
++obj-$(CONFIG_MACH_AT91SAM9M10G45EK) += board-sam9m10g45ek.o
+ 
+ # AT91CAP9 board-specific support
+ obj-$(CONFIG_MACH_AT91CAP9ADK)	+= board-cap9adk.o
diff --git a/recipes/linux/linux-2.6.30/at91/exp.4/0001-Configurable-partition-size.patch b/recipes/linux/linux-2.6.30/at91/exp.4/0001-Configurable-partition-size.patch
new file mode 100644
index 0000000..d384e5c
--- /dev/null
+++ b/recipes/linux/linux-2.6.30/at91/exp.4/0001-Configurable-partition-size.patch
@@ -0,0 +1,403 @@
+From ed00f95d313707ff049d8a2edd283d5496a85cbf Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Wed, 26 Jan 2011 09:21:10 +0100
+Subject: [PATCH 1/2] Configurable partition size
+
+---
+ arch/arm/mach-at91/Kconfig                     |   31 ++++++++++++++++++++++++
+ arch/arm/mach-at91/board-at572d940hf_ek.c      |   16 ++++++++++--
+ arch/arm/mach-at91/board-cap9adk.c             |   14 +++++++++-
+ arch/arm/mach-at91/board-dk.c                  |   14 +++++++++-
+ arch/arm/mach-at91/board-sam9260ek.c           |   13 +++++++---
+ arch/arm/mach-at91/board-sam9261ek.c           |   13 +++++++---
+ arch/arm/mach-at91/board-sam9263ek.c           |   13 +++++++---
+ arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c |    6 ++--
+ arch/arm/mach-at91/board-sam9g20ek.c           |    6 ++--
+ arch/arm/mach-at91/board-sam9m10g45ek.c        |   13 +++++++---
+ arch/arm/mach-at91/board-sam9rlek.c            |   13 +++++++---
+ 11 files changed, 119 insertions(+), 33 deletions(-)
+
+diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
+index 17e09cb..46d1926 100644
+--- a/arch/arm/mach-at91/Kconfig
++++ b/arch/arm/mach-at91/Kconfig
+@@ -96,6 +96,7 @@ config MACH_ONEARM
+ config ARCH_AT91RM9200DK
+ 	bool "Atmel AT91RM9200-DK Development board"
+ 	depends on ARCH_AT91RM9200
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91RM9200-DK Development board.
+ 	  (Discontinued)
+@@ -213,6 +214,7 @@ comment "AT91SAM9260 / AT91SAM9XE Board Type"
+ config MACH_AT91SAM9260EK
+ 	bool "Atmel AT91SAM9260-EK / AT91SAM9XE Evaluation Kit"
+ 	depends on ARCH_AT91SAM9260
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9260-EK or AT91SAM9XE Evaluation Kit
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3933>
+@@ -278,6 +280,7 @@ comment "AT91SAM9261 Board Type"
+ config MACH_AT91SAM9261EK
+ 	bool "Atmel AT91SAM9261-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9261
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9261-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3820>
+@@ -293,6 +296,7 @@ comment "AT91SAM9G10 Board Type"
+ config MACH_AT91SAM9G10EK
+ 	bool "Atmel AT91SAM9G10-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G10
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G10-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4588>
+@@ -308,6 +312,7 @@ comment "AT91SAM9263 Board Type"
+ config MACH_AT91SAM9263EK
+ 	bool "Atmel AT91SAM9263-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9263
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9263-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4057>
+@@ -350,6 +355,7 @@ comment "AT91SAM9RL Board Type"
+ config MACH_AT91SAM9RLEK
+ 	bool "Atmel AT91SAM9RL-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9RL
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9RL-EK Evaluation Kit.
+ 
+@@ -364,6 +370,7 @@ comment "AT91SAM9G20 Board Type"
+ config MACH_AT91SAM9G20EK
+ 	bool "Atmel AT91SAM9G20-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G20
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G20-EK Evaluation Kit
+ 	  that embeds only one SD/MMC slot.
+@@ -371,6 +378,7 @@ config MACH_AT91SAM9G20EK
+ config MACH_AT91SAM9G20EK_2MMC
+ 	bool "Atmel AT91SAM9G20-EK Evaluation Kit with 2 SD/MMC Slots"
+ 	depends on ARCH_AT91SAM9G20
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using an Atmel AT91SAM9G20-EK Evaluation Kit
+ 	  with 2 SD/MMC Slots. This is the case for AT91SAM9G20-EK rev. C and
+@@ -408,6 +416,7 @@ comment "AT91SAM9G45 Board Type"
+ config MACH_AT91SAM9G45EKES
+ 	bool "Atmel AT91SAM9G45-EKES Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G45
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G45-EKES Evaluation Kit.
+ 	  "ES" at the end of the name means that this board is an
+@@ -426,6 +435,7 @@ choice
+ 
+ config MACH_AT91SAM9M10EKES
+         bool "Atmel AT91SAM9M10-EKES Evaluation Kit"
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+         help
+           Select this if you are using Atmel's AT91SAM9M10-EKES Evaluation Kit.
+           "ES" at the end of the name means that this board is an
+@@ -433,6 +443,7 @@ config MACH_AT91SAM9M10EKES
+ 
+ config MACH_AT91SAM9M10G45EK
+         bool "Atmel AT91SAM9M10G45-EK Evaluation Kit"
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+         help
+           Select this if you are using Atmel's AT91SAM9M10G45-EK Evaluation Kit.
+ 	  <http://atmel.com/dyn/products/tools_card_v2.asp?tool_id=4735>
+@@ -450,6 +461,7 @@ comment "AT91CAP9 Board Type"
+ config MACH_AT91CAP9ADK
+ 	bool "Atmel AT91CAP9A-DK Evaluation Kit"
+ 	depends on ARCH_AT91CAP9
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT91CAP9A-DK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4138>
+@@ -465,6 +477,7 @@ comment "AT572D940HF Board Type"
+ config MACH_AT572D940HFEB
+ 	bool "AT572D940HF-EK"
+ 	depends on ARCH_AT572D940HF
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
+ 	help
+ 	  Select this if you are using Atmel's AT572D940HF-EK evaluation kit.
+ 	  <http://www.atmel.com/products/diopsis/default.asp>
+@@ -504,6 +517,24 @@ config MTD_NAND_ATMEL_BUSWIDTH_16
+ 	  On AT91SAM926x boards both types of NAND flash can be present
+ 	  (8 and 16 bit data bus width).
+ 
++config MTD_NAND_ATMEL_ROOTFS_SIZE
++	int "Size NAND rootfs in MB"
++	range 8 250
++	depends on MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	default "124"
++	help
++	  Many Atmel development boards has a NAND Flash, 
++	  divided into three partitions.
++          1) Boot partition (4 MB)
++	  2) Root FS
++	  3) Data partition
++	  This allows you to configure the size of the root fs
++	  with the remainder ending up in the data partition.
++	  The legal values are between 8 and 250
++
++config MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	bool
++
+ # ----------------------------------------------------------
+ 
+ comment "AT91 Feature Selections"
+diff --git a/arch/arm/mach-at91/board-at572d940hf_ek.c b/arch/arm/mach-at91/board-at572d940hf_ek.c
+index f5bd486..171d675 100644
+--- a/arch/arm/mach-at91/board-at572d940hf_ek.c
++++ b/arch/arm/mach-at91/board-at572d940hf_ek.c
+@@ -114,10 +114,20 @@ static struct at91_eth_data __initdata eb_eth_data = {
+  */
+ static struct mtd_partition __initdata eb_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
++	},
++	{
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
++		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+-	}
++	},
+ };
+ 
+ static struct mtd_partition * __init nand_partitions(int size, int *num_partitions)
+diff --git a/arch/arm/mach-at91/board-cap9adk.c b/arch/arm/mach-at91/board-cap9adk.c
+index 52f75c6..de9f921 100644
+--- a/arch/arm/mach-at91/board-cap9adk.c
++++ b/arch/arm/mach-at91/board-cap9adk.c
+@@ -167,8 +167,18 @@ static struct at91_eth_data __initdata cap9adk_macb_data = {
+  */
+ static struct mtd_partition __initdata cap9adk_nand_partitions[] = {
+ 	{
+-		.name	= "NAND partition",
+-		.offset	= 0,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
++	},
++	{
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
++		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+ };
+diff --git a/arch/arm/mach-at91/board-dk.c b/arch/arm/mach-at91/board-dk.c
+index 3efca21..b521503 100644
+--- a/arch/arm/mach-at91/board-dk.c
++++ b/arch/arm/mach-at91/board-dk.c
+@@ -314,8 +314,18 @@ static struct i2c_board_info __initdata dk_i2c_devices[] = {
+ 
+ static struct mtd_partition __initdata dk_nand_partition[] = {
+ 	{
+-		.name	= "NAND Partition 1",
+-		.offset	= 0,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
++	},
++	{
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
++		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+ };
+diff --git a/arch/arm/mach-at91/board-sam9260ek.c b/arch/arm/mach-at91/board-sam9260ek.c
+index e6cab50..c098216 100644
+--- a/arch/arm/mach-at91/board-sam9260ek.c
++++ b/arch/arm/mach-at91/board-sam9260ek.c
+@@ -177,12 +177,17 @@ static struct at91_eth_data __initdata ek_macb_data = {
+  */
+ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
+-		.size	= SZ_256K,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff --git a/arch/arm/mach-at91/board-sam9261ek.c b/arch/arm/mach-at91/board-sam9261ek.c
+index 8bcd631..66cd246 100644
+--- a/arch/arm/mach-at91/board-sam9261ek.c
++++ b/arch/arm/mach-at91/board-sam9261ek.c
+@@ -184,12 +184,17 @@ static struct at91_mmc_data __initdata ek_mmc_data = {
+  */
+ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
+-		.size	= SZ_256K,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff --git a/arch/arm/mach-at91/board-sam9263ek.c b/arch/arm/mach-at91/board-sam9263ek.c
+index 7cbec96..f3ad0f4 100644
+--- a/arch/arm/mach-at91/board-sam9263ek.c
++++ b/arch/arm/mach-at91/board-sam9263ek.c
+@@ -174,12 +174,17 @@ static struct at91_eth_data __initdata ek_macb_data = {
+  */
+ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
+-		.size	= SZ_64M,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff --git a/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c b/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c
+index 4061d82..51b3008 100644
+--- a/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c
++++ b/arch/arm/mach-at91/board-sam9g20ek-2slot-mmc.c
+@@ -130,12 +130,12 @@ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 1",
++		.name	= "Root File System",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+-		.size	= 60 * SZ_1M,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff --git a/arch/arm/mach-at91/board-sam9g20ek.c b/arch/arm/mach-at91/board-sam9g20ek.c
+index b2117b9..811dd09 100644
+--- a/arch/arm/mach-at91/board-sam9g20ek.c
++++ b/arch/arm/mach-at91/board-sam9g20ek.c
+@@ -129,12 +129,12 @@ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 1",
++		.name	= "Root File System",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+-		.size	= 60 * SZ_1M,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff --git a/arch/arm/mach-at91/board-sam9m10g45ek.c b/arch/arm/mach-at91/board-sam9m10g45ek.c
+index 0277e6b..6f5d02a 100644
+--- a/arch/arm/mach-at91/board-sam9m10g45ek.c
++++ b/arch/arm/mach-at91/board-sam9m10g45ek.c
+@@ -134,12 +134,17 @@ static struct at91_eth_data __initdata ek_macb_data = {
+  */
+ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
+-		.size	= SZ_64M,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+diff --git a/arch/arm/mach-at91/board-sam9rlek.c b/arch/arm/mach-at91/board-sam9rlek.c
+index 23e6546..07f0c03 100644
+--- a/arch/arm/mach-at91/board-sam9rlek.c
++++ b/arch/arm/mach-at91/board-sam9rlek.c
+@@ -83,12 +83,17 @@ static struct at91_mmc_data __initdata ek_mmc_data = {
+  */
+ static struct mtd_partition __initdata ek_nand_partition[] = {
+ 	{
+-		.name	= "Partition 1",
+-		.offset	= 0,
+-		.size	= SZ_256K,
++		.name   = "Bootstrap",
++		.offset = 0,
++		.size   = 4 * SZ_1M,
+ 	},
+ 	{
+-		.name	= "Partition 2",
++		.name	= "Root File System",
++		.offset	= MTDPART_OFS_NXTBLK,
++		.size	= CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE * SZ_1M,
++	},
++	{
++		.name	= "Data",
+ 		.offset	= MTDPART_OFS_NXTBLK,
+ 		.size	= MTDPART_SIZ_FULL,
+ 	},
+-- 
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.30/at91/exp.4/0002-mach-at91-KConfig-cleanup.patch b/recipes/linux/linux-2.6.30/at91/exp.4/0002-mach-at91-KConfig-cleanup.patch
new file mode 100644
index 0000000..a58008c
--- /dev/null
+++ b/recipes/linux/linux-2.6.30/at91/exp.4/0002-mach-at91-KConfig-cleanup.patch
@@ -0,0 +1,202 @@
+From 13d462c45ddcb46e6a7de700ee9b6eaafdb0a728 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Wed, 26 Jan 2011 09:34:00 +0100
+Subject: [PATCH 2/2] mach-at91 KConfig cleanup
+
+---
+ arch/arm/mach-at91/Kconfig |   45 +++++++++++++++++++++++++++++++++++++++++--
+ 1 files changed, 42 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
+index 46d1926..3ff11ab 100644
+--- a/arch/arm/mach-at91/Kconfig
++++ b/arch/arm/mach-at91/Kconfig
+@@ -97,6 +97,7 @@ config ARCH_AT91RM9200DK
+ 	bool "Atmel AT91RM9200-DK Development board"
+ 	depends on ARCH_AT91RM9200
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91RM9200-DK Development board.
+ 	  (Discontinued)
+@@ -104,6 +105,7 @@ config ARCH_AT91RM9200DK
+ config MACH_AT91RM9200EK
+ 	bool "Atmel AT91RM9200-EK Evaluation Kit"
+ 	depends on ARCH_AT91RM9200
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91RM9200-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3507>
+@@ -172,6 +174,7 @@ config MACH_HOMEMATIC
+ config MACH_ECBAT91
+ 	bool "emQbit ECB_AT91 SBC"
+ 	depends on ARCH_AT91RM9200
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using emQbit's ECB_AT91 board.
+ 	  <http://wiki.emqbit.com/free-ecb-at91>
+@@ -215,6 +218,8 @@ config MACH_AT91SAM9260EK
+ 	bool "Atmel AT91SAM9260-EK / AT91SAM9XE Evaluation Kit"
+ 	depends on ARCH_AT91SAM9260
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9260-EK or AT91SAM9XE Evaluation Kit
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3933>
+@@ -229,6 +234,7 @@ config MACH_CAM60
+ config MACH_SAM9_L9260
+ 	bool "Olimex SAM9-L9260 board"
+ 	depends on ARCH_AT91SAM9260
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Olimex's SAM9-L9260 board based on the Atmel AT91SAM9260.
+ 	  <http://www.olimex.com/dev/sam9-L9260.html>
+@@ -281,6 +287,8 @@ config MACH_AT91SAM9261EK
+ 	bool "Atmel AT91SAM9261-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9261
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9261-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=3820>
+@@ -297,6 +305,8 @@ config MACH_AT91SAM9G10EK
+ 	bool "Atmel AT91SAM9G10-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G10
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G10-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4588>
+@@ -313,6 +323,8 @@ config MACH_AT91SAM9263EK
+ 	bool "Atmel AT91SAM9263-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9263
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9263-EK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4057>
+@@ -334,6 +346,7 @@ config MACH_CSB737
+ config MACH_TOTEMNOVA
+ 	bool "TotemNova Micronova industrial supervisor"
+ 	depends on ARCH_AT91SAM9263
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Micronova's TotemNova industrial supervisor
+ 	  <http://www.micronovasrl.com>
+@@ -341,6 +354,7 @@ config MACH_TOTEMNOVA
+ config MACH_NEOCORE926
+ 	bool "Adeneo NEOCORE926"
+ 	depends on ARCH_AT91SAM9263
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using the Adeneo Neocore 926 board.
+ 
+@@ -371,6 +385,8 @@ config MACH_AT91SAM9G20EK
+ 	bool "Atmel AT91SAM9G20-EK Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G20
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G20-EK Evaluation Kit
+ 	  that embeds only one SD/MMC slot.
+@@ -379,6 +395,7 @@ config MACH_AT91SAM9G20EK_2MMC
+ 	bool "Atmel AT91SAM9G20-EK Evaluation Kit with 2 SD/MMC Slots"
+ 	depends on ARCH_AT91SAM9G20
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
+ 	help
+ 	  Select this if you are using an Atmel AT91SAM9G20-EK Evaluation Kit
+ 	  with 2 SD/MMC Slots. This is the case for AT91SAM9G20-EK rev. C and
+@@ -417,13 +434,23 @@ config MACH_AT91SAM9G45EKES
+ 	bool "Atmel AT91SAM9G45-EKES Evaluation Kit"
+ 	depends on ARCH_AT91SAM9G45
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
+ 	help
+ 	  Select this if you are using Atmel's AT91SAM9G45-EKES Evaluation Kit.
+ 	  "ES" at the end of the name means that this board is an
+ 	  Engineering Sample.
+ 
+-endif
++config MACH_AT91SAM9M10G45EK
++	bool "Atmel AT91SAM9M10G45-EK Evaluation Kit"
++	depends on ARCH_AT91SAM9G45
++	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	help
++	  Select this if you are using Atmel's AT91SAM9M10G45-EK Evaluation Kit.
++	  "ES2" at the end of the name means that this board is an
++	  Engineering Sample.
+ 
++endif
+ # ----------------------------------------------------------
+ 
+ if ARCH_AT91SAM9M10
+@@ -436,6 +463,7 @@ choice
+ config MACH_AT91SAM9M10EKES
+         bool "Atmel AT91SAM9M10-EKES Evaluation Kit"
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
+         help
+           Select this if you are using Atmel's AT91SAM9M10-EKES Evaluation Kit.
+           "ES" at the end of the name means that this board is an
+@@ -444,6 +472,7 @@ config MACH_AT91SAM9M10EKES
+ config MACH_AT91SAM9M10G45EK
+         bool "Atmel AT91SAM9M10G45-EK Evaluation Kit"
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
+         help
+           Select this if you are using Atmel's AT91SAM9M10G45-EK Evaluation Kit.
+ 	  <http://atmel.com/dyn/products/tools_card_v2.asp?tool_id=4735>
+@@ -462,6 +491,8 @@ config MACH_AT91CAP9ADK
+ 	bool "Atmel AT91CAP9A-DK Evaluation Kit"
+ 	depends on ARCH_AT91CAP9
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT91CAP9A-DK Evaluation Kit.
+ 	  <http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4138>
+@@ -478,6 +509,8 @@ config MACH_AT572D940HFEB
+ 	bool "AT572D940HF-EK"
+ 	depends on ARCH_AT572D940HF
+ 	select MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE
++	select MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	select	MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Select this if you are using Atmel's AT572D940HF-EK evaluation kit.
+ 	  <http://www.atmel.com/products/diopsis/default.asp>
+@@ -506,17 +539,23 @@ comment "AT91 Board Options"
+ 
+ config MTD_AT91_DATAFLASH_CARD
+ 	bool "Enable DataFlash Card support"
+-	depends on (ARCH_AT91RM9200DK || MACH_AT91RM9200EK || MACH_AT91SAM9260EK || MACH_AT91SAM9261EK || MACH_AT91SAM9G10EK || MACH_AT91SAM9263EK || MACH_AT91SAM9G20EK || MACH_ECBAT91 || MACH_SAM9_L9260 || MACH_AT91CAP9ADK || MACH_AT572D940HFEB || MACH_TOTEMNOVA || MACH_NEOCORE926)
++	depends on MTD_ALLOW_DATAFLASHCARD
+ 	help
+ 	  Enable support for the DataFlash card.
+ 
++config MTD_ALLOW_DATAFLASHCARD
++	bool
++
+ config MTD_NAND_ATMEL_BUSWIDTH_16
+ 	bool "Enable 16-bit data bus interface to NAND flash"
+-	depends on (MACH_AT91SAM9260EK || MACH_AT91SAM9261EK || MACH_AT91SAM9G10EK || MACH_AT91SAM9263EK || MACH_AT91SAM9G20EK || MACH_AT91SAM9G20EK_2MMC || MACH_AT91SAM9G45EKES || MACH_AT91SAM9M10EKES || MACH_AT91SAM9M10G45EK || MACH_AT91CAP9ADK || MACH_AT572D940HFEB)
++	depends on MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
+ 	help
+ 	  On AT91SAM926x boards both types of NAND flash can be present
+ 	  (8 and 16 bit data bus width).
+ 
++config MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH
++	bool
++
+ config MTD_NAND_ATMEL_ROOTFS_SIZE
+ 	int "Size NAND rootfs in MB"
+ 	range 8 250
+-- 
+1.7.1
+
diff --git a/recipes/linux/linux_2.6.30.bb b/recipes/linux/linux_2.6.30.bb
index 432542b..4313e36 100644
--- a/recipes/linux/linux_2.6.30.bb
+++ b/recipes/linux/linux_2.6.30.bb
@@ -1,7 +1,7 @@
 require linux.inc
 
-PR = "r6"
-
+PR = "r7"
+AT91_EXPERIMENTAL = "4"
 S = "${WORKDIR}/linux-${PV}"
 
 # Mark archs/machines that this kernel supports
@@ -26,6 +26,32 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=ke
            file://aufs2-30.patch \
            file://defconfig"
 
+SRC_URI_at91sam9m10ekes = " \
+	   ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+	   http://maxim.org.za/AT91RM9200/2.6/${PV}-at91.patch.gz;apply=no;name=at91patch \
+	   ftp://www.at91.com/pub/linux/${PV}-at91/${PV}-at91-exp.${AT91_EXPERIMENTAL}.tar.gz;apply=no;name=at91exp${AT91_EXPERIMENTAL} \
+	   file://at91/exp.${AT91_EXPERIMENTAL}/0001-Configurable-partition-size.patch;apply=yes \
+	   file://at91/exp.${AT91_EXPERIMENTAL}/0002-mach-at91-KConfig-cleanup.patch;apply=yes \
+	   http://linux.hd-wireless.se/pub/Linux/BuildSAM9M10EKES/2.6.30-at91-sdio-irq-support-both-slots.patch;apply=yes;name=owlwifi \
+	   file://exp.${AT91_EXPERIMENTAL}/defconfig"
+
+at91sam_patch = " \
+		"
+
+do_patch_prepend_at91sam9m10ekes() {
+	bb.build.exec_func('do_apply_at91_exp_patch', d)
+}
+
+do_apply_at91_exp_patch () {
+	cd	${WORKDIR}
+	mv	exp.${AT91_EXPERIMENTAL}/defconfig	defconfig
+	cd	${S}
+	cat	../${PV}-at91.patch	| patch -p1
+	for	f in `ls ../${PV}-at91-exp.${AT91_EXPERIMENTAL}/*.patch` ; do
+		cat $f	| patch -p1
+	done
+}
+
 SRC_URI_at91 = " \
 	   ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
 	   http://maxim.org.za/AT91RM9200/2.6/2.6.30-at91.patch.gz;apply=yes;name=at91patch \
@@ -58,6 +84,18 @@ SRC_URI_ronetix-pm9g45 = " \
 
 SRC_URI_append_mpc8315e-rdb = " file://mpc8315erdb-add-msi-to-dts.patch"
 
+SRC_URI_append_at91sam9260ek = ${at91sam_patch}
+SRC_URI_append_at91sam9261ek = ${at91sam_patch}
+SRC_URI_append_at91sam9263ek = ${at91sam_patch}
+SRC_URI_append_at91sam9rlek = ${at91sam_patch} 
+SRC_URI_append_at91sam9g20ek = ${at91sam_patch}
+SRC_URI_append_at91sam9g20ek_2mmc = ${at91sam_patch}
+SRC_URI_append_at91sam9g10ek = ${at91sam_patch}
+SRC_URI_append_at91sam9xeek = ${at91sam_patch}
+SRC_URI_append_at91sam9g45ekes = ${at91sam_patch}
+SRC_URI_append_at91sam9m10ekes = ${at91sam_patch}
+SRC_URI_append_at91sam9m10g45ek = ${at91sam_patch}
+
 # SRC_URI_append_at91sam9263ek = " file://hrw-linux-2.6.30-exp.patch "
 
 SRC_URI[kernel.md5sum] = "7a80058a6382e5108cdb5554d1609615"
@@ -69,5 +107,10 @@ SRC_URI[at91patch.md5sum] = "f13ab353b11329ce3d605b6f40e77fa6"
 SRC_URI[at91patch.sha256sum] = "41991e8aa2e5fe8e5dfd47b1e5c446fa03c3ee96a5eae54fd6ec15d1d9afef30"
 SRC_URI[at91exp2.md5sum] = "770c7a2bfb925111a8c0e0d4c8c4764e"
 SRC_URI[at91exp2.sha256sum] = "58894965b253eae0c4caacedc3463cf186c18431ca0d71b767a3b36aa40ec388"
+SRC_URI[at91exp4.md5sum] = "9ca9901af101d9966a3acf80193bfd7d"
+SRC_URI[at91exp4.sha256sum] = "b948199be87cf9ba280ea649aa1b477b36344a44aae52fdc3bb56344adf73f76"
+
+SRC_URI[owlwifi.md5sum] = "5ead573ee187ebd723569ec54186e99a"
+SRC_URI[owlwifi.sha256sum] = "8ee739bf171e878bbd9a02113f3a6a5287a3653dec71e4c11515c2c890f31c62"
 
 
-- 
1.7.4.1



