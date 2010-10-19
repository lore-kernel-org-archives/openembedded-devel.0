Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P8KHo-0007fv-Jl
	for openembedded-devel@openembedded.org; Wed, 20 Oct 2010 00:05:02 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 851F91D36172;
	Wed, 20 Oct 2010 00:03:18 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Oct 2010 00:03:22 +0200
Message-Id: <1287525802-13312-3-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287525802-13312-1-git-send-email-ynezz@true.cz>
References: <1287525802-13312-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL, BAYES_00, UPPERCASE_50_75
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] linux-2.6.34: ts72xx - update the kernel patchset and defconfig
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
X-List-Received-Date: Tue, 19 Oct 2010 22:05:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- update the SD card patch so it works on ts7400 board also
- update CMDLINE and use UBIFS as rootfs by default
- add patch with fix for the ts72xx watchdog driver
- build what's possible as modules

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 .../linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch   |   64 +-
 ...hdog-ts72xx_wdt-disable-watchdog-at-probe.patch |   36 +
 recipes/linux/linux-2.6.34/ts72xx/defconfig        |  701 ++++++++++++++=
+-----
 recipes/linux/linux_2.6.34.bb                      |    3 +-
 4 files changed, 599 insertions(+), 205 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0019-watchdog-ts72x=
x_wdt-disable-watchdog-at-probe.patch

diff --git a/recipes/linux/linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch b=
/recipes/linux/linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch
index 47eaa7a..2b0fd19 100644
--- a/recipes/linux/linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch
+++ b/recipes/linux/linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch
@@ -19,11 +19,11 @@ http://tech.groups.yahoo.com/group/ts-7000/message/16=
028
  create mode 100644 drivers/block/sdcore2.h
  create mode 100644 drivers/block/tssdcard.c
=20
-diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx=
.c
-index ba27d9d..7fd8f80 100644
---- a/arch/arm/mach-ep93xx/ts72xx.c
-+++ b/arch/arm/mach-ep93xx/ts72xx.c
-@@ -178,6 +178,29 @@ static void __init ts72xx_register_flash(void)
+Index: linux-2.6.34/arch/arm/mach-ep93xx/ts72xx.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- linux-2.6.34.orig/arch/arm/mach-ep93xx/ts72xx.c	2010-10-13 23:55:37.=
000000000 +0200
++++ linux-2.6.34/arch/arm/mach-ep93xx/ts72xx.c	2010-10-16 11:17:20.00000=
0000 +0200
+@@ -178,6 +178,29 @@
  }
 =20
  /**********************************************************************=
***
@@ -45,7 +45,7 @@ index ba27d9d..7fd8f80 100644
 +
 +static void __init ts72xx_register_sdcard(void)
 +{
-+	if (board_is_ts7260())
++	if (board_is_ts7260() || board_is_ts7400())
 +		platform_device_register(&ts72xx_sdcard);
 +}
 +
@@ -53,7 +53,7 @@ index ba27d9d..7fd8f80 100644
   * RTC
   **********************************************************************=
***/
  static unsigned char ts72xx_rtc_readbyte(unsigned long addr)
-@@ -278,6 +301,7 @@ static void __init ts72xx_init_machine(void)
+@@ -278,6 +301,7 @@
  {
  	ep93xx_init_devices();
  	ts72xx_register_flash();
@@ -61,11 +61,11 @@ index ba27d9d..7fd8f80 100644
  	platform_device_register(&ts72xx_rtc_device);
  	platform_device_register(&ts72xx_wdt_device);
 =20
-diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
-index 77bfce5..fc8fae5 100644
---- a/drivers/block/Kconfig
-+++ b/drivers/block/Kconfig
-@@ -488,4 +488,11 @@ config BLK_DEV_HD
+Index: linux-2.6.34/drivers/block/Kconfig
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- linux-2.6.34.orig/drivers/block/Kconfig	2010-05-16 23:17:36.00000000=
0 +0200
++++ linux-2.6.34/drivers/block/Kconfig	2010-10-13 23:55:37.000000000 +02=
00
+@@ -488,4 +488,11 @@
 =20
  	  If unsure, say N.
 =20
@@ -77,11 +77,11 @@ index 77bfce5..fc8fae5 100644
 +	  TS-7260 SBC.
 +
  endif # BLK_DEV
-diff --git a/drivers/block/Makefile b/drivers/block/Makefile
-index aff5ac9..a4d0579 100644
---- a/drivers/block/Makefile
-+++ b/drivers/block/Makefile
-@@ -34,8 +34,10 @@ obj-$(CONFIG_VIODASD)		+=3D viodasd.o
+Index: linux-2.6.34/drivers/block/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- linux-2.6.34.orig/drivers/block/Makefile	2010-05-16 23:17:36.0000000=
00 +0200
++++ linux-2.6.34/drivers/block/Makefile	2010-10-13 23:55:37.000000000 +0=
200
+@@ -34,8 +34,10 @@
  obj-$(CONFIG_BLK_DEV_SX8)	+=3D sx8.o
  obj-$(CONFIG_BLK_DEV_UB)	+=3D ub.o
  obj-$(CONFIG_BLK_DEV_HD)	+=3D hd.o
@@ -92,11 +92,10 @@ index aff5ac9..a4d0579 100644
 =20
  swim_mod-objs	:=3D swim.o swim_asm.o
 +ts72xx_sdcard-objs	:=3D tssdcard.o sdcore2.o
-diff --git a/drivers/block/sdcore2.c b/drivers/block/sdcore2.c
-new file mode 100644
-index 0000000..6dadee1
---- /dev/null
-+++ b/drivers/block/sdcore2.c
+Index: linux-2.6.34/drivers/block/sdcore2.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.34/drivers/block/sdcore2.c	2010-10-13 23:55:37.000000000 +=
0200
 @@ -0,0 +1,2391 @@
 +/*
 + * Copyright (c) 2006-2009, Technologic Systems
@@ -2489,11 +2488,10 @@ index 0000000..6dadee1
 +	return 0;
 +}
 +#endif
-diff --git a/drivers/block/sdcore2.h b/drivers/block/sdcore2.h
-new file mode 100644
-index 0000000..38d5b96
---- /dev/null
-+++ b/drivers/block/sdcore2.h
+Index: linux-2.6.34/drivers/block/sdcore2.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.34/drivers/block/sdcore2.h	2010-10-13 23:55:37.000000000 +=
0200
 @@ -0,0 +1,372 @@
 +/*
 + * Copyright (c) 2006-2008, Technologic Systems
@@ -2867,11 +2865,10 @@ index 0000000..38d5b96
 +	      unsigned char *);
 +
 +#endif
-diff --git a/drivers/block/tssdcard.c b/drivers/block/tssdcard.c
-new file mode 100644
-index 0000000..c76d9a7
---- /dev/null
-+++ b/drivers/block/tssdcard.c
+Index: linux-2.6.34/drivers/block/tssdcard.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.34/drivers/block/tssdcard.c	2010-10-13 23:55:37.000000000 =
+0200
 @@ -0,0 +1,415 @@
 +/*
 + * TS SD Card device driver
@@ -3288,6 +3285,3 @@ index 0000000..c76d9a7
 +MODULE_LICENSE("GPL");
 +MODULE_ALIAS_BLOCKDEV_MAJOR(SCSI_DISK0_MAJOR);
 +MODULE_ALIAS("tssd");
---=20
-1.7.1
-
diff --git a/recipes/linux/linux-2.6.34/ts72xx/0019-watchdog-ts72xx_wdt-d=
isable-watchdog-at-probe.patch b/recipes/linux/linux-2.6.34/ts72xx/0019-w=
atchdog-ts72xx_wdt-disable-watchdog-at-probe.patch
new file mode 100644
index 0000000..3f70207
--- /dev/null
+++ b/recipes/linux/linux-2.6.34/ts72xx/0019-watchdog-ts72xx_wdt-disable-=
watchdog-at-probe.patch
@@ -0,0 +1,36 @@
+From 0e901bed4e053098f1c8411dcbf21324b7f61775 Mon Sep 17 00:00:00 2001
+From: Mika Westerberg <mika.westerberg@iki.fi>
+Date: Sun, 29 Aug 2010 13:53:14 +0300
+Subject: [PATCH] watchdog: ts72xx_wdt: disable watchdog at probe
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Since it may be already enabled by bootloader or some other utility. Thi=
s patch
+makes sure that the watchdog is disabled before any userspace daemon ope=
ns the
+device. It is also required by the watchdog API.
+
+Signed-off-by: Mika Westerberg <mika.westerberg@iki.fi>
+Signed-off-by: Wim Van Sebroeck <wim@iguana.be>
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ drivers/watchdog/ts72xx_wdt.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/watchdog/ts72xx_wdt.c b/drivers/watchdog/ts72xx_wdt=
.c
+index 458c499..18cdeb4 100644
+--- a/drivers/watchdog/ts72xx_wdt.c
++++ b/drivers/watchdog/ts72xx_wdt.c
+@@ -449,6 +449,9 @@ static __devinit int ts72xx_wdt_probe(struct platfor=
m_device *pdev)
+ 	wdt->pdev =3D pdev;
+ 	mutex_init(&wdt->lock);
+=20
++	/* make sure that the watchdog is disabled */
++	ts72xx_wdt_stop(wdt);
++
+ 	error =3D misc_register(&ts72xx_wdt_miscdev);
+ 	if (error) {
+ 		dev_err(&pdev->dev, "failed to register miscdev\n");
+--=20
+1.7.0.4
+
diff --git a/recipes/linux/linux-2.6.34/ts72xx/defconfig b/recipes/linux/=
linux-2.6.34/ts72xx/defconfig
index e125912..aae5496 100644
--- a/recipes/linux/linux-2.6.34/ts72xx/defconfig
+++ b/recipes/linux/linux-2.6.34/ts72xx/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.34.7
-# Sat Oct  2 10:02:23 2010
+# Mon Oct 18 19:22:11 2010
 #
 CONFIG_ARM=3Dy
 CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
@@ -114,7 +114,7 @@ CONFIG_HAVE_CLK=3Dy
 #
 # GCOV-based kernel profiling
 #
-# CONFIG_SLOW_WORK is not set
+CONFIG_SLOW_WORK=3Dy
 CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
 CONFIG_SLABINFO=3Dy
 CONFIG_RT_MUTEXES=3Dy
@@ -134,7 +134,7 @@ CONFIG_BLK_DEV_BSG=3Dy
 # IO Schedulers
 #
 CONFIG_IOSCHED_NOOP=3Dy
-CONFIG_IOSCHED_DEADLINE=3Dy
+CONFIG_IOSCHED_DEADLINE=3Dm
 CONFIG_IOSCHED_CFQ=3Dy
 # CONFIG_DEFAULT_DEADLINE is not set
 CONFIG_DEFAULT_CFQ=3Dy
@@ -255,7 +255,7 @@ CONFIG_EP93XX_EARLY_UART1=3Dy
 # CONFIG_EP93XX_EARLY_UART2 is not set
 # CONFIG_EP93XX_EARLY_UART3 is not set
 CONFIG_MACH_TS72XX_FORCE_MACHINEID=3Dy
-CONFIG_MACH_TS72XX_SBCINFO=3Dy
+CONFIG_MACH_TS72XX_SBCINFO=3Dm
=20
 #
 # Processor Type
@@ -330,7 +330,7 @@ CONFIG_ALIGNMENT_TRAP=3Dy
 #
 CONFIG_ZBOOT_ROM_TEXT=3D0
 CONFIG_ZBOOT_ROM_BSS=3D0
-CONFIG_CMDLINE=3D"console=3DttyAM0,115200 ip=3D192.168.1.3:192.168.1.2:1=
92.168.1.2:255.255.255.0 root=3D/dev/nfs nfsroot=3D192.168.1.2:/media/dat=
a/devel/oe/ts72xx-stable/tmp/deploy/glibc/images/ts72xx/nfsroot debug "
+CONFIG_CMDLINE=3D"console=3DttyAM0,115200 ubi.mtd=3D1 root=3Dubi0:ts72xx=
-rootfs rootfstype=3Dubifs"
 # CONFIG_XIP_KERNEL is not set
 CONFIG_KEXEC=3Dy
 CONFIG_ATAGS_PROC=3Dy
@@ -374,6 +374,7 @@ CONFIG_XFRM=3Dy
 # CONFIG_XFRM_SUB_POLICY is not set
 # CONFIG_XFRM_MIGRATE is not set
 # CONFIG_XFRM_STATISTICS is not set
+CONFIG_XFRM_IPCOMP=3Dm
 CONFIG_NET_KEY=3Dm
 # CONFIG_NET_KEY_MIGRATE is not set
 CONFIG_INET=3Dy
@@ -389,26 +390,45 @@ CONFIG_IP_PNP=3Dy
 CONFIG_IP_PNP_DHCP=3Dy
 # CONFIG_IP_PNP_BOOTP is not set
 # CONFIG_IP_PNP_RARP is not set
-# CONFIG_NET_IPIP is not set
-# CONFIG_NET_IPGRE is not set
+CONFIG_NET_IPIP=3Dm
+CONFIG_NET_IPGRE=3Dm
 # CONFIG_ARPD is not set
 CONFIG_SYN_COOKIES=3Dy
-# CONFIG_INET_AH is not set
-# CONFIG_INET_ESP is not set
-# CONFIG_INET_IPCOMP is not set
-# CONFIG_INET_XFRM_TUNNEL is not set
-# CONFIG_INET_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
+CONFIG_INET_AH=3Dm
+CONFIG_INET_ESP=3Dm
+CONFIG_INET_IPCOMP=3Dm
+CONFIG_INET_XFRM_TUNNEL=3Dm
+CONFIG_INET_TUNNEL=3Dm
+CONFIG_INET_XFRM_MODE_TRANSPORT=3Dm
+CONFIG_INET_XFRM_MODE_TUNNEL=3Dm
+CONFIG_INET_XFRM_MODE_BEET=3Dm
 # CONFIG_INET_LRO is not set
-CONFIG_INET_DIAG=3Dm
-CONFIG_INET_TCP_DIAG=3Dm
+# CONFIG_INET_DIAG is not set
 # CONFIG_TCP_CONG_ADVANCED is not set
 CONFIG_TCP_CONG_CUBIC=3Dy
 CONFIG_DEFAULT_TCP_CONG=3D"cubic"
-CONFIG_TCP_MD5SIG=3Dy
-# CONFIG_IPV6 is not set
+# CONFIG_TCP_MD5SIG is not set
+CONFIG_IPV6=3Dm
+CONFIG_IPV6_PRIVACY=3Dy
+CONFIG_IPV6_ROUTER_PREF=3Dy
+CONFIG_IPV6_ROUTE_INFO=3Dy
+CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
+CONFIG_INET6_AH=3Dm
+CONFIG_INET6_ESP=3Dm
+CONFIG_INET6_IPCOMP=3Dm
+CONFIG_IPV6_MIP6=3Dm
+CONFIG_INET6_XFRM_TUNNEL=3Dm
+CONFIG_INET6_TUNNEL=3Dm
+CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dm
+CONFIG_INET6_XFRM_MODE_TUNNEL=3Dm
+CONFIG_INET6_XFRM_MODE_BEET=3Dm
+# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
+CONFIG_IPV6_SIT=3Dm
+# CONFIG_IPV6_SIT_6RD is not set
+CONFIG_IPV6_NDISC_NODETYPE=3Dy
+CONFIG_IPV6_TUNNEL=3Dm
+# CONFIG_IPV6_MULTIPLE_TABLES is not set
+# CONFIG_IPV6_MROUTE is not set
 # CONFIG_NETLABEL is not set
 CONFIG_NETWORK_SECMARK=3Dy
 CONFIG_NETFILTER=3Dy
@@ -493,38 +513,7 @@ CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
 CONFIG_NETFILTER_XT_MATCH_TIME=3Dm
 CONFIG_NETFILTER_XT_MATCH_U32=3Dm
 CONFIG_NETFILTER_XT_MATCH_OSF=3Dm
-CONFIG_IP_VS=3Dm
-CONFIG_IP_VS_DEBUG=3Dy
-CONFIG_IP_VS_TAB_BITS=3D12
-
-#
-# IPVS transport protocol load balancing support
-#
-CONFIG_IP_VS_PROTO_TCP=3Dy
-CONFIG_IP_VS_PROTO_UDP=3Dy
-CONFIG_IP_VS_PROTO_AH_ESP=3Dy
-CONFIG_IP_VS_PROTO_ESP=3Dy
-CONFIG_IP_VS_PROTO_AH=3Dy
-# CONFIG_IP_VS_PROTO_SCTP is not set
-
-#
-# IPVS scheduler
-#
-CONFIG_IP_VS_RR=3Dm
-CONFIG_IP_VS_WRR=3Dm
-CONFIG_IP_VS_LC=3Dm
-CONFIG_IP_VS_WLC=3Dm
-CONFIG_IP_VS_LBLC=3Dm
-CONFIG_IP_VS_LBLCR=3Dm
-CONFIG_IP_VS_DH=3Dm
-CONFIG_IP_VS_SH=3Dm
-CONFIG_IP_VS_SED=3Dm
-CONFIG_IP_VS_NQ=3Dm
-
-#
-# IPVS application helper
-#
-CONFIG_IP_VS_FTP=3Dm
+# CONFIG_IP_VS is not set
=20
 #
 # IP: Netfilter Configuration
@@ -564,17 +553,34 @@ CONFIG_IP_NF_TARGET_CLUSTERIP=3Dm
 CONFIG_IP_NF_TARGET_ECN=3Dm
 CONFIG_IP_NF_TARGET_TTL=3Dm
 CONFIG_IP_NF_RAW=3Dm
-# CONFIG_IP_NF_SECURITY is not set
+CONFIG_IP_NF_SECURITY=3Dm
 CONFIG_IP_NF_ARPTABLES=3Dm
 CONFIG_IP_NF_ARPFILTER=3Dm
 CONFIG_IP_NF_ARP_MANGLE=3Dm
+
+#
+# IPv6: Netfilter Configuration
+#
+CONFIG_NF_CONNTRACK_IPV6=3Dm
+CONFIG_IP6_NF_QUEUE=3Dm
+CONFIG_IP6_NF_IPTABLES=3Dm
+CONFIG_IP6_NF_MATCH_AH=3Dm
+CONFIG_IP6_NF_MATCH_EUI64=3Dm
+CONFIG_IP6_NF_MATCH_FRAG=3Dm
+CONFIG_IP6_NF_MATCH_OPTS=3Dm
+CONFIG_IP6_NF_MATCH_HL=3Dm
+CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
+CONFIG_IP6_NF_MATCH_MH=3Dm
+CONFIG_IP6_NF_MATCH_RT=3Dm
+CONFIG_IP6_NF_TARGET_HL=3Dm
+CONFIG_IP6_NF_TARGET_LOG=3Dm
+CONFIG_IP6_NF_FILTER=3Dm
+CONFIG_IP6_NF_TARGET_REJECT=3Dm
+CONFIG_IP6_NF_MANGLE=3Dm
+CONFIG_IP6_NF_RAW=3Dm
+CONFIG_IP6_NF_SECURITY=3Dm
 # CONFIG_IP_DCCP is not set
-CONFIG_IP_SCTP=3Dm
-# CONFIG_SCTP_DBG_MSG is not set
-# CONFIG_SCTP_DBG_OBJCNT is not set
-# CONFIG_SCTP_HMAC_NONE is not set
-# CONFIG_SCTP_HMAC_SHA1 is not set
-CONFIG_SCTP_HMAC_MD5=3Dy
+# CONFIG_IP_SCTP is not set
 # CONFIG_RDS is not set
 # CONFIG_TIPC is not set
 # CONFIG_ATM is not set
@@ -598,7 +604,7 @@ CONFIG_NET_CLS_ROUTE=3Dy
 #
 # Network testing
 #
-CONFIG_NET_PKTGEN=3Dm
+# CONFIG_NET_PKTGEN is not set
 # CONFIG_HAMRADIO is not set
 # CONFIG_CAN is not set
 # CONFIG_IRDA is not set
@@ -608,6 +614,7 @@ CONFIG_WIRELESS=3Dy
 CONFIG_WIRELESS_EXT=3Dy
 CONFIG_WEXT_CORE=3Dy
 CONFIG_WEXT_PROC=3Dy
+CONFIG_WEXT_SPY=3Dy
 CONFIG_WEXT_PRIV=3Dy
 CONFIG_CFG80211=3Dm
 # CONFIG_NL80211_TESTMODE is not set
@@ -618,6 +625,9 @@ CONFIG_CFG80211_DEFAULT_PS=3Dy
 CONFIG_CFG80211_WEXT=3Dy
 CONFIG_WIRELESS_EXT_SYSFS=3Dy
 CONFIG_LIB80211=3Dm
+CONFIG_LIB80211_CRYPT_WEP=3Dm
+CONFIG_LIB80211_CRYPT_CCMP=3Dm
+CONFIG_LIB80211_CRYPT_TKIP=3Dm
 # CONFIG_LIB80211_DEBUG is not set
 CONFIG_MAC80211=3Dm
 CONFIG_MAC80211_HAS_RC=3Dy
@@ -668,7 +678,7 @@ CONFIG_MTD_CMDLINE_PARTS=3Dy
 #
 CONFIG_MTD_CHAR=3Dy
 CONFIG_MTD_BLKDEVS=3Dy
-# CONFIG_MTD_BLOCK is not set
+CONFIG_MTD_BLOCK=3Dy
 # CONFIG_MTD_BLOCK_RO is not set
 # CONFIG_FTL is not set
 # CONFIG_NFTL is not set
@@ -705,6 +715,9 @@ CONFIG_MTD_CFI_I2=3Dy
 #
 # Self-contained MTD device drivers
 #
+# CONFIG_MTD_DATAFLASH is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SST25L is not set
 # CONFIG_MTD_SLRAM is not set
 # CONFIG_MTD_PHRAM is not set
 # CONFIG_MTD_MTDRAM is not set
@@ -749,7 +762,7 @@ CONFIG_MTD_UBI_BEB_RESERVE=3D1
 # CONFIG_PARPORT is not set
 CONFIG_BLK_DEV=3Dy
 # CONFIG_BLK_DEV_COW_COMMON is not set
-CONFIG_BLK_DEV_LOOP=3Dm
+CONFIG_BLK_DEV_LOOP=3Dy
 CONFIG_BLK_DEV_CRYPTOLOOP=3Dm
 # CONFIG_BLK_DEV_DRBD is not set
 CONFIG_BLK_DEV_NBD=3Dm
@@ -761,16 +774,27 @@ CONFIG_BLK_DEV_RAM_SIZE=3D65536
 # CONFIG_CDROM_PKTCDVD is not set
 # CONFIG_ATA_OVER_ETH is not set
 # CONFIG_MG_DISK is not set
-CONFIG_BLK_DEV_TS72XX_SDCARD=3Dm
+CONFIG_BLK_DEV_TS72XX_SDCARD=3Dy
 CONFIG_MISC_DEVICES=3Dy
+# CONFIG_AD525X_DPOT is not set
+# CONFIG_ICS932S401 is not set
 # CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_SENSORS_TSL2550 is not set
 CONFIG_EP93XX_PWM=3Dm
+# CONFIG_DS1682 is not set
+# CONFIG_TI_DAC7512 is not set
 # CONFIG_C2PORT is not set
=20
 #
 # EEPROM support
 #
-CONFIG_EEPROM_93CX6=3Dy
+# CONFIG_EEPROM_AT24 is not set
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_LEGACY is not set
+# CONFIG_EEPROM_MAX6875 is not set
+CONFIG_EEPROM_93CX6=3Dm
+# CONFIG_IWMC3200TOP is not set
 CONFIG_TS72XX_MAX197=3Dm
 CONFIG_TS72XX_MAX197_AVERAGE=3Dy
 CONFIG_HAVE_IDE=3Dy
@@ -779,9 +803,9 @@ CONFIG_HAVE_IDE=3Dy
 #
 # SCSI device support
 #
-CONFIG_SCSI_MOD=3Dy
+CONFIG_SCSI_MOD=3Dm
 # CONFIG_RAID_ATTRS is not set
-CONFIG_SCSI=3Dy
+CONFIG_SCSI=3Dm
 CONFIG_SCSI_DMA=3Dy
 CONFIG_SCSI_TGT=3Dm
 # CONFIG_SCSI_NETLINK is not set
@@ -793,12 +817,11 @@ CONFIG_SCSI_PROC_FS=3Dy
 CONFIG_BLK_DEV_SD=3Dm
 # CONFIG_CHR_DEV_ST is not set
 # CONFIG_CHR_DEV_OSST is not set
-CONFIG_BLK_DEV_SR=3Dm
-# CONFIG_BLK_DEV_SR_VENDOR is not set
+# CONFIG_BLK_DEV_SR is not set
 CONFIG_CHR_DEV_SG=3Dm
 # CONFIG_CHR_DEV_SCH is not set
 # CONFIG_SCSI_MULTI_LUN is not set
-CONFIG_SCSI_CONSTANTS=3Dy
+# CONFIG_SCSI_CONSTANTS is not set
 # CONFIG_SCSI_LOGGING is not set
 # CONFIG_SCSI_SCAN_ASYNC is not set
 CONFIG_SCSI_WAIT_SCAN=3Dm
@@ -815,7 +838,16 @@ CONFIG_SCSI_WAIT_SCAN=3Dm
 # CONFIG_SCSI_LOWLEVEL is not set
 # CONFIG_SCSI_DH is not set
 # CONFIG_SCSI_OSD_INITIATOR is not set
-# CONFIG_ATA is not set
+CONFIG_ATA=3Dm
+# CONFIG_ATA_NONSTANDARD is not set
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+CONFIG_ATA_SFF=3Dy
+# CONFIG_SATA_MV is not set
+# CONFIG_PATA_PLATFORM is not set
+CONFIG_PATA_TS72XX=3Dy
+CONFIG_PATA_TS7200_CF=3Dm
+CONFIG_PATA_TS9600=3Dm
 # CONFIG_MD is not set
 CONFIG_NETDEVICES=3Dy
 # CONFIG_DUMMY is not set
@@ -853,6 +885,7 @@ CONFIG_AX88796_93CX6=3Dy
 CONFIG_AX88796_TS_ETH100=3Dm
 # CONFIG_SMC91X is not set
 # CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
 # CONFIG_ETHOC is not set
 # CONFIG_SMC911X is not set
 # CONFIG_SMSC911X is not set
@@ -866,24 +899,69 @@ CONFIG_AX88796_TS_ETH100=3Dm
 # CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
 # CONFIG_B44 is not set
 # CONFIG_KS8842 is not set
+# CONFIG_KS8851 is not set
 # CONFIG_KS8851_MLL is not set
 # CONFIG_NETDEV_1000 is not set
 # CONFIG_NETDEV_10000 is not set
 CONFIG_WLAN=3Dy
-# CONFIG_LIBERTAS_THINFIRM is not set
-# CONFIG_AT76C50X_USB is not set
+CONFIG_LIBERTAS_THINFIRM=3Dm
+CONFIG_LIBERTAS_THINFIRM_USB=3Dm
+CONFIG_AT76C50X_USB=3Dm
 CONFIG_USB_ZD1201=3Dm
-# CONFIG_USB_NET_RNDIS_WLAN is not set
-# CONFIG_RTL8187 is not set
-# CONFIG_MAC80211_HWSIM is not set
-# CONFIG_ATH_COMMON is not set
-# CONFIG_B43 is not set
-# CONFIG_B43LEGACY is not set
-# CONFIG_HOSTAP is not set
-# CONFIG_LIBERTAS is not set
-# CONFIG_P54_COMMON is not set
-# CONFIG_RT2X00 is not set
-# CONFIG_WL12XX is not set
+CONFIG_USB_NET_RNDIS_WLAN=3Dm
+CONFIG_RTL8187=3Dm
+CONFIG_RTL8187_LEDS=3Dy
+CONFIG_MAC80211_HWSIM=3Dm
+CONFIG_ATH_COMMON=3Dm
+# CONFIG_ATH_DEBUG is not set
+# CONFIG_AR9170_USB is not set
+CONFIG_B43=3Dm
+# CONFIG_B43_SDIO is not set
+CONFIG_B43_PIO=3Dy
+CONFIG_B43_PHY_LP=3Dy
+CONFIG_B43_LEDS=3Dy
+CONFIG_B43_HWRNG=3Dy
+# CONFIG_B43_DEBUG is not set
+CONFIG_B43LEGACY=3Dm
+CONFIG_B43LEGACY_LEDS=3Dy
+CONFIG_B43LEGACY_HWRNG=3Dy
+CONFIG_B43LEGACY_DEBUG=3Dy
+CONFIG_B43LEGACY_DMA=3Dy
+CONFIG_B43LEGACY_PIO=3Dy
+CONFIG_B43LEGACY_DMA_AND_PIO_MODE=3Dy
+# CONFIG_B43LEGACY_DMA_MODE is not set
+# CONFIG_B43LEGACY_PIO_MODE is not set
+CONFIG_HOSTAP=3Dm
+# CONFIG_HOSTAP_FIRMWARE is not set
+# CONFIG_IWM is not set
+CONFIG_LIBERTAS=3Dm
+CONFIG_LIBERTAS_USB=3Dm
+# CONFIG_LIBERTAS_SDIO is not set
+# CONFIG_LIBERTAS_SPI is not set
+# CONFIG_LIBERTAS_DEBUG is not set
+# CONFIG_LIBERTAS_MESH is not set
+CONFIG_P54_COMMON=3Dm
+CONFIG_P54_USB=3Dm
+# CONFIG_P54_SPI is not set
+CONFIG_P54_LEDS=3Dy
+CONFIG_RT2X00=3Dm
+CONFIG_RT2500USB=3Dm
+CONFIG_RT73USB=3Dm
+CONFIG_RT2800USB=3Dm
+# CONFIG_RT2800USB_RT30XX is not set
+# CONFIG_RT2800USB_RT35XX is not set
+# CONFIG_RT2800USB_UNKNOWN is not set
+CONFIG_RT2800_LIB=3Dm
+CONFIG_RT2X00_LIB_USB=3Dm
+CONFIG_RT2X00_LIB=3Dm
+CONFIG_RT2X00_LIB_HT=3Dy
+CONFIG_RT2X00_LIB_FIRMWARE=3Dy
+CONFIG_RT2X00_LIB_CRYPTO=3Dy
+CONFIG_RT2X00_LIB_LEDS=3Dy
+# CONFIG_RT2X00_DEBUG is not set
+CONFIG_WL12XX=3Dm
+# CONFIG_WL1251 is not set
+# CONFIG_WL1271 is not set
 CONFIG_ZD1211RW=3Dm
 # CONFIG_ZD1211RW_DEBUG is not set
=20
@@ -894,15 +972,46 @@ CONFIG_ZD1211RW=3Dm
 #
 # USB Network Adapters
 #
-# CONFIG_USB_CATC is not set
-# CONFIG_USB_KAWETH is not set
-# CONFIG_USB_PEGASUS is not set
-# CONFIG_USB_RTL8150 is not set
-# CONFIG_USB_USBNET is not set
-# CONFIG_USB_IPHETH is not set
+CONFIG_USB_CATC=3Dm
+CONFIG_USB_KAWETH=3Dm
+CONFIG_USB_PEGASUS=3Dm
+CONFIG_USB_RTL8150=3Dm
+CONFIG_USB_USBNET=3Dm
+CONFIG_USB_NET_AX8817X=3Dm
+CONFIG_USB_NET_CDCETHER=3Dm
+CONFIG_USB_NET_CDC_EEM=3Dm
+CONFIG_USB_NET_DM9601=3Dm
+CONFIG_USB_NET_SMSC75XX=3Dm
+CONFIG_USB_NET_SMSC95XX=3Dm
+CONFIG_USB_NET_GL620A=3Dm
+CONFIG_USB_NET_NET1080=3Dm
+CONFIG_USB_NET_PLUSB=3Dm
+CONFIG_USB_NET_MCS7830=3Dm
+CONFIG_USB_NET_RNDIS_HOST=3Dm
+CONFIG_USB_NET_CDC_SUBSET=3Dm
+CONFIG_USB_ALI_M5632=3Dy
+CONFIG_USB_AN2720=3Dy
+CONFIG_USB_BELKIN=3Dy
+CONFIG_USB_ARMLINUX=3Dy
+CONFIG_USB_EPSON2888=3Dy
+CONFIG_USB_KC2190=3Dy
+CONFIG_USB_NET_ZAURUS=3Dm
+CONFIG_USB_NET_INT51X1=3Dm
+CONFIG_USB_IPHETH=3Dm
+CONFIG_USB_SIERRA_NET=3Dm
 # CONFIG_WAN is not set
-# CONFIG_PPP is not set
+CONFIG_PPP=3Dm
+CONFIG_PPP_MULTILINK=3Dy
+CONFIG_PPP_FILTER=3Dy
+CONFIG_PPP_ASYNC=3Dm
+CONFIG_PPP_SYNC_TTY=3Dm
+CONFIG_PPP_DEFLATE=3Dm
+CONFIG_PPP_BSDCOMP=3Dm
+CONFIG_PPP_MPPE=3Dm
+CONFIG_PPPOE=3Dm
+CONFIG_PPPOL2TP=3Dm
 # CONFIG_SLIP is not set
+CONFIG_SLHC=3Dm
 # CONFIG_NETCONSOLE is not set
 # CONFIG_NETPOLL is not set
 # CONFIG_NET_POLL_CONTROLLER is not set
@@ -932,13 +1041,17 @@ CONFIG_INPUT_EVDEV=3Dm
 # Input Device Drivers
 #
 CONFIG_INPUT_KEYBOARD=3Dy
+# CONFIG_KEYBOARD_ADP5588 is not set
 CONFIG_KEYBOARD_ATKBD=3Dy
+# CONFIG_QT2160 is not set
 # CONFIG_KEYBOARD_LKKBD is not set
 CONFIG_KEYBOARD_EP93XX=3Dm
 CONFIG_KEYBOARD_GPIO=3Dm
 CONFIG_KEYBOARD_MATRIX=3Dm
 CONFIG_TS72XX_DIO_3X4_KEYPAD=3Dm
 CONFIG_TS72XX_DIO_4X4_KEYPAD=3Dm
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
 # CONFIG_KEYBOARD_NEWTON is not set
 # CONFIG_KEYBOARD_OPENCORES is not set
 # CONFIG_KEYBOARD_STOWAWAY is not set
@@ -958,6 +1071,7 @@ CONFIG_MOUSE_SERIAL=3Dm
 # CONFIG_MOUSE_BCM5974 is not set
 # CONFIG_MOUSE_VSXXXAA is not set
 # CONFIG_MOUSE_GPIO is not set
+# CONFIG_MOUSE_SYNAPTICS_I2C is not set
 # CONFIG_INPUT_JOYSTICK is not set
 # CONFIG_INPUT_TABLET is not set
 # CONFIG_INPUT_TOUCHSCREEN is not set
@@ -1010,6 +1124,7 @@ CONFIG_SERIAL_AMBA_PL010=3Dy
 CONFIG_SERIAL_AMBA_PL010_CONSOLE=3Dy
 CONFIG_SERIAL_AMBA_PL010_TS72XX=3Dy
 # CONFIG_SERIAL_AMBA_PL011 is not set
+# CONFIG_SERIAL_MAX3100 is not set
 CONFIG_SERIAL_CORE=3Dy
 CONFIG_SERIAL_CORE_CONSOLE=3Dy
 # CONFIG_SERIAL_TIMBERDALE is not set
@@ -1022,8 +1137,60 @@ CONFIG_HW_RANDOM=3Dm
 # CONFIG_R3964 is not set
 # CONFIG_RAW_DRIVER is not set
 # CONFIG_TCG_TPM is not set
-# CONFIG_I2C is not set
-# CONFIG_SPI is not set
+CONFIG_I2C=3Dm
+CONFIG_I2C_BOARDINFO=3Dy
+CONFIG_I2C_COMPAT=3Dy
+# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_HELPER_AUTO=3Dy
+CONFIG_I2C_ALGOBIT=3Dm
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_DESIGNWARE is not set
+CONFIG_I2C_GPIO=3Dm
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
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
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+CONFIG_SPI=3Dy
+CONFIG_SPI_MASTER=3Dy
+
+#
+# SPI Master Controller Drivers
+#
+CONFIG_SPI_BITBANG=3Dm
+# CONFIG_SPI_EP93XX is not set
+CONFIG_SPI_GPIO=3Dm
+# CONFIG_SPI_PL022 is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+CONFIG_SPI_SPIDEV=3Dm
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_SPI_TMP124 is not set
=20
 #
 # PPS support
@@ -1042,6 +1209,11 @@ CONFIG_GPIO_SYSFS=3Dy
 #
 # I2C GPIO expanders:
 #
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_ADP5588 is not set
=20
 #
 # PCI GPIO expanders:
@@ -1050,6 +1222,9 @@ CONFIG_GPIO_SYSFS=3Dy
 #
 # SPI GPIO expanders:
 #
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_GPIO_MC33880 is not set
=20
 #
 # AC97 GPIO expanders:
@@ -1066,7 +1241,7 @@ CONFIG_WATCHDOG=3Dy
 #
 # CONFIG_SOFT_WATCHDOG is not set
 CONFIG_EP93XX_WATCHDOG=3Dm
-CONFIG_TS72XX_WATCHDOG=3Dm
+CONFIG_TS72XX_WATCHDOG=3Dy
 # CONFIG_MAX63XX_WATCHDOG is not set
=20
 #
@@ -1078,7 +1253,12 @@ CONFIG_SSB_POSSIBLE=3Dy
 #
 # Sonics Silicon Backplane
 #
-# CONFIG_SSB is not set
+CONFIG_SSB=3Dm
+CONFIG_SSB_BLOCKIO=3Dy
+CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
+# CONFIG_SSB_SDIOHOST is not set
+# CONFIG_SSB_SILENT is not set
+# CONFIG_SSB_DEBUG is not set
=20
 #
 # Multifunction device drivers
@@ -1088,10 +1268,17 @@ CONFIG_SSB_POSSIBLE=3Dy
 # CONFIG_MFD_ASIC3 is not set
 # CONFIG_HTC_EGPIO is not set
 # CONFIG_HTC_PASIC3 is not set
+# CONFIG_TPS65010 is not set
 # CONFIG_MFD_TMIO is not set
 # CONFIG_MFD_T7L66XB is not set
 # CONFIG_MFD_TC6387XB is not set
 # CONFIG_MFD_TC6393XB is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13783 is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_AB4500_CORE is not set
 # CONFIG_REGULATOR is not set
 # CONFIG_MEDIA_SUPPORT is not set
=20
@@ -1114,12 +1301,62 @@ CONFIG_SSB_POSSIBLE=3Dy
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_DUMMY_CONSOLE=3Dy
 # CONFIG_SOUND is not set
-# CONFIG_HID_SUPPORT is not set
+CONFIG_HID_SUPPORT=3Dy
+CONFIG_HID=3Dy
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=3Dm
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# USB HID Boot Protocol drivers
+#
+# CONFIG_USB_KBD is not set
+# CONFIG_USB_MOUSE is not set
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_3M_PCT is not set
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_DRAGONRISE is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_KYE is not set
+# CONFIG_HID_GYRATION is not set
+# CONFIG_HID_TWINHAN is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MOSART is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_ORTEK is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_QUANTA is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_STANTUM is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_ZEROPLUS is not set
 CONFIG_USB_SUPPORT=3Dy
 CONFIG_USB_ARCH_HAS_HCD=3Dy
 CONFIG_USB_ARCH_HAS_OHCI=3Dy
 # CONFIG_USB_ARCH_HAS_EHCI is not set
-CONFIG_USB=3Dy
+CONFIG_USB=3Dm
 # CONFIG_USB_DEBUG is not set
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
=20
@@ -1143,7 +1380,8 @@ CONFIG_USB_MON=3Dm
 # CONFIG_USB_ISP116X_HCD is not set
 # CONFIG_USB_ISP1760_HCD is not set
 # CONFIG_USB_ISP1362_HCD is not set
-CONFIG_USB_OHCI_HCD=3Dy
+CONFIG_USB_OHCI_HCD=3Dm
+# CONFIG_USB_OHCI_HCD_SSB is not set
 # CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
 # CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
 CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
@@ -1151,6 +1389,7 @@ CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
 # CONFIG_USB_R8A66597_HCD is not set
 # CONFIG_USB_HWA_HCD is not set
 # CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_GADGET_MUSB_HDRC is not set
=20
 #
 # USB Device Class drivers
@@ -1235,7 +1474,7 @@ CONFIG_USB_SERIAL_PL2303=3Dm
 # CONFIG_USB_SERIAL_TI is not set
 # CONFIG_USB_SERIAL_CYBERJACK is not set
 # CONFIG_USB_SERIAL_XIRCOM is not set
-# CONFIG_USB_SERIAL_OPTION is not set
+CONFIG_USB_SERIAL_OPTION=3Dm
 # CONFIG_USB_SERIAL_OMNINET is not set
 # CONFIG_USB_SERIAL_OPTICON is not set
 # CONFIG_USB_SERIAL_VIVOPAY_SERIAL is not set
@@ -1262,7 +1501,48 @@ CONFIG_USB_SERIAL_PL2303=3Dm
 # CONFIG_USB_IOWARRIOR is not set
 # CONFIG_USB_TEST is not set
 # CONFIG_USB_ISIGHTFW is not set
-# CONFIG_USB_GADGET is not set
+CONFIG_USB_GADGET=3Dm
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+CONFIG_USB_GADGET_VBUS_DRAW=3D2
+CONFIG_USB_GADGET_SELECTED=3Dy
+# CONFIG_USB_GADGET_AT91 is not set
+# CONFIG_USB_GADGET_ATMEL_USBA is not set
+# CONFIG_USB_GADGET_FSL_USB2 is not set
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
+CONFIG_USB_GADGET_R8A66597=3Dy
+CONFIG_USB_R8A66597=3Dm
+# CONFIG_USB_GADGET_PXA27X is not set
+# CONFIG_USB_GADGET_S3C_HSOTG is not set
+# CONFIG_USB_GADGET_IMX is not set
+# CONFIG_USB_GADGET_S3C2410 is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_AMD5536UDC is not set
+# CONFIG_USB_GADGET_FSL_QE is not set
+# CONFIG_USB_GADGET_CI13XXX is not set
+# CONFIG_USB_GADGET_NET2280 is not set
+# CONFIG_USB_GADGET_GOKU is not set
+# CONFIG_USB_GADGET_LANGWELL is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=3Dy
+# CONFIG_USB_ZERO is not set
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=3Dm
+CONFIG_USB_ETH_RNDIS=3Dy
+CONFIG_USB_ETH_EEM=3Dy
+CONFIG_USB_GADGETFS=3Dm
+CONFIG_USB_FILE_STORAGE=3Dm
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_MASS_STORAGE=3Dm
+CONFIG_USB_G_SERIAL=3Dm
+# CONFIG_USB_MIDI_GADGET is not set
+CONFIG_USB_G_PRINTER=3Dm
+CONFIG_USB_CDC_COMPOSITE=3Dm
+# CONFIG_USB_G_NOKIA is not set
+CONFIG_USB_G_MULTI=3Dm
+CONFIG_USB_G_MULTI_RNDIS=3Dy
+CONFIG_USB_G_MULTI_CDC=3Dy
=20
 #
 # OTG and related infrastructure
@@ -1270,7 +1550,25 @@ CONFIG_USB_SERIAL_PL2303=3Dm
 # CONFIG_USB_GPIO_VBUS is not set
 # CONFIG_USB_ULPI is not set
 # CONFIG_NOP_USB_XCEIV is not set
-# CONFIG_MMC is not set
+CONFIG_MMC=3Dm
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dm
+CONFIG_MMC_BLOCK_BOUNCE=3Dy
+CONFIG_SDIO_UART=3Dm
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+CONFIG_MMC_ARMMMCI=3Dm
+CONFIG_MMC_SDHCI=3Dm
+# CONFIG_MMC_SDHCI_PLTFM is not set
+# CONFIG_MMC_SPI is not set
 # CONFIG_MEMSTICK is not set
 CONFIG_NEW_LEDS=3Dy
 CONFIG_LEDS_CLASS=3Dy
@@ -1278,8 +1576,13 @@ CONFIG_LEDS_CLASS=3Dy
 #
 # LED drivers
 #
+# CONFIG_LEDS_PCA9532 is not set
 CONFIG_LEDS_GPIO=3Dy
 CONFIG_LEDS_GPIO_PLATFORM=3Dy
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
 # CONFIG_LEDS_LT3593 is not set
 CONFIG_LEDS_TRIGGERS=3Dy
=20
@@ -1297,10 +1600,7 @@ CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
 #
 # CONFIG_ACCESSIBILITY is not set
 CONFIG_RTC_LIB=3Dy
-CONFIG_RTC_CLASS=3Dy
-CONFIG_RTC_HCTOSYS=3Dy
-CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc1"
-# CONFIG_RTC_DEBUG is not set
+CONFIG_RTC_CLASS=3Dm
=20
 #
 # RTC interfaces
@@ -1312,8 +1612,35 @@ CONFIG_RTC_INTF_DEV=3Dy
 # CONFIG_RTC_DRV_TEST is not set
=20
 #
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
+# CONFIG_RTC_DRV_BQ32K is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+
+#
 # SPI RTC drivers
 #
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+# CONFIG_RTC_DRV_PCF2123 is not set
=20
 #
 # Platform RTC drivers
@@ -1324,7 +1651,7 @@ CONFIG_RTC_INTF_DEV=3Dy
 # CONFIG_RTC_DRV_DS1553 is not set
 # CONFIG_RTC_DRV_DS1742 is not set
 # CONFIG_RTC_DRV_STK17TA8 is not set
-CONFIG_RTC_DRV_M48T86=3Dy
+CONFIG_RTC_DRV_M48T86=3Dm
 # CONFIG_RTC_DRV_M48T35 is not set
 # CONFIG_RTC_DRV_M48T59 is not set
 # CONFIG_RTC_DRV_MSM6242 is not set
@@ -1335,12 +1662,14 @@ CONFIG_RTC_DRV_M48T86=3Dy
 #
 # on-CPU RTC drivers
 #
-CONFIG_RTC_DRV_EP93XX=3Dy
+CONFIG_RTC_DRV_EP93XX=3Dm
 # CONFIG_RTC_DRV_PL030 is not set
 # CONFIG_RTC_DRV_PL031 is not set
 # CONFIG_DMADEVICES is not set
 # CONFIG_AUXDISPLAY is not set
-# CONFIG_UIO is not set
+CONFIG_UIO=3Dm
+CONFIG_UIO_PDRV=3Dm
+CONFIG_UIO_PDRV_GENIRQ=3Dm
=20
 #
 # TI VLYNQ
@@ -1350,13 +1679,20 @@ CONFIG_RTC_DRV_EP93XX=3Dy
 #
 # File systems
 #
-# CONFIG_EXT2_FS is not set
-# CONFIG_EXT3_FS is not set
-CONFIG_EXT4_FS=3Dy
-CONFIG_EXT4_USE_FOR_EXT23=3Dy
+CONFIG_EXT2_FS=3Dm
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dm
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=3Dy
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+CONFIG_EXT4_FS=3Dm
 # CONFIG_EXT4_FS_XATTR is not set
 # CONFIG_EXT4_DEBUG is not set
-CONFIG_JBD2=3Dy
+CONFIG_JBD=3Dm
+CONFIG_JBD2=3Dm
+CONFIG_FS_MBCACHE=3Dm
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set
 CONFIG_FS_POSIX_ACL=3Dy
@@ -1367,7 +1703,7 @@ CONFIG_FS_POSIX_ACL=3Dy
 # CONFIG_NILFS2_FS is not set
 CONFIG_FILE_LOCKING=3Dy
 CONFIG_FSNOTIFY=3Dy
-# CONFIG_DNOTIFY is not set
+CONFIG_DNOTIFY=3Dy
 CONFIG_INOTIFY=3Dy
 CONFIG_INOTIFY_USER=3Dy
 # CONFIG_QUOTA is not set
@@ -1375,7 +1711,6 @@ CONFIG_INOTIFY_USER=3Dy
 CONFIG_AUTOFS4_FS=3Dm
 CONFIG_FUSE_FS=3Dm
 # CONFIG_CUSE is not set
-CONFIG_GENERIC_ACL=3Dy
=20
 #
 # Caches
@@ -1395,7 +1730,7 @@ CONFIG_UDF_NLS=3Dy
 # DOS/FAT/NT Filesystems
 #
 CONFIG_FAT_FS=3Dm
-# CONFIG_MSDOS_FS is not set
+CONFIG_MSDOS_FS=3Dm
 CONFIG_VFAT_FS=3Dm
 CONFIG_FAT_DEFAULT_CODEPAGE=3D437
 CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
@@ -1411,7 +1746,7 @@ CONFIG_PROC_SYSCTL=3Dy
 CONFIG_PROC_PAGE_MONITOR=3Dy
 CONFIG_SYSFS=3Dy
 CONFIG_TMPFS=3Dy
-CONFIG_TMPFS_POSIX_ACL=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
 # CONFIG_HUGETLB_PAGE is not set
 CONFIG_CONFIGFS_FS=3Dm
 CONFIG_MISC_FILESYSTEMS=3Dy
@@ -1423,16 +1758,28 @@ CONFIG_MISC_FILESYSTEMS=3Dy
 # CONFIG_BEFS_FS is not set
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
-# CONFIG_JFFS2_FS is not set
+CONFIG_JFFS2_FS=3Dm
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
 CONFIG_UBIFS_FS=3Dy
-# CONFIG_UBIFS_FS_XATTR is not set
-# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
+CONFIG_UBIFS_FS_XATTR=3Dy
+CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
 CONFIG_UBIFS_FS_LZO=3Dy
 CONFIG_UBIFS_FS_ZLIB=3Dy
 # CONFIG_UBIFS_FS_DEBUG is not set
 # CONFIG_LOGFS is not set
 # CONFIG_CRAMFS is not set
-# CONFIG_SQUASHFS is not set
+CONFIG_SQUASHFS=3Dm
+# CONFIG_SQUASHFS_EMBEDDED is not set
+CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
 # CONFIG_VXFS_FS is not set
 # CONFIG_MINIX_FS is not set
 # CONFIG_OMFS_FS is not set
@@ -1447,8 +1794,15 @@ CONFIG_NFS_FS=3Dy
 CONFIG_NFS_V4=3Dy
 # CONFIG_NFS_V4_1 is not set
 CONFIG_ROOT_NFS=3Dy
-# CONFIG_NFSD is not set
+CONFIG_NFSD=3Dm
+CONFIG_NFSD_V2_ACL=3Dy
+CONFIG_NFSD_V3=3Dy
+CONFIG_NFSD_V3_ACL=3Dy
+CONFIG_NFSD_V4=3Dy
 CONFIG_LOCKD=3Dy
+CONFIG_LOCKD_V4=3Dy
+CONFIG_EXPORTFS=3Dm
+CONFIG_NFS_ACL_SUPPORT=3Dm
 CONFIG_NFS_COMMON=3Dy
 CONFIG_SUNRPC=3Dy
 CONFIG_SUNRPC_GSS=3Dy
@@ -1456,7 +1810,14 @@ CONFIG_RPCSEC_GSS_KRB5=3Dy
 # CONFIG_RPCSEC_GSS_SPKM3 is not set
 # CONFIG_SMB_FS is not set
 # CONFIG_CEPH_FS is not set
-# CONFIG_CIFS is not set
+CONFIG_CIFS=3Dm
+# CONFIG_CIFS_STATS is not set
+# CONFIG_CIFS_WEAK_PW_HASH is not set
+CONFIG_CIFS_UPCALL=3Dy
+# CONFIG_CIFS_XATTR is not set
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_DFS_UPCALL is not set
+# CONFIG_CIFS_EXPERIMENTAL is not set
 # CONFIG_NCP_FS is not set
 # CONFIG_CODA_FS is not set
 # CONFIG_AFS_FS is not set
@@ -1468,43 +1829,43 @@ CONFIG_RPCSEC_GSS_KRB5=3Dy
 CONFIG_MSDOS_PARTITION=3Dy
 CONFIG_NLS=3Dy
 CONFIG_NLS_DEFAULT=3D"iso8859-1"
-CONFIG_NLS_CODEPAGE_437=3Dy
-# CONFIG_NLS_CODEPAGE_737 is not set
-# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_437=3Dm
+CONFIG_NLS_CODEPAGE_737=3Dm
+CONFIG_NLS_CODEPAGE_775=3Dm
 CONFIG_NLS_CODEPAGE_850=3Dm
 CONFIG_NLS_CODEPAGE_852=3Dm
-# CONFIG_NLS_CODEPAGE_855 is not set
-# CONFIG_NLS_CODEPAGE_857 is not set
-# CONFIG_NLS_CODEPAGE_860 is not set
-# CONFIG_NLS_CODEPAGE_861 is not set
-# CONFIG_NLS_CODEPAGE_862 is not set
-# CONFIG_NLS_CODEPAGE_863 is not set
-# CONFIG_NLS_CODEPAGE_864 is not set
-# CONFIG_NLS_CODEPAGE_865 is not set
-# CONFIG_NLS_CODEPAGE_866 is not set
-# CONFIG_NLS_CODEPAGE_869 is not set
-# CONFIG_NLS_CODEPAGE_936 is not set
-# CONFIG_NLS_CODEPAGE_950 is not set
-# CONFIG_NLS_CODEPAGE_932 is not set
-# CONFIG_NLS_CODEPAGE_949 is not set
-# CONFIG_NLS_CODEPAGE_874 is not set
-# CONFIG_NLS_ISO8859_8 is not set
+CONFIG_NLS_CODEPAGE_855=3Dm
+CONFIG_NLS_CODEPAGE_857=3Dm
+CONFIG_NLS_CODEPAGE_860=3Dm
+CONFIG_NLS_CODEPAGE_861=3Dm
+CONFIG_NLS_CODEPAGE_862=3Dm
+CONFIG_NLS_CODEPAGE_863=3Dm
+CONFIG_NLS_CODEPAGE_864=3Dm
+CONFIG_NLS_CODEPAGE_865=3Dm
+CONFIG_NLS_CODEPAGE_866=3Dm
+CONFIG_NLS_CODEPAGE_869=3Dm
+CONFIG_NLS_CODEPAGE_936=3Dm
+CONFIG_NLS_CODEPAGE_950=3Dm
+CONFIG_NLS_CODEPAGE_932=3Dm
+CONFIG_NLS_CODEPAGE_949=3Dm
+CONFIG_NLS_CODEPAGE_874=3Dm
+CONFIG_NLS_ISO8859_8=3Dm
 CONFIG_NLS_CODEPAGE_1250=3Dm
-# CONFIG_NLS_CODEPAGE_1251 is not set
+CONFIG_NLS_CODEPAGE_1251=3Dm
 CONFIG_NLS_ASCII=3Dm
 CONFIG_NLS_ISO8859_1=3Dm
-# CONFIG_NLS_ISO8859_2 is not set
-# CONFIG_NLS_ISO8859_3 is not set
-# CONFIG_NLS_ISO8859_4 is not set
-# CONFIG_NLS_ISO8859_5 is not set
-# CONFIG_NLS_ISO8859_6 is not set
-# CONFIG_NLS_ISO8859_7 is not set
-# CONFIG_NLS_ISO8859_9 is not set
-# CONFIG_NLS_ISO8859_13 is not set
-# CONFIG_NLS_ISO8859_14 is not set
+CONFIG_NLS_ISO8859_2=3Dm
+CONFIG_NLS_ISO8859_3=3Dm
+CONFIG_NLS_ISO8859_4=3Dm
+CONFIG_NLS_ISO8859_5=3Dm
+CONFIG_NLS_ISO8859_6=3Dm
+CONFIG_NLS_ISO8859_7=3Dm
+CONFIG_NLS_ISO8859_9=3Dm
+CONFIG_NLS_ISO8859_13=3Dm
+CONFIG_NLS_ISO8859_14=3Dm
 CONFIG_NLS_ISO8859_15=3Dm
-# CONFIG_NLS_KOI8_R is not set
-# CONFIG_NLS_KOI8_U is not set
+CONFIG_NLS_KOI8_R=3Dm
+CONFIG_NLS_KOI8_U=3Dm
 CONFIG_NLS_UTF8=3Dm
 # CONFIG_DLM is not set
=20
@@ -1556,6 +1917,7 @@ CONFIG_CRYPTO=3Dy
 #
 # Crypto core or helper
 #
+# CONFIG_CRYPTO_FIPS is not set
 CONFIG_CRYPTO_ALGAPI=3Dy
 CONFIG_CRYPTO_ALGAPI2=3Dy
 CONFIG_CRYPTO_AEAD=3Dm
@@ -1564,6 +1926,7 @@ CONFIG_CRYPTO_BLKCIPHER=3Dy
 CONFIG_CRYPTO_BLKCIPHER2=3Dy
 CONFIG_CRYPTO_HASH=3Dy
 CONFIG_CRYPTO_HASH2=3Dy
+CONFIG_CRYPTO_RNG=3Dm
 CONFIG_CRYPTO_RNG2=3Dy
 CONFIG_CRYPTO_PCOMP=3Dy
 CONFIG_CRYPTO_MANAGER=3Dy
@@ -1571,23 +1934,23 @@ CONFIG_CRYPTO_MANAGER2=3Dy
 CONFIG_CRYPTO_GF128MUL=3Dm
 CONFIG_CRYPTO_NULL=3Dm
 CONFIG_CRYPTO_WORKQUEUE=3Dy
-# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_CRYPTD=3Dm
 CONFIG_CRYPTO_AUTHENC=3Dm
 CONFIG_CRYPTO_TEST=3Dm
=20
 #
 # Authenticated Encryption with Associated Data
 #
-# CONFIG_CRYPTO_CCM is not set
-# CONFIG_CRYPTO_GCM is not set
-# CONFIG_CRYPTO_SEQIV is not set
+CONFIG_CRYPTO_CCM=3Dm
+CONFIG_CRYPTO_GCM=3Dm
+CONFIG_CRYPTO_SEQIV=3Dm
=20
 #
 # Block modes
 #
 CONFIG_CRYPTO_CBC=3Dy
-# CONFIG_CRYPTO_CTR is not set
-# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_CTR=3Dm
+CONFIG_CRYPTO_CTS=3Dm
 CONFIG_CRYPTO_ECB=3Dm
 CONFIG_CRYPTO_LRW=3Dm
 CONFIG_CRYPTO_PCBC=3Dm
@@ -1596,22 +1959,22 @@ CONFIG_CRYPTO_XTS=3Dm
 #
 # Hash modes
 #
-CONFIG_CRYPTO_HMAC=3Dy
+CONFIG_CRYPTO_HMAC=3Dm
 CONFIG_CRYPTO_XCBC=3Dm
-# CONFIG_CRYPTO_VMAC is not set
+CONFIG_CRYPTO_VMAC=3Dm
=20
 #
 # Digest
 #
 CONFIG_CRYPTO_CRC32C=3Dm
-# CONFIG_CRYPTO_GHASH is not set
+CONFIG_CRYPTO_GHASH=3Dm
 CONFIG_CRYPTO_MD4=3Dm
 CONFIG_CRYPTO_MD5=3Dy
 CONFIG_CRYPTO_MICHAEL_MIC=3Dm
-# CONFIG_CRYPTO_RMD128 is not set
-# CONFIG_CRYPTO_RMD160 is not set
-# CONFIG_CRYPTO_RMD256 is not set
-# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_RMD128=3Dm
+CONFIG_CRYPTO_RMD160=3Dm
+CONFIG_CRYPTO_RMD256=3Dm
+CONFIG_CRYPTO_RMD320=3Dm
 CONFIG_CRYPTO_SHA1=3Dm
 CONFIG_CRYPTO_SHA256=3Dm
 CONFIG_CRYPTO_SHA512=3Dm
@@ -1631,7 +1994,7 @@ CONFIG_CRYPTO_CAST6=3Dm
 CONFIG_CRYPTO_DES=3Dy
 CONFIG_CRYPTO_FCRYPT=3Dm
 CONFIG_CRYPTO_KHAZAD=3Dm
-# CONFIG_CRYPTO_SALSA20 is not set
+CONFIG_CRYPTO_SALSA20=3Dm
 CONFIG_CRYPTO_SEED=3Dm
 CONFIG_CRYPTO_SERPENT=3Dm
 CONFIG_CRYPTO_TEA=3Dm
@@ -1642,13 +2005,13 @@ CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
 # Compression
 #
 CONFIG_CRYPTO_DEFLATE=3Dy
-# CONFIG_CRYPTO_ZLIB is not set
+CONFIG_CRYPTO_ZLIB=3Dm
 CONFIG_CRYPTO_LZO=3Dy
=20
 #
 # Random Number Generation
 #
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_ANSI_CPRNG=3Dm
 # CONFIG_CRYPTO_HW is not set
 # CONFIG_BINARY_PRINTF is not set
=20
@@ -1659,7 +2022,7 @@ CONFIG_BITREVERSE=3Dy
 CONFIG_GENERIC_FIND_LAST_BIT=3Dy
 CONFIG_CRC_CCITT=3Dm
 CONFIG_CRC16=3Dy
-# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_T10DIF=3Dm
 CONFIG_CRC_ITU_T=3Dm
 CONFIG_CRC32=3Dy
 CONFIG_CRC7=3Dm
diff --git a/recipes/linux/linux_2.6.34.bb b/recipes/linux/linux_2.6.34.b=
b
index 61f23cf..f57d41f 100644
--- a/recipes/linux/linux_2.6.34.bb
+++ b/recipes/linux/linux_2.6.34.bb
@@ -1,6 +1,6 @@
 require linux.inc
=20
-PR =3D "r3"
+PR =3D "r4"
=20
 module_autoload_ohci-hcd_omap5912osk =3D "ohci-hcd"
=20
@@ -43,6 +43,7 @@ SRC_URI_append_ts72xx =3D " \
            file://0016-ts72xx_nand_flash.patch \
            file://0017-ep93xx_spi.patch \
            file://0018-ts72xx_spi_tmp124.patch \
+           file://0019-watchdog-ts72xx_wdt-disable-watchdog-at-probe.pat=
ch \
            "
=20
 SRC_URI[kernel.md5sum] =3D "10eebcb0178fb4540e2165bfd7efc7ad"
--=20
1.7.0.4



