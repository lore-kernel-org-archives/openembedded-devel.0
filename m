Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Qe95t-0001eH-Ts
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jul 2011 19:07:30 +0200
Received: from mail616.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 2C6B4DC0F23
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 18:39:19 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Jul 2011 18:38:39 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 5 Jul 2011 18:38:37 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jul 2011 18:38:18 +0200
Message-Id: <1309883899-658-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1309883899-658-1-git-send-email-eric@eukrea.com>
References: <1309883899-658-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4471230005301128523
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -10
X-VR-SPAMCAUSE: Vade Retro 01.322.28 AV+AS Profile: OVH; Bailout: 300;
	linux (-10)
Cc: leon@sidebranch.com
Subject: [PATCH 3/4] u-boot-2010.09: add recipe with ronetix-pm9g45 board support
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
X-List-Received-Date: Tue, 05 Jul 2011 17:07:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../ronetix-pm9g45/0001-pm9g45-add-LCD.patch       |  193 +++++++++++++
 ...ides-48-bits-serial-number-using-Dallas-1.patch |  302 ++++++++++++++=
++++++
 ...-DS2401-to-set-the-MAC-address-of-the-Eth.patch |  109 +++++++
 ...-DS2401-to-set-the-MAC-address-of-the-Eth.patch |  108 +++++++
 ...-DS2401-to-set-the-MAC-address-of-the-Eth.patch |  108 +++++++
 .../0006-PM9263-with-128MiB-of-SRAM.patch          |   35 +++
 ...0007-pm9g45-make-ethernet-working-in-v1.3.patch |   70 +++++
 ...dd-enable-disable-option-to-reset-the-PHY.patch |   57 ++++
 ...9-pm9g45-enable-user-reset-when-on-bb9g45.patch |   42 +++
 ...10-add-a-display-GATW70SN8H1E0-for-bb9g45.patch |   52 ++++
 ...1-pm9g45-choose-between-bb9g45-and-bb9263.patch |  105 +++++++
 .../0012-RGB_BGR-fixes-of-LCD-on-bb9g45.patch      |   45 +++
 ...-88c4b7783d567f1c26b81a0c9daea99b44cd8723.patch |   37 +++
 ...a-delay-for-the-PSRAM-in-v1.3-of-the-boar.patch |   33 +++
 recipes/u-boot/u-boot_2010.09.bb                   |   36 +++
 15 files changed, 1332 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0001-pm9=
g45-add-LCD.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0002-DS2=
401-provides-48-bits-serial-number-using-Dallas-1.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0003-PM9=
G45-uses-DS2401-to-set-the-MAC-address-of-the-Eth.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0004-PM9=
263-uses-DS2401-to-set-the-MAC-address-of-the-Eth.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0005-PM9=
261-uses-DS2401-to-set-the-MAC-address-of-the-Eth.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0006-PM9=
263-with-128MiB-of-SRAM.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0007-pm9=
g45-make-ethernet-working-in-v1.3.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0008-pm9=
g45-add-enable-disable-option-to-reset-the-PHY.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0009-pm9=
g45-enable-user-reset-when-on-bb9g45.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0010-add=
-a-display-GATW70SN8H1E0-for-bb9g45.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0011-pm9=
g45-choose-between-bb9g45-and-bb9263.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0012-RGB=
_BGR-fixes-of-LCD-on-bb9g45.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0013-rev=
ert-88c4b7783d567f1c26b81a0c9daea99b44cd8723.patch
 create mode 100644 recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0014-pm9=
263-add-a-delay-for-the-PSRAM-in-v1.3-of-the-boar.patch
 create mode 100644 recipes/u-boot/u-boot_2010.09.bb

diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0001-pm9g45-add=
-LCD.patch b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0001-pm9g45-add=
-LCD.patch
new file mode 100644
index 0000000..9b08ee1
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0001-pm9g45-add-LCD.pa=
tch
@@ -0,0 +1,193 @@
+From 0cc702cd9994e5ff01747a896903888caa3304d9 Mon Sep 17 00:00:00 2001
+From: Asen Dimov <dimov@ronetix.at>
+Date: Thu, 26 Aug 2010 11:17:07 +0300
+Subject: [PATCH 01/14] pm9g45: add LCD
+
+Signed-off-by: Asen Dimov <dimov@ronetix.at>
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ board/ronetix/pm9g45/pm9g45.c |  130 ++++++++++++++++++++++++++++++++++=
+++++++
+ include/configs/pm9g45.h      |   12 ++++
+ 2 files changed, 142 insertions(+), 0 deletions(-)
+
+diff --git a/board/ronetix/pm9g45/pm9g45.c b/board/ronetix/pm9g45/pm9g45=
.c
+index 3b4d9a3..c6635b4 100644
+--- a/board/ronetix/pm9g45/pm9g45.c
++++ b/board/ronetix/pm9g45/pm9g45.c
+@@ -39,6 +39,14 @@
+ #include <asm/arch/clk.h>
+ #include <asm/arch/io.h>
+ #include <asm/arch/hardware.h>
++#ifdef CONFIG_LCD
++#include <lcd.h>
++#include <atmel_lcdc.h>
++#endif
++#ifdef CONFIG_LCD_INFO
++#include <nand.h>
++#include <version.h>
++#endif
+ #if defined(CONFIG_RESET_PHY_R) && defined(CONFIG_MACB)
+ #include <net.h>
+ #endif
+@@ -130,6 +138,124 @@ static void pm9g45_macb_hw_init(void)
+ }
+ #endif
+=20
++#ifdef CONFIG_LCD
++/*
++ * LCD name TX09D50VM1CCA
++ */
++vidinfo_t panel_info =3D {
++	vl_col:		240,
++	vl_row:		320,
++	vl_clk:		4965000,
++	vl_sync:	ATMEL_LCDC_INVLINE_NORMAL |
++			ATMEL_LCDC_INVFRAME_NORMAL,
++	vl_bpix:	3,
++	vl_tft:		1,
++	vl_hsync_len:	5,
++	vl_left_margin:	1,
++	vl_right_margin:33,
++	vl_vsync_len:	1,
++	vl_upper_margin:1,
++	vl_lower_margin:0,
++	mmio:		AT91SAM9G45_LCDC_BASE,
++};
++
++void lcd_enable(void)
++{
++	at91_set_a_periph(AT91_PIO_PORTE, 6, 1);	/* power up */
++}
++
++void lcd_disable(void)
++{
++	at91_set_a_periph(AT91_PIO_PORTE, 6, 0);	/* power down */
++}
++
++static void pm9g45_lcd_hw_init(void)
++{
++	at91_pmc_t	*pmc	=3D (at91_pmc_t *) AT91_PMC_BASE;
++
++	at91_set_a_periph(AT91_PIO_PORTE, 0, 0);	/* LCDDPWR */
++	at91_set_a_periph(AT91_PIO_PORTE, 2, 0);	/* LCDCC */
++	at91_set_a_periph(AT91_PIO_PORTE, 3, 0);	/* LCDVSYNC */
++	at91_set_a_periph(AT91_PIO_PORTE, 4, 0);	/* LCDHSYNC */
++	at91_set_a_periph(AT91_PIO_PORTE, 5, 0);	/* LCDDOTCK */
++
++	at91_set_a_periph(AT91_PIO_PORTE, 7, 0);	/* LCDD0 */
++	at91_set_a_periph(AT91_PIO_PORTE, 8, 0);	/* LCDD1 */
++	at91_set_a_periph(AT91_PIO_PORTE, 9, 0);	/* LCDD2 */
++	at91_set_a_periph(AT91_PIO_PORTE, 10, 0);	/* LCDD3 */
++	at91_set_a_periph(AT91_PIO_PORTE, 11, 0);	/* LCDD4 */
++	at91_set_a_periph(AT91_PIO_PORTE, 12, 0);	/* LCDD5 */
++	at91_set_a_periph(AT91_PIO_PORTE, 13, 0);	/* LCDD6 */
++	at91_set_a_periph(AT91_PIO_PORTE, 14, 0);	/* LCDD7 */
++	at91_set_a_periph(AT91_PIO_PORTE, 15, 0);	/* LCDD8 */
++	at91_set_a_periph(AT91_PIO_PORTE, 16, 0);	/* LCDD9 */
++	at91_set_a_periph(AT91_PIO_PORTE, 17, 0);	/* LCDD10 */
++	at91_set_a_periph(AT91_PIO_PORTE, 18, 0);	/* LCDD11 */
++	at91_set_a_periph(AT91_PIO_PORTE, 19, 0);	/* LCDD12 */
++	at91_set_b_periph(AT91_PIO_PORTE, 20, 0);	/* LCDD13 */
++	at91_set_a_periph(AT91_PIO_PORTE, 21, 0);	/* LCDD14 */
++	at91_set_a_periph(AT91_PIO_PORTE, 22, 0);	/* LCDD15 */
++	at91_set_a_periph(AT91_PIO_PORTE, 23, 0);	/* LCDD16 */
++	at91_set_a_periph(AT91_PIO_PORTE, 24, 0);	/* LCDD17 */
++	at91_set_a_periph(AT91_PIO_PORTE, 25, 0);	/* LCDD18 */
++	at91_set_a_periph(AT91_PIO_PORTE, 26, 0);	/* LCDD19 */
++	at91_set_a_periph(AT91_PIO_PORTE, 27, 0);	/* LCDD20 */
++	at91_set_b_periph(AT91_PIO_PORTE, 28, 0);	/* LCDD21 */
++	at91_set_a_periph(AT91_PIO_PORTE, 29, 0);	/* LCDD22 */
++	at91_set_a_periph(AT91_PIO_PORTE, 30, 0);	/* LCDD23 */
++
++	writel(1 << AT91SAM9G45_ID_LCDC, &pmc->pcer);
++
++	gd->fb_base =3D CONFIG_AT91SAM9G45_LCD_BASE;
++}
++
++#ifdef CONFIG_LCD_INFO
++
++void lcd_show_board_info(void)
++{
++	ulong dram_size, nand_size;
++#ifdef CONFIG_HAS_DATAFLASH
++	ulong dataflash_size;
++#endif
++	int i;
++	char temp[32];
++
++	lcd_printf ("%s\n", U_BOOT_VERSION);
++	lcd_printf ("(C) 2010 Ronetix GmbH\n");
++	lcd_printf ("support@ronetix.at\n");
++	lcd_printf ("%s CPU at %s MHz\n",
++		CONFIG_SYS_AT91_CPU_NAME,
++		strmhz(temp, get_cpu_clk_rate()));
++
++	dram_size =3D 0;
++	for (i =3D 0; i < CONFIG_NR_DRAM_BANKS; i++)
++		dram_size +=3D gd->bd->bi_dram[i].size;
++
++	nand_size =3D 0;
++	for (i =3D 0; i < CONFIG_SYS_MAX_NAND_DEVICE; i++)
++		nand_size +=3D nand_info[i].size;
++
++#ifdef CONFIG_HAS_DATAFLASH
++	dataflash_size =3D 0;
++	for (i =3D 0; i < CONFIG_SYS_MAX_DATAFLASH_BANKS; i++) {
++		dataflash_size +=3D (unsigned int)
++				dataflash_info[i].Device.pages_number *
++				dataflash_info[i].Device.pages_size;
++	}
++#endif
++
++	lcd_printf ("%ld MB DDR2 SDRAM\n%ld MB NAND\n",
++		dram_size >> 20,
++		nand_size >> 20);
++
++#ifdef CONFIG_HAS_DATAFLASH
++	lcd_printf ("%ld MB DataFlash\n",
++		dataflash_size >> 20);
++#endif
++}
++#endif /* CONFIG_LCD_INFO */
++#endif
++
+ int board_init(void)
+ {
+ 	at91_pmc_t	*pmc	=3D (at91_pmc_t *) AT91_PMC_BASE;
+@@ -155,6 +281,10 @@ int board_init(void)
+ #ifdef CONFIG_MACB
+ 	pm9g45_macb_hw_init();
+ #endif
++
++#ifdef CONFIG_LCD
++	pm9g45_lcd_hw_init();
++#endif
+ 	return 0;
+ }
+=20
+diff --git a/include/configs/pm9g45.h b/include/configs/pm9g45.h
+index 690f119..c0ace29 100644
+--- a/include/configs/pm9g45.h
++++ b/include/configs/pm9g45.h
+@@ -134,6 +134,18 @@
+ #define CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS	2
+ #define CONFIG_USB_STORAGE		1
+=20
++/* LCD */
++#define CONFIG_LCD			1
++#define LCD_BPP				LCD_COLOR8
++#define CONFIG_LCD_LOGO			1
++#undef LCD_TEST_PATTERN
++#define CONFIG_LCD_INFO			1
++#define CONFIG_LCD_INFO_BELOW_LOGO	1
++#define CONFIG_SYS_WHITE_ON_BLACK	1
++#define CONFIG_ATMEL_LCD		1
++#define CONFIG_ATMEL_LCD_RGB565		1
++#define CONFIG_SYS_CONSOLE_IS_IN_ENV	1
++
+ /* board specific(not enough SRAM) */
+ #define CONFIG_AT91SAM9G45_LCD_BASE	PHYS_SDRAM + 0xE00000
+=20
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0002-DS2401-pro=
vides-48-bits-serial-number-using-Dallas-1.patch b/recipes/u-boot/u-boot-=
2010.09/ronetix-pm9g45/0002-DS2401-provides-48-bits-serial-number-using-D=
allas-1.patch
new file mode 100644
index 0000000..183c072
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0002-DS2401-provides-4=
8-bits-serial-number-using-Dallas-1.patch
@@ -0,0 +1,302 @@
+From 5c154ef7015dec5010118fcbb70c66a26a70150d Mon Sep 17 00:00:00 2001
+From: Asen Dimov <dimov@ronetix.at>
+Date: Thu, 26 Aug 2010 11:25:00 +0300
+Subject: [PATCH 02/14] DS2401 provides 48 bits serial number using Dalla=
s 1-Wire protocol.
+
+Signed-off-by: Asen Dimov <dimov@ronetix.at>
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ drivers/misc/Makefile |    1 +
+ drivers/misc/ds2401.c |  224 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
+ include/ds2401.h      |   36 ++++++++
+ 3 files changed, 261 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/misc/ds2401.c
+ create mode 100644 include/ds2401.h
+
+diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
+index 4f15db9..337b30a 100644
+--- a/drivers/misc/Makefile
++++ b/drivers/misc/Makefile
+@@ -33,6 +33,7 @@ COBJS-$(CONFIG_NS87308) +=3D ns87308.o
+ COBJS-$(CONFIG_STATUS_LED) +=3D status_led.o
+ COBJS-$(CONFIG_TWL4030_LED) +=3D twl4030_led.o
+ COBJS-$(CONFIG_FSL_PMIC) +=3D fsl_pmic.o
++COBJS-$(CONFIG_DS2401) +=3D ds2401.o
+=20
+ COBJS	:=3D $(COBJS-y)
+ SRCS	:=3D $(COBJS:.o=3D.c)
+diff --git a/drivers/misc/ds2401.c b/drivers/misc/ds2401.c
+new file mode 100644
+index 0000000..ca5aadd
+--- /dev/null
++++ b/drivers/misc/ds2401.c
+@@ -0,0 +1,224 @@
++/*
++ * Copyright 2005-2010
++ * Ilko Iliev <iliev@ronetix.at>
++ * Ronetix Development Tools GmbH <www.ronetix.at>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * Version 2 as published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++/*
++ * Driver for 1-wire, DS2401, a Silicon Serial Number chip
++ */
++
++#include <common.h>
++#include <command.h>
++#include <ds2401.h>
++
++static DS2401_FUNCS *DS2401_Funcs;
++
++/*
++ * Generate a 1-wire reset, return 1 if no presence detect was found,
++ * return 0 otherwise.
++ */
++static int ds2401_reset(void)
++{
++	int result;
++
++	DS2401_Funcs->set(0);
++	udelay(480);
++	DS2401_Funcs->set(1);
++	udelay(70);
++
++	result =3D DS2401_Funcs->get();
++
++	udelay(410);
++	return result;
++}
++
++/*
++ * Send 1 a 1-wire write bit.
++ * Provide 10us recovery time.
++ */
++static void ds2401_write_bit(int bit)
++{
++	if (bit) {
++		/*
++		 * write '1' bit
++		 */
++		 DS2401_Funcs->set(0);
++		udelay(6);
++		DS2401_Funcs->set(1);
++		udelay(64);
++	} else {
++		/*
++		 * write '0' bit
++		 */
++		DS2401_Funcs->set(0);
++		udelay(60);
++		DS2401_Funcs->set(1);
++		udelay(10);
++	}
++}
++
++/*
++ * Read a bit from the 1-wire bus and return it.
++ * Provide 10us recovery time.
++ */
++static int ds2401_read_bit(void)
++{
++	int result;
++
++	DS2401_Funcs->set(0);
++
++#ifdef __OPTIMIZE__
++	udelay(1);
++#endif
++
++	DS2401_Funcs->set(1);
++	udelay(9);
++
++	result =3D DS2401_Funcs->get();
++	udelay(55);
++
++	return result;
++}
++
++static void ds2401_write_byte(int data)
++{
++	int loop;
++
++	for (loop =3D 0; loop < 8; loop++) {
++		ds2401_write_bit(data & 0x01);
++		data >>=3D 1;
++	}
++}
++
++static int ds2401_read_byte(void)
++{
++	int loop, result =3D 0;
++
++	for (loop =3D 0; loop < 8; loop++) {
++		result >>=3D 1;
++		if (ds2401_read_bit())
++			result |=3D 0x80;
++	}
++
++	return result;
++}
++
++static unsigned char ds2401_crc8_table[] =3D {
++	0, 94, 188, 226, 97, 63, 221, 131, 194, 156, 126, 32, 163, 253, 31, 65=
,
++	157, 195, 33, 127, 252, 162, 64, 30, 95, 1, 227, 189, 62, 96, 130, 220=
,
++	35, 125, 159, 193, 66, 28, 254, 160, 225, 191, 93, 3, 128, 222, 60, 98=
,
++	190, 224, 2, 92, 223, 129, 99, 61, 124, 34, 192, 158, 29, 67, 161, 255=
,
++	70, 24, 250, 164, 39, 121, 155, 197, 132, 218, 56, 102, 229, 187, 89, =
7,
++	219, 133, 103, 57, 186, 228, 6, 88, 25, 71, 165, 251, 120, 38, 196, 15=
4,
++	101, 59, 217, 135, 4, 90, 184, 230, 167, 249, 27, 69, 198, 152, 122, 3=
6,
++	248, 166, 68, 26, 153, 199, 37, 123, 58, 100, 134, 216, 91, 5, 231, 18=
5,
++	140, 210, 48, 110, 237, 179, 81, 15, 78, 16, 242, 172, 47, 113, 147, 2=
05,
++	17, 79, 173, 243, 112, 46, 204, 146, 211, 141, 111, 49, 178, 236, 14, =
80,
++	175, 241, 19, 77, 206, 144, 114, 44, 109, 51, 209, 143, 12, 82, 176, 2=
38,
++	50, 108, 142, 208, 83, 13, 239, 177, 240, 174, 76, 18, 145, 207, 45, 1=
15,
++	202, 148, 118, 40, 171, 245, 23, 73, 8, 86, 180, 234, 105, 55, 213, 13=
9,
++	87, 9, 235, 181, 54, 104, 138, 212, 149, 203, 41, 119, 244, 170, 72, 2=
2,
++	233, 183, 85, 11, 136, 214, 52, 106, 43, 117, 151, 201, 74, 20, 246, 1=
68,
++	116, 42, 200, 150, 21, 75, 169, 247, 182, 232, 10, 84, 215, 137, 107, =
53
++};
++
++static unsigned char ds2401_calc_crc8(unsigned char * data, int len)
++{
++	unsigned char crc =3D 0;
++
++	while (len--)
++		crc =3D ds2401_crc8_table[crc ^ *data++];
++
++	return crc;
++}
++
++void ds2401_init(DS2401_FUNCS *funcs)
++{
++	DS2401_Funcs =3D funcs;
++}
++
++/*
++ * Read the serial number from the 1-wire bus and return it.
++ * Returns 0 if successful.
++ * Returns non-zero if not successful.
++ */
++int ds2401_get_number( unsigned char id[6] )
++{
++	int ii, result;
++	unsigned char crc;
++	unsigned char buf[8];
++
++	result =3D ds2401_reset();
++	if (result !=3D 0)
++		return 1;
++
++	ds2401_write_byte(DS2401_CMD_READ_ROM);	/* send read rom command */
++
++	/*
++	 * read 8 bytes:
++	 * buf[0]	- family code (0x01)
++	 * buf[1..6]	- serial number
++	 * buf[7]	- CRC
++	 */
++	for (ii =3D 0; ii < 8; ii++)
++		buf[ii] =3D ds2401_read_byte();
++
++	/*
++	 * calculate the 8-bit Dallas CRC
++	 */
++	crc =3D ds2401_calc_crc8( buf, 7 );
++
++	if ( crc !=3D buf[7] )
++		return 1;
++
++	for (ii =3D 0; ii < 6; ii++)
++		id[ii] =3D buf[ii + 1];
++
++	return 0;
++}
++
++int do_ds2401(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
++{
++	int stat;
++	unsigned char ds2401_id[6];
++	char str[32];
++
++	stat =3D ds2401_get_number( ds2401_id );
++	if (stat){
++		puts("No 1-wire device detected!\n");
++		return 0;
++	}
++
++	sprintf(str, "%s:%X:%X:%X",
++		CONFIG_MAC_OUI,
++		(int)ds2401_id[2],
++		(int)ds2401_id[1],
++		(int)ds2401_id[0]);
++
++	printf("Setting environment variable 'ethaddr' to %s\n", str);
++	setenv("ethaddr", str);
++
++	return 0;
++}
++
++U_BOOT_CMD(
++	onewire, 1, 1, do_ds2401,
++	"Read 1-write ID and set 'ethaddr'",
++	NULL
++);
++
+diff --git a/include/ds2401.h b/include/ds2401.h
+new file mode 100644
+index 0000000..981ce04
+--- /dev/null
++++ b/include/ds2401.h
+@@ -0,0 +1,36 @@
++/*
++ * Copyright 2005-2010
++ * Ilko Iliev <iliev@ronetix.at>
++ * Ronetix Development Tools GmbH <www.ronetix.at>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * Version 2 as published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#ifndef __DS2401_H_
++#define __DS2401_H_
++
++#define DS2401_CMD_READ_ROM 0x33
++
++typedef struct
++{
++	void (*set)(int value );
++	int (*get)(void);
++} DS2401_FUNCS;
++
++extern void ds2401_init(DS2401_FUNCS *funcs);
++extern int ds2401_get_number( unsigned char id[6] );
++
++#endif /* __DS2401_H_ */
++
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0003-PM9G45-use=
s-DS2401-to-set-the-MAC-address-of-the-Eth.patch b/recipes/u-boot/u-boot-=
2010.09/ronetix-pm9g45/0003-PM9G45-uses-DS2401-to-set-the-MAC-address-of-=
the-Eth.patch
new file mode 100644
index 0000000..c3117db
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0003-PM9G45-uses-DS240=
1-to-set-the-MAC-address-of-the-Eth.patch
@@ -0,0 +1,109 @@
+From f6766c26ba0c546e9416d5d0173027cf30af6ed3 Mon Sep 17 00:00:00 2001
+From: Asen Dimov <dimov@ronetix.at>
+Date: Thu, 26 Aug 2010 11:33:32 +0300
+Subject: [PATCH 03/14] PM9G45 uses DS2401 to set the MAC address of the =
Ethernet controller.
+
+Signed-off-by: Asen Dimov <dimov@ronetix.at>
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ board/ronetix/pm9g45/pm9g45.c |   37 ++++++++++++++++++++++++++++++++++=
+++
+ include/configs/pm9g45.h      |    7 +++++++
+ 2 files changed, 44 insertions(+), 0 deletions(-)
+
+diff --git a/board/ronetix/pm9g45/pm9g45.c b/board/ronetix/pm9g45/pm9g45=
.c
+index c6635b4..5158161 100644
+--- a/board/ronetix/pm9g45/pm9g45.c
++++ b/board/ronetix/pm9g45/pm9g45.c
+@@ -51,6 +51,7 @@
+ #include <net.h>
+ #endif
+ #include <netdev.h>
++#include <ds2401.h>
+=20
+ DECLARE_GLOBAL_DATA_PTR;
+=20
+@@ -58,6 +59,30 @@ DECLARE_GLOBAL_DATA_PTR;
+  * Miscelaneous platform dependent initialisations
+  */
+=20
++#ifdef CONFIG_DS2401
++
++static void ds2401_hw_init(void)
++{
++	at91_set_pio_output(CONFIG_DS2401_PIN, 1); /* output */
++	at91_set_pio_multi_drive(CONFIG_DS2401_PIN, 1); /* open drain */
++}
++
++static void ds2401_set(int value)
++{
++	at91_set_pio_value(CONFIG_DS2401_PIN, value);
++}
++
++static int ds2401_get(void)
++{
++	return at91_get_pio_value(CONFIG_DS2401_PIN);
++}
++
++DS2401_FUNCS DS2401_funcs =3D {
++	.set =3D ds2401_set,
++	.get =3D ds2401_get
++};
++#endif
++
+ #ifdef CONFIG_CMD_NAND
+ static void pm9g45_nand_hw_init(void)
+ {
+@@ -278,6 +303,11 @@ int board_init(void)
+ 	pm9g45_nand_hw_init();
+ #endif
+=20
++#ifdef CONFIG_DS2401
++	ds2401_hw_init();
++	ds2401_init(&DS2401_funcs);
++#endif
++
+ #ifdef CONFIG_MACB
+ 	pm9g45_macb_hw_init();
+ #endif
+@@ -312,6 +342,13 @@ int board_eth_init(bd_t *bis)
+ {
+ 	int rc =3D 0;
+ #ifdef CONFIG_MACB
++	/*
++	 * Setup the MAC address. If you want to setup the MAC address
++	 * using the 'onewire' console command comment out the following
++	 * line
++	 */
++	do_ds2401(NULL, 0, 0, NULL);
++
+ 	rc =3D macb_eth_initialize(0, (void *)AT91_EMAC_BASE, 0x01);
+ #endif
+ 	return rc;
+diff --git a/include/configs/pm9g45.h b/include/configs/pm9g45.h
+index c0ace29..cee1f71 100644
+--- a/include/configs/pm9g45.h
++++ b/include/configs/pm9g45.h
+@@ -56,6 +56,12 @@
+ #define CONFIG_ATMEL_USART	1
+ #define CONFIG_USART3		1	/* USART 3 is DBGU */
+=20
++/*
++ * 1-wire
++ */
++#define CONFIG_DS2401
++#define CONFIG_DS2401_PIN	AT91_PIO_PORTA, 31
++
+ #define CONFIG_SYS_USE_NANDFLASH	1
+=20
+ /* LED */
+@@ -96,6 +102,7 @@
+ #define CONFIG_NR_DRAM_BANKS		1
+ #define PHYS_SDRAM			0x70000000
+ #define PHYS_SDRAM_SIZE			0x08000000	/* 128 megs */
++#define CONFIG_MAC_OUI	"02:00:00" /* Organizationally Unique Identifier=
*/
+=20
+ /* NOR flash, not available */
+ #define CONFIG_SYS_NO_FLASH		1
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0004-PM9263-use=
s-DS2401-to-set-the-MAC-address-of-the-Eth.patch b/recipes/u-boot/u-boot-=
2010.09/ronetix-pm9g45/0004-PM9263-uses-DS2401-to-set-the-MAC-address-of-=
the-Eth.patch
new file mode 100644
index 0000000..0d75a74
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0004-PM9263-uses-DS240=
1-to-set-the-MAC-address-of-the-Eth.patch
@@ -0,0 +1,108 @@
+From a3cd4aa9bf072cd0f31066ff4559f85d6d6abf29 Mon Sep 17 00:00:00 2001
+From: Asen Dimov <dimov@ronetix.at>
+Date: Fri, 3 Sep 2010 19:38:13 +0300
+Subject: [PATCH 04/14] PM9263 uses DS2401 to set the MAC address of the =
Ethernet controller
+
+Signed-off-by: Asen Dimov <dimov@ronetix.at>
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ board/ronetix/pm9263/pm9263.c |   36 ++++++++++++++++++++++++++++++++++=
++
+ include/configs/pm9263.h      |    7 +++++++
+ 2 files changed, 43 insertions(+), 0 deletions(-)
+
+diff --git a/board/ronetix/pm9263/pm9263.c b/board/ronetix/pm9263/pm9263=
.c
+index e41c84c..5fca558 100644
+--- a/board/ronetix/pm9263/pm9263.c
++++ b/board/ronetix/pm9263/pm9263.c
+@@ -43,6 +43,7 @@
+ #include <net.h>
+ #endif
+ #include <netdev.h>
++#include <ds2401.h>
+=20
+ DECLARE_GLOBAL_DATA_PTR;
+=20
+@@ -51,6 +52,30 @@ DECLARE_GLOBAL_DATA_PTR;
+  * Miscelaneous platform dependent initialisations
+  */
+=20
++#ifdef CONFIG_DS2401
++
++static void ds2401_hw_init(void)
++{
++	at91_set_pio_output(CONFIG_DS2401_PIN, 1); /* output */
++	at91_set_pio_multi_drive(CONFIG_DS2401_PIN, 1); /* open drain */
++}
++
++static void ds2401_set(int value)
++{
++	at91_set_pio_value(CONFIG_DS2401_PIN, value);
++}
++
++static int ds2401_get(void)
++{
++	return at91_get_pio_value(CONFIG_DS2401_PIN);
++}
++
++DS2401_FUNCS DS2401_funcs =3D {
++	.set =3D ds2401_set,
++	.get =3D ds2401_get
++};
++#endif
++
+ #ifdef CONFIG_CMD_NAND
+ static void pm9263_nand_hw_init(void)
+ {
+@@ -362,6 +387,10 @@ int board_init(void)
+ #ifdef CONFIG_CMD_NAND
+ 	pm9263_nand_hw_init();
+ #endif
++#ifdef CONFIG_DS2401
++	ds2401_hw_init();
++	ds2401_init(&DS2401_funcs);
++#endif
+ #ifdef CONFIG_HAS_DATAFLASH
+ 	at91_spi0_hw_init(1 << 0);
+ #endif
+@@ -394,6 +423,13 @@ int board_eth_init(bd_t *bis)
+ {
+ 	int rc =3D 0;
+ #ifdef CONFIG_MACB
++	/*
++	 * Setup the MAC address. If you want to setup the MAC address
++	 * using the 'onewire' console command comment out the following
++	 * line
++	 */
++	do_ds2401(NULL, 0, 0, NULL);
++
+ 	rc =3D macb_eth_initialize(0, (void *)AT91_EMAC_BASE, 0x01);
+ #endif
+ 	return rc;
+diff --git a/include/configs/pm9263.h b/include/configs/pm9263.h
+index 9735e6a..20fe9d7 100644
+--- a/include/configs/pm9263.h
++++ b/include/configs/pm9263.h
+@@ -174,6 +174,12 @@
+ #undef CONFIG_USART2
+ #define CONFIG_USART3		1	/* USART 3 is DBGU */
+=20
++/*
++ * 1-wire
++ */
++#define CONFIG_DS2401
++#define CONFIG_DS2401_PIN	AT91_PIO_PORTB, 31
++
+ /* LCD */
+ #define CONFIG_LCD			1
+ #define LCD_BPP				LCD_COLOR8
+@@ -279,6 +285,7 @@
+ #define CONFIG_NET_MULTI		1
+ #define CONFIG_NET_RETRY_COUNT		20
+ #define CONFIG_RESET_PHY_R		1
++#define CONFIG_MAC_OUI	"02:00:00" /* Organizationally Unique Identifier=
*/
+=20
+ /* USB */
+ #define CONFIG_USB_ATMEL
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0005-PM9261-use=
s-DS2401-to-set-the-MAC-address-of-the-Eth.patch b/recipes/u-boot/u-boot-=
2010.09/ronetix-pm9g45/0005-PM9261-uses-DS2401-to-set-the-MAC-address-of-=
the-Eth.patch
new file mode 100644
index 0000000..1f8164b
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0005-PM9261-uses-DS240=
1-to-set-the-MAC-address-of-the-Eth.patch
@@ -0,0 +1,108 @@
+From 8aa8ce917b7c095479012358641014bf80151c9c Mon Sep 17 00:00:00 2001
+From: Asen Dimov <dimov@ronetix.at>
+Date: Fri, 3 Sep 2010 19:55:00 +0300
+Subject: [PATCH 05/14] PM9261 uses DS2401 to set the MAC address of the =
Ethernet controller
+
+Signed-off-by: Asen Dimov <dimov@ronetix.at>
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ board/ronetix/pm9261/pm9261.c |   36 ++++++++++++++++++++++++++++++++++=
++
+ include/configs/pm9261.h      |    7 +++++++
+ 2 files changed, 43 insertions(+), 0 deletions(-)
+
+diff --git a/board/ronetix/pm9261/pm9261.c b/board/ronetix/pm9261/pm9261=
.c
+index 53d8c48..7328134 100644
+--- a/board/ronetix/pm9261/pm9261.c
++++ b/board/ronetix/pm9261/pm9261.c
+@@ -44,6 +44,7 @@
+ #include <net.h>
+ #endif
+ #include <netdev.h>
++#include <ds2401.h>
+=20
+ DECLARE_GLOBAL_DATA_PTR;
+=20
+@@ -52,6 +53,30 @@ DECLARE_GLOBAL_DATA_PTR;
+  * Miscelaneous platform dependent initialisations
+  */
+=20
++#ifdef CONFIG_DS2401
++
++static void ds2401_hw_init(void)
++{
++	at91_set_pio_output(CONFIG_DS2401_PIN, 1); /* output */
++	at91_set_pio_multi_drive(CONFIG_DS2401_PIN, 1); /* open drain */
++}
++
++static void ds2401_set(int value)
++{
++	at91_set_pio_value(CONFIG_DS2401_PIN, value);
++}
++
++static int ds2401_get(void)
++{
++	return at91_get_pio_value(CONFIG_DS2401_PIN);
++}
++
++DS2401_FUNCS DS2401_funcs =3D {
++	.set =3D ds2401_set,
++	.get =3D ds2401_get
++};
++#endif
++
+ #ifdef CONFIG_CMD_NAND
+ static void pm9261_nand_hw_init(void)
+ {
+@@ -260,6 +285,10 @@ int board_init(void)
+ #ifdef CONFIG_CMD_NAND
+ 	pm9261_nand_hw_init();
+ #endif
++#ifdef CONFIG_DS2401
++	ds2401_hw_init();
++	ds2401_init(&DS2401_funcs);
++#endif
+ #ifdef CONFIG_HAS_DATAFLASH
+ 	at91_spi0_hw_init(1 << 0);
+ #endif
+@@ -291,6 +320,13 @@ void reset_phy(void)
+ {
+ #ifdef CONFIG_DRIVER_DM9000
+ 	/*
++	 * Setup the MAC address. If you want to setup the MAC address
++	 * using the 'onewire' console command comment out the following
++	 * line
++	 */
++	do_ds2401(NULL, 0, 0, NULL);
++
++	/*
+ 	 * Initialize ethernet HW addr prior to starting Linux,
+ 	 * needed for nfsroot
+ 	 */
+diff --git a/include/configs/pm9261.h b/include/configs/pm9261.h
+index a0b00e9..b1afbb8 100644
+--- a/include/configs/pm9261.h
++++ b/include/configs/pm9261.h
+@@ -164,6 +164,12 @@
+ #undef CONFIG_USART2
+ #define CONFIG_USART3		1	/* USART 3 is DBGU */
+=20
++/*
++ * 1-wire
++ */
++#define CONFIG_DS2401
++#define CONFIG_DS2401_PIN	AT91_PIO_PORTA, 7
++
+ /* LCD */
+ #define CONFIG_LCD			1
+ #define LCD_BPP				LCD_COLOR8
+@@ -253,6 +259,7 @@
+ #define CONFIG_NET_RETRY_COUNT			20
+ #define CONFIG_RESET_PHY_R			1
+ #define CONFIG_NET_MULTI
++#define CONFIG_MAC_OUI	"02:00:00" /* Organizationally Unique Identifier=
*/
+=20
+ /* USB */
+ #define CONFIG_USB_ATMEL
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0006-PM9263-wit=
h-128MiB-of-SRAM.patch b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/000=
6-PM9263-with-128MiB-of-SRAM.patch
new file mode 100644
index 0000000..916585a
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0006-PM9263-with-128Mi=
B-of-SRAM.patch
@@ -0,0 +1,35 @@
+From 7d9f03fdb2fe8930ada680f035465631fdcb8fe1 Mon Sep 17 00:00:00 2001
+From: Asen Dimov <dimov@ronetix.at>
+Date: Wed, 2 Feb 2011 11:31:04 +0200
+Subject: [PATCH 06/14] PM9263 with 128MiB of SRAM
+
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ include/configs/pm9263.h |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/configs/pm9263.h b/include/configs/pm9263.h
+index 20fe9d7..78e7264 100644
+--- a/include/configs/pm9263.h
++++ b/include/configs/pm9263.h
+@@ -95,7 +95,7 @@
+ #define CONFIG_SYS_SDRC_TR_VAL1		0x3AA
+ /* SDRAMC_CR - Configuration register*/
+ #define CONFIG_SYS_SDRC_CR_VAL							\
+-		(AT91_SDRAMC_NC_9 |						\
++		(AT91_SDRAMC_NC_10 |						\
+ 		 AT91_SDRAMC_NR_13 |						\
+ 		 AT91_SDRAMC_NB_4 |						\
+ 		 AT91_SDRAMC_CAS_2 |						\
+@@ -227,7 +227,7 @@
+ /* SDRAM */
+ #define CONFIG_NR_DRAM_BANKS	1
+ #define PHYS_SDRAM		0x20000000
+-#define PHYS_SDRAM_SIZE		0x04000000	/* 64 megs */
++#define PHYS_SDRAM_SIZE		0x08000000	/* 128 megs */
+=20
+ /* DataFlash */
+ #define CONFIG_ATMEL_DATAFLASH_SPI
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0007-pm9g45-mak=
e-ethernet-working-in-v1.3.patch b/recipes/u-boot/u-boot-2010.09/ronetix-=
pm9g45/0007-pm9g45-make-ethernet-working-in-v1.3.patch
new file mode 100644
index 0000000..faa9ff5
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0007-pm9g45-make-ether=
net-working-in-v1.3.patch
@@ -0,0 +1,70 @@
+From 4cacdd15e01af32b44fe3c870a68398795d4fa3e Mon Sep 17 00:00:00 2001
+From: Asen Dimov <dimov@ronetix.at>
+Date: Wed, 2 Feb 2011 18:03:56 +0200
+Subject: [PATCH 07/14] pm9g45: make ethernet working in v1.3
+
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ board/ronetix/pm9g45/pm9g45.c |   15 +++++++++++++++
+ include/configs/pm9g45.h      |    5 +++++
+ 2 files changed, 20 insertions(+), 0 deletions(-)
+
+diff --git a/board/ronetix/pm9g45/pm9g45.c b/board/ronetix/pm9g45/pm9g45=
.c
+index 5158161..8f857af 100644
+--- a/board/ronetix/pm9g45/pm9g45.c
++++ b/board/ronetix/pm9g45/pm9g45.c
+@@ -130,6 +130,8 @@ static void pm9g45_macb_hw_init(void)
+ {
+ 	at91_pmc_t	*pmc	=3D (at91_pmc_t *) AT91_PMC_BASE;
+ 	at91_pio_t	*pio	=3D (at91_pio_t *) AT91_PIO_BASE;
++	at91_rstc_t	*rstc	=3D (at91_rstc_t *) AT91_RSTC_BASE;
++	unsigned long	erstl;
+=20
+ 	/*
+ 	 * PD2 enables the 50MHz oscillator for Ethernet PHY
+@@ -154,6 +156,19 @@ static void pm9g45_macb_hw_init(void)
+ 	at91_set_pio_pullup(AT91_PIO_PORTA, 12, 0);
+ 	at91_set_pio_pullup(AT91_PIO_PORTA, 13, 0);
+=20
++	erstl =3D readl(&rstc->mr) & AT91_RSTC_MR_ERSTL_MASK;
++
++	/* Need to reset PHY -> 500ms reset */
++	writel(AT91_RSTC_KEY | AT91_RSTC_MR_ERSTL(0x0D) |
++		AT91_RSTC_MR_URSTEN, &rstc->mr);
++
++	writel(AT91_RSTC_KEY | AT91_RSTC_CR_EXTRST, &rstc->cr);
++	/* Wait for end hardware reset */
++	while (!(readl(&rstc->sr) & AT91_RSTC_SR_NRSTL))
++		;
++
++	/* Restore NRST value */
++	writel(AT91_RSTC_KEY | erstl | AT91_RSTC_MR_URSTEN, &rstc->mr);
+ 	/* Re-enable pull-up */
+ 	at91_set_pio_pullup(AT91_PIO_PORTA, 15, 1);
+ 	at91_set_pio_pullup(AT91_PIO_PORTA, 12, 1);
+diff --git a/include/configs/pm9g45.h b/include/configs/pm9g45.h
+index cee1f71..e55accb 100644
+--- a/include/configs/pm9g45.h
++++ b/include/configs/pm9g45.h
+@@ -130,6 +130,8 @@
+ #define CONFIG_NET_MULTI		1
+ #define CONFIG_NET_RETRY_COUNT		20
+ #define CONFIG_RESET_PHY_R		1
++#define CONFIG_MACB_SEARCH_PHY
++#define CONFIG_CMD_MII
+=20
+ /* USB */
+ #define CONFIG_USB_ATMEL
+@@ -162,6 +164,9 @@
+ #define CONFIG_SYS_MEMTEST_END		CONFIG_AT91SAM9G45_LCD_BASE
+=20
+ /* bootstrap + u-boot + env + linux in nandflash */
++#define CONFIG_OVERWRITE_ETHADDR_ONCE
++	/* Organizationally Unique Identifier + 3 octets "random" numbers */
++#define CONFIG_ETHADDR		"02:00:00:de:ad:01"
+ #define CONFIG_ENV_IS_IN_NAND		1
+ #define CONFIG_ENV_OFFSET		0x60000
+ #define CONFIG_ENV_OFFSET_REDUND	0x80000
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0008-pm9g45-add=
-enable-disable-option-to-reset-the-PHY.patch b/recipes/u-boot/u-boot-201=
0.09/ronetix-pm9g45/0008-pm9g45-add-enable-disable-option-to-reset-the-PH=
Y.patch
new file mode 100644
index 0000000..1fe5007
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0008-pm9g45-add-enable=
-disable-option-to-reset-the-PHY.patch
@@ -0,0 +1,57 @@
+From 6043beb9a3737517ad9bbdcd47cc2aa0dc1a562b Mon Sep 17 00:00:00 2001
+From: Asen Chavdarov Dimov <dimov@ronetix.at>
+Date: Mon, 23 May 2011 15:10:35 +0300
+Subject: [PATCH 08/14] pm9g45: add enable/disable option to reset the PH=
Y
+
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ board/ronetix/pm9g45/pm9g45.c |    8 +++++++-
+ include/configs/pm9g45.h      |    1 -
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/board/ronetix/pm9g45/pm9g45.c b/board/ronetix/pm9g45/pm9g45=
.c
+index 8f857af..4ca2bfc 100644
+--- a/board/ronetix/pm9g45/pm9g45.c
++++ b/board/ronetix/pm9g45/pm9g45.c
+@@ -1,5 +1,5 @@
+ /*
+- * (C) Copyright 2010
++ * (C) Copyright 2010,2011
+  * Ilko Iliev <iliev@ronetix.at>
+  * Asen Dimov <dimov@ronetix.at>
+  * Ronetix GmbH <www.ronetix.at>
+@@ -144,6 +144,11 @@ static void pm9g45_macb_hw_init(void)
+ 	/* Enable clock */
+ 	writel(1 << AT91SAM9G45_ID_EMAC, &pmc->pcer);
+=20
++/* On BaseBoard BB9G45 no additional reset is needed,
++ * but on PM9263 it is needed. if CONFIG_RESET_PHY_R
++ * is defined an reset will accrue.
++ */
++#ifdef CONFIG_RESET_PHY_R
+ 	/*
+ 	 * Disable pull-up on:
+ 	 *	RXDV (PA15) =3D> PHY normal mode (not Test mode)
+@@ -174,6 +179,7 @@ static void pm9g45_macb_hw_init(void)
+ 	at91_set_pio_pullup(AT91_PIO_PORTA, 12, 1);
+ 	at91_set_pio_pullup(AT91_PIO_PORTA, 13, 1);
+=20
++#endif
+ 	at91_macb_hw_init();
+ }
+ #endif
+diff --git a/include/configs/pm9g45.h b/include/configs/pm9g45.h
+index e55accb..cc9edcb 100644
+--- a/include/configs/pm9g45.h
++++ b/include/configs/pm9g45.h
+@@ -129,7 +129,6 @@
+ #define CONFIG_RMII			1
+ #define CONFIG_NET_MULTI		1
+ #define CONFIG_NET_RETRY_COUNT		20
+-#define CONFIG_RESET_PHY_R		1
+ #define CONFIG_MACB_SEARCH_PHY
+ #define CONFIG_CMD_MII
+=20
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0009-pm9g45-ena=
ble-user-reset-when-on-bb9g45.patch b/recipes/u-boot/u-boot-2010.09/ronet=
ix-pm9g45/0009-pm9g45-enable-user-reset-when-on-bb9g45.patch
new file mode 100644
index 0000000..8fad8fe
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0009-pm9g45-enable-use=
r-reset-when-on-bb9g45.patch
@@ -0,0 +1,42 @@
+From 0d21d702a882dd4ad88f40c65ea23b66069e4f38 Mon Sep 17 00:00:00 2001
+From: Asen Chavdarov Dimov <dimov@ronetix.at>
+Date: Mon, 23 May 2011 15:14:16 +0300
+Subject: [PATCH 09/14] pm9g45: enable user reset when on bb9g45
+
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ board/ronetix/pm9g45/pm9g45.c |   10 +++++++---
+ 1 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/board/ronetix/pm9g45/pm9g45.c b/board/ronetix/pm9g45/pm9g45=
.c
+index 4ca2bfc..5d521cb 100644
+--- a/board/ronetix/pm9g45/pm9g45.c
++++ b/board/ronetix/pm9g45/pm9g45.c
+@@ -169,17 +169,21 @@ static void pm9g45_macb_hw_init(void)
+=20
+ 	writel(AT91_RSTC_KEY | AT91_RSTC_CR_EXTRST, &rstc->cr);
+ 	/* Wait for end hardware reset */
+-	while (!(readl(&rstc->sr) & AT91_RSTC_SR_NRSTL))
+-		;
++	while (!(readl(&rstc->sr) & AT91_RSTC_SR_NRSTL));
+=20
+-	/* Restore NRST value */
++	/* Restore NRST value and enable user reset */
+ 	writel(AT91_RSTC_KEY | erstl | AT91_RSTC_MR_URSTEN, &rstc->mr);
+ 	/* Re-enable pull-up */
+ 	at91_set_pio_pullup(AT91_PIO_PORTA, 15, 1);
+ 	at91_set_pio_pullup(AT91_PIO_PORTA, 12, 1);
+ 	at91_set_pio_pullup(AT91_PIO_PORTA, 13, 1);
+=20
++#else
++	/* Enable user reset */
++	erstl =3D readl(&rstc->mr);
++	writel(AT91_RSTC_KEY | erstl | AT91_RSTC_MR_URSTEN, &rstc->mr);
+ #endif
++
+ 	at91_macb_hw_init();
+ }
+ #endif
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0010-add-a-disp=
lay-GATW70SN8H1E0-for-bb9g45.patch b/recipes/u-boot/u-boot-2010.09/roneti=
x-pm9g45/0010-add-a-display-GATW70SN8H1E0-for-bb9g45.patch
new file mode 100644
index 0000000..62fa1f2
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0010-add-a-display-GAT=
W70SN8H1E0-for-bb9g45.patch
@@ -0,0 +1,52 @@
+From 25834ed13dea8df4d950b55bc443017266602f21 Mon Sep 17 00:00:00 2001
+From: Asen Chavdarov Dimov <dimov@ronetix.at>
+Date: Tue, 17 May 2011 12:17:38 +0300
+Subject: [PATCH 10/14] add a display GATW70SN8H1E0 for bb9g45
+
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ board/ronetix/pm9g45/pm9g45.c |   21 +++++++++++++++++++++
+ 1 files changed, 21 insertions(+), 0 deletions(-)
+
+diff --git a/board/ronetix/pm9g45/pm9g45.c b/board/ronetix/pm9g45/pm9g45=
.c
+index 5d521cb..c820a91 100644
+--- a/board/ronetix/pm9g45/pm9g45.c
++++ b/board/ronetix/pm9g45/pm9g45.c
+@@ -189,6 +189,7 @@ static void pm9g45_macb_hw_init(void)
+ #endif
+=20
+ #ifdef CONFIG_LCD
++#if 0
+ /*
+  * LCD name TX09D50VM1CCA
+  */
+@@ -208,6 +209,26 @@ vidinfo_t panel_info =3D {
+ 	vl_lower_margin:0,
+ 	mmio:		AT91SAM9G45_LCDC_BASE,
+ };
++#endif
++/*
++ * LCD name GATW70SN8H1E0
++ */
++vidinfo_t panel_info =3D {
++	vl_col:		800,
++	vl_row:		480,
++	vl_clk:		25000000,
++	vl_sync:	ATMEL_LCDC_INVLINE_NORMAL |
++			ATMEL_LCDC_INVFRAME_NORMAL,
++	vl_bpix:	3,
++	vl_tft:		1,
++	vl_hsync_len:	48,
++	vl_left_margin:	1,
++	vl_right_margin:33,
++	vl_vsync_len:	3,
++	vl_upper_margin:29,
++	vl_lower_margin:13,
++	mmio:		AT91SAM9G45_LCDC_BASE,
++};
+=20
+ void lcd_enable(void)
+ {
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0011-pm9g45-cho=
ose-between-bb9g45-and-bb9263.patch b/recipes/u-boot/u-boot-2010.09/ronet=
ix-pm9g45/0011-pm9g45-choose-between-bb9g45-and-bb9263.patch
new file mode 100644
index 0000000..b27eaec
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0011-pm9g45-choose-bet=
ween-bb9g45-and-bb9263.patch
@@ -0,0 +1,105 @@
+From f405bb803a95d680a2a29374e6940a88db346ca9 Mon Sep 17 00:00:00 2001
+From: Asen Chavdarov Dimov <dimov@ronetix.at>
+Date: Wed, 25 May 2011 12:18:17 +0300
+Subject: [PATCH 11/14] pm9g45: choose between bb9g45 and bb9263
+
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ Makefile                      |    9 +++++++++
+ board/ronetix/pm9g45/pm9g45.c |    5 +++--
+ include/configs/pm9g45.h      |   16 ++++++++++++----
+ 3 files changed, 24 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fa1bddf..248b47a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2016,8 +2016,17 @@ at91sam9g45ekes_config	:	unconfig
+ 	fi;
+ 	@$(MKCONFIG) -n $@ -a at91sam9m10g45ek arm arm926ejs at91sam9m10g45ek =
atmel at91
+=20
++pm9g45_bb9263_config \
++pm9g45_bb9g45_config \
+ pm9g45_config	:	unconfig
+ 	@mkdir -p $(obj)include
++	@if [ "$(findstring bb9263,$@)" ] ; then \
++		echo "#define CONFIG_BB9263"	>>$(obj)include/config.h ; \
++		echo "Defining CONFIG_BB9263"; \
++	else \
++		echo "#define CONFIG_BB9G45"	>>$(obj)include/config.h ; \
++		echo "Defining CONFIG_BB9G45"; \
++	fi;
+ 	@$(MKCONFIG) -a pm9g45 arm arm926ejs pm9g45 ronetix at91
+=20
+ SBC35_A9G20_NANDFLASH_config \
+diff --git a/board/ronetix/pm9g45/pm9g45.c b/board/ronetix/pm9g45/pm9g45=
.c
+index c820a91..3bfbd43 100644
+--- a/board/ronetix/pm9g45/pm9g45.c
++++ b/board/ronetix/pm9g45/pm9g45.c
+@@ -189,7 +189,7 @@ static void pm9g45_macb_hw_init(void)
+ #endif
+=20
+ #ifdef CONFIG_LCD
+-#if 0
++#if defined(CONFIG_BB9263)
+ /*
+  * LCD name TX09D50VM1CCA
+  */
+@@ -209,7 +209,7 @@ vidinfo_t panel_info =3D {
+ 	vl_lower_margin:0,
+ 	mmio:		AT91SAM9G45_LCDC_BASE,
+ };
+-#endif
++#elif defined(CONFIG_BB9G45)
+ /*
+  * LCD name GATW70SN8H1E0
+  */
+@@ -229,6 +229,7 @@ vidinfo_t panel_info =3D {
+ 	vl_lower_margin:13,
+ 	mmio:		AT91SAM9G45_LCDC_BASE,
+ };
++#endif
+=20
+ void lcd_enable(void)
+ {
+diff --git a/include/configs/pm9g45.h b/include/configs/pm9g45.h
+index cc9edcb..4ae1041 100644
+--- a/include/configs/pm9g45.h
++++ b/include/configs/pm9g45.h
+@@ -129,6 +129,9 @@
+ #define CONFIG_RMII			1
+ #define CONFIG_NET_MULTI		1
+ #define CONFIG_NET_RETRY_COUNT		20
++#if defined(CONFIG_BB9263)
++#define CONFIG_RESET_PHY_R
++#endif
+ #define CONFIG_MACB_SEARCH_PHY
+ #define CONFIG_CMD_MII
+=20
+@@ -171,14 +174,19 @@
+ #define CONFIG_ENV_OFFSET_REDUND	0x80000
+ #define CONFIG_ENV_SIZE			0x20000		/* 1 sector =3D 128 kB */
+ #define CONFIG_BOOTCOMMAND	"nand read 0x72000000 0x200000 0x200000; boo=
tm"
+-#define CONFIG_BOOTARGS		"fbcon=3Drotate:3 console=3Dtty0 " \
+-				"console=3DttyS0,115200 " \
+-				"root=3D/dev/mtdblock4 " \
++#if defined(CONFIG_BB9G45)
++#define BOOTARGS_CONSOLE	"fbcon=3Drotate:0 console=3Dtty0 " \
++				"console=3DttyS0,115200 "
++#elif defined(CONFIG_BB9263)
++#define BOOTARGS_CONSOLE	"fbcon=3Drotate:3 console=3Dtty0 " \
++				"console=3DttyS0,115200 "
++#endif
++#define BOOTARGS_NAND		"root=3D/dev/mtdblock4 " \
+ 				"mtdparts=3Datmel_nand:128k(bootstrap)ro," \
+ 				"256k(uboot)ro,1664k(env)," \
+ 				"2M(linux)ro,-(root) rw " \
+ 				"rootfstype=3Djffs2"
+-
++#define CONFIG_BOOTARGS		BOOTARGS_CONSOLE BOOTARGS_NAND
+ #define CONFIG_BAUDRATE			115200
+ #define CONFIG_SYS_BAUDRATE_TABLE	{115200 , 19200, 38400, 57600, 9600 }
+=20
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0012-RGB_BGR-fi=
xes-of-LCD-on-bb9g45.patch b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45=
/0012-RGB_BGR-fixes-of-LCD-on-bb9g45.patch
new file mode 100644
index 0000000..3818f67
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0012-RGB_BGR-fixes-of-=
LCD-on-bb9g45.patch
@@ -0,0 +1,45 @@
+From 655e2ed34cf92067b7cc64d27b0420d7fad6d0cc Mon Sep 17 00:00:00 2001
+From: Asen Chavdarov Dimov <dimov@ronetix.at>
+Date: Fri, 10 Jun 2011 18:08:51 +0300
+Subject: [PATCH 12/14] RGB_BGR fixes of LCD on bb9g45
+
+Signed-off-by: Asen Chavdarov Dimov <dimov@ronetix.at>
+---
+ common/lcd.c             |    4 ++++
+ include/configs/pm9g45.h |    4 ++++
+ 2 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/common/lcd.c b/common/lcd.c
+index d854c21..e887906 100644
+--- a/common/lcd.c
++++ b/common/lcd.c
+@@ -545,6 +545,10 @@ void bitmap_plot (int x, int y)
+ 			lut_entry =3D ((colreg & 0x000F) << 11) |
+ 				    ((colreg & 0x00F0) <<  2) |
+ 				    ((colreg & 0x0F00) >>  7);
++#elif CONFIG_ATMEL_LCD_BGR565
++			lut_entry =3D ((colreg & 0x000F) << 11) |
++				    ((colreg & 0x00F0) <<  3) |
++				    ((colreg & 0x0F00) >>  7);
+ #else /* CONFIG_ATMEL_LCD_RGB565 */
+ 			lut_entry =3D ((colreg & 0x000F) << 1) |
+ 				    ((colreg & 0x00F0) << 3) |
+diff --git a/include/configs/pm9g45.h b/include/configs/pm9g45.h
+index 4ae1041..52082a9 100644
+--- a/include/configs/pm9g45.h
++++ b/include/configs/pm9g45.h
+@@ -154,7 +154,11 @@
+ #define CONFIG_LCD_INFO_BELOW_LOGO	1
+ #define CONFIG_SYS_WHITE_ON_BLACK	1
+ #define CONFIG_ATMEL_LCD		1
++#if defined(CONFIG_BB9G45)
++#define CONFIG_ATMEL_LCD_BGR565		1
++#else
+ #define CONFIG_ATMEL_LCD_RGB565		1
++#endif
+ #define CONFIG_SYS_CONSOLE_IS_IN_ENV	1
+=20
+ /* board specific(not enough SRAM) */
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0013-revert-88c=
4b7783d567f1c26b81a0c9daea99b44cd8723.patch b/recipes/u-boot/u-boot-2010.=
09/ronetix-pm9g45/0013-revert-88c4b7783d567f1c26b81a0c9daea99b44cd8723.pa=
tch
new file mode 100644
index 0000000..1d8be57
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0013-revert-88c4b7783d=
567f1c26b81a0c9daea99b44cd8723.patch
@@ -0,0 +1,37 @@
+From c073508227471d4bbabbba60caaceb6fb08719d8 Mon Sep 17 00:00:00 2001
+From: Asen Dimov <dimov@ronetix.at>
+Date: Fri, 24 Jun 2011 15:17:22 +0300
+Subject: [PATCH 13/14] revert 88c4b7783d567f1c26b81a0c9daea99b44cd8723
+
+switch from 128MiB to 64MiB of SDRAM.
+
+Signed-off-by: Asen Dimov <dimov@ronetix.at>
+---
+ include/configs/pm9263.h |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/configs/pm9263.h b/include/configs/pm9263.h
+index 78e7264..20fe9d7 100644
+--- a/include/configs/pm9263.h
++++ b/include/configs/pm9263.h
+@@ -95,7 +95,7 @@
+ #define CONFIG_SYS_SDRC_TR_VAL1		0x3AA
+ /* SDRAMC_CR - Configuration register*/
+ #define CONFIG_SYS_SDRC_CR_VAL							\
+-		(AT91_SDRAMC_NC_10 |						\
++		(AT91_SDRAMC_NC_9 |						\
+ 		 AT91_SDRAMC_NR_13 |						\
+ 		 AT91_SDRAMC_NB_4 |						\
+ 		 AT91_SDRAMC_CAS_2 |						\
+@@ -227,7 +227,7 @@
+ /* SDRAM */
+ #define CONFIG_NR_DRAM_BANKS	1
+ #define PHYS_SDRAM		0x20000000
+-#define PHYS_SDRAM_SIZE		0x08000000	/* 128 megs */
++#define PHYS_SDRAM_SIZE		0x04000000	/* 64 megs */
+=20
+ /* DataFlash */
+ #define CONFIG_ATMEL_DATAFLASH_SPI
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0014-pm9263-add=
-a-delay-for-the-PSRAM-in-v1.3-of-the-boar.patch b/recipes/u-boot/u-boot-=
2010.09/ronetix-pm9g45/0014-pm9263-add-a-delay-for-the-PSRAM-in-v1.3-of-t=
he-boar.patch
new file mode 100644
index 0000000..1f43ee9
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.09/ronetix-pm9g45/0014-pm9263-add-a-dela=
y-for-the-PSRAM-in-v1.3-of-the-boar.patch
@@ -0,0 +1,33 @@
+From 1b0b7c7b165f3ce930ed4349da10b6bf40909c35 Mon Sep 17 00:00:00 2001
+From: Ilko Iliev <iliev@ronetix.at>
+Date: Fri, 24 Jun 2011 15:19:41 +0300
+Subject: [PATCH 14/14] pm9263: add a delay for the PSRAM in v1.3 of the =
board
+
+Signed-off-by: Asen Dimov <dimov@ronetix.at>
+---
+ board/ronetix/pm9263/pm9263.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/board/ronetix/pm9263/pm9263.c b/board/ronetix/pm9263/pm9263=
.c
+index 5fca558..c30bdc5 100644
+--- a/board/ronetix/pm9263/pm9263.c
++++ b/board/ronetix/pm9263/pm9263.c
+@@ -248,6 +248,7 @@ static int pm9263_lcd_hw_psram_init(void)
+ 	if ((readw(PHYS_PSRAM) !=3D 0x1234) || (readw(PHYS_PSRAM+2) !=3D 0x567=
8)) {
+ 		/* try with CRE=3D1 (MT45W2M16A) */
+ 		at91_set_pio_value(PSRAM_CRE_PIN, 1); /* set PSRAM_CRE_PIN to '1' */
++		udelay(500);
+=20
+ 		/* write RCR of the PSRAM */
+ 		x =3D readw(PSRAM_CTRL_REG);
+@@ -401,6 +402,7 @@ int board_init(void)
+ 	at91_uhp_hw_init();
+ #endif
+ #ifdef CONFIG_LCD
++	timer_init();
+ 	pm9263_lcd_hw_init();
+ #endif
+ 	return 0;
+--=20
+1.7.0.4
+
diff --git a/recipes/u-boot/u-boot_2010.09.bb b/recipes/u-boot/u-boot_201=
0.09.bb
new file mode 100644
index 0000000..6e5c56c
--- /dev/null
+++ b/recipes/u-boot/u-boot_2010.09.bb
@@ -0,0 +1,36 @@
+PR =3D "r1"
+require u-boot.inc
+
+DEFAULT_PREFERENCE =3D "-1"
+DEFAULT_PREFERENCE_ronetix-pm9g45 =3D "1"
+
+SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
+
+SRC_URI_append_ronetix-pm9g45 =3D " \
+        file://0001-pm9g45-add-LCD.patch \
+        file://0002-DS2401-provides-48-bits-serial-number-using-Dallas-1=
.patch \
+        file://0003-PM9G45-uses-DS2401-to-set-the-MAC-address-of-the-Eth=
.patch \
+        file://0004-PM9263-uses-DS2401-to-set-the-MAC-address-of-the-Eth=
.patch \
+        file://0005-PM9261-uses-DS2401-to-set-the-MAC-address-of-the-Eth=
.patch \
+        file://0006-PM9263-with-128MiB-of-SRAM.patch \
+        file://0007-pm9g45-make-ethernet-working-in-v1.3.patch \
+        file://0008-pm9g45-add-enable-disable-option-to-reset-the-PHY.pa=
tch \
+        file://0009-pm9g45-enable-user-reset-when-on-bb9g45.patch \
+        file://0010-add-a-display-GATW70SN8H1E0-for-bb9g45.patch \
+        file://0011-pm9g45-choose-between-bb9g45-and-bb9263.patch \
+        file://0012-RGB_BGR-fixes-of-LCD-on-bb9g45.patch \
+        file://0013-revert-88c4b7783d567f1c26b81a0c9daea99b44cd8723.patc=
h \
+	file://0014-pm9263-add-a-delay-for-the-PSRAM-in-v1.3-of-the-boar.patch =
\
+	"
+
+TARGET_LDFLAGS =3D ""
+
+inherit base
+
+do_compile () {
+       oe_runmake ${UBOOT_MACHINE}
+       oe_runmake all
+}
+
+SRC_URI[md5sum] =3D "6dcc2cc47ecc96d4da984556d601a8c0"
+SRC_URI[sha256sum] =3D "96e7f9a0790a385256ee42845ccd7aa5bbd1866eebca2ee8=
755bf9bef189f121"
--=20
1.7.0.4



