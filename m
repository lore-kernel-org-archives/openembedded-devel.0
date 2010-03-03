Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NmuWM-000391-GO
	for openembedded-devel@openembedded.org; Wed, 03 Mar 2010 20:46:14 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id E4D071D360F6;
	Wed,  3 Mar 2010 20:43:19 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Mar 2010 20:43:16 +0100
Message-Id: <1267645398-7106-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1267645398-7106-1-git-send-email-ynezz@true.cz>
References: <20100303194141.GT24852@ibawizard.net>
	<1267645398-7106-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
Subject: [PATCH 2/4] linux 2.6.27: add support for ts72xx and make it default kernel
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
X-List-Received-Date: Wed, 03 Mar 2010 19:46:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 .../0001-TS72xx-update-memory-map-comments.patch   |   45 +
 .../linux/linux-2.6.27/ts72xx/0002-GPIO-fix.patch  |   47 +
 .../linux-2.6.27/ts72xx/0003-Debounce-IRQ.patch    |   97 ++
 .../linux/linux-2.6.27/ts72xx/0004-OHCI-fix.patch  |   39 +
 ...-Fix-wrong-machine-ID-passed-from-RedBoot.patch |   28 +
 .../ts72xx/0006-Force-the-nF-bit-on.patch          |   33 +
 .../ts72xx/0007-Use-CPLD-watchdog-to-reset.patch   |   54 +
 .../linux-2.6.27/ts72xx/0008-Fix-UART-clocks.patch |   99 ++
 .../ts72xx/0009-CPU-info-and-board-revision.patch  |   64 +
 .../linux/linux-2.6.27/ts72xx/0010-GPIO-leds.patch |   72 ++
 .../ts72xx/0011-EP93xx-Ethernet-support.patch      |  548 ++++++++
 .../linux-2.6.27/ts72xx/0012-TS72xx-watchdog.patch |  451 +++++++
 .../ts72xx/0013-TS7200-NOR-physmap-fix.patch       |   58 +
 .../ts72xx/0014-TS-7200-8MB-NOR-flash.patch        |  163 +++
 .../ts72xx/0015-TS-72xx-MAX197-support.patch       |  365 ++++++
 .../ts72xx/0016-RS485-common-bits.patch            |   46 +
 .../ts72xx/0017-TS-72xx-SBC-proc-info.patch        |  249 ++++
 .../linux-2.6.27/ts72xx/0018-EP93xx-GPIO-I2C.patch |   71 ++
 .../ts72xx/0019-EP93xx-SPI-driver.patch            |  989 ++++++++++++++=
+
 .../ts72xx/0020-TS-72XX-LCD-console-driver.patch   |  509 ++++++++
 .../ts72xx/0021-EP93xx-GPIO-matrix-keypad.patch    |  564 +++++++++
 .../0022-TS-72xx-RS485-auto-mode-support.patch     |  218 ++++
 .../0023-Clean-and-invalidate-D-cache-entry.patch  |   29 +
 .../0024-PC-104-I-O-and-memory-mappings.patch      |   40 +
 .../ts72xx/0025-EP93xx-discontigmem.patch          |  481 +++++++
 .../ts72xx/0026-TS72xx-PATA-support.patch          |  442 +++++++
 .../ts72xx/0027-TS72xx-TS-SER1-support.patch       |  213 ++++
 .../ts72xx/0028-TS72xx-TS-ETH100.patch             |  259 ++++
 .../0029-EP93xx-Power-Management-Routines.patch    |  125 ++
 .../ts72xx/0030-EP93xx-CPUfreq-driver.patch        |  332 +++++
 recipes/linux/linux-2.6.27/ts72xx/defconfig        | 1312 ++++++++++++++=
++++++
 recipes/linux/linux_2.6.27.bb                      |   36 +-
 32 files changed, 8077 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0001-TS72xx-update-=
memory-map-comments.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0002-GPIO-fix.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0003-Debounce-IRQ.p=
atch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0004-OHCI-fix.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0005-Fix-wrong-mach=
ine-ID-passed-from-RedBoot.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0006-Force-the-nF-b=
it-on.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0007-Use-CPLD-watch=
dog-to-reset.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0008-Fix-UART-clock=
s.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0009-CPU-info-and-b=
oard-revision.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0010-GPIO-leds.patc=
h
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0011-EP93xx-Etherne=
t-support.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0012-TS72xx-watchdo=
g.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0013-TS7200-NOR-phy=
smap-fix.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0014-TS-7200-8MB-NO=
R-flash.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0015-TS-72xx-MAX197=
-support.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0016-RS485-common-b=
its.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0017-TS-72xx-SBC-pr=
oc-info.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0018-EP93xx-GPIO-I2=
C.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0019-EP93xx-SPI-dri=
ver.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0020-TS-72XX-LCD-co=
nsole-driver.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0021-EP93xx-GPIO-ma=
trix-keypad.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0022-TS-72xx-RS485-=
auto-mode-support.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0023-Clean-and-inva=
lidate-D-cache-entry.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0024-PC-104-I-O-and=
-memory-mappings.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0025-EP93xx-discont=
igmem.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0026-TS72xx-PATA-su=
pport.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0027-TS72xx-TS-SER1=
-support.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0028-TS72xx-TS-ETH1=
00.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0029-EP93xx-Power-M=
anagement-Routines.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/0030-EP93xx-CPUfreq=
-driver.patch
 create mode 100644 recipes/linux/linux-2.6.27/ts72xx/defconfig

diff --git a/recipes/linux/linux-2.6.27/ts72xx/0001-TS72xx-update-memory-=
map-comments.patch b/recipes/linux/linux-2.6.27/ts72xx/0001-TS72xx-update=
-memory-map-comments.patch
new file mode 100644
index 0000000..3eab1ca
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0001-TS72xx-update-memory-map-com=
ments.patch
@@ -0,0 +1,45 @@
+From dd631acb622a6c7c6355945c446bd07085ade99f Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 14:02:33 +0100
+Subject: [PATCH] TS72xx update memory map comments
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/ts72xx.h |   13 ++++++++++++-
+ 1 files changed, 12 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-=
ep93xx/include/mach/ts72xx.h
+index 30b318a..99c4e48 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+@@ -8,12 +8,23 @@
+  * virt		phys		size
+  * febff000	22000000	4K	model number register
+  * febfe000	22400000	4K	options register
+- * febfd000	22800000	4K	options register #2
++ * febfd000	22800000	4K	options register #2 (JP6 and TS-9420 flags)
+  * febfc000	[67]0000000	4K	NAND data register
+  * febfb000	[67]0400000	4K	NAND control register
+  * febfa000	[67]0800000	4K	NAND busy register
+  * febf9000	10800000	4K	TS-5620 RTC index register
+  * febf8000	11700000	4K	TS-5620 RTC data register
++ * febf7000	23800000	4K	CPLD watchdog (control register)
++ * febf6000	23c00000	4K	CPLD watchdog (feed register)
++ * febf5000	23400000	4K	PLD version (3 bits)
++ * febf4000	22c00000	4K	RS-485 control register
++ * febf3000	23000000	4K	RS-485 mode register
++ * febf2000	10800000	4K	jumpers/max197 busy bit/COM1 dcd register (8-bi=
t, read only)
++ * febf1000	10f00000	4K	max197 sample/control register (16-bit read/8-b=
it write)
++ * febf0000	11e00000	4K	PC/104 8-bit I/O
++ * febef000	21e00000	4K	PC/104 16-bit I/O
++ * fea00000	11a00000	1MB	PC/104 8-bit memory
++ * fe900000	21a00000	1MB	PC/104 16-bit memory
+  */
+=20
+ #define TS72XX_MODEL_PHYS_BASE		0x22000000
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0002-GPIO-fix.patch b/reci=
pes/linux/linux-2.6.27/ts72xx/0002-GPIO-fix.patch
new file mode 100644
index 0000000..006321e
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0002-GPIO-fix.patch
@@ -0,0 +1,47 @@
+From 9c7b38ef5e6843521c71eadefdba8cfa0aa607b4 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 00:41:38 +0100
+Subject: [PATCH] GPIO fix
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/core.c |    2 +-
+ arch/arm/mach-ep93xx/gpio.c |    4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
+index f99f436..d6967de 100644
+--- a/arch/arm/mach-ep93xx/core.c
++++ b/arch/arm/mach-ep93xx/core.c
+@@ -157,7 +157,7 @@ static unsigned char gpio_int_type2[3];
+ static const u8 int_type1_register_offset[3]	=3D { 0x90, 0xac, 0x4c };
+ static const u8 int_type2_register_offset[3]	=3D { 0x94, 0xb0, 0x50 };
+ static const u8 eoi_register_offset[3]		=3D { 0x98, 0xb4, 0x54 };
+-static const u8 int_en_register_offset[3]	=3D { 0x9c, 0xb8, 0x5c };
++static const u8 int_en_register_offset[3]	=3D { 0x9c, 0xb8, 0x58 };
+=20
+ void ep93xx_gpio_update_int_params(unsigned port)
+ {
+diff --git a/arch/arm/mach-ep93xx/gpio.c b/arch/arm/mach-ep93xx/gpio.c
+index 0f3fb87..468d523 100644
+--- a/arch/arm/mach-ep93xx/gpio.c
++++ b/arch/arm/mach-ep93xx/gpio.c
+@@ -141,10 +141,10 @@ static void ep93xx_gpio_dbg_show(struct seq_file *=
s, struct gpio_chip *chip)
+ static struct ep93xx_gpio_chip ep93xx_gpio_banks[] =3D {
+ 	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0),
+ 	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8),
+-	EP93XX_GPIO_BANK("C", 0x30, 0x34, 40),
++	EP93XX_GPIO_BANK("C", 0x08, 0x18, 40),
+ 	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24),
+ 	EP93XX_GPIO_BANK("E", 0x20, 0x24, 32),
+-	EP93XX_GPIO_BANK("F", 0x08, 0x18, 16),
++	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16),
+ 	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48),
+ 	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56),
+ };
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0003-Debounce-IRQ.patch b/=
recipes/linux/linux-2.6.27/ts72xx/0003-Debounce-IRQ.patch
new file mode 100644
index 0000000..21410ab
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0003-Debounce-IRQ.patch
@@ -0,0 +1,97 @@
+From 51bba77f0953f87a88a8fce9fb8827bdba57a2c5 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 00:42:43 +0100
+Subject: [PATCH] Debounce IRQ
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/core.c                     |   18 ++++++++++++++++=
++
+ arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h |    3 +++
+ arch/arm/mach-ep93xx/include/mach/gpio.h        |    2 ++
+ 3 files changed, 23 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
+index d6967de..1928c93 100644
+--- a/arch/arm/mach-ep93xx/core.c
++++ b/arch/arm/mach-ep93xx/core.c
+@@ -152,12 +152,14 @@ static unsigned char gpio_int_unmasked[3];
+ static unsigned char gpio_int_enabled[3];
+ static unsigned char gpio_int_type1[3];
+ static unsigned char gpio_int_type2[3];
++static unsigned char gpio_int_debouce[3];
+=20
+ /* Port ordering is: A B F */
+ static const u8 int_type1_register_offset[3]	=3D { 0x90, 0xac, 0x4c };
+ static const u8 int_type2_register_offset[3]	=3D { 0x94, 0xb0, 0x50 };
+ static const u8 eoi_register_offset[3]		=3D { 0x98, 0xb4, 0x54 };
+ static const u8 int_en_register_offset[3]	=3D { 0x9c, 0xb8, 0x58 };
++static const u8 int_debounce_register_offset[3]	=3D { 0xa8, 0xc4, 0x64 =
};
+=20
+ void ep93xx_gpio_update_int_params(unsigned port)
+ {
+@@ -180,6 +182,22 @@ void ep93xx_gpio_int_mask(unsigned line)
+ 	gpio_int_unmasked[line >> 3] &=3D ~(1 << (line & 7));
+ }
+=20
++void ep93xx_gpio_int_debounce(unsigned int irq, int enable)
++{
++	int line =3D irq_to_gpio(irq);
++	int port =3D line >> 3;
++	int port_mask =3D 1 << (line & 7);
++
++	if (enable)
++		gpio_int_debouce[port] |=3D port_mask;
++	else
++		gpio_int_debouce[port] &=3D ~port_mask;
++
++	__raw_writeb(gpio_int_debouce[port],
++		EP93XX_GPIO_REG(int_debounce_register_offset[port]));
++}
++EXPORT_SYMBOL(ep93xx_gpio_int_debounce);
++
+ /**********************************************************************=
***
+  * EP93xx IRQ handling
+  **********************************************************************=
***/
+diff --git a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h b/arch/arm/=
mach-ep93xx/include/mach/ep93xx-regs.h
+index 9f4458c..5582138 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
++++ b/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
+@@ -78,16 +78,19 @@
+ #define EP93XX_GPIO_F_INT_ACK		EP93XX_GPIO_REG(0x54)
+ #define EP93XX_GPIO_F_INT_ENABLE	EP93XX_GPIO_REG(0x58)
+ #define EP93XX_GPIO_F_INT_STATUS	EP93XX_GPIO_REG(0x5c)
++#define EP93XX_GPIO_F_INT_DEBOUNCE	EP93XX_GPIO_REG(0x64)
+ #define EP93XX_GPIO_A_INT_TYPE1		EP93XX_GPIO_REG(0x90)
+ #define EP93XX_GPIO_A_INT_TYPE2		EP93XX_GPIO_REG(0x94)
+ #define EP93XX_GPIO_A_INT_ACK		EP93XX_GPIO_REG(0x98)
+ #define EP93XX_GPIO_A_INT_ENABLE	EP93XX_GPIO_REG(0x9c)
+ #define EP93XX_GPIO_A_INT_STATUS	EP93XX_GPIO_REG(0xa0)
++#define EP93XX_GPIO_A_INT_DEBOUNCE	EP93XX_GPIO_REG(0xa8)
+ #define EP93XX_GPIO_B_INT_TYPE1		EP93XX_GPIO_REG(0xac)
+ #define EP93XX_GPIO_B_INT_TYPE2		EP93XX_GPIO_REG(0xb0)
+ #define EP93XX_GPIO_B_INT_ACK		EP93XX_GPIO_REG(0xb4)
+ #define EP93XX_GPIO_B_INT_ENABLE	EP93XX_GPIO_REG(0xb8)
+ #define EP93XX_GPIO_B_INT_STATUS	EP93XX_GPIO_REG(0xbc)
++#define EP93XX_GPIO_B_INT_DEBOUNCE	EP93XX_GPIO_REG(0xc4)
+=20
+ #define EP93XX_AAC_BASE			(EP93XX_APB_VIRT_BASE + 0x00080000)
+=20
+diff --git a/arch/arm/mach-ep93xx/include/mach/gpio.h b/arch/arm/mach-ep=
93xx/include/mach/gpio.h
+index f702041..0a1498a 100644
+--- a/arch/arm/mach-ep93xx/include/mach/gpio.h
++++ b/arch/arm/mach-ep93xx/include/mach/gpio.h
+@@ -99,6 +99,8 @@
+ /* maximum value for irq capable line identifiers */
+ #define EP93XX_GPIO_LINE_MAX_IRQ	EP93XX_GPIO_LINE_F(7)
+=20
++extern void ep93xx_gpio_int_debounce(unsigned int irq, int enable);
++
+ /* new generic GPIO API - see Documentation/gpio.txt */
+=20
+ #include <asm-generic/gpio.h>
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0004-OHCI-fix.patch b/reci=
pes/linux/linux-2.6.27/ts72xx/0004-OHCI-fix.patch
new file mode 100644
index 0000000..1482e2d
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0004-OHCI-fix.patch
@@ -0,0 +1,39 @@
+From 06e0fdf41288a6d54b821671593195ea27deba8b Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 00:54:35 +0100
+Subject: [PATCH] OHCI fix
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/core.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
+index 1928c93..24b24c7 100644
+--- a/arch/arm/mach-ep93xx/core.c
++++ b/arch/arm/mach-ep93xx/core.c
+@@ -32,6 +32,7 @@
+ #include <linux/termios.h>
+ #include <linux/amba/bus.h>
+ #include <linux/amba/serial.h>
++#include <linux/dma-mapping.h>
+=20
+ #include <asm/types.h>
+ #include <asm/setup.h>
+@@ -472,8 +473,8 @@ static struct platform_device ep93xx_ohci_device =3D=
 {
+ 	.name		=3D "ep93xx-ohci",
+ 	.id		=3D -1,
+ 	.dev		=3D {
+-		.dma_mask		=3D (void *)0xffffffff,
+-		.coherent_dma_mask	=3D 0xffffffff,
++		.dma_mask =3D &ep93xx_ohci_device.dev.coherent_dma_mask,
++		.coherent_dma_mask =3D DMA_BIT_MASK(32),
+ 	},
+ 	.num_resources	=3D ARRAY_SIZE(ep93xx_ohci_resources),
+ 	.resource	=3D ep93xx_ohci_resources,
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0005-Fix-wrong-machine-ID-=
passed-from-RedBoot.patch b/recipes/linux/linux-2.6.27/ts72xx/0005-Fix-wr=
ong-machine-ID-passed-from-RedBoot.patch
new file mode 100644
index 0000000..e17f945
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0005-Fix-wrong-machine-ID-passed-=
from-RedBoot.patch
@@ -0,0 +1,28 @@
+From 22ce7d90cb3c58be44ebb0fcb3f1f5ca8af83d59 Mon Sep 17 00:00:00 2001
+From: =3D?utf-8?q?Petr=3D20=3DC5=3DA0tetiar?=3D <ynezz@true.cz>
+Date: Sat, 3 Jan 2009 21:33:53 +0100
+Subject: [PATCH] Fix wrong machine ID passed from RedBoot
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/kernel/head.S |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
+index bff4c6e..bda4eb4 100644
+--- a/arch/arm/kernel/head.S
++++ b/arch/arm/kernel/head.S
+@@ -83,6 +83,7 @@ ENTRY(stext)
+ 	bl	__lookup_processor_type		@ r5=3Dprocinfo r9=3Dcpuid
+ 	movs	r10, r5				@ invalid processor (r5=3D0)?
+ 	beq	__error_p			@ yes, error 'p'
++	ldr	r1, =3D0x000002a1			@ mach-type =3D TS-7250
+ 	bl	__lookup_machine_type		@ r5=3Dmachinfo
+ 	movs	r8, r5				@ invalid machine (r5=3D0)?
+ 	beq	__error_a			@ yes, error 'a'
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0006-Force-the-nF-bit-on.p=
atch b/recipes/linux/linux-2.6.27/ts72xx/0006-Force-the-nF-bit-on.patch
new file mode 100644
index 0000000..db96acc
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0006-Force-the-nF-bit-on.patch
@@ -0,0 +1,33 @@
+From 9852d9654b25b396cf5f31de376a2c211805db8b Mon Sep 17 00:00:00 2001
+From: =3D?utf-8?q?Petr=3D20=3DC5=3DA0tetiar?=3D <ynezz@true.cz>
+Date: Sat, 3 Jan 2009 21:35:03 +0100
+Subject: [PATCH] Force the nF bit on
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Usually this is set by the bootrom.  If it is not set, then the CPU core=
 will
+run from HCLK instead of FCLK, and performance will suffer. If you see
+BogoMIPS of about 1/4 of your CPU clock, try turning this on; your perfo=
rmance
+should double.
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mm/proc-arm920.S |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
+index 28cdb06..12f59db 100644
+--- a/arch/arm/mm/proc-arm920.S
++++ b/arch/arm/mm/proc-arm920.S
+@@ -395,6 +395,7 @@ __arm920_setup:
+ 	mrc	p15, 0, r0, c1, c0		@ get control register v4
+ 	bic	r0, r0, r5
+ 	orr	r0, r0, r6
++	orr     r0, r0, #0x40000000
+ 	mov	pc, lr
+ 	.size	__arm920_setup, . - __arm920_setup
+=20
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0007-Use-CPLD-watchdog-to-=
reset.patch b/recipes/linux/linux-2.6.27/ts72xx/0007-Use-CPLD-watchdog-to=
-reset.patch
new file mode 100644
index 0000000..c2fbd5c
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0007-Use-CPLD-watchdog-to-reset.p=
atch
@@ -0,0 +1,54 @@
+From fca24d7cd93b7282d139cb91c0f4d62b1a95a985 Mon Sep 17 00:00:00 2001
+From: =3D?utf-8?q?Petr=3D20=3DC5=3DA0tetiar?=3D <ynezz@true.cz>
+Date: Sat, 3 Jan 2009 21:36:36 +0100
+Subject: [PATCH] Use CPLD watchdog to reset
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Use CPLD watchdog to reset the machine instead of buggy ep93xx one, whic=
h
+sometimes get stuck...
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/system.h |   17 ++++++++++++-----
+ 1 files changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/system.h b/arch/arm/mach-=
ep93xx/include/mach/system.h
+index 67789d0..5d85094 100644
+--- a/arch/arm/mach-ep93xx/include/mach/system.h
++++ b/arch/arm/mach-ep93xx/include/mach/system.h
+@@ -3,6 +3,7 @@
+  */
+=20
+ #include <mach/hardware.h>
++#include <asm/mach-types.h>
+=20
+ static inline void arch_idle(void)
+ {
+@@ -15,11 +16,17 @@ static inline void arch_reset(char mode)
+=20
+ 	local_irq_disable();
+=20
+-	devicecfg =3D __raw_readl(EP93XX_SYSCON_DEVICE_CONFIG);
+-	__raw_writel(0xaa, EP93XX_SYSCON_SWLOCK);
+-	__raw_writel(devicecfg | 0x80000000, EP93XX_SYSCON_DEVICE_CONFIG);
+-	__raw_writel(0xaa, EP93XX_SYSCON_SWLOCK);
+-	__raw_writel(devicecfg & ~0x80000000, EP93XX_SYSCON_DEVICE_CONFIG);
++	if (machine_is_ts72xx()) {
++		__raw_writeb(0x5, TS72XX_WATCHDOG_FEED_PHYS_BASE);
++		__raw_writeb(0x1, TS72XX_WATCHDOG_CONTROL_PHYS_BASE);
++	} else {
++		devicecfg =3D __raw_readl(EP93XX_SYSCON_DEVICE_CONFIG);
++		__raw_writel(0xaa, EP93XX_SYSCON_SWLOCK);
++		__raw_writel(devicecfg | 0x80000000, EP93XX_SYSCON_DEVICE_CONFIG);
++		__raw_writel(0xaa, EP93XX_SYSCON_SWLOCK);
++		__raw_writel(devicecfg & ~0x80000000, EP93XX_SYSCON_DEVICE_CONFIG);
++	}
++
+=20
+ 	while (1)
+ 		;
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0008-Fix-UART-clocks.patch=
 b/recipes/linux/linux-2.6.27/ts72xx/0008-Fix-UART-clocks.patch
new file mode 100644
index 0000000..4384847
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0008-Fix-UART-clocks.patch
@@ -0,0 +1,99 @@
+From 1a86fa006baad26dcb70645e9d2a965f956a7189 Mon Sep 17 00:00:00 2001
+From: Lennert Buytenhek <buytenh@wantstofly.org>
+Date: Sat, 3 Jan 2009 21:51:11 +0100
+Subject: [PATCH] Fix UART clocks
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Hackishly enable all UART clocks before uncompressing the kernel,
+so that using ttyAM1 or ttyAM2 as console can work. Force UARTBAUD
+on before uncompressing.
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/uncompress.h |   65 +++++++++++++++++=
+++++++
+ 1 files changed, 65 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/uncompress.h b/arch/arm/m=
ach-ep93xx/include/mach/uncompress.h
+index 1fd2f17..ecdfd64 100644
+--- a/arch/arm/mach-ep93xx/include/mach/uncompress.h
++++ b/arch/arm/mach-ep93xx/include/mach/uncompress.h
+@@ -77,9 +77,74 @@ static void ethernet_reset(void)
+ }
+=20
+=20
++/*
++ * We don't have clock management for the UARTs (amba-pl010)
++ * yet, so hackily enable all UART clocks here for now.
++ */
++#define PHYS_SYSCON_DEVICE_CONFIG	0x80930080
++#define PHYS_SYSCON_SWLOCK		0x809300c0
++
++static void enable_all_uart_clocks(void)
++{
++	unsigned int v;
++
++	v =3D __raw_readl(PHYS_SYSCON_DEVICE_CONFIG);
++	__raw_writel(0xaa, PHYS_SYSCON_SWLOCK);
++	__raw_writel(v | 0x01140000, PHYS_SYSCON_DEVICE_CONFIG);
++}
++
++
++/*
++ * Some bootloaders don't turn on the UARTBAUD bit, which means that
++ * the UARTs will be running off a divided 7.3728 MHz clock instead of
++ * the 14.7456 MHz peripheral clock when linux boots.
++ *
++ * We detect that condition here and fix it by turning on UARTBAUD, and
++ * then reprogramming the divisors on all enabled UARTs to twice what
++ * they were before we turned UARTBAUD on, to preserve the programmed
++ * baud rate.
++ */
++#define PHYS_SYSCON_CLOCK_CONTROL	0x80930004
++#define SYSCON_CLOCK_UARTBAUD		0x20000000
++#define PHYS_UART1_BASE			0x808c0000
++#define PHYS_UART2_BASE			0x808d0000
++#define PHYS_UART3_BASE			0x808e0000
++
++static void uart_divisor_times_two(unsigned int base)
++{
++	u16 divisor;
++
++	divisor =3D __raw_readb(base + 0x0c) << 8;
++	divisor |=3D __raw_readb(base + 0x10);
++	if (divisor) {
++		divisor =3D (2 * (divisor + 1)) - 1;
++		__raw_writeb(divisor >> 8, base + 0x0c);
++		__raw_writeb(divisor & 0xff, base + 0x10);
++		__raw_writeb(__raw_readb(base + 0x08), base + 0x08);
++	}
++}
++
++static void fix_uart_base(void)
++{
++	unsigned int v;
++
++	v =3D __raw_readl(PHYS_SYSCON_CLOCK_CONTROL);
++	if ((v & SYSCON_CLOCK_UARTBAUD) =3D=3D 0) {
++		v |=3D SYSCON_CLOCK_UARTBAUD;
++		__raw_writel(v, PHYS_SYSCON_CLOCK_CONTROL);
++
++		uart_divisor_times_two(PHYS_UART1_BASE);
++		uart_divisor_times_two(PHYS_UART2_BASE);
++		uart_divisor_times_two(PHYS_UART3_BASE);
++	}
++}
++
++
+ static void arch_decomp_setup(void)
+ {
+ 	ethernet_reset();
++	enable_all_uart_clocks();
++	fix_uart_base();
+ }
+=20
+ #define arch_decomp_wdog()
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0009-CPU-info-and-board-re=
vision.patch b/recipes/linux/linux-2.6.27/ts72xx/0009-CPU-info-and-board-=
revision.patch
new file mode 100644
index 0000000..5dd360a
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0009-CPU-info-and-board-revision.=
patch
@@ -0,0 +1,64 @@
+From 3f48e4dc8affb4ddfe7b1ca8f209003cfb8ac314 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sat, 3 Jan 2009 22:19:21 +0100
+Subject: [PATCH] CPU info and board revision
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Adds support for SoC's unique ID (Maverick Key) in /proc/cpuinfo and
+information about board revision.
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/kernel/setup.c                         |    9 +++++++++
+ arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h |    3 +++
+ 2 files changed, 12 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
+index 2ca7038..891fcf3 100644
+--- a/arch/arm/kernel/setup.c
++++ b/arch/arm/kernel/setup.c
+@@ -994,9 +994,18 @@ static int c_show(struct seq_file *m, void *v)
+ 	seq_puts(m, "\n");
+=20
+ 	seq_printf(m, "Hardware\t: %s\n", machine_name);
++
++#if defined(CONFIG_ARCH_EP93XX)
++#include <mach/ep93xx-regs.h>
++	seq_printf(m, "Revision\t: %04x\n",
++		   *((unsigned int *)EP93XX_SYSCON_CHIPID) >> 28);
++	seq_printf(m, "Serial\t\t: %016x\n",
++		   *((unsigned int *)EP93XX_SECURITY_UNIQID));
++#else
+ 	seq_printf(m, "Revision\t: %04x\n", system_rev);
+ 	seq_printf(m, "Serial\t\t: %08x%08x\n",
+ 		   system_serial_high, system_serial_low);
++#endif
+=20
+ 	return 0;
+ }
+diff --git a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h b/arch/arm/=
mach-ep93xx/include/mach/ep93xx-regs.h
+index 5582138..e26b41b 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
++++ b/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
+@@ -70,6 +70,8 @@
+ #define EP93XX_I2S_BASE			(EP93XX_APB_VIRT_BASE + 0x00020000)
+=20
+ #define EP93XX_SECURITY_BASE		(EP93XX_APB_VIRT_BASE + 0x00030000)
++#define EP93XX_SECURITY_REG(x)		(EP93XX_SECURITY_BASE + (x))
++#define EP93XX_SECURITY_UNIQID		EP93XX_SECURITY_REG(0x2440)
+=20
+ #define EP93XX_GPIO_BASE		(EP93XX_APB_VIRT_BASE + 0x00040000)
+ #define EP93XX_GPIO_REG(x)		(EP93XX_GPIO_BASE + (x))
+@@ -129,6 +131,7 @@
+ #define EP93XX_SYSCON_DEVICE_CONFIG	EP93XX_SYSCON_REG(0x80)
+ #define EP93XX_SYSCON_DEVICE_CONFIG_CRUNCH_ENABLE	0x00800000
+ #define EP93XX_SYSCON_SWLOCK		EP93XX_SYSCON_REG(0xc0)
++#define EP93XX_SYSCON_CHIPID		EP93XX_SYSCON_REG(0x94)
+=20
+ #define EP93XX_WATCHDOG_BASE		(EP93XX_APB_VIRT_BASE + 0x00140000)
+=20
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0010-GPIO-leds.patch b/rec=
ipes/linux/linux-2.6.27/ts72xx/0010-GPIO-leds.patch
new file mode 100644
index 0000000..74c4490
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0010-GPIO-leds.patch
@@ -0,0 +1,72 @@
+From 11158bb59b2d848f1827d4ed59d4ca20d1f91d11 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 00:58:03 +0100
+Subject: [PATCH] GPIO leds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/core.c |   31 +++++++++++++++++++++++++++++++
+ 1 files changed, 31 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
+index 24b24c7..88afbe6 100644
+--- a/arch/arm/mach-ep93xx/core.c
++++ b/arch/arm/mach-ep93xx/core.c
+@@ -33,6 +33,7 @@
+ #include <linux/amba/bus.h>
+ #include <linux/amba/serial.h>
+ #include <linux/dma-mapping.h>
++#include <linux/leds.h>
+=20
+ #include <asm/types.h>
+ #include <asm/setup.h>
+@@ -480,6 +481,35 @@ static struct platform_device ep93xx_ohci_device =3D=
 {
+ 	.resource	=3D ep93xx_ohci_resources,
+ };
+=20
++
++static const struct gpio_led ep93xx_led_pins[] =3D {
++  {
++    .name =3D "green",
++    .gpio =3D EP93XX_GPIO_LINE_GRLED,
++    .active_low =3D 0,
++    .default_trigger =3D "heartbeat",
++  },
++  {
++    .name =3D "red",
++    .gpio =3D EP93XX_GPIO_LINE_RDLED,
++    .active_low =3D 0,
++  }
++};
++
++static const struct gpio_led_platform_data ep93xx_led_data =3D {
++  .num_leds =3D ARRAY_SIZE(ep93xx_led_pins),
++  .leds =3D (void *)ep93xx_led_pins,
++};
++
++static struct platform_device ep93xx_gpio_leds =3D {
++  .name =3D "leds-gpio",
++  .id =3D -1,
++  .dev =3D {
++    .platform_data =3D (void *)&ep93xx_led_data,
++  }
++};
++
++
+ extern void ep93xx_gpio_init(void);
+=20
+ void __init ep93xx_init_devices(void)
+@@ -500,6 +530,7 @@ void __init ep93xx_init_devices(void)
+ 	amba_device_register(&uart2_device, &iomem_resource);
+ 	amba_device_register(&uart3_device, &iomem_resource);
+=20
++	platform_device_register(&ep93xx_gpio_leds);
+ 	platform_device_register(&ep93xx_rtc_device);
+ 	platform_device_register(&ep93xx_ohci_device);
+ }
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0011-EP93xx-Ethernet-suppo=
rt.patch b/recipes/linux/linux-2.6.27/ts72xx/0011-EP93xx-Ethernet-support=
.patch
new file mode 100644
index 0000000..dc520de
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0011-EP93xx-Ethernet-support.patc=
h
@@ -0,0 +1,548 @@
+From d4b6abf167207531bad915bf8931b0757d8bc01e Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 01:03:58 +0100
+Subject: [PATCH] EP93xx Ethernet support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/net/arm/Kconfig      |    1 +
+ drivers/net/arm/ep93xx_eth.c |  354 +++++++++++++++++++++++++++++++++--=
-------
+ 2 files changed, 282 insertions(+), 73 deletions(-)
+
+diff --git a/drivers/net/arm/Kconfig b/drivers/net/arm/Kconfig
+index 8eda6ee..84e6068 100644
+--- a/drivers/net/arm/Kconfig
++++ b/drivers/net/arm/Kconfig
+@@ -44,6 +44,7 @@ config EP93XX_ETH
+ 	tristate "EP93xx Ethernet support"
+ 	depends on ARM && ARCH_EP93XX
+ 	select MII
++	select PHYLIB
+ 	help
+ 	  This is a driver for the ethernet hardware included in EP93xx CPUs.
+ 	  Say Y if you are building a kernel for EP93xx based devices.
+diff --git a/drivers/net/arm/ep93xx_eth.c b/drivers/net/arm/ep93xx_eth.c
+index 1267444..c3f011f 100644
+--- a/drivers/net/arm/ep93xx_eth.c
++++ b/drivers/net/arm/ep93xx_eth.c
+@@ -2,6 +2,7 @@
+  * EP93xx ethernet network device driver
+  * Copyright (C) 2006 Lennert Buytenhek <buytenh@wantstofly.org>
+  * Dedicated to Marija Kulikova.
++ * Copyright (C) 2007 Herbert Valerio Riedel <hvr@gnu.org>
+  *
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+@@ -14,6 +15,7 @@
+ #include <linux/kernel.h>
+ #include <linux/netdevice.h>
+ #include <linux/mii.h>
++#include <linux/phy.h>
+ #include <linux/etherdevice.h>
+ #include <linux/ethtool.h>
+ #include <linux/init.h>
+@@ -37,6 +39,8 @@
+ #define  REG_RXCTL_DEFAULT	0x00073800
+ #define REG_TXCTL		0x0004
+ #define  REG_TXCTL_ENABLE	0x00000001
++#define REG_TESTCTL    0x0008
++#define  REG_TESTCTL_MFDX  0x00000040
+ #define REG_MIICMD		0x0010
+ #define  REG_MIICMD_READ	0x00008000
+ #define  REG_MIICMD_WRITE	0x00004000
+@@ -45,6 +49,9 @@
+ #define  REG_MIISTS_BUSY	0x00000001
+ #define REG_SELFCTL		0x0020
+ #define  REG_SELFCTL_RESET	0x00000001
++#define  REG_SELFCTL_MDCDIV_MSK 0x00007e00
++#define  REG_SELFCTL_MDCDIV_OFS 9
++#define  REG_SELFCTL_PSPRS 0x00000100
+ #define REG_INTEN		0x0024
+ #define  REG_INTEN_TX		0x00000008
+ #define  REG_INTEN_RX		0x00000007
+@@ -174,8 +181,14 @@ struct ep93xx_priv
+=20
+ 	struct net_device_stats	stats;
+=20
+-	struct mii_if_info	mii;
+ 	u8			mdc_divisor;
++  int     phy_supports_mfps:1;
++
++  struct mii_bus    mii_bus;
++  struct phy_device *phy_dev;
++  int     speed;
++  int     duplex;
++  int     link;
+ };
+=20
+ #define rdb(ep, off)		__raw_readb((ep)->base_addr + (off))
+@@ -185,8 +198,6 @@ struct ep93xx_priv
+ #define wrw(ep, off, val)	__raw_writew((val), (ep)->base_addr + (off))
+ #define wrl(ep, off, val)	__raw_writel((val), (ep)->base_addr + (off))
+=20
+-static int ep93xx_mdio_read(struct net_device *dev, int phy_id, int reg=
);
+-
+ static struct net_device_stats *ep93xx_get_stats(struct net_device *dev=
)
+ {
+ 	struct ep93xx_priv *ep =3D netdev_priv(dev);
+@@ -524,6 +535,22 @@ err:
+ 	return 1;
+ }
+=20
++static int ep93xx_mdio_reset(struct mii_bus *bus)
++{
++  struct ep93xx_priv *ep =3D bus->priv;
++
++  u32 selfctl =3D rdl(ep, REG_SELFCTL);
++
++  selfctl &=3D ~(REG_SELFCTL_MDCDIV_MSK | REG_SELFCTL_PSPRS);
++
++  selfctl |=3D (ep->mdc_divisor - 1) << REG_SELFCTL_MDCDIV_OFS;
++  selfctl |=3D REG_SELFCTL_PSPRS;
++
++  wrl(ep, REG_SELFCTL, selfctl);
++
++  return 0;
++}
++
+ static int ep93xx_start_hw(struct net_device *dev)
+ {
+ 	struct ep93xx_priv *ep =3D netdev_priv(dev);
+@@ -542,11 +569,8 @@ static int ep93xx_start_hw(struct net_device *dev)
+ 		return 1;
+ 	}
+=20
+-	wrl(ep, REG_SELFCTL, ((ep->mdc_divisor - 1) << 9));
+-
+-	/* Does the PHY support preamble suppress?  */
+-	if ((ep93xx_mdio_read(dev, ep->mii.phy_id, MII_BMSR) & 0x0040) !=3D 0)
+-		wrl(ep, REG_SELFCTL, ((ep->mdc_divisor - 1) << 9) | (1 << 8));
++  /* The reset cleared REG_SELFCTL, so set the MDC divisor again */
++  ep93xx_mdio_reset(&ep->mii_bus);
+=20
+ 	/* Receive descriptor ring.  */
+ 	addr =3D ep->descs_dma_addr + offsetof(struct ep93xx_descs, rdesc);
+@@ -631,12 +655,11 @@ static int ep93xx_open(struct net_device *dev)
+ 		return -ENOMEM;
+=20
+ 	if (is_zero_ether_addr(dev->dev_addr)) {
++    DECLARE_MAC_BUF(mac_buf);
++
+ 		random_ether_addr(dev->dev_addr);
+-		printk(KERN_INFO "%s: generated random MAC address "
+-			"%.2x:%.2x:%.2x:%.2x:%.2x:%.2x.\n", dev->name,
+-			dev->dev_addr[0], dev->dev_addr[1],
+-			dev->dev_addr[2], dev->dev_addr[3],
+-			dev->dev_addr[4], dev->dev_addr[5]);
++    dev_info(&dev->dev, "generated random MAC address %s\n",
++      print_mac(mac_buf, dev->dev_addr));
+ 	}
+=20
+ 	napi_enable(&ep->napi);
+@@ -664,6 +687,8 @@ static int ep93xx_open(struct net_device *dev)
+=20
+ 	wrl(ep, REG_GIINTMSK, REG_GIINTMSK_ENABLE);
+=20
++  phy_start(ep->phy_dev);
++
+ 	netif_start_queue(dev);
+=20
+ 	return 0;
+@@ -676,6 +701,9 @@ static int ep93xx_close(struct net_device *dev)
+ 	napi_disable(&ep->napi);
+ 	netif_stop_queue(dev);
+=20
++  if (ep->phy_dev)
++    phy_stop(ep->phy_dev);
++
+ 	wrl(ep, REG_GIINTMSK, 0);
+ 	free_irq(ep->irq, dev);
+ 	ep93xx_stop_hw(dev);
+@@ -687,51 +715,83 @@ static int ep93xx_close(struct net_device *dev)
+ static int ep93xx_ioctl(struct net_device *dev, struct ifreq *ifr, int =
cmd)
+ {
+ 	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	struct mii_ioctl_data *data =3D if_mii(ifr);
+=20
+-	return generic_mii_ioctl(&ep->mii, data, cmd, NULL);
++  return phy_mii_ioctl(ep->phy_dev, if_mii(ifr), cmd);
+ }
+=20
+-static int ep93xx_mdio_read(struct net_device *dev, int phy_id, int reg=
)
++/* common MII transactions should take < 100 iterations */
++#define EP93XX_PHY_TIMEOUT 2000
++
++static int ep93xx_mdio_wait(struct mii_bus *bus)
+ {
+-	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	int data;
+-	int i;
++  struct ep93xx_priv *ep =3D bus->priv;
++  unsigned int timeout =3D EP93XX_PHY_TIMEOUT;
+=20
+-	wrl(ep, REG_MIICMD, REG_MIICMD_READ | (phy_id << 5) | reg);
++  while ((rdl(ep, REG_MIISTS) & REG_MIISTS_BUSY)
++        && timeout--)
++    cpu_relax();
+=20
+-	for (i =3D 0; i < 10; i++) {
+-		if ((rdl(ep, REG_MIISTS) & REG_MIISTS_BUSY) =3D=3D 0)
+-			break;
+-		msleep(1);
++  if (timeout <=3D 0) {
++    dev_err(bus->dev, "MII operation timed out\n");
++    return -ETIMEDOUT;
+ 	}
+=20
+-	if (i =3D=3D 10) {
+-		printk(KERN_INFO DRV_MODULE_NAME ": mdio read timed out\n");
+-		data =3D 0xffff;
+-	} else {
+-		data =3D rdl(ep, REG_MIIDATA);
+-	}
++	return 0;
++}
++
++static int ep93xx_mdio_read(struct mii_bus *bus, int mii_id, int regnum=
)
++{
++  struct ep93xx_priv *ep =3D bus->priv;
++  u32 selfctl;
++  u32 data;
++
++  if (ep93xx_mdio_wait(bus) < 0)
++    return -ETIMEDOUT;
+=20
+-	return data;
++  selfctl =3D rdl(ep, REG_SELFCTL);
++
++  if (ep->phy_supports_mfps)
++    wrl(ep, REG_SELFCTL, selfctl | REG_SELFCTL_PSPRS);
++  else
++    wrl(ep, REG_SELFCTL, selfctl & ~REG_SELFCTL_PSPRS);
++
++  wrl(ep, REG_MIICMD, REG_MIICMD_READ | (mii_id << 5) | regnum);
++
++  if (ep93xx_mdio_wait(bus) < 0)
++    return -ETIMEDOUT;
++
++  data =3D  rdl(ep, REG_MIIDATA);
++
++  wrl(ep, REG_SELFCTL, selfctl);
++
++  return data;
+ }
+=20
+-static void ep93xx_mdio_write(struct net_device *dev, int phy_id, int r=
eg, int data)
++static int ep93xx_mdio_write(struct mii_bus *bus, int mii_id, int regnu=
m,
++          u16 value)
+ {
+-	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	int i;
++  struct ep93xx_priv *ep =3D bus->priv;
++  u32 selfctl;
+=20
+-	wrl(ep, REG_MIIDATA, data);
+-	wrl(ep, REG_MIICMD, REG_MIICMD_WRITE | (phy_id << 5) | reg);
++  if (ep93xx_mdio_wait(bus) < 0)
++    return -ETIMEDOUT;
+=20
+-	for (i =3D 0; i < 10; i++) {
+-		if ((rdl(ep, REG_MIISTS) & REG_MIISTS_BUSY) =3D=3D 0)
+-			break;
+-		msleep(1);
+-	}
++  selfctl =3D rdl(ep, REG_SELFCTL);
+=20
+-	if (i =3D=3D 10)
+-		printk(KERN_INFO DRV_MODULE_NAME ": mdio write timed out\n");
++  if (ep->phy_supports_mfps)
++    wrl(ep, REG_SELFCTL, selfctl | REG_SELFCTL_PSPRS);
++  else
++    wrl(ep, REG_SELFCTL, selfctl & ~REG_SELFCTL_PSPRS);
++
++  wrl(ep, REG_MIIDATA, value);
++  wrl(ep, REG_MIICMD, REG_MIICMD_WRITE | (mii_id << 5) | regnum);
++
++  if (ep93xx_mdio_wait(bus) < 0)
++    return -ETIMEDOUT;
++
++  wrl(ep, REG_SELFCTL, selfctl);
++
++  return 0;
+ }
+=20
+ static void ep93xx_get_drvinfo(struct net_device *dev, struct ethtool_d=
rvinfo *info)
+@@ -743,33 +803,31 @@ static void ep93xx_get_drvinfo(struct net_device *=
dev, struct ethtool_drvinfo *i
+ static int ep93xx_get_settings(struct net_device *dev, struct ethtool_c=
md *cmd)
+ {
+ 	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	return mii_ethtool_gset(&ep->mii, cmd);
++  struct phy_device *phydev =3D ep->phy_dev;
++
++  if (!phydev)
++    return -ENODEV;
++
++  return phy_ethtool_gset(phydev, cmd);
+ }
+=20
+ static int ep93xx_set_settings(struct net_device *dev, struct ethtool_c=
md *cmd)
+ {
+ 	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	return mii_ethtool_sset(&ep->mii, cmd);
+-}
++  struct phy_device *phydev =3D ep->phy_dev;
+=20
+-static int ep93xx_nway_reset(struct net_device *dev)
+-{
+-	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	return mii_nway_restart(&ep->mii);
+-}
++  if (!phydev)
++    return -ENODEV;
+=20
+-static u32 ep93xx_get_link(struct net_device *dev)
+-{
+-	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	return mii_link_ok(&ep->mii);
++  return phy_ethtool_sset(phydev, cmd);
+ }
+=20
++
+ static struct ethtool_ops ep93xx_ethtool_ops =3D {
+ 	.get_drvinfo		=3D ep93xx_get_drvinfo,
+ 	.get_settings		=3D ep93xx_get_settings,
+ 	.set_settings		=3D ep93xx_set_settings,
+-	.nway_reset		=3D ep93xx_nway_reset,
+-	.get_link		=3D ep93xx_get_link,
++  .get_link   =3D ethtool_op_get_link,
+ };
+=20
+ struct net_device *ep93xx_dev_alloc(struct ep93xx_eth_data *data)
+@@ -824,12 +882,122 @@ static int ep93xx_eth_remove(struct platform_devi=
ce *pdev)
+ 	return 0;
+ }
+=20
++static void ep93xx_adjust_link(struct net_device *dev)
++{
++  struct ep93xx_priv *ep =3D netdev_priv(dev);
++  struct phy_device *phydev =3D ep->phy_dev;
++
++  int status_change =3D 0;
++
++  if (phydev->link) {
++    if ((ep->speed !=3D phydev->speed) ||
++        (ep->duplex !=3D phydev->duplex)) {
++      /* speed and/or duplex state changed */
++      u32 testctl =3D rdl(ep, REG_TESTCTL);
++
++      if (DUPLEX_FULL =3D=3D phydev->duplex)
++        testctl |=3D REG_TESTCTL_MFDX;
++      else
++        testctl &=3D ~(REG_TESTCTL_MFDX);
++
++      wrl(ep, REG_TESTCTL, testctl);
++
++      ep->speed =3D phydev->speed;
++      ep->duplex =3D phydev->duplex;
++      status_change =3D 1;
++    }
++  }
++
++  /* test for online/offline link transition */
++  if (phydev->link !=3D ep->link) {
++    if (phydev->link) /* link went online */
++      netif_tx_schedule_all(dev);
++    else { /* link went offline */
++      ep->speed =3D 0;
++      ep->duplex =3D -1;
++    }
++    ep->link =3D phydev->link;
++
++    status_change =3D 1;
++  }
++
++  if (status_change)
++    phy_print_status(phydev);
++}
++
++static int ep93xx_mii_probe(struct net_device *dev, int phy_addr)
++{
++  struct ep93xx_priv *ep =3D netdev_priv(dev);
++  struct phy_device *phydev =3D NULL;
++  int val;
++
++  if (phy_addr >=3D 0 && phy_addr < PHY_MAX_ADDR)
++    phydev =3D ep->mii_bus.phy_map[phy_addr];
++
++  if (!phydev) {
++    dev_info(&dev->dev,
++       "PHY not found at specified address,"
++       " trying autodetection\n");
++
++    /* find the first phy */
++    for (phy_addr =3D 0; phy_addr < PHY_MAX_ADDR; phy_addr++) {
++      if (ep->mii_bus.phy_map[phy_addr]) {
++        phydev =3D ep->mii_bus.phy_map[phy_addr];
++        break;
++      }
++    }
++  }
++
++  if (!phydev) {
++    dev_err(&dev->dev, "no PHY found\n");
++    return -ENODEV;
++  }
++
++  phydev =3D phy_connect(dev, phydev->dev.bus_id,
++           ep93xx_adjust_link, 0, PHY_INTERFACE_MODE_MII);
++
++  if (IS_ERR(phydev)) {
++    dev_err(&dev->dev, "Could not attach to PHY\n");
++    return PTR_ERR(phydev);
++  }
++
++  ep->phy_supports_mfps =3D 0;
++
++  val =3D phy_read(phydev, MII_BMSR);
++  if (val < 0) {
++    dev_err(&phydev->dev, "failed to read MII register\n");
++    return val;
++  }
++
++  if (val & 0x0040) {
++    dev_info(&phydev->dev,
++       "PHY supports MII frame preamble suppression\n");
++    ep->phy_supports_mfps =3D 1;
++  }
++
++  phydev->supported &=3D PHY_BASIC_FEATURES;
++
++  phydev->advertising =3D phydev->supported;
++
++  ep->link =3D 0;
++  ep->speed =3D 0;
++  ep->duplex =3D -1;
++  ep->phy_dev =3D phydev;
++
++  dev_info(&dev->dev, "attached PHY driver [%s] "
++     "(mii_bus:phy_addr=3D%s, irq=3D%d)\n",
++     phydev->drv->name, phydev->dev.bus_id, phydev->irq);
++
++  return 0;
++}
++
+ static int ep93xx_eth_probe(struct platform_device *pdev)
+ {
+ 	struct ep93xx_eth_data *data;
+ 	struct net_device *dev;
+ 	struct ep93xx_priv *ep;
+-	int err;
++  DECLARE_MAC_BUF(mac_buf);
++  int err, i;
+=20
+ 	if (pdev =3D=3D NULL)
+ 		return -ENODEV;
+@@ -852,7 +1020,7 @@ static int ep93xx_eth_probe(struct platform_device =
*pdev)
+ 	if (ep->res =3D=3D NULL) {
+ 		dev_err(&pdev->dev, "Could not reserve memory region\n");
+ 		err =3D -ENOMEM;
+-		goto err_out;
++    goto err_out_request_mem_region;
+ 	}
+=20
+ 	ep->base_addr =3D ioremap(pdev->resource[0].start,
+@@ -860,34 +1028,74 @@ static int ep93xx_eth_probe(struct platform_devic=
e *pdev)
+ 	if (ep->base_addr =3D=3D NULL) {
+ 		dev_err(&pdev->dev, "Failed to ioremap ethernet registers\n");
+ 		err =3D -EIO;
+-		goto err_out;
++    goto err_out_ioremap;
+ 	}
+ 	ep->irq =3D pdev->resource[1].start;
+=20
+-	ep->mii.phy_id =3D data->phy_id;
+-	ep->mii.phy_id_mask =3D 0x1f;
+-	ep->mii.reg_num_mask =3D 0x1f;
+-	ep->mii.dev =3D dev;
+-	ep->mii.mdio_read =3D ep93xx_mdio_read;
+-	ep->mii.mdio_write =3D ep93xx_mdio_write;
++  /* mdio/mii bus */
++  ep->mii_bus.name =3D "ep93xx_mii_bus";
++  snprintf(ep->mii_bus.id, MII_BUS_ID_SIZE, "0");
++
++  ep->mii_bus.read =3D ep93xx_mdio_read;
++  ep->mii_bus.write =3D ep93xx_mdio_write;
++  ep->mii_bus.reset =3D ep93xx_mdio_reset;
++
++  ep->mii_bus.phy_mask =3D 0;
++
++  ep->mii_bus.priv =3D ep;
++  ep->mii_bus.dev =3D &dev->dev;
++
++  ep->mii_bus.irq =3D kmalloc(sizeof(int)*PHY_MAX_ADDR, GFP_KERNEL);
++  if (NULL =3D=3D ep->mii_bus.irq) {
++    dev_err(&pdev->dev, "Could not allocate memory\n");
++    err =3D -ENOMEM;
++    goto err_out_mii_bus_irq_kmalloc;
++  }
++
++  for (i =3D 0; i < PHY_MAX_ADDR; i++)
++    ep->mii_bus.irq[i] =3D PHY_POLL;
++
+ 	ep->mdc_divisor =3D 40;	/* Max HCLK 100 MHz, min MDIO clk 2.5 MHz.  */
++  ep->phy_supports_mfps =3D 0; /* probe without preamble suppression */
+=20
+ 	err =3D register_netdev(dev);
+ 	if (err) {
+ 		dev_err(&pdev->dev, "Failed to register netdev\n");
+-		goto err_out;
++    goto err_out_register_netdev;
+ 	}
+=20
+-	printk(KERN_INFO "%s: ep93xx on-chip ethernet, IRQ %d, "
+-			 "%.2x:%.2x:%.2x:%.2x:%.2x:%.2x.\n", dev->name,
+-			ep->irq, data->dev_addr[0], data->dev_addr[1],
+-			data->dev_addr[2], data->dev_addr[3],
+-			data->dev_addr[4], data->dev_addr[5]);
++  err =3D mdiobus_register(&ep->mii_bus);
++  if (err) {
++    dev_err(&dev->dev, "Could not register MII bus\n");
++    goto err_out_mdiobus_register;
++  }
++
++  err =3D ep93xx_mii_probe(dev, data->phy_id);
++  if (err) {
++    dev_err(&dev->dev, "failed to probe MII bus\n");
++    goto err_out_mii_probe;
++  }
++
++  dev_info(&dev->dev, "ep93xx on-chip ethernet, IRQ %d, %s\n",
++     ep->irq, print_mac(mac_buf, dev->dev_addr));
+=20
+ 	return 0;
+=20
++err_out_mii_probe:
++  mdiobus_unregister(&ep->mii_bus);
++err_out_mdiobus_register:
++  unregister_netdev(dev);
++err_out_register_netdev:
++  kfree(ep->mii_bus.irq);
++err_out_mii_bus_irq_kmalloc:
++  iounmap(ep->base_addr);
++err_out_ioremap:
++  release_resource(ep->res);
++  kfree(ep->res);
++err_out_request_mem_region:
++  free_netdev(dev);
+ err_out:
+-	ep93xx_eth_remove(pdev);
++
+ 	return err;
+ }
+=20
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0012-TS72xx-watchdog.patch=
 b/recipes/linux/linux-2.6.27/ts72xx/0012-TS72xx-watchdog.patch
new file mode 100644
index 0000000..6682203
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0012-TS72xx-watchdog.patch
@@ -0,0 +1,451 @@
+From 0e804ab442879a1d9c70695e5a5c0ffc87cbca8b Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 01:15:14 +0100
+Subject: [PATCH] TS72xx watchdog
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/ts72xx.h |    7 +
+ arch/arm/mach-ep93xx/ts72xx.c              |   21 ++
+ drivers/watchdog/Kconfig                   |   12 +
+ drivers/watchdog/Makefile                  |    1 +
+ drivers/watchdog/ts72xx_wdt.c              |  332 +++++++++++++++++++++=
+++++++
+ 5 files changed, 373 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/watchdog/ts72xx_wdt.c
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-=
ep93xx/include/mach/ts72xx.h
+index 99c4e48..bb67506 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+@@ -79,6 +79,13 @@
+ #define TS72XX_RTC_DATA_PHYS_BASE	0x11700000
+ #define TS72XX_RTC_DATA_SIZE		0x00001000
+=20
++#define TS72XX_WATCHDOG_CONTROL_VIRT_BASE	0xfebf7000
++#define TS72XX_WATCHDOG_CONTROL_PHYS_BASE	0x23800000
++#define TS72XX_WATCHDOG_CONTROL_SIZE	0x00001000
++
++#define TS72XX_WATCHDOG_FEED_VIRT_BASE	0xfebf6000
++#define TS72XX_WATCHDOG_FEED_PHYS_BASE	0x23c00000
++#define TS72XX_WATCHDOG_FEED_SIZE	0x00001000
+=20
+ #ifndef __ASSEMBLY__
+ #include <asm/io.h>
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index c3cbff1..1e933bc 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -183,6 +183,26 @@ static struct platform_device ts72xx_eth_device =3D=
 {
+ 	.resource	=3D ts72xx_eth_resource,
+ };
+=20
++static struct resource ts72xx_watchdog_resources[] =3D {
++	[0] =3D {
++		.start  =3D TS72XX_WATCHDOG_CONTROL_PHYS_BASE,
++		.end  =3D TS72XX_WATCHDOG_CONTROL_PHYS_BASE + 0x0fff,
++		.flags  =3D IORESOURCE_MEM,
++	},
++	[1] =3D {
++		.start  =3D TS72XX_WATCHDOG_FEED_PHYS_BASE,
++		.end  =3D TS72XX_WATCHDOG_FEED_PHYS_BASE + 0x0fff,
++		.flags  =3D IORESOURCE_MEM,
++	},
++};
++
++static struct platform_device ts72xx_watchdog_device =3D {
++	.name =3D "ts72xx-wdt",
++	.id   =3D -1,
++	.num_resources  =3D ARRAY_SIZE(ts72xx_watchdog_resources),
++	.resource =3D ts72xx_watchdog_resources,
++};
++
+ static void __init ts72xx_init_machine(void)
+ {
+ 	ep93xx_init_devices();
+@@ -193,6 +213,7 @@ static void __init ts72xx_init_machine(void)
+ 	memcpy(ts72xx_eth_data.dev_addr,
+ 		(void *)(EP93XX_ETHERNET_BASE + 0x50), 6);
+ 	platform_device_register(&ts72xx_eth_device);
++	platform_device_register(&ts72xx_watchdog_device);
+ }
+=20
+ MACHINE_START(TS72XX, "Technologic Systems TS-72xx SBC")
+diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
+index c510367..fac3093 100644
+--- a/drivers/watchdog/Kconfig
++++ b/drivers/watchdog/Kconfig
+@@ -217,6 +217,18 @@ config DAVINCI_WATCHDOG
+ 	  NOTE: once enabled, this timer cannot be disabled.
+ 	  Say N if you are unsure.
+=20
++config TS72XX_WATCHDOG
++	tristate "TS-72xx Watchdog"
++	depends on WATCHDOG && ARCH_EP93XX && MACH_TS72XX
++	help
++	  Say Y here if to include support for the CPLD watchdog
++	  included on Technologic Systems SBC.
++
++	  NOTE: timeout value is given in milliseconds, not in seconds.
++
++	  To compile this driver as a module, choose M here: the
++	  module will be called ts72xx_wdt.
++
+ # ARM26 Architecture
+=20
+ # AVR32 Architecture
+diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
+index e0ef123..890024b 100644
+--- a/drivers/watchdog/Makefile
++++ b/drivers/watchdog/Makefile
+@@ -39,6 +39,7 @@ obj-$(CONFIG_EP93XX_WATCHDOG) +=3D ep93xx_wdt.o
+ obj-$(CONFIG_PNX4008_WATCHDOG) +=3D pnx4008_wdt.o
+ obj-$(CONFIG_IOP_WATCHDOG) +=3D iop_wdt.o
+ obj-$(CONFIG_DAVINCI_WATCHDOG) +=3D davinci_wdt.o
++obj-$(CONFIG_TS72XX_WATCHDOG) +=3D ts72xx_wdt.o
+=20
+ # ARM26 Architecture
+=20
+diff --git a/drivers/watchdog/ts72xx_wdt.c b/drivers/watchdog/ts72xx_wdt=
.c
+new file mode 100644
+index 0000000..7cbac78
+--- /dev/null
++++ b/drivers/watchdog/ts72xx_wdt.c
+@@ -0,0 +1,332 @@
++/*
++ *	TS-72xx Watchdog Driver for Technologic Systems boards.
++ *
++ *  Based on ep93xx_wdt.c by Lehtiniemi <rayl@mail.com> &
++ *      Alessandro Zummo <a.zummo@towertech.it>
++ *  and ib700wdt.c by Charles Howes <chowes@vsol.net>
++ *  and mpc83xx_wdt.c by Dave Updegraff <dave@cray.org> &
++ *      Kumar Gala <galak@kernel.crashing.org>
++ *
++ *	(c) Copyright 2006  Matthieu Crapet <mcrapet@gmail.com>
++ *
++ *	This program is free software; you can redistribute it and/or
++ *	modify it under the terms of the GNU General Public License
++ *	as published by the Free Software Foundation; either version
++ *	2 of the License, or (at your option) any later version.
++ *
++ * This driver only deals with native timeout provided by CPLD :
++ * 1/4s, 1/2s, 1s, 2s, 4s and 8s. No external timer is used.
++ * Notice that we must ping before modifying the control register.
++ */
++
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/types.h>
++#include <linux/kernel.h>
++#include <linux/fs.h>
++#include <linux/miscdevice.h>
++#include <linux/platform_device.h>
++#include <linux/init.h>
++#include <linux/watchdog.h>
++#include <asm/io.h>
++#include <asm/uaccess.h>
++#include <asm/system.h>
++#include <asm/mach-types.h>
++
++#define WATCHDOG_VERSION "0.2"
++#define PFX "ts72xx_wdt: "
++
++#define WATCHDOG_TIMEOUT 8000 /* 8 seconds */
++#define WDT_IN_USE      0
++#define WDT_OK_TO_CLOSE 1
++
++static unsigned long ts72xx_wdt_status;
++static unsigned char ts72xx_wdt_cpld_value =3D 0x7;
++static int nowayout =3D WATCHDOG_NOWAYOUT;
++static int timeout =3D WATCHDOG_TIMEOUT;
++
++static int ts72xx_wdt_times[12] =3D {
++	6000, 3000, 1500, 750, 275, 0,
++	8000, 4000, 2000, 1000, 500, 250
++};
++
++static void __iomem *control_register;
++static void __iomem *feed_register;
++
++
++/*
++ *	Kernel methods.
++ */
++
++static inline void ts72xx_wdt_ping(void)
++{
++	__raw_writew(0x05, feed_register);
++}
++
++static inline void ts72xx_wdt_enable(void)
++{
++	__raw_writew(0x05, feed_register);
++	__raw_writew(ts72xx_wdt_cpld_value, control_register);
++}
++
++static inline void ts72xx_wdt_disable(void)
++{
++	__raw_writew(0x05, feed_register);
++	__raw_writew(0, control_register);
++}
++
++static inline void ts72xx_parse_timeout(int value)
++{
++	unsigned char cpld_value =3D 0x7;
++	int i;
++
++	if ((value > 8000) || (value < 250)) {
++		timeout =3D WATCHDOG_TIMEOUT;
++		printk(KERN_INFO PFX "Timeout value out of range, set to %d\n", timeo=
ut);
++	} else {
++		for (i =3D 0; i < 6; i++) {
++			if (value >=3D ts72xx_wdt_times[i]) {
++				timeout =3D ts72xx_wdt_times[i+6];
++
++				if (value !=3D timeout)
++					printk(KERN_INFO PFX "Timeout value rounded to %d\n", timeout);
++
++				if (i >=3D 3) /* cpld_value can't be 4 */
++					i++;
++
++				cpld_value =3D 7 - i;
++				break;
++			}
++		}
++	}
++
++	ts72xx_wdt_cpld_value =3D cpld_value;
++}
++
++static ssize_t ts72xx_wdt_write(struct file *file, const char __user *b=
uf,
++				 size_t count, loff_t *ppos)
++{
++	/* Can't seek (pwrite) on this device */
++	if (*ppos !=3D file->f_pos)
++		return -ESPIPE;
++
++	if (count) {
++		if (!nowayout) {
++			size_t i;
++
++			clear_bit(WDT_OK_TO_CLOSE, &ts72xx_wdt_status);
++
++			for (i =3D 0; i !=3D count; i++) {
++				char c;
++
++				if (get_user(c, buf + i))
++					return -EFAULT;
++
++				if (c =3D=3D 'V')
++					set_bit(WDT_OK_TO_CLOSE, &ts72xx_wdt_status);
++				else
++					clear_bit(WDT_OK_TO_CLOSE, &ts72xx_wdt_status);
++			}
++		}
++		ts72xx_wdt_ping();
++	}
++
++	return count;
++}
++
++static int ts72xx_wdt_ioctl(struct inode *inode, struct file *file,
++			     unsigned int cmd, unsigned long arg)
++{
++	int new_margin;
++	int ret =3D -ENOIOCTLCMD;
++
++	static struct watchdog_info ident =3D {
++		.options =3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOS=
E,
++		.firmware_version =3D 1,
++		.identity =3D "TS-72xx Watchdog",
++	};
++
++	switch (cmd) {
++		case WDIOC_GETSUPPORT:
++			ret =3D copy_to_user((struct watchdog_info __user *)arg, &ident,
++			sizeof(ident)) ? -EFAULT : 0;
++			break;
++
++		case WDIOC_GETSTATUS:
++		case WDIOC_GETBOOTSTATUS:
++			ret =3D put_user(0, (int __user *)arg);
++			break;
++
++		case WDIOC_KEEPALIVE:
++			ts72xx_wdt_ping();
++			ret =3D 0;
++			break;
++
++		case WDIOC_SETTIMEOUT:
++			if (get_user(new_margin, (int __user *)arg))
++				return -EFAULT;
++
++			ts72xx_parse_timeout(new_margin);
++			ts72xx_wdt_enable();
++			/* Fall */
++
++		case WDIOC_GETTIMEOUT:
++			ret =3D put_user(timeout, (int __user *)arg);
++			break;
++	}
++
++	return ret;
++}
++
++static int ts72xx_wdt_open(struct inode *inode, struct file *file)
++{
++	if (test_and_set_bit(WDT_IN_USE, &ts72xx_wdt_status))
++		return -EBUSY;
++
++	if (nowayout) {
++		__module_get(THIS_MODULE);
++	}
++
++	ts72xx_wdt_enable();
++	ts72xx_wdt_ping();
++
++	return nonseekable_open(inode, file);
++}
++
++static int ts72xx_wdt_close(struct inode *inode, struct file *file)
++{
++	if (test_bit(WDT_OK_TO_CLOSE, &ts72xx_wdt_status))
++		ts72xx_wdt_disable();
++	else
++		printk(KERN_CRIT PFX "Device file closed unexpectedly. "
++		       "Will not stop the WDT!\n");
++
++	clear_bit(WDT_IN_USE, &ts72xx_wdt_status);
++
++	return 0;
++}
++
++/*
++ *	Kernel Interfaces
++ */
++
++static struct file_operations ts72xx_wdt_fops =3D {
++	.owner		=3D THIS_MODULE,
++	.llseek		=3D no_llseek,
++	.write		=3D ts72xx_wdt_write,
++	.ioctl		=3D ts72xx_wdt_ioctl,
++	.open		=3D ts72xx_wdt_open,
++	.release	=3D ts72xx_wdt_close,
++};
++
++static struct miscdevice ts72xx_wdt_miscdev =3D {
++	.minor =3D WATCHDOG_MINOR,
++	.name =3D "watchdog",
++	.fops =3D &ts72xx_wdt_fops,
++};
++
++static void ts72xx_wdt_shutdown(struct platform_device *dev)
++{
++	ts72xx_wdt_disable();
++}
++
++static int __devinit ts72xx_wdt_probe(struct platform_device *dev)
++{
++	struct resource *r;
++	int ret;
++
++	if (!machine_is_ts72xx())
++		return -ENODEV;
++
++	r =3D platform_get_resource(dev, IORESOURCE_MEM, 0);
++
++	if (!r) {
++		ret =3D -ENODEV;
++		goto err_out;
++	}
++
++	control_register =3D ioremap(r->start, r->end - r->start + 1);
++
++	if (control_register =3D=3D NULL) {
++		ret =3D -ENOMEM;
++		goto err_out;
++	}
++
++	r =3D platform_get_resource(dev, IORESOURCE_MEM, 1);
++
++	if (!r) {
++		ret =3D -ENODEV;
++		goto err_unmap1;
++	}
++
++	feed_register =3D ioremap(r->start, r->end - r->start + 1);
++
++	if (feed_register =3D=3D NULL) {
++		ret =3D -ENOMEM;
++		goto err_unmap1;
++	}
++
++	ret =3D misc_register(&ts72xx_wdt_miscdev);
++	if (ret) {
++		printk(KERN_ERR PFX "cannot register miscdev on minor=3D%d "
++		       "(err=3D%d)\n", WATCHDOG_MINOR, ret);
++		goto err_unmap2;
++	}
++
++	printk(KERN_INFO PFX "TS-72xx watchdog driver, v%s\n", WATCHDOG_VERSIO=
N);
++	ts72xx_parse_timeout(timeout);
++
++	return 0;
++
++err_unmap2:
++	iounmap(feed_register);
++err_unmap1:
++	iounmap(control_register);
++err_out:
++	return ret;
++}
++
++static int __devexit ts72xx_wdt_remove(struct platform_device *dev)
++{
++	misc_deregister(&ts72xx_wdt_miscdev);
++	iounmap(feed_register);
++	iounmap(control_register);
++
++	return 0;
++}
++
++static struct platform_driver ts72xx_wdt_driver =3D {
++	.probe		=3D ts72xx_wdt_probe,
++	.remove		=3D __devexit_p(ts72xx_wdt_remove),
++	.shutdown	=3D ts72xx_wdt_shutdown,
++	.driver	=3D {
++		.owner	=3D THIS_MODULE,
++		.name	=3D "ts72xx-wdt",
++	},
++};
++
++static int __init ts72xx_wdt_init(void)
++{
++	return platform_driver_register(&ts72xx_wdt_driver);
++}
++
++static void __exit ts72xx_wdt_exit(void)
++{
++	platform_driver_unregister(&ts72xx_wdt_driver);
++}
++
++module_init(ts72xx_wdt_init);
++module_exit(ts72xx_wdt_exit);
++
++#ifdef CONFIG_WATCHDOG_NOWAYOUT
++module_param(nowayout, int, 0);
++MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (de=
fault=3DCONFIG_WATCHDOG_NOWAYOUT)");
++#endif
++
++module_param(timeout, int, 0);
++MODULE_PARM_DESC(timeout,"Watchdog timeout in milliseconds (250..8000, =
default=3D" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("TS-72xx watchdog driver");
++MODULE_LICENSE("GPL");
++MODULE_ALIAS_MISCDEV(WATCHDOG_MINOR);
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0013-TS7200-NOR-physmap-fi=
x.patch b/recipes/linux/linux-2.6.27/ts72xx/0013-TS7200-NOR-physmap-fix.p=
atch
new file mode 100644
index 0000000..57ae166
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0013-TS7200-NOR-physmap-fix.patch
@@ -0,0 +1,58 @@
+From bd9ea2dfdce02b9c941073bf5d51d5f18a28d101 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 01:21:24 +0100
+Subject: [PATCH] TS7200 NOR physmap fix
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/ts72xx.c |   10 ++++++++--
+ 1 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index 1e933bc..a9d3939 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -111,13 +111,14 @@ static void __init ts72xx_map_io(void)
+ 	}
+ }
+=20
++#if defined(CONFIG_MTD_PHYSMAP) || defined(CONFIG_MTD_PHYSMAP_MODULE)
+ static struct physmap_flash_data ts72xx_flash_data =3D {
+-	.width		=3D 1,
++	.width		=3D 2,
+ };
+=20
+ static struct resource ts72xx_flash_resource =3D {
+ 	.start		=3D TS72XX_NOR_PHYS_BASE,
+-	.end		=3D TS72XX_NOR_PHYS_BASE + 0x00ffffff,
++	.end		=3D TS72XX_NOR_PHYS_BASE + SZ_16M - 1,   /* SZ_8M for 8mb flash =
*/
+ 	.flags		=3D IORESOURCE_MEM,
+ };
+=20
+@@ -130,6 +131,7 @@ static struct platform_device ts72xx_flash =3D {
+ 	.num_resources	=3D 1,
+ 	.resource	=3D &ts72xx_flash_resource,
+ };
++#endif
+=20
+ static unsigned char ts72xx_rtc_readbyte(unsigned long addr)
+ {
+@@ -206,8 +208,12 @@ static struct platform_device ts72xx_watchdog_devic=
e =3D {
+ static void __init ts72xx_init_machine(void)
+ {
+ 	ep93xx_init_devices();
++
++	#if defined(CONFIG_MTD_PHYSMAP) || defined(CONFIG_MTD_PHYSMAP_MODULE)
+ 	if (board_is_ts7200())
+ 		platform_device_register(&ts72xx_flash);
++	#endif
++
+ 	platform_device_register(&ts72xx_rtc_device);
+=20
+ 	memcpy(ts72xx_eth_data.dev_addr,
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0014-TS-7200-8MB-NOR-flash=
.patch b/recipes/linux/linux-2.6.27/ts72xx/0014-TS-7200-8MB-NOR-flash.pat=
ch
new file mode 100644
index 0000000..95795b4
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0014-TS-7200-8MB-NOR-flash.patch
@@ -0,0 +1,163 @@
+From ba4ba164344096ae7bea45891e99f3630ec6879a Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 01:23:06 +0100
+Subject: [PATCH] TS-7200 8MB NOR flash
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/mtd/maps/Kconfig        |    8 +++
+ drivers/mtd/maps/Makefile       |    2 +
+ drivers/mtd/maps/ts7200_flash.c |  109 ++++++++++++++++++++++++++++++++=
+++++++
+ 3 files changed, 119 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/mtd/maps/ts7200_flash.c
+
+diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
+index df8e00b..818f53b 100644
+--- a/drivers/mtd/maps/Kconfig
++++ b/drivers/mtd/maps/Kconfig
+@@ -481,6 +481,14 @@ config MTD_OMAP_NOR
+ 	  These boards include the Innovator, H2, H3, OSK, Perseus2, and
+ 	  more.  If you have such a board, say 'Y'.
+=20
++config MTD_TS7200_NOR
++	tristate "Technologic Systems TS-7200 flash 8Mb"
++	depends on MTD_CFI && ARCH_EP93XX
++	help
++	  This provides a driver for the on-board flash of the Technologic
++	  System's TS-7200 board. The 8MB flash is splitted into 3 partitions
++	  which are accessed as separate MTD devices.
++
+ # This needs CFI or JEDEC, depending on the cards found.
+ config MTD_PCI
+ 	tristate "PCI MTD driver"
+diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
+index 6cda6df..8fe5e72 100644
+--- a/drivers/mtd/maps/Makefile
++++ b/drivers/mtd/maps/Makefile
+@@ -65,3 +65,5 @@ obj-$(CONFIG_MTD_PLATRAM)	+=3D plat-ram.o
+ obj-$(CONFIG_MTD_OMAP_NOR)	+=3D omap_nor.o
+ obj-$(CONFIG_MTD_INTEL_VR_NOR)	+=3D intel_vr_nor.o
+ obj-$(CONFIG_MTD_BFIN_ASYNC)	+=3D bfin-async-flash.o
++obj-$(CONFIG_MTD_TS7200_NOR)	+=3D ts7200_flash.o
++
+diff --git a/drivers/mtd/maps/ts7200_flash.c b/drivers/mtd/maps/ts7200_f=
lash.c
+new file mode 100644
+index 0000000..9113abd
+--- /dev/null
++++ b/drivers/mtd/maps/ts7200_flash.c
+@@ -0,0 +1,109 @@
++/*
++ * ts7200_flash.c - mapping for TS-7200 SBCs (8mb NOR flash)
++ * No platform_device resource is used here. All is hardcoded.
++ *
++ * (c) Copyright 2006  Matthieu Crapet <mcrapet@gmail.com>
++ * Based on ts5500_flash.c by Sean Young <sean@mess.org>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version
++ * 2 of the License, or (at your option) any later version.
++ */
++
++#include <linux/module.h>
++#include <linux/types.h>
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <asm/io.h>
++#include <asm/sizes.h>
++#include <linux/mtd/mtd.h>
++#include <linux/mtd/map.h>
++#include <linux/mtd/partitions.h>
++
++#define STRINGIFY(x) #x
++#define TOSTRING(x) STRINGIFY(x)
++
++#define WINDOW_ADDR          0x60000000
++#define WINDOW_SIZE          SZ_8M
++#define WINDOW_READABLE_SIZE (WINDOW_SIZE/SZ_1M)
++
++
++static struct mtd_info *mymtd;
++
++static struct map_info ts7200nor_map =3D {
++  .name =3D "Full TS-7200 NOR flash",
++  .size =3D WINDOW_SIZE,
++  .bankwidth =3D 2,
++  .phys =3D WINDOW_ADDR,
++};
++
++/*
++ * MTD partitioning stuff
++ */
++#ifdef CONFIG_MTD_PARTITIONS
++static struct mtd_partition static_partitions[] =3D
++{
++  {
++    .name   =3D "TS-BOOTROM",
++    .offset =3D 0,
++    .size   =3D 0x20000,
++    .mask_flags =3D MTD_WRITEABLE,  /* force read-only */
++  },
++  {
++    .name   =3D "RootFS",
++    .offset =3D 0x20000,
++    .size   =3D 0x600000,
++  },
++  {
++    .name   =3D "Redboot",
++    .offset =3D 0x620000,
++    .size   =3D MTDPART_SIZ_FULL,   /* up to the end */
++  },
++};
++#endif
++
++int __init init_ts7200nor(void)
++{
++  printk(KERN_NOTICE "TS-7200 flash mapping: %dmo at 0x%x\n", WINDOW_RE=
ADABLE_SIZE, WINDOW_ADDR);
++
++  ts7200nor_map.virt =3D ioremap(WINDOW_ADDR, WINDOW_SIZE);
++  if (!ts7200nor_map.virt) {
++    printk("ts7200_flash: failed to ioremap\n");
++    return -EIO;
++  }
++
++  simple_map_init(&ts7200nor_map);
++  mymtd =3D do_map_probe("cfi_probe", &ts7200nor_map);
++  if (mymtd) {
++    mymtd->owner =3D THIS_MODULE;
++    add_mtd_device(mymtd);
++#ifdef CONFIG_MTD_PARTITIONS
++    return add_mtd_partitions(mymtd, static_partitions, ARRAY_SIZE(stat=
ic_partitions));
++#else
++    return 0;
++#endif
++  }
++
++  iounmap((void *)ts7200nor_map.virt);
++  return -ENXIO;
++}
++
++static void __exit cleanup_ts7200nor(void)
++{
++  if (mymtd) {
++    del_mtd_device(mymtd);
++    map_destroy(mymtd);
++  }
++  if (ts7200nor_map.virt) {
++    iounmap((void *)ts7200nor_map.virt);
++    ts7200nor_map.virt =3D 0;
++  }
++}
++
++module_init(init_ts7200nor);
++module_exit(cleanup_ts7200nor);
++
++MODULE_LICENSE("GPL");
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("MTD map driver for TS-7200 board (" TOSTRING(WINDOW=
_READABLE_SIZE) "MB flash version)");
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0015-TS-72xx-MAX197-suppor=
t.patch b/recipes/linux/linux-2.6.27/ts72xx/0015-TS-72xx-MAX197-support.p=
atch
new file mode 100644
index 0000000..0469920
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0015-TS-72xx-MAX197-support.patch
@@ -0,0 +1,365 @@
+From 7220a7235e7b6722fb7dc6e8f599a20bac224760 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 01:32:39 +0100
+Subject: [PATCH] TS-72xx MAX197 support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/ts72xx.h |    8 +
+ arch/arm/mach-ep93xx/ts72xx.c              |   27 ++++
+ drivers/misc/Kconfig                       |   21 +++
+ drivers/misc/Makefile                      |    1 +
+ drivers/misc/ts72xx_max197.c               |  235 +++++++++++++++++++++=
+++++++
+ 5 files changed, 292 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/misc/ts72xx_max197.c
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-=
ep93xx/include/mach/ts72xx.h
+index bb67506..28372df 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+@@ -87,6 +87,14 @@
+ #define TS72XX_WATCHDOG_FEED_PHYS_BASE	0x23c00000
+ #define TS72XX_WATCHDOG_FEED_SIZE	0x00001000
+=20
++#define TS72XX_JUMPERS_MAX197_VIRT_BASE	0xfebf2000
++#define TS72XX_JUMPERS_MAX197_PHYS_BASE	0x10800000
++#define TS72XX_JUMPERS_MAX197_SIZE	0x00001000
++
++#define TS72XX_MAX197_SAMPLE_VIRT_BASE	0xfebf1000
++#define TS72XX_MAX197_SAMPLE_PHYS_BASE	0x10f00000
++#define TS72XX_MAX197_SAMPLE_SIZE	0x00001000
++
+ #ifndef __ASSEMBLY__
+ #include <asm/io.h>
+=20
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index a9d3939..ea3deeb 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -205,6 +205,29 @@ static struct platform_device ts72xx_watchdog_devic=
e =3D {
+ 	.resource =3D ts72xx_watchdog_resources,
+ };
+=20
++static struct resource ts72xx_max197_resources[] =3D {
++	[0] =3D { /* sample/control register */
++		.start =3D TS72XX_MAX197_SAMPLE_PHYS_BASE,
++		.end   =3D TS72XX_MAX197_SAMPLE_PHYS_BASE + TS72XX_MAX197_SAMPLE_SIZE=
 - 1,
++		.flags =3D IORESOURCE_MEM,
++	},
++	[1] =3D { /* busy bit */
++		.start =3D TS72XX_JUMPERS_MAX197_PHYS_BASE,
++		.end   =3D TS72XX_JUMPERS_MAX197_PHYS_BASE + TS72XX_JUMPERS_MAX197_SI=
ZE - 1,
++		.flags =3D IORESOURCE_MEM,
++	},
++};
++
++static struct platform_device ts72xx_max197_device =3D {
++	.name =3D "ts72xx-max197",
++	.id   =3D -1,
++	.dev  =3D {
++		.platform_data  =3D NULL,
++	},
++	.num_resources  =3D ARRAY_SIZE(ts72xx_max197_resources),
++	.resource =3D ts72xx_max197_resources,
++};
++
+ static void __init ts72xx_init_machine(void)
+ {
+ 	ep93xx_init_devices();
+@@ -220,6 +243,10 @@ static void __init ts72xx_init_machine(void)
+ 		(void *)(EP93XX_ETHERNET_BASE + 0x50), 6);
+ 	platform_device_register(&ts72xx_eth_device);
+ 	platform_device_register(&ts72xx_watchdog_device);
++
++	if (is_max197_installed()) {
++		platform_device_register(&ts72xx_max197_device);
++	}
+ }
+=20
+ MACHINE_START(TS72XX, "Technologic Systems TS-72xx SBC")
+diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
+index a726f3b..4c696c6 100644
+--- a/drivers/misc/Kconfig
++++ b/drivers/misc/Kconfig
+@@ -475,4 +475,25 @@ config SGI_GRU_DEBUG
+ 	This option enables addition debugging code for the SGI GRU driver. If
+ 	you are unsure, say N.
+=20
++config TS72XX_MAX197
++	tristate "TS-72xx MAX197 support"
++	depends on ARCH_EP93XX && MACH_TS72XX && SYSFS
++	help
++	  Say Y here if to include support for the MAX197 A/D converter
++	  optionally included on Technologic Systems SBCs.
++	  Default acquisition range is [0..5V].
++
++	  To compile this driver as a module, choose M here: the
++	  module will be called ts72xx_max197.
++
++if TS72XX_MAX197
++
++config TS72XX_MAX197_AVERAGE
++	bool "Average measurement"
++	help
++	  Say Y here to enable making average measurement. Default is 1.
++	  See /sys/module/ts72xx_max197/parameters/average file.
++
++endif # TS72XX_MAX197
++
+ endif # MISC_DEVICES
+diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
+index c6c13f6..d97326f 100644
+--- a/drivers/misc/Makefile
++++ b/drivers/misc/Makefile
+@@ -30,3 +30,4 @@ obj-$(CONFIG_KGDB_TESTS)	+=3D kgdbts.o
+ obj-$(CONFIG_SGI_XP)		+=3D sgi-xp/
+ obj-$(CONFIG_SGI_GRU)		+=3D sgi-gru/
+ obj-$(CONFIG_HP_ILO)		+=3D hpilo.o
++obj-$(CONFIG_TS72XX_MAX197)	+=3D ts72xx_max197.o
+diff --git a/drivers/misc/ts72xx_max197.c b/drivers/misc/ts72xx_max197.c
+new file mode 100644
+index 0000000..f989de6
+--- /dev/null
++++ b/drivers/misc/ts72xx_max197.c
+@@ -0,0 +1,235 @@
++/*
++ *  TS-72XX max197 driver for Technologic Systems boards.
++ *
++ * Voltage conversion is taken from adc_logger from Jim Jackson.
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version
++ * 2 of the License, or (at your option) any later version.
++ */
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <asm/io.h>
++
++#define DRV_VERSION "0.2"
++#define PFX "ts72xx_max197: "
++
++#define MAX197_RANGE_5_5   1 // [- 5V + 5V]
++#define MAX197_RANGE_10_10 3 // [-10V +10V]
++#define MAX197_RANGE_0_5   0 // [  0V + 5V]
++#define MAX197_RANGE_0_10  2 // [  0V +10V]
++
++#define MAX197_RESET_CHANNEL_CONF(x)       (~(3 << (2*(x))))
++#define MAX197_SET_CHANNEL_CONF(x, range)  ((range) << (2*(x)))
++#define MAX197_GET_CHANNEL_CONF(x, conf)   (((conf) >> (2*(x))) & 3)
++
++struct max197_config
++{
++  void __iomem *control_and_data_register;
++  void __iomem *busy_bit_register;
++  unsigned int channels; // two bits per channels
++};
++
++static struct max197_config conf;
++#ifdef CONFIG_TS72XX_MAX197_AVERAGE
++static ushort average =3D 1;
++#endif
++
++static ssize_t max197_acquire(struct device *dev,
++    struct device_attribute *attr, char *buf)
++{
++  int range, n;
++  signed short val;
++#ifdef CONFIG_TS72XX_MAX197_AVERAGE
++  int i, total;
++#endif
++
++  n =3D attr->attr.name[2] - 0x31;
++  range =3D MAX197_GET_CHANNEL_CONF(n, conf.channels);
++
++#ifdef CONFIG_TS72XX_MAX197_AVERAGE
++  val =3D 0; total =3D 0;
++  for (i =3D 0; i < average; i++) {
++#endif
++
++    __raw_writeb(((range << 3) | n | 0x40) & 0xFF,
++      conf.control_and_data_register);
++    while (__raw_readb(conf.busy_bit_register) & 0x80);
++    val =3D __raw_readw(conf.control_and_data_register);
++
++    //printk(PFX "%hd/%hd: 0x%04X\n", i+1, average, val);
++
++#ifdef CONFIG_TS72XX_MAX197_AVERAGE
++    total +=3D val;
++  }
++  total /=3D average;
++  val =3D (signed short)total;
++#endif
++
++  /* We want three digit precision */
++  switch (range) {
++    case MAX197_RANGE_0_5:
++      val =3D ((val * 50000/4096)+5)/10;
++      break;
++    case MAX197_RANGE_5_5:
++    case MAX197_RANGE_0_10:
++      val =3D ((val * 100000/4096)+5)/10;
++      break;
++    case MAX197_RANGE_10_10:
++      val =3D ((val * 200000/4096)+5)/10;
++      break;
++  }
++
++  return sprintf(buf, "%d.%03d\n", val/1000, abs(val%1000));
++}
++
++static ssize_t max197_configure(struct device *dev,
++    struct device_attribute *attr, const char *buf, size_t len)
++{
++  int n =3D attr->attr.name[2] - 0x31;
++
++  long val =3D simple_strtol(buf, NULL, 10);
++  switch (val) {
++    case 10:
++      conf.channels &=3D MAX197_RESET_CHANNEL_CONF(n);
++      conf.channels |=3D MAX197_SET_CHANNEL_CONF(n, MAX197_RANGE_0_10);
++      break;
++    case 5:
++      conf.channels &=3D MAX197_RESET_CHANNEL_CONF(n);
++      conf.channels |=3D MAX197_SET_CHANNEL_CONF(n, MAX197_RANGE_0_5);
++      break;
++    case -10:
++      conf.channels &=3D MAX197_RESET_CHANNEL_CONF(n);
++      conf.channels |=3D MAX197_SET_CHANNEL_CONF(n, MAX197_RANGE_10_10)=
;
++      break;
++    case -5:
++      conf.channels &=3D MAX197_RESET_CHANNEL_CONF(n);
++      conf.channels |=3D MAX197_SET_CHANNEL_CONF(n, MAX197_RANGE_5_5);
++      break;
++
++    default:
++      return -EINVAL;
++  }
++
++  return len;
++}
++
++static DEVICE_ATTR(ch1, S_IWUSR | S_IRUGO, max197_acquire, max197_confi=
gure);
++static DEVICE_ATTR(ch2, S_IWUSR | S_IRUGO, max197_acquire, max197_confi=
gure);
++static DEVICE_ATTR(ch3, S_IWUSR | S_IRUGO, max197_acquire, max197_confi=
gure);
++static DEVICE_ATTR(ch4, S_IWUSR | S_IRUGO, max197_acquire, max197_confi=
gure);
++static DEVICE_ATTR(ch5, S_IWUSR | S_IRUGO, max197_acquire, max197_confi=
gure);
++static DEVICE_ATTR(ch6, S_IWUSR | S_IRUGO, max197_acquire, max197_confi=
gure);
++static DEVICE_ATTR(ch7, S_IWUSR | S_IRUGO, max197_acquire, max197_confi=
gure);
++static DEVICE_ATTR(ch8, S_IWUSR | S_IRUGO, max197_acquire, max197_confi=
gure);
++
++static struct attribute *max197_attributes[] =3D {
++  &dev_attr_ch1.attr,
++  &dev_attr_ch2.attr,
++  &dev_attr_ch3.attr,
++  &dev_attr_ch4.attr,
++  &dev_attr_ch5.attr,
++  &dev_attr_ch6.attr,
++  &dev_attr_ch7.attr,
++  &dev_attr_ch8.attr,
++  NULL
++};
++
++static struct attribute_group max197_group =3D {
++  .attrs =3D max197_attributes,
++  //.name =3D "channels",
++};
++
++static __devinit int ts72xx_max197_probe(struct platform_device *pdev)
++{
++  int err =3D 0;
++  struct resource *r_data, *r_busy;
++
++  r_data =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
++  r_busy =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
++
++  if (!r_data || !r_busy) {
++    dev_err(&pdev->dev, "missing resource(s)\n");
++    return -EINVAL;
++  }
++
++  conf.control_and_data_register =3D ioremap(r_data->start, r_data->end=
 - r_data->start + 1);
++  if (!conf.control_and_data_register) {
++    err =3D -ENODEV;
++    goto exit;
++  }
++
++  conf.busy_bit_register =3D ioremap(r_busy->start, r_busy->end - r_bus=
y->start + 1);
++  if (!conf.busy_bit_register) {
++    err =3D -ENODEV;
++    goto exit_unmap1;
++  }
++
++  conf.channels =3D
++    MAX197_SET_CHANNEL_CONF(0, MAX197_RANGE_0_5) |
++    MAX197_SET_CHANNEL_CONF(1, MAX197_RANGE_0_5) |
++    MAX197_SET_CHANNEL_CONF(2, MAX197_RANGE_0_5) |
++    MAX197_SET_CHANNEL_CONF(3, MAX197_RANGE_0_5) |
++    MAX197_SET_CHANNEL_CONF(4, MAX197_RANGE_0_5) |
++    MAX197_SET_CHANNEL_CONF(5, MAX197_RANGE_0_5) |
++    MAX197_SET_CHANNEL_CONF(6, MAX197_RANGE_0_5) |
++    MAX197_SET_CHANNEL_CONF(7, MAX197_RANGE_0_5);
++
++  /* Register sysfs hooks */
++  if ((err =3D sysfs_create_group(&pdev->dev.kobj, &max197_group)))
++    goto exit_unmap2;
++
++  printk(PFX  "TS-72xx max197 driver, v%s\n", DRV_VERSION);
++  return 0;
++
++exit_unmap2:
++  iounmap(conf.busy_bit_register);
++exit_unmap1:
++  iounmap(conf.control_and_data_register);
++exit:
++  return err;
++}
++
++static int __devexit ts72xx_max197_remove(struct platform_device *pdev)
++{
++  sysfs_remove_group(&pdev->dev.kobj, &max197_group);
++  iounmap(conf.busy_bit_register);
++  iounmap(conf.control_and_data_register);
++  return 0;
++}
++
++static struct platform_driver ts72xx_max197_platform_driver =3D {
++  .probe    =3D ts72xx_max197_probe,
++  .remove   =3D __devexit_p(ts72xx_max197_remove),
++  .driver =3D {
++    .name   =3D "ts72xx-max197",
++    .owner  =3D THIS_MODULE,
++  },
++};
++
++static int __init ts72xx_max197_init(void)
++{
++  return platform_driver_register(&ts72xx_max197_platform_driver);
++}
++
++static void __exit ts72xx_max197_exit(void)
++{
++  platform_driver_unregister(&ts72xx_max197_platform_driver);
++}
++
++#ifdef CONFIG_TS72XX_MAX197_AVERAGE
++module_param(average, ushort, S_IWUSR | S_IRUGO);
++MODULE_PARM_DESC(average, "Allow average measurement (default=3D1)");
++#endif
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("TS-72xx max197 driver");
++MODULE_LICENSE("GPL");
++MODULE_VERSION(DRV_VERSION);
++
++module_init(ts72xx_max197_init);
++module_exit(ts72xx_max197_exit);
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0016-RS485-common-bits.pat=
ch b/recipes/linux/linux-2.6.27/ts72xx/0016-RS485-common-bits.patch
new file mode 100644
index 0000000..1cc0892
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0016-RS485-common-bits.patch
@@ -0,0 +1,46 @@
+From 6a097aa79ca6bd502cf84394912f5ca0ddaeda15 Mon Sep 17 00:00:00 2001
+From: =3D?utf-8?q?Petr=3D20=3DC5=3DA0tetiar?=3D <ynezz@true.cz>
+Date: Sun, 4 Jan 2009 15:48:54 +0100
+Subject: [PATCH] RS485 common bits
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/ts72xx.h |   14 ++++++++++++++
+ 1 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-=
ep93xx/include/mach/ts72xx.h
+index 28372df..cf9544c 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+@@ -95,6 +95,14 @@
+ #define TS72XX_MAX197_SAMPLE_PHYS_BASE	0x10f00000
+ #define TS72XX_MAX197_SAMPLE_SIZE	0x00001000
+=20
++#define TS72XX_RS485_CONTROL_VIRT_BASE	0xfebf4000
++#define TS72XX_RS485_CONTROL_PHYS_BASE	0x22c00000
++#define TS72XX_RS485_CONTROL_SIZE	0x00001000
++
++#define TS72XX_RS485_MODE_VIRT_BASE	0xfebf3000
++#define TS72XX_RS485_MODE_PHYS_BASE	0x23000000
++#define TS72XX_RS485_MODE_SIZE	0x00001000
++
+ #ifndef __ASSEMBLY__
+ #include <asm/io.h>
+=20
+@@ -124,4 +132,10 @@ static inline int is_ts9420_installed(void)
+ 	return !!(__raw_readb(TS72XX_OPTIONS2_VIRT_BASE) &
+ 					TS72XX_OPTIONS2_TS9420);
+ }
++
++static inline int is_rs485_installed(void)
++{
++	return !!(__raw_readb(TS72XX_OPTIONS_VIRT_BASE) &
++					TS72XX_OPTIONS_COM2_RS485);
++}
+ #endif
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0017-TS-72xx-SBC-proc-info=
.patch b/recipes/linux/linux-2.6.27/ts72xx/0017-TS-72xx-SBC-proc-info.pat=
ch
new file mode 100644
index 0000000..28326ba
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0017-TS-72xx-SBC-proc-info.patch
@@ -0,0 +1,249 @@
+From f64468d71fee788dde67d80ad2cb0d7bf9d514bc Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 15:50:45 +0100
+Subject: [PATCH] TS-72xx SBC proc info
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Technologic Systems TS-72XX sbc /proc/driver/sbcinfo entry.
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/Kconfig               |    7 ++
+ arch/arm/mach-ep93xx/Makefile              |    1 +
+ arch/arm/mach-ep93xx/include/mach/ts72xx.h |   14 +++
+ arch/arm/mach-ep93xx/ts72xx.c              |    5 +
+ arch/arm/mach-ep93xx/ts72xx_sbcinfo.c      |  147 +++++++++++++++++++++=
+++++++
+ 5 files changed, 174 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/ts72xx_sbcinfo.c
+
+diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
+index ea8549b..3d3ec7e 100644
+--- a/arch/arm/mach-ep93xx/Kconfig
++++ b/arch/arm/mach-ep93xx/Kconfig
+@@ -88,6 +88,13 @@ config MACH_TS72XX
+ 	  Say 'Y' here if you want your kernel to support the
+ 	  Technologic Systems TS-72xx board.
+=20
++config MACH_TS72XX_SBCINFO
++	tristate "Add procfs /proc/driver/sbcinfo"
++	depends on MACH_TS72XX
++	help
++	  Say 'Y' to add a procfs entry containing some information
++	  related to Technologic Systems TS-72xx SBC.
++
+ endmenu
+=20
+ endif
+diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefi=
le
+index c1252ca..bbf8f9a 100644
+--- a/arch/arm/mach-ep93xx/Makefile
++++ b/arch/arm/mach-ep93xx/Makefile
+@@ -16,3 +16,4 @@ obj-$(CONFIG_MACH_EDB9315A)	+=3D edb9315a.o
+ obj-$(CONFIG_MACH_GESBC9312)	+=3D gesbc9312.o
+ obj-$(CONFIG_MACH_MICRO9)	+=3D micro9.o
+ obj-$(CONFIG_MACH_TS72XX)	+=3D ts72xx.o
++obj-$(CONFIG_MACH_TS72XX_SBCINFO)	+=3D ts72xx_sbcinfo.o
+diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-=
ep93xx/include/mach/ts72xx.h
+index cf9544c..601d0a3 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+@@ -103,6 +103,10 @@
+ #define TS72XX_RS485_MODE_PHYS_BASE	0x23000000
+ #define TS72XX_RS485_MODE_SIZE	0x00001000
+=20
++#define TS72XX_PLD_VERSION_VIRT_BASE	0xfebf5000
++#define TS72XX_PLD_VERSION_PHYS_BASE	0x23400000
++#define TS72XX_PLD_VERSION_SIZE	0x00001000
++
+ #ifndef __ASSEMBLY__
+ #include <asm/io.h>
+=20
+@@ -138,4 +142,14 @@ static inline int is_rs485_installed(void)
+ 	return !!(__raw_readb(TS72XX_OPTIONS_VIRT_BASE) &
+ 					TS72XX_OPTIONS_COM2_RS485);
+ }
++
++static inline int get_ts72xx_pld_version(void)
++{
++	return (__raw_readb(TS72XX_PLD_VERSION_VIRT_BASE) & 0x7);
++}
++
++static inline int is_jp6_set(void)
++{
++	return (__raw_readb(TS72XX_OPTIONS2_VIRT_BASE) & 0x1);
++}
+ #endif
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index ea3deeb..9835b05 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -31,6 +31,11 @@ static struct map_desc ts72xx_io_desc[] __initdata =3D=
 {
+ 		.pfn		=3D __phys_to_pfn(TS72XX_MODEL_PHYS_BASE),
+ 		.length		=3D TS72XX_MODEL_SIZE,
+ 		.type		=3D MT_DEVICE,
++  }, {
++    .virtual  =3D TS72XX_PLD_VERSION_VIRT_BASE,
++    .pfn    =3D __phys_to_pfn(TS72XX_PLD_VERSION_PHYS_BASE),
++    .length   =3D TS72XX_PLD_VERSION_SIZE,
++    .type   =3D MT_DEVICE,
+ 	}, {
+ 		.virtual	=3D TS72XX_OPTIONS_VIRT_BASE,
+ 		.pfn		=3D __phys_to_pfn(TS72XX_OPTIONS_PHYS_BASE),
+diff --git a/arch/arm/mach-ep93xx/ts72xx_sbcinfo.c b/arch/arm/mach-ep93x=
x/ts72xx_sbcinfo.c
+new file mode 100644
+index 0000000..7fe4e77
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/ts72xx_sbcinfo.c
+@@ -0,0 +1,147 @@
++/*
++ *  Technologic Systems TS-72XX sbc /proc/driver/sbcinfo entry.
++ *
++ *  Original idea by Liberty Young (Technologic Systems).
++ *
++ *	(c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ *
++ *	This program is free software; you can redistribute it and/or
++ *	modify it under the terms of the GNU General Public License
++ *	as published by the Free Software Foundation; either version
++ *	2 of the License, or (at your option) any later version.
++ */
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/proc_fs.h>
++#include <mach/ts72xx.h>
++
++
++struct infos {
++  int model, pld;
++  int option_ad;
++  int option_rs485;
++  unsigned char jumpers[6]; // 0=3Doff,1=3Don,2=3Derror
++};
++
++static void get_sbcinfo(struct infos *data)
++{
++  void __iomem *p;
++
++  /* Board model */
++  switch (__raw_readb(TS72XX_MODEL_VIRT_BASE)) {
++    case TS72XX_MODEL_TS7200:
++      data->model =3D 7200;
++      break;
++    case  TS72XX_MODEL_TS7250:
++      data->model =3D 7250;
++      break;
++    case  TS72XX_MODEL_TS7260:
++      data->model =3D 7260;
++      break;
++    default:
++      data->model =3D 0;
++  }
++
++  data->pld =3D get_ts72xx_pld_version();
++
++  /* A/D converter (8 x 12-bit channels) */
++  if ((data->model =3D=3D 7200) || (data->model =3D 7250)) {
++    data->option_ad =3D is_max197_installed();
++  } else {
++    data->option_ad =3D 0;
++  }
++
++  /* COM2 RS-485 */
++  if (is_rs485_installed()) {
++    data->option_rs485 =3D 1;
++  } else {
++    data->option_rs485 =3D 0;
++  }
++
++  /* jumpers */
++  p =3D ioremap(TS72XX_JUMPERS_MAX197_PHYS_BASE, TS72XX_JUMPERS_MAX197_=
SIZE);
++  if (p) {
++    unsigned char c =3D __raw_readb(p);
++
++    data->jumpers[0] =3D 2;                // JP1 (bootstrap)
++    data->jumpers[1] =3D !!(c & 0x01);     // JP2 (enable serial consol=
e)
++    data->jumpers[2] =3D !!(c & 0x02);     // JP3 (flash write enable)
++    data->jumpers[3] =3D !(c & 0x08);      // JP4 (console on COM2)
++    data->jumpers[4] =3D !(c & 0x10);      // JP5 (test)
++    data->jumpers[5] =3D !!(is_jp6_set()); // JP6 (user jumper)
++
++    iounmap(p);
++  } else {
++    data->jumpers[0] =3D data->jumpers[1] =3D data->jumpers[2] =3D 2;
++    data->jumpers[3] =3D data->jumpers[4] =3D data->jumpers[5] =3D 2;
++  }
++
++}
++
++
++static int ts72xx_sbcinfo_read_proc(char *buffer, char **start, off_t o=
ffset,
++    int count, int *eof, void *data)
++{
++  int len, size =3D count;
++  char *p =3D buffer;
++  struct infos nfo;
++  const char jpc[3] =3D { 'n', 'y', '?' };
++
++  get_sbcinfo(&nfo);
++  len =3D scnprintf(p, size,
++      "Model             : TS-%d (PLD rev %c)\n"
++      "Option max197 A/D : %s\n"
++      "Option RS-485     : %s\n"
++      "Jumpers           : JP2=3D%c JP3=3D%c JP4=3D%c JP5=3D%c JP6=3D%c=
\n",
++      nfo.model, nfo.pld + 0x40,
++      (nfo.option_ad ? "yes" : "no"),
++      (nfo.option_rs485 ? "yes" : "no"),
++      jpc[nfo.jumpers[1]], jpc[nfo.jumpers[2]], jpc[nfo.jumpers[3]], jp=
c[nfo.jumpers[4]],
++      jpc[nfo.jumpers[5]]);
++
++  if (len <=3D offset + count)
++    *eof =3D 1;
++
++  *start =3D buffer + offset;
++  len -=3D offset;
++
++  if (len > count)
++    len =3D count;
++  if (len < 0)
++    len =3D 0;
++
++  return len;
++}
++
++
++static int __init ts72xx_sbcinfo_init(void)
++{
++  struct proc_dir_entry *entry;
++  int ret =3D 0;
++
++  entry =3D create_proc_read_entry("driver/sbcinfo", 0,
++      NULL, ts72xx_sbcinfo_read_proc, NULL);
++
++  if (!entry) {
++    printk(KERN_ERR "sbcinfo: can't create /proc/driver/sbcinfo\n");
++    ret =3D -ENOMEM;
++  }
++
++  return ret;
++}
++
++static void __exit ts72xx_sbcinfo_exit(void)
++{
++  remove_proc_entry("driver/sbcinfo", NULL);
++  return;
++}
++
++module_init(ts72xx_sbcinfo_init);
++module_exit(ts72xx_sbcinfo_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("Show information of Technologic Systems TS-72XX sbc=
");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("1.0");
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0018-EP93xx-GPIO-I2C.patch=
 b/recipes/linux/linux-2.6.27/ts72xx/0018-EP93xx-GPIO-I2C.patch
new file mode 100644
index 0000000..96bc2f4
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0018-EP93xx-GPIO-I2C.patch
@@ -0,0 +1,71 @@
+From c74060501ec81a28f288a6d82ecf532320dae361 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 01:41:44 +0100
+Subject: [PATCH] EP93xx GPIO I2C
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/core.c |   30 ++++++++++++++++++++++++++++++
+ 1 files changed, 30 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
+index 88afbe6..f689531 100644
+--- a/arch/arm/mach-ep93xx/core.c
++++ b/arch/arm/mach-ep93xx/core.c
+@@ -34,6 +34,8 @@
+ #include <linux/amba/serial.h>
+ #include <linux/dma-mapping.h>
+ #include <linux/leds.h>
++#include <linux/i2c.h>
++#include <linux/i2c-gpio.h>
+=20
+ #include <asm/types.h>
+ #include <asm/setup.h>
+@@ -509,6 +511,30 @@ static struct platform_device ep93xx_gpio_leds =3D =
{
+   }
+ };
+=20
++#ifdef CONFIG_MACH_TS72XX
++static struct i2c_gpio_platform_data ep93xx_i2c_data =3D {
++  .sda_pin		=3D EP93XX_GPIO_LINE_EGPIO14, // DIO_6 (TS72XX DIO 2x8 head=
er)
++  .sda_is_open_drain	=3D 0,
++  .scl_pin		=3D EP93XX_GPIO_LINE_EGPIO15, // DIO_7 (TS72XX DIO 2x8 head=
er)
++  .scl_is_open_drain	=3D 0,
++  .udelay			=3D 2,
++};
++#else
++static struct i2c_gpio_platform_data ep93xx_i2c_data =3D {
++  .sda_pin		=3D EP93XX_GPIO_LINE_EEDAT,
++  .sda_is_open_drain	=3D 0,
++  .scl_pin		=3D EP93XX_GPIO_LINE_EECLK,
++  .scl_is_open_drain	=3D 0,
++  .udelay			=3D 2,
++};
++#endif
++
++static struct platform_device ep93xx_i2c_device =3D {
++  .name			=3D "i2c-gpio",
++  .id			=3D 0,
++  .dev.platform_data	=3D &ep93xx_i2c_data,
++};
++
+=20
+ extern void ep93xx_gpio_init(void);
+=20
+@@ -530,6 +556,10 @@ void __init ep93xx_init_devices(void)
+ 	amba_device_register(&uart2_device, &iomem_resource);
+ 	amba_device_register(&uart3_device, &iomem_resource);
+=20
++	/* We have no specific I2C slave devices to register,
++	   so we do not have to call i2c_register_board_info. */
++	platform_device_register(&ep93xx_i2c_device);
++
+ 	platform_device_register(&ep93xx_gpio_leds);
+ 	platform_device_register(&ep93xx_rtc_device);
+ 	platform_device_register(&ep93xx_ohci_device);
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0019-EP93xx-SPI-driver.pat=
ch b/recipes/linux/linux-2.6.27/ts72xx/0019-EP93xx-SPI-driver.patch
new file mode 100644
index 0000000..185fa71
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0019-EP93xx-SPI-driver.patch
@@ -0,0 +1,989 @@
+From 007d9f94b01c399553cff4143ae3d696b8189b57 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 01:51:24 +0100
+Subject: [PATCH] EP93xx SPI driver
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/clock.c                    |    6 +-
+ arch/arm/mach-ep93xx/core.c                     |   29 ++
+ arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h |    1 +
+ arch/arm/mach-ep93xx/include/mach/spi.h         |   18 +
+ arch/arm/mach-ep93xx/ts72xx.c                   |   37 ++-
+ drivers/spi/Kconfig                             |   13 +
+ drivers/spi/Makefile                            |    2 +
+ drivers/spi/spi_ep93xx.c                        |  496 ++++++++++++++++=
+++++++
+ drivers/spi/spi_ep93xx.h                        |   61 +++
+ drivers/spi/tmp124.c                            |  158 +++++++
+ 10 files changed, 819 insertions(+), 2 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/include/mach/spi.h
+ create mode 100644 drivers/spi/spi_ep93xx.c
+ create mode 100644 drivers/spi/spi_ep93xx.h
+ create mode 100644 drivers/spi/tmp124.c
+
+diff --git a/arch/arm/mach-ep93xx/clock.c b/arch/arm/mach-ep93xx/clock.c
+index 6062e47..2b47048 100644
+--- a/arch/arm/mach-ep93xx/clock.c
++++ b/arch/arm/mach-ep93xx/clock.c
+@@ -51,7 +51,10 @@ static struct clk clk_usb_host =3D {
+ 	.enable_reg	=3D EP93XX_SYSCON_CLOCK_CONTROL,
+ 	.enable_mask	=3D EP93XX_SYSCON_CLOCK_USH_EN,
+ };
+-
++static struct clk clk_ssp =3D {
++	.name		=3D "sspclk",
++	.rate		=3D 7400000,
++};
+=20
+ static struct clk *clocks[] =3D {
+ 	&clk_uart,
+@@ -61,6 +64,7 @@ static struct clk *clocks[] =3D {
+ 	&clk_p,
+ 	&clk_pll2,
+ 	&clk_usb_host,
++	&clk_ssp,
+ };
+=20
+ struct clk *clk_get(struct device *dev, const char *id)
+diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
+index f689531..00c2316 100644
+--- a/arch/arm/mach-ep93xx/core.c
++++ b/arch/arm/mach-ep93xx/core.c
+@@ -41,6 +41,7 @@
+ #include <asm/setup.h>
+ #include <asm/memory.h>
+ #include <mach/hardware.h>
++#include <mach/spi.h>
+ #include <asm/irq.h>
+ #include <asm/system.h>
+ #include <asm/tlbflush.h>
+@@ -484,6 +485,33 @@ static struct platform_device ep93xx_ohci_device =3D=
 {
+ };
+=20
+=20
++static struct resource ep93xx_ssp_resources[] =3D {
++	{
++		.start =3D EP93XX_SPI_BASE, // virtual addresses
++		.end   =3D EP93XX_SPI_BASE + 0x14,
++		.flags =3D IORESOURCE_MEM,
++	}, {
++		.start =3D IRQ_EP93XX_SSP, // overrun in receive fifo
++		.end   =3D IRQ_EP93XX_SSP,
++		.flags =3D IORESOURCE_IRQ,
++	}
++};
++
++static struct ep93xx_spi_data ep93xx_ssp_data =3D {
++	.chip_select_num =3D 4,
++};
++
++static struct platform_device ep93xx_ssp_device =3D {
++	.name           =3D "ep93xx-spi",
++	.id             =3D 1,
++	.resource       =3D ep93xx_ssp_resources,
++	.num_resources  =3D ARRAY_SIZE(ep93xx_ssp_resources),
++	.dev =3D {
++		.platform_data =3D &ep93xx_ssp_data,
++	}
++};
++
++
+ static const struct gpio_led ep93xx_led_pins[] =3D {
+   {
+     .name =3D "green",
+@@ -563,4 +591,5 @@ void __init ep93xx_init_devices(void)
+ 	platform_device_register(&ep93xx_gpio_leds);
+ 	platform_device_register(&ep93xx_rtc_device);
+ 	platform_device_register(&ep93xx_ohci_device);
++	platform_device_register(&ep93xx_ssp_device);
+ }
+diff --git a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h b/arch/arm/=
mach-ep93xx/include/mach/ep93xx-regs.h
+index e26b41b..be0b9d4 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
++++ b/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
+@@ -97,6 +97,7 @@
+ #define EP93XX_AAC_BASE			(EP93XX_APB_VIRT_BASE + 0x00080000)
+=20
+ #define EP93XX_SPI_BASE			(EP93XX_APB_VIRT_BASE + 0x000a0000)
++#define EP93XX_SPI_PHYS_BASE		(EP93XX_APB_PHYS_BASE + 0x000a0000)
+=20
+ #define EP93XX_IRDA_BASE		(EP93XX_APB_VIRT_BASE + 0x000b0000)
+=20
+diff --git a/arch/arm/mach-ep93xx/include/mach/spi.h b/arch/arm/mach-ep9=
3xx/include/mach/spi.h
+new file mode 100644
+index 0000000..0e07fc9
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/include/mach/spi.h
+@@ -0,0 +1,18 @@
++/*
++ * arch/arm/mach-ep93xx/include/mach/spi.h
++ */
++
++struct ep93xx_spi_data {
++	u16 chip_select_num;
++};
++
++
++/* spi_board_info.controller_data for SPI slave devices */
++struct ep93xx_spi_chip {
++	void (*cs_control)(u32 command);
++};
++
++/* Chip-select state */
++#define SPI_CS_ASSERT    0x1
++#define SPI_CS_DEASSERT  0x2
++#define SPI_CS_INIT      0x4
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index 9835b05..2141e73 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -19,8 +19,11 @@
+ #include <linux/mtd/physmap.h>
+ #include <linux/platform_device.h>
+ #include <linux/m48t86.h>
++#include <linux/spi/spi.h>
+ #include <asm/io.h>
+ #include <mach/hardware.h>
++#include <mach/spi.h>
++#include <mach/gpio.h>
+ #include <asm/mach-types.h>
+ #include <asm/mach/arch.h>
+ #include <asm/mach/map.h>
+@@ -233,6 +236,34 @@ static struct platform_device ts72xx_max197_device =
=3D {
+ 	.resource =3D ts72xx_max197_resources,
+ };
+=20
++#if defined(CONFIG_SPI_MASTER)
++void tmp124_spi_cs(u32 command) // FGPIO[2]
++{
++	if (command & SPI_CS_ASSERT) {
++		gpio_set_value(EP93XX_GPIO_LINE_MCCD2, 0);
++	} else if (command & SPI_CS_DEASSERT) {
++		gpio_set_value(EP93XX_GPIO_LINE_MCCD2, 1);
++	} else if (command & SPI_CS_INIT) {
++		gpio_direction_output(EP93XX_GPIO_LINE_MCCD2, 1);
++	}
++}
++
++static struct ep93xx_spi_chip tmp124_hw =3D {
++	.cs_control =3D tmp124_spi_cs,
++};
++
++static struct spi_board_info ts72xx_spi_bus[] __initdata =3D {
++	{
++		/* TMP124 */
++		.modalias      =3D "tmp124",
++		.controller_data =3D &tmp124_hw,
++		.bus_num       =3D 1,
++		.chip_select   =3D 0,
++		.max_speed_hz =3D 2 * 1000 * 1000,
++	}
++};
++#endif
++
+ static void __init ts72xx_init_machine(void)
+ {
+ 	ep93xx_init_devices();
+@@ -251,7 +282,11 @@ static void __init ts72xx_init_machine(void)
+=20
+ 	if (is_max197_installed()) {
+ 		platform_device_register(&ts72xx_max197_device);
+-	}
++  }
++
++	#if defined(CONFIG_SPI_MASTER)
++	spi_register_board_info(ts72xx_spi_bus, ARRAY_SIZE(ts72xx_spi_bus));
++	#endif
+ }
+=20
+ MACHINE_START(TS72XX, "Technologic Systems TS-72xx SBC")
+diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
+index b9d0efb..51b55b5 100644
+--- a/drivers/spi/Kconfig
++++ b/drivers/spi/Kconfig
+@@ -204,6 +204,12 @@ config SPI_XILINX
+ 	  See the "OPB Serial Peripheral Interface (SPI) (v1.00e)"
+ 	  Product Specification document (DS464) for hardware details.
+=20
++config SPI_EP93XX
++	tristate "EP93XX SPI controller"
++	depends on SPI_MASTER
++	help
++	  Simple SPI driver for EP93xx.
++
+ #
+ # Add new SPI master controllers in alphabetical order above this line
+ #
+@@ -243,6 +249,13 @@ config SPI_TLE62X0
+ 	  sysfs interface, with each line presented as a kind of GPIO
+ 	  exposing both switch control and diagnostic feedback.
+=20
++config SPI_TMP124
++	tristate "Texas Instruments TMP1224, TMP124"
++	depends on SPI_MASTER && SYSFS
++	help
++	  SPI driver for TMP12X temperature sensor chips.
++	  This provides a sysfs entry for temperature reading (2=B0C accurate)=
.
++
+ #
+ # Add new SPI protocol masters in alphabetical order above this line
+ #
+diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
+index ccf18de..1effdf3 100644
+--- a/drivers/spi/Makefile
++++ b/drivers/spi/Makefile
+@@ -28,6 +28,7 @@ obj-$(CONFIG_SPI_S3C24XX_GPIO)		+=3D spi_s3c24xx_gpio.=
o
+ obj-$(CONFIG_SPI_S3C24XX)		+=3D spi_s3c24xx.o
+ obj-$(CONFIG_SPI_TXX9)			+=3D spi_txx9.o
+ obj-$(CONFIG_SPI_XILINX)		+=3D xilinx_spi.o
++obj-$(CONFIG_SPI_EP93XX)		+=3D spi_ep93xx.o
+ obj-$(CONFIG_SPI_SH_SCI)		+=3D spi_sh_sci.o
+ # 	... add above this line ...
+=20
+@@ -35,6 +36,7 @@ obj-$(CONFIG_SPI_SH_SCI)		+=3D spi_sh_sci.o
+ obj-$(CONFIG_SPI_AT25)		+=3D at25.o
+ obj-$(CONFIG_SPI_SPIDEV)	+=3D spidev.o
+ obj-$(CONFIG_SPI_TLE62X0)	+=3D tle62x0.o
++obj-$(CONFIG_SPI_TMP124)	+=3D tmp124.o
+ # 	... add above this line ...
+=20
+ # SPI slave controller drivers (upstream link)
+diff --git a/drivers/spi/spi_ep93xx.c b/drivers/spi/spi_ep93xx.c
+new file mode 100644
+index 0000000..0f51b00
+--- /dev/null
++++ b/drivers/spi/spi_ep93xx.c
+@@ -0,0 +1,496 @@
++/*
++ *  EP93xx SPI driver
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ * Based on pxa2xx_spi.c by Stephen Street / StreetFire Sound Labs
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * Notes:
++ *  - Uses SSP IP of processor
++ *  - Restricted to SPI master mode
++ *  - No DMA transfer
++ *  - No power management support
++ */
++
++#include <linux/init.h>
++#include <linux/module.h>
++#include <linux/device.h>
++#include <linux/interrupt.h>
++#include <linux/delay.h>
++#include <linux/platform_device.h>
++#include <linux/spi/spi.h>
++#include <linux/clk.h>
++#include <asm/irq.h>
++#include <mach/hardware.h>
++#include <mach/spi.h>
++
++#include <linux/sched.h>
++#include <linux/spinlock.h>
++#include <linux/workqueue.h>
++
++#include "spi_ep93xx.h"
++
++
++struct ep93xx_spi {
++  struct spi_master *master;    /* SPI framework hookup */
++  void __iomem *ioaddr;         /* Virtual base address to SSP register=
s */
++  u32 freq_max;
++  u32 freq_min;
++  struct clk *clk;
++
++  struct workqueue_struct *workqueue;
++  struct work_struct work;
++  spinlock_t lock;
++  struct list_head queue;
++
++  struct ep93xx_spi_chip *cs_chip; /* Chip Select function */
++};
++
++static inline u16 read_reg(void *base, off_t offset)
++{
++	return __raw_readw(base + offset);
++}
++
++static inline void write_reg(u16 v, void *base, off_t offset)
++{
++	__raw_writew(v, base + offset);
++}
++
++/*
++ *  compute SCR and CPSDVR bits to setup spi clock based on main input =
clock rate
++ *  that was specified in platform data structure
++ *  according to datasheet:
++ *    tempclk =3D sspclk / cpsdvr
++ *    spiclk =3D tempclk / (scr + 1)
++ *    SCR valid range is 0..255
++ *    CPSDVR valid range is 2..254
++ */
++static int spi_speed_set(struct ep93xx_spi *drv_data, unsigned speed_hz=
)
++{
++	unsigned long mainclk_hz =3D clk_get_rate(drv_data->clk);
++	u32 cpsdvr, scr;
++	u16 ssp_cr0;
++
++	for (cpsdvr =3D 2; cpsdvr <=3D 254; cpsdvr+=3D2) {
++		scr =3D DIV_ROUND_UP(mainclk_hz / speed_hz, cpsdvr);
++		/* now we have SCR+1 in scr, so count with that */
++		if (scr =3D=3D 0) { 	/* speed_hz too big */
++			return -EINVAL;
++		}
++		if (scr <=3D (255 + 1))
++			break;		/* we have valid scr and cpsdvr */
++	}
++	if (cpsdvr > 254) {
++    /* speed_hz is too small, set to minimum speed */
++    scr =3D cpsdvr + 1;
++    cpsdvr--;
++	}
++	scr--;
++	write_reg(cpsdvr, drv_data->ioaddr, SSPCPSR);
++	ssp_cr0 =3D read_reg(drv_data->ioaddr, SSPCR0);
++	ssp_cr0 &=3D ~(SSP_CONTROL_SCR(0xff));
++	write_reg((ssp_cr0 | SSP_CONTROL_SCR(scr)), drv_data->ioaddr, SSPCR0);
++
++	return 0;
++}
++
++static irqreturn_t ssp_int(int irq, void *dev_id)
++{
++	struct ep93xx_spi *drv_data =3D dev_id;
++	write_reg(SSP_SSPIxx_RORIS, drv_data->ioaddr, SSPIxR); /* clear it */
++
++	printk(KERN_WARNING "SSP overrun\n");
++	return IRQ_HANDLED;
++}
++
++static int transfer_one_work(struct ep93xx_spi *drv_data, struct spi_me=
ssage *msg)
++{
++	struct spi_device *spi =3D msg->spi;
++	struct spi_transfer *xfer;
++	int i;
++	u8 *p;
++
++	drv_data->cs_chip->cs_control(SPI_CS_ASSERT);
++
++	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
++		if (!(xfer->tx_buf || xfer->rx_buf)) {
++			dev_dbg(&spi->dev, "missing rx or tx buf\n");
++			drv_data->cs_chip->cs_control(SPI_CS_DEASSERT);
++			return -EINVAL;
++		}
++
++		if (xfer->bits_per_word) {
++			u16 v =3D read_reg(drv_data->ioaddr, SSPCR0);
++			v =3D v & SSP_CONTROL_DSS_MASK;
++			v =3D v | ((xfer->bits_per_word - 1) & SSP_CONTROL_DSS_MASK);
++			write_reg(v, drv_data->ioaddr, SSPCR0);
++		}
++
++		if (xfer->speed_hz) {
++			if (spi_speed_set(drv_data,xfer->speed_hz) !=3D 0){
++				dev_err(&spi->dev, "xfer speed hz invalid\n");
++				return -EINVAL;
++			}
++		}
++
++		if (xfer->tx_buf) {
++			p =3D (u8 *)xfer->tx_buf;
++
++			if ((spi->bits_per_word =3D=3D 16 && xfer->bits_per_word =3D=3D 0) |=
|
++			    (xfer->bits_per_word =3D=3D 16)) {
++				for (i =3D 0; i < xfer->len; i+=3D2)
++					write_reg((p[i] << 8) + p[i+1], drv_data->ioaddr, SSPDR);
++			} else {
++				for (i =3D 0; i < xfer->len; i++)
++					write_reg(p[i], drv_data->ioaddr, SSPDR);
++			}
++		}
++
++		if (xfer->rx_buf) {
++			u16 v;
++			p =3D xfer->rx_buf;
++
++			if ((spi->bits_per_word =3D=3D 16 && xfer->bits_per_word =3D=3D 0) |=
|
++			    (xfer->bits_per_word =3D=3D 16)) {
++					for (i =3D 0; i < xfer->len; i+=3D2) {
++						  v =3D read_reg(drv_data->ioaddr, SSPDR);
++						  p[i] =3D v >> 8;
++						  p[i+1] =3D v & 0xFF;
++					}
++			} else {
++					for (i =3D 0; i < xfer->len; i++)
++						  p[i] =3D read_reg(drv_data->ioaddr, SSPDR);
++			}
++		}
++
++		/* restore device bits_per_word */
++		if (xfer->bits_per_word) {
++			u16 v =3D read_reg(drv_data->ioaddr, SSPCR0);
++			v =3D v & SSP_CONTROL_DSS_MASK;
++			v |=3D spi->bits_per_word - 1;
++			write_reg(v, drv_data->ioaddr, SSPCR0);
++		}
++
++		/* restore device speed_hz */
++		if (xfer->speed_hz) {
++			if (spi_speed_set(drv_data,spi->max_speed_hz) !=3D 0)
++				return -EINVAL;
++		}
++
++		dev_dbg(&spi->dev, "transfer: len=3D%u, tx_buf=3D%p, rx_buf=3D%p\n", =
xfer->len, xfer->tx_buf, xfer->rx_buf);
++	}
++
++	if (xfer->delay_usecs)
++		udelay(xfer->delay_usecs);
++	drv_data->cs_chip->cs_control(SPI_CS_DEASSERT);
++
++	msg->actual_length =3D 0;
++	msg->status =3D 0;
++
++	if (msg->complete)
++		msg->complete(msg->context);
++
++	return 0;
++}
++
++
++static void ssp_work(struct work_struct *work)
++{
++	struct ep93xx_spi *drv_data =3D container_of(work, struct ep93xx_spi, =
work);
++	unsigned long flags;
++
++	spin_lock_irqsave(&drv_data->lock, flags);
++	while (!list_empty(&drv_data->queue)) {
++		struct spi_message *m;
++
++		m =3D container_of(drv_data->queue.next, struct spi_message, queue);
++		list_del_init(&m->queue);
++		spin_unlock_irqrestore(&drv_data->lock, flags);
++
++		transfer_one_work(drv_data, m);
++
++		spin_lock_irqsave(&drv_data->lock, flags);
++	}
++	spin_unlock_irqrestore(&drv_data->lock, flags);
++}
++
++
++static int ssp_transfer(struct spi_device *spi, struct spi_message *m)
++{
++	struct spi_master *master =3D spi->master;
++	struct ep93xx_spi *drv_data =3D spi_master_get_devdata(master);
++	struct spi_transfer *t;
++	unsigned long flags;
++
++	m->actual_length =3D 0;
++
++	/* check each transfer's parameters */
++	list_for_each_entry (t, &m->transfers, transfer_list) {
++		u32 speed_hz =3D t->speed_hz ? t->speed_hz : spi->max_speed_hz;
++		u8 bits_per_word =3D t->bits_per_word ? t->bits_per_word : spi->bits_=
per_word;
++
++		if (!t->tx_buf && !t->rx_buf && t->len)
++			return -EINVAL;
++		if (bits_per_word < 4 || bits_per_word > 16)
++			return -EINVAL;
++		/*if (t->len & ((bits_per_word >> 3) - 1))
++			return -EINVAL;*/
++		if (speed_hz < drv_data->freq_min || speed_hz > drv_data->freq_max)
++			return -EINVAL;
++	}
++
++	spin_lock_irqsave(&drv_data->lock, flags);
++	list_add_tail(&m->queue, &drv_data->queue);
++	queue_work(drv_data->workqueue, &drv_data->work);
++	spin_unlock_irqrestore(&drv_data->lock, flags);
++
++	return 0;
++
++}
++
++/* the spi->mode bits understood by this driver: */
++#define MODEBITS (SPI_CPOL | SPI_CPHA)
++
++static int ssp_setup(struct spi_device *spi)
++{
++	struct ep93xx_spi *drv_data =3D spi_master_get_devdata(spi->master);
++	struct ep93xx_spi_chip *chip_info;
++	u16 v;
++
++	/* Get controller data */
++	chip_info =3D spi->controller_data;
++	if (!chip_info) {
++		dev_err(&spi->dev, "setup: controller data required\n");
++		return -EINVAL;
++	}
++	drv_data->cs_chip =3D chip_info;
++	drv_data->cs_chip->cs_control(SPI_CS_INIT);
++
++	if (!spi->bits_per_word) {
++		spi->bits_per_word =3D 8;
++	}
++
++	if (spi->bits_per_word < 4 || spi->bits_per_word > 16) {
++		  dev_dbg(&spi->dev, "setup: unsupported %d bit words\n",
++		  spi->bits_per_word);
++		  return -EINVAL;
++	}
++
++	if (spi->chip_select > spi->master->num_chipselect) {
++		  dev_dbg(&spi->dev, "setup: invalid chipselect %u (%u defined)\n",
++		  spi->chip_select,  spi->master->num_chipselect);
++		  return -EINVAL;
++	}
++
++	if (spi->mode & ~MODEBITS) {
++		 dev_dbg(&spi->dev, "setup: unsupported mode bits %x\n",
++		 spi->mode & ~MODEBITS);
++		 return -EINVAL;
++	}
++
++	v =3D read_reg(drv_data->ioaddr, SSPCR0);
++
++	if (spi->mode & SPI_CPOL)
++		v |=3D SSP_CONTROL_SPO;
++	else
++		v &=3D ~SSP_CONTROL_SPO;
++
++	if (spi->mode & SPI_CPHA)
++		v |=3D SSP_CONTROL_SPH;
++	else
++		v &=3D ~SSP_CONTROL_SPH;
++
++	v =3D v & SSP_CONTROL_DSS_MASK;
++	v |=3D spi->bits_per_word - 1;
++
++	write_reg(v, drv_data->ioaddr, SSPCR0);
++
++	if(!spi->max_speed_hz){
++		spi->max_speed_hz =3D drv_data->freq_min;
++	}else if(spi->max_speed_hz > drv_data->freq_max ||
++			spi->max_speed_hz < drv_data->freq_min){
++		return -EINVAL;
++	}
++
++	if (spi_speed_set(drv_data,spi->max_speed_hz) !=3D 0){
++		dev_dbg(&spi->dev, "setup: unsupported speed %u\n", spi->max_speed_hz=
);
++		return -EINVAL;
++	}
++
++	return 0;
++}
++
++
++static void ssp_cleanup(struct spi_device *spi)
++{
++	struct ep93xx_spi *drv_data =3D spi_master_get_devdata(spi->master);
++	drv_data->cs_chip =3D NULL;
++}
++
++
++static int __init spi_ep93xx_probe(struct platform_device *pdev)
++{
++	struct device *dev =3D &pdev->dev;
++	struct spi_master *master;
++	struct ep93xx_spi_data *spi_data =3D pdev->dev.platform_data;
++	struct ep93xx_spi *drv_data =3D 0;
++	struct resource *memory_resource;
++	int irq, status =3D 0, min_div =3D 2, max_div =3D 254*(255+1);
++
++
++	/* Check I2SonSSP bit (ssp pins and i2s pins are multiplexed) */
++	if (readl(EP93XX_SYSCON_DEVICE_CONFIG) & 0x80)
++		return -ENODEV;
++
++	/* Allocate master with space for drv_data */
++	master =3D spi_alloc_master(dev, sizeof(struct ep93xx_spi));
++	if (!master) {
++		dev_err(&pdev->dev, "can not alloc spi_master\n");
++		return -ENOMEM;
++	}
++
++	/* Setup register addresses */
++	memory_resource =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!memory_resource) {
++		dev_err(&pdev->dev, "memory resources not defined\n");
++		status =3D -ENODEV;
++		goto out_error_master_alloc;
++	}
++
++	drv_data =3D spi_master_get_devdata(master);
++	drv_data->master =3D master;
++	drv_data->ioaddr =3D (unsigned long *)memory_resource->start;
++	drv_data->clk =3D clk_get(&pdev->dev, "sspclk");
++	drv_data->freq_max =3D clk_get_rate(drv_data->clk) / min_div;
++	drv_data->freq_min =3D clk_get_rate(drv_data->clk) / max_div + 1;
++
++	INIT_WORK(&drv_data->work, ssp_work);
++	spin_lock_init(&drv_data->lock);
++	INIT_LIST_HEAD(&drv_data->queue);
++
++	drv_data->workqueue =3D create_singlethread_workqueue(master->dev.pare=
nt->bus_id);
++	if (!drv_data->workqueue){
++ 		status =3D -EBUSY;
++		goto out_error_master_alloc;
++	}
++
++	master->bus_num =3D pdev->id;
++	master->num_chipselect =3D spi_data->chip_select_num;
++	master->cleanup =3D ssp_cleanup;
++	master->setup =3D ssp_setup;
++	master->transfer =3D ssp_transfer;
++
++	/* Attach to IRQ */
++	irq =3D platform_get_irq(pdev, 0);
++	if (irq < 0) {
++		dev_err(&pdev->dev, "irq resource not defined\n");
++		status =3D -ENODEV;
++		goto out_error_master_alloc;
++	}
++
++	status =3D request_irq(irq, ssp_int, 0, dev->bus_id, drv_data);
++	if (status < 0) {
++		dev_err(&pdev->dev, "can not get IRQ\n");
++		goto out_error_master_alloc;
++	}
++
++	/* Load default SSP configuration */
++	write_reg(SSP_CONTROL_SSE, drv_data->ioaddr, SSPCR1);
++	write_reg(SPI_DEFAULT0, drv_data->ioaddr, SSPCR0);
++	write_reg(SPI_DEFAULT_DIVISOR, drv_data->ioaddr, SSPCPSR);
++	write_reg(0x00, drv_data->ioaddr, SSPCR1);
++
++	/* Register with the SPI framework */
++	platform_set_drvdata(pdev, drv_data);
++	status =3D spi_register_master(master);
++	if (status !=3D 0) {
++		dev_err(&pdev->dev, "problem registering spi master\n");
++		goto out_error_irq_alloc;
++	}
++
++	write_reg(SPI_DEFAULT1, drv_data->ioaddr, SSPCR1);
++	return status;
++
++out_error_irq_alloc:
++	free_irq(irq, drv_data);
++
++out_error_master_alloc:
++	spi_master_put(master);
++	return status;
++}
++
++static int spi_ep93xx_remove(struct platform_device *pdev)
++{
++	struct ep93xx_spi *drv_data =3D platform_get_drvdata(pdev);
++	int irq;
++
++	if (!drv_data)
++		return 0;
++
++	/* Disable SSP (clear SSE bit) */
++	write_reg(0x00, drv_data->ioaddr, SSPCR1);
++
++	/* Release IRQ */
++	irq =3D platform_get_irq(pdev, 0);
++
++	if (irq >=3D 0)
++		free_irq(irq, drv_data);
++
++	/* Disconnect from the SPI framework */
++	spi_unregister_master(drv_data->master);
++
++	/* Remove the workqueue */
++	destroy_workqueue(drv_data->workqueue);
++
++	/* Prevent double remove */
++	platform_set_drvdata(pdev, NULL);
++
++	spi_master_put(drv_data->master);
++
++	return 0;
++}
++
++static void spi_ep93xx_shutdown(struct platform_device *pdev)
++{
++	int status =3D 0;
++
++	if ((status =3D spi_ep93xx_remove(pdev)) !=3D 0)
++		dev_err(&pdev->dev, "shutdown failed with %d\n", status);
++}
++
++static struct platform_driver ep93xx_spi_platform_driver =3D {
++	.driver =3D {
++		.name =3D "ep93xx-spi",
++		.bus =3D &platform_bus_type,
++		.owner =3D THIS_MODULE,
++	},
++	.remove =3D __exit_p(spi_ep93xx_remove),
++	.shutdown =3D spi_ep93xx_shutdown,
++};
++
++static int __init spi_ep93xx_init(void)
++{
++	return platform_driver_probe(&ep93xx_spi_platform_driver, spi_ep93xx_p=
robe);
++}
++
++static void __exit spi_ep93xx_exit(void)
++{
++	platform_driver_unregister(&ep93xx_spi_platform_driver);
++}
++
++module_init(spi_ep93xx_init);
++module_exit(spi_ep93xx_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("EP93xx SPI Controller Driver");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("0.21");
+diff --git a/drivers/spi/spi_ep93xx.h b/drivers/spi/spi_ep93xx.h
+new file mode 100644
+index 0000000..6fad735
+--- /dev/null
++++ b/drivers/spi/spi_ep93xx.h
+@@ -0,0 +1,61 @@
++/*
++ *  EP93xx SPI (simple) include
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ * Based on pxa2xx_spi.c by Stephen Street / StreetFire Sound Labs
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ */
++
++/* SSP Registers */
++#define SSPCR0   0x00 /* Control register 0 */
++#define SSPCR1   0x04 /* Control register 1 */
++#define SSPDR    0x08 /* Receice FIFO data register (16-bit read) */
++                      /* Transmit FIFO data register (16-bit write) */
++#define SSPSR    0x0C /* Status register */
++#define SSPCPSR  0x10 /* Clock prescale register (from 2 to 254, even n=
umber) */
++#define SSPIxR   0x14 /* Interrupt identification register (read) */
++                      /* Interrupt clear register (write) */
++
++/* SSP control registers bit fields & masks */
++#define SSP_CONTROL_SCR(x)         (((x) & 0xFF) << 8) /* Serial clock =
rate =3D SCLKOUT / CPSDVR / (1+SCR) */
++#define SSP_CONTROL_SPH            (1 << 7)            /* SCLKOUT phase=
 (for SPI only) */
++#define SSP_CONTROL_SPO            (1 << 6)            /* SCLKOUT polar=
ity (for SPI only) */
++#define SSP_CONTROL_FRF(x)         (((x) & 3) << 4)    /* Frame format =
(0=3DSPI) */
++#define SSP_CONTROL_DSS_4BIT_DATA   3
++#define SSP_CONTROL_DSS_8BIT_DATA   7
++#define SSP_CONTROL_DSS_15BIT_DATA 14
++#define SSP_CONTROL_DSS_16BIT_DATA 15
++#define SSP_CONTROL_DSS_MASK        0xF
++#define SSP_CONTROL_MS              (1 << 5)           /* 0=3Dmaster, 1=
=3Dslave (can be modified when SSE=3D0) */
++#define SSP_CONTROL_SSE             (1 << 4)           /* SSP operation=
 enable (=3D1), disable (=3D0) */
++#define SSP_CONTROL_LBM             (1 << 3)           /* Loop back mod=
e */
++#define SSP_CONTROL_RORIE           (1 << 2)           /* Interrupt ena=
ble : overrun condition */
++#define SSP_CONTROL_TIE             (1 << 1)           /* Interrupt ena=
ble : transmit fifo */
++#define SSP_CONTROL_RIE             (1 << 0)           /* Interrupt ena=
ble : receive fifo */
++
++/* SSP status register (read only) */
++#define SSP_STATUS_BUSY             (1 << 4)           /* Busy flag (0:=
 SSP is idle) */
++#define SSP_STATUS_RFF              (1 << 3)           /* Receive fifo =
full ? (1=3Dfull) */
++#define SSP_STATUS_RNE              (1 << 2)           /* Receive fifo =
not empty ? (0=3Dempty) */
++#define SSP_STATUS_TNF              (1 << 1)           /* Transmit fifo=
 not full ? (0=3Dfull) */
++#define SSP_STATUS_TFE              (1 << 0)           /* Transmit fifo=
 empty ? (1=3Dempty) */
++
++/* SSP SSPIIR/SSPICR register (write 1 to clear interrupt) */
++#define SSP_SSPIxx_RORIS            (1 << 2)           /* Receive fifo =
overrun interrupt status */
++#define SSP_SSPIxx_TIS              (1 << 1)           /* Transmit fifo=
 service request interrupt status */
++#define SSP_SSPIxx_RIS              (1 << 0)           /* Receive fifo =
service request interrupt status */
++
++/* Default configuration values */
++#define SPI_DEFAULT0 (SSP_CONTROL_DSS_16BIT_DATA | SSP_CONTROL_FRF(0) |=
 SSP_CONTROL_SCR(0))
++#define SPI_DEFAULT1 (SSP_CONTROL_SSE | SSP_CONTROL_RORIE)
++#define SPI_DEFAULT_DIVISOR 254
+diff --git a/drivers/spi/tmp124.c b/drivers/spi/tmp124.c
+new file mode 100644
+index 0000000..7f7deaf
+--- /dev/null
++++ b/drivers/spi/tmp124.c
+@@ -0,0 +1,158 @@
++/*
++ *  TMP124 SPI protocol driver
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ * Based on tle62x0.c by Ben Dooks, <ben@simtec.co.uk>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * Note: The chip uses a '3-wire SPI' (miso and mosi are the same pin).
++ */
++
++#include <linux/device.h>
++#include <linux/kernel.h>
++#include <linux/spi/spi.h>
++
++struct tmp124_state {
++  struct spi_device *bus;
++  u8 tx_buff[2];
++  u8 rx_buff[2];
++};
++
++
++static inline int tmp124_write_then_read(struct tmp124_state *st)
++{
++  struct spi_message msg;
++  struct spi_transfer xfer[2] =3D {
++    {
++      .tx_buf      =3D st->tx_buff,
++      .rx_buf      =3D NULL,
++      .len         =3D 2,
++      .delay_usecs =3D 1000,
++    }, {
++      .tx_buf =3D NULL,
++      .rx_buf =3D st->rx_buff,
++      .len    =3D 2,
++    }
++  };
++
++  spi_message_init(&msg);
++  spi_message_add_tail(&xfer[0], &msg);
++  spi_message_add_tail(&xfer[1], &msg);
++
++  return spi_sync(st->bus, &msg);
++}
++
++
++static ssize_t tmp124_temperature_show(struct device *dev,
++    struct device_attribute *attr, char *buf)
++{
++  struct tmp124_state *st =3D dev_get_drvdata(dev);
++  int ret;
++
++  st->tx_buff[0] =3D 0x80;
++  st->tx_buff[1] =3D 0x00;
++
++  ret =3D tmp124_write_then_read(st);
++  if (ret < 0) {
++    dev_err(&st->bus->dev, "tmp124_write_then_read\n");
++    ret =3D 0;
++  } else {
++    signed short v =3D (st->rx_buff[0] << 8) + st->rx_buff[1];
++    signed long val;
++
++    val =3D v >> 3;
++
++    /* 2 digit precision (0.0625*100) */
++    val =3D (val * 50) / 8;
++    ret =3D snprintf(buf, PAGE_SIZE, "%ld.%02d\n", val/100, abs(val%100=
));
++  }
++  return ret;
++}
++
++
++static DEVICE_ATTR(temperature, S_IRUGO, tmp124_temperature_show, NULL)=
;
++
++
++static int __devinit tmp124_probe(struct spi_device *spi)
++{
++  struct tmp124_state *st;
++  int ret;
++
++  st =3D kzalloc(sizeof(struct tmp124_state), GFP_KERNEL);
++  if (st =3D=3D NULL) {
++    dev_err(&spi->dev, "no memory for device state\n");
++    return -ENOMEM;
++  }
++
++  /* required config */
++  spi->bits_per_word =3D 16;
++
++  st->bus =3D spi;
++
++  ret =3D spi_setup(spi);
++  if (ret) {
++    dev_err(&spi->dev, "setup device\n");
++    goto err;
++  }
++
++  ret =3D device_create_file(&spi->dev, &dev_attr_temperature);
++  if (ret) {
++    dev_err(&spi->dev, "cannot create temperature attribute\n");
++    goto err;
++  }
++
++  spi_set_drvdata(spi, st);
++  return 0;
++
++err:
++  kfree(st);
++  return ret;
++}
++
++
++static int __devexit tmp124_remove(struct spi_device *spi)
++{
++  struct tmp124_state *st =3D spi_get_drvdata(spi);
++
++  device_remove_file(&spi->dev, &dev_attr_temperature);
++  kfree(st);
++
++  return 0;
++}
++
++
++static struct spi_driver tmp124_driver =3D {
++  .driver =3D {
++    .name =3D "tmp124",
++    .owner  =3D THIS_MODULE,
++  },
++  .probe    =3D tmp124_probe,
++  .remove   =3D __devexit_p(tmp124_remove),
++};
++
++static __init int tmp124_init(void)
++{
++  return spi_register_driver(&tmp124_driver);
++}
++
++static __exit void tmp124_exit(void)
++{
++  spi_unregister_driver(&tmp124_driver);
++}
++
++module_init(tmp124_init);
++module_exit(tmp124_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("TMP124 SPI Protocol Driver");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("0.1");
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0020-TS-72XX-LCD-console-d=
river.patch b/recipes/linux/linux-2.6.27/ts72xx/0020-TS-72XX-LCD-console-=
driver.patch
new file mode 100644
index 0000000..88105b9
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0020-TS-72XX-LCD-console-driver.p=
atch
@@ -0,0 +1,509 @@
+From 21b42402132b32de5ba249a8ae5024228be1b7f0 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 13:01:07 +0100
+Subject: [PATCH] TS-72XX LCD console driver
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h |    4 +
+ drivers/video/console/Kconfig                   |   21 ++
+ drivers/video/console/Makefile                  |    2 +
+ drivers/video/console/ts72xx_con.c              |  423 ++++++++++++++++=
+++++++
+ 4 files changed, 450 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/video/console/ts72xx_con.c
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h b/arch/arm/=
mach-ep93xx/include/mach/ep93xx-regs.h
+index be0b9d4..c0a8a95 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
++++ b/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
+@@ -94,6 +94,10 @@
+ #define EP93XX_GPIO_B_INT_STATUS	EP93XX_GPIO_REG(0xbc)
+ #define EP93XX_GPIO_B_INT_DEBOUNCE	EP93XX_GPIO_REG(0xc4)
+=20
++#define EP93XX_GPIO_A_DATA		EP93XX_GPIO_REG(0x00)
++#define EP93XX_GPIO_A_DIRECTION		EP93XX_GPIO_REG(0x10)
++#define EP93XX_GPIO_B_DATA		EP93XX_GPIO_REG(0x04)
++
+ #define EP93XX_AAC_BASE			(EP93XX_APB_VIRT_BASE + 0x00080000)
+=20
+ #define EP93XX_SPI_BASE			(EP93XX_APB_VIRT_BASE + 0x000a0000)
+diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconf=
ig
+index 06f87b0..66cc833 100644
+--- a/drivers/video/console/Kconfig
++++ b/drivers/video/console/Kconfig
+@@ -111,6 +111,27 @@ config DUMMY_CONSOLE_ROWS
+           The default value is 64, which should fit a 1280x1024 monitor=
.
+           Select 25 if you use a 640x480 resolution by default.
+=20
++config TS72XX_CONSOLE
++	tristate "TS-72xx text LCD console"
++	depends on ARCH_EP93XX && MACH_TS72XX
++	help
++	  Say Y to build a console driver for TS-72xx LCD (2x7) header.
++	  LCD display must be compatible with HD44780 controller.
++
++config TS72XX_CONSOLE_COLUMNS
++        int "Initial number of console screen columns"
++        depends on TS72XX_CONSOLE
++        default "20"
++        help
++          Dependant to your text LCD, 16 or 20 are legacy values.
++
++config TS72XX_CONSOLE_ROWS
++        int "Initial number of console screen rows"
++        depends on TS72XX_CONSOLE
++        default "4"
++        help
++          Dependant to your text LCD, 2 or 4 are legacy values.
++
+ config FRAMEBUFFER_CONSOLE
+ 	tristate "Framebuffer Console support"
+ 	depends on FB
+diff --git a/drivers/video/console/Makefile b/drivers/video/console/Make=
file
+index ac46cc3..4244b5e 100644
+--- a/drivers/video/console/Makefile
++++ b/drivers/video/console/Makefile
+@@ -26,6 +26,8 @@ obj-$(CONFIG_PROM_CONSOLE)        +=3D promcon.o promc=
on_tbl.o
+ obj-$(CONFIG_STI_CONSOLE)         +=3D sticon.o sticore.o font.o
+ obj-$(CONFIG_VGA_CONSOLE)         +=3D vgacon.o
+ obj-$(CONFIG_MDA_CONSOLE)         +=3D mdacon.o
++obj-$(CONFIG_TS72XX_CONSOLE)      +=3D ts72xx_con.o
++
+ obj-$(CONFIG_FRAMEBUFFER_CONSOLE) +=3D fbcon.o bitblit.o font.o softcur=
sor.o
+ ifeq ($(CONFIG_FB_TILEBLITTING),y)
+ obj-$(CONFIG_FRAMEBUFFER_CONSOLE)     +=3D tileblit.o
+diff --git a/drivers/video/console/ts72xx_con.c b/drivers/video/console/=
ts72xx_con.c
+new file mode 100644
+index 0000000..726085f
+--- /dev/null
++++ b/drivers/video/console/ts72xx_con.c
+@@ -0,0 +1,423 @@
++/*
++ *  TS-72XX lcd console driver for Technologic Systems boards.
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ * Based on linux/drivers/video/console/dummycon.c
++ * Thanks to Jim Jackson (lcdd-0.2beta)
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version
++ * 2 of the License, or (at your option) any later version.
++ *
++ * Note: Port H (LCD_EN, LCD_RS, LCD_WR) uses the new generic GPIO API.
++ *       Port A is used manually used. To fix in future.
++ */
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/console.h>
++#include <linux/vt_kern.h>
++#include <mach/hardware.h>
++#include <mach/gpio.h>
++
++#define DRV_VERSION "0.2"
++#define PFX "ts72xx_con: "
++
++#define LCD_COLUMNS  CONFIG_TS72XX_CONSOLE_COLUMNS
++#define LCD_ROWS     CONFIG_TS72XX_CONSOLE_ROWS
++
++/* HD44780 instruction set */
++#define CMD_CLEAR                                        (0x01)
++#define CMD_CURSOR_HOME                                  (0x02)
++#define CMD_ENTRY_MODE(cursor_dir, display_shift)        (0x04|(2*curso=
r_dir)|display_shift)
++#define CMD_DISPLAY_ONOFF(dis_on, cur_on, cur_blink_on)  (0x08|(4*dis_o=
n)|(2*cur_on)|cur_blink_on)
++#define CMD_FUNCTION_SET(intf_8bit, n, f)                (0x20|(16*intf=
_8bit)|(8*n)|(4*f))
++#define CMD_DDRAM_ADDR(a)                                (0x80|(a))
++
++/* Port H, bit 3:5 */
++#define LCD_EN   EP93XX_GPIO_LINE_H(3)
++#define LCD_RS   EP93XX_GPIO_LINE_H(4)
++#define LCD_WR   EP93XX_GPIO_LINE_H(5)
++
++/* Timings */
++#define SETUP_TIME   15
++#define ENABLE_TIME  36
++#define HOLD_TIME    22
++
++#define hd44780_delay(x) asm volatile ( \
++  "1:\n"\
++  "subs %1, %1, #1;\n"\
++  "bne 1b;\n"\
++  : "=3Dr" ((x)) : "r" ((x)) \
++);
++
++
++/* Prototypes */
++static void hd44780_wait(void);
++static void hd44780_send_data(unsigned char data);
++static void hd44780_send_command(unsigned char command);
++static void hd44780_init(void);
++static int hd44780_gotoxy(int x, int y);
++
++
++/* HD44780 controller */
++
++static void hd44780_wait(void)
++{
++  int i;
++  unsigned char c;
++
++  __raw_writeb(0x00, EP93XX_GPIO_A_DIRECTION);   // bus input
++  gpio_set_value(LCD_RS, 0);                     // low for control reg=
isters
++  gpio_set_value(LCD_WR, 1);                     // read command
++
++  do {
++    i =3D SETUP_TIME;
++    hd44780_delay(i);
++
++    gpio_set_value(LCD_EN, 1);
++
++    i =3D ENABLE_TIME;
++    hd44780_delay(i);
++
++    c =3D __raw_readb(EP93XX_GPIO_A_DATA);
++    gpio_set_value(LCD_EN, 0);
++  } while (c & 0x80); // busy flag
++
++  i =3D HOLD_TIME;
++  hd44780_delay(i);
++}
++
++
++static void hd44780_send_data(unsigned char data)
++{
++  int i;
++
++  __raw_writeb(0xFF, EP93XX_GPIO_A_DIRECTION);   // bus output
++  gpio_set_value(LCD_RS, 1);                     // high for data
++  gpio_set_value(LCD_WR, 0);                     // write data
++
++  i =3D SETUP_TIME;
++  hd44780_delay(i);
++
++  __raw_writeb(data, EP93XX_GPIO_A_DATA);
++  gpio_set_value(LCD_EN, 1);
++
++  i =3D ENABLE_TIME;
++  hd44780_delay(i);
++
++  gpio_set_value(LCD_EN, 0);
++
++  i =3D HOLD_TIME;
++  hd44780_delay(i);
++}
++
++
++static void hd44780_send_command(unsigned char command)
++{
++  int i;
++
++  __raw_writeb(0xFF, EP93XX_GPIO_A_DIRECTION);   // bus output
++  gpio_set_value(LCD_RS, 0);                     // low for control reg=
isters
++  gpio_set_value(LCD_WR, 0);                     // write command
++
++  i =3D SETUP_TIME;
++  hd44780_delay(i);
++
++  __raw_writeb(command, EP93XX_GPIO_A_DATA);
++  gpio_set_value(LCD_EN, 1);
++
++  i =3D ENABLE_TIME;
++  hd44780_delay(i);
++
++  gpio_set_value(LCD_EN, 0);
++
++  i =3D HOLD_TIME;
++  hd44780_delay(i);
++}
++
++
++static void hd44780_init(void)
++{
++  int i;
++
++  gpio_direction_output(LCD_EN, 0);
++  gpio_direction_output(LCD_RS, 0);
++  gpio_direction_output(LCD_WR, 0);
++
++  /* Port A (8 bits) is data bus */
++  __raw_writeb(0x00, EP93XX_GPIO_A_DATA);
++  __raw_writeb(0x00, EP93XX_GPIO_A_DIRECTION);
++
++  /* 8-bit mode, double line, 5x7 dot character format */
++  hd44780_send_command(CMD_FUNCTION_SET(1,1,1));
++  i =3D 5000;
++  hd44780_delay(i);
++
++  /* Display on and blink cursor on */
++  hd44780_send_command(CMD_DISPLAY_ONOFF(1,1,1));
++  hd44780_wait();
++
++  /* Cursor in increment position and shift is invisible */
++  hd44780_send_command(CMD_ENTRY_MODE(0,0));
++  hd44780_wait();
++
++  /* Clean display and return cursor to home position */
++  hd44780_send_command(CMD_CLEAR);
++  hd44780_wait();
++}
++
++
++static int hd44780_gotoxy(int x, int y)
++{
++  const unsigned char lines[4] =3D { 0x00, 0x40, 0x14, 0x54 };
++
++  if ((x =3D=3D 0) && (y =3D=3D 0)) {
++    hd44780_send_command(CMD_CURSOR_HOME);
++    hd44780_wait();
++  } else if (y < 4) {
++    hd44780_send_command(CMD_DDRAM_ADDR(lines[y]+x));
++    hd44780_wait();
++  }
++
++  return 0;
++}
++
++
++/* Console operation functions */
++
++static const char *lcdcon_startup(void)
++{
++  return "ts72xx lcd console";
++}
++
++
++static void lcdcon_init(struct vc_data *vc, int init)
++{
++  hd44780_init();
++
++  vc->vc_can_do_color =3D 0;
++  vc->vc_video_erase_char =3D 0x20;
++
++  if (init) {
++    vc->vc_cols =3D LCD_COLUMNS;
++    vc->vc_rows =3D LCD_ROWS;
++  } else
++    vc_resize(vc, LCD_COLUMNS, LCD_ROWS);
++
++}
++
++
++static void lcdcon_deinit(struct vc_data *vc)
++{
++}
++
++
++static void lcdcon_clear(struct vc_data *vc, int sy, int sx,
++    int height, int width)
++{
++  int i, j;
++
++  if (!height || !width)
++    return;
++
++  for (i =3D 0; i < height; i++) {
++    hd44780_gotoxy(sx, sy + i);
++    for (j =3D 0; j < width; j++) {
++      hd44780_send_data((unsigned char)vc->vc_video_erase_char);
++      hd44780_wait();
++    }
++  }
++
++}
++
++
++static int lcdcon_blank(struct vc_data *vc, int blank, int mode_switch)
++{
++  unsigned char c;
++
++  if (blank =3D=3D 0) {
++    c =3D CMD_DISPLAY_ONOFF(1,1,1);    /* Display on */
++  } else {
++    c =3D CMD_DISPLAY_ONOFF(0,1,1);    /* Display off */
++  }
++
++  hd44780_send_command(c);
++  hd44780_wait();
++
++  return 1;
++}
++
++
++static int lcdcon_set_palette(struct vc_data *vc, unsigned char *table)
++{
++  return -EINVAL;
++}
++
++
++static void lcdcon_putc(struct vc_data *vc, int c, int y, int x)
++{
++  if (vc->vc_mode !=3D KD_TEXT)
++    return;
++
++  hd44780_gotoxy(x, y);
++  hd44780_send_data((unsigned char)c);
++  hd44780_wait();
++}
++
++
++static void lcdcon_putcs(struct vc_data *vc, const unsigned short *s,
++    int count, int y, int x)
++{
++  if (vc->vc_mode !=3D KD_TEXT)
++    return;
++
++  hd44780_gotoxy(x, y);
++  while (count--) {
++    hd44780_send_data((unsigned char)(*s));
++    hd44780_wait();
++    s++;
++  }
++
++}
++
++
++static void lcdcon_cursor(struct vc_data *vc, int mode)
++{
++  hd44780_gotoxy(vc->vc_x, vc->vc_y);
++
++  switch (mode) {
++    case CM_ERASE:
++      hd44780_send_command(CMD_DISPLAY_ONOFF(1,0,0)); // Cursor off
++      hd44780_wait();
++      break;
++
++    case CM_DRAW:
++      hd44780_send_command(CMD_DISPLAY_ONOFF(1,1,1)); // Cursor on, Bli=
nking on
++      hd44780_wait();
++      break;
++
++    case CM_MOVE:
++      printk("lcdcon_cursor CM_MOVE not implemented\n");
++      break;
++  }
++
++}
++
++
++static int lcdcon_scroll(struct vc_data *vc, int t, int b, int dir, int=
 count)
++{
++  int i;
++
++  if (!count)
++    return 0;
++
++  /* Special case */
++  //if (t || b !=3D vc->vc_rows)
++  // scroll area
++
++  switch (dir) {
++    case SM_UP:
++      if (count > vc->vc_rows)
++        count =3D vc->vc_rows;
++
++      for (i =3D 0; i < (vc->vc_rows - count); i++) {
++        lcdcon_putcs(vc, vc->vc_screenbuf + (vc->vc_y - i)*vc->vc_cols,
++            vc->vc_cols, vc->vc_y - i -1, 0);
++      }
++
++      /* Clear last line */
++      hd44780_gotoxy(0, vc->vc_y);
++      for (i =3D 0; i < vc->vc_cols; i++) {
++        hd44780_send_data((unsigned char)vc->vc_video_erase_char);
++        hd44780_wait();
++      }
++      break;
++
++    case SM_DOWN:
++      printk("lcdcon_scroll DOWN (t=3D%d b=3D%d count=3D%d) not implemt=
ented\n", t,b,count);
++      break;
++  }
++
++  return 0;
++}
++
++
++static void lcdcon_bmove(struct vc_data *vc, int sy, int sx,
++    int dy, int dx, int height, int width)
++{
++  int i, j;
++
++  if (!height || !width)
++    return;
++
++  for (i =3D 0; i < height; i++) {
++    hd44780_gotoxy(dx, dy + i);
++    for (j =3D 0; j < width; j++) {
++      hd44780_send_data((unsigned char)(*(vc->vc_screenbuf +
++              (sy+i)*vc->vc_cols + (sx+j) )));
++      hd44780_wait();
++    }
++  }
++}
++
++
++static int lcdcon_dummy(void)
++{
++  return 0;
++}
++
++#define DUMMY (void *)lcdcon_dummy
++
++
++/* Main structure */
++const struct consw ts72xx_lcd_con =3D {
++  .owner =3D    THIS_MODULE,
++  .con_startup =3D lcdcon_startup,
++  .con_init    =3D lcdcon_init,
++  .con_deinit  =3D lcdcon_deinit,
++  .con_clear   =3D lcdcon_clear,
++  .con_putc    =3D lcdcon_putc,
++  .con_putcs   =3D lcdcon_putcs,
++  .con_cursor  =3D lcdcon_cursor,
++  .con_scroll  =3D lcdcon_scroll,
++  .con_bmove   =3D lcdcon_bmove,
++  .con_switch  =3D DUMMY,
++  .con_blank   =3D lcdcon_blank,
++
++  /* We cannot change color, fonts on character LCD */
++  .con_font_set     =3D DUMMY,
++  .con_font_get     =3D DUMMY,
++  .con_font_default =3D DUMMY,
++  .con_font_copy    =3D DUMMY,
++  .con_set_palette  =3D lcdcon_set_palette,
++
++  //.con_scrolldelta   =3D lcdcon_scrolldelta,
++  //.con_set_origin    =3D DUMMY,
++  //.con_save_screen   =3D lcdcon_save_screen,
++  //.con_build_attr    =3D lcdcon_build_attr,
++  //.con_invert_region =3D lcdcon_invert_region,
++  //.con_screen_pos    =3D lcdcon_screen_pos,
++  //.con_getxy         =3D lcdcon_getxy,
++};
++
++/* Module functions */
++
++static int __init ts72xx_lcd_init(void)
++{
++  return take_over_console(&ts72xx_lcd_con, 0, MAX_NR_CONSOLES-1, 1);
++}
++
++static void __exit ts72xx_lcd_exit(void)
++{
++  unregister_con_driver(&ts72xx_lcd_con);
++}
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("TS-72xx lcd console driver");
++MODULE_LICENSE("GPL");
++MODULE_VERSION(DRV_VERSION);
++
++module_init(ts72xx_lcd_init);
++module_exit(ts72xx_lcd_exit);
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0021-EP93xx-GPIO-matrix-ke=
ypad.patch b/recipes/linux/linux-2.6.27/ts72xx/0021-EP93xx-GPIO-matrix-ke=
ypad.patch
new file mode 100644
index 0000000..b025b11
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0021-EP93xx-GPIO-matrix-keypad.pa=
tch
@@ -0,0 +1,564 @@
+From e732ad0ba1fc82bfa922fe661f1aac4681e77cb6 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 13:04:56 +0100
+Subject: [PATCH] EP93xx GPIO matrix keypad
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/ep93xx-keypad.h |   30 +++
+ drivers/input/keyboard/Kconfig                    |   43 +++
+ drivers/input/keyboard/Makefile                   |    4 +
+ drivers/input/keyboard/ep93xx-keypad.c            |  291 ++++++++++++++=
+++++++
+ drivers/input/keyboard/ts72xx_dio_3x4.c           |   65 +++++
+ drivers/input/keyboard/ts72xx_dio_4x4.c           |   65 +++++
+ 6 files changed, 498 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/include/mach/ep93xx-keypad.h
+ create mode 100644 drivers/input/keyboard/ep93xx-keypad.c
+ create mode 100644 drivers/input/keyboard/ts72xx_dio_3x4.c
+ create mode 100644 drivers/input/keyboard/ts72xx_dio_4x4.c
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/ep93xx-keypad.h b/arch/ar=
m/mach-ep93xx/include/mach/ep93xx-keypad.h
+new file mode 100644
+index 0000000..e39743a
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/include/mach/ep93xx-keypad.h
+@@ -0,0 +1,30 @@
++/*
++ *  EP93xx "GPIO Port X" input keypad driver
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ * Based on OMAP Keypad Driver (omap-keypad.c)
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version
++ * 2 of the License, or (at your option) any later version.
++ */
++
++#ifndef EP93XX_KEYPAD_H
++#define EP93XX_KEYPAD_H
++
++#define EP93XX_PORTX_MAXROW 4
++#define EP93XX_PORTX_MAXCOL 4
++
++/* Example: Port X bit 0..7 =3D C0,..Cx,R0..Ry
++ * Cols are outputs
++ * Rows are inputs
++ */
++struct ep93xx_gpio_portx_keypad_platform_data {
++  int nr_rows, nr_cols;
++  int keycodes[EP93XX_PORTX_MAXROW][EP93XX_PORTX_MAXCOL]; /* Left to ri=
ght, from top to bottom */
++  int gpio_rows[EP93XX_PORTX_MAXROW];                     /* R0, R1, ..=
, R_{MAXROW-1} */
++  int gpio_cols[EP93XX_PORTX_MAXCOL];                     /* C0, C1, ..=
, C_{MAXCOL-1} */
++};
++
++#endif /* EP93XX_KEYPAD_H */
+diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kco=
nfig
+index efd70a9..68df990 100644
+--- a/drivers/input/keyboard/Kconfig
++++ b/drivers/input/keyboard/Kconfig
+@@ -323,4 +323,47 @@ config KEYBOARD_SH_KEYSC
+=20
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called sh_keysc.
++
++config KEYBOARD_EP93XX
++	tristate "EP93xx GPIO matrix keypad support"
++	depends on ARCH_EP93XX
++	help
++	  This driver implements supports for a matrix keypad connected
++	  to GPIO port B. Maximum of 4 rows and 4 cols are supported
++	  (using up to 4 interrupts).
++	  This is implemented as a platform driver.
++
++	  To compile this driver as a module, choose M here: the
++	  module will be called ep93xx-keypad.
++
++if KEYBOARD_EP93XX
++=09
++choice
++	prompt "Keypad type"
++	default TS72XX_DIO_4X4_KEYPAD
++
++config TS72XX_DIO_3X4_KEYPAD
++	tristate "TS-72xx 3x4 matrix keypad"
++	depends on MACH_TS72XX
++	help
++	  This a 12 keys (4 rows, 3 cols using DIO_0-6) keypad with the follow=
ing layout:
++	  1 2 3
++	  4 5 6
++	  7 8 9
++	  * 0 #
++
++config TS72XX_DIO_4X4_KEYPAD
++	tristate "TS-72xx 4x4 matrix keypad"
++	depends on MACH_TS72XX
++	help
++	  This a 16 keys (4 rows, 4 cols using DIO_0-7) keypad with the follow=
ing layout:
++	  7 8 9 F
++	  4 5 6 E
++	  1 2 3 D
++	  A 0 B C
++
++endchoice
++
++endif # KEYBOARD_EP93XX
++
+ endif
+diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Ma=
kefile
+index 0edc8f2..550adc7 100644
+--- a/drivers/input/keyboard/Makefile
++++ b/drivers/input/keyboard/Makefile
+@@ -27,3 +27,7 @@ obj-$(CONFIG_KEYBOARD_HP7XX)		+=3D jornada720_kbd.o
+ obj-$(CONFIG_KEYBOARD_MAPLE)		+=3D maple_keyb.o
+ obj-$(CONFIG_KEYBOARD_BFIN)		+=3D bf54x-keys.o
+ obj-$(CONFIG_KEYBOARD_SH_KEYSC)		+=3D sh_keysc.o
++obj-$(CONFIG_KEYBOARD_EP93XX)		+=3D ep93xx-keypad.o
++
++obj-$(CONFIG_TS72XX_DIO_3X4_KEYPAD)		+=3D ts72xx_dio_3x4.o
++obj-$(CONFIG_TS72XX_DIO_4X4_KEYPAD)		+=3D ts72xx_dio_4x4.o
+diff --git a/drivers/input/keyboard/ep93xx-keypad.c b/drivers/input/keyb=
oard/ep93xx-keypad.c
+new file mode 100644
+index 0000000..7259f38
+--- /dev/null
++++ b/drivers/input/keyboard/ep93xx-keypad.c
+@@ -0,0 +1,291 @@
++/*
++ *  EP93xx "GPIO Port B" input keypad driver
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ * Based on OMAP Keypad Driver (omap-keypad.c)
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version
++ * 2 of the License, or (at your option) any later version.
++ */
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/interrupt.h>
++#include <linux/delay.h>
++#include <linux/input.h>
++#include <linux/platform_device.h>
++#include <linux/irq.h>
++#include <mach/hardware.h>
++#include <mach/gpio.h>
++
++#include <mach/ep93xx-keypad.h>
++
++#define DRV_NAME_PREFIX "ep93xx_keypad: "
++#define DRV_VERSION "2.0"
++
++/* We choose port B */
++#define EP93XX_GPIO_X_DATA      EP93XX_GPIO_B_DATA
++#define EP93XX_GPIO_LINE_X      EP93XX_GPIO_LINE_B
++
++struct ep93xx_gpio_portx_keypad {
++  u8 rows;
++  u8 cols;
++  int irqs[EP93XX_PORTX_MAXROW];
++  u8 mask_input;
++  u8 mask_output;
++  u8 row_trigger, col_trigger;
++  u8 mask_input_trigger;
++  struct timer_list timer;
++  struct input_dev *input;
++  struct ep93xx_gpio_portx_keypad_platform_data *rsc;
++};
++
++static void ep93xx_gpio_portx_tasklet(unsigned long);
++static void ep93xx_gpio_portx_timer(unsigned long);
++
++DECLARE_TASKLET_DISABLED(kp_tasklet, ep93xx_gpio_portx_tasklet, 0);
++
++
++static void ep93xx_gpio_portx_timer(unsigned long data)
++{
++  struct ep93xx_gpio_portx_keypad *ctx =3D (struct ep93xx_gpio_portx_ke=
ypad *)data;
++  int i;
++
++  for (i =3D 0; i < ctx->rows; i++)
++    enable_irq(ctx->irqs[i]);
++}
++
++
++static void ep93xx_gpio_portx_tasklet(unsigned long data)
++{
++  struct ep93xx_gpio_portx_keypad *ctx =3D (struct ep93xx_gpio_portx_ke=
ypad *)data;
++  int i, j;
++  u8 save;
++
++  /* Save data register */
++  save =3D __raw_readb(EP93XX_GPIO_X_DATA);
++
++  /* Make sure row is still 0 */
++  if (!(save & ctx->mask_input_trigger)) {
++
++    for (i =3D 0; i < ctx->cols; i++) {
++      for (j =3D 0; j < ctx->cols; j++) {
++        if (i =3D=3D j)
++          gpio_set_value(EP93XX_GPIO_LINE_X(ctx->rsc->gpio_cols[j]), 1)=
; //high
++        else
++          gpio_set_value(EP93XX_GPIO_LINE_X(ctx->rsc->gpio_cols[j]), 0)=
; //low
++      }
++
++      if (__raw_readb(EP93XX_GPIO_X_DATA) & ctx->mask_input_trigger) {
++        ctx->col_trigger =3D i;
++        //printk("=3D>key col=3D%d, row=3D%d |%x\n", i, ctx->row_trigge=
r, ctx->rsc->keycodes[ctx->row_trigger][i]);
++        input_report_key(ctx->input, ctx->rsc->keycodes[ctx->row_trigge=
r][ctx->col_trigger], 1);
++        input_sync(ctx->input);
++      }
++    }
++
++  } else { // key released
++    input_report_key(ctx->input, ctx->rsc->keycodes[ctx->row_trigger][c=
tx->col_trigger], 0);
++    input_sync(ctx->input);
++  }
++
++  /* Restore all outputs to 0 */
++  __raw_writeb(save, EP93XX_GPIO_X_DATA);
++
++  /* Wait a little before enabling IRQ again */
++  mod_timer(&ctx->timer, jiffies + HZ/10);
++}
++
++
++/* Interrupt handler */
++static irqreturn_t ep93xx_gpio_portx_key_int(int irq, void *dev_id)
++{
++  struct ep93xx_gpio_portx_keypad *ctx =3D dev_id;
++  int i;
++
++  for (i =3D 0; i < ctx->rows; i++)
++    disable_irq(ctx->irqs[i]);
++
++  ctx->mask_input_trigger =3D 0;
++  for (i =3D 0; i < ctx->rows; i++) {
++    if (gpio_to_irq(EP93XX_GPIO_LINE_X(ctx->rsc->gpio_rows[i])) =3D=3D =
irq) {
++      ctx->row_trigger =3D i;
++      ctx->mask_input_trigger =3D (1 << ctx->rsc->gpio_rows[i]);
++      break;
++    }
++  }
++
++  // deferred-execution method
++  tasklet_schedule(&kp_tasklet);
++
++  return IRQ_HANDLED;
++}
++
++
++static int __devinit ep93xx_keypad_probe(struct platform_device *pdev)
++{
++  struct ep93xx_gpio_portx_keypad *ctx;
++  struct input_dev *input_dev;
++  int i, j, ret, irq_idx;
++  struct ep93xx_gpio_portx_keypad_platform_data *pdata =3D  pdev->dev.p=
latform_data;
++
++  const char *irq_names[EP93XX_PORTX_MAXROW] =3D {
++    "kp-row0", "kp-row1", "kp-row2", "kp-row3" };
++
++  if (pdata =3D=3D NULL) {
++    return -EINVAL;
++  }
++
++  if (!pdata->nr_rows || !pdata->nr_cols ||
++      (pdata->nr_rows > EP93XX_PORTX_MAXROW) ||
++      (pdata->nr_cols > EP93XX_PORTX_MAXCOL)) {
++    printk(KERN_ERR DRV_NAME_PREFIX "No rows, cols from pdata\n");
++    return -EINVAL;
++  }
++
++  ctx =3D kzalloc(sizeof(struct ep93xx_gpio_portx_keypad), GFP_KERNEL);
++  if (!ctx) {
++    return -ENOMEM;
++  }
++
++  input_dev =3D input_allocate_device();
++  if (!input_dev) {
++    kfree(ctx);
++    return -ENOMEM;
++  }
++
++  platform_set_drvdata(pdev, ctx);
++
++  ctx->input =3D input_dev;
++  ctx->rsc   =3D pdata;
++  ctx->rows  =3D pdata->nr_rows;
++  ctx->cols  =3D pdata->nr_cols;
++
++  input_dev->evbit[0] =3D BIT(EV_KEY); // | BIT(EV_REP);
++
++  for (i =3D 0; i < pdata->nr_rows; i++) {
++    for (j =3D 0; j < pdata->nr_cols; j++) {
++      int code =3D pdata->keycodes[i][j];
++      if (code > 0)
++        set_bit(code, input_dev->keybit);
++    }
++  }
++  __clear_bit(KEY_RESERVED, input_dev->keybit);
++
++  input_dev->name =3D "GPIO keypad";
++  input_dev->phys =3D "ep93xx-keypad/input0";
++  input_dev->dev.parent =3D &pdev->dev;
++
++  input_dev->id.bustype =3D BUS_HOST;
++  input_dev->id.vendor  =3D 0x0001;
++  input_dev->id.product =3D 0x0001;
++  input_dev->id.version =3D 0x0100;
++
++  ret =3D input_register_device(ctx->input);
++  if (ret < 0) {
++    printk(KERN_ERR DRV_NAME_PREFIX "Unable to register input device\n"=
);
++    goto err1;
++  }
++
++  ctx->mask_output =3D 0;
++  for (i =3D 0; i < pdata->nr_cols; i++) {
++    ctx->mask_output |=3D (1 << pdata->gpio_cols[i]);
++    gpio_direction_output(EP93XX_GPIO_LINE_X(pdata->gpio_cols[i]), 0); =
// low
++  }
++
++  ctx->mask_input =3D 0;
++  for (i =3D 0; i < pdata->nr_rows; i++) {
++    ctx->mask_input |=3D (1 << pdata->gpio_rows[i]);
++    gpio_direction_input(EP93XX_GPIO_LINE_X(pdata->gpio_rows[i]));
++  }
++
++  for (i =3D 0; i < pdata->nr_rows; i++) {
++    ctx->irqs[i] =3D gpio_to_irq(EP93XX_GPIO_LINE_X(pdata->gpio_rows[i]=
));
++    set_irq_type(ctx->irqs[i], IRQ_TYPE_EDGE_FALLING);
++    ep93xx_gpio_int_debounce(ctx->irqs[i], 1); // TODO: create IRQ_TYPE=
_DEBOUNCE
++
++    ret =3D request_irq(ctx->irqs[i], ep93xx_gpio_portx_key_int, 0, irq=
_names[i], ctx);
++    if (ret < 0) {
++      irq_idx =3D i;
++      printk(KERN_ERR DRV_NAME_PREFIX "request_irq (%d)\n", ctx->irqs[i=
]);
++      goto err2;
++    }
++  }
++
++  tasklet_enable(&kp_tasklet);
++  kp_tasklet.data =3D (unsigned long)ctx;
++
++  setup_timer(&ctx->timer, ep93xx_gpio_portx_timer, (unsigned long)ctx)=
;
++
++  return 0;
++
++err2:
++  for (i =3D 0; i <=3D irq_idx; i++)
++    free_irq(ctx->irqs[i], ctx);
++  input_unregister_device(input_dev);
++  input_dev =3D NULL;
++err1:
++  kfree(ctx);
++  input_free_device(input_dev);
++
++  return -EINVAL;
++}
++
++
++static int __devexit ep93xx_keypad_remove(struct platform_device *pdev)
++{
++  struct ep93xx_gpio_portx_keypad *ctx =3D platform_get_drvdata(pdev);
++  int i;
++
++  for (i =3D 0; i < ctx->rows; i++) {
++    disable_irq(ctx->irqs[i]);
++    free_irq(ctx->irqs[i], ctx);
++  }
++
++  del_timer_sync(&ctx->timer);
++
++  tasklet_disable(&kp_tasklet);
++  tasklet_kill(&kp_tasklet);
++
++  input_unregister_device(ctx->input);
++  kfree(ctx);
++
++  return 0;
++}
++
++
++#define ep93xx_keypad_suspend NULL
++#define ep93xx_keypad_resume  NULL
++
++static struct platform_driver ep93xx_keypad_driver =3D {
++  .driver   =3D {
++    .name =3D "ep93xx-gpio-keypad",
++    .owner  =3D THIS_MODULE,
++  },
++  .probe    =3D ep93xx_keypad_probe,
++  .remove   =3D __devexit_p(ep93xx_keypad_remove),
++  .suspend  =3D ep93xx_keypad_suspend,
++  .resume   =3D ep93xx_keypad_resume,
++};
++
++static int __init ep93xx_keypad_init(void)
++{
++  printk(KERN_INFO DRV_NAME_PREFIX "platform driver v" DRV_VERSION "\n"=
);
++  return platform_driver_register(&ep93xx_keypad_driver);
++}
++
++static void __exit ep93xx_keypad_exit(void)
++{
++  platform_driver_unregister(&ep93xx_keypad_driver);
++}
++
++module_init(ep93xx_keypad_init);
++module_exit(ep93xx_keypad_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("EP93xx GPIO port B keypad driver");
++MODULE_LICENSE("GPL");
++MODULE_VERSION(DRV_VERSION);
+diff --git a/drivers/input/keyboard/ts72xx_dio_3x4.c b/drivers/input/key=
board/ts72xx_dio_3x4.c
+new file mode 100644
+index 0000000..8a2e9ee
+--- /dev/null
++++ b/drivers/input/keyboard/ts72xx_dio_3x4.c
+@@ -0,0 +1,65 @@
++/*
++ *  TS-72xx keypad device driver for DIO1 header (DIO_0 thru DIO_7 are =
using port B)
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version
++ * 2 of the License, or (at your option) any later version.
++ */
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/input.h>
++
++#include <mach/ep93xx-keypad.h>
++
++/* Port B =3D XX R0 R1 R2 R3 C0 C1 C2
++ * (i.e. col2 is bit 0, row0 is bit 6, ...)
++ */
++static struct ep93xx_gpio_portx_keypad_platform_data kp_portb_3x4 =3D {
++  .nr_rows =3D 4,
++  .nr_cols =3D 3,
++  { { KEY_1, KEY_2, KEY_3 },
++    { KEY_4, KEY_5, KEY_6 },
++    { KEY_7, KEY_8, KEY_9 },
++    { KEY_KPASTERISK, KEY_0, KEY_ENTER }
++  },
++  .gpio_rows =3D { 6, 5, 4, 3 },
++  .gpio_cols =3D { 2, 1, 0 },
++};
++
++
++static void ts72xx_dio_release(struct device *dev)
++{
++  // nothing to do (no kfree) because we have static struct
++}
++
++static struct platform_device kp_portb_3x4_device =3D {
++  .name =3D "ep93xx-gpio-keypad",
++  .id   =3D -1, // one instance only
++  .dev    =3D {
++    .platform_data =3D &kp_portb_3x4,
++    .release =3D ts72xx_dio_release,
++  },
++};
++
++static int __init ts72xx_dio_init(void)
++{
++  return platform_device_register(&kp_portb_3x4_device);
++}
++
++static void __exit ts72xx_dio_exit(void)
++{
++  platform_device_unregister(&kp_portb_3x4_device);
++}
++
++module_init(ts72xx_dio_init);
++module_exit(ts72xx_dio_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("Platform device 3x4 keypad");
++MODULE_LICENSE("GPL");
+diff --git a/drivers/input/keyboard/ts72xx_dio_4x4.c b/drivers/input/key=
board/ts72xx_dio_4x4.c
+new file mode 100644
+index 0000000..c536003
+--- /dev/null
++++ b/drivers/input/keyboard/ts72xx_dio_4x4.c
+@@ -0,0 +1,65 @@
++/*
++ *  TS-72xx keypad device driver for DIO1 header (DIO_0 thru DIO_7 are =
using port B)
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version
++ * 2 of the License, or (at your option) any later version.
++ */
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/input.h>
++
++#include <mach/ep93xx-keypad.h>
++
++/* Port B =3D C0 R3 C1 R2 C2 C3 R1 R0
++ * (i.e. row0 is bit 0, row1 is bit 1, ...)
++ */
++static struct ep93xx_gpio_portx_keypad_platform_data kp_portb_4x4 =3D {
++  .nr_rows =3D 4,
++  .nr_cols =3D 4,
++  { { KEY_7, KEY_8, KEY_9, KEY_F },
++    { KEY_4, KEY_5, KEY_6, KEY_E },
++    { KEY_1, KEY_2, KEY_3, KEY_D },
++    { KEY_A, KEY_0, KEY_B, KEY_C }
++  },
++  .gpio_rows =3D { 0, 1, 4, 6 },
++  .gpio_cols =3D { 7, 5, 3, 2 },
++};
++
++
++static void ts72xx_dio_release(struct device *dev)
++{
++  // nothing to do (no kfree) because we have static struct
++}
++
++static struct platform_device kp_portb_4x4_device =3D {
++  .name =3D "ep93xx-gpio-keypad",
++  .id   =3D -1, // one instance only
++  .dev    =3D {
++    .platform_data =3D &kp_portb_4x4,
++    .release =3D ts72xx_dio_release,
++  },
++};
++
++static int __init ts72xx_dio_init(void)
++{
++  return platform_device_register(&kp_portb_4x4_device);
++}
++
++static void __exit ts72xx_dio_exit(void)
++{
++  platform_device_unregister(&kp_portb_4x4_device);
++}
++
++module_init(ts72xx_dio_init);
++module_exit(ts72xx_dio_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("Platform device 4x4 keypad");
++MODULE_LICENSE("GPL");
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0022-TS-72xx-RS485-auto-mo=
de-support.patch b/recipes/linux/linux-2.6.27/ts72xx/0022-TS-72xx-RS485-a=
uto-mode-support.patch
new file mode 100644
index 0000000..988a20f
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0022-TS-72xx-RS485-auto-mode-supp=
ort.patch
@@ -0,0 +1,218 @@
+From 41163459c76f0540aee9d60e13059ba31f684e15 Mon Sep 17 00:00:00 2001
+From: =3D?utf-8?q?Petr=3D20=3DC5=3DA0tetiar?=3D <ynezz@true.cz>
+Date: Sun, 4 Jan 2009 16:07:51 +0100
+Subject: [PATCH] TS-72xx RS485 auto mode support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/include/asm/ioctls.h              |    3 +
+ arch/arm/mach-ep93xx/include/mach/ts72xx.h |    8 ++
+ drivers/serial/amba-pl010.c                |  121 +++++++++++++++++++++=
+++++++
+ 3 files changed, 132 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/include/asm/ioctls.h b/arch/arm/include/asm/ioctls=
.h
+index a91d8a1..a4b60ae 100644
+--- a/arch/arm/include/asm/ioctls.h
++++ b/arch/arm/include/asm/ioctls.h
+@@ -70,6 +70,9 @@
+ #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts =
*/
+ #define FIOQSIZE	0x545E
+=20
++#define TIOC_SBCC485	0x545F /* TS72xx RTS/485 mode clear */
++#define TIOC_SBCS485	0x5460 /* TS72xx RTS/485 mode set */
++
+ /* Used for packet mode */
+ #define TIOCPKT_DATA		 0
+ #define TIOCPKT_FLUSHREAD	 1
+diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-=
ep93xx/include/mach/ts72xx.h
+index 601d0a3..1262e2b 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+@@ -70,6 +70,14 @@
+ #define TS72XX_NAND_BUSY_VIRT_BASE	0xfebfa000
+ #define TS72XX_NAND_BUSY_SIZE		0x00001000
+=20
++#define TS72XX_RS485_AUTO485FD		1
++#define TS72XX_RS485_AUTO485HD		2
++#define TS72XX_RS485_MODE_RS232	0x00
++#define TS72XX_RS485_MODE_FD		0x01
++#define TS72XX_RS485_MODE_9600_HD	0x04
++#define TS72XX_RS485_MODE_19200_HD	0x05
++#define TS72XX_RS485_MODE_57600_HD	0x06
++#define TS72XX_RS485_MODE_115200_HD	0x07
+=20
+ #define TS72XX_RTC_INDEX_VIRT_BASE	0xfebf9000
+ #define TS72XX_RTC_INDEX_PHYS_BASE	0x10800000
+diff --git a/drivers/serial/amba-pl010.c b/drivers/serial/amba-pl010.c
+index 90b56c2..d609666 100644
+--- a/drivers/serial/amba-pl010.c
++++ b/drivers/serial/amba-pl010.c
+@@ -49,6 +49,7 @@
+ #include <linux/clk.h>
+=20
+ #include <asm/io.h>
++#include <mach/ts72xx.h>
+=20
+ #define UART_NR		8
+=20
+@@ -64,6 +65,11 @@
+ #define UART_DUMMY_RSR_RX	256
+ #define UART_PORT_SIZE		64
+=20
++#ifdef CONFIG_MACH_TS72XX
++static void __iomem *ts_rs485_data9_register;
++static void __iomem *ts_rs485_control_register;
++#endif
++
+ /*
+  * We wrap our port structure around the generic uart_port.
+  */
+@@ -519,6 +525,107 @@ static int pl010_verify_port(struct uart_port *por=
t, struct serial_struct *ser)
+ 	return ret;
+ }
+=20
++#ifdef CONFIG_MACH_TS72XX
++static int ts72xx_rs485_init(void)
++{
++	ts_rs485_data9_register =3D ioremap(TS72XX_RS485_MODE_PHYS_BASE, 4096)=
;
++	if (ts_rs485_data9_register =3D=3D NULL) {
++		return -1;
++	}
++
++	ts_rs485_control_register =3D ioremap(TS72XX_RS485_CONTROL_PHYS_BASE, =
4096);
++	if (ts_rs485_control_register =3D=3D NULL) {
++		iounmap(ts_rs485_data9_register);
++		return -1;
++	}
++
++	return 0;
++}
++
++static int ts72xx_auto485(struct uart_port *port, unsigned int cmd, uns=
igned long *arg)
++{
++	int baud, cflag, mode;
++	int datalength;
++
++	mode =3D (int)*arg;
++	if (!is_rs485_installed()) {
++		printk("amba-pl010.c: this board does not support RS485 auto mode\n")=
;
++		return -EINVAL;
++	}
++
++	if (port->line !=3D 1) {
++		printk("amba-pl010.c: auto RS485 mode is only supported on second por=
t (/dev/ttyAM1)\n");
++		return -EINVAL;
++	}
++
++	datalength =3D 8;
++	cflag =3D port->info->port.tty->termios->c_cflag ;
++	if (cflag & PARENB)
++		datalength++;
++
++	if (cflag & CSTOPB)
++		datalength++;
++
++	baud =3D tty_get_baud_rate(port->info->port.tty);
++
++	switch (cmd) {
++		case TIOC_SBCC485:
++			if ((mode & TS72XX_RS485_AUTO485FD) || (mode & TS72XX_RS485_AUTO485H=
D)) {
++				printk("amba-pl010.c: unsetting auto RS485 mode\n");
++				__raw_writew(TS72XX_RS485_MODE_RS232, ts_rs485_control_register);
++				__raw_writew(TS72XX_RS485_MODE_RS232, ts_rs485_data9_register);
++			}
++			break;
++		case TIOC_SBCS485:
++			if (mode & TS72XX_RS485_AUTO485FD) {
++				printk ("amba-pl010.c: setting FULL duplex auto RS485 mode\n");
++				__raw_writew(TS72XX_RS485_MODE_FD, ts_rs485_control_register);
++				if (datalength > 8)
++					__raw_writew(TS72XX_RS485_MODE_FD, ts_rs485_data9_register);
++			} else if (mode & TS72XX_RS485_AUTO485HD) {
++				printk("amba-pl010.c: setting HALF DUPLEX auto RS485 mode\n");
++				switch (baud) {
++					case 9600:
++						__raw_writew(TS72XX_RS485_MODE_9600_HD, ts_rs485_control_register=
);
++						break;
++					case 19200:
++						__raw_writew(TS72XX_RS485_MODE_19200_HD, ts_rs485_control_registe=
r);
++						break;
++					case 57600:
++						__raw_writew(TS72XX_RS485_MODE_57600_HD, ts_rs485_control_registe=
r);
++						break;
++					case 115200:
++						__raw_writew(TS72XX_RS485_MODE_115200_HD, ts_rs485_control_regist=
er);
++						break;
++					default:
++					printk("amba-pl010.c: %d baud rate is not supported for auto RS485=
 mode\n", baud);
++					return -1;
++				}
++				if (datalength > 8)
++					__raw_writew(TS72XX_RS485_MODE_FD, ts_rs485_data9_register);
++			}
++			break;
++	}
++
++	return 0;
++}
++#endif
++
++int pl010_ioctl(struct uart_port *port, unsigned int cmd, unsigned long=
 arg)
++{
++#ifdef CONFIG_MACH_TS72XX
++	switch (cmd) {
++		case TIOC_SBCC485:
++		case TIOC_SBCS485:
++			return ts72xx_auto485(port, cmd, (unsigned long *)arg);
++			break;
++		default:
++			return -ENOIOCTLCMD;
++	}
++#endif
++	return -ENOIOCTLCMD;
++}
++
+ static struct uart_ops amba_pl010_pops =3D {
+ 	.tx_empty	=3D pl010_tx_empty,
+ 	.set_mctrl	=3D pl010_set_mctrl,
+@@ -536,6 +643,7 @@ static struct uart_ops amba_pl010_pops =3D {
+ 	.request_port	=3D pl010_request_port,
+ 	.config_port	=3D pl010_config_port,
+ 	.verify_port	=3D pl010_verify_port,
++	.ioctl		=3D pl010_ioctl,
+ };
+=20
+ static struct uart_amba_port *amba_ports[UART_NR];
+@@ -794,6 +902,15 @@ static int __init pl010_init(void)
+ 	ret =3D uart_register_driver(&amba_reg);
+ 	if (ret =3D=3D 0) {
+ 		ret =3D amba_driver_register(&pl010_driver);
++#ifdef CONFIG_MACH_TS72XX
++		if (!ret && is_rs485_installed()) {
++			ret =3D ts72xx_rs485_init();
++			if (ret)
++				printk("amba-pl010.c: ts72xx_rs485_init() failed\n");
++			else
++				printk("amba-pl010.c: auto RS485 mode initialized\n");
++		}
++#endif
+ 		if (ret)
+ 			uart_unregister_driver(&amba_reg);
+ 	}
+@@ -804,6 +921,10 @@ static void __exit pl010_exit(void)
+ {
+ 	amba_driver_unregister(&pl010_driver);
+ 	uart_unregister_driver(&amba_reg);
++#ifdef CONFIG_MACH_TS72XX
++	iounmap(ts_rs485_data9_register);
++	iounmap(ts_rs485_control_register);
++#endif
+ }
+=20
+ module_init(pl010_init);
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0023-Clean-and-invalidate-=
D-cache-entry.patch b/recipes/linux/linux-2.6.27/ts72xx/0023-Clean-and-in=
validate-D-cache-entry.patch
new file mode 100644
index 0000000..09ea797
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0023-Clean-and-invalidate-D-cache=
-entry.patch
@@ -0,0 +1,29 @@
+From b19911010ed38171f71a321428fafc9e02e9edc4 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 14:06:17 +0100
+Subject: [PATCH] Clean and invalidate D cache entry
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mm/proc-arm920.S |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
+index 12f59db..e0041c9 100644
+--- a/arch/arm/mm/proc-arm920.S
++++ b/arch/arm/mm/proc-arm920.S
+@@ -198,7 +198,7 @@ ENTRY(arm920_coherent_kern_range)
+  */
+ ENTRY(arm920_coherent_user_range)
+ 	bic	r0, r0, #CACHE_DLINESIZE - 1
+-1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
++1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
+ 	mcr	p15, 0, r0, c7, c5, 1		@ invalidate I entry
+ 	add	r0, r0, #CACHE_DLINESIZE
+ 	cmp	r0, r1
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0024-PC-104-I-O-and-memory=
-mappings.patch b/recipes/linux/linux-2.6.27/ts72xx/0024-PC-104-I-O-and-m=
emory-mappings.patch
new file mode 100644
index 0000000..3e83777
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0024-PC-104-I-O-and-memory-mappin=
gs.patch
@@ -0,0 +1,40 @@
+From ac8f2f5aab52ae0c38e8069de939763ea204776b Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 14:17:15 +0100
+Subject: [PATCH] PC/104 I/O and memory mappings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/ts72xx.h |   13 +++++++++++++
+ 1 files changed, 13 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-=
ep93xx/include/mach/ts72xx.h
+index 1262e2b..1a21a86 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+@@ -51,6 +51,19 @@
+ #define TS72XX_OPTIONS2_TS9420		0x04
+ #define TS72XX_OPTIONS2_TS9420_BOOT	0x02
+=20
++#define TS72XX_PC104_8BIT_IO_VIRT_BASE  0xfebf0000
++#define TS72XX_PC104_8BIT_IO_PHYS_BASE  0x11e00000
++#define TS72XX_PC104_8BIT_IO_SIZE       0x00001000
++#define TS72XX_PC104_8BIT_MEM_VIRT_BASE 0xfea00000
++#define TS72XX_PC104_8BIT_MEM_PHYS_BASE 0x11a00000
++#define TS72XX_PC104_8BIT_MEM_SIZE      0x00100000
++
++#define TS72XX_PC104_16BIT_IO_VIRT_BASE  0xfebef000
++#define TS72XX_PC104_16BIT_IO_PHYS_BASE  0x21e00000
++#define TS72XX_PC104_16BIT_IO_SIZE       0x00001000
++#define TS72XX_PC104_16BIT_MEM_VIRT_BASE 0xfe900000
++#define TS72XX_PC104_16BIT_MEM_PHYS_BASE 0x21a00000
++#define TS72XX_PC104_16BIT_MEM_SIZE      0x00100000
+=20
+ #define TS72XX_NOR_PHYS_BASE		0x60000000
+ #define TS72XX_NOR2_PHYS_BASE		0x62000000
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0025-EP93xx-discontigmem.p=
atch b/recipes/linux/linux-2.6.27/ts72xx/0025-EP93xx-discontigmem.patch
new file mode 100644
index 0000000..583574f
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0025-EP93xx-discontigmem.patch
@@ -0,0 +1,481 @@
+From 87a1d8dda4dc8fe5ba67c8534ad6d7db7dbd8835 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 14:22:55 +0100
+Subject: [PATCH] EP93xx discontigmem
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/Kconfig                           |    2 +
+ arch/arm/include/asm/memory.h              |    3 +-
+ arch/arm/mach-ep93xx/include/mach/memory.h |  220 +++++++++++++++++++++=
++++++-
+ arch/arm/mm/discontig.c                    |  100 +++++++++++++-
+ arch/arm/mm/init.c                         |   32 ++--
+ 5 files changed, 334 insertions(+), 23 deletions(-)
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 70dba16..d196fe8 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -267,6 +267,7 @@ config ARCH_EP93XX
+ 	bool "EP93xx-based"
+ 	select ARM_AMBA
+ 	select ARM_VIC
++	select ARCH_DISCONTIGMEM_ENABLE
+ 	select GENERIC_GPIO
+ 	select HAVE_CLK
+ 	select ARCH_REQUIRE_GPIOLIB
+@@ -832,6 +833,7 @@ config ARCH_SELECT_MEMORY_MODEL
+=20
+ config NODES_SHIFT
+ 	int
++	default "5" if ARCH_EP93XX
+ 	default "4" if ARCH_LH7A40X
+ 	default "2"
+ 	depends on NEED_MULTIPLE_NODES
+diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory=
.h
+index bf7c737..acf566c 100644
+--- a/arch/arm/include/asm/memory.h
++++ b/arch/arm/include/asm/memory.h
+@@ -273,7 +273,8 @@ static inline __deprecated void *bus_to_virt(unsigne=
d long x)
+  * Given a kaddr, ADDR_TO_MAPBASE finds the owning node of the memory
+  * and returns the mem_map of that node.
+  */
+-#define ADDR_TO_MAPBASE(kaddr)	NODE_MEM_MAP(KVADDR_TO_NID(kaddr))
++// Crude hack: see arch/arm/mach-ep93xx/include/mach/memory.h
++//#define ADDR_TO_MAPBASE(kaddr)	NODE_MEM_MAP(KVADDR_TO_NID(kaddr))
+=20
+ /*
+  * Given a page frame number, find the owning node of the memory
+diff --git a/arch/arm/mach-ep93xx/include/mach/memory.h b/arch/arm/mach-=
ep93xx/include/mach/memory.h
+index f1b6335..b202d93 100644
+--- a/arch/arm/mach-ep93xx/include/mach/memory.h
++++ b/arch/arm/mach-ep93xx/include/mach/memory.h
+@@ -1,14 +1,224 @@
+ /*
+- * arch/arm/mach-ep93xx/include/mach/memory.h
++ *  arch/arm/mach-ep93xx/include/mach/memory.h
++ *
++ *  ******************************************************
++ *	*    CONFUSED?  Read Documentation/IO-mapping.txt	 *
++ *  ******************************************************
++ *
++ *
++ *  Copyright (C) 1999 ARM Limited
++ *  Copyright (C) 2002-2003 Cirrus Logic Corp.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307=
  USA
+  */
+-
+ #ifndef __ASM_ARCH_MEMORY_H
+ #define __ASM_ARCH_MEMORY_H
+=20
+-#define PHYS_OFFSET		UL(0x00000000)
++/*
++ * For EP93xx, SDRAM can be discontiguous, in a set number of blocks
++ * of equal size and (usually) equal spacing.  The 9301 spacing isn't e=
qual.
++ *
++ * SDRAM_START is the physical address of the start of SDRAM.
++ * SDRAM_NUMBER_OF_BLOCKS =3D # of blocks of SDRAM.
++ * Each block is of size SDRAM_BLOCK_SIZE and starts at a boundary
++ * of SDRAM_BLOCK_START_BOUNDARY.
++ *
++ * So memory blocks are at:
++ *  SDRAM_START
++ *  SDRAM_START + SDRAM_BLOCK_START_BOUNDARY
++ *  SDRAM_START + (SDRAM_BLOCK_START_BOUNDARY * 2)
++ *  SDRAM_START + (SDRAM_BLOCK_START_BOUNDARY * 3)
++ *  so on
++ */
++
++#ifndef CONFIG_DISCONTIGMEM
++
++/*
++ * Single 32Meg block of physical memory physically located at 0 .
++ */
++#define SDRAM_START                         0x00000000
++#define SDRAM_NUMBER_OF_BLOCKS              1
++#define SDRAM_BLOCK_SIZE                    0x02000000
++#define SDRAM_BLOCK_START_BOUNDARY          0x00000000
++
++#else /* CONFIG_DISCONTIGMEM */
++
++#ifdef CONFIG_ARCH_EP9301
++
++/*
++ * The 9301 memory map doesn't have regular gaps because two
++ * address pins aren't connected - see asm-arm/mach-ep93xx/arch.c to
++ * see how it is.
++ */
++#define SDRAM_START                         0x00000000
++#define SDRAM_NUMBER_OF_BLOCKS              4
++#define SDRAM_BLOCK_SIZE                    0x00800000
++#define SDRAM_BLOCK_START_BOUNDARY          0x01000000
++
++#else /* CONFIG_ARCH_EP9312 or CONFIG_ARCH_EP9315 */
++
++/*
++ * 2 32Meg blocks that are located physically at 0 and 64Meg.
++ */
++#define SDRAM_START                         0x00000000
++#define SDRAM_NUMBER_OF_BLOCKS              2
++#define SDRAM_BLOCK_SIZE                    0x02000000
++#define SDRAM_BLOCK_START_BOUNDARY          0x04000000
++
++#endif
++
++/*
++ * Here we are assuming EP93xx is configured to have two 32MB SDRAM
++ * areas with 32MB of empty space between them.  So use 24 for the node
++ * max shift to get 64MB node sizes.
++ */
++#define NODE_MAX_MEM_SHIFT	26
++#define NODE_MAX_MEM_SIZE	(1<<NODE_MAX_MEM_SHIFT)
++
++#endif /* CONFIG_DISCONTIGMEM */
++
++
++/*
++ * MEM_SIZE and PHYS_OFFSET are used to set size of SDRAM for
++ * initial page table in arch/arm/kernel/setup.c
++ * For ep93xx, PHYS_OFFSET is set to be SDRAM_START.
++ */
++#define MEM_SIZE                            (SDRAM_BLOCK_SIZE)
++
++/*
++ * Task size: 2GB (from 0 to base of IO in virtual space)
++ */
++#define TASK_SIZE		UL(0x80000000)
++/*  HASH define TASK_SIZE_26	(0x04000000UL) */
++
++/*
++ * This decides where the kernel will search for a free chunk of vm
++ * space during mmap's.
++ */
++#define TASK_UNMAPPED_BASE (TASK_SIZE / 3)
++
++/*
++ * Page offset: 3GB (start of kernel memory in virtual space)
++ * Phys offset: 0   (start of kernel memory in physical space)
++ */
++#define PAGE_OFFSET		UL(0xC0000000)
++#define PHYS_OFFSET		(SDRAM_START)
++
++#ifndef __ASSEMBLY__
++/*
++ * Given a page frame number, convert it to a node id.
++ */
++static inline unsigned long PFN_TO_NID(unsigned long pfn) {
++	unsigned long block =3D (pfn >> 12);
++
++	switch(block) {
++	case 0x0:
++		return 0;
++	case 0x1:
++		return 1;
++	case 0x2:
++		return 2;
++	case 0x3:
++		return 3;
++	case 0x4:
++		return 4;
++	case 0x5:
++		return 5;
++	case 0x6:
++		return 6;
++	case 0x7:
++		return 7;
++	case 0xc0:
++		return 8;
++	case 0xc1:
++		return 9;
++	case 0xc4:
++		return 10;
++	case 0xc5:
++		return 11;
++	case 0xd0:
++		return 12;
++	case 0xd1:
++		return 13;
++	case 0xd4:
++		return 14;
++	case 0xd5:
++		return 15;
++	case 0xe0:
++		return 16;
++	case 0xe1:
++		return 17;
++	case 0xe4:
++		return 18;
++	case 0xe5:
++		return 19;
++	default:
++		return 0xff;
++	}
++}
++#endif
++
++/*
++ * Virtual view <-> DMA view memory address translations
++ * virt_to_bus: Used to translate the virtual address to an
++ *              address suitable to be passed to set_dma_addr
++ * bus_to_virt: Used to convert an address for DMA operations
++ *              to an address that the kernel can use.
++ */
++#define __virt_to_bus__is_a_macro
++#define __virt_to_bus(x)	 __virt_to_phys(x)
++
++#define __bus_to_virt__is_a_macro
++#define __bus_to_virt(x)	 __phys_to_virt(x)
++
++
++/*
++ * Note that this file is included by include/asm-arm/memory.h so
++ * the macros in this file have to play nice with those.
++ */
++#ifdef CONFIG_DISCONTIGMEM
++
++/*
++ * Given a kernel address, find the home node of the underlying memory.
++ */
++#define KVADDR_TO_NID(addr) \
++		((unsigned long)(PFN_TO_NID(__virt_to_phys((unsigned long)addr) >> PA=
GE_SHIFT)))
++
++/*
++ * Given a kaddr, ADDR_TO_MAPBASE finds the owning node of the memory
++ * and returns the mem_map of that node.
++ */
++#define ADDR_TO_MAPBASE(kaddr) NODE_MEM_MAP(KVADDR_TO_NID((unsigned lon=
g)(kaddr)))
++
++#define PFN_TO_MAPBASE(pfn)	NODE_MEM_MAP(PFN_TO_NID(pfn))
++
++/*
++ * Given a kaddr, LOCAL_MAR_NR finds the owning node of the memory
++ * and returns the index corresponding to the appropriate page in the
++ * node's mem_map.
++ */
++
++
++#define LOCAL_MAP_NR(kaddr)					\
++	(((unsigned long)(kaddr) & (0xffffffUL)) >> PAGE_SHIFT)
++
++
++
++
+=20
+-#define __bus_to_virt(x)	__phys_to_virt(x)
+-#define __virt_to_bus(x)	__virt_to_phys(x)
+=20
++#endif /* CONFIG_DISCONTIGMEM */
+=20
+ #endif
+diff --git a/arch/arm/mm/discontig.c b/arch/arm/mm/discontig.c
+index c8c0c4b..f336eb1 100644
+--- a/arch/arm/mm/discontig.c
++++ b/arch/arm/mm/discontig.c
+@@ -13,7 +13,7 @@
+ #include <linux/mmzone.h>
+ #include <linux/bootmem.h>
+=20
+-#if MAX_NUMNODES !=3D 4 && MAX_NUMNODES !=3D 16
++#if MAX_NUMNODES !=3D 4 && MAX_NUMNODES !=3D 16 && MAX_NUMNODES !=3D 64=
 && MAX_NUMNODES !=3D 32
+ # error Fix Me Please
+ #endif
+=20
+@@ -40,6 +40,104 @@ pg_data_t discontig_node_data[MAX_NUMNODES] =3D {
+   { .bdata =3D &bootmem_node_data[14] },
+   { .bdata =3D &bootmem_node_data[15] },
+ #endif
++
++#if MAX_NUMNODES =3D=3D 32
++  { .bdata =3D &bootmem_node_data[4] },
++  { .bdata =3D &bootmem_node_data[5] },
++  { .bdata =3D &bootmem_node_data[6] },
++  { .bdata =3D &bootmem_node_data[7] },
++  { .bdata =3D &bootmem_node_data[8] },
++  { .bdata =3D &bootmem_node_data[9] },
++  { .bdata =3D &bootmem_node_data[10] },
++  { .bdata =3D &bootmem_node_data[11] },
++  { .bdata =3D &bootmem_node_data[12] },
++  { .bdata =3D &bootmem_node_data[13] },
++  { .bdata =3D &bootmem_node_data[14] },
++  { .bdata =3D &bootmem_node_data[15] },
++
++  { .bdata =3D &bootmem_node_data[16] },
++  { .bdata =3D &bootmem_node_data[17] },
++  { .bdata =3D &bootmem_node_data[18] },
++  { .bdata =3D &bootmem_node_data[19] },
++  { .bdata =3D &bootmem_node_data[20] },
++  { .bdata =3D &bootmem_node_data[21] },
++  { .bdata =3D &bootmem_node_data[22] },
++  { .bdata =3D &bootmem_node_data[23] },
++  { .bdata =3D &bootmem_node_data[24] },
++  { .bdata =3D &bootmem_node_data[25] },
++  { .bdata =3D &bootmem_node_data[26] },
++  { .bdata =3D &bootmem_node_data[27] },
++  { .bdata =3D &bootmem_node_data[28] },
++  { .bdata =3D &bootmem_node_data[29] },
++  { .bdata =3D &bootmem_node_data[30] },
++  { .bdata =3D &bootmem_node_data[31] },
++#endif
++
++#if MAX_NUMNODES =3D=3D 64
++  { .bdata =3D &bootmem_node_data[4] },
++  { .bdata =3D &bootmem_node_data[5] },
++  { .bdata =3D &bootmem_node_data[6] },
++  { .bdata =3D &bootmem_node_data[7] },
++  { .bdata =3D &bootmem_node_data[8] },
++  { .bdata =3D &bootmem_node_data[9] },
++  { .bdata =3D &bootmem_node_data[10] },
++  { .bdata =3D &bootmem_node_data[11] },
++  { .bdata =3D &bootmem_node_data[12] },
++  { .bdata =3D &bootmem_node_data[13] },
++  { .bdata =3D &bootmem_node_data[14] },
++  { .bdata =3D &bootmem_node_data[15] },
++
++  { .bdata =3D &bootmem_node_data[16] },
++  { .bdata =3D &bootmem_node_data[17] },
++  { .bdata =3D &bootmem_node_data[18] },
++  { .bdata =3D &bootmem_node_data[19] },
++  { .bdata =3D &bootmem_node_data[20] },
++  { .bdata =3D &bootmem_node_data[21] },
++  { .bdata =3D &bootmem_node_data[22] },
++  { .bdata =3D &bootmem_node_data[23] },
++  { .bdata =3D &bootmem_node_data[24] },
++  { .bdata =3D &bootmem_node_data[25] },
++  { .bdata =3D &bootmem_node_data[26] },
++  { .bdata =3D &bootmem_node_data[27] },
++  { .bdata =3D &bootmem_node_data[28] },
++  { .bdata =3D &bootmem_node_data[29] },
++  { .bdata =3D &bootmem_node_data[30] },
++  { .bdata =3D &bootmem_node_data[31] },
++
++  { .bdata =3D &bootmem_node_data[32] },
++  { .bdata =3D &bootmem_node_data[33] },
++  { .bdata =3D &bootmem_node_data[34] },
++  { .bdata =3D &bootmem_node_data[35] },
++  { .bdata =3D &bootmem_node_data[36] },
++  { .bdata =3D &bootmem_node_data[37] },
++  { .bdata =3D &bootmem_node_data[38] },
++  { .bdata =3D &bootmem_node_data[39] },
++  { .bdata =3D &bootmem_node_data[40] },
++  { .bdata =3D &bootmem_node_data[41] },
++  { .bdata =3D &bootmem_node_data[42] },
++  { .bdata =3D &bootmem_node_data[43] },
++  { .bdata =3D &bootmem_node_data[44] },
++  { .bdata =3D &bootmem_node_data[45] },
++  { .bdata =3D &bootmem_node_data[46] },
++  { .bdata =3D &bootmem_node_data[47] },
++
++  { .bdata =3D &bootmem_node_data[48] },
++  { .bdata =3D &bootmem_node_data[49] },
++  { .bdata =3D &bootmem_node_data[50] },
++  { .bdata =3D &bootmem_node_data[51] },
++  { .bdata =3D &bootmem_node_data[52] },
++  { .bdata =3D &bootmem_node_data[53] },
++  { .bdata =3D &bootmem_node_data[54] },
++  { .bdata =3D &bootmem_node_data[55] },
++  { .bdata =3D &bootmem_node_data[56] },
++  { .bdata =3D &bootmem_node_data[57] },
++  { .bdata =3D &bootmem_node_data[58] },
++  { .bdata =3D &bootmem_node_data[59] },
++  { .bdata =3D &bootmem_node_data[60] },
++  { .bdata =3D &bootmem_node_data[61] },
++  { .bdata =3D &bootmem_node_data[62] },
++  { .bdata =3D &bootmem_node_data[63] },
++#endif
+ };
+=20
+ EXPORT_SYMBOL(discontig_node_data);
+diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
+index 30a69d6..a38c66f 100644
+--- a/arch/arm/mm/init.c
++++ b/arch/arm/mm/init.c
+@@ -43,26 +43,18 @@ static struct meminfo meminfo =3D { 0, };
+ void show_mem(void)
+ {
+ 	int free =3D 0, total =3D 0, reserved =3D 0;
+-	int shared =3D 0, cached =3D 0, slab =3D 0, node, i;
++	int shared =3D 0, cached =3D 0, slab =3D 0, node, i, k;
+ 	struct meminfo * mi =3D &meminfo;
+=20
+ 	printk("Mem-info:\n");
+ 	show_free_areas();
+ 	for_each_online_node(node) {
+-		pg_data_t *n =3D NODE_DATA(node);
+-		struct page *map =3D n->node_mem_map - n->node_start_pfn;
+-
+ 		for_each_nodebank (i,mi,node) {
+-			unsigned int pfn1, pfn2;
+-			struct page *page, *end;
+-
+-			pfn1 =3D __phys_to_pfn(mi->bank[i].start);
+-			pfn2 =3D __phys_to_pfn(mi->bank[i].size + mi->bank[i].start);
++			struct page *page;
+=20
+-			page =3D map + pfn1;
+-			end  =3D map + pfn2;
++      page =3D NODE_MEM_MAP(node);
+=20
+-			do {
++      for (k=3D0; k<NODE_DATA(node)->node_present_pages; k++) {
+ 				total++;
+ 				if (PageReserved(page))
+ 					reserved++;
+@@ -75,7 +67,7 @@ void show_mem(void)
+ 				else
+ 					shared +=3D page_count(page) - 1;
+ 				page++;
+-			} while (page < end);
++			};
+ 		}
+ 	}
+=20
+@@ -94,11 +86,19 @@ void show_mem(void)
+  * the end, we won't clash.
+  */
+ static unsigned int __init
+-find_bootmap_pfn(int node, struct meminfo *mi, unsigned int bootmap_pag=
es)
++find_bootmap_pfn(int node, struct meminfo *mi, unsigned int bootmap_pag=
es, int initrd_node)
+ {
+ 	unsigned int start_pfn, bank, bootmap_pfn;
+=20
+-	start_pfn   =3D PAGE_ALIGN(__pa(&_end)) >> PAGE_SHIFT;
++	if (node =3D=3D initrd_node) {
++	  /* push start_pfn past the ramdisk */
++	  start_pfn =3D (phys_initrd_start + phys_initrd_size) >> PAGE_SHIFT;
++	  /* if (unlikely) not an even page length, round up by a page */
++	  start_pfn =3D ((phys_initrd_start + phys_initrd_size) & PAGE_MASK ? =
start_pfn+1 : start_pfn);
++	} else {
++	  start_pfn   =3D PAGE_ALIGN(__pa(&_end)) >> PAGE_SHIFT;
++	}
++
+ 	bootmap_pfn =3D 0;
+=20
+ 	for_each_nodebank(bank, mi, node) {
+@@ -220,7 +220,7 @@ bootmem_init_node(int node, int initrd_node, struct =
meminfo *mi)
+ 	 * Allocate the bootmem bitmap page.
+ 	 */
+ 	boot_pages =3D bootmem_bootmap_pages(end_pfn - start_pfn);
+-	boot_pfn =3D find_bootmap_pfn(node, mi, boot_pages);
++	boot_pfn =3D find_bootmap_pfn(node, mi, boot_pages, initrd_node);
+=20
+ 	/*
+ 	 * Initialise the bootmem allocator for this node, handing the
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0026-TS72xx-PATA-support.p=
atch b/recipes/linux/linux-2.6.27/ts72xx/0026-TS72xx-PATA-support.patch
new file mode 100644
index 0000000..7d5b725
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0026-TS72xx-PATA-support.patch
@@ -0,0 +1,442 @@
+From 0b580299f52393b09828821ec0335a844a366853 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 15:57:10 +0100
+Subject: [PATCH] TS72xx PATA support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Support for ATA devices on Technologic Systems SBC.
+Support for the compact flash control on Technologic System TS-7200 SBC.
+TS9600 IDE interface support.
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/ts72xx.h |   13 +++
+ drivers/ata/Kconfig                        |   20 ++++
+ drivers/ata/Makefile                       |    3 +
+ drivers/ata/pata_ts7200_cf.c               |   85 +++++++++++++++
+ drivers/ata/pata_ts72xx.c                  |  155 +++++++++++++++++++++=
+++++++
+ drivers/ata/pata_ts9600.c                  |   88 ++++++++++++++++
+ 6 files changed, 364 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/ata/pata_ts7200_cf.c
+ create mode 100644 drivers/ata/pata_ts72xx.c
+ create mode 100644 drivers/ata/pata_ts9600.c
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-=
ep93xx/include/mach/ts72xx.h
+index 1a21a86..616aeca 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+@@ -128,6 +128,19 @@
+ #define TS72XX_PLD_VERSION_PHYS_BASE	0x23400000
+ #define TS72XX_PLD_VERSION_SIZE	0x00001000
+=20
++/*
++ * TS7200 CF memory map:
++ *
++ * phys		size	description
++ * 11000000	7	CF registers (8-bit each), starting at 11000001
++ * 10400006	2	CF aux registers (8-bit)
++ * 21000000	2	CF data register (16-bit)
++ */
++
++#define TS7200_CF_CMD_PHYS_BASE  0x11000000
++#define TS7200_CF_AUX_PHYS_BASE  0x10400006
++#define TS7200_CF_DATA_PHYS_BASE 0x21000000
++
+ #ifndef __ASSEMBLY__
+ #include <asm/io.h>
+=20
+diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
+index 11c8c19..19ef945 100644
+--- a/drivers/ata/Kconfig
++++ b/drivers/ata/Kconfig
+@@ -725,5 +725,25 @@ config PATA_BF54X
+=20
+ 	  If unsure, say N.
+=20
++config PATA_TS72XX
++	bool "TS72XX ATA support"
++	depends on ARCH_EP93XX && MACH_TS72XX
++	help
++	  This option enables support for ATA devices on Technologic Systems S=
BC.
++
++config PATA_TS7200_CF
++	tristate "TS7200 Compact Flash support"
++	depends on PATA_TS72XX
++	help
++	  This option enables support for the compact flash control on
++	  Technologic System TS-7200 SBC.
++
++config PATA_TS9600
++	tristate "TS9600 IDE interface support"
++	depends on PATA_TS72XX && BLK_DEV_IDE_TS9600 !=3D y
++	help
++	  This option enables support for Technologic Systems TS-9600 PC/104 I=
DE interface.
++
+ endif # ATA_SFF
++
+ endif # ATA
+diff --git a/drivers/ata/Makefile b/drivers/ata/Makefile
+index 674965f..f496c63 100644
+--- a/drivers/ata/Makefile
++++ b/drivers/ata/Makefile
+@@ -72,6 +72,9 @@ obj-$(CONFIG_PATA_BF54X)	+=3D pata_bf54x.o
+ obj-$(CONFIG_PATA_PLATFORM)	+=3D pata_platform.o
+ obj-$(CONFIG_PATA_OF_PLATFORM)	+=3D pata_of_platform.o
+ obj-$(CONFIG_PATA_ICSIDE)	+=3D pata_icside.o
++obj-$(CONFIG_PATA_TS72XX)	+=3D pata_ts72xx.o
++obj-$(CONFIG_PATA_TS7200_CF)	+=3D pata_ts7200_cf.o
++obj-$(CONFIG_PATA_TS9600)	+=3D pata_ts9600.o
+ # Should be last but two libata driver
+ obj-$(CONFIG_PATA_ACPI)		+=3D pata_acpi.o
+ # Should be last but one libata driver
+diff --git a/drivers/ata/pata_ts7200_cf.c b/drivers/ata/pata_ts7200_cf.c
+new file mode 100644
+index 0000000..a08aedf
+--- /dev/null
++++ b/drivers/ata/pata_ts7200_cf.c
+@@ -0,0 +1,85 @@
++/*
++ *  Technologic Systems TS-7200 Compact Flash PATA device driver.
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ */
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/libata.h>
++#include <scsi/scsi_host.h>
++#include <linux/platform_device.h>
++#include <linux/dma-mapping.h>
++
++#include <asm/io.h>
++#include <asm/irq.h>
++#include <mach/hardware.h>
++
++#define DRV_NAME  "pata_ts7200_cf"
++#define DRV_VERSION "0.2"
++
++static struct resource ts7200_cf_resources[] =3D {
++  [0] =3D {
++    .start =3D TS7200_CF_CMD_PHYS_BASE,
++    .end   =3D TS7200_CF_CMD_PHYS_BASE + 8,
++    .flags =3D IORESOURCE_MEM,
++  },
++  [1] =3D {
++    .start =3D TS7200_CF_AUX_PHYS_BASE,
++    .end   =3D TS7200_CF_AUX_PHYS_BASE + 1,
++    .flags =3D IORESOURCE_MEM,
++  },
++  [2] =3D {
++    .start =3D TS7200_CF_DATA_PHYS_BASE,
++    .end   =3D TS7200_CF_DATA_PHYS_BASE + 2,
++    .flags =3D IORESOURCE_MEM,
++  },
++  [3] =3D {
++    .start =3D IRQ_EP93XX_EXT0, /* pin 103 of EP9301 */
++    .end   =3D IRQ_EP93XX_EXT0,
++    .flags =3D IORESOURCE_IRQ,
++  }
++};
++
++
++static struct platform_device ts7200_cf_device =3D {
++  .name =3D "ts72xx-ide",
++  .id =3D 0,
++  .dev  =3D {
++		.dma_mask =3D &ts7200_cf_device.dev.coherent_dma_mask,
++		.coherent_dma_mask =3D DMA_BIT_MASK(32),
++  },
++  .num_resources  =3D ARRAY_SIZE(ts7200_cf_resources),
++  .resource =3D ts7200_cf_resources,
++};
++
++
++static __init int pata_ts7200_cf_init(void)
++{
++  return (board_is_ts7200()) ? \
++    platform_device_register(&ts7200_cf_device) : -ENODEV;
++}
++
++static __exit void pata_ts7200_cf_exit(void)
++{
++  platform_device_unregister(&ts7200_cf_device);
++}
++
++module_init(pata_ts7200_cf_init);
++module_exit(pata_ts7200_cf_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("TS-7200 CF PATA device driver");
++MODULE_LICENSE("GPL");
++MODULE_VERSION(DRV_VERSION);
+diff --git a/drivers/ata/pata_ts72xx.c b/drivers/ata/pata_ts72xx.c
+new file mode 100644
+index 0000000..a2c12d1
+--- /dev/null
++++ b/drivers/ata/pata_ts72xx.c
+@@ -0,0 +1,155 @@
++/*
++ *  TS-72XX PATA driver for Technologic Systems boards.
++ *
++ *  Based on pata_platform.c by Paul Mundt &
++ *      Alessandro Zummo <a.zummo@towertech.it>
++ *  and old pata-ts72xx.c by Alessandro Zummo <a.zummo@towertech.it>
++ *
++ *	(c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ *
++ *	This program is free software; you can redistribute it and/or
++ *	modify it under the terms of the GNU General Public License
++ *	as published by the Free Software Foundation; either version
++ *	2 of the License, or (at your option) any later version.
++ */
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/interrupt.h>
++#include <scsi/scsi_host.h>
++#include <linux/ata.h>
++#include <linux/libata.h>
++
++#define DRV_NAME  "pata_ts72xx"
++#define DRV_VERSION "2.0"
++
++
++/*
++ * Provide our own set_mode() as we don't want to change anything that =
has
++ * already been configured..
++ */
++static int ts72xx_set_mode(struct ata_link *link, struct ata_device **u=
nused)
++{
++  struct ata_device *dev;
++
++  ata_link_for_each_dev(dev, link) {
++    if (ata_dev_enabled(dev)) {
++      /* We don't really care */
++      dev->pio_mode =3D dev->xfer_mode =3D XFER_PIO_0;
++      dev->xfer_shift =3D ATA_SHIFT_PIO;
++      dev->flags |=3D ATA_DFLAG_PIO;
++      ata_dev_printk(dev, KERN_INFO, "configured for PIO\n");
++    }
++  }
++  return 0;
++}
++
++static struct scsi_host_template ts72xx_sht =3D {
++  ATA_PIO_SHT(DRV_NAME),
++};
++
++static struct ata_port_operations ts72xx_port_ops =3D {
++  .inherits     =3D &ata_sff_port_ops,
++  .set_mode     =3D ts72xx_set_mode,
++};
++
++static __devinit int ts72xx_pata_probe(struct platform_device *pdev)
++{
++  struct ata_host *host;
++  struct ata_port *ap;
++  int irq;
++
++  struct resource *pata_cmd  =3D platform_get_resource(pdev, IORESOURCE=
_MEM, 0);
++  struct resource *pata_aux  =3D platform_get_resource(pdev, IORESOURCE=
_MEM, 1);
++  struct resource *pata_data =3D platform_get_resource(pdev, IORESOURCE=
_MEM, 2);
++
++  if (!pata_cmd || !pata_aux || !pata_data) {
++    dev_err(&pdev->dev, "missing resource(s)\n");
++    return -EINVAL;
++  }
++
++  irq =3D platform_get_irq(pdev, 0);
++  if (irq < 0)
++    irq =3D 0;  /* no irq */
++
++  /*
++   * Now that that's out of the way, wire up the port
++   */
++  host =3D ata_host_alloc(&pdev->dev, 1);
++  if (!host)
++    return -ENOMEM;
++  ap =3D host->ports[0];
++
++  ap->ops =3D &ts72xx_port_ops;
++  ap->pio_mask =3D 0x1f; /* PIO0-4 */
++  ap->flags |=3D ATA_FLAG_SLAVE_POSS;
++
++  /*
++   * Use polling mode if there's no IRQ
++   */
++  if (!irq) {
++    ap->flags |=3D ATA_FLAG_PIO_POLLING;
++    ata_port_desc(ap, "no IRQ, using PIO polling");
++  }
++
++  ap->ioaddr.cmd_addr =3D devm_ioremap(&pdev->dev, pata_cmd->start,
++      pata_cmd->end - pata_cmd->start + 1);
++  ap->ioaddr.ctl_addr =3D devm_ioremap(&pdev->dev, pata_aux->start,
++      pata_aux->end - pata_aux->start + 1);
++
++  if (!ap->ioaddr.cmd_addr || !ap->ioaddr.ctl_addr) {
++    dev_err(&pdev->dev, "failed to map IO/CTL base\n");
++    return -ENOMEM;
++  }
++
++  ap->ioaddr.altstatus_addr =3D ap->ioaddr.ctl_addr;
++
++  ata_sff_std_ports(&ap->ioaddr);
++  ap->ioaddr.data_addr =3D devm_ioremap(&pdev->dev, pata_data->start,
++      pata_data->end - pata_data->start + 1);
++
++  ata_port_desc(ap, "mmio cmd 0x%llx ctl 0x%llx",
++      (unsigned long long)pata_cmd->start,
++      (unsigned long long)pata_aux->start);
++
++  return ata_host_activate(host, irq, irq ? ata_sff_interrupt : NULL,
++      0 /* irq flags */, &ts72xx_sht);
++}
++
++static __devexit int ts72xx_pata_remove(struct platform_device *pdev)
++{
++  struct device *dev =3D &pdev->dev;
++  struct ata_host *host =3D dev_get_drvdata(dev);
++
++  ata_host_detach(host);
++
++  return 0;
++}
++
++static struct platform_driver ts72xx_pata_platform_driver =3D {
++  .probe    =3D ts72xx_pata_probe,
++  .remove   =3D __devexit_p(ts72xx_pata_remove),
++  .driver =3D {
++    .name   =3D "ts72xx-ide",
++    .owner  =3D THIS_MODULE,
++  },
++};
++
++static int __init ts72xx_pata_init(void)
++{
++  return platform_driver_register(&ts72xx_pata_platform_driver);
++}
++
++static void __exit ts72xx_pata_exit(void)
++{
++  platform_driver_unregister(&ts72xx_pata_platform_driver);
++}
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("low-level driver for TS-72xx device PATA");
++MODULE_LICENSE("GPL");
++MODULE_VERSION(DRV_VERSION);
++
++module_init(ts72xx_pata_init);
++module_exit(ts72xx_pata_exit);
+diff --git a/drivers/ata/pata_ts9600.c b/drivers/ata/pata_ts9600.c
+new file mode 100644
+index 0000000..b7348d2
+--- /dev/null
++++ b/drivers/ata/pata_ts9600.c
+@@ -0,0 +1,88 @@
++/*
++ *  Technologic Systems TS-9600 PATA device driver.
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ */
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/libata.h>
++#include <scsi/scsi_host.h>
++#include <linux/platform_device.h>
++#include <linux/dma-mapping.h>
++
++#include <asm/io.h>
++#include <asm/irq.h>
++#include <mach/hardware.h>
++
++#define DRV_NAME  "pata_ts9600"
++#define DRV_VERSION "0.2"
++
++#define TS9600_IDE_IO   (TS72XX_PC104_8BIT_IO_PHYS_BASE + 0x1F0)
++#define TS9600_IDE_DATA (TS72XX_PC104_16BIT_IO_PHYS_BASE + 0x1F0)
++#define TS9600_IDE_IRQ  IRQ_EP93XX_EXT3  // IRQ7 (no other possibility =
for arm)
++
++static struct resource ts9600_resources[] =3D {
++  [0] =3D {
++    .start =3D TS9600_IDE_IO,
++    .end   =3D TS9600_IDE_IO + 8,
++    .flags =3D IORESOURCE_MEM,
++  },
++  [1] =3D {
++    .start =3D TS9600_IDE_IO + 0x206,
++    .end   =3D TS9600_IDE_IO + 0x206 + 1,
++    .flags =3D IORESOURCE_MEM,
++  },
++  [2] =3D {
++    .start =3D TS9600_IDE_DATA,
++    .end   =3D TS9600_IDE_DATA + 2,
++    .flags =3D IORESOURCE_MEM,
++  },
++  [3] =3D {
++    .start =3D TS9600_IDE_IRQ,
++    .end   =3D TS9600_IDE_IRQ,
++    .flags =3D IORESOURCE_IRQ,
++  }
++};
++
++
++static struct platform_device ts9600_device =3D {
++  .name =3D "ts72xx-ide",
++  .id =3D 9600,
++  .dev  =3D {
++		.dma_mask =3D &ts9600_device.dev.coherent_dma_mask,
++		.coherent_dma_mask =3D DMA_BIT_MASK(32),
++  },
++  .num_resources  =3D ARRAY_SIZE(ts9600_resources),
++  .resource =3D ts9600_resources,
++};
++
++
++static __init int pata_ts9600_init(void)
++{
++  return platform_device_register(&ts9600_device);
++}
++
++static __exit void pata_ts9600_exit(void)
++{
++  platform_device_unregister(&ts9600_device);
++}
++
++module_init(pata_ts9600_init);
++module_exit(pata_ts9600_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("TS-9600 PATA device driver");
++MODULE_LICENSE("GPL");
++MODULE_VERSION(DRV_VERSION);
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0027-TS72xx-TS-SER1-suppor=
t.patch b/recipes/linux/linux-2.6.27/ts72xx/0027-TS72xx-TS-SER1-support.p=
atch
new file mode 100644
index 0000000..97bdf7b
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0027-TS72xx-TS-SER1-support.patch
@@ -0,0 +1,213 @@
+From 2ccfb6a663fefa068b57f974379b543c19921791 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 14:33:36 +0100
+Subject: [PATCH] TS72xx TS-SER1 support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/serial/8250_ts_ser1.c |  148 ++++++++++++++++++++++++++++++++++=
+++++++
+ drivers/serial/Kconfig        |   17 +++++
+ drivers/serial/Makefile       |    1 +
+ 3 files changed, 166 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/serial/8250_ts_ser1.c
+
+diff --git a/drivers/serial/8250_ts_ser1.c b/drivers/serial/8250_ts_ser1=
.c
+new file mode 100644
+index 0000000..054a8e2
+--- /dev/null
++++ b/drivers/serial/8250_ts_ser1.c
+@@ -0,0 +1,148 @@
++/*
++ *  linux/drivers/serial/8250_ts_ser1.c
++ *  Technologic Systems TS-SER1 support.
++ *
++ * (c) Copyright 2006-2008  Matthieu Crapet <mcrapet@gmail.com>
++ * Data taken from include/asm-i386/serial.h
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * Pin Number:
++ * 1 DCD
++ * 2 Receive data
++ * 3 Trasmit data
++ * 4 DTR
++ * 5 Signal Ground
++ * 6 DSR
++ * 7 RTS
++ * 8 CTS
++ * 9 RI
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/serial_8250.h>
++#include <linux/irq.h>
++#include <mach/hardware.h>
++#include <mach/gpio.h>
++
++
++#define TS72XX_SER1_IO_PHYS_BASE  (TS72XX_PC104_8BIT_IO_PHYS_BASE)
++#define TS72XX_SER1_IO_SIZE       (TS72XX_PC104_8BIT_IO_SIZE)
++
++#define TS_SER1_PORT_COM3 0x3E8
++#define TS_SER1_PORT_COM4 0x2E8
++#define TS_SER1_PORT_COM5 0x3A8
++
++/* Value to write in 16550A scratch register */
++#define MARKER_BYTE 0xAA /* or 0x55 */
++
++#define PORT(_base,_irq)           \
++  {                                \
++    .iobase   =3D _base,             \
++    .membase  =3D (void __iomem *)0, \
++    .irq      =3D _irq,              \
++    .uartclk  =3D 1843200,           \
++    .iotype   =3D UPIO_PORT,         \
++    .flags    =3D UPF_BOOT_AUTOCONF, \
++  }
++// Note: IRQ can be shared (see CONFIG_SERIAL_8250_SHARE_IRQ)
++
++
++static struct plat_serial8250_port ts72xx_ser1_data_com3[] =3D {
++  PORT(TS_SER1_PORT_COM3, 0),
++  { },
++};
++
++static struct plat_serial8250_port ts72xx_ser1_data_com4[] =3D {
++  PORT(TS_SER1_PORT_COM4, 0),
++  { },
++};
++
++static struct plat_serial8250_port ts72xx_ser1_data_com5[] =3D {
++  PORT(TS_SER1_PORT_COM5, 0),
++  { },
++};
++
++static struct platform_device ts72xx_ser1_device =3D {
++  .name     =3D "serial8250",
++  .id       =3D  0,
++  .dev      =3D {
++    .platform_data  =3D ts72xx_ser1_data_com3,
++  },
++};
++
++static void __iomem *iomem;
++
++
++static int __init ts_ser1_init(void)
++{
++  static struct plat_serial8250_port *comX =3D NULL;
++  int n =3D 0; // COM number as printed on TS-SER1 pcb
++
++  iomem =3D ioremap(TS72XX_SER1_IO_PHYS_BASE, TS72XX_SER1_IO_SIZE);
++
++  if (iomem !=3D NULL) {
++    __raw_writeb(MARKER_BYTE, iomem + TS_SER1_PORT_COM3 + 7);
++    if (__raw_readb(iomem + TS_SER1_PORT_COM3 + 7) =3D=3D MARKER_BYTE) =
{
++      comX =3D ts72xx_ser1_data_com3;
++      n =3D 3;
++    } else {
++      __raw_writeb(MARKER_BYTE, iomem + TS_SER1_PORT_COM4 + 7);
++      if (__raw_readb(iomem + TS_SER1_PORT_COM4 + 7) =3D=3D MARKER_BYTE=
) {
++        comX =3D ts72xx_ser1_data_com4;
++        n =3D 4;
++      } else {
++        __raw_writeb(MARKER_BYTE, iomem + TS_SER1_PORT_COM5 + 7);
++        if (__raw_readb(iomem + TS_SER1_PORT_COM5 + 7) =3D=3D MARKER_BY=
TE) {
++          comX =3D ts72xx_ser1_data_com5;
++          n =3D 5;
++        }
++      }
++    }
++
++    if (comX) {
++      #if CONFIG_SERIAL_8250_TS_SER1_IRQ =3D=3D 5
++      gpio_direction_input(EP93XX_GPIO_LINE_F(3));
++      comX->irq =3D gpio_to_irq(EP93XX_GPIO_LINE_F(3)); // 83
++      set_irq_type(comX->irq, IRQ_TYPE_EDGE_RISING);
++      #elif CONFIG_SERIAL_8250_TS_SER1_IRQ =3D=3D 6
++      comX->irq =3D IRQ_EP93XX_EXT1;
++      #elif CONFIG_SERIAL_8250_TS_SER1_IRQ =3D=3D 7
++      comX->irq =3D IRQ_EP93XX_EXT3;
++      #else
++      comX->irq =3D IRQ_EP93XX_EXT3;
++      #endif
++
++      comX->iobase +=3D (unsigned long)iomem; // virtual address
++    }
++
++    ts72xx_ser1_device.id =3D n;
++    ts72xx_ser1_device.dev.platform_data =3D comX;
++  }
++
++  return ((comX =3D=3D NULL) ? -ENODEV :
++      platform_device_register(&ts72xx_ser1_device));
++}
++
++static void __exit ts_ser1_exit(void)
++{
++  iounmap(iomem);
++  platform_device_unregister(&ts72xx_ser1_device);
++}
++
++module_init(ts_ser1_init);
++module_exit(ts_ser1_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("8250 serial probe module for TS-SER1 (TS-72xx)");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("0.3");
+diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
+index 77cb342..945daff 100644
+--- a/drivers/serial/Kconfig
++++ b/drivers/serial/Kconfig
+@@ -276,6 +276,23 @@ config SERIAL_8250_RM9K
+ 	  port hardware found on MIPS RM9122 and similar processors.
+ 	  If unsure, say N.
+=20
++config SERIAL_8250_TS_SER1
++	tristate "Support TS-SER1 (for TS-72XX SBC)"
++	depends on SERIAL_8250 !=3D n && MACH_TS72XX
++	help
++	  Say Y here if you have a TS-SER1 PC/104 peripheral.
++	  COM number will be configured automaticaly.
++
++	  To compile this driver as a module, choose M here: the module
++	  will be called 8250_ts_ser1.
++
++config SERIAL_8250_TS_SER1_IRQ
++	int "Selected IRQ (5, 6 or 7)"
++	depends on SERIAL_8250_TS_SER1
++	default "5"
++	help
++	  Enter jumper IRQ configuration
++
+ comment "Non-8250 serial port support"
+=20
+ config SERIAL_AMBA_PL010
+diff --git a/drivers/serial/Makefile b/drivers/serial/Makefile
+index 7e7383e..b4bd691 100644
+--- a/drivers/serial/Makefile
++++ b/drivers/serial/Makefile
+@@ -18,6 +18,7 @@ obj-$(CONFIG_SERIAL_8250_BOCA) +=3D 8250_boca.o
+ obj-$(CONFIG_SERIAL_8250_EXAR_ST16C554) +=3D 8250_exar_st16c554.o
+ obj-$(CONFIG_SERIAL_8250_HUB6) +=3D 8250_hub6.o
+ obj-$(CONFIG_SERIAL_8250_MCA) +=3D 8250_mca.o
++obj-$(CONFIG_SERIAL_8250_TS_SER1) +=3D 8250_ts_ser1.o
+ obj-$(CONFIG_SERIAL_AMBA_PL010) +=3D amba-pl010.o
+ obj-$(CONFIG_SERIAL_AMBA_PL011) +=3D amba-pl011.o
+ obj-$(CONFIG_SERIAL_CLPS711X) +=3D clps711x.o
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0028-TS72xx-TS-ETH100.patc=
h b/recipes/linux/linux-2.6.27/ts72xx/0028-TS72xx-TS-ETH100.patch
new file mode 100644
index 0000000..1d747f8
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0028-TS72xx-TS-ETH100.patch
@@ -0,0 +1,259 @@
+From 08d05de078e923857288f5dc629ac4a51354e035 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 14:34:59 +0100
+Subject: [PATCH] TS72xx TS-ETH100
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/net/Kconfig             |   10 ++
+ drivers/net/Makefile            |    1 +
+ drivers/net/ax88796.c           |    4 +
+ drivers/net/ax88796_ts_eth100.c |  184 ++++++++++++++++++++++++++++++++=
+++++++
+ 4 files changed, 199 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/net/ax88796_ts_eth100.c
+
+diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
+index 60a0453..b0fec06 100644
+--- a/drivers/net/Kconfig
++++ b/drivers/net/Kconfig
+@@ -236,6 +236,16 @@ config AX88796_93CX6
+ 	help
+ 	  Select this if your platform comes with an external 93CX6 eeprom.
+=20
++config AX88796_TS_ETH100
++	tristate "Support for TS-ETH100 (TS-72XX SBC)"
++	depends on AX88796 && MACH_TS72XX
++	help
++	  Say Y here if you have a TS-ETH100 PC/104 peripheral.
++	  IRQ numbers and I/O address will be configurated automaticaly.
++	 =20
++	  To compile this driver as a module, choose M here: the module
++	  will be called ax88796_ts_eth100.    =20
++
+ config MACE
+ 	tristate "MACE (Power Mac ethernet) support"
+ 	depends on PPC_PMAC && PPC32
+diff --git a/drivers/net/Makefile b/drivers/net/Makefile
+index 7629c90..0be3739 100644
+--- a/drivers/net/Makefile
++++ b/drivers/net/Makefile
+@@ -124,6 +124,7 @@ obj-$(CONFIG_B44) +=3D b44.o
+ obj-$(CONFIG_FORCEDETH) +=3D forcedeth.o
+ obj-$(CONFIG_NE_H8300) +=3D ne-h8300.o
+ obj-$(CONFIG_AX88796) +=3D ax88796.o
++obj-$(CONFIG_AX88796_TS_ETH100) +=3D ax88796_ts_eth100.o
+=20
+ obj-$(CONFIG_TSI108_ETH) +=3D tsi108_eth.o
+ obj-$(CONFIG_MV643XX_ETH) +=3D mv643xx_eth.o
+diff --git a/drivers/net/ax88796.c b/drivers/net/ax88796.c
+index a886a4b..f96d9eb 100644
+--- a/drivers/net/ax88796.c
++++ b/drivers/net/ax88796.c
+@@ -911,7 +911,11 @@ static int ax_probe(struct platform_device *pdev)
+ 			goto exit_mem2;
+ 		}
+=20
++    #ifdef CONFIG_AX88796_TS_ETH100
++    ei_status.reg_offset[0x10] =3D ax->map2 - ei_status.mem + 0x10;
++    #else
+ 		ei_status.reg_offset[0x1f] =3D ax->map2 - ei_status.mem;
++    #endif
+ 	}
+=20
+ 	/* got resources, now initialise and register device */
+diff --git a/drivers/net/ax88796_ts_eth100.c b/drivers/net/ax88796_ts_et=
h100.c
+new file mode 100644
+index 0000000..19746c3
+--- /dev/null
++++ b/drivers/net/ax88796_ts_eth100.c
+@@ -0,0 +1,184 @@
++/*
++ *  linux/drivers/net/ax88796_ts_eth100.c
++ *  Technologic Systems TS-ETH100 support.
++ *
++ * (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/irq.h>
++#include <net/ax88796.h>
++#include <mach/hardware.h>
++#include <mach/gpio.h>
++
++#define TS72XX_ETH100_IO8_PHYS_BASE  (TS72XX_PC104_8BIT_IO_PHYS_BASE)
++#define TS72XX_ETH100_IO8_SIZE       (TS72XX_PC104_8BIT_IO_SIZE)
++#define TS72XX_ETH100_IO16_PHYS_BASE (TS72XX_PC104_16BIT_IO_PHYS_BASE)
++#define TS72XX_ETH100_IO16_SIZE      (TS72XX_PC104_16BIT_IO_SIZE)
++
++/* Technologic systems I/O space */
++#define TS_ETH100_PLD_0 0x100
++#define TS_ETH100_PLD_1 0x110
++#define TS_ETH100_PLD_2 0x120
++#define TS_ETH100_PLD_3 0x130
++
++/* NE2000 I/O space */
++#define TS_ETH100_MAC_0 0x200
++#define TS_ETH100_MAC_1 0x240
++#define TS_ETH100_MAC_2 0x300
++#define TS_ETH100_MAC_3 0x340
++
++/* Board identifier must be 5 ; PLD revision should be 1 */
++#define is_eth100_present(__iomem, __offset) \
++  (((__raw_readb(__iomem + __offset) & 0xF) =3D=3D 0x5) && \
++   ((__raw_readb(__iomem + __offset + 4) & 0xF) =3D=3D 0x1))
++
++/* Jumpers status (SRAM control register) */
++#define read_irq(__iomem, __offset) \
++  (__raw_readb(__iomem + __offset + 8) & 0xE)
++
++
++static u32 offsets[0x20] =3D {
++  0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
++  0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
++  0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
++  0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F
++};
++
++static struct ax_plat_data ts72xx_eth100_asix_data =3D {
++  .flags =3D AXFLG_HAS_93CX6,
++  .wordlength =3D 2,
++  .dcr_val  =3D 0x48,
++  .rcr_val  =3D 0x40,
++  .reg_offsets =3D offsets,
++};
++
++static struct resource ts72xx_eth100_resource[] =3D {
++  [0] =3D {
++    .start =3D TS72XX_ETH100_IO8_PHYS_BASE,
++    .end   =3D TS72XX_ETH100_IO8_PHYS_BASE + 0x3ff, //0x20 -1,
++    .flags =3D IORESOURCE_MEM
++  },
++  [1] =3D { /* 0x10 is NE_DATAPORT is 16-bit access */
++    .start =3D TS72XX_ETH100_IO16_PHYS_BASE,
++    .end   =3D TS72XX_ETH100_IO16_PHYS_BASE + 0x3ff, //0x20 -1,
++    .flags =3D IORESOURCE_MEM
++  },
++  [2] =3D {
++    .start =3D IRQ_EP93XX_EXT1,
++    .end   =3D IRQ_EP93XX_EXT1,
++    .flags =3D IORESOURCE_IRQ
++  }
++};
++
++
++static void ts72xx_eth100_release(struct device *dev)
++{
++  // nothing to do (no kfree) because we have static struct
++}
++
++
++static struct platform_device ts72xx_eth100_device_asix =3D {
++  .name   =3D "ax88796",
++  .id   =3D 0,
++  .num_resources  =3D ARRAY_SIZE(ts72xx_eth100_resource),
++  .resource =3D ts72xx_eth100_resource,
++  .dev    =3D {
++    .platform_data =3D &ts72xx_eth100_asix_data,
++    .release =3D ts72xx_eth100_release,
++  }
++};
++
++
++static int __init ts_eth100_init(void)
++{
++  void __iomem *iomem;
++  static struct platform_device *ethX =3D NULL;
++
++  iomem =3D ioremap(TS72XX_ETH100_IO8_PHYS_BASE, TS72XX_ETH100_IO8_SIZE=
);
++  if (iomem !=3D NULL) {
++    int irq =3D 0;
++
++    ethX =3D &ts72xx_eth100_device_asix;
++
++    if (is_eth100_present(iomem, TS_ETH100_PLD_0)) {
++      ethX->resource[0].start +=3D TS_ETH100_MAC_0;
++      ethX->resource[0].end   +=3D TS_ETH100_MAC_0;
++      ethX->resource[1].start +=3D TS_ETH100_MAC_0;
++      ethX->resource[1].end   +=3D TS_ETH100_MAC_0;
++      irq =3D read_irq(iomem, TS_ETH100_PLD_0);
++    } else if(is_eth100_present(iomem, TS_ETH100_PLD_1)) {
++      ethX->resource[0].start +=3D TS_ETH100_MAC_1;
++      ethX->resource[0].end   +=3D TS_ETH100_MAC_1;
++      ethX->resource[1].start +=3D TS_ETH100_MAC_1;
++      ethX->resource[1].end   +=3D TS_ETH100_MAC_1;
++      irq =3D read_irq(iomem, TS_ETH100_PLD_1);
++    } else if(is_eth100_present(iomem, TS_ETH100_PLD_2)) {
++      ethX->resource[0].start +=3D TS_ETH100_MAC_2;
++      ethX->resource[0].end   +=3D TS_ETH100_MAC_2;
++      ethX->resource[1].start +=3D TS_ETH100_MAC_2;
++      ethX->resource[1].end   +=3D TS_ETH100_MAC_2;
++      irq =3D read_irq(iomem, TS_ETH100_PLD_2);
++    } else if(is_eth100_present(iomem, TS_ETH100_PLD_3)) {
++      ethX->resource[0].start +=3D TS_ETH100_MAC_3;
++      ethX->resource[0].end   +=3D TS_ETH100_MAC_3;
++      ethX->resource[1].start +=3D TS_ETH100_MAC_3;
++      ethX->resource[1].end   +=3D TS_ETH100_MAC_3;
++      irq =3D read_irq(iomem, TS_ETH100_PLD_3);
++    } else {
++      ethX =3D NULL;
++    }
++
++    /* Translate IRQ number */
++    if (ethX !=3D NULL) {
++      switch (irq) {
++        case 0x2: /* IRQ5 */
++          ethX->resource[2].start =3D gpio_to_irq(EP93XX_GPIO_LINE_F(3)=
); // 83
++          ethX->resource[2].end   =3D gpio_to_irq(EP93XX_GPIO_LINE_F(3)=
);
++          gpio_direction_input(EP93XX_GPIO_LINE_F(3));
++          set_irq_type(ethX->resource[2].start, IRQ_TYPE_EDGE_RISING);
++          break;
++        case 0x4: /* IRQ6 */
++          ethX->resource[2].start =3D IRQ_EP93XX_EXT1;
++          ethX->resource[2].end   =3D IRQ_EP93XX_EXT1;
++          break;
++        case 0x8: /* IRQ7 */
++        default:
++          ethX->resource[2].start =3D IRQ_EP93XX_EXT3;
++          ethX->resource[2].end   =3D IRQ_EP93XX_EXT3;
++          break;
++      }
++    }
++
++    iounmap(iomem);
++  }
++
++  return ((ethX =3D=3D NULL) ? -ENODEV :
++      platform_device_register(&ts72xx_eth100_device_asix));
++}
++
++
++static void __exit ts_eth100_exit(void)
++{
++  platform_device_unregister(&ts72xx_eth100_device_asix);
++}
++
++module_init(ts_eth100_init);
++module_exit(ts_eth100_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("Asix 88796 ethernet probe module for TS-ETH100 (TS-=
72xx)");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("0.2");
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0029-EP93xx-Power-Manageme=
nt-Routines.patch b/recipes/linux/linux-2.6.27/ts72xx/0029-EP93xx-Power-M=
anagement-Routines.patch
new file mode 100644
index 0000000..846a510
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0029-EP93xx-Power-Management-Rout=
ines.patch
@@ -0,0 +1,125 @@
+From 6637a098eabb13d068c66e83e5bb0954a5266486 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 14:36:38 +0100
+Subject: [PATCH] EP93xx Power Management Routines
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/Makefile                   |    3 +
+ arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h |    1 +
+ arch/arm/mach-ep93xx/pm.c                       |   77 ++++++++++++++++=
+++++++
+ 3 files changed, 81 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/pm.c
+
+diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefi=
le
+index bbf8f9a..2f65745 100644
+--- a/arch/arm/mach-ep93xx/Makefile
++++ b/arch/arm/mach-ep93xx/Makefile
+@@ -17,3 +17,6 @@ obj-$(CONFIG_MACH_GESBC9312)	+=3D gesbc9312.o
+ obj-$(CONFIG_MACH_MICRO9)	+=3D micro9.o
+ obj-$(CONFIG_MACH_TS72XX)	+=3D ts72xx.o
+ obj-$(CONFIG_MACH_TS72XX_SBCINFO)	+=3D ts72xx_sbcinfo.o
++
++# Power Management
++obj-$(CONFIG_PM) +=3D pm.o
+diff --git a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h b/arch/arm/=
mach-ep93xx/include/mach/ep93xx-regs.h
+index c0a8a95..f5218de 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
++++ b/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
+@@ -135,6 +135,7 @@
+ #define EP93XX_SYSCON_CLOCK_SET2	EP93XX_SYSCON_REG(0x24)
+ #define EP93XX_SYSCON_DEVICE_CONFIG	EP93XX_SYSCON_REG(0x80)
+ #define EP93XX_SYSCON_DEVICE_CONFIG_CRUNCH_ENABLE	0x00800000
++#define EP93XX_SYSCON_DEVICE_CONFIG_SHENA	0x00000001
+ #define EP93XX_SYSCON_SWLOCK		EP93XX_SYSCON_REG(0xc0)
+ #define EP93XX_SYSCON_CHIPID		EP93XX_SYSCON_REG(0x94)
+=20
+diff --git a/arch/arm/mach-ep93xx/pm.c b/arch/arm/mach-ep93xx/pm.c
+new file mode 100644
+index 0000000..0c4ba53
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/pm.c
+@@ -0,0 +1,77 @@
++/*
++ *  arch/arm/mach-ep93xx/pm.c
++ *
++ *  EP93xx Power Management Routines
++ *
++ *  Based on pm.c from Andre Renaud, Bluewater Systems Ltd.
++ *
++ *  (c) Copyright 2008  Matthieu Crapet <mcrapet@gmail.com>
++ *
++ *  This program is free software; you can redistribute it and/or
++ *  modify it under the terms of the GNU General Public License
++ *  as published by the Free Software Foundation; either version
++ *  2 of the License, or (at your option) any later version.
++ */
++
++#include <linux/suspend.h>
++#include <linux/sched.h>
++#include <linux/proc_fs.h>
++#include <linux/interrupt.h>
++#include <linux/sysfs.h>
++#include <linux/module.h>
++#include <mach/hardware.h>
++
++
++static inline void ep93xx_standby(void)
++{
++  u32 v;
++  v =3D __raw_readl(EP93XX_SYSCON_DEVICE_CONFIG);
++  v |=3D EP93XX_SYSCON_DEVICE_CONFIG_SHENA;
++  __raw_writel(0xaa, EP93XX_SYSCON_SWLOCK);
++  __raw_writel(v, EP93XX_SYSCON_DEVICE_CONFIG);
++
++  v =3D __raw_readl(EP93XX_SYSCON_STANDBY);
++
++  asm("nop; nop; nop; nop; nop");
++}
++
++static inline void ep93xx_resume(void)
++{
++  u32 v;
++
++  v =3D __raw_readl(EP93XX_SYSCON_DEVICE_CONFIG);
++  v &=3D ~EP93XX_SYSCON_DEVICE_CONFIG_SHENA;
++  __raw_writel(0xaa, EP93XX_SYSCON_SWLOCK);
++  __raw_writel(v, EP93XX_SYSCON_DEVICE_CONFIG);
++}
++
++static int suspend_ep93xx_enter(suspend_state_t state)
++{
++  switch (state) {
++    case PM_SUSPEND_STANDBY:
++    case PM_SUSPEND_MEM:
++      ep93xx_standby(); /* go zzz */
++      ep93xx_resume();
++  }
++  return 0;
++}
++
++static int suspend_ep93xx_valid(suspend_state_t state)
++{
++  return (state =3D=3D PM_SUSPEND_STANDBY) ||
++    (state =3D=3D PM_SUSPEND_MEM);
++}
++
++
++static struct platform_suspend_ops ep93xx_suspend_ops =3D {
++  .enter	=3D suspend_ep93xx_enter,
++  .valid	=3D suspend_ep93xx_valid,
++};
++
++static int __init ep93xx_pm_init(void)
++{
++  pr_info("ep93xx: Power Management\n");
++  suspend_set_ops(&ep93xx_suspend_ops);
++  return 0;
++}
++__initcall(ep93xx_pm_init);
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/0030-EP93xx-CPUfreq-driver=
.patch b/recipes/linux/linux-2.6.27/ts72xx/0030-EP93xx-CPUfreq-driver.pat=
ch
new file mode 100644
index 0000000..eecbf0b
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/0030-EP93xx-CPUfreq-driver.patch
@@ -0,0 +1,332 @@
+From 9334371292b94cebacd6383c8d60a06bdd7d899b Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 4 Jan 2009 14:37:24 +0100
+Subject: [PATCH] EP93xx CPUfreq driver
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/Kconfig               |   11 ++-
+ arch/arm/mach-ep93xx/Makefile  |    2 +
+ arch/arm/mach-ep93xx/cpufreq.c |  265 +++++++++++++++++++++++++++++++++=
+++++++
+ 3 files changed, 277 insertions(+), 1 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/cpufreq.c
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index d196fe8..f6259a8 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1007,7 +1007,7 @@ config ATAGS_PROC
+=20
+ endmenu
+=20
+-if (ARCH_SA1100 || ARCH_INTEGRATOR || ARCH_OMAP || ARCH_IMX || ARCH_PXA=
)
++if (ARCH_SA1100 || ARCH_INTEGRATOR || ARCH_OMAP || ARCH_IMX || ARCH_EP9=
3XX || ARCH_PXA)
+=20
+ menu "CPU Frequency scaling"
+=20
+@@ -1043,6 +1043,15 @@ config CPU_FREQ_IMX
+=20
+ 	  If in doubt, say N.
+=20
++config CPU_FREQ_EP93XX
++	tristate "CPUfreq driver for EP93XX CPUs"
++	depends on ARCH_EP93XX && CPU_FREQ
++	default n
++	help
++	  This enables the CPUfreq driver for EP9301 CPUs. Not tested with EP9=
302.
++
++	  If in doubt, say N.
++
+ config CPU_FREQ_PXA
+ 	bool
+ 	depends on CPU_FREQ && ARCH_PXA && PXA25x
+diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefi=
le
+index 2f65745..4b6b542 100644
+--- a/arch/arm/mach-ep93xx/Makefile
++++ b/arch/arm/mach-ep93xx/Makefile
+@@ -6,6 +6,8 @@ obj-m			:=3D
+ obj-n			:=3D
+ obj-			:=3D
+=20
++obj-$(CONFIG_CPU_FREQ_EP93XX)	+=3D cpufreq.o
++
+ obj-$(CONFIG_MACH_ADSSPHERE)	+=3D adssphere.o
+ obj-$(CONFIG_MACH_EDB9302)	+=3D edb9302.o
+ obj-$(CONFIG_MACH_EDB9302A)	+=3D edb9302a.o
+diff --git a/arch/arm/mach-ep93xx/cpufreq.c b/arch/arm/mach-ep93xx/cpufr=
eq.c
+new file mode 100644
+index 0000000..1721ac4
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/cpufreq.c
+@@ -0,0 +1,265 @@
++/*
++ * cpufreq.c: clock scaling for Cirrus EP93XX embedded chip
++ *
++ * Copyright (C) 2008 Matthieu Crapet <mcrapet@gmail.com>
++ *
++ * Based on "cpu-ep93xx.c" driver (for 2.4 kernel) by
++ * Bob Lees bob@diamond.demon.co.uk (Diamond Consulting Services Ltd)
++ * Ideas taken from "clock.c" by Lennert Buytenhek <buytenh@wantstofly.=
org>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307=
  USA
++ *
++ * Theory of operations
++ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++ *
++ * Clock scaling can be used to lower the power consumption of the CPU
++ * core. For this processor the major power saving is reducing the mem =
clk.
++ *
++ * The ep93xx has 2 registers to control the 2 PLLs of the ep93xx:
++ *   PLL1 controls the cpu, bus and peripheral clocks;
++ *   PLL2 controls the USB, MIR and ADC clocks.
++ *
++ *   ClkSet1 (EP93XX_SYSCON_CLOCK_SET1)  0x80930020  Clock speed contro=
l 1 (i.e. PLL1 config)
++ *   ClkSet2 (EP93XX_SYSCON_CLOCK_SET2)  0x80930024  Clock speed contro=
l 2 (i.e. PLL2 config)
++ *
++ * This driver only focus on PLL1. The pll has two multipliers/dividers=
:
++ * Fout =3D 14.7456 * (PLL1_X1FBD + 1) * (PLL1_X2FBD + 1) / ((PLL1_X2IP=
D + 1) * 2 ^ PLL1_PS)
++ *      =3D 14.7456 * (PLL1_X1FBD + 1) * (PLL1_X2FBD + 1) / (PLL1_X2IPD=
 + 1) / 2 ^ PLL1_PS
++ *
++ *
++ * fclk [processor    ] =3D pll1 / fclk_divisor
++ * hclk [AHB bus clock] =3D pll1 / hclk_divisor
++ * pclk [APB bus clock] =3D hclk / pclk_divisor
++ * fclk >=3D hclk > pclk
++ *
++ *                        EP9301   EP9302/07/12/15
++ * PLL1 fout max (MHz)     528           528
++ * fclk min (MHz)         12.9          12.9
++ * fclk max (MHz)          166           200
++ * hclk max (MHz)           66           100
++ * pclk max (MHz)           50            50
++ *
++ * Notes:
++ * - Ethernet (100 MBit) doesn't work with hclk < 25MHz.
++ * - This driver does not use the clk_{put,roundrate} (clock.c) functio=
ns. It is
++ *   standalone.
++ * - Is it safe to have fclk =3D hclk ?
++ */
++
++#include <linux/kernel.h>
++#include <linux/types.h>
++#include <linux/init.h>
++#include <linux/cpufreq.h>
++#include <mach/hardware.h>
++
++
++/* ClkSet1 register */
++#define SYSCON_CLKSET1_PLL1_PS_SHIFT  16
++#define SYSCON_CLKSET1_PCLK_DIV_SHIFT 18
++#define SYSCON_CLKSET1_HCLK_DIV_SHIFT 20
++#define SYSCON_CLKSET1_FCLK_DIV_SHIFT 25
++
++#define CLKSET1(p, pl, pd, h, f)  ( p | \
++    ( pl << SYSCON_CLKSET1_PLL1_PS_SHIFT) | \
++    ( pd << SYSCON_CLKSET1_PCLK_DIV_SHIFT)| \
++    ( h << SYSCON_CLKSET1_HCLK_DIV_SHIFT) | \
++    ( f << SYSCON_CLKSET1_FCLK_DIV_SHIFT))
++
++typedef struct {
++  int speed;    /* in kHz */
++  u32 preset;   /* x1fbd, x2fbd and x2ipd are left unchanged */
++  u32 pll1_ps;  /* sets final divide from pll */
++  u32 pdiv;     /* sets pclk, peripheral clk (division of hclk) */
++  u32 hdiv;     /* sets hclk, bus (memory) clk */
++  u32 fdiv;     /* sets fclk, processor clk */
++} ep93xx_speed_settings_t;
++
++static char fclk_divisors[] =3D { 1, 2, 4, 8, 16, 1, 1, 1 };
++
++
++/* Suitable for EP9301. Assumed: PLL1 =3D 331.8 MHz (X1FBD1=3D19, X1FBD=
2=3D17, X2IPD=3D15)*/
++static ep93xx_speed_settings_t ep93xx_clkset1_settings[] =3D
++{
++  /* { speed, preset, pll1_ps, pdiv, hdiv, fdiv } */
++  { 165888, 0x00809a2f, 0, 1, 3, 1 }, /* [0x02B49A2F] fclk=3D165.9 (fdi=
v=3D2), hclk=3D66.4 (hdiv=3D5), pclk=3D33.2 (pdiv=3D2), ps=3D1 */
++  { 165887, 0x00809a2f, 1, 1, 3, 0 }, /* [0x00B59A2F] fclk=3D165.9 (fdi=
v=3D1), hclk=3D33.2 (hdiv=3D5), pclk=3D16.6 (pdiv=3D2), ps=3D2 */
++  {  82944, 0x00809a2f, 0, 1, 3, 2 }, /* [0x04B49A2F] fclk=3D82.9 (fdiv=
=3D4), hclk=3D66.4 (hdiv=3D5), pclk=3D33.2 (pdiv=3D2), ps=3D1 */
++  {  82943, 0x00809a2f, 0, 1, 4, 2 }, /* [0x04C49A2F] fclk=3D82.9 (fdiv=
=3D4), hclk=3D55.3 (hdiv=3D6), pclk=3D27.6 (pdiv=3D2), ps=3D1 */
++  {  82942, 0x00809a2f, 1, 1, 2, 1 }, /* [0x02A59A2F] fclk=3D82.9 (fdiv=
=3D2), hclk=3D41.5 (hdiv=3D4), pclk=3D20.7 (pdiv=3D2), ps=3D2 */
++  {  41472, 0x00809a2f, 0, 1, 5, 3 }, /* [0x06D49A2F] fclk=3D41.5 (fdiv=
=3D8), hclk=3D41.5 (hdiv=3D8), pclk=3D20.7 (pdiv=3D2), ps=3D1 */
++};
++
++#if 0
++/* Suitable for EP9302/07/12/15. Assumed: PLL1 =3D 400.1 MHz (X1FBD1=3D=
23, X1FBD2=3D25, X2IPD=3D22) */
++static ep93xx_speed_settings_t ep93xx_clkset1_settings[] =3D
++{
++  /* { speed, preset, pll1_ps, pdiv, hdiv, fdiv } */
++  { 200027, 0x0080bb36, 0, 1, 2, 1 }, /* [0x02A4BB36] fclk=3D200.0 (fdi=
v=3D2), hclk=3D100.0 (hdiv=3D4), pclk=3D50.0 (pdiv=3D2), ps=3D1 */
++  { 200026, 0x0080bb36, 0, 1, 3, 1 }, /* [0x02B4BB36] fclk=3D200.0 (fdi=
v=3D2), hclk=3D80.0 (hdiv=3D5), pclk=3D40.0 (pdiv=3D2), ps=3D1 */
++  { 200025, 0x0080bb36, 0, 1, 4, 1 }, /* [0x02C4BB36] fclk=3D200.0 (fdi=
v=3D2), hclk=3D66.7 (hdiv=3D6), pclk=3D33.3 (pdiv=3D2), ps=3D1 */
++  { 100013, 0x0080bb36, 0, 1, 3, 2 }, /* [0x04B4BB36] fclk=3D100.0 (fdi=
v=3D4), hclk=3D80.0 (hdiv=3D5), pclk=3D40.0 (pdiv=3D2), ps=3D1 */
++  { 100012, 0x0080bb36, 1, 1, 2, 1 }, /* [0x02A5BB36] fclk=3D100.0 (fdi=
v=3D2), hclk=3D50.0 (hdiv=3D4), pclk=3D25.0 (pdiv=3D2), ps=3D2 */
++  { 100011, 0x0080bb36, 1, 1, 1, 1 }, /* [0x0295BB36] fclk=3D100.0 (fdi=
v=3D2), hclk=3D100.0 (hdiv=3D2), pclk=3D50.0 (pdiv=3D2), ps=3D2 */
++  {  50006, 0x0080bb36, 2, 1, 2, 1 }, /* [0x02A6BB36] fclk=3D50.0 (fdiv=
=3D2), hclk=3D25.0 (hdiv=3D4), pclk=3D12.5 (pdiv=3D2), ps=3D4 */
++  {  50005, 0x0080bb36, 2, 1, 1, 1 }, /* [0x0296BB36] fclk=3D50.0 (fdiv=
=3D2), hclk=3D50.0 (hdiv=3D2), pclk=3D25.0 (pdiv=3D2), ps=3D4 */
++  {  25003, 0x0080bb36, 3, 1, 1, 1 }, /* [0x0297BB36] fclk=3D25.0 (fdiv=
=3D2), hclk=3D25.0 (hdiv=3D2), pclk=3D12.5 (pdiv=3D2), ps=3D8 */
++};
++#endif
++
++
++static unsigned long calc_pll_rate(u32 config_word)
++{
++  unsigned long long rate;
++
++  rate =3D 14745600;
++  rate *=3D ((config_word >> 11) & 0x1f) + 1;  /* X1FBD (5 bits) */
++  rate *=3D ((config_word >> 5) & 0x3f) + 1;   /* X2FBD (6 bits) */
++  do_div(rate, (config_word & 0x1f) + 1);    /* X2IPD (5 bits) */
++  rate =3D rate >> ((config_word >> 16) & 3);  /* PS    (2 bits) */
++
++  return (unsigned long)rate;
++}
++
++
++static ep93xx_speed_settings_t *ep93xx_find_clkset1(unsigned int khz, u=
nsigned int relation)
++{
++  int i;
++  ep93xx_speed_settings_t *p =3D &ep93xx_clkset1_settings[0];
++
++  switch (relation) {
++    case CPUFREQ_RELATION_L: /* lowest frequency at or above target */
++      for (i =3D 0; i < sizeof(ep93xx_clkset1_settings)/sizeof(ep93xx_s=
peed_settings_t); i++) {
++        if (ep93xx_clkset1_settings[i].speed < khz)
++          continue;
++        if (p->speed > ep93xx_clkset1_settings[i].speed) // take lowest=
 value
++          p =3D &ep93xx_clkset1_settings[i];
++      }
++      break;
++
++    case CPUFREQ_RELATION_H: /* highest frequency below or at target */
++      for (i =3D 0; i < sizeof(ep93xx_clkset1_settings)/sizeof(ep93xx_s=
peed_settings_t); i++) {
++        if (ep93xx_clkset1_settings[i].speed > khz)
++          continue;
++        if (p->speed < ep93xx_clkset1_settings[i].speed) // take highes=
t value
++          p =3D &ep93xx_clkset1_settings[i];
++      }
++      break;
++  }
++
++  return p;
++}
++
++
++static int ep93xx_verify_speed(struct cpufreq_policy *policy)
++{
++  if (policy->cpu !=3D 0)
++    return -EINVAL;
++
++  cpufreq_verify_within_limits(policy, policy->cpuinfo.min_freq, policy=
->cpuinfo.max_freq);
++
++  return 0;
++}
++
++
++static unsigned int ep93xx_get_speed(unsigned int cpu)
++{
++  unsigned int freq;
++  u32 value;
++
++  if (cpu)
++    return 0;
++
++  value =3D __raw_readl(EP93XX_SYSCON_CLOCK_SET1);
++  if (!(value & 0x00800000)) { /* PLL1 bypassed? */
++    freq =3D 14745600;
++  } else {
++    freq =3D calc_pll_rate(value);
++  }
++  freq /=3D fclk_divisors[(value >> 25) & 0x7];
++
++  freq =3D (freq + 500) / 1000; /* rounded result in kHz */
++  return freq;
++}
++
++
++static int ep93xx_set_target(struct cpufreq_policy *policy,
++    unsigned int target_freq,
++    unsigned int relation)
++{
++  struct cpufreq_freqs freqs;
++  ep93xx_speed_settings_t *config;
++  u32 value;
++
++  config =3D  ep93xx_find_clkset1(target_freq, relation);
++
++  freqs.old =3D ep93xx_get_speed(0);
++  freqs.new =3D config->speed;
++  freqs.cpu =3D 0;
++  freqs.flags =3D 0;
++
++  //printk("ep93xx: target_freq=3D%d, old=3D%d new=3D%d (kHz) rel=3D%d\=
n", target_freq, freqs.old, freqs.new, relation);
++
++  cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
++
++  value =3D CLKSET1(config->preset, config->pll1_ps,
++      config->pdiv, config->hdiv, config->fdiv);
++  __raw_writel(value, EP93XX_SYSCON_CLOCK_SET1);
++
++  /* 5 nops required to fluch instruction pipeline */
++  __asm__ __volatile__("nop; nop; nop; nop; nop");
++
++  cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
++
++  return 0;
++}
++
++
++static int __init ep93xx_cpufreq_driver_init(struct cpufreq_policy *pol=
icy)
++{
++  printk(KERN_INFO "ep93xx-cpufreq: driver v1.0\n");
++
++  if (policy->cpu !=3D 0)
++    return -EINVAL;
++
++  policy->cur =3D policy->min =3D policy->max =3D ep93xx_get_speed(0);
++
++  policy->cpuinfo.min_freq =3D 13000;
++
++  /* Check CPU version (ep9301 special case) */
++  if (policy->cur <=3D 166000)
++    policy->cpuinfo.max_freq =3D 166000;
++  else
++    policy->cpuinfo.max_freq =3D 200000;
++
++  policy->cpuinfo.transition_latency =3D 1000000; /* 1ms (unknown =3D C=
PUFREQ_ETERNAL) */
++
++  return 0;
++}
++
++static struct cpufreq_driver ep93xx_driver =3D {
++  .flags  =3D CPUFREQ_STICKY,
++  .verify =3D ep93xx_verify_speed,
++  .target =3D ep93xx_set_target,
++  .get    =3D ep93xx_get_speed,
++  .init   =3D ep93xx_cpufreq_driver_init,
++  .name   =3D "ep93xx",
++};
++
++static int __init ep93xx_cpufreq_init(void)
++{
++  return cpufreq_register_driver(&ep93xx_driver);
++}
++
++arch_initcall(ep93xx_cpufreq_init);
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.27/ts72xx/defconfig b/recipes/linux/=
linux-2.6.27/ts72xx/defconfig
new file mode 100644
index 0000000..479b5dc
--- /dev/null
+++ b/recipes/linux/linux-2.6.27/ts72xx/defconfig
@@ -0,0 +1,1312 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.27.15
+# Sat Feb 7 00:39:10 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+CONFIG_GENERIC_GPIO=3Dy
+# CONFIG_GENERIC_TIME is not set
+# CONFIG_GENERIC_CLOCKEVENTS is not set
+CONFIG_MMU=3Dy
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_ARCH_SUPPORTS_AOUT=3Dy
+CONFIG_ZONE_DMA=3Dy
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D""
+CONFIG_LOCALVERSION_AUTO=3Dy
+CONFIG_SWAP=3Dy
+CONFIG_SYSVIPC=3Dy
+CONFIG_SYSVIPC_SYSCTL=3Dy
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D16
+# CONFIG_CGROUPS is not set
+# CONFIG_GROUP_SCHED is not set
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
+# CONFIG_RELAY is not set
+CONFIG_NAMESPACES=3Dy
+# CONFIG_UTS_NS is not set
+CONFIG_IPC_NS=3Dy
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_BLK_DEV_INITRD is not set
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_SYSCTL=3Dy
+# CONFIG_EMBEDDED is not set
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+# CONFIG_COMPAT_BRK is not set
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_VM_EVENT_COUNTERS=3Dy
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+CONFIG_MARKERS=3Dy
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+# CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
+# CONFIG_HAVE_IOREMAP_PROT is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+# CONFIG_HAVE_ARCH_TRACEHOOK is not set
+# CONFIG_HAVE_DMA_ATTRS is not set
+# CONFIG_USE_GENERIC_SMP_HELPERS is not set
+CONFIG_HAVE_CLK=3Dy
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_MODULE_FORCE_UNLOAD=3Dy
+CONFIG_MODVERSIONS=3Dy
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_KMOD=3Dy
+CONFIG_BLOCK=3Dy
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+CONFIG_IOSCHED_DEADLINE=3Dy
+CONFIG_IOSCHED_CFQ=3Dy
+# CONFIG_DEFAULT_AS is not set
+# CONFIG_DEFAULT_DEADLINE is not set
+CONFIG_DEFAULT_CFQ=3Dy
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"cfq"
+CONFIG_CLASSIC_RCU=3Dy
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_EBSA110 is not set
+CONFIG_ARCH_EP93XX=3Dy
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
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_MSM7X00A is not set
+
+#
+# Cirrus EP93xx Implementation Options
+#
+# CONFIG_CRUNCH is not set
+
+#
+# EP93xx Platforms
+#
+# CONFIG_MACH_ADSSPHERE is not set
+# CONFIG_MACH_EDB9302 is not set
+# CONFIG_MACH_EDB9302A is not set
+# CONFIG_MACH_EDB9307 is not set
+# CONFIG_MACH_EDB9312 is not set
+# CONFIG_MACH_EDB9315 is not set
+# CONFIG_MACH_EDB9315A is not set
+# CONFIG_MACH_GESBC9312 is not set
+# CONFIG_MACH_MICRO9 is not set
+# CONFIG_MACH_MICRO9H is not set
+# CONFIG_MACH_MICRO9M is not set
+# CONFIG_MACH_MICRO9L is not set
+CONFIG_MACH_TS72XX=3Dy
+# CONFIG_MACH_TS72XX_SBCINFO is not set
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_ARM920T=3Dy
+CONFIG_CPU_32v4T=3Dy
+CONFIG_CPU_ABRT_EV4T=3Dy
+CONFIG_CPU_PABRT_NOIFAR=3Dy
+CONFIG_CPU_CACHE_V4WT=3Dy
+CONFIG_CPU_CACHE_VIVT=3Dy
+CONFIG_CPU_COPY_V4WB=3Dy
+CONFIG_CPU_TLB_V4WBI=3Dy
+CONFIG_CPU_CP15=3Dy
+CONFIG_CPU_CP15_MMU=3Dy
+
+#
+# Processor Features
+#
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
+# CONFIG_OUTER_CACHE is not set
+CONFIG_ARM_VIC=3Dy
+
+#
+# Bus support
+#
+CONFIG_ARM_AMBA=3Dy
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+# CONFIG_TICK_ONESHOT is not set
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ARCH_DISCONTIGMEM_ENABLE=3Dy
+CONFIG_NODES_SHIFT=3D5
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+# CONFIG_FLATMEM_MANUAL is not set
+CONFIG_DISCONTIGMEM_MANUAL=3Dy
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_DISCONTIGMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+CONFIG_NEED_MULTIPLE_NODES=3Dy
+# CONFIG_SPARSEMEM_STATIC is not set
+# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
+CONFIG_PAGEFLAGS_EXTENDED=3Dy
+CONFIG_SPLIT_PTLOCK_CPUS=3D4096
+# CONFIG_RESOURCES_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=3D1
+CONFIG_BOUNCE=3Dy
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_ALIGNMENT_TRAP=3Dy
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0
+CONFIG_ZBOOT_ROM_BSS=3D0
+CONFIG_CMDLINE=3D"console=3DttyAM0,115200 ip=3D192.168.1.3:192.168.1.2:1=
92.168.1.2:255.255.255.0 root=3D/dev/nfs nfsroot=3D192.168.1.2:/media/dat=
a/devel/oe/ts72xx-stable/tmp/deploy/glibc/images/ts72xx/nfsroot debug "
+# CONFIG_XIP_KERNEL is not set
+CONFIG_KEXEC=3Dy
+CONFIG_ATAGS_PROC=3Dy
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+# CONFIG_PM is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+CONFIG_PACKET=3Dy
+CONFIG_PACKET_MMAP=3Dy
+CONFIG_UNIX=3Dy
+CONFIG_XFRM=3Dy
+# CONFIG_XFRM_USER is not set
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_NET_KEY=3Dy
+# CONFIG_NET_KEY_MIGRATE is not set
+CONFIG_INET=3Dy
+CONFIG_IP_MULTICAST=3Dy
+CONFIG_IP_ADVANCED_ROUTER=3Dy
+CONFIG_ASK_IP_FIB_HASH=3Dy
+# CONFIG_IP_FIB_TRIE is not set
+CONFIG_IP_FIB_HASH=3Dy
+CONFIG_IP_MULTIPLE_TABLES=3Dy
+# CONFIG_IP_ROUTE_MULTIPATH is not set
+CONFIG_IP_ROUTE_VERBOSE=3Dy
+CONFIG_IP_PNP=3Dy
+CONFIG_IP_PNP_DHCP=3Dy
+CONFIG_IP_PNP_BOOTP=3Dy
+CONFIG_IP_PNP_RARP=3Dy
+CONFIG_NET_IPIP=3Dy
+# CONFIG_NET_IPGRE is not set
+# CONFIG_IP_MROUTE is not set
+CONFIG_ARPD=3Dy
+CONFIG_SYN_COOKIES=3Dy
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+CONFIG_INET_TUNNEL=3Dy
+CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
+CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
+CONFIG_INET_XFRM_MODE_BEET=3Dy
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=3Dy
+CONFIG_INET_TCP_DIAG=3Dy
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IP_VS is not set
+# CONFIG_IPV6 is not set
+CONFIG_NETWORK_SECMARK=3Dy
+CONFIG_NETFILTER=3Dy
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=3Dy
+
+#
+# Core Netfilter Configuration
+#
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+# CONFIG_NF_CONNTRACK is not set
+# CONFIG_NETFILTER_XTABLES is not set
+
+#
+# IP: Netfilter Configuration
+#
+# CONFIG_IP_NF_QUEUE is not set
+# CONFIG_IP_NF_IPTABLES is not set
+# CONFIG_IP_NF_ARPTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
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
+CONFIG_FIB_RULES=3Dy
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+# CONFIG_WIRELESS_EXT is not set
+# CONFIG_MAC80211 is not set
+# CONFIG_IEEE80211 is not set
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
+CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
+CONFIG_STANDALONE=3Dy
+CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
+CONFIG_FW_LOADER=3Dy
+CONFIG_FIRMWARE_IN_KERNEL=3Dy
+CONFIG_EXTRA_FIRMWARE=3D""
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=3Dy
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=3Dy
+CONFIG_MTD_REDBOOT_PARTS=3Dy
+CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
+CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
+# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
+# CONFIG_MTD_CMDLINE_PARTS is not set
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=3Dy
+CONFIG_MTD_BLKDEVS=3Dy
+CONFIG_MTD_BLOCK=3Dy
+# CONFIG_MTD_BLOCK_RO is not set
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
+CONFIG_MTD_CFI=3Dy
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_GEN_PROBE=3Dy
+# CONFIG_MTD_CFI_ADV_OPTIONS is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
+CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
+CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=3Dy
+CONFIG_MTD_CFI_I2=3Dy
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+CONFIG_MTD_CFI_INTELEXT=3Dy
+# CONFIG_MTD_CFI_AMDSTD is not set
+# CONFIG_MTD_CFI_STAA is not set
+CONFIG_MTD_CFI_UTIL=3Dy
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PHYSMAP is not set
+# CONFIG_MTD_ARM_INTEGRATOR is not set
+# CONFIG_MTD_TS7200_NOR is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
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
+CONFIG_MTD_NAND=3Dy
+CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+CONFIG_MTD_NAND_TS7250=3Dy
+CONFIG_MTD_NAND_IDS=3Dy
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+# CONFIG_BLK_DEV_LOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=3Dy
+CONFIG_EEPROM_93CX6=3Dy
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_TS72XX_MAX197 is not set
+CONFIG_HAVE_IDE=3Dy
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=3Dy
+CONFIG_SCSI_DMA=3Dy
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=3Dy
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=3Dy
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+CONFIG_CHR_DEV_SG=3Dy
+# CONFIG_CHR_DEV_SCH is not set
+
+#
+# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
+#
+# CONFIG_SCSI_MULTI_LUN is not set
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=3Dm
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=3Dy
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=3Dy
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+CONFIG_PHYLIB=3Dy
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+# CONFIG_DAVICOM_PHY is not set
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+# CONFIG_SMSC_PHY is not set
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+CONFIG_EP93XX_ETH=3Dy
+CONFIG_AX88796=3Dy
+CONFIG_AX88796_93CX6=3Dy
+CONFIG_AX88796_TS_ETH100=3Dy
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_B44 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
+# CONFIG_IWLWIFI_LEDS is not set
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
+CONFIG_PPP=3Dy
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=3Dy
+CONFIG_PPP_SYNC_TTY=3Dy
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+CONFIG_PPP_MPPE=3Dy
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=3Dy
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=3Dy
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
+# CONFIG_INPUT_JOYDEV is not set
+# CONFIG_INPUT_EVDEV is not set
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=3Dy
+CONFIG_SERIO_SERPORT=3Dy
+# CONFIG_SERIO_AMBAKMI is not set
+# CONFIG_SERIO_RAW is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=3Dy
+CONFIG_CONSOLE_TRANSLATIONS=3Dy
+CONFIG_VT_CONSOLE=3Dy
+CONFIG_HW_CONSOLE=3Dy
+CONFIG_VT_HW_CONSOLE_BINDING=3Dy
+# CONFIG_DEVKMEM is not set
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
+CONFIG_SERIAL_AMBA_PL010=3Dy
+CONFIG_SERIAL_AMBA_PL010_CONSOLE=3Dy
+# CONFIG_SERIAL_AMBA_PL011 is not set
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_UNIX98_PTYS=3Dy
+CONFIG_LEGACY_PTYS=3Dy
+CONFIG_LEGACY_PTY_COUNT=3D128
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_I2C is not set
+# CONFIG_SPI is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=3Dy
+CONFIG_GPIOLIB=3Dy
+CONFIG_GPIO_SYSFS=3Dy
+
+#
+# I2C GPIO expanders:
+#
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+CONFIG_HWMON=3Dy
+# CONFIG_HWMON_VID is not set
+# CONFIG_SENSORS_F71805F is not set
+# CONFIG_SENSORS_F71882FG is not set
+# CONFIG_SENSORS_IT87 is not set
+# CONFIG_SENSORS_PC87360 is not set
+# CONFIG_SENSORS_PC87427 is not set
+# CONFIG_SENSORS_SMSC47M1 is not set
+# CONFIG_SENSORS_SMSC47B397 is not set
+# CONFIG_SENSORS_VT1211 is not set
+# CONFIG_SENSORS_W83627HF is not set
+# CONFIG_SENSORS_W83627EHF is not set
+# CONFIG_HWMON_DEBUG_CHIP is not set
+CONFIG_WATCHDOG=3Dy
+# CONFIG_WATCHDOG_NOWAYOUT is not set
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+# CONFIG_EP93XX_WATCHDOG is not set
+CONFIG_TS72XX_WATCHDOG=3Dy
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB_POSSIBLE=3Dy
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
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
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
+# CONFIG_FB is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
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
+CONFIG_DUMMY_CONSOLE=3Dy
+# CONFIG_TS72XX_CONSOLE is not set
+# CONFIG_SOUND is not set
+# CONFIG_HID_SUPPORT is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+CONFIG_USB_ARCH_HAS_OHCI=3Dy
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+CONFIG_USB=3Dy
+CONFIG_USB_DEBUG=3Dy
+# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=3Dy
+CONFIG_USB_DEVICE_CLASS=3Dy
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_OTG is not set
+CONFIG_USB_MON=3Dy
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+CONFIG_USB_OHCI_HCD=3Dy
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+
+#
+# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
+#
+
+#
+# may also be needed; see USB_STORAGE Help for more information
+#
+CONFIG_USB_STORAGE=3Dy
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_DPCM is not set
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
+CONFIG_USB_SERIAL=3Dy
+CONFIG_USB_SERIAL_CONSOLE=3Dy
+# CONFIG_USB_EZUSB is not set
+# CONFIG_USB_SERIAL_GENERIC is not set
+# CONFIG_USB_SERIAL_AIRCABLE is not set
+# CONFIG_USB_SERIAL_ARK3116 is not set
+# CONFIG_USB_SERIAL_BELKIN is not set
+# CONFIG_USB_SERIAL_CH341 is not set
+# CONFIG_USB_SERIAL_WHITEHEAT is not set
+# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
+# CONFIG_USB_SERIAL_CP2101 is not set
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
+CONFIG_USB_SERIAL_PL2303=3Dy
+# CONFIG_USB_SERIAL_OTI6858 is not set
+# CONFIG_USB_SERIAL_SPCP8X5 is not set
+# CONFIG_USB_SERIAL_HP4X is not set
+# CONFIG_USB_SERIAL_SAFE is not set
+# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
+# CONFIG_USB_SERIAL_TI is not set
+# CONFIG_USB_SERIAL_CYBERJACK is not set
+# CONFIG_USB_SERIAL_XIRCOM is not set
+CONFIG_USB_SERIAL_OPTION=3Dy
+# CONFIG_USB_SERIAL_OMNINET is not set
+# CONFIG_USB_SERIAL_DEBUG is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_BERRY_CHARGE is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_PHIDGET is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_GADGET is not set
+# CONFIG_MMC is not set
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+CONFIG_LEDS_GPIO=3Dy
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=3Dy
+CONFIG_LEDS_TRIGGER_TIMER=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
+CONFIG_RTC_LIB=3Dy
+CONFIG_RTC_CLASS=3Dy
+CONFIG_RTC_HCTOSYS=3Dy
+CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=3Dy
+CONFIG_RTC_INTF_PROC=3Dy
+CONFIG_RTC_INTF_DEV=3Dy
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+CONFIG_RTC_DRV_M48T86=3Dy
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_EP93XX is not set
+# CONFIG_RTC_DRV_PL030 is not set
+# CONFIG_RTC_DRV_PL031 is not set
+# CONFIG_DMADEVICES is not set
+
+#
+# Voltage and Current regulators
+#
+# CONFIG_REGULATOR is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_UIO is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+CONFIG_EXT2_FS_XATTR=3Dy
+# CONFIG_EXT2_FS_POSIX_ACL is not set
+# CONFIG_EXT2_FS_SECURITY is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT3_FS_XATTR=3Dy
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4DEV_FS is not set
+CONFIG_JBD=3Dy
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+CONFIG_FS_POSIX_ACL=3Dy
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
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
+CONFIG_FAT_FS=3Dy
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=3Dy
+CONFIG_FAT_DEFAULT_CODEPAGE=3D437
+CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+CONFIG_CONFIGFS_FS=3Dy
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=3Dy
+CONFIG_JFFS2_FS_DEBUG=3D0
+CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+# CONFIG_JFFS2_SUMMARY is not set
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=3Dy
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=3Dy
+# CONFIG_JFFS2_RUBIN is not set
+# CONFIG_CRAMFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+CONFIG_NFS_FS=3Dy
+CONFIG_NFS_V3=3Dy
+CONFIG_NFS_V3_ACL=3Dy
+CONFIG_NFS_V4=3Dy
+CONFIG_ROOT_NFS=3Dy
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=3Dy
+CONFIG_LOCKD_V4=3Dy
+CONFIG_NFS_ACL_SUPPORT=3Dy
+CONFIG_NFS_COMMON=3Dy
+CONFIG_SUNRPC=3Dy
+CONFIG_SUNRPC_GSS=3Dy
+CONFIG_RPCSEC_GSS_KRB5=3Dy
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
+CONFIG_PARTITION_ADVANCED=3Dy
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=3Dy
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
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
+CONFIG_NLS_CODEPAGE_437=3Dy
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_850=3Dy
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
+CONFIG_NLS_CODEPAGE_1250=3Dy
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=3Dy
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
+CONFIG_PRINTK_TIME=3Dy
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=3D2048
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+CONFIG_DEBUG_BUGVERBOSE=3Dy
+CONFIG_DEBUG_MEMORY_INIT=3Dy
+CONFIG_FRAME_POINTER=3Dy
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_HAVE_FTRACE=3Dy
+CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
+# CONFIG_FTRACE is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=3Dy
+# CONFIG_DEBUG_USER is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_CRYPTO=3Dy
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=3Dy
+CONFIG_CRYPTO_BLKCIPHER=3Dy
+CONFIG_CRYPTO_MANAGER=3Dy
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
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
+CONFIG_CRYPTO_CBC=3Dy
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=3Dy
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
+CONFIG_CRYPTO_MD5=3Dy
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=3Dy
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_ANUBIS is not set
+CONFIG_CRYPTO_ARC4=3Dy
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+CONFIG_CRYPTO_DES=3Dy
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
+# CONFIG_CRYPTO_LZO is not set
+CONFIG_CRYPTO_HW=3Dy
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+# CONFIG_GENERIC_FIND_FIRST_BIT is not set
+# CONFIG_GENERIC_FIND_NEXT_BIT is not set
+CONFIG_CRC_CCITT=3Dy
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_PLIST=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
diff --git a/recipes/linux/linux_2.6.27.bb b/recipes/linux/linux_2.6.27.b=
b
index 0437547..7661600 100644
--- a/recipes/linux/linux_2.6.27.bb
+++ b/recipes/linux/linux_2.6.27.bb
@@ -1,12 +1,13 @@
 require linux.inc
=20
-PR =3D "r13"
+PR =3D "r14"
=20
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE =3D "-1"
 DEFAULT_PREFERENCE_boc01 =3D "1"
 DEFAULT_PREFERENCE_progear =3D "1"
 DEFAULT_PREFERENCE_simpad =3D "-1"
+DEFAULT_PREFERENCE_ts72xx =3D "1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.45.bz2;=
patch=3D1 \
@@ -42,6 +43,39 @@ SRC_URI_append_simpad =3D "\
            file://connectplus-remove-ide-HACK.patch;patch=3D1 \
            "
=20
+SRC_URI_append_ts72xx =3D "\
+           file://0001-TS72xx-update-memory-map-comments.patch;patch=3D1=
 \
+           file://0002-GPIO-fix.patch;patch=3D1 \
+           file://0003-Debounce-IRQ.patch;patch=3D1 \
+           file://0004-OHCI-fix.patch;patch=3D1 \
+           file://0005-Fix-wrong-machine-ID-passed-from-RedBoot.patch;pa=
tch=3D1 \
+           file://0006-Force-the-nF-bit-on.patch;patch=3D1 \
+           file://0007-Use-CPLD-watchdog-to-reset.patch;patch=3D1 \
+           file://0008-Fix-UART-clocks.patch;patch=3D1 \
+           file://0009-CPU-info-and-board-revision.patch;patch=3D1 \
+           file://0010-GPIO-leds.patch;patch=3D1 \
+           file://0011-EP93xx-Ethernet-support.patch;patch=3D1 \
+           file://0012-TS72xx-watchdog.patch;patch=3D1 \
+           file://0013-TS7200-NOR-physmap-fix.patch;patch=3D1 \
+           file://0014-TS-7200-8MB-NOR-flash.patch;patch=3D1 \
+           file://0015-TS-72xx-MAX197-support.patch;patch=3D1 \
+           file://0016-RS485-common-bits.patch;patch=3D1 \
+           file://0017-TS-72xx-SBC-proc-info.patch;patch=3D1 \
+           file://0018-EP93xx-GPIO-I2C.patch;patch=3D1 \
+           file://0019-EP93xx-SPI-driver.patch;patch=3D1 \
+           file://0020-TS-72XX-LCD-console-driver.patch;patch=3D1 \
+           file://0021-EP93xx-GPIO-matrix-keypad.patch;patch=3D1 \
+           file://0022-TS-72xx-RS485-auto-mode-support.patch;patch=3D1 \
+           file://0023-Clean-and-invalidate-D-cache-entry.patch;patch=3D=
1 \
+           file://0024-PC-104-I-O-and-memory-mappings.patch;patch=3D1 \
+           file://0025-EP93xx-discontigmem.patch;patch=3D1 \
+           file://0026-TS72xx-PATA-support.patch;patch=3D1 \
+           file://0027-TS72xx-TS-SER1-support.patch;patch=3D1 \
+           file://0028-TS72xx-TS-ETH100.patch;patch=3D1 \
+           file://0029-EP93xx-Power-Management-Routines.patch;patch=3D1 =
\
+           file://0030-EP93xx-CPUfreq-driver.patch;patch=3D1 \
+           "
+
 # see http://bugzilla.kernel.org/show_bug.cgi?id=3D11143
 do_stage_append() {
 	if [ -f arch/${ARCH}/lib/crtsavres.o ]; then
--=20
1.6.3.3



