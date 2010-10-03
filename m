Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NNk-0002QZ-5f
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:09:32 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 807971D363F7;
	Sun,  3 Oct 2010 14:02:03 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:01:57 +0200
Message-Id: <1286107318-10285-3-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1286107318-10285-1-git-send-email-ynezz@true.cz>
References: <1286107318-10285-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
Subject: [PATCH 2/3] linux-2.6.34: add support for ts72xx and make it default kernel
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
X-List-Received-Date: Sun, 03 Oct 2010 12:09:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 .../linux-2.6.34/ts72xx/0001-ts72xx_base.patch     |  445 +++
 .../ts72xx/0002-ts72xx_force_machine-id.patch      |   45 +
 .../linux-2.6.34/ts72xx/0003-ep93xx_cpuinfo.patch  |   32 +
 .../linux-2.6.34/ts72xx/0004-ep93xx_eth.patch      |  551 ++++
 .../ts72xx/0005-ep93xx-m2m-DMA-support.patch       |  882 ++++++
 .../linux-2.6.34/ts72xx/0006-ts72xx_rs485.patch    |  218 ++
 .../linux-2.6.34/ts72xx/0007-ts72xx_ts_ser1.patch  |  259 ++
 .../ts72xx/0008-ts72xx_ts_eth100.patch             |  273 ++
 .../linux-2.6.34/ts72xx/0009-ts72xx_pata.patch     |  432 +++
 .../linux-2.6.34/ts72xx/0010-ts72xx_gpio_i2c.patch |   58 +
 .../ts72xx/0011-ts72xx_dio_keypad.patch            |  306 ++
 .../linux-2.6.34/ts72xx/0012-ts72xx_sbcinfo.patch  |  263 ++
 .../linux-2.6.34/ts72xx/0013-ts72xx_max197.patch   |  347 ++
 .../ts72xx/0014-ts7200_nor_flash.patch             |  176 ++
 .../linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch   | 3293 ++++++++++++++=
++++++
 .../ts72xx/0016-ts72xx_nand_flash.patch            |  270 ++
 .../linux-2.6.34/ts72xx/0017-ep93xx_spi.patch      | 1312 ++++++++
 .../ts72xx/0018-ts72xx_spi_tmp124.patch            |  298 ++
 recipes/linux/linux-2.6.34/ts72xx/defconfig        | 1679 ++++++++++
 recipes/linux/linux_2.6.34.bb                      |   24 +-
 20 files changed, 11162 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0001-ts72xx_base.pa=
tch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0002-ts72xx_force_m=
achine-id.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0003-ep93xx_cpuinfo=
.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0004-ep93xx_eth.pat=
ch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0005-ep93xx-m2m-DMA=
-support.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0006-ts72xx_rs485.p=
atch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0007-ts72xx_ts_ser1=
.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0008-ts72xx_ts_eth1=
00.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0009-ts72xx_pata.pa=
tch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0010-ts72xx_gpio_i2=
c.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0011-ts72xx_dio_key=
pad.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0012-ts72xx_sbcinfo=
.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0013-ts72xx_max197.=
patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0014-ts7200_nor_fla=
sh.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0015-ts72xx_sdcard.=
patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0016-ts72xx_nand_fl=
ash.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0017-ep93xx_spi.pat=
ch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0018-ts72xx_spi_tmp=
124.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/defconfig

diff --git a/recipes/linux/linux-2.6.34/ts72xx/0001-ts72xx_base.patch b/r=
ecipes/linux/linux-2.6.34/ts72xx/0001-ts72xx_base.patch
new file mode 100644
index 0000000..247601b
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0001-ts72xx_base.patch
@@ -0,0 +1,445 @@
+From 9a60df856b54ba2f09dc0bbe4229627372f0a122 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Thu, 10 Jun 2010 10:43:24 +0200
+Subject: [PATCH 01/18] ts72xx_base
+
+- patch: allow to force nF bit in control reg
+- register pwm1
+---
+ arch/arm/Kconfig                                |    1 +
+ arch/arm/mach-ep93xx/Kconfig                    |    9 ++
+ arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h |    8 ++
+ arch/arm/mach-ep93xx/include/mach/memory.h      |   28 +++++
+ arch/arm/mach-ep93xx/include/mach/ts72xx.h      |  147 ++++++++++++++++=
++++---
+ arch/arm/mach-ep93xx/ts72xx.c                   |   40 ++++++-
+ arch/arm/mm/proc-arm920.S                       |    5 +-
+ 7 files changed, 218 insertions(+), 20 deletions(-)
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 92622eb..ab19836 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -321,6 +321,7 @@ config ARCH_EP93XX
+ 	select CPU_ARM920T
+ 	select ARM_AMBA
+ 	select ARM_VIC
++	select ARCH_SPARSEMEM_ENABLE
+ 	select GENERIC_GPIO
+ 	select HAVE_CLK
+ 	select COMMON_CLKDEV
+diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
+index 3a08b18..b6be37e 100644
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
+index 93e2ecc..f100f7f 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
++++ b/arch/arm/mach-ep93xx/include/mach/ep93xx-regs.h
+@@ -83,6 +83,7 @@
+=20
+ #define EP93XX_BOOT_ROM_BASE		EP93XX_AHB_IOMEM(0x00090000)
+=20
++#define EP93XX_IDE_PHYS_BASE		EP93XX_AHB_PHYS(0x000a0000)
+ #define EP93XX_IDE_BASE			EP93XX_AHB_IOMEM(0x000a0000)
+=20
+ #define EP93XX_VIC1_BASE		EP93XX_AHB_IOMEM(0x000b0000)
+@@ -96,16 +97,22 @@
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
+ #define EP93XX_AAC_BASE			EP93XX_APB_IOMEM(0x00080000)
+=20
++#define EP93XX_SPI_PHYS_BASE		(EP93XX_APB_PHYS_BASE + 0x000a0000)
+ #define EP93XX_SPI_BASE			EP93XX_APB_IOMEM(0x000a0000)
+=20
+ #define EP93XX_IRDA_BASE		EP93XX_APB_IOMEM(0x000b0000)
+@@ -209,6 +216,7 @@
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
+index 93107d8..83ed0e6 100644
+--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
++++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+@@ -8,38 +8,40 @@
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
++ * febf7000	23400000	4K	PLD version (3 bits)
++ * febf6000	22c00000	4K	RS-485 control register
++ * febf5000	23000000	4K	RS-485 mode register
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
+ #define TS72XX_OPTIONS_VIRT_BASE	0xfebfe000
+ #define TS72XX_OPTIONS_SIZE		0x00001000
+-
+-#define TS72XX_OPTIONS_COM2_RS485	0x02
+-#define TS72XX_OPTIONS_MAX197		0x01
+-
++#define 	TS72XX_OPTIONS_COM2_RS485	0x02
++#define 	TS72XX_OPTIONS_MAX197		0x01
+=20
+ #define TS72XX_OPTIONS2_PHYS_BASE	0x22800000
+ #define TS72XX_OPTIONS2_VIRT_BASE	0xfebfd000
+ #define TS72XX_OPTIONS2_SIZE		0x00001000
+-
+-#define TS72XX_OPTIONS2_TS9420		0x04
+-#define TS72XX_OPTIONS2_TS9420_BOOT	0x02
+-
++#define 	TS72XX_OPTIONS2_TS9420		0x04
++#define 	TS72XX_OPTIONS2_TS9420_BOOT	0x02
+=20
+ #define TS72XX_NAND1_DATA_PHYS_BASE	0x60000000
+ #define TS72XX_NAND2_DATA_PHYS_BASE	0x70000000
+@@ -50,12 +52,13 @@
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
++#define TS72XX_NAND_BUSY_OFFSET		0x00800000
+=20
+ #define TS72XX_RTC_INDEX_VIRT_BASE	0xfebf9000
+ #define TS72XX_RTC_INDEX_PHYS_BASE	0x10800000
+@@ -68,32 +71,140 @@
+ #define TS72XX_WDT_CONTROL_PHYS_BASE	0x23800000
+ #define TS72XX_WDT_FEED_PHYS_BASE	0x23c00000
+=20
++#define TS72XX_PLD_VERSION_VIRT_BASE	0xfebf7000
++#define TS72XX_PLD_VERSION_PHYS_BASE	0x23400000
++#define TS72XX_PLD_VERSION_SIZE		0x00001000
++
++#define TS72XX_JUMPERS_MAX197_PHYS_BASE	0x10800000 // jumpers/max197 bu=
sy bit/COM1 dcd register (8-bit, read only)
++#define TS72XX_MAX197_SAMPLE_PHYS_BASE	0x10f00000 // max197 sample/cont=
rol register (16-bit read/8-bit write)
++
++/*
++ * RS485 option
++ */
++#define TS72XX_RS485_CONTROL_VIRT_BASE	0xfebf6000
++#define TS72XX_RS485_CONTROL_PHYS_BASE	0x22c00000
++#define TS72XX_RS485_CONTROL_SIZE	0x00001000
++
++#define TS72XX_RS485_MODE_VIRT_BASE	0xfebf5000
++#define TS72XX_RS485_MODE_PHYS_BASE	0x23000000
++#define TS72XX_RS485_MODE_SIZE		0x00001000
++
++#define TS72XX_RS485_AUTO485FD		1
++#define TS72XX_RS485_AUTO485HD		2
++#define TS72XX_RS485_MODE_RS232		0x00
++#define TS72XX_RS485_MODE_FD		0x01
++#define TS72XX_RS485_MODE_9600_HD	0x04
++#define TS72XX_RS485_MODE_19200_HD	0x05
++#define TS72XX_RS485_MODE_57600_HD	0x06
++#define TS72XX_RS485_MODE_115200_HD	0x07
++
++/*
++ * PC/104 8-bit & 16-bit bus
++ *
++ * virt		phys		size
++ * febf0000	11e00000	4K	PC/104 8-bit I/O
++ * febef000	21e00000	4K	PC/104 16-bit I/O
++ * fea00000	11a00000	1MB	PC/104 8-bit memory
++ * fe900000	21a00000	1MB	PC/104 16-bit memory
++ */
++#define TS72XX_PC104_8BIT_IO_VIRT_BASE	0xfebf0000
++#define TS72XX_PC104_8BIT_IO_PHYS_BASE	0x11e00000
++#define TS72XX_PC104_8BIT_IO_SIZE	0x00001000
++#define TS72XX_PC104_8BIT_MEM_VIRT_BASE	0xfea00000
++#define TS72XX_PC104_8BIT_MEM_PHYS_BASE	0x11a00000
++#define TS72XX_PC104_8BIT_MEM_SIZE	0x00100000
++
++#define TS72XX_PC104_16BIT_IO_VIRT_BASE		0xfebef000
++#define TS72XX_PC104_16BIT_IO_PHYS_BASE		0x21e00000
++#define TS72XX_PC104_16BIT_IO_SIZE		0x00001000
++#define TS72XX_PC104_16BIT_MEM_VIRT_BASE	0xfe900000
++#define TS72XX_PC104_16BIT_MEM_PHYS_BASE	0x21a00000
++#define TS72XX_PC104_16BIT_MEM_SIZE		0x00100000
++
++/*
++ * TS7200 specific : CompactFlash memory map
++ *
++ * phys		size	description
++ * 11000000	7	CF registers (8-bit each), starting at 11000001
++ * 10400006	2	CF aux registers (8-bit)
++ * 21000000	2	CF data register (16-bit)
++ */
++#define TS7200_CF_CMD_PHYS_BASE		0x11000000
++#define TS7200_CF_AUX_PHYS_BASE		0x10400006
++#define TS7200_CF_DATA_PHYS_BASE	0x21000000
++
++/*
++ * TS7260 specific : SD card & Power Management
++ *
++ * phys		size	description
++ * 12000000	4K	Power management register (8-bit)
++ * 13000000	4K	SD card registers (4 x 8-bit)
++ */
++#define TS7260_POWER_MANAGEMENT_PHYS_BASE	0x12000000
++#define 	TS7260_PM_RS232_LEVEL_CONVERTER	0x01
++#define 	TS7260_PM_USB			0x02
++#define 	TS7260_PM_LCD			0x04
++#define 	TS7260_PM_5V_SWITCHER		0x08
++#define 	TS7260_PM_PC104_CLOCK		0x10
++#define 	TS7260_PM_PC104_FAST_STROBES	0x20
++#define 	TS7260_PM_TTL_UART_ENABLE	0x40
++#define 	TS7260_PM_SCRATCH_BIT		0x80
++
++#define TS7260_SDCARD_PHYS_BASE		0x13000000
++
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
+ }
++
++/* User jumper */
++static inline int is_jp6_set(void)
++{
++	return (__raw_readb(TS72XX_OPTIONS2_VIRT_BASE) & 0x1);
++}
++
+ #endif
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index fac1ec7..37325c4 100644
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
+@@ -186,6 +218,9 @@ static struct platform_device ts72xx_wdt_device =3D =
{
+ 	.resource	=3D ts72xx_wdt_resources,
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
+@@ -198,6 +233,9 @@ static void __init ts72xx_init_machine(void)
+ 	platform_device_register(&ts72xx_wdt_device);
+=20
+ 	ep93xx_register_eth(&ts72xx_eth_data, 1);
++
++	/* PWM1 is DIO_6 on TS-72xx header */
++	ep93xx_register_pwm(0, 1);
+ }
+=20
+ MACHINE_START(TS72XX, "Technologic Systems TS-72xx SBC")
+diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
+index 8be8199..a4f123d 100644
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
+@@ -398,6 +398,9 @@ __arm920_setup:
+ 	mrc	p15, 0, r0, c1, c0		@ get control register v4
+ 	bic	r0, r0, r5
+ 	orr	r0, r0, r6
++#ifdef CONFIG_CR1_NFBIT
++        orr     r0, r0, #0x40000000             @ set nF
++#endif
+ 	mov	pc, lr
+ 	.size	__arm920_setup, . - __arm920_setup
+=20
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0002-ts72xx_force_machine-=
id.patch b/recipes/linux/linux-2.6.34/ts72xx/0002-ts72xx_force_machine-id=
.patch
new file mode 100644
index 0000000..e59bb4e
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0002-ts72xx_force_machine-id.patc=
h
@@ -0,0 +1,45 @@
+From 453060da6afa4c32d2e2704e69ad32f200d4d240 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Thu, 10 Jun 2010 10:51:39 +0200
+Subject: [PATCH 02/18] ts72xx_force_machine-id
+
+---
+ arch/arm/kernel/head.S       |    3 +++
+ arch/arm/mach-ep93xx/Kconfig |    7 +++++++
+ 2 files changed, 10 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
+index eb62bf9..543eccf 100644
+--- a/arch/arm/kernel/head.S
++++ b/arch/arm/kernel/head.S
+@@ -82,6 +82,9 @@ ENTRY(stext)
+ 	bl	__lookup_processor_type		@ r5=3Dprocinfo r9=3Dcpuid
+ 	movs	r10, r5				@ invalid processor (r5=3D0)?
+ 	beq	__error_p			@ yes, error 'p'
++#ifdef CONFIG_MACH_TS72XX_FORCE_MACHINEID
++	ldr	r1, =3D0x2a1
++#endif
+ 	bl	__lookup_machine_type		@ r5=3Dmachinfo
+ 	movs	r8, r5				@ invalid machine (r5=3D0)?
+ 	beq	__error_a			@ yes, error 'a'
+diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
+index b6be37e..bd463a0 100644
+--- a/arch/arm/mach-ep93xx/Kconfig
++++ b/arch/arm/mach-ep93xx/Kconfig
+@@ -205,6 +205,13 @@ config EP93XX_EARLY_UART3
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
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0003-ep93xx_cpuinfo.patch =
b/recipes/linux/linux-2.6.34/ts72xx/0003-ep93xx_cpuinfo.patch
new file mode 100644
index 0000000..83519d6
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0003-ep93xx_cpuinfo.patch
@@ -0,0 +1,32 @@
+From cbb613e31ddb5f27e7bffa95be458c260fa4de11 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Thu, 10 Jun 2010 10:59:31 +0200
+Subject: [PATCH 03/18] ep93xx_cpuinfo
+
+---
+ arch/arm/kernel/setup.c |    9 +++++++++
+ 1 files changed, 9 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
+index c91c77b..867387c 100644
+--- a/arch/arm/kernel/setup.c
++++ b/arch/arm/kernel/setup.c
+@@ -844,6 +844,15 @@ static int c_show(struct seq_file *m, void *v)
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
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0004-ep93xx_eth.patch b/re=
cipes/linux/linux-2.6.34/ts72xx/0004-ep93xx_eth.patch
new file mode 100644
index 0000000..4e3caf4
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0004-ep93xx_eth.patch
@@ -0,0 +1,551 @@
+From 9f020e91022926d1fe36b8a6e28b16bcca2d37e5 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Thu, 10 Jun 2010 13:34:14 +0200
+Subject: [PATCH 04/18] ep93xx_eth
+
+---
+ drivers/net/arm/Kconfig      |    1 +
+ drivers/net/arm/ep93xx_eth.c |  346 ++++++++++++++++++++++++++++++++++-=
-------
+ 2 files changed, 280 insertions(+), 67 deletions(-)
+
+diff --git a/drivers/net/arm/Kconfig b/drivers/net/arm/Kconfig
+index 39e1c0d..55c0dd4 100644
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
+index cd17d09..d18824b 100644
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
+@@ -16,6 +17,7 @@
+ #include <linux/kernel.h>
+ #include <linux/netdevice.h>
+ #include <linux/mii.h>
++#include <linux/phy.h>
+ #include <linux/etherdevice.h>
+ #include <linux/ethtool.h>
+ #include <linux/init.h>
+@@ -27,8 +29,8 @@
+=20
+ #include <mach/hardware.h>
+=20
+-#define DRV_MODULE_NAME		"ep93xx-eth"
+-#define DRV_MODULE_VERSION	"0.1"
++#define DRV_NAME		"ep93xx-eth"
++#define DRV_VERSION		"0.13"
+=20
+ #define RX_QUEUE_ENTRIES	64
+ #define TX_QUEUE_ENTRIES	8
+@@ -40,6 +42,8 @@
+ #define  REG_RXCTL_DEFAULT	0x00073800
+ #define REG_TXCTL		0x0004
+ #define  REG_TXCTL_ENABLE	0x00000001
++#define REG_TESTCTL		0x0008
++#define  REG_TESTCTL_MFDX	0x00000040
+ #define REG_MIICMD		0x0010
+ #define  REG_MIICMD_READ	0x00008000
+ #define  REG_MIICMD_WRITE	0x00004000
+@@ -48,6 +52,9 @@
+ #define  REG_MIISTS_BUSY	0x00000001
+ #define REG_SELFCTL		0x0020
+ #define  REG_SELFCTL_RESET	0x00000001
++#define  REG_SELFCTL_MDCDIV_MSK	0x00007e00
++#define  REG_SELFCTL_MDCDIV_OFS	9
++#define  REG_SELFCTL_PSPRS	0x00000100
+ #define REG_INTEN		0x0024
+ #define  REG_INTEN_TX		0x00000008
+ #define  REG_INTEN_RX		0x00000007
+@@ -177,8 +184,14 @@ struct ep93xx_priv
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
+@@ -188,46 +201,78 @@ struct ep93xx_priv
+ #define wrw(ep, off, val)	__raw_writew((val), (ep)->base_addr + (off))
+ #define wrl(ep, off, val)	__raw_writel((val), (ep)->base_addr + (off))
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
+-		pr_info("mdio read timed out\n");
+-		data =3D 0xffff;
+-	} else {
+-		data =3D rdl(ep, REG_MIIDATA);
+-	}
++	return 0;
++}
++
++static int ep93xx_mdio_read(struct mii_bus *bus, int mii_id, int reg)
++{
++	struct ep93xx_priv *ep =3D bus->priv;
++	u32 selfctl;
++	u32 data;
++
++	if (ep93xx_mdio_wait(bus) < 0)
++		return -ETIMEDOUT;
++
++	selfctl =3D rdl(ep, REG_SELFCTL);
+=20
+-	return data;
++	if (ep->phy_supports_mfps)
++		wrl(ep, REG_SELFCTL, selfctl | REG_SELFCTL_PSPRS);
++	else
++		wrl(ep, REG_SELFCTL, selfctl & ~REG_SELFCTL_PSPRS);
++
++	wrl(ep, REG_MIICMD, REG_MIICMD_READ | (mii_id << 5) | reg);
++
++	if (ep93xx_mdio_wait(bus) < 0)
++		return -ETIMEDOUT;
++
++	data =3D  rdl(ep, REG_MIIDATA);
++
++	wrl(ep, REG_SELFCTL, selfctl);
++
++ 	return data;
+ }
+=20
+-static void ep93xx_mdio_write(struct net_device *dev, int phy_id, int r=
eg, int data)
++static int ep93xx_mdio_write(struct mii_bus *bus, int mii_id, int reg, =
u16 data)
+ {
+-	struct ep93xx_priv *ep =3D netdev_priv(dev);
+-	int i;
++	struct ep93xx_priv *ep =3D bus->priv;
++	u32 selfctl;
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
+=20
+ 	wrl(ep, REG_MIIDATA, data);
+-	wrl(ep, REG_MIICMD, REG_MIICMD_WRITE | (phy_id << 5) | reg);
++	wrl(ep, REG_MIICMD, REG_MIICMD_WRITE | (mii_id << 5) | reg);
+=20
+-	for (i =3D 0; i < 10; i++) {
+-		if ((rdl(ep, REG_MIISTS) & REG_MIISTS_BUSY) =3D=3D 0)
+-			break;
+-		msleep(1);
+-	}
++	if (ep93xx_mdio_wait(bus) < 0)
++		return -ETIMEDOUT;
+=20
+-	if (i =3D=3D 10)
+-		pr_info("mdio write timed out\n");
++	wrl(ep, REG_SELFCTL, selfctl);
++
++	return 0;
+ }
+=20
+ static struct net_device_stats *ep93xx_get_stats(struct net_device *dev=
)
+@@ -559,6 +604,22 @@ err:
+ 	return 1;
+ }
+=20
++static int ep93xx_mdio_reset(struct mii_bus *bus)
++{
++	struct ep93xx_priv *ep =3D bus->priv;
++
++	u32 selfctl =3D rdl(ep, REG_SELFCTL);
++
++	selfctl &=3D ~(REG_SELFCTL_MDCDIV_MSK | REG_SELFCTL_PSPRS);
++
++	selfctl |=3D (ep->mdc_divisor - 1) << REG_SELFCTL_MDCDIV_OFS;
++	selfctl |=3D REG_SELFCTL_PSPRS;
++
++	wrl(ep, REG_SELFCTL, selfctl);
++
++	return 0;
++}
++
+ static int ep93xx_start_hw(struct net_device *dev)
+ {
+ 	struct ep93xx_priv *ep =3D netdev_priv(dev);
+@@ -577,11 +638,8 @@ static int ep93xx_start_hw(struct net_device *dev)
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
+@@ -690,6 +748,8 @@ static int ep93xx_open(struct net_device *dev)
+=20
+ 	wrl(ep, REG_GIINTMSK, REG_GIINTMSK_ENABLE);
+=20
++	phy_start(ep->phy_dev);
++
+ 	netif_start_queue(dev);
+=20
+ 	return 0;
+@@ -702,6 +762,9 @@ static int ep93xx_close(struct net_device *dev)
+ 	napi_disable(&ep->napi);
+ 	netif_stop_queue(dev);
+=20
++	if (ep->phy_dev)
++		phy_stop(ep->phy_dev);
++
+ 	wrl(ep, REG_GIINTMSK, 0);
+ 	free_irq(ep->irq, dev);
+ 	ep93xx_stop_hw(dev);
+@@ -713,47 +776,44 @@ static int ep93xx_close(struct net_device *dev)
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
+ static void ep93xx_get_drvinfo(struct net_device *dev, struct ethtool_d=
rvinfo *info)
+ {
+-	strcpy(info->driver, DRV_MODULE_NAME);
+-	strcpy(info->version, DRV_MODULE_VERSION);
++        strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
++        strlcpy(info->version, DRV_VERSION, sizeof(info->version));
++        strlcpy(info->bus_info, dev_name(dev->dev.parent), sizeof(info-=
>bus_info));
+ }
+=20
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
+@@ -815,6 +875,113 @@ static int ep93xx_eth_remove(struct platform_devic=
e *pdev)
+ 	return 0;
+ }
+=20
++static void ep93xx_adjust_link(struct net_device *dev)
++{
++	struct ep93xx_priv *ep =3D netdev_priv(dev);
++	struct phy_device *phydev =3D ep->phy_dev;
++
++	int status_change =3D 0;
++
++	if (phydev->link) {
++		if ((ep->speed !=3D phydev->speed) ||
++				(ep->duplex !=3D phydev->duplex)) {
++			/* speed and/or duplex state changed */
++			u32 testctl =3D rdl(ep, REG_TESTCTL);
++
++			if (DUPLEX_FULL =3D=3D phydev->duplex)
++				testctl |=3D REG_TESTCTL_MFDX;
++			else
++				testctl &=3D ~(REG_TESTCTL_MFDX);
++
++			wrl(ep, REG_TESTCTL, testctl);
++
++			ep->speed =3D phydev->speed;
++			ep->duplex =3D phydev->duplex;
++			status_change =3D 1;
++		}
++	}
++
++	/* test for online/offline link transition */
++	if (phydev->link !=3D ep->link) {
++		if (phydev->link) /* link went online */
++			netif_tx_schedule_all(dev);
++		else { /* link went offline */
++			ep->speed =3D 0;
++			ep->duplex =3D -1;
++		}
++		ep->link =3D phydev->link;
++
++		status_change =3D 1;
++	}
++
++	if (status_change)
++		phy_print_status(phydev);
++}
++
++static int ep93xx_mii_probe(struct net_device *dev, int phy_addr)
++{
++	struct ep93xx_priv *ep =3D netdev_priv(dev);
++	struct phy_device *phydev =3D NULL;
++	int val;
++
++	if (phy_addr >=3D 0 && phy_addr < PHY_MAX_ADDR)
++		phydev =3D ep->mii_bus.phy_map[phy_addr];
++
++	if (!phydev) {
++		pr_info("PHY not found at specified address,"
++				" trying autodetection\n");
++
++		/* find the first phy */
++		for (phy_addr =3D 0; phy_addr < PHY_MAX_ADDR; phy_addr++) {
++			if (ep->mii_bus.phy_map[phy_addr]) {
++				phydev =3D ep->mii_bus.phy_map[phy_addr];
++				break;
++			}
++		}
++	}
++
++	if (!phydev) {
++		pr_err("no PHY found\n");
++		return -ENODEV;
++	}
++
++	phydev =3D phy_connect(dev, dev_name(&phydev->dev),
++			ep93xx_adjust_link, 0, PHY_INTERFACE_MODE_MII);
++
++	if (IS_ERR(phydev)) {
++		pr_err("Could not attach to PHY\n");
++		return PTR_ERR(phydev);
++	}
++
++	ep->phy_supports_mfps =3D 0;
++
++	val =3D phy_read(phydev, MII_BMSR);
++	if (val < 0) {
++		pr_err("failed to read MII register\n");
++		return val;
++	}
++
++	if (val & 0x0040) {
++		pr_info("PHY supports MII frame preamble suppression\n");
++		ep->phy_supports_mfps =3D 1;
++	}
++
++	phydev->supported &=3D PHY_BASIC_FEATURES;
++
++	phydev->advertising =3D phydev->supported;
++
++	ep->link =3D 0;
++	ep->speed =3D 0;
++	ep->duplex =3D -1;
++	ep->phy_dev =3D phydev;
++
++	pr_info("attached PHY driver [%s] "
++			"(mii_bus:phy_addr=3D%s, irq=3D%d)\n",
++			phydev->drv->name, dev_name(&phydev->dev), phydev->irq);
++
++	return 0;
++}
++
+ static int ep93xx_eth_probe(struct platform_device *pdev)
+ {
+ 	struct ep93xx_eth_data *data;
+@@ -822,7 +989,7 @@ static int ep93xx_eth_probe(struct platform_device *=
pdev)
+ 	struct ep93xx_priv *ep;
+ 	struct resource *mem;
+ 	int irq;
+-	int err;
++	int err, i;
+=20
+ 	if (pdev =3D=3D NULL)
+ 		return -ENODEV;
+@@ -849,24 +1016,43 @@ static int ep93xx_eth_probe(struct platform_devic=
e *pdev)
+ 	if (ep->res =3D=3D NULL) {
+ 		dev_err(&pdev->dev, "Could not reserve memory region\n");
+ 		err =3D -ENOMEM;
+-		goto err_out;
++		goto err_out_request_mem_region;
+ 	}
+=20
+ 	ep->base_addr =3D ioremap(mem->start, resource_size(mem));
+ 	if (ep->base_addr =3D=3D NULL) {
+ 		dev_err(&pdev->dev, "Failed to ioremap ethernet registers\n");
+ 		err =3D -EIO;
+-		goto err_out;
++		goto err_out_ioremap;
+ 	}
+ 	ep->irq =3D irq;
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
++	ep->phy_supports_mfps =3D 0;	/* probe without preamble suppression */
+=20
+ 	if (is_zero_ether_addr(dev->dev_addr))
+ 		random_ether_addr(dev->dev_addr);
+@@ -874,14 +1060,39 @@ static int ep93xx_eth_probe(struct platform_devic=
e *pdev)
+ 	err =3D register_netdev(dev);
+ 	if (err) {
+ 		dev_err(&pdev->dev, "Failed to register netdev\n");
+-		goto err_out;
++		goto err_out_register_netdev;
++	}
++
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
+ 	}
+=20
+-	printk(KERN_INFO "%s: ep93xx on-chip ethernet, IRQ %d, %pM\n",
+-			dev->name, ep->irq, dev->dev_addr);
++	dev_info(&dev->dev, "ep93xx on-chip ethernet, IRQ %d, %pM\n",
++			ep->irq, dev->dev_addr);
+=20
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
+@@ -899,7 +1110,6 @@ static struct platform_driver ep93xx_eth_driver =3D=
 {
+=20
+ static int __init ep93xx_eth_init_module(void)
+ {
+-	printk(KERN_INFO DRV_MODULE_NAME " version " DRV_MODULE_VERSION " load=
ing\n");
+ 	return platform_driver_register(&ep93xx_eth_driver);
+ }
+=20
+@@ -910,5 +1120,7 @@ static void __exit ep93xx_eth_cleanup_module(void)
+=20
+ module_init(ep93xx_eth_init_module);
+ module_exit(ep93xx_eth_cleanup_module);
++
+ MODULE_LICENSE("GPL");
+-MODULE_ALIAS("platform:ep93xx-eth");
++MODULE_DESCRIPTION("EP93XX Ethernet driver");
++MODULE_ALIAS("platform:" DRV_NAME);
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0005-ep93xx-m2m-DMA-suppor=
t.patch b/recipes/linux/linux-2.6.34/ts72xx/0005-ep93xx-m2m-DMA-support.p=
atch
new file mode 100644
index 0000000..5adc450
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0005-ep93xx-m2m-DMA-support.patch
@@ -0,0 +1,882 @@
+From 62a8847f18ac66120bf1dc07a497a4d74e099036 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Thu, 10 Jun 2010 16:40:16 +0200
+Subject: [PATCH 05/18] ep93xx: m2m DMA support
+
+---
+ arch/arm/mach-ep93xx/Makefile           |    2 +-
+ arch/arm/mach-ep93xx/dma-m2m.c          |  753 ++++++++++++++++++++++++=
+++++++
+ arch/arm/mach-ep93xx/include/mach/dma.h |   65 +++
+ 3 files changed, 819 insertions(+), 1 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/dma-m2m.c
+
+diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefi=
le
+index 33ee2c8..ea652c2 100644
+--- a/arch/arm/mach-ep93xx/Makefile
++++ b/arch/arm/mach-ep93xx/Makefile
+@@ -1,7 +1,7 @@
+ #
+ # Makefile for the linux kernel.
+ #
+-obj-y			:=3D core.o clock.o dma-m2p.o gpio.o
++obj-y			:=3D core.o clock.o dma-m2p.o dma-m2m.o gpio.o
+ obj-m			:=3D
+ obj-n			:=3D
+ obj-			:=3D
+diff --git a/arch/arm/mach-ep93xx/dma-m2m.c b/arch/arm/mach-ep93xx/dma-m=
2m.c
+new file mode 100644
+index 0000000..8b0d720
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/dma-m2m.c
+@@ -0,0 +1,753 @@
++/*
++ * arch/arm/mach-ep93xx/dma-m2m.c
++ * M2M DMA handling for Cirrus EP93xx chips.
++ * Copyright (C) 2007 Metasoft <prylowski@xxxxxxxxxxx>
++ *
++ * Based on dma-m2p.c by:
++ * Copyright (C) 2006 Lennert Buytenhek <buytenh@xxxxxxxxxxxxxx>
++ * Copyright (C) 2006 Applied Data Systems
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or (a=
t
++ * your option) any later version.
++ */
++
++#define pr_fmt(fmt) "ep93xx " KBUILD_MODNAME ": " fmt
++
++#include <linux/kernel.h>
++#include <linux/clk.h>
++#include <linux/err.h>
++#include <linux/interrupt.h>
++#include <linux/module.h>
++#include <linux/string.h>
++#include <linux/io.h>
++
++#include <mach/dma.h>
++#include <mach/hardware.h>
++
++/* TEMP */
++#define DPRINTK(fmt, args...)
++
++#define M2M_CONTROL	0x00
++#define M2M_INTERRUPT	0x04
++#define M2M_STATUS	0x0c
++#define M2M_BCR0	0x10
++#define M2M_BCR1	0x14
++#define M2M_SAR_BASE0	0x18
++#define M2M_SAR_BASE1	0x1c
++#define M2M_SAR_CURR0	0x24
++#define M2M_SAR_CURR1	0x28
++#define M2M_DAR_BASE0	0x2c
++#define M2M_DAR_BASE1	0x30
++#define M2M_DAR_CURR0	0x34
++#define M2M_DAR_CURR1	0x3c
++
++
++/* control register bits */
++#define CTRL_STALL_INT_EN	0x00000001	/* stall interrupt enable */
++#define CTRL_SCT		0x00000002	/* source copy transfer
++						   (1 elem. from source fills
++						   destination block */
++#define CTRL_DONE_INT_EN	0x00000004	/* done interrupt enable */
++#define CTRL_ENABLE		0x00000008	/* channel enable / disable,
++						   should be set after
++						   write to SAR/DAR/BCR
++						   registers */
++#define CTRL_NFB_INT_EN		0x00200000	/* nfb (next frame buffer)
++						   interrupt enable */
++
++
++#define CTRL_START		0x00000010	/* software triggered
++						   dma start, not used
++						   for M2P/P2M/IDE/SSP */
++#define CTRL_BWC_MASK		0x000001e0	/* bandwidth control (number
++						   of bytes in a block
++						   transfer, only M2M */
++#define CTRL_BWC_SHIFT		5
++
++#define BWC_FULL		0x0	/* full bandwidth utilized */
++#define BWC_16			0x1	/* 16 bytes per block */
++#define BWC_32			0x5
++#define BWC_64			0x6
++#define BWC_128			0x7
++#define BWC_256			0x8
++#define BWC_512			0x9
++#define BWC_1024		0xa
++#define BWC_2048		0xb
++#define BWC_4096		0xc
++#define BWC_8192		0xd
++#define BWC_16384		0xe
++#define BWC_32768		0xf
++
++#define CTRL_PW_MASK		0x00000600	/* peripheral width,
++						   only M2P/P2M */
++#define CTRL_PW_SHIFT		9
++
++#define PW_BYTE			0x0	/* one byte width */
++#define PW_HALFWORD		0x1	/* 16 bits */
++#define PW_WORD			0x2	/* 32 bits */
++#define PW_NOT_USED		0x3
++
++#define CTRL_DAH		0x00000800	/* destination address
++						   hold, for M2P */
++#define CTRL_SAH		0x00001000	/* source address
++						   hold, for P2M */
++#define CTRL_TM_MASK		0x00006000	/* transfer mode */
++#define CTRL_TM_SHIFT		13
++
++#define TM_M2M			0x0	/* software initiated M2M transfer */
++#define TM_M2P			0x1	/* memory to ext. peripheral
++					   or IDE/SSP */
++#define TM_P2M			0x2	/* ext. peripheral or IDE/SSP
++					   to memory */
++#define TM_NOT_USED		0x3
++
++#define CTRL_ETDP_MASK		0x00018000	/* end of transfer/terminal
++						   count pin direction
++						   & polarity */
++#define CTRL_ETDP_SHIFT		15
++
++#define ETDP_ACT_LOW_EOT	0x0	/* pin programmed as active
++					 * low end-of-transfer input */
++#define ETDP_ACT_HIGH_EOT	0x1	/* active high eot input */
++#define ETDP_ACT_LOW_TC		0x2	/* active low terminal count output */
++#define ETDP_ACT_HIGH_TC	0x3	/* active high tc output */
++
++#define CTRL_DACKP		0x00020000	/* dma acknowledge pin
++						   polarity */
++#define CTRL_DREQP_MASK		0x00180000	/* dma request pin polarity */
++#define CTRL_DREQP_SHIFT	19
++
++#define DREQP_ACT_LOW_LEVEL	0x0	/* DREQ is active low, level
++					   sensitive */
++#define DREQP_ACT_HIGH_LEVEL	0x1	/* active high, level sensitive */
++#define DREQP_ACT_LOW_EDGE	0x2	/* active low, edge sensitive */
++#define DREQP_ACT_HIGH_EDGE	0x3	/* active high, edge sensitive */
++
++
++#define CTRL_RSS_MASK		0x00c00000	/* request source selection */
++#define CTRL_RSS_SHIFT		22
++
++#define RSS_EXT			0x0	/* external dma request */
++#define RSS_SSP_RX		0x1	/* internal SSPRx */
++#define RSS_SSP_TX		0x2	/* internal SSPTx */
++#define RSS_IDE			0x3	/* internal IDE */
++
++#define CTRL_NO_HDSK		0x01000000	/* no handshake, required for
++						   SSP/IDE, optional for
++						   ext. M2P/P2M */
++
++/* interrupt register bits */
++#define INTR_STALL		0x1
++#define INTR_DONE		0x2
++#define INTR_NFB		0x4
++#define INTR_ALL		0x7
++
++/* status register bits */
++#define STAT_STALL		0x0001	/* waiting for software start
++					   or device request */
++#define STAT_CTL_STATE_MASK	0x000e	/* control fsm state */
++#define STAT_CTL_STATE_SHIFT	1
++
++#define CTL_STATE_IDLE		0x0
++#define CTL_STATE_STALL		0x1
++#define CTL_STATE_MEM_RD	0x2
++#define CTL_STATE_MEM_WR	0x3
++#define CTL_STATE_BWC_WAIT	0x4
++
++#define STAT_BUF_STATE_MASK	0x0030	/* buffer fsm state */
++#define STAT_BUF_STATE_SHIFT	4
++
++#define BUF_STATE_NO_BUF	0x0
++#define BUF_STATE_BUF_ON	0x1
++#define BUF_STATE_BUF_NEXT	0x2
++
++#define STAT_DONE		0x0040	/* transfer completed successfully
++					   (by device or BCR is 0) */
++
++#define STAT_TCS_MASK		0x0018	/* terminal count status */
++#define STAT_TCS_SHIFT		7
++
++#define TCS_NONE		0x0	/* terminal count not reached
++					   for buffer0 and buffer1 */
++#define TCS_BUF0		0x1	/* terminal count reached
++					   for buffer0 */
++#define TCS_BUF1		0x2
++#define TCS_BOTH		0x3	/* terminal count reached
++					   for both buffers */
++
++#define STAT_EOTS_MASK		0x0060	/* end of transfer status */
++#define STAT_EOTS_SHIFT		9
++
++#define EOTS_NONE		0x0	/* end of transfer has not been
++					   requested by ext. periph. for
+++					   any buffer */
++#define EOTS_BUF0		0x1	/* eot requested for buffer0 */
++#define EOTS_BUF1		0x2
++#define EOTS_BOTH		0x3	/* eot requested for both buffers */
++
++#define STAT_NFB		0x0800	/* next frame buffer interrupt */
++#define STAT_NB			0x1000	/* next buffer status, inform which
++					   buffer is free for update */
++#define STAT_DREQS		0x2000	/* status of dma request signal from
++					   ext. periph or IDE/SSP request */
++
++/* IDE/SSP support */
++#define IDE_UDMA_DATAOUT	0x20
++#define IDE_UDMA_DATAIN		0x24
++
++#ifndef SSPDR
++#define SSPDR			0x08
++#endif
++
++struct m2m_channel {
++	char				*name;
++	void __iomem			*base;
++	int				irq;
++
++	struct clk			*clk;
++	spinlock_t			lock;
++
++	void				*client;
++	unsigned			next_slot:1;
++	struct ep93xx_dma_buffer	*buffer_xfer;
++	struct ep93xx_dma_buffer	*buffer_next;
++	struct list_head		buffers_pending;
++};
++
++static struct m2m_channel m2m_rxtx[] =3D {
++	{"m2m0", EP93XX_DMA_BASE + 0x0100, IRQ_EP93XX_DMAM2M0},
++	{"m2m1", EP93XX_DMA_BASE + 0x0140, IRQ_EP93XX_DMAM2M1},
++	{NULL},
++};
++
++
++static void feed_buf(struct m2m_channel *ch, struct ep93xx_dma_buffer *=
buf)
++{
++	struct ep93xx_dma_m2m_client *cl =3D ch->client;
++	u32 src_addr, dst_addr;
++
++	if ((cl->flags & EP93XX_DMA_M2M_DIR_MASK) =3D=3D EP93XX_DMA_M2M_TX) {
++		src_addr =3D buf->bus_addr;
++		switch (cl->flags & EP93XX_DMA_M2M_DEV_MASK) {
++		case EP93XX_DMA_M2M_DEV_IDE:
++			dst_addr =3D EP93XX_IDE_PHYS_BASE + IDE_UDMA_DATAOUT;
++			break;
++		case EP93XX_DMA_M2M_DEV_SSP:
++			dst_addr =3D EP93XX_SPI_PHYS_BASE + SSPDR;
++			break;
++		default:
++			dst_addr =3D buf->bus_addr2;
++			break;
++		}
++	} else {
++		switch (cl->flags & EP93XX_DMA_M2M_DEV_MASK) {
++		case EP93XX_DMA_M2M_DEV_IDE:
++			src_addr =3D EP93XX_IDE_PHYS_BASE + IDE_UDMA_DATAIN;
++			break;
++		case EP93XX_DMA_M2M_DEV_SSP:
++			src_addr =3D EP93XX_SPI_PHYS_BASE + SSPDR;
++			break;
++		default:
++			src_addr =3D buf->bus_addr2;
++			break;
++		}
++		dst_addr =3D buf->bus_addr;
++	}
++
++	if (ch->next_slot =3D=3D 0) {
++		DPRINTK("Writing src_addr: %08x\n", src_addr);
++		DPRINTK("Writing dest_addr: %08x\n", dst_addr);
++		DPRINTK("Writing size: %08x\n", buf->size);
++		writel(src_addr, ch->base + M2M_SAR_BASE0);
++		writel(dst_addr, ch->base + M2M_DAR_BASE0);
++		writel(buf->size, ch->base + M2M_BCR0);
++	} else {
++		writel(src_addr, ch->base + M2M_SAR_BASE1);
++		writel(dst_addr, ch->base + M2M_DAR_BASE1);
++		writel(buf->size, ch->base + M2M_BCR1);
++	}
++	ch->next_slot ^=3D 1;
++	DPRINTK("data size =3D %d, slot %d\n", buf->size, ch->next_slot ^ 1);
++}
++
++static void choose_buffer_xfer(struct m2m_channel *ch)
++{
++	struct ep93xx_dma_buffer *buf;
++
++	ch->buffer_xfer =3D NULL;
++	if (!list_empty(&ch->buffers_pending)) {
++		buf =3D list_entry(ch->buffers_pending.next,
++				 struct ep93xx_dma_buffer, list);
++		list_del(&buf->list);
++		feed_buf(ch, buf);
++		ch->buffer_xfer =3D buf;
++	}
++}
++
++static void choose_buffer_next(struct m2m_channel *ch)
++{
++	struct ep93xx_dma_buffer *buf;
++
++	ch->buffer_next =3D NULL;
++	if (!list_empty(&ch->buffers_pending)) {
++		buf =3D list_entry(ch->buffers_pending.next,
++				 struct ep93xx_dma_buffer, list);
++		list_del(&buf->list);
++		feed_buf(ch, buf);
++		ch->buffer_next =3D buf;
++	}
++}
++
++static irqreturn_t m2m_irq(int irq, void *dev_id)
++{
++	struct m2m_channel *ch =3D dev_id;
++	struct ep93xx_dma_m2m_client *cl;
++	u32 irq_status, dma_state, buf_state, ctl_state;
++
++	spin_lock(&ch->lock);
++	irq_status =3D readl(ch->base + M2M_INTERRUPT);
++	/*if ((irq_status & INTR_ALL) =3D=3D 0) {
++		spin_unlock(&ch->lock);
++		return IRQ_NONE;
++		}*/
++	dma_state =3D readl(ch->base + M2M_STATUS);
++	cl =3D ch->client;
++
++	//printk("intr status: %08x, dma state: %08x\n", irq_status, dma_state=
);
++
++	DPRINTK("intr status %d, dma state %x\n",
++		irq_status, dma_state);
++
++	buf_state =3D (dma_state & STAT_BUF_STATE_MASK) >> STAT_BUF_STATE_SHIF=
T;
++	ctl_state =3D (dma_state & STAT_CTL_STATE_MASK) >> STAT_CTL_STATE_SHIF=
T;
++	/*printk("STAT_CTL_STATE: %d, STAT_BUF_STATE: %d\n",
++	 * ctl_state, buf_state);*/
++	if (ctl_state =3D=3D CTL_STATE_STALL &&
++	    buf_state =3D=3D BUF_STATE_NO_BUF &&
++	    dma_state & STAT_DONE) {
++	  /* transfer completed successfully (done) */
++
++
++	  /* send client the done command */
++	  if (cl->buffer_finished) {
++	    cl->buffer_finished(cl->cookie, ch->buffer_xfer, ch->buffer_xfer->=
size, 0);
++	  }
++
++	  writel(0, ch->base + M2M_INTERRUPT);
++	  choose_buffer_xfer(ch);
++	  choose_buffer_next(ch);
++	  if (ch->buffer_xfer !=3D NULL) {
++	    /* retrigger if more buffers exist */
++	    if ((cl->flags & EP93XX_DMA_M2M_DEV_MASK) =3D=3D
++		EP93XX_DMA_M2M_DEV_MEM) {
++	      DPRINTK("Writing start1 to M2M control\n");
++	      writel(readl(ch->base + M2M_CONTROL) |
++		     CTRL_START, ch->base + M2M_CONTROL);
++	      readl(ch->base + M2M_CONTROL);
++	    }
++	  } else {
++	    DPRINTK("DISABLING DMA: dreqs state: %d\n", dma_state & STAT_DREQS=
);
++
++	    writel(readl(ch->base + M2M_CONTROL)
++		   & ~CTRL_ENABLE, ch->base + M2M_CONTROL);
++	    readl(ch->base + M2M_CONTROL);
++	  }
++	} else if (ctl_state =3D=3D CTL_STATE_MEM_RD &&
++		   buf_state =3D=3D BUF_STATE_BUF_ON &&
++		   dma_state & STAT_NFB) {
++	  /* next frame buffer */
++	  if (cl->buffer_finished) {
++	    cl->buffer_finished(cl->cookie, ch->buffer_xfer, 0, 0);
++	  }
++	  ch->buffer_xfer =3D ch->buffer_next;
++	  choose_buffer_next(ch);
++	}
++
++	if (cl->buffer_started && ch->buffer_xfer !=3D NULL) {
++	  cl->buffer_started(cl->cookie, ch->buffer_xfer);
++	}
++
++	spin_unlock(&ch->lock);
++	return IRQ_HANDLED;
++}
++
++static struct m2m_channel *find_free_channel(struct ep93xx_dma_m2m_clie=
nt *cl, int channel_spec)
++{
++	struct m2m_channel *ch =3D m2m_rxtx;
++	int i;
++
++#if 0
++	/* BMS: This code isn't particularly clear; look like it asserts
++	 * that a requested channel must not share the same data direction
++	 * as a previously requested channel - which makes sense for the SSP,
++	 * but not at all for direct hardware transferrs
++	*/
++	for (i =3D 0; ch[i].base; i++) {
++		struct ep93xx_dma_m2m_client *cl2;
++
++		cl2 =3D ch[i].client;
++		if (cl2 !=3D NULL) {
++			int port;
++
++			/* two the same devices in the same direction
++	 are not allowed
++	 (two "memory devices" should be allowed) */
++			port =3D cl2->flags & (EP93XX_DMA_M2M_DEV_MASK |
++					EP93XX_DMA_M2M_DIR_MASK);
++			if (port =3D=3D (cl->flags & (EP93XX_DMA_M2M_DEV_MASK |
++							EP93XX_DMA_M2M_DIR_MASK)))
++				return NULL;
++		}
++	}
++#endif
++
++	if (channel_spec =3D=3D EP93XX_DMA_M2M_REQUIRES_CH_ANY) {
++		for (i =3D 0; ch[i].base; i++) {
++			if (ch[i].client =3D=3D NULL)
++				return ch + i;
++		}
++	} else if (channel_spec =3D=3D EP93XX_DMA_M2M_REQUIRES_CH_0) {
++		if (ch[0].client =3D=3D NULL) {
++			return &(ch[0]);
++		}
++	} else if (channel_spec =3D=3D EP93XX_DMA_M2M_REQUIRES_CH_1) {
++		if (ch[1].client =3D=3D NULL) {
++			return &(ch[1]);
++		}
++	} else {
++		printk(KERN_ERR "ep93xx-m2m dma channel request: unknown channel spec=
\n");
++	}
++	return NULL;
++}
++
++static u32 set_direction_reg(u32 outv, u32 flags)
++{
++	switch (flags & EP93XX_DMA_M2M_DEV_MASK) {
++		case EP93XX_DMA_M2M_DEV_EXT:
++			outv &=3D ~(CTRL_SAH | CTRL_DAH | CTRL_TM_MASK);
++
++			if (flags & EP93XX_DMA_M2M_EXT_FIFO)
++				outv |=3D (flags & EP93XX_DMA_M2M_DIR_MASK) =3D=3D
++					EP93XX_DMA_M2M_TX ? CTRL_DAH : CTRL_SAH;
++
++			outv |=3D (((flags & EP93XX_DMA_M2M_DIR_MASK) =3D=3D
++						EP93XX_DMA_M2M_TX) ? TM_M2P : TM_P2M) <<
++				CTRL_TM_SHIFT;
++
++			break;
++		case EP93XX_DMA_M2M_DEV_IDE:
++			outv &=3D ~(CTRL_SAH | CTRL_DAH | CTRL_TM_MASK | CTRL_PWSC_MASK);
++			if ((flags & EP93XX_DMA_M2M_DIR_MASK) =3D=3D EP93XX_DMA_M2M_TX) {
++				outv |=3D (2 << CTRL_PWSC_SHIFT) & CTRL_PWSC_MASK;
++				outv |=3D CTRL_DAH;
++				outv |=3D TM_M2P << CTRL_TM_SHIFT;
++			} else {
++				outv |=3D (1 << CTRL_PWSC_SHIFT) & CTRL_PWSC_MASK;
++				outv |=3D CTRL_SAH;
++				outv |=3D TM_P2M << CTRL_TM_SHIFT;
++			}
++			break;
++		case EP93XX_DMA_M2M_DEV_SSP:
++			outv &=3D ~(CTRL_SAH | CTRL_DAH | CTRL_TM_MASK | CTRL_RSS_MASK);
++			if ((flags & EP93XX_DMA_M2M_DIR_MASK) =3D=3D EP93XX_DMA_M2M_TX) {
++				outv |=3D TM_M2P << CTRL_TM_SHIFT;
++				outv |=3D CTRL_DAH;
++				outv |=3D RSS_SSP_TX << CTRL_RSS_SHIFT;
++			} else {
++				outv |=3D TM_P2M << CTRL_TM_SHIFT;
++				outv |=3D CTRL_SAH;
++				outv |=3D RSS_SSP_RX << CTRL_RSS_SHIFT;
++			}
++			break;
++		case EP93XX_DMA_M2M_DEV_MEM:
++			break;
++	}
++	return outv;
++}
++
++static void channel_enable(struct m2m_channel *ch)
++{
++	struct ep93xx_dma_m2m_client *cl =3D ch->client;
++	u32 outv =3D 0;
++
++	clk_enable(ch->clk);
++
++	/* set peripheral wait state mask - IFF specified in control word */
++	outv |=3D (cl->flags & CTRL_PWSC_MASK);
++	outv |=3D (cl->flags & EP93XX_DREQ_MASK);
++
++	DPRINTK("Set outv to: %08x\n",outv);
++
++	switch (cl->flags & EP93XX_DMA_M2M_DEV_MASK) {
++	case EP93XX_DMA_M2M_DEV_EXT:
++		switch (cl->flags & EP93XX_DMA_M2M_EXT_WIDTH_MASK) {
++		case EP93XX_DMA_M2M_EXT_WIDTH_BYTE:
++			outv |=3D PW_BYTE << CTRL_PW_SHIFT;
++			break;
++		case EP93XX_DMA_M2M_EXT_WIDTH_2BYTES:
++			outv |=3D PW_HALFWORD << CTRL_PW_SHIFT;
++			break;
++		case EP93XX_DMA_M2M_EXT_WIDTH_4BYTES:
++			outv |=3D PW_WORD << CTRL_PW_SHIFT;
++			break;
++		}
++		/* if NO_HDSK then PWSC, if not, then DREQ, DACK, TC/DEOT */
++		if (cl->flags & EP93XX_DMA_M2M_EXT_NO_HDSK) {
++			outv |=3D CTRL_NO_HDSK;
++			/* TODO: wait states */
++		} else {
++			/* TODO: regular handshaking */
++		}
++		outv |=3D RSS_EXT << CTRL_RSS_SHIFT;
++		break;
++	case EP93XX_DMA_M2M_DEV_IDE:
++		/* NO_HDSK, PWSC, PW, SAH, DAH */
++		outv |=3D CTRL_NO_HDSK;
++		outv |=3D PW_WORD << CTRL_PW_SHIFT;
++		/* PWSC =3D 1 for read, PWSC =3D 2 for write in UDMA */
++		outv |=3D RSS_IDE << CTRL_RSS_SHIFT;
++		break;
++	case EP93XX_DMA_M2M_DEV_SSP:
++		outv |=3D CTRL_NO_HDSK;
++		outv |=3D PW_HALFWORD << CTRL_PW_SHIFT;
++		outv |=3D (8 << CTRL_PWSC_SHIFT) & CTRL_PWSC_MASK;
++		break;
++	case EP93XX_DMA_M2M_DEV_MEM:
++		switch (cl->flags & EP93XX_DMA_M2M_MEM_SPEED_MASK) {
++		case EP93XX_DMA_M2M_MEM_SPEED_FULL:
++			outv |=3D BWC_FULL << CTRL_BWC_SHIFT;
++			break;
++		case EP93XX_DMA_M2M_MEM_SPEED_HALF:
++			outv |=3D BWC_32768 << CTRL_BWC_SHIFT;
++			break;
++		case EP93XX_DMA_M2M_MEM_SPEED_QUART:
++			outv |=3D BWC_16384 << CTRL_BWC_SHIFT;
++			break;
++		case EP93XX_DMA_M2M_MEM_SPEED_SLOW:
++			outv |=3D BWC_16 << CTRL_BWC_SHIFT;
++			break;
++		}
++		outv |=3D (cl->flags & EP93XX_DMA_M2M_MEM_FILL) ? CTRL_SCT : 0;
++		outv |=3D TM_M2M << CTRL_TM_SHIFT;
++		break;
++	}
++
++	// debug code
++	DPRINTK("PRE-Enable, status is: %08x\n", readl(ch->base+M2M_STATUS));
++
++	outv =3D set_direction_reg(outv, cl->flags);
++	/* STALL interrupt must be enabled */
++	outv |=3D CTRL_NFB_INT_EN | CTRL_DONE_INT_EN | CTRL_STALL_INT_EN;
++
++	writel(outv, ch->base + M2M_CONTROL);
++	outv =3D readl(ch->base + M2M_CONTROL);
++	DPRINTK("channel enable, writing control reg =3D %08x\n", outv);
++}
++
++static void channel_disable(struct m2m_channel *ch)
++{
++	u32 v;
++
++	DPRINTK("Disabling channel\n");
++	v =3D readl(ch->base + M2M_CONTROL);
++
++	writel(v & ~(CTRL_NFB_INT_EN | CTRL_DONE_INT_EN | CTRL_STALL_INT_EN),
++	       ch->base + M2M_CONTROL);
++
++	v =3D readl(ch->base + M2M_CONTROL);
++
++	while (readl(ch->base + M2M_STATUS) & STAT_NFB) {
++	  cpu_relax();
++	}
++
++	writel(0, ch->base + M2M_CONTROL);
++
++	v =3D readl(ch->base + M2M_CONTROL);
++
++	while (readl(ch->base + M2M_STATUS) & STAT_STALL) {
++	  cpu_relax();
++	}
++
++	clk_disable(ch->clk);
++}
++
++void ep93xx_dma_m2m_set_direction(struct ep93xx_dma_m2m_client *cl,
++		int direction)
++{
++	struct m2m_channel *ch =3D cl->channel;
++	u32 outv;
++	unsigned long flags;
++
++	direction &=3D EP93XX_DMA_M2M_DIR_MASK;
++
++	spin_lock_irqsave(&ch->lock, flags);
++
++	cl->flags &=3D ~EP93XX_DMA_M2M_DIR_MASK;
++	cl->flags |=3D direction;
++
++	outv =3D readl(ch->base + M2M_CONTROL);
++	outv =3D set_direction_reg(outv, cl->flags);
++	writel(outv, ch->base + M2M_CONTROL);
++	outv =3D readl(ch->base + M2M_CONTROL);
++	DPRINTK("set_direction: configured control reg =3D %08x\n", outv);
++
++	spin_unlock_irqrestore(&ch->lock, flags);
++}
++EXPORT_SYMBOL_GPL(ep93xx_dma_m2m_set_direction);
++
++int ep93xx_dma_m2m_client_register(struct ep93xx_dma_m2m_client *cl, in=
t channel_spec)
++{
++	struct m2m_channel *ch;
++	int err;
++
++	ch =3D find_free_channel(cl, channel_spec);
++	if (ch =3D=3D NULL)
++		return -1;
++
++	err =3D request_irq(ch->irq, m2m_irq, IRQF_DISABLED, cl->name ? : "dma=
-m2m", ch);
++	if (err)
++		return err;
++
++	ch->client =3D cl;
++	ch->next_slot =3D 0;
++	ch->buffer_xfer =3D NULL;
++	ch->buffer_next =3D NULL;
++	INIT_LIST_HEAD(&ch->buffers_pending);
++
++	cl->channel =3D ch;
++
++	channel_enable(ch);
++
++	return 0;
++}
++EXPORT_SYMBOL_GPL(ep93xx_dma_m2m_client_register);
++
++void ep93xx_dma_m2m_client_unregister(struct ep93xx_dma_m2m_client *cl)
++{
++	struct m2m_channel *ch =3D cl->channel;
++
++	channel_disable(ch);
++	free_irq(ch->irq, ch);
++	ch->client =3D NULL;
++}
++EXPORT_SYMBOL_GPL(ep93xx_dma_m2m_client_unregister);
++
++void ep93xx_dma_m2m_submit(struct ep93xx_dma_m2m_client *cl,
++		struct ep93xx_dma_buffer *buf)
++{
++	struct m2m_channel *ch =3D cl->channel;
++	unsigned long flags;
++
++	spin_lock_irqsave(&ch->lock, flags);
++
++	if (ch->buffer_xfer =3D=3D NULL) {
++		ch->buffer_xfer =3D buf;
++		feed_buf(ch, buf);
++		if (readl(ch->base + M2M_CONTROL) & CTRL_ENABLE) {
++		  DPRINTK("CTRL_ENABLE\n");
++			if ((cl->flags & EP93XX_DMA_M2M_DEV_MASK) =3D=3D
++			    EP93XX_DMA_M2M_DEV_MEM) {
++			  DPRINTK("WRITING START2 TO M2M control\n");
++				writel(readl(ch->base + M2M_CONTROL) |
++				       CTRL_START, ch->base + M2M_CONTROL);
++				readl(ch->base + M2M_CONTROL);
++			}
++		}
++	} else if (ch->buffer_next =3D=3D NULL) {
++		ch->buffer_next =3D buf;
++		feed_buf(ch, buf);
++	} else
++		list_add_tail(&buf->list, &ch->buffers_pending);
++	spin_unlock_irqrestore(&ch->lock, flags);
++}
++EXPORT_SYMBOL_GPL(ep93xx_dma_m2m_submit);
++
++void ep93xx_dma_m2m_start(struct ep93xx_dma_m2m_client *cl)
++{
++	struct m2m_channel *ch =3D cl->channel;
++	u32 v;
++
++	unsigned long flags;
++
++	spin_lock_irqsave(&ch->lock, flags);
++
++	writel(readl(ch->base + M2M_STATUS), ch->base+M2M_STATUS);
++	//printk("At start, status is: %08x\n", readl(ch->base + M2M_STATUS));
++
++	v =3D readl(ch->base + M2M_CONTROL) | CTRL_ENABLE;
++	writel(v, ch->base + M2M_CONTROL);
++	v =3D readl(ch->base + M2M_CONTROL);
++	if (ch->buffer_xfer !=3D NULL) {
++		if (((cl->flags & EP93XX_DMA_M2M_DEV_MASK) =3D=3D
++					EP93XX_DMA_M2M_DEV_MEM)) {
++			DPRINTK("WRITING START3 to M2M controller\n");
++			v |=3D CTRL_START;
++			writel(v, ch->base + M2M_CONTROL);
++			v =3D readl(ch->base + M2M_CONTROL);
++		}
++	}
++
++	spin_unlock_irqrestore(&ch->lock, flags);
++}
++EXPORT_SYMBOL_GPL(ep93xx_dma_m2m_start);
++
++void ep93xx_dma_m2m_stop(struct ep93xx_dma_m2m_client *cl)
++{
++	struct m2m_channel *ch =3D cl->channel;
++	u32 v;
++	unsigned long flags;
++
++	spin_lock_irqsave(&ch->lock, flags);
++
++	DPRINTK("Stopping DMA by disabling CTRL_ENABLE\n");
++	v =3D readl(ch->base + M2M_CONTROL) & ~CTRL_ENABLE;
++	writel(v, ch->base + M2M_CONTROL);
++	readl(ch->base + M2M_CONTROL);
++	DPRINTK("configured control reg =3D %08x\n", v);
++
++	spin_unlock_irqrestore(&ch->lock, flags);
++}
++EXPORT_SYMBOL_GPL(ep93xx_dma_m2m_stop);
++
++void ep93xx_dma_m2m_flush(struct ep93xx_dma_m2m_client *cl)
++{
++	struct m2m_channel *ch =3D cl->channel;
++
++	channel_disable(ch);
++	ch->next_slot =3D 0;
++	ch->buffer_xfer =3D NULL;
++	ch->buffer_next =3D NULL;
++	INIT_LIST_HEAD(&ch->buffers_pending);
++	channel_enable(ch);
++}
++EXPORT_SYMBOL_GPL(ep93xx_dma_m2m_flush);
++
++static int init_channel(struct m2m_channel *ch)
++{
++	ch->clk =3D clk_get(NULL, ch->name);
++	if (IS_ERR(ch->clk))
++		return PTR_ERR(ch->clk);
++
++	spin_lock_init(&ch->lock);
++	ch->client =3D NULL;
++
++	return 0;
++}
++
++static int __init ep93xx_dma_m2m_init(void)
++{
++	int i;
++	int ret;
++
++	for (i =3D 0; m2m_rxtx[i].base; i++) {
++		ret =3D init_channel(m2m_rxtx + i);
++		if (ret)
++			return ret;
++	}
++
++	pr_info("M2M DMA subsystem initialized\n");
++	return 0;
++}
++arch_initcall(ep93xx_dma_m2m_init);
+diff --git a/arch/arm/mach-ep93xx/include/mach/dma.h b/arch/arm/mach-ep9=
3xx/include/mach/dma.h
+index 3a5961d..6a3552b 100644
+--- a/arch/arm/mach-ep93xx/include/mach/dma.h
++++ b/arch/arm/mach-ep93xx/include/mach/dma.h
+@@ -11,6 +11,7 @@
+ struct ep93xx_dma_buffer {
+ 	struct list_head	list;
+ 	u32			bus_addr;
++	u32			bus_addr2; /* only used by M2M */
+ 	u16			size;
+ };
+=20
+@@ -28,6 +29,7 @@ struct ep93xx_dma_m2p_client {
+ 	void			*channel;
+ };
+=20
++/* flags (m2p client) */
+ #define EP93XX_DMA_M2P_PORT_I2S1	0x00
+ #define EP93XX_DMA_M2P_PORT_I2S2	0x01
+ #define EP93XX_DMA_M2P_PORT_AAC1	0x02
+@@ -45,6 +47,58 @@ struct ep93xx_dma_m2p_client {
+ #define EP93XX_DMA_M2P_IGNORE_ERROR	0x40
+ #define EP93XX_DMA_M2P_ERROR_MASK	0x60
+=20
++
++struct ep93xx_dma_m2m_client {
++	char			*name;
++	u32			flags;
++	void			*cookie;
++	void			(*buffer_started)(void *cookie,
++					struct ep93xx_dma_buffer *buf);
++	void			(*buffer_finished)(void *cookie,
++					struct ep93xx_dma_buffer *buf,
++					int bytes, int error);
++
++	/* Internal to the DMA code.  */
++	void			*channel;
++};
++
++/* flags (m2m client) */
++#define EP93XX_DMA_M2M_RX		0x000	/* read from periph./memory */
++#define EP93XX_DMA_M2M_TX		0x004	/* write to periph./memory */
++#define EP93XX_DMA_M2M_DIR_MASK		0x004	/* direction mask */
++#define EP93XX_DMA_M2M_DEV_EXT		0x000	/* external peripheral */
++#define EP93XX_DMA_M2M_DEV_SSP		0x001	/* internal SSP */
++#define EP93XX_DMA_M2M_DEV_IDE		0x002	/* internal IDE */
++#define EP93XX_DMA_M2M_DEV_MEM		0x003	/* memory to memory transfer */
++#define EP93XX_DMA_M2M_DEV_MASK		0x003   /* device mask */
++#define EP93XX_DMA_M2M_EXT_FIFO		0x008	/* external peripheral is one lo=
cation fifo */
++#define EP93XX_DMA_M2M_EXT_NO_HDSK	0x010	/* external peripheral doesn't=
 require regular handshaking protocol */
++#define EP93XX_DMA_M2M_EXT_WIDTH_MASK	0x300
++#define EP93XX_DMA_M2M_EXT_WIDTH_BYTE	0x000	/* external peripheral tran=
sfer is one byte width */
++#define EP93XX_DMA_M2M_EXT_WIDTH_2BYTES	0x100
++#define EP93XX_DMA_M2M_EXT_WIDTH_4BYTES	0x200
++#define EP93XX_DMA_M2M_MEM_SPEED_FULL	0x000	/* M2M bandwidth control */
++#define EP93XX_DMA_M2M_MEM_SPEED_HALF	0x040	/* half bus bandwidth */
++#define EP93XX_DMA_M2M_MEM_SPEED_QUART	0x080	/* quarter bus bandwidth *=
/
++#define EP93XX_DMA_M2M_MEM_SPEED_SLOW	0x0c0	/* slowest speed */
++#define EP93XX_DMA_M2M_MEM_SPEED_MASK	0x0c0   /* memory speed mask */
++#define EP93XX_DMA_M2M_MEM_FILL		0x020	/* M2M is one location to block =
fill */
++
++/* FIXME */
++#define CTRL_PWSC_MASK		0xfe000000	/* peripheral wait states count */
++#define CTRL_PWSC_SHIFT		25
++#define EP93XX_DREQ_SHIFT	19
++#define EP93XX_DREQ_MASK	0x00180000
++#define EP93XX_DMA_M2M_DREQ_LS_L	(00 << EP93XX_DREQ_SHIFT)
++#define EP93XX_DMA_M2M_DREQ_LS_H	(01 << EP93XX_DREQ_SHIFT)
++#define EP93XX_DMA_M2M_DREQ_ES_L	(10 << EP93XX_DREQ_SHIFT)
++#define EP93XX_DMA_M2M_DREQ_ES_H	(11 << EP93XX_DREQ_SHIFT)
++
++/* See ep93xx_dma_m2m_client_register (channel_spec) */
++#define EP93XX_DMA_M2M_REQUIRES_CH_ANY	0
++#define EP93XX_DMA_M2M_REQUIRES_CH_0	1
++#define EP93XX_DMA_M2M_REQUIRES_CH_1	2
++
+ int  ep93xx_dma_m2p_client_register(struct ep93xx_dma_m2p_client *m2p);
+ void ep93xx_dma_m2p_client_unregister(struct ep93xx_dma_m2p_client *m2p=
);
+ void ep93xx_dma_m2p_submit(struct ep93xx_dma_m2p_client *m2p,
+@@ -53,4 +107,15 @@ void ep93xx_dma_m2p_submit_recursive(struct ep93xx_d=
ma_m2p_client *m2p,
+ 				     struct ep93xx_dma_buffer *buf);
+ void ep93xx_dma_m2p_flush(struct ep93xx_dma_m2p_client *m2p);
+=20
++int  ep93xx_dma_m2m_client_register(struct ep93xx_dma_m2m_client *m2m,
++				    int channel_spec);
++void ep93xx_dma_m2m_client_unregister(struct ep93xx_dma_m2m_client *m2m=
);
++void ep93xx_dma_m2m_submit(struct ep93xx_dma_m2m_client *m2m,
++			   struct ep93xx_dma_buffer *buf);
++void ep93xx_dma_m2m_flush(struct ep93xx_dma_m2m_client *m2m);
++void ep93xx_dma_m2m_start(struct ep93xx_dma_m2m_client *m2m);
++void ep93xx_dma_m2m_stop(struct ep93xx_dma_m2m_client *m2m);
++void ep93xx_dma_m2m_set_direction(struct ep93xx_dma_m2m_client *m2m,
++				  int direction);
++
+ #endif /* __ASM_ARCH_DMA_H */
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0006-ts72xx_rs485.patch b/=
recipes/linux/linux-2.6.34/ts72xx/0006-ts72xx_rs485.patch
new file mode 100644
index 0000000..ae7fefe
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0006-ts72xx_rs485.patch
@@ -0,0 +1,218 @@
+From 6f231c654139e014473ccf0e79725dd313435c8c Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Thu, 10 Jun 2010 17:00:12 +0200
+Subject: [PATCH 06/18] ts72xx_rs485
+
+Crude hack...
+---
+ arch/arm/include/asm/ioctls.h |    3 +
+ drivers/serial/Kconfig        |    8 +++
+ drivers/serial/amba-pl010.c   |  124 ++++++++++++++++++++++++++++++++++=
++++++-
+ 3 files changed, 134 insertions(+), 1 deletions(-)
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
+index f55c494..e5702d1 100644
+--- a/drivers/serial/Kconfig
++++ b/drivers/serial/Kconfig
+@@ -304,6 +304,14 @@ config SERIAL_AMBA_PL010_CONSOLE
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
+index b09a638..a12922a 100644
+--- a/drivers/serial/amba-pl010.c
++++ b/drivers/serial/amba-pl010.c
+@@ -51,6 +51,10 @@
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
+@@ -65,6 +69,11 @@
+ #define UART_DUMMY_RSR_RX	256
+ #define UART_PORT_SIZE		64
+=20
++#if defined(CONFIG_SERIAL_AMBA_PL010_TS72XX)
++static void __iomem *ts_rs485_data9_register;
++static void __iomem *ts_rs485_control_register;
++#endif
++
+ /*
+  * We wrap our port structure around the generic uart_port.
+  */
+@@ -386,7 +395,7 @@ pl010_set_termios(struct uart_port *port, struct kte=
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
+@@ -534,6 +543,105 @@ static int pl010_verify_port(struct uart_port *por=
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
+@@ -552,6 +660,9 @@ static struct uart_ops amba_pl010_pops =3D {
+ 	.request_port	=3D pl010_request_port,
+ 	.config_port	=3D pl010_config_port,
+ 	.verify_port	=3D pl010_verify_port,
++#if defined(CONFIG_SERIAL_AMBA_PL010_TS72XX)
++	.ioctl		=3D pl010_ioctl,
++#endif
+ };
+=20
+ static struct uart_amba_port *amba_ports[UART_NR];
+@@ -810,6 +921,17 @@ static int __init pl010_init(void)
+ 	ret =3D uart_register_driver(&amba_reg);
+ 	if (ret =3D=3D 0) {
+ 		ret =3D amba_driver_register(&pl010_driver);
++
++		#if defined(CONFIG_SERIAL_AMBA_PL010_TS72XX)
++		if (!ret && is_rs485_installed()) {
++			ret =3D ts72xx_rs485_init();
++			if (ret)
++				printk("amba-pl010.c: ts72xx_rs485_init() failed\n");
++			else
++				printk("amba-pl010.c: auto RS485 mode initialized\n");
++		}
++		#endif
++
+ 		if (ret)
+ 			uart_unregister_driver(&amba_reg);
+ 	}
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0007-ts72xx_ts_ser1.patch =
b/recipes/linux/linux-2.6.34/ts72xx/0007-ts72xx_ts_ser1.patch
new file mode 100644
index 0000000..a6fab75
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0007-ts72xx_ts_ser1.patch
@@ -0,0 +1,259 @@
+From f5b0dc2b5e15d83cbc51404d2a754ea8ea8961b5 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Wed, 16 Jun 2010 14:44:44 +0200
+Subject: [PATCH 07/18] ts72xx_ts_ser1
+
+TS-SER1 - Serial Port PC/104 peripheral
+---
+ drivers/serial/8250_ts_ser1.c |  197 ++++++++++++++++++++++++++++++++++=
+++++++
+ drivers/serial/Kconfig        |   17 ++++
+ drivers/serial/Makefile       |    1 +
+ 3 files changed, 215 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/serial/8250_ts_ser1.c
+
+diff --git a/drivers/serial/8250_ts_ser1.c b/drivers/serial/8250_ts_ser1=
.c
+new file mode 100644
+index 0000000..e5fe616
+--- /dev/null
++++ b/drivers/serial/8250_ts_ser1.c
+@@ -0,0 +1,197 @@
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
++#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
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
++#define TS72XX_SER1_IO_PHYS_BASE	(TS72XX_PC104_8BIT_IO_PHYS_BASE)
++#define TS72XX_SER1_IO_SIZE		(TS72XX_PC104_8BIT_IO_SIZE)
++
++#define TS_SER1_PORT_COM3	0x3E8
++#define TS_SER1_PORT_COM4	0x2E8
++#define TS_SER1_PORT_COM5	0x3A8
++
++/* Value to write in 16550A scratch register */
++#define MARKER_BYTE 0xAA /* or 0x55 */
++
++#define PORT(_base,_irq)		\
++{					\
++	.iobase   =3D _base,		\
++	.membase  =3D (void __iomem *)0,	\
++	.irq      =3D _irq,		\
++	.uartclk  =3D 1843200,		\
++	.iotype   =3D UPIO_PORT,		\
++	.flags    =3D UPF_BOOT_AUTOCONF,	\
++}
++/* Note: IRQ can be shared (see CONFIG_SERIAL_8250_SHARE_IRQ) */
++
++
++static struct plat_serial8250_port ts72xx_ser1_data_com3[] =3D {
++	PORT(TS_SER1_PORT_COM3, 0),
++	{ },
++};
++
++static struct plat_serial8250_port ts72xx_ser1_data_com4[] =3D {
++	PORT(TS_SER1_PORT_COM4, 0),
++	{ },
++};
++
++static struct plat_serial8250_port ts72xx_ser1_data_com5[] =3D {
++	PORT(TS_SER1_PORT_COM5, 0),
++	{ },
++};
++
++
++static int ts_ser1_irq =3D CONFIG_SERIAL_8250_TS_SER1_IRQ; // 5, 6 or 7
++static struct platform_device *serial8250_ts_ser1_dev;
++
++
++static int __init ts_ser1_init(void)
++{
++	struct plat_serial8250_port *comX =3D NULL;
++	void __iomem *iomem;
++
++	int ret =3D -ENODEV;
++	int n =3D 0; // COM number as printed on TS-SER1 pcb
++
++	iomem =3D ioremap(TS72XX_SER1_IO_PHYS_BASE, TS72XX_SER1_IO_SIZE);
++
++	if (iomem !=3D NULL) {
++		__raw_writeb(MARKER_BYTE, iomem + TS_SER1_PORT_COM3 + 7);
++		if (__raw_readb(iomem + TS_SER1_PORT_COM3 + 7) =3D=3D MARKER_BYTE) {
++			comX =3D ts72xx_ser1_data_com3;
++			n =3D 3;
++		} else {
++			__raw_writeb(MARKER_BYTE, iomem + TS_SER1_PORT_COM4 + 7);
++			if (__raw_readb(iomem + TS_SER1_PORT_COM4 + 7) =3D=3D MARKER_BYTE) {
++				comX =3D ts72xx_ser1_data_com4;
++				n =3D 4;
++			} else {
++				__raw_writeb(MARKER_BYTE, iomem + TS_SER1_PORT_COM5 + 7);
++				if (__raw_readb(iomem + TS_SER1_PORT_COM5 + 7) =3D=3D MARKER_BYTE) =
{
++					comX =3D ts72xx_ser1_data_com5;
++					n =3D 5;
++				}
++			}
++		}
++
++		if (comX) {
++			switch (ts_ser1_irq) {
++				case 5:
++					ret =3D gpio_request(EP93XX_GPIO_LINE_F(3), "TS-SER1");
++					if (ret < 0) {
++						pr_err("gpio_request failed, try another irq\n");
++						goto init_error;
++					}
++					gpio_direction_input(EP93XX_GPIO_LINE_F(3));
++					comX->irq =3D gpio_to_irq(EP93XX_GPIO_LINE_F(3));
++					set_irq_type(comX->irq, IRQ_TYPE_EDGE_RISING);
++					break;
++				case 6:
++					comX->irq =3D IRQ_EP93XX_EXT1;
++					break;
++				case 7:
++					comX->irq =3D IRQ_EP93XX_EXT3;
++					break;
++				default:
++					pr_err("wrong specified irq\n");
++					goto init_error;
++			}
++
++			comX->iobase +=3D (unsigned long)iomem; // virtual address
++
++		} else {
++			pr_err("can't detect COM number\n");
++			goto init_error;
++		}
++
++		/* create platform_device structure */
++		serial8250_ts_ser1_dev =3D platform_device_alloc("serial8250", n);
++		if (!serial8250_ts_ser1_dev) {
++			ret =3D -ENOMEM;
++			goto init_error;
++		}
++
++                ret =3D platform_device_add_data(serial8250_ts_ser1_dev=
, comX,
++				2 * sizeof(struct plat_serial8250_port));
++		if (ret) {
++			platform_device_put(serial8250_ts_ser1_dev);
++			goto init_error;
++		}
++
++		ret =3D platform_device_add(serial8250_ts_ser1_dev);
++		if (ret) {
++			platform_device_put(serial8250_ts_ser1_dev);
++			goto init_error;
++		}
++
++		platform_set_drvdata(serial8250_ts_ser1_dev, iomem);
++		return 0;
++	}
++
++init_error:
++	if (iomem) {
++		iounmap(iomem);
++		iomem =3D NULL;
++	}
++	return ret;
++}
++
++static void __exit ts_ser1_exit(void)
++{
++	struct platform_device *pdev =3D serial8250_ts_ser1_dev;
++	void __iomem *iomem =3D platform_get_drvdata(pdev);
++
++	serial8250_ts_ser1_dev =3D NULL;
++
++	platform_device_unregister(pdev);
++
++	iounmap(iomem);
++	if (ts_ser1_irq =3D=3D 5)
++		gpio_free(EP93XX_GPIO_LINE_F(3));
++}
++
++module_init(ts_ser1_init);
++module_exit(ts_ser1_exit);
++
++module_param(ts_ser1_irq, int, 0);
++MODULE_PARM_DESC(ts_ser1_irq, "TS-SER1 IRQ, default=3D" __MODULE_STRING=
(CONFIG_SERIAL_8250_TS_SER1_IRQ) ")");
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("8250 serial probe module for TS-SER1 (TS-72xx)");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("0.5");
+diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
+index e5702d1..9f38fc5 100644
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
+index 6aa4723..a3b1cf2 100644
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
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0008-ts72xx_ts_eth100.patc=
h b/recipes/linux/linux-2.6.34/ts72xx/0008-ts72xx_ts_eth100.patch
new file mode 100644
index 0000000..75d5303
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0008-ts72xx_ts_eth100.patch
@@ -0,0 +1,273 @@
+From 9a9465369f2fdbd22b68e545b4744b8dca1608ff Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Fri, 18 Jun 2010 17:39:09 +0200
+Subject: [PATCH 08/18] ts72xx_ts_eth100
+
+TS-ETH100 - 10/100 Ethernet PC/104 peripheral
+---
+ drivers/net/Kconfig             |   10 ++
+ drivers/net/Makefile            |    1 +
+ drivers/net/ax88796.c           |    8 ++-
+ drivers/net/ax88796_ts_eth100.c |  190 ++++++++++++++++++++++++++++++++=
+++++++
+ 4 files changed, 208 insertions(+), 1 deletions(-)
+ create mode 100644 drivers/net/ax88796_ts_eth100.c
+
+diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
+index 7b832c7..f812332 100644
+--- a/drivers/net/Kconfig
++++ b/drivers/net/Kconfig
+@@ -248,6 +248,16 @@ config AX88796_93CX6
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
+index 12b280a..cb448fa 100644
+--- a/drivers/net/Makefile
++++ b/drivers/net/Makefile
+@@ -143,6 +143,7 @@ obj-$(CONFIG_B44) +=3D b44.o
+ obj-$(CONFIG_FORCEDETH) +=3D forcedeth.o
+ obj-$(CONFIG_NE_H8300) +=3D ne-h8300.o 8390.o
+ obj-$(CONFIG_AX88796) +=3D ax88796.o
++obj-$(CONFIG_AX88796_TS_ETH100) +=3D ax88796_ts_eth100.o
+ obj-$(CONFIG_BCM63XX_ENET) +=3D bcm63xx_enet.o
+=20
+ obj-$(CONFIG_TSI108_ETH) +=3D tsi108_eth.o
+diff --git a/drivers/net/ax88796.c b/drivers/net/ax88796.c
+index b718dc6..282fd8e 100644
+--- a/drivers/net/ax88796.c
++++ b/drivers/net/ax88796.c
+@@ -809,7 +809,9 @@ static int ax_remove(struct platform_device *_dev)
+ 	ax =3D to_ax_dev(dev);
+=20
+ 	unregister_netdev(dev);
+-	free_irq(dev->irq, dev);
++	if (ax->running) { // already freed in ax_close?
++		free_irq(dev->irq, dev);
++	}
+=20
+ 	iounmap(ei_status.mem);
+ 	release_resource(ax->mem);
+@@ -935,7 +937,11 @@ static int ax_probe(struct platform_device *pdev)
+ 			goto exit_mem2;
+ 		}
+=20
++		#if defined(CONFIG_AX88796_TS_ETH100) || defined(CONFIG_AX88796_TS_ET=
H100_MODULE)
++		ei_status.reg_offset[0x10] =3D ax->map2 - ei_status.mem + 0x10; /* do=
n't know why, but +0x20 works too */
++		#else
+ 		ei_status.reg_offset[0x1f] =3D ax->map2 - ei_status.mem;
++		#endif
+ 	}
+=20
+ 	/* got resources, now initialise and register device */
+diff --git a/drivers/net/ax88796_ts_eth100.c b/drivers/net/ax88796_ts_et=
h100.c
+new file mode 100644
+index 0000000..448b3e3
+--- /dev/null
++++ b/drivers/net/ax88796_ts_eth100.c
+@@ -0,0 +1,190 @@
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
++#define TS72XX_ETH100_IO8_PHYS_BASE	(TS72XX_PC104_8BIT_IO_PHYS_BASE)
++#define TS72XX_ETH100_IO8_SIZE		(TS72XX_PC104_8BIT_IO_SIZE)
++#define TS72XX_ETH100_IO16_PHYS_BASE	(TS72XX_PC104_16BIT_IO_PHYS_BASE)
++#define TS72XX_ETH100_IO16_SIZE		(TS72XX_PC104_16BIT_IO_SIZE)
++
++/* Technologic systems I/O space */
++#define TS_ETH100_PLD_0	0x100
++#define TS_ETH100_PLD_1	0x110
++#define TS_ETH100_PLD_2	0x120
++#define TS_ETH100_PLD_3	0x130
++
++/* NE2000 I/O space */
++#define TS_ETH100_MAC_0	0x200
++#define TS_ETH100_MAC_1	0x240
++#define TS_ETH100_MAC_2	0x300
++#define TS_ETH100_MAC_3	0x340
++
++/* Board identifier must be 5 ; PLD revision should be 1 */
++#define is_eth100_present(__iomem, __offset) \
++	(((__raw_readb(__iomem + __offset) & 0xF) =3D=3D 0x5) && \
++	 ((__raw_readb(__iomem + __offset + 4) & 0xF) =3D=3D 0x1))
++
++/* Jumpers status (SRAM control register) */
++#define read_irq(__iomem, __offset) \
++	(__raw_readb(__iomem + __offset + 8) & 0xE)
++
++
++static u32 offsets[0x20] =3D {
++	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
++	0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
++	0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
++	0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F
++};
++
++static struct ax_plat_data ts72xx_eth100_asix_data =3D {
++	.flags		=3D AXFLG_HAS_93CX6,
++	.wordlength	=3D 2,
++	.dcr_val	=3D 0x48,
++	.rcr_val	=3D 0x40,
++	.reg_offsets	=3D offsets,
++};
++
++static struct resource ts72xx_eth100_resource[] =3D {
++	[0] =3D {
++		.start	=3D TS72XX_ETH100_IO8_PHYS_BASE,
++		.end	=3D TS72XX_ETH100_IO8_PHYS_BASE + 0x40 - 1,
++		.flags	=3D IORESOURCE_MEM
++	},
++	[1] =3D { /* 0x10 is NE_DATAPORT is 16-bit access */
++		.start	=3D TS72XX_ETH100_IO16_PHYS_BASE,
++		.end	=3D TS72XX_ETH100_IO16_PHYS_BASE + 0x40 - 1,
++		.flags	=3D IORESOURCE_MEM
++	},
++	[2] =3D {
++		.start	=3D IRQ_EP93XX_EXT1,
++		.end	=3D IRQ_EP93XX_EXT1,
++		.flags	=3D IORESOURCE_IRQ
++	}
++};
++
++static int ts_eth100_irq; // 2 [IRQ 5], 4 [IRQ 6] or 8 [IRQ 7] (jumper =
configuration)
++
++
++static void ts72xx_eth100_release(struct device *dev)
++{
++	/* nothing to do (no kfree) because we have static struct */
++}
++
++static struct platform_device ts72xx_eth100_device_asix =3D {
++	.name	=3D "ax88796",
++	.id	=3D 0,
++	.num_resources	=3D ARRAY_SIZE(ts72xx_eth100_resource),
++	.resource	=3D ts72xx_eth100_resource,
++	.dev	=3D {
++		.platform_data	=3D &ts72xx_eth100_asix_data,
++		.release	=3D ts72xx_eth100_release,
++	}
++};
++
++static int __init ts_eth100_init(void)
++{
++	void __iomem *iomem;
++	struct platform_device *ethX =3D NULL;
++
++	iomem =3D ioremap(TS72XX_ETH100_IO8_PHYS_BASE, TS72XX_ETH100_IO8_SIZE)=
;
++	if (iomem !=3D NULL) {
++		ethX =3D &ts72xx_eth100_device_asix;
++
++		if (is_eth100_present(iomem, TS_ETH100_PLD_0)) {
++			ethX->resource[0].start +=3D TS_ETH100_MAC_0;
++			ethX->resource[0].end   +=3D TS_ETH100_MAC_0;
++			ethX->resource[1].start +=3D TS_ETH100_MAC_0;
++			ethX->resource[1].end   +=3D TS_ETH100_MAC_0;
++			ts_eth100_irq =3D read_irq(iomem, TS_ETH100_PLD_0);
++		} else if(is_eth100_present(iomem, TS_ETH100_PLD_1)) {
++			ethX->resource[0].start +=3D TS_ETH100_MAC_1;
++			ethX->resource[0].end   +=3D TS_ETH100_MAC_1;
++			ethX->resource[1].start +=3D TS_ETH100_MAC_1;
++			ethX->resource[1].end   +=3D TS_ETH100_MAC_1;
++			ts_eth100_irq =3D read_irq(iomem, TS_ETH100_PLD_1);
++		} else if(is_eth100_present(iomem, TS_ETH100_PLD_2)) {
++			ethX->resource[0].start +=3D TS_ETH100_MAC_2;
++			ethX->resource[0].end   +=3D TS_ETH100_MAC_2;
++			ethX->resource[1].start +=3D TS_ETH100_MAC_2;
++			ethX->resource[1].end   +=3D TS_ETH100_MAC_2;
++			ts_eth100_irq =3D read_irq(iomem, TS_ETH100_PLD_2);
++		} else if(is_eth100_present(iomem, TS_ETH100_PLD_3)) {
++			ethX->resource[0].start +=3D TS_ETH100_MAC_3;
++			ethX->resource[0].end   +=3D TS_ETH100_MAC_3;
++			ethX->resource[1].start +=3D TS_ETH100_MAC_3;
++			ethX->resource[1].end   +=3D TS_ETH100_MAC_3;
++			ts_eth100_irq =3D read_irq(iomem, TS_ETH100_PLD_3);
++		} else {
++			ethX =3D NULL;
++		}
++
++		/* Translate IRQ number */
++		if (ethX !=3D NULL) {
++			int ret, irq =3D 0;
++			switch (ts_eth100_irq) {
++				case 0x2: /* IRQ5 */
++					irq =3D gpio_to_irq(EP93XX_GPIO_LINE_F(3));
++					ret =3D gpio_request(irq, "TS-ETH100");
++					if (ret < 0) {
++						ethX =3D NULL;
++						goto init_error;
++					} else {
++						gpio_direction_input(irq);
++						set_irq_type(irq, IRQ_TYPE_EDGE_RISING);
++					}
++					break;
++				case 0x4: /* IRQ6 */
++					irq =3D  IRQ_EP93XX_EXT1;
++					break;
++				case 0x8: /* IRQ7 */
++				default:
++					irq =3D  IRQ_EP93XX_EXT3;
++			}
++			ethX->resource[2].start =3D irq;
++			ethX->resource[2].end   =3D irq;
++		}
++init_error:
++		iounmap(iomem);
++	}
++
++	return ((ethX =3D=3D NULL) ? -ENODEV :
++			platform_device_register(&ts72xx_eth100_device_asix));
++}
++
++
++static void __exit ts_eth100_exit(void)
++{
++	platform_device_unregister(&ts72xx_eth100_device_asix);
++	if (ts_eth100_irq =3D=3D 2)
++		gpio_free(EP93XX_GPIO_LINE_F(3));
++}
++
++module_init(ts_eth100_init);
++module_exit(ts_eth100_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("Asix 88796 ethernet probe module for TS-ETH100 (TS-=
72xx)");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("0.21");
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0009-ts72xx_pata.patch b/r=
ecipes/linux/linux-2.6.34/ts72xx/0009-ts72xx_pata.patch
new file mode 100644
index 0000000..1575e0e
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0009-ts72xx_pata.patch
@@ -0,0 +1,432 @@
+From 2500e39a54c9c37abbddd1ad552575b24420e1a8 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sat, 19 Jun 2010 11:25:31 +0200
+Subject: [PATCH 09/18] ts72xx_pata
+
+Support:
+TS-7200 - Compact flash
+TS-9600 - IDE interface PC/104 peripheral
+---
+ drivers/ata/Kconfig          |   20 +++++
+ drivers/ata/Makefile         |    3 +
+ drivers/ata/pata_ts7200_cf.c |   92 ++++++++++++++++++++++++
+ drivers/ata/pata_ts72xx.c    |  161 +++++++++++++++++++++++++++++++++++=
+++++++
+ drivers/ata/pata_ts9600.c    |   95 +++++++++++++++++++++++++
+ 5 files changed, 371 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/ata/pata_ts7200_cf.c
+ create mode 100644 drivers/ata/pata_ts72xx.c
+ create mode 100644 drivers/ata/pata_ts9600.c
+
+diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
+index 01c52c4..2d26789 100644
+--- a/drivers/ata/Kconfig
++++ b/drivers/ata/Kconfig
+@@ -799,5 +799,25 @@ config PATA_MACIO
+           different chipsets, though generally, MacIO is one of them.
+=20
+=20
++config PATA_TS72XX
++	bool "TS72XX ATA support"
++	depends on ARCH_EP93XX && MACH_TS72XX
++	help
++	  This option enables support for ATA devices on Technologic Systems S=
BC.
++
++config PATA_TS7200_CF
++	tristate "TS-7200 Compact Flash support"
++	depends on PATA_TS72XX
++	help
++	  This option enables support for the compact flash control on
++	  Technologic System TS-7200 SBC.
++
++config PATA_TS9600
++	tristate "TS-9600 IDE interface support"
++	depends on PATA_TS72XX && BLK_DEV_IDE_TS9600 !=3D y
++	help
++	  This option enables support for Technologic Systems TS-9600 PC/104 I=
DE interface.
++
+ endif # ATA_SFF
++
+ endif # ATA
+diff --git a/drivers/ata/Makefile b/drivers/ata/Makefile
+index fc936d4..183ce00 100644
+--- a/drivers/ata/Makefile
++++ b/drivers/ata/Makefile
+@@ -79,6 +79,9 @@ obj-$(CONFIG_PATA_PLATFORM)	+=3D pata_platform.o
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
+index 0000000..4126682
+--- /dev/null
++++ b/drivers/ata/pata_ts7200_cf.c
+@@ -0,0 +1,92 @@
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
++#define DRV_VERSION "0.21"
++
++
++static void pata_ts7200_cf_release(struct device *dev)
++{
++	/* nothing to do (no kfree) because we have static struct */
++}
++
++static struct resource ts7200_cf_resources[] =3D {
++	[0] =3D {
++		.start	=3D TS7200_CF_CMD_PHYS_BASE,
++		.end	=3D TS7200_CF_CMD_PHYS_BASE + 8,
++		.flags	=3D IORESOURCE_MEM,
++	},
++	[1] =3D {
++		.start	=3D TS7200_CF_AUX_PHYS_BASE,
++		.end	=3D TS7200_CF_AUX_PHYS_BASE + 1,
++		.flags	=3D IORESOURCE_MEM,
++	},
++	[2] =3D {
++		.start	=3D TS7200_CF_DATA_PHYS_BASE,
++		.end	=3D TS7200_CF_DATA_PHYS_BASE + 2,
++		.flags	=3D IORESOURCE_MEM,
++	},
++	[3] =3D {
++		.start	=3D IRQ_EP93XX_EXT0, /* pin 103 of EP9301 */
++		.end	=3D IRQ_EP93XX_EXT0,
++		.flags	=3D IORESOURCE_IRQ,
++	}
++};
++
++
++static struct platform_device ts7200_cf_device =3D {
++	.name	=3D "ts72xx-ide",
++	.id	=3D 0,
++	.dev	=3D {
++		.dma_mask =3D &ts7200_cf_device.dev.coherent_dma_mask,
++		.coherent_dma_mask =3D DMA_BIT_MASK(32),
++		.release	=3D pata_ts7200_cf_release,
++	},
++	.num_resources	=3D ARRAY_SIZE(ts7200_cf_resources),
++	.resource	=3D ts7200_cf_resources,
++};
++
++
++static __init int pata_ts7200_cf_init(void)
++{
++	return (board_is_ts7200()) ? \
++		platform_device_register(&ts7200_cf_device) : -ENODEV;
++}
++
++static __exit void pata_ts7200_cf_exit(void)
++{
++	platform_device_unregister(&ts7200_cf_device);
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
+index 0000000..d540029
+--- /dev/null
++++ b/drivers/ata/pata_ts72xx.c
+@@ -0,0 +1,161 @@
++/*
++ *  TS-72XX PATA driver for Technologic Systems boards.
++ *
++ *  Based on pata_platform.c by Paul Mundt &
++ *      Alessandro Zummo <a.zummo@towertech.it>
++ *  and old pata-ts72xx.c by Alessandro Zummo <a.zummo@towertech.it>
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
++	struct ata_device *dev;
++
++	ata_for_each_dev(dev, link, ENABLED) {
++		if (ata_dev_enabled(dev)) {
++			/* We don't really care */
++			dev->pio_mode =3D dev->xfer_mode =3D XFER_PIO_0;
++			dev->xfer_shift =3D ATA_SHIFT_PIO;
++			dev->flags |=3D ATA_DFLAG_PIO;
++			ata_dev_printk(dev, KERN_INFO, "configured for PIO\n");
++		}
++	}
++	return 0;
++}
++
++static struct scsi_host_template ts72xx_sht =3D {
++	ATA_PIO_SHT(DRV_NAME),
++};
++
++static struct ata_port_operations ts72xx_port_ops =3D {
++	.inherits	=3D &ata_sff_port_ops,
++	.set_mode	=3D ts72xx_set_mode,
++};
++
++static __devinit int ts72xx_pata_probe(struct platform_device *pdev)
++{
++	struct ata_host *host;
++	struct ata_port *ap;
++	int irq;
++
++	struct resource *pata_cmd  =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);
++	struct resource *pata_aux  =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 1);
++	struct resource *pata_data =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 2);
++
++	if (!pata_cmd || !pata_aux || !pata_data) {
++		dev_err(&pdev->dev, "missing resource(s)\n");
++		return -EINVAL;
++	}
++
++	irq =3D platform_get_irq(pdev, 0);
++	if (irq < 0)
++		irq =3D 0;  /* no irq */
++
++	/*
++	 * Now that that's out of the way, wire up the port
++	 */
++	host =3D ata_host_alloc(&pdev->dev, 1);
++	if (!host)
++		return -ENOMEM;
++	ap =3D host->ports[0];
++
++	ap->ops =3D &ts72xx_port_ops;
++	ap->pio_mask =3D 0x1f; /* PIO0-4 */
++	ap->flags |=3D ATA_FLAG_SLAVE_POSS;
++
++	/*
++	 * Use polling mode if there's no IRQ
++	 */
++	if (!irq) {
++		ap->flags |=3D ATA_FLAG_PIO_POLLING;
++		ata_port_desc(ap, "no IRQ, using PIO polling");
++	}
++
++	ap->ioaddr.cmd_addr =3D devm_ioremap(&pdev->dev, pata_cmd->start,
++			pata_cmd->end - pata_cmd->start + 1);
++	ap->ioaddr.ctl_addr =3D devm_ioremap(&pdev->dev, pata_aux->start,
++			pata_aux->end - pata_aux->start + 1);
++
++	if (!ap->ioaddr.cmd_addr || !ap->ioaddr.ctl_addr) {
++		dev_err(&pdev->dev, "failed to map IO/CTL base\n");
++		return -ENOMEM;
++	}
++
++	ap->ioaddr.altstatus_addr =3D ap->ioaddr.ctl_addr;
++
++	ata_sff_std_ports(&ap->ioaddr);
++	ap->ioaddr.data_addr =3D devm_ioremap(&pdev->dev, pata_data->start,
++			pata_data->end - pata_data->start + 1);
++
++	ata_port_desc(ap, "mmio cmd 0x%llx ctl 0x%llx",
++			(unsigned long long)pata_cmd->start,
++			(unsigned long long)pata_aux->start);
++
++	return ata_host_activate(host, irq, irq ? ata_sff_interrupt : NULL,
++			0 /* irq flags */, &ts72xx_sht);
++}
++
++static __devexit int ts72xx_pata_remove(struct platform_device *pdev)
++{
++	struct device *dev =3D &pdev->dev;
++	struct ata_host *host =3D dev_get_drvdata(dev);
++
++	ata_host_detach(host);
++
++	return 0;
++}
++
++static struct platform_driver ts72xx_pata_platform_driver =3D {
++	.probe	=3D ts72xx_pata_probe,
++	.remove	=3D __devexit_p(ts72xx_pata_remove),
++	.driver	=3D {
++		.name	=3D "ts72xx-ide",
++		.owner	=3D THIS_MODULE,
++	},
++};
++
++static int __init ts72xx_pata_init(void)
++{
++	return platform_driver_register(&ts72xx_pata_platform_driver);
++}
++
++static void __exit ts72xx_pata_exit(void)
++{
++	platform_driver_unregister(&ts72xx_pata_platform_driver);
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
+index 0000000..7a70550
+--- /dev/null
++++ b/drivers/ata/pata_ts9600.c
+@@ -0,0 +1,95 @@
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
++#define DRV_VERSION "0.21"
++
++#define TS9600_IDE_IO	(TS72XX_PC104_8BIT_IO_PHYS_BASE + 0x1F0)
++#define TS9600_IDE_DATA	(TS72XX_PC104_16BIT_IO_PHYS_BASE + 0x1F0)
++#define TS9600_IDE_IRQ	IRQ_EP93XX_EXT3  // IRQ7 (no other possibility f=
or arm)
++
++
++static void pata_ts9600_release(struct device *dev)
++{
++	/* nothing to do (no kfree) because we have static struct */
++}
++
++static struct resource ts9600_resources[] =3D {
++	[0] =3D {
++		.start	=3D TS9600_IDE_IO,
++		.end	=3D TS9600_IDE_IO + 8,
++		.flags	=3D IORESOURCE_MEM,
++	},
++	[1] =3D {
++		.start	=3D TS9600_IDE_IO + 0x206,
++		.end	=3D TS9600_IDE_IO + 0x206 + 1,
++		.flags	=3D IORESOURCE_MEM,
++	},
++	[2] =3D {
++		.start	=3D TS9600_IDE_DATA,
++		.end	=3D TS9600_IDE_DATA + 2,
++		.flags	=3D IORESOURCE_MEM,
++	},
++	[3] =3D {
++		.start	=3D TS9600_IDE_IRQ,
++		.end	=3D TS9600_IDE_IRQ,
++		.flags	=3D IORESOURCE_IRQ,
++	}
++};
++
++
++static struct platform_device ts9600_device =3D {
++	.name	=3D "ts72xx-ide",
++	.id	=3D 9600,
++	.dev	=3D {
++		.dma_mask =3D &ts9600_device.dev.coherent_dma_mask,
++		.coherent_dma_mask =3D DMA_BIT_MASK(32),
++		.release	=3D pata_ts9600_release,
++	},
++	.num_resources	=3D ARRAY_SIZE(ts9600_resources),
++	.resource	=3D ts9600_resources,
++};
++
++
++static __init int pata_ts9600_init(void)
++{
++	return platform_device_register(&ts9600_device);
++}
++
++static __exit void pata_ts9600_exit(void)
++{
++	platform_device_unregister(&ts9600_device);
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
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0010-ts72xx_gpio_i2c.patch=
 b/recipes/linux/linux-2.6.34/ts72xx/0010-ts72xx_gpio_i2c.patch
new file mode 100644
index 0000000..b984736
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0010-ts72xx_gpio_i2c.patch
@@ -0,0 +1,58 @@
+From 93e23786cb9a055fca63f4bdfdfaeff63bae745b Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sat, 19 Jun 2010 11:45:39 +0200
+Subject: [PATCH 10/18] ts72xx_gpio_i2c
+
+---
+ arch/arm/mach-ep93xx/ts72xx.c |   21 +++++++++++++++++++++
+ 1 files changed, 21 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index 37325c4..325b7af 100644
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
+@@ -225,6 +228,21 @@ static struct ep93xx_eth_data ts72xx_eth_data =3D {
+ 	.phy_id		=3D 1,
+ };
+=20
++/**********************************************************************=
***
++ * I2C (make access through TS-72XX "DIO" 2x8 header)
++ **********************************************************************=
***/
++static struct i2c_gpio_platform_data ts72xx_i2c_gpio_data =3D {
++	.sda_pin		=3D EP93XX_GPIO_LINE_EGPIO14, // DIO_6
++	.sda_is_open_drain	=3D 0,
++	.scl_pin		=3D EP93XX_GPIO_LINE_EGPIO15, // DIO_7
++	.scl_is_open_drain	=3D 0,
++	.udelay			=3D 0,	/* default is 100 kHz */
++	.timeout		=3D 0,	/* default is 100 ms */
++};
++
++static struct i2c_board_info __initdata ts72xx_i2c_board_info[] =3D {
++};
++
+ static void __init ts72xx_init_machine(void)
+ {
+ 	ep93xx_init_devices();
+@@ -233,6 +251,9 @@ static void __init ts72xx_init_machine(void)
+ 	platform_device_register(&ts72xx_wdt_device);
+=20
+ 	ep93xx_register_eth(&ts72xx_eth_data, 1);
++	ep93xx_register_i2c(&ts72xx_i2c_gpio_data,
++			ts72xx_i2c_board_info,
++			ARRAY_SIZE(ts72xx_i2c_board_info));
+=20
+ 	/* PWM1 is DIO_6 on TS-72xx header */
+ 	ep93xx_register_pwm(0, 1);
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0011-ts72xx_dio_keypad.pat=
ch b/recipes/linux/linux-2.6.34/ts72xx/0011-ts72xx_dio_keypad.patch
new file mode 100644
index 0000000..cced784
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0011-ts72xx_dio_keypad.patch
@@ -0,0 +1,306 @@
+From c1515f196bfc70cad5f9a755bf0038f190fd8c22 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sat, 19 Jun 2010 14:44:32 +0200
+Subject: [PATCH 11/18] ts72xx_dio_keypad
+
+Depends of "matrix-keypad" driver.
+---
+ drivers/input/keyboard/Kconfig          |   30 ++++++++
+ drivers/input/keyboard/Makefile         |    2 +
+ drivers/input/keyboard/ts72xx_dio_3x4.c |  110 ++++++++++++++++++++++++=
+++++
+ drivers/input/keyboard/ts72xx_dio_4x4.c |  115 ++++++++++++++++++++++++=
+++++++
+ 4 files changed, 257 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/input/keyboard/ts72xx_dio_3x4.c
+ create mode 100644 drivers/input/keyboard/ts72xx_dio_4x4.c
+
+diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kco=
nfig
+index 64c1023..4ca7d48 100644
+--- a/drivers/input/keyboard/Kconfig
++++ b/drivers/input/keyboard/Kconfig
+@@ -201,6 +201,36 @@ config KEYBOARD_MATRIX
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called matrix_keypad.
+=20
++if KEYBOARD_MATRIX
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
++endif # KEYBOARD_MATRIX
++
+ config KEYBOARD_HIL_OLD
+ 	tristate "HP HIL keyboard support (simple driver)"
+ 	depends on GSC || HP300
+diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Ma=
kefile
+index 706c6b5..f81f1c1 100644
+--- a/drivers/input/keyboard/Makefile
++++ b/drivers/input/keyboard/Makefile
+@@ -40,3 +40,5 @@ obj-$(CONFIG_KEYBOARD_TOSA)		+=3D tosakbd.o
+ obj-$(CONFIG_KEYBOARD_TWL4030)		+=3D twl4030_keypad.o
+ obj-$(CONFIG_KEYBOARD_XTKBD)		+=3D xtkbd.o
+ obj-$(CONFIG_KEYBOARD_W90P910)		+=3D w90p910_keypad.o
++obj-$(CONFIG_TS72XX_DIO_3X4_KEYPAD)	+=3D ts72xx_dio_3x4.o
++obj-$(CONFIG_TS72XX_DIO_4X4_KEYPAD)	+=3D ts72xx_dio_4x4.o
+diff --git a/drivers/input/keyboard/ts72xx_dio_3x4.c b/drivers/input/key=
board/ts72xx_dio_3x4.c
+new file mode 100644
+index 0000000..e214335
+--- /dev/null
++++ b/drivers/input/keyboard/ts72xx_dio_3x4.c
+@@ -0,0 +1,110 @@
++/*
++ *  TS-72xx (3x4) keypad device driver for DIO1 header (DIO_0 thru DIO_=
6)
++ *
++ * (c) Copyright 2010  Matthieu Crapet <mcrapet@gmail.com>
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
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/input/matrix_keypad.h>
++#include <mach/gpio.h>
++
++static const uint32_t ts72xx_kbd_keymap[] =3D {
++	KEY(0, 0, KEY_1),
++	KEY(0, 1, KEY_2),
++	KEY(0, 2, KEY_3),
++
++	KEY(1, 0, KEY_4),
++	KEY(1, 1, KEY_5),
++	KEY(1, 2, KEY_6),
++
++	KEY(2, 0, KEY_7),
++	KEY(2, 1, KEY_8),
++	KEY(2, 2, KEY_9),
++
++	KEY(3, 0, KEY_KPASTERISK),
++	KEY(3, 1, KEY_0),
++	KEY(3, 2, KEY_ENTER),
++};
++
++static struct matrix_keymap_data ts72xx_kbd_keymap_data =3D {
++	.keymap		=3D ts72xx_kbd_keymap,
++	.keymap_size	=3D ARRAY_SIZE(ts72xx_kbd_keymap),
++};
++
++static const int ts72xx_kbd_row_gpios[] =3D {
++	EP93XX_GPIO_LINE_EGPIO14,	// DIO_6 (row0)
++	EP93XX_GPIO_LINE_EGPIO13,
++	EP93XX_GPIO_LINE_EGPIO12,
++	EP93XX_GPIO_LINE_EGPIO11,
++};
++
++static const int ts72xx_kbd_col_gpios[] =3D {
++	EP93XX_GPIO_LINE_EGPIO10,	// DIO_2 (col0)
++	EP93XX_GPIO_LINE_EGPIO9,
++	EP93XX_GPIO_LINE_EGPIO8,
++};
++
++static struct matrix_keypad_platform_data ts72xx_kbd_pdata =3D {
++	.keymap_data		=3D &ts72xx_kbd_keymap_data,
++	.row_gpios		=3D ts72xx_kbd_row_gpios,
++	.col_gpios		=3D ts72xx_kbd_col_gpios,
++	.num_row_gpios		=3D ARRAY_SIZE(ts72xx_kbd_row_gpios),
++	.num_col_gpios		=3D ARRAY_SIZE(ts72xx_kbd_col_gpios),
++	.col_scan_delay_us	=3D 20,
++	.debounce_ms		=3D 20,
++	.wakeup			=3D 1,
++	.active_low		=3D 1,
++	//.no_autorep		=3D 1,
++};
++
++static void ts72xx_kbd_release(struct device *dev)
++{
++}
++
++static struct platform_device ts72xx_kbd_device =3D {
++	.name		=3D "matrix-keypad",
++	.id		=3D -1,
++	.dev		=3D {
++		.platform_data	=3D &ts72xx_kbd_pdata,
++		.release	=3D ts72xx_kbd_release,
++	},
++};
++
++static int __init ts72xx_dio_init(void)
++{
++	int i;
++
++	for (i =3D 0; i < ARRAY_SIZE(ts72xx_kbd_row_gpios); i++) {
++		int irq =3D gpio_to_irq(ts72xx_kbd_row_gpios[i]);
++
++		ep93xx_gpio_int_debounce(irq, 1);
++	}
++
++	return platform_device_register(&ts72xx_kbd_device);
++}
++
++static void __exit ts72xx_dio_exit(void)
++{
++	platform_device_unregister(&ts72xx_kbd_device);
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
+index 0000000..790abd5
+--- /dev/null
++++ b/drivers/input/keyboard/ts72xx_dio_4x4.c
+@@ -0,0 +1,115 @@
++/*
++ *  TS-72xx (4x4) keypad device driver for DIO1 header (DIO_0 thru DIO_=
7)
++ *
++ * (c) Copyright 2010  Matthieu Crapet <mcrapet@gmail.com>
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
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/input/matrix_keypad.h>
++#include <mach/gpio.h>
++
++static const uint32_t ts72xx_kbd_keymap[] =3D {
++	KEY(0, 0, KEY_7),
++	KEY(0, 1, KEY_8),
++	KEY(0, 2, KEY_9),
++	KEY(0, 3, KEY_F),
++
++	KEY(1, 0, KEY_4),
++	KEY(1, 1, KEY_5),
++	KEY(1, 2, KEY_6),
++	KEY(1, 3, KEY_E),
++
++	KEY(2, 0, KEY_1),
++	KEY(2, 1, KEY_2),
++	KEY(2, 2, KEY_3),
++	KEY(2, 3, KEY_D),
++
++	KEY(3, 0, KEY_A),
++	KEY(3, 1, KEY_0),
++	KEY(3, 2, KEY_B),
++	KEY(3, 3, KEY_C),
++};
++
++static struct matrix_keymap_data ts72xx_kbd_keymap_data =3D {
++	.keymap		=3D ts72xx_kbd_keymap,
++	.keymap_size	=3D ARRAY_SIZE(ts72xx_kbd_keymap),
++};
++
++static const int ts72xx_kbd_row_gpios[] =3D {
++	EP93XX_GPIO_LINE_EGPIO8,	// DIO_0 (row0)
++	EP93XX_GPIO_LINE_EGPIO9,
++	EP93XX_GPIO_LINE_EGPIO12,
++	EP93XX_GPIO_LINE_EGPIO14,
++};
++
++static const int ts72xx_kbd_col_gpios[] =3D {
++	EP93XX_GPIO_LINE_EGPIO15,	// DIO_7 (col0)
++	EP93XX_GPIO_LINE_EGPIO13,
++	EP93XX_GPIO_LINE_EGPIO11,
++	EP93XX_GPIO_LINE_EGPIO10,
++};
++
++static struct matrix_keypad_platform_data ts72xx_kbd_pdata =3D {
++	.keymap_data		=3D &ts72xx_kbd_keymap_data,
++	.row_gpios		=3D ts72xx_kbd_row_gpios,
++	.col_gpios		=3D ts72xx_kbd_col_gpios,
++	.num_row_gpios		=3D ARRAY_SIZE(ts72xx_kbd_row_gpios),
++	.num_col_gpios		=3D ARRAY_SIZE(ts72xx_kbd_col_gpios),
++	.col_scan_delay_us	=3D 20,
++	.debounce_ms		=3D 20,
++	.wakeup			=3D 1,
++	.active_low		=3D 1,
++	//.no_autorep		=3D 1,
++};
++
++static void ts72xx_kbd_release(struct device *dev)
++{
++}
++
++static struct platform_device ts72xx_kbd_device =3D {
++	.name		=3D "matrix-keypad",
++	.id		=3D -1,
++	.dev		=3D {
++		.platform_data	=3D &ts72xx_kbd_pdata,
++		.release	=3D ts72xx_kbd_release,
++	},
++};
++
++static int __init ts72xx_dio_init(void)
++{
++	int i;
++
++	for (i =3D 0; i < ARRAY_SIZE(ts72xx_kbd_row_gpios); i++) {
++		int irq =3D gpio_to_irq(ts72xx_kbd_row_gpios[i]);
++
++		ep93xx_gpio_int_debounce(irq, 1);
++	}
++
++	return platform_device_register(&ts72xx_kbd_device);
++}
++
++static void __exit ts72xx_dio_exit(void)
++{
++	platform_device_unregister(&ts72xx_kbd_device);
++}
++
++module_init(ts72xx_dio_init);
++module_exit(ts72xx_dio_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("Platform device 4x4 keypad");
++MODULE_LICENSE("GPL");
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0012-ts72xx_sbcinfo.patch =
b/recipes/linux/linux-2.6.34/ts72xx/0012-ts72xx_sbcinfo.patch
new file mode 100644
index 0000000..8a54f2c
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0012-ts72xx_sbcinfo.patch
@@ -0,0 +1,263 @@
+From b663f02d95027d89b42f57072adf6ea83adb78dd Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sat, 19 Jun 2010 15:08:58 +0200
+Subject: [PATCH 12/18] ts72xx_sbcinfo
+
+---
+ arch/arm/mach-ep93xx/Kconfig          |    7 +
+ arch/arm/mach-ep93xx/Makefile         |    1 +
+ arch/arm/mach-ep93xx/ts72xx.c         |    5 +
+ arch/arm/mach-ep93xx/ts72xx_sbcinfo.c |  198 ++++++++++++++++++++++++++=
+++++++
+ 4 files changed, 211 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/mach-ep93xx/ts72xx_sbcinfo.c
+
+diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
+index bd463a0..2bfb01e 100644
+--- a/arch/arm/mach-ep93xx/Kconfig
++++ b/arch/arm/mach-ep93xx/Kconfig
+@@ -212,6 +212,13 @@ config MACH_TS72XX_FORCE_MACHINEID
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
+index ea652c2..c38d1e2 100644
+--- a/arch/arm/mach-ep93xx/Makefile
++++ b/arch/arm/mach-ep93xx/Makefile
+@@ -13,3 +13,4 @@ obj-$(CONFIG_MACH_MICRO9)	+=3D micro9.o
+ obj-$(CONFIG_MACH_SIM_ONE)	+=3D simone.o
+ obj-$(CONFIG_MACH_SNAPPER_CL15)	+=3D snappercl15.o
+ obj-$(CONFIG_MACH_TS72XX)	+=3D ts72xx.o
++obj-$(CONFIG_MACH_TS72XX_SBCINFO)	+=3D ts72xx_sbcinfo.o
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index 325b7af..a46b370 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -35,6 +35,11 @@ static struct map_desc ts72xx_io_desc[] __initdata =3D=
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
+index 0000000..cbb485f
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/ts72xx_sbcinfo.c
+@@ -0,0 +1,198 @@
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
++	const char	*cpu_rev;
++	int		model, pld, wdt;
++	int		option_ad;
++	int		option_rs485;
++	unsigned char	jumpers[6]; // 0=3Doff,1=3Don,2=3Derror
++
++	/* Power management : TS-7260 only */
++	int		pm;
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
++	if (data->model =3D=3D 7200 || data->model =3D=3D 7250) {
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
++	p =3D ioremap(TS72XX_JUMPERS_MAX197_PHYS_BASE, SZ_4K - 1);
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
++	/* cpld watchdog */
++	p =3D ioremap(TS72XX_WDT_CONTROL_PHYS_BASE, SZ_4K - 1);
++	if (p) {
++		data->wdt =3D __raw_readb(p) & 0x7;
++		iounmap(p);
++	} else {
++		data->wdt =3D 8;
++	}
++
++	/* power management */
++	data->pm =3D -1;
++	if (data->model =3D=3D 7260) {
++		p =3D ioremap(TS7260_POWER_MANAGEMENT_PHYS_BASE, SZ_4K - 1);
++		if (p) {
++			data->pm =3D __raw_readb(p);
++			iounmap(p);
++		}
++	}
++}
++
++static char *get_pm_string(int reg, char *buffer, size_t size)
++{
++	static const char *pm_state =3D "rs232=3D%d usb=3D%d lcd=3D%d pc104=3D=
%d ttl=3D%d";
++
++	if (reg < 0) {
++		strncpy(buffer, "n/a", size);
++	} else {
++		/* 1 means on/enabled */
++		snprintf(buffer, size, pm_state,
++				reg & TS7260_PM_RS232_LEVEL_CONVERTER,
++				!!(reg & TS7260_PM_USB),
++				!!(reg & TS7260_PM_LCD),
++				!(reg & TS7260_PM_PC104_CLOCK),
++				!!(reg & TS7260_PM_TTL_UART_ENABLE));
++	}
++	return buffer;
++}
++
++static int ts72xx_sbcinfo_read_proc(char *buffer, char **start, off_t o=
ffset,
++		int count, int *eof, void *data)
++{
++	int len, size =3D count;
++	char *p =3D buffer;
++	char temp[64];
++	struct infos nfo;
++
++	static const char jpc[3] =3D { 'n', 'y', '?' };
++	static const char *wdt[9] =3D { "disabled", "250ms", "500ms", "1s", "r=
eserved", "2s", "4s", "8s", "n/a" };
++
++	get_sbcinfo(&nfo);
++	len =3D scnprintf(p, size,
++			"Model             : TS-%d (CPU rev %s) (PLD rev %c)\n"
++			"Option max197 A/D : %s\n"
++			"Option RS-485     : %s\n"
++			"Jumpers           : JP2=3D%c JP3=3D%c JP4=3D%c JP5=3D%c JP6=3D%c\n"
++			"CPLD Watchdog     : %s\n"
++			"Power management  : %s\n",
++			nfo.model, nfo.cpu_rev, nfo.pld + 0x40,
++			(nfo.option_ad ? "yes" : "no"),
++			(nfo.option_rs485 ? "yes" : "no"),
++			jpc[nfo.jumpers[1]], jpc[nfo.jumpers[2]], jpc[nfo.jumpers[3]], jpc[n=
fo.jumpers[4]],
++			jpc[nfo.jumpers[5]], wdt[nfo.wdt],
++			get_pm_string(nfo.pm, &temp[0], sizeof(temp)));
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
++}
++
++module_init(ts72xx_sbcinfo_init);
++module_exit(ts72xx_sbcinfo_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("Show information of Technologic Systems TS-72XX sbc=
");
++MODULE_LICENSE("GPL");
++MODULE_VERSION("1.04");
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0013-ts72xx_max197.patch b=
/recipes/linux/linux-2.6.34/ts72xx/0013-ts72xx_max197.patch
new file mode 100644
index 0000000..86f52a3
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0013-ts72xx_max197.patch
@@ -0,0 +1,347 @@
+From 93aa4fc5d32534422e80bbb7d1929f533c4ce65f Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sat, 19 Jun 2010 15:49:34 +0200
+Subject: [PATCH 13/18] ts72xx_max197
+
+---
+ arch/arm/mach-ep93xx/ts72xx.c |   30 +++++
+ drivers/misc/Kconfig          |   21 ++++
+ drivers/misc/Makefile         |    1 +
+ drivers/misc/ts72xx_max197.c  |  235 ++++++++++++++++++++++++++++++++++=
+++++++
+ 4 files changed, 287 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/misc/ts72xx_max197.c
+
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index a46b370..ba27d9d 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -227,6 +227,32 @@ static struct platform_device ts72xx_wdt_device =3D=
 {
+ };
+=20
+ /**********************************************************************=
***
++ * MAX197 (8 * 12-bit A/D converter) option
++ **********************************************************************=
***/
++static struct resource ts72xx_max197_resources[] =3D {
++	[0] =3D { /* sample/control register */
++		.start	=3D TS72XX_MAX197_SAMPLE_PHYS_BASE,
++		.end	=3D TS72XX_MAX197_SAMPLE_PHYS_BASE + SZ_4K - 1,
++		.flags	=3D IORESOURCE_MEM,
++	},
++	[1] =3D { /* busy bit */
++		.start	=3D TS72XX_JUMPERS_MAX197_PHYS_BASE,
++		.end	=3D TS72XX_JUMPERS_MAX197_PHYS_BASE + SZ_4K - 1,
++		.flags	=3D IORESOURCE_MEM,
++	}
++};
++
++static struct platform_device ts72xx_max197_device =3D {
++	.name		=3D "ts72xx-max197",
++	.id		=3D -1,
++	.dev		=3D {
++		.platform_data	=3D NULL,
++	},
++	.num_resources	=3D ARRAY_SIZE(ts72xx_max197_resources),
++	.resource	=3D ts72xx_max197_resources,
++};
++
++/**********************************************************************=
***
+  * Ethernet
+  **********************************************************************=
***/
+ static struct ep93xx_eth_data ts72xx_eth_data =3D {
+@@ -260,6 +286,10 @@ static void __init ts72xx_init_machine(void)
+ 			ts72xx_i2c_board_info,
+ 			ARRAY_SIZE(ts72xx_i2c_board_info));
+=20
++	if (is_max197_installed()) {
++		platform_device_register(&ts72xx_max197_device);
++	}
++
+ 	/* PWM1 is DIO_6 on TS-72xx header */
+ 	ep93xx_register_pwm(0, 1);
+ }
+diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
+index 0d0d625..45c4be8 100644
+--- a/drivers/misc/Kconfig
++++ b/drivers/misc/Kconfig
+@@ -332,4 +332,25 @@ source "drivers/misc/eeprom/Kconfig"
+ source "drivers/misc/cb710/Kconfig"
+ source "drivers/misc/iwmc3200top/Kconfig"
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
+index 7b6f7ee..388f636 100644
+--- a/drivers/misc/Makefile
++++ b/drivers/misc/Makefile
+@@ -23,6 +23,7 @@ obj-$(CONFIG_HP_ILO)		+=3D hpilo.o
+ obj-$(CONFIG_ISL29003)		+=3D isl29003.o
+ obj-$(CONFIG_SENSORS_TSL2550)	+=3D tsl2550.o
+ obj-$(CONFIG_EP93XX_PWM)	+=3D ep93xx_pwm.o
++obj-$(CONFIG_TS72XX_MAX197)	+=3D ts72xx_max197.o
+ obj-$(CONFIG_DS1682)		+=3D ds1682.o
+ obj-$(CONFIG_TI_DAC7512)	+=3D ti_dac7512.o
+ obj-$(CONFIG_C2PORT)		+=3D c2port/
+diff --git a/drivers/misc/ts72xx_max197.c b/drivers/misc/ts72xx_max197.c
+new file mode 100644
+index 0000000..4121ae5
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
++  return sprintf(buf, "%d.%03ld\n", val/1000, abs(val%1000));
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
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0014-ts7200_nor_flash.patc=
h b/recipes/linux/linux-2.6.34/ts72xx/0014-ts7200_nor_flash.patch
new file mode 100644
index 0000000..c76ad36
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0014-ts7200_nor_flash.patch
@@ -0,0 +1,176 @@
+From 116d99d9f45c30d3b1c80b54fed8bf406aa590f7 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sat, 19 Jun 2010 16:56:48 +0200
+Subject: [PATCH 14/18] ts7200_nor_flash
+
+Deal with 8mb or 16mb NOR Flash (TS-7200 only)
+---
+ drivers/mtd/maps/Kconfig        |   15 +++++
+ drivers/mtd/maps/Makefile       |    1 +
+ drivers/mtd/maps/ts7200_flash.c |  116 ++++++++++++++++++++++++++++++++=
+++++++
+ 3 files changed, 132 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/mtd/maps/ts7200_flash.c
+
+diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
+index aa2807d..5d12903 100644
+--- a/drivers/mtd/maps/Kconfig
++++ b/drivers/mtd/maps/Kconfig
+@@ -422,6 +422,21 @@ config MTD_H720X
+ 	  This enables access to the flash chips on the Hynix evaluation board=
s.
+ 	  If you have such a board, say 'Y'.
+=20
++config MTD_TS7200_NOR
++	tristate "CFI Flash device mapped on TS-7200"
++	depends on MTD_CFI && MACH_TS72XX
++	help
++	  This provides a map driver for the on-board flash of the Technologic
++	  System's TS-7200 board. The 8MB (or 16MB) flash is splitted into 3 p=
artitions
++	  which are accessed as separate MTD devices.
++
++config MTD_TS7200_NOR_SIZE
++	int "Flash size (8 or 16mb)"
++	depends on MTD_TS7200_NOR
++	default "8"
++	help
++	  Enter the NOR Flash size of your TS-7200 board. Can be 8 or 16.
++
+ # This needs CFI or JEDEC, depending on the cards found.
+ config MTD_PCI
+ 	tristate "PCI MTD driver"
+diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
+index bb035cd..775c2e7 100644
+--- a/drivers/mtd/maps/Makefile
++++ b/drivers/mtd/maps/Makefile
+@@ -56,6 +56,7 @@ obj-$(CONFIG_MTD_DMV182)	+=3D dmv182.o
+ obj-$(CONFIG_MTD_PLATRAM)	+=3D plat-ram.o
+ obj-$(CONFIG_MTD_INTEL_VR_NOR)	+=3D intel_vr_nor.o
+ obj-$(CONFIG_MTD_BFIN_ASYNC)	+=3D bfin-async-flash.o
++obj-$(CONFIG_MTD_TS7200_NOR)	+=3D ts7200_flash.o
+ obj-$(CONFIG_MTD_RBTX4939)	+=3D rbtx4939-flash.o
+ obj-$(CONFIG_MTD_VMU)		+=3D vmu-flash.o
+ obj-$(CONFIG_MTD_GPIO_ADDR)	+=3D gpio-addr-flash.o
+diff --git a/drivers/mtd/maps/ts7200_flash.c b/drivers/mtd/maps/ts7200_f=
lash.c
+new file mode 100644
+index 0000000..94fb4f4
+--- /dev/null
++++ b/drivers/mtd/maps/ts7200_flash.c
+@@ -0,0 +1,116 @@
++/*
++ * ts7200_flash.c - mapping for TS-7200 SBCs (8mb NOR flash)
++ * No platform_device resource is used here. All is hardcoded.
++ *
++ * (c) Copyright 2006-2010  Matthieu Crapet <mcrapet@gmail.com>
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
++#include <mach/ep93xx-regs.h>
++
++
++static struct mtd_info *mymtd;
++
++static struct map_info ts7200nor_map =3D {
++	.name		=3D "Full TS-7200 NOR flash",
++	.size		=3D 0,		/* filled in later */
++	.bankwidth	=3D 2,
++	.phys		=3D EP93XX_CS6_PHYS_BASE,
++};
++
++/*
++ * MTD partitioning stuff
++ */
++#ifdef CONFIG_MTD_PARTITIONS
++
++#define TS7200_BOOTROM_PART_SIZE	(SZ_128K)
++#define TS7200_REDBOOT_PART_SIZE	(15*SZ_128K)
++
++static struct mtd_partition ts7200_nor_parts[] =3D
++{
++	{
++		.name		=3D "TS-BOOTROM",
++		.offset		=3D 0,
++		.size		=3D TS7200_BOOTROM_PART_SIZE,
++		.mask_flags	=3D MTD_WRITEABLE,	/* force read-only */
++	},
++	{
++		.name		=3D "RootFS",
++		.offset		=3D MTDPART_OFS_APPEND,
++		.size		=3D 0,			/* filled in later */
++	},
++	{
++		.name		=3D "Redboot",
++		.offset		=3D MTDPART_OFS_APPEND,
++		.size		=3D MTDPART_SIZ_FULL,	/* up to the end */
++	}
++};
++#endif
++
++static int __init ts7200_nor_init(void)
++{
++	if (CONFIG_MTD_TS7200_NOR_SIZE <=3D 8)
++		ts7200nor_map.size =3D SZ_8M;
++	else
++		ts7200nor_map.size =3D SZ_16M;
++
++	printk(KERN_NOTICE "TS-7200 flash mapping: %ldmo at 0x%x\n",
++			ts7200nor_map.size / SZ_1M, ts7200nor_map.phys);
++
++	ts7200nor_map.virt =3D ioremap(ts7200nor_map.phys, ts7200nor_map.size =
- 1);
++	if (!ts7200nor_map.virt) {
++		printk("ts7200_flash: failed to ioremap\n");
++		return -EIO;
++	}
++
++	simple_map_init(&ts7200nor_map);
++	mymtd =3D do_map_probe("cfi_probe", &ts7200nor_map);
++	if (mymtd) {
++		mymtd->owner =3D THIS_MODULE;
++		add_mtd_device(mymtd);
++		#ifdef CONFIG_MTD_PARTITIONS
++		ts7200_nor_parts[1].size =3D ts7200nor_map.size - TS7200_REDBOOT_PART=
_SIZE;
++		return add_mtd_partitions(mymtd, ts7200_nor_parts, ARRAY_SIZE(ts7200_=
nor_parts));
++		#else
++		return 0;
++		#endif
++	}
++
++	iounmap(ts7200nor_map.virt);
++	return -ENXIO;
++}
++
++static void __exit ts7200_nor_exit(void)
++{
++	if (mymtd) {
++		del_mtd_device(mymtd);
++		map_destroy(mymtd);
++		mymtd =3D NULL;
++	}
++	if (ts7200nor_map.virt) {
++		iounmap(ts7200nor_map.virt);
++		ts7200nor_map.virt =3D 0;
++	}
++}
++
++module_init(ts7200_nor_init);
++module_exit(ts7200_nor_exit);
++
++MODULE_LICENSE("GPL");
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("MTD map driver for TS-7200 board");
++MODULE_VERSION("0.1");
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch b=
/recipes/linux/linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch
new file mode 100644
index 0000000..47eaa7a
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch
@@ -0,0 +1,3293 @@
+From 3da21c5a4384f9853fd75cb9fed204402072d280 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 20 Jun 2010 10:46:15 +0200
+Subject: [PATCH 15/18] ts72xx_sdcard
+
+SD Card support for TS-7260. Device name is "tssda".
+Patch based on work of Breton Saunders:
+http://tech.groups.yahoo.com/group/ts-7000/message/15787
+http://tech.groups.yahoo.com/group/ts-7000/message/16028
+---
+ arch/arm/mach-ep93xx/ts72xx.c |   24 +
+ drivers/block/Kconfig         |    7 +
+ drivers/block/Makefile        |    2 +
+ drivers/block/sdcore2.c       | 2391 ++++++++++++++++++++++++++++++++++=
+++++++
+ drivers/block/sdcore2.h       |  372 +++++++
+ drivers/block/tssdcard.c      |  415 +++++++
+ 6 files changed, 3211 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/block/sdcore2.c
+ create mode 100644 drivers/block/sdcore2.h
+ create mode 100644 drivers/block/tssdcard.c
+
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index ba27d9d..7fd8f80 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -178,6 +178,29 @@ static void __init ts72xx_register_flash(void)
+ }
+=20
+ /**********************************************************************=
***
++ * SD Card (TS-7260 only)
++ **********************************************************************=
***/
++
++static struct resource ts72xx_sdcard_resource =3D {
++	.start		=3D TS7260_SDCARD_PHYS_BASE,
++	.end		=3D TS7260_SDCARD_PHYS_BASE + 0x20,
++	.flags		=3D IORESOURCE_MEM,
++};
++
++static struct platform_device ts72xx_sdcard =3D {
++	.name		=3D "ts72xx-sdcard",
++	.id		=3D 0,
++	.num_resources	=3D 1,
++	.resource	=3D &ts72xx_sdcard_resource,
++};
++
++static void __init ts72xx_register_sdcard(void)
++{
++	if (board_is_ts7260())
++		platform_device_register(&ts72xx_sdcard);
++}
++
++/**********************************************************************=
***
+  * RTC
+  **********************************************************************=
***/
+ static unsigned char ts72xx_rtc_readbyte(unsigned long addr)
+@@ -278,6 +301,7 @@ static void __init ts72xx_init_machine(void)
+ {
+ 	ep93xx_init_devices();
+ 	ts72xx_register_flash();
++	ts72xx_register_sdcard();
+ 	platform_device_register(&ts72xx_rtc_device);
+ 	platform_device_register(&ts72xx_wdt_device);
+=20
+diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
+index 77bfce5..fc8fae5 100644
+--- a/drivers/block/Kconfig
++++ b/drivers/block/Kconfig
+@@ -488,4 +488,11 @@ config BLK_DEV_HD
+=20
+ 	  If unsure, say N.
+=20
++config BLK_DEV_TS72XX_SDCARD
++	tristate "TS-72XX SD Card support"
++	depends on ARCH_EP93XX && MACH_TS72XX
++	help
++	  This option enables support SD Card control on Technologic Systems
++	  TS-7260 SBC.
++
+ endif # BLK_DEV
+diff --git a/drivers/block/Makefile b/drivers/block/Makefile
+index aff5ac9..a4d0579 100644
+--- a/drivers/block/Makefile
++++ b/drivers/block/Makefile
+@@ -34,8 +34,10 @@ obj-$(CONFIG_VIODASD)		+=3D viodasd.o
+ obj-$(CONFIG_BLK_DEV_SX8)	+=3D sx8.o
+ obj-$(CONFIG_BLK_DEV_UB)	+=3D ub.o
+ obj-$(CONFIG_BLK_DEV_HD)	+=3D hd.o
++obj-$(CONFIG_BLK_DEV_TS72XX_SDCARD)	+=3D ts72xx_sdcard.o
+=20
+ obj-$(CONFIG_XEN_BLKDEV_FRONTEND)	+=3D xen-blkfront.o
+ obj-$(CONFIG_BLK_DEV_DRBD)     +=3D drbd/
+=20
+ swim_mod-objs	:=3D swim.o swim_asm.o
++ts72xx_sdcard-objs	:=3D tssdcard.o sdcore2.o
+diff --git a/drivers/block/sdcore2.c b/drivers/block/sdcore2.c
+new file mode 100644
+index 0000000..6dadee1
+--- /dev/null
++++ b/drivers/block/sdcore2.c
+@@ -0,0 +1,2391 @@
++/*
++ * Copyright (c) 2006-2009, Technologic Systems
++ * All rights reserved.
++ */
++
++/*
++ * This code is 100% operating system/CPU independent-- not a single gl=
obal
++ * reference, external symbol, or #include is required.  Centric upon o=
ne data
++ * structure "struct sdcore".  OS-specific callbacks for things like DM=
A
++ * acceleration and sleeping are defined by function pointers to OS-spe=
cific
++ * code in the struct sdcore.  Minimally requires the os_sleep() callba=
ck to be
++ * implemented for proper SD card initialization and a pointer to start
++ * of SD card registers.  Auto-determines TS SD core version.  All othe=
r
++ * callback functions may be left NULL-- they are only to allow speed/C=
PU
++ * utilization improvements.
++ *
++ * 3 main public functions - sdreset(), sdread() and sdwrite().  sdrese=
t()
++ * returns card size.  OS specific shim is required to turn this
++ * simple API into the complicated, constantly changing, hacker "design=
ed"
++ * horrible excuses for abstraction, block driver APIs required in othe=
r
++ * "modern" operating systems.
++ *
++ * Not all SD cards over the years have followed spec perfectly -- many
++ * don't even check CRC's on the CMD or DAT busses and some have proble=
ms
++ * (lock up) when reading/writing the last sectors with SD read/write m=
ultiple
++ * commands.
++ *
++ * The TS SD hardware cores are not much more than GPIO bit-bang cores =
with
++ * a few well-placed hardware optimizations to achieve reasonable
++ * performance goals.  In the roughly 2000 lines of code that follow, t=
here
++ * is support for all distinct TS hardware SD cores on PPC and ARM plat=
forms,
++ * a generic (private) SD  command layer, sdcmd(), and SD flash card
++ * (public) routines for initialization + read/write + some SD security
++ * features.
++ *
++ */
++
++/* Register offset definitions.  TS-SDCORE is 4 regs total. */
++#define SDCMD		0
++#define SDGPIO		0	/* version 2 register */
++#define SDDAT		1
++#define SDSTAT2		1
++#define SDSTATE		2
++#define SDCTRL		3
++#define SDDAT2		4
++#define SDCMD2		8
++#define SDCTRL2		12
++#define SDLUN2		2
++
++struct sdcore {
++	/* virtual address of SD block register start, to be filled in
++	 * by client code before calling any sdcore functions.
++	 */
++	unsigned int sd_regstart;
++
++	/* public bits for sd_state bitfield, can be read from client code.
++	 * Do not write!  Other bits are used internally.
++	 */
++	#define SDDAT_RX	(1<<0)
++	#define SDDAT_TX	(1<<1)
++	#define SDCMD_RX	(1<<2)
++	#define SDCMD_TX	(1<<3)
++	unsigned int sd_state;
++
++	/* Erase hint for subsequent sdwrite() call, used to optimize
++	 * write throughput on multi-sector writes by pre-erasing this
++	 * many sectors. XXX: this doesn't have much benefit on most SDs
++	 */
++	unsigned int sd_erasehint;
++
++	/* Following this comment are 3 function pointer declarations to
++	 * OS helper functions.  The 'os_arg' member is passed as the
++	 * first argument to the helpers and should be set by
++	 * client code before issueing sdreset()
++	 *
++	 * os_dmastream(os_arg, buf, buflen)
++	 * This function should look at sd_state and set up and run an
++	 * appropriate DMA transfer.  If buf is NULL, callee doesn't care
++	 * about the actual data sent/received and helper function
++	 * can do whatever it wants.  Should return 0 when DMA transfer was
++	 * run and completed successfully.  If this function pointer is
++	 * NULL, PIO methods of transfer will be used instead of DMA.
++	 *
++	 * os_dmaprep(os_arg, buf, buflen)
++	 * This function is used to prepare an area of memory for a possible
++	 * DMA transfer.  This function is called once per distinct buffer
++	 * passed in.  After this function is called, os_dmastream() may be
++	 * called one or more times (for sequential addresses) on subregions
++	 * of the address range passed here.  Should write-back or invalidate
++	 * L1 cache lines and possibly look up physical addresses for buf
++	 * passed in if I/O buffers.  If 'os_dmaprep' is set to NULL, function
++	 * call will not happen. (though os_dmastream() calls may still)
++	 *
++	 * os_delay(os_arg, microseconds)
++	 * This function is supposed to delay or stall the processor for
++	 * the passed in value number of microseconds.
++	 */
++	void *os_arg;
++	int (*os_dmastream)(void *, unsigned char *, unsigned int);
++	void (*os_dmaprep)(void *, unsigned char *, unsigned int);
++	void (*os_delay)(void *, unsigned int);
++	void (*os_irqwait)(void *, unsigned int);
++	int (*os_powerok)(void *);
++	int (*os_timeout)(void *);
++	int (*os_reset_timeout)(void *);
++
++	/* If the SD card last successfully reset is write protected, this
++	 * member will be non-zero.
++	 */
++	unsigned int sd_wprot;
++
++	/* If this card may have been already initialized by TS-SDBOOT, place
++	 * the magic token it placed in the EP93xx SYSCON ScratchReg1 here
++	 * to avoid re-initialization.
++	 */
++	unsigned int sdboot_token;
++
++	/* CRC hint for subsequent sdwrite() call, used to optimize
++	 * write throughput while using DMA by pre-calculating CRC's for
++	 * next write
++	 */
++	unsigned char *sd_crchint;
++
++	/* The block size of the memory device.  Normally 512, but can be 1024
++	 * for larger cards
++	 */
++	unsigned int sd_blocksize;
++
++	/* Password for auto-unlocking in sdreset()
++	 */
++	unsigned char *sd_pwd;
++
++	/* If the SD card was password locked, this will be non-zero.
++	 */
++	unsigned int sd_locked;
++
++	/* Whether or not writes can be parked.
++	 */
++	unsigned int sd_writeparking;
++
++	/* Logical unit number.  Some SD cores will have multiple card slots.
++	 */
++	unsigned int sd_lun;
++
++	/* The rest of these members are for private internal use and should
++	 * not be of interest to client code.
++	 */
++	unsigned int sd_rcaarg;
++	unsigned int sd_csd[17];
++	unsigned int sd_crcseq;
++	unsigned short sd_crcs[4];
++	unsigned int sd_crctmp[4];
++	unsigned int sd_timeout;
++	unsigned int parked_sector;
++	unsigned int hw_version;
++	unsigned char sd_scr[8];
++	unsigned int sd_sz;
++};
++
++/* For sdreadv() / sdwritev() */
++struct sdiov {
++	unsigned char *sdiov_base;
++	unsigned int sdiov_nsect;
++};
++
++int sdreset(struct sdcore *);
++int sdread(struct sdcore *, unsigned int, unsigned char *, int);
++int sdwrite(struct sdcore *, unsigned int, unsigned char *, int);
++int sdreadv(struct sdcore *, unsigned int, struct sdiov *, int);
++int sdwritev(struct sdcore *, unsigned int, struct sdiov *, int);
++int sdsetwprot(struct sdcore *, unsigned int);
++#define SDLOCK_UNLOCK	0
++#define SDLOCK_SETPWD	1
++#define SDLOCK_CLRPWD	2
++#define SDLOCK_ERASE	8
++#ifndef SD_NOLOCKSUPPORT
++int sdlockctl(struct sdcore *, unsigned int, unsigned char *, unsigned =
char *);
++#endif
++
++/*
++ * Everything below here is secret!  This code shouldn't have to change
++ * even for different OS.
++ */
++
++const static unsigned short crc16tbl[256] =3D {
++	0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
++	0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
++	0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
++	0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de,
++	0x2462, 0x3443, 0x0420, 0x1401, 0x64e6, 0x74c7, 0x44a4, 0x5485,
++	0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
++	0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4,
++	0xb75b, 0xa77a, 0x9719, 0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc,
++	0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
++	0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b,
++	0x5af5, 0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12,
++	0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
++	0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60, 0x1c41,
++	0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49,
++	0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
++	0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a, 0x9f59, 0x8f78,
++	0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f,
++	0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
++	0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e,
++	0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256,
++	0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
++	0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
++	0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c,
++	0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
++	0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab,
++	0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3,
++	0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
++	0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92,
++	0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9,
++	0x7c26, 0x6c07, 0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
++	0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8,
++	0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0,
++};
++
++const static unsigned char destagger[256] =3D {
++	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
++	2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3,
++	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
++	2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3,
++	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
++	2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3,
++	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
++	2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3,
++	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
++	2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3,
++	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
++	2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3,
++	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
++	2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3,
++	0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
++	2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3,
++};
++
++#ifndef MAX_SDCORES
++#define MAX_SDCORES 64
++#endif
++static struct sdcore *sdcores[MAX_SDCORES];
++
++static unsigned int crc7(unsigned int, const unsigned int *, unsigned i=
nt);
++static int sdreset2(struct sdcore *);
++static int version(struct sdcore *);
++static int sdfastinit(struct sdcore *sd);
++static int sdcmd2(struct sdcore *, unsigned short, unsigned int,
++  unsigned int *, unsigned char **);
++static int sdcmd(struct sdcore *, unsigned short, unsigned int,
++  unsigned int *, unsigned char **);
++static void mkcommand(unsigned int, unsigned int, unsigned int *);
++static int stop(struct sdcore *);
++static int stop2(struct sdcore *);
++static int sdread2(struct sdcore *, unsigned int, unsigned char *, int)
++  __attribute__ ((unused));
++static int do_read2(struct sdcore *, unsigned int, struct sdiov *,
++  unsigned int);
++static int do_read(struct sdcore *, unsigned int, struct sdiov *,
++  unsigned int);
++static int do_write(struct sdcore *, unsigned int, struct sdiov *,
++  unsigned int);
++static int do_write2(struct sdcore *, unsigned int, struct sdiov *,
++  unsigned int);
++static int sdsetwprot2(struct sdcore *, unsigned int);
++#ifndef SD_NOLOCKSUPPORT
++static int sdlockctl2(struct sdcore *, unsigned int, unsigned char *,
++  unsigned char *);
++#endif
++
++#ifndef SDPOKE8
++# define SDPOKE8(sd, x, y)	\
++  *(volatile unsigned char *)((sd)->sd_regstart + (x)) =3D (y)
++#endif
++#ifndef SDPOKE32
++# define SDPOKE32(sd, x, y)	\
++  *(volatile unsigned int *)((sd)->sd_regstart + (x)) =3D (y)
++#endif
++#ifndef SDPOKE16
++# define SDPOKE16(sd, x, y)	\
++  *(volatile unsigned short *)((sd)->sd_regstart + (x)) =3D (y)
++#endif
++#ifndef SDPEEK8
++# define SDPEEK8(sd, x)	*(volatile unsigned char *)((sd)->sd_regstart +=
 (x))
++#endif
++#ifndef SDPEEK32
++# define SDPEEK32(sd, x)	*(volatile unsigned int *)((sd)->sd_regstart +=
 (x))
++#endif
++#ifndef SDPEEK16
++# define SDPEEK16(sd, x)	*(volatile unsigned short *)((sd)->sd_regstart=
 + (x))
++#endif
++
++#define S_DUMMY_CLK	0
++#define S_SEND_CMD	1
++#define S_WAIT_RESP	2
++#define S_RX_RESP	3
++#define S_WAIT_BUSY	4
++#define S_TX_WRITE	5
++#define S_CRC_CHECK	6
++#define S_OFF		7
++
++#define TYPE_SHORTRESP	2
++#define TYPE_LONGRESP	3
++#define TYPE_BSYRESP	4
++#define TYPE_NORESP	1
++#define TYPE_RXDAT	0
++#define TYPE_TXDAT	5
++#define TYPE_ABORT	6
++#define TYPE_RXDAT_IGNRESP	7
++
++#define CMD(idx, type)	(0x40 | (idx) | ((type)<<8))
++
++#define CMD_GO_IDLE_STATE		CMD(0, TYPE_NORESP)
++#define CMD_ALL_SEND_CID		CMD(2, TYPE_LONGRESP)
++#define CMD_SEND_RELATIVE_ADDR		CMD(3, TYPE_SHORTRESP)
++#define CMD_SWITCH_FUNC			CMD(6, TYPE_RXDAT)
++#define CMD_SWITCH_FUNC2		CMD(6, TYPE_RXDAT_IGNRESP)
++#define CMD_SELECT_CARD			CMD(7, TYPE_BSYRESP)
++#define CMD_DESELECT_CARD		CMD(7, TYPE_NORESP)
++#define CMD_SEND_IF_COND		CMD(8, TYPE_SHORTRESP)
++#define CMD_SEND_CSD			CMD(9, TYPE_LONGRESP)
++#define CMD_PROGRAM_CSD			CMD(27, TYPE_TXDAT)
++#define CMD_SET_BLOCKLEN		CMD(16, TYPE_SHORTRESP)
++#define CMD_LOCK_UNLOCK			CMD(42, TYPE_TXDAT)
++#define CMD_APP_CMD			CMD(55, TYPE_SHORTRESP)
++#define CMD_READ_SINGLE_BLOCK		CMD(17, TYPE_RXDAT)
++#define CMD_READ_MULTIPLE_BLOCK		CMD(18, TYPE_RXDAT)
++#define CMD_READ_MULTIPLE_BLOCK2	CMD(18, TYPE_RXDAT_IGNRESP)
++#define CMD_STOP_TRANSMISSION		CMD(12, TYPE_ABORT)
++#define CMD_SEND_STATUS			CMD(13, TYPE_SHORTRESP)
++#define CMD_WRITE_BLOCK			CMD(24, TYPE_TXDAT)
++#define CMD_WRITE_MULTIPLE_BLOCK	CMD(25, TYPE_TXDAT)
++
++#define ACMD_SD_SEND_OP_COND		CMD(41, TYPE_SHORTRESP)
++#define ACMD_SET_CLR_CARD_DETECT	CMD(42, TYPE_SHORTRESP)
++#define ACMD_SET_BUS_WIDTH		CMD(6, TYPE_SHORTRESP)
++#define ACMD_SET_WR_BLK_ERASE_COUNT	CMD(23, TYPE_SHORTRESP)
++#define ACMD_SEND_NUM_WR_BLOCKS		CMD(22, TYPE_RXDAT)
++#define ACMD_SEND_SCR			CMD(51, TYPE_RXDAT)
++#define ACMD_SEND_SCR2			CMD(51, TYPE_RXDAT_IGNRESP)
++
++/* Private bits for struct sdcore, sd_state member */
++#define DATSSP_NOCRC		(1<<4)
++#define DATSSP_4BIT		(1<<5)
++#define SD_HC			(1<<6)
++#define SD_HISPEED		(1<<7)
++#define SD_LOSPEED		(1<<8)
++#define SD_SELECTED		(1<<9)
++#define SD_RESET		(1<<10)
++
++#define	NULL			((void *)0)
++
++static void remember_sdcore(struct sdcore *sd) {
++	int i, newlun =3D 0;
++
++	for (i =3D 0; i < sizeof(sdcores); i++) {
++		if (sdcores[i] =3D=3D NULL) {
++			/* new core, first reset */
++			sdcores[i] =3D sd;
++			/* core was almost definitely power-cycled on prev lun
++			 * sdreset2(), so we don't need to have the sdreset2()
++			 * do it again.
++			 */
++			if (newlun) sd->sd_state =3D SD_RESET;
++			break;
++		} else if (sdcores[i]->sd_regstart =3D=3D sd->sd_regstart) {
++			newlun =3D 1;
++			if (sdcores[i]->sd_lun =3D=3D sd->sd_lun) {
++				sdcores[i] =3D sd;
++				break;
++			}
++		}
++	}
++}
++
++static int activate(struct sdcore *sd) {
++	int i;
++
++	/* Are we already selected? */
++	if ((sd->sd_state & (SD_SELECTED|SD_RESET)) =3D=3D SD_SELECTED)
++	  return 0;
++
++	/* Find currently activated SD slot for this HW core */
++	for (i =3D 0; i < sizeof(sdcores); i++) {
++		if (sdcores[i] =3D=3D NULL) break;
++		if (sdcores[i]->sd_regstart =3D=3D sd->sd_regstart &&
++		  sdcores[i]->sd_state & SD_SELECTED) break;
++	}
++
++	/* Stop whatever parked transfer it has going on. */
++	if (sdcores[i]) {
++		stop2(sdcores[i]);
++		sdcores[i]->sd_state &=3D ~SD_SELECTED;
++	}
++
++	/* Change clock routing, mark us as selected */
++#ifdef BIGENDIAN
++	SDPOKE16(sd, SDLUN2, sd->sd_lun << 8);
++#else
++	SDPOKE16(sd, SDLUN2, sd->sd_lun);
++#endif
++
++	/* Change clock frequency */
++	if (sd->sd_state & SD_HISPEED) SDPOKE8(sd, SDSTAT2, 0x38);
++	else SDPOKE8(sd, SDSTAT2, 0x18);
++
++	sd->sd_state |=3D SD_SELECTED;
++	if (sd->sd_state & SD_RESET) return 1;
++	else return 0;
++
++}
++
++inline static unsigned short
++crc16_acc(unsigned short crc, unsigned int b)
++{
++	return (crc << 8) ^ crc16tbl[(crc >> 8) ^ b];
++}
++
++static void sd_initcrc(struct sdcore *sd)
++{
++	int i;
++
++	for (i =3D 0; i < 4; i++) {
++		sd->sd_crctmp[i] =3D 0;
++		sd->sd_crcs[i] =3D 0;
++	}
++	sd->sd_crcseq =3D 6;
++}
++
++static void sd_1bit_feedcrc(struct sdcore *sd, unsigned int dat)
++{
++	sd->sd_crcs[0] =3D crc16_acc(sd->sd_crcs[0], dat);
++}
++
++static void sd_4bit_feedcrc(struct sdcore *sd, unsigned int dat)
++{
++	unsigned int a =3D 0, b =3D 0, c =3D 0, d =3D 0;
++	unsigned int shift =3D (sd->sd_crcseq & 0x7);
++
++	a =3D sd->sd_crctmp[0];
++	b =3D sd->sd_crctmp[1];
++	c =3D sd->sd_crctmp[2];
++	d =3D sd->sd_crctmp[3];
++
++	a |=3D destagger[dat] << shift;
++	dat >>=3D 1;
++	b |=3D destagger[dat] << shift;
++	dat >>=3D 1;
++	c |=3D destagger[dat] << shift;
++	dat >>=3D 1;
++	d |=3D destagger[dat] << shift;
++
++	if (shift =3D=3D 0) {
++		sd->sd_crcs[0] =3D crc16_acc(sd->sd_crcs[0], a);
++		sd->sd_crcs[1] =3D crc16_acc(sd->sd_crcs[1], b);
++		sd->sd_crcs[2] =3D crc16_acc(sd->sd_crcs[2], c);
++		sd->sd_crcs[3] =3D crc16_acc(sd->sd_crcs[3], d);
++		a =3D b =3D c =3D d =3D 0;
++	}
++
++	sd->sd_crcseq -=3D 2;
++	sd->sd_crctmp[0] =3D a;
++	sd->sd_crctmp[1] =3D b;
++	sd->sd_crctmp[2] =3D c;
++	sd->sd_crctmp[3] =3D d;
++}
++
++/* This should be called 8 times to get the full 8 bytes of CRC generat=
ed */
++static unsigned int sd_4bit_getcrc(struct sdcore *sd)
++{
++	static const unsigned char restaggertbl[4] =3D { 0x0, 0x1, 0x10, 0x11 =
};
++	static const unsigned char restaggertbl_lsl1[4] =3D
++		{ 0x0, 0x2, 0x20, 0x22 };
++	static const unsigned char restaggertbl_lsl2[4] =3D
++		{ 0x0, 0x4, 0x40, 0x44 };
++	static const unsigned char restaggertbl_lsl3[4] =3D
++		{ 0x0, 0x8, 0x80, 0x88 };
++	unsigned int ret;
++
++	ret =3D restaggertbl[sd->sd_crcs[0] >> 14];
++	sd->sd_crcs[0] <<=3D 2;
++	ret |=3D restaggertbl_lsl1[sd->sd_crcs[1] >> 14];
++	sd->sd_crcs[1] <<=3D 2;
++	ret |=3D restaggertbl_lsl2[sd->sd_crcs[2] >> 14];
++	sd->sd_crcs[2] <<=3D 2;
++	ret |=3D restaggertbl_lsl3[sd->sd_crcs[3] >> 14];
++	sd->sd_crcs[3] <<=3D 2;
++
++	return ret;
++}
++
++/* This should be called 2 times to get the full 2 bytes of CRC generat=
ed */
++static unsigned int sd_1bit_getcrc(struct sdcore *sd)
++{
++	unsigned int ret;
++
++	ret =3D sd->sd_crcs[0] >> 8;
++	sd->sd_crcs[0] =3D (sd->sd_crcs[0] & 0xff) << 8;
++	return ret;
++}
++
++static inline void datssp_feedcrc(struct sdcore *sd, unsigned int dat)
++{
++	if (!(sd->sd_state & DATSSP_NOCRC)) {
++		if (sd->sd_state & DATSSP_4BIT) sd_4bit_feedcrc(sd, dat);
++		else sd_1bit_feedcrc(sd, dat);
++	}
++}
++
++static inline unsigned int datssp_getcrc(struct sdcore *sd)
++{
++	unsigned int ret =3D 0;
++
++	if (!(sd->sd_state & DATSSP_NOCRC)) {
++		if (sd->sd_state & DATSSP_4BIT) ret =3D sd_4bit_getcrc(sd);
++		else ret =3D sd_1bit_getcrc(sd);
++	}
++	return ret;
++}
++
++static inline unsigned int
++crc7(unsigned int crc, const unsigned int *pc, unsigned int len)
++{
++	unsigned int i;
++	unsigned char ibit;
++	unsigned char c;
++
++	for (i =3D 0; i < len; i++, pc++) {
++		c =3D *pc;
++		for (ibit =3D 0; ibit < 8; ibit++) {
++			crc <<=3D 1;
++			if ((c ^ crc) & 0x80) crc ^=3D 0x09;
++
++			c <<=3D 1;
++		}
++
++		crc &=3D 0x7F;
++	}
++
++	return crc;
++}
++
++static inline void
++mkcommand(unsigned int cmdidx, unsigned int arg, unsigned int *retcmd)
++{
++	retcmd[0] =3D cmdidx;
++	retcmd[1] =3D arg >> 24;
++	retcmd[2] =3D arg >> 16;
++	retcmd[3] =3D arg >> 8;
++	retcmd[4] =3D arg;
++	retcmd[5] =3D (0x1 | (crc7(0, retcmd, 5) << 1));
++}
++
++static inline void reset_timeout(struct sdcore *sd) {
++	sd->sd_timeout =3D 0;
++	if (sd->os_reset_timeout) sd->os_reset_timeout(sd);
++}
++
++static inline int timeout(struct sdcore *sd) {
++	if (sd->sd_timeout > 1000000) return 1;
++	else if (sd->os_timeout) return sd->os_timeout(sd);
++	else sd->sd_timeout++;
++	return 0;
++}
++
++static
++unsigned int sdsize(struct sdcore *sd)
++{
++	unsigned int csize, csize_mult, rd_bl_len;
++
++	if (sd->sd_sz !=3D 0) return sd->sd_sz;
++
++	if (sd->sd_csd[1] & 0xc0) {
++		csize =3D (sd->sd_csd[10] | (sd->sd_csd[9] << 8));
++		sd->sd_sz =3D (csize + 1) * 1024;
++	} else {
++	        rd_bl_len =3D 1 << ((sd->sd_csd[6] & 0xf) - 9);
++		csize =3D ((sd->sd_csd[7] & 0x03) << 10) |
++		  ((sd->sd_csd[8] << 2) | ((sd->sd_csd[9] & 0xc0) >> 6));
++		csize_mult =3D ((sd->sd_csd[10] & 0x03) << 1) |
++		  ((sd->sd_csd[11] & 0x80) >> 7);
++		sd->sd_sz =3D (csize + 1) * (1 << (csize_mult + 2)) * rd_bl_len;
++	}
++	return sd->sd_sz;
++}
++
++static unsigned int tend_ssp(struct sdcore *sd, unsigned int **cmdresp,
++  unsigned char **dat) {
++	unsigned int d;
++	unsigned int s =3D SDPEEK8(sd, SDSTATE);
++
++	if (s & 0x8) {
++		if (sd->sd_state & SDCMD_RX) {
++			d =3D SDPEEK8(sd, SDCMD);
++			if (cmdresp) {
++				**cmdresp =3D d;
++				*cmdresp =3D *cmdresp + 1;
++				reset_timeout(sd);
++			}
++		} else if (sd->sd_state & SDCMD_TX) {
++			SDPOKE8(sd, SDCMD, **cmdresp);
++			*cmdresp =3D *cmdresp + 1;
++			reset_timeout(sd);
++		}
++	}
++
++	if (s & 0x10) {
++		if (sd->sd_state & SDDAT_RX) {
++			d =3D SDPEEK8(sd, SDDAT);
++			if (dat) {
++				**dat =3D d;
++				*dat =3D *dat + 1;
++				reset_timeout(sd);
++			}
++		} else if (sd->sd_state & SDDAT_TX) {
++			reset_timeout(sd);
++			if (dat) {
++				d =3D **dat;
++				*dat =3D *dat + 1;
++				SDPOKE8(sd, SDDAT, d);
++				datssp_feedcrc(sd, d);
++			} else {
++				d =3D datssp_getcrc(sd);
++				SDPOKE8(sd, SDDAT, d);
++			}
++		}
++	}
++
++	return s;
++}
++
++static int
++error(unsigned int *resp, unsigned short req)
++{
++	unsigned int crc, status;
++
++	if ((req & 0x3f) !=3D resp[0]) return 1;
++
++	crc =3D (0x1 | (crc7(0, resp, 5) << 1));
++	if (crc !=3D resp[5]) return 1;
++
++	status =3D resp[1] << 24;
++	status |=3D resp[2] << 16;
++	status |=3D resp[3] << 8;
++	status |=3D resp[4];
++
++	return status & 0xfdf90008;
++}
++
++static int
++sdcmd2(struct sdcore *sd, unsigned short req, unsigned int arg,
++  unsigned int *resp, unsigned char **dat)
++{
++	unsigned int i, j, s, cmdresp[17];
++	unsigned int resplen;
++	unsigned int type =3D (req >> 8);
++	unsigned int cmdidx =3D req;
++	unsigned int *cmdptr =3D cmdresp;
++	unsigned int *respptr;
++	unsigned int dly;
++	int ok32 =3D (sd->hw_version =3D=3D 2);
++	int ok16 =3D (ok32 || (sd->hw_version =3D=3D 3));
++	int sddat2_8;
++
++	// If no space for response provided by caller, use local buffer
++	if (resp =3D=3D NULL) resp =3D cmdresp;
++	respptr =3D resp;
++
++	if (activate(sd)) return 1;
++
++	dly =3D sd->sd_state & SD_LOSPEED;
++
++	if (!dly) {
++		unsigned int x;
++		SDPOKE8(sd, SDGPIO, 0xbf);
++#ifdef BIGENDIAN
++		x =3D (cmdidx & 0xff);
++		x |=3D ((arg >> 24) & 0xff) << 8;
++		x |=3D ((arg >> 16) & 0xff) << 16;
++		x |=3D ((arg >> 8) & 0xff) << 24;
++		if (ok32) SDPOKE32(sd, SDCMD2, x);
++		else if (ok16) {
++			SDPOKE16(sd, SDCMD2, x);
++			SDPOKE16(sd, SDCMD2, x >> 16);
++		} else {
++			SDPOKE8(sd, SDCMD2, x);
++			SDPOKE8(sd, SDCMD2, x >> 8);
++			SDPOKE8(sd, SDCMD2, x >> 16);
++			SDPOKE8(sd, SDCMD2, x >> 24);
++		}
++#else
++		x =3D (cmdidx & 0xff) << 24;
++		x |=3D ((arg >> 24) & 0xff) << 16;
++		x |=3D ((arg >> 16) & 0xff) << 8;
++		x |=3D ((arg >> 8) & 0xff);
++		if (ok32) SDPOKE32(sd, SDCMD2, x);
++		else if (ok16) {
++			SDPOKE16(sd, SDCMD2, x >> 16);
++			SDPOKE16(sd, SDCMD2, x);
++		} else {
++			SDPOKE8(sd, SDCMD2, x >> 24);
++			SDPOKE8(sd, SDCMD2, x >> 16);
++			SDPOKE8(sd, SDCMD2, x >> 8);
++			SDPOKE8(sd, SDCMD2, x);
++		}
++#endif
++		SDPOKE8(sd, SDCMD2, arg);
++	} else {
++		// Build command packet
++		mkcommand(cmdidx, arg, cmdptr);
++
++		// Send command
++		for (i =3D 0; i < 6; i++) {
++			unsigned int b =3D *cmdptr++;
++			unsigned int x;
++
++			if (timeout(sd)) break;
++			for (j =3D 0; j < 8; j++) {
++				x =3D 0x8f | ((b & 0x80) >> 3);
++				b =3D b << 1;
++				SDPOKE8(sd, SDGPIO, x); // clk negedge
++				SDPEEK8(sd, SDGPIO);    // delay
++				SDPEEK8(sd, SDGPIO);    // delay
++				x |=3D 0x20;
++				SDPOKE8(sd, SDGPIO, x); // clk posedge
++				SDPEEK8(sd, SDGPIO);    // delay
++				SDPEEK8(sd, SDGPIO);    // delay
++			}
++		}
++	}
++
++	if (type =3D=3D TYPE_NORESP) goto done;
++	else if (type =3D=3D TYPE_RXDAT_IGNRESP) goto ignresp;
++	else if (type =3D=3D TYPE_LONGRESP) resplen =3D 17;
++	else resplen =3D 6;
++
++	// clock until start bit on CMD pin
++	while(1) {
++		if (timeout(sd)) {
++			goto done;
++		}
++		if (req =3D=3D CMD_SEND_IF_COND) sd->sd_timeout +=3D 100000;
++		SDPOKE8(sd, SDGPIO, 0xdf); // clk negedge
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		s =3D SDPEEK8(sd, SDGPIO);   // sample
++		if ((s & 0x10) =3D=3D 0x0) break;
++		SDPOKE8(sd, SDGPIO, 0xff); // clk posedge
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++	}
++	reset_timeout(sd);
++
++	// Next we receive the response.
++	if (ok16 && !ok32) sddat2_8 =3D SDDAT2 + 1;
++	else sddat2_8 =3D SDDAT2;
++	if (dly) for (i =3D 0; i < resplen; i++) {
++		unsigned int r =3D 0;
++
++		for (j =3D 0; j < 8; j++) {
++			SDPOKE8(sd, SDGPIO, 0xdf); // clk negedge
++			SDPEEK8(sd, SDGPIO);       // delay
++			s =3D SDPEEK8(sd, SDGPIO);   // sample
++			SDPOKE8(sd, SDGPIO, 0xff); // clk posedge
++			SDPEEK8(sd, SDGPIO);       // delay
++			SDPEEK8(sd, SDGPIO);       // delay
++			r =3D r << 1;
++			r |=3D ((s & 0x10) >> 4);
++		}
++
++		*respptr++ =3D r;
++	} else while (resplen > 0) {
++		unsigned int r;
++
++#ifdef BIGENDIAN
++		if (ok32 && resplen >=3D 4) {
++			r =3D SDPEEK32(sd, SDCMD2);
++			*respptr++ =3D r & 0xff;
++			*respptr++ =3D (r >> 8) & 0xff;
++			*respptr++ =3D (r >> 16) & 0xff;
++			*respptr++ =3D (r >> 24);
++			resplen -=3D 4;
++		} else if (ok16 && resplen >=3D 2) {
++			r =3D SDPEEK16(sd, SDCMD2);
++			*respptr++ =3D r & 0xff;
++			*respptr++ =3D (r >> 8) & 0xff;
++
++			resplen -=3D 2;
++		} else {
++			*respptr++ =3D SDPEEK8(sd, sddat2_8);
++			resplen--;
++		}
++#else
++		if (ok32 && resplen >=3D 4) {
++			r =3D SDPEEK32(sd, SDCMD2);
++			*respptr++ =3D (r >> 24);
++			*respptr++ =3D (r >> 16) & 0xff;
++			*respptr++ =3D (r >> 8) & 0xff;
++			*respptr++ =3D r & 0xff;
++			resplen -=3D 4;
++		} else if (ok16 && resplen >=3D 2) {
++			r =3D SDPEEK16(sd, SDCMD2);
++			*respptr++ =3D (r >> 8) & 0xff;
++			*respptr++ =3D r & 0xff;
++			resplen -=3D 2;
++		} else {
++			*respptr++ =3D SDPEEK8(sd, sddat2_8);
++			resplen--;
++		}
++#endif
++	}
++	if (type =3D=3D TYPE_BSYRESP) {
++		s =3D 0;
++		while ((s & 0x7) !=3D 0x7) {
++			if (timeout(sd)) break;
++			SDPOKE8(sd, SDGPIO, 0x9f);  // clk negedge
++			if (dly) SDPEEK8(sd, SDGPIO);        // delay
++			s =3D s << 1;
++			s |=3D SDPEEK8(sd, SDGPIO) & 0x1;
++			SDPOKE8(sd, SDGPIO, 0xbf);
++			if (dly) SDPEEK8(sd, SDGPIO);
++		}
++	}
++
++ignresp:
++
++	if (type =3D=3D TYPE_ABORT)
++		sd->sd_state &=3D ~(SDDAT_RX|SDDAT_TX);
++
++#ifndef SD_READONLYDMA
++	if (type =3D=3D TYPE_TXDAT) {
++		sd->sd_state |=3D SDDAT_TX;
++		/* 2 clocks for nWR */
++		SDPOKE8(sd, SDGPIO, 0xdf); // clk negedge
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		SDPOKE8(sd, SDGPIO, 0xff); // clk posedge
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		SDPOKE8(sd, SDGPIO, 0xdf); // clk negedge
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		SDPOKE8(sd, SDGPIO, 0xff); // clk posedge
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		if (sd->sd_state & DATSSP_4BIT)
++			SDPOKE8(sd, SDGPIO, 0x10); // assert start, clk negedge
++		else
++			SDPOKE8(sd, SDGPIO, 0x1e);
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		if (sd->sd_state & DATSSP_4BIT)
++			SDPOKE8(sd, SDGPIO, 0x30); // clk posedge
++		else
++			SDPOKE8(sd, SDGPIO, 0x3e);
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++		if (dly) SDPEEK8(sd, SDGPIO);       // delay
++	}
++#endif
++
++	if (type =3D=3D TYPE_RXDAT || type =3D=3D TYPE_RXDAT_IGNRESP)
++	  sd->sd_state |=3D SDDAT_RX;
++
++done:
++	// 8 clocks before stopping
++	if (!(sd->sd_state & (SDDAT_TX|SDDAT_RX))) {
++		if (dly) for (i =3D 0; i < 8; i++) {
++			SDPOKE8(sd, SDGPIO, 0xdf);
++			SDPEEK8(sd, SDGPIO);       // delay
++			SDPEEK8(sd, SDGPIO);       // delay
++			SDPOKE8(sd, SDGPIO, 0xff);
++			SDPEEK8(sd, SDGPIO);       // delay
++			SDPEEK8(sd, SDGPIO);       // delay
++		} else {
++			SDPOKE8(sd, SDGPIO, 0xff);
++			SDPOKE8(sd, SDCMD2, 0xff);
++		}
++	}
++	if (timeout(sd)) return 1;
++	else return 0;
++
++}
++
++
++static int
++sdcmd(struct sdcore *sd, unsigned short req, unsigned int arg,
++  unsigned int *resp, unsigned char **dat)
++{
++	unsigned int s, cmdresp[17];
++	unsigned int resplen;
++	unsigned int type =3D (req >> 8);
++	unsigned int cmdidx =3D req;
++	unsigned int *cmdptr =3D cmdresp;
++	unsigned int *cmd =3D cmdresp;
++	unsigned int *respptr;
++	unsigned int ndat;
++
++	if (sd->hw_version !=3D 0) return sdcmd2(sd, req, arg, resp, dat);
++
++	// If no space for response provided by caller, use local buffer
++	if (resp =3D=3D NULL) resp =3D cmdresp;
++	respptr =3D resp;
++
++	// Before continuing, we must wait for the FSM to get to the
++	// S_SEND_CMD state.  After a previous command, we may still be
++	// in S_DUMMY_CLK or in case of an ABORT, we may be in the middle of
++	// clocking a byte for TX or RX.
++	s =3D SDPEEK8(sd, SDSTATE);
++	while ((s & 0x7) !=3D S_SEND_CMD) {
++		if (timeout(sd)) break;
++		s =3D SDPEEK8(sd, SDSTATE);
++	}
++
++	// We know we're in S_SEND_CMD, but we may need to change the
++	// command type.  This won't cause a state change.
++	if ((s & 0xe7) !=3D (S_SEND_CMD | (type << 5)))
++		SDPOKE8(sd, SDSTATE, S_SEND_CMD | (type << 5));
++
++	// Build command packet
++	mkcommand(cmdidx, arg, cmdptr);
++
++	// Next, we loop while tending the SSPs until we get our last
++	// byte of command data out.  We may get a few bytes from the DAT
++	// SSP if we are aborting a previous data transfer command.  If we do
++	// those get placed in a buffer or thrown away based on the callers
++	// "dat" parameter.
++	sd->sd_state |=3D SDCMD_TX;
++	while ((cmdptr - cmd) !=3D 6) {
++		if (timeout(sd)) break;
++		s =3D tend_ssp(sd, &cmdptr, dat);
++	}
++	sd->sd_state &=3D ~SDCMD_TX;
++
++	// If we got out of sync with the hardware, that would be bad.
++	// The hardware should still be in S_SEND_CMD for the last CMDSSP
++	// byte.
++	if ((s & 0x7) !=3D S_SEND_CMD) {
++		SDPOKE8(sd, SDSTATE, S_OFF);
++		return 1;
++	}
++
++	if (type =3D=3D TYPE_NORESP) goto done;
++	else if (type =3D=3D TYPE_LONGRESP) resplen =3D 17;
++	else resplen =3D 6;
++
++	// Next state should be S_WAIT_RESP or S_RX_RESP.  We may get
++	// more bytes from the DATSSP while shifting out our last bits of cmd
++	while (((s & 0x7) !=3D S_WAIT_RESP) && ((s & 0x7) !=3D S_RX_RESP)) {
++		if (timeout(sd)) break;
++		if (req =3D=3D CMD_SEND_IF_COND) sd->sd_timeout +=3D 1000;
++		s =3D tend_ssp(sd, NULL, dat);
++	}
++
++	// Once we're in S_WAIT_RESP or S_RX_RESP though, the DATSSP is only
++	// active for 2 more clocks at the beginning of the S_WAIT_RESP state.
++	// This is enough for one more byte in 4-bit mode, though we may have
++	// 2 bytes already in our DATSSP.
++	if (sd->sd_state & (SDDAT_RX|SDDAT_TX)) {
++		do {
++			if (timeout(sd)) break;
++			s =3D tend_ssp(sd, NULL, dat);
++		} while (!(s & 0x18));
++
++		// We've now read/wrote one more byte to the DATSSP
++		// which should allow our FSM to advance to the RX_RESP state.
++		// If we pick up more than 2 more DATSSP bytes, something is
++		// wrong.
++		ndat =3D 0;
++		while ((s & 0x7) !=3D S_RX_RESP) {
++			if (timeout(sd) || ndat > 2) break;
++			s =3D tend_ssp(sd, NULL, dat);
++			if (s & 0x10) ndat++;
++		}
++
++		if (ndat > 2) {
++			SDPOKE8(sd, SDSTATE, S_OFF);
++			return 1;
++		}
++	}
++
++	// We're now done with whatever business we had remaining with the
++	// previous command's DATSSP transfer since we've either just got our
++	// first byte of response or our last byte of data
++	sd->sd_state &=3D ~(SDDAT_RX|SDDAT_TX);
++	if (type =3D=3D TYPE_RXDAT) sd->sd_state |=3D SDDAT_RX;
++
++	// Next we receive the response.  If this is TYPE_RXDAT command,
++	// or an abortion of a previous TYPE_RXDAT command, we may get a
++	// few bytes from the DAT SSP also.
++	sd->sd_state |=3D SDCMD_RX;
++	while ((respptr - resp) !=3D resplen) {
++		if (timeout(sd)) break;
++		s =3D tend_ssp(sd, &respptr, dat);
++		if ((s & 0x10) && (resp =3D=3D respptr)) {
++			SDPOKE8(sd, SDSTATE, S_OFF);
++			sd->sd_state &=3D ~(SDCMD_RX|SDDAT_RX);
++			return 1;
++		}
++	}
++	sd->sd_state &=3D ~SDCMD_RX;
++
++	if (type =3D=3D TYPE_ABORT)
++		sd->sd_state &=3D ~(SDDAT_RX|SDDAT_TX);
++
++	if (type =3D=3D TYPE_TXDAT) sd->sd_state |=3D SDDAT_TX;
++
++done:
++	if (timeout(sd)) return 1;
++	else return 0;
++
++}
++
++static int datssp_stream2(struct sdcore *sd, unsigned char **dat,
++  unsigned int buflen)
++{
++	unsigned char *d;
++	int ret;
++#ifndef SD_READONLYDMA
++	int ok32;
++	int ok16;
++	int sddat2_8;
++	unsigned int x;
++#endif
++
++	if (sd->os_dmastream /* && (sd->sd_state & SDDAT_RX) */) {
++		d =3D dat ? *dat : NULL;
++		ret =3D sd->os_dmastream(sd->os_arg, d, buflen);
++		if (!ret && d) *dat +=3D buflen;
++		return ret;
++	}
++
++#ifndef SD_READONLYDMA
++	d =3D *dat;
++
++	while (buflen > 512) {
++		datssp_stream2(sd, dat, 512);
++		if (sd->os_irqwait) sd->os_irqwait(sd->os_arg, 1);
++		buflen -=3D 512;
++		d =3D *dat;
++	}
++
++	ok32 =3D (sd->hw_version =3D=3D 2);
++	ok16 =3D (ok32 || (sd->hw_version =3D=3D 3));
++	if (ok16 && !ok32) sddat2_8 =3D SDDAT2 + 1;
++	else sddat2_8 =3D SDDAT2;
++
++	if (sd->sd_state & SDDAT_RX) {
++
++		while (((int)d & 0x1) || buflen =3D=3D 1) {
++			*d++ =3D SDPEEK8(sd, sddat2_8);
++			buflen--;
++		}
++
++		if (((int)d & 0x2) && buflen >=3D 2) {
++			if (ok16) *(unsigned short *)(d) =3D SDPEEK16(sd, SDDAT2);
++			else {
++#ifdef BIGENDIAN
++				x =3D SDPEEK8(sd, sddat2_8) << 8;
++				x |=3D SDPEEK8(sd, sddat2_8);
++#else
++				x =3D SDPEEK8(sd, sddat2_8);
++				x |=3D SDPEEK8(sd, sddat2_8) << 8;
++#endif
++				*(unsigned short *)(d) =3D x;
++			}
++			buflen -=3D 2;
++			d +=3D 2;
++		}
++
++		if (ok32) while (buflen >=3D 4) {
++			*(unsigned int *)(d) =3D SDPEEK32(sd, SDDAT2);
++			buflen -=3D 4;
++			d +=3D 4;
++		} else if (ok16) while (buflen >=3D 4) {
++#ifdef BIGENDIAN
++			x =3D SDPEEK16(sd, SDDAT2) << 16;
++			x |=3D SDPEEK16(sd, SDDAT2);
++#else
++			x =3D SDPEEK16(sd, SDDAT2);
++			x |=3D SDPEEK16(sd, SDDAT2) << 16;
++#endif
++			buflen -=3D 4;
++			*(unsigned int *)(d) =3D x;
++			d +=3D 4;
++		} else while (buflen >=3D 4) {
++#ifdef BIGENDIAN
++			x =3D SDPEEK8(sd, sddat2_8) << 24;
++			x |=3D SDPEEK8(sd, sddat2_8) << 16;
++			x |=3D SDPEEK8(sd, sddat2_8) << 8;
++			x |=3D SDPEEK8(sd, sddat2_8);
++#else
++			x =3D SDPEEK8(sd, sddat2_8);
++			x |=3D SDPEEK8(sd, sddat2_8) << 8;
++			x |=3D SDPEEK8(sd, sddat2_8) << 16;
++			x |=3D SDPEEK8(sd, sddat2_8) << 24;
++#endif
++			buflen -=3D 4;
++			*(unsigned int *)(d) =3D x;
++			d +=3D 4;
++		}
++	} else {
++		while (((int)d & 0x1) || buflen =3D=3D 1) {
++			SDPOKE8(sd, SDDAT2, *d++);
++			buflen--;
++		}
++
++		if (((int)d & 0x2) && buflen >=3D 2) {
++			if (ok16) SDPOKE16(sd, SDDAT2, *(unsigned short *)(d));
++			else {
++				x =3D *(unsigned short *)(d);
++#ifdef BIGENDIAN
++				SDPOKE8(sd, SDDAT2, x >> 8);
++				SDPOKE8(sd, SDDAT2, x);
++#else
++				SDPOKE8(sd, SDDAT2, x);
++				SDPOKE8(sd, SDDAT2, x >> 8);
++#endif
++			}
++			buflen -=3D 2;
++			d +=3D 2;
++		}
++
++		if (ok32) while (buflen >=3D 4) {
++			SDPOKE32(sd, SDDAT2, *(unsigned int *)(d));
++			buflen -=3D 4;
++			d +=3D 4;
++		} else if (ok16) while (buflen >=3D 4) {
++			x =3D *(unsigned int *)(d);
++			buflen -=3D 4;
++			d +=3D 4;
++#ifdef BIGENDIAN
++			SDPOKE16(sd, SDDAT2, x >> 16);
++			SDPOKE16(sd, SDDAT2, x);
++#else
++			SDPOKE16(sd, SDDAT2, x);
++			SDPOKE16(sd, SDDAT2, x >> 16);
++#endif
++		} else while (buflen >=3D 4) {
++			x =3D *(unsigned int *)(d);
++			buflen -=3D 4;
++			d +=3D 4;
++#ifdef BIGENDIAN
++			SDPOKE8(sd, SDDAT2, x >> 24);
++			SDPOKE8(sd, SDDAT2, x >> 16);
++			SDPOKE8(sd, SDDAT2, x >> 8);
++			SDPOKE8(sd, SDDAT2, x);
++#else
++			SDPOKE8(sd, SDDAT2, x);
++			SDPOKE8(sd, SDDAT2, x >> 8);
++			SDPOKE8(sd, SDDAT2, x >> 16);
++			SDPOKE8(sd, SDDAT2, x >> 24);
++#endif
++		}
++	}
++
++	*dat =3D d;
++
++	if (buflen > 0) return datssp_stream2(sd, dat, buflen);
++	else return 0;
++#else
++	return 0;
++#endif
++}
++
++static int datssp_stream(struct sdcore *sd, unsigned char **dat,
++  unsigned int buflen)
++{
++	unsigned int s, t, byte =3D 0;
++	unsigned char *d;
++
++	if (((sd->sd_state & SDDAT_RX) && sd->os_dmastream) /* ||
++	  ((sd->sd_state & SDDAT_TX) && sd->os_dmastream && dat) */ ) {
++		unsigned char *d =3D dat ? *dat : NULL;
++		int ret =3D sd->os_dmastream(sd->os_arg, d, buflen);
++		if (!ret && d) *dat +=3D buflen;
++		return ret;
++	}
++
++	if (sd->hw_version > 0) return datssp_stream2(sd, dat, buflen);
++
++	while (buflen) {
++		if (timeout(sd)) return 1;
++		s =3D tend_ssp(sd, NULL, dat);
++		if (s & 0x10) {
++			buflen--;
++			if (byte++ > 7) {
++				if (sd->sd_state & SDDAT_RX)
++				  goto fastrx;
++				else goto fasttx;
++			}
++		}
++	}
++
++	// Now we can go faster (PIO)
++fastrx:
++	if (dat) {
++		d =3D *dat;
++		while (buflen) {
++			s =3D SDPEEK8(sd, SDDAT);
++			*d =3D s;
++			buflen--;
++			d++;
++		}
++		*dat =3D d;
++	} else {
++		while (buflen--) SDPEEK8(sd, SDDAT);
++	}
++	return 0;
++
++fasttx:
++	if (dat) {
++		d =3D *dat;
++		while (buflen) {
++			t =3D *d;
++			SDPOKE8(sd, SDDAT, t);
++			buflen--;
++			d++;
++			datssp_feedcrc(sd, t);
++		}
++		*dat =3D d;
++	} else {
++		while (buflen--) SDPOKE8(sd, SDDAT, datssp_getcrc(sd));
++	}
++	return 0;
++}
++
++static int stop(struct sdcore *sd)
++{
++	int ret;
++	unsigned int resp[6];
++
++	if (sd->hw_version) return stop2(sd);
++
++	if (sd->parked_sector) {
++		if (sd->sd_state & SDDAT_TX) {
++			/* wait to get out of S_WAIT_BUSY */
++			while ((SDPEEK8(sd, SDSTATE) & 0x7) !=3D S_TX_WRITE)
++			  if (timeout(sd)) break;
++
++			/* abort parked write */
++			SDPOKE8(sd, SDSTATE, S_SEND_CMD | (TYPE_ABORT << 5));
++			sd->sd_state &=3D ~SDDAT_TX;
++			sd->sd_state |=3D SDDAT_RX;
++			ret =3D sdcmd(sd, CMD_STOP_TRANSMISSION, 0, resp, NULL);
++			sd->sd_state &=3D ~SDDAT_RX;
++			SDPOKE8(sd, SDSTATE, S_WAIT_BUSY | (TYPE_BSYRESP << 5));
++		} else {
++			/* abort parked read */
++			SDPOKE8(sd, SDSTATE, S_SEND_CMD | (TYPE_ABORT << 5));
++			ret =3D sdcmd(sd, CMD_STOP_TRANSMISSION, 0, resp, NULL);
++		}
++		sd->parked_sector =3D 0;
++		if (ret || error(resp, CMD_STOP_TRANSMISSION) || timeout(sd))
++		  return 1;
++	}
++	return 0;
++}
++
++static int stop2(struct sdcore *sd)
++{
++	int ret;
++	unsigned int resp[6];
++
++	if (sd->parked_sector) {
++		if (sd->os_irqwait) sd->os_irqwait(sd->os_arg, 0);
++		if (sd->sd_state & SDDAT_TX) {
++			/* abort parked write */
++		 	ret =3D sdcmd2(sd, CMD_STOP_TRANSMISSION, 0, resp, NULL);
++			SDPOKE8(sd, SDCTRL2, 0x0);
++			if (sd->os_irqwait) sd->os_irqwait(sd->os_arg, 5);
++			SDPOKE8(sd, SDGPIO, 0xff);
++
++			/*
++			while ((SDPEEK8(sd, SDGPIO) & 0xf) !=3D 0xf) {
++				sd->os_delay(sd->os_arg, 1);
++				SDPOKE8(sd, SDGPIO, 0xdf);
++				SDPOKE8(sd, SDGPIO, 0xff);
++				if (timeout(sd)) return 1;
++			}
++			*/
++			reset_timeout(sd);
++		} else {
++			/* abort parked read */
++			ret =3D sdcmd2(sd, CMD_STOP_TRANSMISSION, 0, resp, NULL);
++		}
++		sd->parked_sector =3D 0;
++		if (ret || error(resp, CMD_STOP_TRANSMISSION) || timeout(sd)) {
++			return 1;
++		}
++	}
++	return 0;
++}
++
++static int do_read2(struct sdcore *sd, unsigned int sector, struct sdio=
v *iov,
++  unsigned int iovcnt)
++{
++	unsigned int ret, n, s, sz;
++	unsigned char *datptr, *dat;
++
++	if (iovcnt =3D=3D 0) return 0;
++
++	if (activate(sd)) return 1;
++
++	n =3D iov->sdiov_nsect;
++	datptr =3D dat =3D iov->sdiov_base;
++	sz =3D sdsize(sd);
++	if (sector >=3D sz) return 0;
++
++	if (sd->parked_sector) {
++		if (!(sd->sd_state & SDDAT_TX) && sd->parked_sector =3D=3D sector) {
++			if (sd->os_irqwait && !sd->os_dmastream)
++			  sd->os_irqwait(sd->os_arg, 3);
++			goto receive;
++		}
++
++		stop2(sd);
++	}
++
++	if (sd->sd_state & SD_HC)
++	  ret =3D sdcmd2(sd, CMD_READ_MULTIPLE_BLOCK2, sector, NULL, NULL);
++	else
++	  ret =3D sdcmd2(sd, CMD_READ_MULTIPLE_BLOCK2, sector * 512, NULL, NUL=
L);
++
++	do {
++		if (timeout(sd)) return 1;;
++		SDPOKE8(sd, SDGPIO, 0xdf);
++		s =3D SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, 0xff);
++	} while ((s & 0xf) !=3D 0x0);
++	reset_timeout(sd);
++
++receive:
++	if (sd->os_dmaprep && sd->os_dmastream)
++	  sd->os_dmaprep(sd->os_arg, datptr, n * 512);
++
++	SDPOKE8(sd, SDGPIO, 0xdf);
++	sd->parked_sector =3D sector + n;
++
++nextiov:
++	if (sd->parked_sector > sz) {
++		n -=3D sd->parked_sector - sz;
++		sd->parked_sector =3D sz;
++	}
++	datssp_stream2(sd, &datptr, n * 512);
++
++	if (--iovcnt) {
++		++iov;
++		n =3D iov->sdiov_nsect;
++		datptr =3D iov->sdiov_base;
++		sd->parked_sector +=3D n;
++		if (sd->os_dmaprep && sd->os_dmastream)
++		  sd->os_dmaprep(sd->os_arg, datptr, n * 512);
++		goto nextiov;
++	}
++
++	/* s =3D SDPEEK8(sd, SDSTAT2);
++	if (s & 0x44) {
++		sd->sd_timeout =3D 1000001;
++		return 1;
++	}
++	else */ return 0;
++}
++
++static int do_read(struct sdcore *sd, unsigned int sector, struct sdiov=
 *iov,
++  unsigned int iovcnt)
++{
++	unsigned int resp[6], ret, n, sz;
++	unsigned char *datptr, *dat;
++
++	if (iovcnt =3D=3D 0) return 0;
++
++	n =3D iov->sdiov_nsect;
++	datptr =3D dat =3D iov->sdiov_base;
++	sz =3D sdsize(sd);
++	if (sector >=3D sz) return 0;
++
++	if (sd->parked_sector) {
++		if (!(sd->sd_state & SDDAT_TX) && sd->parked_sector =3D=3D sector)
++		  goto receive;
++
++		stop(sd);
++	}
++
++	if (sd->sd_state & SD_HC)
++	  ret =3D sdcmd(sd, CMD_READ_MULTIPLE_BLOCK, sector, resp, &datptr);
++	else
++	  ret =3D sdcmd(sd, CMD_READ_MULTIPLE_BLOCK, sector * 512, resp, &datp=
tr);
++	if (ret || error(resp, CMD_READ_MULTIPLE_BLOCK)) return 1;
++
++receive:
++	if (sd->os_dmaprep && sd->os_dmastream)
++	  sd->os_dmaprep(sd->os_arg, datptr, n * 512 - (datptr - dat));
++
++	datssp_stream(sd, &datptr, 512 - (datptr - dat));
++	datssp_stream(sd, NULL, 6);
++
++	sd->parked_sector =3D sector + n;
++	if (sd->parked_sector > sz) {
++		n -=3D sd->parked_sector - sz;
++		sd->parked_sector =3D sz;
++	}
++	n--;
++
++nextiov:
++	while (n--) {
++		SDPOKE8(sd, SDSTATE, S_WAIT_RESP | (TYPE_RXDAT << 5));
++		datssp_stream(sd, NULL, 2); // last part of prev CRC
++		datssp_stream(sd, &datptr, 512);
++		datssp_stream(sd, NULL, 6); // first part of CRC
++	}
++
++	if (--iovcnt) {
++		++iov;
++		n =3D iov->sdiov_nsect;
++		datptr =3D iov->sdiov_base;
++		sd->parked_sector +=3D n;
++		if (sd->parked_sector > sz) {
++			n -=3D sd->parked_sector - sz;
++			sd->parked_sector =3D sz;
++		}
++		if (sd->os_dmaprep && sd->os_dmastream && n > 0)
++		  sd->os_dmaprep(sd->os_arg, datptr, n * 512);
++		goto nextiov;
++	}
++
++	SDPOKE8(sd, SDSTATE, S_WAIT_RESP | (TYPE_RXDAT << 5));
++	datssp_stream(sd, NULL, 2); // last part of prev CRC
++	return 0;
++}
++
++static int do_write2(struct sdcore *sd, unsigned int sector, struct sdi=
ov *iov,
++  unsigned int iovcnt)
++{
++	unsigned char *datptr;
++	unsigned int resp[6], ret, n, s, sz, ss;
++
++	if (sd->sd_wprot) return 1;
++
++	if (iovcnt =3D=3D 0) return 0;
++
++	if (activate(sd)) return 1;
++
++	sz =3D sdsize(sd);
++	if (sector >=3D sz) return 0;
++
++	if (sd->os_powerok) {
++		int ok =3D sd->os_powerok(sd);
++		if (!ok && sd->parked_sector) {
++			stop2(sd);
++			return 1;
++		} else if (!ok) return 1;
++	}
++
++	if (sd->parked_sector) {
++		if ((sd->sd_state & SDDAT_TX) && sd->parked_sector =3D=3D sector)
++		  goto transmit;
++
++		stop2(sd);
++	}
++
++	if (sd->sd_erasehint) {
++		sdcmd2(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++		sdcmd2(sd, ACMD_SET_WR_BLK_ERASE_COUNT, sd->sd_erasehint,
++		  NULL, NULL);
++		sd->sd_erasehint =3D 0;
++	}
++
++	if (sd->sd_state & SD_HC)
++	  ret =3D sdcmd2(sd, CMD_WRITE_MULTIPLE_BLOCK, sector, resp, NULL);
++	else
++	  ret =3D sdcmd2(sd, CMD_WRITE_MULTIPLE_BLOCK, sector * 512, resp, NUL=
L);
++	if (ret || error(resp, CMD_WRITE_MULTIPLE_BLOCK)) {
++		return 1;
++	}
++	sd->parked_sector =3D sector;
++	ss =3D SDPEEK8(sd, SDSTAT2);
++
++transmit:
++	while (iovcnt--) {
++		datptr =3D iov->sdiov_base;
++		n =3D iov->sdiov_nsect;
++		sd->parked_sector +=3D n;
++		if (sd->parked_sector > sz) {
++			n -=3D sd->parked_sector - sz;
++			sd->parked_sector =3D sz;
++		}
++		datssp_stream2(sd, &datptr, n * 512);
++		iov++;
++	}
++
++	if (!sd->sd_writeparking) {
++		ret =3D stop2(sd);
++		if (ret) return ret;
++	}
++
++	if (sd->os_irqwait) sd->os_irqwait(sd->os_arg, 2);
++
++	s =3D SDPEEK8(sd, SDSTAT2);
++	if (s & 0x44) {
++		sd->sd_timeout =3D 1000001;
++		return 1;
++	} else {
++		reset_timeout(sd);
++		return 0;
++	}
++}
++
++static int do_write(struct sdcore *sd, unsigned int sector, struct sdio=
v *iov,
++  unsigned int iovcnt)
++{
++	unsigned char *datptr, *crcptr, **crcptrptr;
++	unsigned int resp[6], ret, n, sz;
++
++	if (sd->sd_wprot) return 1;
++
++	if (iovcnt =3D=3D 0) return 0;
++
++	sz =3D sdsize(sd);
++	if (sector >=3D sz) return 0;
++
++	if (0 /* sd->sd_crchint */) {
++		// CRC is pre-calculated so don't recalculate
++		crcptr =3D sd->sd_crchint;
++		crcptrptr =3D &crcptr;
++		sd->sd_state |=3D DATSSP_NOCRC;
++		sd->sd_crchint =3D NULL;
++	} else {
++		crcptrptr =3D NULL;
++		sd->sd_state &=3D ~DATSSP_NOCRC;
++	}
++
++	if (sd->parked_sector) {
++		if ((sd->sd_state & SDDAT_TX) && sd->parked_sector =3D=3D sector)
++		  goto transmit;
++
++		stop(sd);
++	}
++
++	if (sd->sd_erasehint) {
++		sdcmd(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++		sdcmd(sd, ACMD_SET_WR_BLK_ERASE_COUNT, sd->sd_erasehint,
++		  NULL, NULL);
++		sd->sd_erasehint =3D 0;
++	}
++
++	if (sd->sd_state & SD_HC)
++	  ret =3D sdcmd(sd, CMD_WRITE_MULTIPLE_BLOCK, sector, resp, NULL);
++	else
++	  ret =3D sdcmd(sd, CMD_WRITE_MULTIPLE_BLOCK, sector * 512, resp, NULL=
);
++	if (ret || error(resp, CMD_WRITE_MULTIPLE_BLOCK)) {
++		return 1;
++	}
++	sd->parked_sector =3D sector;
++
++transmit:
++	while (iovcnt--) {
++		datptr =3D iov->sdiov_base;
++		n =3D iov->sdiov_nsect;
++		sd->parked_sector +=3D n;
++		if (sd->parked_sector > sz) {
++			n -=3D sd->parked_sector - sz;
++			sd->parked_sector =3D sz;
++		}
++		while (n--) {
++			datssp_stream(sd, &datptr, 512);
++			datssp_stream(sd, crcptrptr, 8); // CRC bytes
++			SDPOKE8(sd, SDSTATE, S_CRC_CHECK | (TYPE_TXDAT << 5));
++		}
++		iov++;
++	}
++
++	if (!sd->sd_writeparking) {
++		stop(sd);
++	}
++
++	return 0;
++}
++
++static
++int sdfastinit(struct sdcore *sd)
++{
++	SDPOKE8(sd, SDCTRL, 0x40);
++	sd->sd_state =3D DATSSP_4BIT;
++
++	sd->sd_rcaarg =3D ~sd->sdboot_token;
++	sdcmd(sd, CMD_DESELECT_CARD, ~sd->sd_rcaarg, NULL, NULL);
++	sdcmd(sd, CMD_SEND_CSD, sd->sd_rcaarg, sd->sd_csd, NULL);
++	sdcmd(sd, CMD_SELECT_CARD, sd->sd_rcaarg, NULL, NULL);
++
++	if (sd->os_dmastream) SDPOKE8(sd, SDCTRL, 0x42);
++	if ((SDPEEK8(sd, SDCTRL) & 0x80) || (sd->sd_csd[15] & 0x30))
++	  sd->sd_wprot =3D 1;
++	sd->sd_blocksize =3D 1 << ((sd->sd_csd[6] & 0xf));
++	if (timeout(sd)) return 0;
++	else return sdsize(sd);
++}
++
++static
++int sdreset2(struct sdcore *sd)
++{
++	unsigned int rca, s, i, x;
++	unsigned int resp[17];
++
++	reset_timeout(sd);
++	sd_initcrc(sd);
++	sd->parked_sector =3D 0;
++	sd->sd_wprot =3D 0;
++	sd->sd_blocksize =3D 0;
++	sd->sd_sz =3D 0;
++	if (sd->hw_version =3D=3D 0) sd->hw_version =3D version(sd);
++	if (sd->hw_version =3D=3D 0) return 0;
++	sd->sd_state &=3D SD_RESET;
++	remember_sdcore(sd);
++	activate(sd);
++	sd->sd_state |=3D SD_LOSPEED;
++
++	if (!(sd->sd_state & SD_RESET) && (SDPEEK8(sd, SDGPIO) !=3D 0x0)) {
++		SDPOKE8(sd, SDGPIO, 0x0);
++#ifdef BIGENDIAN
++		for (i =3D 0; i < 8; i++) SDPOKE16(sd, SDLUN2, i << 8);
++#else
++		for (i =3D 0; i < 8; i++) SDPOKE16(sd, SDLUN2, i);
++#endif
++		sd->os_delay(sd->os_arg, 100000);
++
++		/* this was a global reset, so let the other luns know */
++		for (i =3D 0; i < sizeof(sdcores); i++) {
++			if (sdcores[i] =3D=3D NULL) break;
++			if (sdcores[i]->sd_regstart =3D=3D sd->sd_regstart)
++			  sdcores[i]->sd_state |=3D SD_RESET;
++		}
++#ifdef BIGENDIAN
++		SDPOKE16(sd, SDLUN2, sd->sd_lun << 8);
++#else
++		SDPOKE16(sd, SDLUN2, sd->sd_lun);
++#endif
++	}
++	sd->sd_state &=3D ~SD_RESET;
++
++	// gratuitous clocks
++	SDPOKE8(sd, SDGPIO, 0xff);
++	sd->os_delay(sd->os_arg, 5000);
++	for (i =3D 0; i < 750; i++) {
++		SDPOKE8(sd, SDGPIO, 0xff);
++		SDPEEK8(sd, SDGPIO); /* delay */
++		SDPEEK8(sd, SDGPIO); /* delay */
++		SDPOKE8(sd, SDGPIO, 0xdf);
++		SDPEEK8(sd, SDGPIO); /* delay */
++		SDPEEK8(sd, SDGPIO); /* delay */
++	}
++
++	SDPEEK8(sd, SDSTAT2); /* reset any timeout/crc conditions */
++	SDPOKE8(sd, SDSTAT2, 0x18);
++	s =3D sdcmd2(sd, CMD_SEND_IF_COND, 0x1aa, resp, NULL);
++	if (s) {
++		reset_timeout(sd);
++		x =3D 0x00ff0000;
++	} else {
++		x =3D 0x40ff0000;
++	}
++
++	do {
++		sdcmd2(sd, CMD_APP_CMD, 0, NULL, NULL);
++		sdcmd2(sd, ACMD_SD_SEND_OP_COND, x, resp, NULL);
++		if (timeout(sd)) break;
++		// TODO: check for valid result or limit # of loops,
++		// otherwise we may loop forever on malfunctioning cards.
++	} while (((resp[1] & 0x80) =3D=3D 0x0));
++
++	if ((x & 0x40000000) && (resp[1] & 0x40)) {
++		sd->sd_state |=3D SD_HC;
++	}
++
++	sdcmd2(sd, CMD_ALL_SEND_CID, 0, resp, NULL);
++	sdcmd2(sd, CMD_SEND_RELATIVE_ADDR, 0, resp, NULL);
++	rca =3D resp[1] << 8 | resp[2];
++	sd->sd_rcaarg =3D (rca & 0xff00) << 16 | (rca & 0xff) << 16;
++	sd->sdboot_token =3D ~sd->sd_rcaarg;
++
++	sdcmd2(sd, CMD_SEND_CSD, sd->sd_rcaarg, sd->sd_csd, NULL);
++	sdcmd2(sd, CMD_SELECT_CARD, sd->sd_rcaarg, resp, NULL);
++
++	if ((resp[1] & 0x2)) {
++		unsigned int ret =3D 1;
++		sd->sd_locked =3D 1;
++#ifndef SD_NOLOCKSUPPORT
++		if (sd->sd_pwd)
++	 	  ret =3D sdlockctl2(sd, SDLOCK_UNLOCK, sd->sd_pwd, NULL);
++#endif
++		if (ret !=3D 0) return 0;
++	} else sd->sd_locked =3D 0;
++
++	sdcmd2(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++	sdcmd2(sd, ACMD_SET_CLR_CARD_DETECT, 0, NULL, NULL);
++	sdcmd2(sd, CMD_SET_BLOCKLEN, 512, NULL, NULL);
++	sdcmd2(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++	sdcmd2(sd, ACMD_SET_BUS_WIDTH, 2, resp, NULL);
++	sd->sd_state |=3D DATSSP_4BIT;
++	sd->sd_state &=3D ~SD_LOSPEED;
++
++	sdcmd2(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++	sdcmd2(sd, ACMD_SEND_SCR2, 0, NULL, NULL);
++	do {
++		if (timeout(sd)) break;
++		SDPOKE8(sd, SDGPIO, 0xdf);
++		SDPEEK8(sd, SDGPIO);
++		s =3D SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, 0xff);
++		SDPEEK8(sd, SDGPIO);
++	} while ((s & 0xf) !=3D 0x0);
++	for (i =3D 0; i < 16; i++) {
++		SDPOKE8(sd, SDGPIO, 0xdf);
++		SDPEEK8(sd, SDGPIO);
++		s =3D (SDPEEK8(sd, SDGPIO) & 0xf) << 4;
++		SDPOKE8(sd, SDGPIO, 0xff);
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, 0xdf);
++		SDPEEK8(sd, SDGPIO);
++		s |=3D (SDPEEK8(sd, SDGPIO) & 0xf);
++		SDPOKE8(sd, SDGPIO, 0xff);
++		SDPEEK8(sd, SDGPIO);
++		if (i < 8) sd->sd_scr[i] =3D s;
++	}
++	for (i =3D 0; i < 8; i++) {
++		SDPOKE8(sd, SDGPIO, 0xdf);
++		SDPEEK8(sd, SDGPIO);
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, 0xff);
++		SDPEEK8(sd, SDGPIO);
++	}
++	sd->sd_state &=3D ~SDDAT_RX;
++
++#ifndef SD_NOHIGHSPEED
++	if ((sd->sd_scr[0] & 0xf) >=3D 1) { // SD version >=3D 1.10
++		unsigned char dat[64];
++		sdcmd2(sd, CMD_SWITCH_FUNC2, 0x80fffff1, NULL, NULL);
++		do {
++			if (timeout(sd)) break;
++			SDPOKE8(sd, SDGPIO, 0xdf);
++			SDPEEK8(sd, SDGPIO);
++			s =3D SDPEEK8(sd, SDGPIO);
++			SDPOKE8(sd, SDGPIO, 0xff);
++			SDPEEK8(sd, SDGPIO);
++		} while ((s & 0xf) !=3D 0x0);
++		for (i =3D 0; i < 72; i++) {
++			SDPOKE8(sd, SDGPIO, 0xdf);
++			SDPEEK8(sd, SDGPIO);
++			s =3D (SDPEEK8(sd, SDGPIO) & 0xf) << 4;
++			SDPOKE8(sd, SDGPIO, 0xff);
++			SDPEEK8(sd, SDGPIO);
++			SDPOKE8(sd, SDGPIO, 0xdf);
++			SDPEEK8(sd, SDGPIO);
++			s |=3D (SDPEEK8(sd, SDGPIO) & 0xf);
++			SDPOKE8(sd, SDGPIO, 0xff);
++			SDPEEK8(sd, SDGPIO);
++			if (i < 64) dat[i] =3D s;
++		}
++		for (i =3D 0; i < 8; i++) {
++			SDPOKE8(sd, SDGPIO, 0xdf);
++			SDPEEK8(sd, SDGPIO);
++			SDPEEK8(sd, SDGPIO);
++			SDPOKE8(sd, SDGPIO, 0xff);
++			SDPEEK8(sd, SDGPIO);
++		}
++		sd->sd_state &=3D ~SDDAT_RX;
++		if (dat[0] | dat[1]) {
++			SDPOKE8(sd, SDSTAT2, 0x38);
++			sd->sd_state |=3D SD_HISPEED;
++		}
++	}
++#endif
++
++#ifdef BIGENDIAN
++	if ((sd->sd_csd[15] & 0x30) || (SDPEEK16(sd, SDGPIO) & 0x2))
++#else
++	if ((sd->sd_csd[15] & 0x30) || (SDPEEK16(sd, SDGPIO) & 0x200))
++#endif
++		sd->sd_wprot =3D 1;
++	sd->sd_blocksize =3D 1 << ((sd->sd_csd[6] & 0xf));
++	if (timeout(sd)) return 0;
++	else {
++		reset_timeout(sd);
++		return sdsize(sd);
++	}
++}
++
++/*
++ * return 0 : 8 bit TS-SDCORE v1
++ * return 1 : 8 bit 4x8 TS-SDCORE v2
++ * return 2 : 32 bit 4x32 TS-SDCORE v2
++ * return 3 : 16 bit 4x32 TS-SDCORE v2
++ * return 4 : 8 bit 4x32 TS-SDCORE v2
++ */
++static int version(struct sdcore *sd)
++{
++	int a, b, i;
++
++
++#ifdef SD_FORCEVERSION
++	return SD_FORCEVERSION;
++#endif
++	for (i =3D 0; i < sizeof(sdcores); i++) {
++		if (sdcores[i] =3D=3D NULL) break;
++		if (sdcores[i]->sd_regstart =3D=3D sd->sd_regstart)
++		  return sdcores[i]->hw_version;
++	}
++
++	a =3D SDPEEK8(sd, 3);
++	SDPOKE8(sd, 3, (a ^ 0x40));
++	b =3D SDPEEK8(sd, 3);
++	SDPOKE8(sd, 3, a);
++	if ((a & 0x40) ^ (b & 0x40)) return 0;
++	else if (a & 0x40) return 1;
++	/* either 2, 3, or 4 */
++	a =3D SDPEEK32(sd, 12);
++	b =3D SDPEEK16(sd, 12);
++#ifdef BIGENDIAN
++	if ((a & 0x40000000) && (b & 0x4000)) return 2;
++#else
++	if ((a & 0x40) && (b & 0x40)) return 2;
++#endif
++	a =3D SDPEEK8(sd, 12);
++	if (a & 0x40) return 3;
++	else return 4;
++}
++
++int sdreset(struct sdcore *sd)
++{
++	unsigned int rca, s, x;
++	unsigned int resp[17];
++
++	reset_timeout(sd);
++	sd_initcrc(sd);
++	sd->parked_sector =3D 0;
++	sd->sd_wprot =3D 0;
++	sd->sd_blocksize =3D 0;
++	sd->sd_sz =3D 0;
++
++	sd->hw_version =3D version(sd);
++	if (sd->hw_version >=3D 2) return sdreset2(sd);
++
++	// check for no SD card present
++	if (SDPEEK8(sd, SDCTRL) & 0x8) return 0;
++
++	if (sd->sdboot_token) {
++		int ret =3D sdfastinit(sd);
++		sd->sdboot_token =3D 0;
++		if (ret) return ret;
++	}
++
++	// set controller for 1-bit mode, slow clock
++	SDPOKE8(sd, SDCTRL, 0x20);
++
++	SDPOKE8(sd, SDSTATE, S_DUMMY_CLK);
++	sd->sd_state =3D SDCMD_RX|SDDAT_RX;
++	s =3D SDPEEK8(sd, SDSTATE);
++	while ((s & 0x7) !=3D S_SEND_CMD) {
++		// If we timeout here, it would be VERY BAD as we have no
++		// further recourse to set things right if we can't turn
++		// the SD off.
++		if (timeout(sd)) return 0;
++		sd->os_delay(sd->os_arg, 10000);
++		sd->sd_timeout +=3D 10000;
++
++		// We won't be able to change state until both SSPs are empty
++		s =3D tend_ssp(sd, NULL, NULL);
++	}
++	SDPOKE8(sd, SDSTATE, S_OFF);
++	sd->sd_state =3D 0;
++
++	sd->os_delay(sd->os_arg, 50000);
++
++	SDPOKE8(sd, SDSTATE, S_DUMMY_CLK);
++	sd->os_delay(sd->os_arg, 100000);
++	if ((SDPEEK8(sd, SDSTATE) & 0x7) =3D=3D S_OFF) {
++		// No card present
++		return 0;
++	}
++
++	SDPOKE8(sd, SDSTATE, S_WAIT_RESP);
++	// clock will freerun waiting for a response that will never come
++	sd->os_delay(sd->os_arg, 50000);
++
++	SDPOKE8(sd, SDSTATE, S_DUMMY_CLK);
++
++	s =3D sdcmd(sd, CMD_SEND_IF_COND, 0x1aa, resp, NULL);
++	if (s) {
++		reset_timeout(sd);
++		SDPOKE8(sd, SDSTATE, S_DUMMY_CLK);
++		x =3D 0x00ff0000;
++	} else {
++		x =3D 0x40ff0000;
++	}
++
++	do {
++		sdcmd(sd, CMD_APP_CMD, 0, NULL, NULL);
++		sdcmd(sd, ACMD_SD_SEND_OP_COND, x, resp, NULL);
++		if (timeout(sd)) break;
++	} while (((resp[1] & 0x80) =3D=3D 0x0));
++
++	if ((x & 0x40000000) && (resp[1] & 0x40)) sd->sd_state |=3D SD_HC;
++
++	sdcmd(sd, CMD_ALL_SEND_CID, 0, resp, NULL);
++	sdcmd(sd, CMD_SEND_RELATIVE_ADDR, 0, resp, NULL);
++	rca =3D resp[1] << 8 | resp[2];
++	sd->sd_rcaarg =3D (rca & 0xff00) << 16 | (rca & 0xff) << 16;
++	sd->sdboot_token =3D ~sd->sd_rcaarg;
++
++	sdcmd(sd, CMD_SEND_CSD, sd->sd_rcaarg, sd->sd_csd, NULL);
++	sdcmd(sd, CMD_SELECT_CARD, sd->sd_rcaarg, resp, NULL);
++
++	if ((resp[1] & 0x2)) {
++		unsigned int ret =3D 1;
++		sd->sd_locked =3D 1;
++#ifndef SD_NOLOCKSUPPORT
++		if (sd->sd_pwd)
++	 	  ret =3D sdlockctl(sd, SDLOCK_UNLOCK, sd->sd_pwd, NULL);
++#endif
++		if (ret !=3D 0) return 0;
++	} else sd->sd_locked =3D 0;
++
++	sdcmd(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++	sdcmd(sd, ACMD_SET_CLR_CARD_DETECT, 0, NULL, NULL);
++	/*
++	sdcmd(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++	sdcmd(sd, ACMD_SEND_SCR, 0, NULL, &datptr);
++	while ((datptr - sd->sd_scr) !=3D 8) {
++		if (timeout(sd)) return 1;
++		tend_ssp(sd, NULL, &datptr);
++	}
++	datssp_stream(sd, NULL, 3);
++	SDPOKE8(sd, SDSTATE, (TYPE_ABORT << 5) | S_SEND_CMD);
++	sd->sd_state |=3D SDCMD_RX|SDDAT_RX;
++	while ((SDPEEK8(sd, SDSTATE) & 0x17) !=3D S_SEND_CMD) {
++		if (timeout(sd)) break;
++		tend_ssp(sd, NULL, NULL);
++	}
++	sd->sd_state &=3D ~(SDCMD_RX|SDDAT_RX);
++	if ((sd->sd_scr[0] & 0xf) >=3D 1) { // SD version >=3D 1.10
++		unsigned char dat[64];
++		datptr =3D dat;
++		sdcmd(sd, CMD_SWITCH_FUNC, 0x80fffff1, NULL, &datptr);
++		while ((datptr - dat) !=3D 64) {
++			if (timeout(sd)) break;
++			tend_ssp(sd, NULL, &datptr);
++		}
++		datssp_stream(sd, NULL, 3);
++		SDPOKE8(sd, SDSTATE, (TYPE_ABORT << 5) | S_SEND_CMD);
++		sd->sd_state |=3D SDCMD_RX|SDDAT_RX;
++		while ((SDPEEK8(sd, SDSTATE) & 0x7) !=3D S_SEND_CMD) {
++			if (timeout(sd)) break;
++			tend_ssp(sd, NULL, NULL);
++		}
++		sd->sd_state &=3D ~(SDCMD_RX|SDDAT_RX);
++	}
++	*/
++
++	sdcmd(sd, CMD_SET_BLOCKLEN, 512, NULL, NULL);
++	sdcmd(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++	sdcmd(sd, ACMD_SET_BUS_WIDTH, 2, resp, NULL);
++
++	// set controller for 4-bit mode, fast clock
++	SDPOKE8(sd, SDCTRL, (0x40 | (sd->os_dmastream ? 0x2 : 0x0)));
++	sd->sd_state |=3D DATSSP_4BIT;
++
++	/*
++	sdcmd(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++	sdcmd(sd, ACMD_SEND_SCR, 0, NULL, &datptr);
++	while ((datptr - sd->sd_scr) !=3D 8) {
++		if (timeout(sd)) break;
++		tend_ssp(sd, NULL, &datptr);
++	}
++	datssp_stream(sd, NULL, 6);
++	SDPOKE8(sd, SDSTATE, S_DUMMY_CLK | (TYPE_SHORTRESP << 5));
++	bzero(resp, 6 * 4);
++	sdcmd(sd, CMD_SEND_STATUS, 0, resp, NULL);
++	*/
++
++	if ((SDPEEK8(sd, SDCTRL) & 0x80) || (sd->sd_csd[15] & 0x30))
++		sd->sd_wprot =3D 1;
++	sd->sd_blocksize =3D 1 << ((sd->sd_csd[6] & 0xf));
++	if (timeout(sd) || error(resp, ACMD_SET_BUS_WIDTH)) return 0;
++	else return sdsize(sd);
++}
++
++static
++int sdread2(struct sdcore *sd, unsigned int sector, unsigned char *dat,
++  int nsectors)
++{
++	struct sdiov iov;
++	int ret;
++
++	iov.sdiov_base =3D dat;
++	iov.sdiov_nsect =3D nsectors;
++	ret =3D do_read2(sd, sector, &iov, 1);
++	return ret;
++}
++
++int sdread(struct sdcore *sd, unsigned int sector, unsigned char *dat,
++  int nsectors)
++{
++	struct sdiov iov;
++	int ret;
++
++	iov.sdiov_base =3D dat;
++	iov.sdiov_nsect =3D nsectors;
++	if (sd->hw_version =3D=3D 0) ret =3D do_read(sd, sector, &iov, 1);
++	else ret =3D do_read2(sd, sector, &iov, 1);
++	return ret;
++}
++
++int sdwrite(struct sdcore *sd, unsigned int sector, unsigned char *dat,
++  int nsectors)
++{
++	struct sdiov iov;
++	unsigned int ret;
++
++	iov.sdiov_base =3D dat;
++	iov.sdiov_nsect =3D nsectors;
++	if (sd->hw_version =3D=3D 0) ret =3D do_write(sd, sector, &iov, 1);
++	else ret =3D do_write2(sd, sector, &iov, 1);
++	return ret;
++
++}
++
++int sdreadv(struct sdcore *sd, unsigned int sector, struct sdiov *iov,
++  int niov)
++{
++	if (sd->hw_version =3D=3D 0) return do_read(sd, sector, iov, niov);
++	else return do_read2(sd, sector, iov, niov);
++}
++
++int sdwritev(struct sdcore *sd, unsigned int sector, struct sdiov *iov,
++  int niov)
++{
++	if (sd->hw_version =3D=3D 0) return do_write(sd, sector, iov, niov);
++	else return do_write2(sd, sector, iov, niov);
++}
++
++static
++int sdsetwprot2(struct sdcore *sd, unsigned int perm)
++{
++	int i, ret, s;
++	unsigned int csd[16], resp[6];
++	unsigned char csdchars[16];
++	unsigned char *csdptr =3D csdchars;
++
++	stop2(sd);
++
++	perm =3D perm ? 0x3 : 0x1;
++	for (i =3D 0; i < 16; i++) csd[i] =3D sd->sd_csd[i + 1];
++	csd[14] &=3D ~(0x3 << 4);
++	csd[14] |=3D (perm << 4);
++	csd[15] =3D 0x1 | crc7(0, csd, 15) << 1;
++	for (i =3D 0; i < 16; i++) csdchars[i] =3D csd[i];
++
++	ret =3D sdcmd2(sd, CMD_PROGRAM_CSD, 0, resp, NULL);
++	if (ret || error(resp, CMD_PROGRAM_CSD)) return 1;
++	for (i =3D 0; i < 16; i++) {
++		s =3D *csdptr++;
++		sd_4bit_feedcrc(sd, s);
++		SDPOKE8(sd, SDGPIO, (0x10|((s & 0xf0) >> 4)));
++		SDPEEK8(sd, SDGPIO);
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, (0x30|((s & 0xf0) >> 4)));
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, (0x10|(s & 0xf)));
++		SDPEEK8(sd, SDGPIO);
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, (0x30|(s & 0xf)));
++		SDPEEK8(sd, SDGPIO);
++	}
++	for (i =3D 0; i < 8; i++) {
++		s =3D sd_4bit_getcrc(sd);
++		SDPOKE8(sd, SDGPIO, (0x10|((s & 0xf0) >> 4)));
++		SDPEEK8(sd, SDGPIO);
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, (0x30|((s & 0xf0) >> 4)));
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, (0x10|(s & 0xf)));
++		SDPEEK8(sd, SDGPIO);
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, (0x30|(s & 0xf)));
++		SDPEEK8(sd, SDGPIO);
++	}
++	// End bit
++	SDPOKE8(sd, SDGPIO, 0x1f);
++	SDPEEK8(sd, SDGPIO);
++	SDPEEK8(sd, SDGPIO);
++	SDPOKE8(sd, SDGPIO, 0x3f);
++	SDPEEK8(sd, SDGPIO);
++	SDPOKE8(sd, SDGPIO, 0xbf);  //  tristate dat
++	// CRC ack
++	s =3D 0;
++	for (i =3D 0; i < 7; i++) {
++		SDPOKE8(sd, SDGPIO, 0x9f);  // clk negedge
++		SDPEEK8(sd, SDGPIO);        // delay
++		s =3D s << 1;
++		s |=3D (SDPEEK8(sd, SDGPIO) & 0x1);
++		SDPOKE8(sd, SDGPIO, 0xbf);  // clk posedge
++	}
++	if ((s & 0xf) !=3D 0x5) return 1;
++	// wait for unbusy
++	s =3D 0;
++	while ((s & 0x7) !=3D 0x7) {
++		if (timeout(sd)) break;
++		SDPOKE8(sd, SDGPIO, 0x9f);  // clk negedge
++		SDPEEK8(sd, SDGPIO);        // delay
++		s =3D s << 1;
++		s |=3D SDPEEK8(sd, SDGPIO) & 0x1;
++		SDPOKE8(sd, SDGPIO, 0xbf);
++	}
++	for (i =3D 0; i < 8; i++) {
++		SDPOKE8(sd, SDGPIO, 0x9f);
++		SDPEEK8(sd, SDGPIO);
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, 0xbf);
++		SDPEEK8(sd, SDGPIO);
++	}
++	sd->sd_state &=3D ~SDDAT_TX;
++
++	sdcmd2(sd, CMD_DESELECT_CARD, ~sd->sd_rcaarg, NULL, NULL);
++	ret =3D sdcmd2(sd, CMD_SEND_CSD, sd->sd_rcaarg, sd->sd_csd, NULL);
++	if (ret || sd->sd_csd[15] !=3D csd[14]) {
++		return 1;
++	}
++	sdcmd2(sd, CMD_SELECT_CARD, sd->sd_rcaarg, resp, NULL);
++
++	sd->sd_wprot =3D 1;
++	return 0;
++}
++
++int sdsetwprot(struct sdcore *sd, unsigned int perm)
++{
++	int i, ret;
++	unsigned int csd[16], resp[6];
++	unsigned char csdchars[16];
++	unsigned char *csdptr =3D csdchars;
++
++	if (sd->hw_version) return sdsetwprot2(sd, perm);
++
++	if (stop(sd)) return 1;
++
++	perm =3D perm ? 0x3 : 0x1;
++	for (i =3D 0; i < 16; i++) csd[i] =3D sd->sd_csd[i + 1];
++	csd[14] &=3D ~(0x3 << 4);
++	csd[14] |=3D (perm << 4);
++	csd[15] =3D 0x1 | crc7(0, csd, 15) << 1;
++	for (i =3D 0; i < 16; i++) csdchars[i] =3D csd[i];
++
++	ret =3D sdcmd(sd, CMD_PROGRAM_CSD, 0, resp, NULL);
++	if (ret || error(resp, CMD_PROGRAM_CSD)) return 1;
++	datssp_stream(sd, &csdptr, 16);
++	datssp_stream(sd, NULL, 8);
++	SDPOKE8(sd, SDSTATE, S_CRC_CHECK | (TYPE_BSYRESP << 5));
++	sd->sd_state &=3D ~SDDAT_TX;
++
++	sdcmd(sd, CMD_DESELECT_CARD, ~sd->sd_rcaarg, NULL, NULL);
++	ret =3D sdcmd(sd, CMD_SEND_CSD, sd->sd_rcaarg, sd->sd_csd, NULL);
++	if (ret || sd->sd_csd[15] !=3D csd[14]) {
++		return 1;
++	}
++	sdcmd(sd, CMD_SELECT_CARD, sd->sd_rcaarg, resp, NULL);
++
++	sd->sd_wprot =3D 1;
++	return 0;
++}
++
++#ifndef SD_NOLOCKSUPPORT
++int sdlockctl(struct sdcore *sd, unsigned int cmd, unsigned char *pwd,
++  unsigned char *sdbootdat)
++{
++	unsigned char pwddat[18];
++	unsigned char *pwdptr =3D pwddat;
++	unsigned int resp[6];
++	int ret, i, len;
++	int ccc =3D (sd->sd_csd[5] << 4) | (sd->sd_csd[6] >> 4);
++
++	if (sd->hw_version) return sdlockctl2(sd, cmd, pwd, sdbootdat);
++
++	if (!(ccc & 0x80)) return 1; // Class 7 is lock-unlock commands
++
++	if (pwd =3D=3D NULL && cmd !=3D SDLOCK_ERASE) return 1;
++
++	if (stop(sd)) return 1;
++
++	if (sd->sd_state & DATSSP_4BIT) {
++		int oldctrl =3D SDPEEK8(sd, SDCTRL);
++		int ret;
++
++		sdcmd(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++		sdcmd(sd, ACMD_SET_BUS_WIDTH, 0, NULL, NULL);
++		SDPOKE8(sd, SDCTRL, 0x20);
++		sd->sd_state &=3D ~DATSSP_4BIT;
++		ret =3D sdlockctl(sd, cmd, pwd, sdbootdat);
++		sdcmd(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++		sdcmd(sd, ACMD_SET_BUS_WIDTH, 2, NULL, NULL);
++		sd->sd_state |=3D DATSSP_4BIT;
++		SDPOKE8(sd, SDCTRL, oldctrl);
++		return ret;
++	}
++
++	pwddat[0] =3D cmd;
++	if (cmd !=3D SDLOCK_ERASE) {
++		pwddat[1] =3D 16; // length
++		for (i =3D 0; i < 16; i++) {
++			pwddat[2 + i] =3D pwd[i];
++		}
++	}
++
++	if (cmd =3D=3D SDLOCK_ERASE) len =3D 1; else len =3D 18;
++	ret =3D sdcmd(sd, CMD_SET_BLOCKLEN, len, resp, NULL);
++	if (ret || error(resp, CMD_SET_BLOCKLEN)) return 1;
++	ret =3D sdcmd(sd, CMD_LOCK_UNLOCK, 0, resp, NULL);
++	if (ret || error(resp, CMD_LOCK_UNLOCK)) return 1;
++
++	while ((pwdptr - pwddat) !=3D len) {
++		if (timeout(sd)) return 1;
++		tend_ssp(sd, NULL, &pwdptr);
++	}
++
++	if (sd->sd_state & DATSSP_4BIT) datssp_stream(sd, NULL, 8);
++	else datssp_stream(sd, NULL, 2);
++
++	SDPOKE8(sd, SDSTATE, S_CRC_CHECK | (TYPE_BSYRESP << 5));
++	sd->sd_state &=3D ~SDDAT_TX;
++	ret =3D sdcmd(sd, CMD_SET_BLOCKLEN, 512, resp, NULL);
++	if (ret || error(resp, CMD_SET_BLOCKLEN)) return 1;
++	ret =3D sdcmd(sd, CMD_SEND_STATUS, sd->sd_rcaarg, resp, NULL);
++	if (ret || error(resp, CMD_SEND_STATUS)) return 1;
++
++	if ((cmd =3D=3D SDLOCK_ERASE || cmd =3D=3D SDLOCK_UNLOCK ||
++	  cmd =3D=3D SDLOCK_CLRPWD) && (resp[1] & 0x2)) {
++		return 1;
++	}
++
++	if (sdbootdat) {
++		sdbootdat[0] =3D SDLOCK_UNLOCK;
++		for (i =3D 1; i < 18; i++) {
++			sdbootdat[i] =3D pwddat[i];
++			sd_1bit_feedcrc(sd, pwddat[i]);
++		}
++		sdbootdat[18] =3D sd_1bit_getcrc(sd);
++		sdbootdat[19] =3D sd_1bit_getcrc(sd);
++	}
++
++	return 0;
++}
++
++static
++int sdlockctl2(struct sdcore *sd, unsigned int cmd, unsigned char *pwd,
++  unsigned char *sdbootdat)
++{
++	unsigned char pwddat[18];
++	unsigned char *pwdptr =3D pwddat;
++	unsigned int resp[6];
++	int ret, i, j, len, s;
++	int ccc =3D (sd->sd_csd[5] << 4) | (sd->sd_csd[6] >> 4);
++
++	if (!(ccc & 0x80)) return 1; // Class 7 is lock-unlock commands
++
++	if (pwd =3D=3D NULL && cmd !=3D SDLOCK_ERASE) return 1;
++
++	stop2(sd);
++
++	if (sd->sd_state & DATSSP_4BIT) {
++		int ret;
++
++		sdcmd2(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++		sdcmd2(sd, ACMD_SET_BUS_WIDTH, 0, NULL, NULL);
++		sd->sd_state &=3D ~DATSSP_4BIT;
++		ret =3D sdlockctl2(sd, cmd, pwd, sdbootdat);
++		sdcmd2(sd, CMD_APP_CMD, sd->sd_rcaarg, NULL, NULL);
++		sdcmd2(sd, ACMD_SET_BUS_WIDTH, 2, NULL, NULL);
++		sd->sd_state |=3D DATSSP_4BIT;
++		return ret;
++	}
++
++	pwddat[0] =3D cmd;
++	if (cmd !=3D SDLOCK_ERASE) {
++		pwddat[1] =3D 16; // length
++		for (i =3D 0; i < 16; i++) {
++			pwddat[2 + i] =3D pwd[i];
++		}
++	}
++
++	if (cmd =3D=3D SDLOCK_ERASE) len =3D 1; else len =3D 18;
++	ret =3D sdcmd2(sd, CMD_SET_BLOCKLEN, len, resp, NULL);
++	if (ret || error(resp, CMD_SET_BLOCKLEN)) return 1;
++	ret =3D sdcmd2(sd, CMD_LOCK_UNLOCK, 0, resp, NULL);
++	if (ret || error(resp, CMD_LOCK_UNLOCK)) return 1;
++
++	for (i =3D 0; i < len; i++) {
++		unsigned int b =3D *pwdptr++;
++		unsigned int x;
++
++		sd_1bit_feedcrc(sd, b);
++		for (j =3D 0; j < 8; j++) {
++			x =3D 0x1e | ((b >> 7) & 0x1);
++			b =3D b << 1;
++			SDPOKE8(sd, SDGPIO, x);  // clk negedge
++			SDPEEK8(sd, SDGPIO);
++			SDPEEK8(sd, SDGPIO);
++			x |=3D 0x20;
++			SDPOKE8(sd, SDGPIO, x);  // clk posedge
++			SDPEEK8(sd, SDGPIO);
++		}
++	}
++	for (i =3D 0; i < 2; i++) {
++		unsigned int b =3D sd_1bit_getcrc(sd);
++		unsigned int x;
++
++		for (j =3D 0; j < 8; j++) {
++			x =3D 0x1e | ((b >> 7) & 0x1);
++			b =3D b << 1;
++			SDPOKE8(sd, SDGPIO, x);  // clk negedge
++			SDPEEK8(sd, SDGPIO);
++			SDPEEK8(sd, SDGPIO);
++			x |=3D 0x20;
++			SDPOKE8(sd, SDGPIO, x);  // clk posedge
++			SDPEEK8(sd, SDGPIO);
++		}
++	}
++	// End bit
++	SDPOKE8(sd, SDGPIO, 0x1f);  // clk negedge
++	SDPEEK8(sd, SDGPIO);
++	SDPOKE8(sd, SDGPIO, 0xbf);  // clk posedge, tristate dat
++	// CRC ack
++	s =3D 0;
++	for (i =3D 0; i < 7; i++) {
++		SDPOKE8(sd, SDGPIO, 0x9f);  // clk negedge
++		SDPEEK8(sd, SDGPIO);        // delay
++		s =3D s << 1;
++		s |=3D SDPEEK8(sd, SDGPIO) & 0x1;
++		SDPOKE8(sd, SDGPIO, 0xbf);  // clk posedge
++		SDPEEK8(sd, SDGPIO);
++	}
++	if ((s & 0xf) !=3D 0x5) return 1;
++
++	// wait for unbusy
++	s =3D 0;
++	while ((s & 0x7) !=3D 0x7) {
++		if (timeout(sd)) break;
++		SDPOKE8(sd, SDGPIO, 0x9f);  // clk negedge
++		SDPEEK8(sd, SDGPIO);        // delay
++		s =3D s << 1;
++		s |=3D SDPEEK8(sd, SDGPIO) & 0x1;
++		SDPOKE8(sd, SDGPIO, 0xbf);
++		SDPEEK8(sd, SDGPIO);
++	}
++	for (i =3D 0; i < 8; i++) {
++		SDPOKE8(sd, SDGPIO, 0x9f);
++		SDPEEK8(sd, SDGPIO);
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, 0xbf);
++		SDPEEK8(sd, SDGPIO);
++	}
++
++	sd->sd_state &=3D ~SDDAT_TX;
++	ret =3D sdcmd2(sd, CMD_SET_BLOCKLEN, 512, resp, NULL);
++	if (ret || error(resp, CMD_SET_BLOCKLEN)) {
++		return 1;
++	}
++	ret =3D sdcmd2(sd, CMD_SEND_STATUS, sd->sd_rcaarg, resp, NULL);
++	if (ret || error(resp, CMD_SEND_STATUS)) {
++		return 1;
++	}
++
++	if ((cmd =3D=3D SDLOCK_ERASE || cmd =3D=3D SDLOCK_UNLOCK ||
++	  cmd =3D=3D SDLOCK_CLRPWD) && (resp[1] & 0x2)) {
++		return 1;
++	}
++
++	if (sdbootdat) {
++		sdbootdat[0] =3D SDLOCK_UNLOCK;
++		for (i =3D 1; i < 18; i++) {
++			sdbootdat[i] =3D pwddat[i];
++			sd_1bit_feedcrc(sd, pwddat[i]);
++		}
++		sdbootdat[18] =3D sd_1bit_getcrc(sd);
++		sdbootdat[19] =3D sd_1bit_getcrc(sd);
++	}
++
++	for (i =3D 0; i < 8; i++) {
++		SDPOKE8(sd, SDGPIO, 0x9f);
++		SDPEEK8(sd, SDGPIO);
++		SDPEEK8(sd, SDGPIO);
++		SDPOKE8(sd, SDGPIO, 0xbf);
++		SDPEEK8(sd, SDGPIO);
++	}
++	return 0;
++}
++#endif
+diff --git a/drivers/block/sdcore2.h b/drivers/block/sdcore2.h
+new file mode 100644
+index 0000000..38d5b96
+--- /dev/null
++++ b/drivers/block/sdcore2.h
+@@ -0,0 +1,372 @@
++/*
++ * Copyright (c) 2006-2008, Technologic Systems
++ * All rights reserved.
++ */
++
++#ifndef _SDCORE_H_
++#define _SDCORE_H_
++
++// Additional missing defs
++#define SDCMD 0                // cmd register
++#define SDDAT 1                // data register
++#define SDSTATE 2              // state register
++#define SDCTRL 3               // ctrl register
++
++
++// this bit is set when no card inserted
++#define SDCTRL_CARD_ABSENT 0x08
++
++
++
++/* public bits for sd_state bitfield, can be read from client code.
++ * Do not write!  Other bits are used internally.
++ */
++#define SDDAT_RX	(1<<0)
++#define SDDAT_TX	(1<<1)
++#define SDCMD_RX	(1<<2)
++#define SDCMD_TX	(1<<3)
++
++// used to disable CRC calculations in write mode
++#define SDCRC_DISABLE   (1 << 4)
++
++
++
++// used to choose between 4 bit crc mode and 1 bit crc mode
++
++// note - likely set in sdreset when configuring interface bit width
++#define SDSSP_4BIT_MODE (1 << 5)
++
++// SD_ADDRESSING_DIRECT means that sd card addresses
++// will be communicated in read/write mode using
++// full offsets, not 512 byte block offsets.
++// the core will mulitply the address by 512 if this
++// bit is cleared
++#define SD_ADDRESSING_DIRECT (1 << 6)
++
++
++/* These structs should start intialized to all 0's (bzero()'ed).  Prop=
er
++ * operation can be assured by setting sd_regstart, and the os_delay
++ * callback.  sdreset() should be called to initialize the core, then
++ * sdread() and sdwrite() can be used.
++ */
++struct sdcore {
++	/* virtual address of SD block register start, to be filled in
++	 * by client code before calling any sdcore functions.
++	 */
++  // 0-3
++	unsigned char* sd_regstart;
++
++
++
++  // 4-7
++	unsigned int sd_state;
++
++	/* Erase hint for subsequent sdwrite() call, used to optimize
++	 * write throughput on multi-sector writes by pre-erasing this
++	 * many sectors.
++	 */
++  // 8-11
++	unsigned int sd_erasehint;
++
++	/* Following this comment are 5 function pointer declarations to
++	 * OS helper functions.  The 'os_arg' member is passed as the
++	 * first argument to the helpers and should be set by
++	 * client code before issueing sdreset()
++	 *
++	 * os_dmastream(os_arg, buf, buflen)
++	 * This function should look at sd_state and set up and run an
++	 * appropriate DMA transfer.  If buf is NULL, callee doesn't care
++	 * about the actual data sent/received and helper function
++	 * can do whatever it wants.  Should return 0 when DMA transfer was
++	 * run and completed successfully.  If this function pointer is
++	 * NULL, PIO methods of transfer will be used instead of DMA.
++	 *
++	 * os_dmaprep(os_arg, buf, buflen)
++	 * This function is used to prepare an area of memory for a possible
++	 * DMA transfer.  This function is called once per distinct buffer
++	 * passed in.  After this function is called, os_dmastream() may be
++	 * called one or more times (for sequential addresses) on subregions
++	 * of the address range passed here.  Should write-back or invalidate
++	 * L1 cache lines and possibly look up physical addresses for buf
++	 * passed in if I/O buffers.  If 'os_dmaprep' is set to NULL, function
++	 * call will not happen. (though os_dmastream() calls may still)
++	 *
++	 * os_delay(os_arg, microseconds)
++	 * This function is supposed to delay or stall the processor for
++	 * the passed in value number of microseconds.
++	 *
++	 * os_irqwait(os_arg, type)
++	 * Called at certain times to request to be put to sleep/block until
++	 * an SD interrupt occurs.  It is not critical to set this function.
++	 * When NULL, the sdcore routines simply busy-wait.
++	 *
++	 * os_powerok(os_arg)
++	 * Experimental callback function -- set to NULL for now.
++	 */
++  // 12-15
++	void *os_arg;
++  // 16-19
++	int (*os_dmastream)(void *, unsigned char *, unsigned int);
++  // 20-23
++	void (*os_dmaprep)(void *, unsigned char *, unsigned int);
++  // 24-27
++	void (*os_delay)(void *, unsigned int);
++  // 28-31
++	void (*os_irqwait)(void *, unsigned int);
++  // 32-35
++	int (*os_powerok)(void *);
++
++	int (*os_timeout)(void *);
++	int (*os_reset_timeout)(void *);
++
++	/* If the SD card last successfully reset is write protected, this
++	 * member will be non-zero.
++	 */
++  // 36-39
++	unsigned int sd_wprot;
++
++	/* If this card may have been already initialized by TS-SDBOOT, place
++	 * the magic token it placed in the EP93xx SYSCON ScratchReg1 here
++	 * before calling sdreset() to avoid re-initialization.
++	 */
++  // 40-43
++	unsigned int sdboot_token;
++
++	/* CRC hint for subsequent sdwrite() call, used to optimize
++	 * write throughput while using DMA by pre-calculating CRC's for
++	 * next write.  NULL means no hint supplied.
++	 */
++  // 44-47
++	unsigned char *sd_crchint;
++
++	/* The block size of the memory device.  Normally 512, but can be 1024
++	 * for larger cards.  Read-only member and actually not very useful.
++	 */
++  // 48-51
++	unsigned int sd_blocksize;
++
++	/* Password for auto-unlocking in sdreset()
++	 */
++  // 52-55
++	unsigned char *sd_pwd;
++
++	/* If the SD card was password locked, this will be non-zero after
++	 * unsuccessful sdreset().
++	 */
++  // 56-59
++	unsigned int sd_locked;
++
++	/* Whether or not writes can be parked.  Definitely should be set to 1
++	 * as writes are very slow without it.
++	 */
++  // 60-63
++	unsigned int sd_writeparking;
++
++	/* Logical unit number.  Some SD cores will have multiple card slots.
++	 * LUN #0 is the first.
++	 */
++  // 64-67
++	unsigned int sd_lun;
++
++	/* The rest of these members are for private internal use and should
++	 * not be of interest to client code.
++	 */
++
++
++  // 68-71
++  unsigned int rca;  // relative card address
++
++
++  unsigned int sd_csd[17];
++  /*
++
++
++  // 72 -75    0
++  unsigned int unknown72;      // one of the csds?
++
++  // 76 -79    1
++  unsigned int unknown76;      // csd 0x00
++  // 80 -83    2
++  unsigned int unknown04;      // csd 0x01
++  // 84 - 87   3
++  unsigned int unknown05;      // csd 0x02
++  // 88 - 91   4
++  unsigned int unknown06;      // csd 0x03
++  // 92 - 95   5
++  unsigned int unknown92;      // csd 0x04
++  // 96 - 100  6
++  unsigned int unknown96;      // csd 0x05
++  // 100 - 103 7
++  unsigned int unknown100;     // csd 0x06
++  // 104 - 107 8
++  unsigned int unknown104;     // csd 0x07
++  // 108 - 111 9
++  unsigned int unknown108;     // csd 0x08
++  // 112 - 115 10
++  unsigned int unknown112;     // csd 0x09
++  // 116 - 119 11
++  unsigned int unknown116;     // csd 0x0a
++  // 120       12
++  unsigned int unknown24;      // csd 0x0b
++  // 124       13
++  unsigned int unknown25;      // csd 0x0c
++  // 128       14
++  unsigned int unknown26;      // csd 0x0d
++  // 132       15
++  unsigned int unknown132;      // csd 0x0e
++  // 136       16
++  unsigned int unknown28;      // csd 0x0f
++  */
++
++
++  // 140
++  unsigned int sd_crc_shift;
++
++  // 144 + 4 + 4
++  unsigned short s_crc_table[4]; // 4 shorts
++  // 152 + 4 + 4 + 4 + 4
++  unsigned int   l_crc_table[4]; // 4 longs
++
++  // 168
++  unsigned int sd_timeout;       // used to busy wait
++
++  // 172
++  unsigned int sd_cur_sector;    // stop indicator - if zero , then sto=
p procedure will be skipped
++
++  // 176
++  unsigned int sdcore_version;   // hardware version
++  // 180
++  unsigned int unknown39;
++  // 184
++  unsigned int unknown40;
++  // 188
++  unsigned int sdcore_sdsize;
++
++
++
++  unsigned int unknown42;
++  unsigned int unknown43;
++  unsigned int unknown44;
++  unsigned int unknown45;
++  unsigned int unknown46;
++  unsigned int unknown47;
++
++
++
++
++
++
++
++
++
++
++
++
++
++};
++
++/* I believe sdcores is a table mapping
++   id -> sdcore struct.  The table is
++   64 long, meaning that one could build a ts device with
++   64 sdcores on it.
++*/
++//extern unsigned char sdcores[256];
++
++
++
++
++/* For sdreadv() / sdwritev() */
++struct sdiov {
++  unsigned char *sdiov_base;
++  unsigned int sdiov_nsect;
++};
++
++
++
++
++int sdreset(struct sdcore *);
++
++int sdsize(struct sdcore* sdcore);
++
++
++int sdread(struct sdcore* sdcore,
++	   unsigned int sector,
++	   unsigned char* buffer,
++	   int nsect);
++
++int sdwrite(struct sdcore *, unsigned int, unsigned char *, int);
++
++
++// same signature as do_read
++int do_read(struct sdcore*, unsigned int, struct sdiov*, int);
++int sdreadv(struct sdcore * sdcore,
++	    unsigned int sector,
++	    struct sdiov * sdiov,
++	    int nsdiov);
++
++// same signature as do_write
++int do_write(struct sdcore* sdcore,
++	     unsigned int sector,
++	     struct sdiov* sdiov,
++	     int nsdiov);
++
++int sdwritev(struct sdcore *, unsigned int, struct sdiov *, int);
++
++
++void sd_1bit_feedcrc(struct sdcore*, unsigned int);
++void sd_4bit_feedcrc(struct sdcore*, unsigned int);
++
++unsigned char sd_1bit_getcrc(struct sdcore*);
++unsigned char sd_4bit_getcrc(struct sdcore*);
++
++/** stop takes only sdcore parameters */
++int stop(struct sdcore*);
++
++
++int tend_ssp(struct sdcore* sdcore,
++	     unsigned int** unknown_r1,      // r1
++	     unsigned char** unknown_r2);
++
++
++int datssp_stream(struct sdcore* sdcore,
++		  unsigned char** data,
++		  int count);
++
++/*
++ * @param cmd is the command - I believe that the lower byte is the com=
mand, and
++ *       the upper one is the crc
++ *
++ * @param data is a character buffer for data received in the ssp dat r=
egister, as
++ * a result of a command execution.
++ */
++
++int sdcmd(struct sdcore* sdcore,
++	  unsigned short cmd,
++	  unsigned int sdargs,
++	  unsigned int* response,
++	  unsigned char** data); // command response buffer?
++
++
++/**
++ * Error tests if a sdcommand error has been received.
++ * It does this by checking that the command was
++ * correctly returned by the card (the first byte in buffer),
++ * and that a CRC error has not occurred.  IF one has occurred
++ * it will attempt a 1bit fix. (suspected)
++ */
++int error(unsigned int* buffer, unsigned int cmd);
++
++
++
++int sdsetwprot(struct sdcore *, unsigned int);
++#define SDLOCK_UNLOCK	0
++#define SDLOCK_SETPWD	1
++#define SDLOCK_CLRPWD	2
++#define SDLOCK_ERASE	8
++
++int sdlockctl(struct sdcore *,
++	      unsigned int,      // op code
++	      unsigned char *,
++	      unsigned char *);
++
++#endif
+diff --git a/drivers/block/tssdcard.c b/drivers/block/tssdcard.c
+new file mode 100644
+index 0000000..c76d9a7
+--- /dev/null
++++ b/drivers/block/tssdcard.c
+@@ -0,0 +1,415 @@
++/*
++ * TS SD Card device driver
++ *
++ * (c) Copyright 2010  Matthieu Crapet <mcrapet@gmail.com>
++ * Based on Technologic Systems & Breton M. Saunders work
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version
++ * 2 of the License, or (at your option) any later version.
++ *
++ * Notes:
++ *   - request processing method is: no request queue
++ *   - no M2M DMA is used
++ */
++
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/major.h>
++#include <linux/blkdev.h>
++#include <linux/bio.h>
++#include <linux/delay.h>
++#include <linux/hdreg.h>
++#include <linux/slab.h>
++#include <linux/platform_device.h>
++
++#include "sdcore2.h"
++
++#define SDCARD_DEV_NAME          "tssd" /* will appear in /proc/partiti=
ons & /sys/class/block */
++#define SD_SHIFT                 4      /* max 16 partitions =3D 1 << 4=
 */
++
++#define KERN_SECTOR_SIZE         512    /* in bytes */
++#define HARD_SECTOR_SIZE         512    /* in bytes */
++#define HARD_2_KERN_SECTOR_RATIO 1      /* 1 kernel sector =3D 1 hardwa=
re sector */
++
++
++struct ts72xx_sdcard_device {
++	struct sdcore tssdcore;         /* Physical core layer */
++	void __iomem *mmio_base;
++	long size;                      /* Device size in (hardware) sectors *=
/
++	int id;
++	int media_change;
++	int users;
++
++	spinlock_t lock;
++	struct device *dev;
++	struct request_queue *queue;
++	struct gendisk *disk;
++};
++
++
++/*
++ * Low level function to handle an I/O request
++ */
++static inline int sdcard_ll_transfer(struct ts72xx_sdcard_device *dev,
++		unsigned long sector, unsigned long nsect, char *buffer, int rw)
++{
++	int ret;
++
++	//spin_unlock(&dev->lock); // ???
++
++	if ((sector + nsect) > (dev->size * HARD_2_KERN_SECTOR_RATIO)) {
++		dev_err(dev->dev, "tranfer: beyond-end write (%ld %ld)\n", sector, ns=
ect);
++		//spin_lock(&dev->lock); // ???
++		return -1;
++	}
++
++	switch (rw) {
++		case WRITE:
++			ret =3D sdwrite(&dev->tssdcore, sector, buffer, nsect);
++			if (ret && !dev->tssdcore.sd_wprot) {
++				sdreset(&dev->tssdcore);
++				ret =3D sdwrite(&dev->tssdcore, sector, buffer, nsect);
++			}
++			break;
++
++		case READ:
++		case READA:
++			ret =3D sdread(&dev->tssdcore, sector, buffer, nsect);
++			if (ret) {
++				// SDCARD RESET may be printed when the core determines that the SD=
 card has
++				// f*ed up.this is not handled correctly yet; and should likely be =
inside a while loop
++				dev_err(dev->dev, "transfer: SDCARD RESET\n");
++				sdreset(&dev->tssdcore);
++				ret =3D sdread(&dev->tssdcore, sector, buffer, nsect);
++			}
++			break;
++	}
++
++	//spin_lock(&dev->lock); // ???
++	return 0;
++}
++
++/*
++ * The direct make request version.
++ */
++static int sdcard_make_request(struct request_queue *q, struct bio *bio=
)
++{
++	struct ts72xx_sdcard_device *dev =3D q->queuedata;
++
++	struct bio_vec *bvec;
++	sector_t sector;
++	int i, rw;
++	int err =3D -EIO;
++
++	/* handle bio */
++	sector =3D bio->bi_sector;
++	rw =3D bio_rw(bio);
++
++	bio_for_each_segment(bvec, bio, i) {
++		char *buffer =3D __bio_kmap_atomic(bio, i, KM_USER0);
++		unsigned int len =3D bvec->bv_len / HARD_SECTOR_SIZE;
++
++		//printk("bvec: len=3D%d offt=3D%d page=3D%p\n", bvec->bv_len, bvec->=
bv_offset, bvec->bv_page);
++
++		err =3D sdcard_ll_transfer(dev, sector, len, buffer, rw);
++		if (err)
++			break;
++
++		sector +=3D len;
++		__bio_kunmap_atomic(bio, KM_USER0);
++	}
++	bio_endio(bio, err);
++
++	return 0;
++}
++
++static void sdcard_delay(void *arg, unsigned int us)
++{
++	udelay(us);
++}
++
++static int sdcard_open(struct block_device *bdev, fmode_t mode)
++{
++	struct ts72xx_sdcard_device *dev =3D bdev->bd_disk->private_data;
++	unsigned long flags;
++
++	dev_dbg(dev->dev, "open() users=3D%i\n", dev->users + 1);
++
++	spin_lock_irqsave(&dev->lock, flags);
++	dev->users++;
++	spin_unlock_irqrestore(&dev->lock, flags);
++
++	check_disk_change(bdev);
++	return 0;
++};
++
++static int sdcard_release(struct gendisk *disk, fmode_t mode)
++{
++	struct ts72xx_sdcard_device *dev =3D disk->private_data;
++	unsigned long flags;
++
++	dev_dbg(dev->dev, "release() users=3D%i\n", dev->users - 1);
++
++	spin_lock_irqsave(&dev->lock, flags);
++	dev->users--;
++	spin_unlock_irqrestore(&dev->lock, flags);
++
++	return 0;
++}
++
++static int sdcard_media_changed(struct gendisk *disk)
++{
++	struct ts72xx_sdcard_device *dev =3D disk->private_data;
++
++	char buf[HARD_SECTOR_SIZE];
++	dev->media_change =3D sdread(&dev->tssdcore, 1, buf, 1);
++
++	dev_dbg(dev->dev, "media_changed() %i\n", dev->media_change);
++	return dev->media_change;
++}
++
++static int sdcard_revalidate(struct gendisk *disk)
++{
++	struct ts72xx_sdcard_device *dev =3D disk->private_data;
++	int ret =3D 0;
++
++	dev_dbg(dev->dev, "revalidate() %i\n", dev->media_change);
++	if (dev->media_change) {
++		dev->size =3D sdreset(&dev->tssdcore);
++		set_disk_ro(dev->disk, !!(dev->tssdcore.sd_wprot));
++		if (dev->size > 0) {
++			set_capacity(dev->disk, dev->size * HARD_2_KERN_SECTOR_RATIO);
++			dev->media_change =3D 0;
++		} else {
++			dev_err(dev->dev, "revalidate() no card found\n");
++			ret =3D -1;
++		}
++	}
++	return ret;
++}
++
++static int sdcard_getgeo(struct block_device *bdev, struct hd_geometry =
*geo)
++{
++	struct gendisk *disk =3D bdev->bd_disk;
++	struct ts72xx_sdcard_device *dev =3D disk->private_data;
++
++	/* We don't have real geometry info, but let's at least return
++	 * values consistent with the size of the device */
++	geo->heads =3D 16;
++	geo->sectors =3D 32;
++	geo->cylinders =3D get_capacity(disk) / (16 * 32);
++
++	dev_dbg(dev->dev, "getgeo() %d heads, %d sectors, %d cylinders\n",
++			geo->heads, geo->sectors, geo->cylinders);
++	return 0;
++}
++
++/*
++ * The device operations structure.
++ */
++static struct block_device_operations ts72xx_sdcard_ops =3D {
++	.owner			=3D THIS_MODULE,
++	.open			=3D sdcard_open,
++	.release		=3D sdcard_release,
++	.media_changed		=3D sdcard_media_changed,
++	.revalidate_disk	=3D sdcard_revalidate,
++	.getgeo			=3D sdcard_getgeo
++};
++
++static int sdcard_major;
++
++/* --------------------------------------------------------------------=
-
++ * Device setup
++ */
++
++static int ts72xx_sdcard_setup(const char *name, struct ts72xx_sdcard_d=
evice *dev)
++{
++	int rc;
++
++	spin_lock_init(&dev->lock);
++
++	/*
++	 * Initialize the request queue
++	 */
++	dev->queue =3D blk_alloc_queue(GFP_KERNEL);
++	if (!dev->queue)
++		goto err_alloc_queue;
++
++	dev->queue->queuedata =3D dev;
++	blk_queue_make_request(dev->queue, sdcard_make_request);
++	blk_queue_logical_block_size(dev->queue, HARD_SECTOR_SIZE);
++
++      	dev->tssdcore.sd_regstart =3D (unsigned char *)dev->mmio_base;
++	dev->tssdcore.os_arg       =3D dev;
++	dev->tssdcore.os_delay     =3D sdcard_delay;
++	dev->tssdcore.os_dmastream =3D NULL;
++	dev->tssdcore.os_dmaprep   =3D NULL;
++
++	// don't want to write park
++	dev->tssdcore.sd_writeparking =3D 1;
++	// I do want to pre-erase blocks - 8 blocks pre-erase
++	dev->tssdcore.sd_erasehint =3D 8;
++	dev->tssdcore.sdboot_token =3D 0;
++
++	dev->disk =3D alloc_disk(1 << SD_SHIFT);
++	if (!dev->disk) {
++		goto err_alloc_disk;
++	}
++
++	dev->disk->major =3D sdcard_major;
++	dev->disk->first_minor =3D dev->id << SD_SHIFT;
++	dev->disk->flags =3D GENHD_FL_REMOVABLE;
++	dev->disk->fops =3D &ts72xx_sdcard_ops;
++	dev->disk->queue =3D dev->queue;
++	dev->disk->private_data =3D dev;
++	snprintf(dev->disk->disk_name, 32, SDCARD_DEV_NAME "%c", dev->id + 'a'=
);
++
++	/* SD Card size and Reset
++	 * (set_disk_ro, set_capacity will be called) */
++	dev->media_change =3D 1;
++	rc =3D sdcard_revalidate(dev->disk);
++	if (rc) {
++		dev_info(dev->dev, "No SD card detected!\n");
++		goto err_alloc_disk;
++	}
++
++	dev_info(dev->dev, "SD card hardware revision: %08x\n",
++			dev->tssdcore.sdcore_version);
++	dev_info(dev->dev, "block device major number =3D %d\n",
++			sdcard_major);
++	dev_info(dev->dev, "New SD card detected, name=3D%s size=3D%ld (sector=
s)\n",
++			dev->disk->disk_name, dev->size);
++
++	/* Make the sysace device 'live' */
++	add_disk(dev->disk);
++
++	return 0;
++
++err_alloc_disk:
++	blk_cleanup_queue(dev->queue);
++err_alloc_queue:
++	return -ENOMEM;
++}
++
++
++/* --------------------------------------------------------------------=
-
++ * Platform drivers functons
++ */
++
++static int __init ts72xx_sdcard_probe(struct platform_device *pdev)
++{
++	struct ts72xx_sdcard_device *dev;
++	struct resource *res;
++	int rc;
++
++	dev =3D kzalloc(sizeof(struct ts72xx_sdcard_device), GFP_KERNEL);
++	if (!dev) {
++		rc =3D -ENOMEM;
++		goto fail_no_mem;
++	}
++
++	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (res =3D=3D NULL) {
++		rc =3D -ENXIO;
++		goto fail_no_mem_resource;
++	}
++
++	res =3D request_mem_region(res->start, resource_size(res), pdev->name)=
;
++	if (res =3D=3D NULL) {
++		rc =3D -EBUSY;
++		goto fail_no_mem_resource;
++	}
++
++	dev->mmio_base =3D ioremap(res->start, resource_size(res));
++	if (dev->mmio_base =3D=3D NULL) {
++		rc =3D -ENXIO;
++		goto fail_no_ioremap;
++	}
++
++	dev->dev =3D &pdev->dev;
++	dev->id =3D pdev->id;
++	platform_set_drvdata(pdev, dev);
++
++	rc =3D ts72xx_sdcard_setup(SDCARD_DEV_NAME, dev);
++	if (rc) {
++		dev_err(dev->dev, "ts72xx_sdcard_setup failed\n");
++		goto fail_sdcard_setup;
++	}
++
++	return 0;
++
++fail_sdcard_setup:
++	iounmap(dev->mmio_base);
++fail_no_ioremap:
++	release_mem_region(res->start, resource_size(res));
++fail_no_mem_resource:
++	kfree(dev);
++fail_no_mem:
++	return rc;
++}
++
++static int __exit ts72xx_sdcard_remove(struct platform_device *pdev)
++{
++	struct ts72xx_sdcard_device *dev =3D platform_get_drvdata(pdev);
++	struct resource *res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0=
);
++
++	platform_set_drvdata(pdev, NULL);
++	iounmap(dev->mmio_base);
++	release_mem_region(res->start, resource_size(res));
++	blk_cleanup_queue(dev->queue);
++	del_gendisk(dev->disk);
++	put_disk(dev->disk);
++	kfree(dev);
++
++	return 0;
++}
++
++static struct platform_driver ts72xx_sdcard_driver =3D {
++	.driver		=3D {
++		.name	=3D "ts72xx-sdcard",
++		.owner	=3D THIS_MODULE,
++	},
++	.remove		=3D __exit_p(ts72xx_sdcard_remove),
++};
++
++
++/* --------------------------------------------------------------------=
-
++ * Module init/exit routines
++ */
++
++static int __init ts72xx_sdcard_init(void)
++{
++	int rc;
++
++	sdcard_major =3D rc =3D register_blkdev(sdcard_major, SDCARD_DEV_NAME)=
;
++	if (rc <=3D 0) {
++		printk(KERN_ERR "%s:%u: register_blkdev failed %d\n", __func__,
++				__LINE__, rc);
++		return rc;
++	}
++
++	rc =3D platform_driver_probe(&ts72xx_sdcard_driver, ts72xx_sdcard_prob=
e);
++	if (rc)
++		unregister_blkdev(sdcard_major, SDCARD_DEV_NAME);
++
++	return rc;
++}
++
++static void __exit ts72xx_sdcard_exit(void)
++{
++	unregister_blkdev(sdcard_major, SDCARD_DEV_NAME);
++	platform_driver_unregister(&ts72xx_sdcard_driver);
++}
++
++module_init(ts72xx_sdcard_init);
++module_exit(ts72xx_sdcard_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("TS72xx SD Card block driver");
++MODULE_LICENSE("GPL");
++MODULE_ALIAS_BLOCKDEV_MAJOR(SCSI_DISK0_MAJOR);
++MODULE_ALIAS("tssd");
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0016-ts72xx_nand_flash.pat=
ch b/recipes/linux/linux-2.6.34/ts72xx/0016-ts72xx_nand_flash.patch
new file mode 100644
index 0000000..ce73a86
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0016-ts72xx_nand_flash.patch
@@ -0,0 +1,270 @@
+From 45a115b858cf82a35e51a7541a3f83c4dd4e08ea Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Sun, 20 Jun 2010 11:31:22 +0200
+Subject: [PATCH 16/18] ts72xx_nand_flash
+
+This is Hartley Sweeten's patch:
+Update the ts72xx platform's nand driver support.
+
+It's available since 2.6.35-rc1
+
+Only one concern here, it's the size of TS72XX_BOOTROM_PART_SIZE,
+defined here to SZ_16K but can be SZ_128K for boards with 128mb flash.
+---
+ arch/arm/mach-ep93xx/ts72xx.c |  186 ++++++++++++++++++++++++++++------=
-------
+ drivers/mtd/nand/Kconfig      |    2 +-
+ 2 files changed, 129 insertions(+), 59 deletions(-)
+
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index 7fd8f80..475559e 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -10,6 +10,8 @@
+  * your option) any later version.
+  */
+=20
++#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
++
+ #include <linux/kernel.h>
+ #include <linux/init.h>
+ #include <linux/platform_device.h>
+@@ -19,6 +21,8 @@
+ #include <linux/gpio.h>
+ #include <linux/i2c.h>
+ #include <linux/i2c-gpio.h>
++#include <linux/mtd/nand.h>
++#include <linux/mtd/partitions.h>
+=20
+ #include <mach/hardware.h>
+ #include <mach/ts72xx.h>
+@@ -91,90 +95,156 @@ static struct map_desc ts72xx_io_desc[] __initdata =
=3D {
+ 	//}
+ };
+=20
+-static struct map_desc ts72xx_nand_io_desc[] __initdata =3D {
+-	{
+-		.virtual	=3D TS72XX_NAND_DATA_VIRT_BASE,
+-		.pfn		=3D __phys_to_pfn(TS72XX_NAND1_DATA_PHYS_BASE),
+-		.length		=3D TS72XX_NAND_DATA_SIZE,
+-		.type		=3D MT_DEVICE,
+-	}, {
+-		.virtual	=3D TS72XX_NAND_CONTROL_VIRT_BASE,
+-		.pfn		=3D __phys_to_pfn(TS72XX_NAND1_CONTROL_PHYS_BASE),
+-		.length		=3D TS72XX_NAND_CONTROL_SIZE,
+-		.type		=3D MT_DEVICE,
+-	}, {
+-		.virtual	=3D TS72XX_NAND_BUSY_VIRT_BASE,
+-		.pfn		=3D __phys_to_pfn(TS72XX_NAND1_BUSY_PHYS_BASE),
+-		.length		=3D TS72XX_NAND_BUSY_SIZE,
+-		.type		=3D MT_DEVICE,
++static void __init ts72xx_map_io(void)
++{
++	ep93xx_map_io();
++	iotable_init(ts72xx_io_desc, ARRAY_SIZE(ts72xx_io_desc));
++}
++
++
++/**********************************************************************=
***
++ * NAND flash
++ **********************************************************************=
***/
++#define TS72XX_NAND_CONTROL_ADDR_LINE  22      /* 0xN0400000 */
++#define TS72XX_NAND_BUSY_ADDR_LINE     23      /* 0xN0800000 */
++
++static void ts72xx_nand_hwcontrol(struct mtd_info *mtd,
++                                 int cmd, unsigned int ctrl)
++{
++	struct nand_chip *chip =3D mtd->priv;
++
++	if (ctrl & NAND_CTRL_CHANGE) {
++		void __iomem *addr =3D chip->IO_ADDR_R;
++		unsigned char bits;
++
++		addr +=3D (1 << TS72XX_NAND_CONTROL_ADDR_LINE);
++
++		bits =3D __raw_readb(addr) & ~0x07;
++		bits |=3D (ctrl & NAND_NCE) << 2; /* bit 0 -> bit 2 */
++		bits |=3D (ctrl & NAND_CLE);      /* bit 1 -> bit 1 */
++		bits |=3D (ctrl & NAND_ALE) >> 2; /* bit 2 -> bit 0 */
++
++		__raw_writeb(bits, addr);
+ 	}
+-};
++	if (cmd !=3D NAND_CMD_NONE)
++		__raw_writeb(cmd, chip->IO_ADDR_W);
++}
++
++static int ts72xx_nand_device_ready(struct mtd_info *mtd)
++{
++	struct nand_chip *chip =3D mtd->priv;
++	void __iomem *addr =3D chip->IO_ADDR_R;
++
++	addr +=3D (1 << TS72XX_NAND_BUSY_ADDR_LINE);
++
++	return !!(__raw_readb(addr) & 0x20);
++}
+=20
+-static struct map_desc ts72xx_alternate_nand_io_desc[] __initdata =3D {
++static const char *ts72xx_nand_part_probes[] =3D { "cmdlinepart", NULL =
};
++
++#define TS72XX_BOOTROM_PART_SIZE       (SZ_16K)
++#define TS72XX_REDBOOT_PART_SIZE       (SZ_2M + SZ_1M)
++
++static struct mtd_partition ts72xx_nand_parts[] =3D {
+ 	{
+-		.virtual	=3D TS72XX_NAND_DATA_VIRT_BASE,
+-		.pfn		=3D __phys_to_pfn(TS72XX_NAND2_DATA_PHYS_BASE),
+-		.length		=3D TS72XX_NAND_DATA_SIZE,
+-		.type		=3D MT_DEVICE,
++		.name           =3D "TS-BOOTROM",
++		.offset         =3D 0,
++		.size           =3D TS72XX_BOOTROM_PART_SIZE,
++		.mask_flags     =3D MTD_WRITEABLE,        /* force read-only */
+ 	}, {
+-		.virtual	=3D TS72XX_NAND_CONTROL_VIRT_BASE,
+-		.pfn		=3D __phys_to_pfn(TS72XX_NAND2_CONTROL_PHYS_BASE),
+-		.length		=3D TS72XX_NAND_CONTROL_SIZE,
+-		.type		=3D MT_DEVICE,
++		.name           =3D "Linux",
++		.offset         =3D MTDPART_OFS_APPEND,
++		.size           =3D 0,                    /* filled in later */
+ 	}, {
+-		.virtual	=3D TS72XX_NAND_BUSY_VIRT_BASE,
+-		.pfn		=3D __phys_to_pfn(TS72XX_NAND2_BUSY_PHYS_BASE),
+-		.length		=3D TS72XX_NAND_BUSY_SIZE,
+-		.type		=3D MT_DEVICE,
+-	}
++		.name           =3D "RedBoot",
++		.offset         =3D MTDPART_OFS_APPEND,
++		.size           =3D MTDPART_SIZ_FULL,
++		.mask_flags     =3D MTD_WRITEABLE,        /* force read-only */
++	},
+ };
+=20
+-static void __init ts72xx_map_io(void)
++static void ts72xx_nand_set_parts(uint64_t size,
++		struct platform_nand_chip *chip)
+ {
+-	ep93xx_map_io();
+-	iotable_init(ts72xx_io_desc, ARRAY_SIZE(ts72xx_io_desc));
+-
+-	/*
+-	 * The TS-7200 has NOR flash, the other models have NAND flash.
+-	 */
+-	if (!board_is_ts7200()) {
+-		if (is_ts9420_installed()) {
+-			iotable_init(ts72xx_alternate_nand_io_desc,
+-				ARRAY_SIZE(ts72xx_alternate_nand_io_desc));
+-		} else {
+-			iotable_init(ts72xx_nand_io_desc,
+-				ARRAY_SIZE(ts72xx_nand_io_desc));
+-		}
++	/* Factory TS-72xx boards only come with 32MiB or 128MiB NAND options =
*/
++	if (size =3D=3D SZ_32M || size =3D=3D SZ_128M) {
++		/* Set the "Linux" partition size */
++		ts72xx_nand_parts[1].size =3D size - TS72XX_REDBOOT_PART_SIZE;
++		chip->partitions =3D ts72xx_nand_parts;
++		chip->nr_partitions =3D ARRAY_SIZE(ts72xx_nand_parts);
++	} else {
++		pr_warning("Unknown nand disk size:%lluMiB\n", size >> 20);
+ 	}
+ }
+=20
++static struct platform_nand_data ts72xx_nand_data =3D {
++	.chip =3D {
++		.nr_chips       =3D 1,
++		.chip_offset    =3D 0,
++		.chip_delay     =3D 15,
++		.part_probe_types =3D ts72xx_nand_part_probes,
++		.set_parts      =3D ts72xx_nand_set_parts,
++	},
++	.ctrl =3D {
++		.cmd_ctrl       =3D ts72xx_nand_hwcontrol,
++		.dev_ready      =3D ts72xx_nand_device_ready,
++	},
++};
++
++static struct resource ts72xx_nand_resource[] =3D {
++	{
++		.start          =3D 0,                    /* filled in later */
++		.end            =3D 0,                    /* filled in later */
++		.flags          =3D IORESOURCE_MEM,
++	},
++};
++
++static struct platform_device ts72xx_nand_flash =3D {
++	.name                   =3D "gen_nand",
++	.id                     =3D -1,
++	.dev.platform_data      =3D &ts72xx_nand_data,
++	.resource               =3D ts72xx_nand_resource,
++	.num_resources          =3D ARRAY_SIZE(ts72xx_nand_resource),
++};
++
+ /**********************************************************************=
***
+  * NOR flash (TS-7200 only)
+  **********************************************************************=
***/
+-static struct physmap_flash_data ts72xx_flash_data =3D {
++static struct physmap_flash_data ts72xx_nor_data =3D {
+ 	.width		=3D 2,
+ };
+=20
+-static struct resource ts72xx_flash_resource =3D {
++static struct resource ts72xx_nor_resource =3D {
+ 	.start		=3D EP93XX_CS6_PHYS_BASE,
+ 	.end		=3D EP93XX_CS6_PHYS_BASE + SZ_16M - 1,
+ 	.flags		=3D IORESOURCE_MEM,
+ };
+=20
+-static struct platform_device ts72xx_flash =3D {
+-	.name		=3D "physmap-flash",
+-	.id		=3D 0,
+-	.dev		=3D {
+-		.platform_data	=3D &ts72xx_flash_data,
+-	},
+-	.num_resources	=3D 1,
+-	.resource	=3D &ts72xx_flash_resource,
++static struct platform_device ts72xx_nor_flash =3D {
++	.name                   =3D "physmap-flash",
++	.id                     =3D 0,
++	.dev.platform_data      =3D &ts72xx_nor_data,
++	.resource               =3D &ts72xx_nor_resource,
++	.num_resources          =3D 1,
+ };
+=20
+ static void __init ts72xx_register_flash(void)
+ {
+-	if (board_is_ts7200())
+-		platform_device_register(&ts72xx_flash);
++	if (board_is_ts7200()) {
++		platform_device_register(&ts72xx_nor_flash);
++	} else {
++		resource_size_t start;
++
++		if (is_ts9420_installed())
++			start =3D EP93XX_CS7_PHYS_BASE;
++		else
++			start =3D EP93XX_CS6_PHYS_BASE;
++
++		ts72xx_nand_resource[0].start =3D start;
++		ts72xx_nand_resource[0].end =3D start + SZ_16M - 1;
++
++		platform_device_register(&ts72xx_nand_flash);
++	}
+ }
+=20
+ /**********************************************************************=
***
+diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
+index 42e5ea4..952ae85 100644
+--- a/drivers/mtd/nand/Kconfig
++++ b/drivers/mtd/nand/Kconfig
+@@ -96,7 +96,7 @@ config MTD_NAND_OMAP_PREFETCH_DMA
+ 	 Say y for DMA mode or MPU mode will be used
+=20
+ config MTD_NAND_TS7250
+-	tristate "NAND Flash device on TS-7250 board"
++	tristate "NAND Flash device on TS-7250 board (DEPRECATED)"
+ 	depends on MACH_TS72XX
+ 	help
+ 	  Support for NAND flash on Technologic Systems TS-7250 platform.
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0017-ep93xx_spi.patch b/re=
cipes/linux/linux-2.6.34/ts72xx/0017-ep93xx_spi.patch
new file mode 100644
index 0000000..bba5516
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0017-ep93xx_spi.patch
@@ -0,0 +1,1312 @@
+From be8b82a083b6df32a1016b327730ce16be7c2b24 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Tue, 22 Jun 2010 11:21:05 +0200
+Subject: [PATCH 17/18] ep93xx_spi
+
+Include Mika Westerberg's driver:
+
+ARM: 5998/1: ep93xx: added chip revision reading function:
+http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dc=
ommit;h=3D99e6a23adfadc2da2006f3715c4332c3bf502c07
+
+ARM: 6124/1: ep93xx: SPI driver platform support code:
+http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dc=
ommit;h=3D4fec9978822a66b25f5645eb20c115034a18cfd1
+
+spi/ep93xx: implemented driver for Cirrus EP93xx SPI controller:
+http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dc=
ommit;h=3D011f23a3c2f20ae15b7664d3942493af107fe39b
+---
+ Documentation/spi/ep93xx_spi                   |   95 +++
+ arch/arm/mach-ep93xx/clock.c                   |   13 +
+ arch/arm/mach-ep93xx/core.c                    |   66 ++
+ arch/arm/mach-ep93xx/include/mach/ep93xx_spi.h |   27 +
+ arch/arm/mach-ep93xx/include/mach/platform.h   |   12 +
+ drivers/spi/Kconfig                            |   10 +
+ drivers/spi/Makefile                           |    1 +
+ drivers/spi/ep93xx_spi.c                       |  938 +++++++++++++++++=
+++++++
+ 8 files changed, 1162 insertions(+), 0 deletions(-)
+ create mode 100644 Documentation/spi/ep93xx_spi
+ create mode 100644 arch/arm/mach-ep93xx/include/mach/ep93xx_spi.h
+ create mode 100644 drivers/spi/ep93xx_spi.c
+
+diff --git a/Documentation/spi/ep93xx_spi b/Documentation/spi/ep93xx_spi
+new file mode 100644
+index 0000000..6325f5b
+--- /dev/null
++++ b/Documentation/spi/ep93xx_spi
+@@ -0,0 +1,95 @@
++Cirrus EP93xx SPI controller driver HOWTO
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++ep93xx_spi driver brings SPI master support for EP93xx SPI controller. =
 Chip
++selects are implemented with GPIO lines.
++
++NOTE: If possible, don't use SFRMOUT (SFRM1) signal as a chip select. I=
t will
++not work correctly (it cannot be controlled by software). Use GPIO line=
s
++instead.
++
++Sample configuration
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++Typically driver configuration is done in platform board files (the fil=
es under
++arch/arm/mach-ep93xx/*.c). In this example we configure MMC over SPI th=
rough
++this driver on TS-7260 board. You can adapt the code to suit your needs=
.
++
++This example uses EGPIO9 as SD/MMC card chip select (this is wired in D=
IO1
++header on the board).
++
++You need to select CONFIG_MMC_SPI to use mmc_spi driver.
++
++arch/arm/mach-ep93xx/ts72xx.c:
++
++...
++#include <linux/gpio.h>
++#include <linux/spi/spi.h>
++
++#include <mach/ep93xx_spi.h>
++
++/* this is our GPIO line used for chip select */
++#define MMC_CHIP_SELECT_GPIO EP93XX_GPIO_LINE_EGPIO9
++
++static int ts72xx_mmc_spi_setup(struct spi_device *spi)
++{
++	int err;
++
++	err =3D gpio_request(MMC_CHIP_SELECT_GPIO, spi->modalias);
++	if (err)
++		return err;
++
++	gpio_direction_output(MMC_CHIP_SELECT_GPIO, 1);
++
++	return 0;
++}
++
++static void ts72xx_mmc_spi_cleanup(struct spi_device *spi)
++{
++	gpio_set_value(MMC_CHIP_SELECT_GPIO, 1);
++	gpio_direction_input(MMC_CHIP_SELECT_GPIO);
++	gpio_free(MMC_CHIP_SELECT_GPIO);
++}
++
++static void ts72xx_mmc_spi_cs_control(struct spi_device *spi, int value=
)
++{
++	gpio_set_value(MMC_CHIP_SELECT_GPIO, value);
++}
++
++static struct ep93xx_spi_chip_ops ts72xx_mmc_spi_ops =3D {
++	.setup		=3D ts72xx_mmc_spi_setup,
++	.cleanup	=3D ts72xx_mmc_spi_cleanup,
++	.cs_control	=3D ts72xx_mmc_spi_cs_control,
++};
++
++static struct spi_board_info ts72xx_spi_devices[] __initdata =3D {
++	{
++		.modalias		=3D "mmc_spi",
++		.controller_data	=3D &ts72xx_mmc_spi_ops,
++		/*
++		 * We use 10 MHz even though the maximum is 7.4 MHz. The driver
++		 * will limit it automatically to max. frequency.
++		 */
++		.max_speed_hz		=3D 10 * 1000 * 1000,
++		.bus_num		=3D 0,
++		.chip_select		=3D 0,
++		.mode			=3D SPI_MODE_0,
++	},
++};
++
++static struct ep93xx_spi_info ts72xx_spi_info =3D {
++	.num_chipselect	=3D ARRAY_SIZE(ts72xx_spi_devices),
++};
++
++static void __init ts72xx_init_machine(void)
++{
++	...
++	ep93xx_register_spi(&ts72xx_spi_info, ts72xx_spi_devices,
++			    ARRAY_SIZE(ts72xx_spi_devices));
++}
++
++Thanks to
++=3D=3D=3D=3D=3D=3D=3D=3D=3D
++Martin Guy, H. Hartley Sweeten and others who helped me during developm=
ent of
++the driver. Simplemachines.it donated me a Sim.One board which I used t=
esting
++the driver on EP9307.
+diff --git a/arch/arm/mach-ep93xx/clock.c b/arch/arm/mach-ep93xx/clock.c
+index 5f80092..e29bdef 100644
+--- a/arch/arm/mach-ep93xx/clock.c
++++ b/arch/arm/mach-ep93xx/clock.c
+@@ -96,6 +96,10 @@ static struct clk clk_keypad =3D {
+ 	.enable_mask	=3D EP93XX_SYSCON_KEYTCHCLKDIV_KEN,
+ 	.set_rate	=3D set_keytchclk_rate,
+ };
++static struct clk clk_spi =3D {
++	.parent		=3D &clk_xtali,
++	.rate		=3D EP93XX_EXT_CLK_RATE,
++};
+ static struct clk clk_pwm =3D {
+ 	.parent		=3D &clk_xtali,
+ 	.rate		=3D EP93XX_EXT_CLK_RATE,
+@@ -186,6 +190,7 @@ static struct clk_lookup clocks[] =3D {
+ 	INIT_CK("ep93xx-ohci",		NULL,		&clk_usb_host),
+ 	INIT_CK("ep93xx-keypad",	NULL,		&clk_keypad),
+ 	INIT_CK("ep93xx-fb",		NULL,		&clk_video),
++	INIT_CK("ep93xx-spi.0",		NULL,		&clk_spi),
+ 	INIT_CK(NULL,			"pwm_clk",	&clk_pwm),
+ 	INIT_CK(NULL,			"m2p0",		&clk_m2p0),
+ 	INIT_CK(NULL,			"m2p1",		&clk_m2p1),
+@@ -473,6 +478,14 @@ static int __init ep93xx_clock_init(void)
+ 	/* Initialize the pll2 derived clocks */
+ 	clk_usb_host.rate =3D clk_pll2.rate / (((value >> 28) & 0xf) + 1);
+=20
++	/*
++	 * EP93xx SSP clock rate was doubled in version E2. For more informati=
on
++	 * see:
++	 *     http://www.cirrus.com/en/pubs/appNote/AN273REV4.pdf
++	 */
++	if (ep93xx_chip_revision() < EP93XX_CHIP_REV_E2)
++		clk_spi.rate /=3D 2;
++
+ 	pr_info("PLL1 running at %ld MHz, PLL2 at %ld MHz\n",
+ 		clk_pll1.rate / 1000000, clk_pll2.rate / 1000000);
+ 	pr_info("FCLK %ld MHz, HCLK %ld MHz, PCLK %ld MHz\n",
+diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
+index 90fb591..4e55b7d 100644
+--- a/arch/arm/mach-ep93xx/core.c
++++ b/arch/arm/mach-ep93xx/core.c
+@@ -31,10 +31,12 @@
+ #include <linux/amba/serial.h>
+ #include <linux/i2c.h>
+ #include <linux/i2c-gpio.h>
++#include <linux/spi/spi.h>
+=20
+ #include <mach/hardware.h>
+ #include <mach/fb.h>
+ #include <mach/ep93xx_keypad.h>
++#include <mach/ep93xx_spi.h>
+=20
+ #include <asm/mach/map.h>
+ #include <asm/mach/time.h>
+@@ -222,6 +224,20 @@ void ep93xx_devcfg_set_clear(unsigned int set_bits,=
 unsigned int clear_bits)
+ }
+ EXPORT_SYMBOL(ep93xx_devcfg_set_clear);
+=20
++/**
++ * ep93xx_chip_revision() - returns the EP93xx chip revision
++ *
++ * See <mach/platform.h> for more information.
++ */
++unsigned int ep93xx_chip_revision(void)
++{
++	unsigned int v;
++
++	v =3D __raw_readl(EP93XX_SYSCON_SYSCFG);
++	v &=3D EP93XX_SYSCON_SYSCFG_REV_MASK;
++	v >>=3D EP93XX_SYSCON_SYSCFG_REV_SHIFT;
++	return v;
++}
+=20
+ /**********************************************************************=
***
+  * EP93xx peripheral handling
+@@ -398,6 +414,56 @@ void __init ep93xx_register_i2c(struct i2c_gpio_pla=
tform_data *data,
+ 	platform_device_register(&ep93xx_i2c_device);
+ }
+=20
++/**********************************************************************=
***
++ * EP93xx SPI peripheral handling
++ **********************************************************************=
***/
++static struct ep93xx_spi_info ep93xx_spi_master_data;
++
++static struct resource ep93xx_spi_resources[] =3D {
++	{
++		.start	=3D EP93XX_SPI_PHYS_BASE,
++		.end	=3D EP93XX_SPI_PHYS_BASE + 0x18 - 1,
++		.flags	=3D IORESOURCE_MEM,
++	},
++	{
++		.start	=3D IRQ_EP93XX_SSP,
++		.end	=3D IRQ_EP93XX_SSP,
++		.flags	=3D IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device ep93xx_spi_device =3D {
++	.name		=3D "ep93xx-spi",
++	.id		=3D 0,
++	.dev		=3D {
++		.platform_data =3D &ep93xx_spi_master_data,
++	},
++	.num_resources	=3D ARRAY_SIZE(ep93xx_spi_resources),
++	.resource	=3D ep93xx_spi_resources,
++};
++
++/**
++ * ep93xx_register_spi() - registers spi platform device
++ * @info: ep93xx board specific spi master info (__initdata)
++ * @devices: SPI devices to register (__initdata)
++ * @num: number of SPI devices to register
++ *
++ * This function registers platform device for the EP93xx SPI controlle=
r and
++ * also makes sure that SPI pins are muxed so that I2S is not using tho=
se pins.
++ */
++void __init ep93xx_register_spi(struct ep93xx_spi_info *info,
++				struct spi_board_info *devices, int num)
++{
++	/*
++	 * When SPI is used, we need to make sure that I2S is muxed off from
++	 * SPI pins.
++	 */
++	ep93xx_devcfg_clear_bits(EP93XX_SYSCON_DEVCFG_I2SONSSP);
++
++	ep93xx_spi_master_data =3D *info;
++	spi_register_board_info(devices, num);
++	platform_device_register(&ep93xx_spi_device);
++}
+=20
+ /**********************************************************************=
***
+  * EP93xx LEDs
+diff --git a/arch/arm/mach-ep93xx/include/mach/ep93xx_spi.h b/arch/arm/m=
ach-ep93xx/include/mach/ep93xx_spi.h
+new file mode 100644
+index 0000000..0a37961
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/include/mach/ep93xx_spi.h
+@@ -0,0 +1,27 @@
++#ifndef __ASM_MACH_EP93XX_SPI_H
++#define __ASM_MACH_EP93XX_SPI_H
++
++struct spi_device;
++
++/**
++ * struct ep93xx_spi_info - EP93xx specific SPI descriptor
++ * @num_chipselect: number of chip selects on this board, must be
++ *                  at least one
++ */
++struct ep93xx_spi_info {
++	int	num_chipselect;
++};
++
++/**
++ * struct ep93xx_spi_chip_ops - operation callbacks for SPI slave devic=
e
++ * @setup: setup the chip select mechanism
++ * @cleanup: cleanup the chip select mechanism
++ * @cs_control: control the device chip select
++ */
++struct ep93xx_spi_chip_ops {
++	int	(*setup)(struct spi_device *spi);
++	void	(*cleanup)(struct spi_device *spi);
++	void	(*cs_control)(struct spi_device *spi, int value);
++};
++
++#endif /* __ASM_MACH_EP93XX_SPI_H */
+diff --git a/arch/arm/mach-ep93xx/include/mach/platform.h b/arch/arm/mac=
h-ep93xx/include/mach/platform.h
+index c6dc14d..9a4413d 100644
+--- a/arch/arm/mach-ep93xx/include/mach/platform.h
++++ b/arch/arm/mach-ep93xx/include/mach/platform.h
+@@ -6,9 +6,11 @@
+=20
+ struct i2c_gpio_platform_data;
+ struct i2c_board_info;
++struct spi_board_info;
+ struct platform_device;
+ struct ep93xxfb_mach_info;
+ struct ep93xx_keypad_platform_data;
++struct ep93xx_spi_info;
+=20
+ struct ep93xx_eth_data
+ {
+@@ -33,9 +35,19 @@ static inline void ep93xx_devcfg_clear_bits(unsigned =
int bits)
+ 	ep93xx_devcfg_set_clear(0x00, bits);
+ }
+=20
++#define EP93XX_CHIP_REV_D0	3
++#define EP93XX_CHIP_REV_D1	4
++#define EP93XX_CHIP_REV_E0	5
++#define EP93XX_CHIP_REV_E1	6
++#define EP93XX_CHIP_REV_E2	7
++
++unsigned int ep93xx_chip_revision(void);
++
+ void ep93xx_register_eth(struct ep93xx_eth_data *data, int copy_addr);
+ void ep93xx_register_i2c(struct i2c_gpio_platform_data *data,
+ 			 struct i2c_board_info *devices, int num);
++void ep93xx_register_spi(struct ep93xx_spi_info *info,
++			 struct spi_board_info *devices, int num);
+ void ep93xx_register_fb(struct ep93xxfb_mach_info *data);
+ void ep93xx_register_pwm(int pwm0, int pwm1);
+ int ep93xx_pwm_acquire_gpio(struct platform_device *pdev);
+diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
+index a191fa2..2b2f4c3 100644
+--- a/drivers/spi/Kconfig
++++ b/drivers/spi/Kconfig
+@@ -117,6 +117,16 @@ config SPI_DAVINCI
+ 	help
+ 	  SPI master controller for DaVinci and DA8xx SPI modules.
+=20
++config SPI_EP93XX
++	tristate "Cirrus Logic EP93xx SPI controller"
++	depends on ARCH_EP93XX
++	help
++	  This enables using the Cirrus EP93xx SPI controller in master
++	  mode.
++
++	  To compile this driver as a module, choose M here. The module will b=
e
++	  called ep93xx_spi.
++
+ config SPI_GPIO
+ 	tristate "GPIO-based bitbanging SPI Master"
+ 	depends on GENERIC_GPIO
+diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
+index d7d0f89..377f845 100644
+--- a/drivers/spi/Makefile
++++ b/drivers/spi/Makefile
+@@ -21,6 +21,7 @@ obj-$(CONFIG_SPI_DAVINCI)		+=3D davinci_spi.o
+ obj-$(CONFIG_SPI_DESIGNWARE)		+=3D dw_spi.o
+ obj-$(CONFIG_SPI_DW_PCI)		+=3D dw_spi_pci.o
+ obj-$(CONFIG_SPI_DW_MMIO)		+=3D dw_spi_mmio.o
++obj-$(CONFIG_SPI_EP93XX)		+=3D ep93xx_spi.o
+ obj-$(CONFIG_SPI_GPIO)			+=3D spi_gpio.o
+ obj-$(CONFIG_SPI_IMX)			+=3D spi_imx.o
+ obj-$(CONFIG_SPI_LM70_LLP)		+=3D spi_lm70llp.o
+diff --git a/drivers/spi/ep93xx_spi.c b/drivers/spi/ep93xx_spi.c
+new file mode 100644
+index 0000000..0ba35df
+--- /dev/null
++++ b/drivers/spi/ep93xx_spi.c
+@@ -0,0 +1,938 @@
++/*
++ * Driver for Cirrus Logic EP93xx SPI controller.
++ *
++ * Copyright (c) 2010 Mika Westerberg
++ *
++ * Explicit FIFO handling code was inspired by amba-pl022 driver.
++ *
++ * Chip select support using other than built-in GPIOs by H. Hartley Sw=
eeten.
++ *
++ * For more information about the SPI controller see documentation on C=
irrus
++ * Logic web site:
++ *     http://www.cirrus.com/en/pubs/manual/EP93xx_Users_Guide_UM1.pdf
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include <linux/io.h>
++#include <linux/clk.h>
++#include <linux/err.h>
++#include <linux/delay.h>
++#include <linux/device.h>
++#include <linux/bitops.h>
++#include <linux/interrupt.h>
++#include <linux/platform_device.h>
++#include <linux/workqueue.h>
++#include <linux/sched.h>
++#include <linux/spi/spi.h>
++
++#include <mach/ep93xx_spi.h>
++
++#define SSPCR0			0x0000
++#define SSPCR0_MODE_SHIFT	6
++#define SSPCR0_SCR_SHIFT	8
++
++#define SSPCR1			0x0004
++#define SSPCR1_RIE		BIT(0)
++#define SSPCR1_TIE		BIT(1)
++#define SSPCR1_RORIE		BIT(2)
++#define SSPCR1_LBM		BIT(3)
++#define SSPCR1_SSE		BIT(4)
++#define SSPCR1_MS		BIT(5)
++#define SSPCR1_SOD		BIT(6)
++
++#define SSPDR			0x0008
++
++#define SSPSR			0x000c
++#define SSPSR_TFE		BIT(0)
++#define SSPSR_TNF		BIT(1)
++#define SSPSR_RNE		BIT(2)
++#define SSPSR_RFF		BIT(3)
++#define SSPSR_BSY		BIT(4)
++#define SSPCPSR			0x0010
++
++#define SSPIIR			0x0014
++#define SSPIIR_RIS		BIT(0)
++#define SSPIIR_TIS		BIT(1)
++#define SSPIIR_RORIS		BIT(2)
++#define SSPICR			SSPIIR
++
++/* timeout in milliseconds */
++#define SPI_TIMEOUT		5
++/* maximum depth of RX/TX FIFO */
++#define SPI_FIFO_SIZE		8
++
++/**
++ * struct ep93xx_spi - EP93xx SPI controller structure
++ * @lock: spinlock that protects concurrent accesses to fields @running=
,
++ *        @current_msg and @msg_queue
++ * @pdev: pointer to platform device
++ * @clk: clock for the controller
++ * @regs_base: pointer to ioremap()'d registers
++ * @irq: IRQ number used by the driver
++ * @min_rate: minimum clock rate (in Hz) supported by the controller
++ * @max_rate: maximum clock rate (in Hz) supported by the controller
++ * @running: is the queue running
++ * @wq: workqueue used by the driver
++ * @msg_work: work that is queued for the driver
++ * @wait: wait here until given transfer is completed
++ * @msg_queue: queue for the messages
++ * @current_msg: message that is currently processed (or %NULL if none)
++ * @tx: current byte in transfer to transmit
++ * @rx: current byte in transfer to receive
++ * @fifo_level: how full is FIFO (%0..%SPI_FIFO_SIZE - %1). Receiving o=
ne
++ *              frame decreases this level and sending one frame increa=
ses it.
++ *
++ * This structure holds EP93xx SPI controller specific information. Whe=
n
++ * @running is %true, driver accepts transfer requests from protocol dr=
ivers.
++ * @current_msg is used to hold pointer to the message that is currentl=
y
++ * processed. If @current_msg is %NULL, it means that no processing is =
going
++ * on.
++ *
++ * Most of the fields are only written once and they can be accessed wi=
thout
++ * taking the @lock. Fields that are accessed concurrently are: @curren=
t_msg,
++ * @running, and @msg_queue.
++ */
++struct ep93xx_spi {
++	spinlock_t			lock;
++	const struct platform_device	*pdev;
++	struct clk			*clk;
++	void __iomem			*regs_base;
++	int				irq;
++	unsigned long			min_rate;
++	unsigned long			max_rate;
++	bool				running;
++	struct workqueue_struct		*wq;
++	struct work_struct		msg_work;
++	struct completion		wait;
++	struct list_head		msg_queue;
++	struct spi_message		*current_msg;
++	size_t				tx;
++	size_t				rx;
++	size_t				fifo_level;
++};
++
++/**
++ * struct ep93xx_spi_chip - SPI device hardware settings
++ * @spi: back pointer to the SPI device
++ * @rate: max rate in hz this chip supports
++ * @div_cpsr: cpsr (pre-scaler) divider
++ * @div_scr: scr divider
++ * @dss: bits per word (4 - 16 bits)
++ * @ops: private chip operations
++ *
++ * This structure is used to store hardware register specific settings =
for each
++ * SPI device. Settings are written to hardware by function
++ * ep93xx_spi_chip_setup().
++ */
++struct ep93xx_spi_chip {
++	const struct spi_device		*spi;
++	unsigned long			rate;
++	u8				div_cpsr;
++	u8				div_scr;
++	u8				dss;
++	struct ep93xx_spi_chip_ops	*ops;
++};
++
++/* converts bits per word to CR0.DSS value */
++#define bits_per_word_to_dss(bpw)	((bpw) - 1)
++
++static inline void
++ep93xx_spi_write_u8(const struct ep93xx_spi *espi, u16 reg, u8 value)
++{
++	__raw_writeb(value, espi->regs_base + reg);
++}
++
++static inline u8
++ep93xx_spi_read_u8(const struct ep93xx_spi *spi, u16 reg)
++{
++	return __raw_readb(spi->regs_base + reg);
++}
++
++static inline void
++ep93xx_spi_write_u16(const struct ep93xx_spi *espi, u16 reg, u16 value)
++{
++	__raw_writew(value, espi->regs_base + reg);
++}
++
++static inline u16
++ep93xx_spi_read_u16(const struct ep93xx_spi *spi, u16 reg)
++{
++	return __raw_readw(spi->regs_base + reg);
++}
++
++static int ep93xx_spi_enable(const struct ep93xx_spi *espi)
++{
++	u8 regval;
++	int err;
++
++	err =3D clk_enable(espi->clk);
++	if (err)
++		return err;
++
++	regval =3D ep93xx_spi_read_u8(espi, SSPCR1);
++	regval |=3D SSPCR1_SSE;
++	ep93xx_spi_write_u8(espi, SSPCR1, regval);
++
++	return 0;
++}
++
++static void ep93xx_spi_disable(const struct ep93xx_spi *espi)
++{
++	u8 regval;
++
++	regval =3D ep93xx_spi_read_u8(espi, SSPCR1);
++	regval &=3D ~SSPCR1_SSE;
++	ep93xx_spi_write_u8(espi, SSPCR1, regval);
++
++	clk_disable(espi->clk);
++}
++
++static void ep93xx_spi_enable_interrupts(const struct ep93xx_spi *espi)
++{
++	u8 regval;
++
++	regval =3D ep93xx_spi_read_u8(espi, SSPCR1);
++	regval |=3D (SSPCR1_RORIE | SSPCR1_TIE | SSPCR1_RIE);
++	ep93xx_spi_write_u8(espi, SSPCR1, regval);
++}
++
++static void ep93xx_spi_disable_interrupts(const struct ep93xx_spi *espi=
)
++{
++	u8 regval;
++
++	regval =3D ep93xx_spi_read_u8(espi, SSPCR1);
++	regval &=3D ~(SSPCR1_RORIE | SSPCR1_TIE | SSPCR1_RIE);
++	ep93xx_spi_write_u8(espi, SSPCR1, regval);
++}
++
++/**
++ * ep93xx_spi_calc_divisors() - calculates SPI clock divisors
++ * @espi: ep93xx SPI controller struct
++ * @chip: divisors are calculated for this chip
++ * @rate: desired SPI output clock rate
++ *
++ * Function calculates cpsr (clock pre-scaler) and scr divisors based o=
n
++ * given @rate and places them to @chip->div_cpsr and @chip->div_scr. I=
f,
++ * for some reason, divisors cannot be calculated nothing is stored and
++ * %-EINVAL is returned.
++ */
++static int ep93xx_spi_calc_divisors(const struct ep93xx_spi *espi,
++				    struct ep93xx_spi_chip *chip,
++				    unsigned long rate)
++{
++	unsigned long spi_clk_rate =3D clk_get_rate(espi->clk);
++	int cpsr, scr;
++
++	/*
++	 * Make sure that max value is between values supported by the
++	 * controller. Note that minimum value is already checked in
++	 * ep93xx_spi_transfer().
++	 */
++	rate =3D clamp(rate, espi->min_rate, espi->max_rate);
++
++	/*
++	 * Calculate divisors so that we can get speed according the
++	 * following formula:
++	 *	rate =3D spi_clock_rate / (cpsr * (1 + scr))
++	 *
++	 * cpsr must be even number and starts from 2, scr can be any number
++	 * between 0 and 255.
++	 */
++	for (cpsr =3D 2; cpsr <=3D 254; cpsr +=3D 2) {
++		for (scr =3D 0; scr <=3D 255; scr++) {
++			if ((spi_clk_rate / (cpsr * (scr + 1))) <=3D rate) {
++				chip->div_scr =3D (u8)scr;
++				chip->div_cpsr =3D (u8)cpsr;
++				return 0;
++			}
++		}
++	}
++
++	return -EINVAL;
++}
++
++static void ep93xx_spi_cs_control(struct spi_device *spi, bool control)
++{
++	struct ep93xx_spi_chip *chip =3D spi_get_ctldata(spi);
++	int value =3D (spi->mode & SPI_CS_HIGH) ? control : !control;
++
++	if (chip->ops && chip->ops->cs_control)
++		chip->ops->cs_control(spi, value);
++}
++
++/**
++ * ep93xx_spi_setup() - setup an SPI device
++ * @spi: SPI device to setup
++ *
++ * This function sets up SPI device mode, speed etc. Can be called mult=
iple
++ * times for a single device. Returns %0 in case of success, negative e=
rror in
++ * case of failure. When this function returns success, the device is
++ * deselected.
++ */
++static int ep93xx_spi_setup(struct spi_device *spi)
++{
++	struct ep93xx_spi *espi =3D spi_master_get_devdata(spi->master);
++	struct ep93xx_spi_chip *chip;
++
++	if (spi->bits_per_word < 4 || spi->bits_per_word > 16) {
++		dev_err(&espi->pdev->dev, "invalid bits per word %d\n",
++			spi->bits_per_word);
++		return -EINVAL;
++	}
++
++	chip =3D spi_get_ctldata(spi);
++	if (!chip) {
++		dev_dbg(&espi->pdev->dev, "initial setup for %s\n",
++			spi->modalias);
++
++		chip =3D kzalloc(sizeof(*chip), GFP_KERNEL);
++		if (!chip)
++			return -ENOMEM;
++
++		chip->spi =3D spi;
++		chip->ops =3D spi->controller_data;
++
++		if (chip->ops && chip->ops->setup) {
++			int ret =3D chip->ops->setup(spi);
++			if (ret) {
++				kfree(chip);
++				return ret;
++			}
++		}
++
++		spi_set_ctldata(spi, chip);
++	}
++
++	if (spi->max_speed_hz !=3D chip->rate) {
++		int err;
++
++		err =3D ep93xx_spi_calc_divisors(espi, chip, spi->max_speed_hz);
++		if (err !=3D 0) {
++			spi_set_ctldata(spi, NULL);
++			kfree(chip);
++			return err;
++		}
++		chip->rate =3D spi->max_speed_hz;
++	}
++
++	chip->dss =3D bits_per_word_to_dss(spi->bits_per_word);
++
++	ep93xx_spi_cs_control(spi, false);
++	return 0;
++}
++
++/**
++ * ep93xx_spi_transfer() - queue message to be transferred
++ * @spi: target SPI device
++ * @msg: message to be transferred
++ *
++ * This function is called by SPI device drivers when they are going to=
 transfer
++ * a new message. It simply puts the message in the queue and schedules
++ * workqueue to perform the actual transfer later on.
++ *
++ * Returns %0 on success and negative error in case of failure.
++ */
++static int ep93xx_spi_transfer(struct spi_device *spi, struct spi_messa=
ge *msg)
++{
++	struct ep93xx_spi *espi =3D spi_master_get_devdata(spi->master);
++	struct spi_transfer *t;
++	unsigned long flags;
++
++	if (!msg || !msg->complete)
++		return -EINVAL;
++
++	/* first validate each transfer */
++	list_for_each_entry(t, &msg->transfers, transfer_list) {
++		if (t->bits_per_word) {
++			if (t->bits_per_word < 4 || t->bits_per_word > 16)
++				return -EINVAL;
++		}
++		if (t->speed_hz && t->speed_hz < espi->min_rate)
++				return -EINVAL;
++	}
++
++	/*
++	 * Now that we own the message, let's initialize it so that it is
++	 * suitable for us. We use @msg->status to signal whether there was
++	 * error in transfer and @msg->state is used to hold pointer to the
++	 * current transfer (or %NULL if no active current transfer).
++	 */
++	msg->state =3D NULL;
++	msg->status =3D 0;
++	msg->actual_length =3D 0;
++
++	spin_lock_irqsave(&espi->lock, flags);
++	if (!espi->running) {
++		spin_unlock_irqrestore(&espi->lock, flags);
++		return -ESHUTDOWN;
++	}
++	list_add_tail(&msg->queue, &espi->msg_queue);
++	queue_work(espi->wq, &espi->msg_work);
++	spin_unlock_irqrestore(&espi->lock, flags);
++
++	return 0;
++}
++
++/**
++ * ep93xx_spi_cleanup() - cleans up master controller specific state
++ * @spi: SPI device to cleanup
++ *
++ * This function releases master controller specific state for given @s=
pi
++ * device.
++ */
++static void ep93xx_spi_cleanup(struct spi_device *spi)
++{
++	struct ep93xx_spi_chip *chip;
++
++	chip =3D spi_get_ctldata(spi);
++	if (chip) {
++		if (chip->ops && chip->ops->cleanup)
++			chip->ops->cleanup(spi);
++		spi_set_ctldata(spi, NULL);
++		kfree(chip);
++	}
++}
++
++/**
++ * ep93xx_spi_chip_setup() - configures hardware according to given @ch=
ip
++ * @espi: ep93xx SPI controller struct
++ * @chip: chip specific settings
++ *
++ * This function sets up the actual hardware registers with settings gi=
ven in
++ * @chip. Note that no validation is done so make sure that callers val=
idate
++ * settings before calling this.
++ */
++static void ep93xx_spi_chip_setup(const struct ep93xx_spi *espi,
++				  const struct ep93xx_spi_chip *chip)
++{
++	u16 cr0;
++
++	cr0 =3D chip->div_scr << SSPCR0_SCR_SHIFT;
++	cr0 |=3D (chip->spi->mode & (SPI_CPHA|SPI_CPOL)) << SSPCR0_MODE_SHIFT;
++	cr0 |=3D chip->dss;
++
++	dev_dbg(&espi->pdev->dev, "setup: mode %d, cpsr %d, scr %d, dss %d\n",
++		chip->spi->mode, chip->div_cpsr, chip->div_scr, chip->dss);
++	dev_dbg(&espi->pdev->dev, "setup: cr0 %#x", cr0);
++
++	ep93xx_spi_write_u8(espi, SSPCPSR, chip->div_cpsr);
++	ep93xx_spi_write_u16(espi, SSPCR0, cr0);
++}
++
++static inline int bits_per_word(const struct ep93xx_spi *espi)
++{
++	struct spi_message *msg =3D espi->current_msg;
++	struct spi_transfer *t =3D msg->state;
++
++	return t->bits_per_word ? t->bits_per_word : msg->spi->bits_per_word;
++}
++
++static void ep93xx_do_write(struct ep93xx_spi *espi, struct spi_transfe=
r *t)
++{
++	if (bits_per_word(espi) > 8) {
++		u16 tx_val =3D 0;
++
++		if (t->tx_buf)
++			tx_val =3D ((u16 *)t->tx_buf)[espi->tx];
++		ep93xx_spi_write_u16(espi, SSPDR, tx_val);
++		espi->tx +=3D sizeof(tx_val);
++	} else {
++		u8 tx_val =3D 0;
++
++		if (t->tx_buf)
++			tx_val =3D ((u8 *)t->tx_buf)[espi->tx];
++		ep93xx_spi_write_u8(espi, SSPDR, tx_val);
++		espi->tx +=3D sizeof(tx_val);
++	}
++}
++
++static void ep93xx_do_read(struct ep93xx_spi *espi, struct spi_transfer=
 *t)
++{
++	if (bits_per_word(espi) > 8) {
++		u16 rx_val;
++
++		rx_val =3D ep93xx_spi_read_u16(espi, SSPDR);
++		if (t->rx_buf)
++			((u16 *)t->rx_buf)[espi->rx] =3D rx_val;
++		espi->rx +=3D sizeof(rx_val);
++	} else {
++		u8 rx_val;
++
++		rx_val =3D ep93xx_spi_read_u8(espi, SSPDR);
++		if (t->rx_buf)
++			((u8 *)t->rx_buf)[espi->rx] =3D rx_val;
++		espi->rx +=3D sizeof(rx_val);
++	}
++}
++
++/**
++ * ep93xx_spi_read_write() - perform next RX/TX transfer
++ * @espi: ep93xx SPI controller struct
++ *
++ * This function transfers next bytes (or half-words) to/from RX/TX FIF=
Os. If
++ * called several times, the whole transfer will be completed. Returns
++ * %-EINPROGRESS when current transfer was not yet completed otherwise =
%0.
++ *
++ * When this function is finished, RX FIFO should be empty and TX FIFO =
should be
++ * full.
++ */
++static int ep93xx_spi_read_write(struct ep93xx_spi *espi)
++{
++	struct spi_message *msg =3D espi->current_msg;
++	struct spi_transfer *t =3D msg->state;
++
++	/* read as long as RX FIFO has frames in it */
++	while ((ep93xx_spi_read_u8(espi, SSPSR) & SSPSR_RNE)) {
++		ep93xx_do_read(espi, t);
++		espi->fifo_level--;
++	}
++
++	/* write as long as TX FIFO has room */
++	while (espi->fifo_level < SPI_FIFO_SIZE && espi->tx < t->len) {
++		ep93xx_do_write(espi, t);
++		espi->fifo_level++;
++	}
++
++	if (espi->rx =3D=3D t->len) {
++		msg->actual_length +=3D t->len;
++		return 0;
++	}
++
++	return -EINPROGRESS;
++}
++
++/**
++ * ep93xx_spi_process_transfer() - processes one SPI transfer
++ * @espi: ep93xx SPI controller struct
++ * @msg: current message
++ * @t: transfer to process
++ *
++ * This function processes one SPI transfer given in @t. Function waits=
 until
++ * transfer is complete (may sleep) and updates @msg->status based on w=
hether
++ * transfer was succesfully processed or not.
++ */
++static void ep93xx_spi_process_transfer(struct ep93xx_spi *espi,
++					struct spi_message *msg,
++					struct spi_transfer *t)
++{
++	struct ep93xx_spi_chip *chip =3D spi_get_ctldata(msg->spi);
++
++	msg->state =3D t;
++
++	/*
++	 * Handle any transfer specific settings if needed. We use
++	 * temporary chip settings here and restore original later when
++	 * the transfer is finished.
++	 */
++	if (t->speed_hz || t->bits_per_word) {
++		struct ep93xx_spi_chip tmp_chip =3D *chip;
++
++		if (t->speed_hz) {
++			int err;
++
++			err =3D ep93xx_spi_calc_divisors(espi, &tmp_chip,
++						       t->speed_hz);
++			if (err) {
++				dev_err(&espi->pdev->dev,
++					"failed to adjust speed\n");
++				msg->status =3D err;
++				return;
++			}
++		}
++
++		if (t->bits_per_word)
++			tmp_chip.dss =3D bits_per_word_to_dss(t->bits_per_word);
++
++		/*
++		 * Set up temporary new hw settings for this transfer.
++		 */
++		ep93xx_spi_chip_setup(espi, &tmp_chip);
++	}
++
++	espi->rx =3D 0;
++	espi->tx =3D 0;
++
++	/*
++	 * Now everything is set up for the current transfer. We prime the TX
++	 * FIFO, enable interrupts, and wait for the transfer to complete.
++	 */
++	if (ep93xx_spi_read_write(espi)) {
++		ep93xx_spi_enable_interrupts(espi);
++		wait_for_completion(&espi->wait);
++	}
++
++	/*
++	 * In case of error during transmit, we bail out from processing
++	 * the message.
++	 */
++	if (msg->status)
++		return;
++
++	/*
++	 * After this transfer is finished, perform any possible
++	 * post-transfer actions requested by the protocol driver.
++	 */
++	if (t->delay_usecs) {
++		set_current_state(TASK_UNINTERRUPTIBLE);
++		schedule_timeout(usecs_to_jiffies(t->delay_usecs));
++	}
++	if (t->cs_change) {
++		if (!list_is_last(&t->transfer_list, &msg->transfers)) {
++			/*
++			 * In case protocol driver is asking us to drop the
++			 * chipselect briefly, we let the scheduler to handle
++			 * any "delay" here.
++			 */
++			ep93xx_spi_cs_control(msg->spi, false);
++			cond_resched();
++			ep93xx_spi_cs_control(msg->spi, true);
++		}
++	}
++
++	if (t->speed_hz || t->bits_per_word)
++		ep93xx_spi_chip_setup(espi, chip);
++}
++
++/*
++ * ep93xx_spi_process_message() - process one SPI message
++ * @espi: ep93xx SPI controller struct
++ * @msg: message to process
++ *
++ * This function processes a single SPI message. We go through all tran=
sfers in
++ * the message and pass them to ep93xx_spi_process_transfer(). Chipsele=
ct is
++ * asserted during the whole message (unless per transfer cs_change is =
set).
++ *
++ * @msg->status contains %0 in case of success or negative error code i=
n case of
++ * failure.
++ */
++static void ep93xx_spi_process_message(struct ep93xx_spi *espi,
++				       struct spi_message *msg)
++{
++	unsigned long timeout;
++	struct spi_transfer *t;
++	int err;
++
++	/*
++	 * Enable the SPI controller and its clock.
++	 */
++	err =3D ep93xx_spi_enable(espi);
++	if (err) {
++		dev_err(&espi->pdev->dev, "failed to enable SPI controller\n");
++		msg->status =3D err;
++		return;
++	}
++
++	/*
++	 * Just to be sure: flush any data from RX FIFO.
++	 */
++	timeout =3D jiffies + msecs_to_jiffies(SPI_TIMEOUT);
++	while (ep93xx_spi_read_u16(espi, SSPSR) & SSPSR_RNE) {
++		if (time_after(jiffies, timeout)) {
++			dev_warn(&espi->pdev->dev,
++				 "timeout while flushing RX FIFO\n");
++			msg->status =3D -ETIMEDOUT;
++			return;
++		}
++		ep93xx_spi_read_u16(espi, SSPDR);
++	}
++
++	/*
++	 * We explicitly handle FIFO level. This way we don't have to check TX
++	 * FIFO status using %SSPSR_TNF bit which may cause RX FIFO overruns.
++	 */
++	espi->fifo_level =3D 0;
++
++	/*
++	 * Update SPI controller registers according to spi device and assert
++	 * the chipselect.
++	 */
++	ep93xx_spi_chip_setup(espi, spi_get_ctldata(msg->spi));
++	ep93xx_spi_cs_control(msg->spi, true);
++
++	list_for_each_entry(t, &msg->transfers, transfer_list) {
++		ep93xx_spi_process_transfer(espi, msg, t);
++		if (msg->status)
++			break;
++	}
++
++	/*
++	 * Now the whole message is transferred (or failed for some reason). W=
e
++	 * deselect the device and disable the SPI controller.
++	 */
++	ep93xx_spi_cs_control(msg->spi, false);
++	ep93xx_spi_disable(espi);
++}
++
++#define work_to_espi(work) (container_of((work), struct ep93xx_spi, msg=
_work))
++
++/**
++ * ep93xx_spi_work() - EP93xx SPI workqueue worker function
++ * @work: work struct
++ *
++ * Workqueue worker function. This function is called when there are ne=
w
++ * SPI messages to be processed. Message is taken out from the queue an=
d then
++ * passed to ep93xx_spi_process_message().
++ *
++ * After message is transferred, protocol driver is notified by calling
++ * @msg->complete(). In case of error, @msg->status is set to negative =
error
++ * number, otherwise it contains zero (and @msg->actual_length is updat=
ed).
++ */
++static void ep93xx_spi_work(struct work_struct *work)
++{
++	struct ep93xx_spi *espi =3D work_to_espi(work);
++	struct spi_message *msg;
++
++	spin_lock_irq(&espi->lock);
++	if (!espi->running || espi->current_msg ||
++		list_empty(&espi->msg_queue)) {
++		spin_unlock_irq(&espi->lock);
++		return;
++	}
++	msg =3D list_first_entry(&espi->msg_queue, struct spi_message, queue);
++	list_del_init(&msg->queue);
++	espi->current_msg =3D msg;
++	spin_unlock_irq(&espi->lock);
++
++	ep93xx_spi_process_message(espi, msg);
++
++	/*
++	 * Update the current message and re-schedule ourselves if there are
++	 * more messages in the queue.
++	 */
++	spin_lock_irq(&espi->lock);
++	espi->current_msg =3D NULL;
++	if (espi->running && !list_empty(&espi->msg_queue))
++		queue_work(espi->wq, &espi->msg_work);
++	spin_unlock_irq(&espi->lock);
++
++	/* notify the protocol driver that we are done with this message */
++	msg->complete(msg->context);
++}
++
++static irqreturn_t ep93xx_spi_interrupt(int irq, void *dev_id)
++{
++	struct ep93xx_spi *espi =3D dev_id;
++	u8 irq_status =3D ep93xx_spi_read_u8(espi, SSPIIR);
++
++	/*
++	 * If we got ROR (receive overrun) interrupt we know that something is
++	 * wrong. Just abort the message.
++	 */
++	if (unlikely(irq_status & SSPIIR_RORIS)) {
++		/* clear the overrun interrupt */
++		ep93xx_spi_write_u8(espi, SSPICR, 0);
++		dev_warn(&espi->pdev->dev,
++			 "receive overrun, aborting the message\n");
++		espi->current_msg->status =3D -EIO;
++	} else {
++		/*
++		 * Interrupt is either RX (RIS) or TX (TIS). For both cases we
++		 * simply execute next data transfer.
++		 */
++		if (ep93xx_spi_read_write(espi)) {
++			/*
++			 * In normal case, there still is some processing left
++			 * for current transfer. Let's wait for the next
++			 * interrupt then.
++			 */
++			return IRQ_HANDLED;
++		}
++	}
++
++	/*
++	 * Current transfer is finished, either with error or with success. In
++	 * any case we disable interrupts and notify the worker to handle
++	 * any post-processing of the message.
++	 */
++	ep93xx_spi_disable_interrupts(espi);
++	complete(&espi->wait);
++	return IRQ_HANDLED;
++}
++
++static int __init ep93xx_spi_probe(struct platform_device *pdev)
++{
++	struct spi_master *master;
++	struct ep93xx_spi_info *info;
++	struct ep93xx_spi *espi;
++	struct resource *res;
++	int error;
++
++	info =3D pdev->dev.platform_data;
++
++	master =3D spi_alloc_master(&pdev->dev, sizeof(*espi));
++	if (!master) {
++		dev_err(&pdev->dev, "failed to allocate spi master\n");
++		return -ENOMEM;
++	}
++
++	master->setup =3D ep93xx_spi_setup;
++	master->transfer =3D ep93xx_spi_transfer;
++	master->cleanup =3D ep93xx_spi_cleanup;
++	master->bus_num =3D pdev->id;
++	master->num_chipselect =3D info->num_chipselect;
++	master->mode_bits =3D SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
++
++	platform_set_drvdata(pdev, master);
++
++	espi =3D spi_master_get_devdata(master);
++
++	espi->clk =3D clk_get(&pdev->dev, NULL);
++	if (IS_ERR(espi->clk)) {
++		dev_err(&pdev->dev, "unable to get spi clock\n");
++		error =3D PTR_ERR(espi->clk);
++		goto fail_release_master;
++	}
++
++	spin_lock_init(&espi->lock);
++	init_completion(&espi->wait);
++
++	/*
++	 * Calculate maximum and minimum supported clock rates
++	 * for the controller.
++	 */
++	espi->max_rate =3D clk_get_rate(espi->clk) / 2;
++	espi->min_rate =3D clk_get_rate(espi->clk) / (254 * 256);
++	espi->pdev =3D pdev;
++
++	espi->irq =3D platform_get_irq(pdev, 0);
++	if (espi->irq < 0) {
++		error =3D -EBUSY;
++		dev_err(&pdev->dev, "failed to get irq resources\n");
++		goto fail_put_clock;
++	}
++
++	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(&pdev->dev, "unable to get iomem resource\n");
++		error =3D -ENODEV;
++		goto fail_put_clock;
++	}
++
++	res =3D request_mem_region(res->start, resource_size(res), pdev->name)=
;
++	if (!res) {
++		dev_err(&pdev->dev, "unable to request iomem resources\n");
++		error =3D -EBUSY;
++		goto fail_put_clock;
++	}
++
++	espi->regs_base =3D ioremap(res->start, resource_size(res));
++	if (!espi->regs_base) {
++		dev_err(&pdev->dev, "failed to map resources\n");
++		error =3D -ENODEV;
++		goto fail_free_mem;
++	}
++
++	error =3D request_irq(espi->irq, ep93xx_spi_interrupt, 0,
++			    "ep93xx-spi", espi);
++	if (error) {
++		dev_err(&pdev->dev, "failed to request irq\n");
++		goto fail_unmap_regs;
++	}
++
++	espi->wq =3D create_singlethread_workqueue("ep93xx_spid");
++	if (!espi->wq) {
++		dev_err(&pdev->dev, "unable to create workqueue\n");
++		goto fail_free_irq;
++	}
++	INIT_WORK(&espi->msg_work, ep93xx_spi_work);
++	INIT_LIST_HEAD(&espi->msg_queue);
++	espi->running =3D true;
++
++	/* make sure that the hardware is disabled */
++	ep93xx_spi_write_u8(espi, SSPCR1, 0);
++
++	error =3D spi_register_master(master);
++	if (error) {
++		dev_err(&pdev->dev, "failed to register SPI master\n");
++		goto fail_free_queue;
++	}
++
++	dev_info(&pdev->dev, "EP93xx SPI Controller at 0x%08lx irq %d\n",
++		 (unsigned long)res->start, espi->irq);
++
++	return 0;
++
++fail_free_queue:
++	destroy_workqueue(espi->wq);
++fail_free_irq:
++	free_irq(espi->irq, espi);
++fail_unmap_regs:
++	iounmap(espi->regs_base);
++fail_free_mem:
++	release_mem_region(res->start, resource_size(res));
++fail_put_clock:
++	clk_put(espi->clk);
++fail_release_master:
++	spi_master_put(master);
++	platform_set_drvdata(pdev, NULL);
++
++	return error;
++}
++
++static int __exit ep93xx_spi_remove(struct platform_device *pdev)
++{
++	struct spi_master *master =3D platform_get_drvdata(pdev);
++	struct ep93xx_spi *espi =3D spi_master_get_devdata(master);
++	struct resource *res;
++
++	spin_lock_irq(&espi->lock);
++	espi->running =3D false;
++	spin_unlock_irq(&espi->lock);
++
++	destroy_workqueue(espi->wq);
++
++	/*
++	 * Complete remaining messages with %-ESHUTDOWN status.
++	 */
++	spin_lock_irq(&espi->lock);
++	while (!list_empty(&espi->msg_queue)) {
++		struct spi_message *msg;
++
++		msg =3D list_first_entry(&espi->msg_queue,
++				       struct spi_message, queue);
++		list_del_init(&msg->queue);
++		msg->status =3D -ESHUTDOWN;
++		spin_unlock_irq(&espi->lock);
++		msg->complete(msg->context);
++		spin_lock_irq(&espi->lock);
++	}
++	spin_unlock_irq(&espi->lock);
++
++	free_irq(espi->irq, espi);
++	iounmap(espi->regs_base);
++	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	release_mem_region(res->start, resource_size(res));
++	clk_put(espi->clk);
++	platform_set_drvdata(pdev, NULL);
++
++	spi_unregister_master(master);
++	return 0;
++}
++
++static struct platform_driver ep93xx_spi_driver =3D {
++	.driver		=3D {
++		.name	=3D "ep93xx-spi",
++		.owner	=3D THIS_MODULE,
++	},
++	.remove		=3D __exit_p(ep93xx_spi_remove),
++};
++
++static int __init ep93xx_spi_init(void)
++{
++	return platform_driver_probe(&ep93xx_spi_driver, ep93xx_spi_probe);
++}
++module_init(ep93xx_spi_init);
++
++static void __exit ep93xx_spi_exit(void)
++{
++	platform_driver_unregister(&ep93xx_spi_driver);
++}
++module_exit(ep93xx_spi_exit);
++
++MODULE_DESCRIPTION("EP93xx SPI Controller driver");
++MODULE_AUTHOR("Mika Westerberg <mika.westerberg@iki.fi>");
++MODULE_LICENSE("GPL");
++MODULE_ALIAS("platform:ep93xx-spi");
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0018-ts72xx_spi_tmp124.pat=
ch b/recipes/linux/linux-2.6.34/ts72xx/0018-ts72xx_spi_tmp124.patch
new file mode 100644
index 0000000..7e9650b
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0018-ts72xx_spi_tmp124.patch
@@ -0,0 +1,298 @@
+From 314f5d55f44d63c4ff418260580b93727eee00dc Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <mcrapet@gmail.com>
+Date: Tue, 22 Jun 2010 15:48:27 +0200
+Subject: [PATCH 18/18] ts72xx_spi_tmp124
+
+It's an option. A 3-wire spi temperature sensor can be populated on TS-7=
2XX sbc.
+---
+ arch/arm/mach-ep93xx/ts72xx.c |   61 ++++++++++++++++
+ drivers/spi/Kconfig           |    7 ++
+ drivers/spi/Makefile          |    1 +
+ drivers/spi/tmp124.c          |  158 ++++++++++++++++++++++++++++++++++=
+++++++
+ 4 files changed, 227 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/spi/tmp124.c
+
+diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
+index 475559e..bf3a666 100644
+--- a/arch/arm/mach-ep93xx/ts72xx.c
++++ b/arch/arm/mach-ep93xx/ts72xx.c
+@@ -23,7 +23,9 @@
+ #include <linux/i2c-gpio.h>
+ #include <linux/mtd/nand.h>
+ #include <linux/mtd/partitions.h>
++#include <linux/spi/spi.h>
+=20
++#include <mach/ep93xx_spi.h>
+ #include <mach/hardware.h>
+ #include <mach/ts72xx.h>
+=20
+@@ -367,6 +369,60 @@ static struct i2c_gpio_platform_data ts72xx_i2c_gpi=
o_data =3D {
+ static struct i2c_board_info __initdata ts72xx_i2c_board_info[] =3D {
+ };
+=20
++/**********************************************************************=
***
++ * SPI
++ **********************************************************************=
***/
++#if defined(CONFIG_SPI_TMP124) || defined(CONFIG_SPI_TMP124_MODULE)
++
++/* this is our GPIO line used for chip select */
++#define TMP124_CHIP_SELECT_GPIO EP93XX_GPIO_LINE_MCCD2
++
++static int ts72xx_tmp124_setup(struct spi_device *spi)
++{
++	int err;
++
++	err =3D gpio_request(TMP124_CHIP_SELECT_GPIO, spi->modalias);
++	if (err)
++		return err;
++
++	gpio_direction_output(TMP124_CHIP_SELECT_GPIO, 1);
++
++	return 0;
++}
++
++static void ts72xx_tmp124_cleanup(struct spi_device *spi)
++{
++	gpio_set_value(TMP124_CHIP_SELECT_GPIO, 1);
++	gpio_direction_input(TMP124_CHIP_SELECT_GPIO);
++	gpio_free(TMP124_CHIP_SELECT_GPIO);
++}
++
++static void ts72xx_tmp124_cs_control(struct spi_device *spi, int value)
++{
++	gpio_set_value(TMP124_CHIP_SELECT_GPIO, value);
++}
++
++static struct ep93xx_spi_chip_ops ts72xx_tmp124_ops =3D {
++	.setup		=3D ts72xx_tmp124_setup,
++	.cleanup	=3D ts72xx_tmp124_cleanup,
++	.cs_control	=3D ts72xx_tmp124_cs_control,
++};
++
++static struct spi_board_info ts72xx_spi_devices[] =3D {
++	{
++		.modalias		=3D "tmp124",
++		.max_speed_hz		=3D 2 * 1000 * 1000,
++		.bus_num		=3D 0,
++		.chip_select		=3D 0,
++		.controller_data	=3D &ts72xx_tmp124_ops,
++	},
++};
++
++static struct ep93xx_spi_info ts72xx_spi_info =3D {
++	.num_chipselect	=3D ARRAY_SIZE(ts72xx_spi_devices),
++};
++#endif
++
+ static void __init ts72xx_init_machine(void)
+ {
+ 	ep93xx_init_devices();
+@@ -380,6 +436,11 @@ static void __init ts72xx_init_machine(void)
+ 			ts72xx_i2c_board_info,
+ 			ARRAY_SIZE(ts72xx_i2c_board_info));
+=20
++	#if defined(CONFIG_SPI_TMP124) || defined(CONFIG_SPI_TMP124_MODULE)
++	ep93xx_register_spi(&ts72xx_spi_info, ts72xx_spi_devices,
++			ARRAY_SIZE(ts72xx_spi_devices));
++	#endif
++
+ 	if (is_max197_installed()) {
+ 		platform_device_register(&ts72xx_max197_device);
+ 	}
+diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
+index 2b2f4c3..9f40a43 100644
+--- a/drivers/spi/Kconfig
++++ b/drivers/spi/Kconfig
+@@ -372,6 +372,13 @@ config SPI_TLE62X0
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
+index 377f845..2798b38 100644
+--- a/drivers/spi/Makefile
++++ b/drivers/spi/Makefile
+@@ -56,6 +56,7 @@ spi_s3c24xx_hw-$(CONFIG_SPI_S3C24XX_FIQ) +=3D spi_s3c2=
4xx_fiq.o
+ # SPI protocol drivers (device/link on bus)
+ obj-$(CONFIG_SPI_SPIDEV)	+=3D spidev.o
+ obj-$(CONFIG_SPI_TLE62X0)	+=3D tle62x0.o
++obj-$(CONFIG_SPI_TMP124)	+=3D tmp124.o
+ # 	... add above this line ...
+=20
+ # SPI slave controller drivers (upstream link)
+diff --git a/drivers/spi/tmp124.c b/drivers/spi/tmp124.c
+new file mode 100644
+index 0000000..e41ec8c
+--- /dev/null
++++ b/drivers/spi/tmp124.c
+@@ -0,0 +1,158 @@
++/*
++ *  TMP124 SPI protocol driver
++ *
++ * (c) Copyright 2008-2010  Matthieu Crapet <mcrapet@gmail.com>
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
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/spi/spi.h>
++#include <linux/slab.h>
++#include <linux/sched.h>
++
++struct tmp124_state {
++	struct spi_device *bus;
++	u8 tx_buff[2];
++	u8 rx_buff[2];
++};
++
++static inline int tmp124_write_then_read(struct tmp124_state *st)
++{
++	struct spi_message msg;
++	struct spi_transfer xfer[2] =3D {
++		{
++			.tx_buf		=3D st->tx_buff,
++			.rx_buf		=3D NULL,
++			.len		=3D 2,
++		}, {
++			.tx_buf		=3D NULL,
++			.rx_buf		=3D st->rx_buff,
++			.len		=3D 2,
++		}
++	};
++
++	spi_message_init(&msg);
++	spi_message_add_tail(&xfer[0], &msg);
++	spi_sync(st->bus, &msg);
++
++	/* SPI_3WIRE is not handled by ep93xx_spi, the 2 messages must be
++	 * splitted. We must wait to not confuse driver with read/write. */
++	schedule_timeout(usecs_to_jiffies(1000));
++
++	spi_message_init(&msg);
++	spi_message_add_tail(&xfer[1], &msg);
++	return spi_sync(st->bus, &msg);
++}
++
++static ssize_t tmp124_temperature_show(struct device *dev,
++		struct device_attribute *attr, char *buf)
++{
++	struct tmp124_state *st =3D dev_get_drvdata(dev);
++	int ret;
++
++	((short *)st->tx_buff)[0] =3D 0x8000;
++
++	ret =3D tmp124_write_then_read(st);
++	if (ret < 0) {
++		dev_err(&st->bus->dev, "tmp124_write_then_read\n");
++		ret =3D 0;
++	} else {
++		signed long val =3D ((short *)st->rx_buff)[0];
++
++		val =3D val >> 3;
++
++		/* 2 digit precision (0.0625*100) */
++		val =3D (val * 50) / 8;
++		ret =3D snprintf(buf, PAGE_SIZE, "%ld.%02ld\n", val/100, abs(val%100)=
);
++	}
++	return ret;
++}
++
++static DEVICE_ATTR(temperature, S_IRUGO, tmp124_temperature_show, NULL)=
;
++
++static int __devinit tmp124_probe(struct spi_device *spi)
++{
++	struct tmp124_state *st;
++	int ret;
++
++	st =3D kzalloc(sizeof(struct tmp124_state), GFP_KERNEL);
++	if (st =3D=3D NULL) {
++		dev_err(&spi->dev, "no memory for device state\n");
++		return -ENOMEM;
++	}
++
++	/* required config */
++	spi->bits_per_word =3D 16;
++        spi->mode =3D SPI_MODE_0;
++
++	ret =3D spi_setup(spi);
++	if (ret) {
++		dev_err(&spi->dev, "setup device\n");
++		goto err;
++	}
++
++	ret =3D device_create_file(&spi->dev, &dev_attr_temperature);
++	if (ret) {
++		dev_err(&spi->dev, "cannot create temperature attribute\n");
++		goto err;
++	}
++
++	st->bus =3D spi;
++	spi_set_drvdata(spi, st);
++	return 0;
++
++err:
++	kfree(st);
++	return ret;
++}
++
++static int __devexit tmp124_remove(struct spi_device *spi)
++{
++	struct tmp124_state *st =3D spi_get_drvdata(spi);
++
++	device_remove_file(&spi->dev, &dev_attr_temperature);
++	kfree(st);
++	return 0;
++}
++
++static struct spi_driver tmp124_driver =3D {
++	.driver =3D {
++		.name	=3D "tmp124",
++		.owner	=3D THIS_MODULE,
++	},
++	.probe	=3D tmp124_probe,
++	.remove	=3D __devexit_p(tmp124_remove),
++};
++
++static __init int tmp124_init(void)
++{
++	return spi_register_driver(&tmp124_driver);
++}
++
++static __exit void tmp124_exit(void)
++{
++	spi_unregister_driver(&tmp124_driver);
++}
++
++module_init(tmp124_init);
++module_exit(tmp124_exit);
++
++MODULE_AUTHOR("Matthieu Crapet <mcrapet@gmail.com>");
++MODULE_DESCRIPTION("TMP124 SPI Protocol Driver");
++MODULE_LICENSE("GPL");
++MODULE_ALIAS("spi:tmp124");
++MODULE_VERSION("0.2");
+--=20
+1.7.1
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/defconfig b/recipes/linux/=
linux-2.6.34/ts72xx/defconfig
new file mode 100644
index 0000000..e125912
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/defconfig
@@ -0,0 +1,1679 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.34.7
+# Sat Oct  2 10:02:23 2010
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+CONFIG_GENERIC_GPIO=3Dy
+CONFIG_HAVE_PROC_CPU=3Dy
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_NEED_DMA_MAP_STATE=3Dy
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
+CONFIG_LOCALVERSION=3D""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=3Dy
+CONFIG_HAVE_KERNEL_LZMA=3Dy
+CONFIG_HAVE_KERNEL_LZO=3Dy
+CONFIG_KERNEL_GZIP=3Dy
+# CONFIG_KERNEL_BZIP2 is not set
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
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
+# CONFIG_TINY_RCU is not set
+# CONFIG_RCU_TRACE is not set
+CONFIG_RCU_FANOUT=3D32
+# CONFIG_RCU_FANOUT_EXACT is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D16
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
+CONFIG_HAVE_PERF_EVENTS=3Dy
+CONFIG_PERF_USE_VMALLOC=3Dy
+
+#
+# Kernel Performance Events And Counters
+#
+# CONFIG_PERF_EVENTS is not set
+# CONFIG_PERF_COUNTERS is not set
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
+CONFIG_BLK_DEV_BSG=3Dy
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_DEADLINE=3Dy
+CONFIG_IOSCHED_CFQ=3Dy
+# CONFIG_DEFAULT_DEADLINE is not set
+CONFIG_DEFAULT_CFQ=3Dy
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"cfq"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_SPIN_UNLOCK is not set
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_READ_UNLOCK is not set
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQ is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_WRITE_UNLOCK is not set
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
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
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_EBSA110 is not set
+CONFIG_ARCH_EP93XX=3Dy
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_STMP3XXX is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_NUC93X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P6440 is not set
+# CONFIG_ARCH_S5P6442 is not set
+# CONFIG_ARCH_S5PC1XX is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
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
+# CONFIG_EP93XX_SDCE1_PHYS_OFFSET is not set
+# CONFIG_EP93XX_SDCE2_PHYS_OFFSET is not set
+# CONFIG_EP93XX_SDCE3_ASYNC_PHYS_OFFSET is not set
+# CONFIG_MACH_ADSSPHERE is not set
+# CONFIG_MACH_EDB9301 is not set
+# CONFIG_MACH_EDB9302 is not set
+# CONFIG_MACH_EDB9307 is not set
+# CONFIG_MACH_EDB9312 is not set
+# CONFIG_MACH_EDB9315 is not set
+# CONFIG_MACH_GESBC9312 is not set
+# CONFIG_MACH_MICRO9H is not set
+# CONFIG_MACH_MICRO9L is not set
+CONFIG_MACH_TS72XX=3Dy
+CONFIG_EP93XX_EARLY_UART1=3Dy
+# CONFIG_EP93XX_EARLY_UART2 is not set
+# CONFIG_EP93XX_EARLY_UART3 is not set
+CONFIG_MACH_TS72XX_FORCE_MACHINEID=3Dy
+CONFIG_MACH_TS72XX_SBCINFO=3Dy
+
+#
+# Processor Type
+#
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
+# CONFIG_OABI_COMPAT is not set
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
+CONFIG_SPLIT_PTLOCK_CPUS=3D999999
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=3D0
+CONFIG_VIRT_TO_BUS=3Dy
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
+CONFIG_CMDLINE=3D"console=3DttyAM0,115200 ip=3D192.168.1.3:192.168.1.2:1=
92.168.1.2:255.255.255.0 root=3D/dev/nfs nfsroot=3D192.168.1.2:/media/dat=
a/devel/oe/ts72xx-stable/tmp/deploy/glibc/images/ts72xx/nfsroot debug "
+# CONFIG_XIP_KERNEL is not set
+CONFIG_KEXEC=3Dy
+CONFIG_ATAGS_PROC=3Dy
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
+CONFIG_NF_CONNTRACK_ZONES=3Dy
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
+CONFIG_NETFILTER_XT_TARGET_CT=3Dm
+CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
+CONFIG_NETFILTER_XT_TARGET_HL=3Dm
+CONFIG_NETFILTER_XT_TARGET_LED=3Dm
+CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
+CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
+CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dm
+CONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm
+CONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm
+CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
+CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
+CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
+CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=3Dm
+CONFIG_NETFILTER_XT_MATCH_CLUSTER=3Dm
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
+CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dm
+CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm
+CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
+CONFIG_NETFILTER_XT_MATCH_MAC=3Dm
+CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
+CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
+CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
+CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
+CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm
+CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
+CONFIG_NETFILTER_XT_MATCH_RATEEST=3Dm
+CONFIG_NETFILTER_XT_MATCH_REALM=3Dm
+CONFIG_NETFILTER_XT_MATCH_RECENT=3Dm
+# CONFIG_NETFILTER_XT_MATCH_RECENT_PROC_COMPAT is not set
+CONFIG_NETFILTER_XT_MATCH_SCTP=3Dm
+CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
+CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dm
+CONFIG_NETFILTER_XT_MATCH_STRING=3Dm
+CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
+CONFIG_NETFILTER_XT_MATCH_TIME=3Dm
+CONFIG_NETFILTER_XT_MATCH_U32=3Dm
+CONFIG_NETFILTER_XT_MATCH_OSF=3Dm
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
+# CONFIG_IP_VS_PROTO_SCTP is not set
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
+CONFIG_WIRELESS_EXT=3Dy
+CONFIG_WEXT_CORE=3Dy
+CONFIG_WEXT_PROC=3Dy
+CONFIG_WEXT_PRIV=3Dy
+CONFIG_CFG80211=3Dm
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+CONFIG_CFG80211_DEFAULT_PS=3Dy
+# CONFIG_CFG80211_INTERNAL_REGDB is not set
+CONFIG_CFG80211_WEXT=3Dy
+CONFIG_WIRELESS_EXT_SYSFS=3Dy
+CONFIG_LIB80211=3Dm
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=3Dm
+CONFIG_MAC80211_HAS_RC=3Dy
+CONFIG_MAC80211_RC_PID=3Dy
+# CONFIG_MAC80211_RC_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT_PID=3Dy
+# CONFIG_MAC80211_RC_DEFAULT_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT=3D"pid"
+# CONFIG_MAC80211_MESH is not set
+CONFIG_MAC80211_LEDS=3Dy
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
+CONFIG_UEVENT_HELPER_PATH=3D""
+CONFIG_DEVTMPFS=3Dy
+CONFIG_DEVTMPFS_MOUNT=3Dy
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
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=3Dy
+CONFIG_MTD_REDBOOT_PARTS=3Dy
+CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
+# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
+# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
+CONFIG_MTD_CMDLINE_PARTS=3Dy
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=3Dy
+CONFIG_MTD_BLKDEVS=3Dy
+# CONFIG_MTD_BLOCK is not set
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
+# CONFIG_MTD_NAND_TS7250 is not set
+CONFIG_MTD_NAND_IDS=3Dy
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+CONFIG_MTD_NAND_PLATFORM=3Dy
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
+CONFIG_MTD_UBI=3Dy
+CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
+CONFIG_MTD_UBI_BEB_RESERVE=3D1
+# CONFIG_MTD_UBI_GLUEBI is not set
+
+#
+# UBI debugging options
+#
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dm
+CONFIG_BLK_DEV_CRYPTOLOOP=3Dm
+# CONFIG_BLK_DEV_DRBD is not set
+CONFIG_BLK_DEV_NBD=3Dm
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=3Dm
+CONFIG_BLK_DEV_RAM_COUNT=3D16
+CONFIG_BLK_DEV_RAM_SIZE=3D65536
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+CONFIG_BLK_DEV_TS72XX_SDCARD=3Dm
+CONFIG_MISC_DEVICES=3Dy
+# CONFIG_ENCLOSURE_SERVICES is not set
+CONFIG_EP93XX_PWM=3Dm
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+CONFIG_EEPROM_93CX6=3Dy
+CONFIG_TS72XX_MAX197=3Dm
+CONFIG_TS72XX_MAX197_AVERAGE=3Dy
+CONFIG_HAVE_IDE=3Dy
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=3Dy
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=3Dy
+CONFIG_SCSI_DMA=3Dy
+CONFIG_SCSI_TGT=3Dm
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=3Dy
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=3Dm
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+CONFIG_BLK_DEV_SR=3Dm
+# CONFIG_BLK_DEV_SR_VENDOR is not set
+CONFIG_CHR_DEV_SG=3Dm
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
+# CONFIG_SCSI_SAS_ATTRS is not set
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
+# CONFIG_MICREL_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+CONFIG_EP93XX_ETH=3Dy
+CONFIG_AX88796=3Dm
+CONFIG_AX88796_93CX6=3Dy
+CONFIG_AX88796_TS_ETH100=3Dm
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
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
+# CONFIG_KS8851_MLL is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+CONFIG_WLAN=3Dy
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_AT76C50X_USB is not set
+CONFIG_USB_ZD1201=3Dm
+# CONFIG_USB_NET_RNDIS_WLAN is not set
+# CONFIG_RTL8187 is not set
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_ATH_COMMON is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+# CONFIG_HOSTAP is not set
+# CONFIG_LIBERTAS is not set
+# CONFIG_P54_COMMON is not set
+# CONFIG_RT2X00 is not set
+# CONFIG_WL12XX is not set
+CONFIG_ZD1211RW=3Dm
+# CONFIG_ZD1211RW_DEBUG is not set
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
+# CONFIG_USB_IPHETH is not set
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
+# CONFIG_INPUT_SPARSEKMAP is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=3Dm
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
+CONFIG_KEYBOARD_ATKBD=3Dy
+# CONFIG_KEYBOARD_LKKBD is not set
+CONFIG_KEYBOARD_EP93XX=3Dm
+CONFIG_KEYBOARD_GPIO=3Dm
+CONFIG_KEYBOARD_MATRIX=3Dm
+CONFIG_TS72XX_DIO_3X4_KEYPAD=3Dm
+CONFIG_TS72XX_DIO_4X4_KEYPAD=3Dm
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
+# CONFIG_SERIO_ALTERA_PS2 is not set
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
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+# CONFIG_SERIAL_TIMBERDALE is not set
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=3Dm
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_I2C is not set
+# CONFIG_SPI is not set
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
+# CONFIG_GPIO_IT8761E is not set
+# CONFIG_GPIO_PL061 is not set
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
+# CONFIG_MAX63XX_WATCHDOG is not set
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
+# CONFIG_SOUND is not set
+# CONFIG_HID_SUPPORT is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+CONFIG_USB_ARCH_HAS_OHCI=3Dy
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+CONFIG_USB=3Dy
+# CONFIG_USB_DEBUG is not set
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
+
+#
+# Miscellaneous USB options
+#
+# CONFIG_USB_DEVICEFS is not set
+CONFIG_USB_DEVICE_CLASS=3Dy
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+CONFIG_USB_MON=3Dm
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
+CONFIG_USB_ACM=3Dm
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
+CONFIG_USB_STORAGE=3Dm
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
+CONFIG_USB_SERIAL=3Dm
+# CONFIG_USB_EZUSB is not set
+CONFIG_USB_SERIAL_GENERIC=3Dy
+# CONFIG_USB_SERIAL_AIRCABLE is not set
+# CONFIG_USB_SERIAL_ARK3116 is not set
+# CONFIG_USB_SERIAL_BELKIN is not set
+# CONFIG_USB_SERIAL_CH341 is not set
+# CONFIG_USB_SERIAL_WHITEHEAT is not set
+# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
+# CONFIG_USB_SERIAL_CP210X is not set
+# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
+# CONFIG_USB_SERIAL_EMPEG is not set
+CONFIG_USB_SERIAL_FTDI_SIO=3Dm
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
+CONFIG_USB_SERIAL_PL2303=3Dm
+# CONFIG_USB_SERIAL_OTI6858 is not set
+# CONFIG_USB_SERIAL_QCAUX is not set
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
+# CONFIG_USB_SERIAL_VIVOPAY_SERIAL is not set
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
+# CONFIG_USB_GADGET is not set
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_USB_ULPI is not set
+# CONFIG_NOP_USB_XCEIV is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+CONFIG_LEDS_GPIO=3Dy
+CONFIG_LEDS_GPIO_PLATFORM=3Dy
+# CONFIG_LEDS_LT3593 is not set
+CONFIG_LEDS_TRIGGERS=3Dy
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
+CONFIG_LEDS_TRIGGER_GPIO=3Dy
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
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
+# SPI RTC drivers
+#
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
+# CONFIG_RTC_DRV_MSM6242 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_RP5C01 is not set
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
+# CONFIG_EXT2_FS is not set
+# CONFIG_EXT3_FS is not set
+CONFIG_EXT4_FS=3Dy
+CONFIG_EXT4_USE_FOR_EXT23=3Dy
+# CONFIG_EXT4_FS_XATTR is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD2=3Dy
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
+CONFIG_MISC_FILESYSTEMS=3Dy
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+# CONFIG_JFFS2_FS is not set
+CONFIG_UBIFS_FS=3Dy
+# CONFIG_UBIFS_FS_XATTR is not set
+# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
+CONFIG_UBIFS_FS_LZO=3Dy
+CONFIG_UBIFS_FS_ZLIB=3Dy
+# CONFIG_UBIFS_FS_DEBUG is not set
+# CONFIG_LOGFS is not set
+# CONFIG_CRAMFS is not set
+# CONFIG_SQUASHFS is not set
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
+# CONFIG_CEPH_FS is not set
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
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+CONFIG_DEBUG_BUGVERBOSE=3Dy
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
+CONFIG_HAVE_FUNCTION_TRACER=3Dy
+CONFIG_TRACING_SUPPORT=3Dy
+# CONFIG_FTRACE is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=3Dy
+CONFIG_ARM_UNWIND=3Dy
+# CONFIG_DEBUG_USER is not set
+# CONFIG_OC_ETM is not set
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
+# CONFIG_SECURITY_TOMOYO is not set
+# CONFIG_DEFAULT_SECURITY_SELINUX is not set
+# CONFIG_DEFAULT_SECURITY_SMACK is not set
+# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
+CONFIG_DEFAULT_SECURITY_DAC=3Dy
+CONFIG_DEFAULT_SECURITY=3D""
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
+CONFIG_CRYPTO_DEFLATE=3Dy
+# CONFIG_CRYPTO_ZLIB is not set
+CONFIG_CRYPTO_LZO=3Dy
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
+CONFIG_BITREVERSE=3Dy
+CONFIG_GENERIC_FIND_LAST_BIT=3Dy
+CONFIG_CRC_CCITT=3Dm
+CONFIG_CRC16=3Dy
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=3Dm
+CONFIG_CRC32=3Dy
+CONFIG_CRC7=3Dm
+CONFIG_LIBCRC32C=3Dm
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_LZO_COMPRESS=3Dy
+CONFIG_LZO_DECOMPRESS=3Dy
+CONFIG_TEXTSEARCH=3Dy
+CONFIG_TEXTSEARCH_KMP=3Dm
+CONFIG_TEXTSEARCH_BM=3Dm
+CONFIG_TEXTSEARCH_FSM=3Dm
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
+CONFIG_NLATTR=3Dy
+CONFIG_GENERIC_ATOMIC64=3Dy
diff --git a/recipes/linux/linux_2.6.34.bb b/recipes/linux/linux_2.6.34.b=
b
index 469f23b..61f23cf 100644
--- a/recipes/linux/linux_2.6.34.bb
+++ b/recipes/linux/linux_2.6.34.bb
@@ -1,6 +1,6 @@
 require linux.inc
=20
-PR =3D "r2"
+PR =3D "r3"
=20
 module_autoload_ohci-hcd_omap5912osk =3D "ohci-hcd"
=20
@@ -15,6 +15,7 @@ DEFAULT_PREFERENCE_qemux86 =3D "1"
 DEFAULT_PREFERENCE_lite5200 =3D "1"
 DEFAULT_PREFERENCE_omap5912osk =3D "1"
 DEFAULT_PREFERENCE_tqm8540 =3D "1"
+DEFAULT_PREFERENCE_ts72xx =3D "1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=
=3Dkernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.7.bz2;a=
pply=3Dyes;name=3Dstablepatch \
@@ -23,6 +24,27 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6=
/${P}.tar.bz2;name=3Dkernel \
=20
 SRC_URI_append_c7x0 =3D " file://fix-corgi-card-detection.patch;status=3D=
pending "
=20
+SRC_URI_append_ts72xx =3D " \
+           file://0001-ts72xx_base.patch \
+           file://0002-ts72xx_force_machine-id.patch \
+           file://0003-ep93xx_cpuinfo.patch \
+           file://0004-ep93xx_eth.patch \
+           file://0005-ep93xx-m2m-DMA-support.patch \
+           file://0006-ts72xx_rs485.patch \
+           file://0007-ts72xx_ts_ser1.patch \
+           file://0008-ts72xx_ts_eth100.patch \
+           file://0009-ts72xx_pata.patch \
+           file://0010-ts72xx_gpio_i2c.patch \
+           file://0011-ts72xx_dio_keypad.patch \
+           file://0012-ts72xx_sbcinfo.patch \
+           file://0013-ts72xx_max197.patch \
+           file://0014-ts7200_nor_flash.patch \
+           file://0015-ts72xx_sdcard.patch \
+           file://0016-ts72xx_nand_flash.patch \
+           file://0017-ep93xx_spi.patch \
+           file://0018-ts72xx_spi_tmp124.patch \
+           "
+
 SRC_URI[kernel.md5sum] =3D "10eebcb0178fb4540e2165bfd7efc7ad"
 SRC_URI[kernel.sha256sum] =3D "fa395fec7de633df1cb85b6248b8f35af98380ed1=
28a8bc465fb48bc4d252633"
 SRC_URI[stablepatch.md5sum] =3D "a88e4b5a9fcb23c2229301ac4dae1f1a"
--=20
1.7.0.4



