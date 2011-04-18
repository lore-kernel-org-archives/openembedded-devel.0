Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QBy5i-0005Av-8n
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 01:42:50 +0200
Received: (qmail invoked by alias); 18 Apr 2011 23:40:29 -0000
Received: from p5B0A0ED1.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [91.10.14.209]
	by mail.gmx.net (mp006) with SMTP; 19 Apr 2011 01:40:29 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+rijFwcGKrivDhTd7Gnf8kJKOxLw/q7JUd7OqeeZ
	Yuz2ec3+zN02bo
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Apr 2011 01:36:31 +0200
Message-Id: <1303169791-19354-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
Subject: [PATCH v3] u-boot_overo: current version does not boot / read expansion board ID.
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
X-List-Received-Date: Mon, 18 Apr 2011 23:42:50 -0000

Patches & settings were taken from [1] / branch overo.
For more informations see [2].

Tests performed:
* boot kernel 2.6.37 from SDCard
* boot kernel 2.6.30 from NAND
* variable manipulations setenv printenv savenv
* NAND erase

[1] git://gitorious.org/gumstix-oe/mainline.git
[2] http://gitorious.org/gumstix-oe/mainline/blobs/overo/recipes/u-boot/u-boot-omap3_git.bb

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 conf/machine/overo.conf                            |    3 +-
 recipes/u-boot/u-boot-git/overo/expansion.patch    |  148 ++++++++++++++++++++
 recipes/u-boot/u-boot-git/overo/overo-gpio10.patch |   13 ++
 recipes/u-boot/u-boot_git.bb                       |   10 +-
 4 files changed, 169 insertions(+), 5 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-git/overo/expansion.patch
 create mode 100644 recipes/u-boot/u-boot-git/overo/overo-gpio10.patch

diff --git a/conf/machine/overo.conf b/conf/machine/overo.conf
index e22cd6e..ba6aebe 100644
--- a/conf/machine/overo.conf
+++ b/conf/machine/overo.conf
@@ -8,7 +8,8 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 TARGET_ARCH = "arm"
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa touchscreen"
 
-UBOOT_MACHINE_overo = "omap3_overo_config"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+UBOOT_MACHINE = "omap3_overo_config"
 
 SERIAL_CONSOLE = "115200 ttyS2"
 
diff --git a/recipes/u-boot/u-boot-git/overo/expansion.patch b/recipes/u-boot/u-boot-git/overo/expansion.patch
new file mode 100644
index 0000000..3320a55
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/overo/expansion.patch
@@ -0,0 +1,148 @@
+From: Steve Sakoman <steve@sakoman.com>
+Date: Mon, 20 Sep 2010 15:05:14 +0000 (-0700)
+Subject: ARMV7: OMAP3: Add expansion board detection for Overo
+X-Git-Url: http://www.sakoman.com/cgi-bin/gitweb.cgi?p=u-boot.git;a=commitdiff_plain;h=01ed2c6d5dea9f0a771f37b4c23c31f4566a13b7
+
+ARMV7: OMAP3: Add expansion board detection for Overo
+
+Overo expansion boards contain an i2c eeprom to identify themselves.
+This patch adds code to read and parse the eeprom contents.  It prints
+the expansion board name and revision and modifies environment variables
+as appropriate.
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+
+diff --git a/board/overo/overo.c b/board/overo/overo.c
+index 9c92693..293c4e0 100644
+--- a/board/overo/overo.c
++++ b/board/overo/overo.c
+@@ -40,6 +40,30 @@
+ #include <asm/mach-types.h>
+ #include "overo.h"
+ 
++#define TWL4030_I2C_BUS			0
++#define EXPANSION_EEPROM_I2C_BUS	2
++#define EXPANSION_EEPROM_I2C_ADDRESS	0x51
++
++#define GUMSTIX_SUMMIT			0x01000200
++#define GUMSTIX_TOBI			0x02000200
++#define GUMSTIX_TOBI_DUO		0x03000200
++#define GUMSTIX_PALO35			0x04000200
++#define GUMSTIX_PALO43			0x05000200
++#define GUMSTIX_CHESTNUT43		0x06000200
++#define GUMSTIX_PINTO			0x07000200
++#define GUMSTIX_GALLOP43		0x08000200
++
++#define GUMSTIX_NO_EEPROM		0xffffffff
++
++static struct {
++	unsigned int device_vendor;
++	unsigned char revision;
++	unsigned char content;
++	char fab_revision[8];
++	char env_var[16];
++	char env_setting[64];
++} expansion_config;
++
+ #if defined(CONFIG_CMD_NET)
+ static void setup_net_chip(void);
+ #endif
+@@ -137,6 +161,29 @@ int get_sdio2_config(void)
+ }
+ 
+ /*
++ * Routine: get_expansion_id
++ * Description: This function checks for expansion board by checking I2C
++ *		bus 2 for the availability of an AT24C01B serial EEPROM.
++ *		returns the device_vendor field from the EEPROM
++ */
++unsigned int get_expansion_id(void)
++{
++	i2c_set_bus_num(EXPANSION_EEPROM_I2C_BUS);
++
++	/* return GUMSTIX_NO_EEPROM if eeprom doesn't respond */
++	if (i2c_probe(EXPANSION_EEPROM_I2C_ADDRESS) == 1)
++		return GUMSTIX_NO_EEPROM;
++
++	/* read configuration data */
++	i2c_read(EXPANSION_EEPROM_I2C_ADDRESS, 0, 1, (u8 *)&expansion_config,
++		 sizeof(expansion_config));
++
++	i2c_set_bus_num(TWL4030_I2C_BUS);
++
++	return expansion_config.device_vendor;
++}
++
++/*
+  * Routine: misc_init_r
+  * Description: Configure board specific parts
+  */
+@@ -164,6 +211,55 @@ int misc_init_r(void)
+ 		printf("Unable to detect mmc2 connection type\n");
+ 	}
+ 
++	switch (get_expansion_id()) {
++	case GUMSTIX_SUMMIT:
++		printf("Recognized Summit expansion board (rev %d %s)\n",
++			expansion_config.revision, expansion_config.fab_revision);
++		setenv("defaultdisplay", "dvi");
++		break;
++	case GUMSTIX_TOBI:
++		printf("Recognized Tobi expansion board (rev %d %s)\n",
++			expansion_config.revision, expansion_config.fab_revision);
++		setenv("defaultdisplay", "dvi");
++		break;
++	case GUMSTIX_TOBI_DUO:
++		printf("Recognized Tobi Duo expansion board (rev %d %s)\n",
++			expansion_config.revision, expansion_config.fab_revision);
++		break;
++	case GUMSTIX_PALO35:
++		printf("Recognized Palo35 expansion board (rev %d %s)\n",
++			expansion_config.revision, expansion_config.fab_revision);
++		setenv("defaultdisplay", "lcd35");
++		break;
++	case GUMSTIX_PALO43:
++		printf("Recognized Palo43 expansion board (rev %d %s)\n",
++			expansion_config.revision, expansion_config.fab_revision);
++		setenv("defaultdisplay", "lcd43");
++		break;
++	case GUMSTIX_CHESTNUT43:
++		printf("Recognized Chestnut43 expansion board (rev %d %s)\n",
++			expansion_config.revision, expansion_config.fab_revision);
++		setenv("defaultdisplay", "lcd43");
++		break;
++	case GUMSTIX_PINTO:
++		printf("Recognized Pinto expansion board (rev %d %s)\n",
++			expansion_config.revision, expansion_config.fab_revision);
++		break;
++	case GUMSTIX_GALLOP43:
++		printf("Recognized Gallop43 expansion board (rev %d %s)\n",
++			expansion_config.revision, expansion_config.fab_revision);
++		setenv("defaultdisplay", "lcd43");
++		break;
++	case GUMSTIX_NO_EEPROM:
++		printf("No EEPROM on expansion board\n");
++		break;
++	default:
++		printf("Unrecognized expansion board\n");
++	}
++
++	if (expansion_config.content == 1)
++		setenv(expansion_config.env_var, expansion_config.env_setting);
++
+ 	dieid_num_r();
+ 
+ 	return 0;
+diff --git a/include/configs/omap3_overo.h b/include/configs/omap3_overo.h
+index 69f9126..29f0aa8 100644
+--- a/include/configs/omap3_overo.h
++++ b/include/configs/omap3_overo.h
+@@ -120,6 +120,7 @@
+ #define CONFIG_SYS_I2C_SLAVE		1
+ #define CONFIG_SYS_I2C_BUS		0
+ #define CONFIG_SYS_I2C_BUS_SELECT	1
++#define CONFIG_I2C_MULTI_BUS		1
+ #define CONFIG_DRIVER_OMAP34XX_I2C	1
+ 
+ /*
diff --git a/recipes/u-boot/u-boot-git/overo/overo-gpio10.patch b/recipes/u-boot/u-boot-git/overo/overo-gpio10.patch
new file mode 100644
index 0000000..202471f
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/overo/overo-gpio10.patch
@@ -0,0 +1,13 @@
+diff --git a/board/overo/overo.h b/board/overo/overo.h
+index 68e1243..9fb7a63 100644
+--- a/board/overo/overo.h
++++ b/board/overo/overo.h
+@@ -299,7 +299,7 @@ const omap3_sysinfo sysinfo = {
+ 	MUX_VAL(CP(SYS_BOOT5),		(IEN  | PTD | DIS | M4)) /*GPIO_7*/\
+ 	MUX_VAL(CP(SYS_BOOT6),		(IDIS | PTD | DIS | M4)) /*GPIO_8*/\
+ 	MUX_VAL(CP(SYS_OFF_MODE),	(IEN  | PTD | DIS | M0)) /*SYS_OFF_MODE*/\
+-	MUX_VAL(CP(SYS_CLKOUT1),	(IEN  | PTD | DIS | M0)) /*SYS_CLKOUT1*/\
++	MUX_VAL(CP(SYS_CLKOUT1),	(IEN  | PTU | EN  | M4)) /*GPIO_10*/\
+ 	MUX_VAL(CP(SYS_CLKOUT2),	(IEN  | PTU | EN  | M4)) /*GPIO_186*/\
+ 	MUX_VAL(CP(ETK_CLK_ES2),	(IEN  | PTU | EN  | M2)) /*MMC3_CLK*/\
+ 	MUX_VAL(CP(ETK_CTL_ES2),	(IEN  | PTU | EN  | M2)) /*MMC3_CMD*/\
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 2cf5b12..6e04b26 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -197,10 +197,12 @@ do_compile_omapzoom36x () {
         oe_runmake tools
 }
 
-SRC_URI_overo = "git://www.sakoman.com/git/u-boot.git;branch=omap4-exp;protocol=git \
-"
-SRCREV_overo = "261733408a27d14590cf3ec6b596461808050e32"
-PV_overo = "2010.12+${PR}+gitr${SRCREV}"
+SRC_URI_overo = "git://git.denx.de/u-boot.git;branch=master;protocol=git \
+                 file://expansion.patch \
+                 file://overo-gpio10.patch \
+                "
+SRCREV_overo = "1e4e5ef0469050f014aee1204dae8a9ab6053e49"
+PV_overo = "2010.9+${PR}+git${SRCREV}"
 
 SRC_URI_omap4430-panda = "git://www.sakoman.com/git/u-boot.git;branch=omap4-exp;protocol=git \
                           file://fix-break-caused-by-new-binutils.patch \
-- 
1.7.2.3



