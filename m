Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHNXR-0004Ml-Ic
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 00:58:22 +0200
Received: from mizar.localdomain (79.17.249.93) by smtp205.alice.it
	(8.6.023.02) id 4F421F7B059D1FBE; Tue, 10 Apr 2012 00:49:02 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:48:56 +0200
Message-Id: <1334011736-9053-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] Initial commit of linux-yocto-tiny_3.2 for Zaurus
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
X-List-Received-Date: Mon, 09 Apr 2012 22:58:22 -0000

* first testing, reuse full defconfigs as $machine.cfg
* (which can/need to be reduced down to a few fragments)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-tiny/akita/akita-tiny.scc    |    7 +
 .../linux/linux-yocto-tiny/akita/akita.cfg         | 2692 +++++++++++++++++++
 .../linux/linux-yocto-tiny/akita/akita.scc         |    7 +
 .../linux/linux-yocto-tiny/c7x0/c7x0-tiny.scc      |    7 +
 .../linux/linux-yocto-tiny/c7x0/c7x0.cfg           | 2412 ++++++++++++++++++
 .../linux/linux-yocto-tiny/c7x0/c7x0.scc           |    7 +
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 +
 .../linux/linux-yocto-tiny/collie/collie-tiny.scc  |    7 +
 .../linux/linux-yocto-tiny/collie/collie.cfg       | 2420 ++++++++++++++++++
 .../linux/linux-yocto-tiny/collie/collie.scc       |    7 +
 .../collie/collie_remove_irq_to_gpio.patch         |   31 +
 .../collie/locomo_kbd_tweak-r2.patch               |   66 +
 .../poodle/locomo_kbd_tweak-r2.patch               |   66 +
 .../linux/linux-yocto-tiny/poodle/poodle-tiny.scc  |    7 +
 .../linux/linux-yocto-tiny/poodle/poodle.cfg       | 2422 ++++++++++++++++++
 .../linux/linux-yocto-tiny/poodle/poodle.scc       |    7 +
 .../linux/linux-yocto-tiny/spitz/spitz-tiny.scc    |    7 +
 .../linux/linux-yocto-tiny/spitz/spitz.cfg         | 2691 +++++++++++++++++++
 .../linux/linux-yocto-tiny/spitz/spitz.scc         |    7 +
 .../linux/linux-yocto-tiny/tosa/tosa-tiny.scc      |    7 +
 .../linux/linux-yocto-tiny/tosa/tosa.cfg           | 2694 ++++++++++++++++++++
 .../linux/linux-yocto-tiny/tosa/tosa.scc           |    7 +
 recipes-kernel/linux/linux-yocto-tiny_3.2.bbappend |   36 +
 23 files changed, 15648 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/akita/akita-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/akita/akita.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/akita/akita.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/collie/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/collie/collie-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/collie/collie.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/collie/collie.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/collie/collie_remove_irq_to_gpio.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/collie/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/poodle/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/poodle/poodle-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/poodle/poodle.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/poodle/poodle.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/spitz/spitz-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/spitz/spitz.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/spitz/spitz.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/tosa/tosa-tiny.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/tosa/tosa.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny/tosa/tosa.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny_3.2.bbappend

diff --git a/recipes-kernel/linux/linux-yocto-tiny/akita/akita-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny/akita/akita-tiny.scc
new file mode 100644
index 0000000..d4ea50b
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/akita/akita-tiny.scc
@@ -0,0 +1,7 @@
+define KMACHINE akita
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny
+
+include akita.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/akita/akita.cfg b/recipes-kernel/linux/linux-yocto-tiny/akita/akita.cfg
new file mode 100644
index 0000000..d9096fd
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/akita/akita.cfg
@@ -0,0 +1,2692 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.2.12 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_HAVE_SCHED_CLOCK=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_GENERIC_BUG=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+# CONFIG_FHANDLE is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_HAVE_SPARSE_IRQ=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_SPARSE_IRQ=y
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+# CONFIG_CGROUP_DEBUG is not set
+# CONFIG_CGROUP_FREEZER is not set
+# CONFIG_CGROUP_DEVICE is not set
+# CONFIG_CPUSETS is not set
+# CONFIG_CGROUP_CPUACCT is not set
+# CONFIG_RESOURCE_COUNTERS is not set
+# CONFIG_CGROUP_PERF is not set
+# CONFIG_CGROUP_SCHED is not set
+# CONFIG_BLK_CGROUP is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=m
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=m
+CONFIG_IOSCHED_CFQ=m
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+CONFIG_INLINE_SPIN_UNLOCK=y
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_HIGHBANK is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_PRIMA2 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PICOXCELL is not set
+# CONFIG_ARCH_PNX4008 is not set
+CONFIG_ARCH_PXA=y
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_TCC_926 is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_VT8500 is not set
+# CONFIG_ARCH_ZYNQ is not set
+CONFIG_GPIO_PCA953X=y
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# Intel PXA2xx/PXA3xx Implementations
+#
+# CONFIG_ARCH_PXA_V7 is not set
+
+#
+# Intel/Marvell Dev Platforms (sorted by hardware release time)
+#
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
+# CONFIG_PXA_SHARPSL_DETECT_MACH_ID is not set
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
+
+#
+# System MMU
+#
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
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_DCACHE_DISABLE is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+CONFIG_IWMMXT=y
+CONFIG_XSCALE_PMU=y
+CONFIG_CPU_HAS_PMU=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+CONFIG_PCMCIA_LOAD_CIS=y
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
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_HW_PERF_EVENTS=y
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
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
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
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_FPE_NWFPE is not set
+# CONFIG_FPE_FASTFPE is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+CONFIG_BINFMT_AOUT=m
+CONFIG_BINFMT_MISC=m
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+CONFIG_PM_RUNTIME=y
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=m
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=m
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_XFRM_IPCOMP=m
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE_DEMUX is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=m
+CONFIG_INET_XFRM_MODE_TUNNEL=m
+CONFIG_INET_XFRM_MODE_BEET=m
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=m
+CONFIG_INET_TCP_DIAG=m
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+CONFIG_IPV6=m
+# CONFIG_IPV6_PRIVACY is not set
+# CONFIG_IPV6_ROUTER_PREF is not set
+# CONFIG_IPV6_OPTIMISTIC_DAD is not set
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_IPCOMP=m
+# CONFIG_IPV6_MIP6 is not set
+CONFIG_INET6_XFRM_TUNNEL=m
+CONFIG_INET6_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
+# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
+CONFIG_IPV6_SIT=m
+# CONFIG_IPV6_SIT_6RD is not set
+CONFIG_IPV6_NDISC_NODETYPE=y
+CONFIG_IPV6_TUNNEL=m
+# CONFIG_IPV6_MULTIPLE_TABLES is not set
+# CONFIG_IPV6_MROUTE is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+
+#
+# Core Netfilter Configuration
+#
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+CONFIG_NF_CONNTRACK=m
+# CONFIG_NF_CONNTRACK_MARK is not set
+# CONFIG_NF_CONNTRACK_EVENTS is not set
+# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
+# CONFIG_NF_CT_PROTO_DCCP is not set
+# CONFIG_NF_CT_PROTO_SCTP is not set
+# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_NF_CONNTRACK_AMANDA is not set
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_H323=m
+CONFIG_NF_CONNTRACK_IRC=m
+# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
+# CONFIG_NF_CONNTRACK_SNMP is not set
+# CONFIG_NF_CONNTRACK_PPTP is not set
+# CONFIG_NF_CONNTRACK_SANE is not set
+CONFIG_NF_CONNTRACK_SIP=m
+# CONFIG_NF_CONNTRACK_TFTP is not set
+# CONFIG_NF_CT_NETLINK is not set
+# CONFIG_NETFILTER_TPROXY is not set
+CONFIG_NETFILTER_XTABLES=m
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+# CONFIG_NETFILTER_XT_CONNMARK is not set
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set
+# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
+# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
+# CONFIG_NETFILTER_XT_TARGET_CT is not set
+# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+CONFIG_NETFILTER_XT_TARGET_HL=m
+# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
+# CONFIG_NETFILTER_XT_TARGET_LED is not set
+# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
+# CONFIG_NETFILTER_XT_MATCH_CPU is not set
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
+CONFIG_NETFILTER_XT_MATCH_HL=m
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_MAC is not set
+# CONFIG_NETFILTER_XT_MATCH_MARK is not set
+# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
+# CONFIG_NETFILTER_XT_MATCH_STATE is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_DEFRAG_IPV4=m
+CONFIG_NF_CONNTRACK_IPV4=m
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+# CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_TTL=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_TARGET_LOG=m
+CONFIG_IP_NF_TARGET_ULOG=m
+CONFIG_NF_NAT=m
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_NETMAP=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_NF_NAT_FTP=m
+CONFIG_NF_NAT_IRC=m
+# CONFIG_NF_NAT_TFTP is not set
+# CONFIG_NF_NAT_AMANDA is not set
+# CONFIG_NF_NAT_PPTP is not set
+CONFIG_NF_NAT_H323=m
+CONFIG_NF_NAT_SIP=m
+CONFIG_IP_NF_MANGLE=m
+# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_NF_RAW=m
+CONFIG_IP_NF_ARPTABLES=m
+CONFIG_IP_NF_ARPFILTER=m
+CONFIG_IP_NF_ARP_MANGLE=m
+
+#
+# IPv6: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV6 is not set
+# CONFIG_NF_CONNTRACK_IPV6 is not set
+# CONFIG_IP6_NF_QUEUE is not set
+# CONFIG_IP6_NF_IPTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
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
+# CONFIG_DCB is not set
+CONFIG_DNS_RESOLVER=y
+# CONFIG_BATMAN_ADV is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+CONFIG_IRDA=m
+
+#
+# IrDA protocols
+#
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
+# CONFIG_IRDA_ULTRA is not set
+
+#
+# IrDA options
+#
+# CONFIG_IRDA_CACHE_LAST_LSAP is not set
+# CONFIG_IRDA_FAST_RR is not set
+# CONFIG_IRDA_DEBUG is not set
+
+#
+# Infrared-port device drivers
+#
+
+#
+# SIR device drivers
+#
+# CONFIG_IRTTY_SIR is not set
+
+#
+# Dongle support
+#
+# CONFIG_KINGSUN_DONGLE is not set
+# CONFIG_KSDAZZLE_DONGLE is not set
+# CONFIG_KS959_DONGLE is not set
+
+#
+# FIR device drivers
+#
+# CONFIG_USB_IRDA is not set
+# CONFIG_SIGMATEL_FIR is not set
+CONFIG_PXA_FICP=m
+# CONFIG_MCS_FIR is not set
+CONFIG_BT=m
+CONFIG_BT_L2CAP=y
+CONFIG_BT_SCO=y
+CONFIG_BT_RFCOMM=m
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=m
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=m
+
+#
+# Bluetooth device drivers
+#
+CONFIG_BT_HCIBTUSB=m
+CONFIG_BT_HCIBTSDIO=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIBCM203X=m
+CONFIG_BT_HCIBPA10X=m
+CONFIG_BT_HCIBFUSB=m
+CONFIG_BT_HCIDTL1=m
+CONFIG_BT_HCIBT3C=m
+CONFIG_BT_HCIBLUECARD=m
+CONFIG_BT_HCIBTUART=m
+CONFIG_BT_HCIVHCI=m
+CONFIG_BT_MRVL=m
+CONFIG_BT_MRVL_SDIO=m
+CONFIG_BT_ATH3K=m
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_WEXT_SPY=y
+CONFIG_WEXT_PRIV=y
+CONFIG_CFG80211=m
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+# CONFIG_CFG80211_DEFAULT_PS is not set
+# CONFIG_CFG80211_DEBUGFS is not set
+# CONFIG_CFG80211_INTERNAL_REGDB is not set
+CONFIG_CFG80211_WEXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+CONFIG_LIB80211_CRYPT_WEP=m
+CONFIG_LIB80211_CRYPT_CCMP=m
+CONFIG_LIB80211_CRYPT_TKIP=m
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=m
+# CONFIG_MAC80211_RC_PID is not set
+# CONFIG_MAC80211_RC_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT=""
+
+#
+# Some wireless drivers require a rate control algorithm
+#
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUGFS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+# CONFIG_CEPH_LIB is not set
+# CONFIG_NFC is not set
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
+CONFIG_REGMAP=y
+CONFIG_REGMAP_I2C=m
+CONFIG_REGMAP_SPI=m
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_TESTS is not set
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
+# CONFIG_MTD_SWAP is not set
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
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+CONFIG_MTD_NAND_SHARPSL=y
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_RESERVE=1
+CONFIG_MTD_UBI_GLUEBI=m
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_BLK_DEV_RBD is not set
+# CONFIG_SENSORS_LIS3LV02D is not set
+CONFIG_MISC_DEVICES=y
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
+# CONFIG_BMP085 is not set
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
+# CONFIG_IWMC3200TOP is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_TI_ST is not set
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
+CONFIG_BLK_DEV_SR=m
+# CONFIG_BLK_DEV_SR_VENDOR is not set
+CONFIG_CHR_DEV_SG=m
+# CONFIG_CHR_DEV_SCH is not set
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
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
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+CONFIG_ATA_VERBOSE_ERROR=y
+CONFIG_SATA_PMP=y
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
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+# CONFIG_BONDING is not set
+# CONFIG_DUMMY is not set
+# CONFIG_EQUALIZER is not set
+CONFIG_MII=m
+# CONFIG_MACVLAN is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+CONFIG_TUN=m
+# CONFIG_VETH is not set
+# CONFIG_ARCNET is not set
+
+#
+# CAIF transport drivers
+#
+CONFIG_ETHERNET=y
+CONFIG_NET_VENDOR_3COM=y
+# CONFIG_PCMCIA_3C574 is not set
+# CONFIG_PCMCIA_3C589 is not set
+CONFIG_NET_VENDOR_AMD=y
+# CONFIG_PCMCIA_NMCLAN is not set
+CONFIG_NET_VENDOR_BROADCOM=y
+# CONFIG_B44 is not set
+CONFIG_NET_VENDOR_CHELSIO=y
+# CONFIG_DM9000 is not set
+# CONFIG_DNET is not set
+CONFIG_NET_VENDOR_FARADAY=y
+# CONFIG_FTMAC100 is not set
+# CONFIG_FTGMAC100 is not set
+CONFIG_NET_VENDOR_FUJITSU=y
+# CONFIG_PCMCIA_FMVJ18X is not set
+CONFIG_NET_VENDOR_INTEL=y
+CONFIG_NET_VENDOR_I825XX=y
+CONFIG_NET_VENDOR_MARVELL=y
+CONFIG_NET_VENDOR_MICREL=y
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_NET_VENDOR_MICROCHIP=y
+# CONFIG_ENC28J60 is not set
+CONFIG_NET_VENDOR_NATSEMI=y
+CONFIG_NET_VENDOR_8390=y
+# CONFIG_PCMCIA_AXNET is not set
+# CONFIG_AX88796 is not set
+CONFIG_PCMCIA_PCNET=m
+# CONFIG_ETHOC is not set
+CONFIG_NET_VENDOR_SEEQ=y
+# CONFIG_SEEQ8005 is not set
+CONFIG_NET_VENDOR_SMSC=y
+# CONFIG_SMC91X is not set
+# CONFIG_PCMCIA_SMC91C92 is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+CONFIG_NET_VENDOR_STMICRO=y
+# CONFIG_STMMAC_ETH is not set
+CONFIG_NET_VENDOR_XIRCOM=y
+# CONFIG_PCMCIA_XIRC2PS is not set
+# CONFIG_PHYLIB is not set
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+# CONFIG_PPP_FILTER is not set
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPPOE is not set
+CONFIG_PPP_ASYNC=m
+# CONFIG_PPP_SYNC_TTY is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=m
+# CONFIG_TR is not set
+
+#
+# USB Network Adapters
+#
+CONFIG_USB_CATC=m
+CONFIG_USB_KAWETH=m
+CONFIG_USB_PEGASUS=m
+CONFIG_USB_RTL8150=m
+CONFIG_USB_USBNET=m
+CONFIG_USB_NET_AX8817X=m
+CONFIG_USB_NET_CDCETHER=m
+# CONFIG_USB_NET_CDC_EEM is not set
+CONFIG_USB_NET_CDC_NCM=m
+CONFIG_USB_NET_DM9601=m
+# CONFIG_USB_NET_SMSC75XX is not set
+# CONFIG_USB_NET_SMSC95XX is not set
+# CONFIG_USB_NET_GL620A is not set
+CONFIG_USB_NET_NET1080=m
+# CONFIG_USB_NET_PLUSB is not set
+# CONFIG_USB_NET_MCS7830 is not set
+# CONFIG_USB_NET_RNDIS_HOST is not set
+# CONFIG_USB_NET_CDC_SUBSET is not set
+CONFIG_USB_NET_ZAURUS=m
+# CONFIG_USB_NET_CX82310_ETH is not set
+# CONFIG_USB_NET_KALMIA is not set
+# CONFIG_USB_NET_INT51X1 is not set
+# CONFIG_USB_IPHETH is not set
+CONFIG_USB_SIERRA_NET=m
+# CONFIG_USB_VL600 is not set
+CONFIG_WLAN=y
+# CONFIG_PCMCIA_RAYCS is not set
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_ATMEL is not set
+# CONFIG_AT76C50X_USB is not set
+CONFIG_AIRO_CS=m
+# CONFIG_PCMCIA_WL3501 is not set
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_USB_NET_RNDIS_WLAN is not set
+# CONFIG_RTL8187 is not set
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_ATH_COMMON is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+# CONFIG_BRCMFMAC is not set
+CONFIG_HOSTAP=m
+CONFIG_HOSTAP_FIRMWARE=y
+# CONFIG_HOSTAP_FIRMWARE_NVRAM is not set
+CONFIG_HOSTAP_CS=m
+# CONFIG_IWM is not set
+# CONFIG_LIBERTAS is not set
+# CONFIG_HERMES is not set
+# CONFIG_P54_COMMON is not set
+# CONFIG_RT2X00 is not set
+# CONFIG_RTL8192CU is not set
+# CONFIG_WL1251 is not set
+# CONFIG_WL12XX_MENU is not set
+# CONFIG_ZD1211RW is not set
+# CONFIG_MWIFIEX is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+# CONFIG_WAN is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
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
+CONFIG_KEYBOARD_MATRIX=y
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_PXA27x is not set
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
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_WM97XX is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
+CONFIG_INPUT_MISC=y
+# CONFIG_INPUT_AD714X is not set
+# CONFIG_INPUT_BMA150 is not set
+# CONFIG_INPUT_MMA8450 is not set
+# CONFIG_INPUT_MPU3050 is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_KXTJ9 is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_UINPUT=m
+# CONFIG_INPUT_PCF8574 is not set
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
+# CONFIG_INPUT_ADXL34X is not set
+# CONFIG_INPUT_CMA3000 is not set
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
+# CONFIG_N_GSM is not set
+# CONFIG_TRACE_SINK is not set
+CONFIG_DEVKMEM=y
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250_CS=m
+CONFIG_SERIAL_8250_NR_UARTS=4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=m
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_IPWIRELESS is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_RAMOOPS is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
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
+# CONFIG_I2C_DIOLAN_U2C is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_STUB is not set
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
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
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
+
+#
+# Enable Device Drivers -> PPS to see the PTP clock options.
+#
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_IT8761E is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X_IRQ is not set
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
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+CONFIG_POWER_SUPPLY_DEBUG=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ20Z75 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_ISP1704 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_GPIO is not set
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
+# CONFIG_SENSORS_MAX6639 is not set
+# CONFIG_SENSORS_MAX6642 is not set
+# CONFIG_SENSORS_MAX6650 is not set
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
+# CONFIG_SENSORS_SCH5627 is not set
+# CONFIG_SENSORS_SCH5636 is not set
+# CONFIG_SENSORS_ADS1015 is not set
+# CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_ADS7871 is not set
+# CONFIG_SENSORS_AMC6821 is not set
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
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_AAT2870_CORE is not set
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
+CONFIG_FB_PXA_OVERLAY=y
+CONFIG_FB_PXA_SMARTPANEL=y
+CONFIG_FB_PXA_PARAMETERS=y
+# CONFIG_PXA3XX_GCU is not set
+# CONFIG_FB_MBX is not set
+# CONFIG_FB_W100 is not set
+# CONFIG_FB_SMSCUFX is not set
+# CONFIG_FB_UDL is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_BROADSHEET is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LCD_CORGI=y
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
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
+
+#
+# Display device support
+#
+CONFIG_DISPLAY_SUPPORT=y
+
+#
+# Display hardware drivers
+#
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
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=m
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SOUND_OSS_CORE_PRECLAIM=y
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+CONFIG_SND_HWDEP=m
+CONFIG_SND_RAWMIDI=m
+CONFIG_SND_JACK=y
+CONFIG_SND_SEQUENCER=m
+# CONFIG_SND_SEQ_DUMMY is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_SEQUENCER_OSS is not set
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_VMASTER=y
+CONFIG_SND_RAWMIDI_SEQ=m
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+CONFIG_SND_AC97_CODEC=m
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_ALOOP is not set
+# CONFIG_SND_VIRMIDI is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+# CONFIG_SND_AC97_POWER_SAVE is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_PXA2XX_PCM=m
+CONFIG_SND_PXA2XX_LIB=m
+CONFIG_SND_PXA2XX_LIB_AC97=y
+CONFIG_SND_PXA2XX_AC97=m
+CONFIG_SND_SPI=y
+CONFIG_SND_USB=y
+CONFIG_SND_USB_AUDIO=m
+# CONFIG_SND_USB_UA101 is not set
+# CONFIG_SND_USB_CAIAQ is not set
+# CONFIG_SND_USB_6FIRE is not set
+CONFIG_SND_PCMCIA=y
+# CONFIG_SND_VXPOCKET is not set
+# CONFIG_SND_PDAUDIOCF is not set
+CONFIG_SND_SOC=m
+# CONFIG_SND_SOC_CACHE_LZO is not set
+CONFIG_SND_PXA2XX_SOC=m
+CONFIG_SND_PXA2XX_SOC_I2S=m
+CONFIG_SND_PXA2XX_SOC_SPITZ=m
+CONFIG_SND_SOC_I2C_AND_SPI=m
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_WM8750=m
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=m
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=m
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=m
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# USB HID Boot Protocol drivers
+#
+CONFIG_USB_KBD=m
+CONFIG_USB_MOUSE=m
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_ACRUX is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_PRODIKEYS is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_DRAGONRISE is not set
+# CONFIG_HID_EMS_FF is not set
+# CONFIG_HID_ELECOM is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_HOLTEK is not set
+# CONFIG_HID_KEYTOUCH is not set
+# CONFIG_HID_KYE is not set
+# CONFIG_HID_UCLOGIC is not set
+# CONFIG_HID_WALTOP is not set
+# CONFIG_HID_GYRATION is not set
+# CONFIG_HID_TWINHAN is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LCPOWER is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MAGICMOUSE is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_MULTITOUCH is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_ORTEK is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_PICOLCD is not set
+# CONFIG_HID_PRIMAX is not set
+# CONFIG_HID_QUANTA is not set
+# CONFIG_HID_ROCCAT is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_SPEEDLINK is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_WACOM is not set
+# CONFIG_HID_WIIMOTE is not set
+# CONFIG_HID_ZEROPLUS is not set
+# CONFIG_HID_ZYDACRON is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=m
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+CONFIG_USB=m
+CONFIG_USB_DEBUG=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_SUSPEND is not set
+CONFIG_USB_OTG_WHITELIST=y
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_DWC3 is not set
+CONFIG_USB_MON=m
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
+CONFIG_USB_OHCI_HCD=m
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=y
+CONFIG_USB_SL811_HCD=m
+# CONFIG_USB_SL811_HCD_ISO is not set
+CONFIG_USB_SL811_CS=m
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_RENESAS_USBHS is not set
+
+#
+# USB Device Class drivers
+#
+CONFIG_USB_ACM=m
+CONFIG_USB_PRINTER=m
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
+CONFIG_USB_STORAGE=m
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_REALTEK is not set
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
+# CONFIG_USB_STORAGE_ENE_UB6250 is not set
+# CONFIG_USB_UAS is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+CONFIG_USB_MDC800=m
+CONFIG_USB_MICROTEK=m
+
+#
+# USB port drivers
+#
+CONFIG_USB_SERIAL=m
+CONFIG_USB_EZUSB=y
+CONFIG_USB_SERIAL_GENERIC=y
+# CONFIG_USB_SERIAL_AIRCABLE is not set
+# CONFIG_USB_SERIAL_ARK3116 is not set
+CONFIG_USB_SERIAL_BELKIN=m
+# CONFIG_USB_SERIAL_CH341 is not set
+# CONFIG_USB_SERIAL_WHITEHEAT is not set
+CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
+# CONFIG_USB_SERIAL_CP210X is not set
+CONFIG_USB_SERIAL_CYPRESS_M8=m
+CONFIG_USB_SERIAL_EMPEG=m
+CONFIG_USB_SERIAL_FTDI_SIO=m
+# CONFIG_USB_SERIAL_FUNSOFT is not set
+CONFIG_USB_SERIAL_VISOR=m
+CONFIG_USB_SERIAL_IPAQ=m
+CONFIG_USB_SERIAL_IR=m
+CONFIG_USB_SERIAL_EDGEPORT=m
+CONFIG_USB_SERIAL_EDGEPORT_TI=m
+CONFIG_USB_SERIAL_GARMIN=m
+CONFIG_USB_SERIAL_IPW=m
+# CONFIG_USB_SERIAL_IUU is not set
+CONFIG_USB_SERIAL_KEYSPAN_PDA=m
+CONFIG_USB_SERIAL_KEYSPAN=m
+# CONFIG_USB_SERIAL_KEYSPAN_MPR is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28 is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28X is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28XA is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28XB is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19 is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA18X is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19W is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19QW is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19QI is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA49W is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA49WLC is not set
+CONFIG_USB_SERIAL_KLSI=m
+CONFIG_USB_SERIAL_KOBIL_SCT=m
+CONFIG_USB_SERIAL_MCT_U232=m
+# CONFIG_USB_SERIAL_MOS7720 is not set
+# CONFIG_USB_SERIAL_MOS7840 is not set
+# CONFIG_USB_SERIAL_MOTOROLA is not set
+# CONFIG_USB_SERIAL_NAVMAN is not set
+CONFIG_USB_SERIAL_PL2303=m
+# CONFIG_USB_SERIAL_OTI6858 is not set
+# CONFIG_USB_SERIAL_QCAUX is not set
+# CONFIG_USB_SERIAL_QUALCOMM is not set
+# CONFIG_USB_SERIAL_SPCP8X5 is not set
+# CONFIG_USB_SERIAL_HP4X is not set
+CONFIG_USB_SERIAL_SAFE=m
+# CONFIG_USB_SERIAL_SAFE_PADDED is not set
+# CONFIG_USB_SERIAL_SIEMENS_MPI is not set
+# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
+# CONFIG_USB_SERIAL_SYMBOL is not set
+CONFIG_USB_SERIAL_TI=m
+CONFIG_USB_SERIAL_CYBERJACK=m
+CONFIG_USB_SERIAL_XIRCOM=m
+CONFIG_USB_SERIAL_WWAN=m
+# CONFIG_USB_SERIAL_OPTION is not set
+CONFIG_USB_SERIAL_OMNINET=m
+# CONFIG_USB_SERIAL_OPTICON is not set
+# CONFIG_USB_SERIAL_VIVOPAY_SERIAL is not set
+# CONFIG_USB_SERIAL_ZIO is not set
+# CONFIG_USB_SERIAL_SSU100 is not set
+# CONFIG_USB_SERIAL_DEBUG is not set
+
+#
+# USB Miscellaneous drivers
+#
+CONFIG_USB_EMI62=m
+CONFIG_USB_EMI26=m
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+CONFIG_USB_RIO500=m
+CONFIG_USB_LEGOTOWER=m
+CONFIG_USB_LCD=m
+CONFIG_USB_LED=m
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+CONFIG_USB_CYTHERM=m
+CONFIG_USB_IDMOUSE=m
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_YUREX is not set
+CONFIG_USB_GADGET=m
+# CONFIG_USB_GADGET_DEBUG is not set
+CONFIG_USB_GADGET_DEBUG_FILES=y
+CONFIG_USB_GADGET_DEBUG_FS=y
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+# CONFIG_USB_FUSB300 is not set
+# CONFIG_USB_R8A66597 is not set
+CONFIG_USB_PXA27X=m
+# CONFIG_USB_M66592 is not set
+# CONFIG_USB_NET2272 is not set
+# CONFIG_USB_DUMMY_HCD is not set
+CONFIG_USB_ZERO=m
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+CONFIG_USB_ETH_EEM=y
+# CONFIG_USB_G_NCM is not set
+CONFIG_USB_GADGETFS=m
+# CONFIG_USB_FUNCTIONFS is not set
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+CONFIG_USB_CDC_COMPOSITE=m
+# CONFIG_USB_G_ACM_MS is not set
+CONFIG_USB_G_MULTI=m
+CONFIG_USB_G_MULTI_RNDIS=y
+CONFIG_USB_G_MULTI_CDC=y
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+CONFIG_USB_GPIO_VBUS=m
+CONFIG_USB_ULPI=y
+CONFIG_NOP_USB_XCEIV=m
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
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
+CONFIG_MMC_SPI=y
+# CONFIG_MMC_DW is not set
+# CONFIG_MMC_VUB300 is not set
+# CONFIG_MMC_USHC is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_LM3530 is not set
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
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
+# CONFIG_VIRTIO_BALLOON is not set
+# CONFIG_VIRTIO_MMIO is not set
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
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
+CONFIG_EXT4_FS_XATTR=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+CONFIG_JBD2=y
+# CONFIG_JBD2_DEBUG is not set
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+CONFIG_EXPORTFS=m
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+CONFIG_AUTOFS4_FS=y
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
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
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
+# CONFIG_UBIFS_FS_XATTR is not set
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_UBIFS_FS_DEBUG is not set
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=m
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+# CONFIG_NFS_USE_LEGACY_DNS is not set
+CONFIG_NFS_USE_KERNEL_DNS=y
+# CONFIG_NFS_USE_NEW_IDMAPPER is not set
+CONFIG_NFSD=m
+CONFIG_NFSD_V3=y
+# CONFIG_NFSD_V3_ACL is not set
+CONFIG_NFSD_V4=y
+CONFIG_LOCKD=m
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=m
+CONFIG_SUNRPC_GSS=m
+# CONFIG_CEPH_FS is not set
+CONFIG_CIFS=m
+# CONFIG_CIFS_STATS is not set
+# CONFIG_CIFS_WEAK_PW_HASH is not set
+# CONFIG_CIFS_UPCALL is not set
+# CONFIG_CIFS_XATTR is not set
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_DFS_UPCALL is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
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
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="cp437"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_737=m
+CONFIG_NLS_CODEPAGE_775=m
+CONFIG_NLS_CODEPAGE_850=m
+CONFIG_NLS_CODEPAGE_852=m
+CONFIG_NLS_CODEPAGE_855=m
+CONFIG_NLS_CODEPAGE_857=m
+CONFIG_NLS_CODEPAGE_860=m
+CONFIG_NLS_CODEPAGE_861=m
+CONFIG_NLS_CODEPAGE_862=m
+CONFIG_NLS_CODEPAGE_863=m
+CONFIG_NLS_CODEPAGE_864=m
+CONFIG_NLS_CODEPAGE_865=m
+CONFIG_NLS_CODEPAGE_866=m
+CONFIG_NLS_CODEPAGE_869=m
+CONFIG_NLS_CODEPAGE_936=m
+CONFIG_NLS_CODEPAGE_950=m
+CONFIG_NLS_CODEPAGE_932=m
+CONFIG_NLS_CODEPAGE_949=m
+CONFIG_NLS_CODEPAGE_874=m
+CONFIG_NLS_ISO8859_8=m
+CONFIG_NLS_CODEPAGE_1250=m
+CONFIG_NLS_CODEPAGE_1251=m
+CONFIG_NLS_ASCII=m
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_2=m
+CONFIG_NLS_ISO8859_3=m
+CONFIG_NLS_ISO8859_4=m
+CONFIG_NLS_ISO8859_5=m
+CONFIG_NLS_ISO8859_6=m
+CONFIG_NLS_ISO8859_7=m
+CONFIG_NLS_ISO8859_9=m
+CONFIG_NLS_ISO8859_13=m
+CONFIG_NLS_ISO8859_14=m
+CONFIG_NLS_ISO8859_15=m
+CONFIG_NLS_KOI8_R=m
+CONFIG_NLS_KOI8_U=m
+CONFIG_NLS_UTF8=y
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
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
+CONFIG_DEBUG_BUGVERBOSE=y
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_LKDTM is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_RING_BUFFER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_ENCRYPTED_KEYS is not set
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
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
+CONFIG_CRYPTO_AEAD=m
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=m
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=m
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG=m
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP2=y
+CONFIG_CRYPTO_MANAGER=m
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_USER is not set
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_GF128MUL is not set
+CONFIG_CRYPTO_NULL=m
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_AUTHENC=m
+CONFIG_CRYPTO_TEST=m
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
+CONFIG_CRYPTO_CBC=m
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=m
+# CONFIG_CRYPTO_LRW is not set
+CONFIG_CRYPTO_PCBC=m
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_HMAC=m
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=m
+# CONFIG_CRYPTO_GHASH is not set
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_MD5=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=m
+CONFIG_CRYPTO_SHA256=m
+CONFIG_CRYPTO_SHA512=m
+# CONFIG_CRYPTO_TGR192 is not set
+CONFIG_CRYPTO_WP512=m
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_BLOWFISH_COMMON=m
+CONFIG_CRYPTO_CAMELLIA=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_DES=m
+# CONFIG_CRYPTO_FCRYPT is not set
+CONFIG_CRYPTO_KHAZAD=m
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TEA=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_TWOFISH_COMMON=m
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
+CONFIG_CRYPTO_ANSI_CPRNG=m
+# CONFIG_CRYPTO_USER_API_HASH is not set
+# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC32=y
+CONFIG_CRC7=y
+CONFIG_LIBCRC32C=m
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_DECOMPRESS_LZO=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_AVERAGE=y
+# CONFIG_CORDIC is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny/akita/akita.scc b/recipes-kernel/linux/linux-yocto-tiny/akita/akita.scc
new file mode 100644
index 0000000..4c4c5a2
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/akita/akita.scc
@@ -0,0 +1,7 @@
+kconf hardware akita.cfg
+
+# non hardware
+#include cfg/devtmpfs.scc
+#include cfg/sound.scc
+#include cfg/usb-mass-storage.scc
+#include cfg/fs.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0-tiny.scc
new file mode 100644
index 0000000..2849f46
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0-tiny.scc
@@ -0,0 +1,7 @@
+define KMACHINE c7x0
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny
+
+include c7x0.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0.cfg b/recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0.cfg
new file mode 100644
index 0000000..87731b6
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0.cfg
@@ -0,0 +1,2412 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.2.12 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_HAVE_SCHED_CLOCK=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_GENERIC_BUG=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+# CONFIG_FHANDLE is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_HAVE_SPARSE_IRQ=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_SPARSE_IRQ=y
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+# CONFIG_CGROUP_DEBUG is not set
+# CONFIG_CGROUP_FREEZER is not set
+# CONFIG_CGROUP_DEVICE is not set
+# CONFIG_CPUSETS is not set
+# CONFIG_CGROUP_CPUACCT is not set
+# CONFIG_RESOURCE_COUNTERS is not set
+# CONFIG_CGROUP_PERF is not set
+# CONFIG_CGROUP_SCHED is not set
+# CONFIG_BLK_CGROUP is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=m
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=m
+CONFIG_IOSCHED_CFQ=m
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+CONFIG_INLINE_SPIN_UNLOCK=y
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_HIGHBANK is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_PRIMA2 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PICOXCELL is not set
+# CONFIG_ARCH_PNX4008 is not set
+CONFIG_ARCH_PXA=y
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_TCC_926 is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_VT8500 is not set
+# CONFIG_ARCH_ZYNQ is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# Intel PXA2xx/PXA3xx Implementations
+#
+# CONFIG_ARCH_PXA_V7 is not set
+
+#
+# Intel/Marvell Dev Platforms (sorted by hardware release time)
+#
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
+# CONFIG_PXA_SHARPSL_DETECT_MACH_ID is not set
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
+
+#
+# System MMU
+#
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
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_DCACHE_DISABLE is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+# CONFIG_IWMMXT is not set
+CONFIG_XSCALE_PMU=y
+CONFIG_CPU_HAS_PMU=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+CONFIG_PCMCIA_LOAD_CIS=y
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
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_HW_PERF_EVENTS=y
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
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 loglevel=3"
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
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_FPE_NWFPE is not set
+# CONFIG_FPE_FASTFPE is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+CONFIG_BINFMT_AOUT=m
+CONFIG_BINFMT_MISC=m
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+CONFIG_PM_RUNTIME=y
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=m
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=m
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_XFRM_IPCOMP=m
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE_DEMUX is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=m
+CONFIG_INET_XFRM_MODE_TUNNEL=m
+CONFIG_INET_XFRM_MODE_BEET=m
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=m
+CONFIG_INET_TCP_DIAG=m
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+CONFIG_IPV6=m
+# CONFIG_IPV6_PRIVACY is not set
+# CONFIG_IPV6_ROUTER_PREF is not set
+# CONFIG_IPV6_OPTIMISTIC_DAD is not set
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_IPCOMP=m
+# CONFIG_IPV6_MIP6 is not set
+CONFIG_INET6_XFRM_TUNNEL=m
+CONFIG_INET6_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
+# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
+CONFIG_IPV6_SIT=m
+# CONFIG_IPV6_SIT_6RD is not set
+CONFIG_IPV6_NDISC_NODETYPE=y
+CONFIG_IPV6_TUNNEL=m
+# CONFIG_IPV6_MULTIPLE_TABLES is not set
+# CONFIG_IPV6_MROUTE is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+
+#
+# Core Netfilter Configuration
+#
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+CONFIG_NF_CONNTRACK=m
+# CONFIG_NF_CONNTRACK_MARK is not set
+# CONFIG_NF_CONNTRACK_EVENTS is not set
+# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
+# CONFIG_NF_CT_PROTO_DCCP is not set
+# CONFIG_NF_CT_PROTO_SCTP is not set
+# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_NF_CONNTRACK_AMANDA is not set
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_H323=m
+CONFIG_NF_CONNTRACK_IRC=m
+# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
+# CONFIG_NF_CONNTRACK_SNMP is not set
+# CONFIG_NF_CONNTRACK_PPTP is not set
+# CONFIG_NF_CONNTRACK_SANE is not set
+CONFIG_NF_CONNTRACK_SIP=m
+# CONFIG_NF_CONNTRACK_TFTP is not set
+# CONFIG_NF_CT_NETLINK is not set
+# CONFIG_NETFILTER_TPROXY is not set
+CONFIG_NETFILTER_XTABLES=m
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+# CONFIG_NETFILTER_XT_CONNMARK is not set
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set
+# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
+# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
+# CONFIG_NETFILTER_XT_TARGET_CT is not set
+# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+CONFIG_NETFILTER_XT_TARGET_HL=m
+# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
+# CONFIG_NETFILTER_XT_TARGET_LED is not set
+# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
+# CONFIG_NETFILTER_XT_MATCH_CPU is not set
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
+CONFIG_NETFILTER_XT_MATCH_HL=m
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_MAC is not set
+# CONFIG_NETFILTER_XT_MATCH_MARK is not set
+# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
+# CONFIG_NETFILTER_XT_MATCH_STATE is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_DEFRAG_IPV4=m
+CONFIG_NF_CONNTRACK_IPV4=m
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+# CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_TTL=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_TARGET_LOG=m
+CONFIG_IP_NF_TARGET_ULOG=m
+CONFIG_NF_NAT=m
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_NETMAP=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_NF_NAT_FTP=m
+CONFIG_NF_NAT_IRC=m
+# CONFIG_NF_NAT_TFTP is not set
+# CONFIG_NF_NAT_AMANDA is not set
+# CONFIG_NF_NAT_PPTP is not set
+CONFIG_NF_NAT_H323=m
+CONFIG_NF_NAT_SIP=m
+CONFIG_IP_NF_MANGLE=m
+# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_NF_RAW=m
+CONFIG_IP_NF_ARPTABLES=m
+CONFIG_IP_NF_ARPFILTER=m
+CONFIG_IP_NF_ARP_MANGLE=m
+
+#
+# IPv6: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV6 is not set
+# CONFIG_NF_CONNTRACK_IPV6 is not set
+# CONFIG_IP6_NF_QUEUE is not set
+# CONFIG_IP6_NF_IPTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
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
+# CONFIG_DCB is not set
+CONFIG_DNS_RESOLVER=y
+# CONFIG_BATMAN_ADV is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+CONFIG_IRDA=m
+
+#
+# IrDA protocols
+#
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
+# CONFIG_IRDA_ULTRA is not set
+
+#
+# IrDA options
+#
+# CONFIG_IRDA_CACHE_LAST_LSAP is not set
+# CONFIG_IRDA_FAST_RR is not set
+# CONFIG_IRDA_DEBUG is not set
+
+#
+# Infrared-port device drivers
+#
+
+#
+# SIR device drivers
+#
+# CONFIG_IRTTY_SIR is not set
+
+#
+# Dongle support
+#
+
+#
+# FIR device drivers
+#
+CONFIG_PXA_FICP=m
+CONFIG_BT=m
+CONFIG_BT_L2CAP=y
+CONFIG_BT_SCO=y
+CONFIG_BT_RFCOMM=m
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=m
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=m
+
+#
+# Bluetooth device drivers
+#
+CONFIG_BT_HCIBTSDIO=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIDTL1=m
+CONFIG_BT_HCIBT3C=m
+CONFIG_BT_HCIBLUECARD=m
+CONFIG_BT_HCIBTUART=m
+CONFIG_BT_HCIVHCI=m
+CONFIG_BT_MRVL=m
+CONFIG_BT_MRVL_SDIO=m
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_WEXT_SPY=y
+CONFIG_WEXT_PRIV=y
+CONFIG_CFG80211=m
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+# CONFIG_CFG80211_DEFAULT_PS is not set
+# CONFIG_CFG80211_DEBUGFS is not set
+# CONFIG_CFG80211_INTERNAL_REGDB is not set
+CONFIG_CFG80211_WEXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+CONFIG_LIB80211_CRYPT_WEP=m
+CONFIG_LIB80211_CRYPT_CCMP=m
+CONFIG_LIB80211_CRYPT_TKIP=m
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=m
+# CONFIG_MAC80211_RC_PID is not set
+# CONFIG_MAC80211_RC_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT=""
+
+#
+# Some wireless drivers require a rate control algorithm
+#
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUGFS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+# CONFIG_CEPH_LIB is not set
+# CONFIG_NFC is not set
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
+CONFIG_REGMAP=y
+CONFIG_REGMAP_I2C=m
+CONFIG_REGMAP_SPI=m
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_TESTS is not set
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
+# CONFIG_MTD_SWAP is not set
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
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
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
+CONFIG_MTD_UBI_BEB_RESERVE=1
+CONFIG_MTD_UBI_GLUEBI=m
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_BLK_DEV_RBD is not set
+# CONFIG_SENSORS_LIS3LV02D is not set
+CONFIG_MISC_DEVICES=y
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
+# CONFIG_BMP085 is not set
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
+# CONFIG_IWMC3200TOP is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_TI_ST is not set
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
+CONFIG_BLK_DEV_SR=m
+# CONFIG_BLK_DEV_SR_VENDOR is not set
+CONFIG_CHR_DEV_SG=m
+# CONFIG_CHR_DEV_SCH is not set
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
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
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+CONFIG_ATA_VERBOSE_ERROR=y
+CONFIG_SATA_PMP=y
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
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+# CONFIG_BONDING is not set
+# CONFIG_DUMMY is not set
+# CONFIG_EQUALIZER is not set
+CONFIG_MII=m
+# CONFIG_MACVLAN is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+CONFIG_TUN=m
+# CONFIG_VETH is not set
+# CONFIG_ARCNET is not set
+
+#
+# CAIF transport drivers
+#
+CONFIG_ETHERNET=y
+CONFIG_NET_VENDOR_3COM=y
+# CONFIG_PCMCIA_3C574 is not set
+# CONFIG_PCMCIA_3C589 is not set
+CONFIG_NET_VENDOR_AMD=y
+# CONFIG_PCMCIA_NMCLAN is not set
+CONFIG_NET_VENDOR_BROADCOM=y
+# CONFIG_B44 is not set
+CONFIG_NET_VENDOR_CHELSIO=y
+# CONFIG_DM9000 is not set
+# CONFIG_DNET is not set
+CONFIG_NET_VENDOR_FARADAY=y
+# CONFIG_FTMAC100 is not set
+# CONFIG_FTGMAC100 is not set
+CONFIG_NET_VENDOR_FUJITSU=y
+# CONFIG_PCMCIA_FMVJ18X is not set
+CONFIG_NET_VENDOR_INTEL=y
+CONFIG_NET_VENDOR_I825XX=y
+CONFIG_NET_VENDOR_MARVELL=y
+CONFIG_NET_VENDOR_MICREL=y
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_NET_VENDOR_MICROCHIP=y
+# CONFIG_ENC28J60 is not set
+CONFIG_NET_VENDOR_NATSEMI=y
+CONFIG_NET_VENDOR_8390=y
+# CONFIG_PCMCIA_AXNET is not set
+# CONFIG_AX88796 is not set
+CONFIG_PCMCIA_PCNET=m
+# CONFIG_ETHOC is not set
+CONFIG_NET_VENDOR_SEEQ=y
+# CONFIG_SEEQ8005 is not set
+CONFIG_NET_VENDOR_SMSC=y
+# CONFIG_SMC91X is not set
+# CONFIG_PCMCIA_SMC91C92 is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+CONFIG_NET_VENDOR_STMICRO=y
+# CONFIG_STMMAC_ETH is not set
+CONFIG_NET_VENDOR_XIRCOM=y
+# CONFIG_PCMCIA_XIRC2PS is not set
+# CONFIG_PHYLIB is not set
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+# CONFIG_PPP_FILTER is not set
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPPOE is not set
+CONFIG_PPP_ASYNC=m
+# CONFIG_PPP_SYNC_TTY is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=m
+# CONFIG_TR is not set
+CONFIG_WLAN=y
+# CONFIG_PCMCIA_RAYCS is not set
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_ATMEL is not set
+CONFIG_AIRO_CS=m
+# CONFIG_PCMCIA_WL3501 is not set
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_ATH_COMMON is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+# CONFIG_BRCMFMAC is not set
+CONFIG_HOSTAP=m
+CONFIG_HOSTAP_FIRMWARE=y
+# CONFIG_HOSTAP_FIRMWARE_NVRAM is not set
+CONFIG_HOSTAP_CS=m
+# CONFIG_IWM is not set
+# CONFIG_LIBERTAS is not set
+# CONFIG_HERMES is not set
+# CONFIG_P54_COMMON is not set
+# CONFIG_RT2X00 is not set
+# CONFIG_WL1251 is not set
+# CONFIG_WL12XX_MENU is not set
+# CONFIG_MWIFIEX is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+# CONFIG_WAN is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
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
+CONFIG_KEYBOARD_MATRIX=y
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
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
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_WM97XX is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
+CONFIG_INPUT_MISC=y
+# CONFIG_INPUT_AD714X is not set
+# CONFIG_INPUT_BMA150 is not set
+# CONFIG_INPUT_MMA8450 is not set
+# CONFIG_INPUT_MPU3050 is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_KXTJ9 is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_UINPUT=m
+# CONFIG_INPUT_PCF8574 is not set
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
+# CONFIG_INPUT_ADXL34X is not set
+# CONFIG_INPUT_CMA3000 is not set
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
+# CONFIG_N_GSM is not set
+# CONFIG_TRACE_SINK is not set
+CONFIG_DEVKMEM=y
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250_CS=m
+CONFIG_SERIAL_8250_NR_UARTS=4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=m
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_IPWIRELESS is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_RAMOOPS is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
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
+# CONFIG_I2C_STUB is not set
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
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
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
+
+#
+# Enable Device Drivers -> PPS to see the PTP clock options.
+#
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_IT8761E is not set
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
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+CONFIG_POWER_SUPPLY_DEBUG=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ20Z75 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_ISP1704 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_GPIO is not set
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
+# CONFIG_SENSORS_MAX6639 is not set
+# CONFIG_SENSORS_MAX6642 is not set
+# CONFIG_SENSORS_MAX6650 is not set
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
+# CONFIG_SENSORS_SCH5627 is not set
+# CONFIG_SENSORS_SCH5636 is not set
+# CONFIG_SENSORS_ADS1015 is not set
+# CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_ADS7871 is not set
+# CONFIG_SENSORS_AMC6821 is not set
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
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_AAT2870_CORE is not set
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
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LCD_CORGI=y
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
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
+
+#
+# Display device support
+#
+CONFIG_DISPLAY_SUPPORT=y
+
+#
+# Display hardware drivers
+#
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
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=m
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SOUND_OSS_CORE_PRECLAIM=y
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+CONFIG_SND_JACK=y
+CONFIG_SND_SEQUENCER=m
+# CONFIG_SND_SEQ_DUMMY is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_SEQUENCER_OSS is not set
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_VMASTER=y
+# CONFIG_SND_RAWMIDI_SEQ is not set
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+CONFIG_SND_AC97_CODEC=m
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_ALOOP is not set
+# CONFIG_SND_VIRMIDI is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+# CONFIG_SND_AC97_POWER_SAVE is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_PXA2XX_PCM=m
+CONFIG_SND_PXA2XX_LIB=m
+CONFIG_SND_PXA2XX_LIB_AC97=y
+CONFIG_SND_PXA2XX_AC97=m
+CONFIG_SND_SPI=y
+CONFIG_SND_PCMCIA=y
+# CONFIG_SND_VXPOCKET is not set
+# CONFIG_SND_PDAUDIOCF is not set
+CONFIG_SND_SOC=m
+# CONFIG_SND_SOC_CACHE_LZO is not set
+CONFIG_SND_PXA2XX_SOC=m
+CONFIG_SND_PXA2XX_SOC_I2S=m
+CONFIG_SND_PXA2XX_SOC_CORGI=m
+CONFIG_SND_SOC_I2C_AND_SPI=m
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_WM8731=m
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=m
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=m
+# CONFIG_HIDRAW is not set
+# CONFIG_HID_PID is not set
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_ELECOM is not set
+# CONFIG_HID_MAGICMOUSE is not set
+# CONFIG_HID_WACOM is not set
+# CONFIG_HID_WIIMOTE is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=m
+CONFIG_USB_ARCH_HAS_HCD=y
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+# CONFIG_USB is not set
+CONFIG_USB_OTG_WHITELIST=y
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_DWC3 is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+CONFIG_USB_GADGET=m
+# CONFIG_USB_GADGET_DEBUG is not set
+CONFIG_USB_GADGET_DEBUG_FILES=y
+CONFIG_USB_GADGET_DEBUG_FS=y
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+# CONFIG_USB_FUSB300 is not set
+CONFIG_USB_PXA25X=m
+# CONFIG_USB_PXA25X_SMALL is not set
+# CONFIG_USB_R8A66597 is not set
+# CONFIG_USB_M66592 is not set
+# CONFIG_USB_NET2272 is not set
+CONFIG_USB_ZERO=m
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+CONFIG_USB_ETH_EEM=y
+# CONFIG_USB_G_NCM is not set
+CONFIG_USB_GADGETFS=m
+# CONFIG_USB_FUNCTIONFS is not set
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+CONFIG_USB_CDC_COMPOSITE=m
+# CONFIG_USB_G_ACM_MS is not set
+CONFIG_USB_G_MULTI=m
+CONFIG_USB_G_MULTI_RNDIS=y
+CONFIG_USB_G_MULTI_CDC=y
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+CONFIG_USB_GPIO_VBUS=m
+CONFIG_USB_ULPI=y
+CONFIG_NOP_USB_XCEIV=m
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
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
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
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
+# CONFIG_VIRTIO_BALLOON is not set
+# CONFIG_VIRTIO_MMIO is not set
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
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
+CONFIG_EXT4_FS_XATTR=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+CONFIG_JBD2=y
+# CONFIG_JBD2_DEBUG is not set
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+CONFIG_EXPORTFS=m
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+CONFIG_AUTOFS4_FS=y
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
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
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
+# CONFIG_UBIFS_FS_XATTR is not set
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_UBIFS_FS_DEBUG is not set
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=m
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+# CONFIG_NFS_USE_LEGACY_DNS is not set
+CONFIG_NFS_USE_KERNEL_DNS=y
+# CONFIG_NFS_USE_NEW_IDMAPPER is not set
+CONFIG_NFSD=m
+CONFIG_NFSD_V3=y
+# CONFIG_NFSD_V3_ACL is not set
+CONFIG_NFSD_V4=y
+CONFIG_LOCKD=m
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=m
+CONFIG_SUNRPC_GSS=m
+# CONFIG_CEPH_FS is not set
+CONFIG_CIFS=m
+# CONFIG_CIFS_STATS is not set
+# CONFIG_CIFS_WEAK_PW_HASH is not set
+# CONFIG_CIFS_UPCALL is not set
+# CONFIG_CIFS_XATTR is not set
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_DFS_UPCALL is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
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
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="cp437"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_737=m
+CONFIG_NLS_CODEPAGE_775=m
+CONFIG_NLS_CODEPAGE_850=m
+CONFIG_NLS_CODEPAGE_852=m
+CONFIG_NLS_CODEPAGE_855=m
+CONFIG_NLS_CODEPAGE_857=m
+CONFIG_NLS_CODEPAGE_860=m
+CONFIG_NLS_CODEPAGE_861=m
+CONFIG_NLS_CODEPAGE_862=m
+CONFIG_NLS_CODEPAGE_863=m
+CONFIG_NLS_CODEPAGE_864=m
+CONFIG_NLS_CODEPAGE_865=m
+CONFIG_NLS_CODEPAGE_866=m
+CONFIG_NLS_CODEPAGE_869=m
+CONFIG_NLS_CODEPAGE_936=m
+CONFIG_NLS_CODEPAGE_950=m
+CONFIG_NLS_CODEPAGE_932=m
+CONFIG_NLS_CODEPAGE_949=m
+CONFIG_NLS_CODEPAGE_874=m
+CONFIG_NLS_ISO8859_8=m
+CONFIG_NLS_CODEPAGE_1250=m
+CONFIG_NLS_CODEPAGE_1251=m
+CONFIG_NLS_ASCII=m
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_2=m
+CONFIG_NLS_ISO8859_3=m
+CONFIG_NLS_ISO8859_4=m
+CONFIG_NLS_ISO8859_5=m
+CONFIG_NLS_ISO8859_6=m
+CONFIG_NLS_ISO8859_7=m
+CONFIG_NLS_ISO8859_9=m
+CONFIG_NLS_ISO8859_13=m
+CONFIG_NLS_ISO8859_14=m
+CONFIG_NLS_ISO8859_15=m
+CONFIG_NLS_KOI8_R=m
+CONFIG_NLS_KOI8_U=m
+CONFIG_NLS_UTF8=y
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
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
+CONFIG_DEBUG_BUGVERBOSE=y
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_LKDTM is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_RING_BUFFER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_ENCRYPTED_KEYS is not set
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
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
+CONFIG_CRYPTO_AEAD=m
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=m
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=m
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG=m
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP2=y
+CONFIG_CRYPTO_MANAGER=m
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_USER is not set
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_GF128MUL is not set
+CONFIG_CRYPTO_NULL=m
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_AUTHENC=m
+CONFIG_CRYPTO_TEST=m
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
+CONFIG_CRYPTO_CBC=m
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=m
+# CONFIG_CRYPTO_LRW is not set
+CONFIG_CRYPTO_PCBC=m
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_HMAC=m
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=m
+# CONFIG_CRYPTO_GHASH is not set
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_MD5=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=m
+CONFIG_CRYPTO_SHA256=m
+CONFIG_CRYPTO_SHA512=m
+# CONFIG_CRYPTO_TGR192 is not set
+CONFIG_CRYPTO_WP512=m
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_BLOWFISH_COMMON=m
+CONFIG_CRYPTO_CAMELLIA=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_DES=m
+# CONFIG_CRYPTO_FCRYPT is not set
+CONFIG_CRYPTO_KHAZAD=m
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TEA=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_TWOFISH_COMMON=m
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
+CONFIG_CRYPTO_ANSI_CPRNG=m
+# CONFIG_CRYPTO_USER_API_HASH is not set
+# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC32=y
+CONFIG_CRC7=y
+CONFIG_LIBCRC32C=m
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_DECOMPRESS_LZO=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_AVERAGE=y
+# CONFIG_CORDIC is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0.scc b/recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0.scc
new file mode 100644
index 0000000..bd63ded
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/c7x0/c7x0.scc
@@ -0,0 +1,7 @@
+kconf hardware c7x0.cfg
+
+# non hardware
+#include cfg/devtmpfs.scc
+#include cfg/sound.scc
+#include cfg/usb-mass-storage.scc
+#include cfg/fs.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/collie/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch b/recipes-kernel/linux/linux-yocto-tiny/collie/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
new file mode 100644
index 0000000..d86b47d
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/collie/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
@@ -0,0 +1,34 @@
+From 31d99c4c9f14e571ca0e22c5862dd5b6a871e2dd Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Date: Fri, 5 Aug 2011 15:32:23 +0400
+Subject: [PATCH] pcmcia/pxa2xx_sharpsl: retain ops structure on collie
+
+The pxa2xx_sharpsl driver part is also used on collie, which (as
+a StrongARM board) has different expectations for PCMCIA drivers.
+So, on collie place sharpsl_pcmcia_ops in .data section rather than
+in __initdata.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ drivers/pcmcia/pxa2xx_sharpsl.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/pcmcia/pxa2xx_sharpsl.c b/drivers/pcmcia/pxa2xx_sharpsl.c
+index 81af2b3..1b5b749 100644
+--- a/drivers/pcmcia/pxa2xx_sharpsl.c
++++ b/drivers/pcmcia/pxa2xx_sharpsl.c
+@@ -222,7 +222,11 @@ static void sharpsl_pcmcia_socket_suspend(struct soc_pcmcia_socket *skt)
+ 	sharpsl_pcmcia_init_reset(skt);
+ }
+ 
++#ifdef CONFIG_SA1100_COLLIE
++static struct pcmcia_low_level sharpsl_pcmcia_ops = {
++#else
+ static struct pcmcia_low_level sharpsl_pcmcia_ops __initdata = {
++#endif
+ 	.owner                  = THIS_MODULE,
+ 	.hw_init                = sharpsl_pcmcia_hw_init,
+ 	.hw_shutdown            = sharpsl_pcmcia_hw_shutdown,
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny/collie/collie-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny/collie/collie-tiny.scc
new file mode 100644
index 0000000..37d2f99
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/collie/collie-tiny.scc
@@ -0,0 +1,7 @@
+define KMACHINE collie
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny
+
+include collie.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-tiny/collie/collie.cfg
new file mode 100644
index 0000000..ff200b8
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/collie/collie.cfg
@@ -0,0 +1,2420 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.2.12 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_HAVE_SCHED_CLOCK=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_NEED_MACH_MEMORY_H=y
+CONFIG_GENERIC_BUG=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+# CONFIG_FHANDLE is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_HAVE_SPARSE_IRQ=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_SPARSE_IRQ=y
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+# CONFIG_CGROUP_DEBUG is not set
+# CONFIG_CGROUP_FREEZER is not set
+# CONFIG_CGROUP_DEVICE is not set
+# CONFIG_CPUSETS is not set
+# CONFIG_CGROUP_CPUACCT is not set
+# CONFIG_RESOURCE_COUNTERS is not set
+# CONFIG_CGROUP_PERF is not set
+# CONFIG_CGROUP_SCHED is not set
+# CONFIG_BLK_CGROUP is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=m
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=m
+CONFIG_IOSCHED_CFQ=m
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+CONFIG_INLINE_SPIN_UNLOCK=y
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_HIGHBANK is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_PRIMA2 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PICOXCELL is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+CONFIG_ARCH_SA1100=y
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_TCC_926 is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_VT8500 is not set
+# CONFIG_ARCH_ZYNQ is not set
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
+
+#
+# System MMU
+#
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
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+CONFIG_SHARP_LOCOMO=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+CONFIG_ISA=y
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+CONFIG_PCMCIA_LOAD_CIS=y
+
+#
+# PC-card bridges
+#
+# CONFIG_I82365 is not set
+# CONFIG_TCIC is not set
+CONFIG_PCMCIA_SOC_COMMON=y
+CONFIG_PCMCIA_SA1100=y
+# CONFIG_PCMCIA_DEBUG is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
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
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+# CONFIG_LEDS is not set
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1 loglevel=3"
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
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_FPE_NWFPE is not set
+# CONFIG_FPE_FASTFPE is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+CONFIG_BINFMT_AOUT=m
+CONFIG_BINFMT_MISC=m
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+CONFIG_PM_RUNTIME=y
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=m
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=m
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_XFRM_IPCOMP=m
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE_DEMUX is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=m
+CONFIG_INET_XFRM_MODE_TUNNEL=m
+CONFIG_INET_XFRM_MODE_BEET=m
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=m
+CONFIG_INET_TCP_DIAG=m
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+CONFIG_IPV6=m
+# CONFIG_IPV6_PRIVACY is not set
+# CONFIG_IPV6_ROUTER_PREF is not set
+# CONFIG_IPV6_OPTIMISTIC_DAD is not set
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_IPCOMP=m
+# CONFIG_IPV6_MIP6 is not set
+CONFIG_INET6_XFRM_TUNNEL=m
+CONFIG_INET6_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
+# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
+CONFIG_IPV6_SIT=m
+# CONFIG_IPV6_SIT_6RD is not set
+CONFIG_IPV6_NDISC_NODETYPE=y
+CONFIG_IPV6_TUNNEL=m
+# CONFIG_IPV6_MULTIPLE_TABLES is not set
+# CONFIG_IPV6_MROUTE is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+
+#
+# Core Netfilter Configuration
+#
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+CONFIG_NF_CONNTRACK=m
+# CONFIG_NF_CONNTRACK_MARK is not set
+# CONFIG_NF_CONNTRACK_EVENTS is not set
+# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
+# CONFIG_NF_CT_PROTO_DCCP is not set
+# CONFIG_NF_CT_PROTO_SCTP is not set
+# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_NF_CONNTRACK_AMANDA is not set
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_H323=m
+CONFIG_NF_CONNTRACK_IRC=m
+# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
+# CONFIG_NF_CONNTRACK_SNMP is not set
+# CONFIG_NF_CONNTRACK_PPTP is not set
+# CONFIG_NF_CONNTRACK_SANE is not set
+CONFIG_NF_CONNTRACK_SIP=m
+# CONFIG_NF_CONNTRACK_TFTP is not set
+# CONFIG_NF_CT_NETLINK is not set
+# CONFIG_NETFILTER_TPROXY is not set
+CONFIG_NETFILTER_XTABLES=m
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+# CONFIG_NETFILTER_XT_CONNMARK is not set
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set
+# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
+# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
+# CONFIG_NETFILTER_XT_TARGET_CT is not set
+# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+CONFIG_NETFILTER_XT_TARGET_HL=m
+# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
+# CONFIG_NETFILTER_XT_TARGET_LED is not set
+# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
+# CONFIG_NETFILTER_XT_MATCH_CPU is not set
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
+CONFIG_NETFILTER_XT_MATCH_HL=m
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_MAC is not set
+# CONFIG_NETFILTER_XT_MATCH_MARK is not set
+# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
+# CONFIG_NETFILTER_XT_MATCH_STATE is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_DEFRAG_IPV4=m
+CONFIG_NF_CONNTRACK_IPV4=m
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+# CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_TTL=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_TARGET_LOG=m
+CONFIG_IP_NF_TARGET_ULOG=m
+CONFIG_NF_NAT=m
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_NETMAP=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_NF_NAT_FTP=m
+CONFIG_NF_NAT_IRC=m
+# CONFIG_NF_NAT_TFTP is not set
+# CONFIG_NF_NAT_AMANDA is not set
+# CONFIG_NF_NAT_PPTP is not set
+CONFIG_NF_NAT_H323=m
+CONFIG_NF_NAT_SIP=m
+CONFIG_IP_NF_MANGLE=m
+# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_NF_RAW=m
+CONFIG_IP_NF_ARPTABLES=m
+CONFIG_IP_NF_ARPFILTER=m
+CONFIG_IP_NF_ARP_MANGLE=m
+
+#
+# IPv6: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV6 is not set
+# CONFIG_NF_CONNTRACK_IPV6 is not set
+# CONFIG_IP6_NF_QUEUE is not set
+# CONFIG_IP6_NF_IPTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
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
+# CONFIG_DCB is not set
+CONFIG_DNS_RESOLVER=y
+# CONFIG_BATMAN_ADV is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+CONFIG_IRDA=m
+
+#
+# IrDA protocols
+#
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
+# CONFIG_IRDA_ULTRA is not set
+
+#
+# IrDA options
+#
+# CONFIG_IRDA_CACHE_LAST_LSAP is not set
+# CONFIG_IRDA_FAST_RR is not set
+# CONFIG_IRDA_DEBUG is not set
+
+#
+# Infrared-port device drivers
+#
+
+#
+# SIR device drivers
+#
+# CONFIG_IRTTY_SIR is not set
+
+#
+# Dongle support
+#
+
+#
+# FIR device drivers
+#
+# CONFIG_SA1100_FIR is not set
+CONFIG_BT=m
+CONFIG_BT_L2CAP=y
+CONFIG_BT_SCO=y
+CONFIG_BT_RFCOMM=m
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=m
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=m
+
+#
+# Bluetooth device drivers
+#
+CONFIG_BT_HCIBTSDIO=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIDTL1=m
+CONFIG_BT_HCIBT3C=m
+CONFIG_BT_HCIBLUECARD=m
+CONFIG_BT_HCIBTUART=m
+CONFIG_BT_HCIVHCI=m
+CONFIG_BT_MRVL=m
+CONFIG_BT_MRVL_SDIO=m
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_WEXT_SPY=y
+CONFIG_WEXT_PRIV=y
+CONFIG_CFG80211=m
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+# CONFIG_CFG80211_DEFAULT_PS is not set
+# CONFIG_CFG80211_DEBUGFS is not set
+# CONFIG_CFG80211_INTERNAL_REGDB is not set
+CONFIG_CFG80211_WEXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+CONFIG_LIB80211_CRYPT_WEP=m
+CONFIG_LIB80211_CRYPT_CCMP=m
+CONFIG_LIB80211_CRYPT_TKIP=m
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=m
+# CONFIG_MAC80211_RC_PID is not set
+# CONFIG_MAC80211_RC_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT=""
+
+#
+# Some wireless drivers require a rate control algorithm
+#
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUGFS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+# CONFIG_CEPH_LIB is not set
+# CONFIG_NFC is not set
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
+CONFIG_REGMAP=y
+CONFIG_REGMAP_I2C=m
+CONFIG_REGMAP_SPI=m
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_TESTS is not set
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
+# CONFIG_MTD_SWAP is not set
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
+# CONFIG_MTD_CFI_I2 is not set
+CONFIG_MTD_CFI_I4=y
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
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
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
+CONFIG_MTD_UBI_BEB_RESERVE=1
+CONFIG_MTD_UBI_GLUEBI=m
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+# CONFIG_PNP is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_BLK_DEV_RBD is not set
+# CONFIG_SENSORS_LIS3LV02D is not set
+CONFIG_MISC_DEVICES=y
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
+# CONFIG_BMP085 is not set
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
+# CONFIG_IWMC3200TOP is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_TI_ST is not set
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
+CONFIG_BLK_DEV_SR=m
+# CONFIG_BLK_DEV_SR_VENDOR is not set
+CONFIG_CHR_DEV_SG=m
+# CONFIG_CHR_DEV_SCH is not set
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
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
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
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
+CONFIG_ATA_VERBOSE_ERROR=y
+CONFIG_SATA_PMP=y
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
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+# CONFIG_BONDING is not set
+# CONFIG_DUMMY is not set
+# CONFIG_EQUALIZER is not set
+CONFIG_MII=m
+# CONFIG_MACVLAN is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+CONFIG_TUN=m
+# CONFIG_VETH is not set
+# CONFIG_ARCNET is not set
+
+#
+# CAIF transport drivers
+#
+CONFIG_ETHERNET=y
+CONFIG_NET_VENDOR_3COM=y
+# CONFIG_EL1 is not set
+# CONFIG_EL3 is not set
+# CONFIG_PCMCIA_3C574 is not set
+# CONFIG_PCMCIA_3C589 is not set
+CONFIG_NET_VENDOR_AMD=y
+# CONFIG_DEPCA is not set
+# CONFIG_PCMCIA_NMCLAN is not set
+CONFIG_NET_VENDOR_BROADCOM=y
+# CONFIG_B44 is not set
+CONFIG_NET_VENDOR_CHELSIO=y
+CONFIG_NET_VENDOR_CIRRUS=y
+# CONFIG_CS89x0 is not set
+# CONFIG_DM9000 is not set
+# CONFIG_DNET is not set
+CONFIG_NET_VENDOR_FARADAY=y
+# CONFIG_FTMAC100 is not set
+# CONFIG_FTGMAC100 is not set
+CONFIG_NET_VENDOR_FUJITSU=y
+# CONFIG_AT1700 is not set
+# CONFIG_PCMCIA_FMVJ18X is not set
+# CONFIG_ETH16I is not set
+CONFIG_NET_VENDOR_HP=y
+# CONFIG_HP100 is not set
+CONFIG_NET_VENDOR_INTEL=y
+CONFIG_NET_VENDOR_I825XX=y
+# CONFIG_EL16 is not set
+# CONFIG_APRICOT is not set
+# CONFIG_EEXPRESS is not set
+# CONFIG_EEXPRESS_PRO is not set
+# CONFIG_LP486E is not set
+# CONFIG_NI52 is not set
+CONFIG_NET_VENDOR_MARVELL=y
+CONFIG_NET_VENDOR_MICREL=y
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_NET_VENDOR_MICROCHIP=y
+# CONFIG_ENC28J60 is not set
+CONFIG_NET_VENDOR_NATSEMI=y
+CONFIG_NET_VENDOR_8390=y
+# CONFIG_EL2 is not set
+# CONFIG_PCMCIA_AXNET is not set
+# CONFIG_AX88796 is not set
+# CONFIG_E2100 is not set
+# CONFIG_HPLAN_PLUS is not set
+# CONFIG_HPLAN is not set
+# CONFIG_NE2000 is not set
+CONFIG_PCMCIA_PCNET=m
+# CONFIG_ULTRA is not set
+# CONFIG_WD80x3 is not set
+# CONFIG_ETHOC is not set
+CONFIG_NET_VENDOR_RACAL=y
+# CONFIG_NI5010 is not set
+CONFIG_NET_VENDOR_SEEQ=y
+# CONFIG_SEEQ8005 is not set
+CONFIG_NET_VENDOR_SMSC=y
+# CONFIG_SMC9194 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_PCMCIA_SMC91C92 is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+CONFIG_NET_VENDOR_STMICRO=y
+# CONFIG_STMMAC_ETH is not set
+CONFIG_NET_VENDOR_XIRCOM=y
+# CONFIG_PCMCIA_XIRC2PS is not set
+# CONFIG_PHYLIB is not set
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+# CONFIG_PPP_FILTER is not set
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPPOE is not set
+CONFIG_PPP_ASYNC=m
+# CONFIG_PPP_SYNC_TTY is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=m
+# CONFIG_TR is not set
+CONFIG_WLAN=y
+# CONFIG_PCMCIA_RAYCS is not set
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_ATMEL is not set
+CONFIG_AIRO_CS=m
+# CONFIG_PCMCIA_WL3501 is not set
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_ATH_COMMON is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+# CONFIG_BRCMFMAC is not set
+CONFIG_HOSTAP=m
+CONFIG_HOSTAP_FIRMWARE=y
+# CONFIG_HOSTAP_FIRMWARE_NVRAM is not set
+CONFIG_HOSTAP_CS=m
+# CONFIG_IWM is not set
+# CONFIG_LIBERTAS is not set
+# CONFIG_HERMES is not set
+# CONFIG_P54_COMMON is not set
+# CONFIG_RT2X00 is not set
+# CONFIG_WL1251 is not set
+# CONFIG_WL12XX_MENU is not set
+# CONFIG_MWIFIEX is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+# CONFIG_WAN is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
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
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_LM8323 is not set
+CONFIG_KEYBOARD_LOCOMO=y
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
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
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_HTCPEN is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
+CONFIG_INPUT_MISC=y
+# CONFIG_INPUT_AD714X is not set
+# CONFIG_INPUT_BMA150 is not set
+# CONFIG_INPUT_MMA8450 is not set
+# CONFIG_INPUT_MPU3050 is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_KXTJ9 is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_UINPUT=m
+# CONFIG_INPUT_PCF8574 is not set
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
+# CONFIG_INPUT_ADXL34X is not set
+# CONFIG_INPUT_CMA3000 is not set
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
+# CONFIG_N_GSM is not set
+# CONFIG_TRACE_SINK is not set
+CONFIG_DEVKMEM=y
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250_CS=m
+CONFIG_SERIAL_8250_NR_UARTS=4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+CONFIG_SERIAL_SA1100=y
+CONFIG_SERIAL_SA1100_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=m
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_DTLK is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_IPWIRELESS is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_DEVPORT=y
+# CONFIG_RAMOOPS is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
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
+# CONFIG_I2C_STUB is not set
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
+# CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
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
+
+#
+# Enable Device Drivers -> PPS to see the PTP clock options.
+#
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_IT8761E is not set
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
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+CONFIG_POWER_SUPPLY_DEBUG=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_COLLIE is not set
+# CONFIG_BATTERY_BQ20Z75 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_ISP1704 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_GPIO is not set
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
+# CONFIG_SENSORS_MAX6639 is not set
+# CONFIG_SENSORS_MAX6642 is not set
+# CONFIG_SENSORS_MAX6650 is not set
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
+# CONFIG_SENSORS_SCH5627 is not set
+# CONFIG_SENSORS_SCH5636 is not set
+# CONFIG_SENSORS_ADS1015 is not set
+# CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_ADS7871 is not set
+# CONFIG_SENSORS_AMC6821 is not set
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
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_AAT2870_CORE is not set
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
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
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
+
+#
+# Display device support
+#
+CONFIG_DISPLAY_SUPPORT=y
+
+#
+# Display hardware drivers
+#
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
+CONFIG_SOUND=m
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SOUND_OSS_CORE_PRECLAIM=y
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+CONFIG_SND_JACK=y
+CONFIG_SND_SEQUENCER=m
+# CONFIG_SND_SEQ_DUMMY is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_SEQUENCER_OSS is not set
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+# CONFIG_SND_RAWMIDI_SEQ is not set
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_ALOOP is not set
+# CONFIG_SND_VIRMIDI is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_SPI=y
+CONFIG_SND_PCMCIA=y
+# CONFIG_SND_VXPOCKET is not set
+# CONFIG_SND_PDAUDIOCF is not set
+CONFIG_SND_SOC=m
+# CONFIG_SND_SOC_CACHE_LZO is not set
+CONFIG_SND_SOC_I2C_AND_SPI=m
+# CONFIG_SND_SOC_ALL_CODECS is not set
+# CONFIG_SOUND_PRIME is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=m
+# CONFIG_HIDRAW is not set
+# CONFIG_HID_PID is not set
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_ELECOM is not set
+# CONFIG_HID_MAGICMOUSE is not set
+# CONFIG_HID_WACOM is not set
+# CONFIG_HID_WIIMOTE is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=m
+CONFIG_USB_ARCH_HAS_HCD=y
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+# CONFIG_USB is not set
+CONFIG_USB_OTG_WHITELIST=y
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_DWC3 is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+CONFIG_USB_GADGET=m
+# CONFIG_USB_GADGET_DEBUG is not set
+CONFIG_USB_GADGET_DEBUG_FILES=y
+CONFIG_USB_GADGET_DEBUG_FS=y
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+# CONFIG_USB_FUSB300 is not set
+# CONFIG_USB_R8A66597 is not set
+# CONFIG_USB_M66592 is not set
+# CONFIG_USB_NET2272 is not set
+CONFIG_USB_ZERO=m
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+CONFIG_USB_ETH_EEM=y
+# CONFIG_USB_G_NCM is not set
+CONFIG_USB_GADGETFS=m
+# CONFIG_USB_FUNCTIONFS is not set
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+CONFIG_USB_CDC_COMPOSITE=m
+# CONFIG_USB_G_ACM_MS is not set
+CONFIG_USB_G_MULTI=m
+CONFIG_USB_G_MULTI_RNDIS=y
+CONFIG_USB_G_MULTI_CDC=y
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+CONFIG_USB_GPIO_VBUS=m
+CONFIG_USB_ULPI=y
+CONFIG_NOP_USB_XCEIV=m
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
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
+CONFIG_LEDS_LOCOMO=y
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
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
+# CONFIG_VIRTIO_BALLOON is not set
+# CONFIG_VIRTIO_MMIO is not set
+# CONFIG_STAGING is not set
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
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
+CONFIG_EXT4_FS_XATTR=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+CONFIG_JBD2=y
+# CONFIG_JBD2_DEBUG is not set
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+CONFIG_EXPORTFS=m
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+CONFIG_AUTOFS4_FS=y
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
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
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
+# CONFIG_UBIFS_FS_XATTR is not set
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_UBIFS_FS_DEBUG is not set
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=m
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+# CONFIG_NFS_USE_LEGACY_DNS is not set
+CONFIG_NFS_USE_KERNEL_DNS=y
+# CONFIG_NFS_USE_NEW_IDMAPPER is not set
+CONFIG_NFSD=m
+CONFIG_NFSD_V3=y
+# CONFIG_NFSD_V3_ACL is not set
+CONFIG_NFSD_V4=y
+CONFIG_LOCKD=m
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=m
+CONFIG_SUNRPC_GSS=m
+# CONFIG_CEPH_FS is not set
+CONFIG_CIFS=m
+# CONFIG_CIFS_STATS is not set
+# CONFIG_CIFS_WEAK_PW_HASH is not set
+# CONFIG_CIFS_UPCALL is not set
+# CONFIG_CIFS_XATTR is not set
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_DFS_UPCALL is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
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
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="cp437"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_737=m
+CONFIG_NLS_CODEPAGE_775=m
+CONFIG_NLS_CODEPAGE_850=m
+CONFIG_NLS_CODEPAGE_852=m
+CONFIG_NLS_CODEPAGE_855=m
+CONFIG_NLS_CODEPAGE_857=m
+CONFIG_NLS_CODEPAGE_860=m
+CONFIG_NLS_CODEPAGE_861=m
+CONFIG_NLS_CODEPAGE_862=m
+CONFIG_NLS_CODEPAGE_863=m
+CONFIG_NLS_CODEPAGE_864=m
+CONFIG_NLS_CODEPAGE_865=m
+CONFIG_NLS_CODEPAGE_866=m
+CONFIG_NLS_CODEPAGE_869=m
+CONFIG_NLS_CODEPAGE_936=m
+CONFIG_NLS_CODEPAGE_950=m
+CONFIG_NLS_CODEPAGE_932=m
+CONFIG_NLS_CODEPAGE_949=m
+CONFIG_NLS_CODEPAGE_874=m
+CONFIG_NLS_ISO8859_8=m
+CONFIG_NLS_CODEPAGE_1250=m
+CONFIG_NLS_CODEPAGE_1251=m
+CONFIG_NLS_ASCII=m
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_2=m
+CONFIG_NLS_ISO8859_3=m
+CONFIG_NLS_ISO8859_4=m
+CONFIG_NLS_ISO8859_5=m
+CONFIG_NLS_ISO8859_6=m
+CONFIG_NLS_ISO8859_7=m
+CONFIG_NLS_ISO8859_9=m
+CONFIG_NLS_ISO8859_13=m
+CONFIG_NLS_ISO8859_14=m
+CONFIG_NLS_ISO8859_15=m
+CONFIG_NLS_KOI8_R=m
+CONFIG_NLS_KOI8_U=m
+CONFIG_NLS_UTF8=y
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
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
+CONFIG_DEBUG_BUGVERBOSE=y
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_LKDTM is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_RING_BUFFER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_ENCRYPTED_KEYS is not set
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
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
+CONFIG_CRYPTO_AEAD=m
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=m
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=m
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG=m
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP2=y
+CONFIG_CRYPTO_MANAGER=m
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_USER is not set
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_GF128MUL is not set
+CONFIG_CRYPTO_NULL=m
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_AUTHENC=m
+CONFIG_CRYPTO_TEST=m
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
+CONFIG_CRYPTO_CBC=m
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=m
+# CONFIG_CRYPTO_LRW is not set
+CONFIG_CRYPTO_PCBC=m
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_HMAC=m
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=m
+# CONFIG_CRYPTO_GHASH is not set
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_MD5=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=m
+CONFIG_CRYPTO_SHA256=m
+CONFIG_CRYPTO_SHA512=m
+# CONFIG_CRYPTO_TGR192 is not set
+CONFIG_CRYPTO_WP512=m
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_BLOWFISH_COMMON=m
+CONFIG_CRYPTO_CAMELLIA=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_DES=m
+# CONFIG_CRYPTO_FCRYPT is not set
+CONFIG_CRYPTO_KHAZAD=m
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TEA=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_TWOFISH_COMMON=m
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
+CONFIG_CRYPTO_ANSI_CPRNG=m
+# CONFIG_CRYPTO_USER_API_HASH is not set
+# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC32=y
+CONFIG_CRC7=y
+CONFIG_LIBCRC32C=m
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_DECOMPRESS_LZO=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_AVERAGE=y
+# CONFIG_CORDIC is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny/collie/collie.scc b/recipes-kernel/linux/linux-yocto-tiny/collie/collie.scc
new file mode 100644
index 0000000..b87da5a
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/collie/collie.scc
@@ -0,0 +1,7 @@
+kconf hardware collie.cfg
+
+# non hardware
+#include cfg/devtmpfs.scc
+#include cfg/sound.scc
+#include cfg/usb-mass-storage.scc
+#include cfg/fs.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/collie/collie_remove_irq_to_gpio.patch b/recipes-kernel/linux/linux-yocto-tiny/collie/collie_remove_irq_to_gpio.patch
new file mode 100644
index 0000000..0c277e0
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/collie/collie_remove_irq_to_gpio.patch
@@ -0,0 +1,31 @@
+From 629bcb4b72d49b3631ae3dd0fe1d345820fadfcc Mon Sep 17 00:00:00 2001
+From: Jochen Friedrich <jochen@scram.de>
+Date: Sat, 19 Nov 2011 19:26:37 +0100
+Subject: [PATCH] collie_battery: Get rid of irq_to_gpio usage
+
+Since 9d08d5d77a355510c2f5657c86b0a4b25acfe72c, irq_to_gpio() is no
+longer available but still in use by collie_battery.c. As it's just
+for a debug message, just get rid of this call.
+
+Signed-off-by: Jochen Friedrich <jochen@scram.de>
+Signed-off-by: Anton Vorontsov <cbouatmailru@gmail.com>
+---
+ drivers/power/collie_battery.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/power/collie_battery.c b/drivers/power/collie_battery.c
+index 548d263..7a40fce 100644
+--- a/drivers/power/collie_battery.c
++++ b/drivers/power/collie_battery.c
+@@ -146,7 +146,7 @@ static void collie_bat_external_power_changed(struct power_supply *psy)
+ 
+ static irqreturn_t collie_bat_gpio_isr(int irq, void *data)
+ {
+-	pr_info("collie_bat_gpio irq: %d\n", gpio_get_value(irq_to_gpio(irq)));
++	pr_info("collie_bat_gpio irq\n");
+ 	schedule_work(&bat_work);
+ 	return IRQ_HANDLED;
+ }
+-- 
+1.7.6.5
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny/collie/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-tiny/collie/locomo_kbd_tweak-r2.patch
new file mode 100644
index 0000000..0d47ade
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/collie/locomo_kbd_tweak-r2.patch
@@ -0,0 +1,66 @@
+ drivers/input/keyboard/locomokbd.c |   61 +++++++++++++++++++++++--------------
+ 1 file changed, 39 insertions(+), 22 deletions(-)
+
+Index: linux-2.6.26-rc4/drivers/input/keyboard/locomokbd.c
+===================================================================
+--- linux-2.6.26-rc4.orig/drivers/input/keyboard/locomokbd.c	2008-05-26 19:08:11.000000000 +0100
++++ linux-2.6.26-rc4/drivers/input/keyboard/locomokbd.c	2008-06-01 18:35:55.000000000 +0100
+@@ -41,25 +41,32 @@
+ 
+ #define LOCOMOKBD_NUMKEYS	128
+ 
+-#define KEY_ACTIVITY		KEY_F16
+-#define KEY_CONTACT		KEY_F18
+-#define KEY_CENTER		KEY_F15
++#define LOCOMO_KEY_CALENDER	KEY_LEFTCTRL
++#define LOCOMO_KEY_ADDRESS	KEY_LEFTALT	/* Needed for SysRQ */
++#define LOCOMO_KEY_HOME		KEY_SYSRQ	/* Needed for SysRQ */
++#define LOCOMO_KEY_MENU		KEY_F12
++#define LOCOMO_KEY_MAIL		KEY_F10
++#define LOCOMO_KEY_OK		KEY_F11		/* Don't hardwire to KEY_RETURN */
++#define LOCOMO_KEY_CANCEL	KEY_POWER
++#define LOCOMO_KEY_CENTER	KEY_F5		/* Don't hardwire to KEY_RETURN */
+ 
+-static const unsigned char
++#define LOCOMO_KEY_FN		KEY_F9
++
++static const unsigned char 
+ locomokbd_keycode[LOCOMOKBD_NUMKEYS] __devinitconst = {
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
+@@ -68,7 +75,7 @@
+ #define SCANCODE(c,r)		( ((c)<<4) + (r) + 1 )
+ 
+ #define KB_DELAY		8
+-#define SCAN_INTERVAL		(HZ/10)
++#define SCAN_INTERVAL		(HZ/20)
+ 
+ struct locomokbd {
+ 	unsigned char keycode[LOCOMOKBD_NUMKEYS];
diff --git a/recipes-kernel/linux/linux-yocto-tiny/poodle/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-tiny/poodle/locomo_kbd_tweak-r2.patch
new file mode 100644
index 0000000..0d47ade
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/poodle/locomo_kbd_tweak-r2.patch
@@ -0,0 +1,66 @@
+ drivers/input/keyboard/locomokbd.c |   61 +++++++++++++++++++++++--------------
+ 1 file changed, 39 insertions(+), 22 deletions(-)
+
+Index: linux-2.6.26-rc4/drivers/input/keyboard/locomokbd.c
+===================================================================
+--- linux-2.6.26-rc4.orig/drivers/input/keyboard/locomokbd.c	2008-05-26 19:08:11.000000000 +0100
++++ linux-2.6.26-rc4/drivers/input/keyboard/locomokbd.c	2008-06-01 18:35:55.000000000 +0100
+@@ -41,25 +41,32 @@
+ 
+ #define LOCOMOKBD_NUMKEYS	128
+ 
+-#define KEY_ACTIVITY		KEY_F16
+-#define KEY_CONTACT		KEY_F18
+-#define KEY_CENTER		KEY_F15
++#define LOCOMO_KEY_CALENDER	KEY_LEFTCTRL
++#define LOCOMO_KEY_ADDRESS	KEY_LEFTALT	/* Needed for SysRQ */
++#define LOCOMO_KEY_HOME		KEY_SYSRQ	/* Needed for SysRQ */
++#define LOCOMO_KEY_MENU		KEY_F12
++#define LOCOMO_KEY_MAIL		KEY_F10
++#define LOCOMO_KEY_OK		KEY_F11		/* Don't hardwire to KEY_RETURN */
++#define LOCOMO_KEY_CANCEL	KEY_POWER
++#define LOCOMO_KEY_CENTER	KEY_F5		/* Don't hardwire to KEY_RETURN */
+ 
+-static const unsigned char
++#define LOCOMO_KEY_FN		KEY_F9
++
++static const unsigned char 
+ locomokbd_keycode[LOCOMOKBD_NUMKEYS] __devinitconst = {
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
+@@ -68,7 +75,7 @@
+ #define SCANCODE(c,r)		( ((c)<<4) + (r) + 1 )
+ 
+ #define KB_DELAY		8
+-#define SCAN_INTERVAL		(HZ/10)
++#define SCAN_INTERVAL		(HZ/20)
+ 
+ struct locomokbd {
+ 	unsigned char keycode[LOCOMOKBD_NUMKEYS];
diff --git a/recipes-kernel/linux/linux-yocto-tiny/poodle/poodle-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny/poodle/poodle-tiny.scc
new file mode 100644
index 0000000..fc79ea0
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/poodle/poodle-tiny.scc
@@ -0,0 +1,7 @@
+define KMACHINE poodle
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny
+
+include poodle.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/poodle/poodle.cfg b/recipes-kernel/linux/linux-yocto-tiny/poodle/poodle.cfg
new file mode 100644
index 0000000..545e5e3
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/poodle/poodle.cfg
@@ -0,0 +1,2422 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.2.11 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_HAVE_SCHED_CLOCK=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_GENERIC_BUG=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+# CONFIG_FHANDLE is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_HAVE_SPARSE_IRQ=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_SPARSE_IRQ=y
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+# CONFIG_CGROUP_DEBUG is not set
+# CONFIG_CGROUP_FREEZER is not set
+# CONFIG_CGROUP_DEVICE is not set
+# CONFIG_CPUSETS is not set
+# CONFIG_CGROUP_CPUACCT is not set
+# CONFIG_RESOURCE_COUNTERS is not set
+# CONFIG_CGROUP_PERF is not set
+# CONFIG_CGROUP_SCHED is not set
+# CONFIG_BLK_CGROUP is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+# CONFIG_UPTIME_LIMITED_KERNEL is not set
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=m
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=m
+CONFIG_IOSCHED_CFQ=m
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+CONFIG_INLINE_SPIN_UNLOCK=y
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_HIGHBANK is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_PRIMA2 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PICOXCELL is not set
+# CONFIG_ARCH_PNX4008 is not set
+CONFIG_ARCH_PXA=y
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_TCC_926 is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_VT8500 is not set
+# CONFIG_ARCH_ZYNQ is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# Intel PXA2xx/PXA3xx Implementations
+#
+# CONFIG_ARCH_PXA_V7 is not set
+
+#
+# Intel/Marvell Dev Platforms (sorted by hardware release time)
+#
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
+# CONFIG_PXA_SHARPSL_DETECT_MACH_ID is not set
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
+
+#
+# System MMU
+#
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
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_DCACHE_DISABLE is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+# CONFIG_IWMMXT is not set
+CONFIG_XSCALE_PMU=y
+CONFIG_CPU_HAS_PMU=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_SHARP_LOCOMO=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+CONFIG_PCMCIA_LOAD_CIS=y
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
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_HW_PERF_EVENTS=y
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
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
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
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_FPE_NWFPE is not set
+# CONFIG_FPE_FASTFPE is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+CONFIG_BINFMT_AOUT=m
+CONFIG_BINFMT_MISC=m
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+CONFIG_PM_RUNTIME=y
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=m
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=m
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_XFRM_IPCOMP=m
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE_DEMUX is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=m
+CONFIG_INET_XFRM_MODE_TUNNEL=m
+CONFIG_INET_XFRM_MODE_BEET=m
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=m
+CONFIG_INET_TCP_DIAG=m
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+CONFIG_IPV6=m
+# CONFIG_IPV6_PRIVACY is not set
+# CONFIG_IPV6_ROUTER_PREF is not set
+# CONFIG_IPV6_OPTIMISTIC_DAD is not set
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_IPCOMP=m
+# CONFIG_IPV6_MIP6 is not set
+CONFIG_INET6_XFRM_TUNNEL=m
+CONFIG_INET6_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
+# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
+CONFIG_IPV6_SIT=m
+# CONFIG_IPV6_SIT_6RD is not set
+CONFIG_IPV6_NDISC_NODETYPE=y
+CONFIG_IPV6_TUNNEL=m
+# CONFIG_IPV6_MULTIPLE_TABLES is not set
+# CONFIG_IPV6_MROUTE is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+
+#
+# Core Netfilter Configuration
+#
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+CONFIG_NF_CONNTRACK=m
+# CONFIG_NF_CONNTRACK_MARK is not set
+# CONFIG_NF_CONNTRACK_EVENTS is not set
+# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
+# CONFIG_NF_CT_PROTO_DCCP is not set
+# CONFIG_NF_CT_PROTO_SCTP is not set
+# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_NF_CONNTRACK_AMANDA is not set
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_H323=m
+CONFIG_NF_CONNTRACK_IRC=m
+# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
+# CONFIG_NF_CONNTRACK_SNMP is not set
+# CONFIG_NF_CONNTRACK_PPTP is not set
+# CONFIG_NF_CONNTRACK_SANE is not set
+CONFIG_NF_CONNTRACK_SIP=m
+# CONFIG_NF_CONNTRACK_TFTP is not set
+# CONFIG_NF_CT_NETLINK is not set
+# CONFIG_NETFILTER_TPROXY is not set
+CONFIG_NETFILTER_XTABLES=m
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+# CONFIG_NETFILTER_XT_CONNMARK is not set
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set
+# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
+# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
+# CONFIG_NETFILTER_XT_TARGET_CT is not set
+# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+CONFIG_NETFILTER_XT_TARGET_HL=m
+# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
+# CONFIG_NETFILTER_XT_TARGET_LED is not set
+# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
+# CONFIG_NETFILTER_XT_MATCH_CPU is not set
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
+CONFIG_NETFILTER_XT_MATCH_HL=m
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_MAC is not set
+# CONFIG_NETFILTER_XT_MATCH_MARK is not set
+# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
+# CONFIG_NETFILTER_XT_MATCH_STATE is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_DEFRAG_IPV4=m
+CONFIG_NF_CONNTRACK_IPV4=m
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+# CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_TTL=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_TARGET_LOG=m
+CONFIG_IP_NF_TARGET_ULOG=m
+CONFIG_NF_NAT=m
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_NETMAP=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_NF_NAT_FTP=m
+CONFIG_NF_NAT_IRC=m
+# CONFIG_NF_NAT_TFTP is not set
+# CONFIG_NF_NAT_AMANDA is not set
+# CONFIG_NF_NAT_PPTP is not set
+CONFIG_NF_NAT_H323=m
+CONFIG_NF_NAT_SIP=m
+CONFIG_IP_NF_MANGLE=m
+# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_NF_RAW=m
+CONFIG_IP_NF_ARPTABLES=m
+CONFIG_IP_NF_ARPFILTER=m
+CONFIG_IP_NF_ARP_MANGLE=m
+
+#
+# IPv6: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV6 is not set
+# CONFIG_NF_CONNTRACK_IPV6 is not set
+# CONFIG_IP6_NF_QUEUE is not set
+# CONFIG_IP6_NF_IPTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
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
+# CONFIG_DCB is not set
+CONFIG_DNS_RESOLVER=y
+# CONFIG_BATMAN_ADV is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+CONFIG_IRDA=m
+
+#
+# IrDA protocols
+#
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
+# CONFIG_IRDA_ULTRA is not set
+
+#
+# IrDA options
+#
+# CONFIG_IRDA_CACHE_LAST_LSAP is not set
+# CONFIG_IRDA_FAST_RR is not set
+# CONFIG_IRDA_DEBUG is not set
+
+#
+# Infrared-port device drivers
+#
+
+#
+# SIR device drivers
+#
+# CONFIG_IRTTY_SIR is not set
+
+#
+# Dongle support
+#
+
+#
+# FIR device drivers
+#
+CONFIG_PXA_FICP=m
+CONFIG_BT=m
+CONFIG_BT_L2CAP=y
+CONFIG_BT_SCO=y
+CONFIG_BT_RFCOMM=m
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=m
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=m
+
+#
+# Bluetooth device drivers
+#
+CONFIG_BT_HCIBTSDIO=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIDTL1=m
+CONFIG_BT_HCIBT3C=m
+CONFIG_BT_HCIBLUECARD=m
+CONFIG_BT_HCIBTUART=m
+CONFIG_BT_HCIVHCI=m
+CONFIG_BT_MRVL=m
+CONFIG_BT_MRVL_SDIO=m
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_WEXT_SPY=y
+CONFIG_WEXT_PRIV=y
+CONFIG_CFG80211=m
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+# CONFIG_CFG80211_DEFAULT_PS is not set
+# CONFIG_CFG80211_DEBUGFS is not set
+# CONFIG_CFG80211_INTERNAL_REGDB is not set
+CONFIG_CFG80211_WEXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+CONFIG_LIB80211_CRYPT_WEP=m
+CONFIG_LIB80211_CRYPT_CCMP=m
+CONFIG_LIB80211_CRYPT_TKIP=m
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=m
+# CONFIG_MAC80211_RC_PID is not set
+# CONFIG_MAC80211_RC_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT=""
+
+#
+# Some wireless drivers require a rate control algorithm
+#
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUGFS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+# CONFIG_CEPH_LIB is not set
+# CONFIG_NFC is not set
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
+CONFIG_REGMAP=y
+CONFIG_REGMAP_I2C=m
+CONFIG_REGMAP_SPI=m
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_TESTS is not set
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
+# CONFIG_MTD_SWAP is not set
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
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
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
+CONFIG_MTD_UBI_BEB_RESERVE=1
+CONFIG_MTD_UBI_GLUEBI=m
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_BLK_DEV_RBD is not set
+# CONFIG_SENSORS_LIS3LV02D is not set
+CONFIG_MISC_DEVICES=y
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
+# CONFIG_BMP085 is not set
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
+# CONFIG_IWMC3200TOP is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_TI_ST is not set
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
+CONFIG_BLK_DEV_SR=m
+# CONFIG_BLK_DEV_SR_VENDOR is not set
+CONFIG_CHR_DEV_SG=m
+# CONFIG_CHR_DEV_SCH is not set
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
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
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+CONFIG_ATA_VERBOSE_ERROR=y
+CONFIG_SATA_PMP=y
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
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+# CONFIG_BONDING is not set
+# CONFIG_DUMMY is not set
+# CONFIG_EQUALIZER is not set
+CONFIG_MII=m
+# CONFIG_MACVLAN is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+CONFIG_TUN=m
+# CONFIG_VETH is not set
+# CONFIG_ARCNET is not set
+
+#
+# CAIF transport drivers
+#
+CONFIG_ETHERNET=y
+CONFIG_NET_VENDOR_3COM=y
+# CONFIG_PCMCIA_3C574 is not set
+# CONFIG_PCMCIA_3C589 is not set
+CONFIG_NET_VENDOR_AMD=y
+# CONFIG_PCMCIA_NMCLAN is not set
+CONFIG_NET_VENDOR_BROADCOM=y
+# CONFIG_B44 is not set
+CONFIG_NET_VENDOR_CHELSIO=y
+# CONFIG_DM9000 is not set
+# CONFIG_DNET is not set
+CONFIG_NET_VENDOR_FARADAY=y
+# CONFIG_FTMAC100 is not set
+# CONFIG_FTGMAC100 is not set
+CONFIG_NET_VENDOR_FUJITSU=y
+# CONFIG_PCMCIA_FMVJ18X is not set
+CONFIG_NET_VENDOR_INTEL=y
+CONFIG_NET_VENDOR_I825XX=y
+CONFIG_NET_VENDOR_MARVELL=y
+CONFIG_NET_VENDOR_MICREL=y
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_NET_VENDOR_MICROCHIP=y
+# CONFIG_ENC28J60 is not set
+CONFIG_NET_VENDOR_NATSEMI=y
+CONFIG_NET_VENDOR_8390=y
+# CONFIG_PCMCIA_AXNET is not set
+# CONFIG_AX88796 is not set
+CONFIG_PCMCIA_PCNET=m
+# CONFIG_ETHOC is not set
+CONFIG_NET_VENDOR_SEEQ=y
+# CONFIG_SEEQ8005 is not set
+CONFIG_NET_VENDOR_SMSC=y
+# CONFIG_SMC91X is not set
+# CONFIG_PCMCIA_SMC91C92 is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+CONFIG_NET_VENDOR_STMICRO=y
+# CONFIG_STMMAC_ETH is not set
+CONFIG_NET_VENDOR_XIRCOM=y
+# CONFIG_PCMCIA_XIRC2PS is not set
+# CONFIG_PHYLIB is not set
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+# CONFIG_PPP_FILTER is not set
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPPOE is not set
+CONFIG_PPP_ASYNC=m
+# CONFIG_PPP_SYNC_TTY is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=m
+# CONFIG_TR is not set
+CONFIG_WLAN=y
+# CONFIG_PCMCIA_RAYCS is not set
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_ATMEL is not set
+CONFIG_AIRO_CS=m
+# CONFIG_PCMCIA_WL3501 is not set
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_ATH_COMMON is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+# CONFIG_BRCMFMAC is not set
+CONFIG_HOSTAP=m
+CONFIG_HOSTAP_FIRMWARE=y
+# CONFIG_HOSTAP_FIRMWARE_NVRAM is not set
+CONFIG_HOSTAP_CS=m
+# CONFIG_IWM is not set
+# CONFIG_LIBERTAS is not set
+# CONFIG_HERMES is not set
+# CONFIG_P54_COMMON is not set
+# CONFIG_RT2X00 is not set
+# CONFIG_WL1251 is not set
+# CONFIG_WL12XX_MENU is not set
+# CONFIG_MWIFIEX is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+# CONFIG_WAN is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
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
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_LM8323 is not set
+CONFIG_KEYBOARD_LOCOMO=y
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
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
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_WM97XX is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
+CONFIG_INPUT_MISC=y
+# CONFIG_INPUT_AD714X is not set
+# CONFIG_INPUT_BMA150 is not set
+# CONFIG_INPUT_MMA8450 is not set
+# CONFIG_INPUT_MPU3050 is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_KXTJ9 is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_UINPUT=m
+# CONFIG_INPUT_PCF8574 is not set
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
+# CONFIG_INPUT_ADXL34X is not set
+# CONFIG_INPUT_CMA3000 is not set
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
+# CONFIG_N_GSM is not set
+# CONFIG_TRACE_SINK is not set
+CONFIG_DEVKMEM=y
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250_CS=m
+CONFIG_SERIAL_8250_NR_UARTS=4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=m
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_IPWIRELESS is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_RAMOOPS is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
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
+# CONFIG_I2C_STUB is not set
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
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
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
+
+#
+# Enable Device Drivers -> PPS to see the PTP clock options.
+#
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_IT8761E is not set
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
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+CONFIG_POWER_SUPPLY_DEBUG=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ20Z75 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_ISP1704 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_GPIO is not set
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
+# CONFIG_SENSORS_MAX6639 is not set
+# CONFIG_SENSORS_MAX6642 is not set
+# CONFIG_SENSORS_MAX6650 is not set
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
+# CONFIG_SENSORS_SCH5627 is not set
+# CONFIG_SENSORS_SCH5636 is not set
+# CONFIG_SENSORS_ADS1015 is not set
+# CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_ADS7871 is not set
+# CONFIG_SENSORS_AMC6821 is not set
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
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_AAT2870_CORE is not set
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
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_CORGI is not set
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
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
+
+#
+# Display device support
+#
+CONFIG_DISPLAY_SUPPORT=y
+
+#
+# Display hardware drivers
+#
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
+CONFIG_SOUND=m
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SOUND_OSS_CORE_PRECLAIM=y
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+CONFIG_SND_JACK=y
+CONFIG_SND_SEQUENCER=m
+# CONFIG_SND_SEQ_DUMMY is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_SEQUENCER_OSS is not set
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_VMASTER=y
+# CONFIG_SND_RAWMIDI_SEQ is not set
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+CONFIG_SND_AC97_CODEC=m
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_ALOOP is not set
+# CONFIG_SND_VIRMIDI is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+# CONFIG_SND_AC97_POWER_SAVE is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_PXA2XX_PCM=m
+CONFIG_SND_PXA2XX_LIB=m
+CONFIG_SND_PXA2XX_LIB_AC97=y
+CONFIG_SND_PXA2XX_AC97=m
+CONFIG_SND_SPI=y
+CONFIG_SND_PCMCIA=y
+# CONFIG_SND_VXPOCKET is not set
+# CONFIG_SND_PDAUDIOCF is not set
+CONFIG_SND_SOC=m
+# CONFIG_SND_SOC_CACHE_LZO is not set
+CONFIG_SND_PXA2XX_SOC=m
+CONFIG_SND_PXA2XX_SOC_I2S=m
+CONFIG_SND_PXA2XX_SOC_POODLE=m
+CONFIG_SND_SOC_I2C_AND_SPI=m
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_WM8731=m
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=m
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=m
+# CONFIG_HIDRAW is not set
+# CONFIG_HID_PID is not set
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_ELECOM is not set
+# CONFIG_HID_MAGICMOUSE is not set
+# CONFIG_HID_WACOM is not set
+# CONFIG_HID_WIIMOTE is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=m
+CONFIG_USB_ARCH_HAS_HCD=y
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+# CONFIG_USB is not set
+CONFIG_USB_OTG_WHITELIST=y
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_DWC3 is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+CONFIG_USB_GADGET=m
+# CONFIG_USB_GADGET_DEBUG is not set
+CONFIG_USB_GADGET_DEBUG_FILES=y
+CONFIG_USB_GADGET_DEBUG_FS=y
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+# CONFIG_USB_FUSB300 is not set
+CONFIG_USB_PXA25X=m
+# CONFIG_USB_PXA25X_SMALL is not set
+# CONFIG_USB_R8A66597 is not set
+# CONFIG_USB_M66592 is not set
+# CONFIG_USB_NET2272 is not set
+CONFIG_USB_ZERO=m
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+CONFIG_USB_ETH_EEM=y
+# CONFIG_USB_G_NCM is not set
+CONFIG_USB_GADGETFS=m
+# CONFIG_USB_FUNCTIONFS is not set
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+CONFIG_USB_CDC_COMPOSITE=m
+# CONFIG_USB_G_ACM_MS is not set
+CONFIG_USB_G_MULTI=m
+CONFIG_USB_G_MULTI_RNDIS=y
+CONFIG_USB_G_MULTI_CDC=y
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+CONFIG_USB_GPIO_VBUS=m
+CONFIG_USB_ULPI=y
+CONFIG_NOP_USB_XCEIV=m
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
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
+CONFIG_LEDS_LOCOMO=y
+# CONFIG_LEDS_PCA9532 is not set
+# CONFIG_LEDS_GPIO is not set
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
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
+# CONFIG_VIRTIO_BALLOON is not set
+# CONFIG_VIRTIO_MMIO is not set
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
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
+CONFIG_EXT4_FS_XATTR=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+CONFIG_JBD2=y
+# CONFIG_JBD2_DEBUG is not set
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+CONFIG_EXPORTFS=m
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+CONFIG_AUTOFS4_FS=y
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
+# CONFIG_MSDOS_FS is not set
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
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_UNION_FS is not set
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
+# CONFIG_UBIFS_FS_XATTR is not set
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_UBIFS_FS_DEBUG is not set
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=m
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_DEF_FILE_IO_SIZE=4096
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+# CONFIG_NFS_USE_LEGACY_DNS is not set
+CONFIG_NFS_USE_KERNEL_DNS=y
+# CONFIG_NFS_USE_NEW_IDMAPPER is not set
+CONFIG_NFSD=m
+CONFIG_NFSD_V3=y
+# CONFIG_NFSD_V3_ACL is not set
+CONFIG_NFSD_V4=y
+CONFIG_LOCKD=m
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=m
+CONFIG_SUNRPC_GSS=m
+# CONFIG_CEPH_FS is not set
+CONFIG_CIFS=m
+# CONFIG_CIFS_STATS is not set
+# CONFIG_CIFS_WEAK_PW_HASH is not set
+# CONFIG_CIFS_UPCALL is not set
+# CONFIG_CIFS_XATTR is not set
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_DFS_UPCALL is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
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
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="cp437"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_737=m
+CONFIG_NLS_CODEPAGE_775=m
+CONFIG_NLS_CODEPAGE_850=m
+CONFIG_NLS_CODEPAGE_852=m
+CONFIG_NLS_CODEPAGE_855=m
+CONFIG_NLS_CODEPAGE_857=m
+CONFIG_NLS_CODEPAGE_860=m
+CONFIG_NLS_CODEPAGE_861=m
+CONFIG_NLS_CODEPAGE_862=m
+CONFIG_NLS_CODEPAGE_863=m
+CONFIG_NLS_CODEPAGE_864=m
+CONFIG_NLS_CODEPAGE_865=m
+CONFIG_NLS_CODEPAGE_866=m
+CONFIG_NLS_CODEPAGE_869=m
+CONFIG_NLS_CODEPAGE_936=m
+CONFIG_NLS_CODEPAGE_950=m
+CONFIG_NLS_CODEPAGE_932=m
+CONFIG_NLS_CODEPAGE_949=m
+CONFIG_NLS_CODEPAGE_874=m
+CONFIG_NLS_ISO8859_8=m
+CONFIG_NLS_CODEPAGE_1250=m
+CONFIG_NLS_CODEPAGE_1251=m
+CONFIG_NLS_ASCII=m
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_2=m
+CONFIG_NLS_ISO8859_3=m
+CONFIG_NLS_ISO8859_4=m
+CONFIG_NLS_ISO8859_5=m
+CONFIG_NLS_ISO8859_6=m
+CONFIG_NLS_ISO8859_7=m
+CONFIG_NLS_ISO8859_9=m
+CONFIG_NLS_ISO8859_13=m
+CONFIG_NLS_ISO8859_14=m
+CONFIG_NLS_ISO8859_15=m
+CONFIG_NLS_KOI8_R=m
+CONFIG_NLS_KOI8_U=m
+CONFIG_NLS_UTF8=y
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
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
+CONFIG_DEBUG_BUGVERBOSE=y
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_LKDTM is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_RING_BUFFER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_ENCRYPTED_KEYS is not set
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
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
+CONFIG_CRYPTO_AEAD=m
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=m
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=m
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG=m
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP2=y
+CONFIG_CRYPTO_MANAGER=m
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_USER is not set
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_GF128MUL is not set
+CONFIG_CRYPTO_NULL=m
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_AUTHENC=m
+CONFIG_CRYPTO_TEST=m
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
+CONFIG_CRYPTO_CBC=m
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=m
+# CONFIG_CRYPTO_LRW is not set
+CONFIG_CRYPTO_PCBC=m
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_HMAC=m
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=m
+# CONFIG_CRYPTO_GHASH is not set
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_MD5=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=m
+CONFIG_CRYPTO_SHA256=m
+CONFIG_CRYPTO_SHA512=m
+# CONFIG_CRYPTO_TGR192 is not set
+CONFIG_CRYPTO_WP512=m
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_BLOWFISH_COMMON=m
+CONFIG_CRYPTO_CAMELLIA=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_DES=m
+# CONFIG_CRYPTO_FCRYPT is not set
+CONFIG_CRYPTO_KHAZAD=m
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TEA=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_TWOFISH_COMMON=m
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
+CONFIG_CRYPTO_ANSI_CPRNG=m
+# CONFIG_CRYPTO_USER_API_HASH is not set
+# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC32=y
+CONFIG_CRC7=y
+CONFIG_LIBCRC32C=m
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_DECOMPRESS_LZO=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_AVERAGE=y
+# CONFIG_CORDIC is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny/poodle/poodle.scc b/recipes-kernel/linux/linux-yocto-tiny/poodle/poodle.scc
new file mode 100644
index 0000000..7e43809
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/poodle/poodle.scc
@@ -0,0 +1,7 @@
+kconf hardware poodle.cfg
+
+# non hardware
+#include cfg/devtmpfs.scc
+#include cfg/sound.scc
+#include cfg/usb-mass-storage.scc
+#include cfg/fs.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/spitz/spitz-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny/spitz/spitz-tiny.scc
new file mode 100644
index 0000000..ac9c14e
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/spitz/spitz-tiny.scc
@@ -0,0 +1,7 @@
+define KMACHINE spitz
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny
+
+include spitz.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/spitz/spitz.cfg b/recipes-kernel/linux/linux-yocto-tiny/spitz/spitz.cfg
new file mode 100644
index 0000000..0998a0f
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/spitz/spitz.cfg
@@ -0,0 +1,2691 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.2.12 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_HAVE_SCHED_CLOCK=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_GENERIC_BUG=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+# CONFIG_FHANDLE is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_HAVE_SPARSE_IRQ=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_SPARSE_IRQ=y
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+# CONFIG_CGROUP_DEBUG is not set
+# CONFIG_CGROUP_FREEZER is not set
+# CONFIG_CGROUP_DEVICE is not set
+# CONFIG_CPUSETS is not set
+# CONFIG_CGROUP_CPUACCT is not set
+# CONFIG_RESOURCE_COUNTERS is not set
+# CONFIG_CGROUP_PERF is not set
+# CONFIG_CGROUP_SCHED is not set
+# CONFIG_BLK_CGROUP is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=m
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=m
+CONFIG_IOSCHED_CFQ=m
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+CONFIG_INLINE_SPIN_UNLOCK=y
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_HIGHBANK is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_PRIMA2 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PICOXCELL is not set
+# CONFIG_ARCH_PNX4008 is not set
+CONFIG_ARCH_PXA=y
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_TCC_926 is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_VT8500 is not set
+# CONFIG_ARCH_ZYNQ is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# Intel PXA2xx/PXA3xx Implementations
+#
+# CONFIG_ARCH_PXA_V7 is not set
+
+#
+# Intel/Marvell Dev Platforms (sorted by hardware release time)
+#
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
+# CONFIG_PXA_SHARPSL_DETECT_MACH_ID is not set
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
+
+#
+# System MMU
+#
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
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_DCACHE_DISABLE is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+CONFIG_IWMMXT=y
+CONFIG_XSCALE_PMU=y
+CONFIG_CPU_HAS_PMU=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+CONFIG_PCMCIA_LOAD_CIS=y
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
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_HW_PERF_EVENTS=y
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
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
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
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_FPE_NWFPE is not set
+# CONFIG_FPE_FASTFPE is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+CONFIG_BINFMT_AOUT=m
+CONFIG_BINFMT_MISC=m
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+CONFIG_PM_RUNTIME=y
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=m
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=m
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_XFRM_IPCOMP=m
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE_DEMUX is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=m
+CONFIG_INET_XFRM_MODE_TUNNEL=m
+CONFIG_INET_XFRM_MODE_BEET=m
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=m
+CONFIG_INET_TCP_DIAG=m
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+CONFIG_IPV6=m
+# CONFIG_IPV6_PRIVACY is not set
+# CONFIG_IPV6_ROUTER_PREF is not set
+# CONFIG_IPV6_OPTIMISTIC_DAD is not set
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_IPCOMP=m
+# CONFIG_IPV6_MIP6 is not set
+CONFIG_INET6_XFRM_TUNNEL=m
+CONFIG_INET6_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
+# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
+CONFIG_IPV6_SIT=m
+# CONFIG_IPV6_SIT_6RD is not set
+CONFIG_IPV6_NDISC_NODETYPE=y
+CONFIG_IPV6_TUNNEL=m
+# CONFIG_IPV6_MULTIPLE_TABLES is not set
+# CONFIG_IPV6_MROUTE is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+
+#
+# Core Netfilter Configuration
+#
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+CONFIG_NF_CONNTRACK=m
+# CONFIG_NF_CONNTRACK_MARK is not set
+# CONFIG_NF_CONNTRACK_EVENTS is not set
+# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
+# CONFIG_NF_CT_PROTO_DCCP is not set
+# CONFIG_NF_CT_PROTO_SCTP is not set
+# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_NF_CONNTRACK_AMANDA is not set
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_H323=m
+CONFIG_NF_CONNTRACK_IRC=m
+# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
+# CONFIG_NF_CONNTRACK_SNMP is not set
+# CONFIG_NF_CONNTRACK_PPTP is not set
+# CONFIG_NF_CONNTRACK_SANE is not set
+CONFIG_NF_CONNTRACK_SIP=m
+# CONFIG_NF_CONNTRACK_TFTP is not set
+# CONFIG_NF_CT_NETLINK is not set
+# CONFIG_NETFILTER_TPROXY is not set
+CONFIG_NETFILTER_XTABLES=m
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+# CONFIG_NETFILTER_XT_CONNMARK is not set
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set
+# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
+# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
+# CONFIG_NETFILTER_XT_TARGET_CT is not set
+# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+CONFIG_NETFILTER_XT_TARGET_HL=m
+# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
+# CONFIG_NETFILTER_XT_TARGET_LED is not set
+# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
+# CONFIG_NETFILTER_XT_MATCH_CPU is not set
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
+CONFIG_NETFILTER_XT_MATCH_HL=m
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_MAC is not set
+# CONFIG_NETFILTER_XT_MATCH_MARK is not set
+# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
+# CONFIG_NETFILTER_XT_MATCH_STATE is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_DEFRAG_IPV4=m
+CONFIG_NF_CONNTRACK_IPV4=m
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+# CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_TTL=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_TARGET_LOG=m
+CONFIG_IP_NF_TARGET_ULOG=m
+CONFIG_NF_NAT=m
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_NETMAP=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_NF_NAT_FTP=m
+CONFIG_NF_NAT_IRC=m
+# CONFIG_NF_NAT_TFTP is not set
+# CONFIG_NF_NAT_AMANDA is not set
+# CONFIG_NF_NAT_PPTP is not set
+CONFIG_NF_NAT_H323=m
+CONFIG_NF_NAT_SIP=m
+CONFIG_IP_NF_MANGLE=m
+# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_NF_RAW=m
+CONFIG_IP_NF_ARPTABLES=m
+CONFIG_IP_NF_ARPFILTER=m
+CONFIG_IP_NF_ARP_MANGLE=m
+
+#
+# IPv6: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV6 is not set
+# CONFIG_NF_CONNTRACK_IPV6 is not set
+# CONFIG_IP6_NF_QUEUE is not set
+# CONFIG_IP6_NF_IPTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
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
+# CONFIG_DCB is not set
+CONFIG_DNS_RESOLVER=y
+# CONFIG_BATMAN_ADV is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+CONFIG_IRDA=m
+
+#
+# IrDA protocols
+#
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
+# CONFIG_IRDA_ULTRA is not set
+
+#
+# IrDA options
+#
+# CONFIG_IRDA_CACHE_LAST_LSAP is not set
+# CONFIG_IRDA_FAST_RR is not set
+# CONFIG_IRDA_DEBUG is not set
+
+#
+# Infrared-port device drivers
+#
+
+#
+# SIR device drivers
+#
+# CONFIG_IRTTY_SIR is not set
+
+#
+# Dongle support
+#
+# CONFIG_KINGSUN_DONGLE is not set
+# CONFIG_KSDAZZLE_DONGLE is not set
+# CONFIG_KS959_DONGLE is not set
+
+#
+# FIR device drivers
+#
+# CONFIG_USB_IRDA is not set
+# CONFIG_SIGMATEL_FIR is not set
+CONFIG_PXA_FICP=m
+# CONFIG_MCS_FIR is not set
+CONFIG_BT=m
+CONFIG_BT_L2CAP=y
+CONFIG_BT_SCO=y
+CONFIG_BT_RFCOMM=m
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=m
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=m
+
+#
+# Bluetooth device drivers
+#
+CONFIG_BT_HCIBTUSB=m
+CONFIG_BT_HCIBTSDIO=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIBCM203X=m
+CONFIG_BT_HCIBPA10X=m
+CONFIG_BT_HCIBFUSB=m
+CONFIG_BT_HCIDTL1=m
+CONFIG_BT_HCIBT3C=m
+CONFIG_BT_HCIBLUECARD=m
+CONFIG_BT_HCIBTUART=m
+CONFIG_BT_HCIVHCI=m
+CONFIG_BT_MRVL=m
+CONFIG_BT_MRVL_SDIO=m
+CONFIG_BT_ATH3K=m
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_WEXT_SPY=y
+CONFIG_WEXT_PRIV=y
+CONFIG_CFG80211=m
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+# CONFIG_CFG80211_DEFAULT_PS is not set
+# CONFIG_CFG80211_DEBUGFS is not set
+# CONFIG_CFG80211_INTERNAL_REGDB is not set
+CONFIG_CFG80211_WEXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+CONFIG_LIB80211_CRYPT_WEP=m
+CONFIG_LIB80211_CRYPT_CCMP=m
+CONFIG_LIB80211_CRYPT_TKIP=m
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=m
+# CONFIG_MAC80211_RC_PID is not set
+# CONFIG_MAC80211_RC_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT=""
+
+#
+# Some wireless drivers require a rate control algorithm
+#
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUGFS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+# CONFIG_CEPH_LIB is not set
+# CONFIG_NFC is not set
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
+CONFIG_REGMAP=y
+CONFIG_REGMAP_I2C=m
+CONFIG_REGMAP_SPI=m
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_TESTS is not set
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
+# CONFIG_MTD_SWAP is not set
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
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+CONFIG_MTD_NAND_SHARPSL=y
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_RESERVE=1
+CONFIG_MTD_UBI_GLUEBI=m
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_BLK_DEV_RBD is not set
+# CONFIG_SENSORS_LIS3LV02D is not set
+CONFIG_MISC_DEVICES=y
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
+# CONFIG_BMP085 is not set
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
+# CONFIG_IWMC3200TOP is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_TI_ST is not set
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
+CONFIG_BLK_DEV_SR=m
+# CONFIG_BLK_DEV_SR_VENDOR is not set
+CONFIG_CHR_DEV_SG=m
+# CONFIG_CHR_DEV_SCH is not set
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
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
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+CONFIG_ATA_VERBOSE_ERROR=y
+CONFIG_SATA_PMP=y
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
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+# CONFIG_BONDING is not set
+# CONFIG_DUMMY is not set
+# CONFIG_EQUALIZER is not set
+CONFIG_MII=m
+# CONFIG_MACVLAN is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+CONFIG_TUN=m
+# CONFIG_VETH is not set
+# CONFIG_ARCNET is not set
+
+#
+# CAIF transport drivers
+#
+CONFIG_ETHERNET=y
+CONFIG_NET_VENDOR_3COM=y
+# CONFIG_PCMCIA_3C574 is not set
+# CONFIG_PCMCIA_3C589 is not set
+CONFIG_NET_VENDOR_AMD=y
+# CONFIG_PCMCIA_NMCLAN is not set
+CONFIG_NET_VENDOR_BROADCOM=y
+# CONFIG_B44 is not set
+CONFIG_NET_VENDOR_CHELSIO=y
+# CONFIG_DM9000 is not set
+# CONFIG_DNET is not set
+CONFIG_NET_VENDOR_FARADAY=y
+# CONFIG_FTMAC100 is not set
+# CONFIG_FTGMAC100 is not set
+CONFIG_NET_VENDOR_FUJITSU=y
+# CONFIG_PCMCIA_FMVJ18X is not set
+CONFIG_NET_VENDOR_INTEL=y
+CONFIG_NET_VENDOR_I825XX=y
+CONFIG_NET_VENDOR_MARVELL=y
+CONFIG_NET_VENDOR_MICREL=y
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_NET_VENDOR_MICROCHIP=y
+# CONFIG_ENC28J60 is not set
+CONFIG_NET_VENDOR_NATSEMI=y
+CONFIG_NET_VENDOR_8390=y
+# CONFIG_PCMCIA_AXNET is not set
+# CONFIG_AX88796 is not set
+CONFIG_PCMCIA_PCNET=m
+# CONFIG_ETHOC is not set
+CONFIG_NET_VENDOR_SEEQ=y
+# CONFIG_SEEQ8005 is not set
+CONFIG_NET_VENDOR_SMSC=y
+# CONFIG_SMC91X is not set
+# CONFIG_PCMCIA_SMC91C92 is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+CONFIG_NET_VENDOR_STMICRO=y
+# CONFIG_STMMAC_ETH is not set
+CONFIG_NET_VENDOR_XIRCOM=y
+# CONFIG_PCMCIA_XIRC2PS is not set
+# CONFIG_PHYLIB is not set
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+# CONFIG_PPP_FILTER is not set
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPPOE is not set
+CONFIG_PPP_ASYNC=m
+# CONFIG_PPP_SYNC_TTY is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=m
+# CONFIG_TR is not set
+
+#
+# USB Network Adapters
+#
+CONFIG_USB_CATC=m
+CONFIG_USB_KAWETH=m
+CONFIG_USB_PEGASUS=m
+CONFIG_USB_RTL8150=m
+CONFIG_USB_USBNET=m
+CONFIG_USB_NET_AX8817X=m
+CONFIG_USB_NET_CDCETHER=m
+# CONFIG_USB_NET_CDC_EEM is not set
+CONFIG_USB_NET_CDC_NCM=m
+CONFIG_USB_NET_DM9601=m
+# CONFIG_USB_NET_SMSC75XX is not set
+# CONFIG_USB_NET_SMSC95XX is not set
+# CONFIG_USB_NET_GL620A is not set
+CONFIG_USB_NET_NET1080=m
+# CONFIG_USB_NET_PLUSB is not set
+# CONFIG_USB_NET_MCS7830 is not set
+# CONFIG_USB_NET_RNDIS_HOST is not set
+# CONFIG_USB_NET_CDC_SUBSET is not set
+CONFIG_USB_NET_ZAURUS=m
+# CONFIG_USB_NET_CX82310_ETH is not set
+# CONFIG_USB_NET_KALMIA is not set
+# CONFIG_USB_NET_INT51X1 is not set
+# CONFIG_USB_IPHETH is not set
+CONFIG_USB_SIERRA_NET=m
+# CONFIG_USB_VL600 is not set
+CONFIG_WLAN=y
+# CONFIG_PCMCIA_RAYCS is not set
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_ATMEL is not set
+# CONFIG_AT76C50X_USB is not set
+CONFIG_AIRO_CS=m
+# CONFIG_PCMCIA_WL3501 is not set
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_USB_NET_RNDIS_WLAN is not set
+# CONFIG_RTL8187 is not set
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_ATH_COMMON is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+# CONFIG_BRCMFMAC is not set
+CONFIG_HOSTAP=m
+CONFIG_HOSTAP_FIRMWARE=y
+# CONFIG_HOSTAP_FIRMWARE_NVRAM is not set
+CONFIG_HOSTAP_CS=m
+# CONFIG_IWM is not set
+# CONFIG_LIBERTAS is not set
+# CONFIG_HERMES is not set
+# CONFIG_P54_COMMON is not set
+# CONFIG_RT2X00 is not set
+# CONFIG_RTL8192CU is not set
+# CONFIG_WL1251 is not set
+# CONFIG_WL12XX_MENU is not set
+# CONFIG_ZD1211RW is not set
+# CONFIG_MWIFIEX is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+# CONFIG_WAN is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
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
+CONFIG_KEYBOARD_MATRIX=y
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_PXA27x is not set
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
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_WM97XX is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
+CONFIG_INPUT_MISC=y
+# CONFIG_INPUT_AD714X is not set
+# CONFIG_INPUT_BMA150 is not set
+# CONFIG_INPUT_MMA8450 is not set
+# CONFIG_INPUT_MPU3050 is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_KXTJ9 is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_UINPUT=m
+# CONFIG_INPUT_PCF8574 is not set
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
+# CONFIG_INPUT_ADXL34X is not set
+# CONFIG_INPUT_CMA3000 is not set
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
+# CONFIG_N_GSM is not set
+# CONFIG_TRACE_SINK is not set
+CONFIG_DEVKMEM=y
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250_CS=m
+CONFIG_SERIAL_8250_NR_UARTS=4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=m
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_IPWIRELESS is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_RAMOOPS is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
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
+# CONFIG_I2C_DIOLAN_U2C is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_STUB is not set
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
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
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
+
+#
+# Enable Device Drivers -> PPS to see the PTP clock options.
+#
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_IT8761E is not set
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
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+CONFIG_POWER_SUPPLY_DEBUG=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ20Z75 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_ISP1704 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_GPIO is not set
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
+# CONFIG_SENSORS_MAX6639 is not set
+# CONFIG_SENSORS_MAX6642 is not set
+# CONFIG_SENSORS_MAX6650 is not set
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
+# CONFIG_SENSORS_SCH5627 is not set
+# CONFIG_SENSORS_SCH5636 is not set
+# CONFIG_SENSORS_ADS1015 is not set
+# CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_ADS7871 is not set
+# CONFIG_SENSORS_AMC6821 is not set
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
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_AAT2870_CORE is not set
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
+CONFIG_FB_PXA_OVERLAY=y
+CONFIG_FB_PXA_SMARTPANEL=y
+CONFIG_FB_PXA_PARAMETERS=y
+# CONFIG_PXA3XX_GCU is not set
+# CONFIG_FB_MBX is not set
+# CONFIG_FB_W100 is not set
+# CONFIG_FB_SMSCUFX is not set
+# CONFIG_FB_UDL is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_BROADSHEET is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LCD_CORGI=y
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
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
+
+#
+# Display device support
+#
+CONFIG_DISPLAY_SUPPORT=y
+
+#
+# Display hardware drivers
+#
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
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=m
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SOUND_OSS_CORE_PRECLAIM=y
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+CONFIG_SND_HWDEP=m
+CONFIG_SND_RAWMIDI=m
+CONFIG_SND_JACK=y
+CONFIG_SND_SEQUENCER=m
+# CONFIG_SND_SEQ_DUMMY is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_SEQUENCER_OSS is not set
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_VMASTER=y
+CONFIG_SND_RAWMIDI_SEQ=m
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+CONFIG_SND_AC97_CODEC=m
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_ALOOP is not set
+# CONFIG_SND_VIRMIDI is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+# CONFIG_SND_AC97_POWER_SAVE is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_PXA2XX_PCM=m
+CONFIG_SND_PXA2XX_LIB=m
+CONFIG_SND_PXA2XX_LIB_AC97=y
+CONFIG_SND_PXA2XX_AC97=m
+CONFIG_SND_SPI=y
+CONFIG_SND_USB=y
+CONFIG_SND_USB_AUDIO=m
+# CONFIG_SND_USB_UA101 is not set
+# CONFIG_SND_USB_CAIAQ is not set
+# CONFIG_SND_USB_6FIRE is not set
+CONFIG_SND_PCMCIA=y
+# CONFIG_SND_VXPOCKET is not set
+# CONFIG_SND_PDAUDIOCF is not set
+CONFIG_SND_SOC=m
+# CONFIG_SND_SOC_CACHE_LZO is not set
+CONFIG_SND_PXA2XX_SOC=m
+CONFIG_SND_PXA2XX_SOC_I2S=m
+CONFIG_SND_PXA2XX_SOC_SPITZ=m
+CONFIG_SND_SOC_I2C_AND_SPI=m
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_WM8750=m
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=m
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=m
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=m
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# USB HID Boot Protocol drivers
+#
+CONFIG_USB_KBD=m
+CONFIG_USB_MOUSE=m
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_ACRUX is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_PRODIKEYS is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_DRAGONRISE is not set
+# CONFIG_HID_EMS_FF is not set
+# CONFIG_HID_ELECOM is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_HOLTEK is not set
+# CONFIG_HID_KEYTOUCH is not set
+# CONFIG_HID_KYE is not set
+# CONFIG_HID_UCLOGIC is not set
+# CONFIG_HID_WALTOP is not set
+# CONFIG_HID_GYRATION is not set
+# CONFIG_HID_TWINHAN is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LCPOWER is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MAGICMOUSE is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_MULTITOUCH is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_ORTEK is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_PICOLCD is not set
+# CONFIG_HID_PRIMAX is not set
+# CONFIG_HID_QUANTA is not set
+# CONFIG_HID_ROCCAT is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_SPEEDLINK is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_WACOM is not set
+# CONFIG_HID_WIIMOTE is not set
+# CONFIG_HID_ZEROPLUS is not set
+# CONFIG_HID_ZYDACRON is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=m
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+CONFIG_USB=m
+CONFIG_USB_DEBUG=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_SUSPEND is not set
+CONFIG_USB_OTG_WHITELIST=y
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_DWC3 is not set
+CONFIG_USB_MON=m
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
+CONFIG_USB_OHCI_HCD=m
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=y
+CONFIG_USB_SL811_HCD=m
+# CONFIG_USB_SL811_HCD_ISO is not set
+CONFIG_USB_SL811_CS=m
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_RENESAS_USBHS is not set
+
+#
+# USB Device Class drivers
+#
+CONFIG_USB_ACM=m
+CONFIG_USB_PRINTER=m
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
+CONFIG_USB_STORAGE=m
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_REALTEK is not set
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
+# CONFIG_USB_STORAGE_ENE_UB6250 is not set
+# CONFIG_USB_UAS is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+CONFIG_USB_MDC800=m
+CONFIG_USB_MICROTEK=m
+
+#
+# USB port drivers
+#
+CONFIG_USB_SERIAL=m
+CONFIG_USB_EZUSB=y
+CONFIG_USB_SERIAL_GENERIC=y
+# CONFIG_USB_SERIAL_AIRCABLE is not set
+# CONFIG_USB_SERIAL_ARK3116 is not set
+CONFIG_USB_SERIAL_BELKIN=m
+# CONFIG_USB_SERIAL_CH341 is not set
+# CONFIG_USB_SERIAL_WHITEHEAT is not set
+CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
+# CONFIG_USB_SERIAL_CP210X is not set
+CONFIG_USB_SERIAL_CYPRESS_M8=m
+CONFIG_USB_SERIAL_EMPEG=m
+CONFIG_USB_SERIAL_FTDI_SIO=m
+# CONFIG_USB_SERIAL_FUNSOFT is not set
+CONFIG_USB_SERIAL_VISOR=m
+CONFIG_USB_SERIAL_IPAQ=m
+CONFIG_USB_SERIAL_IR=m
+CONFIG_USB_SERIAL_EDGEPORT=m
+CONFIG_USB_SERIAL_EDGEPORT_TI=m
+CONFIG_USB_SERIAL_GARMIN=m
+CONFIG_USB_SERIAL_IPW=m
+# CONFIG_USB_SERIAL_IUU is not set
+CONFIG_USB_SERIAL_KEYSPAN_PDA=m
+CONFIG_USB_SERIAL_KEYSPAN=m
+# CONFIG_USB_SERIAL_KEYSPAN_MPR is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28 is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28X is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28XA is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28XB is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19 is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA18X is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19W is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19QW is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19QI is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA49W is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA49WLC is not set
+CONFIG_USB_SERIAL_KLSI=m
+CONFIG_USB_SERIAL_KOBIL_SCT=m
+CONFIG_USB_SERIAL_MCT_U232=m
+# CONFIG_USB_SERIAL_MOS7720 is not set
+# CONFIG_USB_SERIAL_MOS7840 is not set
+# CONFIG_USB_SERIAL_MOTOROLA is not set
+# CONFIG_USB_SERIAL_NAVMAN is not set
+CONFIG_USB_SERIAL_PL2303=m
+# CONFIG_USB_SERIAL_OTI6858 is not set
+# CONFIG_USB_SERIAL_QCAUX is not set
+# CONFIG_USB_SERIAL_QUALCOMM is not set
+# CONFIG_USB_SERIAL_SPCP8X5 is not set
+# CONFIG_USB_SERIAL_HP4X is not set
+CONFIG_USB_SERIAL_SAFE=m
+# CONFIG_USB_SERIAL_SAFE_PADDED is not set
+# CONFIG_USB_SERIAL_SIEMENS_MPI is not set
+# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
+# CONFIG_USB_SERIAL_SYMBOL is not set
+CONFIG_USB_SERIAL_TI=m
+CONFIG_USB_SERIAL_CYBERJACK=m
+CONFIG_USB_SERIAL_XIRCOM=m
+CONFIG_USB_SERIAL_WWAN=m
+# CONFIG_USB_SERIAL_OPTION is not set
+CONFIG_USB_SERIAL_OMNINET=m
+# CONFIG_USB_SERIAL_OPTICON is not set
+# CONFIG_USB_SERIAL_VIVOPAY_SERIAL is not set
+# CONFIG_USB_SERIAL_ZIO is not set
+# CONFIG_USB_SERIAL_SSU100 is not set
+# CONFIG_USB_SERIAL_DEBUG is not set
+
+#
+# USB Miscellaneous drivers
+#
+CONFIG_USB_EMI62=m
+CONFIG_USB_EMI26=m
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+CONFIG_USB_RIO500=m
+CONFIG_USB_LEGOTOWER=m
+CONFIG_USB_LCD=m
+CONFIG_USB_LED=m
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+CONFIG_USB_CYTHERM=m
+CONFIG_USB_IDMOUSE=m
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_YUREX is not set
+CONFIG_USB_GADGET=m
+# CONFIG_USB_GADGET_DEBUG is not set
+CONFIG_USB_GADGET_DEBUG_FILES=y
+CONFIG_USB_GADGET_DEBUG_FS=y
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+# CONFIG_USB_FUSB300 is not set
+# CONFIG_USB_R8A66597 is not set
+CONFIG_USB_PXA27X=m
+# CONFIG_USB_M66592 is not set
+# CONFIG_USB_NET2272 is not set
+# CONFIG_USB_DUMMY_HCD is not set
+CONFIG_USB_ZERO=m
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+CONFIG_USB_ETH_EEM=y
+# CONFIG_USB_G_NCM is not set
+CONFIG_USB_GADGETFS=m
+# CONFIG_USB_FUNCTIONFS is not set
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+CONFIG_USB_CDC_COMPOSITE=m
+# CONFIG_USB_G_ACM_MS is not set
+CONFIG_USB_G_MULTI=m
+CONFIG_USB_G_MULTI_RNDIS=y
+CONFIG_USB_G_MULTI_CDC=y
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+CONFIG_USB_GPIO_VBUS=m
+CONFIG_USB_ULPI=y
+CONFIG_NOP_USB_XCEIV=m
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
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
+CONFIG_MMC_SPI=y
+# CONFIG_MMC_DW is not set
+# CONFIG_MMC_VUB300 is not set
+# CONFIG_MMC_USHC is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_LM3530 is not set
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
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
+# CONFIG_VIRTIO_BALLOON is not set
+# CONFIG_VIRTIO_MMIO is not set
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
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
+CONFIG_EXT4_FS_XATTR=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+CONFIG_JBD2=y
+# CONFIG_JBD2_DEBUG is not set
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+CONFIG_EXPORTFS=m
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+CONFIG_AUTOFS4_FS=y
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
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
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
+# CONFIG_UBIFS_FS_XATTR is not set
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_UBIFS_FS_DEBUG is not set
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=m
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+# CONFIG_NFS_USE_LEGACY_DNS is not set
+CONFIG_NFS_USE_KERNEL_DNS=y
+# CONFIG_NFS_USE_NEW_IDMAPPER is not set
+CONFIG_NFSD=m
+CONFIG_NFSD_V3=y
+# CONFIG_NFSD_V3_ACL is not set
+CONFIG_NFSD_V4=y
+CONFIG_LOCKD=m
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=m
+CONFIG_SUNRPC_GSS=m
+# CONFIG_CEPH_FS is not set
+CONFIG_CIFS=m
+# CONFIG_CIFS_STATS is not set
+# CONFIG_CIFS_WEAK_PW_HASH is not set
+# CONFIG_CIFS_UPCALL is not set
+# CONFIG_CIFS_XATTR is not set
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_DFS_UPCALL is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
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
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="cp437"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_737=m
+CONFIG_NLS_CODEPAGE_775=m
+CONFIG_NLS_CODEPAGE_850=m
+CONFIG_NLS_CODEPAGE_852=m
+CONFIG_NLS_CODEPAGE_855=m
+CONFIG_NLS_CODEPAGE_857=m
+CONFIG_NLS_CODEPAGE_860=m
+CONFIG_NLS_CODEPAGE_861=m
+CONFIG_NLS_CODEPAGE_862=m
+CONFIG_NLS_CODEPAGE_863=m
+CONFIG_NLS_CODEPAGE_864=m
+CONFIG_NLS_CODEPAGE_865=m
+CONFIG_NLS_CODEPAGE_866=m
+CONFIG_NLS_CODEPAGE_869=m
+CONFIG_NLS_CODEPAGE_936=m
+CONFIG_NLS_CODEPAGE_950=m
+CONFIG_NLS_CODEPAGE_932=m
+CONFIG_NLS_CODEPAGE_949=m
+CONFIG_NLS_CODEPAGE_874=m
+CONFIG_NLS_ISO8859_8=m
+CONFIG_NLS_CODEPAGE_1250=m
+CONFIG_NLS_CODEPAGE_1251=m
+CONFIG_NLS_ASCII=m
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_2=m
+CONFIG_NLS_ISO8859_3=m
+CONFIG_NLS_ISO8859_4=m
+CONFIG_NLS_ISO8859_5=m
+CONFIG_NLS_ISO8859_6=m
+CONFIG_NLS_ISO8859_7=m
+CONFIG_NLS_ISO8859_9=m
+CONFIG_NLS_ISO8859_13=m
+CONFIG_NLS_ISO8859_14=m
+CONFIG_NLS_ISO8859_15=m
+CONFIG_NLS_KOI8_R=m
+CONFIG_NLS_KOI8_U=m
+CONFIG_NLS_UTF8=y
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
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
+CONFIG_DEBUG_BUGVERBOSE=y
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_LKDTM is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_RING_BUFFER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_ENCRYPTED_KEYS is not set
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
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
+CONFIG_CRYPTO_AEAD=m
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=m
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=m
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG=m
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP2=y
+CONFIG_CRYPTO_MANAGER=m
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_USER is not set
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_GF128MUL is not set
+CONFIG_CRYPTO_NULL=m
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_AUTHENC=m
+CONFIG_CRYPTO_TEST=m
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
+CONFIG_CRYPTO_CBC=m
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=m
+# CONFIG_CRYPTO_LRW is not set
+CONFIG_CRYPTO_PCBC=m
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_HMAC=m
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=m
+# CONFIG_CRYPTO_GHASH is not set
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_MD5=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=m
+CONFIG_CRYPTO_SHA256=m
+CONFIG_CRYPTO_SHA512=m
+# CONFIG_CRYPTO_TGR192 is not set
+CONFIG_CRYPTO_WP512=m
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_BLOWFISH_COMMON=m
+CONFIG_CRYPTO_CAMELLIA=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_DES=m
+# CONFIG_CRYPTO_FCRYPT is not set
+CONFIG_CRYPTO_KHAZAD=m
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TEA=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_TWOFISH_COMMON=m
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
+CONFIG_CRYPTO_ANSI_CPRNG=m
+# CONFIG_CRYPTO_USER_API_HASH is not set
+# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC32=y
+CONFIG_CRC7=y
+CONFIG_LIBCRC32C=m
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_DECOMPRESS_LZO=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_AVERAGE=y
+# CONFIG_CORDIC is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny/spitz/spitz.scc b/recipes-kernel/linux/linux-yocto-tiny/spitz/spitz.scc
new file mode 100644
index 0000000..ac9f8c9
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/spitz/spitz.scc
@@ -0,0 +1,7 @@
+kconf hardware spitz.cfg
+
+# non hardware
+#include cfg/devtmpfs.scc
+#include cfg/sound.scc
+#include cfg/usb-mass-storage.scc
+#include cfg/fs.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/tosa/tosa-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny/tosa/tosa-tiny.scc
new file mode 100644
index 0000000..d5763f0
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/tosa/tosa-tiny.scc
@@ -0,0 +1,7 @@
+define KMACHINE tosa
+define KTYPE tiny
+define KARCH arm
+
+include ktypes/tiny
+
+include tosa.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny/tosa/tosa.cfg b/recipes-kernel/linux/linux-yocto-tiny/tosa/tosa.cfg
new file mode 100644
index 0000000..4b28265
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/tosa/tosa.cfg
@@ -0,0 +1,2694 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.2.12 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_HAVE_SCHED_CLOCK=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_GENERIC_BUG=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+# CONFIG_FHANDLE is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_HAVE_SPARSE_IRQ=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_SPARSE_IRQ=y
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+# CONFIG_CGROUP_DEBUG is not set
+# CONFIG_CGROUP_FREEZER is not set
+# CONFIG_CGROUP_DEVICE is not set
+# CONFIG_CPUSETS is not set
+# CONFIG_CGROUP_CPUACCT is not set
+# CONFIG_RESOURCE_COUNTERS is not set
+# CONFIG_CGROUP_PERF is not set
+# CONFIG_CGROUP_SCHED is not set
+# CONFIG_BLK_CGROUP is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+# CONFIG_RD_XZ is not set
+CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=m
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=m
+CONFIG_IOSCHED_CFQ=m
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+CONFIG_INLINE_SPIN_UNLOCK=y
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_HIGHBANK is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_PRIMA2 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PICOXCELL is not set
+# CONFIG_ARCH_PNX4008 is not set
+CONFIG_ARCH_PXA=y
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_TCC_926 is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_VT8500 is not set
+# CONFIG_ARCH_ZYNQ is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# Intel PXA2xx/PXA3xx Implementations
+#
+# CONFIG_ARCH_PXA_V7 is not set
+
+#
+# Intel/Marvell Dev Platforms (sorted by hardware release time)
+#
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
+# CONFIG_PXA_SHARPSL_DETECT_MACH_ID is not set
+# CONFIG_MACH_POODLE is not set
+# CONFIG_MACH_CORGI is not set
+# CONFIG_MACH_SHEPHERD is not set
+# CONFIG_MACH_HUSKY is not set
+# CONFIG_MACH_AKITA is not set
+# CONFIG_MACH_SPITZ is not set
+# CONFIG_MACH_BORZOI is not set
+CONFIG_MACH_TOSA=y
+CONFIG_TOSA_BT=m
+# CONFIG_TOSA_USE_EXT_KEYCODES is not set
+# CONFIG_MACH_ICONTROL is not set
+# CONFIG_ARCH_PXA_ESERIES is not set
+# CONFIG_MACH_ZIPIT2 is not set
+CONFIG_PXA25x=y
+CONFIG_PXA_SSP=y
+
+#
+# System MMU
+#
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
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_DCACHE_DISABLE is not set
+CONFIG_ARM_L1_CACHE_SHIFT=5
+# CONFIG_IWMMXT is not set
+CONFIG_XSCALE_PMU=y
+CONFIG_CPU_HAS_PMU=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_SHARP_PARAM=y
+CONFIG_SHARP_SCOOP=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+CONFIG_PCMCIA_LOAD_CIS=y
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
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_HW_PERF_EVENTS=y
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
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+
+#
+# Boot options
+#
+# CONFIG_USE_OF is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 loglevel=3"
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
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_FPE_NWFPE is not set
+# CONFIG_FPE_FASTFPE is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+CONFIG_BINFMT_AOUT=m
+CONFIG_BINFMT_MISC=m
+
+#
+# Power management options
+#
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
+CONFIG_PM_RUNTIME=y
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_APM_EMULATION=y
+CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=m
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=m
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_XFRM_IPCOMP=m
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE_DEMUX is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=m
+CONFIG_INET_XFRM_MODE_TUNNEL=m
+CONFIG_INET_XFRM_MODE_BEET=m
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=m
+CONFIG_INET_TCP_DIAG=m
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+CONFIG_IPV6=m
+# CONFIG_IPV6_PRIVACY is not set
+# CONFIG_IPV6_ROUTER_PREF is not set
+# CONFIG_IPV6_OPTIMISTIC_DAD is not set
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_IPCOMP=m
+# CONFIG_IPV6_MIP6 is not set
+CONFIG_INET6_XFRM_TUNNEL=m
+CONFIG_INET6_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
+# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
+CONFIG_IPV6_SIT=m
+# CONFIG_IPV6_SIT_6RD is not set
+CONFIG_IPV6_NDISC_NODETYPE=y
+CONFIG_IPV6_TUNNEL=m
+# CONFIG_IPV6_MULTIPLE_TABLES is not set
+# CONFIG_IPV6_MROUTE is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+
+#
+# Core Netfilter Configuration
+#
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+CONFIG_NF_CONNTRACK=m
+# CONFIG_NF_CONNTRACK_MARK is not set
+# CONFIG_NF_CONNTRACK_EVENTS is not set
+# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
+# CONFIG_NF_CT_PROTO_DCCP is not set
+# CONFIG_NF_CT_PROTO_SCTP is not set
+# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_NF_CONNTRACK_AMANDA is not set
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_H323=m
+CONFIG_NF_CONNTRACK_IRC=m
+# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
+# CONFIG_NF_CONNTRACK_SNMP is not set
+# CONFIG_NF_CONNTRACK_PPTP is not set
+# CONFIG_NF_CONNTRACK_SANE is not set
+CONFIG_NF_CONNTRACK_SIP=m
+# CONFIG_NF_CONNTRACK_TFTP is not set
+# CONFIG_NF_CT_NETLINK is not set
+# CONFIG_NETFILTER_TPROXY is not set
+CONFIG_NETFILTER_XTABLES=m
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+# CONFIG_NETFILTER_XT_CONNMARK is not set
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set
+# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
+# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
+# CONFIG_NETFILTER_XT_TARGET_CT is not set
+# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+CONFIG_NETFILTER_XT_TARGET_HL=m
+# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
+# CONFIG_NETFILTER_XT_TARGET_LED is not set
+# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
+# CONFIG_NETFILTER_XT_MATCH_CPU is not set
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
+CONFIG_NETFILTER_XT_MATCH_HL=m
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_MAC is not set
+# CONFIG_NETFILTER_XT_MATCH_MARK is not set
+# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
+# CONFIG_NETFILTER_XT_MATCH_STATE is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_DEFRAG_IPV4=m
+CONFIG_NF_CONNTRACK_IPV4=m
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+# CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_TTL=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_TARGET_LOG=m
+CONFIG_IP_NF_TARGET_ULOG=m
+CONFIG_NF_NAT=m
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_NETMAP=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_NF_NAT_FTP=m
+CONFIG_NF_NAT_IRC=m
+# CONFIG_NF_NAT_TFTP is not set
+# CONFIG_NF_NAT_AMANDA is not set
+# CONFIG_NF_NAT_PPTP is not set
+CONFIG_NF_NAT_H323=m
+CONFIG_NF_NAT_SIP=m
+CONFIG_IP_NF_MANGLE=m
+# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_NF_RAW=m
+CONFIG_IP_NF_ARPTABLES=m
+CONFIG_IP_NF_ARPFILTER=m
+CONFIG_IP_NF_ARP_MANGLE=m
+
+#
+# IPv6: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV6 is not set
+# CONFIG_NF_CONNTRACK_IPV6 is not set
+# CONFIG_IP6_NF_QUEUE is not set
+# CONFIG_IP6_NF_IPTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
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
+# CONFIG_DCB is not set
+CONFIG_DNS_RESOLVER=y
+# CONFIG_BATMAN_ADV is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+CONFIG_IRDA=m
+
+#
+# IrDA protocols
+#
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
+# CONFIG_IRDA_ULTRA is not set
+
+#
+# IrDA options
+#
+# CONFIG_IRDA_CACHE_LAST_LSAP is not set
+# CONFIG_IRDA_FAST_RR is not set
+# CONFIG_IRDA_DEBUG is not set
+
+#
+# Infrared-port device drivers
+#
+
+#
+# SIR device drivers
+#
+# CONFIG_IRTTY_SIR is not set
+
+#
+# Dongle support
+#
+# CONFIG_KINGSUN_DONGLE is not set
+# CONFIG_KSDAZZLE_DONGLE is not set
+# CONFIG_KS959_DONGLE is not set
+
+#
+# FIR device drivers
+#
+# CONFIG_USB_IRDA is not set
+# CONFIG_SIGMATEL_FIR is not set
+CONFIG_PXA_FICP=m
+# CONFIG_MCS_FIR is not set
+CONFIG_BT=m
+CONFIG_BT_L2CAP=y
+CONFIG_BT_SCO=y
+CONFIG_BT_RFCOMM=m
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=m
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=m
+
+#
+# Bluetooth device drivers
+#
+CONFIG_BT_HCIBTUSB=m
+CONFIG_BT_HCIBTSDIO=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIBCM203X=m
+CONFIG_BT_HCIBPA10X=m
+CONFIG_BT_HCIBFUSB=m
+CONFIG_BT_HCIDTL1=m
+CONFIG_BT_HCIBT3C=m
+CONFIG_BT_HCIBLUECARD=m
+CONFIG_BT_HCIBTUART=m
+CONFIG_BT_HCIVHCI=m
+CONFIG_BT_MRVL=m
+CONFIG_BT_MRVL_SDIO=m
+CONFIG_BT_ATH3K=m
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_WEXT_SPY=y
+CONFIG_WEXT_PRIV=y
+CONFIG_CFG80211=m
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+# CONFIG_CFG80211_DEFAULT_PS is not set
+# CONFIG_CFG80211_DEBUGFS is not set
+# CONFIG_CFG80211_INTERNAL_REGDB is not set
+CONFIG_CFG80211_WEXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+CONFIG_LIB80211_CRYPT_WEP=m
+CONFIG_LIB80211_CRYPT_CCMP=m
+CONFIG_LIB80211_CRYPT_TKIP=m
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=m
+# CONFIG_MAC80211_RC_PID is not set
+# CONFIG_MAC80211_RC_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT=""
+
+#
+# Some wireless drivers require a rate control algorithm
+#
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUGFS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+CONFIG_RFKILL=m
+CONFIG_RFKILL_LEDS=y
+# CONFIG_RFKILL_INPUT is not set
+# CONFIG_RFKILL_GPIO is not set
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+# CONFIG_CEPH_LIB is not set
+# CONFIG_NFC is not set
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
+CONFIG_REGMAP=y
+CONFIG_REGMAP_I2C=m
+CONFIG_REGMAP_SPI=m
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_TESTS is not set
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
+# CONFIG_MTD_SWAP is not set
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
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_ECC_BCH is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_SHARPSL is not set
+CONFIG_MTD_NAND_TMIO=y
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_RESERVE=1
+CONFIG_MTD_UBI_GLUEBI=m
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_BLK_DEV_RBD is not set
+# CONFIG_SENSORS_LIS3LV02D is not set
+CONFIG_MISC_DEVICES=y
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
+# CONFIG_BMP085 is not set
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
+# CONFIG_IWMC3200TOP is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_TI_ST is not set
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
+CONFIG_BLK_DEV_SR=m
+# CONFIG_BLK_DEV_SR_VENDOR is not set
+CONFIG_CHR_DEV_SG=m
+# CONFIG_CHR_DEV_SCH is not set
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
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
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+CONFIG_ATA_VERBOSE_ERROR=y
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
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+# CONFIG_BONDING is not set
+# CONFIG_DUMMY is not set
+# CONFIG_EQUALIZER is not set
+CONFIG_MII=m
+# CONFIG_MACVLAN is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+CONFIG_TUN=m
+# CONFIG_VETH is not set
+# CONFIG_ARCNET is not set
+
+#
+# CAIF transport drivers
+#
+CONFIG_ETHERNET=y
+CONFIG_NET_VENDOR_3COM=y
+# CONFIG_PCMCIA_3C574 is not set
+# CONFIG_PCMCIA_3C589 is not set
+CONFIG_NET_VENDOR_AMD=y
+# CONFIG_PCMCIA_NMCLAN is not set
+CONFIG_NET_VENDOR_BROADCOM=y
+# CONFIG_B44 is not set
+CONFIG_NET_VENDOR_CHELSIO=y
+# CONFIG_DM9000 is not set
+# CONFIG_DNET is not set
+CONFIG_NET_VENDOR_FARADAY=y
+# CONFIG_FTMAC100 is not set
+# CONFIG_FTGMAC100 is not set
+CONFIG_NET_VENDOR_FUJITSU=y
+# CONFIG_PCMCIA_FMVJ18X is not set
+CONFIG_NET_VENDOR_INTEL=y
+CONFIG_NET_VENDOR_I825XX=y
+CONFIG_NET_VENDOR_MARVELL=y
+CONFIG_NET_VENDOR_MICREL=y
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_NET_VENDOR_MICROCHIP=y
+# CONFIG_ENC28J60 is not set
+CONFIG_NET_VENDOR_NATSEMI=y
+CONFIG_NET_VENDOR_8390=y
+# CONFIG_PCMCIA_AXNET is not set
+# CONFIG_AX88796 is not set
+CONFIG_PCMCIA_PCNET=m
+# CONFIG_ETHOC is not set
+CONFIG_NET_VENDOR_SEEQ=y
+# CONFIG_SEEQ8005 is not set
+CONFIG_NET_VENDOR_SMSC=y
+# CONFIG_SMC91X is not set
+# CONFIG_PCMCIA_SMC91C92 is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+CONFIG_NET_VENDOR_STMICRO=y
+# CONFIG_STMMAC_ETH is not set
+CONFIG_NET_VENDOR_XIRCOM=y
+# CONFIG_PCMCIA_XIRC2PS is not set
+# CONFIG_PHYLIB is not set
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+# CONFIG_PPP_FILTER is not set
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPPOE is not set
+CONFIG_PPP_ASYNC=m
+# CONFIG_PPP_SYNC_TTY is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=m
+# CONFIG_TR is not set
+
+#
+# USB Network Adapters
+#
+CONFIG_USB_CATC=m
+CONFIG_USB_KAWETH=m
+CONFIG_USB_PEGASUS=m
+CONFIG_USB_RTL8150=m
+CONFIG_USB_USBNET=m
+CONFIG_USB_NET_AX8817X=m
+CONFIG_USB_NET_CDCETHER=m
+# CONFIG_USB_NET_CDC_EEM is not set
+CONFIG_USB_NET_CDC_NCM=m
+CONFIG_USB_NET_DM9601=m
+# CONFIG_USB_NET_SMSC75XX is not set
+# CONFIG_USB_NET_SMSC95XX is not set
+# CONFIG_USB_NET_GL620A is not set
+CONFIG_USB_NET_NET1080=m
+# CONFIG_USB_NET_PLUSB is not set
+# CONFIG_USB_NET_MCS7830 is not set
+# CONFIG_USB_NET_RNDIS_HOST is not set
+# CONFIG_USB_NET_CDC_SUBSET is not set
+CONFIG_USB_NET_ZAURUS=m
+# CONFIG_USB_NET_CX82310_ETH is not set
+# CONFIG_USB_NET_KALMIA is not set
+# CONFIG_USB_HSO is not set
+# CONFIG_USB_NET_INT51X1 is not set
+# CONFIG_USB_IPHETH is not set
+CONFIG_USB_SIERRA_NET=m
+# CONFIG_USB_VL600 is not set
+CONFIG_WLAN=y
+# CONFIG_PCMCIA_RAYCS is not set
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_ATMEL is not set
+# CONFIG_AT76C50X_USB is not set
+CONFIG_AIRO_CS=m
+# CONFIG_PCMCIA_WL3501 is not set
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_USB_NET_RNDIS_WLAN is not set
+# CONFIG_RTL8187 is not set
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_ATH_COMMON is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+# CONFIG_BRCMFMAC is not set
+CONFIG_HOSTAP=m
+CONFIG_HOSTAP_FIRMWARE=y
+# CONFIG_HOSTAP_FIRMWARE_NVRAM is not set
+CONFIG_HOSTAP_CS=m
+# CONFIG_IWM is not set
+# CONFIG_LIBERTAS is not set
+# CONFIG_HERMES is not set
+# CONFIG_P54_COMMON is not set
+# CONFIG_RT2X00 is not set
+# CONFIG_RTL8192CU is not set
+# CONFIG_WL1251 is not set
+# CONFIG_WL12XX_MENU is not set
+# CONFIG_ZD1211RW is not set
+# CONFIG_MWIFIEX is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+# CONFIG_WAN is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
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
+CONFIG_KEYBOARD_MATRIX=y
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
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
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_WM97XX is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
+CONFIG_INPUT_MISC=y
+# CONFIG_INPUT_AD714X is not set
+# CONFIG_INPUT_BMA150 is not set
+# CONFIG_INPUT_MMA8450 is not set
+# CONFIG_INPUT_MPU3050 is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_KXTJ9 is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_UINPUT=m
+# CONFIG_INPUT_PCF8574 is not set
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
+# CONFIG_INPUT_ADXL34X is not set
+# CONFIG_INPUT_CMA3000 is not set
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
+# CONFIG_N_GSM is not set
+# CONFIG_TRACE_SINK is not set
+CONFIG_DEVKMEM=y
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250_CS=m
+CONFIG_SERIAL_8250_NR_UARTS=4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=m
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+
+#
+# PCMCIA character devices
+#
+# CONFIG_SYNCLINK_CS is not set
+# CONFIG_CARDMAN_4000 is not set
+# CONFIG_CARDMAN_4040 is not set
+# CONFIG_IPWIRELESS is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_RAMOOPS is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
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
+# CONFIG_I2C_DIOLAN_U2C is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_STUB is not set
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
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
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
+
+#
+# Enable Device Drivers -> PPS to see the PTP clock options.
+#
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_IT8761E is not set
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
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+CONFIG_POWER_SUPPLY_DEBUG=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ20Z75 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_ISP1704 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_GPIO is not set
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
+# CONFIG_SENSORS_MAX6639 is not set
+# CONFIG_SENSORS_MAX6642 is not set
+# CONFIG_SENSORS_MAX6650 is not set
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
+# CONFIG_SENSORS_SCH5627 is not set
+# CONFIG_SENSORS_SCH5636 is not set
+# CONFIG_SENSORS_ADS1015 is not set
+# CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_ADS7871 is not set
+# CONFIG_SENSORS_AMC6821 is not set
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
+CONFIG_MFD_CORE=y
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+CONFIG_MFD_TMIO=y
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+CONFIG_MFD_TC6393XB=y
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_AAT2870_CORE is not set
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
+# CONFIG_FB_SMSCUFX is not set
+# CONFIG_FB_UDL is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_BROADSHEET is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_CORGI is not set
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
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
+
+#
+# Display device support
+#
+CONFIG_DISPLAY_SUPPORT=y
+
+#
+# Display hardware drivers
+#
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
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=m
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SOUND_OSS_CORE_PRECLAIM=y
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+CONFIG_SND_HWDEP=m
+CONFIG_SND_RAWMIDI=m
+CONFIG_SND_JACK=y
+CONFIG_SND_SEQUENCER=m
+# CONFIG_SND_SEQ_DUMMY is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_SEQUENCER_OSS is not set
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_VMASTER=y
+CONFIG_SND_RAWMIDI_SEQ=m
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+CONFIG_SND_AC97_CODEC=m
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_ALOOP is not set
+# CONFIG_SND_VIRMIDI is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+# CONFIG_SND_AC97_POWER_SAVE is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_PXA2XX_PCM=m
+CONFIG_SND_PXA2XX_LIB=m
+CONFIG_SND_PXA2XX_LIB_AC97=y
+CONFIG_SND_PXA2XX_AC97=m
+CONFIG_SND_SPI=y
+CONFIG_SND_USB=y
+CONFIG_SND_USB_AUDIO=m
+# CONFIG_SND_USB_UA101 is not set
+# CONFIG_SND_USB_CAIAQ is not set
+# CONFIG_SND_USB_6FIRE is not set
+CONFIG_SND_PCMCIA=y
+# CONFIG_SND_VXPOCKET is not set
+# CONFIG_SND_PDAUDIOCF is not set
+CONFIG_SND_SOC=m
+# CONFIG_SND_SOC_CACHE_LZO is not set
+CONFIG_SND_SOC_AC97_BUS=y
+CONFIG_SND_PXA2XX_SOC=m
+CONFIG_SND_PXA2XX_SOC_AC97=m
+CONFIG_SND_PXA2XX_SOC_TOSA=m
+CONFIG_SND_SOC_I2C_AND_SPI=m
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_WM9712=m
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=m
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=m
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=m
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# USB HID Boot Protocol drivers
+#
+CONFIG_USB_KBD=m
+CONFIG_USB_MOUSE=m
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_ACRUX is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_PRODIKEYS is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_DRAGONRISE is not set
+# CONFIG_HID_EMS_FF is not set
+# CONFIG_HID_ELECOM is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_HOLTEK is not set
+# CONFIG_HID_KEYTOUCH is not set
+# CONFIG_HID_KYE is not set
+# CONFIG_HID_UCLOGIC is not set
+# CONFIG_HID_WALTOP is not set
+# CONFIG_HID_GYRATION is not set
+# CONFIG_HID_TWINHAN is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LCPOWER is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MAGICMOUSE is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_MULTITOUCH is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_ORTEK is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_PICOLCD is not set
+# CONFIG_HID_PRIMAX is not set
+# CONFIG_HID_QUANTA is not set
+# CONFIG_HID_ROCCAT is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_SPEEDLINK is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_WACOM is not set
+# CONFIG_HID_WIIMOTE is not set
+# CONFIG_HID_ZEROPLUS is not set
+# CONFIG_HID_ZYDACRON is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=m
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+CONFIG_USB=m
+CONFIG_USB_DEBUG=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_SUSPEND is not set
+CONFIG_USB_OTG_WHITELIST=y
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_DWC3 is not set
+CONFIG_USB_MON=m
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
+# CONFIG_USB_OHCI_HCD is not set
+CONFIG_USB_SL811_HCD=m
+# CONFIG_USB_SL811_HCD_ISO is not set
+CONFIG_USB_SL811_CS=m
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_RENESAS_USBHS is not set
+
+#
+# USB Device Class drivers
+#
+CONFIG_USB_ACM=m
+CONFIG_USB_PRINTER=m
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
+CONFIG_USB_STORAGE=m
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_REALTEK is not set
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
+# CONFIG_USB_STORAGE_ENE_UB6250 is not set
+# CONFIG_USB_UAS is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+CONFIG_USB_MDC800=m
+CONFIG_USB_MICROTEK=m
+
+#
+# USB port drivers
+#
+CONFIG_USB_SERIAL=m
+CONFIG_USB_EZUSB=y
+CONFIG_USB_SERIAL_GENERIC=y
+# CONFIG_USB_SERIAL_AIRCABLE is not set
+# CONFIG_USB_SERIAL_ARK3116 is not set
+CONFIG_USB_SERIAL_BELKIN=m
+# CONFIG_USB_SERIAL_CH341 is not set
+# CONFIG_USB_SERIAL_WHITEHEAT is not set
+CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
+# CONFIG_USB_SERIAL_CP210X is not set
+CONFIG_USB_SERIAL_CYPRESS_M8=m
+CONFIG_USB_SERIAL_EMPEG=m
+CONFIG_USB_SERIAL_FTDI_SIO=m
+# CONFIG_USB_SERIAL_FUNSOFT is not set
+CONFIG_USB_SERIAL_VISOR=m
+CONFIG_USB_SERIAL_IPAQ=m
+CONFIG_USB_SERIAL_IR=m
+CONFIG_USB_SERIAL_EDGEPORT=m
+CONFIG_USB_SERIAL_EDGEPORT_TI=m
+CONFIG_USB_SERIAL_GARMIN=m
+CONFIG_USB_SERIAL_IPW=m
+# CONFIG_USB_SERIAL_IUU is not set
+CONFIG_USB_SERIAL_KEYSPAN_PDA=m
+CONFIG_USB_SERIAL_KEYSPAN=m
+# CONFIG_USB_SERIAL_KEYSPAN_MPR is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28 is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28X is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28XA is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28XB is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19 is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA18X is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19W is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19QW is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19QI is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA49W is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA49WLC is not set
+CONFIG_USB_SERIAL_KLSI=m
+CONFIG_USB_SERIAL_KOBIL_SCT=m
+CONFIG_USB_SERIAL_MCT_U232=m
+# CONFIG_USB_SERIAL_MOS7720 is not set
+# CONFIG_USB_SERIAL_MOS7840 is not set
+# CONFIG_USB_SERIAL_MOTOROLA is not set
+# CONFIG_USB_SERIAL_NAVMAN is not set
+CONFIG_USB_SERIAL_PL2303=m
+# CONFIG_USB_SERIAL_OTI6858 is not set
+# CONFIG_USB_SERIAL_QCAUX is not set
+# CONFIG_USB_SERIAL_QUALCOMM is not set
+# CONFIG_USB_SERIAL_SPCP8X5 is not set
+# CONFIG_USB_SERIAL_HP4X is not set
+CONFIG_USB_SERIAL_SAFE=m
+# CONFIG_USB_SERIAL_SAFE_PADDED is not set
+# CONFIG_USB_SERIAL_SIEMENS_MPI is not set
+# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
+# CONFIG_USB_SERIAL_SYMBOL is not set
+CONFIG_USB_SERIAL_TI=m
+CONFIG_USB_SERIAL_CYBERJACK=m
+CONFIG_USB_SERIAL_XIRCOM=m
+CONFIG_USB_SERIAL_WWAN=m
+# CONFIG_USB_SERIAL_OPTION is not set
+CONFIG_USB_SERIAL_OMNINET=m
+# CONFIG_USB_SERIAL_OPTICON is not set
+# CONFIG_USB_SERIAL_VIVOPAY_SERIAL is not set
+# CONFIG_USB_SERIAL_ZIO is not set
+# CONFIG_USB_SERIAL_SSU100 is not set
+# CONFIG_USB_SERIAL_DEBUG is not set
+
+#
+# USB Miscellaneous drivers
+#
+CONFIG_USB_EMI62=m
+CONFIG_USB_EMI26=m
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+CONFIG_USB_RIO500=m
+CONFIG_USB_LEGOTOWER=m
+CONFIG_USB_LCD=m
+CONFIG_USB_LED=m
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+CONFIG_USB_CYTHERM=m
+CONFIG_USB_IDMOUSE=m
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_YUREX is not set
+CONFIG_USB_GADGET=m
+# CONFIG_USB_GADGET_DEBUG is not set
+CONFIG_USB_GADGET_DEBUG_FILES=y
+CONFIG_USB_GADGET_DEBUG_FS=y
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+# CONFIG_USB_FUSB300 is not set
+CONFIG_USB_PXA25X=m
+# CONFIG_USB_PXA25X_SMALL is not set
+# CONFIG_USB_R8A66597 is not set
+# CONFIG_USB_M66592 is not set
+# CONFIG_USB_NET2272 is not set
+# CONFIG_USB_DUMMY_HCD is not set
+CONFIG_USB_ZERO=m
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+CONFIG_USB_ETH_EEM=y
+# CONFIG_USB_G_NCM is not set
+CONFIG_USB_GADGETFS=m
+# CONFIG_USB_FUNCTIONFS is not set
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+CONFIG_USB_CDC_COMPOSITE=m
+# CONFIG_USB_G_ACM_MS is not set
+CONFIG_USB_G_MULTI=m
+CONFIG_USB_G_MULTI_RNDIS=y
+CONFIG_USB_G_MULTI_CDC=y
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+CONFIG_USB_GPIO_VBUS=m
+CONFIG_USB_ULPI=y
+CONFIG_NOP_USB_XCEIV=m
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
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
+CONFIG_MMC_SPI=y
+# CONFIG_MMC_TMIO is not set
+# CONFIG_MMC_DW is not set
+# CONFIG_MMC_VUB300 is not set
+# CONFIG_MMC_USHC is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_LM3530 is not set
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
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
+# CONFIG_VIRTIO_BALLOON is not set
+# CONFIG_VIRTIO_MMIO is not set
+# CONFIG_STAGING is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_SUPPORT=y
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
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
+CONFIG_EXT4_FS_XATTR=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+CONFIG_JBD2=y
+# CONFIG_JBD2_DEBUG is not set
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+CONFIG_EXPORTFS=m
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+CONFIG_AUTOFS4_FS=y
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
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
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
+# CONFIG_UBIFS_FS_XATTR is not set
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_UBIFS_FS_DEBUG is not set
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=m
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+# CONFIG_NFS_USE_LEGACY_DNS is not set
+CONFIG_NFS_USE_KERNEL_DNS=y
+# CONFIG_NFS_USE_NEW_IDMAPPER is not set
+CONFIG_NFSD=m
+CONFIG_NFSD_V3=y
+# CONFIG_NFSD_V3_ACL is not set
+CONFIG_NFSD_V4=y
+CONFIG_LOCKD=m
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=m
+CONFIG_SUNRPC_GSS=m
+# CONFIG_CEPH_FS is not set
+CONFIG_CIFS=m
+# CONFIG_CIFS_STATS is not set
+# CONFIG_CIFS_WEAK_PW_HASH is not set
+# CONFIG_CIFS_UPCALL is not set
+# CONFIG_CIFS_XATTR is not set
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_DFS_UPCALL is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
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
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="cp437"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_737=m
+CONFIG_NLS_CODEPAGE_775=m
+CONFIG_NLS_CODEPAGE_850=m
+CONFIG_NLS_CODEPAGE_852=m
+CONFIG_NLS_CODEPAGE_855=m
+CONFIG_NLS_CODEPAGE_857=m
+CONFIG_NLS_CODEPAGE_860=m
+CONFIG_NLS_CODEPAGE_861=m
+CONFIG_NLS_CODEPAGE_862=m
+CONFIG_NLS_CODEPAGE_863=m
+CONFIG_NLS_CODEPAGE_864=m
+CONFIG_NLS_CODEPAGE_865=m
+CONFIG_NLS_CODEPAGE_866=m
+CONFIG_NLS_CODEPAGE_869=m
+CONFIG_NLS_CODEPAGE_936=m
+CONFIG_NLS_CODEPAGE_950=m
+CONFIG_NLS_CODEPAGE_932=m
+CONFIG_NLS_CODEPAGE_949=m
+CONFIG_NLS_CODEPAGE_874=m
+CONFIG_NLS_ISO8859_8=m
+CONFIG_NLS_CODEPAGE_1250=m
+CONFIG_NLS_CODEPAGE_1251=m
+CONFIG_NLS_ASCII=m
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_2=m
+CONFIG_NLS_ISO8859_3=m
+CONFIG_NLS_ISO8859_4=m
+CONFIG_NLS_ISO8859_5=m
+CONFIG_NLS_ISO8859_6=m
+CONFIG_NLS_ISO8859_7=m
+CONFIG_NLS_ISO8859_9=m
+CONFIG_NLS_ISO8859_13=m
+CONFIG_NLS_ISO8859_14=m
+CONFIG_NLS_ISO8859_15=m
+CONFIG_NLS_KOI8_R=m
+CONFIG_NLS_KOI8_U=m
+CONFIG_NLS_UTF8=y
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
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
+CONFIG_DEBUG_BUGVERBOSE=y
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_LKDTM is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_RING_BUFFER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_ENCRYPTED_KEYS is not set
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
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
+CONFIG_CRYPTO_AEAD=m
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=m
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=m
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG=m
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP2=y
+CONFIG_CRYPTO_MANAGER=m
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_USER is not set
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_GF128MUL is not set
+CONFIG_CRYPTO_NULL=m
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_AUTHENC=m
+CONFIG_CRYPTO_TEST=m
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
+CONFIG_CRYPTO_CBC=m
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=m
+# CONFIG_CRYPTO_LRW is not set
+CONFIG_CRYPTO_PCBC=m
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_HMAC=m
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=m
+# CONFIG_CRYPTO_GHASH is not set
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_MD5=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=m
+CONFIG_CRYPTO_SHA256=m
+CONFIG_CRYPTO_SHA512=m
+# CONFIG_CRYPTO_TGR192 is not set
+CONFIG_CRYPTO_WP512=m
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_BLOWFISH_COMMON=m
+CONFIG_CRYPTO_CAMELLIA=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_DES=m
+# CONFIG_CRYPTO_FCRYPT is not set
+CONFIG_CRYPTO_KHAZAD=m
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TEA=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_TWOFISH_COMMON=m
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
+CONFIG_CRYPTO_ANSI_CPRNG=m
+# CONFIG_CRYPTO_USER_API_HASH is not set
+# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC32=y
+CONFIG_CRC7=y
+CONFIG_LIBCRC32C=m
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_DECOMPRESS_LZO=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_AVERAGE=y
+# CONFIG_CORDIC is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny/tosa/tosa.scc b/recipes-kernel/linux/linux-yocto-tiny/tosa/tosa.scc
new file mode 100644
index 0000000..2197aa3
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny/tosa/tosa.scc
@@ -0,0 +1,7 @@
+kconf hardware tosa.cfg
+
+# non hardware
+#include cfg/devtmpfs.scc
+#include cfg/sound.scc
+#include cfg/usb-mass-storage.scc
+#include cfg/fs.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny_3.2.bbappend b/recipes-kernel/linux/linux-yocto-tiny_3.2.bbappend
new file mode 100644
index 0000000..48ebff4
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny_3.2.bbappend
@@ -0,0 +1,36 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/files:"
+
+PR = "${INC_PR}.1"
+COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
+
+KMACHINE_akita = "akita"
+KMACHINE_collie = "collie"
+KMACHINE_c7x0 = "c7x0"
+KMACHINE_poodle = "poodle"
+KMACHINE_tosa = "tosa"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+SRC_URI += "\
+           file://${KMACHINE}-${LINUX_KERNEL_TYPE}.scc \
+           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_poodle = " \
+                        file://locomo_kbd_tweak-r2.patch \
+                        "
+
+SRC_URI_append_collie = " \
+                        file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
+                        file://locomo_kbd_tweak-r2.patch \
+                        file://collie_remove_irq_to_gpio.patch \
+                        "
+
+
+do_configure_prepend() {
+
+    if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
+        install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm ${WORKDIR}/linux/drivers/video/logo/logo_linux_clut224.ppm
+    fi
+}
-- 
1.7.3.4



