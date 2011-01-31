Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk0GF-0006xf-SE
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 21:22:10 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 16081EB953
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 20:51:28 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="1710697299"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 31 Jan 2011 20:51:28 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 20:51:04 +0100
Message-Id: <1296503466-3877-6-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1296503466-3877-5-git-send-email-ulf.samuelsson@atmel.com>
References: <1296503466-3877-1-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-2-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-3-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-4-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-5-git-send-email-ulf.samuelsson@atmel.com>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 6/8] Update at91sam9m10ekes linux patch to exp.2
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
X-List-Received-Date: Mon, 31 Jan 2011 20:22:10 -0000

---
 ...ux-2.6.30-001-configurable-partition-size.patch |  362 +++++
 .../exp.2/linux-2.6.30-002-mach-at91-Kconfig.patch |  196 +++
 .../at91/exp.2/linux-2.6.30-003-sam9m10g45ek.patch |   29 +
 .../exp.4/0001-Configurable-partition-size.patch   |  403 +++++
 .../exp.4/0002-mach-at91-KConfig-cleanup.patch     |  202 +++
 .../linux/linux-2.6.30/at91sam9m10ekes/defconfig   |   50 +-
 .../linux-2.6.30/at91sam9m10ekes/exp.2/defconfig   | 1649 +++++++++++++++++++
 .../linux-2.6.30/at91sam9m10ekes/exp.4/defconfig   | 1671 ++++++++++++++++++++
 .../linux/linux-2.6.30/at91sam9m10g45ek/defconfig  | 1649 +++++++++++++++++++
 recipes/linux/linux_2.6.30.bb                      |   59 +-
 10 files changed, 6254 insertions(+), 16 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-001-configurable-partition-size.patch
 create mode 100644 recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-002-mach-at91-Kconfig.patch
 create mode 100644 recipes/linux/linux-2.6.30/at91/exp.2/linux-2.6.30-003-sam9m10g45ek.patch
 create mode 100644 recipes/linux/linux-2.6.30/at91/exp.4/0001-Configurable-partition-size.patch
 create mode 100644 recipes/linux/linux-2.6.30/at91/exp.4/0002-mach-at91-KConfig-cleanup.patch
 create mode 100644 recipes/linux/linux-2.6.30/at91sam9m10ekes/exp.2/defconfig
 create mode 100644 recipes/linux/linux-2.6.30/at91sam9m10ekes/exp.4/defconfig
 create mode 100644 recipes/linux/linux-2.6.30/at91sam9m10g45ek/defconfig

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
diff --git a/recipes/linux/linux-2.6.30/at91sam9m10ekes/defconfig b/recipes/linux/linux-2.6.30/at91sam9m10ekes/defconfig
index d9c8408..e76f554 100644
--- a/recipes/linux/linux-2.6.30/at91sam9m10ekes/defconfig
+++ b/recipes/linux/linux-2.6.30/at91sam9m10ekes/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.30
-# Sun Mar 14 23:55:04 2010
+# Tue Jan 25 01:00:34 2011
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -50,7 +50,8 @@ CONFIG_CLASSIC_RCU=y
 # CONFIG_PREEMPT_RCU is not set
 # CONFIG_TREE_RCU_TRACE is not set
 # CONFIG_PREEMPT_RCU_TRACE is not set
-# CONFIG_IKCONFIG is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_GROUP_SCHED is not set
 # CONFIG_CGROUPS is not set
@@ -480,7 +481,9 @@ CONFIG_MTD_CFI_I2=y
 #
 # Self-contained MTD device drivers
 #
-# CONFIG_MTD_DATAFLASH is not set
+CONFIG_MTD_DATAFLASH=y
+# CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
+# CONFIG_MTD_DATAFLASH_OTP is not set
 # CONFIG_MTD_M25P80 is not set
 # CONFIG_MTD_SLRAM is not set
 # CONFIG_MTD_PHRAM is not set
@@ -544,7 +547,7 @@ CONFIG_ATMEL_TCB_CLKSRC_BLOCK=0
 #
 # EEPROM support
 #
-# CONFIG_EEPROM_AT24 is not set
+CONFIG_EEPROM_AT24=y
 # CONFIG_EEPROM_AT25 is not set
 # CONFIG_EEPROM_LEGACY is not set
 CONFIG_EEPROM_93CX6=m
@@ -589,7 +592,11 @@ CONFIG_SCSI_WAIT_SCAN=m
 # CONFIG_SCSI_SAS_LIBSAS is not set
 # CONFIG_SCSI_SRP_ATTRS is not set
 # CONFIG_SCSI_LOWLEVEL is not set
-# CONFIG_SCSI_DH is not set
+CONFIG_SCSI_DH=y
+# CONFIG_SCSI_DH_RDAC is not set
+# CONFIG_SCSI_DH_HP_SW is not set
+# CONFIG_SCSI_DH_EMC is not set
+# CONFIG_SCSI_DH_ALUA is not set
 # CONFIG_SCSI_OSD_INITIATOR is not set
 # CONFIG_ATA is not set
 # CONFIG_MD is not set
@@ -976,7 +983,10 @@ CONFIG_BACKLIGHT_ATMEL_LCDC=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_DUMMY_CONSOLE=y
 # CONFIG_FRAMEBUFFER_CONSOLE is not set
-# CONFIG_LOGO is not set
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
 CONFIG_SOUND=y
 CONFIG_SOUND_OSS_CORE=y
 CONFIG_SND=y
@@ -1305,8 +1315,14 @@ CONFIG_DMATEST=m
 CONFIG_EXT2_FS=y
 # CONFIG_EXT2_FS_XATTR is not set
 # CONFIG_EXT2_FS_XIP is not set
-# CONFIG_EXT3_FS is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
 # CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+CONFIG_FS_MBCACHE=y
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set
 # CONFIG_FS_POSIX_ACL is not set
@@ -1407,8 +1423,24 @@ CONFIG_SUNRPC=y
 #
 # Partition Types
 #
-# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
 CONFIG_MSDOS_PARTITION=y
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
 CONFIG_NLS=y
 CONFIG_NLS_DEFAULT="iso8859-1"
 CONFIG_NLS_CODEPAGE_437=y
@@ -1445,7 +1477,7 @@ CONFIG_NLS_ISO8859_1=y
 # CONFIG_NLS_ISO8859_9 is not set
 # CONFIG_NLS_ISO8859_13 is not set
 # CONFIG_NLS_ISO8859_14 is not set
-# CONFIG_NLS_ISO8859_15 is not set
+CONFIG_NLS_ISO8859_15=y
 # CONFIG_NLS_KOI8_R is not set
 # CONFIG_NLS_KOI8_U is not set
 # CONFIG_NLS_UTF8 is not set
diff --git a/recipes/linux/linux-2.6.30/at91sam9m10ekes/exp.2/defconfig b/recipes/linux/linux-2.6.30/at91sam9m10ekes/exp.2/defconfig
new file mode 100644
index 0000000..e76f554
--- /dev/null
+++ b/recipes/linux/linux-2.6.30/at91sam9m10ekes/exp.2/defconfig
@@ -0,0 +1,1649 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.30
+# Tue Jan 25 01:00:34 2011
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_MMU=y
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_CLASSIC_RCU=y
+# CONFIG_TREE_RCU is not set
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_PREEMPT_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_GROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_RELAY is not set
+CONFIG_NAMESPACES=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+# CONFIG_EMBEDDED is not set
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_CLK=y
+# CONFIG_SLOW_WORK is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_AS=y
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=y
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="anticipatory"
+# CONFIG_FREEZER is not set
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+CONFIG_ARCH_AT91=y
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_W90X900 is not set
+
+#
+# Atmel AT91 System-on-Chip
+#
+# CONFIG_ARCH_AT91RM9200 is not set
+# CONFIG_ARCH_AT91SAM9260 is not set
+# CONFIG_ARCH_AT91SAM9261 is not set
+# CONFIG_ARCH_AT91SAM9G10 is not set
+# CONFIG_ARCH_AT91SAM9263 is not set
+# CONFIG_ARCH_AT91SAM9RL is not set
+# CONFIG_ARCH_AT91SAM9G20 is not set
+# CONFIG_ARCH_AT91SAM9G45 is not set
+CONFIG_ARCH_AT91SAM9M10=y
+# CONFIG_ARCH_AT91CAP9 is not set
+# CONFIG_ARCH_AT572D940HF is not set
+# CONFIG_ARCH_AT91X40 is not set
+CONFIG_AT91_PMC_UNIT=y
+# CONFIG_MACH_AT91SAM9M10G45EK is not set
+
+#
+# AT91SAM9M10 Board Type
+#
+CONFIG_MACH_AT91SAM9M10EKES=y
+
+#
+# AT91 Board Options
+#
+# CONFIG_MTD_NAND_ATMEL_BUSWIDTH_16 is not set
+CONFIG_MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH=y
+CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE=124
+CONFIG_MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE=y
+
+#
+# AT91 Feature Selections
+#
+CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
+CONFIG_AT91_TIMER_HZ=100
+CONFIG_AT91_EARLY_DBGU=y
+# CONFIG_AT91_EARLY_USART0 is not set
+# CONFIG_AT91_EARLY_USART1 is not set
+# CONFIG_AT91_EARLY_USART2 is not set
+# CONFIG_AT91_EARLY_USART3 is not set
+# CONFIG_AT91_EARLY_USART4 is not set
+# CONFIG_AT91_EARLY_USART5 is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=y
+CONFIG_CPU_ARM926T=y
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5TJ=y
+CONFIG_CPU_PABRT_NOIFAR=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_COPY_V4WB=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
+# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+# CONFIG_NO_HZ is not set
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+# CONFIG_ARCH_HAS_HOLES_MEMORYMODEL is not set
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4096
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+CONFIG_UNEVICTABLE_LRU=y
+CONFIG_HAVE_MLOCK=y
+CONFIG_HAVE_MLOCKED_PAGE_BIT=y
+CONFIG_LEDS=y
+CONFIG_LEDS_CPU=y
+CONFIG_ALIGNMENT_TRAP=y
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="mem=64M console=ttyS0,115200 initrd=0x71100000,25165824 root=/dev/ram0 rw"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Power Management
+#
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_FPE_NWFPE=y
+# CONFIG_FPE_NWFPE_XP is not set
+# CONFIG_FPE_FASTFPE is not set
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+# CONFIG_PM is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=y
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_IP_MROUTE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+# CONFIG_CFG80211_REG_DEBUG is not set
+# CONFIG_WIRELESS_OLD_REGULATORY is not set
+CONFIG_WIRELESS_EXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=y
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=y
+
+#
+# Rate control algorithm selection
+#
+CONFIG_MAC80211_RC_MINSTREL=y
+# CONFIG_MAC80211_RC_DEFAULT_PID is not set
+CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
+CONFIG_MAC80211_RC_DEFAULT="minstrel"
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+# CONFIG_MTD_CFI is not set
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+CONFIG_MTD_DATAFLASH=y
+# CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
+# CONFIG_MTD_DATAFLASH_OTP is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+CONFIG_MTD_NAND_ATMEL=y
+CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
+# CONFIG_MTD_NAND_ATMEL_ECC_HW is not set
+# CONFIG_MTD_NAND_ATMEL_ECC_NONE is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+
+#
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_BLK_DEV_RAM_SIZE=8192
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=y
+CONFIG_ATMEL_TCLIB=y
+CONFIG_ATMEL_TCB_CLKSRC=y
+CONFIG_ATMEL_TCB_CLKSRC_BLOCK=0
+# CONFIG_ICS932S401 is not set
+# CONFIG_ATMEL_SSC is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+CONFIG_EEPROM_AT24=y
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_LEGACY is not set
+CONFIG_EEPROM_93CX6=m
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+
+#
+# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
+#
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_SCSI_DH=y
+# CONFIG_SCSI_DH_RDAC is not set
+# CONFIG_SCSI_DH_HP_SW is not set
+# CONFIG_SCSI_DH_EMC is not set
+# CONFIG_SCSI_DH_ALUA is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=y
+CONFIG_COMPAT_NET_DEV_OPS=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+CONFIG_DAVICOM_PHY=y
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+# CONFIG_SMSC_PHY is not set
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=y
+CONFIG_MII=y
+CONFIG_MACB=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_ETHOC is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+# CONFIG_DNET is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+CONFIG_WLAN_80211=y
+CONFIG_LIBERTAS=m
+CONFIG_LIBERTAS_USB=m
+CONFIG_LIBERTAS_SDIO=m
+CONFIG_LIBERTAS_SPI=m
+# CONFIG_LIBERTAS_DEBUG is not set
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_AT76C50X_USB is not set
+CONFIG_USB_ZD1201=m
+# CONFIG_USB_NET_RNDIS_WLAN is not set
+CONFIG_RTL8187=m
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_P54_COMMON is not set
+CONFIG_AR9170_USB=m
+# CONFIG_HOSTAP is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+CONFIG_ZD1211RW=m
+# CONFIG_ZD1211RW_DEBUG is not set
+CONFIG_RT2X00=m
+CONFIG_RT2500USB=m
+CONFIG_RT73USB=m
+CONFIG_RT2X00_LIB_USB=m
+CONFIG_RT2X00_LIB=m
+CONFIG_RT2X00_LIB_FIRMWARE=y
+CONFIG_RT2X00_LIB_CRYPTO=y
+CONFIG_RT2X00_LIB_RFKILL=y
+CONFIG_RT2X00_LIB_LEDS=y
+# CONFIG_RT2X00_DEBUG is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+# CONFIG_USB_USBNET is not set
+# CONFIG_WAN is not set
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+CONFIG_INPUT_POLLDEV=m
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=480
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=272
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
+# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+CONFIG_TOUCHSCREEN_ATMEL_TSADCC=y
+# CONFIG_TOUCHSCREEN_WM97XX is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_DEVKMEM=y
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_ATMEL=y
+CONFIG_SERIAL_ATMEL_CONSOLE=y
+CONFIG_SERIAL_ATMEL_PDC=y
+# CONFIG_SERIAL_ATMEL_TTYAT is not set
+# CONFIG_SERIAL_MAX3100 is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+CONFIG_LEGACY_PTYS=y
+CONFIG_LEGACY_PTY_COUNT=4
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_HELPER_AUTO=y
+CONFIG_I2C_ALGOBIT=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+CONFIG_I2C_GPIO=y
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+CONFIG_SPI=y
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+CONFIG_SPI_ATMEL=y
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_GPIO_SYSFS is not set
+
+#
+# Memory mapped GPIO expanders:
+#
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+
+#
+# Multimedia devices
+#
+
+#
+# Multimedia core support
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+# CONFIG_VIDEO_MEDIA is not set
+
+#
+# Multimedia drivers
+#
+# CONFIG_DAB is not set
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D15605 is not set
+# CONFIG_FB_S1D13XXX is not set
+CONFIG_FB_ATMEL=y
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_ATMEL_LCDC=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE is not set
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=y
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_HWDEP=m
+CONFIG_SND_RAWMIDI=m
+CONFIG_SND_SEQUENCER=y
+# CONFIG_SND_SEQ_DUMMY is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=y
+CONFIG_SND_PCM_OSS=y
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_SEQUENCER_OSS is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_VERBOSE_PROCFS is not set
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_VMASTER=y
+CONFIG_SND_AC97_CODEC=y
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_ARM is not set
+
+#
+# Atmel devices (AVR32 and AT91)
+#
+CONFIG_SND_ATMEL_AC97C=y
+# CONFIG_SND_SPI is not set
+CONFIG_SND_USB=y
+CONFIG_SND_USB_AUDIO=m
+# CONFIG_SND_USB_CAIAQ is not set
+# CONFIG_SND_SOC is not set
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=y
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+# CONFIG_USB_HID is not set
+# CONFIG_HID_PID is not set
+
+#
+# Special HID drivers
+#
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+# CONFIG_USB_DEVICE_CLASS is not set
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_OTG is not set
+# CONFIG_USB_MON is not set
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_EHCI_HCD=y
+# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+CONFIG_USB_OHCI_HCD=y
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=y
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_GADGET_MUSB_HDRC is not set
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_BERRY_CHARGE is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_AT91 is not set
+CONFIG_USB_GADGET_ATMEL_USBA=y
+CONFIG_USB_ATMEL_USBA=y
+# CONFIG_USB_GADGET_FSL_USB2 is not set
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
+# CONFIG_USB_GADGET_PXA27X is not set
+# CONFIG_USB_GADGET_S3C2410 is not set
+# CONFIG_USB_GADGET_IMX is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_AMD5536UDC is not set
+# CONFIG_USB_GADGET_FSL_QE is not set
+# CONFIG_USB_GADGET_CI13XXX is not set
+# CONFIG_USB_GADGET_NET2280 is not set
+# CONFIG_USB_GADGET_GOKU is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+CONFIG_USB_ZERO=m
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_GADGETFS is not set
+# CONFIG_USB_FILE_STORAGE is not set
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+CONFIG_USB_CDC_COMPOSITE=m
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_NOP_USB_XCEIV is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+CONFIG_SDIO_UART=m
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_AT91 is not set
+CONFIG_MMC_ATMELMCI=y
+CONFIG_MMC_ATMELMCI_DMA=y
+# CONFIG_MMC_SPI is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_GPIO_PLATFORM=y
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+CONFIG_LEDS_TRIGGER_GPIO=y
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=y
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_AT91SAM9=y
+CONFIG_RTC_DRV_AT91SAM9_RTT=0
+CONFIG_RTC_DRV_AT91SAM9_GPBR=0
+CONFIG_DMADEVICES=y
+
+#
+# DMA Devices
+#
+CONFIG_AT_HDMAC=y
+CONFIG_DMA_ENGINE=y
+
+#
+# DMA Clients
+#
+# CONFIG_NET_DMA is not set
+# CONFIG_ASYNC_TX_DMA is not set
+CONFIG_DMATEST=m
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+CONFIG_FILE_LOCKING=y
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+CONFIG_CRAMFS=m
+CONFIG_SQUASHFS=m
+CONFIG_SQUASHFS_EMBEDDED=y
+CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+# CONFIG_NFS_V4 is not set
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+# CONFIG_RPCSEC_GSS_KRB5 is not set
+# CONFIG_RPCSEC_GSS_SPKM3 is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=y
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_850=y
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+CONFIG_NLS_ISO8859_15=y
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_TRACING_SUPPORT=y
+
+#
+# Tracers
+#
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_EVENT_TRACER is not set
+# CONFIG_BOOT_TRACER is not set
+# CONFIG_TRACE_BRANCH_PROFILING is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_KMEMTRACE is not set
+# CONFIG_WORKQUEUE_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+CONFIG_ARM_UNWIND=y
+CONFIG_DEBUG_USER=y
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_FIPS is not set
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+# CONFIG_CRYPTO_CBC is not set
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=y
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=y
+# CONFIG_CRYPTO_ANUBIS is not set
+CONFIG_CRYPTO_ARC4=y
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+# CONFIG_CRYPTO_DES is not set
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+# CONFIG_CRC_CCITT is not set
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=m
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/recipes/linux/linux-2.6.30/at91sam9m10ekes/exp.4/defconfig b/recipes/linux/linux-2.6.30/at91sam9m10ekes/exp.4/defconfig
new file mode 100644
index 0000000..c9aa51a
--- /dev/null
+++ b/recipes/linux/linux-2.6.30/at91sam9m10ekes/exp.4/defconfig
@@ -0,0 +1,1671 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.30
+# Wed Jan 26 09:44:14 2011
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_MMU=y
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_CLASSIC_RCU=y
+# CONFIG_TREE_RCU is not set
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_PREEMPT_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_GROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_RELAY is not set
+CONFIG_NAMESPACES=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+# CONFIG_EMBEDDED is not set
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_CLK=y
+# CONFIG_SLOW_WORK is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_AS=y
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=y
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="anticipatory"
+# CONFIG_FREEZER is not set
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+CONFIG_ARCH_AT91=y
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_W90X900 is not set
+
+#
+# Atmel AT91 System-on-Chip
+#
+# CONFIG_ARCH_AT91RM9200 is not set
+# CONFIG_ARCH_AT91SAM9260 is not set
+# CONFIG_ARCH_AT91SAM9261 is not set
+# CONFIG_ARCH_AT91SAM9G10 is not set
+# CONFIG_ARCH_AT91SAM9263 is not set
+# CONFIG_ARCH_AT91SAM9RL is not set
+# CONFIG_ARCH_AT91SAM9G20 is not set
+# CONFIG_ARCH_AT91SAM9G45 is not set
+CONFIG_ARCH_AT91SAM9M10=y
+# CONFIG_ARCH_AT91CAP9 is not set
+# CONFIG_ARCH_AT572D940HF is not set
+# CONFIG_ARCH_AT91X40 is not set
+CONFIG_AT91_PMC_UNIT=y
+# CONFIG_MACH_AT91SAM9M10G45EK is not set
+
+#
+# AT91SAM9M10 Board Type
+#
+CONFIG_MACH_AT91SAM9M10EKES=y
+
+#
+# AT91 Board Options
+#
+# CONFIG_MTD_NAND_ATMEL_BUSWIDTH_16 is not set
+CONFIG_MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH=y
+CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE=124
+CONFIG_MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE=y
+
+#
+# AT91 Feature Selections
+#
+CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
+CONFIG_AT91_TIMER_HZ=100
+CONFIG_AT91_EARLY_DBGU=y
+# CONFIG_AT91_EARLY_USART0 is not set
+# CONFIG_AT91_EARLY_USART1 is not set
+# CONFIG_AT91_EARLY_USART2 is not set
+# CONFIG_AT91_EARLY_USART3 is not set
+# CONFIG_AT91_EARLY_USART4 is not set
+# CONFIG_AT91_EARLY_USART5 is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=y
+CONFIG_CPU_ARM926T=y
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5TJ=y
+CONFIG_CPU_PABRT_NOIFAR=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_COPY_V4WB=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
+# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+# CONFIG_NO_HZ is not set
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+# CONFIG_ARCH_HAS_HOLES_MEMORYMODEL is not set
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4096
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+CONFIG_UNEVICTABLE_LRU=y
+CONFIG_HAVE_MLOCK=y
+CONFIG_HAVE_MLOCKED_PAGE_BIT=y
+CONFIG_LEDS=y
+CONFIG_LEDS_CPU=y
+CONFIG_ALIGNMENT_TRAP=y
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="mem=64M console=ttyS0,115200 initrd=0x71100000,25165824 root=/dev/ram0 rw"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Power Management
+#
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_FPE_NWFPE=y
+# CONFIG_FPE_NWFPE_XP is not set
+# CONFIG_FPE_FASTFPE is not set
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+# CONFIG_PM is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=y
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_IP_MROUTE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+# CONFIG_CFG80211_REG_DEBUG is not set
+# CONFIG_WIRELESS_OLD_REGULATORY is not set
+CONFIG_WIRELESS_EXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=y
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=y
+
+#
+# Rate control algorithm selection
+#
+CONFIG_MAC80211_RC_MINSTREL=y
+# CONFIG_MAC80211_RC_DEFAULT_PID is not set
+CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
+CONFIG_MAC80211_RC_DEFAULT="minstrel"
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+# CONFIG_MTD_CFI is not set
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_DATAFLASH is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+CONFIG_MTD_NAND_ATMEL=y
+CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
+# CONFIG_MTD_NAND_ATMEL_ECC_HW is not set
+# CONFIG_MTD_NAND_ATMEL_ECC_NONE is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+
+#
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_BLK_DEV_RAM_SIZE=8192
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=y
+CONFIG_ATMEL_TCLIB=y
+CONFIG_ATMEL_TCB_CLKSRC=y
+CONFIG_ATMEL_TCB_CLKSRC_BLOCK=0
+# CONFIG_ICS932S401 is not set
+# CONFIG_ATMEL_SSC is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+# CONFIG_EEPROM_AT24 is not set
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_LEGACY is not set
+CONFIG_EEPROM_93CX6=m
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+
+#
+# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
+#
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+# CONFIG_SCSI_LOWLEVEL is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=y
+CONFIG_COMPAT_NET_DEV_OPS=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+CONFIG_DAVICOM_PHY=y
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+# CONFIG_SMSC_PHY is not set
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=y
+CONFIG_MII=y
+CONFIG_MACB=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_ETHOC is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+# CONFIG_DNET is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+CONFIG_WLAN_80211=y
+CONFIG_LIBERTAS=m
+CONFIG_LIBERTAS_USB=m
+CONFIG_LIBERTAS_SDIO=m
+CONFIG_LIBERTAS_SPI=m
+# CONFIG_LIBERTAS_DEBUG is not set
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_AT76C50X_USB is not set
+CONFIG_USB_ZD1201=m
+# CONFIG_USB_NET_RNDIS_WLAN is not set
+CONFIG_RTL8187=m
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_P54_COMMON is not set
+CONFIG_AR9170_USB=m
+# CONFIG_HOSTAP is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+CONFIG_ZD1211RW=m
+# CONFIG_ZD1211RW_DEBUG is not set
+CONFIG_RT2X00=m
+CONFIG_RT2500USB=m
+CONFIG_RT73USB=m
+CONFIG_RT2X00_LIB_USB=m
+CONFIG_RT2X00_LIB=m
+CONFIG_RT2X00_LIB_FIRMWARE=y
+CONFIG_RT2X00_LIB_CRYPTO=y
+CONFIG_RT2X00_LIB_RFKILL=y
+CONFIG_RT2X00_LIB_LEDS=y
+# CONFIG_RT2X00_DEBUG is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+# CONFIG_USB_USBNET is not set
+# CONFIG_WAN is not set
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+CONFIG_INPUT_POLLDEV=m
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=480
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=272
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
+# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+CONFIG_TOUCHSCREEN_ATMEL_TSADCC=y
+# CONFIG_TOUCHSCREEN_WM97XX is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_DEVKMEM=y
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_ATMEL=y
+CONFIG_SERIAL_ATMEL_CONSOLE=y
+CONFIG_SERIAL_ATMEL_PDC=y
+# CONFIG_SERIAL_ATMEL_TTYAT is not set
+# CONFIG_SERIAL_MAX3100 is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+CONFIG_LEGACY_PTYS=y
+CONFIG_LEGACY_PTY_COUNT=4
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_HELPER_AUTO=y
+CONFIG_I2C_ALGOBIT=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+CONFIG_I2C_GPIO=y
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+CONFIG_SPI=y
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+CONFIG_SPI_ATMEL=y
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_GPIO_SYSFS is not set
+
+#
+# Memory mapped GPIO expanders:
+#
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+
+#
+# Multimedia devices
+#
+
+#
+# Multimedia core support
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+# CONFIG_VIDEO_MEDIA is not set
+
+#
+# Multimedia drivers
+#
+# CONFIG_DAB is not set
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D15605 is not set
+# CONFIG_FB_S1D13XXX is not set
+CONFIG_FB_ATMEL=y
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_ATMEL_LCDC=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE is not set
+# CONFIG_LOGO is not set
+CONFIG_SOUND=y
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_HWDEP=m
+CONFIG_SND_RAWMIDI=m
+CONFIG_SND_SEQUENCER=y
+# CONFIG_SND_SEQ_DUMMY is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=y
+CONFIG_SND_PCM_OSS=y
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_SEQUENCER_OSS is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_VERBOSE_PROCFS is not set
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_VMASTER=y
+CONFIG_SND_AC97_CODEC=y
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_ARM is not set
+
+#
+# Atmel devices (AVR32 and AT91)
+#
+CONFIG_SND_ATMEL_AC97C=y
+# CONFIG_SND_SPI is not set
+CONFIG_SND_USB=y
+CONFIG_SND_USB_AUDIO=m
+# CONFIG_SND_USB_CAIAQ is not set
+# CONFIG_SND_SOC is not set
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=y
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+# CONFIG_USB_HID is not set
+# CONFIG_HID_PID is not set
+
+#
+# Special HID drivers
+#
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+# CONFIG_USB_DEVICE_CLASS is not set
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_OTG is not set
+# CONFIG_USB_MON is not set
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_EHCI_HCD=y
+# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+CONFIG_USB_OHCI_HCD=y
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=y
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_GADGET_MUSB_HDRC is not set
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+CONFIG_USB_SERIAL=m
+# CONFIG_USB_EZUSB is not set
+# CONFIG_USB_SERIAL_GENERIC is not set
+# CONFIG_USB_SERIAL_AIRCABLE is not set
+# CONFIG_USB_SERIAL_ARK3116 is not set
+# CONFIG_USB_SERIAL_BELKIN is not set
+# CONFIG_USB_SERIAL_CH341 is not set
+# CONFIG_USB_SERIAL_WHITEHEAT is not set
+# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
+# CONFIG_USB_SERIAL_CP210X is not set
+# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
+# CONFIG_USB_SERIAL_EMPEG is not set
+# CONFIG_USB_SERIAL_FTDI_SIO is not set
+# CONFIG_USB_SERIAL_FUNSOFT is not set
+# CONFIG_USB_SERIAL_VISOR is not set
+# CONFIG_USB_SERIAL_IPAQ is not set
+# CONFIG_USB_SERIAL_IR is not set
+# CONFIG_USB_SERIAL_EDGEPORT is not set
+# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
+# CONFIG_USB_SERIAL_GARMIN is not set
+# CONFIG_USB_SERIAL_IPW is not set
+# CONFIG_USB_SERIAL_IUU is not set
+# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
+# CONFIG_USB_SERIAL_KEYSPAN is not set
+# CONFIG_USB_SERIAL_KLSI is not set
+# CONFIG_USB_SERIAL_KOBIL_SCT is not set
+# CONFIG_USB_SERIAL_MCT_U232 is not set
+# CONFIG_USB_SERIAL_MOS7720 is not set
+# CONFIG_USB_SERIAL_MOS7840 is not set
+# CONFIG_USB_SERIAL_MOTOROLA is not set
+# CONFIG_USB_SERIAL_NAVMAN is not set
+# CONFIG_USB_SERIAL_PL2303 is not set
+# CONFIG_USB_SERIAL_OTI6858 is not set
+# CONFIG_USB_SERIAL_QUALCOMM is not set
+# CONFIG_USB_SERIAL_SPCP8X5 is not set
+# CONFIG_USB_SERIAL_HP4X is not set
+# CONFIG_USB_SERIAL_SAFE is not set
+# CONFIG_USB_SERIAL_SIEMENS_MPI is not set
+# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
+# CONFIG_USB_SERIAL_SYMBOL is not set
+# CONFIG_USB_SERIAL_TI is not set
+# CONFIG_USB_SERIAL_CYBERJACK is not set
+# CONFIG_USB_SERIAL_XIRCOM is not set
+# CONFIG_USB_SERIAL_OPTION is not set
+# CONFIG_USB_SERIAL_OMNINET is not set
+# CONFIG_USB_SERIAL_OPTICON is not set
+# CONFIG_USB_SERIAL_DEBUG is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_BERRY_CHARGE is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_AT91 is not set
+CONFIG_USB_GADGET_ATMEL_USBA=y
+CONFIG_USB_ATMEL_USBA=y
+# CONFIG_USB_GADGET_FSL_USB2 is not set
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
+# CONFIG_USB_GADGET_PXA27X is not set
+# CONFIG_USB_GADGET_S3C2410 is not set
+# CONFIG_USB_GADGET_IMX is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_AMD5536UDC is not set
+# CONFIG_USB_GADGET_FSL_QE is not set
+# CONFIG_USB_GADGET_CI13XXX is not set
+# CONFIG_USB_GADGET_NET2280 is not set
+# CONFIG_USB_GADGET_GOKU is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+CONFIG_USB_ZERO=m
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_GADGETFS is not set
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+CONFIG_USB_CDC_COMPOSITE=m
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_NOP_USB_XCEIV is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+CONFIG_SDIO_UART=m
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_AT91 is not set
+CONFIG_MMC_ATMELMCI=y
+CONFIG_MMC_ATMELMCI_DMA=y
+# CONFIG_MMC_SPI is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_GPIO_PLATFORM=y
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+CONFIG_LEDS_TRIGGER_GPIO=y
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=y
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_AT91SAM9=y
+CONFIG_RTC_DRV_AT91SAM9_RTT=0
+CONFIG_RTC_DRV_AT91SAM9_GPBR=0
+CONFIG_DMADEVICES=y
+
+#
+# DMA Devices
+#
+CONFIG_AT_HDMAC=y
+CONFIG_DMA_ENGINE=y
+
+#
+# DMA Clients
+#
+# CONFIG_NET_DMA is not set
+# CONFIG_ASYNC_TX_DMA is not set
+CONFIG_DMATEST=m
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+CONFIG_FILE_LOCKING=y
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+CONFIG_CRAMFS=m
+CONFIG_SQUASHFS=m
+CONFIG_SQUASHFS_EMBEDDED=y
+CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+# CONFIG_NFS_V4 is not set
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+# CONFIG_RPCSEC_GSS_KRB5 is not set
+# CONFIG_RPCSEC_GSS_SPKM3 is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=y
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_850=y
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+# CONFIG_NLS_ISO8859_15 is not set
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_TRACING_SUPPORT=y
+
+#
+# Tracers
+#
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_EVENT_TRACER is not set
+# CONFIG_BOOT_TRACER is not set
+# CONFIG_TRACE_BRANCH_PROFILING is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_KMEMTRACE is not set
+# CONFIG_WORKQUEUE_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+CONFIG_ARM_UNWIND=y
+CONFIG_DEBUG_USER=y
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_FIPS is not set
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+# CONFIG_CRYPTO_CBC is not set
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=y
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=y
+# CONFIG_CRYPTO_ANUBIS is not set
+CONFIG_CRYPTO_ARC4=y
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+# CONFIG_CRYPTO_DES is not set
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+# CONFIG_CRC_CCITT is not set
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=m
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/recipes/linux/linux-2.6.30/at91sam9m10g45ek/defconfig b/recipes/linux/linux-2.6.30/at91sam9m10g45ek/defconfig
new file mode 100644
index 0000000..bc04831
--- /dev/null
+++ b/recipes/linux/linux-2.6.30/at91sam9m10g45ek/defconfig
@@ -0,0 +1,1649 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.30
+# Wed Jan 26 00:48:45 2011
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_MMU=y
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_CLASSIC_RCU=y
+# CONFIG_TREE_RCU is not set
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_PREEMPT_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_GROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_RELAY is not set
+CONFIG_NAMESPACES=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+# CONFIG_EMBEDDED is not set
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_CLK=y
+# CONFIG_SLOW_WORK is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_AS=y
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=y
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="anticipatory"
+# CONFIG_FREEZER is not set
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+CONFIG_ARCH_AT91=y
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_W90X900 is not set
+
+#
+# Atmel AT91 System-on-Chip
+#
+# CONFIG_ARCH_AT91RM9200 is not set
+# CONFIG_ARCH_AT91SAM9260 is not set
+# CONFIG_ARCH_AT91SAM9261 is not set
+# CONFIG_ARCH_AT91SAM9G10 is not set
+# CONFIG_ARCH_AT91SAM9263 is not set
+# CONFIG_ARCH_AT91SAM9RL is not set
+# CONFIG_ARCH_AT91SAM9G20 is not set
+# CONFIG_ARCH_AT91SAM9G45 is not set
+CONFIG_ARCH_AT91SAM9M10=y
+# CONFIG_ARCH_AT91CAP9 is not set
+# CONFIG_ARCH_AT572D940HF is not set
+# CONFIG_ARCH_AT91X40 is not set
+CONFIG_AT91_PMC_UNIT=y
+CONFIG_MACH_AT91SAM9M10G45EK=y
+
+#
+# AT91SAM9M10 Board Type
+#
+# CONFIG_MACH_AT91SAM9M10EKES is not set
+
+#
+# AT91 Board Options
+#
+# CONFIG_MTD_NAND_ATMEL_BUSWIDTH_16 is not set
+CONFIG_MTD_NAND_ALLOW_CONFIGURABLE_NAND_BUSWIDTH=y
+CONFIG_MTD_NAND_ATMEL_ROOTFS_SIZE=124
+CONFIG_MTD_NAND_ALLOW_CONFIGURABLE_ROOTFS_SIZE=y
+
+#
+# AT91 Feature Selections
+#
+CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
+CONFIG_AT91_TIMER_HZ=100
+CONFIG_AT91_EARLY_DBGU=y
+# CONFIG_AT91_EARLY_USART0 is not set
+# CONFIG_AT91_EARLY_USART1 is not set
+# CONFIG_AT91_EARLY_USART2 is not set
+# CONFIG_AT91_EARLY_USART3 is not set
+# CONFIG_AT91_EARLY_USART4 is not set
+# CONFIG_AT91_EARLY_USART5 is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=y
+CONFIG_CPU_ARM926T=y
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5TJ=y
+CONFIG_CPU_PABRT_NOIFAR=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_COPY_V4WB=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
+# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+# CONFIG_NO_HZ is not set
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+# CONFIG_ARCH_HAS_HOLES_MEMORYMODEL is not set
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4096
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+CONFIG_UNEVICTABLE_LRU=y
+CONFIG_HAVE_MLOCK=y
+CONFIG_HAVE_MLOCKED_PAGE_BIT=y
+CONFIG_LEDS=y
+CONFIG_LEDS_CPU=y
+CONFIG_ALIGNMENT_TRAP=y
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="mem=64M console=ttyS0,115200 initrd=0x71100000,25165824 root=/dev/ram0 rw"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Power Management
+#
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_FPE_NWFPE=y
+# CONFIG_FPE_NWFPE_XP is not set
+# CONFIG_FPE_FASTFPE is not set
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+# CONFIG_PM is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=y
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_IP_MROUTE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+# CONFIG_CFG80211_REG_DEBUG is not set
+# CONFIG_WIRELESS_OLD_REGULATORY is not set
+CONFIG_WIRELESS_EXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=y
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=y
+
+#
+# Rate control algorithm selection
+#
+CONFIG_MAC80211_RC_MINSTREL=y
+# CONFIG_MAC80211_RC_DEFAULT_PID is not set
+CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
+CONFIG_MAC80211_RC_DEFAULT="minstrel"
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+# CONFIG_MTD_CFI is not set
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+CONFIG_MTD_DATAFLASH=y
+# CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
+# CONFIG_MTD_DATAFLASH_OTP is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+CONFIG_MTD_NAND_ATMEL=y
+CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
+# CONFIG_MTD_NAND_ATMEL_ECC_HW is not set
+# CONFIG_MTD_NAND_ATMEL_ECC_NONE is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+
+#
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_BLK_DEV_RAM_SIZE=8192
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=y
+CONFIG_ATMEL_TCLIB=y
+CONFIG_ATMEL_TCB_CLKSRC=y
+CONFIG_ATMEL_TCB_CLKSRC_BLOCK=0
+# CONFIG_ICS932S401 is not set
+# CONFIG_ATMEL_SSC is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+CONFIG_EEPROM_AT24=y
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_LEGACY is not set
+CONFIG_EEPROM_93CX6=m
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+
+#
+# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
+#
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_SCSI_DH=y
+# CONFIG_SCSI_DH_RDAC is not set
+# CONFIG_SCSI_DH_HP_SW is not set
+# CONFIG_SCSI_DH_EMC is not set
+# CONFIG_SCSI_DH_ALUA is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=y
+CONFIG_COMPAT_NET_DEV_OPS=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+CONFIG_DAVICOM_PHY=y
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+# CONFIG_SMSC_PHY is not set
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=y
+CONFIG_MII=y
+CONFIG_MACB=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_ETHOC is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+# CONFIG_DNET is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+CONFIG_WLAN_80211=y
+CONFIG_LIBERTAS=m
+CONFIG_LIBERTAS_USB=m
+CONFIG_LIBERTAS_SDIO=m
+CONFIG_LIBERTAS_SPI=m
+# CONFIG_LIBERTAS_DEBUG is not set
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_AT76C50X_USB is not set
+CONFIG_USB_ZD1201=m
+# CONFIG_USB_NET_RNDIS_WLAN is not set
+CONFIG_RTL8187=m
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_P54_COMMON is not set
+CONFIG_AR9170_USB=m
+# CONFIG_HOSTAP is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+CONFIG_ZD1211RW=m
+# CONFIG_ZD1211RW_DEBUG is not set
+CONFIG_RT2X00=m
+CONFIG_RT2500USB=m
+CONFIG_RT73USB=m
+CONFIG_RT2X00_LIB_USB=m
+CONFIG_RT2X00_LIB=m
+CONFIG_RT2X00_LIB_FIRMWARE=y
+CONFIG_RT2X00_LIB_CRYPTO=y
+CONFIG_RT2X00_LIB_RFKILL=y
+CONFIG_RT2X00_LIB_LEDS=y
+# CONFIG_RT2X00_DEBUG is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+# CONFIG_USB_USBNET is not set
+# CONFIG_WAN is not set
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+CONFIG_INPUT_POLLDEV=m
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=480
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=272
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
+# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+CONFIG_TOUCHSCREEN_ATMEL_TSADCC=y
+# CONFIG_TOUCHSCREEN_WM97XX is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_DEVKMEM=y
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_ATMEL=y
+CONFIG_SERIAL_ATMEL_CONSOLE=y
+CONFIG_SERIAL_ATMEL_PDC=y
+# CONFIG_SERIAL_ATMEL_TTYAT is not set
+# CONFIG_SERIAL_MAX3100 is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+CONFIG_LEGACY_PTYS=y
+CONFIG_LEGACY_PTY_COUNT=4
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_HELPER_AUTO=y
+CONFIG_I2C_ALGOBIT=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+CONFIG_I2C_GPIO=y
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+CONFIG_SPI=y
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+CONFIG_SPI_ATMEL=y
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_GPIO_SYSFS is not set
+
+#
+# Memory mapped GPIO expanders:
+#
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+
+#
+# Multimedia devices
+#
+
+#
+# Multimedia core support
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+# CONFIG_VIDEO_MEDIA is not set
+
+#
+# Multimedia drivers
+#
+# CONFIG_DAB is not set
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D15605 is not set
+# CONFIG_FB_S1D13XXX is not set
+CONFIG_FB_ATMEL=y
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_ATMEL_LCDC=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE is not set
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=y
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_HWDEP=m
+CONFIG_SND_RAWMIDI=m
+CONFIG_SND_SEQUENCER=y
+# CONFIG_SND_SEQ_DUMMY is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=y
+CONFIG_SND_PCM_OSS=y
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_SEQUENCER_OSS is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_VERBOSE_PROCFS is not set
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_VMASTER=y
+CONFIG_SND_AC97_CODEC=y
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_ARM is not set
+
+#
+# Atmel devices (AVR32 and AT91)
+#
+CONFIG_SND_ATMEL_AC97C=y
+# CONFIG_SND_SPI is not set
+CONFIG_SND_USB=y
+CONFIG_SND_USB_AUDIO=m
+# CONFIG_SND_USB_CAIAQ is not set
+# CONFIG_SND_SOC is not set
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=y
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+# CONFIG_USB_HID is not set
+# CONFIG_HID_PID is not set
+
+#
+# Special HID drivers
+#
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+# CONFIG_USB_DEVICE_CLASS is not set
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_OTG is not set
+# CONFIG_USB_MON is not set
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_EHCI_HCD=y
+# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+CONFIG_USB_OHCI_HCD=y
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=y
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_GADGET_MUSB_HDRC is not set
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_BERRY_CHARGE is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_AT91 is not set
+CONFIG_USB_GADGET_ATMEL_USBA=y
+CONFIG_USB_ATMEL_USBA=y
+# CONFIG_USB_GADGET_FSL_USB2 is not set
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
+# CONFIG_USB_GADGET_PXA27X is not set
+# CONFIG_USB_GADGET_S3C2410 is not set
+# CONFIG_USB_GADGET_IMX is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_AMD5536UDC is not set
+# CONFIG_USB_GADGET_FSL_QE is not set
+# CONFIG_USB_GADGET_CI13XXX is not set
+# CONFIG_USB_GADGET_NET2280 is not set
+# CONFIG_USB_GADGET_GOKU is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+CONFIG_USB_ZERO=m
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_GADGETFS is not set
+# CONFIG_USB_FILE_STORAGE is not set
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+CONFIG_USB_CDC_COMPOSITE=m
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_NOP_USB_XCEIV is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+CONFIG_SDIO_UART=m
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_AT91 is not set
+CONFIG_MMC_ATMELMCI=y
+CONFIG_MMC_ATMELMCI_DMA=y
+# CONFIG_MMC_SPI is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_GPIO_PLATFORM=y
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+CONFIG_LEDS_TRIGGER_GPIO=y
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=y
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_AT91SAM9=y
+CONFIG_RTC_DRV_AT91SAM9_RTT=0
+CONFIG_RTC_DRV_AT91SAM9_GPBR=0
+CONFIG_DMADEVICES=y
+
+#
+# DMA Devices
+#
+CONFIG_AT_HDMAC=y
+CONFIG_DMA_ENGINE=y
+
+#
+# DMA Clients
+#
+# CONFIG_NET_DMA is not set
+# CONFIG_ASYNC_TX_DMA is not set
+CONFIG_DMATEST=m
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+CONFIG_FILE_LOCKING=y
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+CONFIG_CRAMFS=m
+CONFIG_SQUASHFS=m
+CONFIG_SQUASHFS_EMBEDDED=y
+CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+# CONFIG_NFS_V4 is not set
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+# CONFIG_RPCSEC_GSS_KRB5 is not set
+# CONFIG_RPCSEC_GSS_SPKM3 is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=y
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_850=y
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+CONFIG_NLS_ISO8859_15=y
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_TRACING_SUPPORT=y
+
+#
+# Tracers
+#
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_EVENT_TRACER is not set
+# CONFIG_BOOT_TRACER is not set
+# CONFIG_TRACE_BRANCH_PROFILING is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_KMEMTRACE is not set
+# CONFIG_WORKQUEUE_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+CONFIG_ARM_UNWIND=y
+CONFIG_DEBUG_USER=y
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_FIPS is not set
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+# CONFIG_CRYPTO_CBC is not set
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=y
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=y
+# CONFIG_CRYPTO_ANUBIS is not set
+CONFIG_CRYPTO_ARC4=y
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+# CONFIG_CRYPTO_DES is not set
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+# CONFIG_CRC_CCITT is not set
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=m
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/recipes/linux/linux_2.6.30.bb b/recipes/linux/linux_2.6.30.bb
index e521cbc..d822ee4 100644
--- a/recipes/linux/linux_2.6.30.bb
+++ b/recipes/linux/linux_2.6.30.bb
@@ -1,7 +1,7 @@
 require linux.inc
 
-PR = "r6"
-
+PR = "r8"
+AT91_EXPERIMENTAL = "4"
 S = "${WORKDIR}/linux-${PV}"
 
 # Mark archs/machines that this kernel supports
@@ -19,24 +19,66 @@ DEFAULT_PREFERENCE_at91sam9g20ek	= "2"
 
 # machine boots with it, works but was not tested too much
 DEFAULT_PREFERENCE_at91sam9263ek = "-1"
-DEFAULT_PREFERENCE_tosa = "-1"
+DEFAULT_PREFERENCE_tosa = "-1"/home/ulf/projects/OE_atmel/build/tmp-angstrom_2008_1/work/at91sam9m10ekes-angstrom-linux-gnueabi/linux-2.6.30-r8
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.10.bz2;apply=yes;name=stablepatch \
            file://aufs2-30.patch \
            file://defconfig"
 
+
+SRC_URI_at91sam9m10ekes = " \
+	   ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+	   http://maxim.org.za/AT91RM9200/2.6/${PV}-at91.patch.gz;apply=no;name=at91patch \
+	   ftp://www.at91.com/pub/linux/${PV}-at91/${PV}-at91-exp.${AT91_EXPERIMENTAL}.tar.gz;apply=no;name=at91exp${AT91_EXPERIMENTAL} \
+	   file://at91/exp.${AT91_EXPERIMENTAL}/0001-Configurable-partition-size.patch;apply=yes \
+	   file://at91/exp.${AT91_EXPERIMENTAL}/0002-mach-at91-KConfig-cleanup.patch;apply=yes \
+	   http://www.hd-wireless.se/images/stories/public_pdf/2.6.30-at91-sdio-irq-support.patch;apply=yes;name=owlwifi \
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
 	   ftp://www.at91.com/pub/buildroot/2.6.30-exp.2.patch.bz2;apply=yes;name=at91exp2 \
-	   file://at91/linux-2.6.30-001-configurable-partition-size.patch.patch \
-	   file://at91/linux-2.6.30-002-mach-at91-Kconfig.patch \
-	   file://at91/linux-2.6.30-003-sam9m10g45ek.patch \
+	   file://at91/exp.2/linux-2.6.30-001-configurable-partition-size.patch.patch \
+	   file://at91/exp.2/linux-2.6.30-002-mach-at91-Kconfig.patch \
+	   file://at91/exp.2/linux-2.6.30-003-sam9m10g45ek.patch \
 	   file://defconfig"
 
+
+
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
+
 # SRC_URI_append_at91sam9263ek = " file://hrw-linux-2.6.30-exp.patch "
 
 SRC_URI[kernel.md5sum] = "7a80058a6382e5108cdb5554d1609615"
@@ -48,5 +90,8 @@ SRC_URI[at91patch.md5sum] = "f13ab353b11329ce3d605b6f40e77fa6"
 SRC_URI[at91patch.sha256sum] = "41991e8aa2e5fe8e5dfd47b1e5c446fa03c3ee96a5eae54fd6ec15d1d9afef30"
 SRC_URI[at91exp2.md5sum] = "770c7a2bfb925111a8c0e0d4c8c4764e"
 SRC_URI[at91exp2.sha256sum] = "58894965b253eae0c4caacedc3463cf186c18431ca0d71b767a3b36aa40ec388"
+SRC_URI[at91exp4.md5sum] = "9ca9901af101d9966a3acf80193bfd7d"
+SRC_URI[at91exp4.sha256sum] = "b948199be87cf9ba280ea649aa1b477b36344a44aae52fdc3bb56344adf73f76"
 
-
+SRC_URI[owlwifi.md5sum] = "8ae8eafddf3d8a1c507aca4d09627a4d"
+SRC_URI[owlwifi.sha256sum] = "eebc26aaa9f746eff90cce1d0a3537d2b8f48a69a054733c749e4b12c3ad6069"
-- 
1.6.3.3



