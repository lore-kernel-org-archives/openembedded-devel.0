Received: from relay02.stack.nl
	([131.155.140.104] helo=mx1.stack.nl ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ruud@il.fontys.nl>) id 1Ng1Vw-0006T4-ED
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 20:49:23 +0100
Received: by mx1.stack.nl (Postfix, from userid 65534)
	id CDFD235A86A; Fri, 12 Feb 2010 20:41:28 +0100 (CET)
Received: from mail.il.fontys.nl (mail.il.fontys.nl
	[IPv6:2001:4128:1000:1000::7])
	(using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mailhost.stack.nl (Postfix) with ESMTPS id A994335A85D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 20:41:22 +0100 (CET)
Received: by mail.il.fontys.nl (Postfix, from userid 1004)
	id 6298B1147E; Fri, 12 Feb 2010 20:41:22 +0100 (CET)
Received: from charm.il.fontys.nl (charm.il.fontys.nl
	[IPv6:2001:4128:1000:1000::34])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.il.fontys.nl (Postfix) with ESMTPS id 74DDB11459
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 20:41:15 +0100 (CET)
Received: by charm.il.fontys.nl (Postfix, from userid 1838)
	id 15D5A40B5; Fri, 12 Feb 2010 20:41:14 +0100 (CET)
Date: Fri, 12 Feb 2010 20:41:14 +0100
From: Ruud Althuizen <ruud@il.fontys.nl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100212194114.GH1638@il.fontys.nl>
References: <20100203104829.GL17820@il.fontys.nl>
	<1265195232.5591.75.camel@mattotaupa>
	<20100203111649.GN17820@il.fontys.nl>
	<20100210072033.GF1638@il.fontys.nl>
	<ac9c93b11002092333s3a90d623xd6234e392d84925d@mail.gmail.com>
	<20100212085414.GG1638@il.fontys.nl>
	<ac9c93b11002121033s6b25910fj87fbe29373cf6870@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11002121033s6b25910fj87fbe29373cf6870@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 131.155.140.104
X-SA-Exim-Mail-From: ruud@il.fontys.nl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New machine: Embedded Artists LPC3250
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
X-List-Received-Date: Fri, 12 Feb 2010 19:49:23 -0000
X-Groupsio-MsgNum: 16726
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1giRMj6yz/+FOIRq"
Content-Disposition: inline

--1giRMj6yz/+FOIRq
Content-Type: multipart/mixed; boundary="V4b9U9vrdWczvw78"
Content-Disposition: inline

--V4b9U9vrdWczvw78
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 12 Feb 2010 07:33 PM, Frans Meulenbroeks wrote:
> Ruud, can you resend your patch.
> I wanted to apply it, but you've submitted two patches and the text in
> the first one reads:
>=20
> This is a kernel recipe for the LPC32XX (LPC3250) based Embedded Artists
> development board. It uses public patches provided by NXP and Embedded
> Artists. The other two patches provide drivers for the PWM capabilities
> and fix one NXP patch.
>=20
> (and there are 4 files in the patch).
> In order not to make an error I wanted to verify what exactly need to
> be patched.
0001-linux-ea3250-New-recipe.patch:
	Kernel recipe, defconfig and 2 extra patches (included in git-patch)
	to fix update5 and make it possible to use the PWM pins.

0002-ea3250.conf-New-machine-config.patch:
	Machine config (depends on kernel) and updated checksums.ini

--=20
Kind regards,
Ruud Althuizen

--V4b9U9vrdWczvw78
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="0001-linux-ea3250-New-recipe.patch"
Content-Transfer-Encoding: quoted-printable

From 85b14644e4eb35372e9d88af0d2cf92d2f8113cd Mon Sep 17 00:00:00 2001
Message-Id: <85b14644e4eb35372e9d88af0d2cf92d2f8113cd.1265030495.git.ruud@i=
l.fontys.nl>
From: Ruud Althuizen <ruud@il.fontys.nl>
Date: Mon, 1 Feb 2010 13:36:24 +0100
Subject: [PATCH 1/2] linux-ea3250: New recipe

This is a kernel recipe for the LPC32XX (LPC3250) based Embedded Artists
development board. It uses public patches provided by NXP and Embedded
Artists. The other two patches provide drivers for the PWM capabilities
and fix one NXP patch.

It can be generalized for use with the PHYTEC LPC3250 development board.
---
 conf/checksums.ini                                 |   36 +
 recipes/linux/linux-ea3250-2.6.27.8/defconfig      | 1364 ++++++++++++++++=
++++
 .../kernel-arm-2.6.27.8-lpc32xx_update5_fix.patch  |   21 +
 .../linux/linux-ea3250-2.6.27.8/lpc32xx-spwm.patch |  227 ++++
 recipes/linux/linux-ea3250_2.6.27.8.bb             |   46 +
 5 files changed, 1694 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-ea3250-2.6.27.8/defconfig
 create mode 100644 recipes/linux/linux-ea3250-2.6.27.8/kernel-arm-2.6.27.8=
-lpc32xx_update5_fix.patch
 create mode 100644 recipes/linux/linux-ea3250-2.6.27.8/lpc32xx-spwm.patch
 create mode 100644 recipes/linux/linux-ea3250_2.6.27.8.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index a8c8263..1cb4e74 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -29298,3 +29298,39 @@ sha256=3Df57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1=
a1cfc7dac3b6671e1dd22af
 md5=3D5f7b88ebb2bcd7e8044328482d079661
 sha256=3Df57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
=20
+[http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.27.8.tar.bz2]
+md5=3Dcbdc1b350ef79dd323b9aeda5cf7f1b6
+sha256=3D330aa3059309c589c3abb2d743e5f391dac6671b75004dccde32b54ade17f05d
+
+[http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx.patch]
+md5=3D165364e207bd2e122d9f5e7d94a683eb
+sha256=3D897b6d576526c305b0e8b4a3d1cd02f334606429aacf4969094925cd321c5a3b
+
+[http://bitshrine.org/gpp/kernel-arm-2.6.27.8-update1.patch]
+md5=3D7533dc7dda4d8ff56dfa25b202632dff
+sha256=3Dff46bb7501f23c331b1ba6057ff2eab56690d9cb39a67f92ee7261bdd0947881
+
+[http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_update2.patch]
+md5=3D59f8fafa796bcbe6367c4f10ef8d9491
+sha256=3D96153e5b741c2ef4157c22aef9e1a6f1b91a796f3a646bdfb21bc3adbb4fe4b3
+
+[http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_update3.patch]
+md5=3D2675cd2b70baad7ecc9fb5f64dc1854b
+sha256=3Db1528917ec3d9fc784173795838bf413761b15f5381b6c5885b27b96af418659
+
+[http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_armtskit_update2.pat=
ch]
+md5=3D4074fe1f0af60b416e73ab4754dd59b3
+sha256=3D17c543853daed8f99d6a721a34c509aea262d6868d7680fe808971b401fe5761
+
+[http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_ea3250.patch]
+md5=3D38af08bbd067ef50a9e09c64840e56db
+sha256=3D52cbdf4307c270a6396008a30c32c9012d155a7b0cf26a8430bda3632bee8f7d
+
+[http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_update4.patch]
+md5=3D2f21f8455945759a5af8060224f2a1e2
+sha256=3D14a15c6c8080189066d4e5914e365c5f0253a1578008ced42d7e32746e6f4666
+
+[http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_update5.patch]
+md5=3De65e51b0d8b5710a270fce38f1c6b05b
+sha256=3D2d323344b949de7ad5fb783136a1e6093d616f0a0fe5f7f79c4f1aa6c1869c6f
+
diff --git a/recipes/linux/linux-ea3250-2.6.27.8/defconfig b/recipes/linux/=
linux-ea3250-2.6.27.8/defconfig
new file mode 100644
index 0000000..4dd347f
--- /dev/null
+++ b/recipes/linux/linux-ea3250-2.6.27.8/defconfig
@@ -0,0 +1,1364 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.27.8
+# Wed Sep 23 05:00:03 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+# CONFIG_GENERIC_GPIO is not set
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
+CONFIG_LOG_BUF_SHIFT=3D14
+# CONFIG_CGROUPS is not set
+CONFIG_GROUP_SCHED=3Dy
+CONFIG_FAIR_GROUP_SCHED=3Dy
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=3Dy
+# CONFIG_CGROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=3Dy
+CONFIG_SYSFS_DEPRECATED_V2=3Dy
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_BLK_DEV_INITRD is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
+CONFIG_SYSCTL=3Dy
+CONFIG_EMBEDDED=3Dy
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_COMPAT_BRK=3Dy
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
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+# CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
+# CONFIG_HAVE_IOREMAP_PROT is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+# CONFIG_HAVE_ARCH_TRACEHOOK is not set
+# CONFIG_HAVE_DMA_ATTRS is not set
+# CONFIG_USE_GENERIC_SMP_HELPERS is not set
+# CONFIG_HAVE_CLK is not set
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
+CONFIG_LBD=3Dy
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
+# CONFIG_ARCH_EP93XX is not set
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
+CONFIG_ARCH_LPC32XX=3Dy
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
+# Boot options
+#
+
+#
+# Power management
+#
+
+#
+# LPC32XX board implementations
+#
+# CONFIG_MACH_PHY3250 is not set
+CONFIG_MACH_EA3250=3Dy
+# CONFIG_HZ_100 is not set
+CONFIG_HZ_250=3Dy
+# CONFIG_HZ_300 is not set
+# CONFIG_HZ_1000 is not set
+CONFIG_HZ=3D250
+# CONFIG_SCHED_HRTICK is not set
+CONFIG_EA3250_DISPLAY_SUPPORT=3Dy
+CONFIG_EA3250_QVGA_3_2_LCD=3Dy
+# CONFIG_EA3250_QVGA_2_8_OLED is not set
+
+#
+# LPC32XX chip components
+#
+# CONFIG_MACH_LPC32XX_IRAM_RESERVED is not set
+CONFIG_MACH_LPC32XX_IRAM_FOR_CLCD=3Dy
+# CONFIG_MACH_LPC32XX_IRAM_FOR_NET is not set
+# CONFIG_MAC_LPC32XX_MII_SUPPORT is not set
+CONFIG_SPWM_LPC32XX=3Dy
+
+#
+# Standard UARTS
+#
+CONFIG_MACH_LPC32XX_UART5_ENABLE=3Dy
+# CONFIG_MACH_LPC32XX_UART3_ENABLE is not set
+# CONFIG_MACH_LPC32XX_UART4_ENABLE is not set
+# CONFIG_MACH_LPC32XX_UART6_ENABLE is not set
+
+#
+# High speed UARTS
+#
+# CONFIG_MACH_LPC32XX_HSUART1_ENABLE is not set
+# CONFIG_MACH_LPC32XX_HSUART2_ENABLE is not set
+# CONFIG_MACH_LPC32XX_HSUART7_ENABLE is not set
+
+#
+# I2C interfaces
+#
+CONFIG_MACH_LPC32XX_I2C0_ENABLE=3Dy
+# CONFIG_MACH_LPC32XX_I2C1_ENABLE is not set
+CONFIG_MACH_LPC32XX_USBOTG_I2C_ENABLE=3Dy
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_ARM926T=3Dy
+CONFIG_CPU_32v5=3Dy
+CONFIG_CPU_ABRT_EV5TJ=3Dy
+CONFIG_CPU_PABRT_NOIFAR=3Dy
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
+# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
+# CONFIG_OUTER_CACHE is not set
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
+CONFIG_AEABI=3Dy
+CONFIG_ARCH_FLATMEM_HAS_HOLES=3Dy
+# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
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
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_CMDLINE=3D"console=3DttyS0,115200n81 root=3D/dev/nfs rw nfsroot=3D1=
92.168.1.51:/home/usb10132/dev/ltib-8-1-2-sv/rootfs ip=3Ddhcp init=3D/sbin/=
init"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
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
+CONFIG_VFP=3Dy
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+CONFIG_BINFMT_AOUT=3Dy
+# CONFIG_BINFMT_MISC is not set
+# CONFIG_ARTHUR is not set
+
+#
+# Power management options
+#
+CONFIG_PM=3Dy
+# CONFIG_PM_DEBUG is not set
+# CONFIG_SUSPEND is not set
+# CONFIG_APM_EMULATION is not set
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
+# CONFIG_NET_KEY is not set
+CONFIG_INET=3Dy
+CONFIG_IP_MULTICAST=3Dy
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+CONFIG_IP_PNP=3Dy
+CONFIG_IP_PNP_DHCP=3Dy
+CONFIG_IP_PNP_BOOTP=3Dy
+# CONFIG_IP_PNP_RARP is not set
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
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
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
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+CONFIG_WIRELESS_EXT=3Dy
+CONFIG_WIRELESS_EXT_SYSFS=3Dy
+# CONFIG_MAC80211 is not set
+CONFIG_IEEE80211=3Dy
+# CONFIG_IEEE80211_DEBUG is not set
+# CONFIG_IEEE80211_CRYPT_WEP is not set
+# CONFIG_IEEE80211_CRYPT_CCMP is not set
+# CONFIG_IEEE80211_CRYPT_TKIP is not set
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
+CONFIG_FW_LOADER=3Dm
+CONFIG_FIRMWARE_IN_KERNEL=3Dy
+CONFIG_EXTRA_FIRMWARE=3D""
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=3Dy
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=3Dy
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=3Dy
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
+CONFIG_MTD_NAND_MUSEUM_IDS=3Dy
+CONFIG_MTD_NAND_IDS=3Dy
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+CONFIG_MTD_NAND_SLC_LPC32XX=3Dy
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
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MISC_DEVICES is not set
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
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+
+#
+# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
+#
+CONFIG_SCSI_MULTI_LUN=3Dy
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
+CONFIG_SMSC_PHY=3Dy
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_B44 is not set
+CONFIG_LPC32XX_MII=3Dy
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
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=3Dy
+CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D240
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D320
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=3Dy
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+# CONFIG_INPUT_KEYBOARD is not set
+CONFIG_INPUT_MOUSE=3Dy
+CONFIG_MOUSE_PS2=3Dy
+CONFIG_MOUSE_PS2_ALPS=3Dy
+CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
+CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
+CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
+CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
+# CONFIG_MOUSE_PS2_TOUCHKIT is not set
+# CONFIG_MOUSE_SERIAL is not set
+# CONFIG_MOUSE_APPLETOUCH is not set
+# CONFIG_MOUSE_BCM5974 is not set
+# CONFIG_MOUSE_VSXXXAA is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=3Dy
+CONFIG_TOUCHSCREEN_ADS7846=3Dy
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_UCB1400 is not set
+# CONFIG_TOUCHSCREEN_LPC32XX is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=3Dy
+CONFIG_SERIO_SERPORT=3Dy
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
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_DEVKMEM=3Dy
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=3Dy
+CONFIG_SERIAL_8250_CONSOLE=3Dy
+CONFIG_SERIAL_8250_NR_UARTS=3D4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_AMBA_PL010 is not set
+# CONFIG_SERIAL_AMBA_PL011 is not set
+# CONFIG_SERIAL_HS_LPC32XX is not set
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+CONFIG_I2C_CHARDEV=3Dy
+CONFIG_I2C_HELPER_AUTO=3Dy
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_OCORES is not set
+CONFIG_I2C_PNX=3Dy
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
+# CONFIG_AT24 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+CONFIG_SENSORS_PCA9532=3Dy
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+CONFIG_SPI=3Dy
+CONFIG_SPI_MASTER=3Dy
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_BITBANG is not set
+CONFIG_SPI_LPC32XX=3Dy
+
+#
+# SPI Protocol Masters
+#
+CONFIG_SPI_AT25=3Dy
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=3Dy
+# CONFIG_WATCHDOG_NOWAYOUT is not set
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+CONFIG_LPC32XX_WATCHDOG=3Dy
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
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
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
+CONFIG_FB=3Dy
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
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
+CONFIG_FB_ARMCLCD=3Dy
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_VIRTUAL is not set
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
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
+# CONFIG_FONTS is not set
+CONFIG_FONT_8x8=3Dy
+CONFIG_FONT_8x16=3Dy
+CONFIG_LOGO=3Dy
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=3Dy
+# CONFIG_SOUND is not set
+CONFIG_HID_SUPPORT=3Dy
+CONFIG_HID=3Dy
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=3Dy
+# CONFIG_USB_HIDINPUT_POWERBOOK is not set
+# CONFIG_HID_FF is not set
+# CONFIG_USB_HIDDEV is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+CONFIG_USB_ARCH_HAS_OHCI=3Dy
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+CONFIG_USB=3Dy
+# CONFIG_USB_DEBUG is not set
+# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
+
+#
+# Miscellaneous USB options
+#
+# CONFIG_USB_DEVICEFS is not set
+CONFIG_USB_DEVICE_CLASS=3Dy
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_SUSPEND is not set
+# CONFIG_USB_OTG is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
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
+CONFIG_USB_LIBUSUAL=3Dy
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
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_GADGET is not set
+CONFIG_MMC=3Dy
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+
+#
+# MMC/SD Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dy
+CONFIG_MMC_BLOCK_BOUNCE=3Dy
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD Host Controller Drivers
+#
+CONFIG_MMC_ARMMMCI=3Dy
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_SPI is not set
+# CONFIG_NEW_LEDS is not set
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
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_PL030 is not set
+# CONFIG_RTC_DRV_PL031 is not set
+CONFIG_RTC_DRV_LPC32XX=3Dy
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
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+# CONFIG_EXT3_FS is not set
+# CONFIG_EXT4DEV_FS is not set
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+CONFIG_DNOTIFY=3Dy
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+CONFIG_AUTOFS4_FS=3Dy
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
+CONFIG_MSDOS_FS=3Dy
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
+# CONFIG_CONFIGFS_FS is not set
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
+CONFIG_CRAMFS=3Dy
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
+# CONFIG_NFS_V3_ACL is not set
+# CONFIG_NFS_V4 is not set
+CONFIG_ROOT_NFS=3Dy
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=3Dy
+CONFIG_LOCKD_V4=3Dy
+CONFIG_NFS_COMMON=3Dy
+CONFIG_SUNRPC=3Dy
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
+# CONFIG_NLS_CODEPAGE_850 is not set
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
+CONFIG_NLS_ASCII=3Dm
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
+CONFIG_NLS_UTF8=3Dm
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=3Dy
+CONFIG_ENABLE_MUST_CHECK=3Dy
+CONFIG_FRAME_WARN=3D1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
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
+# CONFIG_CRYPTO_MANAGER is not set
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
+# CONFIG_CRYPTO_CBC is not set
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+# CONFIG_CRYPTO_ECB is not set
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
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_ANUBIS is not set
+# CONFIG_CRYPTO_ARC4 is not set
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
+# CONFIG_CRYPTO_LZO is not set
+# CONFIG_CRYPTO_HW is not set
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
diff --git a/recipes/linux/linux-ea3250-2.6.27.8/kernel-arm-2.6.27.8-lpc32x=
x_update5_fix.patch b/recipes/linux/linux-ea3250-2.6.27.8/kernel-arm-2.6.27=
.8-lpc32xx_update5_fix.patch
new file mode 100644
index 0000000..004e34d
--- /dev/null
+++ b/recipes/linux/linux-ea3250-2.6.27.8/kernel-arm-2.6.27.8-lpc32xx_updat=
e5_fix.patch
@@ -0,0 +1,21 @@
+diff -Naur -X linux/Documentation/dontdiff linux-2.6.27.8/arch/arm/mach-lp=
c32xx/board-ea3250.c linux-2.6.27.8-new/arch/arm/mach-lpc32xx/board-ea3250.=
c
+--- linux-2.6.27.8/arch/arm/mach-lpc32xx/board-ea3250.c	2010-01-05 12:06:3=
7.000000000 +0100
++++ linux-2.6.27.8-new/arch/arm/mach-lpc32xx/board-ea3250.c	2010-01-05 12:=
08:50.000000000 +0100
+@@ -429,7 +429,7 @@
+ 	.width		=3D -1,
+ 	.height		=3D -1,
+ 	.tim2		=3D (CLCDC_LCDTIMING2_IVS | CLCDC_LCDTIMING2_IHS |
+-				CLCD_LCDTIMING2_IPC),
++				CLCDC_LCDTIMING2_IPC),
+ 	.cntl		=3D (CNTL_BGR | CLCDC_LCDCTRL_TFT | CNTL_LCDVCOMP(1) |
+ 				CLCDC_LCDCTRL_BPP16_565),
+ 	.bpp		=3D 16,
+@@ -460,7 +460,7 @@
+ 	.width		=3D -1,
+ 	.height		=3D -1,
+ 	.tim2		=3D (CLCDC_LCDTIMING2_IVS | CLCDC_LCDTIMING2_IHS |
+-				CLCD_LCDTIMING2_IPC),
++				CLCDC_LCDTIMING2_IPC),
+ 	.cntl		=3D (CNTL_BGR | CLCDC_LCDCTRL_TFT | CNTL_LCDVCOMP(1) |
+ 				CLCDC_LCDCTRL_BPP16_565),
+ 	.bpp		=3D 16,
diff --git a/recipes/linux/linux-ea3250-2.6.27.8/lpc32xx-spwm.patch b/recip=
es/linux/linux-ea3250-2.6.27.8/lpc32xx-spwm.patch
new file mode 100644
index 0000000..64e9fff
--- /dev/null
+++ b/recipes/linux/linux-ea3250-2.6.27.8/lpc32xx-spwm.patch
@@ -0,0 +1,227 @@
+diff -Naur -X linux/Documentation/dontdiff linux-2.6.27.8/arch/arm/mach-lp=
c32xx/arch-lpc32xx.c linux-2.6.27.8-new/arch/arm/mach-lpc32xx/arch-lpc32xx.=
c
+--- linux-2.6.27.8/arch/arm/mach-lpc32xx/arch-lpc32xx.c	2009-11-24 15:42:3=
9.000000000 +0100
++++ linux-2.6.27.8-new/arch/arm/mach-lpc32xx/arch-lpc32xx.c	2009-11-24 15:=
52:40.000000000 +0100
+@@ -342,6 +342,9 @@
+ 	tmp |=3D UART_UART6_IRDAMOD_BYPASS;
+ #endif
+ 	__raw_writel(tmp, UARTCTL_CTRL(io_p2v(UART_CTRL_BASE)));
++#if defined(CONFIG_SPWM_LPC32XX)
++	lpc32xx_spwm_init();
++#endif
+ }
+=20
+ static struct map_desc lpc32xx_io_desc[] __initdata =3D {
+diff -Naur -X linux/Documentation/dontdiff linux-2.6.27.8/arch/arm/mach-lp=
c32xx/include/mach/lpc32xx_pwm.h linux-2.6.27.8-new/arch/arm/mach-lpc32xx/i=
nclude/mach/lpc32xx_pwm.h
+--- linux-2.6.27.8/arch/arm/mach-lpc32xx/include/mach/lpc32xx_pwm.h	1970-0=
1-01 01:00:00.000000000 +0100
++++ linux-2.6.27.8-new/arch/arm/mach-lpc32xx/include/mach/lpc32xx_pwm.h	20=
09-11-24 15:54:09.000000000 +0100
+@@ -0,0 +1,31 @@
++/*
++ *  linux/arch/arm/mach-lpc32xx/include/mach/lpc32xx_pwm.h
++ *
++ *  Copyright (C) 2009 Fontys University of Applied Sciences, Eindhoven
++ *                     Laurens Timmermans <l.timmermans@fontys.nl>
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
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
++ */
++
++#ifndef LPC32XX_PWM_H
++#define LPC32XX_PWM_H
++
++#define PWM1	0
++#define PWM2	1
++
++#define RTC_CLK		0x00
++#define PERIPH_CLK	0x01
++
++#endif
+diff -Naur -X linux/Documentation/dontdiff linux-2.6.27.8/arch/arm/mach-lp=
c32xx/Kconfig linux-2.6.27.8-new/arch/arm/mach-lpc32xx/Kconfig
+--- linux-2.6.27.8/arch/arm/mach-lpc32xx/Kconfig	2009-11-24 15:42:39.00000=
0000 +0100
++++ linux-2.6.27.8-new/arch/arm/mach-lpc32xx/Kconfig	2009-11-24 16:01:16.0=
00000000 +0100
+@@ -185,6 +185,12 @@
+ 	  which support is selected, the ethernet interface driver needs to be
+ 	  selected in the device driver networking section.
+=20
++config SPWM_LPC32XX
++	bool "SPWM"
++	default FALSE
++	help
++	  Enable simple-PWM support
++
+ menu "Standard UARTS"
+=20
+ config MACH_LPC32XX_UART5_ENABLE
+diff -Naur -X linux/Documentation/dontdiff linux-2.6.27.8/arch/arm/mach-lp=
c32xx/Makefile linux-2.6.27.8-new/arch/arm/mach-lpc32xx/Makefile
+--- linux-2.6.27.8/arch/arm/mach-lpc32xx/Makefile	2009-11-24 15:42:39.0000=
00000 +0100
++++ linux-2.6.27.8-new/arch/arm/mach-lpc32xx/Makefile	2009-11-24 16:01:39.=
000000000 +0100
+@@ -7,6 +7,7 @@
+ obj-y				:=3D timer-lpc32xx.o irq-lpc32xx.o arch-lpc32xx.o
+ obj-y				+=3D serial-lpc32xx.o clocks-lpc32xx.o
+ obj-y				+=3D dma-lpc32xx.o uid-lpc32xx.o
++obj-y				+=3D spwm-lpc32xx.o
+ obj-m				:=3D=20
+ obj-n				:=3D
+ obj-				:=3D
+diff -Naur -X linux/Documentation/dontdiff linux-2.6.27.8/arch/arm/mach-lp=
c32xx/spwm-lpc32xx.c linux-2.6.27.8-new/arch/arm/mach-lpc32xx/spwm-lpc32xx.=
c
+--- linux-2.6.27.8/arch/arm/mach-lpc32xx/spwm-lpc32xx.c	1970-01-01 01:00:0=
0.000000000 +0100
++++ linux-2.6.27.8-new/arch/arm/mach-lpc32xx/spwm-lpc32xx.c	2009-11-24 16:=
07:20.000000000 +0100
+@@ -0,0 +1,126 @@
++/*
++ *  linux/arch/arm/mach-lpc32xx/spwm-lpc32xx.c
++ *
++ *  Copyright (C) 2009 Fontys University of Applied Sciences, Eindhoven
++ *                     Laurens Timmermans <l.timmermans@fontys.nl>
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
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
++ */
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++
++#include <mach/lpc32xx_clkpwr.h>
++#include <mach/lpc32xx_pwm.h>
++#include "sys-lpc32xx.h"
++
++#define MAX_PWM			1
++
++/* sets bits in w at position x of width y to value z */
++#define _BITS(w,x,y,z) (w =3D (w & ~(((0x01 << y)-1) << ((x+1)-y))) | ((z=
 & ((0x01 << y)-1)) << ((x+1)-y)))
++
++#define PWM_IOBASE(x)	io_p2v(PWM1_BASE + (x*4))
++
++void lpc32xx_spwm_enable(u32 ch)
++{
++	u32 pwm_ctrl;
++
++	if(ch > MAX_PWM)
++		return;
++
++	pwm_ctrl =3D __raw_readl(PWM_IOBASE(ch));
++	_BITS(pwm_ctrl, 31, 0x01, 0x01);
++	__raw_writel(pwm_ctrl, PWM_IOBASE(ch));
++}
++EXPORT_SYMBOL(lpc32xx_spwm_enable);
++
++void lpc32xx_spwm_disable(u32 ch)
++{
++	u32 pwm_ctrl;
++
++	if(ch > MAX_PWM)
++		return;
++
++	pwm_ctrl =3D __raw_readl(PWM_IOBASE(ch));
++	_BITS(pwm_ctrl, 31, 0x01, 0x00);
++	__raw_writel(pwm_ctrl, PWM_IOBASE(ch));
++}
++EXPORT_SYMBOL(lpc32xx_spwm_disable);
++
++void lpc32xx_spwm_set_dutycycle(u32 ch, u32 dutycycle)
++{
++	u32 pwm_ctrl;
++
++	if(ch > MAX_PWM)
++		return;
++
++	pwm_ctrl =3D __raw_readl(PWM_IOBASE(ch));
++	_BITS(pwm_ctrl, 0x07, 0x08, dutycycle);
++	__raw_writel(pwm_ctrl, PWM_IOBASE(ch));
++}
++EXPORT_SYMBOL(lpc32xx_spwm_set_dutycycle);
++
++void lpc32xx_spwm_set_reloadv(u32 ch, u32 reloadv)
++{
++	u32 pwm_ctrl;
++
++	if(ch > MAX_PWM)
++		return;
++
++	pwm_ctrl =3D __raw_readl(PWM_IOBASE(ch));
++	_BITS(pwm_ctrl, 0x0F, 0x08, reloadv);
++	__raw_writel(pwm_ctrl, PWM_IOBASE(ch));
++}
++EXPORT_SYMBOL(lpc32xx_spwm_set_reloadv);
++
++void lpc32xx_spwm_set_clocksource(u32 ch, u32 clk)
++{
++	u32 clk_ctrl;
++
++	if(ch > MAX_PWM)
++		return;
++
++	clk_ctrl =3D __raw_readl(CLKPWR_PWM_CLK_CTRL(CLKPWR_IOBASE));
++	_BITS(clk_ctrl, (ch*2 + 1), 0x01, clk);
++	__raw_writel(clk_ctrl, CLKPWR_PWM_CLK_CTRL(CLKPWR_IOBASE));
++}
++EXPORT_SYMBOL(lpc32xx_spwm_set_clocksource);
++
++void lpc32xx_spwm_set_clockdiv(u32 ch, u32 div)
++{
++	u32 clk_ctrl;
++
++	if(ch > MAX_PWM)
++		return;
++
++	clk_ctrl =3D __raw_readl(CLKPWR_PWM_CLK_CTRL(CLKPWR_IOBASE));
++	_BITS(clk_ctrl, (ch*4 + 7), 0x04, div);
++	__raw_writel(clk_ctrl, CLKPWR_PWM_CLK_CTRL(CLKPWR_IOBASE));
++}
++EXPORT_SYMBOL(lpc32xx_spwm_set_clockdiv);
++
++void __init lpc32xx_spwm_init(void)
++{
++	u32 clk_ctrl;
++
++	/* enable the clock */
++	clk_ctrl =3D __raw_readl(CLKPWR_PWM_CLK_CTRL(CLKPWR_IOBASE));
++	clk_ctrl |=3D (0x05);
++	__raw_writel(clk_ctrl, CLKPWR_PWM_CLK_CTRL(CLKPWR_IOBASE));
++
++	/* initially set clockdiv to 1 */
++	lpc32xx_spwm_set_clockdiv(PWM1, 1);
++	lpc32xx_spwm_set_clockdiv(PWM2, 1);
++}
+diff -Naur -X linux/Documentation/dontdiff linux-2.6.27.8/arch/arm/mach-lp=
c32xx/sys-lpc32xx.h linux-2.6.27.8-new/arch/arm/mach-lpc32xx/sys-lpc32xx.h
+--- linux-2.6.27.8/arch/arm/mach-lpc32xx/sys-lpc32xx.h	2009-11-24 15:42:39=
.000000000 +0100
++++ linux-2.6.27.8-new/arch/arm/mach-lpc32xx/sys-lpc32xx.h	2009-11-24 16:0=
8:24.000000000 +0100
+@@ -83,14 +83,17 @@
+ #endif
+=20
+ /* Chip specific structures and functions */
+-extern struct platform_device serial_std_platform_device;
+-extern struct platform_device serial_hspd_platform_device;
++extern struct platform_device serial_std_platform_device;
++extern struct platform_device serial_hspd_platform_device;
+ extern struct sys_timer lpc32xx_timer;
+ extern void lpc32xx_init_irq (void);
+ extern void serial_init(void);
+ extern void __init lpc32xx_init (void);
+ extern void __init lpc32xx_map_io(void);
+ extern int __init clk_init(void);
++#if defined(CONFIG_SPWM_LPC32XX)
++extern void lpc32xx_spwm_init(void);
++#endif
+=20
+ #endif
diff --git a/recipes/linux/linux-ea3250_2.6.27.8.bb b/recipes/linux/linux-e=
a3250_2.6.27.8.bb
new file mode 100644
index 0000000..37c152d
--- /dev/null
+++ b/recipes/linux/linux-ea3250_2.6.27.8.bb
@@ -0,0 +1,46 @@
+SECTION =3D "kernel"
+DESCRIPTION =3D "Linux kernel for the EmbeddedArtists LPC3250 development =
board"
+HOMEPAGE =3D "http://embeddedartists.com"
+# DEPENDS =3D ""
+LICENSE =3D "GPL"
+PR =3D "r0"
+
+# Location of the base kernel and NXP's patches
+
+# It is advisable to mirror the patches listed below, as there is no certa=
inty
+# that they will stay there indefinitely.
+#  - Joost
+SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.27.8.tar.=
bz2 \
+	http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx.patch;patch=3D1 \
+	http://bitshrine.org/gpp/kernel-arm-2.6.27.8-update1.patch;patch=3D1 \
+	http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_update2.patch;patch=
=3D1 \
+	http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_update3.patch;patch=
=3D1 \
+	http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_armtskit_update2.pat=
ch;patch=3D1 \
+	http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_ea3250.patch;patch=
=3D1 \
+	http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_update4.patch;patch=
=3D1 \
+	http://bitshrine.org/gpp/kernel-arm-2.6.27.8-lpc32xx_update5.patch;patch=
=3D1 \
+	file://kernel-arm-2.6.27.8-lpc32xx_update5_fix.patch;patch=3D1 \
+	file://lpc32xx-spwm.patch;patch=3D1 \
+	file://defconfig"
+
+# Source directory
+S =3D "${WORKDIR}/linux-${PV}"
+
+# Which machines are supported by this kernel
+COMPATIBLE_HOST =3D 'arm.*-linux'
+
+# Kernel object suffix (should be .o)
+KERNEL_OBJECT_SUFFIX =3D ".o"
+
+# Inherit the class that actually builds the kernel
+inherit kernel
+
+# Kernel command line
+# XXX
+CMDLINE =3D "root=3D/dev/mmcblk0p2 console=3DttyS0,115200"
+
+do_configure_prepend() {
+	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+}
+
+COMPATIBLE_MACHINE =3D "ea3250"
--=20
1.6.6.1


--V4b9U9vrdWczvw78
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="0002-ea3250.conf-New-machine-config.patch"
Content-Transfer-Encoding: quoted-printable

From ae98473a8b558d2fb0b0c9eea95464ed23051700 Mon Sep 17 00:00:00 2001
Message-Id: <ae98473a8b558d2fb0b0c9eea95464ed23051700.1265030495.git.ruud@i=
l.fontys.nl>
In-Reply-To: <85b14644e4eb35372e9d88af0d2cf92d2f8113cd.1265030495.git.ruud@=
il.fontys.nl>
References: <85b14644e4eb35372e9d88af0d2cf92d2f8113cd.1265030495.git.ruud@i=
l.fontys.nl>
From: Ruud Althuizen <ruud@il.fontys.nl>
Date: Mon, 1 Feb 2010 14:11:57 +0100
Subject: [PATCH 2/2] ea3250.conf: New machine config

Machine config for the LPC32XX based Embedded Artists development board
---
 conf/machine/ea3250.conf |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/ea3250.conf

diff --git a/conf/machine/ea3250.conf b/conf/machine/ea3250.conf
new file mode 100644
index 0000000..50099a2
--- /dev/null
+++ b/conf/machine/ea3250.conf
@@ -0,0 +1,27 @@
+#@TYPE: Machine
+#@NAME: Embedded Artists LPC3250 machine
+#@DESCRIPTION: Machine configuration for Embedded Artists LPC3250 developm=
ent board
+#@WEBSITE: http://www.embeddedartists.com/products/kits/lpc3250_kit.php
+
+TARGET_ARCH =3D "arm"
+
+require conf/machine/include/tune-arm926ejs.inc
+
+MACHINE_KERNEL_PR		=3D "r0"
+
+MACHINE_FEATURES 		=3D "kernel26 usbhost ext2 vfat"
+MACHINE_TASK_PROVIDER 		=3D "task-base"
+
+USE_DEVFS =3D "0"
+
+PREFERRED_PROVIDER_virtual/bootloader =3D ""
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-ea3250"
+PREFERRED_VERSION_linux-ea3250 =3D "2.6.27.8"
+
+IMAGE_DEVICE_TABLES =3D "files/device_table-slugos.txt"
+IMAGE_FSTYPES =3D "tar.gz"
+SERIAL_CONSOLE =3D "ttyS0 115200"
+
+KERNEL_IMAGETYPE =3D "uImage"
+UBOOT_ENTRYPOINT =3D "0x80008000"
+UBOOT_LOADADDRESS =3D "0x80008000"
--=20
1.6.6.1


--V4b9U9vrdWczvw78--

--1giRMj6yz/+FOIRq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (FreeBSD)

iEYEARECAAYFAkt1rtoACgkQkqncCMFskRXClACfSyex1WdITvUbMvezlr7pIgRV
u4sAniB8m/MIyLBYAUFbACq8y6ajzEWh
=hBpf
-----END PGP SIGNATURE-----

--1giRMj6yz/+FOIRq--
