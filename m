Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8B57B60912
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2013 22:07:21 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id o14so664986eaj.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jun 2013 15:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IvereXqAoqzs3jU+0E+UF5eLxIp+ZAkzrM0yaUatGyY=;
	b=wuc0Wh62+oOlzwc0AitwOG6KDhiD2eZE2QMncKbJbbNxNeYFeBMDs7cPXope9L+DX7
	IGBWzMtzolF9dED+zD8h/K/aUrRLoZkab5zYpIPYQzjwya1LdnIZ9pFYjo+hkr2vBKQC
	1uRXcWg1hXL8GM4aPy86Zp890MXmQPHvLHqiAdMBNep6NPsyJ05LeyeiXu2id6w4W0NY
	lDyIF2erLakmuAZG84T8pL643IuumUQTEbiIcICMHveqjf5BwXXAMz/fI9tX4NFjOzhy
	yzlVj8hfNrez22Cjmw88ILceLkbY3LQ2JZZZY8vfG4382aaOjbyklPgqbpKkNcJmZq5z
	aKHQ==
X-Received: by 10.15.51.129 with SMTP id n1mr21151668eew.104.1370210841640;
	Sun, 02 Jun 2013 15:07:21 -0700 (PDT)
Received: from mizar.localdomain
	(host199-42-dynamic.183-80-r.retail.telecomitalia.it.
	[80.183.42.199])
	by mx.google.com with ESMTPSA id l6sm80678142eef.12.2013.06.02.15.07.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 15:07:20 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jun 2013 00:06:33 +0200
Message-Id: <1370210793-13633-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld] linux-yocto-tiny-kexecboot_3.8: provide .bbappend for meta-handheld
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Jun 2013 22:07:22 -0000

* atm configuration and patches for Zaurus only

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../akita/akita-tiny.scc                           |   13 +
 .../linux-yocto-tiny-kexecboot-3.8/akita/akita.cfg |    4 +
 .../c7x0/c7x0-kexecboot.cfg                        | 1871 +++++++++++++++++++
 .../c7x0/c7x0-tiny.scc                             |   11 +
 .../collie/collie-kexecboot.cfg                    | 1777 ++++++++++++++++++
 .../collie/collie-tiny.scc                         |   13 +
 .../linux-yocto-tiny-kexecboot-3.8/feature-top.scc |    1 +
 .../patches-locomokbd/locomo_kbd_tweak-r2.patch    |   78 +
 .../patches/patches-mfd/mcp-device.patch           |   48 +
 .../patches/patches-mtd/collie-eraseinfo.patch     |   42 +
 .../patches/patches-mtd/collie-jedec-probe.patch   |   22 +
 .../patches/patches-pxa/pxa27x-sa1100-rtc.patch    |   32 +
 .../patches/patches-pxa/pxamci-regulator.patch     |  138 ++
 .../patches/patches-pxa/sharpsl_param.patch        |   38 +
 .../patches/revert-check-on-console-device.patch   |   41 +
 .../poodle/poodle-kexecboot.cfg                    | 1775 ++++++++++++++++++
 .../poodle/poodle-tiny.scc                         |   12 +
 .../spitz/3200-mtd.patch                           |   13 +
 .../spitz/spitz-kexecboot.cfg                      | 1876 ++++++++++++++++++++
 .../spitz/spitz-tiny.scc                           |   15 +
 .../tosa/tosa-kexecboot.cfg                        | 1778 +++++++++++++++++++
 .../tosa/tosa-tiny.scc                             |   11 +
 .../linux/linux-yocto-tiny-kexecboot_3.8.bbappend  |   55 +
 23 files changed, 9664 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-kexecboot.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-kexecboot.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/feature-top.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/mcp-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-eraseinfo.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-jedec-probe.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxamci-regulator.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/sharpsl_param.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/revert-check-on-console-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-kexecboot.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/3200-mtd.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-kexecboot.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-kexecboot.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita-tiny.scc
new file mode 100644
index 0000000..50959de
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita-tiny.scc
@@ -0,0 +1,13 @@
+define KMACHINE akita
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny/tiny.scc
+
+kconf hardware ../spitz/spitz-kexecboot.cfg
+kconf hardware akita.cfg
+
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
+patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita.cfg
new file mode 100644
index 0000000..f6eb8f2
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita.cfg
@@ -0,0 +1,4 @@
+#
+# System Type
+#
+CONFIG_GPIO_PCA953X=y
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-kexecboot.cfg
new file mode 100644
index 0000000..ffd7b37
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-kexecboot.cfg
@@ -0,0 +1,1871 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.8.13 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_NEED_MACH_GPIO_H=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_BUILDTIME_EXTABLE_SORT=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION="-yocto-tiny"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_XZ=y
+CONFIG_HAVE_KERNEL_LZO=y
+# CONFIG_KERNEL_GZIP is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_KERNEL_XZ is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+# CONFIG_SWAP is not set
+# CONFIG_SYSVIPC is not set
+# CONFIG_FHANDLE is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_SPARSE_IRQ=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+
+#
+# Timers subsystem
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+# CONFIG_HIGH_RES_TIMERS is not set
+
+#
+# CPU/Task time and stats accounting
+#
+CONFIG_TICK_CPU_ACCOUNTING=y
+# CONFIG_BSD_PROCESS_ACCT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_CGROUPS is not set
+# CONFIG_CHECKPOINT_RESTORE is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_UIDGID_CONVERTED=y
+# CONFIG_UIDGID_STRICT_TYPE_CHECKS is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
+CONFIG_INITRAMFS_ROOT_UID=0
+CONFIG_INITRAMFS_ROOT_GID=0
+CONFIG_RD_GZIP=y
+# CONFIG_RD_BZIP2 is not set
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_INITRAMFS_COMPRESSION_NONE is not set
+# CONFIG_INITRAMFS_COMPRESSION_GZIP is not set
+CONFIG_INITRAMFS_COMPRESSION_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_HAVE_UID16=y
+# CONFIG_UPTIME_LIMITED_KERNEL is not set
+# CONFIG_UID16 is not set
+# CONFIG_SYSCTL_SYSCALL is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_HOTPLUG=y
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_BASE_FULL is not set
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+# CONFIG_PERF_EVENTS is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_JUMP_LABEL is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_HAVE_DMA_ATTRS=y
+CONFIG_HAVE_DMA_CONTIGUOUS=y
+CONFIG_GENERIC_SMP_IDLE_THREAD=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_ARCH_JUMP_LABEL=y
+CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
+CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
+CONFIG_MODULES_USE_ELF_REL=y
+CONFIG_CLONE_BACKWARDS=y
+
+#
+# GCOV-based kernel profiling
+#
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=1
+# CONFIG_MODULES is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
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
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_DEADLINE=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="deadline"
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+CONFIG_INLINE_READ_UNLOCK=y
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+CONFIG_INLINE_WRITE_UNLOCK=y
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_MULTIPLATFORM is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCM2835 is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_SIRF is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_TEGRA is not set
+CONFIG_ARCH_PXA=y
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C24XX is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_VT8500_SINGLE is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# Intel PXA2xx/PXA3xx Implementations
+#
+
+#
+# Intel/Marvell Dev Platforms (sorted by hardware release time)
+#
+# CONFIG_MACH_PXA3XX_DT is not set
+# CONFIG_ARCH_LUBBOCK is not set
+# CONFIG_MACH_MAINSTONE is not set
+# CONFIG_MACH_ZYLONITE300 is not set
+# CONFIG_MACH_ZYLONITE320 is not set
+# CONFIG_MACH_LITTLETON is not set
+# CONFIG_MACH_TAVOREVB is not set
+# CONFIG_MACH_SAAR is not set
+
+#
+# Third Party Dev Platforms (sorted by vendor name)
+#
+# CONFIG_ARCH_PXA_IDP is not set
+# CONFIG_ARCH_VIPER is not set
+# CONFIG_MACH_ARCOM_ZEUS is not set
+# CONFIG_MACH_BALLOON3 is not set
+# CONFIG_MACH_CSB726 is not set
+# CONFIG_MACH_ARMCORE is not set
+# CONFIG_MACH_EM_X270 is not set
+# CONFIG_MACH_EXEDA is not set
+# CONFIG_MACH_CM_X300 is not set
+# CONFIG_MACH_CAPC7117 is not set
+# CONFIG_ARCH_GUMSTIX is not set
+# CONFIG_MACH_INTELMOTE2 is not set
+# CONFIG_MACH_STARGATE2 is not set
+# CONFIG_MACH_XCEP is not set
+# CONFIG_TRIZEPS_PXA is not set
+# CONFIG_MACH_LOGICPD_PXA270 is not set
+# CONFIG_MACH_PCM027 is not set
+# CONFIG_MACH_COLIBRI is not set
+# CONFIG_MACH_COLIBRI300 is not set
+# CONFIG_MACH_COLIBRI320 is not set
+# CONFIG_MACH_VPAC270 is not set
+
+#
+# End-user Products (sorted by vendor name)
+#
+# CONFIG_MACH_H4700 is not set
+# CONFIG_MACH_H5000 is not set
+# CONFIG_MACH_HIMALAYA is not set
+# CONFIG_MACH_MAGICIAN is not set
+# CONFIG_MACH_MIOA701 is not set
+# CONFIG_PXA_EZX is not set
+# CONFIG_MACH_MP900C is not set
+# CONFIG_ARCH_PXA_PALM is not set
+# CONFIG_MACH_RAUMFELD_RC is not set
+# CONFIG_MACH_RAUMFELD_CONNECTOR is not set
+# CONFIG_MACH_RAUMFELD_SPEAKER is not set
+CONFIG_PXA_SHARPSL=y
+CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
+# CONFIG_MACH_POODLE is not set
+CONFIG_MACH_CORGI=y
+CONFIG_MACH_SHEPHERD=y
+CONFIG_MACH_HUSKY=y
+# CONFIG_MACH_AKITA is not set
+# CONFIG_MACH_SPITZ is not set
+# CONFIG_MACH_BORZOI is not set
+# CONFIG_MACH_TOSA is not set
+# CONFIG_MACH_ICONTROL is not set
+# CONFIG_ARCH_PXA_ESERIES is not set
+# CONFIG_MACH_ZIPIT2 is not set
+CONFIG_PXA25x=y
+CONFIG_PXA_SHARP_C7xx=y
+CONFIG_SHARPSL_PM=y
+CONFIG_SHARPSL_PM_MAX1111=y
+CONFIG_PXA_SSP=y
+# CONFIG_ARCH_VT8500 is not set
+CONFIG_PLAT_PXA=y
+
+#
+# Processor Type
+#
+CONFIG_CPU_XSCALE=y
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5T=y
+CONFIG_CPU_PABRT_LEGACY=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+CONFIG_CPU_USE_DOMAINS=y
+
+#
+# Processor Features
+#
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+CONFIG_ARM_NR_BANKS=8
+# CONFIG_IWMMXT is not set
+CONFIG_XSCALE_PMU=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+
+#
+# PC-card bridges
+#
+CONFIG_PCMCIA_SOC_COMMON=y
+CONFIG_PCMCIA_PXA2XX=y
+# CONFIG_PCMCIA_DEBUG is not set
+
+#
+# Kernel Features
+#
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_ARCH_NR_GPIO=0
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=999999
+# CONFIG_COMPACTION is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ATAGS=y
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 loglevel=3"
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
+# CONFIG_CMDLINE_EXTEND is not set
+# CONFIG_CMDLINE_FORCE is not set
+# CONFIG_XIP_KERNEL is not set
+CONFIG_KEXEC=y
+CONFIG_ATAGS_PROC=y
+# CONFIG_CRASH_DUMP is not set
+CONFIG_AUTO_ZRELADDR=y
+
+#
+# CPU Power Management
+#
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+# CONFIG_CPU_IDLE is not set
+# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
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
+CONFIG_BINFMT_ELF=y
+CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+# CONFIG_COREDUMP is not set
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+# CONFIG_PM_AUTOSLEEP is not set
+# CONFIG_PM_WAKELOCKS is not set
+# CONFIG_PM_RUNTIME is not set
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+# CONFIG_NET is not set
+CONFIG_HAVE_BPF_JIT=y
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_GENERIC_CPU_DEVICES is not set
+# CONFIG_DMA_SHARED_BUFFER is not set
+# CONFIG_CMA is not set
+
+#
+# Bus devices
+#
+CONFIG_MTD=y
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
+# CONFIG_SM_FTL is not set
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
+CONFIG_MTD_ROM=y
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+# CONFIG_MTD_PHYSMAP_COMPAT is not set
+# CONFIG_MTD_PCMCIA is not set
+# CONFIG_MTD_GPIO_ADDR is not set
+# CONFIG_MTD_PLATRAM is not set
+# CONFIG_MTD_LATCH_ADDR is not set
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
+# CONFIG_MTD_DOCG3 is not set
+CONFIG_MTD_NAND_ECC=y
+# CONFIG_MTD_NAND_ECC_SMC is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_DENALI is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_DOCG4 is not set
+CONFIG_MTD_NAND_SHARPSL=y
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_LIMIT=20
+# CONFIG_MTD_UBI_FASTMAP is not set
+# CONFIG_MTD_UBI_GLUEBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS or INET not selected
+#
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_MG_DISK is not set
+
+#
+# Misc devices
+#
+# CONFIG_SENSORS_LIS3LV02D is not set
+# CONFIG_AD525X_DPOT is not set
+# CONFIG_ATMEL_PWM is not set
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_APDS9802ALS is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_ISL29020 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_SENSORS_BH1780 is not set
+# CONFIG_SENSORS_BH1770 is not set
+# CONFIG_SENSORS_APDS990X is not set
+# CONFIG_HMC6352 is not set
+# CONFIG_DS1682 is not set
+# CONFIG_TI_DAC7512 is not set
+# CONFIG_BMP085_I2C is not set
+# CONFIG_BMP085_SPI is not set
+# CONFIG_USB_SWITCH_FSA9480 is not set
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
+# CONFIG_EEPROM_93XX46 is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_SENSORS_LIS3_I2C is not set
+
+#
+# Altera FPGA firmware download module
+#
+# CONFIG_ALTERA_STAPL is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
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
+# CONFIG_SCSI_MULTI_LUN is not set
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_SAS_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+
+#
+# Controllers with non-SFF native interface
+#
+# CONFIG_SATA_AHCI_PLATFORM is not set
+CONFIG_ATA_SFF=y
+
+#
+# SFF controllers with custom DMA interface
+#
+CONFIG_ATA_BMDMA=y
+
+#
+# SATA SFF controllers with BMDMA
+#
+# CONFIG_SATA_HIGHBANK is not set
+# CONFIG_SATA_MV is not set
+
+#
+# PATA SFF controllers with BMDMA
+#
+CONFIG_PATA_PXA=y
+
+#
+# PIO-only SFF controllers
+#
+CONFIG_PATA_PCMCIA=y
+# CONFIG_PATA_PLATFORM is not set
+
+#
+# Generic fallback / legacy drivers
+#
+# CONFIG_MD is not set
+# CONFIG_TARGET_CORE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
+CONFIG_INPUT_MATRIXKMAP=y
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+CONFIG_INPUT_APMPOWER=y
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+# CONFIG_KEYBOARD_ADP5589 is not set
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_QT1070 is not set
+# CONFIG_KEYBOARD_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_KEYBOARD_TCA6416 is not set
+# CONFIG_KEYBOARD_TCA8418 is not set
+CONFIG_KEYBOARD_MATRIX=y
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_LM8333 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_SAMSUNG is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=y
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
+# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_ILI210X is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MMS114 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_PIXCIR is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
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
+CONFIG_VT_CONSOLE_SLEEP=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_TRACE_SINK is not set
+# CONFIG_DEVKMEM is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX310X is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_SCCNXP is not set
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_ARC is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_COMPAT is not set
+# CONFIG_I2C_CHARDEV is not set
+# CONFIG_I2C_MUX is not set
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_CBUS_GPIO is not set
+# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PCA_PLATFORM is not set
+CONFIG_I2C_PXA=y
+# CONFIG_I2C_PXA_PCI is not set
+# CONFIG_I2C_PXA_SLAVE is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_ALTERA is not set
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+# CONFIG_SPI_OC_TINY is not set
+CONFIG_SPI_PXA2XX=y
+# CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_SC18IS602 is not set
+# CONFIG_SPI_XCOMM is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_HSI is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+
+#
+# PPS generators support
+#
+
+#
+# PTP clock support
+#
+# CONFIG_PTP_1588_CLOCK is not set
+
+#
+# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
+#
+# CONFIG_PTP_1588_CLOCK_PCH is not set
+CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+# CONFIG_GPIO_SYSFS is not set
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_EM is not set
+CONFIG_GPIO_PXA=y
+# CONFIG_GPIO_TS5500 is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_SX150X is not set
+# CONFIG_GPIO_ADP5588 is not set
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
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+
+#
+# USB GPIO expanders:
+#
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2781 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_SBS is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_LP8727 is not set
+# CONFIG_CHARGER_GPIO is not set
+# CONFIG_CHARGER_BQ2415X is not set
+# CONFIG_CHARGER_SMB347 is not set
+# CONFIG_POWER_RESET is not set
+# CONFIG_POWER_AVS is not set
+CONFIG_HWMON=y
+# CONFIG_HWMON_VID is not set
+# CONFIG_HWMON_DEBUG_CHIP is not set
+
+#
+# Native drivers
+#
+# CONFIG_SENSORS_AD7314 is not set
+# CONFIG_SENSORS_AD7414 is not set
+# CONFIG_SENSORS_AD7418 is not set
+# CONFIG_SENSORS_ADCXX is not set
+# CONFIG_SENSORS_ADM1021 is not set
+# CONFIG_SENSORS_ADM1025 is not set
+# CONFIG_SENSORS_ADM1026 is not set
+# CONFIG_SENSORS_ADM1029 is not set
+# CONFIG_SENSORS_ADM1031 is not set
+# CONFIG_SENSORS_ADM9240 is not set
+# CONFIG_SENSORS_ADT7410 is not set
+# CONFIG_SENSORS_ADT7411 is not set
+# CONFIG_SENSORS_ADT7462 is not set
+# CONFIG_SENSORS_ADT7470 is not set
+# CONFIG_SENSORS_ADT7475 is not set
+# CONFIG_SENSORS_ASC7621 is not set
+# CONFIG_SENSORS_ATXP1 is not set
+# CONFIG_SENSORS_DS620 is not set
+# CONFIG_SENSORS_DS1621 is not set
+# CONFIG_SENSORS_F71805F is not set
+# CONFIG_SENSORS_F71882FG is not set
+# CONFIG_SENSORS_F75375S is not set
+# CONFIG_SENSORS_G760A is not set
+# CONFIG_SENSORS_GL518SM is not set
+# CONFIG_SENSORS_GL520SM is not set
+# CONFIG_SENSORS_GPIO_FAN is not set
+# CONFIG_SENSORS_HIH6130 is not set
+# CONFIG_SENSORS_IT87 is not set
+# CONFIG_SENSORS_JC42 is not set
+# CONFIG_SENSORS_LINEAGE is not set
+# CONFIG_SENSORS_LM63 is not set
+# CONFIG_SENSORS_LM70 is not set
+# CONFIG_SENSORS_LM73 is not set
+# CONFIG_SENSORS_LM75 is not set
+# CONFIG_SENSORS_LM77 is not set
+# CONFIG_SENSORS_LM78 is not set
+# CONFIG_SENSORS_LM80 is not set
+# CONFIG_SENSORS_LM83 is not set
+# CONFIG_SENSORS_LM85 is not set
+# CONFIG_SENSORS_LM87 is not set
+# CONFIG_SENSORS_LM90 is not set
+# CONFIG_SENSORS_LM92 is not set
+# CONFIG_SENSORS_LM93 is not set
+# CONFIG_SENSORS_LTC4151 is not set
+# CONFIG_SENSORS_LTC4215 is not set
+# CONFIG_SENSORS_LTC4245 is not set
+# CONFIG_SENSORS_LTC4261 is not set
+# CONFIG_SENSORS_LM95241 is not set
+# CONFIG_SENSORS_LM95245 is not set
+CONFIG_SENSORS_MAX1111=y
+# CONFIG_SENSORS_MAX16065 is not set
+# CONFIG_SENSORS_MAX1619 is not set
+# CONFIG_SENSORS_MAX1668 is not set
+# CONFIG_SENSORS_MAX197 is not set
+# CONFIG_SENSORS_MAX6639 is not set
+# CONFIG_SENSORS_MAX6642 is not set
+# CONFIG_SENSORS_MAX6650 is not set
+# CONFIG_SENSORS_MCP3021 is not set
+# CONFIG_SENSORS_NTC_THERMISTOR is not set
+# CONFIG_SENSORS_PC87360 is not set
+# CONFIG_SENSORS_PC87427 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_PMBUS is not set
+# CONFIG_SENSORS_SHT15 is not set
+# CONFIG_SENSORS_SHT21 is not set
+# CONFIG_SENSORS_SMM665 is not set
+# CONFIG_SENSORS_DME1737 is not set
+# CONFIG_SENSORS_EMC1403 is not set
+# CONFIG_SENSORS_EMC2103 is not set
+# CONFIG_SENSORS_EMC6W201 is not set
+# CONFIG_SENSORS_SMSC47M1 is not set
+# CONFIG_SENSORS_SMSC47M192 is not set
+# CONFIG_SENSORS_SMSC47B397 is not set
+# CONFIG_SENSORS_SCH56XX_COMMON is not set
+# CONFIG_SENSORS_ADS1015 is not set
+# CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_ADS7871 is not set
+# CONFIG_SENSORS_AMC6821 is not set
+# CONFIG_SENSORS_INA2XX is not set
+# CONFIG_SENSORS_THMC50 is not set
+# CONFIG_SENSORS_TMP102 is not set
+# CONFIG_SENSORS_TMP401 is not set
+# CONFIG_SENSORS_TMP421 is not set
+# CONFIG_SENSORS_VT1211 is not set
+# CONFIG_SENSORS_W83781D is not set
+# CONFIG_SENSORS_W83791D is not set
+# CONFIG_SENSORS_W83792D is not set
+# CONFIG_SENSORS_W83793 is not set
+# CONFIG_SENSORS_W83795 is not set
+# CONFIG_SENSORS_W83L785TS is not set
+# CONFIG_SENSORS_W83L786NG is not set
+# CONFIG_SENSORS_W83627HF is not set
+# CONFIG_SENSORS_W83627EHF is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_BCMA_POSSIBLE=y
+
+#
+# Broadcom specific AMBA
+#
+# CONFIG_BCMA is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_88PM800 is not set
+# CONFIG_MFD_88PM805 is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_MFD_TI_AM335X_TSCADC is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_MFD_LM3533 is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS65217 is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_MFD_TPS80031 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_TWL6040_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_SMSC is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_DA9052_SPI is not set
+# CONFIG_MFD_DA9052_I2C is not set
+# CONFIG_MFD_DA9055 is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_LP8788 is not set
+# CONFIG_MFD_MAX77686 is not set
+# CONFIG_MFD_MAX77693 is not set
+# CONFIG_MFD_MAX8907 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_SEC_CORE is not set
+# CONFIG_MFD_ARIZONA_I2C is not set
+# CONFIG_MFD_ARIZONA_SPI is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX_SPI is not set
+# CONFIG_MFD_MC13XXX_I2C is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_TPS65090 is not set
+# CONFIG_MFD_AAT2870_CORE is not set
+# CONFIG_MFD_RC5T583 is not set
+# CONFIG_MFD_PALMAS is not set
+# CONFIG_MFD_RETU is not set
+# CONFIG_MFD_AS3711 is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_DRM is not set
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
+# CONFIG_FB_WMT_GE_ROPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_PXA is not set
+# CONFIG_FB_MBX is not set
+CONFIG_FB_W100=y
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_AUO_K190X is not set
+# CONFIG_EXYNOS_VIDEO is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LCD_CORGI=y
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_ILI9320 is not set
+# CONFIG_LCD_TDO24M is not set
+# CONFIG_LCD_VGG2432A4 is not set
+# CONFIG_LCD_PLATFORM is not set
+# CONFIG_LCD_S6E63M0 is not set
+# CONFIG_LCD_LD9040 is not set
+# CONFIG_LCD_AMS369FG06 is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_GENERIC=y
+# CONFIG_BACKLIGHT_ADP8860 is not set
+# CONFIG_BACKLIGHT_ADP8870 is not set
+# CONFIG_BACKLIGHT_LM3630 is not set
+# CONFIG_BACKLIGHT_LM3639 is not set
+# CONFIG_BACKLIGHT_LP855X is not set
+
+#
+# Console display driver support
+#
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
+CONFIG_FONTS=y
+# CONFIG_FONT_8x8 is not set
+CONFIG_FONT_8x16=y
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_FONT_AUTOSELECT=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+# CONFIG_SOUND is not set
+
+#
+# HID support
+#
+# CONFIG_HID is not set
+
+#
+# I2C HID support
+#
+# CONFIG_I2C_HID is not set
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+# CONFIG_MMC_CLKGATE is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+CONFIG_MMC_PXA=y
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_SDHCI_PXAV3 is not set
+# CONFIG_MMC_SDHCI_PXAV2 is not set
+# CONFIG_MMC_SPI is not set
+# CONFIG_MMC_DW is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_LM3530 is not set
+# CONFIG_LEDS_LM3642 is not set
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_PCA9633 is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+# CONFIG_LEDS_TCA6507 is not set
+# CONFIG_LEDS_LM355x is not set
+# CONFIG_LEDS_OT200 is not set
+# CONFIG_LEDS_BLINKM is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+# CONFIG_LEDS_TRIGGER_ONESHOT is not set
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_CPU is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_EDAC is not set
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
+# CONFIG_RTC_DRV_DS3232 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_ISL12022 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8523 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_BQ32K is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+# CONFIG_RTC_DRV_EM3027 is not set
+# CONFIG_RTC_DRV_RV3029C2 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T93 is not set
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
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_MSM6242 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_RP5C01 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+# CONFIG_RTC_DRV_DS2404 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_SA1100=y
+# CONFIG_RTC_DRV_PXA is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# Virtio drivers
+#
+# CONFIG_VIRTIO_MMIO is not set
+
+#
+# Microsoft Hyper-V guest support
+#
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+
+#
+# Remoteproc drivers (EXPERIMENTAL)
+#
+# CONFIG_STE_MODEM_RPROC is not set
+
+#
+# Rpmsg drivers (EXPERIMENTAL)
+#
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
+# CONFIG_EXTCON is not set
+# CONFIG_MEMORY is not set
+# CONFIG_IIO is not set
+# CONFIG_PWM is not set
+# CONFIG_IPACK_BUS is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+CONFIG_JBD2=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+# CONFIG_FILE_LOCKING is not set
+CONFIG_FSNOTIFY=y
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+CONFIG_GENERIC_ACL=y
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
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+# CONFIG_VFAT_FS_NO_DUALNAMES is not set
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES is not set
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
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
+# CONFIG_YAFFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+# CONFIG_JFFS2_FS_XATTR is not set
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_ZLIB=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RTIME=y
+CONFIG_JFFS2_RUBIN=y
+# CONFIG_JFFS2_CMODE_NONE is not set
+CONFIG_JFFS2_CMODE_PRIORITY=y
+# CONFIG_JFFS2_CMODE_SIZE is not set
+# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_QNX6FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+# CONFIG_F2FS_FS is not set
+# CONFIG_AUFS_FS is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+# CONFIG_NLS_CODEPAGE_437 is not set
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
+# CONFIG_NLS_ASCII is not set
+# CONFIG_NLS_ISO8859_1 is not set
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
+# CONFIG_NLS_MAC_ROMAN is not set
+# CONFIG_NLS_MAC_CELTIC is not set
+# CONFIG_NLS_MAC_CENTEURO is not set
+# CONFIG_NLS_MAC_CROATIAN is not set
+# CONFIG_NLS_MAC_CYRILLIC is not set
+# CONFIG_NLS_MAC_GAELIC is not set
+# CONFIG_NLS_MAC_GREEK is not set
+# CONFIG_NLS_MAC_ICELAND is not set
+# CONFIG_NLS_MAC_INUIT is not set
+# CONFIG_NLS_MAC_ROMANIAN is not set
+# CONFIG_NLS_MAC_TURKISH is not set
+# CONFIG_NLS_UTF8 is not set
+
+#
+# Kernel hacking
+#
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_READABLE_ASM is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_PANIC_ON_OOPS is not set
+CONFIG_PANIC_ON_OOPS_VALUE=0
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+CONFIG_HAVE_DEBUG_KMEMLEAK=y
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+CONFIG_FRAME_POINTER=y
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_NOTIFIER_ERROR_INJECTION is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_BRANCH_PROFILE_NONE is not set
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+# CONFIG_ARM_UNWIND is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+CONFIG_DEBUG_LL_INCLUDE="mach/debug-macro.S"
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_MANAGER2 is not set
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
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
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA1_ARM is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_AES_ARM is not set
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
+CONFIG_CRYPTO_DEFLATE=y
+# CONFIG_CRYPTO_ZLIB is not set
+CONFIG_CRYPTO_LZO=y
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
+CONFIG_GENERIC_STRNCPY_FROM_USER=y
+CONFIG_GENERIC_STRNLEN_USER=y
+CONFIG_GENERIC_PCI_IOMAP=y
+CONFIG_GENERIC_IO=y
+CONFIG_PERCPU_RWSEM=y
+# CONFIG_CRC_CCITT is not set
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC32_SELFTEST is not set
+CONFIG_CRC32_SLICEBY8=y
+# CONFIG_CRC32_SLICEBY4 is not set
+# CONFIG_CRC32_SARWATE is not set
+# CONFIG_CRC32_BIT is not set
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
+# CONFIG_AVERAGE is not set
+# CONFIG_CORDIC is not set
+# CONFIG_DDR is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-tiny.scc
new file mode 100644
index 0000000..221ed1a
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-tiny.scc
@@ -0,0 +1,11 @@
+define KMACHINE c7x0
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny/tiny.scc
+
+kconf hardware c7x0-kexecboot.cfg
+
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
+patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-kexecboot.cfg
new file mode 100644
index 0000000..1c9b325
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-kexecboot.cfg
@@ -0,0 +1,1777 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.8.13 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_NEED_MACH_GPIO_H=y
+CONFIG_NEED_MACH_MEMORY_H=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_BUILDTIME_EXTABLE_SORT=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION="-yocto-tiny"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_XZ=y
+CONFIG_HAVE_KERNEL_LZO=y
+# CONFIG_KERNEL_GZIP is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_KERNEL_XZ is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+# CONFIG_SWAP is not set
+# CONFIG_SYSVIPC is not set
+# CONFIG_FHANDLE is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_SPARSE_IRQ=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+
+#
+# Timers subsystem
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+# CONFIG_HIGH_RES_TIMERS is not set
+
+#
+# CPU/Task time and stats accounting
+#
+CONFIG_TICK_CPU_ACCOUNTING=y
+# CONFIG_BSD_PROCESS_ACCT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_CGROUPS is not set
+# CONFIG_CHECKPOINT_RESTORE is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_UIDGID_CONVERTED=y
+# CONFIG_UIDGID_STRICT_TYPE_CHECKS is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
+CONFIG_INITRAMFS_ROOT_UID=0
+CONFIG_INITRAMFS_ROOT_GID=0
+CONFIG_RD_GZIP=y
+# CONFIG_RD_BZIP2 is not set
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_INITRAMFS_COMPRESSION_NONE is not set
+# CONFIG_INITRAMFS_COMPRESSION_GZIP is not set
+CONFIG_INITRAMFS_COMPRESSION_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_HAVE_UID16=y
+# CONFIG_UPTIME_LIMITED_KERNEL is not set
+# CONFIG_UID16 is not set
+# CONFIG_SYSCTL_SYSCALL is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_HOTPLUG=y
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_BASE_FULL is not set
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+# CONFIG_PERF_EVENTS is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_JUMP_LABEL is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_HAVE_DMA_ATTRS=y
+CONFIG_HAVE_DMA_CONTIGUOUS=y
+CONFIG_GENERIC_SMP_IDLE_THREAD=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_ARCH_JUMP_LABEL=y
+CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
+CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
+CONFIG_MODULES_USE_ELF_REL=y
+CONFIG_CLONE_BACKWARDS=y
+
+#
+# GCOV-based kernel profiling
+#
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=1
+# CONFIG_MODULES is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
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
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_DEADLINE=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="deadline"
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+CONFIG_INLINE_READ_UNLOCK=y
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+CONFIG_INLINE_WRITE_UNLOCK=y
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_MULTIPLATFORM is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCM2835 is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_SIRF is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+CONFIG_ARCH_SA1100=y
+# CONFIG_ARCH_S3C24XX is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_VT8500_SINGLE is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# SA11x0 Implementations
+#
+# CONFIG_SA1100_ASSABET is not set
+# CONFIG_SA1100_CERF is not set
+CONFIG_SA1100_COLLIE=y
+# CONFIG_SA1100_H3100 is not set
+# CONFIG_SA1100_H3600 is not set
+# CONFIG_SA1100_BADGE4 is not set
+# CONFIG_SA1100_JORNADA720 is not set
+# CONFIG_SA1100_HACKKIT is not set
+# CONFIG_SA1100_LART is not set
+# CONFIG_SA1100_NANOENGINE is not set
+# CONFIG_SA1100_PLEB is not set
+# CONFIG_SA1100_SHANNON is not set
+# CONFIG_SA1100_SIMPAD is not set
+# CONFIG_SA1100_SSP is not set
+# CONFIG_ARCH_VT8500 is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_SA1100=y
+CONFIG_CPU_32v4=y
+CONFIG_CPU_ABRT_EV4=y
+CONFIG_CPU_PABRT_LEGACY=y
+CONFIG_CPU_CACHE_V4WB=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_TLB_V4WB=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+CONFIG_CPU_USE_DOMAINS=y
+
+#
+# Processor Features
+#
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+CONFIG_ARM_NR_BANKS=8
+CONFIG_SHARP_LOCOMO=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+CONFIG_ISA=y
+# CONFIG_PCI_SYSCALL is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+
+#
+# PC-card bridges
+#
+# CONFIG_I82365 is not set
+# CONFIG_TCIC is not set
+CONFIG_PCMCIA_SOC_COMMON=y
+CONFIG_PCMCIA_SA11XX_BASE=y
+CONFIG_PCMCIA_SA1100=y
+# CONFIG_PCMCIA_DEBUG is not set
+
+#
+# Kernel Features
+#
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_ARCH_NR_GPIO=0
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ARCH_SPARSEMEM_ENABLE=y
+CONFIG_ARCH_SPARSEMEM_DEFAULT=y
+CONFIG_ARCH_SELECT_MEMORY_MODEL=y
+# CONFIG_HAVE_ARCH_PFN_VALID is not set
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_SPARSEMEM_MANUAL=y
+CONFIG_SPARSEMEM=y
+CONFIG_HAVE_MEMORY_PRESENT=y
+CONFIG_SPARSEMEM_EXTREME=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_SPLIT_PTLOCK_CPUS=999999
+# CONFIG_COMPACTION is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ATAGS=y
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M loglevel=3"
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
+# CONFIG_CMDLINE_EXTEND is not set
+# CONFIG_CMDLINE_FORCE is not set
+# CONFIG_XIP_KERNEL is not set
+CONFIG_KEXEC=y
+CONFIG_ATAGS_PROC=y
+# CONFIG_CRASH_DUMP is not set
+# CONFIG_AUTO_ZRELADDR is not set
+
+#
+# CPU Power Management
+#
+
+#
+# CPU Frequency scaling
+#
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_TABLE=y
+CONFIG_CPU_FREQ_STAT=y
+# CONFIG_CPU_FREQ_STAT_DETAILS is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
+# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
+# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
+# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
+
+#
+# ARM CPU frequency scaling drivers
+#
+# CONFIG_ARM_EXYNOS4210_CPUFREQ is not set
+# CONFIG_ARM_EXYNOS4X12_CPUFREQ is not set
+# CONFIG_ARM_EXYNOS5250_CPUFREQ is not set
+# CONFIG_CPU_IDLE is not set
+# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
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
+CONFIG_BINFMT_ELF=y
+CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+# CONFIG_COREDUMP is not set
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+# CONFIG_PM_AUTOSLEEP is not set
+# CONFIG_PM_WAKELOCKS is not set
+# CONFIG_PM_RUNTIME is not set
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+# CONFIG_NET is not set
+CONFIG_HAVE_BPF_JIT=y
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_GENERIC_CPU_DEVICES is not set
+# CONFIG_DMA_SHARED_BUFFER is not set
+# CONFIG_CMA is not set
+
+#
+# Bus devices
+#
+CONFIG_MTD=y
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
+# CONFIG_SM_FTL is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_CFI=y
+CONFIG_MTD_JEDECPROBE=y
+CONFIG_MTD_GEN_PROBE=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_NOSWAP=y
+# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
+# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
+CONFIG_MTD_CFI_GEOMETRY=y
+# CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+# CONFIG_MTD_CFI_I1 is not set
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+# CONFIG_MTD_OTP is not set
+CONFIG_MTD_CFI_INTELEXT=y
+# CONFIG_MTD_CFI_AMDSTD is not set
+# CONFIG_MTD_CFI_STAA is not set
+CONFIG_MTD_CFI_UTIL=y
+# CONFIG_MTD_RAM is not set
+CONFIG_MTD_ROM=y
+# CONFIG_MTD_ABSENT is not set
+# CONFIG_MTD_XIP is not set
+
+#
+# Mapping drivers for chip access
+#
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+# CONFIG_MTD_PHYSMAP_COMPAT is not set
+CONFIG_MTD_SA1100=y
+# CONFIG_MTD_IMPA7 is not set
+# CONFIG_MTD_PCMCIA is not set
+# CONFIG_MTD_GPIO_ADDR is not set
+# CONFIG_MTD_PLATRAM is not set
+# CONFIG_MTD_LATCH_ADDR is not set
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
+# CONFIG_MTD_DOCG3 is not set
+CONFIG_MTD_NAND_ECC=y
+# CONFIG_MTD_NAND_ECC_SMC is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_DENALI is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_DOCG4 is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_LIMIT=20
+# CONFIG_MTD_UBI_FASTMAP is not set
+# CONFIG_MTD_UBI_GLUEBI is not set
+# CONFIG_PARPORT is not set
+# CONFIG_PNP is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS or INET not selected
+#
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_MG_DISK is not set
+
+#
+# Misc devices
+#
+# CONFIG_SENSORS_LIS3LV02D is not set
+# CONFIG_AD525X_DPOT is not set
+# CONFIG_ATMEL_PWM is not set
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_APDS9802ALS is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_ISL29020 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_SENSORS_BH1780 is not set
+# CONFIG_SENSORS_BH1770 is not set
+# CONFIG_SENSORS_APDS990X is not set
+# CONFIG_HMC6352 is not set
+# CONFIG_DS1682 is not set
+# CONFIG_TI_DAC7512 is not set
+# CONFIG_BMP085_I2C is not set
+# CONFIG_BMP085_SPI is not set
+# CONFIG_USB_SWITCH_FSA9480 is not set
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
+# CONFIG_EEPROM_93XX46 is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_SENSORS_LIS3_I2C is not set
+
+#
+# Altera FPGA firmware download module
+#
+# CONFIG_ALTERA_STAPL is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
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
+# CONFIG_SCSI_MULTI_LUN is not set
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_SAS_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_SCSI_AHA152X is not set
+# CONFIG_SCSI_AIC7XXX_OLD is not set
+# CONFIG_SCSI_ADVANSYS is not set
+# CONFIG_SCSI_IN2000 is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DTC3280 is not set
+# CONFIG_SCSI_FUTURE_DOMAIN is not set
+# CONFIG_SCSI_GENERIC_NCR5380 is not set
+# CONFIG_SCSI_GENERIC_NCR5380_MMIO is not set
+# CONFIG_SCSI_NCR53C406A is not set
+# CONFIG_SCSI_PAS16 is not set
+# CONFIG_SCSI_QLOGIC_FAS is not set
+# CONFIG_SCSI_SYM53C416 is not set
+# CONFIG_SCSI_T128 is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+
+#
+# Controllers with non-SFF native interface
+#
+# CONFIG_SATA_AHCI_PLATFORM is not set
+CONFIG_ATA_SFF=y
+
+#
+# SFF controllers with custom DMA interface
+#
+CONFIG_ATA_BMDMA=y
+
+#
+# SATA SFF controllers with BMDMA
+#
+# CONFIG_SATA_HIGHBANK is not set
+# CONFIG_SATA_MV is not set
+
+#
+# PATA SFF controllers with BMDMA
+#
+
+#
+# PIO-only SFF controllers
+#
+CONFIG_PATA_PCMCIA=y
+# CONFIG_PATA_PLATFORM is not set
+# CONFIG_PATA_QDI is not set
+# CONFIG_PATA_WINBOND_VLB is not set
+
+#
+# Generic fallback / legacy drivers
+#
+# CONFIG_PATA_LEGACY is not set
+# CONFIG_MD is not set
+# CONFIG_TARGET_CORE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
+# CONFIG_INPUT_MATRIXKMAP is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=240
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=320
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+CONFIG_INPUT_APMPOWER=y
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+# CONFIG_KEYBOARD_ADP5589 is not set
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_QT1070 is not set
+# CONFIG_KEYBOARD_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_GPIO is not set
+# CONFIG_KEYBOARD_TCA6416 is not set
+# CONFIG_KEYBOARD_TCA8418 is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_LM8333 is not set
+CONFIG_KEYBOARD_LOCOMO=y
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_SAMSUNG is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
+# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_ILI210X is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MMS114 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_HTCPEN is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_PIXCIR is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
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
+CONFIG_VT_CONSOLE_SLEEP=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_TRACE_SINK is not set
+# CONFIG_DEVKMEM is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX310X is not set
+CONFIG_SERIAL_SA1100=y
+CONFIG_SERIAL_SA1100_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_SCCNXP is not set
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_ARC is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_DTLK is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_DEVPORT=y
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_COMPAT is not set
+# CONFIG_I2C_CHARDEV is not set
+# CONFIG_I2C_MUX is not set
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_CBUS_GPIO is not set
+# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_PXA_PCI is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_ELEKTOR is not set
+# CONFIG_I2C_PCA_ISA is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_ALTERA is not set
+CONFIG_SPI_BITBANG=y
+CONFIG_SPI_GPIO=y
+# CONFIG_SPI_OC_TINY is not set
+# CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_SC18IS602 is not set
+# CONFIG_SPI_XCOMM is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_HSI is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+
+#
+# PPS generators support
+#
+
+#
+# PTP clock support
+#
+# CONFIG_PTP_1588_CLOCK is not set
+
+#
+# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
+#
+# CONFIG_PTP_1588_CLOCK_PCH is not set
+CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+# CONFIG_GPIO_SYSFS is not set
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_EM is not set
+# CONFIG_GPIO_TS5500 is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_SX150X is not set
+# CONFIG_GPIO_ADP5588 is not set
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
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+
+#
+# USB GPIO expanders:
+#
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2781 is not set
+# CONFIG_BATTERY_DS2782 is not set
+CONFIG_BATTERY_COLLIE=y
+# CONFIG_BATTERY_SBS is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_LP8727 is not set
+# CONFIG_CHARGER_GPIO is not set
+# CONFIG_CHARGER_BQ2415X is not set
+# CONFIG_CHARGER_SMB347 is not set
+# CONFIG_POWER_RESET is not set
+# CONFIG_POWER_AVS is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_BCMA_POSSIBLE=y
+
+#
+# Broadcom specific AMBA
+#
+# CONFIG_BCMA is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_88PM800 is not set
+# CONFIG_MFD_88PM805 is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_MFD_TI_AM335X_TSCADC is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_MFD_LM3533 is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS65217 is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_MFD_TPS80031 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_TWL6040_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_SMSC is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_DA9052_SPI is not set
+# CONFIG_MFD_DA9052_I2C is not set
+# CONFIG_MFD_DA9055 is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_LP8788 is not set
+# CONFIG_MFD_MAX77686 is not set
+# CONFIG_MFD_MAX77693 is not set
+# CONFIG_MFD_MAX8907 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_SEC_CORE is not set
+# CONFIG_MFD_ARIZONA_I2C is not set
+# CONFIG_MFD_ARIZONA_SPI is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX_SPI is not set
+# CONFIG_MFD_MC13XXX_I2C is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_TPS65090 is not set
+# CONFIG_MFD_AAT2870_CORE is not set
+# CONFIG_MFD_RC5T583 is not set
+# CONFIG_MFD_PALMAS is not set
+# CONFIG_MFD_RETU is not set
+# CONFIG_MFD_AS3711 is not set
+
+#
+# Multimedia Capabilities Port drivers
+#
+CONFIG_MCP=y
+CONFIG_MCP_SA11X0=y
+CONFIG_MCP_UCB1200=y
+CONFIG_MCP_UCB1200_TS=y
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_DRM is not set
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
+# CONFIG_FB_WMT_GE_ROPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+CONFIG_FB_SA1100=y
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_AUO_K190X is not set
+# CONFIG_EXYNOS_VIDEO is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_ILI9320 is not set
+# CONFIG_LCD_TDO24M is not set
+# CONFIG_LCD_VGG2432A4 is not set
+# CONFIG_LCD_PLATFORM is not set
+# CONFIG_LCD_S6E63M0 is not set
+# CONFIG_LCD_LD9040 is not set
+# CONFIG_LCD_AMS369FG06 is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_BACKLIGHT_LOCOMO=y
+# CONFIG_BACKLIGHT_ADP8860 is not set
+# CONFIG_BACKLIGHT_ADP8870 is not set
+# CONFIG_BACKLIGHT_LM3630 is not set
+# CONFIG_BACKLIGHT_LM3639 is not set
+# CONFIG_BACKLIGHT_LP855X is not set
+
+#
+# Console display driver support
+#
+# CONFIG_MDA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+# CONFIG_SOUND is not set
+
+#
+# HID support
+#
+# CONFIG_HID is not set
+
+#
+# I2C HID support
+#
+# CONFIG_I2C_HID is not set
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+# CONFIG_MMC_CLKGATE is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_SDHCI_PXAV3 is not set
+# CONFIG_MMC_SDHCI_PXAV2 is not set
+CONFIG_MMC_SPI=y
+# CONFIG_MMC_DW is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_LM3530 is not set
+# CONFIG_LEDS_LM3642 is not set
+CONFIG_LEDS_LOCOMO=y
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_PCA9633 is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+# CONFIG_LEDS_TCA6507 is not set
+# CONFIG_LEDS_LM355x is not set
+# CONFIG_LEDS_OT200 is not set
+# CONFIG_LEDS_BLINKM is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+# CONFIG_LEDS_TRIGGER_ONESHOT is not set
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_CPU is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_EDAC is not set
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
+# CONFIG_RTC_DRV_DS3232 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_ISL12022 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8523 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_BQ32K is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+# CONFIG_RTC_DRV_EM3027 is not set
+# CONFIG_RTC_DRV_RV3029C2 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T93 is not set
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
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_MSM6242 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_RP5C01 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+# CONFIG_RTC_DRV_DS2404 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_SA1100=y
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# Virtio drivers
+#
+# CONFIG_VIRTIO_MMIO is not set
+
+#
+# Microsoft Hyper-V guest support
+#
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+
+#
+# Remoteproc drivers (EXPERIMENTAL)
+#
+# CONFIG_STE_MODEM_RPROC is not set
+
+#
+# Rpmsg drivers (EXPERIMENTAL)
+#
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
+# CONFIG_EXTCON is not set
+# CONFIG_MEMORY is not set
+# CONFIG_IIO is not set
+# CONFIG_PWM is not set
+# CONFIG_IPACK_BUS is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+CONFIG_JBD2=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+# CONFIG_FILE_LOCKING is not set
+CONFIG_FSNOTIFY=y
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+CONFIG_GENERIC_ACL=y
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
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+# CONFIG_VFAT_FS_NO_DUALNAMES is not set
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES is not set
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
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
+# CONFIG_YAFFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+# CONFIG_JFFS2_FS_XATTR is not set
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_ZLIB=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RTIME=y
+CONFIG_JFFS2_RUBIN=y
+# CONFIG_JFFS2_CMODE_NONE is not set
+CONFIG_JFFS2_CMODE_PRIORITY=y
+# CONFIG_JFFS2_CMODE_SIZE is not set
+# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_QNX6FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+# CONFIG_F2FS_FS is not set
+# CONFIG_AUFS_FS is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+# CONFIG_NLS_CODEPAGE_437 is not set
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
+# CONFIG_NLS_ASCII is not set
+# CONFIG_NLS_ISO8859_1 is not set
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
+# CONFIG_NLS_MAC_ROMAN is not set
+# CONFIG_NLS_MAC_CELTIC is not set
+# CONFIG_NLS_MAC_CENTEURO is not set
+# CONFIG_NLS_MAC_CROATIAN is not set
+# CONFIG_NLS_MAC_CYRILLIC is not set
+# CONFIG_NLS_MAC_GAELIC is not set
+# CONFIG_NLS_MAC_GREEK is not set
+# CONFIG_NLS_MAC_ICELAND is not set
+# CONFIG_NLS_MAC_INUIT is not set
+# CONFIG_NLS_MAC_ROMANIAN is not set
+# CONFIG_NLS_MAC_TURKISH is not set
+# CONFIG_NLS_UTF8 is not set
+
+#
+# Kernel hacking
+#
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_READABLE_ASM is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_PANIC_ON_OOPS is not set
+CONFIG_PANIC_ON_OOPS_VALUE=0
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+CONFIG_HAVE_DEBUG_KMEMLEAK=y
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+CONFIG_FRAME_POINTER=y
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_NOTIFIER_ERROR_INJECTION is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_BRANCH_PROFILE_NONE is not set
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+# CONFIG_ARM_UNWIND is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+CONFIG_DEBUG_LL_INCLUDE="mach/debug-macro.S"
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_MANAGER2 is not set
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
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
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA1_ARM is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_AES_ARM is not set
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
+CONFIG_CRYPTO_DEFLATE=y
+# CONFIG_CRYPTO_ZLIB is not set
+CONFIG_CRYPTO_LZO=y
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
+CONFIG_GENERIC_STRNCPY_FROM_USER=y
+CONFIG_GENERIC_STRNLEN_USER=y
+CONFIG_GENERIC_PCI_IOMAP=y
+CONFIG_GENERIC_IO=y
+CONFIG_PERCPU_RWSEM=y
+# CONFIG_CRC_CCITT is not set
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC32=y
+# CONFIG_CRC32_SELFTEST is not set
+CONFIG_CRC32_SLICEBY8=y
+# CONFIG_CRC32_SLICEBY4 is not set
+# CONFIG_CRC32_SARWATE is not set
+# CONFIG_CRC32_BIT is not set
+CONFIG_CRC7=y
+# CONFIG_LIBCRC32C is not set
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
+# CONFIG_AVERAGE is not set
+# CONFIG_CORDIC is not set
+# CONFIG_DDR is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-tiny.scc
new file mode 100644
index 0000000..44ff359
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-tiny.scc
@@ -0,0 +1,13 @@
+define KMACHINE collie
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny/tiny.scc
+
+kconf hardware collie-kexecboot.cfg
+
+patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
+patch ../patches/patches-mfd/mcp-device.patch
+patch ../patches/patches-mtd/collie-jedec-probe.patch
+patch ../patches/patches-mtd/collie-eraseinfo.patch
+patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/feature-top.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/feature-top.scc
new file mode 100644
index 0000000..fdffa2a
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/feature-top.scc
@@ -0,0 +1 @@
+# placeholder
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
new file mode 100644
index 0000000..0ba313a
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
@@ -0,0 +1,78 @@
+From e60a4a9a3336a24a8e6ca3ea69587c60cb953881 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sat, 21 Apr 2012 23:48:57 +0200
+Subject: [PATCH 43/43] locomokbd: apply tweaks for Zaurus
+
+* from http://www.rpsys.net/openzaurus/patches/
+
+Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+[Patch needed for initramfs w/out keymaps like kexecboot]
+
+diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
+index c94d610..2b978c8 100644
+--- a/drivers/input/keyboard/locomokbd.c
++++ b/drivers/input/keyboard/locomokbd.c
+@@ -39,27 +39,33 @@ MODULE_AUTHOR("John Lenz <lenz@cs.wisc.edu>");
+ MODULE_DESCRIPTION("LoCoMo keyboard driver");
+ MODULE_LICENSE("GPL");
+ 
+-#define LOCOMOKBD_NUMKEYS	128
+-
+-#define KEY_ACTIVITY		KEY_F16
+-#define KEY_CONTACT		KEY_F18
+-#define KEY_CENTER		KEY_F15
++#define LOCOMOKBD_NUMKEYS		128
++
++#define LOCOMO_KEY_CALENDER	KEY_LEFTCTRL
++#define LOCOMO_KEY_ADDRESS	KEY_LEFTALT	/* Needed for SysRQ */
++#define LOCOMO_KEY_HOME		KEY_SYSRQ	/* Needed for SysRQ */
++#define LOCOMO_KEY_MENU		KEY_F12
++#define LOCOMO_KEY_MAIL		KEY_F10
++#define LOCOMO_KEY_OK		KEY_F11		/* Don't hardwire to KEY_RETURN */
++#define LOCOMO_KEY_CANCEL	KEY_POWER
++#define LOCOMO_KEY_CENTER	KEY_F5		/* Don't hardwire to KEY_RETURN */
++#define LOCOMO_KEY_FN		KEY_F9
+ 
+ static const unsigned char
+ locomokbd_keycode[LOCOMOKBD_NUMKEYS] = {
+-	0, KEY_ESC, KEY_ACTIVITY, 0, 0, 0, 0, 0, 0, 0,				/* 0 - 9 */
+-	0, 0, 0, 0, 0, 0, 0, KEY_MENU, KEY_HOME, KEY_CONTACT,			/* 10 - 19 */
+-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,						/* 20 - 29 */
+-	0, 0, 0, KEY_CENTER, 0, KEY_MAIL, 0, 0, 0, 0,				/* 30 - 39 */
+-	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,					/* 40 - 49 */
+-	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,		/* 50 - 59 */
+-	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, KEY_ENTER, 0, 0,			/* 60 - 69 */
+-	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,	/* 70 - 79 */
+-	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,		/* 80 - 89 */
+-	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,				/* 90 - 99 */
+-	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,		/* 100 - 109 */
+-	KEY_LEFTSHIFT, KEY_TAB, KEY_LEFTCTRL, 0, 0, 0, 0, 0, 0, 0,		/* 110 - 119 */
+-	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0		/* 120 - 128 */
++	0, LOCOMO_KEY_CANCEL, LOCOMO_KEY_CALENDER, LOCOMO_KEY_HOME, 0, 0, 0, 0, 0, 0,	/* 0 - 9 */
++	0, 0, 0, 0, 0, 0, 0, LOCOMO_KEY_MENU, 0, LOCOMO_KEY_ADDRESS,			/* 10 - 19 */
++	0, 0, 0, 0, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,					/* 20 - 29 */
++	0, 0, 0, LOCOMO_KEY_CENTER, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,			/* 30 - 39 */
++	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,						/* 40 - 49 */
++	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,			/* 50 - 59 */
++	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, LOCOMO_KEY_OK, 0, 0,			/* 60 - 69 */
++	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,		/* 70 - 79 */
++	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,			/* 80 - 89 */
++	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,					/* 90 - 99 */
++	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,			/* 100 - 109 */
++	KEY_LEFTSHIFT, KEY_TAB, LOCOMO_KEY_FN, 0, 0, 0, 0, 0, 0, 0,			/* 110 - 119 */
++	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0			/* 120 - 128 */
+ };
+ 
+ #define KB_ROWS			16
+@@ -68,7 +74,7 @@ locomokbd_keycode[LOCOMOKBD_NUMKEYS] = {
+ #define SCANCODE(c,r)		( ((c)<<4) + (r) + 1 )
+ 
+ #define KB_DELAY		8
+-#define SCAN_INTERVAL		(HZ/10)
++#define SCAN_INTERVAL		(HZ/20)
+ 
+ struct locomokbd {
+ 	unsigned char keycode[LOCOMOKBD_NUMKEYS];
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/mcp-device.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/mcp-device.patch
new file mode 100644
index 0000000..9769b2d
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/mcp-device.patch
@@ -0,0 +1,48 @@
+Initial try to fix compilation error
+
+linux/include/linux/mfd/mcp.h:22:16: error: field 'attached_device' has incomplete type
+linux/include/linux/mfd/mcp.h:48:23: error: field 'drv' has incomplete type
+linux/include/linux/mfd/ucb1x00.h:137:17: error: field 'dev' has incomplete type
+linux/drivers/power/collie_battery.c:290:56: error: unknown type name 'pm_message_t'
+linux/drivers/power/collie_battery.c:371:13: error: 'collie_bat_suspend' undeclared here (not in a function)
+| make[4]: *** [drivers/power/collie_battery.o] Error 1
+| make[3]: *** [drivers/power] Error 2
+
+Patch should be refactored following Anton's suggestions.
+"Generally, we don't depend on indirect inclusions. But if it doesn't harm
+anyhow so far, we may not bother with this."
+
+Here the suggestion:
+
+Things are a bit more complex...
+* linux/include/linux/mfd/mcp.h:22:16: error: field 'attached_device' has incomplete type
+
+You have to add #include <linux/device.h> into mfd/mcp.h. This will add
+struct device and...
+
+* linux/include/linux/mfd/mcp.h:48:23: error: field 'drv' has incomplete type
+ struct device_driver.
+
+* linux/include/linux/mfd/ucb1x00.h:137:17: error: field 'dev' has incomplete type
+Same here, the file ucb1x00.h needs #include <linux/device.h>.
+
+* linux/drivers/power/collie_battery.c:290:56: error: unknown type name 'pm_message_t'
+#include <linux/pm.h> into collie_battery.c
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Upstream-Status: Pending
+
+--- a/include/linux/mfd/mcp.h	2013-02-18 00:14:09.000000000 +0100
++++ b/include/linux/mfd/mcp.h	2013-02-17 23:55:52.000000000 +0100
+@@ -10,6 +10,8 @@
+ #ifndef MCP_H
+ #define MCP_H
+ 
++#include <linux/device.h>
++
+ struct mcp_ops;
+ 
+ struct mcp {
+
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-eraseinfo.patch
new file mode 100644
index 0000000..b5f9916
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-eraseinfo.patch
@@ -0,0 +1,42 @@
+* Zaurus 5500 contains 2 LH28F640BFHE-PTTL90 (64M 4Mx16) and
+* the LH28F640BFHE-PTTL90.pdf datasheet available on the net shows
+* the exact erasesize and the OTP support.
+* At the moment only jedec_probe can discover the chip and
+* the NOR is mounted read only probably because of wrong vpp
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Upstream-Status: Submitted
+http://lists.infradead.org/pipermail/linux-mtd/2013-February/045781.html
+
+--- a/drivers/mtd/chips/jedec_probe.c
++++ b/drivers/mtd/chips/jedec_probe.c
+@@ -120,7 +120,7 @@
+ #define PM49FL008	0x006A
+ 
+ /* Sharp */
+-#define LH28F640BF	0x00b0
++#define LH28F640BF	0x00B0
+ 
+ /* ST - www.st.com */
+ #define M29F800AB	0x0058
+@@ -1299,13 +1299,14 @@
+ 		.mfr_id		= CFI_MFR_SHARP,
+ 		.dev_id		= LH28F640BF,
+ 		.name		= "LH28F640BF",
+-		.devtypes	= CFI_DEVICETYPE_X8,
++		.devtypes	= CFI_DEVICETYPE_X16,
+ 		.uaddr		= MTD_UADDR_UNNECESSARY,
+-		.dev_size	= SIZE_4MiB,
+-		.cmd_set	= P_ID_INTEL_STD,
+-		.nr_regions	= 1,
++		.dev_size	= SIZE_8MiB,
++		.cmd_set	= P_ID_INTEL_EXT,
++		.nr_regions	= 2,
+ 		.regions	= {
+-			ERASEINFO(0x40000,16),
++			ERASEINFO(0x10000, 127),
++			ERASEINFO(0x02000, 8),
+ 		}
+ 	}, {
+ 		.mfr_id		= CFI_MFR_SST,
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-jedec-probe.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-jedec-probe.patch
new file mode 100644
index 0000000..64f58ce
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-jedec-probe.patch
@@ -0,0 +1,22 @@
+* Zaurus 5500 contains 2 LH28F640BFHE-PTTL90 (64M 4Mx16) and
+* the LH28F640BFHE-PTTL90.pdf datasheet available on the net shows
+* the exact erasesize and the OTP support.
+* At the moment only jedec_probe can discover the chip and
+* the NOR is mounted read only probably because of wrong vpp
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Upstream-Status: Submitted
+http://lists.infradead.org/pipermail/linux-mtd/2013-February/045781.html
+
+--- a/arch/arm/mach-sa1100/collie.c
++++ b/arch/arm/mach-sa1100/collie.c
+@@ -289,7 +289,7 @@
+ }
+ 
+ static struct flash_platform_data collie_flash_data = {
+-	.map_name	= "cfi_probe",
++	.map_name	= "jedec_probe",
+ 	.init		= collie_flash_init,
+ 	.set_vpp	= collie_set_vpp,
+ 	.exit		= collie_flash_exit,
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
new file mode 100644
index 0000000..d878ea1
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
@@ -0,0 +1,32 @@
+From fcee0050f8ce5296e8007ed7ed17d98f334a8f38 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Fri, 23 Nov 2012 23:07:20 +0100
+Subject: [PATCH] ARM: pxa: pxa27x.c: add dummy SA1100 rtc clock
+
+* Using pxa27x you could now build both RTC_DRV_PXA and RTC_DRV_SA1100.
+* Make sure you don't use both together: link /dev/rtc0 or /dev/rtc1
+* to /dev/rtc according to your requirement.
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
+Signed-off-by: Haojian Zhuang <haojian.zhuang@gmail.com>
+
+Upstream-Status: Accepted
+Committed in v3.9-rc1 with commit id
+495b21dc0e488b784ab1d4007d00db1ca2a95c98
+---
+ arch/arm/mach-pxa/pxa27x.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
+index 8047ee0..5970ebc 100644
+--- a/arch/arm/mach-pxa/pxa27x.c
++++ b/arch/arm/mach-pxa/pxa27x.c
+@@ -230,6 +230,7 @@ static struct clk_lookup pxa27x_clkregs[] = {
+ 	INIT_CLKREG(&clk_pxa27x_memc, NULL, "MEMCLK"),
+ 	INIT_CLKREG(&clk_pxa27x_mem, "pxa2xx-pcmcia", NULL),
+ 	INIT_CLKREG(&clk_dummy, "pxa-gpio", NULL),
++	INIT_CLKREG(&clk_dummy, "sa1100-rtc", NULL),
+ };
+ 
+ #ifdef CONFIG_PM
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxamci-regulator.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxamci-regulator.patch
new file mode 100644
index 0000000..daf086a
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxamci-regulator.patch
@@ -0,0 +1,138 @@
+From: Marko Katic <dromede.gmail.com>
+
+Here's an interesting scenario. The spitz machine has an
+Intersil 6271A voltage regulator and an ADS7846 touchscreen
+controller.
+
+The ADS7846 driver _requires_ the use of a voltage regulator
+or if not present, CONFIG_REGULATOR_DUMMY should be used for proper operation.
+This was made mandatory by the following commit:
+
+========================================
+91143379b01b2020d8878d627ebe9dfb9d6eb4c8
+Input: ads7846 - add regulator support
+
+The ADS7846/TSC2046 touchscreen controllers can (and usually are)
+connected to various regulators for power, so add regulator support.
+
+Valid regulator will now be required, so boards without complete
+regulator setup should either disable regulator framework or enable
+CONFIG_REGULATOR_DUMMY.
+========================================
+
+The ADS7846 in spitz machines is not connected to
+any power regulator so it needs CONFIG_REGULATOR_DUMMY enabled.
+So to support both the Intersil 6271A regulator and
+the ADS7846 controller, CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY have
+to be defined.
+
+However, enabling CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY
+will break pxamci driver and cause the following error output:
+
+pxa2xx-mci.0 supply vmmc not found, using dummy regulator
+pxa2xx-mci pxa2xx-mci.0: ocr_mask/setpower will not be used
+pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
+pxa2xx-mci pxa2xx-mci.0: unable to set power
+pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
+pxa2xx-mci pxa2xx-mci.0: unable to set power
+
+Above failures occur in two functions;
+pxamci_init_ocr() and pxamci_set_power().
+
+Regulator support in pxamci_init_ocr() is not
+written with the existence of the dummy regulator driver in
+mind. It does not check the return value of mmc_regulator_get_ocrmask()
+and it will only fall back to platform data if no regulator was found.
+
+pxamci_set_power() fails because it does not even try to fall back
+to platform data if mmc_regulator_set_ocr() fails. It
+expects a proper regulator or no regulator at all. It will
+only fall back to platform data if no regulator was found. It does
+not properly handle the possible existence of the dummy regulator.
+
+This patch refactors pxamci_init_ocr() and  pxamci_set_power() regulator
+support to be more modular, to do more checks and to always fall back
+to platform data.
+
+Signed-off-by: Marko Katic <dromede@gmail.com>
+
+Upstream-Status: Submitted
+https://patchwork.kernel.org/patch/1875561/
+---
+ drivers/mmc/host/pxamci.c |   37 ++++++++++++++++++++++++-------------
+ 1 file changed, 24 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
+index 2b2f65a..6ec1566 100644
+--- a/drivers/mmc/host/pxamci.c
++++ b/drivers/mmc/host/pxamci.c
+@@ -83,18 +83,24 @@ struct pxamci_host {
+ static inline void pxamci_init_ocr(struct pxamci_host *host)
+ {
+ #ifdef CONFIG_REGULATOR
++	int ocr_mask;
+ 	host->vcc = regulator_get(mmc_dev(host->mmc), "vmmc");
+ 
+ 	if (IS_ERR(host->vcc))
+ 		host->vcc = NULL;
+ 	else {
+-		host->mmc->ocr_avail = mmc_regulator_get_ocrmask(host->vcc);
+-		if (host->pdata && host->pdata->ocr_mask)
++		ocr_mask = mmc_regulator_get_ocrmask(host->vcc);
++		if (ocr_mask <= 0)
++			host->mmc->ocr_avail = 0;
++		else
++			host->mmc->ocr_avail = ocr_mask;
++
++		if (host->pdata && host->pdata->ocr_mask && host->mmc->ocr_avail)
+ 			dev_warn(mmc_dev(host->mmc),
+ 				"ocr_mask/setpower will not be used\n");
+ 	}
+ #endif
+-	if (host->vcc == NULL) {
++	if (host->vcc == NULL || host->mmc->ocr_avail == 0) {
+ 		/* fall-back to platform data */
+ 		host->mmc->ocr_avail = host->pdata ?
+ 			host->pdata->ocr_mask :
+@@ -108,26 +114,31 @@ static inline int pxamci_set_power(struct pxamci_host *host,
+ {
+ 	int on;
+ 
++#ifdef CONFIG_REGULATOR
+ 	if (host->vcc) {
+-		int ret;
++		int ret = 0;
+ 
+-		if (power_mode == MMC_POWER_UP) {
++		if (power_mode == MMC_POWER_UP)
+ 			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, vdd);
+-			if (ret)
+-				return ret;
+-		} else if (power_mode == MMC_POWER_OFF) {
++
++		if (power_mode == MMC_POWER_OFF)
+ 			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, 0);
+-			if (ret)
+-				return ret;
+-		}
++
++		if (ret == 0)
++			return 0;
++		else
++			dev_warn(mmc_dev(host->mmc),
++			 "mmc_regulator_set_ocr failed, falling back to platform data\n");
+ 	}
+-	if (!host->vcc && host->pdata &&
++#endif
++
++	if (host->pdata &&
+ 	    gpio_is_valid(host->pdata->gpio_power)) {
+ 		on = ((1 << vdd) & host->pdata->ocr_mask);
+ 		gpio_set_value(host->pdata->gpio_power,
+ 			       !!on ^ host->pdata->gpio_power_invert);
+ 	}
+-	if (!host->vcc && host->pdata && host->pdata->setpower)
++	if (host->pdata && host->pdata->setpower)
+ 		host->pdata->setpower(mmc_dev(host->mmc), vdd);
+ 
+ 	return 0;
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/sharpsl_param.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/sharpsl_param.patch
new file mode 100644
index 0000000..720a87c
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/sharpsl_param.patch
@@ -0,0 +1,38 @@
+* Unbreak kernel boot (tested with kexecboot)
+* Patch was sent twice upstrream:
+* http://lists.infradead.org/pipermail/linux-arm-kernel/2012-December/137284.html
+*
+* Devices that call sharpsl_save_param() will hang on boot due to
+* a memcpy call that uses a physical address that is no longer
+* accessible. Fix this by converting the physical address into a virtual one.
+
+Signed-off-by: Marko Katic <dromede.gmail.com>
+
+Upstream-Status: Submitted
+https://patchwork.kernel.org/patch/1818681/
+---
+ arch/arm/common/sharpsl_param.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/common/sharpsl_param.c b/arch/arm/common/sharpsl_param.c
+index d56c932..b70b13a 100644
+--- a/arch/arm/common/sharpsl_param.c
++++ b/arch/arm/common/sharpsl_param.c
+@@ -14,6 +14,7 @@
+ #include <linux/kernel.h>
+ #include <linux/module.h>
+ #include <linux/string.h>
++#include <asm/memory.h>
+ #include <asm/mach/sharpsl_param.h>
+ 
+ /*
+@@ -41,7 +42,8 @@ EXPORT_SYMBOL(sharpsl_param);
+ 
+ void sharpsl_save_param(void)
+ {
+-	memcpy(&sharpsl_param, (void *)PARAM_BASE, sizeof(struct sharpsl_param_info));
++	void * param_start = phys_to_virt(PARAM_BASE);
++	memcpy(&sharpsl_param, param_start, sizeof(struct sharpsl_param_info));
+ 
+ 	if (sharpsl_param.comadj_keyword != COMADJ_MAGIC)
+ 		sharpsl_param.comadj=-1;
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/revert-check-on-console-device.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/revert-check-on-console-device.patch
new file mode 100644
index 0000000..b8b699d
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/revert-check-on-console-device.patch
@@ -0,0 +1,41 @@
+From 2f55386ae2eccfa8628dd2ca26d8f33acc72cd7c Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Fri, 20 Apr 2012 00:28:21 +0200
+Subject: [PATCH 41/41] main.c: revert check on console device
+
+* we can have empty /dev, 
+* in case of initramfs devtmpfs must be mounted by hand
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ init/main.c |    7 -------
+ 1 files changed, 0 insertions(+), 7 deletions(-)
+
+diff --git a/init/main.c b/init/main.c
+index cb9d3dc..217ed23 100644
+--- a/init/main.c
++++ b/init/main.c
+@@ -794,7 +794,6 @@ static noinline int init_post(void)
+ 
+ static int __init kernel_init(void * unused)
+ {
+-	struct stat console_stat;
+ 	/*
+ 	 * Wait until kthreadd is all set-up.
+ 	 */
+@@ -820,12 +819,6 @@ static int __init kernel_init(void * unused)
+ 
+ 	do_basic_setup();
+ 
+-	/* Use /dev/console to infer if the rootfs is setup properly */
+-	if (sys_newlstat((char __user *) "/dev/console", (struct stat __user *) &console_stat)
+-			|| !S_ISCHR(console_stat.st_mode)) {
+-		panic("/dev/console is missing or not a character device!\nPlease ensure your rootfs is properly configured\n");
+-	}
+-
+ 	/* Open the /dev/console on the rootfs, this should never fail */
+ 	if (sys_open((const char __user *) "/dev/console", O_RDWR, 0) < 0)
+ 		printk(KERN_WARNING "Warning: unable to open an initial console.\n");
+-- 
+1.7.3.4
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-kexecboot.cfg
new file mode 100644
index 0000000..cfb0a5d
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-kexecboot.cfg
@@ -0,0 +1,1775 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.8.13 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_NEED_MACH_GPIO_H=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_BUILDTIME_EXTABLE_SORT=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION="-yocto-tiny"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_XZ=y
+CONFIG_HAVE_KERNEL_LZO=y
+# CONFIG_KERNEL_GZIP is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_KERNEL_XZ is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+# CONFIG_SWAP is not set
+# CONFIG_SYSVIPC is not set
+# CONFIG_FHANDLE is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_SPARSE_IRQ=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+
+#
+# Timers subsystem
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+# CONFIG_HIGH_RES_TIMERS is not set
+
+#
+# CPU/Task time and stats accounting
+#
+CONFIG_TICK_CPU_ACCOUNTING=y
+# CONFIG_BSD_PROCESS_ACCT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_CGROUPS is not set
+# CONFIG_CHECKPOINT_RESTORE is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_UIDGID_CONVERTED=y
+# CONFIG_UIDGID_STRICT_TYPE_CHECKS is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
+CONFIG_INITRAMFS_ROOT_UID=0
+CONFIG_INITRAMFS_ROOT_GID=0
+CONFIG_RD_GZIP=y
+# CONFIG_RD_BZIP2 is not set
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_INITRAMFS_COMPRESSION_NONE is not set
+# CONFIG_INITRAMFS_COMPRESSION_GZIP is not set
+CONFIG_INITRAMFS_COMPRESSION_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_HAVE_UID16=y
+# CONFIG_UPTIME_LIMITED_KERNEL is not set
+# CONFIG_UID16 is not set
+# CONFIG_SYSCTL_SYSCALL is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_HOTPLUG=y
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_BASE_FULL is not set
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+# CONFIG_PERF_EVENTS is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_JUMP_LABEL is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_HAVE_DMA_ATTRS=y
+CONFIG_HAVE_DMA_CONTIGUOUS=y
+CONFIG_GENERIC_SMP_IDLE_THREAD=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_ARCH_JUMP_LABEL=y
+CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
+CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
+CONFIG_MODULES_USE_ELF_REL=y
+CONFIG_CLONE_BACKWARDS=y
+
+#
+# GCOV-based kernel profiling
+#
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=1
+# CONFIG_MODULES is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
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
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_DEADLINE=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="deadline"
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+CONFIG_INLINE_READ_UNLOCK=y
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+CONFIG_INLINE_WRITE_UNLOCK=y
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_MULTIPLATFORM is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCM2835 is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_SIRF is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_TEGRA is not set
+CONFIG_ARCH_PXA=y
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C24XX is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_VT8500_SINGLE is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# Intel PXA2xx/PXA3xx Implementations
+#
+
+#
+# Intel/Marvell Dev Platforms (sorted by hardware release time)
+#
+# CONFIG_MACH_PXA3XX_DT is not set
+# CONFIG_ARCH_LUBBOCK is not set
+# CONFIG_MACH_MAINSTONE is not set
+# CONFIG_MACH_ZYLONITE300 is not set
+# CONFIG_MACH_ZYLONITE320 is not set
+# CONFIG_MACH_LITTLETON is not set
+# CONFIG_MACH_TAVOREVB is not set
+# CONFIG_MACH_SAAR is not set
+
+#
+# Third Party Dev Platforms (sorted by vendor name)
+#
+# CONFIG_ARCH_PXA_IDP is not set
+# CONFIG_ARCH_VIPER is not set
+# CONFIG_MACH_ARCOM_ZEUS is not set
+# CONFIG_MACH_BALLOON3 is not set
+# CONFIG_MACH_CSB726 is not set
+# CONFIG_MACH_ARMCORE is not set
+# CONFIG_MACH_EM_X270 is not set
+# CONFIG_MACH_EXEDA is not set
+# CONFIG_MACH_CM_X300 is not set
+# CONFIG_MACH_CAPC7117 is not set
+# CONFIG_ARCH_GUMSTIX is not set
+# CONFIG_MACH_INTELMOTE2 is not set
+# CONFIG_MACH_STARGATE2 is not set
+# CONFIG_MACH_XCEP is not set
+# CONFIG_TRIZEPS_PXA is not set
+# CONFIG_MACH_LOGICPD_PXA270 is not set
+# CONFIG_MACH_PCM027 is not set
+# CONFIG_MACH_COLIBRI is not set
+# CONFIG_MACH_COLIBRI300 is not set
+# CONFIG_MACH_COLIBRI320 is not set
+# CONFIG_MACH_VPAC270 is not set
+
+#
+# End-user Products (sorted by vendor name)
+#
+# CONFIG_MACH_H4700 is not set
+# CONFIG_MACH_H5000 is not set
+# CONFIG_MACH_HIMALAYA is not set
+# CONFIG_MACH_MAGICIAN is not set
+# CONFIG_MACH_MIOA701 is not set
+# CONFIG_PXA_EZX is not set
+# CONFIG_MACH_MP900C is not set
+# CONFIG_ARCH_PXA_PALM is not set
+# CONFIG_MACH_RAUMFELD_RC is not set
+# CONFIG_MACH_RAUMFELD_CONNECTOR is not set
+# CONFIG_MACH_RAUMFELD_SPEAKER is not set
+CONFIG_PXA_SHARPSL=y
+CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
+CONFIG_MACH_POODLE=y
+# CONFIG_MACH_CORGI is not set
+# CONFIG_MACH_SHEPHERD is not set
+# CONFIG_MACH_HUSKY is not set
+# CONFIG_MACH_AKITA is not set
+# CONFIG_MACH_SPITZ is not set
+# CONFIG_MACH_BORZOI is not set
+# CONFIG_MACH_TOSA is not set
+# CONFIG_MACH_ICONTROL is not set
+# CONFIG_ARCH_PXA_ESERIES is not set
+# CONFIG_MACH_ZIPIT2 is not set
+CONFIG_PXA25x=y
+CONFIG_PXA_SSP=y
+# CONFIG_ARCH_VT8500 is not set
+CONFIG_PLAT_PXA=y
+
+#
+# Processor Type
+#
+CONFIG_CPU_XSCALE=y
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5T=y
+CONFIG_CPU_PABRT_LEGACY=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+CONFIG_CPU_USE_DOMAINS=y
+
+#
+# Processor Features
+#
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+CONFIG_ARM_NR_BANKS=8
+# CONFIG_IWMMXT is not set
+CONFIG_XSCALE_PMU=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_SHARP_LOCOMO=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+
+#
+# PC-card bridges
+#
+CONFIG_PCMCIA_SOC_COMMON=y
+CONFIG_PCMCIA_PXA2XX=y
+# CONFIG_PCMCIA_DEBUG is not set
+
+#
+# Kernel Features
+#
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_ARCH_NR_GPIO=0
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=999999
+# CONFIG_COMPACTION is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ATAGS=y
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
+# CONFIG_CMDLINE_EXTEND is not set
+# CONFIG_CMDLINE_FORCE is not set
+# CONFIG_XIP_KERNEL is not set
+CONFIG_KEXEC=y
+CONFIG_ATAGS_PROC=y
+# CONFIG_CRASH_DUMP is not set
+CONFIG_AUTO_ZRELADDR=y
+
+#
+# CPU Power Management
+#
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+# CONFIG_CPU_IDLE is not set
+# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
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
+CONFIG_BINFMT_ELF=y
+CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+# CONFIG_COREDUMP is not set
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+# CONFIG_PM_AUTOSLEEP is not set
+# CONFIG_PM_WAKELOCKS is not set
+# CONFIG_PM_RUNTIME is not set
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+# CONFIG_NET is not set
+CONFIG_HAVE_BPF_JIT=y
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_GENERIC_CPU_DEVICES is not set
+# CONFIG_DMA_SHARED_BUFFER is not set
+# CONFIG_CMA is not set
+
+#
+# Bus devices
+#
+CONFIG_MTD=y
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
+# CONFIG_SM_FTL is not set
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
+CONFIG_MTD_ROM=y
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+# CONFIG_MTD_PHYSMAP_COMPAT is not set
+# CONFIG_MTD_PCMCIA is not set
+# CONFIG_MTD_GPIO_ADDR is not set
+# CONFIG_MTD_PLATRAM is not set
+# CONFIG_MTD_LATCH_ADDR is not set
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
+# CONFIG_MTD_DOCG3 is not set
+CONFIG_MTD_NAND_ECC=y
+# CONFIG_MTD_NAND_ECC_SMC is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_DENALI is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_DOCG4 is not set
+CONFIG_MTD_NAND_SHARPSL=y
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_LIMIT=20
+# CONFIG_MTD_UBI_FASTMAP is not set
+# CONFIG_MTD_UBI_GLUEBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS or INET not selected
+#
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_MG_DISK is not set
+
+#
+# Misc devices
+#
+# CONFIG_SENSORS_LIS3LV02D is not set
+# CONFIG_AD525X_DPOT is not set
+# CONFIG_ATMEL_PWM is not set
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_APDS9802ALS is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_ISL29020 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_SENSORS_BH1780 is not set
+# CONFIG_SENSORS_BH1770 is not set
+# CONFIG_SENSORS_APDS990X is not set
+# CONFIG_HMC6352 is not set
+# CONFIG_DS1682 is not set
+# CONFIG_TI_DAC7512 is not set
+# CONFIG_BMP085_I2C is not set
+# CONFIG_BMP085_SPI is not set
+# CONFIG_USB_SWITCH_FSA9480 is not set
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
+# CONFIG_EEPROM_93XX46 is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_SENSORS_LIS3_I2C is not set
+
+#
+# Altera FPGA firmware download module
+#
+# CONFIG_ALTERA_STAPL is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
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
+# CONFIG_SCSI_MULTI_LUN is not set
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_SAS_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+
+#
+# Controllers with non-SFF native interface
+#
+# CONFIG_SATA_AHCI_PLATFORM is not set
+CONFIG_ATA_SFF=y
+
+#
+# SFF controllers with custom DMA interface
+#
+CONFIG_ATA_BMDMA=y
+
+#
+# SATA SFF controllers with BMDMA
+#
+# CONFIG_SATA_HIGHBANK is not set
+# CONFIG_SATA_MV is not set
+
+#
+# PATA SFF controllers with BMDMA
+#
+CONFIG_PATA_PXA=y
+
+#
+# PIO-only SFF controllers
+#
+CONFIG_PATA_PCMCIA=y
+# CONFIG_PATA_PLATFORM is not set
+
+#
+# Generic fallback / legacy drivers
+#
+# CONFIG_MD is not set
+# CONFIG_TARGET_CORE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
+# CONFIG_INPUT_MATRIXKMAP is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=240
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=320
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+CONFIG_INPUT_APMPOWER=y
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+# CONFIG_KEYBOARD_ADP5589 is not set
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_QT1070 is not set
+# CONFIG_KEYBOARD_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_KEYBOARD_TCA6416 is not set
+# CONFIG_KEYBOARD_TCA8418 is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_LM8333 is not set
+CONFIG_KEYBOARD_LOCOMO=y
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_SAMSUNG is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=y
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
+# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_ILI210X is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MMS114 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_PIXCIR is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
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
+CONFIG_VT_CONSOLE_SLEEP=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_TRACE_SINK is not set
+# CONFIG_DEVKMEM is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX310X is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_SCCNXP is not set
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_ARC is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_COMPAT is not set
+# CONFIG_I2C_CHARDEV is not set
+# CONFIG_I2C_MUX is not set
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_CBUS_GPIO is not set
+# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PCA_PLATFORM is not set
+CONFIG_I2C_PXA=y
+# CONFIG_I2C_PXA_PCI is not set
+# CONFIG_I2C_PXA_SLAVE is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_ALTERA is not set
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+# CONFIG_SPI_OC_TINY is not set
+CONFIG_SPI_PXA2XX=y
+# CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_SC18IS602 is not set
+# CONFIG_SPI_XCOMM is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_HSI is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+
+#
+# PPS generators support
+#
+
+#
+# PTP clock support
+#
+# CONFIG_PTP_1588_CLOCK is not set
+
+#
+# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
+#
+# CONFIG_PTP_1588_CLOCK_PCH is not set
+CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+# CONFIG_GPIO_SYSFS is not set
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_EM is not set
+CONFIG_GPIO_PXA=y
+# CONFIG_GPIO_TS5500 is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_SX150X is not set
+# CONFIG_GPIO_ADP5588 is not set
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
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+
+#
+# USB GPIO expanders:
+#
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2781 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_SBS is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_LP8727 is not set
+# CONFIG_CHARGER_GPIO is not set
+# CONFIG_CHARGER_BQ2415X is not set
+# CONFIG_CHARGER_SMB347 is not set
+# CONFIG_POWER_RESET is not set
+# CONFIG_POWER_AVS is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_BCMA_POSSIBLE=y
+
+#
+# Broadcom specific AMBA
+#
+# CONFIG_BCMA is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_88PM800 is not set
+# CONFIG_MFD_88PM805 is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_MFD_TI_AM335X_TSCADC is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_MFD_LM3533 is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS65217 is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_MFD_TPS80031 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_TWL6040_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_SMSC is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_DA9052_SPI is not set
+# CONFIG_MFD_DA9052_I2C is not set
+# CONFIG_MFD_DA9055 is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_LP8788 is not set
+# CONFIG_MFD_MAX77686 is not set
+# CONFIG_MFD_MAX77693 is not set
+# CONFIG_MFD_MAX8907 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_SEC_CORE is not set
+# CONFIG_MFD_ARIZONA_I2C is not set
+# CONFIG_MFD_ARIZONA_SPI is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX_SPI is not set
+# CONFIG_MFD_MC13XXX_I2C is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_TPS65090 is not set
+# CONFIG_MFD_AAT2870_CORE is not set
+# CONFIG_MFD_RC5T583 is not set
+# CONFIG_MFD_PALMAS is not set
+# CONFIG_MFD_RETU is not set
+# CONFIG_MFD_AS3711 is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_DRM is not set
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
+# CONFIG_FB_WMT_GE_ROPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+CONFIG_FB_PXA=y
+# CONFIG_FB_PXA_SMARTPANEL is not set
+# CONFIG_FB_PXA_PARAMETERS is not set
+# CONFIG_PXA3XX_GCU is not set
+# CONFIG_FB_MBX is not set
+# CONFIG_FB_W100 is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_AUO_K190X is not set
+# CONFIG_EXYNOS_VIDEO is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_CORGI is not set
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_ILI9320 is not set
+# CONFIG_LCD_TDO24M is not set
+# CONFIG_LCD_VGG2432A4 is not set
+# CONFIG_LCD_PLATFORM is not set
+# CONFIG_LCD_S6E63M0 is not set
+# CONFIG_LCD_LD9040 is not set
+# CONFIG_LCD_AMS369FG06 is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_BACKLIGHT_LOCOMO=y
+# CONFIG_BACKLIGHT_ADP8860 is not set
+# CONFIG_BACKLIGHT_ADP8870 is not set
+# CONFIG_BACKLIGHT_LM3630 is not set
+# CONFIG_BACKLIGHT_LM3639 is not set
+# CONFIG_BACKLIGHT_LP855X is not set
+
+#
+# Console display driver support
+#
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+# CONFIG_SOUND is not set
+
+#
+# HID support
+#
+# CONFIG_HID is not set
+
+#
+# I2C HID support
+#
+# CONFIG_I2C_HID is not set
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+# CONFIG_MMC_CLKGATE is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+CONFIG_MMC_PXA=y
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_SDHCI_PXAV3 is not set
+# CONFIG_MMC_SDHCI_PXAV2 is not set
+# CONFIG_MMC_SPI is not set
+# CONFIG_MMC_DW is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_LM3530 is not set
+# CONFIG_LEDS_LM3642 is not set
+CONFIG_LEDS_LOCOMO=y
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_PCA9633 is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+# CONFIG_LEDS_TCA6507 is not set
+# CONFIG_LEDS_LM355x is not set
+# CONFIG_LEDS_OT200 is not set
+# CONFIG_LEDS_BLINKM is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+# CONFIG_LEDS_TRIGGER_ONESHOT is not set
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_CPU is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_EDAC is not set
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
+# CONFIG_RTC_DRV_DS3232 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_ISL12022 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8523 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_BQ32K is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+# CONFIG_RTC_DRV_EM3027 is not set
+# CONFIG_RTC_DRV_RV3029C2 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T93 is not set
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
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_MSM6242 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_RP5C01 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+# CONFIG_RTC_DRV_DS2404 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_SA1100=y
+# CONFIG_RTC_DRV_PXA is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# Virtio drivers
+#
+# CONFIG_VIRTIO_MMIO is not set
+
+#
+# Microsoft Hyper-V guest support
+#
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+
+#
+# Remoteproc drivers (EXPERIMENTAL)
+#
+# CONFIG_STE_MODEM_RPROC is not set
+
+#
+# Rpmsg drivers (EXPERIMENTAL)
+#
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
+# CONFIG_EXTCON is not set
+# CONFIG_MEMORY is not set
+# CONFIG_IIO is not set
+# CONFIG_PWM is not set
+# CONFIG_IPACK_BUS is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+CONFIG_JBD2=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+# CONFIG_FILE_LOCKING is not set
+CONFIG_FSNOTIFY=y
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+CONFIG_GENERIC_ACL=y
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
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+# CONFIG_VFAT_FS_NO_DUALNAMES is not set
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES is not set
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
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
+# CONFIG_YAFFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+# CONFIG_JFFS2_FS_XATTR is not set
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_ZLIB=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RTIME=y
+CONFIG_JFFS2_RUBIN=y
+# CONFIG_JFFS2_CMODE_NONE is not set
+CONFIG_JFFS2_CMODE_PRIORITY=y
+# CONFIG_JFFS2_CMODE_SIZE is not set
+# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_QNX6FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+# CONFIG_F2FS_FS is not set
+# CONFIG_AUFS_FS is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+# CONFIG_NLS_CODEPAGE_437 is not set
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
+# CONFIG_NLS_ASCII is not set
+# CONFIG_NLS_ISO8859_1 is not set
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
+# CONFIG_NLS_MAC_ROMAN is not set
+# CONFIG_NLS_MAC_CELTIC is not set
+# CONFIG_NLS_MAC_CENTEURO is not set
+# CONFIG_NLS_MAC_CROATIAN is not set
+# CONFIG_NLS_MAC_CYRILLIC is not set
+# CONFIG_NLS_MAC_GAELIC is not set
+# CONFIG_NLS_MAC_GREEK is not set
+# CONFIG_NLS_MAC_ICELAND is not set
+# CONFIG_NLS_MAC_INUIT is not set
+# CONFIG_NLS_MAC_ROMANIAN is not set
+# CONFIG_NLS_MAC_TURKISH is not set
+# CONFIG_NLS_UTF8 is not set
+
+#
+# Kernel hacking
+#
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_READABLE_ASM is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_PANIC_ON_OOPS is not set
+CONFIG_PANIC_ON_OOPS_VALUE=0
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+CONFIG_HAVE_DEBUG_KMEMLEAK=y
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+CONFIG_FRAME_POINTER=y
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_NOTIFIER_ERROR_INJECTION is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_BRANCH_PROFILE_NONE is not set
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+# CONFIG_ARM_UNWIND is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+CONFIG_DEBUG_LL_INCLUDE="mach/debug-macro.S"
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_MANAGER2 is not set
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
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
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA1_ARM is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_AES_ARM is not set
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
+CONFIG_CRYPTO_DEFLATE=y
+# CONFIG_CRYPTO_ZLIB is not set
+CONFIG_CRYPTO_LZO=y
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
+CONFIG_GENERIC_STRNCPY_FROM_USER=y
+CONFIG_GENERIC_STRNLEN_USER=y
+CONFIG_GENERIC_PCI_IOMAP=y
+CONFIG_GENERIC_IO=y
+CONFIG_PERCPU_RWSEM=y
+# CONFIG_CRC_CCITT is not set
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC32_SELFTEST is not set
+CONFIG_CRC32_SLICEBY8=y
+# CONFIG_CRC32_SLICEBY4 is not set
+# CONFIG_CRC32_SARWATE is not set
+# CONFIG_CRC32_BIT is not set
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
+# CONFIG_AVERAGE is not set
+# CONFIG_CORDIC is not set
+# CONFIG_DDR is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-tiny.scc
new file mode 100644
index 0000000..1015b42
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-tiny.scc
@@ -0,0 +1,12 @@
+define KMACHINE poodle
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny/tiny.scc
+
+kconf hardware poodle-kexecboot.cfg
+
+patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
+patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/3200-mtd.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/3200-mtd.patch
new file mode 100644
index 0000000..4b2a968
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/3200-mtd.patch
@@ -0,0 +1,13 @@
+diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
+index 953a919..14e7736 100644
+--- a/arch/arm/mach-pxa/spitz.c
++++ b/arch/arm/mach-pxa/spitz.c
+@@ -802,7 +802,7 @@ static void __init spitz_nand_init(void)
+ 		spitz_nand_bbt.len = 1;
+ 		spitz_nand_pdata.ecc_layout = &akita_oobinfo;
+ 	} else if (machine_is_borzoi()) {
+-		spitz_nand_partitions[1].size = 32 * 1024 * 1024;
++		spitz_nand_partitions[1].size = 43 * 1024 * 1024;
+ 		spitz_nand_bbt.len = 1;
+ 		spitz_nand_pdata.ecc_layout = &akita_oobinfo;
+ 	}
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-kexecboot.cfg
new file mode 100644
index 0000000..5aa5586
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-kexecboot.cfg
@@ -0,0 +1,1876 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.8.13 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_NEED_MACH_GPIO_H=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_BUILDTIME_EXTABLE_SORT=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION="-yocto-tiny"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_XZ=y
+CONFIG_HAVE_KERNEL_LZO=y
+# CONFIG_KERNEL_GZIP is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_KERNEL_XZ is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+# CONFIG_SWAP is not set
+# CONFIG_SYSVIPC is not set
+# CONFIG_FHANDLE is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_SPARSE_IRQ=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+
+#
+# Timers subsystem
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+# CONFIG_HIGH_RES_TIMERS is not set
+
+#
+# CPU/Task time and stats accounting
+#
+CONFIG_TICK_CPU_ACCOUNTING=y
+# CONFIG_BSD_PROCESS_ACCT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_CGROUPS is not set
+# CONFIG_CHECKPOINT_RESTORE is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_UIDGID_CONVERTED=y
+# CONFIG_UIDGID_STRICT_TYPE_CHECKS is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
+CONFIG_INITRAMFS_ROOT_UID=0
+CONFIG_INITRAMFS_ROOT_GID=0
+CONFIG_RD_GZIP=y
+# CONFIG_RD_BZIP2 is not set
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_INITRAMFS_COMPRESSION_NONE is not set
+# CONFIG_INITRAMFS_COMPRESSION_GZIP is not set
+CONFIG_INITRAMFS_COMPRESSION_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_HAVE_UID16=y
+# CONFIG_UPTIME_LIMITED_KERNEL is not set
+# CONFIG_UID16 is not set
+# CONFIG_SYSCTL_SYSCALL is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_HOTPLUG=y
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_BASE_FULL is not set
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+# CONFIG_PERF_EVENTS is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_JUMP_LABEL is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_HAVE_DMA_ATTRS=y
+CONFIG_HAVE_DMA_CONTIGUOUS=y
+CONFIG_GENERIC_SMP_IDLE_THREAD=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_ARCH_JUMP_LABEL=y
+CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
+CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
+CONFIG_MODULES_USE_ELF_REL=y
+CONFIG_CLONE_BACKWARDS=y
+
+#
+# GCOV-based kernel profiling
+#
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=1
+# CONFIG_MODULES is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
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
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_DEADLINE=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="deadline"
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+CONFIG_INLINE_READ_UNLOCK=y
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+CONFIG_INLINE_WRITE_UNLOCK=y
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_MULTIPLATFORM is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCM2835 is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_SIRF is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_TEGRA is not set
+CONFIG_ARCH_PXA=y
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C24XX is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_VT8500_SINGLE is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# Intel PXA2xx/PXA3xx Implementations
+#
+
+#
+# Intel/Marvell Dev Platforms (sorted by hardware release time)
+#
+# CONFIG_MACH_PXA3XX_DT is not set
+# CONFIG_ARCH_LUBBOCK is not set
+# CONFIG_MACH_MAINSTONE is not set
+# CONFIG_MACH_ZYLONITE300 is not set
+# CONFIG_MACH_ZYLONITE320 is not set
+# CONFIG_MACH_LITTLETON is not set
+# CONFIG_MACH_TAVOREVB is not set
+# CONFIG_MACH_SAAR is not set
+
+#
+# Third Party Dev Platforms (sorted by vendor name)
+#
+# CONFIG_ARCH_PXA_IDP is not set
+# CONFIG_ARCH_VIPER is not set
+# CONFIG_MACH_ARCOM_ZEUS is not set
+# CONFIG_MACH_BALLOON3 is not set
+# CONFIG_MACH_CSB726 is not set
+# CONFIG_MACH_ARMCORE is not set
+# CONFIG_MACH_EM_X270 is not set
+# CONFIG_MACH_EXEDA is not set
+# CONFIG_MACH_CM_X300 is not set
+# CONFIG_MACH_CAPC7117 is not set
+# CONFIG_ARCH_GUMSTIX is not set
+# CONFIG_MACH_INTELMOTE2 is not set
+# CONFIG_MACH_STARGATE2 is not set
+# CONFIG_MACH_XCEP is not set
+# CONFIG_TRIZEPS_PXA is not set
+# CONFIG_MACH_LOGICPD_PXA270 is not set
+# CONFIG_MACH_PCM027 is not set
+# CONFIG_MACH_COLIBRI is not set
+# CONFIG_MACH_COLIBRI300 is not set
+# CONFIG_MACH_COLIBRI320 is not set
+# CONFIG_MACH_VPAC270 is not set
+
+#
+# End-user Products (sorted by vendor name)
+#
+# CONFIG_MACH_H4700 is not set
+# CONFIG_MACH_H5000 is not set
+# CONFIG_MACH_HIMALAYA is not set
+# CONFIG_MACH_MAGICIAN is not set
+# CONFIG_MACH_MIOA701 is not set
+# CONFIG_PXA_EZX is not set
+# CONFIG_MACH_MP900C is not set
+# CONFIG_ARCH_PXA_PALM is not set
+# CONFIG_MACH_RAUMFELD_RC is not set
+# CONFIG_MACH_RAUMFELD_CONNECTOR is not set
+# CONFIG_MACH_RAUMFELD_SPEAKER is not set
+CONFIG_PXA_SHARPSL=y
+CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
+# CONFIG_MACH_POODLE is not set
+# CONFIG_MACH_CORGI is not set
+# CONFIG_MACH_SHEPHERD is not set
+# CONFIG_MACH_HUSKY is not set
+CONFIG_MACH_AKITA=y
+CONFIG_MACH_SPITZ=y
+CONFIG_MACH_BORZOI=y
+# CONFIG_MACH_TOSA is not set
+# CONFIG_MACH_ICONTROL is not set
+# CONFIG_ARCH_PXA_ESERIES is not set
+# CONFIG_MACH_ZIPIT2 is not set
+CONFIG_PXA27x=y
+CONFIG_PXA_SHARP_Cxx00=y
+CONFIG_SHARPSL_PM=y
+CONFIG_SHARPSL_PM_MAX1111=y
+CONFIG_PXA_SSP=y
+# CONFIG_ARCH_VT8500 is not set
+CONFIG_PLAT_PXA=y
+
+#
+# Processor Type
+#
+CONFIG_CPU_XSCALE=y
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5T=y
+CONFIG_CPU_PABRT_LEGACY=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+CONFIG_CPU_USE_DOMAINS=y
+
+#
+# Processor Features
+#
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+CONFIG_ARM_NR_BANKS=8
+CONFIG_IWMMXT=y
+CONFIG_XSCALE_PMU=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+
+#
+# PC-card bridges
+#
+CONFIG_PCMCIA_SOC_COMMON=y
+CONFIG_PCMCIA_PXA2XX=y
+# CONFIG_PCMCIA_DEBUG is not set
+
+#
+# Kernel Features
+#
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_ARCH_NR_GPIO=0
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=999999
+# CONFIG_COMPACTION is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ATAGS=y
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
+# CONFIG_CMDLINE_EXTEND is not set
+# CONFIG_CMDLINE_FORCE is not set
+# CONFIG_XIP_KERNEL is not set
+CONFIG_KEXEC=y
+CONFIG_ATAGS_PROC=y
+# CONFIG_CRASH_DUMP is not set
+CONFIG_AUTO_ZRELADDR=y
+
+#
+# CPU Power Management
+#
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+# CONFIG_CPU_IDLE is not set
+# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
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
+CONFIG_BINFMT_ELF=y
+CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+# CONFIG_COREDUMP is not set
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+# CONFIG_PM_AUTOSLEEP is not set
+# CONFIG_PM_WAKELOCKS is not set
+# CONFIG_PM_RUNTIME is not set
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+# CONFIG_NET is not set
+CONFIG_HAVE_BPF_JIT=y
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_GENERIC_CPU_DEVICES is not set
+# CONFIG_DMA_SHARED_BUFFER is not set
+# CONFIG_CMA is not set
+
+#
+# Bus devices
+#
+CONFIG_MTD=y
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
+# CONFIG_SM_FTL is not set
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
+CONFIG_MTD_ROM=y
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+# CONFIG_MTD_PHYSMAP_COMPAT is not set
+# CONFIG_MTD_PCMCIA is not set
+# CONFIG_MTD_GPIO_ADDR is not set
+# CONFIG_MTD_PLATRAM is not set
+# CONFIG_MTD_LATCH_ADDR is not set
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
+# CONFIG_MTD_DOCG3 is not set
+CONFIG_MTD_NAND_ECC=y
+# CONFIG_MTD_NAND_ECC_SMC is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_DENALI is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_DOCG4 is not set
+CONFIG_MTD_NAND_SHARPSL=y
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_LIMIT=20
+# CONFIG_MTD_UBI_FASTMAP is not set
+# CONFIG_MTD_UBI_GLUEBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS or INET not selected
+#
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_MG_DISK is not set
+
+#
+# Misc devices
+#
+# CONFIG_SENSORS_LIS3LV02D is not set
+# CONFIG_AD525X_DPOT is not set
+# CONFIG_ATMEL_PWM is not set
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_APDS9802ALS is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_ISL29020 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_SENSORS_BH1780 is not set
+# CONFIG_SENSORS_BH1770 is not set
+# CONFIG_SENSORS_APDS990X is not set
+# CONFIG_HMC6352 is not set
+# CONFIG_DS1682 is not set
+# CONFIG_TI_DAC7512 is not set
+# CONFIG_BMP085_I2C is not set
+# CONFIG_BMP085_SPI is not set
+# CONFIG_USB_SWITCH_FSA9480 is not set
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
+# CONFIG_EEPROM_93XX46 is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_SENSORS_LIS3_I2C is not set
+
+#
+# Altera FPGA firmware download module
+#
+# CONFIG_ALTERA_STAPL is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
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
+# CONFIG_SCSI_MULTI_LUN is not set
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_SAS_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+
+#
+# Controllers with non-SFF native interface
+#
+# CONFIG_SATA_AHCI_PLATFORM is not set
+CONFIG_ATA_SFF=y
+
+#
+# SFF controllers with custom DMA interface
+#
+CONFIG_ATA_BMDMA=y
+
+#
+# SATA SFF controllers with BMDMA
+#
+# CONFIG_SATA_HIGHBANK is not set
+# CONFIG_SATA_MV is not set
+
+#
+# PATA SFF controllers with BMDMA
+#
+CONFIG_PATA_PXA=y
+
+#
+# PIO-only SFF controllers
+#
+CONFIG_PATA_PCMCIA=y
+# CONFIG_PATA_PLATFORM is not set
+
+#
+# Generic fallback / legacy drivers
+#
+# CONFIG_MD is not set
+# CONFIG_TARGET_CORE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
+CONFIG_INPUT_MATRIXKMAP=y
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+CONFIG_INPUT_APMPOWER=y
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+# CONFIG_KEYBOARD_ADP5589 is not set
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_QT1070 is not set
+# CONFIG_KEYBOARD_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_KEYBOARD_TCA6416 is not set
+# CONFIG_KEYBOARD_TCA8418 is not set
+CONFIG_KEYBOARD_MATRIX=y
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_LM8333 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_PXA27x is not set
+# CONFIG_KEYBOARD_SAMSUNG is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=y
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
+# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_ILI210X is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MMS114 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_PIXCIR is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
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
+CONFIG_VT_CONSOLE_SLEEP=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_TRACE_SINK is not set
+# CONFIG_DEVKMEM is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX310X is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_SCCNXP is not set
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_ARC is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_COMPAT is not set
+# CONFIG_I2C_CHARDEV is not set
+# CONFIG_I2C_MUX is not set
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_CBUS_GPIO is not set
+# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PCA_PLATFORM is not set
+CONFIG_I2C_PXA=y
+# CONFIG_I2C_PXA_PCI is not set
+# CONFIG_I2C_PXA_SLAVE is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_ALTERA is not set
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+# CONFIG_SPI_OC_TINY is not set
+CONFIG_SPI_PXA2XX=y
+# CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_SC18IS602 is not set
+# CONFIG_SPI_XCOMM is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_HSI is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+
+#
+# PPS generators support
+#
+
+#
+# PTP clock support
+#
+# CONFIG_PTP_1588_CLOCK is not set
+
+#
+# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
+#
+# CONFIG_PTP_1588_CLOCK_PCH is not set
+CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+# CONFIG_GPIO_SYSFS is not set
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_EM is not set
+CONFIG_GPIO_PXA=y
+# CONFIG_GPIO_TS5500 is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_SX150X is not set
+# CONFIG_GPIO_ADP5588 is not set
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
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+
+#
+# USB GPIO expanders:
+#
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2781 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_SBS is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_LP8727 is not set
+# CONFIG_CHARGER_GPIO is not set
+# CONFIG_CHARGER_BQ2415X is not set
+# CONFIG_CHARGER_SMB347 is not set
+# CONFIG_POWER_RESET is not set
+# CONFIG_POWER_AVS is not set
+CONFIG_HWMON=y
+# CONFIG_HWMON_VID is not set
+# CONFIG_HWMON_DEBUG_CHIP is not set
+
+#
+# Native drivers
+#
+# CONFIG_SENSORS_AD7314 is not set
+# CONFIG_SENSORS_AD7414 is not set
+# CONFIG_SENSORS_AD7418 is not set
+# CONFIG_SENSORS_ADCXX is not set
+# CONFIG_SENSORS_ADM1021 is not set
+# CONFIG_SENSORS_ADM1025 is not set
+# CONFIG_SENSORS_ADM1026 is not set
+# CONFIG_SENSORS_ADM1029 is not set
+# CONFIG_SENSORS_ADM1031 is not set
+# CONFIG_SENSORS_ADM9240 is not set
+# CONFIG_SENSORS_ADT7410 is not set
+# CONFIG_SENSORS_ADT7411 is not set
+# CONFIG_SENSORS_ADT7462 is not set
+# CONFIG_SENSORS_ADT7470 is not set
+# CONFIG_SENSORS_ADT7475 is not set
+# CONFIG_SENSORS_ASC7621 is not set
+# CONFIG_SENSORS_ATXP1 is not set
+# CONFIG_SENSORS_DS620 is not set
+# CONFIG_SENSORS_DS1621 is not set
+# CONFIG_SENSORS_F71805F is not set
+# CONFIG_SENSORS_F71882FG is not set
+# CONFIG_SENSORS_F75375S is not set
+# CONFIG_SENSORS_G760A is not set
+# CONFIG_SENSORS_GL518SM is not set
+# CONFIG_SENSORS_GL520SM is not set
+# CONFIG_SENSORS_GPIO_FAN is not set
+# CONFIG_SENSORS_HIH6130 is not set
+# CONFIG_SENSORS_IT87 is not set
+# CONFIG_SENSORS_JC42 is not set
+# CONFIG_SENSORS_LINEAGE is not set
+# CONFIG_SENSORS_LM63 is not set
+# CONFIG_SENSORS_LM70 is not set
+# CONFIG_SENSORS_LM73 is not set
+# CONFIG_SENSORS_LM75 is not set
+# CONFIG_SENSORS_LM77 is not set
+# CONFIG_SENSORS_LM78 is not set
+# CONFIG_SENSORS_LM80 is not set
+# CONFIG_SENSORS_LM83 is not set
+# CONFIG_SENSORS_LM85 is not set
+# CONFIG_SENSORS_LM87 is not set
+# CONFIG_SENSORS_LM90 is not set
+# CONFIG_SENSORS_LM92 is not set
+# CONFIG_SENSORS_LM93 is not set
+# CONFIG_SENSORS_LTC4151 is not set
+# CONFIG_SENSORS_LTC4215 is not set
+# CONFIG_SENSORS_LTC4245 is not set
+# CONFIG_SENSORS_LTC4261 is not set
+# CONFIG_SENSORS_LM95241 is not set
+# CONFIG_SENSORS_LM95245 is not set
+CONFIG_SENSORS_MAX1111=y
+# CONFIG_SENSORS_MAX16065 is not set
+# CONFIG_SENSORS_MAX1619 is not set
+# CONFIG_SENSORS_MAX1668 is not set
+# CONFIG_SENSORS_MAX197 is not set
+# CONFIG_SENSORS_MAX6639 is not set
+# CONFIG_SENSORS_MAX6642 is not set
+# CONFIG_SENSORS_MAX6650 is not set
+# CONFIG_SENSORS_MCP3021 is not set
+# CONFIG_SENSORS_NTC_THERMISTOR is not set
+# CONFIG_SENSORS_PC87360 is not set
+# CONFIG_SENSORS_PC87427 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_PMBUS is not set
+# CONFIG_SENSORS_SHT15 is not set
+# CONFIG_SENSORS_SHT21 is not set
+# CONFIG_SENSORS_SMM665 is not set
+# CONFIG_SENSORS_DME1737 is not set
+# CONFIG_SENSORS_EMC1403 is not set
+# CONFIG_SENSORS_EMC2103 is not set
+# CONFIG_SENSORS_EMC6W201 is not set
+# CONFIG_SENSORS_SMSC47M1 is not set
+# CONFIG_SENSORS_SMSC47M192 is not set
+# CONFIG_SENSORS_SMSC47B397 is not set
+# CONFIG_SENSORS_SCH56XX_COMMON is not set
+# CONFIG_SENSORS_ADS1015 is not set
+# CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_ADS7871 is not set
+# CONFIG_SENSORS_AMC6821 is not set
+# CONFIG_SENSORS_INA2XX is not set
+# CONFIG_SENSORS_THMC50 is not set
+# CONFIG_SENSORS_TMP102 is not set
+# CONFIG_SENSORS_TMP401 is not set
+# CONFIG_SENSORS_TMP421 is not set
+# CONFIG_SENSORS_VT1211 is not set
+# CONFIG_SENSORS_W83781D is not set
+# CONFIG_SENSORS_W83791D is not set
+# CONFIG_SENSORS_W83792D is not set
+# CONFIG_SENSORS_W83793 is not set
+# CONFIG_SENSORS_W83795 is not set
+# CONFIG_SENSORS_W83L785TS is not set
+# CONFIG_SENSORS_W83L786NG is not set
+# CONFIG_SENSORS_W83627HF is not set
+# CONFIG_SENSORS_W83627EHF is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_BCMA_POSSIBLE=y
+
+#
+# Broadcom specific AMBA
+#
+# CONFIG_BCMA is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_88PM800 is not set
+# CONFIG_MFD_88PM805 is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_MFD_TI_AM335X_TSCADC is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_MFD_LM3533 is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS65217 is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_MFD_TPS80031 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_TWL6040_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_SMSC is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_DA9052_SPI is not set
+# CONFIG_MFD_DA9052_I2C is not set
+# CONFIG_MFD_DA9055 is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_LP8788 is not set
+# CONFIG_MFD_MAX77686 is not set
+# CONFIG_MFD_MAX77693 is not set
+# CONFIG_MFD_MAX8907 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_SEC_CORE is not set
+# CONFIG_MFD_ARIZONA_I2C is not set
+# CONFIG_MFD_ARIZONA_SPI is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX_SPI is not set
+# CONFIG_MFD_MC13XXX_I2C is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_TPS65090 is not set
+# CONFIG_MFD_AAT2870_CORE is not set
+# CONFIG_MFD_RC5T583 is not set
+# CONFIG_MFD_PALMAS is not set
+# CONFIG_MFD_RETU is not set
+# CONFIG_MFD_AS3711 is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_DRM is not set
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
+# CONFIG_FB_WMT_GE_ROPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+CONFIG_FB_PXA=y
+# CONFIG_FB_PXA_OVERLAY is not set
+# CONFIG_FB_PXA_SMARTPANEL is not set
+# CONFIG_FB_PXA_PARAMETERS is not set
+# CONFIG_PXA3XX_GCU is not set
+# CONFIG_FB_MBX is not set
+# CONFIG_FB_W100 is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_AUO_K190X is not set
+# CONFIG_EXYNOS_VIDEO is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LCD_CORGI=y
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_ILI9320 is not set
+# CONFIG_LCD_TDO24M is not set
+# CONFIG_LCD_VGG2432A4 is not set
+# CONFIG_LCD_PLATFORM is not set
+# CONFIG_LCD_S6E63M0 is not set
+# CONFIG_LCD_LD9040 is not set
+# CONFIG_LCD_AMS369FG06 is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_GENERIC=y
+# CONFIG_BACKLIGHT_ADP8860 is not set
+# CONFIG_BACKLIGHT_ADP8870 is not set
+# CONFIG_BACKLIGHT_LM3630 is not set
+# CONFIG_BACKLIGHT_LM3639 is not set
+# CONFIG_BACKLIGHT_LP855X is not set
+
+#
+# Console display driver support
+#
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_FONTS=y
+# CONFIG_FONT_8x8 is not set
+CONFIG_FONT_8x16=y
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_FONT_AUTOSELECT=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+# CONFIG_SOUND is not set
+
+#
+# HID support
+#
+# CONFIG_HID is not set
+
+#
+# I2C HID support
+#
+# CONFIG_I2C_HID is not set
+CONFIG_USB_ARCH_HAS_OHCI=y
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+# CONFIG_MMC_CLKGATE is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+CONFIG_MMC_PXA=y
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_SDHCI_PXAV3 is not set
+# CONFIG_MMC_SDHCI_PXAV2 is not set
+# CONFIG_MMC_SPI is not set
+# CONFIG_MMC_DW is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_LM3530 is not set
+# CONFIG_LEDS_LM3642 is not set
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_PCA9633 is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+# CONFIG_LEDS_TCA6507 is not set
+# CONFIG_LEDS_LM355x is not set
+# CONFIG_LEDS_OT200 is not set
+# CONFIG_LEDS_BLINKM is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+# CONFIG_LEDS_TRIGGER_ONESHOT is not set
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_CPU is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_EDAC is not set
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
+# CONFIG_RTC_DRV_DS3232 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_ISL12022 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8523 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_BQ32K is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+# CONFIG_RTC_DRV_EM3027 is not set
+# CONFIG_RTC_DRV_RV3029C2 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T93 is not set
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
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_MSM6242 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_RP5C01 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+# CONFIG_RTC_DRV_DS2404 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_SA1100 is not set
+CONFIG_RTC_DRV_PXA=y
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# Virtio drivers
+#
+# CONFIG_VIRTIO_MMIO is not set
+
+#
+# Microsoft Hyper-V guest support
+#
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+
+#
+# Remoteproc drivers (EXPERIMENTAL)
+#
+# CONFIG_STE_MODEM_RPROC is not set
+
+#
+# Rpmsg drivers (EXPERIMENTAL)
+#
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
+# CONFIG_EXTCON is not set
+# CONFIG_MEMORY is not set
+# CONFIG_IIO is not set
+# CONFIG_PWM is not set
+# CONFIG_IPACK_BUS is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+CONFIG_JBD2=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+# CONFIG_FILE_LOCKING is not set
+CONFIG_FSNOTIFY=y
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+CONFIG_GENERIC_ACL=y
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
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+# CONFIG_VFAT_FS_NO_DUALNAMES is not set
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES is not set
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
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
+# CONFIG_YAFFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+# CONFIG_JFFS2_FS_XATTR is not set
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_ZLIB=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RTIME=y
+CONFIG_JFFS2_RUBIN=y
+# CONFIG_JFFS2_CMODE_NONE is not set
+CONFIG_JFFS2_CMODE_PRIORITY=y
+# CONFIG_JFFS2_CMODE_SIZE is not set
+# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_QNX6FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+# CONFIG_F2FS_FS is not set
+# CONFIG_AUFS_FS is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+# CONFIG_NLS_CODEPAGE_437 is not set
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
+# CONFIG_NLS_ASCII is not set
+# CONFIG_NLS_ISO8859_1 is not set
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
+# CONFIG_NLS_MAC_ROMAN is not set
+# CONFIG_NLS_MAC_CELTIC is not set
+# CONFIG_NLS_MAC_CENTEURO is not set
+# CONFIG_NLS_MAC_CROATIAN is not set
+# CONFIG_NLS_MAC_CYRILLIC is not set
+# CONFIG_NLS_MAC_GAELIC is not set
+# CONFIG_NLS_MAC_GREEK is not set
+# CONFIG_NLS_MAC_ICELAND is not set
+# CONFIG_NLS_MAC_INUIT is not set
+# CONFIG_NLS_MAC_ROMANIAN is not set
+# CONFIG_NLS_MAC_TURKISH is not set
+# CONFIG_NLS_UTF8 is not set
+
+#
+# Kernel hacking
+#
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_READABLE_ASM is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_PANIC_ON_OOPS is not set
+CONFIG_PANIC_ON_OOPS_VALUE=0
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+CONFIG_HAVE_DEBUG_KMEMLEAK=y
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+CONFIG_FRAME_POINTER=y
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_NOTIFIER_ERROR_INJECTION is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_BRANCH_PROFILE_NONE is not set
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+# CONFIG_ARM_UNWIND is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+CONFIG_DEBUG_LL_INCLUDE="mach/debug-macro.S"
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_MANAGER2 is not set
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
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
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA1_ARM is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_AES_ARM is not set
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
+CONFIG_CRYPTO_DEFLATE=y
+# CONFIG_CRYPTO_ZLIB is not set
+CONFIG_CRYPTO_LZO=y
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
+CONFIG_GENERIC_STRNCPY_FROM_USER=y
+CONFIG_GENERIC_STRNLEN_USER=y
+CONFIG_GENERIC_PCI_IOMAP=y
+CONFIG_GENERIC_IO=y
+CONFIG_PERCPU_RWSEM=y
+# CONFIG_CRC_CCITT is not set
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC32_SELFTEST is not set
+CONFIG_CRC32_SLICEBY8=y
+# CONFIG_CRC32_SLICEBY4 is not set
+# CONFIG_CRC32_SARWATE is not set
+# CONFIG_CRC32_BIT is not set
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
+# CONFIG_AVERAGE is not set
+# CONFIG_CORDIC is not set
+# CONFIG_DDR is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-tiny.scc
new file mode 100644
index 0000000..0a1fc30
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-tiny.scc
@@ -0,0 +1,15 @@
+define KMACHINE spitz
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny/tiny.scc
+
+kconf hardware spitz-kexecboot.cfg
+
+# fix mtd size for SL-C3200
+patch 3200-mtd.patch
+
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
+patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-kexecboot.cfg
new file mode 100644
index 0000000..9e3b9e5
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-kexecboot.cfg
@@ -0,0 +1,1778 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.8.13 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_NEED_MACH_GPIO_H=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_BUILDTIME_EXTABLE_SORT=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION="-yocto-tiny"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_XZ=y
+CONFIG_HAVE_KERNEL_LZO=y
+# CONFIG_KERNEL_GZIP is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_KERNEL_XZ is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+# CONFIG_SWAP is not set
+# CONFIG_SYSVIPC is not set
+# CONFIG_FHANDLE is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_IRQ_DOMAIN=y
+CONFIG_SPARSE_IRQ=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+
+#
+# Timers subsystem
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+# CONFIG_HIGH_RES_TIMERS is not set
+
+#
+# CPU/Task time and stats accounting
+#
+CONFIG_TICK_CPU_ACCOUNTING=y
+# CONFIG_BSD_PROCESS_ACCT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_CGROUPS is not set
+# CONFIG_CHECKPOINT_RESTORE is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_UIDGID_CONVERTED=y
+# CONFIG_UIDGID_STRICT_TYPE_CHECKS is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
+CONFIG_INITRAMFS_ROOT_UID=0
+CONFIG_INITRAMFS_ROOT_GID=0
+CONFIG_RD_GZIP=y
+# CONFIG_RD_BZIP2 is not set
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_INITRAMFS_COMPRESSION_NONE is not set
+# CONFIG_INITRAMFS_COMPRESSION_GZIP is not set
+CONFIG_INITRAMFS_COMPRESSION_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_HAVE_UID16=y
+# CONFIG_UPTIME_LIMITED_KERNEL is not set
+# CONFIG_UID16 is not set
+# CONFIG_SYSCTL_SYSCALL is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_HOTPLUG=y
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_BASE_FULL is not set
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+# CONFIG_PERF_EVENTS is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_JUMP_LABEL is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_HAVE_DMA_ATTRS=y
+CONFIG_HAVE_DMA_CONTIGUOUS=y
+CONFIG_GENERIC_SMP_IDLE_THREAD=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_ARCH_JUMP_LABEL=y
+CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
+CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
+CONFIG_MODULES_USE_ELF_REL=y
+CONFIG_CLONE_BACKWARDS=y
+
+#
+# GCOV-based kernel profiling
+#
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=1
+# CONFIG_MODULES is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
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
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_DEADLINE=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="deadline"
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+CONFIG_INLINE_READ_UNLOCK=y
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+CONFIG_INLINE_WRITE_UNLOCK=y
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_MULTIPLATFORM is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCM2835 is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_SIRF is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_TEGRA is not set
+CONFIG_ARCH_PXA=y
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C24XX is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_VT8500_SINGLE is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# Intel PXA2xx/PXA3xx Implementations
+#
+
+#
+# Intel/Marvell Dev Platforms (sorted by hardware release time)
+#
+# CONFIG_MACH_PXA3XX_DT is not set
+# CONFIG_ARCH_LUBBOCK is not set
+# CONFIG_MACH_MAINSTONE is not set
+# CONFIG_MACH_ZYLONITE300 is not set
+# CONFIG_MACH_ZYLONITE320 is not set
+# CONFIG_MACH_LITTLETON is not set
+# CONFIG_MACH_TAVOREVB is not set
+# CONFIG_MACH_SAAR is not set
+
+#
+# Third Party Dev Platforms (sorted by vendor name)
+#
+# CONFIG_ARCH_PXA_IDP is not set
+# CONFIG_ARCH_VIPER is not set
+# CONFIG_MACH_ARCOM_ZEUS is not set
+# CONFIG_MACH_BALLOON3 is not set
+# CONFIG_MACH_CSB726 is not set
+# CONFIG_MACH_ARMCORE is not set
+# CONFIG_MACH_EM_X270 is not set
+# CONFIG_MACH_EXEDA is not set
+# CONFIG_MACH_CM_X300 is not set
+# CONFIG_MACH_CAPC7117 is not set
+# CONFIG_ARCH_GUMSTIX is not set
+# CONFIG_MACH_INTELMOTE2 is not set
+# CONFIG_MACH_STARGATE2 is not set
+# CONFIG_MACH_XCEP is not set
+# CONFIG_TRIZEPS_PXA is not set
+# CONFIG_MACH_LOGICPD_PXA270 is not set
+# CONFIG_MACH_PCM027 is not set
+# CONFIG_MACH_COLIBRI is not set
+# CONFIG_MACH_COLIBRI300 is not set
+# CONFIG_MACH_COLIBRI320 is not set
+# CONFIG_MACH_VPAC270 is not set
+
+#
+# End-user Products (sorted by vendor name)
+#
+# CONFIG_MACH_H4700 is not set
+# CONFIG_MACH_H5000 is not set
+# CONFIG_MACH_HIMALAYA is not set
+# CONFIG_MACH_MAGICIAN is not set
+# CONFIG_MACH_MIOA701 is not set
+# CONFIG_PXA_EZX is not set
+# CONFIG_MACH_MP900C is not set
+# CONFIG_ARCH_PXA_PALM is not set
+# CONFIG_MACH_RAUMFELD_RC is not set
+# CONFIG_MACH_RAUMFELD_CONNECTOR is not set
+# CONFIG_MACH_RAUMFELD_SPEAKER is not set
+CONFIG_PXA_SHARPSL=y
+CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
+# CONFIG_MACH_POODLE is not set
+# CONFIG_MACH_CORGI is not set
+# CONFIG_MACH_SHEPHERD is not set
+# CONFIG_MACH_HUSKY is not set
+# CONFIG_MACH_AKITA is not set
+# CONFIG_MACH_SPITZ is not set
+# CONFIG_MACH_BORZOI is not set
+CONFIG_MACH_TOSA=y
+# CONFIG_TOSA_BT is not set
+# CONFIG_TOSA_USE_EXT_KEYCODES is not set
+# CONFIG_MACH_ICONTROL is not set
+# CONFIG_ARCH_PXA_ESERIES is not set
+# CONFIG_MACH_ZIPIT2 is not set
+CONFIG_PXA25x=y
+CONFIG_PXA_SSP=y
+# CONFIG_ARCH_VT8500 is not set
+CONFIG_PLAT_PXA=y
+
+#
+# Processor Type
+#
+CONFIG_CPU_XSCALE=y
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5T=y
+CONFIG_CPU_PABRT_LEGACY=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+CONFIG_CPU_USE_DOMAINS=y
+
+#
+# Processor Features
+#
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+CONFIG_ARM_NR_BANKS=8
+# CONFIG_IWMMXT is not set
+CONFIG_XSCALE_PMU=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+
+#
+# PC-card bridges
+#
+CONFIG_PCMCIA_SOC_COMMON=y
+CONFIG_PCMCIA_PXA2XX=y
+# CONFIG_PCMCIA_DEBUG is not set
+
+#
+# Kernel Features
+#
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_ARCH_NR_GPIO=0
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=999999
+# CONFIG_COMPACTION is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ATAGS=y
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 loglevel=3"
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
+# CONFIG_CMDLINE_EXTEND is not set
+# CONFIG_CMDLINE_FORCE is not set
+# CONFIG_XIP_KERNEL is not set
+CONFIG_KEXEC=y
+CONFIG_ATAGS_PROC=y
+# CONFIG_CRASH_DUMP is not set
+CONFIG_AUTO_ZRELADDR=y
+
+#
+# CPU Power Management
+#
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+# CONFIG_CPU_IDLE is not set
+# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
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
+CONFIG_BINFMT_ELF=y
+CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+# CONFIG_COREDUMP is not set
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+# CONFIG_PM_AUTOSLEEP is not set
+# CONFIG_PM_WAKELOCKS is not set
+# CONFIG_PM_RUNTIME is not set
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+# CONFIG_NET is not set
+CONFIG_HAVE_BPF_JIT=y
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_GENERIC_CPU_DEVICES is not set
+# CONFIG_DMA_SHARED_BUFFER is not set
+# CONFIG_CMA is not set
+
+#
+# Bus devices
+#
+CONFIG_MTD=y
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
+# CONFIG_SM_FTL is not set
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
+CONFIG_MTD_ROM=y
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+# CONFIG_MTD_PHYSMAP_COMPAT is not set
+# CONFIG_MTD_PCMCIA is not set
+# CONFIG_MTD_GPIO_ADDR is not set
+# CONFIG_MTD_PLATRAM is not set
+# CONFIG_MTD_LATCH_ADDR is not set
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
+# CONFIG_MTD_DOCG3 is not set
+CONFIG_MTD_NAND_ECC=y
+# CONFIG_MTD_NAND_ECC_SMC is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_DENALI is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_DOCG4 is not set
+# CONFIG_MTD_NAND_SHARPSL is not set
+CONFIG_MTD_NAND_TMIO=y
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_LIMIT=20
+# CONFIG_MTD_UBI_FASTMAP is not set
+# CONFIG_MTD_UBI_GLUEBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS or INET not selected
+#
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_MG_DISK is not set
+
+#
+# Misc devices
+#
+# CONFIG_SENSORS_LIS3LV02D is not set
+# CONFIG_AD525X_DPOT is not set
+# CONFIG_ATMEL_PWM is not set
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_APDS9802ALS is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_ISL29020 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_SENSORS_BH1780 is not set
+# CONFIG_SENSORS_BH1770 is not set
+# CONFIG_SENSORS_APDS990X is not set
+# CONFIG_HMC6352 is not set
+# CONFIG_DS1682 is not set
+# CONFIG_TI_DAC7512 is not set
+# CONFIG_BMP085_I2C is not set
+# CONFIG_BMP085_SPI is not set
+# CONFIG_USB_SWITCH_FSA9480 is not set
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
+# CONFIG_EEPROM_93XX46 is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_SENSORS_LIS3_I2C is not set
+
+#
+# Altera FPGA firmware download module
+#
+# CONFIG_ALTERA_STAPL is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
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
+# CONFIG_SCSI_MULTI_LUN is not set
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_SAS_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+
+#
+# Controllers with non-SFF native interface
+#
+# CONFIG_SATA_AHCI_PLATFORM is not set
+CONFIG_ATA_SFF=y
+
+#
+# SFF controllers with custom DMA interface
+#
+CONFIG_ATA_BMDMA=y
+
+#
+# SATA SFF controllers with BMDMA
+#
+# CONFIG_SATA_HIGHBANK is not set
+# CONFIG_SATA_MV is not set
+
+#
+# PATA SFF controllers with BMDMA
+#
+CONFIG_PATA_PXA=y
+
+#
+# PIO-only SFF controllers
+#
+CONFIG_PATA_PCMCIA=y
+# CONFIG_PATA_PLATFORM is not set
+
+#
+# Generic fallback / legacy drivers
+#
+# CONFIG_MD is not set
+# CONFIG_TARGET_CORE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
+CONFIG_INPUT_MATRIXKMAP=y
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=480
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=640
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+CONFIG_INPUT_APMPOWER=y
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+# CONFIG_KEYBOARD_ADP5589 is not set
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_QT1070 is not set
+# CONFIG_KEYBOARD_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_KEYBOARD_TCA6416 is not set
+# CONFIG_KEYBOARD_TCA8418 is not set
+CONFIG_KEYBOARD_MATRIX=y
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_LM8333 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_SAMSUNG is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
+# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_ILI210X is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MMS114 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_PIXCIR is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
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
+CONFIG_VT_CONSOLE_SLEEP=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_TRACE_SINK is not set
+# CONFIG_DEVKMEM is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX310X is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_SCCNXP is not set
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_ARC is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_COMPAT is not set
+# CONFIG_I2C_CHARDEV is not set
+# CONFIG_I2C_MUX is not set
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_CBUS_GPIO is not set
+# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PCA_PLATFORM is not set
+CONFIG_I2C_PXA=y
+# CONFIG_I2C_PXA_PCI is not set
+# CONFIG_I2C_PXA_SLAVE is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_ALTERA is not set
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+# CONFIG_SPI_OC_TINY is not set
+CONFIG_SPI_PXA2XX=y
+# CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_SC18IS602 is not set
+# CONFIG_SPI_XCOMM is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_HSI is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+
+#
+# PPS generators support
+#
+
+#
+# PTP clock support
+#
+# CONFIG_PTP_1588_CLOCK is not set
+
+#
+# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
+#
+# CONFIG_PTP_1588_CLOCK_PCH is not set
+CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+# CONFIG_GPIO_SYSFS is not set
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_EM is not set
+CONFIG_GPIO_PXA=y
+# CONFIG_GPIO_TS5500 is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_SX150X is not set
+# CONFIG_GPIO_ADP5588 is not set
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
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+
+#
+# USB GPIO expanders:
+#
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2781 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_SBS is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_LP8727 is not set
+# CONFIG_CHARGER_GPIO is not set
+# CONFIG_CHARGER_BQ2415X is not set
+# CONFIG_CHARGER_SMB347 is not set
+# CONFIG_POWER_RESET is not set
+# CONFIG_POWER_AVS is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_BCMA_POSSIBLE=y
+
+#
+# Broadcom specific AMBA
+#
+# CONFIG_BCMA is not set
+
+#
+# Multifunction device drivers
+#
+CONFIG_MFD_CORE=y
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_88PM800 is not set
+# CONFIG_MFD_88PM805 is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_MFD_TI_AM335X_TSCADC is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_MFD_LM3533 is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS65217 is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_MFD_TPS80031 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_TWL6040_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+CONFIG_MFD_TMIO=y
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_SMSC is not set
+# CONFIG_MFD_TC6387XB is not set
+CONFIG_MFD_TC6393XB=y
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_DA9052_SPI is not set
+# CONFIG_MFD_DA9052_I2C is not set
+# CONFIG_MFD_DA9055 is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_LP8788 is not set
+# CONFIG_MFD_MAX77686 is not set
+# CONFIG_MFD_MAX77693 is not set
+# CONFIG_MFD_MAX8907 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_SEC_CORE is not set
+# CONFIG_MFD_ARIZONA_I2C is not set
+# CONFIG_MFD_ARIZONA_SPI is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX_SPI is not set
+# CONFIG_MFD_MC13XXX_I2C is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_TPS65090 is not set
+# CONFIG_MFD_AAT2870_CORE is not set
+# CONFIG_MFD_RC5T583 is not set
+# CONFIG_MFD_PALMAS is not set
+# CONFIG_MFD_RETU is not set
+# CONFIG_MFD_AS3711 is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_DRM is not set
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
+# CONFIG_FB_WMT_GE_ROPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_PXA is not set
+# CONFIG_FB_MBX is not set
+# CONFIG_FB_W100 is not set
+CONFIG_FB_TMIO=y
+CONFIG_FB_TMIO_ACCELL=y
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_AUO_K190X is not set
+# CONFIG_EXYNOS_VIDEO is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_CORGI is not set
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_ILI9320 is not set
+# CONFIG_LCD_TDO24M is not set
+# CONFIG_LCD_VGG2432A4 is not set
+# CONFIG_LCD_PLATFORM is not set
+CONFIG_LCD_TOSA=y
+# CONFIG_LCD_S6E63M0 is not set
+# CONFIG_LCD_LD9040 is not set
+# CONFIG_LCD_AMS369FG06 is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_GENERIC=y
+CONFIG_BACKLIGHT_TOSA=y
+# CONFIG_BACKLIGHT_ADP8860 is not set
+# CONFIG_BACKLIGHT_ADP8870 is not set
+# CONFIG_BACKLIGHT_LM3630 is not set
+# CONFIG_BACKLIGHT_LM3639 is not set
+# CONFIG_BACKLIGHT_LP855X is not set
+
+#
+# Console display driver support
+#
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
+CONFIG_FONTS=y
+# CONFIG_FONT_8x8 is not set
+CONFIG_FONT_8x16=y
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_FONT_AUTOSELECT=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+# CONFIG_SOUND is not set
+
+#
+# HID support
+#
+# CONFIG_HID is not set
+
+#
+# I2C HID support
+#
+# CONFIG_I2C_HID is not set
+CONFIG_USB_ARCH_HAS_OHCI=y
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+# CONFIG_MMC_CLKGATE is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+CONFIG_MMC_PXA=y
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_SDHCI_PXAV3 is not set
+# CONFIG_MMC_SDHCI_PXAV2 is not set
+# CONFIG_MMC_SPI is not set
+# CONFIG_MMC_TMIO is not set
+# CONFIG_MMC_DW is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_LM3530 is not set
+# CONFIG_LEDS_LM3642 is not set
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_PCA9633 is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+# CONFIG_LEDS_TCA6507 is not set
+# CONFIG_LEDS_LM355x is not set
+# CONFIG_LEDS_OT200 is not set
+# CONFIG_LEDS_BLINKM is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+# CONFIG_LEDS_TRIGGER_ONESHOT is not set
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_CPU is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_EDAC is not set
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
+# CONFIG_RTC_DRV_DS3232 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_ISL12022 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8523 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_BQ32K is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+# CONFIG_RTC_DRV_EM3027 is not set
+# CONFIG_RTC_DRV_RV3029C2 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T93 is not set
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
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_MSM6242 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_RP5C01 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+# CONFIG_RTC_DRV_DS2404 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_SA1100=y
+# CONFIG_RTC_DRV_PXA is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# Virtio drivers
+#
+# CONFIG_VIRTIO_MMIO is not set
+
+#
+# Microsoft Hyper-V guest support
+#
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+
+#
+# Remoteproc drivers (EXPERIMENTAL)
+#
+# CONFIG_STE_MODEM_RPROC is not set
+
+#
+# Rpmsg drivers (EXPERIMENTAL)
+#
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
+# CONFIG_EXTCON is not set
+# CONFIG_MEMORY is not set
+# CONFIG_IIO is not set
+# CONFIG_PWM is not set
+# CONFIG_IPACK_BUS is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+CONFIG_JBD2=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+# CONFIG_FILE_LOCKING is not set
+CONFIG_FSNOTIFY=y
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+CONFIG_GENERIC_ACL=y
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
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+# CONFIG_VFAT_FS_NO_DUALNAMES is not set
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES is not set
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
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
+# CONFIG_YAFFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+# CONFIG_JFFS2_FS_XATTR is not set
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_ZLIB=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RTIME=y
+CONFIG_JFFS2_RUBIN=y
+# CONFIG_JFFS2_CMODE_NONE is not set
+CONFIG_JFFS2_CMODE_PRIORITY=y
+# CONFIG_JFFS2_CMODE_SIZE is not set
+# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_QNX6FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+# CONFIG_F2FS_FS is not set
+# CONFIG_AUFS_FS is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+# CONFIG_NLS_CODEPAGE_437 is not set
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
+# CONFIG_NLS_ASCII is not set
+# CONFIG_NLS_ISO8859_1 is not set
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
+# CONFIG_NLS_MAC_ROMAN is not set
+# CONFIG_NLS_MAC_CELTIC is not set
+# CONFIG_NLS_MAC_CENTEURO is not set
+# CONFIG_NLS_MAC_CROATIAN is not set
+# CONFIG_NLS_MAC_CYRILLIC is not set
+# CONFIG_NLS_MAC_GAELIC is not set
+# CONFIG_NLS_MAC_GREEK is not set
+# CONFIG_NLS_MAC_ICELAND is not set
+# CONFIG_NLS_MAC_INUIT is not set
+# CONFIG_NLS_MAC_ROMANIAN is not set
+# CONFIG_NLS_MAC_TURKISH is not set
+# CONFIG_NLS_UTF8 is not set
+
+#
+# Kernel hacking
+#
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_READABLE_ASM is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_PANIC_ON_OOPS is not set
+CONFIG_PANIC_ON_OOPS_VALUE=0
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+CONFIG_HAVE_DEBUG_KMEMLEAK=y
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+CONFIG_FRAME_POINTER=y
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_NOTIFIER_ERROR_INJECTION is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_BRANCH_PROFILE_NONE is not set
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+# CONFIG_ARM_UNWIND is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+CONFIG_DEBUG_LL_INCLUDE="mach/debug-macro.S"
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_MANAGER2 is not set
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
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
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA1_ARM is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_AES_ARM is not set
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
+CONFIG_CRYPTO_DEFLATE=y
+# CONFIG_CRYPTO_ZLIB is not set
+CONFIG_CRYPTO_LZO=y
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
+CONFIG_GENERIC_STRNCPY_FROM_USER=y
+CONFIG_GENERIC_STRNLEN_USER=y
+CONFIG_GENERIC_PCI_IOMAP=y
+CONFIG_GENERIC_IO=y
+CONFIG_PERCPU_RWSEM=y
+# CONFIG_CRC_CCITT is not set
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC32_SELFTEST is not set
+CONFIG_CRC32_SLICEBY8=y
+# CONFIG_CRC32_SLICEBY4 is not set
+# CONFIG_CRC32_SARWATE is not set
+# CONFIG_CRC32_BIT is not set
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
+# CONFIG_AVERAGE is not set
+# CONFIG_CORDIC is not set
+# CONFIG_DDR is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-tiny.scc
new file mode 100644
index 0000000..e65e0ec
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-tiny.scc
@@ -0,0 +1,11 @@
+define KMACHINE tosa
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny/tiny.scc
+
+kconf hardware tosa-kexecboot.cfg
+
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
+patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend
new file mode 100644
index 0000000..1f7d07e
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend
@@ -0,0 +1,55 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.8:${THISDIR}/${PN}:${THISDIR}/files:"
+
+COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
+
+KMACHINE_akita = "akita"
+KMACHINE_c7x0 = "c7x0"
+KMACHINE_collie = "collie"
+KMACHINE_poodle = "poodle"
+KMACHINE_spitz = "spitz"
+KMACHINE_tosa = "tosa"
+
+# Zaurus machines need kernel size-check.
+KERNEL_IMAGE_MAXSIZE_akita = "1294336"
+KERNEL_IMAGE_MAXSIZE_c7x0 = "1294336"
+KERNEL_IMAGE_MAXSIZE_collie = "1048576"
+KERNEL_IMAGE_MAXSIZE_poodle = "1294336"
+KERNEL_IMAGE_MAXSIZE_tosa = "1294336"
+KERNEL_IMAGE_MAXSIZE_spitz = "1294336"
+
+SRC_URI_append_akita = " \
+           file://feature-top.scc \
+           file://vga/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_c7x0 = " \
+           file://feature-top.scc \
+           file://vga/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_collie = " \
+           file://feature-top.scc \
+           file://qvga/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_poodle = " \
+           file://feature-top.scc \
+           file://qvga/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_spitz = " \
+           file://feature-top.scc \
+           file://vga/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_tosa = " \
+           file://feature-top.scc \
+           file://vga/logo_linux_clut224.ppm.bz2 \
+           "
+
+do_configure_prepend() {
+
+    if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
+        install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm ${WORKDIR}/linux/drivers/video/logo/logo_linux_clut224.ppm
+    fi
+}
-- 
1.8.1.5


