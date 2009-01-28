Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LS8fx-0002mS-I9
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jan 2009 12:33:45 +0100
Received: by fk-out-0910.google.com with SMTP id f40so3848575fka.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2009 03:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=kUtLnPrr6qoaGnMw9fOXWPCbxqaBBk6D+29wOxO1BeY=;
	b=K2JunIe2+sYAJf4Qo0GImyKwuBWxMr1m7xyc3Ur8+xvinuRdUPRRg8USnUhtcuZC/b
	68Q9mmOiSv2Nx6vhWrccJBaGG8t/WsAnhcIsEgKoRwtKX60wZVCr/sHfNyA4KQMZhGr4
	di3+kmr3nbXKZEXjHJNesBNY0e/taW2gofh8Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=KbHJIDxOFTe0jFzY2D8CuJWeABFi3updirVsC2tMC00TrzkNdAcrzesTS7SyYzgu5A
	1/hkAJMMnRtMxOwqvfZ3D9ZsXlR9eeDQLyGk+As5YmmrRWtXErj3UHfNQlmKuTF0kBAK
	Ls1OGABUZjwuORVwF2p97/3Wl+mWOxY31I3TE=
Received: by 10.223.108.196 with SMTP id g4mr3496238fap.36.1233141969214;
	Wed, 28 Jan 2009 03:26:09 -0800 (PST)
Received: from ?10.6.9.10? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id x6sm2854661gvf.12.2009.01.28.03.26.02
	(version=SSLv3 cipher=RC4-MD5); Wed, 28 Jan 2009 03:26:08 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jan 2009 13:26:01 +0200
Message-Id: <1233141961.18907.3.camel@EPBYMINW0568>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: [PATCH] Added base pnx833x stb225 board support.
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
X-List-Received-Date: Wed, 28 Jan 2009 11:33:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This patch adds support for PNX833X STB225 board with some kernel
patches: serial UART, Ethernet, and basic processor flavor
functionality.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/machine/stb225.conf                           |    8 +
 packages/linux/linux-2.6.28/stb225/defconfig       | 1247 ++++++++++++++++
 packages/linux/linux-2.6.28/stb225/ebase-fix.patch |   37 +
 .../linux/linux-2.6.28/stb225/enable-uart.patch    |   13 +
 packages/linux/linux-2.6.28/stb225/ip3902.patch    | 1549 ++++++++++++++++++++
 packages/linux/linux_2.6.28.bb                     |    6 +
 6 files changed, 2860 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/stb225.conf
 create mode 100644 packages/linux/linux-2.6.28/stb225/defconfig
 create mode 100644 packages/linux/linux-2.6.28/stb225/ebase-fix.patch
 create mode 100644 packages/linux/linux-2.6.28/stb225/enable-uart.patch
 create mode 100644 packages/linux/linux-2.6.28/stb225/ip3902.patch

diff --git a/conf/machine/stb225.conf b/conf/machine/stb225.conf
new file mode 100644
index 0000000..97370e1
--- /dev/null
+++ b/conf/machine/stb225.conf
@@ -0,0 +1,8 @@
+# PNX8335 STB225 board
+TARGET_ARCH = "mipsel"
+TARGET_CC_ARCH="-march=mips32"
+MACHINE_FEATURES = "kernel26"
+IMAGE_FSTYPES="tar.gz"
+PREFERRED_PROVIDER_virtual/kernel="linux"
+KERNEL_IMAGETYPE="vmlinux"
+KERNEL_OUTPUT="${KERNEL_IMAGETYPE}"
diff --git a/packages/linux/linux-2.6.28/stb225/defconfig b/packages/linux/linux-2.6.28/stb225/defconfig
new file mode 100644
index 0000000..fe27cef
--- /dev/null
+++ b/packages/linux/linux-2.6.28/stb225/defconfig
@@ -0,0 +1,1247 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.29-rc1
+# Fri Jan 16 20:04:29 2009
+#
+CONFIG_MIPS=y
+
+#
+# Machine selection
+#
+# CONFIG_MACH_ALCHEMY is not set
+# CONFIG_BASLER_EXCITE is not set
+# CONFIG_BCM47XX is not set
+# CONFIG_MIPS_COBALT is not set
+# CONFIG_MACH_DECSTATION is not set
+# CONFIG_MACH_JAZZ is not set
+# CONFIG_LASAT is not set
+# CONFIG_LEMOTE_FULONG is not set
+# CONFIG_MIPS_MALTA is not set
+# CONFIG_MIPS_SIM is not set
+# CONFIG_MACH_EMMA is not set
+# CONFIG_MACH_VR41XX is not set
+# CONFIG_NXP_STB220 is not set
+CONFIG_NXP_STB225=y
+# CONFIG_PNX8550_JBS is not set
+# CONFIG_PNX8550_STB810 is not set
+# CONFIG_PMC_MSP is not set
+# CONFIG_PMC_YOSEMITE is not set
+# CONFIG_SGI_IP22 is not set
+# CONFIG_SGI_IP27 is not set
+# CONFIG_SGI_IP28 is not set
+# CONFIG_SGI_IP32 is not set
+# CONFIG_SIBYTE_CRHINE is not set
+# CONFIG_SIBYTE_CARMEL is not set
+# CONFIG_SIBYTE_CRHONE is not set
+# CONFIG_SIBYTE_RHONE is not set
+# CONFIG_SIBYTE_SWARM is not set
+# CONFIG_SIBYTE_LITTLESUR is not set
+# CONFIG_SIBYTE_SENTOSA is not set
+# CONFIG_SIBYTE_BIGSUR is not set
+# CONFIG_SNI_RM is not set
+# CONFIG_MACH_TX39XX is not set
+# CONFIG_MACH_TX49XX is not set
+# CONFIG_MIKROTIK_RB532 is not set
+# CONFIG_WR_PPMC is not set
+# CONFIG_CAVIUM_OCTEON_SIMULATOR is not set
+# CONFIG_CAVIUM_OCTEON_REFERENCE_BOARD is not set
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_ARCH_SUPPORTS_OPROFILE=y
+CONFIG_GENERIC_FIND_NEXT_BIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CMOS_UPDATE=y
+CONFIG_SCHED_OMIT_FRAME_POINTER=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_CEVT_R4K_LIB=y
+CONFIG_CEVT_R4K=y
+CONFIG_CSRC_R4K_LIB=y
+CONFIG_CSRC_R4K=y
+CONFIG_DMA_NONCOHERENT=y
+CONFIG_DMA_NEED_PCI_MAP_STATE=y
+# CONFIG_HOTPLUG_CPU is not set
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_GPIO=y
+# CONFIG_CPU_BIG_ENDIAN is not set
+CONFIG_CPU_LITTLE_ENDIAN=y
+CONFIG_SYS_SUPPORTS_BIG_ENDIAN=y
+CONFIG_SYS_SUPPORTS_LITTLE_ENDIAN=y
+CONFIG_IRQ_CPU=y
+CONFIG_SOC_PNX833X=y
+CONFIG_SOC_PNX8335=y
+CONFIG_MIPS_L1_CACHE_SHIFT=5
+
+#
+# CPU selection
+#
+# CONFIG_CPU_LOONGSON2 is not set
+# CONFIG_CPU_MIPS32_R1 is not set
+CONFIG_CPU_MIPS32_R2=y
+# CONFIG_CPU_MIPS64_R1 is not set
+# CONFIG_CPU_MIPS64_R2 is not set
+# CONFIG_CPU_R3000 is not set
+# CONFIG_CPU_TX39XX is not set
+# CONFIG_CPU_VR41XX is not set
+# CONFIG_CPU_R4300 is not set
+# CONFIG_CPU_R4X00 is not set
+# CONFIG_CPU_TX49XX is not set
+# CONFIG_CPU_R5000 is not set
+# CONFIG_CPU_R5432 is not set
+# CONFIG_CPU_R5500 is not set
+# CONFIG_CPU_R6000 is not set
+# CONFIG_CPU_NEVADA is not set
+# CONFIG_CPU_R8000 is not set
+# CONFIG_CPU_R10000 is not set
+# CONFIG_CPU_RM7000 is not set
+# CONFIG_CPU_RM9000 is not set
+# CONFIG_CPU_SB1 is not set
+# CONFIG_CPU_CAVIUM_OCTEON is not set
+CONFIG_SYS_HAS_CPU_MIPS32_R2=y
+CONFIG_CPU_MIPS32=y
+CONFIG_CPU_MIPSR2=y
+CONFIG_SYS_SUPPORTS_32BIT_KERNEL=y
+CONFIG_CPU_SUPPORTS_32BIT_KERNEL=y
+CONFIG_HARDWARE_WATCHPOINTS=y
+
+#
+# Kernel type
+#
+CONFIG_32BIT=y
+# CONFIG_64BIT is not set
+CONFIG_PAGE_SIZE_4KB=y
+# CONFIG_PAGE_SIZE_8KB is not set
+# CONFIG_PAGE_SIZE_16KB is not set
+# CONFIG_PAGE_SIZE_64KB is not set
+CONFIG_CPU_HAS_PREFETCH=y
+CONFIG_MIPS_MT_DISABLED=y
+# CONFIG_MIPS_MT_SMP is not set
+# CONFIG_MIPS_MT_SMTC is not set
+CONFIG_CPU_HAS_LLSC=y
+CONFIG_CPU_MIPSR2_IRQ_VI=y
+CONFIG_CPU_HAS_SYNC=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_CPU_SUPPORTS_HIGHMEM=y
+CONFIG_ARCH_FLATMEM_ENABLE=y
+CONFIG_ARCH_POPULATES_NODE_MAP=y
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+CONFIG_UNEVICTABLE_LRU=y
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+# CONFIG_HZ_48 is not set
+# CONFIG_HZ_100 is not set
+CONFIG_HZ_128=y
+# CONFIG_HZ_250 is not set
+# CONFIG_HZ_256 is not set
+# CONFIG_HZ_1000 is not set
+# CONFIG_HZ_1024 is not set
+CONFIG_SYS_SUPPORTS_ARBIT_HZ=y
+CONFIG_HZ=128
+# CONFIG_PREEMPT_NONE is not set
+CONFIG_PREEMPT_VOLUNTARY=y
+# CONFIG_PREEMPT is not set
+# CONFIG_KEXEC is not set
+# CONFIG_SECCOMP is not set
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_GROUP_SCHED is not set
+
+#
+# Control Group support
+#
+# CONFIG_CGROUPS is not set
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_BLK_DEV_INITRD is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_EMBEDDED=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_PCSPKR_PLATFORM=y
+CONFIG_COMPAT_BRK=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_ANON_INODES=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+# CONFIG_IOSCHED_AS is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+# CONFIG_DEFAULT_AS is not set
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+CONFIG_CLASSIC_RCU=y
+# CONFIG_TREE_RCU is not set
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_PREEMPT_RCU_TRACE is not set
+CONFIG_FREEZER=y
+
+#
+# Bus options (PCI, PCMCIA, EISA, ISA, TC)
+#
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+CONFIG_MMU=y
+# CONFIG_PCCARD is not set
+
+#
+# Executable file formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_HAVE_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+CONFIG_TRAD_SIGNALS=y
+
+#
+# Power management options
+#
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=y
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_COMPAT_NET_DEV_OPS=y
+CONFIG_PACKET=y
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+# CONFIG_XFRM_USER is not set
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+# CONFIG_IP_PNP_BOOTP is not set
+# CONFIG_IP_PNP_RARP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_IP_MROUTE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+CONFIG_INET_AH=y
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+CONFIG_INET_XFRM_MODE_TRANSPORT=y
+CONFIG_INET_XFRM_MODE_TUNNEL=y
+CONFIG_INET_XFRM_MODE_BEET=y
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=y
+CONFIG_INET_TCP_DIAG=y
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
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+# CONFIG_PHONET is not set
+CONFIG_WIRELESS=y
+# CONFIG_CFG80211 is not set
+CONFIG_WIRELESS_OLD_REGULATORY=y
+# CONFIG_WIRELESS_EXT is not set
+# CONFIG_LIB80211 is not set
+# CONFIG_MAC80211 is not set
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
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
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
+CONFIG_MTD_CFI=y
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_GEN_PROBE=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+# CONFIG_MTD_CFI_NOSWAP is not set
+# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
+CONFIG_MTD_CFI_LE_BYTE_SWAP=y
+CONFIG_MTD_CFI_GEOMETRY=y
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
+# CONFIG_MTD_OTP is not set
+# CONFIG_MTD_CFI_INTELEXT is not set
+CONFIG_MTD_CFI_AMDSTD=y
+# CONFIG_MTD_CFI_STAA is not set
+CONFIG_MTD_CFI_UTIL=y
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+CONFIG_MTD_PHYSMAP=y
+# CONFIG_MTD_PHYSMAP_COMPAT is not set
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
+# CONFIG_MTD_NAND is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+# CONFIG_MTD_QINFO_PROBE is not set
+
+#
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_BLK_DEV_HD is not set
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
+
+#
+# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
+#
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
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+# CONFIG_SCSI_LOWLEVEL is not set
+# CONFIG_SCSI_DH is not set
+CONFIG_ATA=y
+# CONFIG_ATA_NONSTANDARD is not set
+CONFIG_SATA_PMP=y
+CONFIG_ATA_SFF=y
+# CONFIG_SATA_MV is not set
+# CONFIG_PATA_PLATFORM is not set
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
+# CONFIG_DM9000 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+CONFIG_IP3902=y
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
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
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
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+
+#
+# Userland interfaces
+#
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=m
+CONFIG_INPUT_EVBUG=m
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
+CONFIG_SERIO=y
+# CONFIG_SERIO_I8042 is not set
+CONFIG_SERIO_SERPORT=y
+# CONFIG_SERIO_LIBPS2 is not set
+# CONFIG_SERIO_RAW is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+# CONFIG_VT_CONSOLE is not set
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
+CONFIG_SERIAL_PNX8XXX=y
+CONFIG_SERIAL_PNX8XXX_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
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
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+# CONFIG_SPI is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
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
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_REGULATOR is not set
+
+#
+# Multimedia devices
+#
+
+#
+# Multimedia core support
+#
+# CONFIG_VIDEO_DEV is not set
+CONFIG_DVB_CORE=y
+CONFIG_VIDEO_MEDIA=y
+
+#
+# Multimedia drivers
+#
+# CONFIG_MEDIA_ATTACH is not set
+CONFIG_MEDIA_TUNER=y
+# CONFIG_MEDIA_TUNER_CUSTOMIZE is not set
+CONFIG_MEDIA_TUNER_SIMPLE=y
+CONFIG_MEDIA_TUNER_TDA8290=y
+CONFIG_MEDIA_TUNER_TDA9887=y
+CONFIG_MEDIA_TUNER_TEA5761=y
+CONFIG_MEDIA_TUNER_TEA5767=y
+CONFIG_MEDIA_TUNER_MT20XX=y
+CONFIG_MEDIA_TUNER_XC2028=y
+CONFIG_MEDIA_TUNER_XC5000=y
+# CONFIG_DVB_DYNAMIC_MINORS is not set
+CONFIG_DVB_CAPTURE_DRIVERS=y
+# CONFIG_TTPCI_EEPROM is not set
+# CONFIG_DVB_B2C2_FLEXCOP is not set
+
+#
+# Supported DVB Frontends
+#
+
+#
+# Customise DVB Frontends
+#
+# CONFIG_DVB_FE_CUSTOMISE is not set
+
+#
+# Multistandard (satellite) frontends
+#
+# CONFIG_DVB_STB0899 is not set
+# CONFIG_DVB_STB6100 is not set
+
+#
+# DVB-S (satellite) frontends
+#
+# CONFIG_DVB_CX24110 is not set
+# CONFIG_DVB_CX24123 is not set
+# CONFIG_DVB_MT312 is not set
+# CONFIG_DVB_S5H1420 is not set
+# CONFIG_DVB_STV0288 is not set
+# CONFIG_DVB_STB6000 is not set
+# CONFIG_DVB_STV0299 is not set
+# CONFIG_DVB_TDA8083 is not set
+# CONFIG_DVB_TDA10086 is not set
+# CONFIG_DVB_TDA8261 is not set
+# CONFIG_DVB_VES1X93 is not set
+# CONFIG_DVB_TUNER_ITD1000 is not set
+# CONFIG_DVB_TUNER_CX24113 is not set
+# CONFIG_DVB_TDA826X is not set
+# CONFIG_DVB_TUA6100 is not set
+# CONFIG_DVB_CX24116 is not set
+# CONFIG_DVB_SI21XX is not set
+
+#
+# DVB-T (terrestrial) frontends
+#
+# CONFIG_DVB_SP8870 is not set
+# CONFIG_DVB_SP887X is not set
+# CONFIG_DVB_CX22700 is not set
+# CONFIG_DVB_CX22702 is not set
+# CONFIG_DVB_DRX397XD is not set
+# CONFIG_DVB_L64781 is not set
+CONFIG_DVB_TDA1004X=y
+# CONFIG_DVB_NXT6000 is not set
+# CONFIG_DVB_MT352 is not set
+# CONFIG_DVB_ZL10353 is not set
+# CONFIG_DVB_DIB3000MB is not set
+# CONFIG_DVB_DIB3000MC is not set
+# CONFIG_DVB_DIB7000M is not set
+# CONFIG_DVB_DIB7000P is not set
+# CONFIG_DVB_TDA10048 is not set
+
+#
+# DVB-C (cable) frontends
+#
+# CONFIG_DVB_VES1820 is not set
+# CONFIG_DVB_TDA10021 is not set
+# CONFIG_DVB_TDA10023 is not set
+# CONFIG_DVB_STV0297 is not set
+
+#
+# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
+#
+# CONFIG_DVB_NXT200X is not set
+# CONFIG_DVB_OR51211 is not set
+# CONFIG_DVB_OR51132 is not set
+# CONFIG_DVB_BCM3510 is not set
+# CONFIG_DVB_LGDT330X is not set
+# CONFIG_DVB_LGDT3304 is not set
+# CONFIG_DVB_S5H1409 is not set
+# CONFIG_DVB_AU8522 is not set
+# CONFIG_DVB_S5H1411 is not set
+
+#
+# ISDB-T (terrestrial) frontends
+#
+# CONFIG_DVB_S921 is not set
+
+#
+# Digital terrestrial only tuners/PLL
+#
+# CONFIG_DVB_PLL is not set
+# CONFIG_DVB_TUNER_DIB0070 is not set
+
+#
+# SEC control devices for DVB-S
+#
+# CONFIG_DVB_LNBP21 is not set
+# CONFIG_DVB_ISL6405 is not set
+# CONFIG_DVB_ISL6421 is not set
+# CONFIG_DVB_LGS8GL5 is not set
+
+#
+# Tools to develop new frontends
+#
+# CONFIG_DVB_DUMMY_FE is not set
+# CONFIG_DVB_AF9013 is not set
+# CONFIG_DAB is not set
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
+CONFIG_FB_STB225_FB=y
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
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
+CONFIG_DUMMY_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE is not set
+# CONFIG_LOGO is not set
+CONFIG_SOUND=m
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+CONFIG_SND_SEQUENCER=m
+# CONFIG_SND_SEQ_DUMMY is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_PCM_OSS_PLUGINS=y
+CONFIG_SND_SEQUENCER_OSS=y
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+CONFIG_SND_VERBOSE_PRINTK=y
+CONFIG_SND_DEBUG=y
+# CONFIG_SND_DEBUG_VERBOSE is not set
+# CONFIG_SND_PCM_XRUN_DEBUG is not set
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_VIRMIDI is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+CONFIG_SND_MIPS=y
+# CONFIG_SND_SOC is not set
+# CONFIG_SOUND_PRIME is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+# CONFIG_HID_PID is not set
+
+#
+# Special HID drivers
+#
+CONFIG_HID_COMPAT=y
+CONFIG_USB_SUPPORT=y
+# CONFIG_USB_ARCH_HAS_HCD is not set
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+
+#
+# Enable Host or Gadget support to see Inventra options
+#
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed;
+#
+# CONFIG_USB_GADGET is not set
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_RTC_LIB=y
+# CONFIG_RTC_CLASS is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=m
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+# CONFIG_EXT3_FS is not set
+# CONFIG_EXT4_FS is not set
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+CONFIG_FILE_LOCKING=y
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
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
+CONFIG_FAT_FS=m
+CONFIG_MSDOS_FS=m
+CONFIG_VFAT_FS=m
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+# CONFIG_PROC_KCORE is not set
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
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
+# CONFIG_JFFS2_SUMMARY is not set
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+# CONFIG_NFS_V4 is not set
+CONFIG_ROOT_NFS=y
+CONFIG_NFSD=m
+CONFIG_NFSD_V3=y
+# CONFIG_NFSD_V3_ACL is not set
+# CONFIG_NFSD_V4 is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_EXPORTFS=m
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+# CONFIG_SUNRPC_REGISTER_V4 is not set
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
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=y
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=m
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_850=m
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
+CONFIG_NLS_CODEPAGE_932=m
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+CONFIG_NLS_ASCII=m
+CONFIG_NLS_ISO8859_1=m
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+CONFIG_NLS_ISO8859_15=m
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+CONFIG_NLS_UTF8=m
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+
+#
+# Tracers
+#
+# CONFIG_DYNAMIC_PRINTK_DEBUG is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+CONFIG_CMDLINE=""
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
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
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
+CONFIG_CRYPTO_HMAC=y
+# CONFIG_CRYPTO_XCBC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_MD4 is not set
+CONFIG_CRYPTO_MD5=y
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=y
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
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_HW=y
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+# CONFIG_CRC_CCITT is not set
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_PLIST=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
diff --git a/packages/linux/linux-2.6.28/stb225/ebase-fix.patch b/packages/linux/linux-2.6.28/stb225/ebase-fix.patch
new file mode 100644
index 0000000..bdd82ac
--- /dev/null
+++ b/packages/linux/linux-2.6.28/stb225/ebase-fix.patch
@@ -0,0 +1,37 @@
+diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
+index f6083c6..b3bcd3a 100644
+--- a/arch/mips/kernel/traps.c
++++ b/arch/mips/kernel/traps.c
+@@ -1592,8 +1592,6 @@ void __cpuinit set_uncached_handler(unsigned long offset, void *addr,
+ #ifdef CONFIG_64BIT
+ 	unsigned long uncached_ebase = TO_UNCAC(ebase);
+ #endif
+-	if (cpu_has_mips_r2)
+-		ebase += (read_c0_ebase() & 0x3ffff000);
+ 
+ 	if (!addr)
+ 		panic(panic_null_cerr);
+@@ -1629,8 +1627,6 @@ void __init trap_init(void)
+ 		ebase = (unsigned long) alloc_bootmem_low_pages(0x200 + VECTORSPACING*64);
+ 	else {
+ 		ebase = CAC_BASE;
+-		if (cpu_has_mips_r2)
+-			ebase += (read_c0_ebase() & 0x3ffff000);
+ 	}
+ 
+ 	per_cpu_trap_init();
+@@ -1739,11 +1735,11 @@ void __init trap_init(void)
+ 
+ 	if (cpu_has_vce)
+ 		/* Special exception: R4[04]00 uses also the divec space. */
+-		memcpy((void *)(ebase + 0x180), &except_vec3_r4000, 0x100);
++		memcpy((void *)(CAC_BASE + 0x180), &except_vec3_r4000, 0x100);
+ 	else if (cpu_has_4kex)
+-		memcpy((void *)(ebase + 0x180), &except_vec3_generic, 0x80);
++		memcpy((void *)(CAC_BASE + 0x180), &except_vec3_generic, 0x80);
+ 	else
+-		memcpy((void *)(ebase + 0x080), &except_vec3_generic, 0x80);
++		memcpy((void *)(CAC_BASE + 0x080), &except_vec3_generic, 0x80);
+ 
+ 	signal_init();
+ #ifdef CONFIG_MIPS32_COMPAT
diff --git a/packages/linux/linux-2.6.28/stb225/enable-uart.patch b/packages/linux/linux-2.6.28/stb225/enable-uart.patch
new file mode 100644
index 0000000..e7bb034
--- /dev/null
+++ b/packages/linux/linux-2.6.28/stb225/enable-uart.patch
@@ -0,0 +1,13 @@
+diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
+index 3e525e3..91d4470 100644
+--- a/drivers/serial/Kconfig
++++ b/drivers/serial/Kconfig
+@@ -982,7 +982,7 @@ config SERIAL_SH_SCI_CONSOLE
+ 
+ config SERIAL_PNX8XXX
+ 	bool "Enable PNX8XXX SoCs' UART Support"
+-	depends on MIPS && SOC_PNX8550
++	depends on MIPS && (SOC_PNX8550 || SOC_PNX833X)
+ 	select SERIAL_CORE
+ 	help
+ 	  If you have a MIPS-based Philips SoC such as PNX8550 or PNX8330
diff --git a/packages/linux/linux-2.6.28/stb225/ip3902.patch b/packages/linux/linux-2.6.28/stb225/ip3902.patch
new file mode 100644
index 0000000..3f911b6
--- /dev/null
+++ b/packages/linux/linux-2.6.28/stb225/ip3902.patch
@@ -0,0 +1,1549 @@
+diff -urN --exclude=.svn linux-2.6.26-rc4.orig/drivers/net/ip3902.c linux-2.6.26-rc4/drivers/net/ip3902.c
+--- linux-2.6.26-rc4.orig/drivers/net/ip3902.c	1970-01-01
+01:00:00.000000000 +0100
++++ linux-2.6.26-rc4/drivers/net/ip3902.c	2008-06-06 11:29:24.000000000 +0100
+@@ -0,0 +1,1510 @@
++/*
++ *  ip3902.c: NXP ip3902 embedded 10/100 Ethernet controller support
++ *  Copyright 2008 NXP Semiconductors
++ *	  Chris Steel <chris.steel@nxp.com>
++ *    Daniel Laird <daniel.j.laird@nxp.com>
++ *
++ *  Based on ax88796.c, by Ben Dooks.
++ *	Based on previous ip3902.c by Nikita V. Youshchenko
++ *
++ *  This program is free software; you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation; either version 2 of the License, or
++ *  (at your option) any later version.
++ *
++ *  This program is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with this program; if not, write to the Free Software
++ *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/errno.h>
++#include <linux/isapnp.h>
++#include <linux/init.h>
++#include <linux/interrupt.h>
++#include <linux/platform_device.h>
++#include <linux/delay.h>
++#include <linux/timer.h>
++#include <linux/netdevice.h>
++#include <linux/etherdevice.h>
++#include <linux/ethtool.h>
++#include <linux/mii.h>
++#include <linux/crc32.h>
++#include <linux/inet_lro.h>
++#include <asm/system.h>
++#include <linux/io.h>
++
++#define DRVNAME "ip3902-eth"
++#define DRVVERSION "1.00"
++
++/* "Strange hardware" support macros */
++
++/* These control endianness of descriptors and statuses.
++ * If none if LITTLE_ENDIAN_xxx and BIG_ENDIAN_xxx is defined, system endian
++ * is used for xxx */
++#define LITTLE_ENDIAN_DESCRIPTORS
++#undef BIG_ENDIAN_DESCRIPTORS
++#undef LITTLE_ENDIAN_STATUSES
++#define BIG_ENDIAN_STATUSES
++
++#define ETH_RX_SKB_SIZE        0x600   /* 1536 bytes, just over max mtu */
++#define TX_RING_SIZE           64
++#define RX_RING_SIZE           64
++#define IP3902_NAPI_WEIGHT     48
++#define MAX_LRO_DESCRIPTORS    6
++#define LRO_THRESHOLD          3
++
++#define BYTES_IN_ETHERNET_CRC   4
++#define MAX_DESCS_PER_SKB      (MAX_SKB_FRAGS + 1)
++
++#define NEXT_TX(i) (((i) == TX_RING_SIZE-1) ? 0 : (i)+1)
++#define NEXT_RX(i) (((i) == RX_RING_SIZE-1) ? 0 : (i)+1)
++
++/* Access to IP3902 registers */
++
++/* Alcatel (Packet Engines) core registers */
++#define MAC1_REG		0x000	/* R/W: MAC configuration register 1 */
++#define MAC2_REG		0x004	/* R/W: MAC configuration register 2 */
++#define IPGT_REG		0x008	/* R/W: Back-to-Back Inter-Packet-Gap register */
++#define IPGR_REG		0x00c	/* R/W: Non Back-to-Back Inter-Packet-Gap register */
++#define CLRT_REG		0x010	/* R/W: Collision window / Retry register */
++#define MAXF_REG		0x014	/* R/W: Maximum Frame register */
++#define SUPP_REG		0x018	/* R/W: PHY Support register */
++#define TEST_REG		0x01C	/* R/W: Test register */
++#define MCFG_REG		0x020	/* R/W: MII Mgmt Con???guration register */
++#define MCMD_REG		0x024	/* R/W: MII Mgmt Command register */
++#define MADR_REG		0x028	/* R/W: MII Mgmt Address register */
++#define MWTD_REG		0x02C	/* WO:  MII Mgmt Write Data register */
++#define MRDD_REG		0x030	/* RO:  MII Mgmt Read Data register */
++#define MIND_REG		0x034	/* RO:  MII Mgmt Indicators register */
++#define SA0_REG			0x040	/* R/W: Station Address 0 register */
++#define SA1_REG			0x044	/* R/W: Station Address 1 register */
++#define SA2_REG			0x048	/* R/W: Station Address 2 register */
++
++/* Control registers */
++#define COMMAND_REG		0x100	/* R/W: Command register */
++#define STATUS_REG		0x104	/* RO:  Status register */
++#define RX_DESC_REG		0x108	/* R/W: Receive descriptor base address register */
++#define RX_STATUS_REG		0x10C	/* R/W: Receive status base address register */
++#define RX_DESC_NUMBER_REG	0x110	/* R/W: Receive number of descriptors register */
++#define RX_PRODUCE_INDEX_REG	0x114	/* RO:  Receive produce index register */
++#define RX_CONSUME_INDEX_REG	0x118	/* R/W: Receive consume index register */
++#define TX_DESC_REG		0x11C	/* R/W: Non real-time transmit descriptor base address register */
++#define TX_STATUS_REG		0x120	/* R/W: Non real-time transmit status base address register */
++#define TX_DESC_NUMBER_REG	0x124	/* R/W: Non real-time transmit number of descriptors register */
++#define TX_PRODUCE_INDEX_REG	0x128	/* R/W: Non real-time transmit produce index register */
++#define TX_CONSUME_INDEX_REG	0x12C	/* RO:  Non real-time transmit consume index register */
++#define TX_RT_DESC_REG		0x130	/* R/W: Real-time transmit descriptor base address register */
++#define TX_RT_STATUS_REG	0x134	/* R/W: Real-time transmit status base address register */
++#define TX_RT_DESC_NUMBER_REG	0x138	/* R/W: Real-time transmit number of descriptors register */
++#define TX_RT_PRODUCE_INDEX_REG	0x13C	/* R/W: Real-time transmit produce index register */
++#define TX_RT_CONSUME_INDEX_REG	0x140	/* RO:  Real-time transmit consume index register */
++#define QOS_TIMEOUT_REG		0x148	/* R/W: Transmit quality of service time-out register */
++#define TSV0_REG		0x158	/* RO:  Transmit status vector 0 register */
++#define TSV1_REG		0x15C	/* RO:  Transmit status vector 1 register */
++#define RSV_REG			0x160	/* RO:  Receive status vector register */
++#define FC_COUNTER_REG		0x170	/* R/W: Flow control counter register */
++#define FC_STATUS_REG		0x174	/* RO:  Flow control status register */
++
++/* Rx filter registers */
++#define FILTER_CTRL_REG		0x200	/* R/W: Receive filter control register */
++#define FILTER_WOL_STATUS_REG	0x204	/* RO:  Receive filter WoL status register */
++#define FILTER_WOL_CLEAR_REG	0x208	/* WO:  Receive filter WoL clear register */
++#define HASH_FILTER_L_REG	0x210	/* R/W: Hash filter table LSBs register */
++#define HASH_FILTER_H_REG	0x214	/* R/W: Hash filter table MSBs register */
++
++/* DVP Standard registers */
++#define INT_STATUS_REG		0xFE0	/* RO:  Interrupt status register */
++#define INT_ENABLE_REG		0xFE4	/* R/W: Interrupt enable register */
++#define INT_CLEAR_REG		0xFE8	/* WO:  Interrupt clear register */
++#define INT_SET_REG		0xFEC	/* WO:  Interrupt set register */
++#define POWERDOWN_REG		0xFF4	/* R/W: Power-down register */
++#define MODULE_ID_REG		0xFFC	/* RO:  Module ID register */
++
++/* Bits for MAC1 register */
++#define MAC1_SOFT_RESET		(1 << 15)
++#define MAC1_TX_FLOW_CONTROL	(1 << 3)
++#define MAC1_RX_FLOW_CONTROL	(1 << 2)
++#define MAC1_RECEIVE_PASS_ALL	(1 << 1)
++#define MAC1_RECEIVE_ENABLE	(1 << 0)
++
++/* Bits for MAC2 register */
++#define MAC2_AUTO_DETECT_PAD_ENABLE	(1 << 7)
++#define MAC2_VLAN_PAD_ENABLE		(1 << 6)
++#define MAC2_PAD_CRC_ENABLE		(1 << 5)
++#define MAC2_CRC_ENABLE			(1 << 4)
++#define MAC2_FULL_DUPLEX		(1 << 0)
++
++#define INITIAL_MAC2	(MAC2_AUTO_DETECT_PAD_ENABLE | MAC2_VLAN_PAD_ENABLE | MAC2_PAD_CRC_ENABLE | MAC2_CRC_ENABLE)
++
++/* Recommended values for IPGT register (see sec. 3.3.2.3 0f datasheet */
++#define IPGT_FD_VALUE	0x15
++#define IPGT_HD_VALUE	0x12
++
++/* Bits for MCMD register */
++#define MCMD_READ		(1 << 0)
++
++/* Bits for MIND register */
++#define MIND_NOT_VALID		(1 << 2)
++#define MIND_BUSY		(1 << 0)
++
++/* Bits for command register */
++#define COMMAND_ENABLE_QOS	(1 << 11)
++#define COMMAND_FULL_DUPLEX	(1 << 10)
++#define COMMAND_RMII_MODE	(1 << 9)
++#define COMMAND_TX_FLOW_CONTROL	(1 << 8)
++#define COMMAND_PROMISC		(1 << 7)
++#define COMMAND_ALLOW_SHORT	(1 << 6)
++#define COMMAND_RX_RESET	(1 << 5)
++#define COMMAND_TX_RESET	(1 << 4)
++#define COMMAND_RESET		(1 << 3)
++#define COMMAND_TX_RT_ENABLE	(1 << 2)
++#define COMMAND_TX_ENABLE	(1 << 1)
++#define COMMAND_RX_ENABLE	(1 << 0)
++
++/* Bits for receive filter control register */
++#define FILTER_ACCEPT_SELF		(1 << 5)
++#define FILTER_ACCEPT_MCAST_HASH	(1 << 4)
++#define FILTER_ACCEPT_UCAST_HASH	(1 << 3)
++#define FILTER_ACCEPT_MCAST_ANY		(1 << 2)
++#define FILTER_ACCEPT_BCAST_ANY		(1 << 1)
++#define FILTER_ACCEPT_UCAST_ANY		(1 << 0)
++
++/* Bits for interrupt registers */
++#define WAKEUP_INT		(1 << 13)
++#define SOFT_INT		(1 << 12)
++#define TX_RT_DONE_INT		(1 << 11)
++#define TX_RT_FINISHED_INT	(1 << 10)
++#define TX_RT_ERROR_INT		(1 << 9)
++#define TX_RT_UNDERRUN_INT	(1 << 8)
++#define TX_DONE_INT		(1 << 7)
++#define TX_FINISHED_INT		(1 << 6)
++#define TX_ERROR_INT		(1 << 5)
++#define TX_UNDERRUN_INT		(1 << 4)
++#define RX_DONE_INT		(1 << 3)
++#define RX_FINISHED_INT		(1 << 2)
++#define RX_ERROR_INT		(1 << 1)
++#define RX_OVERRUN_INT		(1 << 0)
++
++/* Bit for POWERDOWN register */
++#define POWERDOWN_VALUE		(1 << 31)
++
++/* Bits for TX control */
++#define TX_CONTROL_INT		(1 << 31)
++#define TX_CONTROL_LAST		(1 << 30)
++#define TX_CONTROL_CRC		(1 << 29)
++#define TX_CONTROL_PAD		(1 << 28)
++#define TX_CONTROL_HUGE		(1 << 27)
++#define TX_CONTROL_OVERRIDE	(1 << 26)
++
++/* these flags used for non-last fragment of a frame */
++#define TX_CONTROL_ALL_NOTLAST	(TX_CONTROL_CRC | TX_CONTROL_PAD | TX_CONTROL_OVERRIDE)
++/* these flags used for last fragment of a frame, and for single-fragment
++ * frames */
++#define TX_CONTROL_ALL_LAST	(TX_CONTROL_ALL_NOTLAST | TX_CONTROL_LAST | TX_CONTROL_INT)
++
++/* Bits for TX status */
++#define TX_STATUS_ERROR			(1 << 31)
++#define TX_STATUS_UNDERRUN		(1 << 29)
++#define TX_STATUS_LATE_COLLISION	(1 << 28)
++#define TX_STATUS_MANY_COLLISIONS	(1 << 27)
++#define TX_STATUS_MANY_DEFER		(1 << 26)
++#define TX_STATUS_COLLISIONS(s)	((s >> 21) & 15)
++
++/* Bits for RX control */
++#define RX_CONTROL_INT		(1 << 31)
++
++/* Bits for RX status */
++#define RX_STATUS_ERROR			(1 << 31)
++#define RX_STATUS_LAST_FRAG		(1 << 30)
++#define RX_STATUS_OVERRUN		(1 << 28)
++#define RX_STATUS_ALIGNMENT_ERROR	(1 << 27)
++#define RX_STATUS_RANGE_ERROR		(1 << 26)
++#define RX_STATUS_LENGTH_ERROR		(1 << 25)
++#define RX_STATUS_SYMBOL_ERROR		(1 << 24)
++#define RX_STATUS_CRC_ERROR		(1 << 23)
++#define RX_STATUS_BROADCAST		(1 << 22)
++#define RX_STATUS_MULTICAST		(1 << 21)
++#define RX_STATUS_FAIL_FILTER		(1 << 20)
++#define RX_STATUS_VLAN			(1 << 19)
++#define RX_STATUS_CONTROL_FRAME		(1 << 18)
++#define RX_STATUS_LENGTH(s)		((s & 0x7ff) + 1)
++
++/* Bits for RSV register */
++#define RSV_VLAN			(1 << 30)
++#define RSV_CONTROL_FRAME		(1 << 27)
++#define RSV_DRIBBLE_NIBBLE		(1 << 26)
++#define RSV_BROADCAST			(1 << 25)
++#define RSV_MULTICAST			(1 << 24)
++#define RSV_LENGTH_OUT_OF_RANGE		(1 << 22)
++#define RSV_LENGTH_CHECK_ERROR		(1 << 21)
++#define RSV_CRC_ERROR			(1 << 20)
++#define RSV_RECEIVE_CODE_VIOLATION	(1 << 19)
++#define RSV_MASK			0xFFFF
++
++static char *mac_address;
++module_param(mac_address, charp, S_IRUGO);
++MODULE_PARM_DESC(mac_address, "MAC address of the device");
++
++
++/* device private data */
++struct ip3902_descriptor {
++	unsigned long address;
++	unsigned long control;
++};
++
++struct ip3902_rx_status {
++	unsigned long status;
++	unsigned long hash_crc;
++};
++
++struct ip3902_dma_struct {
++	struct ip3902_descriptor rx_desc[RX_RING_SIZE];
++	struct ip3902_rx_status rx_status[RX_RING_SIZE];
++	struct ip3902_descriptor tx_desc[TX_RING_SIZE];
++	unsigned long tx_status[TX_RING_SIZE];
++};
++
++struct ip3902_private {
++	spinlock_t      mii_lock;
++	struct mii_if_info  mii;
++	u32         msg_enable;
++
++	spinlock_t      lock;
++	struct net_device   *ndev;
++	struct platform_device  *pdev;
++	struct resource     *bus;
++	void __iomem        *mem;
++	struct napi_struct napi;
++
++	struct ip3902_dma_struct *ds;		/* descriptors and statuses */
++	dma_addr_t ds_dma;
++
++	struct sk_buff *rx_skb[RX_RING_SIZE];	/* where to recieve to */
++	struct sk_buff *tx_skb[TX_RING_SIZE];	/* where to send from */
++	bool tx_first_desc[TX_RING_SIZE];	/* true if this is the first desc of an skb */
++
++	int rx_next_allocate;			/* index in rx ring where skb should be allocated */
++	int rx_next_consume;			/* index in rx ring where data should be read when available */
++	int tx_next_produce;			/* index in tx ring where new data should be put */
++	int tx_next_deallocate;			/* index in tx ring of first not freed skb */
++
++#ifdef CONFIG_INET_LRO
++	bool                use_lro;
++	int                 lro_count;
++	struct net_lro_mgr  lro_mgr;
++	struct net_lro_desc lro_desc[MAX_LRO_DESCRIPTORS];
++	struct timer_list   lro_timer;
++#endif
++
++	unsigned char running;
++	unsigned char resume_open;
++
++};
++
++static inline unsigned long ip3902_read_reg(struct net_device *ndev, int reg)
++{
++	unsigned long value = readl((void * __iomem)(ndev->base_addr + reg));
++	return value;
++}
++
++static inline void ip3902_write_reg(struct net_device *ndev, int reg,
++									unsigned long val)
++{
++	writel(val, (void * __iomem)(ndev->base_addr + reg));
++}
++
++static inline void ip3902_write_tx_desc(struct ip3902_private *ip3902_priv, int pos, unsigned long address, unsigned long control)
++{
++#if defined(BIG_ENDIAN_DESCRIPTORS)
++	ip3902_priv->ds->tx_desc[pos].address = cpu_to_be32(address);
++	ip3902_priv->ds->tx_desc[pos].control = cpu_to_be32(control);
++#elif defined(LITTLE_ENDIAN_DESCRIPTORS)
++	ip3902_priv->ds->tx_desc[pos].address = cpu_to_le32(address);
++	ip3902_priv->ds->tx_desc[pos].control = cpu_to_le32(control);
++#else
++	ip3902_priv->ds->tx_desc[pos].address = address;
++	ip3902_priv->ds->tx_desc[pos].control = control;
++#endif
++	wmb();
++}
++
++static inline void ip3902_read_tx_desc(struct ip3902_private *ip3902_priv, int pos, dma_addr_t *address, int *length)
++{
++#if defined(BIG_ENDIAN_DESCRIPTORS)
++	*address = (dma_addr_t)be32_to_cpu(ip3902_priv->ds->tx_desc[pos].address);
++	*length  = (int)be32_to_cpu(ip3902_priv->ds->tx_desc[pos].control) & 0xffff;
++#elif defined(LITTLE_ENDIAN_DESCRIPTORS)
++	*address = (dma_addr_t)le32_to_cpu(ip3902_priv->ds->tx_desc[pos].address);
++	*length  = (int)le32_to_cpu(ip3902_priv->ds->tx_desc[pos].control) & 0xffff;
++#else
++	*address = (dma_addr_t)ip3902_priv->ds->tx_desc[pos].address;
++	*length  = (int)ip3902_priv->ds->tx_desc[pos].control & 0xffff;
++#endif
++}
++
++static inline unsigned long ip3902_read_tx_status(struct ip3902_private *ip3902_priv, int pos)
++{
++#if defined(BIG_ENDIAN_STATUSES)
++	return be32_to_cpu(ip3902_priv->ds->tx_status[pos]);
++#elif defined(LITTLE_ENDIAN_STATUSES)
++	return le32_to_cpu(ip3902_priv->ds->tx_status[pos]);
++#else
++	return ip3902_priv->ds->tx_status[pos];
++#endif
++}
++
++static inline void ip3902_write_rx_desc(struct ip3902_private *ip3902_priv, int pos, unsigned long address, unsigned long control)
++{
++#if defined(BIG_ENDIAN_DESCRIPTORS)
++	ip3902_priv->ds->rx_desc[pos].address = cpu_to_be32(address);
++	ip3902_priv->ds->rx_desc[pos].control = cpu_to_be32(control);
++#elif defined(LITTLE_ENDIAN_DESCRIPTORS)
++	ip3902_priv->ds->rx_desc[pos].address = cpu_to_le32(address);
++	ip3902_priv->ds->rx_desc[pos].control = cpu_to_le32(control);
++#else
++	ip3902_priv->ds->rx_desc[pos].address = address;
++	ip3902_priv->ds->rx_desc[pos].control = control;
++#endif
++	wmb();
++}
++
++static inline void ip3902_read_rx_desc(struct ip3902_private *ip3902_priv, int pos, dma_addr_t *address, int *length)
++{
++#if defined(BIG_ENDIAN_DESCRIPTORS)
++	*address = (dma_addr_t)be32_to_cpu(ip3902_priv->ds->rx_desc[pos].address);
++	*length  = (int)be32_to_cpu(ip3902_priv->ds->rx_desc[pos].control) & 0xffff;
++#elif defined(LITTLE_ENDIAN_DESCRIPTORS)
++	*address = (dma_addr_t)le32_to_cpu(ip3902_priv->ds->rx_desc[pos].address);
++	*length  = (int)le32_to_cpu(ip3902_priv->ds->rx_desc[pos].control) & 0xffff;
++#else
++	*address = (dma_addr_t)ip3902_priv->ds->rx_desc[pos].address;
++	*length  = (int)ip3902_priv->ds->rx_desc[pos].control & 0xffff;
++#endif
++}
++
++static inline unsigned long ip3902_read_rx_status(struct net_device *ndev, struct ip3902_private *ip3902_priv, int pos)
++{
++#if defined(BIG_ENDIAN_STATUSES)
++	return be32_to_cpu(ip3902_priv->ds->rx_status[pos].status);
++#elif defined(LITTLE_ENDIAN_STATUSES)
++	return le32_to_cpu(ip3902_priv->ds->rx_status[pos].status);
++#else
++	return ip3902_priv->ds->rx_status[pos].status;
++#endif
++}
++
++static inline void ip3902_write_madr_reg(struct net_device *ndev, int phy_id, int location)
++{
++	/* assume ranges of phy_id and location are correct - we set masks in
++	 * struct mii_if_info for that */
++
++	unsigned long val = (phy_id << 8) | location;
++	ip3902_write_reg(ndev, MADR_REG, val);
++}
++
++static inline int ip3902_wait_mdio_op_complete(struct net_device *ndev, unsigned long mask)
++{
++	int timeout = 10000;		/* to avoid hangup in case of unexpected badness ... */
++
++	while (--timeout > 0) {
++		if ((ip3902_read_reg(ndev, MIND_REG) & mask) == 0)
++			return 0;
++		udelay(1);
++	}
++
++	return -EIO;
++}
++
++static int ip3902_mdio_read(struct net_device *ndev, int phy_id, int location)
++{
++	ip3902_write_madr_reg(ndev, phy_id, location);
++	ip3902_write_reg(ndev, MCMD_REG, 0);
++	ip3902_write_reg(ndev, MCMD_REG, MCMD_READ);
++	if (ip3902_wait_mdio_op_complete(ndev, MIND_NOT_VALID | MIND_BUSY) < 0)
++		return 0;
++	else
++		return ip3902_read_reg(ndev, MRDD_REG) & 0xffff;
++}
++
++static void ip3902_mdio_write(struct net_device *ndev, int phy_id, int location, int val)
++{
++	ip3902_write_madr_reg(ndev, phy_id, location);
++	ip3902_write_reg(ndev, MWTD_REG, val & 0xffff);
++	ip3902_wait_mdio_op_complete(ndev, MIND_BUSY);
++}
++
++static inline int ip3902_nr_free_descs(int head, int tail, int size)
++{
++	int free;
++
++	if (head >= tail)
++		free = (tail + size) - head;
++	else
++		free = tail - head;
++
++	return free;
++}
++
++static void ip3902_eth_rx_refill_descs(struct net_device *ndev, struct ip3902_private *ip3902_priv)
++{
++	do {
++		int rx_index = ip3902_priv->rx_next_allocate;
++		struct sk_buff *skb = netdev_alloc_skb(ndev, ETH_RX_SKB_SIZE + dma_get_cache_alignment());
++
++		if (skb) {
++			int unaligned = (((u32)skb->data) + ETH_HLEN) & (dma_get_cache_alignment() - 1);
++			unsigned long desc_address;
++
++			if (unaligned)
++				skb_reserve(skb, (dma_get_cache_alignment() - unaligned));
++
++			desc_address = dma_map_single(NULL, skb->data, ETH_RX_SKB_SIZE, DMA_FROM_DEVICE);
++			ip3902_write_rx_desc(ip3902_priv, rx_index, desc_address, (ETH_RX_SKB_SIZE - 1) | RX_CONTROL_INT);
++
++			ip3902_priv->rx_skb[rx_index] = skb;
++			ip3902_priv->rx_next_allocate = NEXT_RX(rx_index);
++		} else {
++			ip3902_write_reg(ndev, RX_CONSUME_INDEX_REG, ip3902_priv->rx_next_allocate);
++			return;
++		}
++	} while (ip3902_priv->rx_next_allocate != ip3902_priv->rx_next_consume);
++
++	ip3902_write_reg(ndev, RX_CONSUME_INDEX_REG, ip3902_priv->rx_next_allocate);
++}
++
++static int ip3902_eth_receive_queue(struct net_device *ndev, struct ip3902_private *ip3902_priv, int budget)
++{
++	int rx_index    = ip3902_priv->rx_next_consume;
++	int write_index = ip3902_read_reg(ndev, RX_PRODUCE_INDEX_REG);
++	int received = 0;
++	int limit;
++
++	do {
++		limit = write_index;
++		spin_lock(&ip3902_priv->lock);
++		while (rx_index != limit) {
++			unsigned long status = ip3902_read_rx_status(ndev, ip3902_priv, rx_index);
++
++			if (!(status & RX_STATUS_LAST_FRAG)) {
++				printk(DRVNAME ": broken RX status: %08lx\n", status);
++				continue;
++			}
++
++			if (status & RX_STATUS_FAIL_FILTER)
++				continue;
++
++			/* Looks like hardware returns RANGE_ERROR for each frame */
++			if (status & (RX_STATUS_OVERRUN | RX_STATUS_ALIGNMENT_ERROR | RX_STATUS_LENGTH_ERROR | RX_STATUS_CRC_ERROR)) {
++				ndev->stats.rx_errors++;
++
++				if (status & RX_STATUS_OVERRUN)
++					ndev->stats.rx_fifo_errors++;
++
++				if (status & RX_STATUS_ALIGNMENT_ERROR)
++					ndev->stats.rx_frame_errors++;
++
++				if (status & (RX_STATUS_RANGE_ERROR | RX_STATUS_LENGTH_ERROR))
++					ndev->stats.rx_length_errors++;
++
++				if (status & RX_STATUS_CRC_ERROR)
++					ndev->stats.rx_crc_errors++;
++
++			} else {
++				if (--budget < 0) {
++					/* we got packets, but no quota */
++					/* store current ring pointer state */
++					ip3902_priv->rx_next_consume = rx_index;
++					return received;
++				} else {
++					struct sk_buff *skb    = ip3902_priv->rx_skb[rx_index];
++					int             length = RX_STATUS_LENGTH(status);
++					dma_addr_t      data_addr;
++					int             data_length;
++
++					ndev->stats.rx_packets++;
++					ndev->stats.rx_bytes += length;
++					if (status & RX_STATUS_MULTICAST)
++						ndev->stats.multicast++;
++
++					skb_put(skb, length - BYTES_IN_ETHERNET_CRC);
++					skb->protocol = eth_type_trans(skb, ndev);
++
++#ifdef CONFIG_INET_LRO
++					if (ip3902_priv->use_lro)
++						lro_receive_skb(&ip3902_priv->lro_mgr, skb, ip3902_priv);
++					else
++						netif_receive_skb(skb);
++
++					ip3902_priv->lro_count++;
++#else
++					netif_receive_skb(skb);
++#endif
++
++					ip3902_read_rx_desc(ip3902_priv, rx_index, &data_addr, &data_length);
++					dma_unmap_single(NULL, data_addr, ETH_RX_SKB_SIZE, DMA_FROM_DEVICE);
++
++					ip3902_priv->rx_skb[rx_index] = NULL;
++					ndev->last_rx = jiffies;
++					received++;
++				}
++			}
++			rx_index = NEXT_RX(rx_index);
++		}
++
++		spin_unlock(&ip3902_priv->lock);
++		ip3902_priv->rx_next_consume = rx_index;
++		ip3902_eth_rx_refill_descs(ndev, ip3902_priv);
++		write_index = ip3902_read_reg(ndev, RX_PRODUCE_INDEX_REG);
++	} while (limit != write_index);
++
++#ifdef CONFIG_INET_LRO
++	if (ip3902_priv->use_lro) {
++		if (timer_pending(&ip3902_priv->lro_timer)) {
++			mod_timer(&ip3902_priv->lro_timer, jiffies + 2);
++		} else {
++			ip3902_priv->lro_timer.expires  = jiffies + 2;
++			add_timer(&ip3902_priv->lro_timer);
++		}
++	}
++#endif
++
++	return received;
++}
++
++static int ip3902_poll(struct napi_struct *napi, int budget)
++{
++	struct ip3902_private *ip3902_priv = container_of(napi, struct ip3902_private, napi);
++	struct net_device *ndev = ip3902_priv->ndev;
++	int work_done;
++
++	work_done = ip3902_eth_receive_queue(ndev, ip3902_priv, budget);
++
++	if (work_done < budget) {
++		ip3902_write_reg(ndev, INT_CLEAR_REG, RX_DONE_INT);
++		ip3902_write_reg(ndev, INT_CLEAR_REG, 0);
++		netif_rx_complete(ndev, napi);
++		ip3902_write_reg(ndev, INT_ENABLE_REG, (TX_UNDERRUN_INT | RX_DONE_INT | RX_OVERRUN_INT));
++	}
++
++	return work_done;
++}
++
++#ifdef CONFIG_INET_LRO
++static void ip3902_lro_timeout(unsigned long data)
++{
++	struct ip3902_private *ip3902_priv = (struct ip3902_private *)data;
++
++	spin_lock(&ip3902_priv->lock);
++	if (ip3902_priv->lro_count <= LRO_THRESHOLD) {
++		ip3902_priv->use_lro = false;
++		ip3902_priv->lro_count = 0;
++	}
++	lro_flush_all(&ip3902_priv->lro_mgr);
++	spin_unlock(&ip3902_priv->lock);
++}
++#endif
++
++#define ip3902_eth_free_completed_tx_descs(ndev, priv) ip3902_eth_free_tx_descs(ndev, priv, 0)
++#define ip3902_eth_free_all_tx_descs(ndev, priv) ip3902_eth_free_tx_descs(ndev, priv, 1)
++
++static void ip3902_eth_free_tx_descs(struct net_device *ndev, struct ip3902_private *ip3902_priv, int force)
++{
++	int limit;
++
++	if (force)
++		limit = ip3902_priv->tx_next_produce;
++	else
++		limit = ip3902_read_reg(ndev, TX_CONSUME_INDEX_REG);
++
++	while (ip3902_priv->tx_next_deallocate != limit) {
++		int             length;
++		int             tx_index;
++		unsigned long   status;
++		dma_addr_t      addr;
++		struct sk_buff *skb;
++
++		tx_index = ip3902_priv->tx_next_deallocate;
++
++		ip3902_priv->tx_next_deallocate = NEXT_TX(tx_index);
++		ip3902_read_tx_desc(ip3902_priv, tx_index, &addr, &length);
++		skb = ip3902_priv->tx_skb[tx_index];
++
++		status = ip3902_read_tx_status(ip3902_priv, tx_index);
++		if (status & TX_STATUS_ERROR) {
++			ndev->stats.tx_errors++;
++			if (status & TX_STATUS_LATE_COLLISION)
++				ndev->stats.tx_aborted_errors++;
++
++			if (status & (TX_STATUS_MANY_COLLISIONS | TX_STATUS_MANY_DEFER))
++				ndev->stats.tx_window_errors++;
++
++		} else {
++			ndev->stats.tx_packets++;
++			ndev->stats.tx_bytes   += skb->len;
++			ndev->stats.collisions += TX_STATUS_COLLISIONS(status);
++		}
++
++		if (skb)
++			ip3902_priv->tx_skb[tx_index] = NULL;
++
++		if (ip3902_priv->tx_first_desc[tx_index] == true)
++			dma_unmap_single(NULL, addr, length, DMA_TO_DEVICE);
++		else
++			dma_unmap_page(NULL, addr, length, DMA_TO_DEVICE);
++
++		if (skb)
++			dev_kfree_skb_irq(skb);
++	}
++}
++
++static void ip3902_reset_tx(struct net_device *ndev, struct ip3902_private *ip3902_priv, int initial)
++{
++	unsigned long val;
++
++	/* Reset Tx hardware */
++	val = ip3902_read_reg(ndev, COMMAND_REG);
++	val &= ~(COMMAND_TX_RT_ENABLE | COMMAND_TX_ENABLE);
++	val |= COMMAND_TX_RESET;
++	ip3902_write_reg(ndev, COMMAND_REG, val);
++
++	if (!initial)
++		ip3902_eth_free_all_tx_descs(ndev, ip3902_priv);
++
++	ip3902_priv->tx_next_produce    = 0;
++	ip3902_priv->tx_next_deallocate = 0;
++
++	/* Configure Tx registers */
++	ip3902_write_reg(ndev, TX_DESC_REG,   ip3902_priv->ds_dma + offsetof(struct ip3902_dma_struct, tx_desc));
++	ip3902_write_reg(ndev, TX_STATUS_REG, ip3902_priv->ds_dma + offsetof(struct ip3902_dma_struct, tx_status));
++	ip3902_write_reg(ndev, TX_DESC_NUMBER_REG, TX_RING_SIZE - 1);
++	ip3902_write_reg(ndev, TX_PRODUCE_INDEX_REG, ip3902_priv->tx_next_produce);
++	ip3902_write_reg(ndev, TX_CONSUME_INDEX_REG, ip3902_priv->tx_next_deallocate);
++}
++
++static void ip3902_reset_rx(struct net_device *ndev, struct ip3902_private *ip3902_priv, int init)
++{
++	unsigned long val;
++
++	/* Reset Rx hardware */
++	val = ip3902_read_reg(ndev, COMMAND_REG);
++	val &= ~COMMAND_RX_ENABLE;
++	val |= COMMAND_RX_RESET;
++	ip3902_write_reg(ndev, COMMAND_REG, val);
++
++	/* Set maximum frame size register */
++	ip3902_write_reg(ndev, MAXF_REG, ETH_RX_SKB_SIZE);
++
++	if (init) {
++		ip3902_priv->rx_next_allocate   = 0;
++		ip3902_priv->rx_next_consume    = 0;
++		ip3902_eth_rx_refill_descs(ndev, ip3902_priv);
++	}
++
++	/* Prepare skb's for Rx (any skb's already prepared will be reused)
++	 * and configure Rx registers */
++	ip3902_write_reg(ndev, RX_DESC_REG, ip3902_priv->ds_dma + offsetof(struct ip3902_dma_struct, rx_desc));
++	ip3902_write_reg(ndev, RX_STATUS_REG, ip3902_priv->ds_dma + offsetof(struct ip3902_dma_struct, rx_status));
++	ip3902_write_reg(ndev, RX_DESC_NUMBER_REG, RX_RING_SIZE - 1);
++	ip3902_write_reg(ndev, RX_PRODUCE_INDEX_REG, ip3902_priv->rx_next_consume);
++}
++
++static inline void ip3902_start_tx(struct net_device *ndev)
++{
++	unsigned long val;
++
++	val = ip3902_read_reg(ndev, COMMAND_REG);
++	val |= COMMAND_TX_ENABLE;
++	ip3902_write_reg(ndev, COMMAND_REG, val);
++}
++
++static inline void ip3902_start_rx(struct net_device *ndev)
++{
++	unsigned long val;
++
++	/* First on high-level ... */
++	val = ip3902_read_reg(ndev, COMMAND_REG);
++	val |= (COMMAND_RX_ENABLE | COMMAND_ALLOW_SHORT);
++	ip3902_write_reg(ndev, COMMAND_REG, val);
++
++	/* ... and then on low-level (after high level is ready to receive) */
++	val = ip3902_read_reg(ndev, MAC1_REG);
++	val |= MAC1_RECEIVE_ENABLE;	/* flow control frames won't be passed to driver */
++	ip3902_write_reg(ndev, MAC1_REG, val);
++}
++
++/* Interrupt handler body - split out to use both in interrupt handler
++ * and in net poll controller.
++ *
++ * Internal routine, called with lock held. */
++static void ip3902_do_handle_interrupt(struct net_device *ndev, struct ip3902_private *ip3902_priv, unsigned long status)
++{
++	ip3902_write_reg(ndev, INT_CLEAR_REG, status);
++	ip3902_write_reg(ndev, INT_CLEAR_REG, 0);
++
++	if (status & TX_UNDERRUN_INT) {
++		printk(KERN_ERR DRVNAME ": %s: fatal Tx underrun, resetting Tx\n", ndev->name);
++		ip3902_reset_tx(ndev, ip3902_priv, 0);
++		ip3902_start_tx(ndev);
++	}
++
++	if (status & RX_OVERRUN_INT) {
++		printk(KERN_ERR DRVNAME ": %s: fatal Rx overrun, resetting Rx\n", ndev->name);
++		ip3902_reset_rx(ndev, ip3902_priv, 0);
++		ip3902_start_rx(ndev);
++	} else if (status & RX_DONE_INT) {
++		/* Disable the Rx interrupt */
++		ip3902_write_reg(ndev, INT_ENABLE_REG, (RX_OVERRUN_INT | TX_UNDERRUN_INT));
++		netif_rx_schedule(ndev, &ip3902_priv->napi);
++	}
++}
++
++static irqreturn_t ip3902_interrupt(int irq, void *dev_instance)
++{
++	struct net_device *ndev = (struct net_device *) dev_instance;
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++	unsigned long status;
++
++	status = ip3902_read_reg(ndev, INT_STATUS_REG) & (TX_DONE_INT | TX_UNDERRUN_INT | RX_DONE_INT | RX_OVERRUN_INT);
++	do {
++		if (!status) {
++			return IRQ_NONE;
++		} else {
++			ip3902_do_handle_interrupt(ndev, ip3902_priv, status);
++			status = ip3902_read_reg(ndev, INT_STATUS_REG) & (TX_DONE_INT | TX_UNDERRUN_INT | RX_DONE_INT | RX_OVERRUN_INT);
++		}
++	} while (status);
++
++	return IRQ_HANDLED;
++}
++
++#ifdef CONFIG_NET_POLL_CONTROLLER
++static void ip3902_net_poll(struct net_device *ndev)
++{
++	disable_irq_lockdep(ndev->irq);
++	ip3902_interrupt(ndev->irq, ndev);
++	enable_irq_lockdep(ndev->irq);
++}
++#endif
++
++static int eth_alloc_tx_desc_index(struct ip3902_private *ip3902_priv)
++{
++	int tx_desc_curr;
++
++	tx_desc_curr = ip3902_priv->tx_next_produce;
++	ip3902_priv->tx_next_produce = NEXT_TX(tx_desc_curr);
++
++	return tx_desc_curr;
++}
++
++static void eth_tx_fill_frag_descs(struct ip3902_private *ip3902_priv, struct sk_buff *skb)
++{
++	int frag = 0;
++	int tx_index;
++
++	do {
++		skb_frag_t   *this_frag = &skb_shinfo(skb)->frags[frag];
++		unsigned long desc_address;
++		unsigned long desc_control;
++
++		tx_index = eth_alloc_tx_desc_index(ip3902_priv);
++
++		if (frag == (skb_shinfo(skb)->nr_frags - 1)) {
++			desc_control = (this_frag->size - 1) | TX_CONTROL_ALL_NOTLAST;
++			ip3902_priv->tx_skb[tx_index] = skb;
++		} else {
++			desc_control = (this_frag->size - 1) | TX_CONTROL_ALL_LAST;
++			ip3902_priv->tx_skb[tx_index] = NULL;
++		}
++
++		ip3902_priv->tx_first_desc[tx_index] = false;
++		desc_address = dma_map_page(NULL, this_frag->page,
++									this_frag->page_offset,
++									this_frag->size,
++									DMA_TO_DEVICE);
++		ip3902_write_tx_desc(ip3902_priv, tx_index, desc_address, desc_control);
++	} while (++frag < skb_shinfo(skb)->nr_frags);
++}
++
++static int ip3902_submit_skb_for_tx(struct net_device *ndev, struct sk_buff *skb)
++{
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++	int nr_frags;
++	int free_desc;
++	int ret = 0;
++
++#ifdef CONFIG_INET_LRO
++	if (ip3902_priv->lro_count > LRO_THRESHOLD)
++		ip3902_priv->use_lro = true;
++
++	ip3902_priv->lro_count = 0;
++#endif
++
++	free_desc = ip3902_nr_free_descs(ip3902_priv->tx_next_produce, ip3902_priv->tx_next_deallocate, TX_RING_SIZE);
++	nr_frags  = skb_shinfo(skb)->nr_frags;
++
++	if (free_desc <= nr_frags) {
++		ip3902_eth_free_completed_tx_descs(ndev, ip3902_priv);
++		free_desc = ip3902_nr_free_descs(ip3902_priv->tx_next_produce, ip3902_priv->tx_next_deallocate, TX_RING_SIZE);
++	}
++
++	if (free_desc > nr_frags) {
++		unsigned long desc_address;
++		unsigned long desc_control;
++		int tx_index;
++		int length;
++
++		tx_index = eth_alloc_tx_desc_index(ip3902_priv);
++
++		if (nr_frags) {
++			eth_tx_fill_frag_descs(ip3902_priv, skb);
++			length = skb_headlen(skb);
++			desc_control = (length - 1) | TX_CONTROL_ALL_NOTLAST;
++			ip3902_priv->tx_skb[tx_index] = NULL;
++		} else {
++			length = skb->len;
++			desc_control = (length - 1) | TX_CONTROL_ALL_LAST;
++			ip3902_priv->tx_skb[tx_index] = skb;
++		}
++
++		ip3902_priv->tx_first_desc[tx_index] = true;
++		desc_address  = dma_map_single(NULL, skb->data, length, DMA_TO_DEVICE);
++
++		ip3902_write_tx_desc(ip3902_priv, tx_index, desc_address, desc_control);
++		ip3902_write_reg(ndev, TX_PRODUCE_INDEX_REG, ip3902_priv->tx_next_produce);
++		ip3902_eth_free_completed_tx_descs(ndev, ip3902_priv);
++	} else {
++		ret = -ENOMEM;
++	}
++
++	return ret;
++}
++
++static int ip3902_start_xmit(struct sk_buff *skb, struct net_device *ndev)
++{
++	int ret;
++
++	BUG_ON(netif_queue_stopped(ndev));
++	BUG_ON(skb == NULL);
++	ret = ip3902_submit_skb_for_tx(ndev, skb);
++
++	if (ret) {
++		printk(KERN_ERR "%s: transmit with queue full\n", ndev->name);
++		netif_stop_queue(ndev);
++	} else {
++		ndev->stats.tx_bytes += skb->len;
++		ndev->stats.tx_packets++;
++		ndev->trans_start = jiffies;
++	}
++
++	return ret;		/* success */
++}
++
++static void ip3902_do_set_rx_filter(struct net_device *ndev, struct ip3902_private *ip3902_priv)
++{
++	unsigned long creg, freg;
++
++	creg = ip3902_read_reg(ndev, COMMAND_REG);
++	if (ndev->flags & IFF_PROMISC) {
++		/* If interface is in promiscuous mode, just disable filter */
++		ip3902_write_reg(ndev, COMMAND_REG, creg | COMMAND_PROMISC);
++		return;
++	}
++	/* Enable filter */
++	ip3902_write_reg(ndev, COMMAND_REG, creg & ~COMMAND_PROMISC);
++
++	/* Frames for self address and broadcast frames are always accepted */
++	freg = FILTER_ACCEPT_SELF | FILTER_ACCEPT_BCAST_ANY;
++
++	if (ndev->flags & IFF_ALLMULTI) {
++		/* Accept all multicast frames */
++		freg |= FILTER_ACCEPT_MCAST_ANY;
++	} else if (ndev->mc_count > 0) {
++		/* Accept some multicast frames */
++		u64 hash_mask = 0;
++		struct dev_mc_list *mc;
++
++		freg |= FILTER_ACCEPT_MCAST_HASH;
++		for (mc = ndev->mc_list; mc; mc = mc->next) {
++			int b = (ether_crc(ETH_ALEN, mc->dmi_addr) >> 23) & 0x3f;
++			hash_mask |= (1 << b);
++		}
++		ip3902_write_reg(ndev, HASH_FILTER_L_REG, hash_mask & 0xffffffff);
++		ip3902_write_reg(ndev, HASH_FILTER_H_REG, hash_mask >> 32);
++	}
++
++	ip3902_write_reg(ndev, FILTER_CTRL_REG, freg);
++}
++
++static void ip3902_set_rx_filter(struct net_device *ndev)
++{
++	struct ip3902_private *ip3902_priv = (struct ip3902_private *)netdev_priv(ndev);
++
++	ip3902_do_set_rx_filter(ndev, ip3902_priv);
++}
++
++static void set_duplex_mode(struct net_device *ndev, int duplex)
++{
++	unsigned long val;
++
++	if (duplex) {
++		/* Full Duplex mode */
++
++		val = ip3902_read_reg(ndev, MAC2_REG);
++		val |= MAC2_FULL_DUPLEX;
++		ip3902_write_reg(ndev, MAC2_REG, val);
++
++		ip3902_write_reg(ndev, IPGT_REG, IPGT_FD_VALUE);
++
++		val = ip3902_read_reg(ndev, COMMAND_REG);
++		val |= COMMAND_FULL_DUPLEX;
++		ip3902_write_reg(ndev, COMMAND_REG, val);
++	} else {
++		/* Half Duplex mode */
++
++		val = ip3902_read_reg(ndev, MAC2_REG);
++		val &= ~MAC2_FULL_DUPLEX;
++		ip3902_write_reg(ndev, MAC2_REG, val);
++
++		ip3902_write_reg(ndev, IPGT_REG, IPGT_HD_VALUE);
++
++		val = ip3902_read_reg(ndev, COMMAND_REG);
++		val &= ~COMMAND_FULL_DUPLEX;
++		ip3902_write_reg(ndev, COMMAND_REG, val);
++	}
++}
++
++static int ip3902_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
++{
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++	unsigned int duplex_changed;
++	unsigned long flags;
++	int rc;
++
++	if (!netif_running(ndev))
++		return -EINVAL;
++
++	spin_lock_irqsave(&ip3902_priv->mii_lock, flags);
++	rc = generic_mii_ioctl(&ip3902_priv->mii, if_mii(req), cmd, &duplex_changed);
++	spin_unlock_irqrestore(&ip3902_priv->mii_lock, flags);
++	if (duplex_changed)
++		set_duplex_mode(ndev, ip3902_priv->mii.full_duplex);
++
++	return rc;
++}
++
++/* ethtool ops */
++
++static void ip3902_get_drvinfo(struct net_device *ndev,
++							   struct ethtool_drvinfo *info)
++{
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++
++	strcpy(info->driver, DRVNAME);
++	strcpy(info->version, DRVVERSION);
++	strcpy(info->bus_info, ip3902_priv->ndev->name);
++}
++
++static int ip3902_get_settings(struct net_device *ndev, struct ethtool_cmd *cmd)
++{
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++	unsigned long flags;
++
++	spin_lock_irqsave(&ip3902_priv->mii_lock, flags);
++	mii_ethtool_gset(&ip3902_priv->mii, cmd);
++	spin_lock_irqsave(&ip3902_priv->mii_lock, flags);
++
++	return 0;
++}
++
++static int ip3902_set_settings(struct net_device *ndev, struct ethtool_cmd *cmd)
++{
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++	unsigned long flags;
++	int rc;
++
++	spin_lock_irqsave(&ip3902_priv->mii_lock, flags);
++	rc = mii_ethtool_sset(&ip3902_priv->mii, cmd);
++	spin_lock_irqsave(&ip3902_priv->mii_lock, flags);
++
++	return rc;
++}
++
++static int ip3902_nway_reset(struct net_device *ndev)
++{
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++	return mii_nway_restart(&ip3902_priv->mii);
++}
++
++static u32 ip3902_get_link(struct net_device *ndev)
++{
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++	return mii_link_ok(&ip3902_priv->mii);
++}
++
++static const struct ethtool_ops ip3902_ethtool_ops = {
++	.get_drvinfo    = ip3902_get_drvinfo,
++	.get_settings   = ip3902_get_settings,
++	.set_settings   = ip3902_set_settings,
++	.nway_reset     = ip3902_nway_reset,
++	.get_link       = ip3902_get_link,
++	.get_sg         = ethtool_op_get_sg,
++	.set_sg         = ethtool_op_set_sg,
++};
++
++/* setup code */
++
++static void ip3902_eth_update_mac_address(struct net_device *ndev)
++{
++	ip3902_write_reg(ndev, SA0_REG, (ndev->dev_addr[5] << 8) | ndev->dev_addr[4]);
++	ip3902_write_reg(ndev, SA1_REG, (ndev->dev_addr[3] << 8) | ndev->dev_addr[2]);
++	ip3902_write_reg(ndev, SA2_REG, (ndev->dev_addr[1] << 8) | ndev->dev_addr[0]);
++}
++
++static int ip3902_eth_set_mac_address(struct net_device *ndev, void *addr)
++{
++	int i;
++
++	for (i = 0; i < 6; i++)
++		/* +2 is for the offset of the HW addr type */
++		ndev->dev_addr[i] = ((unsigned char *)addr)[i + 2];
++
++	ip3902_eth_update_mac_address(ndev);
++	return 0;
++}
++
++static void ip3902_hw_deinit(struct net_device *ndev)
++{
++	unsigned long val;
++
++	/* Stop Rx and Tx hardware and disable interrupts */
++	val = ip3902_read_reg(ndev, COMMAND_REG);
++	val &= ~(COMMAND_TX_ENABLE | COMMAND_RX_ENABLE);
++	ip3902_write_reg(ndev, COMMAND_REG, val);
++	ip3902_write_reg(ndev, INT_ENABLE_REG, 0);
++
++	/* Put low-level hardware into reset, and high-level into poweroff */
++	ip3902_write_reg(ndev, MAC1_REG, MAC1_SOFT_RESET);
++	ip3902_write_reg(ndev, POWERDOWN_REG, POWERDOWN_VALUE);
++}
++
++static int ethernet_phy_get(struct net_device *ndev)
++{
++	int addr;
++
++	for (addr = 1; addr < 32; addr++) {
++		int stat;
++		stat = ip3902_mdio_read(ndev, addr, MII_BMSR);
++		if ((stat != 0) && (stat != 0xffff))
++			return addr;
++	}
++	printk(KERN_ERR DRVNAME ": could not locate PHY\n");
++	return -EIO;
++}
++
++static int ip3902_hw_init(struct net_device *ndev, struct ip3902_private *ip3902_priv)
++{
++	int ret = 0;
++
++	/* Poweron hardware */
++	ip3902_write_reg(ndev, POWERDOWN_REG, 0);
++
++	/* Move low level out of reset (also initialize the registers)*/
++	ip3902_write_reg(ndev, MAC1_REG, 0);
++	ip3902_write_reg(ndev, MAC2_REG, INITIAL_MAC2);
++
++	ip3902_priv->mii.phy_id = ethernet_phy_get(ndev);
++
++	if (ip3902_priv->mii.phy_id < 0) {
++		ret = ip3902_priv->mii.phy_id;
++	} else {
++		ip3902_eth_update_mac_address(ndev);
++
++		/* "Initialize" command register (before resets - those routines
++		 * use read-modify-write operations on that register */
++		ip3902_write_reg(ndev, COMMAND_REG, COMMAND_ALLOW_SHORT);
++
++		/* Reset and configure Rx and Tx */
++		ip3902_reset_tx(ndev, ip3902_priv, 1);
++		ip3902_reset_rx(ndev, ip3902_priv, 1);
++
++		/* Initialize Rx filtering */
++		ip3902_do_set_rx_filter(ndev, ip3902_priv);
++
++		/* Clear all interrupts, and enable interesting interrupts */
++		ip3902_write_reg(ndev, INT_CLEAR_REG, 0xffffffff);
++		ip3902_write_reg(ndev, INT_CLEAR_REG, 0);
++		ip3902_write_reg(ndev, INT_ENABLE_REG, (TX_UNDERRUN_INT | RX_DONE_INT | RX_OVERRUN_INT));
++
++		/* Start Tx and Rx hardware */
++		ip3902_start_tx(ndev);
++		ip3902_start_rx(ndev);
++	}
++	return 0;
++}
++
++static int ip3902_open(struct net_device *ndev)
++{
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++	int ret;
++
++	dev_dbg(&ip3902_priv->ndev->dev, "%s: open\n", ndev->name);
++
++	ret = request_irq(ndev->irq, ip3902_interrupt, 0, ndev->name, ndev);
++	if (ret)
++		return ret;
++
++	ret = ip3902_hw_init(ndev, ip3902_priv);
++
++	if (ret)
++		return ret;
++
++	mii_check_media(&ip3902_priv->mii, netif_msg_link(ip3902_priv), 1);
++	set_duplex_mode(ndev, ip3902_priv->mii.full_duplex);
++
++#ifdef CONFIG_INET_LRO
++	init_timer(&ip3902_priv->lro_timer);
++	ip3902_priv->lro_timer.data     = (unsigned long) ip3902_priv;
++	ip3902_priv->lro_timer.function = ip3902_lro_timeout;
++#endif
++
++	netif_start_queue(ndev);
++	napi_enable(&ip3902_priv->napi);
++
++	ip3902_priv->running = 1;
++
++	return 0;
++}
++
++static int ip3902_close(struct net_device *ndev)
++{
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++
++	dev_dbg(&ip3902_priv->ndev->dev, "%s: close\n", ndev->name);
++
++	ip3902_priv->running = 0;
++	wmb();
++
++#ifdef CONFIG_INET_LRO
++	del_timer(&ip3902_priv->lro_timer);
++#endif
++
++	napi_disable(&ip3902_priv->napi);
++
++	ip3902_hw_deinit(ndev);
++
++	netif_stop_queue(ndev);
++
++	ip3902_eth_free_all_tx_descs(ndev, ip3902_priv);
++
++	free_irq(ndev->irq, ndev);
++	return 0;
++}
++
++static int parse_mac_address(struct net_device *ndev)
++{
++	int n = sscanf(mac_address, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx",
++				   &ndev->dev_addr[0], &ndev->dev_addr[1],
++				   &ndev->dev_addr[2], &ndev->dev_addr[3],
++				   &ndev->dev_addr[4], &ndev->dev_addr[5]);
++
++	if (n == 6)
++		return 0;
++
++	printk(KERN_WARNING DRVNAME": failed to parse mac address string \"%s\"\n", mac_address);
++	return -EINVAL;
++}
++
++static void ip3902_hw_shutdown(struct net_device *ndev, struct ip3902_private *ip3902_priv)
++{
++	dma_free_coherent(NULL, sizeof(*(ip3902_priv->ds)), ip3902_priv->ds, ip3902_priv->ds_dma);
++}
++
++static int ip3902_hw_startup(struct net_device *ndev, struct ip3902_private *ip3902_priv)
++{
++	ip3902_priv->ds = dma_alloc_coherent(NULL, sizeof(*(ip3902_priv->ds)), &ip3902_priv->ds_dma, GFP_KERNEL);
++	if (!ip3902_priv->ds) {
++		printk(KERN_ERR DRVNAME ": can't allocate DMA structure\n");
++		ip3902_hw_shutdown(ndev, ip3902_priv);
++		return -ENOMEM;
++	}
++
++	/* Poweron hardware */
++	ip3902_write_reg(ndev, POWERDOWN_REG, 0);
++
++	/* set mii clock */
++	ip3902_write_reg(ndev, MCFG_REG, 0x1c);
++
++	/* Move low level out of reset (also initialize the registers)*/
++	ip3902_write_reg(ndev, MAC1_REG, 0);
++	ip3902_write_reg(ndev, MAC2_REG, INITIAL_MAC2);
++
++	if (!mac_address || parse_mac_address(ndev) < 0) {
++		unsigned long val;
++
++		val = ip3902_read_reg(ndev, SA0_REG);
++		ndev->dev_addr[5] = (val >> 8) & 255;
++		ndev->dev_addr[4] = val & 255;
++		val = ip3902_read_reg(ndev, SA1_REG);
++		ndev->dev_addr[3] = (val >> 8) & 255;
++		ndev->dev_addr[2] = val & 255;
++		val = ip3902_read_reg(ndev, SA2_REG);
++		ndev->dev_addr[1] = (val >> 8) & 255;
++		ndev->dev_addr[0] = val & 255;
++	}
++
++	/* Put low-level hardware into reset, and high-level into poweroff */
++	ip3902_write_reg(ndev, MAC1_REG, MAC1_SOFT_RESET);
++	ip3902_write_reg(ndev, POWERDOWN_REG, POWERDOWN_VALUE);
++
++	return 0;
++}
++
++static int ip3902_init_dev(struct net_device *ndev, struct ip3902_private *ip3902_priv)
++{
++	int ret;
++
++	ret = ip3902_hw_startup(ndev, ip3902_priv);
++
++	if (!ret) {
++		ndev->hard_start_xmit    = ip3902_start_xmit;
++		ndev->set_mac_address    = ip3902_eth_set_mac_address;
++		ndev->set_multicast_list = ip3902_set_rx_filter;
++		ndev->open               = ip3902_open;
++		ndev->stop               = ip3902_close;
++		ndev->do_ioctl           = ip3902_ioctl;
++		ndev->features           = 0;
++#ifdef CONFIG_NET_POLL_CONTROLLER
++		ndev->poll_controller    = ip3902_net_poll;
++#endif
++		SET_ETHTOOL_OPS(ndev, &ip3902_ethtool_ops);
++
++		ip3902_priv->msg_enable     = NETIF_MSG_LINK;
++		ip3902_priv->mii.phy_id_mask    = 0x1f;
++		ip3902_priv->mii.reg_num_mask   = 0x1f;
++		ip3902_priv->mii.mdio_read  = ip3902_mdio_read;
++		ip3902_priv->mii.mdio_write = ip3902_mdio_write;
++		ip3902_priv->mii.dev        = ndev;
++
++		spin_lock_init(&ip3902_priv->lock);
++
++		ret = register_netdev(ndev);
++
++		if (ret)
++			ip3902_hw_shutdown(ndev, ip3902_priv);
++	}
++
++	return ret;
++}
++
++#ifdef CONFIG_INET_LRO
++static int ip3902_get_skb_hdr(struct sk_buff *skb, void **iphdr, void **tcph, u64 *hdr_flags, void *priv)
++{
++	unsigned int ip_len;
++	struct iphdr *iph;
++
++	/* non tcp packet */
++	skb_reset_network_header(skb);
++	iph = ip_hdr(skb);
++	if (iph->protocol != IPPROTO_TCP)
++		return -1;
++
++	ip_len = ip_hdrlen(skb);
++	skb_set_transport_header(skb, ip_len);
++	*tcph = tcp_hdr(skb);
++
++	/* check if ip header and tcp header are complete */
++	if (iph->tot_len < ip_len + tcp_hdrlen(skb))
++		return -1;
++
++	*hdr_flags = LRO_IPV4 | LRO_TCP;
++	*iphdr = iph;
++
++	return 0;
++}
++#endif
++
++static int ip3902_remove(struct platform_device *pdev)
++{
++	struct net_device     *ndev = platform_get_drvdata(pdev);
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++
++	platform_set_drvdata(pdev, NULL);
++
++	unregister_netdev(ndev);
++
++	iounmap(ip3902_priv->mem);
++	release_resource(ip3902_priv->bus);
++	kfree(ip3902_priv->bus);
++
++	free_netdev(ndev);
++
++	return 0;
++}
++
++/* ip3902_probe
++ *
++ * This is the entry point when the platform device system uses to
++ * notify us of a new device to attach to. Allocate memory, find
++ * the resources and information passed, and map the necessary registers.
++*/
++
++static int ip3902_probe(struct platform_device *pdev)
++{
++	struct net_device     *ndev;
++	struct ip3902_private *ip3902_priv;
++	struct resource       *res;
++	size_t                 size;
++	int                    ret;
++
++	ndev = alloc_etherdev(sizeof(struct ip3902_private));
++
++	if (ndev == NULL)
++		return -ENOMEM;
++
++	ip3902_priv = netdev_priv(ndev);
++
++	memset(ip3902_priv, 0, sizeof(struct ip3902_private));
++
++	spin_lock_init(&ip3902_priv->mii_lock);
++
++	ip3902_priv->ndev = ndev;
++	ip3902_priv->pdev = pdev;
++
++	netif_napi_add(ndev, &ip3902_priv->napi, ip3902_poll, IP3902_NAPI_WEIGHT);
++
++#ifdef CONFIG_INET_LRO
++	ip3902_priv->use_lro   = false;
++	ip3902_priv->lro_count = 0;
++	ip3902_priv->lro_mgr.max_aggr = IP3902_NAPI_WEIGHT;
++	ip3902_priv->lro_mgr.max_desc = MAX_LRO_DESCRIPTORS;
++	ip3902_priv->lro_mgr.lro_arr = ip3902_priv->lro_desc;
++	ip3902_priv->lro_mgr.get_skb_header = ip3902_get_skb_hdr;
++	ip3902_priv->lro_mgr.features = LRO_F_NAPI;
++	ip3902_priv->lro_mgr.dev = ndev;
++	ip3902_priv->lro_mgr.ip_summed = 0;
++	ip3902_priv->lro_mgr.ip_summed_aggr = 0;
++#endif
++
++	platform_set_drvdata(pdev, ndev);
++
++	/* find the platform resources */
++	ndev->irq  = platform_get_irq(pdev, 0);
++	if (ndev->irq < 0) {
++		dev_err(&pdev->dev, "no IRQ specified\n");
++		ret = -ENXIO;
++		goto exit_mem;
++	}
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (res == NULL) {
++		dev_err(&pdev->dev, "no MEM specified\n");
++		ret = -ENXIO;
++		goto exit_mem;
++	}
++	size = (res->end - res->start) + 1;
++
++	ip3902_priv->bus = request_mem_region(res->start & 0x1fffffff, size, pdev->name);
++	if (ip3902_priv->bus == NULL) {
++		dev_err(&pdev->dev, "cannot reserve registers\n");
++		ret = -ENXIO;
++		goto exit_mem;
++	}
++
++	ip3902_priv->mem = ioremap(res->start & 0x1fffffff, size);
++	ndev->base_addr = (unsigned long)ip3902_priv->mem;
++
++	if (ip3902_priv->mem == NULL) {
++		dev_err(&pdev->dev, "Cannot ioremap area (%08llx,%08llx)\n",
++				(unsigned long long)res->start,
++				(unsigned long long)res->end);
++
++		ret = -ENXIO;
++		goto exit_req;
++	}
++
++	SET_NETDEV_DEV(ndev, &pdev->dev);
++
++	/* got resources, now initialise and register device */
++	ret = ip3902_init_dev(ndev, ip3902_priv);
++	if (!ret) {
++		printk(KERN_INFO "NXP ip3902 10/100 Ethernet platform driver irq %d base %08lx\n", ndev->irq, ndev->base_addr);
++		return 0;
++	}
++
++exit_req:
++	release_resource(ip3902_priv->bus);
++	kfree(ip3902_priv->bus);
++
++exit_mem:
++	free_netdev(ndev);
++
++	return ret;
++}
++
++/* suspend and resume */
++
++#ifdef CONFIG_PM
++static int ip3902_suspend(struct platform_device *pdev, pm_message_t state)
++{
++	struct net_device     *ndev = platform_get_drvdata(pdev);
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++
++	ip3902_priv->resume_open = ip3902_priv->running;
++
++	netif_device_detach(ndev);
++	ip3902_close(ndev);
++
++	return 0;
++}
++
++static int ip3902_resume(struct platform_device *pdev)
++{
++	struct net_device     *ndev = platform_get_drvdata(pdev);
++	struct ip3902_private *ip3902_priv = netdev_priv(ndev);
++
++	netif_device_attach(ndev);
++
++	if (ip3902_priv->resume_open)
++		ip3902_open(ndev);
++
++	return 0;
++}
++
++#else
++	#define ip3902_suspend NULL
++	#define ip3902_resume  NULL
++#endif
++
++static struct platform_driver ip3902drv = {
++	.driver = {
++		.name       = "ip3902-eth",
++		.owner      = THIS_MODULE,
++	},
++	.probe      = ip3902_probe,
++	.remove     = ip3902_remove,
++	.suspend    = ip3902_suspend,
++	.resume     = ip3902_resume,
++};
++
++static int __init ip3902drv_init(void)
++{
++	return platform_driver_register(&ip3902drv);
++}
++
++static void __exit ip3902drv_exit(void)
++{
++	platform_driver_unregister(&ip3902drv);
++}
++
++module_init(ip3902drv_init);
++module_exit(ip3902drv_exit);
++
++MODULE_DESCRIPTION("NXP IP3902 10/100 Ethernet platform driver");
++MODULE_AUTHOR("Chris Steel, <chris.steel@nxp.com>");
++MODULE_LICENSE("GPL v2");
+diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
+index 9fe8cb7..d140375 100644
+--- a/drivers/net/Kconfig
++++ b/drivers/net/Kconfig
+@@ -1882,6 +1882,16 @@ config ATL2
+ 	  To compile this driver as a module, choose M here.  The module
+ 	  will be called atl2.
+ 
++config IP3902
++	tristate "NXP IP3902 ethernet hardware support"
++	depends on SOC_PNX8335 && NET_ETHERNET
++	select MII
++	select CRC32
++	help
++	  This is a driver for NXP IP3902 ethernet hardware found
++	  in PNX8335 and probably other SOCs.
++
++
+ source "drivers/net/fs_enet/Kconfig"
+ 
+ endif # NET_ETHERNET
+diff -urN --exclude=.svn linux-2.6.26-rc4.orig/drivers/net/Makefile linux-2.6.26-rc4/drivers/net/Makefile
+--- linux-2.6.26-rc4.orig/drivers/net/Makefile	2008-06-03
+10:56:55.000000000 +0100
++++ linux-2.6.26-rc4/drivers/net/Makefile	2008-06-03 17:17:11.000000000 +0100
+@@ -122,6 +122,7 @@
+ obj-$(CONFIG_FORCEDETH) += forcedeth.o
+ obj-$(CONFIG_NE_H8300) += ne-h8300.o
+ obj-$(CONFIG_AX88796) += ax88796.o
++obj-$(CONFIG_IP3902) += ip3902.o
+
+ obj-$(CONFIG_TSI108_ETH) += tsi108_eth.o
+ obj-$(CONFIG_MV643XX_ETH) += mv643xx_eth.o
+
diff --git a/packages/linux/linux_2.6.28.bb b/packages/linux/linux_2.6.28.bb
index d70aed5..b042a45 100644
--- a/packages/linux/linux_2.6.28.bb
+++ b/packages/linux/linux_2.6.28.bb
@@ -6,6 +6,7 @@ PR = "r1"
 DEFAULT_PREFERENCE = "-1"
 
 DEFAULT_PREFERENCE_at91sam9263ek = "28"
+DEFAULT_PREFERENCE_stb225 = "28"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.28.tar.bz2 \
            file://defconfig"
@@ -13,3 +14,8 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.28.tar.bz2 \
 SRC_URI_append_at91sam9263ek = " \
            file://linux-2.6.28-at91.patch.bz2;patch=1 \
 	   file://linux-2.6.28-exp.patch.bz2;patch=1 "
+
+SRC_URI_append_stb225 = " \
+           file://ebase-fix.patch;patch=1 \
+           file://enable-uart.patch;patch=1 \
+	   file://ip3902.patch;patch=1 "
-- 
1.5.6.3




