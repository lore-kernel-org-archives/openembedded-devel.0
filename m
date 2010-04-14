Received: from dejongbeheer.nl ([80.101.185.65] helo=smtp.dejongbeheer.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <shakkesteegt+oe@gmail.com>) id 1O22gO-0001oQ-Vq
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 15:31:14 +0200
Received: from den.jmdejong.nl ([192.168.2.5])
	by smtp.dejongbeheer.nl with esmtp (Exim 4.63)
	(envelope-from <shakkesteegt+oe@gmail.com>)
	id 1O22cV-0005iS-6O; Wed, 14 Apr 2010 15:27:07 +0200
Received: from oe2.jmdejong.nl ([192.168.1.14] helo=localhost.localdomain)
	by den.jmdejong.nl with esmtp (Exim 4.69)
	(envelope-from <shakkesteegt+oe@gmail.com>)
	id 1O22cR-00081U-Rh; Wed, 14 Apr 2010 15:27:03 +0200
From: Siebren Hakkesteegt <shakkesteegt+oe@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Apr 2010 15:26:37 +0200
Message-Id: <1271251597-5851-2-git-send-email-shakkesteegt+oe@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1271251597-5851-1-git-send-email-shakkesteegt+oe@gmail.com>
References: <1271251597-5851-1-git-send-email-shakkesteegt+oe@gmail.com>
X-de-Jong-beheer-MailScanner-ID: 1O22cR-00081U-Rh
X-de-Jong-beheer-MailScanner: Found to be clean
X-de-Jong-beheer-MailScanner-From: shakkesteegt+oe@gmail.com
X-DJB2-MailScanner: Found to be clean
X-DJB2-MailScanner-SpamCheck: geen spam, SpamAssassin (not cached,
	score=-9.912, vereist 4, ALL_TRUSTED -8.00, BAYES_00 -2.60,
	SPF_NEUTRAL 0.69, UPPERCASE_50_75 0.00)
X-DJB2-MailScanner-From: shakkesteegt+oe@gmail.com
X-SA-Exim-Connect-IP: 80.101.185.65
X-SA-Exim-Mail-From: shakkesteegt+oe@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] linux 2.6.31: add cm-x300 support
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
X-List-Received-Date: Wed, 14 Apr 2010 13:31:14 -0000

---
 recipes/linux/linux-2.6.31/cm-x300/defconfig       | 1737 +++++++++++++++
 .../cm-x300/linux-2.6.31-cm-x300.patch             | 2267 ++++++++++++++++++++
 recipes/linux/linux_2.6.31.bb                      |    5 +
 3 files changed, 4009 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.31/cm-x300/defconfig
 create mode 100644 recipes/linux/linux-2.6.31/cm-x300/linux-2.6.31-cm-x300.patch

diff --git a/recipes/linux/linux-2.6.31/cm-x300/defconfig b/recipes/linux/linux-2.6.31/cm-x300/defconfig
new file mode 100644
index 0000000..7614a63
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/cm-x300/defconfig
@@ -0,0 +1,1737 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.31.12
+# Tue Apr 13 10:26:42 2010
+#
+CONFIG_ARM=y
+CONFIG_HAVE_PWM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_MMU=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_CONSTRUCTORS=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_CLASSIC_RCU=y
+# CONFIG_TREE_RCU is not set
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_PREEMPT_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=18
+CONFIG_GROUP_SCHED=y
+CONFIG_FAIR_GROUP_SCHED=y
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=y
+# CONFIG_CGROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
+# CONFIG_RELAY is not set
+CONFIG_NAMESPACES=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EMBEDDED=y
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
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
+
+#
+# Performance Counters
+#
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_SLUB_DEBUG=y
+# CONFIG_STRIP_ASM_SYMS is not set
+CONFIG_COMPAT_BRK=y
+# CONFIG_SLAB is not set
+CONFIG_SLUB=y
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_CLK=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+# CONFIG_SLOW_WORK is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+CONFIG_LBDAF=y
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_AS=y
+CONFIG_IOSCHED_DEADLINE=y
+CONFIG_IOSCHED_CFQ=y
+# CONFIG_DEFAULT_AS is not set
+# CONFIG_DEFAULT_DEADLINE is not set
+CONFIG_DEFAULT_CFQ=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="cfq"
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
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
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_PNX4008 is not set
+CONFIG_ARCH_PXA=y
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+
+#
+# Intel PXA2xx/PXA3xx Implementations
+#
+
+#
+# Supported PXA3xx Processor Variants
+#
+CONFIG_CPU_PXA300=y
+CONFIG_CPU_PXA310=y
+# CONFIG_CPU_PXA320 is not set
+# CONFIG_CPU_PXA930 is not set
+# CONFIG_CPU_PXA935 is not set
+# CONFIG_ARCH_GUMSTIX is not set
+# CONFIG_MACH_INTELMOTE2 is not set
+# CONFIG_MACH_STARGATE2 is not set
+# CONFIG_ARCH_LUBBOCK is not set
+# CONFIG_MACH_LOGICPD_PXA270 is not set
+# CONFIG_MACH_MAINSTONE is not set
+# CONFIG_MACH_MP900C is not set
+# CONFIG_ARCH_PXA_IDP is not set
+# CONFIG_PXA_SHARPSL is not set
+# CONFIG_ARCH_VIPER is not set
+# CONFIG_ARCH_PXA_ESERIES is not set
+# CONFIG_TRIZEPS_PXA is not set
+# CONFIG_MACH_H5000 is not set
+# CONFIG_MACH_EM_X270 is not set
+# CONFIG_MACH_EXEDA is not set
+# CONFIG_MACH_COLIBRI is not set
+# CONFIG_MACH_COLIBRI300 is not set
+# CONFIG_MACH_COLIBRI320 is not set
+# CONFIG_MACH_ZYLONITE is not set
+# CONFIG_MACH_LITTLETON is not set
+# CONFIG_MACH_TAVOREVB is not set
+# CONFIG_MACH_SAAR is not set
+# CONFIG_MACH_ARMCORE is not set
+CONFIG_MACH_CM_X300=y
+# CONFIG_MACH_H4700 is not set
+# CONFIG_MACH_MAGICIAN is not set
+# CONFIG_MACH_HIMALAYA is not set
+# CONFIG_MACH_MIOA701 is not set
+# CONFIG_MACH_PCM027 is not set
+# CONFIG_ARCH_PXA_PALM is not set
+# CONFIG_MACH_CSB726 is not set
+# CONFIG_PXA_EZX is not set
+CONFIG_PXA3xx=y
+CONFIG_PLAT_PXA=y
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=y
+CONFIG_CPU_XSC3=y
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5T=y
+CONFIG_CPU_PABRT_NOIFAR=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+CONFIG_IO_36=y
+
+#
+# Processor Features
+#
+# CONFIG_ARM_THUMB is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+CONFIG_OUTER_CACHE=y
+CONFIG_CACHE_XSC3L2=y
+CONFIG_IWMMXT=y
+CONFIG_COMMON_CLKDEV=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HIGHMEM=y
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4096
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_BOUNCE=y
+CONFIG_VIRT_TO_BUS=y
+CONFIG_HAVE_MLOCK=y
+CONFIG_HAVE_MLOCKED_PAGE_BIT=y
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="ubi.mtd=5 root=ubi0:cm-x300-rootfs rootfstype=ubifs console=ttyS2,38400"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Power Management
+#
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_TABLE=y
+# CONFIG_CPU_FREQ_DEBUG is not set
+CONFIG_CPU_FREQ_STAT=y
+# CONFIG_CPU_FREQ_STAT_DETAILS is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
+# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
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
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=y
+CONFIG_PM_DEBUG=y
+CONFIG_PM_VERBOSE=y
+CONFIG_CAN_PM_TRACE=y
+CONFIG_PM_SLEEP=y
+CONFIG_SUSPEND=y
+# CONFIG_PM_TEST_SUSPEND is not set
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_APM_EMULATION=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=y
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
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
+# CONFIG_DCB is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+CONFIG_BT=m
+CONFIG_BT_L2CAP=m
+CONFIG_BT_SCO=m
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
+# CONFIG_BT_HCIBTSDIO is not set
+# CONFIG_BT_HCIUART is not set
+# CONFIG_BT_HCIBCM203X is not set
+# CONFIG_BT_HCIBPA10X is not set
+# CONFIG_BT_HCIBFUSB is not set
+# CONFIG_BT_HCIVHCI is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+# CONFIG_CFG80211 is not set
+# CONFIG_WIRELESS_OLD_REGULATORY is not set
+CONFIG_WIRELESS_EXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+# CONFIG_LIB80211_DEBUG is not set
+
+#
+# CFG80211 needs to be enabled for MAC80211
+#
+CONFIG_MAC80211_DEFAULT_PS_VALUE=0
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
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_REDBOOT_PARTS is not set
+# CONFIG_MTD_CMDLINE_PARTS is not set
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
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_H1900 is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_SHARPSL is not set
+CONFIG_MTD_NAND_PXA3xx=y
+# CONFIG_MTD_NAND_PXA3xx_BUILTIN is not set
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
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_RESERVE=1
+CONFIG_MTD_UBI_GLUEBI=m
+
+#
+# UBI debugging options
+#
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=16
+CONFIG_BLK_DEV_RAM_SIZE=4096
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_MISC_DEVICES is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
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
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=y
+CONFIG_MII=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+CONFIG_DM9000=y
+CONFIG_DM9000_DEBUGLEVEL=0
+CONFIG_DM9000_FORCE_SIMPLE_PHY_POLL=y
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
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+CONFIG_WLAN_80211=y
+CONFIG_LIBERTAS=m
+# CONFIG_LIBERTAS_USB is not set
+CONFIG_LIBERTAS_SDIO=m
+# CONFIG_LIBERTAS_SPI is not set
+# CONFIG_LIBERTAS_DEBUG is not set
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_HOSTAP is not set
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
+CONFIG_USB_USBNET=m
+CONFIG_USB_NET_AX8817X=m
+# CONFIG_USB_NET_CDCETHER is not set
+# CONFIG_USB_NET_CDC_EEM is not set
+# CONFIG_USB_NET_DM9601 is not set
+# CONFIG_USB_NET_SMSC95XX is not set
+# CONFIG_USB_NET_GL620A is not set
+# CONFIG_USB_NET_NET1080 is not set
+# CONFIG_USB_NET_PLUSB is not set
+# CONFIG_USB_NET_MCS7830 is not set
+# CONFIG_USB_NET_RNDIS_HOST is not set
+# CONFIG_USB_NET_CDC_SUBSET is not set
+# CONFIG_USB_NET_ZAURUS is not set
+# CONFIG_USB_NET_INT51X1 is not set
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
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+# CONFIG_INPUT_APMPOWER is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_GPIO is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+CONFIG_KEYBOARD_PXA27x=m
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
+# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_DA9034 is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+CONFIG_TOUCHSCREEN_WM97XX=m
+# CONFIG_TOUCHSCREEN_WM9705 is not set
+CONFIG_TOUCHSCREEN_WM9712=y
+# CONFIG_TOUCHSCREEN_WM9713 is not set
+# CONFIG_TOUCHSCREEN_WM97XX_MAINSTONE is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
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
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_DEVKMEM=y
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
+# CONFIG_SERIAL_MAX3100 is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_DESIGNWARE is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+CONFIG_I2C_PXA=y
+# CONFIG_I2C_PXA_SLAVE is not set
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
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+CONFIG_SPI_BITBANG=y
+CONFIG_SPI_GPIO=y
+# CONFIG_SPI_PXA2XX is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO expanders:
+#
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX732X is not set
+CONFIG_GPIO_PCA953X=y
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
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+CONFIG_APM_POWER=y
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+CONFIG_BATTERY_DA9030=y
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
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
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+CONFIG_PMIC_DA903X=y
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_AB3100_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
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
+# CONFIG_FB_MBX is not set
+# CONFIG_FB_W100 is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_ILI9320 is not set
+CONFIG_LCD_TDO24M=y
+# CONFIG_LCD_VGG2432A4 is not set
+# CONFIG_LCD_PLATFORM is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=m
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_BACKLIGHT_PWM=m
+# CONFIG_BACKLIGHT_DA903X is not set
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
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
+CONFIG_FONTS=y
+# CONFIG_FONT_8x8 is not set
+# CONFIG_FONT_8x16 is not set
+CONFIG_FONT_6x11=y
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+# CONFIG_LOGO is not set
+CONFIG_SOUND=m
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+CONFIG_SND_JACK=y
+# CONFIG_SND_SEQUENCER is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_PCM_OSS_PLUGINS=y
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
+# CONFIG_SND_DRIVERS is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_PXA2XX_LIB=m
+CONFIG_SND_PXA2XX_LIB_AC97=y
+# CONFIG_SND_PXA2XX_AC97 is not set
+# CONFIG_SND_SPI is not set
+# CONFIG_SND_USB is not set
+CONFIG_SND_SOC=m
+CONFIG_SND_SOC_AC97_BUS=y
+CONFIG_SND_PXA2XX_SOC=m
+CONFIG_SND_PXA2XX_SOC_AC97=m
+CONFIG_SND_PXA2XX_SOC_EM_X270=m
+CONFIG_SND_SOC_I2C_AND_SPI=m
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_WM9712=m
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=m
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+CONFIG_HID_DEBUG=y
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=y
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# Special HID drivers
+#
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
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_WACOM is not set
+# CONFIG_HID_ZEROPLUS is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+# CONFIG_USB_DEVICE_CLASS is not set
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_SUSPEND is not set
+# CONFIG_USB_OTG is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+CONFIG_USB_MON=y
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
+CONFIG_USB_OHCI_HCD=y
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=y
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
+CONFIG_USB_STORAGE=y
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
+CONFIG_MMC=m
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=m
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+CONFIG_MMC_PXA=m
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_GPIO_PLATFORM=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DA903X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_PWM is not set
+# CONFIG_LEDS_BD2802 is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=y
+# CONFIG_LEDS_TRIGGER_TIMER is not set
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
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
+# CONFIG_RTC_DRV_BQ4802 is not set
+CONFIG_RTC_DRV_V3020=y
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_SA1100=y
+# CONFIG_RTC_DRV_PXA is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_DEBUG is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_REGULATOR_MAX1586 is not set
+CONFIG_REGULATOR_DA903X=y
+# CONFIG_REGULATOR_LP3971 is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
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
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+CONFIG_FS_POSIX_ACL=y
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
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
+CONFIG_MSDOS_FS=m
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
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+CONFIG_UBIFS_FS=y
+# CONFIG_UBIFS_FS_XATTR is not set
+# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_UBIFS_FS_DEBUG is not set
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
+# CONFIG_NILFS2_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_ACL_SUPPORT=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+CONFIG_SUNRPC_GSS=y
+CONFIG_RPCSEC_GSS_KRB5=y
+# CONFIG_RPCSEC_GSS_SPKM3 is not set
+CONFIG_SMB_FS=m
+# CONFIG_SMB_NLS_DEFAULT is not set
+CONFIG_CIFS=m
+# CONFIG_CIFS_STATS is not set
+CONFIG_CIFS_WEAK_PW_HASH=y
+# CONFIG_CIFS_XATTR is not set
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_EXPERIMENTAL is not set
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
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
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
+CONFIG_NLS_ISO8859_1=y
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
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_DETECT_SOFTLOCKUP is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_SLUB_DEBUG_ON is not set
+# CONFIG_SLUB_STATS is not set
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_HIGHMEM is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+# CONFIG_PAGE_POISONING is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+# CONFIG_BOOT_TRACER is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_KMEMTRACE is not set
+# CONFIG_WORKQUEUE_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_KMEMCHECK is not set
+CONFIG_ARM_UNWIND=y
+CONFIG_DEBUG_USER=y
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+CONFIG_DEBUG_LL=y
+# CONFIG_DEBUG_ICEDCC is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_FIPS is not set
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_WORKQUEUE=y
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
+CONFIG_CRYPTO_CBC=y
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=m
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
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_MICHAEL_MIC=m
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
+CONFIG_CRYPTO_AES=m
+# CONFIG_CRYPTO_ANUBIS is not set
+CONFIG_CRYPTO_ARC4=m
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+CONFIG_CRYPTO_DES=y
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
+CONFIG_GENERIC_FIND_LAST_BIT=y
+# CONFIG_CRC_CCITT is not set
+CONFIG_CRC16=y
+CONFIG_CRC_T10DIF=y
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/recipes/linux/linux-2.6.31/cm-x300/linux-2.6.31-cm-x300.patch b/recipes/linux/linux-2.6.31/cm-x300/linux-2.6.31-cm-x300.patch
new file mode 100644
index 0000000..4149d94
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/cm-x300/linux-2.6.31-cm-x300.patch
@@ -0,0 +1,2267 @@
+ arch/arm/configs/cm_x300_defconfig        |  344 ++++++++++++++++++----------
+ arch/arm/mach-pxa/Kconfig                 |    2 +
+ arch/arm/mach-pxa/Makefile                |    2 +-
+ arch/arm/mach-pxa/cm-x300-ulpi.c          |  307 +++++++++++++++++++++++++
+ arch/arm/mach-pxa/cm-x300.c               |  358 ++++++++++++++++++++++++++---
+ arch/arm/mach-pxa/include/mach/regs-u2d.h |  199 ++++++++++++++++
+ arch/arm/mach-pxa/pxa3xx.c                |   67 ++++++-
+ arch/arm/mach-pxa/sleep.S                 |    5 +
+ drivers/power/da9030_battery.c            |   95 ++++++++
+ sound/soc/pxa/Kconfig                     |    3 +-
+ sound/soc/pxa/em-x270.c                   |   10 +-
+ 11 files changed, 1231 insertions(+), 161 deletions(-)
+
+diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
+index d18d21b..6f15256 100644
+--- a/arch/arm/configs/cm_x300_defconfig
++++ b/arch/arm/configs/cm_x300_defconfig
+@@ -1,15 +1,15 @@
+ #
+ # Automatically generated make config: don't edit
+-# Linux kernel version: 2.6.30-rc8
+-# Thu Jun  4 09:53:21 2009
++# Linux kernel version: 2.6.31
++# Sun Nov 22 13:04:56 2009
+ #
+ CONFIG_ARM=y
++CONFIG_HAVE_PWM=y
+ CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+ CONFIG_GENERIC_GPIO=y
+ CONFIG_GENERIC_TIME=y
+ CONFIG_GENERIC_CLOCKEVENTS=y
+ CONFIG_MMU=y
+-# CONFIG_NO_IOPORT is not set
+ CONFIG_GENERIC_HARDIRQS=y
+ CONFIG_STACKTRACE_SUPPORT=y
+ CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+@@ -18,14 +18,13 @@ CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+ CONFIG_HARDIRQS_SW_RESEND=y
+ CONFIG_GENERIC_IRQ_PROBE=y
+ CONFIG_RWSEM_GENERIC_SPINLOCK=y
+-# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+-# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+ CONFIG_GENERIC_HWEIGHT=y
+ CONFIG_GENERIC_CALIBRATE_DELAY=y
+ CONFIG_ARCH_MTD_XIP=y
+ CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+ CONFIG_VECTORS_BASE=0xffff0000
+ CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
++CONFIG_CONSTRUCTORS=y
+ 
+ #
+ # General setup
+@@ -72,18 +71,17 @@ CONFIG_NAMESPACES=y
+ CONFIG_BLK_DEV_INITRD=y
+ CONFIG_INITRAMFS_SOURCE=""
+ CONFIG_RD_GZIP=y
+-CONFIG_RD_BZIP2=y
+-CONFIG_RD_LZMA=y
++# CONFIG_RD_BZIP2 is not set
++# CONFIG_RD_LZMA is not set
+ # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+ CONFIG_SYSCTL=y
+ CONFIG_ANON_INODES=y
+-# CONFIG_EMBEDDED is not set
++CONFIG_EMBEDDED=y
+ CONFIG_UID16=y
+ CONFIG_SYSCTL_SYSCALL=y
+ CONFIG_KALLSYMS=y
+ # CONFIG_KALLSYMS_ALL is not set
+ # CONFIG_KALLSYMS_EXTRA_PASS is not set
+-# CONFIG_STRIP_ASM_SYMS is not set
+ CONFIG_HOTPLUG=y
+ CONFIG_PRINTK=y
+ CONFIG_BUG=y
+@@ -96,8 +94,13 @@ CONFIG_TIMERFD=y
+ CONFIG_EVENTFD=y
+ CONFIG_SHMEM=y
+ CONFIG_AIO=y
++
++#
++# Performance Counters
++#
+ CONFIG_VM_EVENT_COUNTERS=y
+ CONFIG_SLUB_DEBUG=y
++# CONFIG_STRIP_ASM_SYMS is not set
+ CONFIG_COMPAT_BRK=y
+ # CONFIG_SLAB is not set
+ CONFIG_SLUB=y
+@@ -109,6 +112,11 @@ CONFIG_HAVE_OPROFILE=y
+ CONFIG_HAVE_KPROBES=y
+ CONFIG_HAVE_KRETPROBES=y
+ CONFIG_HAVE_CLK=y
++
++#
++# GCOV-based kernel profiling
++#
++# CONFIG_GCOV_KERNEL is not set
+ # CONFIG_SLOW_WORK is not set
+ CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+ CONFIG_SLABINFO=y
+@@ -117,11 +125,11 @@ CONFIG_BASE_SMALL=0
+ CONFIG_MODULES=y
+ # CONFIG_MODULE_FORCE_LOAD is not set
+ CONFIG_MODULE_UNLOAD=y
+-# CONFIG_MODULE_FORCE_UNLOAD is not set
++CONFIG_MODULE_FORCE_UNLOAD=y
+ # CONFIG_MODVERSIONS is not set
+ # CONFIG_MODULE_SRCVERSION_ALL is not set
+ CONFIG_BLOCK=y
+-# CONFIG_LBD is not set
++CONFIG_LBDAF=y
+ # CONFIG_BLK_DEV_BSG is not set
+ # CONFIG_BLK_DEV_INTEGRITY is not set
+ 
+@@ -148,13 +156,14 @@ CONFIG_FREEZER=y
+ # CONFIG_ARCH_VERSATILE is not set
+ # CONFIG_ARCH_AT91 is not set
+ # CONFIG_ARCH_CLPS711X is not set
++# CONFIG_ARCH_GEMINI is not set
+ # CONFIG_ARCH_EBSA110 is not set
+ # CONFIG_ARCH_EP93XX is not set
+-# CONFIG_ARCH_GEMINI is not set
+ # CONFIG_ARCH_FOOTBRIDGE is not set
++# CONFIG_ARCH_MXC is not set
++# CONFIG_ARCH_STMP3XXX is not set
+ # CONFIG_ARCH_NETX is not set
+ # CONFIG_ARCH_H720X is not set
+-# CONFIG_ARCH_IMX is not set
+ # CONFIG_ARCH_IOP13XX is not set
+ # CONFIG_ARCH_IOP32X is not set
+ # CONFIG_ARCH_IOP33X is not set
+@@ -163,25 +172,25 @@ CONFIG_FREEZER=y
+ # CONFIG_ARCH_IXP4XX is not set
+ # CONFIG_ARCH_L7200 is not set
+ # CONFIG_ARCH_KIRKWOOD is not set
+-# CONFIG_ARCH_KS8695 is not set
+-# CONFIG_ARCH_NS9XXX is not set
+ # CONFIG_ARCH_LOKI is not set
+ # CONFIG_ARCH_MV78XX0 is not set
+-# CONFIG_ARCH_MXC is not set
+ # CONFIG_ARCH_ORION5X is not set
++# CONFIG_ARCH_MMP is not set
++# CONFIG_ARCH_KS8695 is not set
++# CONFIG_ARCH_NS9XXX is not set
++# CONFIG_ARCH_W90X900 is not set
+ # CONFIG_ARCH_PNX4008 is not set
+ CONFIG_ARCH_PXA=y
+-# CONFIG_ARCH_MMP is not set
++# CONFIG_ARCH_MSM is not set
+ # CONFIG_ARCH_RPC is not set
+ # CONFIG_ARCH_SA1100 is not set
+ # CONFIG_ARCH_S3C2410 is not set
+ # CONFIG_ARCH_S3C64XX is not set
+ # CONFIG_ARCH_SHARK is not set
+ # CONFIG_ARCH_LH7A40X is not set
++# CONFIG_ARCH_U300 is not set
+ # CONFIG_ARCH_DAVINCI is not set
+ # CONFIG_ARCH_OMAP is not set
+-# CONFIG_ARCH_MSM is not set
+-# CONFIG_ARCH_W90X900 is not set
+ 
+ #
+ # Intel PXA2xx/PXA3xx Implementations
+@@ -191,12 +200,13 @@ CONFIG_ARCH_PXA=y
+ # Supported PXA3xx Processor Variants
+ #
+ CONFIG_CPU_PXA300=y
+-# CONFIG_CPU_PXA310 is not set
++CONFIG_CPU_PXA310=y
+ # CONFIG_CPU_PXA320 is not set
+ # CONFIG_CPU_PXA930 is not set
+ # CONFIG_CPU_PXA935 is not set
+ # CONFIG_ARCH_GUMSTIX is not set
+ # CONFIG_MACH_INTELMOTE2 is not set
++# CONFIG_MACH_STARGATE2 is not set
+ # CONFIG_ARCH_LUBBOCK is not set
+ # CONFIG_MACH_LOGICPD_PXA270 is not set
+ # CONFIG_MACH_MAINSTONE is not set
+@@ -218,6 +228,7 @@ CONFIG_CPU_PXA300=y
+ # CONFIG_MACH_SAAR is not set
+ # CONFIG_MACH_ARMCORE is not set
+ CONFIG_MACH_CM_X300=y
++# CONFIG_MACH_H4700 is not set
+ # CONFIG_MACH_MAGICIAN is not set
+ # CONFIG_MACH_HIMALAYA is not set
+ # CONFIG_MACH_MIOA701 is not set
+@@ -226,7 +237,6 @@ CONFIG_MACH_CM_X300=y
+ # CONFIG_MACH_CSB726 is not set
+ # CONFIG_PXA_EZX is not set
+ CONFIG_PXA3xx=y
+-# CONFIG_PXA_PWM is not set
+ CONFIG_PLAT_PXA=y
+ 
+ #
+@@ -276,7 +286,6 @@ CONFIG_PAGE_OFFSET=0xC0000000
+ CONFIG_HZ=100
+ CONFIG_AEABI=y
+ CONFIG_OABI_COMPAT=y
+-# CONFIG_ARCH_HAS_HOLES_MEMORYMODEL is not set
+ # CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+ # CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+ CONFIG_HIGHMEM=y
+@@ -292,17 +301,18 @@ CONFIG_SPLIT_PTLOCK_CPUS=4096
+ CONFIG_ZONE_DMA_FLAG=0
+ CONFIG_BOUNCE=y
+ CONFIG_VIRT_TO_BUS=y
+-CONFIG_UNEVICTABLE_LRU=y
+ CONFIG_HAVE_MLOCK=y
+ CONFIG_HAVE_MLOCKED_PAGE_BIT=y
++CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+ CONFIG_ALIGNMENT_TRAP=y
++# CONFIG_UACCESS_WITH_MEMCPY is not set
+ 
+ #
+ # Boot options
+ #
+ CONFIG_ZBOOT_ROM_TEXT=0x0
+ CONFIG_ZBOOT_ROM_BSS=0x0
+-CONFIG_CMDLINE="root=/dev/mtdblock5 rootfstype=jffs2 console=ttyS2,38400"
++CONFIG_CMDLINE="ubi.mtd=fs,2048 root=ubi0:rootfs rootfstype=ubifs console=ttyS2,38400"
+ # CONFIG_XIP_KERNEL is not set
+ # CONFIG_KEXEC is not set
+ 
+@@ -350,9 +360,12 @@ CONFIG_HAVE_AOUT=y
+ # Power management options
+ #
+ CONFIG_PM=y
+-# CONFIG_PM_DEBUG is not set
++CONFIG_PM_DEBUG=y
++CONFIG_PM_VERBOSE=y
++CONFIG_CAN_PM_TRACE=y
+ CONFIG_PM_SLEEP=y
+ CONFIG_SUSPEND=y
++# CONFIG_PM_TEST_SUSPEND is not set
+ CONFIG_SUSPEND_FREEZER=y
+ CONFIG_APM_EMULATION=y
+ CONFIG_ARCH_SUSPEND_POSSIBLE=y
+@@ -410,6 +423,7 @@ CONFIG_DEFAULT_TCP_CONG="cubic"
+ # CONFIG_ECONET is not set
+ # CONFIG_WAN_ROUTER is not set
+ # CONFIG_PHONET is not set
++# CONFIG_IEEE802154 is not set
+ # CONFIG_NET_SCHED is not set
+ # CONFIG_DCB is not set
+ 
+@@ -433,7 +447,7 @@ CONFIG_BT_HIDP=m
+ #
+ # Bluetooth device drivers
+ #
+-# CONFIG_BT_HCIBTUSB is not set
++CONFIG_BT_HCIBTUSB=m
+ # CONFIG_BT_HCIBTSDIO is not set
+ # CONFIG_BT_HCIUART is not set
+ # CONFIG_BT_HCIBCM203X is not set
+@@ -448,7 +462,11 @@ CONFIG_WIRELESS_EXT=y
+ CONFIG_WIRELESS_EXT_SYSFS=y
+ CONFIG_LIB80211=m
+ # CONFIG_LIB80211_DEBUG is not set
+-# CONFIG_MAC80211 is not set
++
++#
++# CFG80211 needs to be enabled for MAC80211
++#
++CONFIG_MAC80211_DEFAULT_PS_VALUE=0
+ # CONFIG_WIMAX is not set
+ # CONFIG_RFKILL is not set
+ # CONFIG_NET_9P is not set
+@@ -521,6 +539,8 @@ CONFIG_MTD_CFI_I2=y
+ #
+ # Self-contained MTD device drivers
+ #
++# CONFIG_MTD_DATAFLASH is not set
++# CONFIG_MTD_M25P80 is not set
+ # CONFIG_MTD_SLRAM is not set
+ # CONFIG_MTD_PHRAM is not set
+ # CONFIG_MTD_MTDRAM is not set
+@@ -556,7 +576,15 @@ CONFIG_MTD_NAND_PXA3xx=y
+ #
+ # UBI - Unsorted block images
+ #
+-# CONFIG_MTD_UBI is not set
++CONFIG_MTD_UBI=y
++CONFIG_MTD_UBI_WL_THRESHOLD=4096
++CONFIG_MTD_UBI_BEB_RESERVE=1
++CONFIG_MTD_UBI_GLUEBI=y
++
++#
++# UBI debugging options
++#
++# CONFIG_MTD_UBI_DEBUG is not set
+ # CONFIG_PARPORT is not set
+ CONFIG_BLK_DEV=y
+ # CONFIG_BLK_DEV_COW_COMMON is not set
+@@ -570,6 +598,7 @@ CONFIG_BLK_DEV_RAM_SIZE=4096
+ # CONFIG_BLK_DEV_XIP is not set
+ # CONFIG_CDROM_PKTCDVD is not set
+ # CONFIG_ATA_OVER_ETH is not set
++# CONFIG_MG_DISK is not set
+ # CONFIG_MISC_DEVICES is not set
+ CONFIG_HAVE_IDE=y
+ # CONFIG_IDE is not set
+@@ -593,10 +622,6 @@ CONFIG_BLK_DEV_SD=y
+ # CONFIG_BLK_DEV_SR is not set
+ # CONFIG_CHR_DEV_SG is not set
+ # CONFIG_CHR_DEV_SCH is not set
+-
+-#
+-# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
+-#
+ # CONFIG_SCSI_MULTI_LUN is not set
+ # CONFIG_SCSI_CONSTANTS is not set
+ # CONFIG_SCSI_LOGGING is not set
+@@ -621,7 +646,6 @@ CONFIG_SCSI_LOWLEVEL=y
+ # CONFIG_ATA is not set
+ # CONFIG_MD is not set
+ CONFIG_NETDEVICES=y
+-CONFIG_COMPAT_NET_DEV_OPS=y
+ # CONFIG_DUMMY is not set
+ # CONFIG_BONDING is not set
+ # CONFIG_MACVLAN is not set
+@@ -636,6 +660,7 @@ CONFIG_MII=y
+ CONFIG_DM9000=y
+ CONFIG_DM9000_DEBUGLEVEL=0
+ CONFIG_DM9000_FORCE_SIMPLE_PHY_POLL=y
++# CONFIG_ENC28J60 is not set
+ # CONFIG_ETHOC is not set
+ # CONFIG_SMC911X is not set
+ # CONFIG_SMSC911X is not set
+@@ -648,6 +673,8 @@ CONFIG_DM9000_FORCE_SIMPLE_PHY_POLL=y
+ # CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+ # CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+ # CONFIG_B44 is not set
++# CONFIG_KS8842 is not set
++# CONFIG_KS8851 is not set
+ # CONFIG_NETDEV_1000 is not set
+ # CONFIG_NETDEV_10000 is not set
+ 
+@@ -659,9 +686,9 @@ CONFIG_WLAN_80211=y
+ CONFIG_LIBERTAS=m
+ # CONFIG_LIBERTAS_USB is not set
+ CONFIG_LIBERTAS_SDIO=m
++# CONFIG_LIBERTAS_SPI is not set
+ # CONFIG_LIBERTAS_DEBUG is not set
+ # CONFIG_USB_ZD1201 is not set
+-# CONFIG_USB_NET_RNDIS_WLAN is not set
+ # CONFIG_HOSTAP is not set
+ 
+ #
+@@ -701,25 +728,33 @@ CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+ # CONFIG_INPUT_JOYDEV is not set
+ CONFIG_INPUT_EVDEV=y
+ # CONFIG_INPUT_EVBUG is not set
++# CONFIG_INPUT_APMPOWER is not set
+ 
+ #
+ # Input Device Drivers
+ #
+ CONFIG_INPUT_KEYBOARD=y
+ # CONFIG_KEYBOARD_ATKBD is not set
+-# CONFIG_KEYBOARD_SUNKBD is not set
+ # CONFIG_KEYBOARD_LKKBD is not set
+-# CONFIG_KEYBOARD_XTKBD is not set
++# CONFIG_KEYBOARD_GPIO is not set
++# CONFIG_KEYBOARD_MATRIX is not set
++# CONFIG_KEYBOARD_LM8323 is not set
+ # CONFIG_KEYBOARD_NEWTON is not set
+-# CONFIG_KEYBOARD_STOWAWAY is not set
+ CONFIG_KEYBOARD_PXA27x=m
+-# CONFIG_KEYBOARD_GPIO is not set
++# CONFIG_KEYBOARD_STOWAWAY is not set
++# CONFIG_KEYBOARD_SUNKBD is not set
++# CONFIG_KEYBOARD_XTKBD is not set
+ # CONFIG_INPUT_MOUSE is not set
+ # CONFIG_INPUT_JOYSTICK is not set
+ # CONFIG_INPUT_TABLET is not set
+ CONFIG_INPUT_TOUCHSCREEN=y
++# CONFIG_TOUCHSCREEN_ADS7846 is not set
++# CONFIG_TOUCHSCREEN_AD7877 is not set
+ # CONFIG_TOUCHSCREEN_AD7879_I2C is not set
++# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
+ # CONFIG_TOUCHSCREEN_AD7879 is not set
++# CONFIG_TOUCHSCREEN_DA9034 is not set
++# CONFIG_TOUCHSCREEN_EETI is not set
+ # CONFIG_TOUCHSCREEN_FUJITSU is not set
+ # CONFIG_TOUCHSCREEN_GUNZE is not set
+ # CONFIG_TOUCHSCREEN_ELO is not set
+@@ -730,9 +765,15 @@ CONFIG_INPUT_TOUCHSCREEN=y
+ # CONFIG_TOUCHSCREEN_PENMOUNT is not set
+ # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+ # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
++CONFIG_TOUCHSCREEN_WM97XX=m
++# CONFIG_TOUCHSCREEN_WM9705 is not set
++CONFIG_TOUCHSCREEN_WM9712=y
++# CONFIG_TOUCHSCREEN_WM9713 is not set
++# CONFIG_TOUCHSCREEN_WM97XX_MAINSTONE is not set
+ # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+ # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+ # CONFIG_TOUCHSCREEN_TSC2007 is not set
++# CONFIG_TOUCHSCREEN_W90X900 is not set
+ # CONFIG_INPUT_MISC is not set
+ 
+ #
+@@ -760,6 +801,7 @@ CONFIG_DEVKMEM=y
+ #
+ # Non-8250 serial port support
+ #
++# CONFIG_SERIAL_MAX3100 is not set
+ CONFIG_SERIAL_PXA=y
+ CONFIG_SERIAL_PXA_CONSOLE=y
+ CONFIG_SERIAL_CORE=y
+@@ -784,6 +826,7 @@ CONFIG_I2C_HELPER_AUTO=y
+ #
+ # I2C system bus drivers (mostly embedded / system-on-chip)
+ #
++# CONFIG_I2C_DESIGNWARE is not set
+ # CONFIG_I2C_GPIO is not set
+ # CONFIG_I2C_OCORES is not set
+ CONFIG_I2C_PXA=y
+@@ -809,17 +852,31 @@ CONFIG_I2C_PXA=y
+ # CONFIG_DS1682 is not set
+ # CONFIG_SENSORS_PCF8574 is not set
+ # CONFIG_PCF8575 is not set
+-# CONFIG_SENSORS_MAX6875 is not set
+ # CONFIG_SENSORS_TSL2550 is not set
+ # CONFIG_I2C_DEBUG_CORE is not set
+ # CONFIG_I2C_DEBUG_ALGO is not set
+ # CONFIG_I2C_DEBUG_BUS is not set
+ # CONFIG_I2C_DEBUG_CHIP is not set
+-# CONFIG_SPI is not set
++CONFIG_SPI=y
++# CONFIG_SPI_DEBUG is not set
++CONFIG_SPI_MASTER=y
++
++#
++# SPI Master Controller Drivers
++#
++CONFIG_SPI_BITBANG=y
++CONFIG_SPI_GPIO=y
++# CONFIG_SPI_PXA2XX is not set
++
++#
++# SPI Protocol Masters
++#
++# CONFIG_SPI_SPIDEV is not set
++# CONFIG_SPI_TLE62X0 is not set
+ CONFIG_ARCH_REQUIRE_GPIOLIB=y
+ CONFIG_GPIOLIB=y
+ # CONFIG_DEBUG_GPIO is not set
+-# CONFIG_GPIO_SYSFS is not set
++CONFIG_GPIO_SYSFS=y
+ 
+ #
+ # Memory mapped GPIO expanders:
+@@ -839,8 +896,18 @@ CONFIG_GPIO_PCA953X=y
+ #
+ # SPI GPIO expanders:
+ #
++# CONFIG_GPIO_MAX7301 is not set
++# CONFIG_GPIO_MCP23S08 is not set
+ # CONFIG_W1 is not set
+-# CONFIG_POWER_SUPPLY is not set
++CONFIG_POWER_SUPPLY=y
++# CONFIG_POWER_SUPPLY_DEBUG is not set
++# CONFIG_PDA_POWER is not set
++CONFIG_APM_POWER=y
++# CONFIG_BATTERY_DS2760 is not set
++# CONFIG_BATTERY_DS2782 is not set
++# CONFIG_BATTERY_BQ27x00 is not set
++CONFIG_BATTERY_DA9030=y
++# CONFIG_BATTERY_MAX17040 is not set
+ # CONFIG_HWMON is not set
+ # CONFIG_THERMAL is not set
+ # CONFIG_THERMAL_HWMON is not set
+@@ -860,32 +927,20 @@ CONFIG_SSB_POSSIBLE=y
+ # CONFIG_MFD_ASIC3 is not set
+ # CONFIG_HTC_EGPIO is not set
+ # CONFIG_HTC_PASIC3 is not set
++# CONFIG_UCB1400_CORE is not set
+ # CONFIG_TPS65010 is not set
+ # CONFIG_TWL4030_CORE is not set
+ # CONFIG_MFD_TMIO is not set
+ # CONFIG_MFD_T7L66XB is not set
+ # CONFIG_MFD_TC6387XB is not set
+ # CONFIG_MFD_TC6393XB is not set
+-# CONFIG_PMIC_DA903X is not set
++CONFIG_PMIC_DA903X=y
+ # CONFIG_MFD_WM8400 is not set
+ # CONFIG_MFD_WM8350_I2C is not set
+ # CONFIG_MFD_PCF50633 is not set
+-
+-#
+-# Multimedia devices
+-#
+-
+-#
+-# Multimedia core support
+-#
+-# CONFIG_VIDEO_DEV is not set
+-# CONFIG_DVB_CORE is not set
+-# CONFIG_VIDEO_MEDIA is not set
+-
+-#
+-# Multimedia drivers
+-#
+-# CONFIG_DAB is not set
++# CONFIG_AB3100_CORE is not set
++# CONFIG_EZX_PCAP is not set
++# CONFIG_MEDIA_SUPPORT is not set
+ 
+ #
+ # Graphics support
+@@ -925,7 +980,17 @@ CONFIG_FB_PXA=y
+ # CONFIG_FB_METRONOME is not set
+ # CONFIG_FB_MB862XX is not set
+ # CONFIG_FB_BROADSHEET is not set
+-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
++CONFIG_BACKLIGHT_LCD_SUPPORT=y
++CONFIG_LCD_CLASS_DEVICE=y
++# CONFIG_LCD_LTV350QV is not set
++# CONFIG_LCD_ILI9320 is not set
++CONFIG_LCD_TDO24M=y
++# CONFIG_LCD_VGG2432A4 is not set
++# CONFIG_LCD_PLATFORM is not set
++CONFIG_BACKLIGHT_CLASS_DEVICE=m
++# CONFIG_BACKLIGHT_GENERIC is not set
++CONFIG_BACKLIGHT_PWM=m
++# CONFIG_BACKLIGHT_DA903X is not set
+ 
+ #
+ # Display device support
+@@ -956,35 +1021,45 @@ CONFIG_LOGO_LINUX_MONO=y
+ CONFIG_LOGO_LINUX_VGA16=y
+ CONFIG_LOGO_LINUX_CLUT224=y
+ CONFIG_SOUND=m
+-# CONFIG_SOUND_OSS_CORE is not set
++CONFIG_SOUND_OSS_CORE=y
+ CONFIG_SND=m
+ CONFIG_SND_TIMER=m
+ CONFIG_SND_PCM=m
+ CONFIG_SND_JACK=y
+ # CONFIG_SND_SEQUENCER is not set
+-# CONFIG_SND_MIXER_OSS is not set
+-# CONFIG_SND_PCM_OSS is not set
++CONFIG_SND_OSSEMUL=y
++CONFIG_SND_MIXER_OSS=m
++CONFIG_SND_PCM_OSS=m
++CONFIG_SND_PCM_OSS_PLUGINS=y
+ # CONFIG_SND_DYNAMIC_MINORS is not set
+ CONFIG_SND_SUPPORT_OLD_API=y
+ CONFIG_SND_VERBOSE_PROCFS=y
+ # CONFIG_SND_VERBOSE_PRINTK is not set
+ # CONFIG_SND_DEBUG is not set
+-CONFIG_SND_DRIVERS=y
+-# CONFIG_SND_DUMMY is not set
+-# CONFIG_SND_MTPAV is not set
+-# CONFIG_SND_SERIAL_U16550 is not set
+-# CONFIG_SND_MPU401 is not set
++CONFIG_SND_VMASTER=y
++# CONFIG_SND_RAWMIDI_SEQ is not set
++# CONFIG_SND_OPL3_LIB_SEQ is not set
++# CONFIG_SND_OPL4_LIB_SEQ is not set
++# CONFIG_SND_SBAWE_SEQ is not set
++# CONFIG_SND_EMU10K1_SEQ is not set
++CONFIG_SND_AC97_CODEC=m
++# CONFIG_SND_DRIVERS is not set
+ CONFIG_SND_ARM=y
+ CONFIG_SND_PXA2XX_LIB=m
++CONFIG_SND_PXA2XX_LIB_AC97=y
+ # CONFIG_SND_PXA2XX_AC97 is not set
+-CONFIG_SND_USB=y
+-# CONFIG_SND_USB_AUDIO is not set
+-# CONFIG_SND_USB_CAIAQ is not set
++# CONFIG_SND_SPI is not set
++# CONFIG_SND_USB is not set
+ CONFIG_SND_SOC=m
++CONFIG_SND_SOC_AC97_BUS=y
+ CONFIG_SND_PXA2XX_SOC=m
++CONFIG_SND_PXA2XX_SOC_AC97=m
++CONFIG_SND_PXA2XX_SOC_EM_X270=m
+ CONFIG_SND_SOC_I2C_AND_SPI=m
+ # CONFIG_SND_SOC_ALL_CODECS is not set
++CONFIG_SND_SOC_WM9712=m
+ # CONFIG_SOUND_PRIME is not set
++CONFIG_AC97_BUS=m
+ CONFIG_HID_SUPPORT=y
+ CONFIG_HID=y
+ CONFIG_HID_DEBUG=y
+@@ -1000,33 +1075,32 @@ CONFIG_USB_HID=y
+ #
+ # Special HID drivers
+ #
+-CONFIG_HID_A4TECH=y
+-CONFIG_HID_APPLE=y
+-CONFIG_HID_BELKIN=y
+-CONFIG_HID_CHERRY=y
+-CONFIG_HID_CHICONY=y
+-CONFIG_HID_CYPRESS=y
+-# CONFIG_DRAGONRISE_FF is not set
+-CONFIG_HID_EZKEY=y
+-CONFIG_HID_KYE=y
+-CONFIG_HID_GYRATION=y
+-CONFIG_HID_KENSINGTON=y
+-CONFIG_HID_LOGITECH=y
+-# CONFIG_LOGITECH_FF is not set
+-# CONFIG_LOGIRUMBLEPAD2_FF is not set
+-CONFIG_HID_MICROSOFT=y
+-CONFIG_HID_MONTEREY=y
+-CONFIG_HID_NTRIG=y
+-CONFIG_HID_PANTHERLORD=y
+-# CONFIG_PANTHERLORD_FF is not set
+-CONFIG_HID_PETALYNX=y
+-CONFIG_HID_SAMSUNG=y
+-CONFIG_HID_SONY=y
+-CONFIG_HID_SUNPLUS=y
+-# CONFIG_GREENASIA_FF is not set
+-CONFIG_HID_TOPSEED=y
+-# CONFIG_THRUSTMASTER_FF is not set
+-# CONFIG_ZEROPLUS_FF is not set
++# CONFIG_HID_A4TECH is not set
++# CONFIG_HID_APPLE is not set
++# CONFIG_HID_BELKIN is not set
++# CONFIG_HID_CHERRY is not set
++# CONFIG_HID_CHICONY is not set
++# CONFIG_HID_CYPRESS is not set
++# CONFIG_HID_DRAGONRISE is not set
++# CONFIG_HID_EZKEY is not set
++# CONFIG_HID_KYE is not set
++# CONFIG_HID_GYRATION is not set
++# CONFIG_HID_KENSINGTON is not set
++# CONFIG_HID_LOGITECH is not set
++# CONFIG_HID_MICROSOFT is not set
++# CONFIG_HID_MONTEREY is not set
++# CONFIG_HID_NTRIG is not set
++# CONFIG_HID_PANTHERLORD is not set
++# CONFIG_HID_PETALYNX is not set
++# CONFIG_HID_SAMSUNG is not set
++# CONFIG_HID_SONY is not set
++# CONFIG_HID_SUNPLUS is not set
++# CONFIG_HID_GREENASIA is not set
++# CONFIG_HID_SMARTJOYPLUS is not set
++# CONFIG_HID_TOPSEED is not set
++# CONFIG_HID_THRUSTMASTER is not set
++# CONFIG_HID_WACOM is not set
++# CONFIG_HID_ZEROPLUS is not set
+ CONFIG_USB_SUPPORT=y
+ CONFIG_USB_ARCH_HAS_HCD=y
+ CONFIG_USB_ARCH_HAS_OHCI=y
+@@ -1043,6 +1117,8 @@ CONFIG_USB_DEVICEFS=y
+ # CONFIG_USB_DYNAMIC_MINORS is not set
+ # CONFIG_USB_SUSPEND is not set
+ # CONFIG_USB_OTG is not set
++# CONFIG_USB_OTG_WHITELIST is not set
++# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+ CONFIG_USB_MON=y
+ # CONFIG_USB_WUSB is not set
+ # CONFIG_USB_WUSB_CBAF is not set
+@@ -1162,8 +1238,11 @@ CONFIG_LEDS_CLASS=y
+ # CONFIG_LEDS_PCA9532 is not set
+ CONFIG_LEDS_GPIO=y
+ CONFIG_LEDS_GPIO_PLATFORM=y
+-# CONFIG_LEDS_LP5521 is not set
++# CONFIG_LEDS_LP3944 is not set
+ # CONFIG_LEDS_PCA955X is not set
++# CONFIG_LEDS_DA903X is not set
++# CONFIG_LEDS_DAC124S085 is not set
++# CONFIG_LEDS_PWM is not set
+ # CONFIG_LEDS_BD2802 is not set
+ 
+ #
+@@ -1210,10 +1289,18 @@ CONFIG_RTC_INTF_DEV=y
+ # CONFIG_RTC_DRV_S35390A is not set
+ # CONFIG_RTC_DRV_FM3130 is not set
+ # CONFIG_RTC_DRV_RX8581 is not set
++# CONFIG_RTC_DRV_RX8025 is not set
+ 
+ #
+ # SPI RTC drivers
+ #
++# CONFIG_RTC_DRV_M41T94 is not set
++# CONFIG_RTC_DRV_DS1305 is not set
++# CONFIG_RTC_DRV_DS1390 is not set
++# CONFIG_RTC_DRV_MAX6902 is not set
++# CONFIG_RTC_DRV_R9701 is not set
++# CONFIG_RTC_DRV_RS5C348 is not set
++# CONFIG_RTC_DRV_DS3234 is not set
+ 
+ #
+ # Platform RTC drivers
+@@ -1237,7 +1324,15 @@ CONFIG_RTC_DRV_SA1100=y
+ # CONFIG_RTC_DRV_PXA is not set
+ # CONFIG_DMADEVICES is not set
+ # CONFIG_AUXDISPLAY is not set
+-# CONFIG_REGULATOR is not set
++CONFIG_REGULATOR=y
++# CONFIG_REGULATOR_DEBUG is not set
++# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
++# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
++# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
++# CONFIG_REGULATOR_BQ24022 is not set
++# CONFIG_REGULATOR_MAX1586 is not set
++CONFIG_REGULATOR_DA903X=y
++# CONFIG_REGULATOR_LP3971 is not set
+ # CONFIG_UIO is not set
+ # CONFIG_STAGING is not set
+ 
+@@ -1256,10 +1351,12 @@ CONFIG_JBD=y
+ # CONFIG_REISERFS_FS is not set
+ # CONFIG_JFS_FS is not set
+ CONFIG_FS_POSIX_ACL=y
+-CONFIG_FILE_LOCKING=y
+ # CONFIG_XFS_FS is not set
++# CONFIG_GFS2_FS is not set
+ # CONFIG_OCFS2_FS is not set
+ # CONFIG_BTRFS_FS is not set
++CONFIG_FILE_LOCKING=y
++CONFIG_FSNOTIFY=y
+ CONFIG_DNOTIFY=y
+ CONFIG_INOTIFY=y
+ CONFIG_INOTIFY_USER=y
+@@ -1282,9 +1379,9 @@ CONFIG_INOTIFY_USER=y
+ #
+ # DOS/FAT/NT Filesystems
+ #
+-CONFIG_FAT_FS=m
++CONFIG_FAT_FS=y
+ CONFIG_MSDOS_FS=m
+-CONFIG_VFAT_FS=m
++CONFIG_VFAT_FS=y
+ CONFIG_FAT_DEFAULT_CODEPAGE=437
+ CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+ # CONFIG_NTFS_FS is not set
+@@ -1319,6 +1416,12 @@ CONFIG_JFFS2_ZLIB=y
+ # CONFIG_JFFS2_LZO is not set
+ CONFIG_JFFS2_RTIME=y
+ # CONFIG_JFFS2_RUBIN is not set
++CONFIG_UBIFS_FS=y
++# CONFIG_UBIFS_FS_XATTR is not set
++# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
++CONFIG_UBIFS_FS_LZO=y
++CONFIG_UBIFS_FS_ZLIB=y
++# CONFIG_UBIFS_FS_DEBUG is not set
+ # CONFIG_CRAMFS is not set
+ # CONFIG_SQUASHFS is not set
+ # CONFIG_VXFS_FS is not set
+@@ -1335,6 +1438,7 @@ CONFIG_NFS_FS=y
+ CONFIG_NFS_V3=y
+ CONFIG_NFS_V3_ACL=y
+ CONFIG_NFS_V4=y
++# CONFIG_NFS_V4_1 is not set
+ CONFIG_ROOT_NFS=y
+ # CONFIG_NFSD is not set
+ CONFIG_LOCKD=y
+@@ -1378,9 +1482,9 @@ CONFIG_MSDOS_PARTITION=y
+ # CONFIG_KARMA_PARTITION is not set
+ # CONFIG_EFI_PARTITION is not set
+ # CONFIG_SYSV68_PARTITION is not set
+-CONFIG_NLS=m
++CONFIG_NLS=y
+ CONFIG_NLS_DEFAULT="iso8859-1"
+-CONFIG_NLS_CODEPAGE_437=m
++CONFIG_NLS_CODEPAGE_437=y
+ # CONFIG_NLS_CODEPAGE_737 is not set
+ # CONFIG_NLS_CODEPAGE_775 is not set
+ # CONFIG_NLS_CODEPAGE_850 is not set
+@@ -1404,7 +1508,7 @@ CONFIG_NLS_CODEPAGE_437=m
+ # CONFIG_NLS_CODEPAGE_1250 is not set
+ # CONFIG_NLS_CODEPAGE_1251 is not set
+ # CONFIG_NLS_ASCII is not set
+-CONFIG_NLS_ISO8859_1=m
++CONFIG_NLS_ISO8859_1=y
+ # CONFIG_NLS_ISO8859_2 is not set
+ # CONFIG_NLS_ISO8859_3 is not set
+ # CONFIG_NLS_ISO8859_4 is not set
+@@ -1441,6 +1545,7 @@ CONFIG_DEBUG_KERNEL=y
+ # CONFIG_DEBUG_OBJECTS is not set
+ # CONFIG_SLUB_DEBUG_ON is not set
+ # CONFIG_SLUB_STATS is not set
++# CONFIG_DEBUG_KMEMLEAK is not set
+ # CONFIG_DEBUG_RT_MUTEXES is not set
+ # CONFIG_RT_MUTEX_TESTER is not set
+ # CONFIG_DEBUG_SPINLOCK is not set
+@@ -1452,11 +1557,11 @@ CONFIG_DEBUG_KERNEL=y
+ # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+ # CONFIG_DEBUG_KOBJECT is not set
+ # CONFIG_DEBUG_HIGHMEM is not set
+-CONFIG_DEBUG_BUGVERBOSE=y
++# CONFIG_DEBUG_BUGVERBOSE is not set
+ # CONFIG_DEBUG_INFO is not set
+ # CONFIG_DEBUG_VM is not set
+ # CONFIG_DEBUG_WRITECOUNT is not set
+-CONFIG_DEBUG_MEMORY_INIT=y
++# CONFIG_DEBUG_MEMORY_INIT is not set
+ # CONFIG_DEBUG_LIST is not set
+ # CONFIG_DEBUG_SG is not set
+ # CONFIG_DEBUG_NOTIFIERS is not set
+@@ -1471,17 +1576,15 @@ CONFIG_SYSCTL_SYSCALL_CHECK=y
+ # CONFIG_PAGE_POISONING is not set
+ CONFIG_HAVE_FUNCTION_TRACER=y
+ CONFIG_TRACING_SUPPORT=y
+-
+-#
+-# Tracers
+-#
++CONFIG_FTRACE=y
+ # CONFIG_FUNCTION_TRACER is not set
+ # CONFIG_IRQSOFF_TRACER is not set
+ # CONFIG_SCHED_TRACER is not set
+-# CONFIG_CONTEXT_SWITCH_TRACER is not set
+-# CONFIG_EVENT_TRACER is not set
++# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+ # CONFIG_BOOT_TRACER is not set
+-# CONFIG_TRACE_BRANCH_PROFILING is not set
++CONFIG_BRANCH_PROFILE_NONE=y
++# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
++# CONFIG_PROFILE_ALL_BRANCHES is not set
+ # CONFIG_STACK_TRACER is not set
+ # CONFIG_KMEMTRACE is not set
+ # CONFIG_WORKQUEUE_TRACER is not set
+@@ -1490,6 +1593,7 @@ CONFIG_TRACING_SUPPORT=y
+ # CONFIG_SAMPLES is not set
+ CONFIG_HAVE_ARCH_KGDB=y
+ # CONFIG_KGDB is not set
++# CONFIG_KMEMCHECK is not set
+ CONFIG_ARM_UNWIND=y
+ CONFIG_DEBUG_USER=y
+ # CONFIG_DEBUG_ERRORS is not set
+@@ -1591,9 +1695,9 @@ CONFIG_CRYPTO_DES=y
+ #
+ # Compression
+ #
+-# CONFIG_CRYPTO_DEFLATE is not set
++CONFIG_CRYPTO_DEFLATE=y
+ # CONFIG_CRYPTO_ZLIB is not set
+-# CONFIG_CRYPTO_LZO is not set
++CONFIG_CRYPTO_LZO=y
+ 
+ #
+ # Random Number Generation
+@@ -1608,7 +1712,7 @@ CONFIG_CRYPTO_DES=y
+ CONFIG_BITREVERSE=y
+ CONFIG_GENERIC_FIND_LAST_BIT=y
+ # CONFIG_CRC_CCITT is not set
+-# CONFIG_CRC16 is not set
++CONFIG_CRC16=y
+ CONFIG_CRC_T10DIF=y
+ # CONFIG_CRC_ITU_T is not set
+ CONFIG_CRC32=y
+@@ -1616,9 +1720,9 @@ CONFIG_CRC32=y
+ # CONFIG_LIBCRC32C is not set
+ CONFIG_ZLIB_INFLATE=y
+ CONFIG_ZLIB_DEFLATE=y
++CONFIG_LZO_COMPRESS=y
++CONFIG_LZO_DECOMPRESS=y
+ CONFIG_DECOMPRESS_GZIP=y
+-CONFIG_DECOMPRESS_BZIP2=y
+-CONFIG_DECOMPRESS_LZMA=y
+ CONFIG_HAS_IOMEM=y
+ CONFIG_HAS_IOPORT=y
+ CONFIG_HAS_DMA=y
+diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
+index 89c992b..c2a0717 100644
+--- a/arch/arm/mach-pxa/Kconfig
++++ b/arch/arm/mach-pxa/Kconfig
+@@ -318,6 +318,8 @@ config MACH_CM_X300
+ 	bool "CompuLab CM-X300 modules"
+ 	select PXA3xx
+ 	select CPU_PXA300
++	select CPU_PXA310
++	select HAVE_PWM
+ 
+ config MACH_H4700
+ 	bool "HP iPAQ hx4700"
+diff --git a/arch/arm/mach-pxa/Makefile b/arch/arm/mach-pxa/Makefile
+index d4c6122..7f1b88e 100644
+--- a/arch/arm/mach-pxa/Makefile
++++ b/arch/arm/mach-pxa/Makefile
+@@ -75,7 +75,7 @@ obj-$(CONFIG_MACH_TAVOREVB)	+= tavorevb.o
+ obj-$(CONFIG_MACH_SAAR)		+= saar.o
+ 
+ obj-$(CONFIG_MACH_ARMCORE)      += cm-x2xx.o cm-x255.o cm-x270.o
+-obj-$(CONFIG_MACH_CM_X300)      += cm-x300.o
++obj-$(CONFIG_MACH_CM_X300)      += cm-x300.o cm-x300-ulpi.o
+ obj-$(CONFIG_PXA_EZX)           += ezx.o
+ 
+ obj-$(CONFIG_MACH_INTELMOTE2)   += imote2.o
+diff --git a/arch/arm/mach-pxa/cm-x300-ulpi.c b/arch/arm/mach-pxa/cm-x300-ulpi.c
+new file mode 100644
+index 0000000..ee02d50
+--- /dev/null
++++ b/arch/arm/mach-pxa/cm-x300-ulpi.c
+@@ -0,0 +1,307 @@
++/*
++ * linux/arch/arm/mach-pxa/cm-x300.c
++ *
++ * Support for the CompuLab CM-X300 modules
++ *
++ * Copyright (C) 2009 CompuLab Ltd.
++ *
++ * Igor Grinberg <grinberg@compulab.co.il>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/platform_device.h>
++#include <linux/errno.h>
++#include <linux/err.h>
++#include <linux/io.h>
++#include <linux/interrupt.h>
++#include <linux/irq.h>
++#include <linux/delay.h>
++#include <linux/gpio.h>
++#include <linux/init.h>
++#include <linux/clk.h>
++
++#include <asm/mach-types.h>
++#include <asm/mach/arch.h>
++
++#include <mach/pxa300.h>
++#include <mach/regs-u2d.h>
++
++/* OTG Interrupts */
++#define U2DOTGICR_MASK	0x37F7F
++
++/* PXA310 USB OTG Controller */
++#define ULPI_VENDOR_LOW			0x0
++#define ULPI_VENDOR_HIGH		0x1
++#define ULPI_PRODUCT_LOW		0x2
++#define ULPI_PRODUCT_HIGH		0x3
++#define ULPI_FUNCTION_CONTROL		0x4
++#define ULPI_FUNCTION_CONTROL_SET	0x5
++#define ULPI_FUNCTION_CONTROL_CLEAR	0x6
++#define ULPI_INTERFACE_CONTROL		0x7
++#define ULPI_INTERFACE_CONTROL_SET	0x8
++#define ULPI_INTERFACE_CONTROL_CLEAR	0x9
++#define ULPI_OTG_CONTROL		0xA
++#define ULPI_OTG_CONTROL_SET		0xB
++#define ULPI_OTG_CONTROL_CLEAR		0xC
++#define ULPI_INT_RISE			0xD
++#define ULPI_INT_RISE_SET		0xE
++#define ULPI_INT_RISE_CLEAR		0xF
++#define ULPI_INT_FALL			0x10
++#define ULPI_INT_FALL_SET		0x11
++#define ULPI_INT_FALL_CLEAR		0x12
++#define ULPI_INT_STATUS			0x13
++#define ULPI_INT_LATCH			0x14
++#define ULPI_DEBUG			0x15
++#define ULPI_SCRATCH			0x16
++#define ULPI_SCRATCH_SET		0x17
++#define ULPI_SCRATCH_CLEAR		0x18
++
++#define ULPI_FC_RESET		(1 << 5)	/* XCVR Reset */
++#define ULPI_FC_SUSPENDM	(1 << 6)	/* XCVR SuspendM, Low Power Mode */
++
++#define ULPI_IC_6PIN		(1 << 0)	/* XCVR 6 pin mode */
++#define ULPI_IC_3PIN		(1 << 1)	/* XCVR 3 pin mode */
++#define ULPI_IC_CARKIT		(1 << 2)	/* Carkit mode */
++#define ULPI_IC_CLKSUSPENDM	(1 << 3)	/* Active low clock suspend */
++
++#define ULPI_OC_IDPULLUP	(1 << 0)	/* ID Pull Up, enable sampling of ID line */
++#define ULPI_OC_DPPULLDOWN	(1 << 1)	/* Enable the 15K Ohm pull down resistor on D+ */
++#define ULPI_OC_DMPULLDOWN	(1 << 2)	/* Enable the 15K Ohm pull down resistor on D- */
++#define ULPI_OC_DISCHRGVBUS	(1 << 3)	/* Discharge Vbus */
++#define ULPI_OC_CHRGVBUS	(1 << 4)	/* Charge Vbus, for Vbus pulsing SRP */
++#define ULPI_OC_DRVVBUS		(1 << 5)	/* Drive 5V on Vbus */
++#define ULPI_OC_DRVVBUSEXT	(1 << 6)	/* Drive Vbus using external supply */
++
++#define ULPI_INT_HOSTDISCON	(1 << 0)	/* Host Disconnect */
++#define ULPI_INT_VBUSVALID	(1 << 1)	/* Vbus Valid */
++#define ULPI_INT_SESSIONVALID	(1 << 2)	/* Session Valid */
++#define ULPI_INT_SESSIONEND	(1 << 3)	/* Session End */
++#define ULPI_INT_IDGND		(1 << 4)	/* current status of IDGND */
++
++#define U2DOTGUCR_ADDR_S	(16)
++#define U2DOTGUCR_WDATA_S	(8)
++
++#define U2DOTGINT_DEFAULT	(U2DOTGINT_RID | U2DOTGINT_FID | U2DOTGINT_SI \
++				| U2DOTGINT_RVV | U2DOTGINT_FVV | U2DOTGINT_SF \
++				| U2DOTGINT_RSV)
++
++#define U2D_PHYS_BASE   0x54100000
++static void __iomem *u2d_mmio_base;
++
++enum u2d_phy_mode {
++	SYNCH = 0,
++	CARKIT = 0x1,
++	SER_3PIN = 0x2,
++	SER_6PIN = 0x4,
++	LOWPOWER = 0x8,
++	/* rtsm mode */
++	PRE_SYNCH = 0x10,
++};
++
++static inline unsigned int u2d_readl(unsigned int off)
++{
++	return __raw_readl(u2d_mmio_base + off);
++}
++
++static inline void u2d_writel(unsigned int off, unsigned int val)
++{
++	__raw_writel(val, u2d_mmio_base + off);
++}
++
++static inline enum u2d_phy_mode ulpi_get_phymode(void)
++{
++	return (u2d_readl(U2DOTGUSR) & 0xF0000000) >> 28;
++}
++
++static int ulpi_reg_read(u8 reg, u8 *value)
++{
++	int i = 50000;
++	enum u2d_phy_mode state = ulpi_get_phymode();
++
++	if ((state != SYNCH) && (state != PRE_SYNCH)) {
++		pr_err("%s: PHY is not in SYNCH mode!!!\n", __func__);
++		return -1;
++	}
++
++	u2d_writel(U2DOTGUCR,
++		   U2DOTGUCR_RUN | U2DOTGUCR_RNW | (reg << U2DOTGUCR_ADDR_S));
++	msleep(5);
++
++ 	while ((u2d_readl(U2DOTGUCR) & U2DOTGUCR_RUN) && i--);
++
++	if (i <= 0) {
++		printk(KERN_INFO "Read ULPI register Time out,"
++			" reg %x otgucr %x, usr %x ucr %x\n",
++			reg, u2d_readl(U2DOTGUCR), u2d_readl(U2DOTGUSR),
++			u2d_readl(U2DOTGCR));
++		return -1;
++	}
++
++	*value = (u8)(u2d_readl(U2DOTGUCR) & U2DOTGUCR_RDATA);
++
++	return 0;
++}
++
++static int ulpi_reg_write(u8 reg, u8 value)
++{
++	int i = 500000;
++	enum u2d_phy_mode state = ulpi_get_phymode();
++
++	if ((state != SYNCH) && (state != PRE_SYNCH)) {
++		pr_err("%s: PHY is not in SYNCH mode!!!\n", __func__);
++		return -1;
++	}
++
++	u2d_writel(U2DOTGUCR, U2DOTGUCR_RUN | (reg << U2DOTGUCR_ADDR_S)
++					    | (value << U2DOTGUCR_WDATA_S));
++	msleep(5);
++
++	while ((u2d_readl(U2DOTGUCR) & U2DOTGUCR_RUN) && i--);
++
++	if (i <= 0) {
++		printk(KERN_INFO "Write ULPI register Time out,"
++				" reg %x val %x\n", reg, (int)value);
++		return -1;
++	}
++
++	return 0;
++}
++
++static int cm_x300_ulpi_phy_reset(void)
++{
++	int err;
++
++	err = gpio_request(127, "ulpi reset");
++	if (err) {
++		pr_err("failed to request ULPI reset GPIO:%d\n", err);
++		return -EBUSY;
++	}
++	gpio_direction_output(127, 0);
++	msleep(10);
++	gpio_set_value(127, 1);
++	msleep(10);
++	gpio_free(127);
++
++	return 0;
++}
++
++/* Turn U2D clocks on and enable */
++static int cm_x300_u2d_clks_enable(void)
++{
++	int err = 0;
++	struct clk *u2d_clk;
++	struct clk *pout_clk;
++
++	u2d_clk = clk_get(NULL, "U2DCLK");
++	if (IS_ERR(u2d_clk)) {
++		err = PTR_ERR(u2d_clk);
++		pr_err("get_u2d_clk failed: %d\n", err);
++		return err;
++	}
++	clk_enable(u2d_clk);
++
++	pout_clk = clk_get(NULL, "CLK_POUT");
++	if (IS_ERR(pout_clk)) {
++		err = PTR_ERR(pout_clk);
++		pr_err("get_pout_clk failed: %d\n", err);
++		clk_disable(u2d_clk);
++		return err;
++	}
++	clk_enable(pout_clk);
++
++	return 0;
++}
++
++static void cm_x300_otg_init(void)
++{
++	u32 u2dreg;
++
++	/* setup OTG */
++	u2dreg = u2d_readl(U2DOTGCR);
++	u2dreg |= U2DOTGCR_ULAF | U2DOTGCR_UTMID;
++	u2dreg &= ~(U2DOTGCR_SMAF | U2DOTGCR_CKAF);
++	u2d_writel(U2DOTGCR, u2dreg);
++	msleep(5);
++	u2d_writel(U2DOTGCR, u2dreg | U2DOTGCR_ULE);
++	msleep(5);
++
++	/* according to pxa3xx manual vol. IV (p.145) */
++	/* here we need to enable OTG interrups, */
++	/* but we support only host mode, and will not switch to device mode */
++	/* so we disable the otg interrupts */
++	u2d_writel(U2DOTGICR, u2d_readl(U2DOTGICR) & ~U2DOTGICR_MASK);
++}
++
++static void cm_x300_ulpi_rtsm(void)
++{
++	u32 u2dreg;
++
++	/* put PHY to sync mode */
++	u2d_writel(U2DOTGCR, u2d_readl(U2DOTGCR) | U2DOTGCR_RTSM);
++	msleep(10);
++
++	/* setup OTG sync mode */
++	u2dreg = u2d_readl(U2DOTGCR) | U2DOTGCR_ULAF;
++	u2dreg &= ~(U2DOTGCR_SMAF | U2DOTGCR_CKAF);
++	u2d_writel(U2DOTGCR, u2dreg);
++}
++
++static void cm_x300_set_ulpi_serial6(void)
++{
++	u32 u2dreg;
++
++	/* enable the 15K Ohm pull-down resistor on D+ & D- and drive 5V */
++	ulpi_reg_write(ULPI_OTG_CONTROL_SET, ULPI_OC_DPPULLDOWN);
++	ulpi_reg_write(ULPI_OTG_CONTROL_SET, ULPI_OC_DMPULLDOWN);
++	ulpi_reg_write(ULPI_OTG_CONTROL_SET, ULPI_OC_DRVVBUS);
++
++	/* configure UHC for 6-pin serial mode */
++	u2d_writel(U2DP3CR, u2d_readl(U2DP3CR) & ~U2DP3CR_P2SS);
++
++	/* set PHY into host and serial mode */
++	ulpi_reg_write(ULPI_FUNCTION_CONTROL_SET, 0x45);
++	ulpi_reg_write(ULPI_INTERFACE_CONTROL, ULPI_IC_6PIN);
++
++	/* enable the serial mode */
++	u2dreg = u2d_readl(U2DOTGCR) | U2DOTGCR_SMAF;
++	u2d_writel(U2DOTGCR, u2dreg & ~(U2DOTGCR_ULAF | U2DOTGCR_CKAF));
++}
++
++int cm_x300_ulpi_init(void)
++{
++	int err;
++
++	err = cm_x300_u2d_clks_enable();
++	if (err)
++		return err;
++
++	u2d_mmio_base = ioremap(U2D_PHYS_BASE, 0x1300);
++	if (u2d_mmio_base == NULL) {
++		pr_info("%s: failed to remap U2D registers addr space\n",
++			__func__);
++		return -ENOMEM;
++	}
++
++	cm_x300_ulpi_phy_reset();
++	cm_x300_otg_init();
++	cm_x300_ulpi_rtsm();
++
++	/* disable USB2 Device (slave) controller */
++	u2d_writel(U2DCR, u2d_readl(U2DCR) & ~U2DCR_UDE);
++	u2d_writel(U2DOTGCR, u2d_readl(U2DOTGCR) | U2DOTGCR_UTMID);
++
++	/* according to pxa3xx manual vol. IV (p.145) */
++	/* here also we need to enable OTG interrups, */
++	/* but we support only host mode, and will not switch to device mode */
++	/* so we disable the otg interrupts */
++	u2d_writel(U2DOTGICR, u2d_readl(U2DOTGICR) & ~U2DOTGICR_MASK);
++
++	cm_x300_set_ulpi_serial6();
++
++	return 0;
++}
+diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
+index 465da26..6129adb 100644
+--- a/arch/arm/mach-pxa/cm-x300.c
++++ b/arch/arm/mach-pxa/cm-x300.c
+@@ -3,9 +3,10 @@
+  *
+  * Support for the CompuLab CM-X300 modules
+  *
+- * Copyright (C) 2008 CompuLab Ltd.
++ * Copyright (C) 2008,2009 CompuLab Ltd.
+  *
+  * Mike Rapoport <mike@compulab.co.il>
++ * Igor Grinberg <grinberg@compulab.co.il>
+  *
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License version 2 as
+@@ -16,21 +17,33 @@
+ #include <linux/kernel.h>
+ #include <linux/interrupt.h>
+ #include <linux/init.h>
++#include <linux/delay.h>
+ #include <linux/platform_device.h>
+ 
+ #include <linux/gpio.h>
+ #include <linux/dm9000.h>
+ #include <linux/leds.h>
+ #include <linux/rtc-v3020.h>
++#include <linux/pwm_backlight.h>
+ 
+ #include <linux/i2c.h>
+ #include <linux/i2c/pca953x.h>
+ 
++#include <linux/mfd/da903x.h>
++#include <linux/power_supply.h>
++#include <linux/apm-emulation.h>
++
++#include <linux/spi/spi.h>
++#include <linux/spi/spi_gpio.h>
++#include <linux/spi/tdo24m.h>
++
+ #include <asm/mach-types.h>
+ #include <asm/mach/arch.h>
+ #include <asm/setup.h>
+ 
+ #include <mach/pxa300.h>
++#include <mach/pxa27x-udc.h>
++#include <mach/audio.h>
+ #include <mach/pxafb.h>
+ #include <mach/mmc.h>
+ #include <mach/ohci.h>
+@@ -40,6 +53,7 @@
+ #include <asm/mach/map.h>
+ 
+ #include "generic.h"
++#include "devices.h"
+ 
+ #define CM_X300_ETH_PHYS	0x08000010
+ 
+@@ -53,7 +67,7 @@
+ #define GPIO97_RTC_RD		(97)
+ #define GPIO98_RTC_IO		(98)
+ 
+-static mfp_cfg_t cm_x300_mfp_cfg[] __initdata = {
++static mfp_cfg_t cm_x3xx_mfp_cfg[] __initdata = {
+ 	/* LCD */
+ 	GPIO54_LCD_LDD_0,
+ 	GPIO55_LCD_LDD_1,
+@@ -137,7 +151,6 @@ static mfp_cfg_t cm_x300_mfp_cfg[] __initdata = {
+ 	GPIO36_UART1_DTR,
+ 
+ 	/* GPIOs */
+-	GPIO79_GPIO,			/* LED */
+ 	GPIO82_GPIO | MFP_PULL_HIGH,	/* MMC CD */
+ 	GPIO85_GPIO,			/* MMC WP */
+ 	GPIO99_GPIO,			/* Ethernet IRQ */
+@@ -151,6 +164,50 @@ static mfp_cfg_t cm_x300_mfp_cfg[] __initdata = {
+ 	/* Standard I2C */
+ 	GPIO21_I2C_SCL,
+ 	GPIO22_I2C_SDA,
++
++	/* PWM Backlight */
++	GPIO19_PWM2_OUT,
++};
++
++static mfp_cfg_t cm_x3xx_rev_lt130_mfp_cfg[] __initdata = {
++	/* GPIOs */
++	GPIO79_GPIO,			/* LED */
++	GPIO77_GPIO,			/* WiFi reset */
++	GPIO78_GPIO,			/* BT reset */
++};
++
++static mfp_cfg_t cm_x3xx_rev_ge130_mfp_cfg[] __initdata = {
++	/* GPIOs */
++	GPIO76_GPIO,			/* LED */
++	GPIO71_GPIO,			/* WiFi reset */
++	GPIO70_GPIO,			/* BT reset */
++};
++
++static mfp_cfg_t cm_x310_mfp_cfg[] __initdata = {
++	/* USB PORT 2 */
++	ULPI_STP,
++	ULPI_NXT,
++	ULPI_DIR,
++	GPIO30_ULPI_DATA_OUT_0,
++	GPIO31_ULPI_DATA_OUT_1,
++	GPIO32_ULPI_DATA_OUT_2,
++	GPIO33_ULPI_DATA_OUT_3,
++	GPIO34_ULPI_DATA_OUT_4,
++	GPIO35_ULPI_DATA_OUT_5,
++	GPIO36_ULPI_DATA_OUT_6,
++	GPIO37_ULPI_DATA_OUT_7,
++	GPIO38_ULPI_CLK,
++	/* external PHY reset pin */
++	GPIO127_GPIO,
++
++	/* USB PORT 3 */
++	GPIO77_USB_P3_1,
++	GPIO78_USB_P3_2,
++	GPIO79_USB_P3_3,
++	GPIO80_USB_P3_4,
++	GPIO81_USB_P3_5,
++	GPIO82_USB_P3_6,
++	GPIO0_2_USBH_PEN,
+ };
+ 
+ #if defined(CONFIG_DM9000) || defined(CONFIG_DM9000_MODULE)
+@@ -195,17 +252,18 @@ static void __init cm_x300_init_dm9000(void)
+ static inline void cm_x300_init_dm9000(void) {}
+ #endif
+ 
++/* LCD */
+ #if defined(CONFIG_FB_PXA) || defined(CONFIG_FB_PXA_MODULE)
+ static struct pxafb_mode_info cm_x300_lcd_modes[] = {
+ 	[0] = {
+-		.pixclock	= 38000,
++		.pixclock	= 38250,
+ 		.bpp		= 16,
+ 		.xres		= 480,
+ 		.yres		= 640,
+ 		.hsync_len	= 8,
+ 		.vsync_len	= 2,
+ 		.left_margin	= 8,
+-		.upper_margin	= 0,
++		.upper_margin	= 2,
+ 		.right_margin	= 24,
+ 		.lower_margin	= 4,
+ 		.cmap_greyscale	= 0,
+@@ -227,7 +285,7 @@ static struct pxafb_mode_info cm_x300_lcd_modes[] = {
+ 
+ static struct pxafb_mach_info cm_x300_lcd = {
+ 	.modes			= cm_x300_lcd_modes,
+-	.num_modes		= 2,
++	.num_modes		= ARRAY_SIZE(cm_x300_lcd_modes),
+ 	.lcd_conn		= LCD_COLOR_TFT_16BPP | LCD_PCLK_EDGE_FALL,
+ };
+ 
+@@ -239,6 +297,87 @@ static void __init cm_x300_init_lcd(void)
+ static inline void cm_x300_init_lcd(void) {}
+ #endif
+ 
++#if defined(CONFIG_BACKLIGHT_PWM) || defined(CONFIG_BACKLIGHT_PWM_MODULE)
++static struct platform_pwm_backlight_data cm_x300_backlight_data = {
++	.pwm_id		= 2,
++	.max_brightness	= 100,
++	.dft_brightness	= 100,
++	.pwm_period_ns	= 10000,
++};
++
++static struct platform_device cm_x300_backlight_device = {
++	.name		= "pwm-backlight",
++	.dev		= {
++		.parent = &pxa27x_device_pwm0.dev,
++		.platform_data	= &cm_x300_backlight_data,
++	},
++};
++
++static void cm_x300_init_bl(void)
++{
++	platform_device_register(&cm_x300_backlight_device);
++}
++#else
++static inline void cm_x300_init_bl(void) {}
++#endif
++
++#if defined(CONFIG_SPI_GPIO) || defined(CONFIG_SPI_GPIO_MODULE)
++#define GPIO_LCD_BASE	(144)
++#define GPIO_LCD_DIN	(GPIO_LCD_BASE + 8)	/* aux_gpio3_0 */
++#define GPIO_LCD_DOUT	(GPIO_LCD_BASE + 9)	/* aux_gpio3_1 */
++#define GPIO_LCD_SCL	(GPIO_LCD_BASE + 10)	/* aux_gpio3_2 */
++#define GPIO_LCD_CS	(GPIO_LCD_BASE + 11)	/* aux_gpio3_3 */
++#define LCD_SPI_BUS_NUM	(1)
++
++static struct spi_gpio_platform_data cm_x300_spi_gpio_pdata = {
++	.sck		= GPIO_LCD_SCL,
++	.mosi		= GPIO_LCD_DIN,
++	.miso		= GPIO_LCD_DOUT,
++	.num_chipselect	= 1,
++};
++
++static struct platform_device cm_x300_spi_gpio = {
++	.name		= "spi_gpio",
++	.id		= LCD_SPI_BUS_NUM,
++	.dev		= {
++		.platform_data	= &cm_x300_spi_gpio_pdata,
++	},
++};
++
++static struct tdo24m_platform_data cm_x300_tdo24m_pdata = {
++	.model = TDO35S,
++};
++
++static struct spi_board_info cm_x300_spi_devices[] __initdata = {
++	{
++		.modalias		= "tdo24m",
++		.max_speed_hz		= 1000000,
++		.bus_num		= LCD_SPI_BUS_NUM,
++		.chip_select		= 0,
++		.controller_data	= (void *) GPIO_LCD_CS,
++		.platform_data		= &cm_x300_tdo24m_pdata,
++	},
++};
++
++static void __init cm_x300_init_spi(void)
++{
++	spi_register_board_info(cm_x300_spi_devices,
++				ARRAY_SIZE(cm_x300_spi_devices));
++	platform_device_register(&cm_x300_spi_gpio);
++}
++#else
++static inline void cm_x300_init_spi(void) {}
++#endif
++
++#if defined(CONFIG_SND_PXA2XX_LIB_AC97)
++static void __init cm_x300_init_ac97(void)
++{
++	pxa_set_ac97_info(NULL);
++}
++#else
++static inline void cm_x300_init_ac97(void) {}
++#endif
++
+ #if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
+ static struct mtd_partition cm_x300_nand_partitions[] = {
+ 	[0] = {
+@@ -292,32 +431,12 @@ static inline void cm_x300_init_nand(void) {}
+ #endif
+ 
+ #if defined(CONFIG_MMC) || defined(CONFIG_MMC_MODULE)
+-/* The first MMC slot of CM-X300 is hardwired to Libertas card and has
+-   no detection/ro pins */
+-static int cm_x300_mci_init(struct device *dev,
+-			    irq_handler_t cm_x300_detect_int,
+-			    void *data)
+-{
+-	return 0;
+-}
+-
+-static void cm_x300_mci_exit(struct device *dev, void *data)
+-{
+-}
+-
+-static struct pxamci_platform_data cm_x300_mci_platform_data = {
+-	.detect_delay	= 20,
+-	.ocr_mask	= MMC_VDD_32_33|MMC_VDD_33_34,
+-	.init 		= cm_x300_mci_init,
+-	.exit		= cm_x300_mci_exit,
+-};
+-
+-static int cm_x300_mci2_ro(struct device *dev)
++static int cm_x300_mci_ro(struct device *dev)
+ {
+ 	return gpio_get_value(GPIO85_MMC2_WP);
+ }
+ 
+-static int cm_x300_mci2_init(struct device *dev,
++static int cm_x300_mci_init(struct device *dev,
+ 			     irq_handler_t cm_x300_detect_int,
+ 			     void *data)
+ {
+@@ -355,19 +474,39 @@ err_request_cd:
+ 	return err;
+ }
+ 
+-static void cm_x300_mci2_exit(struct device *dev, void *data)
++static void cm_x300_mci_exit(struct device *dev, void *data)
+ {
+ 	free_irq(CM_X300_MMC2_IRQ, data);
+ 	gpio_free(GPIO82_MMC2_IRQ);
+ 	gpio_free(GPIO85_MMC2_WP);
+ }
+ 
++static struct pxamci_platform_data cm_x300_mci_platform_data = {
++	.detect_delay	= 20,
++	.ocr_mask	= MMC_VDD_32_33|MMC_VDD_33_34,
++	.init 		= cm_x300_mci_init,
++	.exit		= cm_x300_mci_exit,
++	.get_ro		= cm_x300_mci_ro,
++};
++
++/* The second MMC slot of CM-X300 is hardwired to Libertas card and has
++   no detection/ro pins */
++static int cm_x300_mci2_init(struct device *dev,
++			    irq_handler_t cm_x300_detect_int,
++			    void *data)
++{
++	return 0;
++}
++
++static void cm_x300_mci2_exit(struct device *dev, void *data)
++{
++}
++
+ static struct pxamci_platform_data cm_x300_mci2_platform_data = {
+ 	.detect_delay	= 20,
+ 	.ocr_mask	= MMC_VDD_32_33|MMC_VDD_33_34,
+ 	.init 		= cm_x300_mci2_init,
+ 	.exit		= cm_x300_mci2_exit,
+-	.get_ro		= cm_x300_mci2_ro,
+ };
+ 
+ static void __init cm_x300_init_mmc(void)
+@@ -380,9 +519,25 @@ static inline void cm_x300_init_mmc(void) {}
+ #endif
+ 
+ #if defined(CONFIG_USB_OHCI_HCD) || defined(CONFIG_USB_OHCI_HCD_MODULE)
++
++extern int cm_x300_ulpi_init(void);
++
++static int cm_x300_ohci_init(struct device *dev)
++{
++	if (cpu_is_pxa300())
++		UP2OCR = UP2OCR_HXS
++			| UP2OCR_HXOE | UP2OCR_DMPDE | UP2OCR_DPPDE;
++
++	if (cpu_is_pxa310())
++		cm_x300_ulpi_init();
++
++	return 0;
++}
++
+ static struct pxaohci_platform_data cm_x300_ohci_platform_data = {
+ 	.port_mode	= PMM_PERPORT_MODE,
+-	.flags		= ENABLE_PORT1 | ENABLE_PORT2 | POWER_CONTROL_LOW,
++	.flags		= ENABLE_PORT_ALL | POWER_CONTROL_LOW,
++	.init		= cm_x300_ohci_init,
+ };
+ 
+ static void __init cm_x300_init_ohci(void)
+@@ -398,7 +553,6 @@ static struct gpio_led cm_x300_leds[] = {
+ 	[0] = {
+ 		.name = "cm-x300:green",
+ 		.default_trigger = "heartbeat",
+-		.gpio = 79,
+ 		.active_low = 1,
+ 	},
+ };
+@@ -418,6 +572,11 @@ static struct platform_device cm_x300_led_device = {
+ 
+ static void __init cm_x300_init_leds(void)
+ {
++	if (system_rev < 130)
++		cm_x300_leds[0].gpio = 79;
++	else
++		cm_x300_leds[0].gpio = 76;
++
+ 	platform_device_register(&cm_x300_led_device);
+ }
+ #else
+@@ -480,19 +639,150 @@ static void __init cm_x300_init_rtc(void)
+ static inline void cm_x300_init_rtc(void) {}
+ #endif
+ 
+-static void __init cm_x300_init(void)
++/* Battery */
++struct power_supply_info cm_x300_psy_info = {
++	.name = "battery",
++	.technology = POWER_SUPPLY_TECHNOLOGY_LIPO,
++	.voltage_max_design = 4200000,
++	.voltage_min_design = 3000000,
++	.use_for_apm = 1,
++};
++
++static void cm_x300_battery_low(void)
++{
++#if defined(CONFIG_APM_EMULATION)
++	apm_queue_event(APM_LOW_BATTERY);
++#endif
++}
++
++static void cm_x300_battery_critical(void)
++{
++#if defined(CONFIG_APM_EMULATION)
++	apm_queue_event(APM_CRITICAL_SUSPEND);
++#endif
++}
++
++struct da9030_battery_info cm_x300_battery_info = {
++	.battery_info = &cm_x300_psy_info,
++
++	.charge_milliamp = 1000,
++	.charge_millivolt = 4200,
++
++	.vbat_low = 3600,
++	.vbat_crit = 3400,
++	.vbat_charge_start = 4100,
++	.vbat_charge_stop = 4200,
++	.vbat_charge_restart = 4000,
++
++	.vcharge_min = 3200,
++	.vcharge_max = 5500,
++
++	.tbat_low = 197,
++	.tbat_high = 78,
++	.tbat_restart = 100,
++
++	.batmon_interval = 0,
++
++	.battery_low = cm_x300_battery_low,
++	.battery_critical = cm_x300_battery_critical,
++};
++
++/* DA9030 */
++struct da903x_subdev_info cm_x300_da9030_subdevs[] = {
++	{
++		.name = "da903x-battery",
++		.id = DA9030_ID_BAT,
++		.platform_data = &cm_x300_battery_info,
++	},
++};
++
++static struct da903x_platform_data cm_x300_da9030_info = {
++	.num_subdevs = ARRAY_SIZE(cm_x300_da9030_subdevs),
++	.subdevs = cm_x300_da9030_subdevs,
++};
++
++static struct i2c_board_info cm_x300_pmic_info = {
++	I2C_BOARD_INFO("da9030", 0x49),
++	.irq = IRQ_WAKEUP0,
++	.platform_data = &cm_x300_da9030_info,
++};
++
++static struct i2c_pxa_platform_data cm_x300_pwr_i2c_info = {
++	.use_pio = 1,
++};
++
++static void __init cm_x300_init_da9030(void)
++{
++	pxa3xx_set_i2c_power_info(&cm_x300_pwr_i2c_info);
++	i2c_register_board_info(1, &cm_x300_pmic_info, 1);
++}
++
++static void __init cm_x300_init_wi2wi(void)
++{
++	int bt_reset, wlan_en;
++	int err;
++
++	if (system_rev < 130) {
++		wlan_en = 77;
++		bt_reset = 78;
++	} else {
++		wlan_en = 71;
++		bt_reset = 70;
++	}
++
++	/* Libertas and CSR reset */
++	err = gpio_request(wlan_en, "wlan en");
++	if (err) {
++		pr_err("CM-X300: failed to request wlan en gpio: %d\n", err);
++	} else {
++		gpio_direction_output(wlan_en, 1);
++		gpio_free(wlan_en);
++	}
++
++	err = gpio_request(bt_reset, "bt reset");
++	if (err) {
++		pr_err("CM-X300: failed to request bt reset gpio: %d\n", err);
++	} else {
++		gpio_direction_output(bt_reset, 1);
++		udelay(10);
++		gpio_set_value(bt_reset, 0);
++		udelay(10);
++		gpio_set_value(bt_reset, 1);
++		gpio_free(bt_reset);
++	}
++}
++
++/* MFP */
++static void __init cm_x300_init_mfp(void)
+ {
+ 	/* board-processor specific GPIO initialization */
+-	pxa3xx_mfp_config(ARRAY_AND_SIZE(cm_x300_mfp_cfg));
++	pxa3xx_mfp_config(ARRAY_AND_SIZE(cm_x3xx_mfp_cfg));
++
++	if (system_rev < 130)
++		pxa3xx_mfp_config(ARRAY_AND_SIZE(cm_x3xx_rev_lt130_mfp_cfg));
++	else
++		pxa3xx_mfp_config(ARRAY_AND_SIZE(cm_x3xx_rev_ge130_mfp_cfg));
+ 
++	if (cpu_is_pxa310())
++		pxa3xx_mfp_config(ARRAY_AND_SIZE(cm_x310_mfp_cfg));
++}
++
++static void __init cm_x300_init(void)
++{
++	cm_x300_init_mfp();
++	cm_x300_init_da9030();
+ 	cm_x300_init_dm9000();
+ 	cm_x300_init_lcd();
++	cm_x300_init_bl();
+ 	cm_x300_init_ohci();
+ 	cm_x300_init_mmc();
+ 	cm_x300_init_nand();
+ 	cm_x300_init_leds();
+ 	cm_x300_init_i2c();
++	cm_x300_init_spi();
+ 	cm_x300_init_rtc();
++	cm_x300_init_ac97();
++	cm_x300_init_wi2wi();
+ }
+ 
+ static void __init cm_x300_fixup(struct machine_desc *mdesc, struct tag *tags,
+diff --git a/arch/arm/mach-pxa/include/mach/regs-u2d.h b/arch/arm/mach-pxa/include/mach/regs-u2d.h
+new file mode 100644
+index 0000000..44b0b20
+--- /dev/null
++++ b/arch/arm/mach-pxa/include/mach/regs-u2d.h
+@@ -0,0 +1,199 @@
++#ifndef __ASM_ARCH_PXA3xx_U2D_H
++#define __ASM_ARCH_PXA3xx_U2D_H
++
++#include <mach/bitfield.h>
++
++/*
++ * USB2 device controller registers and bits definitions
++ */
++#define U2DCR		(0x0000)	/* U2D Control Register */
++#define U2DCR_NDC	(1   << 31)	/* NAK During Config */
++#define U2DCR_HSTC	(0x7 << 28)	/* High Speed Timeout Calibration */
++#define U2DCR_SPEOREN	(1   << 27)	/* Short Packet EOR INTR generation Enable */
++#define U2DCR_FSTC	(0x7 << 24)	/* Full Speed Timeout Calibration */
++#define U2DCR_UCLKOVR	(1   << 22)	/* UTM Clock Override */
++#define U2DCR_ABP	(1   << 21)	/* Application Bus Power */
++#define U2DCR_ADD	(1   << 20)	/* Application Device Disconnect */
++#define U2DCR_CC	(1   << 19)	/* Configuration Change */
++#define U2DCR_HS	(1   << 18)	/* High Speed USB Detection */
++#define U2DCR_SMAC	(1   << 17)	/* Switch Endpoint Memory to Active Configuration */
++#define U2DCR_DWRE	(1   << 16)	/* Device Remote Wake-up Feature */
++#define U2DCR_ACN	(0xf << 12)	/* Active U2D Configuration Number */
++#define U2DCR_AIN	(0xf << 8)	/* Active U2D Interface Number */
++#define U2DCR_AAISN	(0xf << 4)	/* Active U2D Alternate Interface Setting Number */
++#define U2DCR_EMCE	(1   << 3)	/* Endpoint Memory Configuration Error */
++#define U2DCR_UDR	(1   << 2)	/* U2D Resume */
++#define U2DCR_UDA	(1   << 1)	/* U2D Active */
++#define U2DCR_UDE	(1   << 0)	/* U2D Enable */
++
++#define U2DICR			(0x0004)	/* U2D Interrupt Control Register */
++#define U2DISR			(0x000C)	/* U2D Interrupt Status Register */
++#define U2DINT_CC		(1 << 31)	/* Interrupt - Configuration Change */
++#define U2DINT_SOF		(1 << 30)	/* Interrupt - SOF */
++#define U2DINT_USOF		(1 << 29)	/* Interrupt - micro SOF */
++#define U2DINT_RU		(1 << 28)	/* Interrupt - Resume */
++#define U2DINT_SU		(1 << 27)	/* Interrupt - Suspend */
++#define U2DINT_RS		(1 << 26)	/* Interrupt - Reset */
++#define U2DINT_DPE		(1 << 25)	/* Interrupt - Data Packet Error */
++#define U2DINT_FIFOERR		(0x4)		/* Interrupt - endpoint FIFO error */
++#define U2DINT_PACKETCMP	(0x2)		/* Interrupt - endpoint packet complete */
++#define U2DINT_SPACKETCMP	(0x1)		/* Interrupt - endpoint short packet complete */
++
++#define U2DFNR			(0x0014)	/* U2D Frame Number Register */
++
++#define U2DINT(n, intr)		(((intr) & 0x07) << (((n) & 0x07) * 3))
++#define U2DICR2			(0x0008)	/* U2D Interrupt Control Register 2 */
++#define U2DISR2			(0x0010)	/* U2D Interrupt Status Register 2 */
++
++#define U2DOTGCR		(0x0020)	/* U2D OTG Control Register */
++#define U2DOTGCR_OTGEN		(1 << 31)	/* On-The-Go Enable */
++#define U2DOTGCR_AALTHNP	(1 << 30)	/* A-device Alternate Host Negotiation Protocal Port Support */
++#define U2DOTGCR_AHNP		(1 << 29)	/* A-device Host Negotiation Protocal Support */
++#define U2DOTGCR_BHNP		(1 << 28)	/* B-device Host Negotiation Protocal Enable */
++
++#ifdef CONFIG_CPU_PXA930
++#define U2DOTGCR_LPA		(1 << 15)	/* ULPI low power mode active */
++#define U2DOTGCR_IESI		(1 << 13)	/* OTG interrupt Enable */
++#define U2DOTGCR_ISSI		(1 << 12)	/* OTG interrupt status */
++#endif
++
++#define U2DOTGCR_CKAF	(1 << 5)	/* Carkit Mode Alternate Function Select */
++#define U2DOTGCR_UTMID	(1 << 4)	/* UTMI Interface Disable */
++#define U2DOTGCR_ULAF	(1 << 3)	/* ULPI Mode Alternate Function Select */
++#define U2DOTGCR_SMAF	(1 << 2)	/* Serial Mode Alternate Function Select */
++#define U2DOTGCR_RTSM	(1 << 1)	/* Return to Synchronous Mode (ULPI Mode) */
++#define U2DOTGCR_ULE	(1 << 0)	/* ULPI Wrapper Enable */
++
++#define U2DOTGICR	(0x0024)	/* U2D OTG Interrupt Control Register */
++#define U2DOTGISR	(0x0028)	/* U2D OTG Interrupt Status Register */
++
++#define U2DOTGINT_SF	(1 << 17)	/* OTG Set Feature Command Received */
++#define U2DOTGINT_SI	(1 << 16)	/* OTG Interrupt */
++#define U2DOTGINT_RLS1	(1 << 14)	/* RXCMD Linestate[1] Change Interrupt Rise */
++#define U2DOTGINT_RLS0	(1 << 13)	/* RXCMD Linestate[0] Change Interrupt Rise */
++#define U2DOTGINT_RID	(1 << 12)	/* RXCMD OTG ID Change Interrupt Rise */
++#define U2DOTGINT_RSE	(1 << 11)	/* RXCMD OTG Session End Interrupt Rise */
++#define U2DOTGINT_RSV	(1 << 10)	/* RXCMD OTG Session Valid Interrupt Rise */
++#define U2DOTGINT_RVV	(1 << 9)	/* RXCMD OTG Vbus Valid Interrupt Rise */
++#define U2DOTGINT_RCK	(1 << 8)	/* RXCMD Carkit Interrupt Rise */
++#define U2DOTGINT_FLS1	(1 << 6)	/* RXCMD Linestate[1] Change Interrupt Fall */
++#define U2DOTGINT_FLS0	(1 << 5)	/* RXCMD Linestate[0] Change Interrupt Fall */
++#define U2DOTGINT_FID	(1 << 4)	/* RXCMD OTG ID Change Interrupt Fall */
++#define U2DOTGINT_FSE	(1 << 3)	/* RXCMD OTG Session End Interrupt Fall */
++#define U2DOTGINT_FSV	(1 << 2)	/* RXCMD OTG Session Valid Interrupt Fall */
++#define U2DOTGINT_FVV	(1 << 1)	/* RXCMD OTG Vbus Valid Interrupt Fall */
++#define U2DOTGINT_FCK	(1 << 0)	/* RXCMD Carkit Interrupt Fall */
++
++#define U2DOTGUSR	(0x002C)	/* U2D OTG ULPI Status Register */
++#define U2DOTGUSR_LPA	(1 << 31)	/* ULPI Low Power Mode Active */
++#define U2DOTGUSR_S6A	(1 << 30)	/* ULPI Serial Mode (6-pin) Active */
++#define U2DOTGUSR_S3A	(1 << 29)	/* ULPI Serial Mode (3-pin) Active */
++#define U2DOTGUSR_CKA	(1 << 28)	/* ULPI Car Kit Mode Active */
++#define U2DOTGUSR_LS1	(1 << 6)	/* RXCMD Linestate 1 Status */
++#define U2DOTGUSR_LS0	(1 << 5)	/* RXCMD Linestate 0 Status */
++#define U2DOTGUSR_ID	(1 << 4)	/* OTG IDGnd Status */
++#define U2DOTGUSR_SE	(1 << 3)	/* OTG Session End Status */
++#define U2DOTGUSR_SV	(1 << 2)	/* OTG Session Valid Status */
++#define U2DOTGUSR_VV	(1 << 1)	/* OTG Vbus Valid Status */
++#define U2DOTGUSR_CK	(1 << 0)	/* Carkit Interrupt Status */
++
++#define U2DOTGUCR	(0x0030)	/* U2D OTG ULPI Control Register */
++#define U2DOTGUCR_RUN	(1    << 25)	/* RUN */
++#define U2DOTGUCR_RNW	(1    << 24)	/* Read or Write operation */
++#define U2DOTGUCR_ADDR	(0x3f << 16)	/* Address of the ULPI PHY register */
++#define U2DOTGUCR_WDATA	(0xff << 8)	/* The data for a WRITE command */
++#define U2DOTGUCR_RDATA	(0xff << 0)	/* The data for a READ command */
++
++#define U2DP3CR		(0x0034)	/* U2D Port 3 Control Register */
++#define U2DP3CR_P2SS	(0x3 << 8)	/* Host Port 2 Serial Mode Select */
++#define U2DP3CR_P3SS	(0x7 << 4)	/* Host Port 3 Serial Mode Select */
++#define U2DP3CR_VPVMBEN	(0x1 << 2)	/* Host Port 3 Vp/Vm Block Enable */
++#define U2DP3CR_CFG	(0x3 << 0)	/* Host Port 3 Configuration */
++
++#define U2DCSR0		(0x0100)	/* U2D Control/Status Register - Endpoint 0 */
++#define U2DCSR0_IPA	(1 << 8)	/* IN Packet Adjusted */
++#define U2DCSR0_SA	(1 << 7)	/* SETUP Active */
++#define U2DCSR0_RNE	(1 << 6)	/* Receive FIFO Not Empty */
++#define U2DCSR0_FST	(1 << 5)	/* Force Stall */
++#define U2DCSR0_SST	(1 << 4)	/* Send Stall */
++#define U2DCSR0_DME	(1 << 3)	/* DMA Enable */
++#define U2DCSR0_FTF	(1 << 2)	/* Flush Transmit FIFO */
++#define U2DCSR0_IPR	(1 << 1)	/* IN Packet Ready */
++#define U2DCSR0_OPC	(1 << 0)	/* OUT Packet Complete */
++
++#define U2DCSR(x)	(0x0100 + ((x) << 2))	/* U2D Control/Status Register - Endpoint x */
++#define U2DCSR_BF	(1 << 10)	/* Buffer Full, for OUT eps */
++#define U2DCSR_BE	(1 << 10)	/* Buffer Empty, for IN eps */
++#define U2DCSR_DPE	(1 << 9)	/* Data Packet Error, for ISO eps only */
++#define U2DCSR_FEF	(1 << 8)	/* Flush Endpoint FIFO */
++#define U2DCSR_SP	(1 << 7)	/* Short Packet Control/Status, for OUT eps only, readonly */
++#define U2DCSR_BNE	(1 << 6)	/* Buffer Not Empty, for OUT eps */
++#define U2DCSR_BNF	(1 << 6)	/* Buffer Not Full, for IN eps */
++#define U2DCSR_FST	(1 << 5)	/* Force STALL, write 1 set */
++#define U2DCSR_SST	(1 << 4)	/* Sent STALL, write 1 clear */
++#define U2DCSR_DME	(1 << 3)	/* DMA Enable */
++#define U2DCSR_TRN	(1 << 2)	/* Tx/Rx NAK, write 1 clear */
++#define U2DCSR_PC	(1 << 1)	/* Packet Complete, write 1 clear */
++#define U2DCSR_FS	(1 << 0)	/* FIFO needs Service */
++
++#define U2DBCR0		(0x0200)		/* U2D Byte Count Register - Endpoint 0 */
++#define U2DBCR(x)	(0x0200 + ((x) << 2))	/* U2D Byte Count Register - Endpoint x */
++
++#define U2DDR0		(0x0300)		/* U2D Data Register - Endpoint 0 */
++
++#define U2DEPCR(x)	(0x0400 + ((x) << 2))	/* U2D Configuration Register - Endpoint x */
++#define U2DEPCR_EE	(1 << 0)		/* Endpoint Enable */
++#define U2DEPCR_BS_MASK	(0x3FE)			/* Buffer Size, BS*8=FIFO size, max 8184B = 8KB */
++
++#define U2DSCA		(0x0500)		/* U2D Setup Command Address */
++#define U2DSCA_VALUE	(0x0120)
++
++#define U2DEN0		(0x0504)		/* U2D Endpoint Information Register - Endpoint 0 */
++#define U2DEN(x)	(0x0504 + ((x) << 2))	/* U2D Endpoint Information Register - Endpoint x */
++
++/* U2DMA registers */
++#define U2DMACSR0		(0x1000)	/* U2DMA Control/Status Register - Channel 0 */
++#define U2DMACSR(x)		(0x1000 + ((x) << 2))	/* U2DMA Control/Status Register - Channel x */
++#define U2DMACSR_RUN		(1 << 31)	/* Run Bit (read / write) */
++#define U2DMACSR_STOPIRQEN	(1 << 29)	/* Stop Interrupt Enable (read / write) */
++#define U2DMACSR_EORIRQEN	(1 << 28)	/* End of Receive Interrupt Enable (R/W) */
++#define U2DMACSR_EORJMPEN	(1 << 27)	/* Jump to next descriptor on EOR */
++#define U2DMACSR_EORSTOPEN	(1 << 26)	/* STOP on an EOR */
++#define U2DMACSR_RASIRQEN	(1 << 23)	/* Request After Cnannel Stopped Interrupt Enable */
++#define U2DMACSR_MASKRUN	(1 << 22)	/* Mask Run */
++#define U2DMACSR_SCEMC		(3 << 18)	/* System Bus Split Completion Error Message Class */
++#define U2DMACSR_SCEMI		(0x1f << 13)	/* System Bus Split Completion Error Message Index */
++#define U2DMACSR_BUSERRTYPE	(7 << 10)	/* PX Bus Error Type */
++#define U2DMACSR_EORINTR	(1 << 9)	/* End Of Receive */
++#define U2DMACSR_REQPEND	(1 << 8)	/* Request Pending */
++#define U2DMACSR_RASINTR	(1 << 4)	/* Request After Channel Stopped (read / write 1 clear) */#define U2DMACSR_STOPINTR	(1 << 3)	/* Stop Interrupt (read only) */
++#define U2DMACSR_ENDINTR	(1 << 2)	/* End Interrupt (read / write 1 clear) */
++#define U2DMACSR_STARTINTR	(1 << 1)	/* Start Interrupt (read / write 1 clear) */
++#define U2DMACSR_BUSERRINTR	(1 << 0)	/* Bus Error Interrupt (read / write 1 clear) */
++
++#define U2DMACR		(0x1080)		/* U2DMA Control Register */
++#define U2DMAINT	(0x10F0)		/* U2DMA Interrupt Register */
++
++#define U2DMABR0	(0x1100)		/* U2DMA Branch Register - Channel 0 */
++#define U2DMABR(x)      (0x1100 + (x) << 2)	/* U2DMA Branch Register - Channel x */
++
++#define U2DMADADR0      (0x1200)		/* U2DMA Descriptor Address Register - Channel 0 */
++#define U2DMADADR(x)    (0x1200 + (x) * 0x10)	/* U2DMA Descriptor Address Register - Channel x */
++
++#define U2DMADADR_STOP	(1U << 0)
++
++#define U2DMASADR0	(0x1204)		/* U2DMA Source Address Register - Channel 0 */
++#define U2DMASADR(x)	(0x1204 + (x) * 0x10)	/* U2DMA Source Address Register - Channel x */
++#define U2DMATADR0	(0x1208)		/* U2DMA Target Address Register - Channel 0 */
++#define U2DMATADR(x)	(0x1208 + (x) * 0x10)	/* U2DMA Target Address Register - Channel x */
++
++#define U2DMACMDR0	(0x120C)		/* U2DMA Command Address Register - Channel 0 */
++#define U2DMACMDR(x)	(0x120C + (x) * 0x10)	/* U2DMA Command Address Register - Channel x */
++
++#define U2DMACMDR_XFRDIS	(1 << 31)	/* Transfer Direction */
++#define U2DMACMDR_STARTIRQEN	(1 << 22)	/* Start Interrupt Enable */
++#define U2DMACMDR_ENDIRQEN	(1 << 21)	/* End Interrupt Enable */
++#define U2DMACMDR_PACKCOMP	(1 << 13)	/* Packet Complete */
++#define U2DMACMDR_LEN		(0x07ff)	/* length mask (max = 2K - 1) */
++
++#endif /* __ASM_ARCH_PXA3xx_U2D_H */
+diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
+index 09b7b1a..dd238ac 100644
+--- a/arch/arm/mach-pxa/pxa3xx.c
++++ b/arch/arm/mach-pxa/pxa3xx.c
+@@ -30,6 +30,8 @@
+ #include <mach/pm.h>
+ #include <mach/dma.h>
+ #include <mach/ssp.h>
++#include <mach/regs-intc.h>
++#include <mach/regs-ost.h>
+ #include <plat/i2c.h>
+ 
+ #include "generic.h"
+@@ -45,6 +47,9 @@
+ #define ACCR_D0CS	(1 << 26)
+ #define ACCR_PCCE	(1 << 11)
+ 
++#define PECR_IE(n)	((1 << ((n) * 2)) << 28)
++#define PECR_IS(n)	((1 << ((n) * 2)) << 29)
++
+ /* crystal frequency to static memory controller multiplier (SMCFS) */
+ static unsigned char smcfs_mult[8] = { 6, 0, 8, 0, 0, 16, };
+ 
+@@ -237,6 +242,7 @@ static DEFINE_PXA3_CKEN(pxa3xx_stuart, STUART, 14857000, 1);
+ static DEFINE_PXA3_CKEN(pxa3xx_i2c, I2C, 32842000, 0);
+ static DEFINE_PXA3_CKEN(pxa3xx_udc, UDC, 48000000, 5);
+ static DEFINE_PXA3_CKEN(pxa3xx_usbh, USBH, 48000000, 0);
++static DEFINE_PXA3_CKEN(pxa3xx_u2d, USB2, 48000000, 0);
+ static DEFINE_PXA3_CKEN(pxa3xx_keypad, KEYPAD, 32768, 0);
+ static DEFINE_PXA3_CKEN(pxa3xx_ssp1, SSP1, 13000000, 0);
+ static DEFINE_PXA3_CKEN(pxa3xx_ssp2, SSP2, 13000000, 0);
+@@ -261,6 +267,7 @@ static struct clk_lookup pxa3xx_clkregs[] = {
+ 	INIT_CLKREG(&clk_pxa3xx_i2c, "pxa2xx-i2c.0", NULL),
+ 	INIT_CLKREG(&clk_pxa3xx_udc, "pxa27x-udc", NULL),
+ 	INIT_CLKREG(&clk_pxa3xx_usbh, "pxa27x-ohci", NULL),
++	INIT_CLKREG(&clk_pxa3xx_u2d, NULL, "U2DCLK"),
+ 	INIT_CLKREG(&clk_pxa3xx_keypad, "pxa27x-keypad", NULL),
+ 	INIT_CLKREG(&clk_pxa3xx_ssp1, "pxa27x-ssp.0", NULL),
+ 	INIT_CLKREG(&clk_pxa3xx_ssp2, "pxa27x-ssp.1", NULL),
+@@ -286,6 +293,7 @@ static unsigned long wakeup_src;
+ enum {	SLEEP_SAVE_CKENA,
+ 	SLEEP_SAVE_CKENB,
+ 	SLEEP_SAVE_ACCR,
++	SLEEP_SAVE_OSCR,
+ 
+ 	SLEEP_SAVE_COUNT,
+ };
+@@ -295,6 +303,7 @@ static void pxa3xx_cpu_pm_save(unsigned long *sleep_save)
+ 	SAVE(CKENA);
+ 	SAVE(CKENB);
+ 	SAVE(ACCR);
++	SAVE(OSCR);
+ }
+ 
+ static void pxa3xx_cpu_pm_restore(unsigned long *sleep_save)
+@@ -302,6 +311,7 @@ static void pxa3xx_cpu_pm_restore(unsigned long *sleep_save)
+ 	RESTORE(ACCR);
+ 	RESTORE(CKENA);
+ 	RESTORE(CKENB);
++	RESTORE(OSCR);
+ }
+ 
+ /*
+@@ -345,13 +355,20 @@ static void pxa3xx_cpu_standby(unsigned int pwrmode)
+ static void pxa3xx_cpu_pm_suspend(void)
+ {
+ 	volatile unsigned long *p = (volatile void *)0xc0000000;
+-	unsigned long saved_data = *p;
++	unsigned long saved_data[3];
++
++	saved_data[0] = *p;
++	p = (volatile void *)0xc0000800;
++	saved_data[1] = *p;
++	p = (volatile void *)0xc0000804;
++	saved_data[2] = *p;
+ 
+ 	extern void pxa3xx_cpu_suspend(void);
+ 	extern void pxa3xx_cpu_resume(void);
+ 
+ 	/* resuming from D2 requires the HSIO2/BOOT/TPM clocks enabled */
+ 	CKENA |= (1 << CKEN_BOOT) | (1 << CKEN_TPM);
++	CKENA &= ~(1 << CKEN_USBH);
+ 	CKENB |= 1 << (CKEN_HSIO2 & 0x1f);
+ 
+ 	/* clear and setup wakeup source */
+@@ -366,11 +383,19 @@ static void pxa3xx_cpu_pm_suspend(void)
+ 	PSPR = 0x5c014000;
+ 
+ 	/* overwrite with the resume address */
++	p = (volatile void *)0xc0000000;
++	*p = virt_to_phys(pxa3xx_cpu_resume);
++	p = (volatile void *)0xc0000800;
+ 	*p = virt_to_phys(pxa3xx_cpu_resume);
+ 
+ 	pxa3xx_cpu_suspend();
+ 
+-	*p = saved_data;
++	p = (volatile void *)0xc0000000;
++	*p = saved_data[0];
++	p = (volatile void *)0xc0000800;
++	*p = saved_data[1];
++	p = (volatile void *)0xc0000804;
++	*p = saved_data[2];
+ 
+ 	AD3ER = 0;
+ }
+@@ -530,6 +555,43 @@ static inline void pxa3xx_init_pm(void) {}
+ #define pxa3xx_set_wake	NULL
+ #endif
+ 
++static void pxa_ack_ext_wakeup(unsigned int irq)
++{
++	PECR |= PECR_IS(irq - IRQ_WAKEUP0);
++}
++
++static void pxa_mask_ext_wakeup(unsigned int irq)
++{
++	ICMR2 &= ~(1 << ((irq - PXA_IRQ(0)) & 0x1f));
++	PECR &= ~PECR_IE(irq - IRQ_WAKEUP0);
++}
++
++static void pxa_unmask_ext_wakeup(unsigned int irq)
++{
++	ICMR2 |= 1 << ((irq - PXA_IRQ(0)) & 0x1f);
++	PECR |= PECR_IE(irq - IRQ_WAKEUP0);
++}
++
++static struct irq_chip pxa_ext_wakeup_chip = {
++	.name		= "WAKEUP",
++	.ack		= pxa_ack_ext_wakeup,
++	.mask		= pxa_mask_ext_wakeup,
++	.unmask		= pxa_unmask_ext_wakeup,
++};
++
++static void __init pxa_init_ext_wakeup_irq(set_wake_t fn)
++{
++	int irq;
++
++	for (irq = IRQ_WAKEUP0; irq <= IRQ_WAKEUP1; irq++) {
++		set_irq_chip(irq, &pxa_ext_wakeup_chip);
++		set_irq_handler(irq, handle_edge_irq);
++		set_irq_flags(irq, IRQF_VALID);
++	}
++
++	pxa_ext_wakeup_chip.set_wake = fn;
++}
++
+ void __init pxa3xx_init_irq(void)
+ {
+ 	/* enable CP6 access */
+@@ -539,6 +601,7 @@ void __init pxa3xx_init_irq(void)
+ 	__asm__ __volatile__("mcr p15, 0, %0, c15, c1, 0\n": :"r"(value));
+ 
+ 	pxa_init_irq(56, pxa3xx_set_wake);
++	pxa_init_ext_wakeup_irq(pxa3xx_set_wake);
+ 	pxa_init_gpio(IRQ_GPIO_2_x, 2, 127, NULL);
+ }
+ 
+diff --git a/arch/arm/mach-pxa/sleep.S b/arch/arm/mach-pxa/sleep.S
+index 2ed95f3..aa7cf5f 100644
+--- a/arch/arm/mach-pxa/sleep.S
++++ b/arch/arm/mach-pxa/sleep.S
+@@ -104,6 +104,11 @@ ENTRY(pxa3xx_cpu_resume)
+ 	mov	r0, #PSR_I_BIT | PSR_F_BIT | SVC_MODE	@ set SVC, irqs off
+ 	msr	cpsr_c, r0
+ 
++	ldr	r0, =0x48100000			@ MDCNFG
++	ldr	r1, [r0]
++	orr	r1, r1, #0x3			@ Enable both SDRAM partitions
++	str	r1, [r0]
++
+ 	ldr	r0, sleep_save_sp		@ stack phys addr
+ 	ldmfd	r0, {r3 - r9, sp}		@ CP regs + virt stack ptr
+ 
+diff --git a/drivers/power/da9030_battery.c b/drivers/power/da9030_battery.c
+index 3364198..a478d76 100644
+--- a/drivers/power/da9030_battery.c
++++ b/drivers/power/da9030_battery.c
+@@ -300,6 +300,76 @@ static void da9030_charging_monitor(struct work_struct *work)
+ 	schedule_delayed_work(&charger->work, charger->interval);
+ }
+ 
++struct em_x270_battery_thresh {
++	int voltage;
++	int percentage;
++};
++
++static struct em_x270_battery_thresh vbat_ranges[] = {
++	{76, 0},
++	{77, 0},
++	{78, 0},
++	{79, 1},
++	{80, 1},
++	{81, 1},
++	{82, 2},
++	{83, 2},
++	{84, 2},
++	{85, 3},
++	{86, 3},
++	{87, 4},
++	{88, 6},
++	{89, 8},
++	{90, 11},
++	{91, 13},
++	{92, 15},
++	{93, 18},
++	{94, 22},
++	{95, 25},
++	{96, 29},
++	{97, 33},
++	{98, 37},
++	{99, 41},
++	{100, 45},
++	{101, 48},
++	{102, 51},
++	{103, 54},
++	{104, 56},
++	{105, 59},
++	{106, 61},
++	{107, 63},
++	{108, 65},
++	{109, 67},
++	{110, 68},
++	{111, 70},
++	{112, 72},
++	{113, 74},
++	{114, 75},
++	{115, 77},
++	{116, 78},
++	{117, 80},
++	{118, 82},
++	{119, 83},
++	{120, 84},
++	{121, 85},
++	{122, 86},
++	{123, 87},
++	{124, 89},
++	{125, 90},
++	{126, 91},
++	{127, 92},
++	{128, 94},
++	{129, 95},
++	{130, 96},
++	{131, 97},
++	{132, 98},
++	{133, 98},
++	{134, 99},
++	{135, 100},
++	{136, 100},
++	{137, 100},
++};
++
+ static enum power_supply_property da9030_battery_props[] = {
+ 	POWER_SUPPLY_PROP_MODEL_NAME,
+ 	POWER_SUPPLY_PROP_STATUS,
+@@ -309,6 +379,7 @@ static enum power_supply_property da9030_battery_props[] = {
+ 	POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
+ 	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+ 	POWER_SUPPLY_PROP_CURRENT_AVG,
++	POWER_SUPPLY_PROP_CAPACITY, /* in percents! */
+ };
+ 
+ static void da9030_battery_check_status(struct da9030_charger *charger,
+@@ -335,6 +406,27 @@ static void da9030_battery_check_health(struct da9030_charger *charger,
+ 		val->intval = POWER_SUPPLY_HEALTH_GOOD;
+ }
+ 
++static int vbat_interpolate(int reg)
++{
++	int i;
++
++	if (reg > vbat_ranges[ARRAY_SIZE(vbat_ranges) - 1].voltage)
++		return 100;
++
++	if (reg < vbat_ranges[0].voltage)
++		return 0;
++
++	for (i = 0; i < ARRAY_SIZE(vbat_ranges); i++ )
++		if (vbat_ranges[i].voltage == reg) {
++			pr_debug("%s: voltage = %d, percentage = %d\n",
++				__FUNCTION__, vbat_ranges[i].voltage,
++				vbat_ranges[i].percentage);
++			return vbat_ranges[i].percentage;
++		}
++
++	return 0;
++}
++
+ static int da9030_battery_get_property(struct power_supply *psy,
+ 				   enum power_supply_property psp,
+ 				   union power_supply_propval *val)
+@@ -365,6 +457,9 @@ static int da9030_battery_get_property(struct power_supply *psy,
+ 		val->intval =
+ 			da9030_reg_to_mA(charger->adc.ichaverage_res) * 1000;
+ 		break;
++	case POWER_SUPPLY_PROP_CAPACITY:
++		val->intval = vbat_interpolate(charger->adc.vbat_res);
++		break;
+ 	case POWER_SUPPLY_PROP_MODEL_NAME:
+ 		val->strval = charger->battery_info->name;
+ 		break;
+diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
+index 6375b4e..8734045 100644
+--- a/sound/soc/pxa/Kconfig
++++ b/sound/soc/pxa/Kconfig
+@@ -90,7 +90,8 @@ config SND_PXA2XX_SOC_E800
+ 
+ config SND_PXA2XX_SOC_EM_X270
+ 	tristate "SoC Audio support for CompuLab EM-x270, eXeda and CM-X300"
+-	depends on SND_PXA2XX_SOC && MACH_EM_X270
++	depends on SND_PXA2XX_SOC && (MACH_EM_X270 || MACH_EXEDA || \
++			MACH_CM_X300)
+ 	select SND_PXA2XX_SOC_AC97
+ 	select SND_SOC_WM9712
+ 	help
+diff --git a/sound/soc/pxa/em-x270.c b/sound/soc/pxa/em-x270.c
+index f4756e4..9dab379 100644
+--- a/sound/soc/pxa/em-x270.c
++++ b/sound/soc/pxa/em-x270.c
+@@ -51,7 +51,6 @@ static struct snd_soc_dai_link em_x270_dai[] = {
+ };
+ 
+ static struct snd_soc_card em_x270 = {
+-	.name = "EM-X270",
+ 	.platform = &pxa2xx_soc_platform,
+ 	.dai_link = em_x270_dai,
+ 	.num_links = ARRAY_SIZE(em_x270_dai),
+@@ -68,8 +67,13 @@ static int __init em_x270_init(void)
+ {
+ 	int ret;
+ 
+-	if (!(machine_is_em_x270() || machine_is_exeda()
+-	      || machine_is_cm_x300()))
++	if (machine_is_em_x270())
++		em_x270.name = "EM-X270";
++	else if (machine_is_exeda())
++		em_x270.name = "EXEDA";
++	else if (machine_is_cm_x300())
++		em_x270.name = "CM-X300";
++	else
+ 		return -ENODEV;
+ 
+ 	em_x270_snd_device = platform_device_alloc("soc-audio", -1);
diff --git a/recipes/linux/linux_2.6.31.bb b/recipes/linux/linux_2.6.31.bb
index 9833b32..638622d 100644
--- a/recipes/linux/linux_2.6.31.bb
+++ b/recipes/linux/linux_2.6.31.bb
@@ -12,6 +12,7 @@ DEFAULT_PREFERENCE_db1200 = "1"
 DEFAULT_PREFERENCE_qemumips = "1"
 DEFAULT_PREFERENCE_qemux86 = "1"
 DEFAULT_PREFERENCE_iei-nanogx-466 = "1"
+DEFAULT_PREFERENCE_cm-x300 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.12.bz2;patch=1;name=stablepatch \
@@ -66,6 +67,10 @@ SRC_URI_append_ep93xx = " \
            file://edb9301-fix-machine-id.patch;patch=1 \
            "
 
+SRC_URI_append_cm-x300 = "\
+           file://linux-2.6.31-cm-x300.patch;patch=1 \
+           "
+
 do_devicetree_image_append_boc01() {
 	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree.v1 ${KERNEL_DEVICETREE}.v1
 	install -m 0644 devicetree.v1 ${D}/boot/devicetree-${KERNEL_VERSION}.v1
-- 
1.5.6.5



