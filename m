Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM59L-0003D6-RF
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:07:20 +0200
Received: (qmail 32640 invoked by uid 813007); 1 Jul 2009 18:55:23 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:55:23 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:55:15 +0200
Message-Id: <1246474518-16737-17-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011819.54127.marcin@juszkiewicz.com.pl>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [STABLE][PATCH 122/125] linux: atngw100 uses 2.6.29 now (config updated with lot of changes)
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
X-List-Received-Date: Wed, 01 Jul 2009 19:07:20 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/linux/linux/atngw100/defconfig |  794 +++++++++++++++++++++-----------
 recipes/linux/linux_2.6.29.bb          |    1 +
 2 files changed, 517 insertions(+), 278 deletions(-)

diff --git a/recipes/linux/linux/atngw100/defconfig b/recipes/linux/linux/atngw100/defconfig
index 290dce5..02536df 100644
--- a/recipes/linux/linux/atngw100/defconfig
+++ b/recipes/linux/linux/atngw100/defconfig
@@ -1,36 +1,38 @@
 #
 # Automatically generated make config: don't edit
-# Linux kernel version: 2.6.21
-# Sat Jun  2 10:40:44 2007
+# Linux kernel version: 2.6.29
+# Tue Apr 14 15:38:00 2009
 #
 CONFIG_AVR32=y
 CONFIG_GENERIC_GPIO=y
 CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
 CONFIG_HARDIRQS_SW_RESEND=y
 CONFIG_GENERIC_IRQ_PROBE=y
 CONFIG_RWSEM_GENERIC_SPINLOCK=y
 CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+# CONFIG_RWSEM_XCHGADD_ALGORITHM is not set
 # CONFIG_ARCH_HAS_ILOG2_U32 is not set
 # CONFIG_ARCH_HAS_ILOG2_U64 is not set
 CONFIG_GENERIC_HWEIGHT=y
 CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_GENERIC_BUG=y
 CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
 
 #
-# Code maturity level options
+# General setup
 #
 CONFIG_EXPERIMENTAL=y
 CONFIG_BROKEN_ON_SMP=y
+CONFIG_LOCK_KERNEL=y
 CONFIG_INIT_ENV_ARG_LIMIT=32
-
-#
-# General setup
-#
 CONFIG_LOCALVERSION=""
-# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_LOCALVERSION_AUTO=y
 CONFIG_SWAP=y
 CONFIG_SYSVIPC=y
-# CONFIG_IPC_NS is not set
 CONFIG_SYSVIPC_SYSCTL=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
@@ -38,15 +40,28 @@ CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
 # CONFIG_TASK_XACCT is not set
-# CONFIG_UTS_NS is not set
 CONFIG_AUDIT=y
+
+#
+# RCU Subsystem
+#
+# CONFIG_CLASSIC_RCU is not set
+# CONFIG_TREE_RCU is not set
+CONFIG_PREEMPT_RCU=y
+CONFIG_RCU_TRACE=y
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_PREEMPT_RCU_TRACE=y
 # CONFIG_IKCONFIG is not set
-CONFIG_SYSFS_DEPRECATED=y
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_GROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
 CONFIG_RELAY=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE=""
+# CONFIG_NAMESPACES is not set
+# CONFIG_BLK_DEV_INITRD is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
 CONFIG_EMBEDDED=y
 # CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_KALLSYMS=y
@@ -59,31 +74,36 @@ CONFIG_ELF_CORE=y
 # CONFIG_BASE_FULL is not set
 CONFIG_FUTEX=y
 CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
 CONFIG_SHMEM=y
-CONFIG_SLAB=y
+CONFIG_AIO=y
 CONFIG_VM_EVENT_COUNTERS=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_CLK=y
+# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
+CONFIG_SLABINFO=y
 CONFIG_RT_MUTEXES=y
-# CONFIG_TINY_SHMEM is not set
 CONFIG_BASE_SMALL=1
-# CONFIG_SLOB is not set
-
-#
-# Loadable module support
-#
 CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_MODULE_FORCE_UNLOAD is not set
 # CONFIG_MODVERSIONS is not set
 # CONFIG_MODULE_SRCVERSION_ALL is not set
-# CONFIG_KMOD is not set
-
-#
-# Block layer
-#
 CONFIG_BLOCK=y
 # CONFIG_LBD is not set
 # CONFIG_BLK_DEV_IO_TRACE is not set
-# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
 
 #
 # IO Schedulers
@@ -97,24 +117,42 @@ CONFIG_IOSCHED_NOOP=y
 # CONFIG_DEFAULT_CFQ is not set
 CONFIG_DEFAULT_NOOP=y
 CONFIG_DEFAULT_IOSCHED="noop"
+# CONFIG_FREEZER is not set
 
 #
 # System Type and features
 #
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
 CONFIG_SUBARCH_AVR32B=y
 CONFIG_MMU=y
 CONFIG_PERFORMANCE_COUNTERS=y
 CONFIG_PLATFORM_AT32AP=y
+CONFIG_CPU_AT32AP700X=y
 CONFIG_CPU_AT32AP7000=y
-CONFIG_BOARD_ATSTK1002=y
-CONFIG_BOARD_ATSTK1000=y
+# CONFIG_BOARD_ATSTK1000 is not set
+CONFIG_BOARD_ATNGW100=y
+# CONFIG_BOARD_HAMMERHEAD is not set
+# CONFIG_BOARD_FAVR_32 is not set
+# CONFIG_BOARD_MIMC200 is not set
+# CONFIG_BOARD_ATNGW100_EVKLCD10X is not set
 CONFIG_LOADER_U_BOOT=y
+
+#
+# Atmel AVR32 AP options
+#
+# CONFIG_AP700X_32_BIT_SMC is not set
+CONFIG_AP700X_16_BIT_SMC=y
+# CONFIG_AP700X_8_BIT_SMC is not set
 CONFIG_LOAD_ADDRESS=0x10000000
 CONFIG_ENTRY_ADDRESS=0x90000000
 CONFIG_PHYS_OFFSET=0x10000000
-CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_NONE is not set
 # CONFIG_PREEMPT_VOLUNTARY is not set
-# CONFIG_PREEMPT is not set
+CONFIG_PREEMPT=y
+CONFIG_QUICKLIST=y
 # CONFIG_HAVE_ARCH_BOOTMEM_NODE is not set
 # CONFIG_ARCH_HAVE_MEMORY_PRESENT is not set
 # CONFIG_NEED_NODE_MEMMAP_SIZE is not set
@@ -127,42 +165,68 @@ CONFIG_FLATMEM_MANUAL=y
 # CONFIG_SPARSEMEM_MANUAL is not set
 CONFIG_FLATMEM=y
 CONFIG_FLAT_NODE_MEM_MAP=y
-# CONFIG_SPARSEMEM_STATIC is not set
+CONFIG_PAGEFLAGS_EXTENDED=y
 CONFIG_SPLIT_PTLOCK_CPUS=4
-# CONFIG_RESOURCES_64BIT is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
 CONFIG_ZONE_DMA_FLAG=0
+CONFIG_NR_QUICK=2
+CONFIG_VIRT_TO_BUS=y
+CONFIG_UNEVICTABLE_LRU=y
 # CONFIG_OWNERSHIP_TRACE is not set
+# CONFIG_NMI_DEBUGGING is not set
 # CONFIG_HZ_100 is not set
 CONFIG_HZ_250=y
 # CONFIG_HZ_300 is not set
 # CONFIG_HZ_1000 is not set
 CONFIG_HZ=250
-CONFIG_CMDLINE=""
+CONFIG_SCHED_HRTICK=y
+CONFIG_CMDLINE=" debug "
 
 #
-# Bus options
+# Power management options
 #
+# CONFIG_PM is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
 
 #
-# PCCARD (PCMCIA/CardBus) support
+# CPU Frequency scaling
 #
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_TABLE=m
+# CONFIG_CPU_FREQ_DEBUG is not set
+CONFIG_CPU_FREQ_STAT=m
+# CONFIG_CPU_FREQ_STAT_DETAILS is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=m
+CONFIG_CPU_FREQ_GOV_USERSPACE=m
+CONFIG_CPU_FREQ_GOV_ONDEMAND=m
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
+CONFIG_CPU_FREQ_AT32AP=y
+
+#
+# Bus options
+#
+# CONFIG_ARCH_SUPPORTS_MSI is not set
 # CONFIG_PCCARD is not set
 
 #
 # Executable file formats
 #
 CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_HAVE_AOUT is not set
 # CONFIG_BINFMT_MISC is not set
-
-#
-# Networking
-#
 CONFIG_NET=y
 
 #
 # Networking options
 #
-# CONFIG_NETDEBUG is not set
+CONFIG_COMPAT_NET_DEV_OPS=y
 CONFIG_PACKET=y
 CONFIG_PACKET_MMAP=y
 CONFIG_UNIX=y
@@ -187,6 +251,7 @@ CONFIG_IP_PNP_DHCP=y
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
 CONFIG_INET_DIAG=y
 CONFIG_INET_TCP_DIAG=y
 # CONFIG_TCP_CONG_ADVANCED is not set
@@ -194,27 +259,14 @@ CONFIG_TCP_CONG_CUBIC=y
 CONFIG_DEFAULT_TCP_CONG="cubic"
 # CONFIG_TCP_MD5SIG is not set
 # CONFIG_IPV6 is not set
-# CONFIG_INET6_XFRM_TUNNEL is not set
-# CONFIG_INET6_TUNNEL is not set
 # CONFIG_NETWORK_SECMARK is not set
 # CONFIG_NETFILTER is not set
-
-#
-# DCCP Configuration (EXPERIMENTAL)
-#
 # CONFIG_IP_DCCP is not set
-
-#
-# SCTP Configuration (EXPERIMENTAL)
-#
 # CONFIG_IP_SCTP is not set
-
-#
-# TIPC Configuration (EXPERIMENTAL)
-#
 # CONFIG_TIPC is not set
 # CONFIG_ATM is not set
 # CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
 # CONFIG_VLAN_8021Q is not set
 # CONFIG_DECNET is not set
 # CONFIG_LLC2 is not set
@@ -224,20 +276,23 @@ CONFIG_DEFAULT_TCP_CONG="cubic"
 # CONFIG_LAPB is not set
 # CONFIG_ECONET is not set
 # CONFIG_WAN_ROUTER is not set
-
-#
-# QoS and/or fair queueing
-#
 # CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
 
 #
 # Network testing
 #
 # CONFIG_NET_PKTGEN is not set
 # CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
 # CONFIG_IRDA is not set
 # CONFIG_BT is not set
-# CONFIG_IEEE80211 is not set
+# CONFIG_AF_RXRPC is not set
+# CONFIG_PHONET is not set
+# CONFIG_WIRELESS is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
 
 #
 # Device Drivers
@@ -246,27 +301,22 @@ CONFIG_DEFAULT_TCP_CONG="cubic"
 #
 # Generic Driver Options
 #
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_STANDALONE=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FW_LOADER is not set
 # CONFIG_DEBUG_DRIVER is not set
 # CONFIG_DEBUG_DEVRES is not set
 # CONFIG_SYS_HYPERVISOR is not set
-
-#
-# Connector - unified userspace <-> kernelspace linker
-#
 # CONFIG_CONNECTOR is not set
-
-#
-# Memory Technology Devices (MTD)
-#
 CONFIG_MTD=y
 # CONFIG_MTD_DEBUG is not set
 # CONFIG_MTD_CONCAT is not set
 CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_TESTS is not set
 # CONFIG_MTD_REDBOOT_PARTS is not set
 CONFIG_MTD_CMDLINE_PARTS=y
+# CONFIG_MTD_AR7_PARTS is not set
 
 #
 # User Modules And Translation Layers
@@ -279,6 +329,7 @@ CONFIG_MTD_BLOCK=y
 # CONFIG_INFTL is not set
 # CONFIG_RFD_FTL is not set
 # CONFIG_SSFDC is not set
+# CONFIG_MTD_OOPS is not set
 
 #
 # RAM/ROM/Flash chip drivers
@@ -304,16 +355,13 @@ CONFIG_MTD_CFI_UTIL=y
 # CONFIG_MTD_RAM is not set
 # CONFIG_MTD_ROM is not set
 # CONFIG_MTD_ABSENT is not set
-# CONFIG_MTD_OBSOLETE_CHIPS is not set
 
 #
 # Mapping drivers for chip access
 #
 # CONFIG_MTD_COMPLEX_MAPPINGS is not set
 CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_PHYSMAP_START=0x8000000
-CONFIG_MTD_PHYSMAP_LEN=0x0
-CONFIG_MTD_PHYSMAP_BANKWIDTH=2
+# CONFIG_MTD_PHYSMAP_COMPAT is not set
 # CONFIG_MTD_PLATRAM is not set
 
 #
@@ -330,120 +378,109 @@ CONFIG_MTD_PHYSMAP_BANKWIDTH=2
 # CONFIG_MTD_DOC2000 is not set
 # CONFIG_MTD_DOC2001 is not set
 # CONFIG_MTD_DOC2001PLUS is not set
-
-#
-# NAND Flash Device Drivers
-#
 # CONFIG_MTD_NAND is not set
-
-#
-# OneNAND Flash Device Drivers
-#
 # CONFIG_MTD_ONENAND is not set
 
 #
-# Parallel port support
+# LPDDR flash memory drivers
 #
-# CONFIG_PARPORT is not set
+# CONFIG_MTD_LPDDR is not set
 
 #
-# Plug and Play support
+# UBI - Unsorted block images
 #
-# CONFIG_PNPACPI is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_RESERVE=1
+CONFIG_MTD_UBI_GLUEBI=y
 
 #
-# Block devices
+# UBI debugging options
 #
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
 # CONFIG_BLK_DEV_COW_COMMON is not set
 CONFIG_BLK_DEV_LOOP=m
 # CONFIG_BLK_DEV_CRYPTOLOOP is not set
 CONFIG_BLK_DEV_NBD=m
-CONFIG_BLK_DEV_RAM=m
-CONFIG_BLK_DEV_RAM_COUNT=16
-CONFIG_BLK_DEV_RAM_SIZE=4096
-CONFIG_BLK_DEV_RAM_BLOCKSIZE=1024
+# CONFIG_BLK_DEV_RAM is not set
 # CONFIG_CDROM_PKTCDVD is not set
 # CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=y
+CONFIG_ATMEL_PWM=m
+CONFIG_ATMEL_TCLIB=y
+CONFIG_ATMEL_TCB_CLKSRC=y
+CONFIG_ATMEL_TCB_CLKSRC_BLOCK=0
+CONFIG_ATMEL_SSC=m
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_C2PORT is not set
 
 #
-# Misc devices
-#
-
-#
-# ATA/ATAPI/MFM/RLL support
+# EEPROM support
 #
-# CONFIG_IDE is not set
+# CONFIG_EEPROM_93CX6 is not set
 
 #
 # SCSI device support
 #
 # CONFIG_RAID_ATTRS is not set
 # CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
 # CONFIG_SCSI_NETLINK is not set
-
-#
-# Serial ATA (prod) and Parallel ATA (experimental) drivers
-#
 # CONFIG_ATA is not set
-
-#
-# Multi-device support (RAID and LVM)
-#
 # CONFIG_MD is not set
-
-#
-# Fusion MPT device support
-#
-# CONFIG_FUSION is not set
-
-#
-# IEEE 1394 (FireWire) support
-#
-
-#
-# I2O device support
-#
-
-#
-# Network device support
-#
 CONFIG_NETDEVICES=y
-CONFIG_DUMMY=y
+# CONFIG_DUMMY is not set
 # CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
 # CONFIG_EQUALIZER is not set
 CONFIG_TUN=m
-
-#
-# PHY device support
-#
-# CONFIG_PHYLIB is not set
-
-#
-# Ethernet (10 or 100Mbit)
-#
+# CONFIG_VETH is not set
+CONFIG_PHYLIB=y
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
 CONFIG_NET_ETHERNET=y
 CONFIG_MII=y
 CONFIG_MACB=y
+# CONFIG_DNET is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
 
 #
-# Ethernet (1000 Mbit)
-#
-
-#
-# Ethernet (10000 Mbit)
-#
-
-#
-# Token Ring devices
-#
-
-#
-# Wireless LAN (non-hamradio)
+# Wireless LAN
 #
-# CONFIG_NET_RADIO is not set
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
+# CONFIG_IWLWIFI_LEDS is not set
 
 #
-# Wan interfaces
+# Enable WiMAX (Networking options) to see the WiMAX drivers
 #
 # CONFIG_WAN is not set
 CONFIG_PPP=m
@@ -455,21 +492,13 @@ CONFIG_PPP_DEFLATE=m
 CONFIG_PPP_BSDCOMP=m
 # CONFIG_PPP_MPPE is not set
 # CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
 # CONFIG_SLIP is not set
 CONFIG_SLHC=m
-# CONFIG_SHAPER is not set
 # CONFIG_NETCONSOLE is not set
 # CONFIG_NETPOLL is not set
 # CONFIG_NET_POLL_CONTROLLER is not set
-
-#
-# ISDN subsystem
-#
 # CONFIG_ISDN is not set
-
-#
-# Telephony Support
-#
 # CONFIG_PHONE is not set
 
 #
@@ -487,6 +516,7 @@ CONFIG_SLHC=m
 # Character devices
 #
 # CONFIG_VT is not set
+CONFIG_DEVKMEM=y
 # CONFIG_SERIAL_NONSTANDARD is not set
 
 #
@@ -499,148 +529,201 @@ CONFIG_SLHC=m
 #
 CONFIG_SERIAL_ATMEL=y
 CONFIG_SERIAL_ATMEL_CONSOLE=y
+CONFIG_SERIAL_ATMEL_PDC=y
 # CONFIG_SERIAL_ATMEL_TTYAT is not set
 CONFIG_SERIAL_CORE=y
 CONFIG_SERIAL_CORE_CONSOLE=y
 CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
 # CONFIG_LEGACY_PTYS is not set
-
-#
-# IPMI
-#
 # CONFIG_IPMI_HANDLER is not set
-
-#
-# Watchdog Cards
-#
-# CONFIG_WATCHDOG is not set
 # CONFIG_HW_RANDOM is not set
-# CONFIG_RTC is not set
-# CONFIG_GEN_RTC is not set
-# CONFIG_DTLK is not set
 # CONFIG_R3964 is not set
 # CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_I2C is not set
+# CONFIG_SPI is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+# CONFIG_GPIO_SYSFS is not set
 
 #
-# TPM devices
+# Memory mapped GPIO expanders:
 #
-# CONFIG_TCG_TPM is not set
 
 #
-# I2C support
+# I2C GPIO expanders:
 #
-# CONFIG_I2C is not set
 
 #
-# SPI support
+# PCI GPIO expanders:
 #
-# CONFIG_SPI is not set
-# CONFIG_SPI_MASTER is not set
 
 #
-# Dallas's 1-wire bus
+# SPI GPIO expanders:
 #
 # CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
 
 #
-# Hardware Monitoring support
+# Sonics Silicon Backplane
 #
-# CONFIG_HWMON is not set
-# CONFIG_HWMON_VID is not set
+# CONFIG_SSB is not set
 
 #
 # Multifunction device drivers
 #
+# CONFIG_MFD_CORE is not set
 # CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_REGULATOR is not set
 
 #
 # Multimedia devices
 #
+
+#
+# Multimedia core support
+#
 # CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+# CONFIG_VIDEO_MEDIA is not set
 
 #
-# Digital Video Broadcasting Devices
+# Multimedia drivers
 #
-# CONFIG_DVB is not set
+# CONFIG_DAB is not set
 
 #
 # Graphics support
 #
-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
 # CONFIG_FB is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
 
 #
-# Sound
+# Display device support
 #
+# CONFIG_DISPLAY_SUPPORT is not set
 # CONFIG_SOUND is not set
-
-#
-# USB support
-#
+CONFIG_USB_SUPPORT=y
 # CONFIG_USB_ARCH_HAS_HCD is not set
 # CONFIG_USB_ARCH_HAS_OHCI is not set
 # CONFIG_USB_ARCH_HAS_EHCI is not set
-
-#
-# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
-#
-
-#
-# USB Gadget Support
-#
-# CONFIG_USB_GADGET is not set
-
-#
-# MMC/SD Card support
-#
-# CONFIG_MMC is not set
-
-#
-# LED devices
-#
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_GADGET_MUSB_HDRC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed;
+#
+CONFIG_USB_GADGET=m
+# CONFIG_USB_GADGET_DEBUG is not set
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+# CONFIG_USB_GADGET_DEBUG_FS is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_AT91 is not set
+CONFIG_USB_GADGET_ATMEL_USBA=y
+CONFIG_USB_ATMEL_USBA=m
+# CONFIG_USB_GADGET_FSL_USB2 is not set
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
+# CONFIG_USB_GADGET_PXA27X is not set
+# CONFIG_USB_GADGET_S3C2410 is not set
+# CONFIG_USB_GADGET_IMX is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_AMD5536UDC is not set
+# CONFIG_USB_GADGET_FSL_QE is not set
+# CONFIG_USB_GADGET_CI13XXX is not set
+# CONFIG_USB_GADGET_NET2280 is not set
+# CONFIG_USB_GADGET_GOKU is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+CONFIG_USB_ZERO=m
+# CONFIG_USB_ETH is not set
+CONFIG_USB_GADGETFS=m
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+CONFIG_USB_CDC_COMPOSITE=m
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+CONFIG_MMC_ATMELMCI=y
+# CONFIG_MEMSTICK is not set
 # CONFIG_NEW_LEDS is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+# CONFIG_RTC_DEBUG is not set
 
 #
-# LED drivers
-#
-
-#
-# LED Triggers
-#
-
-#
-# InfiniBand support
-#
-
-#
-# EDAC - error detection and reporting (RAS) (EXPERIMENTAL)
-#
-
-#
-# Real Time Clock
+# RTC interfaces
 #
-# CONFIG_RTC_CLASS is not set
+CONFIG_RTC_INTF_SYSFS=y
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
 
 #
-# DMA Engine support
+# SPI RTC drivers
 #
-# CONFIG_DMA_ENGINE is not set
 
 #
-# DMA Clients
+# Platform RTC drivers
 #
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_V3020 is not set
 
 #
-# DMA Devices
-#
-
-#
-# Auxiliary Display support
-#
-
-#
-# Virtualization
+# on-CPU RTC drivers
 #
+CONFIG_RTC_DRV_AT32AP700X=y
+# CONFIG_DMADEVICES is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
 
 #
 # File systems
@@ -648,23 +731,28 @@ CONFIG_UNIX98_PTYS=y
 CONFIG_EXT2_FS=m
 # CONFIG_EXT2_FS_XATTR is not set
 # CONFIG_EXT2_FS_XIP is not set
-# CONFIG_EXT3_FS is not set
-# CONFIG_EXT4DEV_FS is not set
+CONFIG_EXT3_FS=m
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=m
+# CONFIG_JBD_DEBUG is not set
+CONFIG_FS_MBCACHE=m
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set
-# CONFIG_FS_POSIX_ACL is not set
+CONFIG_FS_POSIX_ACL=y
+CONFIG_FILE_LOCKING=y
 # CONFIG_XFS_FS is not set
-# CONFIG_GFS2_FS is not set
 # CONFIG_OCFS2_FS is not set
-CONFIG_MINIX_FS=m
-# CONFIG_ROMFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_DNOTIFY is not set
 CONFIG_INOTIFY=y
 CONFIG_INOTIFY_USER=y
 # CONFIG_QUOTA is not set
-# CONFIG_DNOTIFY is not set
 # CONFIG_AUTOFS_FS is not set
 # CONFIG_AUTOFS4_FS is not set
-# CONFIG_FUSE_FS is not set
+CONFIG_FUSE_FS=m
 
 #
 # CD-ROM/DVD Filesystems
@@ -676,7 +764,7 @@ CONFIG_INOTIFY_USER=y
 # DOS/FAT/NT Filesystems
 #
 CONFIG_FAT_FS=m
-CONFIG_MSDOS_FS=m
+# CONFIG_MSDOS_FS is not set
 CONFIG_VFAT_FS=m
 CONFIG_FAT_DEFAULT_CODEPAGE=437
 CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
@@ -688,16 +776,13 @@ CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
 CONFIG_PROC_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
 CONFIG_SYSFS=y
 CONFIG_TMPFS=y
 # CONFIG_TMPFS_POSIX_ACL is not set
 # CONFIG_HUGETLB_PAGE is not set
-CONFIG_RAMFS=y
 CONFIG_CONFIGFS_FS=m
-
-#
-# Miscellaneous filesystems
-#
+CONFIG_MISC_FILESYSTEMS=y
 # CONFIG_ADFS_FS is not set
 # CONFIG_AFFS_FS is not set
 # CONFIG_HFS_FS is not set
@@ -708,42 +793,76 @@ CONFIG_CONFIGFS_FS=m
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_FS_DEBUG=0
 CONFIG_JFFS2_FS_WRITEBUFFER=y
-# CONFIG_JFFS2_SUMMARY is not set
-# CONFIG_JFFS2_FS_XATTR is not set
-# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_FS_XATTR=y
+CONFIG_JFFS2_FS_POSIX_ACL=y
+CONFIG_JFFS2_FS_SECURITY=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
 CONFIG_JFFS2_ZLIB=y
+CONFIG_JFFS2_LZO=y
 CONFIG_JFFS2_RTIME=y
-# CONFIG_JFFS2_RUBIN is not set
+CONFIG_JFFS2_RUBIN=y
+# CONFIG_JFFS2_CMODE_NONE is not set
+# CONFIG_JFFS2_CMODE_PRIORITY is not set
+# CONFIG_JFFS2_CMODE_SIZE is not set
+CONFIG_JFFS2_CMODE_FAVOURLZO=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_XATTR=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_UBIFS_FS_DEBUG is not set
 # CONFIG_CRAMFS is not set
+# CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
 # CONFIG_HPFS_FS is not set
 # CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
 # CONFIG_SYSV_FS is not set
 # CONFIG_UFS_FS is not set
-
-#
-# Network File Systems
-#
-# CONFIG_NFS_FS is not set
-# CONFIG_NFSD is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+CONFIG_ROOT_NFS=y
+CONFIG_NFSD=m
+CONFIG_NFSD_V2_ACL=y
+CONFIG_NFSD_V3=y
+CONFIG_NFSD_V3_ACL=y
+CONFIG_NFSD_V4=y
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_EXPORTFS=m
+CONFIG_NFS_ACL_SUPPORT=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+CONFIG_SUNRPC_GSS=y
+# CONFIG_SUNRPC_REGISTER_V4 is not set
+CONFIG_RPCSEC_GSS_KRB5=y
+# CONFIG_RPCSEC_GSS_SPKM3 is not set
 # CONFIG_SMB_FS is not set
-# CONFIG_CIFS is not set
+CONFIG_CIFS=m
+# CONFIG_CIFS_STATS is not set
+# CONFIG_CIFS_WEAK_PW_HASH is not set
+CONFIG_CIFS_XATTR=y
+# CONFIG_CIFS_POSIX is not set
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_EXPERIMENTAL is not set
 # CONFIG_NCP_FS is not set
 # CONFIG_CODA_FS is not set
 # CONFIG_AFS_FS is not set
-# CONFIG_9P_FS is not set
 
 #
 # Partition Types
 #
 # CONFIG_PARTITION_ADVANCED is not set
 CONFIG_MSDOS_PARTITION=y
-
-#
-# Native Language Support
-#
-CONFIG_NLS=m
-CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="utf-8"
 CONFIG_NLS_CODEPAGE_437=m
 # CONFIG_NLS_CODEPAGE_737 is not set
 # CONFIG_NLS_CODEPAGE_775 is not set
@@ -781,69 +900,188 @@ CONFIG_NLS_ISO8859_1=m
 # CONFIG_NLS_ISO8859_15 is not set
 # CONFIG_NLS_KOI8_R is not set
 # CONFIG_NLS_KOI8_U is not set
-CONFIG_NLS_UTF8=m
-
-#
-# Distributed Lock Manager
-#
+CONFIG_NLS_UTF8=y
 # CONFIG_DLM is not set
 
 #
 # Kernel hacking
 #
-CONFIG_TRACE_IRQFLAGS_SUPPORT=y
-# CONFIG_PRINTK_TIME is not set
+CONFIG_PRINTK_TIME=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
 CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_UNUSED_SYMBOLS is not set
 CONFIG_DEBUG_FS=y
 # CONFIG_HEADERS_CHECK is not set
 CONFIG_DEBUG_KERNEL=y
 # CONFIG_DEBUG_SHIRQ is not set
-CONFIG_LOG_BUF_SHIFT=14
 CONFIG_DETECT_SOFTLOCKUP=y
+# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
+CONFIG_SCHED_DEBUG=y
 # CONFIG_SCHEDSTATS is not set
 CONFIG_TIMER_STATS=y
+# CONFIG_DEBUG_OBJECTS is not set
 # CONFIG_DEBUG_SLAB is not set
+CONFIG_DEBUG_PREEMPT=y
 # CONFIG_DEBUG_RT_MUTEXES is not set
 # CONFIG_RT_MUTEX_TESTER is not set
 # CONFIG_DEBUG_SPINLOCK is not set
 # CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
 # CONFIG_DEBUG_SPINLOCK_SLEEP is not set
 # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
 # CONFIG_DEBUG_KOBJECT is not set
 CONFIG_DEBUG_BUGVERBOSE=y
 # CONFIG_DEBUG_INFO is not set
 # CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
 # CONFIG_DEBUG_LIST is not set
-CONFIG_FRAME_POINTER=y
-CONFIG_FORCED_INLINING=y
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_FRAME_POINTER is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
 # CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
 # CONFIG_FAULT_INJECTION is not set
-# CONFIG_KPROBES is not set
+
+#
+# Tracers
+#
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_PREEMPT_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_BOOT_TRACER is not set
+# CONFIG_TRACE_BRANCH_PROFILING is not set
+# CONFIG_DYNAMIC_PRINTK_DEBUG is not set
+# CONFIG_SAMPLES is not set
 
 #
 # Security options
 #
 # CONFIG_KEYS is not set
 # CONFIG_SECURITY is not set
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
+CONFIG_CRYPTO_CBC=y
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
+CONFIG_CRYPTO_MD5=y
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
+CONFIG_CRYPTO_LZO=y
 
 #
-# Cryptographic options
+# Random Number Generation
 #
-# CONFIG_CRYPTO is not set
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
 
 #
 # Library routines
 #
 CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
 CONFIG_CRC_CCITT=m
-# CONFIG_CRC16 is not set
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
 CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
 # CONFIG_LIBCRC32C is not set
 CONFIG_AUDIT_GENERIC=y
 CONFIG_ZLIB_INFLATE=y
 CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+CONFIG_GENERIC_ALLOCATOR=y
 CONFIG_PLIST=y
 CONFIG_HAS_IOMEM=y
 CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
diff --git a/recipes/linux/linux_2.6.29.bb b/recipes/linux/linux_2.6.29.bb
index e99802b..a87c82a 100644
--- a/recipes/linux/linux_2.6.29.bb
+++ b/recipes/linux/linux_2.6.29.bb
@@ -6,6 +6,7 @@ S = "${WORKDIR}/linux-2.6.29"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_tosa = "1"
 DEFAULT_PREFERENCE_vortex86sx = "1"
+DEFAULT_PREFERENCE_atngw100 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.29.tar.bz2 \
            file://defconfig"
-- 
1.6.3.1





