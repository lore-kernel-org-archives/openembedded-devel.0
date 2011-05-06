Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anilm@mistralsolutions.com>) id 1QIFIN-0003cW-DU
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 09:17:59 +0200
Received: by iwn10 with SMTP id 10so2741239iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 00:15:07 -0700 (PDT)
Received: by 10.42.133.9 with SMTP id f9mr2383487ict.137.1304666106366;
	Fri, 06 May 2011 00:15:06 -0700 (PDT)
Received: from anilm@mistralsolutions.com ([122.166.13.232])
	by mx.google.com with ESMTPS id u17sm1244279ibm.28.2011.05.06.00.15.03
	(version=SSLv3 cipher=OTHER); Fri, 06 May 2011 00:15:06 -0700 (PDT)
Date: Fri, 6 May 2011 12:45:01 +0530
From: Anil Kumar <anilm@mistralsolutions.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <4dc39ffa.515de70a.0357.543a@mx.google.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: koen@dominion.thruhere.net, srinath@mistralsolutions.com,
	paulepanter@users.sourceforge.net, nagendra@mistralsolutions.com
Subject: [PATCH] u-boot_git: Ethernet MACID display fix for CraneBoard
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
X-List-Received-Date: Fri, 06 May 2011 07:17:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

      CraneBoard u-boot displays the MAC ID wrongly if MAC ID has
      preceding zeros. This patch fixes it and updates Ethernet
      NRST GPIO from 34 to 65.
---
 ...t-MACID-display-fix-for-am3517-craneboard.patch |  108 ++++++++++++++++++++
 recipes/u-boot/u-boot_git.bb                       |    3 +-
 2 files changed, 110 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-git/am3517-crane/0004-Ethernet-MACID-display-fix-for-am3517-craneboard.patch

diff --git a/recipes/u-boot/u-boot-git/am3517-crane/0004-Ethernet-MACID-display-fix-for-am3517-craneboard.patch b/recipes/u-boot/u-boot-git/am3517-crane/0004-Ethernet-MACID-display-fix-for-am3517-craneboard.patch
new file mode 100644
index 0000000..5ff135d
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/am3517-crane/0004-Ethernet-MACID-display-fix-for-am3517-craneboard.patch
@@ -0,0 +1,108 @@
+From 2e0ac19c4b32700ec07c04465b45a55b0dfa8962 Mon Sep 17 00:00:00 2001
+From: Anil Kumar M <anilm@mistralsolutions.com>
+Date: Thu, 5 May 2011 16:53:59 +0530
+Subject: [PATCH] Ethernet MACID display fix for am3517-craneboard
+
+Signed-off-by: Anil Kumar M <anilm@mistralsolutions.com>
+---
+ board/ti/am3517crane/am3517crane.c |   41 ++++++++++++++++++++---------------
+ board/ti/am3517crane/am3517crane.h |    9 ++++---
+ 2 files changed, 28 insertions(+), 22 deletions(-)
+
+diff --git a/board/ti/am3517crane/am3517crane.c b/board/ti/am3517crane/am3517crane.c
+index 40e8b91..019758e 100644
+--- a/board/ti/am3517crane/am3517crane.c
++++ b/board/ti/am3517crane/am3517crane.c
+@@ -38,7 +38,7 @@
+ #if defined(CONFIG_DRIVER_TI_EMAC)
+ #define AM3517_IP_SW_RESET	0x48002598
+ #define CPGMACSS_SW_RST		(1 << 1)
+-#define ETHERNET_NRST		34
++#define ETHERNET_NRST		65
+ #define EMACID_ADDR_LSB 	0x48002380
+ #define EMACID_ADDR_MSB 	0x48002384
+ #endif
+@@ -204,30 +204,35 @@ int misc_init_r(void)
+ int cpu_eth_init(bd_t *bis)
+ {
+ #if defined(CONFIG_DRIVER_TI_EMAC)
+-	char mac_buf_lsb[8];
+-	char mac_buf_msb[16];
+-	char mac_id[24];
+-	const unsigned char separator = ':';
++	/* Check for efficient way of code*/
++	u8 mac_id[32];
++
++	u16 aa, bb, cc, dd, ee, ff;
++	u32 emac_lsb, emac_msb;
++
++	memset(mac_id, '\0', sizeof(mac_id));
+ 
+ 	printf("davinci_emac_initialize\n");
+ 	davinci_emac_initialize();
+ 
+-	memset(mac_buf_lsb, '\0', sizeof(mac_buf_lsb));
+-	memset(mac_buf_msb, '\0', sizeof(mac_buf_msb));
+-	memset(mac_id, '\0', sizeof(mac_id));
++	emac_lsb = readl(EMACID_ADDR_LSB);
++	emac_msb = readl(EMACID_ADDR_MSB);
+ 
+-	sprintf(mac_buf_msb, "%x", readl(EMACID_ADDR_MSB));
+-	sprintf(mac_buf_lsb, "%x", readl(EMACID_ADDR_LSB));
+-	strcat(mac_buf_msb, mac_buf_lsb);
+-	sprintf(mac_id, "%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",
+-			mac_buf_msb[0], mac_buf_msb[1], separator,
+-			mac_buf_msb[2], mac_buf_msb[3], separator,
+-			mac_buf_msb[4], mac_buf_msb[5], separator,
+-			mac_buf_msb[6], mac_buf_msb[7], separator,
+-			mac_buf_msb[8], mac_buf_msb[9], separator,
+-			mac_buf_msb[10], mac_buf_msb[11]);
++	cc  = (emac_msb & 0x000000FF) >> 0;
++	bb  = (emac_msb & 0x0000FF00) >> 8;
++	aa  = (emac_msb  & 0x00FF0000) >> 16;
+ 
++	ff  = (emac_lsb & 0x000000FF);
++	ee  = (emac_lsb & 0x0000FF00) >> 8;
++	dd  = (emac_lsb & 0x00FF0000) >> 16;
++
++	sprintf(mac_id, "%02x:%02x:%02x:%02x:%02x:%02x",
++				 aa, bb, cc, dd, ee, ff);
++
++	printf("-----------------------------\n");
+ 	printf("EMAC ID %s\n", mac_id);
++	printf("-----------------------------\n");
++
+ 	setenv("ethaddr", mac_id);
+ #endif
+ 	return 0;
+diff --git a/board/ti/am3517crane/am3517crane.h b/board/ti/am3517crane/am3517crane.h
+index 83fe858..cdb0542 100644
+--- a/board/ti/am3517crane/am3517crane.h
++++ b/board/ti/am3517crane/am3517crane.h
+@@ -88,10 +88,10 @@ const omap3_sysinfo sysinfo = {
+ 	MUX_VAL(CP(STRBEN_DLY0),	(IEN  | PTD | EN  | M0)) \
+ 	MUX_VAL(CP(STRBEN_DLY1),	(IEN  | PTD | EN  | M0)) \
+ /* GPMC */\
+-	/* GPIO_34 ETHERNET_nRST */ \
+-	MUX_VAL(CP(GPMC_A1),		(IDIS | PTU | EN  | M4)) \
++	/* GPIO_34 NC */ \
++	MUX_VAL(CP(GPMC_A1),		(M7)) \
+ 	/* GPIO_35 USB1_HOST_EN */ \
+-	MUX_VAL(CP(GPMC_A2),		(IDIS | PTU | EN  | M4)) \
++	MUX_VAL(CP(GPMC_A2),		(IDIS | PTU | DIS | M4)) \
+ 	/* GPIO_36 USB0_OVER_CURRENT*/ \
+ 	MUX_VAL(CP(GPMC_A3),		(IDIS | PTU | EN  | M4)) \
+ 	/* GPIO_37 USB1_OVER_CURRENT */ \
+@@ -140,7 +140,8 @@ const omap3_sysinfo sysinfo = {
+ 	MUX_VAL(CP(GPMC_WAIT0),		(IEN  | PTD | DIS | M0)) \
+ 	MUX_VAL(CP(GPMC_WAIT1),		(M7)) \
+ 	MUX_VAL(CP(GPMC_WAIT2),		(M7)) \
+-	MUX_VAL(CP(GPMC_WAIT3),		(M7)) \
++	/* GPIO_65 ETHERNET_nRST */ \
++	MUX_VAL(CP(GPMC_WAIT3),		(IDIS | PTU | EN  | M4)) \
+ /* DSS */\
+ 	MUX_VAL(CP(DSS_PCLK),		(IDIS | PTD | DIS | M0)) \
+ 	MUX_VAL(CP(DSS_HSYNC),		(IDIS | PTD | DIS | M0)) \
+-- 
+1.7.2.3
+
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 2cf5b12..ffe13d0 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR = "r75"
+PR = "r76"
 
 FILESPATHPKG =. "u-boot-git:"
 
@@ -138,6 +138,7 @@ SRC_URI_am3517-crane = "git://arago-project.org/git/projects/u-boot-omap3.git;pr
                         file://0001-OMAP2-3-I2C-Add-support-for-second-and-third-bus.patch \
                         file://0002-ARMV7-Restructure-OMAP-i2c-driver-to-allow-code-shar.patch \
                         file://0003-craneboard-add-expansionboard-support.patch \
+			file://0004-Ethernet-MACID-display-fix-for-am3517-craneboard.patch \
 "
 
 SRCREV_am3517-crane = "c0a8fb217fdca7888d89f9a3dee74a4cec865620"
-- 
1.7.0.4



