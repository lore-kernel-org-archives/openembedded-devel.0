Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NmuWM-0003PV-N6
	for openembedded-devel@openembedded.org; Wed, 03 Mar 2010 20:46:25 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id A1B341D360F8;
	Wed,  3 Mar 2010 20:43:20 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Mar 2010 20:43:18 +0100
Message-Id: <1267645398-7106-4-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1267645398-7106-3-git-send-email-ynezz@true.cz>
References: <20100303194141.GT24852@ibawizard.net>
	<1267645398-7106-1-git-send-email-ynezz@true.cz>
	<1267645398-7106-2-git-send-email-ynezz@true.cz>
	<1267645398-7106-3-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] linux 2.6.32: add support for ts72xx boards
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
X-List-Received-Date: Wed, 03 Mar 2010 19:46:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 .../linux-2.6.32/ts72xx/0001-ts72xx_base.patch     |  446 ++++++
 .../ts72xx/0002-ts72xx_force_machine-id.patch      |   50 +
 .../linux-2.6.32/ts72xx/0003-ep93xx_cpuinfo.patch  |   37 +
 .../linux-2.6.32/ts72xx/0004-ts72xx_sbcinfo.patch  |  226 +++
 .../linux-2.6.32/ts72xx/0005-ep93xx_eth.patch      |  540 +++++++
 .../linux-2.6.32/ts72xx/0006-ts72xx_ts_ser1.patch  |  216 +++
 .../linux-2.6.32/ts72xx/0007-ts72xx_rs485.patch    |  236 +++
 .../ts72xx/0008-ts72xx_ts_eth100.patch             |  261 +++
 .../linux-2.6.32/ts72xx/0009-ts7200_cf_ide.patch   |  120 ++
 .../linux-2.6.32/ts72xx/0010-ts72xx_pata.patch     |  414 +++++
 .../linux/linux-2.6.32/ts72xx/0011-ep93xx_pm.patch |  114 ++
 .../linux-2.6.32/ts72xx/0012-ts72xx_gpio_i2c.patch |   63 +
 .../ts72xx/0013-ts72xx_dio_keypad.patch            |  567 +++++++
 .../linux-2.6.32/ts72xx/0014-ep93xx_spi.patch      |  985 ++++++++++++
 .../linux-2.6.32/ts72xx/0015-ep93xx_cpufreq.patch  |  360 +++++
 .../ts72xx/0016-ts7200_nor_flash.patch             |  163 ++
 recipes/linux/linux-2.6.32/ts72xx/defconfig        | 1686 ++++++++++++++=
++++++
 recipes/linux/linux_2.6.32.bb                      |   22 +-
 18 files changed, 6505 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0001-ts72xx_base.pa=
tch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0002-ts72xx_force_m=
achine-id.patch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0003-ep93xx_cpuinfo=
.patch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0004-ts72xx_sbcinfo=
.patch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0005-ep93xx_eth.pat=
ch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0006-ts72xx_ts_ser1=
.patch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0007-ts72xx_rs485.p=
atch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0008-ts72xx_ts_eth1=
00.patch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0009-ts7200_cf_ide.=
patch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0010-ts72xx_pata.pa=
tch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0011-ep93xx_pm.patc=
h
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0012-ts72xx_gpio_i2=
c.patch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0013-ts72xx_dio_key=
pad.patch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0014-ep93xx_spi.pat=
ch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0015-ep93xx_cpufreq=
.patch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/0016-ts7200_nor_fla=
sh.patch
 create mode 100644 recipes/linux/linux-2.6.32/ts72xx/defconfig

diff --git a/recipes/linux/linux-2.6.32/ts72xx/0001-ts72xx_base.patch b/r=
ecipes/linux/linux-2.6.32/ts72xx/0001-ts72xx_base.patch
new file mode 100644
index 0000000..f49d424
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0001-ts72xx_base.patch
@@ -0,0 +1,446 @@
+From 69224adc54640f5fe47c5303ecbf99cb58ac8b43 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 16:48:52 +0100
+Subject: [PATCH] ts72xx_base
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+- patch: allow to force nF bit in control reg
+- small fix: drivers/input/keyboard/ep93xx_keypad.c
+- register pwm1
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/Kconfig                                |    1 +
+ arch/arm/include/asm/memory.h                   |    2 +
+ arch/arm/mach-ep93xx/Kconfig                    |    9 ++
+ arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h |   11 ++
+ arch/arm/mach-ep93xx/include/mach/memory.h      |   28 +++++
+ arch/arm/mach-ep93xx/include/mach/ts72xx.h      |  125 ++++++++++++++++=
+++++--
+ arch/arm/mach-ep93xx/ts72xx.c                   |   40 +++++++-
+ arch/arm/mm/proc-arm920.S                       |    5 +-
+ drivers/input/keyboard/ep93xx_keypad.c          |    1 +
+ 9 files changed, 210 insertions(+), 12 deletions(-)
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 1c4119c..0f1d52f 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -288,6 +288,7 @@ config ARCH_EP93XX
+ 	select CPU_ARM920T
+ 	select ARM_AMBA
+ 	select ARM_VIC
++	select ARCH_SPARSEMEM_ENABLE
+ 	select GENERIC_GPIO
+ 	select HAVE_CLK
+ 	select COMMON_CLKDEV
+diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory=
.h
+index cefedf0..bc2ff8b 100644
+--- a/arch/arm/include/asm/memory.h
++++ b/arch/arm/include/asm/memory.h
+@@ -125,8 +125,10 @@
+  * private definitions which should NOT be used outside memory.h
+  * files.  Use virt_to_phys/phys_to_virt/__pa/__va instead.
+  */
++#ifndef __virt_to_phys
+ #define __virt_to_phys(x)	((x) - PAGE_OFFSET + PHYS_OFFSET)
+ #define __phys_to_virt(x)	((x) - PHYS_OFFSET + PAGE_OFFSET)
++#endif
+=20
+ /*
+  * Convert a physical address to a Page Frame Number and back
+diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
+index 9167c3d..335b0bb 100644
+--- a/arch/arm/mach-ep93xx/Kconfig
++++ b/arch/arm/mach-ep93xx/Kconfig
+@@ -7,6 +7,15 @@ config CRUNCH
+ 	help
+ 	  Enable kernel support for MaverickCrunch.
+=20
++config CR1_NFBIT
++	bool "Turn on nF bit in ControlRegister 1"
++	help
++	  Say 'Y' here to force the nF bit on.  Usually this is set
++	  by the bootrom.  If it is not set, then the CPU core will
++	  run from HCLK instead of FCLK, and performance will suffer.
++	  If you see BogoMIPS of about 1/4 of your CPU clock, try
++	  turning this on; your performance should double.
++
+ comment "EP93xx Platforms"
+=20
+ choice
+diff --git a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h b/arch/arm/=
mach-ep93xx/include/mach/ep93xx-regs.h
+index b1f937e..358d8ff 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
++++ b/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
+@@ -111,16 +111,26 @@
+ #define EP93XX_I2S_BASE			EP93XX_APB_IOMEM(0x00020000)
+=20
+ #define EP93XX_SECURITY_BASE		EP93XX_APB_IOMEM(0x00030000)
++#define EP93XX_SECURITY_REG(x)		(EP93XX_SECURITY_BASE + (x))
++#define EP93XX_SECURITY_UNIQID		EP93XX_SECURITY_REG(0x2440)
+=20
+ #define EP93XX_GPIO_BASE		EP93XX_APB_IOMEM(0x00040000)
+ #define EP93XX_GPIO_REG(x)		(EP93XX_GPIO_BASE + (x))
+ #define EP93XX_GPIO_F_INT_STATUS	EP93XX_GPIO_REG(0x5c)
++#define EP93XX_GPIO_F_INT_DEBOUNCE	EP93XX_GPIO_REG(0x64)
+ #define EP93XX_GPIO_A_INT_STATUS	EP93XX_GPIO_REG(0xa0)
++#define EP93XX_GPIO_A_INT_DEBOUNCE	EP93XX_GPIO_REG(0xa8)
+ #define EP93XX_GPIO_B_INT_STATUS	EP93XX_GPIO_REG(0xbc)
++#define EP93XX_GPIO_B_INT_DEBOUNCE	EP93XX_GPIO_REG(0xc4)
+ #define EP93XX_GPIO_EEDRIVE		EP93XX_GPIO_REG(0xc8)
+=20
++#define EP93XX_GPIO_A_DATA		EP93XX_GPIO_REG(0x00)
++#define EP93XX_GPIO_A_DIRECTION		EP93XX_GPIO_REG(0x10)
++#define EP93XX_GPIO_B_DATA		EP93XX_GPIO_REG(0x04)
++
+ #define EP93XX_AAC_BASE			EP93XX_APB_IOMEM(0x00080000)
+=20
++#define EP93XX_SPI_PHYS_BASE		(EP93XX_APB_PHYS_BASE + 0x000a0000)
+ #define EP93XX_SPI_BASE			EP93XX_APB_IOMEM(0x000a0000)
+=20
+ #define EP93XX_IRDA_BASE		EP93XX_APB_IOMEM(0x000b0000)
+@@ -220,6 +230,7 @@
+ #define EP93XX_SYSCON_SYSCFG_LEECLK	(1<<3)
+ #define EP93XX_SYSCON_SYSCFG_LCSN2	(1<<1)
+ #define EP93XX_SYSCON_SYSCFG_LCSN1	(1<<0)
++#define EP93XX_SYSCON_CHIPID		EP93XX_SYSCON_REG(0x94)
+ #define EP93XX_SYSCON_SWLOCK		EP93XX_SYSCON_REG(0xc0)
+=20
+ #define EP93XX_WATCHDOG_BASE		EP93XX_APB_IOMEM(0x00140000)
+diff --git a/arch/arm/mach-ep93xx/include/mach/memory.h b/arch/arm/mach-=
ep93xx/include/mach/memory.h
+index 554064e..78eaacf 100644
+--- a/arch/arm/mach-ep93xx/include/mach/memory.h
++++ b/arch/arm/mach-ep93xx/include/mach/memory.h
+@@ -19,4 +19,32 @@
+ #error "Kconfig bug: No EP93xx PHYS_OFFSET set"
+ #endif
+=20
++/*
++ * Non-linear mapping like so:
++ * phys       =3D> virt
++ * 0x00000000 =3D> 0xc0000000
++ * 0x01000000 =3D> 0xc1000000
++ * 0x04000000 =3D> 0xc4000000
++ * 0x05000000 =3D> 0xc5000000
++ * 0xe0000000 =3D> 0xc8000000
++ * 0xe1000000 =3D> 0xc9000000
++ * 0xe4000000 =3D> 0xcc000000
++ * 0xe5000000 =3D> 0xcd000000
++ *
++ * As suggested here: http://marc.info/?l=3Dlinux-arm&m=3D1227544467249=
00&w=3D2
++ *
++ * Note that static inline functions won't work here because
++ * arch/arm/include/asm/memory.h uses "#ifndef __virt_to_phys" to check=
 whether to
++ * use generic functions or not.
++ */
++
++#define __phys_to_virt(p)   \
++            (((p) & 0x07ffffff) | (((p) & 0xe0000000) ? 0x08000000 : 0)=
 | PAGE_OFFSET)
++
++#define __virt_to_phys(v)   \
++            (((v) & 0x07ffffff) | (((v) & 0x08000000) ? 0xe0000000 : 0 =
))
++
++#define SECTION_SIZE_BITS 24
++#define MAX_PHYSMEM_BITS 32
++
+ #endif
+diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-=
ep93xx/include/mach/ts72xx.h
+index 3bd934e..006c5a2 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+@@ -8,21 +8,35 @@
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
+ #define TS72XX_MODEL_VIRT_BASE		0xfebff000
+ #define TS72XX_MODEL_SIZE		0x00001000
+=20
+-#define TS72XX_MODEL_TS7200		0x00
+-#define TS72XX_MODEL_TS7250		0x01
+-#define TS72XX_MODEL_TS7260		0x02
++#define TS7XXX_MODEL_TS7200		0x00
++#define TS7XXX_MODEL_TS7250		0x01
++#define TS7XXX_MODEL_TS7260		0x02
++#define TS7XXX_MODEL_TS7300		0x03
++#define TS7XXX_MODEL_TS7400		0x04
++#define TS7XXX_MODEL_MASK		0x07
+=20
+=20
+ #define TS72XX_OPTIONS_PHYS_BASE	0x22400000
+@@ -50,12 +64,13 @@
+ #define TS72XX_NAND2_CONTROL_PHYS_BASE	0x70400000
+ #define TS72XX_NAND_CONTROL_VIRT_BASE	0xfebfb000
+ #define TS72XX_NAND_CONTROL_SIZE	0x00001000
++#define TS72XX_NAND_CONTROL_OFFSET	0x00400000
+=20
+ #define TS72XX_NAND1_BUSY_PHYS_BASE	0x60800000
+ #define TS72XX_NAND2_BUSY_PHYS_BASE	0x70800000
+ #define TS72XX_NAND_BUSY_VIRT_BASE	0xfebfa000
+ #define TS72XX_NAND_BUSY_SIZE		0x00001000
+-
++#define TS72XX_NAND_BUSY_OFFSET	0x00800000
+=20
+ #define TS72XX_RTC_INDEX_VIRT_BASE	0xfebf9000
+ #define TS72XX_RTC_INDEX_PHYS_BASE	0x10800000
+@@ -65,33 +80,123 @@
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
++
++#define TS72XX_PLD_VERSION_VIRT_BASE	0xfebf5000
++#define TS72XX_PLD_VERSION_PHYS_BASE	0x23400000
++#define TS72XX_PLD_VERSION_SIZE	0x00001000
++
++#define TS72XX_RS485_CONTROL_VIRT_BASE	0xfebf4000
++#define TS72XX_RS485_CONTROL_PHYS_BASE	0x22c00000
++#define TS72XX_RS485_CONTROL_SIZE	0x00001000
++
++#define TS72XX_RS485_MODE_VIRT_BASE	0xfebf3000
++#define TS72XX_RS485_MODE_PHYS_BASE	0x23000000
++#define TS72XX_RS485_MODE_SIZE	0x00001000
++
++#define TS72XX_JUMPERS_MAX197_VIRT_BASE	0xfebf2000
++#define TS72XX_JUMPERS_MAX197_PHYS_BASE	0x10800000
++#define TS72XX_JUMPERS_MAX197_SIZE	0x00001000
++
++#define TS72XX_MAX197_SAMPLE_VIRT_BASE	0xfebf1000
++#define TS72XX_MAX197_SAMPLE_PHYS_BASE	0x10f00000
++#define TS72XX_MAX197_SAMPLE_SIZE	0x00001000
++
++#define TS72XX_RS485_AUTO485FD         1
++#define TS72XX_RS485_AUTO485HD         2
++#define TS72XX_RS485_MODE_RS232     0x00
++#define TS72XX_RS485_MODE_FD        0x01
++#define TS72XX_RS485_MODE_9600_HD   0x04
++#define TS72XX_RS485_MODE_19200_HD  0x05
++#define TS72XX_RS485_MODE_57600_HD  0x06
++#define TS72XX_RS485_MODE_115200_HD 0x07
++
++
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
++
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
+=20
+ #ifndef __ASSEMBLY__
+=20
+ static inline int board_is_ts7200(void)
+ {
+-	return __raw_readb(TS72XX_MODEL_VIRT_BASE) =3D=3D TS72XX_MODEL_TS7200;
++	return (__raw_readb(TS72XX_MODEL_VIRT_BASE) &
++			TS7XXX_MODEL_MASK) =3D=3D TS7XXX_MODEL_TS7200;
+ }
+=20
+ static inline int board_is_ts7250(void)
+ {
+-	return __raw_readb(TS72XX_MODEL_VIRT_BASE) =3D=3D TS72XX_MODEL_TS7250;
++	return (__raw_readb(TS72XX_MODEL_VIRT_BASE) &
++			TS7XXX_MODEL_MASK) =3D=3D TS7XXX_MODEL_TS7250;
+ }
+=20
+ static inline int board_is_ts7260(void)
+ {
+-	return __raw_readb(TS72XX_MODEL_VIRT_BASE) =3D=3D TS72XX_MODEL_TS7260;
++	return (__raw_readb(TS72XX_MODEL_VIRT_BASE) &
++			TS7XXX_MODEL_MASK) =3D=3D TS7XXX_MODEL_TS7260;
++}
++
++static inline int board_is_ts7400(void)
++{
++	return (__raw_readb(TS72XX_MODEL_VIRT_BASE) &
++			TS7XXX_MODEL_MASK) =3D=3D TS7XXX_MODEL_TS7400;
+ }
+=20
+ static inline int is_max197_installed(void)
+ {
+ 	return !!(__raw_readb(TS72XX_OPTIONS_VIRT_BASE) &
+-					TS72XX_OPTIONS_MAX197);
++			TS72XX_OPTIONS_MAX197);
+ }
+=20
+ static inline int is_ts9420_installed(void)
+ {
+ 	return !!(__raw_readb(TS72XX_OPTIONS2_VIRT_BASE) &
+-					TS72XX_OPTIONS2_TS9420);
++			TS72XX_OPTIONS2_TS9420);
++}
++
++static inline int is_rs485_installed(void)
++{
++	return !!(__raw_readb(TS72XX_OPTIONS_VIRT_BASE) &
++			TS72XX_OPTIONS_COM2_RS485);
++}
++
++static inline int get_ts72xx_pld_version(void)
++{
++	return (__raw_readb(TS72XX_PLD_VERSION_VIRT_BASE) & 0x7);
++}
++
++/* User jumper */
++static inline int is_jp6_set(void)
++{
++	return (__raw_readb(TS72XX_OPTIONS2_VIRT_BASE) & 0x1);
+ }
+ #endif
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index 259f782..4a97ff7 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -51,7 +51,36 @@ static struct map_desc ts72xx_io_desc[] __initdata =3D=
 {
+ 		.pfn		=3D __phys_to_pfn(TS72XX_RTC_DATA_PHYS_BASE),
+ 		.length		=3D TS72XX_RTC_DATA_SIZE,
+ 		.type		=3D MT_DEVICE,
+-	}
++	},
++	/* Use this for debug only. Each device will map its own PC/104 addres=
s space */
++	///* PC/104 (8-bit) I/O bus */
++	//{
++	//  .virtual  =3D TS72XX_PC104_8BIT_IO_VIRT_BASE,
++	//  .pfn    =3D __phys_to_pfn(TS72XX_PC104_8BIT_IO_PHYS_BASE),
++	//  .length   =3D TS72XX_PC104_8BIT_IO_SIZE,
++	//  .type   =3D MT_DEVICE,
++	//},
++	///* PC/104 (16-bit) I/O bus */
++	//{
++	//  .virtual  =3D TS72XX_PC104_16BIT_IO_VIRT_BASE,
++	//  .pfn    =3D __phys_to_pfn(TS72XX_PC104_16BIT_IO_PHYS_BASE),
++	//  .length   =3D TS72XX_PC104_16BIT_IO_SIZE,
++	//  .type   =3D MT_DEVICE,
++	//},
++	///* PC/104 (8-bit) MEM bus */
++	//{
++	//  .virtual  =3D TS72XX_PC104_8BIT_MEM_VIRT_BASE,
++	//  .pfn    =3D __phys_to_pfn(TS72XX_PC104_8BIT_MEM_PHYS_BASE),
++	//  .length   =3D TS72XX_PC104_8BIT_MEM_SIZE,
++	//  .type   =3D MT_DEVICE,
++	//},
++	///* PC/104 (16-bit) MEM bus */
++	//{
++	//  .virtual  =3D TS72XX_PC104_16BIT_MEM_VIRT_BASE,
++	//  .pfn    =3D __phys_to_pfn(TS72XX_PC104_16BIT_MEM_PHYS_BASE),
++	//  .length   =3D TS72XX_PC104_16BIT_MEM_SIZE,
++	//  .type   =3D MT_DEVICE,
++	//}
+ };
+=20
+ static struct map_desc ts72xx_nand_io_desc[] __initdata =3D {
+@@ -140,6 +169,9 @@ static void __init ts72xx_register_flash(void)
+ 		platform_device_register(&ts72xx_flash);
+ }
+=20
++/**********************************************************************=
***
++ * RTC
++ **********************************************************************=
***/
+ static unsigned char ts72xx_rtc_readbyte(unsigned long addr)
+ {
+ 	__raw_writeb(addr, TS72XX_RTC_INDEX_VIRT_BASE);
+@@ -166,6 +198,9 @@ static struct platform_device ts72xx_rtc_device =3D =
{
+ 	.num_resources	=3D 0,
+ };
+=20
++/**********************************************************************=
***
++ * Ethernet
++ **********************************************************************=
***/
+ static struct ep93xx_eth_data ts72xx_eth_data =3D {
+ 	.phy_id		=3D 1,
+ };
+@@ -177,6 +212,9 @@ static void __init ts72xx_init_machine(void)
+ 	platform_device_register(&ts72xx_rtc_device);
+=20
+ 	ep93xx_register_eth(&ts72xx_eth_data, 1);
++
++	/* PWM1 is DIO_6 on TS-72xx header */
++	ep93xx_register_pwm(0, 1);
+ }
+=20
+ MACHINE_START(TS72XX, "Technologic Systems TS-72xx SBC")
+diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
+index 2b7c197..f85476b 100644
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
+@@ -373,6 +373,9 @@ __arm920_setup:
+ 	mrc	p15, 0, r0, c1, c0		@ get control register v4
+ 	bic	r0, r0, r5
+ 	orr	r0, r0, r6
++#ifdef CONFIG_CR1_NFBIT
++        orr     r0, r0, #0x40000000             @ set nF
++#endif
+ 	mov	pc, lr
+ 	.size	__arm920_setup, . - __arm920_setup
+=20
+diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyb=
oard/ep93xx_keypad.c
+index 181d30e..0012907 100644
+--- a/drivers/input/keyboard/ep93xx_keypad.c
++++ b/drivers/input/keyboard/ep93xx_keypad.c
+@@ -23,6 +23,7 @@
+ #include <linux/platform_device.h>
+ #include <linux/interrupt.h>
+ #include <linux/input.h>
++#include <linux/io.h>
+ #include <linux/clk.h>
+=20
+ #include <mach/hardware.h>
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0002-ts72xx_force_machine-=
id.patch b/recipes/linux/linux-2.6.32/ts72xx/0002-ts72xx_force_machine-id=
.patch
new file mode 100644
index 0000000..5d14d93
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0002-ts72xx_force_machine-id.patc=
h
@@ -0,0 +1,50 @@
+From 88876d29c602759651b448912627ebfae9d12cf6 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 17:03:17 +0100
+Subject: [PATCH] ts72xx_force_machine-id
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/kernel/head.S       |    3 +++
+ arch/arm/mach-ep93xx/Kconfig |    7 +++++++
+ 2 files changed, 10 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
+index 38ccbe1..c2e4514 100644
+--- a/arch/arm/kernel/head.S
++++ b/arch/arm/kernel/head.S
+@@ -82,6 +82,9 @@ ENTRY(stext)
+ 	bl	__lookup_processor_type		@ r5=3Dprocinfo r9=3Dcpuid
+ 	movs	r10, r5				@ invalid processor (r5=3D0)?
+ 	beq	__error_p			@ yes, error 'p'
++#ifdef CONFIG_MACH_TS72XX_FORCE_MACHINEID
++	ldr r1, =3D0x2a1
++#endif
+ 	bl	__lookup_machine_type		@ r5=3Dmachinfo
+ 	movs	r8, r5				@ invalid machine (r5=3D0)?
+ 	beq	__error_a			@ yes, error 'a'
+diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
+index 335b0bb..049c9dd 100644
+--- a/arch/arm/mach-ep93xx/Kconfig
++++ b/arch/arm/mach-ep93xx/Kconfig
+@@ -191,6 +191,13 @@ config EP93XX_EARLY_UART3
+=20
+ endchoice
+=20
++config MACH_TS72XX_FORCE_MACHINEID
++	bool "Force Machine ID"
++	depends on MACH_TS72XX
++	help
++	  Say 'Y' here to force Machine ID to 0x2A1 (MACH_TYPE_TS72XX legacy v=
alue)
++	  In early days Technologic Systems fixed the 0x163 value in redboot.
++
+ endmenu
+=20
+ endif
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0003-ep93xx_cpuinfo.patch =
b/recipes/linux/linux-2.6.32/ts72xx/0003-ep93xx_cpuinfo.patch
new file mode 100644
index 0000000..9f894f4
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0003-ep93xx_cpuinfo.patch
@@ -0,0 +1,37 @@
+From 3ce6628293a97c7fcbec52d6889338d3dbdbd595 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 17:07:14 +0100
+Subject: [PATCH] ep93xx_cpuinfo
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/kernel/setup.c |    9 +++++++++
+ 1 files changed, 9 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
+index c6c57b6..29d5f4f 100644
+--- a/arch/arm/kernel/setup.c
++++ b/arch/arm/kernel/setup.c
+@@ -860,6 +860,15 @@ static int c_show(struct seq_file *m, void *v)
+ 	seq_puts(m, "\n");
+=20
+ 	seq_printf(m, "Hardware\t: %s\n", machine_name);
++
++	#if defined(CONFIG_ARCH_EP93XX)
++	#include <mach/io.h>
++	#include <mach/ep93xx-regs.h>
++	system_rev =3D *((unsigned int *)EP93XX_SYSCON_CHIPID) >> 28;
++	system_serial_low =3D *((unsigned int *)EP93XX_SECURITY_UNIQID);
++	system_serial_high =3D 0;
++	#endif
++
+ 	seq_printf(m, "Revision\t: %04x\n", system_rev);
+ 	seq_printf(m, "Serial\t\t: %08x%08x\n",
+ 		   system_serial_high, system_serial_low);
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0004-ts72xx_sbcinfo.patch =
b/recipes/linux/linux-2.6.32/ts72xx/0004-ts72xx_sbcinfo.patch
new file mode 100644
index 0000000..aa24abc
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0004-ts72xx_sbcinfo.patch
@@ -0,0 +1,226 @@
+From c46befec6d609225589895559e3ffa165368e90e Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 17:11:19 +0100
+Subject: [PATCH] ts72xx_sbcinfo
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/Kconfig          |    7 ++
+ arch/arm/mach-ep93xx/Makefile         |    1 +
+ arch/arm/mach-ep93xx/ts72xx.c         |    5 +
+ arch/arm/mach-ep93xx/ts72xx_sbcinfo.c |  156 ++++++++++++++++++++++++++=
+++++++
+ 4 files changed, 169 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/ts72xx_sbcinfo.c
+
+diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
+index 049c9dd..34d2c3b 100644
+--- a/arch/arm/mach-ep93xx/Kconfig
++++ b/arch/arm/mach-ep93xx/Kconfig
+@@ -198,6 +198,13 @@ config MACH_TS72XX_FORCE_MACHINEID
+ 	  Say 'Y' here to force Machine ID to 0x2A1 (MACH_TYPE_TS72XX legacy v=
alue)
+ 	  In early days Technologic Systems fixed the 0x163 value in redboot.
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
+index eae6199..c2451e6 100644
+--- a/arch/arm/mach-ep93xx/Makefile
++++ b/arch/arm/mach-ep93xx/Makefile
+@@ -11,3 +11,4 @@ obj-$(CONFIG_MACH_EDB93XX)	+=3D edb93xx.o
+ obj-$(CONFIG_MACH_GESBC9312)	+=3D gesbc9312.o
+ obj-$(CONFIG_MACH_MICRO9)	+=3D micro9.o
+ obj-$(CONFIG_MACH_TS72XX)	+=3D ts72xx.o
++obj-$(CONFIG_MACH_TS72XX_SBCINFO)	+=3D ts72xx_sbcinfo.o
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index 4a97ff7..2c0af20 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -32,6 +32,11 @@ static struct map_desc ts72xx_io_desc[] __initdata =3D=
 {
+ 		.length		=3D TS72XX_MODEL_SIZE,
+ 		.type		=3D MT_DEVICE,
+ 	}, {
++		.virtual	=3D TS72XX_PLD_VERSION_VIRT_BASE,
++		.pfn		=3D __phys_to_pfn(TS72XX_PLD_VERSION_PHYS_BASE),
++		.length		=3D TS72XX_PLD_VERSION_SIZE,
++		.type		=3D MT_DEVICE,
++	}, {
+ 		.virtual	=3D TS72XX_OPTIONS_VIRT_BASE,
+ 		.pfn		=3D __phys_to_pfn(TS72XX_OPTIONS_PHYS_BASE),
+ 		.length		=3D TS72XX_OPTIONS_SIZE,
+diff --git a/arch/arm/mach-ep93xx/ts72xx_sbcinfo.c b/arch/arm/mach-ep93x=
x/ts72xx_sbcinfo.c
+new file mode 100644
+index 0000000..4589d14
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/ts72xx_sbcinfo.c
+@@ -0,0 +1,156 @@
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
++#include <linux/io.h>
++#include <linux/proc_fs.h>
++#include <mach/hardware.h>
++#include <mach/ts72xx.h>
++
++struct infos {
++	const char *cpu_rev;
++	int model, pld;
++	int option_ad;
++	int option_rs485;
++	unsigned char jumpers[6]; // 0=3Doff,1=3Don,2=3Derror
++};
++
++static const char *revisions[] =3D { "A", "B", "C", "D0", "D1", "E0", "=
E1", "E2", "??" };
++
++
++static void get_sbcinfo(struct infos *data)
++{
++	void __iomem *p;
++	short rev;
++
++	/* CPU revision */
++	rev =3D __raw_readl(EP93XX_SYSCON_CHIPID) >> 28;
++	if (rev > ARRAY_SIZE(revisions))
++		rev =3D ARRAY_SIZE(revisions) - 1;
++	data->cpu_rev =3D revisions[rev];
++
++	/* Board model */
++	if (board_is_ts7200())
++		data->model =3D 7200;
++	else if (board_is_ts7250())
++		data->model =3D 7250;
++	else if (board_is_ts7260())
++		data->model =3D 7260;
++	else if (board_is_ts7400())
++		data->model =3D 7400;
++	else
++		data->model =3D 0;
++
++	data->pld =3D get_ts72xx_pld_version();
++
++	/* A/D converter (8 x 12-bit channels) */
++	if ((data->model =3D=3D 7200) || (data->model =3D=3D 7250)) {
++		data->option_ad =3D is_max197_installed();
++	} else {
++		data->option_ad =3D 0;
++	}
++
++	/* COM2 RS-485 */
++	if (is_rs485_installed()) {
++		data->option_rs485 =3D 1;
++	} else {
++		data->option_rs485 =3D 0;
++	}
++
++	/* jumpers */
++	p =3D ioremap(TS72XX_JUMPERS_MAX197_PHYS_BASE, TS72XX_JUMPERS_MAX197_S=
IZE);
++	if (p) {
++		unsigned char c =3D __raw_readb(p);
++
++		data->jumpers[0] =3D 2;                // JP1 (bootstrap)
++		data->jumpers[1] =3D !!(c & 0x01);     // JP2 (enable serial console)
++		data->jumpers[2] =3D !!(c & 0x02);     // JP3 (flash write enable)
++		data->jumpers[3] =3D !(c & 0x08);      // JP4 (console on COM2)
++		data->jumpers[4] =3D !(c & 0x10);      // JP5 (test)
++		data->jumpers[5] =3D !!(is_jp6_set()); // JP6 (user jumper)
++
++		iounmap(p);
++	} else {
++		data->jumpers[0] =3D data->jumpers[1] =3D data->jumpers[2] =3D 2;
++		data->jumpers[3] =3D data->jumpers[4] =3D data->jumpers[5] =3D 2;
++	}
++
++}
++
++
++static int ts72xx_sbcinfo_read_proc(char *buffer, char **start, off_t o=
ffset,
++		int count, int *eof, void *data)
++{
++	int len, size =3D count;
++	char *p =3D buffer;
++	struct infos nfo;
++	const char jpc[3] =3D { 'n', 'y', '?' };
++
++	get_sbcinfo(&nfo);
++	len =3D scnprintf(p, size,
++			"Model             : TS-%d (CPU rev %s) (PLD rev %c)\n"
++			"Option max197 A/D : %s\n"
++			"Option RS-485     : %s\n"
++			"Jumpers           : JP2=3D%c JP3=3D%c JP4=3D%c JP5=3D%c JP6=3D%c\n"=
,
++			nfo.model, nfo.cpu_rev, nfo.pld + 0x40,
++			(nfo.option_ad ? "yes" : "no"),
++			(nfo.option_rs485 ? "yes" : "no"),
++			jpc[nfo.jumpers[1]], jpc[nfo.jumpers[2]], jpc[nfo.jumpers[3]], jpc[n=
fo.jumpers[4]],
++			jpc[nfo.jumpers[5]]);
++
++	if (len <=3D offset + count)
++		*eof =3D 1;
++
++	*start =3D buffer + offset;
++	len -=3D offset;
++
++	if (len > count)
++		len =3D count;
++	if (len < 0)
++		len =3D 0;
++
++	return len;
++}
++
++
++static int __init ts72xx_sbcinfo_init(void)
++{
++	struct proc_dir_entry *entry;
++	int ret =3D 0;
++
++	entry =3D create_proc_read_entry("driver/sbcinfo", 0,
++			NULL, ts72xx_sbcinfo_read_proc, NULL);
++
++	if (!entry) {
++		printk(KERN_ERR "sbcinfo: can't create /proc/driver/sbcinfo\n");
++		ret =3D -ENOMEM;
++	}
++
++	return ret;
++}
++
++static void __exit ts72xx_sbcinfo_exit(void)
++{
++	remove_proc_entry("driver/sbcinfo", NULL);
++	return;
++}
++
++module_init(ts72xx_sbcinfo_init);
++module_exit(ts72xx_sbcinfo_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("Show information of Technologic Systems TS-72XX sbc=
");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("1.02");
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0005-ep93xx_eth.patch b/re=
cipes/linux/linux-2.6.32/ts72xx/0005-ep93xx_eth.patch
new file mode 100644
index 0000000..0a4b9c4
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0005-ep93xx_eth.patch
@@ -0,0 +1,540 @@
+From 260c46b5aebe614f8020b1b9a2a2fff4cbf85da4 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 17:45:23 +0100
+Subject: [PATCH] ep93xx_eth
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/net/arm/Kconfig      |    1 +
+ drivers/net/arm/ep93xx_eth.c |  339 ++++++++++++++++++++++++++++++++++-=
-------
+ 2 files changed, 278 insertions(+), 62 deletions(-)
+
+diff --git a/drivers/net/arm/Kconfig b/drivers/net/arm/Kconfig
+index c37ee9e..a5f2a98 100644
+--- a/drivers/net/arm/Kconfig
++++ b/drivers/net/arm/Kconfig
+@@ -52,6 +52,7 @@ config EP93XX_ETH
+ 	tristate "EP93xx Ethernet support"
+ 	depends on ARM && ARCH_EP93XX
+ 	select MII
++	select PHYLIB
+ 	help
+ 	  This is a driver for the ethernet hardware included in EP93xx CPUs.
+ 	  Say Y if you are building a kernel for EP93xx based devices.
+diff --git a/drivers/net/arm/ep93xx_eth.c b/drivers/net/arm/ep93xx_eth.c
+index b25467a..923a21b 100644
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
+@@ -25,7 +27,7 @@
+ #include <asm/io.h>
+=20
+ #define DRV_MODULE_NAME		"ep93xx-eth"
+-#define DRV_MODULE_VERSION	"0.1"
++#define DRV_MODULE_VERSION	"0.12"
+=20
+ #define RX_QUEUE_ENTRIES	64
+ #define TX_QUEUE_ENTRIES	8
+@@ -37,6 +39,8 @@
+ #define  REG_RXCTL_DEFAULT	0x00073800
+ #define REG_TXCTL		0x0004
+ #define  REG_TXCTL_ENABLE	0x00000001
++#define REG_TESTCTL		0x0008
++#define  REG_TESTCTL_MFDX	0x00000040
+ #define REG_MIICMD		0x0010
+ #define  REG_MIICMD_READ	0x00008000
+ #define  REG_MIICMD_WRITE	0x00004000
+@@ -45,6 +49,9 @@
+ #define  REG_MIISTS_BUSY	0x00000001
+ #define REG_SELFCTL		0x0020
+ #define  REG_SELFCTL_RESET	0x00000001
++#define  REG_SELFCTL_MDCDIV_MSK	0x00007e00
++#define  REG_SELFCTL_MDCDIV_OFS	9
++#define  REG_SELFCTL_PSPRS	0x00000100
+ #define REG_INTEN		0x0024
+ #define  REG_INTEN_TX		0x00000008
+ #define  REG_INTEN_RX		0x00000007
+@@ -174,8 +181,14 @@ struct ep93xx_priv
+=20
+ 	struct net_device_stats	stats;
+=20
+-	struct mii_if_info	mii;
+ 	u8			mdc_divisor;
++	int     phy_supports_mfps:1;
++
++	struct mii_bus    mii_bus;
++	struct phy_device *phy_dev;
++	int     speed;
++	int     duplex;
++	int     link;
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
+@@ -522,6 +533,22 @@ err:
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
+@@ -540,11 +567,8 @@ static int ep93xx_start_hw(struct net_device *dev)
+ 		return 1;
+ 	}
+=20
+-	wrl(ep, REG_SELFCTL, ((ep->mdc_divisor - 1) << 9));
+-
+-	/* Does the PHY support preamble suppress?  */
+-	if ((ep93xx_mdio_read(dev, ep->mii.phy_id, MII_BMSR) & 0x0040) !=3D 0)
+-		wrl(ep, REG_SELFCTL, ((ep->mdc_divisor - 1) << 9) | (1 << 8));
++	/* The reset cleared REG_SELFCTL, so set the MDC divisor again */
++	ep93xx_mdio_reset(&ep->mii_bus);
+=20
+ 	/* Receive descriptor ring.  */
+ 	addr =3D ep->descs_dma_addr + offsetof(struct ep93xx_descs, rdesc);
+@@ -653,6 +677,8 @@ static int ep93xx_open(struct net_device *dev)
+=20
+ 	wrl(ep, REG_GIINTMSK, REG_GIINTMSK_ENABLE);
+=20
++	phy_start(ep->phy_dev);
++
+ 	netif_start_queue(dev);
+=20
+ 	return 0;
+@@ -665,6 +691,9 @@ static int ep93xx_close(struct net_device *dev)
+ 	napi_disable(&ep->napi);
+ 	netif_stop_queue(dev);
+=20
++	if (ep->phy_dev)
++		phy_stop(ep->phy_dev);
++
+ 	wrl(ep, REG_GIINTMSK, 0);
+ 	free_irq(ep->irq, dev);
+ 	ep93xx_stop_hw(dev);
+@@ -676,51 +705,83 @@ static int ep93xx_close(struct net_device *dev)
+ static int ep93xx_ioctl(struct net_device *dev, struct ifreq *ifr, int =
cmd)
+ {
+ 	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	struct mii_ioctl_data *data =3D if_mii(ifr);
+=20
+-	return generic_mii_ioctl(&ep->mii, data, cmd, NULL);
++	return phy_mii_ioctl(ep->phy_dev, if_mii(ifr), cmd);
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
++	struct ep93xx_priv *ep =3D bus->priv;
++	unsigned int timeout =3D EP93XX_PHY_TIMEOUT;
+=20
+-	wrl(ep, REG_MIICMD, REG_MIICMD_READ | (phy_id << 5) | reg);
++	while ((rdl(ep, REG_MIISTS) & REG_MIISTS_BUSY)
++			&& timeout--)
++		cpu_relax();
+=20
+-	for (i =3D 0; i < 10; i++) {
+-		if ((rdl(ep, REG_MIISTS) & REG_MIISTS_BUSY) =3D=3D 0)
+-			break;
+-		msleep(1);
++	if (timeout <=3D 0) {
++		dev_err(&bus->dev, "MII operation timed out\n");
++		return -ETIMEDOUT;
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
++	struct ep93xx_priv *ep =3D bus->priv;
++	u32 selfctl;
++	u32 data;
++
++	if (ep93xx_mdio_wait(bus) < 0)
++		return -ETIMEDOUT;
++
++	selfctl =3D rdl(ep, REG_SELFCTL);
++
++	if (ep->phy_supports_mfps)
++		wrl(ep, REG_SELFCTL, selfctl | REG_SELFCTL_PSPRS);
++	else
++		wrl(ep, REG_SELFCTL, selfctl & ~REG_SELFCTL_PSPRS);
++
++	wrl(ep, REG_MIICMD, REG_MIICMD_READ | (mii_id << 5) | regnum);
++
++	if (ep93xx_mdio_wait(bus) < 0)
++		return -ETIMEDOUT;
++
++	data =3D  rdl(ep, REG_MIIDATA);
++
++	wrl(ep, REG_SELFCTL, selfctl);
+=20
+ 	return data;
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
++	struct ep93xx_priv *ep =3D bus->priv;
++	u32 selfctl;
+=20
+-	wrl(ep, REG_MIIDATA, data);
+-	wrl(ep, REG_MIICMD, REG_MIICMD_WRITE | (phy_id << 5) | reg);
++	if (ep93xx_mdio_wait(bus) < 0)
++		return -ETIMEDOUT;
+=20
+-	for (i =3D 0; i < 10; i++) {
+-		if ((rdl(ep, REG_MIISTS) & REG_MIISTS_BUSY) =3D=3D 0)
+-			break;
+-		msleep(1);
+-	}
++	selfctl =3D rdl(ep, REG_SELFCTL);
+=20
+-	if (i =3D=3D 10)
+-		printk(KERN_INFO DRV_MODULE_NAME ": mdio write timed out\n");
++	if (ep->phy_supports_mfps)
++		wrl(ep, REG_SELFCTL, selfctl | REG_SELFCTL_PSPRS);
++	else
++		wrl(ep, REG_SELFCTL, selfctl & ~REG_SELFCTL_PSPRS);
++
++	wrl(ep, REG_MIIDATA, value);
++	wrl(ep, REG_MIICMD, REG_MIICMD_WRITE | (mii_id << 5) | regnum);
++
++	if (ep93xx_mdio_wait(bus) < 0)
++		return -ETIMEDOUT;
++
++	wrl(ep, REG_SELFCTL, selfctl);
++
++	return 0;
+ }
+=20
+ static void ep93xx_get_drvinfo(struct net_device *dev, struct ethtool_d=
rvinfo *info)
+@@ -732,33 +793,30 @@ static void ep93xx_get_drvinfo(struct net_device *=
dev, struct ethtool_drvinfo *i
+ static int ep93xx_get_settings(struct net_device *dev, struct ethtool_c=
md *cmd)
+ {
+ 	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	return mii_ethtool_gset(&ep->mii, cmd);
++	struct phy_device *phydev =3D ep->phy_dev;
++
++	if (!phydev)
++		return -ENODEV;
++
++	return phy_ethtool_gset(phydev, cmd);
+ }
+=20
+ static int ep93xx_set_settings(struct net_device *dev, struct ethtool_c=
md *cmd)
+ {
+ 	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	return mii_ethtool_sset(&ep->mii, cmd);
+-}
++	struct phy_device *phydev =3D ep->phy_dev;
+=20
+-static int ep93xx_nway_reset(struct net_device *dev)
+-{
+-	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	return mii_nway_restart(&ep->mii);
+-}
++	if (!phydev)
++		return -ENODEV;
+=20
+-static u32 ep93xx_get_link(struct net_device *dev)
+-{
+-	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	return mii_link_ok(&ep->mii);
++	return phy_ethtool_sset(phydev, cmd);
+ }
+=20
+ static const struct ethtool_ops ep93xx_ethtool_ops =3D {
+ 	.get_drvinfo		=3D ep93xx_get_drvinfo,
+ 	.get_settings		=3D ep93xx_get_settings,
+ 	.set_settings		=3D ep93xx_set_settings,
+-	.nway_reset		=3D ep93xx_nway_reset,
+-	.get_link		=3D ep93xx_get_link,
++	.get_link		=3D ethtool_op_get_link,
+ };
+=20
+ static const struct net_device_ops ep93xx_netdev_ops =3D {
+@@ -820,12 +878,122 @@ static int ep93xx_eth_remove(struct platform_devi=
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
++  phydev =3D phy_connect(dev, dev_name(&phydev->dev),
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
++     phydev->drv->name, dev_name(&phydev->dev), phydev->irq);
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
++	DECLARE_MAC_BUF(mac_buf);
++	int err, i;
+=20
+ 	if (pdev =3D=3D NULL)
+ 		return -ENODEV;
+@@ -848,7 +1016,7 @@ static int ep93xx_eth_probe(struct platform_device =
*pdev)
+ 	if (ep->res =3D=3D NULL) {
+ 		dev_err(&pdev->dev, "Could not reserve memory region\n");
+ 		err =3D -ENOMEM;
+-		goto err_out;
++		goto err_out_request_mem_region;
+ 	}
+=20
+ 	ep->base_addr =3D ioremap(pdev->resource[0].start,
+@@ -856,17 +1024,36 @@ static int ep93xx_eth_probe(struct platform_devic=
e *pdev)
+ 	if (ep->base_addr =3D=3D NULL) {
+ 		dev_err(&pdev->dev, "Failed to ioremap ethernet registers\n");
+ 		err =3D -EIO;
+-		goto err_out;
++		goto err_out_ioremap;
+ 	}
+ 	ep->irq =3D pdev->resource[1].start;
+=20
+-	ep->mii.phy_id =3D data->phy_id;
+-	ep->mii.phy_id_mask =3D 0x1f;
+-	ep->mii.reg_num_mask =3D 0x1f;
+-	ep->mii.dev =3D dev;
+-	ep->mii.mdio_read =3D ep93xx_mdio_read;
+-	ep->mii.mdio_write =3D ep93xx_mdio_write;
++	/* mdio/mii bus */
++	ep->mii_bus.state =3D MDIOBUS_ALLOCATED; /* see mdiobus_alloc */
++	ep->mii_bus.name =3D "ep93xx_mii_bus";
++	snprintf(ep->mii_bus.id, MII_BUS_ID_SIZE, "0");
++
++	ep->mii_bus.read =3D ep93xx_mdio_read;
++	ep->mii_bus.write =3D ep93xx_mdio_write;
++	ep->mii_bus.reset =3D ep93xx_mdio_reset;
++
++	ep->mii_bus.phy_mask =3D 0;
++
++	ep->mii_bus.priv =3D ep;
++	ep->mii_bus.dev =3D dev->dev;
++
++	ep->mii_bus.irq =3D kmalloc(sizeof(int)*PHY_MAX_ADDR, GFP_KERNEL);
++	if (NULL =3D=3D ep->mii_bus.irq) {
++		dev_err(&pdev->dev, "Could not allocate memory\n");
++		err =3D -ENOMEM;
++		goto err_out_mii_bus_irq_kmalloc;
++	}
++
++	for (i =3D 0; i < PHY_MAX_ADDR; i++)
++		ep->mii_bus.irq[i] =3D PHY_POLL;
++
+ 	ep->mdc_divisor =3D 40;	/* Max HCLK 100 MHz, min MDIO clk 2.5 MHz.  */
++	ep->phy_supports_mfps =3D 0; /* probe without preamble suppression */
+=20
+ 	if (is_zero_ether_addr(dev->dev_addr))
+ 		random_ether_addr(dev->dev_addr);
+@@ -874,7 +1061,7 @@ static int ep93xx_eth_probe(struct platform_device =
*pdev)
+ 	err =3D register_netdev(dev);
+ 	if (err) {
+ 		dev_err(&pdev->dev, "Failed to register netdev\n");
+-		goto err_out;
++		goto err_out_register_netdev;
+ 	}
+=20
+ 	printk(KERN_INFO "%s: ep93xx on-chip ethernet, IRQ %d, "
+@@ -883,8 +1070,36 @@ static int ep93xx_eth_probe(struct platform_device=
 *pdev)
+ 			data->dev_addr[2], data->dev_addr[3],
+ 			data->dev_addr[4], data->dev_addr[5]);
+=20
++	err =3D mdiobus_register(&ep->mii_bus);
++	if (err) {
++		dev_err(&dev->dev, "Could not register MII bus\n");
++		goto err_out_mdiobus_register;
++	}
++
++	err =3D ep93xx_mii_probe(dev, data->phy_id);
++	if (err) {
++		dev_err(&dev->dev, "failed to probe MII bus\n");
++		goto err_out_mii_probe;
++	}
++
++	dev_info(&dev->dev, "ep93xx on-chip ethernet, IRQ %d, %s\n",
++			ep->irq, print_mac(mac_buf, dev->dev_addr));
++
+ 	return 0;
+=20
++err_out_mii_probe:
++	mdiobus_unregister(&ep->mii_bus);
++err_out_mdiobus_register:
++	unregister_netdev(dev);
++err_out_register_netdev:
++	kfree(ep->mii_bus.irq);
++err_out_mii_bus_irq_kmalloc:
++	iounmap(ep->base_addr);
++err_out_ioremap:
++	release_resource(ep->res);
++	kfree(ep->res);
++err_out_request_mem_region:
++	free_netdev(dev);
+ err_out:
+ 	ep93xx_eth_remove(pdev);
+ 	return err;
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0006-ts72xx_ts_ser1.patch =
b/recipes/linux/linux-2.6.32/ts72xx/0006-ts72xx_ts_ser1.patch
new file mode 100644
index 0000000..7443d6c
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0006-ts72xx_ts_ser1.patch
@@ -0,0 +1,216 @@
+From eb753556815cde046e35d206880a507eb052ac4e Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 17:52:13 +0100
+Subject: [PATCH] ts72xx_ts_ser1
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/serial/8250_ts_ser1.c |  150 ++++++++++++++++++++++++++++++++++=
+++++++
+ drivers/serial/Kconfig        |   17 +++++
+ drivers/serial/Makefile       |    1 +
+ 3 files changed, 168 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/serial/8250_ts_ser1.c
+
+diff --git a/drivers/serial/8250_ts_ser1.c b/drivers/serial/8250_ts_ser1=
.c
+new file mode 100644
+index 0000000..a3c95d4
+--- /dev/null
++++ b/drivers/serial/8250_ts_ser1.c
+@@ -0,0 +1,150 @@
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
++#include <linux/io.h>
++#include <mach/hardware.h>
++#include <mach/ts72xx.h>
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
+index e522572..0eeca06 100644
+--- a/drivers/serial/Kconfig
++++ b/drivers/serial/Kconfig
+@@ -275,6 +275,23 @@ config SERIAL_8250_RM9K
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
+index d21d5dd..f8fdb4f 100644
+--- a/drivers/serial/Makefile
++++ b/drivers/serial/Makefile
+@@ -28,6 +28,7 @@ obj-$(CONFIG_SERIAL_8250_BOCA) +=3D 8250_boca.o
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
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0007-ts72xx_rs485.patch b/=
recipes/linux/linux-2.6.32/ts72xx/0007-ts72xx_rs485.patch
new file mode 100644
index 0000000..437a99a
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0007-ts72xx_rs485.patch
@@ -0,0 +1,236 @@
+From 406bb1336e9e5401adc61a0227f9bfc5f5a1ef5a Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 17:54:33 +0100
+Subject: [PATCH] ts72xx_rs485
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Crude hack...
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/include/asm/ioctls.h |    3 +
+ drivers/serial/Kconfig        |    8 +++
+ drivers/serial/amba-pl010.c   |  137 ++++++++++++++++++++++++++++++++++=
+++++--
+ 3 files changed, 142 insertions(+), 6 deletions(-)
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
+diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
+index 0eeca06..ff24f69 100644
+--- a/drivers/serial/Kconfig
++++ b/drivers/serial/Kconfig
+@@ -321,6 +321,14 @@ config SERIAL_AMBA_PL010_CONSOLE
+ 	  your boot loader (lilo or loadlin) about how to pass options to the
+ 	  kernel at boot time.)
+=20
++config SERIAL_AMBA_PL010_TS72XX
++	bool "Support for RS-485 on AMBA serial port (for TS-72XX SBC)"
++	depends on SERIAL_AMBA_PL010 !=3D n && MACH_TS72XX
++	help
++	  This add support for RS-485 on some Technologic System SBC.
++
++	  If unsure, say N.
++
+ config SERIAL_AMBA_PL011
+ 	tristate "ARM AMBA PL011 serial port support"
+ 	depends on ARM_AMBA
+diff --git a/drivers/serial/amba-pl010.c b/drivers/serial/amba-pl010.c
+index 429a8ae..aff4d9c 100644
+--- a/drivers/serial/amba-pl010.c
++++ b/drivers/serial/amba-pl010.c
+@@ -50,6 +50,10 @@
+=20
+ #include <asm/io.h>
+=20
++#if defined(CONFIG_SERIAL_AMBA_PL010_TS72XX)
++#include <mach/ts72xx.h>
++#endif
++
+ #define UART_NR		8
+=20
+ #define SERIAL_AMBA_MAJOR	204
+@@ -64,6 +68,12 @@
+ #define UART_DUMMY_RSR_RX	256
+ #define UART_PORT_SIZE		64
+=20
++#if defined(CONFIG_SERIAL_AMBA_PL010_TS72XX)
++static void __iomem *ts_rs485_data9_register;
++static void __iomem *ts_rs485_control_register;
++#endif
++
++
+ /*
+  * We wrap our port structure around the generic uart_port.
+  */
+@@ -385,7 +395,7 @@ pl010_set_termios(struct uart_port *port, struct kte=
rmios *termios,
+ 	/*
+ 	 * Ask the core to calculate the divisor for us.
+ 	 */
+-	baud =3D uart_get_baud_rate(port, termios, old, 0, uap->port.uartclk/1=
6);=20
++	baud =3D uart_get_baud_rate(port, termios, old, 0, uap->port.uartclk/1=
6);
+ 	quot =3D uart_get_divisor(port, baud);
+=20
+ 	switch (termios->c_cflag & CSIZE) {
+@@ -519,6 +529,107 @@ static int pl010_verify_port(struct uart_port *por=
t, struct serial_struct *ser)
+ 	return ret;
+ }
+=20
++
++#if defined(CONFIG_SERIAL_AMBA_PL010_TS72XX)
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
++	cflag =3D port->state->port.tty->termios->c_cflag;
++	if (cflag & PARENB)
++		datalength++;
++
++	if (cflag & CSTOPB)
++		datalength++;
++
++	baud =3D tty_get_baud_rate(port->state->port.tty);
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
++						printk("amba-pl010.c: %d baud rate is not supported for auto RS48=
5 mode\n", baud);
++						return -1;
++				}
++				if (datalength > 8)
++					__raw_writew(TS72XX_RS485_MODE_FD, ts_rs485_data9_register);
++			}
++			break;
++	}
++
++	return 0;
++}
++
++static int pl010_ioctl(struct uart_port *port, unsigned int cmd, unsign=
ed long arg)
++{
++	switch (cmd) {
++		case TIOC_SBCC485:
++		case TIOC_SBCS485:
++			return ts72xx_auto485(port, cmd, (unsigned long *)arg);
++		default:
++			return -ENOIOCTLCMD;
++	}
++
++	return -ENOIOCTLCMD;
++}
++#endif /* CONFIG_SERIAL_AMBA_PL010_TS72XX */
++
++
+ static struct uart_ops amba_pl010_pops =3D {
+ 	.tx_empty	=3D pl010_tx_empty,
+ 	.set_mctrl	=3D pl010_set_mctrl,
+@@ -536,6 +647,9 @@ static struct uart_ops amba_pl010_pops =3D {
+ 	.request_port	=3D pl010_request_port,
+ 	.config_port	=3D pl010_config_port,
+ 	.verify_port	=3D pl010_verify_port,
++#if defined(CONFIG_SERIAL_AMBA_PL010_TS72XX)
++	.ioctl	=3D pl010_ioctl,
++#endif
+ };
+=20
+ static struct uart_amba_port *amba_ports[UART_NR];
+@@ -792,11 +906,22 @@ static int __init pl010_init(void)
+ 	printk(KERN_INFO "Serial: AMBA driver\n");
+=20
+ 	ret =3D uart_register_driver(&amba_reg);
+-	if (ret =3D=3D 0) {
+-		ret =3D amba_driver_register(&pl010_driver);
+-		if (ret)
+-			uart_unregister_driver(&amba_reg);
+-	}
++  if (ret =3D=3D 0) {
++    ret =3D amba_driver_register(&pl010_driver);
++
++    #if defined(CONFIG_SERIAL_AMBA_PL010_TS72XX)
++    if (!ret && is_rs485_installed()) {
++      ret =3D ts72xx_rs485_init();
++      if (ret)
++        printk("amba-pl010.c: ts72xx_rs485_init() failed\n");
++      else
++        printk("amba-pl010.c: auto RS485 mode initialized\n");
++    }
++    #endif
++
++    if (ret)
++      uart_unregister_driver(&amba_reg);
++  }
+ 	return ret;
+ }
+=20
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0008-ts72xx_ts_eth100.patc=
h b/recipes/linux/linux-2.6.32/ts72xx/0008-ts72xx_ts_eth100.patch
new file mode 100644
index 0000000..a1db255
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0008-ts72xx_ts_eth100.patch
@@ -0,0 +1,261 @@
+From 8791c5e3d690b09e95eeda98449b1759d2e83c4c Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 17:59:19 +0100
+Subject: [PATCH] ts72xx_ts_eth100
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/net/Kconfig             |   10 ++
+ drivers/net/Makefile            |    1 +
+ drivers/net/ax88796.c           |    4 +
+ drivers/net/ax88796_ts_eth100.c |  185 ++++++++++++++++++++++++++++++++=
+++++++
+ 4 files changed, 200 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/net/ax88796_ts_eth100.c
+
+diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
+index b2f71f7..485d22a 100644
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
++	  IRQ numbers and I/O address will be configurated automatically.
++
++	  To compile this driver as a module, choose M here: the module
++	  will be called ax88796_ts_eth100.
++
+ config MACE
+ 	tristate "MACE (Power Mac ethernet) support"
+ 	depends on PPC_PMAC && PPC32
+diff --git a/drivers/net/Makefile b/drivers/net/Makefile
+index 246323d..ef10c5e 100644
+--- a/drivers/net/Makefile
++++ b/drivers/net/Makefile
+@@ -140,6 +140,7 @@ obj-$(CONFIG_B44) +=3D b44.o
+ obj-$(CONFIG_FORCEDETH) +=3D forcedeth.o
+ obj-$(CONFIG_NE_H8300) +=3D ne-h8300.o 8390.o
+ obj-$(CONFIG_AX88796) +=3D ax88796.o
++obj-$(CONFIG_AX88796_TS_ETH100) +=3D ax88796_ts_eth100.o
+ obj-$(CONFIG_BCM63XX_ENET) +=3D bcm63xx_enet.o
+=20
+ obj-$(CONFIG_TSI108_ETH) +=3D tsi108_eth.o
+diff --git a/drivers/net/ax88796.c b/drivers/net/ax88796.c
+index 62d9c9c..5cf29f5 100644
+--- a/drivers/net/ax88796.c
++++ b/drivers/net/ax88796.c
+@@ -934,7 +934,11 @@ static int ax_probe(struct platform_device *pdev)
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
+index 0000000..e8eb5e7
+--- /dev/null
++++ b/drivers/net/ax88796_ts_eth100.c
+@@ -0,0 +1,185 @@
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
++#include <linux/io.h>
++#include <net/ax88796.h>
++#include <mach/ts72xx.h>
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
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0009-ts7200_cf_ide.patch b=
/recipes/linux/linux-2.6.32/ts72xx/0009-ts7200_cf_ide.patch
new file mode 100644
index 0000000..5a1d39b
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0009-ts7200_cf_ide.patch
@@ -0,0 +1,120 @@
+From 77d609ddb4485126aff3239050a0ce908c00ee71 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 18:02:58 +0100
+Subject: [PATCH] ts7200_cf_ide
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/ide/Kconfig         |    7 +++++
+ drivers/ide/Makefile        |    1 +
+ drivers/ide/ide_ts7200_cf.c |   64 ++++++++++++++++++++++++++++++++++++=
+++++++
+ 3 files changed, 72 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/ide/ide_ts7200_cf.c
+
+diff --git a/drivers/ide/Kconfig b/drivers/ide/Kconfig
+index 9a5d0aa..2c5182b 100644
+--- a/drivers/ide/Kconfig
++++ b/drivers/ide/Kconfig
+@@ -732,6 +732,13 @@ config BLK_DEV_IDE_AT91
+ 	depends on ARM && ARCH_AT91 && !ARCH_AT91RM9200 && !ARCH_AT91X40
+ 	select IDE_TIMINGS
+=20
++config BLK_DEV_TS7200_CF
++	tristate "TS-7200 IDE (CompactFlash) interface support"
++	depends on ARM && ARCH_EP93XX
++	help
++	  Say Y here if you want to support the TS-7200 Compact Flash IDE cont=
roller
++	  (manufactured by Technologic Systems).
++
+ config BLK_DEV_IDE_ICSIDE
+ 	tristate "ICS IDE interface support"
+ 	depends on ARM && ARCH_ACORN
+diff --git a/drivers/ide/Makefile b/drivers/ide/Makefile
+index 81df925..4bef198 100644
+--- a/drivers/ide/Makefile
++++ b/drivers/ide/Makefile
+@@ -111,6 +111,7 @@ obj-$(CONFIG_BLK_DEV_PLATFORM)		+=3D ide_platform.o
+ obj-$(CONFIG_BLK_DEV_IDE_ICSIDE)	+=3D icside.o
+ obj-$(CONFIG_BLK_DEV_IDE_RAPIDE)	+=3D rapide.o
+ obj-$(CONFIG_BLK_DEV_PALMCHIP_BK3710)	+=3D palm_bk3710.o
++obj-$(CONFIG_BLK_DEV_TS7200_CF)		+=3D ide_ts7200_cf.o
+=20
+ obj-$(CONFIG_BLK_DEV_IDE_AU1XXX)	+=3D au1xxx-ide.o
+=20
+diff --git a/drivers/ide/ide_ts7200_cf.c b/drivers/ide/ide_ts7200_cf.c
+new file mode 100644
+index 0000000..14c9765
+--- /dev/null
++++ b/drivers/ide/ide_ts7200_cf.c
+@@ -0,0 +1,64 @@
++/*
++ *  Technologic Systems TS-7200 Compact Flash IDE device driver.
++ *
++ * (c) Copyright 2009  Matthieu Crapet <mcrapet@gmail.com>
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
++#include <linux/ide.h>
++#include <asm/io.h>
++#include <asm/irq.h>
++#include <mach/ts72xx.h>
++
++
++static const struct ide_port_info ts7200_cf_ide_port_info =3D {
++	.host_flags		=3D IDE_HFLAG_NO_DMA, // IDE_HFLAG_MMIO
++	.chipset		=3D ide_generic,
++};
++
++static __init int ide_ts7200_cf_init(void)
++{
++  struct ide_hw hw, *hws[] =3D { &hw };
++  void __iomem *base, *ctl, *data;
++  struct ide_host *host;
++
++  base =3D ioremap(TS7200_CF_CMD_PHYS_BASE, 0x10);  // 8-bit access
++  ctl  =3D ioremap(TS7200_CF_AUX_PHYS_BASE, 0x10);  // 8-bit access (us=
ually base+0x206)
++  data =3D ioremap(TS7200_CF_DATA_PHYS_BASE, 0x10); // 16-bit access
++
++  if ((base !=3D NULL) && (ctl !=3D NULL) && (data !=3D NULL)) {
++    memset(&hw, 0, sizeof(hw));
++
++    ide_std_init_ports(&hw, (unsigned long)base, (unsigned long)ctl);
++    hw.io_ports.data_addr =3D (unsigned long)data;
++    hw.irq =3D IRQ_EP93XX_EXT0;
++
++    return ide_host_add(&ts7200_cf_ide_port_info, hws, 1, &host);
++  }
++
++  if (base) iounmap(base);
++  if (ctl)  iounmap(ctl);
++  if (data) iounmap(data);
++
++  return -ENODEV;
++}
++
++
++module_init(ide_ts7200_cf_init);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("TS-7200 Compact Flash IDE driver");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("0.2");
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0010-ts72xx_pata.patch b/r=
ecipes/linux/linux-2.6.32/ts72xx/0010-ts72xx_pata.patch
new file mode 100644
index 0000000..a57a3d0
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0010-ts72xx_pata.patch
@@ -0,0 +1,414 @@
+From caec39562afb6755f47dace8cdc46a0451034c3d Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 18:05:25 +0100
+Subject: [PATCH] ts72xx_pata
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/ata/Kconfig          |   20 ++++++
+ drivers/ata/Makefile         |    3 +
+ drivers/ata/pata_ts7200_cf.c |   85 +++++++++++++++++++++++
+ drivers/ata/pata_ts72xx.c    |  155 +++++++++++++++++++++++++++++++++++=
+++++++
+ drivers/ata/pata_ts9600.c    |   88 ++++++++++++++++++++++++
+ 5 files changed, 351 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/ata/pata_ts7200_cf.c
+ create mode 100644 drivers/ata/pata_ts72xx.c
+ create mode 100644 drivers/ata/pata_ts9600.c
+
+diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
+index f2df6e2..0a310b4 100644
+--- a/drivers/ata/Kconfig
++++ b/drivers/ata/Kconfig
+@@ -781,5 +781,25 @@ config PATA_BF54X
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
+index 01e126f..f784f0e 100644
+--- a/drivers/ata/Makefile
++++ b/drivers/ata/Makefile
+@@ -77,6 +77,9 @@ obj-$(CONFIG_PATA_PLATFORM)	+=3D pata_platform.o
+ obj-$(CONFIG_PATA_AT91)	+=3D pata_at91.o
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
+index 0000000..cc884b5
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
++#include <mach/ts72xx.h>
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
+index 0000000..e96cee3
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
++#define DRV_VERSION "2.01"
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
++  ata_for_each_dev(dev, link, ENABLED) {
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
+index 0000000..0eb485a
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
++#include <mach/ts72xx.h>
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
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0011-ep93xx_pm.patch b/rec=
ipes/linux/linux-2.6.32/ts72xx/0011-ep93xx_pm.patch
new file mode 100644
index 0000000..093d0e1
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0011-ep93xx_pm.patch
@@ -0,0 +1,114 @@
+From d4b791d23b63acc50213dc679eb2bd2d10aa697d Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 18:28:27 +0100
+Subject: [PATCH] ep93xx_pm
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/Makefile |    3 ++
+ arch/arm/mach-ep93xx/pm.c     |   78 ++++++++++++++++++++++++++++++++++=
+++++++
+ 2 files changed, 81 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/pm.c
+
+diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefi=
le
+index c2451e6..8624d62 100644
+--- a/arch/arm/mach-ep93xx/Makefile
++++ b/arch/arm/mach-ep93xx/Makefile
+@@ -12,3 +12,6 @@ obj-$(CONFIG_MACH_GESBC9312)	+=3D gesbc9312.o
+ obj-$(CONFIG_MACH_MICRO9)	+=3D micro9.o
+ obj-$(CONFIG_MACH_TS72XX)	+=3D ts72xx.o
+ obj-$(CONFIG_MACH_TS72XX_SBCINFO)	+=3D ts72xx_sbcinfo.o
++
++# Power Management
++obj-$(CONFIG_PM) +=3D pm.o
+diff --git a/arch/arm/mach-ep93xx/pm.c b/arch/arm/mach-ep93xx/pm.c
+new file mode 100644
+index 0000000..d3714c8
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/pm.c
+@@ -0,0 +1,78 @@
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
++#include <linux/io.h>
++#include <mach/hardware.h>
++
++
++static inline void ep93xx_standby(void)
++{
++  u32 v;
++  v =3D __raw_readl(EP93XX_SYSCON_DEVCFG);
++  v |=3D EP93XX_SYSCON_DEVCFG_SHENA;
++  __raw_writel(0xaa, EP93XX_SYSCON_SWLOCK);
++  __raw_writel(v, EP93XX_SYSCON_DEVCFG);
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
++  v =3D __raw_readl(EP93XX_SYSCON_DEVCFG);
++  v &=3D ~EP93XX_SYSCON_DEVCFG_SHENA;
++  __raw_writel(0xaa, EP93XX_SYSCON_SWLOCK);
++  __raw_writel(v, EP93XX_SYSCON_DEVCFG);
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
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0012-ts72xx_gpio_i2c.patch=
 b/recipes/linux/linux-2.6.32/ts72xx/0012-ts72xx_gpio_i2c.patch
new file mode 100644
index 0000000..c0b9d92
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0012-ts72xx_gpio_i2c.patch
@@ -0,0 +1,63 @@
+From 6983bb07df054687038f1dac74644ae1408d4f28 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 18:44:11 +0100
+Subject: [PATCH] ts72xx_gpio_i2c
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/ts72xx.c |   22 ++++++++++++++++++++++
+ 1 files changed, 22 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index 2c0af20..6b0ddd9 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -16,6 +16,9 @@
+ #include <linux/io.h>
+ #include <linux/m48t86.h>
+ #include <linux/mtd/physmap.h>
++#include <linux/gpio.h>
++#include <linux/i2c.h>
++#include <linux/i2c-gpio.h>
+=20
+ #include <mach/hardware.h>
+ #include <mach/ts72xx.h>
+@@ -210,12 +213,31 @@ static struct ep93xx_eth_data ts72xx_eth_data =3D =
{
+ 	.phy_id		=3D 1,
+ };
+=20
++/**********************************************************************=
***
++ * i2c peripheral handling
++ **********************************************************************=
***/
++static struct i2c_gpio_platform_data ts72xx_i2c_gpio_data =3D {
++	.sda_pin		=3D EP93XX_GPIO_LINE_EGPIO14, // DIO_6 (TS72XX DIO 2x8 heade=
r)
++	.sda_is_open_drain      =3D 0,
++	.scl_pin		=3D EP93XX_GPIO_LINE_EGPIO15, // DIO_7 (TS72XX DIO 2x8 heade=
r)
++	.scl_is_open_drain      =3D 0,
++	.udelay                 =3D 0,    /* default to 100 kHz */
++	.timeout                =3D 0,    /* default to 100 ms */
++};
++
++static struct i2c_board_info __initdata ts72xx_i2c_board_info[] =3D {
++};
++
++
+ static void __init ts72xx_init_machine(void)
+ {
+ 	ep93xx_init_devices();
+ 	ts72xx_register_flash();
+ 	platform_device_register(&ts72xx_rtc_device);
+=20
++	ep93xx_register_i2c(&ts72xx_i2c_gpio_data,
++			ts72xx_i2c_board_info,
++			ARRAY_SIZE(ts72xx_i2c_board_info));
+ 	ep93xx_register_eth(&ts72xx_eth_data, 1);
+=20
+ 	/* PWM1 is DIO_6 on TS-72xx header */
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0013-ts72xx_dio_keypad.pat=
ch b/recipes/linux/linux-2.6.32/ts72xx/0013-ts72xx_dio_keypad.patch
new file mode 100644
index 0000000..6cc091a
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0013-ts72xx_dio_keypad.patch
@@ -0,0 +1,567 @@
+From f00550cd73030bc2033e4482f31722d83a09b2a8 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 18:49:25 +0100
+Subject: [PATCH] ts72xx_dio_keypad
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/include/mach/ts72xx-keypad.h |   30 ++
+ drivers/input/keyboard/Kconfig                    |   42 +++
+ drivers/input/keyboard/Makefile                   |    4 +
+ drivers/input/keyboard/ts72xx_dio_3x4.c           |   65 +++++
+ drivers/input/keyboard/ts72xx_dio_4x4.c           |   65 +++++
+ drivers/input/keyboard/ts72xx_keypad.c            |  292 ++++++++++++++=
+++++++
+ 6 files changed, 498 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/include/mach/ts72xx-keypad.h
+ create mode 100644 drivers/input/keyboard/ts72xx_dio_3x4.c
+ create mode 100644 drivers/input/keyboard/ts72xx_dio_4x4.c
+ create mode 100644 drivers/input/keyboard/ts72xx_keypad.c
+
+diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx-keypad.h b/arch/ar=
m/mach-ep93xx/include/mach/ts72xx-keypad.h
+new file mode 100644
+index 0000000..bf44759
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx-keypad.h
+@@ -0,0 +1,30 @@
++/*
++ *  TS-72xx "GPIO Port X" input keypad driver
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
++#ifndef __ASM_ARCH_TS72XX_KEYPAD_H
++#define __ASM_ARCH_TS72XX_KEYPAD_H
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
++#endif	/* __ASM_ARCH_TS72XX_KEYPAD_H */
+diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kco=
nfig
+index ee98b1b..3c5c421 100644
+--- a/drivers/input/keyboard/Kconfig
++++ b/drivers/input/keyboard/Kconfig
+@@ -164,6 +164,48 @@ config KEYBOARD_EP93XX
+=20
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called ep93xx_keypad.
++=20
++config KEYBOARD_TS72XX
++	tristate "TS72XX matrix keypad support"
++	depends on MACH_TS72XX
++	help
++	  This driver implements supports for a matrix keypad connected
++	  to EP93XX GPIO port B (aka DIO of TS-72XX SBCs).
++	  Maximum of 4 rows and 4 cols are supported (using up to 4 interrupts=
).
++	  This is implemented as a platform driver.
++
++	  To compile this driver as a module, choose M here: the
++	  module will be called ep93xx-keypad.
++
++if KEYBOARD_TS72XX
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
++endif # KEYBOARD_TS72XX
+=20
+ config KEYBOARD_GPIO
+ 	tristate "GPIO Buttons"
+diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Ma=
kefile
+index babad5e..1a96733 100644
+--- a/drivers/input/keyboard/Makefile
++++ b/drivers/input/keyboard/Makefile
+@@ -37,3 +37,7 @@ obj-$(CONFIG_KEYBOARD_TOSA)		+=3D tosakbd.o
+ obj-$(CONFIG_KEYBOARD_TWL4030)		+=3D twl4030_keypad.o
+ obj-$(CONFIG_KEYBOARD_XTKBD)		+=3D xtkbd.o
+ obj-$(CONFIG_KEYBOARD_W90P910)		+=3D w90p910_keypad.o
++
++obj-$(CONFIG_KEYBOARD_TS72XX)		+=3D ts72xx_keypad.o
++obj-$(CONFIG_TS72XX_DIO_3X4_KEYPAD)	+=3D ts72xx_dio_3x4.o
++obj-$(CONFIG_TS72XX_DIO_4X4_KEYPAD)	+=3D ts72xx_dio_4x4.o
+diff --git a/drivers/input/keyboard/ts72xx_dio_3x4.c b/drivers/input/key=
board/ts72xx_dio_3x4.c
+new file mode 100644
+index 0000000..b149a7a
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
++#include <mach/ts72xx-keypad.h>
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
+index 0000000..2d8089a
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
++#include <mach/ts72xx-keypad.h>
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
+diff --git a/drivers/input/keyboard/ts72xx_keypad.c b/drivers/input/keyb=
oard/ts72xx_keypad.c
+new file mode 100644
+index 0000000..6979689
+--- /dev/null
++++ b/drivers/input/keyboard/ts72xx_keypad.c
+@@ -0,0 +1,292 @@
++/*
++ *  TS-72xx "GPIO Port B" input keypad driver
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
++#include <linux/io.h>
++#include <mach/hardware.h>
++#include <mach/gpio.h>
++
++#include <mach/ts72xx-keypad.h>
++
++#define DRV_NAME_PREFIX "ts72xx_keypad: "
++#define DRV_VERSION "2.0"
++
++/* We choose port B */
++#define EP93XX_GPIO_X_DATA      EP93XX_GPIO_B_DATA
++#define EP93XX_GPIO_LINE_X      EP93XX_GPIO_LINE_B
++
++struct ep93xx_gpio_portx_keypad {
++	u8 rows;
++	u8 cols;
++	int irqs[EP93XX_PORTX_MAXROW];
++	u8 mask_input;
++	u8 mask_output;
++	u8 row_trigger, col_trigger;
++	u8 mask_input_trigger;
++	struct timer_list timer;
++	struct input_dev *input;
++	struct ep93xx_gpio_portx_keypad_platform_data *rsc;
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
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0014-ep93xx_spi.patch b/re=
cipes/linux/linux-2.6.32/ts72xx/0014-ep93xx_spi.patch
new file mode 100644
index 0000000..d10c5b4
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0014-ep93xx_spi.patch
@@ -0,0 +1,985 @@
+From 2caff4e73854c56387d00ccd8b379b77288d8faa Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 19:10:30 +0100
+Subject: [PATCH] ep93xx_spi
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/mach-ep93xx/clock.c            |    4 +
+ arch/arm/mach-ep93xx/core.c             |   30 ++
+ arch/arm/mach-ep93xx/include/mach/spi.h |   18 ++
+ arch/arm/mach-ep93xx/ts72xx.c           |   40 +++
+ drivers/spi/Kconfig                     |   13 +
+ drivers/spi/Makefile                    |    2 +
+ drivers/spi/spi_ep93xx.c                |  500 ++++++++++++++++++++++++=
+++++++
+ drivers/spi/spi_ep93xx.h                |   61 ++++
+ drivers/spi/tmp124.c                    |  158 ++++++++++
+ 9 files changed, 826 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/include/mach/spi.h
+ create mode 100644 drivers/spi/spi_ep93xx.c
+ create mode 100644 drivers/spi/spi_ep93xx.h
+ create mode 100644 drivers/spi/tmp124.c
+
+diff --git a/arch/arm/mach-ep93xx/clock.c b/arch/arm/mach-ep93xx/clock.c
+index 1d0f9d8..d952910 100644
+--- a/arch/arm/mach-ep93xx/clock.c
++++ b/arch/arm/mach-ep93xx/clock.c
+@@ -98,6 +98,9 @@ static struct clk clk_pwm =3D {
+ 	.parent		=3D &clk_xtali,
+ 	.rate		=3D EP93XX_EXT_CLK_RATE,
+ };
++static struct clk clk_ssp =3D {
++	.rate		=3D EP93XX_EXT_CLK_RATE / 2,
++};
+=20
+ static struct clk clk_video =3D {
+ 	.sw_locked	=3D 1,
+@@ -185,6 +188,7 @@ static struct clk_lookup clocks[] =3D {
+ 	INIT_CK("ep93xx-keypad",	NULL,		&clk_keypad),
+ 	INIT_CK("ep93xx-fb",		NULL,		&clk_video),
+ 	INIT_CK(NULL,			"pwm_clk",	&clk_pwm),
++	INIT_CK(NULL,			"sspclk",	&clk_ssp),
+ 	INIT_CK(NULL,			"m2p0",		&clk_m2p0),
+ 	INIT_CK(NULL,			"m2p1",		&clk_m2p1),
+ 	INIT_CK(NULL,			"m2p2",		&clk_m2p2),
+diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
+index b4357c3..e9abf81 100644
+--- a/arch/arm/mach-ep93xx/core.c
++++ b/arch/arm/mach-ep93xx/core.c
+@@ -31,6 +31,7 @@
+=20
+ #include <mach/hardware.h>
+ #include <mach/fb.h>
++#include <mach/spi.h>
+=20
+ #include <asm/mach/map.h>
+ #include <asm/mach/time.h>
+@@ -611,6 +612,34 @@ static struct platform_device ep93xx_leds =3D {
+ 	},
+ };
+=20
++/**********************************************************************=
***
++ * EP93xx ssp peripheral handling
++ **********************************************************************=
***/
++static struct resource ep93xx_ssp_resources[] =3D {
++       {
++               .start =3D EP93XX_SPI_PHYS_BASE,
++               .end   =3D EP93XX_SPI_PHYS_BASE + 0x14,
++               .flags =3D IORESOURCE_MEM,
++       }, {
++               .start =3D IRQ_EP93XX_SSP, // overrun in receive fifo
++               .end   =3D IRQ_EP93XX_SSP,
++               .flags =3D IORESOURCE_IRQ,
++       }
++};
++
++static struct ep93xx_spi_data ep93xx_ssp_data =3D {
++       .chip_select_num =3D 4,
++};
++
++static struct platform_device ep93xx_ssp_device =3D {
++       .name           =3D "ep93xx-spi",
++       .id             =3D 1,
++       .resource       =3D ep93xx_ssp_resources,
++       .num_resources  =3D ARRAY_SIZE(ep93xx_ssp_resources),
++       .dev =3D {
++               .platform_data =3D &ep93xx_ssp_data,
++       }
++};
+=20
+ /**********************************************************************=
***
+  * EP93xx pwm peripheral handling
+@@ -743,5 +772,6 @@ void __init ep93xx_init_devices(void)
+=20
+ 	platform_device_register(&ep93xx_rtc_device);
+ 	platform_device_register(&ep93xx_ohci_device);
++	platform_device_register(&ep93xx_ssp_device);
+ 	platform_device_register(&ep93xx_leds);
+ }
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
+index 6b0ddd9..6c61965 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -19,9 +19,11 @@
+ #include <linux/gpio.h>
+ #include <linux/i2c.h>
+ #include <linux/i2c-gpio.h>
++#include <linux/spi/spi.h>
+=20
+ #include <mach/hardware.h>
+ #include <mach/ts72xx.h>
++#include <mach/spi.h>
+=20
+ #include <asm/mach-types.h>
+ #include <asm/mach/map.h>
+@@ -207,6 +209,39 @@ static struct platform_device ts72xx_rtc_device =3D=
 {
+ };
+=20
+ /**********************************************************************=
***
++ * SPI
++ **********************************************************************=
***/
++
++#if defined(CONFIG_SPI_TMP124) || defined(CONFIG_SPI_TMP124_MODULE)
++void tmp124_spi_cs(u32 command) // FGPIO[2]
++{
++	if (command & SPI_CS_ASSERT) {
++		gpio_set_value(EP93XX_GPIO_LINE_MCCD2, 0);
++	} else if (command & SPI_CS_DEASSERT) {
++		gpio_set_value(EP93XX_GPIO_LINE_MCCD2, 1);
++	} else if (command & SPI_CS_INIT) {
++		gpio_request(EP93XX_GPIO_LINE_MCCD2, "TMP124 cs");
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
++		.modalias		=3D "tmp124",
++		.controller_data	=3D &tmp124_hw,
++		.bus_num		=3D 1,
++		.chip_select		=3D 0,
++		.max_speed_hz		=3D 2 * 1000 * 1000,
++	}
++};
++#endif
++
++/**********************************************************************=
***
+  * Ethernet
+  **********************************************************************=
***/
+ static struct ep93xx_eth_data ts72xx_eth_data =3D {
+@@ -240,6 +275,11 @@ static void __init ts72xx_init_machine(void)
+ 			ARRAY_SIZE(ts72xx_i2c_board_info));
+ 	ep93xx_register_eth(&ts72xx_eth_data, 1);
+=20
++	#if defined(CONFIG_SPI_TMP124) || defined(CONFIG_SPI_TMP124_MODULE)
++	spi_register_board_info(ts72xx_spi_bus,
++			ARRAY_SIZE(ts72xx_spi_bus));
++	#endif
++
+ 	/* PWM1 is DIO_6 on TS-72xx header */
+ 	ep93xx_register_pwm(0, 1);
+ }
+diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
+index 4b6f7cb..e71e2ea 100644
+--- a/drivers/spi/Kconfig
++++ b/drivers/spi/Kconfig
+@@ -244,6 +244,12 @@ config SPI_XILINX
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
+@@ -272,6 +278,13 @@ config SPI_TLE62X0
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
+index 21a1182..ccc9075 100644
+--- a/drivers/spi/Makefile
++++ b/drivers/spi/Makefile
+@@ -31,6 +31,7 @@ obj-$(CONFIG_SPI_S3C24XX_GPIO)		+=3D spi_s3c24xx_gpio.=
o
+ obj-$(CONFIG_SPI_S3C24XX)		+=3D spi_s3c24xx.o
+ obj-$(CONFIG_SPI_TXX9)			+=3D spi_txx9.o
+ obj-$(CONFIG_SPI_XILINX)		+=3D xilinx_spi.o
++obj-$(CONFIG_SPI_EP93XX)		+=3D spi_ep93xx.o
+ obj-$(CONFIG_SPI_SH_SCI)		+=3D spi_sh_sci.o
+ obj-$(CONFIG_SPI_STMP3XXX)		+=3D spi_stmp.o
+ # 	... add above this line ...
+@@ -38,6 +39,7 @@ obj-$(CONFIG_SPI_STMP3XXX)		+=3D spi_stmp.o
+ # SPI protocol drivers (device/link on bus)
+ obj-$(CONFIG_SPI_SPIDEV)	+=3D spidev.o
+ obj-$(CONFIG_SPI_TLE62X0)	+=3D tle62x0.o
++obj-$(CONFIG_SPI_TMP124)	+=3D tmp124.o
+ # 	... add above this line ...
+=20
+ # SPI slave controller drivers (upstream link)
+diff --git a/drivers/spi/spi_ep93xx.c b/drivers/spi/spi_ep93xx.c
+new file mode 100644
+index 0000000..0e86b38
+--- /dev/null
++++ b/drivers/spi/spi_ep93xx.c
+@@ -0,0 +1,500 @@
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
++#include <linux/io.h>
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
++static inline u16 read_reg(void __iomem *base, off_t offset)
++{
++	return __raw_readw(base + offset);
++}
++
++static inline void write_reg(u16 v, void __iomem *base, off_t offset)
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
++		/* speed_hz is too small, set to minimum speed */
++		scr =3D 256;
++		cpsdvr =3D 254;
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
++	if (!spi->max_speed_hz) {
++		spi->max_speed_hz =3D drv_data->freq_min;
++	} else if (spi->max_speed_hz > drv_data->freq_max ||
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
++	struct ep93xx_spi *drv_data =3D NULL;
++	struct resource *memory_resource;
++	int irq, status =3D 0, min_div =3D 2, max_div =3D 254*(255+1);
++
++	/* Check I2SonSSP bit (ssp pins and i2s pins are multiplexed)
++	   We could force with ep93xx_devcfg_clear_bits */
++	if (readl(EP93XX_SYSCON_DEVCFG) & EP93XX_SYSCON_DEVCFG_I2SONSSP)
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
++	drv_data->ioaddr =3D ioremap(memory_resource->start, memory_resource->=
end - memory_resource->start + 1);
++	drv_data->clk =3D clk_get(&pdev->dev, "sspclk");
++	drv_data->freq_max =3D clk_get_rate(drv_data->clk) / min_div;
++	drv_data->freq_min =3D clk_get_rate(drv_data->clk) / max_div + 1;
++
++	INIT_WORK(&drv_data->work, ssp_work);
++	spin_lock_init(&drv_data->lock);
++	INIT_LIST_HEAD(&drv_data->queue);
++
++	drv_data->workqueue =3D create_singlethread_workqueue(dev_name(master-=
>dev.parent));
++	if (!drv_data->workqueue) {
++		status =3D -EBUSY;
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
++	status =3D request_irq(irq, ssp_int, 0, dev_name(dev), drv_data);
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
++	iounmap(drv_data->ioaddr);
++
++	/* Prevent double remove */
++	platform_set_drvdata(pdev, NULL);
++
++	clk_put(drv_data->clk);
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
++MODULE_VERSION("0.25");
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
+index 0000000..d3600f7
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
++    ret =3D snprintf(buf, PAGE_SIZE, "%ld.%02ld\n", val/100, abs(val%10=
0));
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
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0015-ep93xx_cpufreq.patch =
b/recipes/linux/linux-2.6.32/ts72xx/0015-ep93xx_cpufreq.patch
new file mode 100644
index 0000000..afd5b3e
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0015-ep93xx_cpufreq.patch
@@ -0,0 +1,360 @@
+From d4ed3962171cdc235c9a55f864bf4db856224d0a Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 19:46:15 +0100
+Subject: [PATCH] ep93xx_cpufreq
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ arch/arm/Kconfig               |   12 ++
+ arch/arm/mach-ep93xx/Makefile  |    2 +
+ arch/arm/mach-ep93xx/cpufreq.c |  291 +++++++++++++++++++++++++++++++++=
+++++++
+ 3 files changed, 305 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/cpufreq.c
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 0f1d52f..05eab87 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -294,6 +294,7 @@ config ARCH_EP93XX
+ 	select COMMON_CLKDEV
+ 	select ARCH_REQUIRE_GPIOLIB
+ 	select ARCH_HAS_HOLES_MEMORYMODEL
++	select ARCH_HAS_CPUFREQ
+ 	help
+ 	  This enables support for the Cirrus EP93xx series of CPUs.
+=20
+@@ -1350,6 +1351,17 @@ config CPU_FREQ_INTEGRATOR
+=20
+ 	  If in doubt, say Y.
+=20
++config CPU_FREQ_EP93XX
++	tristate "CPUfreq driver for EP93XX CPUs"
++	depends on ARCH_EP93XX && CPU_FREQ
++	default n
++	help
++	  This enables the CPUfreq driver for EP9301 CPUs. Not tested with EP9=
302.
++
++	  For details, take a look at <file:Documentation/cpu-freq>.
++
++	  If in doubt, say N.
++
+ config CPU_FREQ_PXA
+ 	bool
+ 	depends on CPU_FREQ && ARCH_PXA && PXA25x
+diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefi=
le
+index 8624d62..f8d126c 100644
+--- a/arch/arm/mach-ep93xx/Makefile
++++ b/arch/arm/mach-ep93xx/Makefile
+@@ -6,6 +6,8 @@ obj-m			:=3D
+ obj-n			:=3D
+ obj-			:=3D
+=20
++obj-$(CONFIG_CPU_FREQ_EP93XX)	+=3D cpufreq.o
++
+ obj-$(CONFIG_MACH_ADSSPHERE)	+=3D adssphere.o
+ obj-$(CONFIG_MACH_EDB93XX)	+=3D edb93xx.o
+ obj-$(CONFIG_MACH_GESBC9312)	+=3D gesbc9312.o
+diff --git a/arch/arm/mach-ep93xx/cpufreq.c b/arch/arm/mach-ep93xx/cpufr=
eq.c
+new file mode 100644
+index 0000000..9188e5c
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/cpufreq.c
+@@ -0,0 +1,291 @@
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
++ * PLL1_X2 output (before the PS divide), must be > 290Mhz and <=3D 528=
Mhz
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
++ * - This driver does not use the clk_{get,put,roundrate} (clock.c) fun=
ctions.
++ *   That's quite dirty, but clock.c is not complete yet.
++ * - Significant power saving is made by lowering hclk not fclk.
++ * - Ethernet (100 MBit) doesn't work with hclk < 25MHz.
++ * - Is it safe to have fclk =3D hclk ?
++ * - calc_pll_rate is taken from clock.c (Lennert Buytenhek)
++ */
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/types.h>
++#include <linux/init.h>
++#include <linux/io.h>
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
++/* SMC_ROM =3D 0, nBYP1 =3D 1 */
++#define PLL1_MASK(x1fbd1,x1fbd2,x2ipd) (0x800000 | (x1fbd1 << 11) | (x1=
fbd2 << 5) | (x2ipd))
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
++static const char fclk_divisors[] =3D { 1, 2, 4, 8, 16, 1, 1, 1 };
++
++
++/* Suitable for EP9301. PLL1 rate (without final PS divider):
++   - PLL1_RATE(19,17,15) =3D 331.776 MHz
++   - PLL1_MASK(19, 7, 7) =3D 294.912 MHz
++ */
++static const ep93xx_speed_settings_t ep93xx_clkset1_settings[] =3D
++{
++  /* { speed, preset, pll1_ps, pdiv, hdiv, fdiv } */
++  { 165888, PLL1_MASK(19,17,15), 0, 1, 3, 1 }, /* [0x02B49A2F] fclk=3D1=
65.9 (fdiv=3D2), hclk=3D66.4 (hdiv=3D5), pclk=3D33.2 (pdiv=3D2), ps=3D1 *=
/
++  { 165887, PLL1_MASK(19,17,15), 1, 1, 3, 0 }, /* [0x00B59A2F] fclk=3D1=
65.9 (fdiv=3D1), hclk=3D33.2 (hdiv=3D5), pclk=3D16.6 (pdiv=3D2), ps=3D2 *=
/
++  { 147456, PLL1_MASK(19, 7, 7), 0, 1, 3, 1 }, /* [0x02B498E7] fclk=3D1=
47.5 (fdiv=3D2), hclk=3D59.0 (hdiv=3D5), pclk=3D29.5 (pdiv=3D2), ps=3D1 *=
/
++  { 147455, PLL1_MASK(19, 7, 7), 0, 2, 3, 1 }, /* [0x02B898E7] fclk=3D1=
47.5 (fdiv=3D2), hclk=3D59.0 (hdiv=3D5), pclk=3D14.7 (pdiv=3D4), ps=3D1 *=
/
++  {  73728, PLL1_MASK(19, 7, 7), 0, 1, 3, 2 }, /* [0x04B498E7] fclk=3D7=
3.7 (fdiv=3D4), hclk=3D59.0 (hdiv=3D5), pclk=3D29.5 (pdiv=3D2), ps=3D1 */
++  {  82944, PLL1_MASK(19,17,15), 0, 1, 3, 2 }, /* [0x04B49A2F] fclk=3D8=
2.9 (fdiv=3D4), hclk=3D66.4 (hdiv=3D5), pclk=3D33.2 (pdiv=3D2), ps=3D1 */
++  {  82943, PLL1_MASK(19,17,15), 0, 1, 4, 2 }, /* [0x04C49A2F] fclk=3D8=
2.9 (fdiv=3D4), hclk=3D55.3 (hdiv=3D6), pclk=3D27.6 (pdiv=3D2), ps=3D1 */
++  {  82942, PLL1_MASK(19,17,15), 1, 1, 2, 1 }, /* [0x02A59A2F] fclk=3D8=
2.9 (fdiv=3D2), hclk=3D41.5 (hdiv=3D4), pclk=3D20.7 (pdiv=3D2), ps=3D2 */
++  {  41472, PLL1_MASK(19,17,15), 0, 1, 5, 3 }, /* [0x06D49A2F] fclk=3D4=
1.5 (fdiv=3D8), hclk=3D41.5 (hdiv=3D8), pclk=3D20.7 (pdiv=3D2), ps=3D1 */
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
++static const ep93xx_speed_settings_t *ep93xx_find_clkset1(unsigned int =
khz, unsigned int relation)
++{
++  int i;
++  const ep93xx_speed_settings_t *p =3D &ep93xx_clkset1_settings[0];
++
++  switch (relation) {
++    case CPUFREQ_RELATION_L: /* lowest frequency at or above target */
++      for (i =3D 0; i < ARRAY_SIZE(ep93xx_clkset1_settings); i++) {
++        if (ep93xx_clkset1_settings[i].speed < khz)
++          continue;
++        if (p->speed > ep93xx_clkset1_settings[i].speed) // take lowest=
 value
++          p =3D &ep93xx_clkset1_settings[i];
++      }
++      break;
++
++    case CPUFREQ_RELATION_H: /* highest frequency below or at target */
++      for (i =3D 0; i < ARRAY_SIZE(ep93xx_clkset1_settings); i++) {
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
++  const ep93xx_speed_settings_t *config;
++  u32 value;
++
++  config =3D  ep93xx_find_clkset1(target_freq, relation);
++
++  freqs.old =3D ep93xx_get_speed(0);
++  freqs.new =3D config->speed;
++  freqs.cpu =3D 0;
++  freqs.flags =3D 0;
++
++  pr_debug("ep93xx: target_freq=3D%d, old=3D%d new=3D%d (kHz) rel=3D%d\=
n", target_freq, freqs.old, freqs.new, relation);
++
++  cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
++
++  value =3D CLKSET1(config->preset, config->pll1_ps,
++      config->pdiv, config->hdiv, config->fdiv);
++  __raw_writel(value, EP93XX_SYSCON_CLOCK_SET1);
++
++  /* 5 nops required to flush instruction pipeline */
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
++  printk(KERN_INFO "ep93xx-cpufreq: driver v1.01\n");
++
++  if (policy->cpu !=3D 0)
++    return -EINVAL;
++
++  policy->cur =3D ep93xx_get_speed(0);
++  policy->min =3D 25000;
++
++  policy->cpuinfo.min_freq =3D 13000;
++
++  /* All EP93xx are running up to 200Mhz, except EP9301 */
++  if (policy->cur <=3D 166000)
++    policy->cpuinfo.max_freq =3D 166000;
++  else
++    policy->cpuinfo.max_freq =3D 200000;
++
++  policy->cpuinfo.transition_latency =3D 1600000; /* 8..16ms (according=
 to datasheet) */
++  policy->max =3D policy->cpuinfo.max_freq;
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
++
++static int __init ep93xx_cpufreq_init(void)
++{
++  return cpufreq_register_driver(&ep93xx_driver);
++}
++module_init(ep93xx_cpufreq_init);
++
++static void __exit ep93xx_cpufreq_exit(void)
++{
++ cpufreq_unregister_driver(&ep93xx_driver);
++}
++module_exit(ep93xx_cpufreq_exit);
++
++MODULE_DESCRIPTION("CPU frequency scaling driver for EP93xx");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("1.01");
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/0016-ts7200_nor_flash.patc=
h b/recipes/linux/linux-2.6.32/ts72xx/0016-ts7200_nor_flash.patch
new file mode 100644
index 0000000..135646b
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/0016-ts7200_nor_flash.patch
@@ -0,0 +1,163 @@
+From 3c225a7077a7e9f0575fdfe6209342b5eb073b60 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 17 Jan 2010 19:50:34 +0100
+Subject: [PATCH] ts7200_nor_flash
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/mtd/maps/Kconfig        |    8 +++
+ drivers/mtd/maps/Makefile       |    1 +
+ drivers/mtd/maps/ts7200_flash.c |  106 ++++++++++++++++++++++++++++++++=
+++++++
+ 3 files changed, 115 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/mtd/maps/ts7200_flash.c
+
+diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
+index 14be075..bc20ac9 100644
+--- a/drivers/mtd/maps/Kconfig
++++ b/drivers/mtd/maps/Kconfig
+@@ -445,6 +445,14 @@ config MTD_OMAP_NOR
+ 	  These boards include the Innovator, H2, H3, OSK, Perseus2, and
+ 	  more.  If you have such a board, say 'Y'.
+=20
++config MTD_TS7200_NOR
++	tristate "Technologic Systems TS-7200 flash 8Mb"
++	depends on MTD_CFI && ARCH_EP93XX
++	help
++	  This provides a map driver for the on-board flash of the Technologic
++	  System's TS-7200 board. The 8MB flash is splitted into 3 partitions
++	  which are accessed as separate MTD devices.
++
+ # This needs CFI or JEDEC, depending on the cards found.
+ config MTD_PCI
+ 	tristate "PCI MTD driver"
+diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
+index ae2f6db..fb04757 100644
+--- a/drivers/mtd/maps/Makefile
++++ b/drivers/mtd/maps/Makefile
+@@ -58,6 +58,7 @@ obj-$(CONFIG_MTD_PLATRAM)	+=3D plat-ram.o
+ obj-$(CONFIG_MTD_OMAP_NOR)	+=3D omap_nor.o
+ obj-$(CONFIG_MTD_INTEL_VR_NOR)	+=3D intel_vr_nor.o
+ obj-$(CONFIG_MTD_BFIN_ASYNC)	+=3D bfin-async-flash.o
++obj-$(CONFIG_MTD_TS7200_NOR)	+=3D ts7200_flash.o
+ obj-$(CONFIG_MTD_RBTX4939)	+=3D rbtx4939-flash.o
+ obj-$(CONFIG_MTD_VMU)		+=3D vmu-flash.o
+ obj-$(CONFIG_MTD_GPIO_ADDR)	+=3D gpio-addr-flash.o
+diff --git a/drivers/mtd/maps/ts7200_flash.c b/drivers/mtd/maps/ts7200_f=
lash.c
+new file mode 100644
+index 0000000..efc5f00
+--- /dev/null
++++ b/drivers/mtd/maps/ts7200_flash.c
+@@ -0,0 +1,106 @@
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
++MODULE_DESCRIPTION("MTD map driver for TS-7200 board (" __MODULE_STRING=
(WINDOW_READABLE_SIZE) "MB flash version)");
+--=20
+1.6.0.4
+
diff --git a/recipes/linux/linux-2.6.32/ts72xx/defconfig b/recipes/linux/=
linux-2.6.32/ts72xx/defconfig
new file mode 100644
index 0000000..506640e
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/ts72xx/defconfig
@@ -0,0 +1,1686 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.32-rc3
+# Sun Oct 11 19:14:09 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+CONFIG_GENERIC_GPIO=3Dy
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+CONFIG_ARCH_HAS_CPUFREQ=3Dy
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_CONSTRUCTORS=3Dy
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D"-m"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SWAP=3Dy
+CONFIG_SYSVIPC=3Dy
+CONFIG_SYSVIPC_SYSCTL=3Dy
+CONFIG_POSIX_MQUEUE=3Dy
+CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TREE_RCU=3Dy
+# CONFIG_TREE_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+CONFIG_RCU_FANOUT=3D32
+# CONFIG_RCU_FANOUT_EXACT is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D16
+# CONFIG_GROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
+CONFIG_RELAY=3Dy
+CONFIG_NAMESPACES=3Dy
+# CONFIG_UTS_NS is not set
+CONFIG_IPC_NS=3Dy
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+# CONFIG_BLK_DEV_INITRD is not set
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_SYSCTL=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EMBEDDED=3Dy
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_AIO=3Dy
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_VM_EVENT_COUNTERS=3Dy
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+CONFIG_HAVE_CLK=3Dy
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+# CONFIG_SLOW_WORK is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_MODULE_FORCE_UNLOAD=3Dy
+CONFIG_MODVERSIONS=3Dy
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=3Dy
+CONFIG_LBDAF=3Dy
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
+# CONFIG_FREEZER is not set
+
+#
+# System Type
+#
+CONFIG_MMU=3Dy
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_EBSA110 is not set
+CONFIG_ARCH_EP93XX=3Dy
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_STMP3XXX is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5PC1XX is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_BCMRING is not set
+
+#
+# Cirrus EP93xx Implementation Options
+#
+# CONFIG_CRUNCH is not set
+CONFIG_CR1_NFBIT=3Dy
+
+#
+# EP93xx Platforms
+#
+CONFIG_EP93XX_SDCE3_SYNC_PHYS_OFFSET=3Dy
+# CONFIG_EP93XX_SDCE0_PHYS_OFFSET is not set
+# CONFIG_MACH_ADSSPHERE is not set
+# CONFIG_MACH_EDB9301 is not set
+# CONFIG_MACH_EDB9302 is not set
+# CONFIG_MACH_EDB9307 is not set
+# CONFIG_MACH_EDB9312 is not set
+# CONFIG_MACH_EDB9315 is not set
+# CONFIG_MACH_GESBC9312 is not set
+# CONFIG_MACH_MICRO9H is not set
+# CONFIG_MACH_MICRO9M is not set
+# CONFIG_MACH_MICRO9L is not set
+CONFIG_MACH_TS72XX=3Dy
+CONFIG_EP93XX_EARLY_UART1=3Dy
+# CONFIG_EP93XX_EARLY_UART2 is not set
+# CONFIG_EP93XX_EARLY_UART3 is not set
+CONFIG_MACH_TS72XX_FORCE_MACHINEID=3Dy
+CONFIG_MACH_TS72XX_SBCINFO=3Dm
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_ARM920T=3Dy
+CONFIG_CPU_32v4T=3Dy
+CONFIG_CPU_ABRT_EV4T=3Dy
+CONFIG_CPU_PABRT_LEGACY=3Dy
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
+CONFIG_ARM_THUMB=3Dy
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
+CONFIG_ARM_L1_CACHE_SHIFT=3D5
+CONFIG_ARM_VIC=3Dy
+CONFIG_ARM_VIC_NR=3D2
+CONFIG_COMMON_CLKDEV=3Dy
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
+CONFIG_VMSPLIT_3G=3Dy
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=3D0xC0000000
+# CONFIG_PREEMPT_NONE is not set
+# CONFIG_PREEMPT_VOLUNTARY is not set
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+CONFIG_OABI_COMPAT=3Dy
+CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=3Dy
+CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
+CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+# CONFIG_FLATMEM_MANUAL is not set
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+CONFIG_SPARSEMEM_MANUAL=3Dy
+CONFIG_SPARSEMEM=3Dy
+CONFIG_HAVE_MEMORY_PRESENT=3Dy
+CONFIG_SPARSEMEM_EXTREME=3Dy
+CONFIG_SPLIT_PTLOCK_CPUS=3D4096
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=3D0
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_HAVE_MLOCK=3Dy
+CONFIG_HAVE_MLOCKED_PAGE_BIT=3Dy
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
+CONFIG_ALIGNMENT_TRAP=3Dy
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0
+CONFIG_ZBOOT_ROM_BSS=3D0
+CONFIG_CMDLINE=3D"console=3DttyAM0,115200 root=3D/dev/nfs ip=3D192.168.1=
.50 nfsroot=3D192.168.1.48:/home/matt/TS-7200/nfsroot"
+# CONFIG_XIP_KERNEL is not set
+CONFIG_KEXEC=3Dy
+CONFIG_ATAGS_PROC=3Dy
+
+#
+# CPU Power Management
+#
+# CONFIG_CPU_FREQ is not set
+CONFIG_CPU_IDLE=3Dy
+CONFIG_CPU_IDLE_GOV_LADDER=3Dy
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_FPE_NWFPE=3Dy
+# CONFIG_FPE_NWFPE_XP is not set
+# CONFIG_FPE_FASTFPE is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=3Dy
+# CONFIG_BINFMT_AOUT is not set
+CONFIG_BINFMT_MISC=3Dm
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
+CONFIG_NET_KEY=3Dm
+# CONFIG_NET_KEY_MIGRATE is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+CONFIG_IP_ADVANCED_ROUTER=3Dy
+CONFIG_ASK_IP_FIB_HASH=3Dy
+# CONFIG_IP_FIB_TRIE is not set
+CONFIG_IP_FIB_HASH=3Dy
+# CONFIG_IP_MULTIPLE_TABLES is not set
+# CONFIG_IP_ROUTE_MULTIPATH is not set
+CONFIG_IP_ROUTE_VERBOSE=3Dy
+CONFIG_IP_PNP=3Dy
+CONFIG_IP_PNP_DHCP=3Dy
+# CONFIG_IP_PNP_BOOTP is not set
+# CONFIG_IP_PNP_RARP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_ARPD is not set
+CONFIG_SYN_COOKIES=3Dy
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=3Dm
+CONFIG_INET_TCP_DIAG=3Dm
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+CONFIG_TCP_MD5SIG=3Dy
+# CONFIG_IPV6 is not set
+# CONFIG_NETLABEL is not set
+CONFIG_NETWORK_SECMARK=3Dy
+CONFIG_NETFILTER=3Dy
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=3Dy
+
+#
+# Core Netfilter Configuration
+#
+CONFIG_NETFILTER_NETLINK=3Dm
+CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
+CONFIG_NETFILTER_NETLINK_LOG=3Dm
+CONFIG_NF_CONNTRACK=3Dm
+CONFIG_NF_CT_ACCT=3Dy
+CONFIG_NF_CONNTRACK_MARK=3Dy
+CONFIG_NF_CONNTRACK_SECMARK=3Dy
+CONFIG_NF_CONNTRACK_EVENTS=3Dy
+CONFIG_NF_CT_PROTO_DCCP=3Dm
+CONFIG_NF_CT_PROTO_GRE=3Dm
+CONFIG_NF_CT_PROTO_SCTP=3Dm
+CONFIG_NF_CT_PROTO_UDPLITE=3Dm
+CONFIG_NF_CONNTRACK_AMANDA=3Dm
+CONFIG_NF_CONNTRACK_FTP=3Dm
+CONFIG_NF_CONNTRACK_H323=3Dm
+CONFIG_NF_CONNTRACK_IRC=3Dm
+CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
+CONFIG_NF_CONNTRACK_PPTP=3Dm
+CONFIG_NF_CONNTRACK_SANE=3Dm
+CONFIG_NF_CONNTRACK_SIP=3Dm
+CONFIG_NF_CONNTRACK_TFTP=3Dm
+CONFIG_NF_CT_NETLINK=3Dm
+# CONFIG_NETFILTER_TPROXY is not set
+CONFIG_NETFILTER_XTABLES=3Dm
+CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dm
+CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dm
+CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dm
+CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
+CONFIG_NETFILTER_XT_TARGET_HL=3Dm
+# CONFIG_NETFILTER_XT_TARGET_LED is not set
+CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
+CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
+CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dm
+CONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
+CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
+CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
+CONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dm
+CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dm
+CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dm
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
+CONFIG_NETFILTER_XT_MATCH_DCCP=3Dm
+CONFIG_NETFILTER_XT_MATCH_DSCP=3Dm
+CONFIG_NETFILTER_XT_MATCH_ESP=3Dm
+CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
+CONFIG_NETFILTER_XT_MATCH_HELPER=3Dm
+CONFIG_NETFILTER_XT_MATCH_HL=3Dm
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm
+CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
+CONFIG_NETFILTER_XT_MATCH_MAC=3Dm
+CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
+CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
+CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
+CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
+CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm
+CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+CONFIG_NETFILTER_XT_MATCH_REALM=3Dm
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+CONFIG_NETFILTER_XT_MATCH_SCTP=3Dm
+CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
+CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dm
+CONFIG_NETFILTER_XT_MATCH_STRING=3Dm
+CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
+CONFIG_NETFILTER_XT_MATCH_TIME=3Dm
+CONFIG_NETFILTER_XT_MATCH_U32=3Dm
+# CONFIG_NETFILTER_XT_MATCH_OSF is not set
+CONFIG_IP_VS=3Dm
+CONFIG_IP_VS_DEBUG=3Dy
+CONFIG_IP_VS_TAB_BITS=3D12
+
+#
+# IPVS transport protocol load balancing support
+#
+CONFIG_IP_VS_PROTO_TCP=3Dy
+CONFIG_IP_VS_PROTO_UDP=3Dy
+CONFIG_IP_VS_PROTO_AH_ESP=3Dy
+CONFIG_IP_VS_PROTO_ESP=3Dy
+CONFIG_IP_VS_PROTO_AH=3Dy
+
+#
+# IPVS scheduler
+#
+CONFIG_IP_VS_RR=3Dm
+CONFIG_IP_VS_WRR=3Dm
+CONFIG_IP_VS_LC=3Dm
+CONFIG_IP_VS_WLC=3Dm
+CONFIG_IP_VS_LBLC=3Dm
+CONFIG_IP_VS_LBLCR=3Dm
+CONFIG_IP_VS_DH=3Dm
+CONFIG_IP_VS_SH=3Dm
+CONFIG_IP_VS_SED=3Dm
+CONFIG_IP_VS_NQ=3Dm
+
+#
+# IPVS application helper
+#
+CONFIG_IP_VS_FTP=3Dm
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_DEFRAG_IPV4=3Dm
+CONFIG_NF_CONNTRACK_IPV4=3Dm
+CONFIG_NF_CONNTRACK_PROC_COMPAT=3Dy
+CONFIG_IP_NF_QUEUE=3Dm
+CONFIG_IP_NF_IPTABLES=3Dm
+CONFIG_IP_NF_MATCH_ADDRTYPE=3Dm
+CONFIG_IP_NF_MATCH_AH=3Dm
+CONFIG_IP_NF_MATCH_ECN=3Dm
+CONFIG_IP_NF_MATCH_TTL=3Dm
+CONFIG_IP_NF_FILTER=3Dm
+CONFIG_IP_NF_TARGET_REJECT=3Dm
+CONFIG_IP_NF_TARGET_LOG=3Dm
+CONFIG_IP_NF_TARGET_ULOG=3Dm
+CONFIG_NF_NAT=3Dm
+CONFIG_NF_NAT_NEEDED=3Dy
+CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
+CONFIG_IP_NF_TARGET_NETMAP=3Dm
+CONFIG_IP_NF_TARGET_REDIRECT=3Dm
+CONFIG_NF_NAT_SNMP_BASIC=3Dm
+CONFIG_NF_NAT_PROTO_DCCP=3Dm
+CONFIG_NF_NAT_PROTO_GRE=3Dm
+CONFIG_NF_NAT_PROTO_UDPLITE=3Dm
+CONFIG_NF_NAT_PROTO_SCTP=3Dm
+CONFIG_NF_NAT_FTP=3Dm
+CONFIG_NF_NAT_IRC=3Dm
+CONFIG_NF_NAT_TFTP=3Dm
+CONFIG_NF_NAT_AMANDA=3Dm
+CONFIG_NF_NAT_PPTP=3Dm
+CONFIG_NF_NAT_H323=3Dm
+CONFIG_NF_NAT_SIP=3Dm
+CONFIG_IP_NF_MANGLE=3Dm
+CONFIG_IP_NF_TARGET_CLUSTERIP=3Dm
+CONFIG_IP_NF_TARGET_ECN=3Dm
+CONFIG_IP_NF_TARGET_TTL=3Dm
+CONFIG_IP_NF_RAW=3Dm
+# CONFIG_IP_NF_SECURITY is not set
+CONFIG_IP_NF_ARPTABLES=3Dm
+CONFIG_IP_NF_ARPFILTER=3Dm
+CONFIG_IP_NF_ARP_MANGLE=3Dm
+# CONFIG_IP_DCCP is not set
+CONFIG_IP_SCTP=3Dm
+# CONFIG_SCTP_DBG_MSG is not set
+# CONFIG_SCTP_DBG_OBJCNT is not set
+# CONFIG_SCTP_HMAC_NONE is not set
+# CONFIG_SCTP_HMAC_SHA1 is not set
+CONFIG_SCTP_HMAC_MD5=3Dy
+# CONFIG_RDS is not set
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
+# CONFIG_IEEE802154 is not set
+# CONFIG_NET_SCHED is not set
+CONFIG_NET_CLS_ROUTE=3Dy
+# CONFIG_DCB is not set
+
+#
+# Network testing
+#
+CONFIG_NET_PKTGEN=3Dm
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=3Dy
+CONFIG_CFG80211=3Dm
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+CONFIG_CFG80211_DEFAULT_PS=3Dy
+CONFIG_CFG80211_DEFAULT_PS_VALUE=3D1
+# CONFIG_CFG80211_DEBUGFS is not set
+CONFIG_WIRELESS_OLD_REGULATORY=3Dy
+CONFIG_WIRELESS_EXT=3Dy
+CONFIG_WIRELESS_EXT_SYSFS=3Dy
+# CONFIG_LIB80211 is not set
+CONFIG_MAC80211=3Dm
+CONFIG_MAC80211_RC_PID=3Dy
+# CONFIG_MAC80211_RC_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT_PID=3Dy
+# CONFIG_MAC80211_RC_DEFAULT_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT=3D"pid"
+# CONFIG_MAC80211_MESH is not set
+CONFIG_MAC80211_LEDS=3Dy
+# CONFIG_MAC80211_DEBUGFS is not set
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
+CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
+# CONFIG_DEVTMPFS is not set
+CONFIG_STANDALONE=3Dy
+CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
+CONFIG_FW_LOADER=3Dm
+CONFIG_FIRMWARE_IN_KERNEL=3Dy
+CONFIG_EXTRA_FIRMWARE=3D""
+# CONFIG_SYS_HYPERVISOR is not set
+CONFIG_CONNECTOR=3Dm
+CONFIG_MTD=3Dy
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_TESTS is not set
+CONFIG_MTD_CONCAT=3Dy
+CONFIG_MTD_PARTITIONS=3Dy
+# CONFIG_MTD_REDBOOT_PARTS is not set
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
+# CONFIG_MTD_SST25L is not set
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
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_TS7250=3Dy
+CONFIG_MTD_NAND_IDS=3Dy
+# CONFIG_MTD_NAND_DISKONCHIP is not set
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
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dm
+CONFIG_BLK_DEV_CRYPTOLOOP=3Dm
+CONFIG_BLK_DEV_NBD=3Dm
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=3Dm
+CONFIG_BLK_DEV_RAM_COUNT=3D16
+CONFIG_BLK_DEV_RAM_SIZE=3D65536
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+CONFIG_MISC_DEVICES=3Dy
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_ISL29003 is not set
+CONFIG_EP93XX_PWM=3Dm
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+# CONFIG_EEPROM_AT24 is not set
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_LEGACY is not set
+# CONFIG_EEPROM_MAX6875 is not set
+# CONFIG_EEPROM_93CX6 is not set
+CONFIG_TS72XX_MAX197=3Dm
+CONFIG_TS72XX_MAX197_AVERAGE=3Dy
+CONFIG_HAVE_IDE=3Dy
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=3Dy
+CONFIG_SCSI_DMA=3Dy
+CONFIG_SCSI_TGT=3Dy
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=3Dy
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=3Dy
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+CONFIG_BLK_DEV_SR=3Dy
+# CONFIG_BLK_DEV_SR_VENDOR is not set
+CONFIG_CHR_DEV_SG=3Dy
+# CONFIG_CHR_DEV_SCH is not set
+# CONFIG_SCSI_MULTI_LUN is not set
+CONFIG_SCSI_CONSTANTS=3Dy
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
+# CONFIG_SCSI_LOWLEVEL is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
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
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+CONFIG_EP93XX_ETH=3Dy
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
+# CONFIG_KS8842 is not set
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+CONFIG_WLAN=3Dy
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
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
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+CONFIG_INPUT_FF_MEMLESS=3Dm
+CONFIG_INPUT_POLLDEV=3Dm
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=3Dy
+CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=3Dm
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=3Dy
+# CONFIG_KEYBOARD_ADP5588 is not set
+CONFIG_KEYBOARD_ATKBD=3Dy
+# CONFIG_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+CONFIG_KEYBOARD_EP93XX=3Dm
+CONFIG_KEYBOARD_TS72XX=3Dm
+CONFIG_KEYBOARD_GPIO=3Dm
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+CONFIG_INPUT_MOUSE=3Dy
+CONFIG_MOUSE_PS2=3Dm
+CONFIG_MOUSE_PS2_ALPS=3Dy
+CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
+CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
+CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
+# CONFIG_MOUSE_PS2_ELANTECH is not set
+# CONFIG_MOUSE_PS2_SENTELIC is not set
+# CONFIG_MOUSE_PS2_TOUCHKIT is not set
+CONFIG_MOUSE_SERIAL=3Dm
+# CONFIG_MOUSE_APPLETOUCH is not set
+# CONFIG_MOUSE_BCM5974 is not set
+# CONFIG_MOUSE_VSXXXAA is not set
+# CONFIG_MOUSE_GPIO is not set
+# CONFIG_MOUSE_SYNAPTICS_I2C is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_UINPUT=3Dm
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=3Dy
+# CONFIG_SERIO_SERPORT is not set
+# CONFIG_SERIO_AMBAKMI is not set
+CONFIG_SERIO_LIBPS2=3Dy
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
+CONFIG_SERIAL_8250=3Dm
+CONFIG_SERIAL_8250_NR_UARTS=3D4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+CONFIG_SERIAL_8250_TS_SER1=3Dm
+CONFIG_SERIAL_8250_TS_SER1_IRQ=3D5
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_AMBA_PL010=3Dy
+CONFIG_SERIAL_AMBA_PL010_CONSOLE=3Dy
+CONFIG_SERIAL_AMBA_PL010_TS72XX=3Dy
+# CONFIG_SERIAL_AMBA_PL011 is not set
+# CONFIG_SERIAL_MAX3100 is not set
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=3Dm
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+CONFIG_I2C_COMPAT=3Dy
+CONFIG_I2C_CHARDEV=3Dm
+CONFIG_I2C_HELPER_AUTO=3Dy
+CONFIG_I2C_ALGOBIT=3Dy
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_DESIGNWARE is not set
+CONFIG_I2C_GPIO=3Dy
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
+CONFIG_DS1682=3Dm
+CONFIG_SENSORS_TSL2550=3Dm
+CONFIG_I2C_DEBUG_CORE=3Dy
+CONFIG_I2C_DEBUG_ALGO=3Dy
+CONFIG_I2C_DEBUG_BUS=3Dy
+CONFIG_I2C_DEBUG_CHIP=3Dy
+CONFIG_SPI=3Dy
+CONFIG_SPI_MASTER=3Dy
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+# CONFIG_SPI_PL022 is not set
+CONFIG_SPI_EP93XX=3Dy
+
+#
+# SPI Protocol Masters
+#
+CONFIG_SPI_SPIDEV=3Dm
+# CONFIG_SPI_TLE62X0 is not set
+CONFIG_SPI_TMP124=3Dy
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=3Dy
+CONFIG_GPIOLIB=3Dy
+CONFIG_GPIO_SYSFS=3Dy
+
+#
+# Memory mapped GPIO expanders:
+#
+# CONFIG_GPIO_PL061 is not set
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
+# CONFIG_GPIO_MC33880 is not set
+
+#
+# AC97 GPIO expanders:
+#
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+CONFIG_WATCHDOG=3Dy
+# CONFIG_WATCHDOG_NOWAYOUT is not set
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+CONFIG_EP93XX_WATCHDOG=3Dm
+CONFIG_TS72XX_WATCHDOG=3Dm
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
+CONFIG_SSB_POSSIBLE=3Dy
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB=3Dm
+# CONFIG_SSB_SILENT is not set
+# CONFIG_SSB_DEBUG is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13783 is not set
+# CONFIG_AB3100_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
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
+CONFIG_TS72XX_CONSOLE=3Dm
+CONFIG_TS72XX_CONSOLE_COLUMNS=3D20
+CONFIG_TS72XX_CONSOLE_ROWS=3D4
+# CONFIG_SOUND is not set
+CONFIG_HID_SUPPORT=3Dy
+CONFIG_HID=3Dy
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=3Dy
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# Special HID drivers
+#
+CONFIG_HID_A4TECH=3Dy
+CONFIG_HID_APPLE=3Dy
+CONFIG_HID_BELKIN=3Dy
+CONFIG_HID_CHERRY=3Dy
+CONFIG_HID_CHICONY=3Dy
+CONFIG_HID_CYPRESS=3Dy
+# CONFIG_HID_DRAGONRISE is not set
+CONFIG_HID_EZKEY=3Dy
+# CONFIG_HID_KYE is not set
+CONFIG_HID_GYRATION=3Dy
+# CONFIG_HID_TWINHAN is not set
+# CONFIG_HID_KENSINGTON is not set
+CONFIG_HID_LOGITECH=3Dy
+# CONFIG_LOGITECH_FF is not set
+# CONFIG_LOGIRUMBLEPAD2_FF is not set
+CONFIG_HID_MICROSOFT=3Dy
+CONFIG_HID_MONTEREY=3Dy
+# CONFIG_HID_NTRIG is not set
+CONFIG_HID_PANTHERLORD=3Dy
+# CONFIG_PANTHERLORD_FF is not set
+CONFIG_HID_PETALYNX=3Dy
+CONFIG_HID_SAMSUNG=3Dy
+CONFIG_HID_SONY=3Dy
+CONFIG_HID_SUNPLUS=3Dy
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_ZEROPLUS is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+CONFIG_USB_ARCH_HAS_OHCI=3Dy
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+CONFIG_USB=3Dy
+CONFIG_USB_DEBUG=3Dy
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
+
+#
+# Miscellaneous USB options
+#
+# CONFIG_USB_DEVICEFS is not set
+CONFIG_USB_DEVICE_CLASS=3Dy
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_OTG is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+CONFIG_USB_MON=3Dy
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_ISP1362_HCD is not set
+CONFIG_USB_OHCI_HCD=3Dy
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
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
+CONFIG_USB_STORAGE=3Dy
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
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+# CONFIG_USB_GADGET is not set
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_NOP_USB_XCEIV is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=3Dy
+CONFIG_LEDS_GPIO_PLATFORM=3Dy
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=3Dy
+CONFIG_LEDS_TRIGGER_TIMER=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_RTC_LIB=3Dy
+CONFIG_RTC_CLASS=3Dy
+CONFIG_RTC_HCTOSYS=3Dy
+CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc1"
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
+# CONFIG_RTC_DRV_RX8025 is not set
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
+# CONFIG_RTC_DRV_PCF2123 is not set
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
+CONFIG_RTC_DRV_M48T86=3Dy
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_EP93XX=3Dy
+# CONFIG_RTC_DRV_PL030 is not set
+# CONFIG_RTC_DRV_PL031 is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# TI VLYNQ
+#
+# CONFIG_STAGING is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+CONFIG_EXT2_FS_XATTR=3Dy
+CONFIG_EXT2_FS_POSIX_ACL=3Dy
+CONFIG_EXT2_FS_SECURITY=3Dy
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=3Dy
+CONFIG_EXT3_FS_POSIX_ACL=3Dy
+CONFIG_EXT3_FS_SECURITY=3Dy
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=3Dy
+# CONFIG_JBD_DEBUG is not set
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+CONFIG_FS_POSIX_ACL=3Dy
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FILE_LOCKING=3Dy
+CONFIG_FSNOTIFY=3Dy
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+CONFIG_AUTOFS4_FS=3Dm
+CONFIG_FUSE_FS=3Dm
+# CONFIG_CUSE is not set
+CONFIG_GENERIC_ACL=3Dy
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+CONFIG_ISO9660_FS=3Dm
+CONFIG_JOLIET=3Dy
+CONFIG_ZISOFS=3Dy
+CONFIG_UDF_FS=3Dm
+CONFIG_UDF_NLS=3Dy
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=3Dm
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=3Dm
+CONFIG_FAT_DEFAULT_CODEPAGE=3D437
+CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
+CONFIG_NTFS_FS=3Dm
+# CONFIG_NTFS_DEBUG is not set
+CONFIG_NTFS_RW=3Dy
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+CONFIG_TMPFS_POSIX_ACL=3Dy
+# CONFIG_HUGETLB_PAGE is not set
+CONFIG_CONFIGFS_FS=3Dm
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+CONFIG_NFS_FS=3Dy
+# CONFIG_NFS_V3 is not set
+CONFIG_NFS_V4=3Dy
+# CONFIG_NFS_V4_1 is not set
+CONFIG_ROOT_NFS=3Dy
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=3Dy
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
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=3Dy
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
+CONFIG_NLS_CODEPAGE_437=3Dy
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_850=3Dm
+CONFIG_NLS_CODEPAGE_852=3Dm
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
+CONFIG_NLS_CODEPAGE_1250=3Dm
+# CONFIG_NLS_CODEPAGE_1251 is not set
+CONFIG_NLS_ASCII=3Dm
+CONFIG_NLS_ISO8859_1=3Dm
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+CONFIG_NLS_ISO8859_15=3Dm
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+CONFIG_NLS_UTF8=3Dm
+CONFIG_DLM=3Dm
+CONFIG_DLM_DEBUG=3Dy
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=3D2048
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=3Dy
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
+CONFIG_HAVE_FUNCTION_TRACER=3Dy
+CONFIG_TRACING_SUPPORT=3Dy
+# CONFIG_FTRACE is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=3Dy
+CONFIG_ARM_UNWIND=3Dy
+# CONFIG_DEBUG_USER is not set
+
+#
+# Security options
+#
+CONFIG_KEYS=3Dy
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
+CONFIG_SECURITY=3Dy
+# CONFIG_SECURITYFS is not set
+CONFIG_SECURITY_NETWORK=3Dy
+# CONFIG_SECURITY_NETWORK_XFRM is not set
+# CONFIG_SECURITY_PATH is not set
+CONFIG_SECURITY_FILE_CAPABILITIES=3Dy
+# CONFIG_SECURITY_ROOTPLUG is not set
+# CONFIG_SECURITY_TOMOYO is not set
+CONFIG_CRYPTO=3Dy
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=3Dy
+CONFIG_CRYPTO_ALGAPI2=3Dy
+CONFIG_CRYPTO_AEAD=3Dm
+CONFIG_CRYPTO_AEAD2=3Dy
+CONFIG_CRYPTO_BLKCIPHER=3Dy
+CONFIG_CRYPTO_BLKCIPHER2=3Dy
+CONFIG_CRYPTO_HASH=3Dy
+CONFIG_CRYPTO_HASH2=3Dy
+CONFIG_CRYPTO_RNG2=3Dy
+CONFIG_CRYPTO_PCOMP=3Dy
+CONFIG_CRYPTO_MANAGER=3Dy
+CONFIG_CRYPTO_MANAGER2=3Dy
+CONFIG_CRYPTO_GF128MUL=3Dm
+CONFIG_CRYPTO_NULL=3Dm
+CONFIG_CRYPTO_WORKQUEUE=3Dy
+# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_AUTHENC=3Dm
+CONFIG_CRYPTO_TEST=3Dm
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
+CONFIG_CRYPTO_ECB=3Dm
+CONFIG_CRYPTO_LRW=3Dm
+CONFIG_CRYPTO_PCBC=3Dm
+CONFIG_CRYPTO_XTS=3Dm
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_HMAC=3Dy
+CONFIG_CRYPTO_XCBC=3Dm
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=3Dm
+# CONFIG_CRYPTO_GHASH is not set
+CONFIG_CRYPTO_MD4=3Dm
+CONFIG_CRYPTO_MD5=3Dy
+CONFIG_CRYPTO_MICHAEL_MIC=3Dm
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=3Dm
+CONFIG_CRYPTO_SHA256=3Dm
+CONFIG_CRYPTO_SHA512=3Dm
+CONFIG_CRYPTO_TGR192=3Dm
+CONFIG_CRYPTO_WP512=3Dm
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=3Dm
+CONFIG_CRYPTO_ANUBIS=3Dm
+CONFIG_CRYPTO_ARC4=3Dm
+CONFIG_CRYPTO_BLOWFISH=3Dm
+CONFIG_CRYPTO_CAMELLIA=3Dm
+CONFIG_CRYPTO_CAST5=3Dm
+CONFIG_CRYPTO_CAST6=3Dm
+CONFIG_CRYPTO_DES=3Dy
+CONFIG_CRYPTO_FCRYPT=3Dm
+CONFIG_CRYPTO_KHAZAD=3Dm
+# CONFIG_CRYPTO_SALSA20 is not set
+CONFIG_CRYPTO_SEED=3Dm
+CONFIG_CRYPTO_SERPENT=3Dm
+CONFIG_CRYPTO_TEA=3Dm
+CONFIG_CRYPTO_TWOFISH=3Dm
+CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
+
+#
+# Compression
+#
+CONFIG_CRYPTO_DEFLATE=3Dm
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_HW=3Dy
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+CONFIG_GENERIC_FIND_LAST_BIT=3Dy
+CONFIG_CRC_CCITT=3Dm
+CONFIG_CRC16=3Dm
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=3Dm
+CONFIG_CRC32=3Dy
+CONFIG_CRC7=3Dm
+CONFIG_LIBCRC32C=3Dm
+CONFIG_ZLIB_INFLATE=3Dm
+CONFIG_ZLIB_DEFLATE=3Dm
+CONFIG_TEXTSEARCH=3Dy
+CONFIG_TEXTSEARCH_KMP=3Dm
+CONFIG_TEXTSEARCH_BM=3Dm
+CONFIG_TEXTSEARCH_FSM=3Dm
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
+CONFIG_NLATTR=3Dy
diff --git a/recipes/linux/linux_2.6.32.bb b/recipes/linux/linux_2.6.32.b=
b
index fdc22e3..d0043c5 100644
--- a/recipes/linux/linux_2.6.32.bb
+++ b/recipes/linux/linux_2.6.32.bb
@@ -1,6 +1,6 @@
 require linux.inc
=20
-PR =3D "r8"
+PR =3D "r9"
=20
 S =3D "${WORKDIR}/linux-${PV}"
=20
@@ -20,6 +20,7 @@ DEFAULT_PREFERENCE_tosa =3D "-1"
 DEFAULT_PREFERENCE_ben-nanonote =3D "-1"
 DEFAULT_PREFERENCE_jornada6xx =3D "-1"
 DEFAULT_PREFERENCE_jornada7xx =3D "-1"
+DEFAULT_PREFERENCE_ts72xx =3D "-1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2;name=3Dkernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.9.bz2;p=
atch=3D1 \
@@ -45,6 +46,25 @@ SRC_URI_append_simone =3D " \
 			file://ep93xx/ep93xx-spi.patch;patch=3D1 \
 			file://ep93xx/ep93xx-cpuinfo.patch;patch=3D1 "
=20
+SRC_URI_append_ts72xx =3D " \
+                        file://0001-ts72xx_base.patch;patch=3D1 \
+                        file://0002-ts72xx_force_machine-id.patch;patch=3D=
1 \
+                        file://0003-ep93xx_cpuinfo.patch;patch=3D1 \
+                        file://0004-ts72xx_sbcinfo.patch;patch=3D1 \
+                        file://0005-ep93xx_eth.patch;patch=3D1 \
+                        file://0006-ts72xx_ts_ser1.patch;patch=3D1 \
+                        file://0007-ts72xx_rs485.patch;patch=3D1 \
+                        file://0008-ts72xx_ts_eth100.patch;patch=3D1 \
+                        file://0009-ts7200_cf_ide.patch;patch=3D1 \
+                        file://0010-ts72xx_pata.patch;patch=3D1 \
+                        file://0011-ep93xx_pm.patch;patch=3D1 \
+                        file://0012-ts72xx_gpio_i2c.patch;patch=3D1 \
+                        file://0013-ts72xx_dio_keypad.patch;patch=3D1 \
+                        file://0014-ep93xx_spi.patch;patch=3D1 \
+                        file://0015-ep93xx_cpufreq.patch;patch=3D1 \
+                        file://0016-ts7200_nor_flash.patch;patch=3D1 \
+                        "
+
 # Zaurus family bootloader patches
 RPSRC =3D "http://www.rpsys.net/openzaurus/patches/archive"
 ZAURUSPATCHES =3D " ${RPSRC}/pxa-linking-bug-r1.patch;patch=3D1;status=3D=
unmergable;name=3Dpxa-linking-bug-r1 "
--=20
1.6.3.3



