Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NmuWL-0002tC-RN
	for openembedded-devel@openembedded.org; Wed, 03 Mar 2010 20:46:18 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 8C6E21D360DF;
	Wed,  3 Mar 2010 20:43:19 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Mar 2010 20:43:15 +0100
Message-Id: <1267645398-7106-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <20100303194141.GT24852@ibawizard.net>
References: <20100303194141.GT24852@ibawizard.net>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] linux 2.6.24: update ts72xx patchset and stop using it as default kernel
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
X-List-Received-Date: Wed, 03 Mar 2010 19:46:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 .../linux/linux-2.6.24/ts72xx/ep93xx-i2c-bus.diff  |   30 +-
 .../ts72xx/ep93xx-maverick-uniqid.patch            |   14 +-
 .../ts72xx/ts72xx-machine-id-fix.patch             |    8 +-
 .../linux/linux-2.6.24/ts72xx/ts72xx-rs485.patch   |  268 +++-----------=
------
 recipes/linux/linux_2.6.24.bb                      |    1 -
 5 files changed, 63 insertions(+), 258 deletions(-)

diff --git a/recipes/linux/linux-2.6.24/ts72xx/ep93xx-i2c-bus.diff b/reci=
pes/linux/linux-2.6.24/ts72xx/ep93xx-i2c-bus.diff
index d3c6694..c68647f 100644
--- a/recipes/linux/linux-2.6.24/ts72xx/ep93xx-i2c-bus.diff
+++ b/recipes/linux/linux-2.6.24/ts72xx/ep93xx-i2c-bus.diff
@@ -3,13 +3,13 @@ I2C bus driver using ep93xx GPIOs.
=20
 Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
=20
-Index: linux-2.6.22/drivers/i2c/busses/Kconfig
+Index: linux-2.6.24/drivers/i2c/busses/Kconfig
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linux-2.6.22.orig/drivers/i2c/busses/Kconfig	2007-08-30 00:42:45.000=
000000 +0200
-+++ linux-2.6.22/drivers/i2c/busses/Kconfig	2007-08-30 00:42:52.00000000=
0 +0200
-@@ -635,4 +635,16 @@
- 	  This driver can also be built as a module.  If so, the module
- 	  will be called i2c-pnx.
+--- linux-2.6.24.orig/drivers/i2c/busses/Kconfig	2010-02-07 14:53:59.000=
000000 +0100
++++ linux-2.6.24/drivers/i2c/busses/Kconfig	2010-02-07 14:54:23.00000000=
0 +0100
+@@ -675,4 +675,16 @@
+ 	  This driver can also be built as module. If so, the module
+ 	  will be called i2c-pmcmsp.
 =20
 +config I2C_EP93XX
 +	tristate "Cirrus Logic EP93XX GPIO-based I2C interface"
@@ -24,11 +24,11 @@ Index: linux-2.6.22/drivers/i2c/busses/Kconfig
 +
 +
  endmenu
-Index: linux-2.6.22/drivers/i2c/busses/Makefile
+Index: linux-2.6.24/drivers/i2c/busses/Makefile
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linux-2.6.22.orig/drivers/i2c/busses/Makefile	2007-08-30 00:42:45.00=
0000000 +0200
-+++ linux-2.6.22/drivers/i2c/busses/Makefile	2007-08-30 00:42:52.0000000=
00 +0200
-@@ -52,6 +52,7 @@
+--- linux-2.6.24.orig/drivers/i2c/busses/Makefile	2010-02-07 14:53:59.00=
0000000 +0100
++++ linux-2.6.24/drivers/i2c/busses/Makefile	2010-02-07 14:54:23.0000000=
00 +0100
+@@ -53,6 +53,7 @@
  obj-$(CONFIG_I2C_VOODOO3)	+=3D i2c-voodoo3.o
  obj-$(CONFIG_SCx200_ACB)	+=3D scx200_acb.o
  obj-$(CONFIG_SCx200_I2C)	+=3D scx200_i2c.o
@@ -36,10 +36,10 @@ Index: linux-2.6.22/drivers/i2c/busses/Makefile
 =20
  ifeq ($(CONFIG_I2C_DEBUG_BUS),y)
  EXTRA_CFLAGS +=3D -DDEBUG
-Index: linux-2.6.22/drivers/i2c/busses/i2c-ep93xx.c
+Index: linux-2.6.24/drivers/i2c/busses/i2c-ep93xx.c
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ linux-2.6.22/drivers/i2c/busses/i2c-ep93xx.c	2007-08-30 00:42:52.000=
000000 +0200
++++ linux-2.6.24/drivers/i2c/busses/i2c-ep93xx.c	2010-02-07 14:54:23.000=
000000 +0100
 @@ -0,0 +1,159 @@
 +/*
 + * EP93XX I2C bus driver.
@@ -200,10 +200,10 @@ Index: linux-2.6.22/drivers/i2c/busses/i2c-ep93xx.c
 +MODULE_AUTHOR("Lennert Buytenhek <buytenh@wantstofly.org>");
 +MODULE_DESCRIPTION("GPIO-based I2C adapter for EP93XX systems");
 +MODULE_LICENSE("GPL");
-Index: linux-2.6.22/include/asm-arm/arch-ep93xx/platform.h
+Index: linux-2.6.24/include/asm-arm/arch-ep93xx/platform.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linux-2.6.22.orig/include/asm-arm/arch-ep93xx/platform.h	2007-08-30 =
00:42:45.000000000 +0200
-+++ linux-2.6.22/include/asm-arm/arch-ep93xx/platform.h	2007-08-30 00:42=
:52.000000000 +0200
+--- linux-2.6.24.orig/include/asm-arm/arch-ep93xx/platform.h	2010-02-07 =
14:53:59.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-ep93xx/platform.h	2010-02-07 14:54=
:23.000000000 +0100
 @@ -16,5 +16,13 @@
  	unsigned char	phy_id;
  };
diff --git a/recipes/linux/linux-2.6.24/ts72xx/ep93xx-maverick-uniqid.pat=
ch b/recipes/linux/linux-2.6.24/ts72xx/ep93xx-maverick-uniqid.patch
index fb6c8cf..857a019 100644
--- a/recipes/linux/linux-2.6.24/ts72xx/ep93xx-maverick-uniqid.patch
+++ b/recipes/linux/linux-2.6.24/ts72xx/ep93xx-maverick-uniqid.patch
@@ -3,11 +3,11 @@ Adds support for SoC's unique ID (Maverick Key) in /pro=
c/cpuinfo
=20
 Signed-off-by: Petr Stetiar <ynezz@true.cz>
=20
-Index: linux-2.6.22/arch/arm/kernel/setup.c
+Index: linux-2.6.24/arch/arm/kernel/setup.c
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linux-2.6.22.orig/arch/arm/kernel/setup.c	2007-09-02 23:08:51.000000=
000 +0200
-+++ linux-2.6.22/arch/arm/kernel/setup.c	2007-09-02 23:10:24.000000000 +=
0200
-@@ -959,8 +959,15 @@
+--- linux-2.6.24.orig/arch/arm/kernel/setup.c	2010-02-07 14:53:58.000000=
000 +0100
++++ linux-2.6.24/arch/arm/kernel/setup.c	2010-02-07 14:54:35.000000000 +=
0100
+@@ -1007,8 +1007,15 @@
 =20
  	seq_printf(m, "Hardware\t: %s\n", machine_name);
  	seq_printf(m, "Revision\t: %04x\n", system_rev);
@@ -23,10 +23,10 @@ Index: linux-2.6.22/arch/arm/kernel/setup.c
 =20
  	return 0;
  }
-Index: linux-2.6.22/include/asm-arm/arch-ep93xx/ep93xx-regs.h
+Index: linux-2.6.24/include/asm-arm/arch-ep93xx/ep93xx-regs.h
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linux-2.6.22.orig/include/asm-arm/arch-ep93xx/ep93xx-regs.h	2007-09-=
02 23:06:45.000000000 +0200
-+++ linux-2.6.22/include/asm-arm/arch-ep93xx/ep93xx-regs.h	2007-09-02 23=
:08:34.000000000 +0200
+--- linux-2.6.24.orig/include/asm-arm/arch-ep93xx/ep93xx-regs.h	2010-02-=
07 14:54:29.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-ep93xx/ep93xx-regs.h	2010-02-07 14=
:54:35.000000000 +0100
 @@ -70,6 +70,8 @@
  #define EP93XX_I2S_BASE			(EP93XX_APB_VIRT_BASE + 0x00020000)
 =20
diff --git a/recipes/linux/linux-2.6.24/ts72xx/ts72xx-machine-id-fix.patc=
h b/recipes/linux/linux-2.6.24/ts72xx/ts72xx-machine-id-fix.patch
index 64c3839..0b01e9c 100644
--- a/recipes/linux/linux-2.6.24/ts72xx/ts72xx-machine-id-fix.patch
+++ b/recipes/linux/linux-2.6.24/ts72xx/ts72xx-machine-id-fix.patch
@@ -3,11 +3,11 @@ Fix wrong machine ID passed from RedBoot
=20
 Signed-off-by: Petr Stetiar <ynezz@true.cz>
=20
-Index: linux-2.6.22/arch/arm/kernel/head.S
+Index: linux-2.6.24/arch/arm/kernel/head.S
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linux-2.6.22.orig/arch/arm/kernel/head.S	2007-08-30 00:42:45.0000000=
00 +0200
-+++ linux-2.6.22/arch/arm/kernel/head.S	2007-08-30 00:43:13.000000000 +0=
200
-@@ -82,6 +82,7 @@
+--- linux-2.6.24.orig/arch/arm/kernel/head.S	2010-02-07 14:53:58.0000000=
00 +0100
++++ linux-2.6.24/arch/arm/kernel/head.S	2010-02-07 14:54:39.000000000 +0=
100
+@@ -86,6 +86,7 @@
  	bl	__lookup_processor_type		@ r5=3Dprocinfo r9=3Dcpuid
  	movs	r10, r5				@ invalid processor (r5=3D0)?
  	beq	__error_p			@ yes, error 'p'
diff --git a/recipes/linux/linux-2.6.24/ts72xx/ts72xx-rs485.patch b/recip=
es/linux/linux-2.6.24/ts72xx/ts72xx-rs485.patch
index 17ee397..dbc0ede 100644
--- a/recipes/linux/linux-2.6.24/ts72xx/ts72xx-rs485.patch
+++ b/recipes/linux/linux-2.6.24/ts72xx/ts72xx-rs485.patch
@@ -2,19 +2,19 @@ RS485 auto mode support ported from 2.4 (diff against 2=
.6.19-rc6-git10)
=20
 Signed-off-by: Petr Stetiar <ynezz@true.cz>
=20
-diff --git a/drivers/serial/amba-pl010.c b/drivers/serial/amba-pl010.c
-index 4213fab..5b3c5ff 100644
---- a/drivers/serial/amba-pl010.c
-+++ b/drivers/serial/amba-pl010.c
-@@ -50,6 +50,7 @@
- #include <linux/amba/serial.h>
+Index: linux-2.6.24/drivers/serial/amba-pl010.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- linux-2.6.24.orig/drivers/serial/amba-pl010.c	2008-01-24 23:58:37.00=
0000000 +0100
++++ linux-2.6.24/drivers/serial/amba-pl010.c	2010-02-07 18:17:40.0000000=
00 +0100
+@@ -51,6 +51,7 @@
+ #include <linux/clk.h>
 =20
  #include <asm/io.h>
 +#include <asm/hardware.h>
 =20
  #define UART_NR		8
 =20
-@@ -65,6 +66,11 @@
+@@ -66,6 +67,16 @@
  #define UART_DUMMY_RSR_RX	256
  #define UART_PORT_SIZE		64
 =20
@@ -23,10 +23,15 @@ index 4213fab..5b3c5ff 100644
 +static void __iomem *ts_rs485_control_register;
 +#endif
 +
++#ifdef CONFIG_MACH_TS72XX
++static void __iomem *ts_rs485_data9_register;
++static void __iomem *ts_rs485_control_register;
++#endif
++
  /*
   * We wrap our port structure around the generic uart_port.
   */
-@@ -487,6 +493,107 @@ static int pl010_verify_port(struct uart
+@@ -521,6 +532,107 @@
  	return ret;
  }
 =20
@@ -134,7 +139,7 @@ index 4213fab..5b3c5ff 100644
  static struct uart_ops amba_pl010_pops =3D {
  	.tx_empty	=3D pl010_tx_empty,
  	.set_mctrl	=3D pl010_set_mctrl,
-@@ -504,6 +611,7 @@ static struct uart_ops amba_pl010_pops =3D
+@@ -538,6 +650,7 @@
  	.request_port	=3D pl010_request_port,
  	.config_port	=3D pl010_config_port,
  	.verify_port	=3D pl010_verify_port,
@@ -142,7 +147,7 @@ index 4213fab..5b3c5ff 100644
  };
 =20
  static struct uart_amba_port *amba_ports[UART_NR];
-@@ -746,6 +854,15 @@ static int __init pl010_init(void)
+@@ -796,6 +909,15 @@
  	ret =3D uart_register_driver(&amba_reg);
  	if (ret =3D=3D 0) {
  		ret =3D amba_driver_register(&pl010_driver);
@@ -158,7 +163,7 @@ index 4213fab..5b3c5ff 100644
  		if (ret)
  			uart_unregister_driver(&amba_reg);
  	}
-@@ -756,6 +873,10 @@ static void __exit pl010_exit(void)
+@@ -806,6 +928,10 @@
  {
  	amba_driver_unregister(&pl010_driver);
  	uart_unregister_driver(&amba_reg);
@@ -169,13 +174,13 @@ index 4213fab..5b3c5ff 100644
  }
 =20
  module_init(pl010_init);
-diff --git a/include/asm-arm/arch-ep93xx/ts72xx.h b/include/asm-arm/arch=
-ep93xx/ts72xx.h
-index a94f63f..4c9396b 100644
---- a/include/asm-arm/arch-ep93xx/ts72xx.h
-+++ b/include/asm-arm/arch-ep93xx/ts72xx.h
-@@ -68,6 +68,16 @@
- #define TS72XX_RTC_DATA_PHYS_BASE	0x11700000
- #define TS72XX_RTC_DATA_SIZE		0x00001000
+Index: linux-2.6.24/include/asm-arm/arch-ep93xx/ts72xx.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- linux-2.6.24.orig/include/asm-arm/arch-ep93xx/ts72xx.h	2010-02-07 18=
:03:02.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-ep93xx/ts72xx.h	2010-02-07 18:03:0=
2.000000000 +0100
+@@ -59,6 +59,16 @@
+ #define TS72XX_NAND_BUSY_VIRT_BASE	0xfebfa000
+ #define TS72XX_NAND_BUSY_SIZE		0x00001000
 =20
 +#define TS72XX_RS485_CONTROL_PHYS_BASE	0x22C00000
 +#define TS72XX_RS485_DATA9_PHYS_BASE	0x23000000
@@ -188,211 +193,9 @@ index a94f63f..4c9396b 100644
 +#define TS72XX_RS485_MODE_57600_HD	0x06
 +#define TS72XX_RS485_MODE_115200_HD	0x07
 =20
- #ifndef __ASSEMBLY__
- #include <asm/io.h>
-@@ -87,6 +100,12 @@ static inline int board_is_ts7260(void)
- 	return __raw_readb(TS72XX_MODEL_VIRT_BASE) =3D=3D TS72XX_MODEL_TS7260;
- }
-=20
-+static inline int is_rs485_installed(void)
-+{
-+	return !!(__raw_readb(TS72XX_OPTIONS_VIRT_BASE) &
-+					TS72XX_OPTIONS_COM2_RS485);
-+}
-+
- static inline int is_max197_installed(void)
- {
- 	return !!(__raw_readb(TS72XX_OPTIONS_VIRT_BASE) &
-diff --git a/include/asm-arm/ioctls.h b/include/asm-arm/ioctls.h
-index bb9a7aa..4d7dad1 100644
---- a/include/asm-arm/ioctls.h
-+++ b/include/asm-arm/ioctls.h
-@@ -66,6 +66,9 @@
- #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts =
*/
- #define FIOQSIZE	0x545E
-=20
-+#define TIOC_SBCC485	0x545F /* TS72xx RTS/485 mode clear */
-+#define TIOC_SBCS485	0x5460 /* TS72xx RTS/485 mode set */
-+
- /* Used for packet mode */
- #define TIOCPKT_DATA		 0
- #define TIOCPKT_FLUSHREAD	 1
-RS485 auto mode support ported from 2.4 (diff against 2.6.19-rc6-git10)
-
-Signed-off-by: Petr Stetiar <ynezz@true.cz>
-
-diff --git a/drivers/serial/amba-pl010.c b/drivers/serial/amba-pl010.c
-index 4213fab..5b3c5ff 100644
---- a/drivers/serial/amba-pl010.c
-+++ b/drivers/serial/amba-pl010.c
-@@ -50,6 +50,7 @@
- #include <linux/amba/serial.h>
-=20
- #include <asm/io.h>
-+#include <asm/hardware.h>
-=20
- #define UART_NR		8
-=20
-@@ -65,6 +66,11 @@
- #define UART_DUMMY_RSR_RX	256
- #define UART_PORT_SIZE		64
-=20
-+#ifdef CONFIG_MACH_TS72XX
-+static void __iomem *ts_rs485_data9_register;
-+static void __iomem *ts_rs485_control_register;
-+#endif
-+
- /*
-  * We wrap our port structure around the generic uart_port.
-  */
-@@ -487,6 +493,107 @@ static int pl010_verify_port(struct uart
- 	return ret;
- }
-=20
-+#ifdef CONFIG_MACH_TS72XX
-+static int ts72xx_rs485_init(void)
-+{
-+	ts_rs485_data9_register =3D ioremap(TS72XX_RS485_DATA9_PHYS_BASE, 4096=
);
-+	if (ts_rs485_data9_register =3D=3D NULL) {
-+		return -1;
-+	}
-+
-+	ts_rs485_control_register =3D ioremap(TS72XX_RS485_CONTROL_PHYS_BASE, =
4096);
-+	if (ts_rs485_control_register =3D=3D NULL) {
-+		iounmap(ts_rs485_data9_register);
-+		return -1;
-+	}
-+
-+	return 0;
-+}
-+
-+static int ts72xx_auto485(struct uart_port *port, unsigned int cmd, uns=
igned long *arg)
-+{
-+	int baud, cflag, mode;
-+	int datalength;
-+
-+	mode =3D (int)*arg;
-+	if (!is_rs485_installed()) {
-+		printk("amba-pl010.c: this board does not support RS485 auto mode\n")=
;
-+		return -EINVAL;
-+	}
-+
-+	if (port->line !=3D 1) {
-+		printk("amba-pl010.c: auto RS485 mode is only supported on second por=
t (/dev/ttyAM1)\n");
-+		return -EINVAL;
-+	}
-+
-+	datalength =3D 8;
-+	cflag =3D port->info->tty->termios->c_cflag ;
-+	if (cflag & PARENB)
-+		datalength++;
-+
-+	if (cflag & CSTOPB)
-+		datalength++;
-+
-+	baud =3D tty_get_baud_rate(port->info->tty);
-+
-+	switch (cmd) {
-+		case TIOC_SBCC485:
-+			if ((mode & TS72XX_RS485_AUTO485FD) || (mode & TS72XX_RS485_AUTO485H=
D)) {
-+				printk("amba-pl010.c: unsetting auto RS485 mode\n");
-+				__raw_writew(TS72XX_RS485_MODE_RS232, ts_rs485_control_register);
-+				__raw_writew(TS72XX_RS485_MODE_RS232, ts_rs485_data9_register);
-+			}
-+			break;
-+		case TIOC_SBCS485:
-+			if (mode & TS72XX_RS485_AUTO485FD) {
-+				printk ("amba-pl010.c: setting FULL duplex auto RS485 mode\n");
-+				__raw_writew(TS72XX_RS485_MODE_FD, ts_rs485_control_register);
-+				if (datalength > 8)
-+					__raw_writew(TS72XX_RS485_MODE_FD, ts_rs485_data9_register);
-+			} else if (mode & TS72XX_RS485_AUTO485HD) {
-+				printk("amba-pl010.c: setting HALF DUPLEX auto RS485 mode\n");
-+				switch (baud) {
-+					case 9600:
-+						__raw_writew(TS72XX_RS485_MODE_9600_HD, ts_rs485_control_register=
);
-+						break;
-+					case 19200:
-+						__raw_writew(TS72XX_RS485_MODE_19200_HD, ts_rs485_control_registe=
r);
-+						break;
-+					case 57600:
-+						__raw_writew(TS72XX_RS485_MODE_57600_HD, ts_rs485_control_registe=
r);
-+						break;
-+					case 115200:
-+						__raw_writew(TS72XX_RS485_MODE_115200_HD, ts_rs485_control_regist=
er);
-+						break;
-+					default:
-+					printk("amba-pl010.c: %d baud rate is not supported for auto RS485=
 mode\n", baud);
-+					return -1;
-+				}
-+				if (datalength > 8)
-+					__raw_writew(TS72XX_RS485_MODE_FD, ts_rs485_data9_register);
-+			}
-+			break;
-+	}
-+
-+	return 0;
-+}
-+#endif
-+
-+int pl010_ioctl(struct uart_port *port, unsigned int cmd, unsigned long=
 arg)
-+{
-+#ifdef CONFIG_MACH_TS72XX
-+	switch (cmd) {
-+		case TIOC_SBCC485:
-+		case TIOC_SBCS485:
-+			return ts72xx_auto485(port, cmd, (unsigned long *)arg);
-+			break;
-+		default:
-+			return -ENOIOCTLCMD;
-+	}
-+#endif
-+	return -ENOIOCTLCMD;
-+}
-+
- static struct uart_ops amba_pl010_pops =3D {
- 	.tx_empty	=3D pl010_tx_empty,
- 	.set_mctrl	=3D pl010_set_mctrl,
-@@ -504,6 +611,7 @@ static struct uart_ops amba_pl010_pops =3D
- 	.request_port	=3D pl010_request_port,
- 	.config_port	=3D pl010_config_port,
- 	.verify_port	=3D pl010_verify_port,
-+	.ioctl		=3D pl010_ioctl,
- };
-=20
- static struct uart_amba_port *amba_ports[UART_NR];
-@@ -746,6 +854,15 @@ static int __init pl010_init(void)
- 	ret =3D uart_register_driver(&amba_reg);
- 	if (ret =3D=3D 0) {
- 		ret =3D amba_driver_register(&pl010_driver);
-+#ifdef CONFIG_MACH_TS72XX
-+		if (!ret && is_rs485_installed()) {
-+			ret =3D ts72xx_rs485_init();
-+			if (ret)
-+				printk("amba-pl010.c: ts72xx_rs485_init() failed\n");
-+			else
-+				printk("amba-pl010.c: auto RS485 mode initialized\n");
-+		}
-+#endif
- 		if (ret)
- 			uart_unregister_driver(&amba_reg);
- 	}
-@@ -756,6 +873,10 @@ static void __exit pl010_exit(void)
- {
- 	amba_driver_unregister(&pl010_driver);
- 	uart_unregister_driver(&amba_reg);
-+#ifdef CONFIG_MACH_TS72XX
-+	iounmap(ts_rs485_data9_register);
-+	iounmap(ts_rs485_control_register);
-+#endif
- }
-=20
- module_init(pl010_init);
-diff --git a/include/asm-arm/arch-ep93xx/ts72xx.h b/include/asm-arm/arch=
-ep93xx/ts72xx.h
-index a94f63f..4c9396b 100644
---- a/include/asm-arm/arch-ep93xx/ts72xx.h
-+++ b/include/asm-arm/arch-ep93xx/ts72xx.h
-@@ -68,6 +68,16 @@
+ #define TS72XX_RTC_INDEX_VIRT_BASE	0xfebf9000
+ #define TS72XX_RTC_INDEX_PHYS_BASE	0x10800000
+@@ -68,6 +78,16 @@
  #define TS72XX_RTC_DATA_PHYS_BASE	0x11700000
  #define TS72XX_RTC_DATA_SIZE		0x00001000
 =20
@@ -407,9 +210,9 @@ index a94f63f..4c9396b 100644
 +#define TS72XX_RS485_MODE_57600_HD	0x06
 +#define TS72XX_RS485_MODE_115200_HD	0x07
 =20
- #ifndef __ASSEMBLY__
- #include <asm/io.h>
-@@ -87,6 +100,12 @@ static inline int board_is_ts7260(void)
+ #define TS72XX_WATCHDOG_CONTROL_PHYS_BASE	0x23800000
+ #define TS72XX_WATCHDOG_FEED_PHYS_BASE		0x23c00000
+@@ -90,6 +110,12 @@
  	return __raw_readb(TS72XX_MODEL_VIRT_BASE) =3D=3D TS72XX_MODEL_TS7260;
  }
 =20
@@ -422,17 +225,20 @@ index a94f63f..4c9396b 100644
  static inline int is_max197_installed(void)
  {
  	return !!(__raw_readb(TS72XX_OPTIONS_VIRT_BASE) &
-diff --git a/include/asm-arm/ioctls.h b/include/asm-arm/ioctls.h
-index bb9a7aa..4d7dad1 100644
---- a/include/asm-arm/ioctls.h
-+++ b/include/asm-arm/ioctls.h
-@@ -66,6 +66,9 @@
+Index: linux-2.6.24/include/asm-arm/ioctls.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- linux-2.6.24.orig/include/asm-arm/ioctls.h	2008-01-24 23:58:37.00000=
0000 +0100
++++ linux-2.6.24/include/asm-arm/ioctls.h	2010-02-07 18:03:02.000000000 =
+0100
+@@ -70,6 +70,12 @@
  #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts =
*/
  #define FIOQSIZE	0x545E
 =20
 +#define TIOC_SBCC485	0x545F /* TS72xx RTS/485 mode clear */
 +#define TIOC_SBCS485	0x5460 /* TS72xx RTS/485 mode set */
 +
++#define TIOC_SBCC485	0x545F /* TS72xx RTS/485 mode clear */
++#define TIOC_SBCS485	0x5460 /* TS72xx RTS/485 mode set */
++
  /* Used for packet mode */
  #define TIOCPKT_DATA		 0
  #define TIOCPKT_FLUSHREAD	 1
diff --git a/recipes/linux/linux_2.6.24.bb b/recipes/linux/linux_2.6.24.b=
b
index 31a8a04..8d53999 100644
--- a/recipes/linux/linux_2.6.24.bb
+++ b/recipes/linux/linux_2.6.24.bb
@@ -7,7 +7,6 @@ DEFAULT_PREFERENCE_mpc8313e-rdb =3D "1"
 DEFAULT_PREFERENCE_simpad =3D "1"
 DEFAULT_PREFERENCE_atngw100 =3D "1"
 DEFAULT_PREFERENCE_at32stk1000 =3D "1"
-DEFAULT_PREFERENCE_ts72xx =3D "1"
 DEFAULT_PREFERENCE_hipox =3D "1"
 DEFAULT_PREFERENCE_cs-e9302 =3D "1"
 DEFAULT_PREFERENCE_smartq5 =3D "1"
--=20
1.6.3.3



