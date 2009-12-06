Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsU-0000ZB-8y
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:57 +0100
Received: by mail-ew0-f224.google.com with SMTP id 24so4866221ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=UY/SiICCeUYaS27YaSffWU/iWXNWVxj/EHtMQlMczVs=;
	b=EWYKvylN8yXfFZB0yquHOoHV9I3081pgFo3NuI9udB+l/sq9qui/vzo+4knrGsajOu
	Rz+AEbd9sMwhHZHORk24NoH+GKkus4eZlOc0qwPWI1iznUXE5cu9y3LGt2FaHWdnjzoH
	6N9eFp+Calj6zQteb8i5vUiixP9fThX+grr2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NfKeICq756+UZdYzzvw/Kt+9AckQw5obLtsyLm2yWRk6MJTIgJGFnmsS1nsfdXB4Dg
	i37i71Chgh+GFgcerw/NVgU6Ls3QrNWBiFWWYMZ45LiqpwR6C6TGr9wTzNurLZuhEcNF
	b6Hu3iOcXVBpWTcxclENo8XZEJsuIm1SfwCnU=
Received: by 10.213.104.10 with SMTP id m10mr6294189ebo.62.1260139517515;
	Sun, 06 Dec 2009 14:45:17 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:16 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:53 +0100
Message-Id: <1260139496-21442-18-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-17-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<1260139496-21442-11-git-send-email-leon@sidebranch.com>
	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
	<1260139496-21442-13-git-send-email-leon@sidebranch.com>
	<1260139496-21442-14-git-send-email-leon@sidebranch.com>
	<1260139496-21442-15-git-send-email-leon@sidebranch.com>
	<1260139496-21442-16-git-send-email-leon@sidebranch.com>
	<1260139496-21442-17-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] linux-nios2-2.6.28: Linux kernel for nios2 machines.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:47:01 -0000

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 recipes/linux/linux-nios2/2.6.28+nios2/defconfig  |  554 +++
 recipes/linux/linux-nios2/2.6.28+nios2/procinfo.h |   24 +
 recipes/linux/linux-nios2/2.6.28+nios2/system.ptf | 4416 +++++++++++++++++++++
 recipes/linux/linux-nios2_2.6.28.bb               |   36 +
 4 files changed, 5030 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-nios2/2.6.28+nios2/defconfig
 create mode 100644 recipes/linux/linux-nios2/2.6.28+nios2/procinfo.h
 create mode 100644 recipes/linux/linux-nios2/2.6.28+nios2/system.ptf
 create mode 100644 recipes/linux/linux-nios2_2.6.28.bb

diff --git a/recipes/linux/linux-nios2/2.6.28+nios2/defconfig b/recipes/linux/linux-nios2/2.6.28+nios2/defconfig
new file mode 100644
index 0000000..d8bfbf8
--- /dev/null
+++ b/recipes/linux/linux-nios2/2.6.28+nios2/defconfig
@@ -0,0 +1,554 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.28
+# Tue Nov  3 10:21:38 2009
+#
+# CONFIG_FPU is not set
+CONFIG_ZONE_DMA=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_UID16=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+# CONFIG_RWSEM_XCHGADD_ALGORITHM is not set
+CONFIG_GENERIC_FIND_NEXT_BIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_GENERIC_TIME=y
+CONFIG_NO_IOPORT=y
+# CONFIG_HOTPLUG_CPU is not set
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_LOCK_KERNEL=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+# CONFIG_SYSVIPC is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_CGROUPS is not set
+CONFIG_GROUP_SCHED=y
+CONFIG_FAIR_GROUP_SCHED=y
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=y
+# CONFIG_CGROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="/home/walter/sandbox/SYGEG1/angstrom-dev//deploy/uclibc/images/sygeg1/initramfs_root.cpio"
+CONFIG_INITRAMFS_ROOT_UID=500
+CONFIG_INITRAMFS_ROOT_GID=500
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_EMBEDDED=y
+# CONFIG_SYSCTL_SYSCALL is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_HOTPLUG is not set
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+# CONFIG_ELF_CORE is not set
+CONFIG_COMPAT_BRK=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_ANON_INODES=y
+# CONFIG_EPOLL is not set
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+# CONFIG_AIO is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_TINY_SHMEM=y
+CONFIG_BASE_SMALL=0
+# CONFIG_MODULES is not set
+# CONFIG_BLOCK is not set
+CONFIG_CLASSIC_RCU=y
+# CONFIG_FREEZER is not set
+
+#
+# Processor type and features
+#
+
+#
+# Platform dependant setup
+#
+CONFIG_NIOS2=y
+# CONFIG_MMU is not set
+CONFIG_AXON_CARD=y
+# CONFIG_MICROTRONIX_UKIT is not set
+# CONFIG_MICROTRONIX_STRATIX is not set
+# CONFIG_MICROTRONIX_CYCLONE is not set
+# CONFIG_MICROTRONIX_PSK is not set
+# CONFIG_ALTERA_STRATIX is not set
+# CONFIG_ALTERA_STRATIX_PRO is not set
+# CONFIG_ALTERA_STRATIX_II is not set
+# CONFIG_ALTERA_CYCLONE is not set
+# CONFIG_ALTERA_CYCLONE_II is not set
+# CONFIG_ALTERA_CYCLONE_1C12_EVAL is not set
+# CONFIG_ALTERA_DE2 is not set
+# CONFIG_ALTERA_NEEK_C3 is not set
+CONFIG_AXON_SYGEG1=y
+# CONFIG_NIOS2_HW_MUL_OFF is not set
+CONFIG_NIOS2_HW_MUL=y
+# CONFIG_NIOS2_HW_MULX is not set
+
+#
+# Platform drivers Options
+#
+# CONFIG_AVALON_DMA is not set
+# CONFIG_PCI_ALTPCI is not set
+# CONFIG_I2C_NIOS2_GPIO is not set
+CONFIG_ALTERA_REMOTE_UPDATE=y
+
+#
+# Miscellaneous Options
+#
+CONFIG_EXCALIBUR=y
+# CONFIG_BREAK_ON_START is not set
+CONFIG_FORCE_MAX_ZONEORDER=14
+CONFIG_RAMKERNEL=y
+# CONFIG_PREEMPT_NONE is not set
+# CONFIG_PREEMPT_VOLUNTARY is not set
+CONFIG_PREEMPT=y
+# CONFIG_PREEMPT_RCU is not set
+CONFIG_HZ_100=y
+# CONFIG_HZ_250 is not set
+# CONFIG_HZ_300 is not set
+# CONFIG_HZ_1000 is not set
+CONFIG_HZ=100
+# CONFIG_SCHED_HRTICK is not set
+CONFIG_CMDLINE=""
+# CONFIG_PASS_CMDLINE is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4
+# CONFIG_RESOURCES_64BIT is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=1
+CONFIG_VIRT_TO_BUS=y
+CONFIG_BOOT_LINK_OFFSET=0x00500000
+
+#
+# Bus options (PCI, PCMCIA, EISA, MCA, ISA)
+#
+# CONFIG_PCI is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+
+#
+# Executable file formats
+#
+CONFIG_BINFMT_FLAT=y
+CONFIG_BINFMT_ZFLAT=y
+# CONFIG_BINFMT_SHARED_FLAT is not set
+# CONFIG_HAVE_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+# CONFIG_PM is not set
+# CONFIG_NET is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_REDBOOT_PARTS is not set
+# CONFIG_MTD_CMDLINE_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_CFI=y
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_GEN_PROBE=y
+# CONFIG_MTD_CFI_ADV_OPTIONS is not set
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
+CONFIG_MTD_CFI_INTELEXT=y
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
+CONFIG_MTD_PHYSMAP_START=0x8000000
+CONFIG_MTD_PHYSMAP_LEN=0
+CONFIG_MTD_PHYSMAP_BANKWIDTH=2
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
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
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_MISC_DEVICES=y
+# CONFIG_AXON_AXONBUS is not set
+CONFIG_AXON_AXONBUS_HWA=y
+# CONFIG_EEPROM_93CX6 is not set
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_C2PORT is not set
+
+#
+# SCSI device support
+#
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+# CONFIG_INPUT is not set
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
+# CONFIG_VT is not set
+# CONFIG_DEVKMEM is not set
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_NIOS_LCD_16207 is not set
+# CONFIG_NIOS_BUTTON is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+CONFIG_SERIAL_ALTERA_UART=y
+CONFIG_SERIAL_ALTERA_UART_MAXPORTS=1
+CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
+CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
+# CONFIG_UNIX98_PTYS is not set
+CONFIG_LEGACY_PTYS=y
+CONFIG_LEGACY_PTY_COUNT=10
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_RTC is not set
+# CONFIG_GEN_RTC is not set
+# CONFIG_R3964 is not set
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
+CONFIG_I2C_OCORES=y
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
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+CONFIG_AT24=y
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_SENSORS_MAX7311=y
+CONFIG_SENSORS_MAX7311_NUMCLIENTS=1
+CONFIG_SENSORS_MAX7311_ADDRESSES="0x24"
+# CONFIG_SENSORS_LMH1982 is not set
+# CONFIG_SENSORS_ADM1178 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+# CONFIG_SPI is not set
+CONFIG_W1=y
+
+#
+# 1-wire Bus Masters
+#
+CONFIG_W1_MASTER_DS2482=y
+
+#
+# 1-wire Slaves
+#
+# CONFIG_W1_SLAVE_THERM is not set
+CONFIG_W1_SLAVE_SMEM=y
+# CONFIG_W1_SLAVE_DS2433 is not set
+# CONFIG_W1_SLAVE_DS2760 is not set
+# CONFIG_W1_SLAVE_BQ27000 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+CONFIG_WATCHDOG=y
+# CONFIG_WATCHDOG_NOWAYOUT is not set
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+CONFIG_ALTERA_REMOTE_UPDATE_WATCHDOG=y
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
+# CONFIG_MFD_TMIO is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
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
+# CONFIG_FB is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+# CONFIG_SOUND is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_RTC_CLASS is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
+
+#
+# File systems
+#
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+# CONFIG_PROC_SYSCTL is not set
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
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
+# CONFIG_NLS is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=y
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=y
+# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_INFO=y
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_FAULT_INJECTION is not set
+
+#
+# Tracers
+#
+# CONFIG_PREEMPT_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_BOOT_TRACER is not set
+# CONFIG_DYNAMIC_PRINTK_DEBUG is not set
+# CONFIG_SAMPLES is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+# CONFIG_CRYPTO is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
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
+CONFIG_HAS_DMA=y
diff --git a/recipes/linux/linux-nios2/2.6.28+nios2/procinfo.h b/recipes/linux/linux-nios2/2.6.28+nios2/procinfo.h
new file mode 100644
index 0000000..8cdf828
--- /dev/null
+++ b/recipes/linux/linux-nios2/2.6.28+nios2/procinfo.h
@@ -0,0 +1,24 @@
+/*
+ *  linux/include/asm-arm/procinfo.h
+ *
+ *  Copyright (C) 1996-1999 Russell King
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __ASM_PROCINFO_H
+#define __ASM_PROCINFO_H
+
+#define HWCAP_SWP	1
+#define HWCAP_HALF	2
+#define HWCAP_THUMB	4
+#define HWCAP_26BIT	8	/* Play it safe */
+#define HWCAP_FAST_MULT	16
+#define HWCAP_FPA	32
+#define HWCAP_VFP	64
+#define HWCAP_EDSP	128
+#define HWCAP_JAVA	256
+#define HWCAP_IWMMXT	512
+#define HWCAP_CRUNCH	1024
+#endif
diff --git a/recipes/linux/linux-nios2/2.6.28+nios2/system.ptf b/recipes/linux/linux-nios2/2.6.28+nios2/system.ptf
new file mode 100644
index 0000000..1a61984
--- /dev/null
+++ b/recipes/linux/linux-nios2/2.6.28+nios2/system.ptf
@@ -0,0 +1,4416 @@
+SYSTEM sys
+{
+   System_Wizard_Version = "9.00";
+   System_Wizard_Build = "132";
+   Builder_Application = "sopc_builder_ca";
+   WIZARD_SCRIPT_ARGUMENTS 
+   {
+      hdl_language = "verilog";
+      device_family = "CYCLONEIII";
+      device_family_id = "CYCLONEIII";
+      generate_sdk = "0";
+      do_build_sim = "0";
+      hardcopy_compatible = "0";
+      CLOCKS 
+      {
+         CLOCK clk_66
+         {
+            frequency = "66667000";
+            source = "External";
+            Is_Clock_Source = "0";
+            display_name = "clk_66";
+            pipeline = "0";
+            clock_module_connection_point_for_c2h = "clk_66.clk";
+         }
+         CLOCK altmemddr_0_phy_clk
+         {
+            frequency = "66665000";
+            source = "";
+            Is_Clock_Source = "1";
+            display_name = "phy_clk from altmemddr_0";
+            pipeline = "0";
+            clock_module_connection_point_for_c2h = "altmemddr_0.sysclk";
+         }
+         CLOCK altmemddr_0_phy_clk_out
+         {
+            frequency = "66665000";
+            source = "altmemddr_0_phy_clk";
+            Is_Clock_Source = "0";
+            display_name = "altmemddr_0_phy_clk_out";
+         }
+         CLOCK altmemddr_0_aux_full_rate_clk
+         {
+            frequency = "133330000";
+            source = "";
+            Is_Clock_Source = "1";
+            display_name = "aux_full_rate_clk from altmemddr_0";
+            pipeline = "0";
+            clock_module_connection_point_for_c2h = "altmemddr_0.auxfull";
+         }
+         CLOCK altmemddr_0_aux_full_rate_clk_out
+         {
+            frequency = "133330000";
+            source = "altmemddr_0_aux_full_rate_clk";
+            Is_Clock_Source = "0";
+            display_name = "altmemddr_0_aux_full_rate_clk_out";
+         }
+         CLOCK altmemddr_0_aux_half_rate_clk
+         {
+            frequency = "66665000";
+            source = "";
+            Is_Clock_Source = "1";
+            display_name = "aux_half_rate_clk from altmemddr_0";
+            pipeline = "0";
+            clock_module_connection_point_for_c2h = "altmemddr_0.auxhalf";
+         }
+         CLOCK altmemddr_0_aux_half_rate_clk_out
+         {
+            frequency = "66665000";
+            source = "altmemddr_0_aux_half_rate_clk";
+            Is_Clock_Source = "0";
+            display_name = "altmemddr_0_aux_half_rate_clk_out";
+         }
+         CLOCK clk_33
+         {
+            frequency = "33330000";
+            source = "External";
+            Is_Clock_Source = "0";
+            display_name = "clk_33";
+            pipeline = "0";
+            clock_module_connection_point_for_c2h = "clk_33.clk";
+         }
+      }
+      clock_freq = "66667000";
+      clock_freq = "66667000";
+      board_class = "";
+      view_master_columns = "1";
+      view_master_priorities = "0";
+      generate_hdl = "";
+      bustype_column_width = "0";
+      clock_column_width = "80";
+      name_column_width = "75";
+      desc_column_width = "75";
+      base_column_width = "75";
+      end_column_width = "75";
+      BOARD_INFO 
+      {
+         altera_avalon_cfi_flash 
+         {
+            reference_designators = "";
+         }
+      }
+      do_log_history = "0";
+   }
+   MODULE cpu_0
+   {
+      MASTER instruction_master
+      {
+         PORT_WIRING 
+         {
+            PORT clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "0";
+            }
+            PORT reset_n
+            {
+               type = "reset_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "0";
+            }
+            PORT i_address
+            {
+               type = "address";
+               width = "29";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT i_read
+            {
+               type = "read";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT i_readdata
+            {
+               type = "readdata";
+               width = "32";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT i_readdatavalid
+            {
+               type = "readdatavalid";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT i_waitrequest
+            {
+               type = "waitrequest";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Bus_Type = "avalon";
+            Is_Asynchronous = "0";
+            DBS_Big_Endian = "0";
+            Adapts_To = "";
+            Do_Stream_Reads = "0";
+            Do_Stream_Writes = "0";
+            Max_Address_Width = "32";
+            Data_Width = "32";
+            Address_Width = "29";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "";
+            Linewrap_Bursts = "";
+            Burst_On_Burst_Boundaries_Only = "";
+            Always_Burst_Max_Burst = "";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            Is_Instruction_Master = "1";
+            Is_Readable = "1";
+            Is_Writeable = "0";
+            Address_Group = "0";
+            Has_IRQ = "0";
+            Irq_Scheme = "individual_requests";
+            Interrupt_Range = "0-0";
+         }
+         MEMORY_MAP 
+         {
+            Entry cpu_0/jtag_debug_module
+            {
+               address = "0x10001000";
+               span = "0x00000800";
+               is_bridge = "0";
+            }
+            Entry cfi_flash_0/s1
+            {
+               address = "0x00000000";
+               span = "0x04000000";
+               is_bridge = "0";
+            }
+            Entry altmemddr_0/s1
+            {
+               address = "0x08000000";
+               span = "0x08000000";
+               is_bridge = "0";
+            }
+         }
+      }
+      MASTER custom_instruction_master
+      {
+         SYSTEM_BUILDER_INFO 
+         {
+            Bus_Type = "nios_custom_instruction";
+            Data_Width = "32";
+            Address_Width = "8";
+            Is_Custom_Instruction = "1";
+            Is_Enabled = "0";
+            Max_Address_Width = "8";
+            Base_Address = "N/A";
+            Is_Visible = "0";
+         }
+         PORT_WIRING 
+         {
+            PORT dataa
+            {
+               type = "dataa";
+               width = "32";
+               direction = "output";
+            }
+            PORT datab
+            {
+               type = "datab";
+               width = "32";
+               direction = "output";
+            }
+            PORT result
+            {
+               type = "result";
+               width = "32";
+               direction = "input";
+            }
+            PORT clk_en
+            {
+               type = "clk_en";
+               width = "1";
+               direction = "output";
+            }
+            PORT reset
+            {
+               type = "reset";
+               width = "1";
+               direction = "output";
+            }
+            PORT start
+            {
+               type = "start";
+               width = "1";
+               direction = "output";
+            }
+            PORT done
+            {
+               type = "done";
+               width = "1";
+               direction = "input";
+            }
+            PORT n
+            {
+               type = "n";
+               width = "8";
+               direction = "output";
+            }
+            PORT a
+            {
+               type = "a";
+               width = "5";
+               direction = "output";
+            }
+            PORT b
+            {
+               type = "b";
+               width = "5";
+               direction = "output";
+            }
+            PORT c
+            {
+               type = "c";
+               width = "5";
+               direction = "output";
+            }
+            PORT readra
+            {
+               type = "readra";
+               width = "1";
+               direction = "output";
+            }
+            PORT readrb
+            {
+               type = "readrb";
+               width = "1";
+               direction = "output";
+            }
+            PORT writerc
+            {
+               type = "writerc";
+               width = "1";
+               direction = "output";
+            }
+         }
+      }
+      SLAVE jtag_debug_module
+      {
+         SYSTEM_BUILDER_INFO 
+         {
+            Bus_Type = "avalon";
+            Write_Wait_States = "0cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "dynamic";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Address_Span = "2048";
+            Read_Latency = "0";
+            Is_Memory_Device = "1";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "32";
+            Address_Width = "9";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            Accepts_External_Connections = "1";
+            Requires_Internal_Connections = "";
+            MASTERED_BY cpu_0/instruction_master
+            {
+               priority = "1";
+               Offset_Address = "0x10001000";
+            }
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x10001000";
+            }
+            Base_Address = "0x10001000";
+            Is_Readable = "1";
+            Is_Writeable = "1";
+            Uses_Tri_State_Data_Bus = "0";
+            Has_IRQ = "0";
+            JTAG_Hub_Base_Id = "1118278";
+            JTAG_Hub_Instance_Id = "0";
+            Address_Group = "0";
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "NC";
+            }
+         }
+         PORT_WIRING 
+         {
+            PORT jtag_debug_module_address
+            {
+               type = "address";
+               width = "9";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT jtag_debug_module_begintransfer
+            {
+               type = "begintransfer";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT jtag_debug_module_byteenable
+            {
+               type = "byteenable";
+               width = "4";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT jtag_debug_module_debugaccess
+            {
+               type = "debugaccess";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT jtag_debug_module_readdata
+            {
+               type = "readdata";
+               width = "32";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT jtag_debug_module_resetrequest
+            {
+               type = "resetrequest";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT jtag_debug_module_select
+            {
+               type = "chipselect";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT jtag_debug_module_write
+            {
+               type = "write";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT jtag_debug_module_writedata
+            {
+               type = "writedata";
+               width = "32";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT jtag_debug_module_clk
+            {
+               Is_Enabled = "1";
+               direction = "input";
+               type = "clk";
+               width = "1";
+            }
+            PORT jtag_debug_module_reset
+            {
+               Is_Enabled = "1";
+               direction = "input";
+               type = "reset";
+               width = "1";
+            }
+            PORT reset_n
+            {
+               Is_Enabled = "1";
+               direction = "input";
+               type = "reset_n";
+               width = "1";
+            }
+         }
+      }
+      MASTER data_master
+      {
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Irq_Scheme = "individual_requests";
+            Bus_Type = "avalon";
+            Is_Asynchronous = "0";
+            DBS_Big_Endian = "0";
+            Adapts_To = "";
+            Do_Stream_Reads = "0";
+            Do_Stream_Writes = "0";
+            Max_Address_Width = "32";
+            Data_Width = "32";
+            Address_Width = "29";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            Is_Data_Master = "1";
+            Address_Group = "0";
+            Is_Readable = "1";
+            Is_Writeable = "1";
+            Interrupt_Range = "0-31";
+         }
+         PORT_WIRING 
+         {
+            PORT d_irq
+            {
+               type = "irq";
+               width = "32";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT d_address
+            {
+               type = "address";
+               width = "29";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT d_byteenable
+            {
+               type = "byteenable";
+               width = "4";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT d_read
+            {
+               type = "read";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT d_readdata
+            {
+               type = "readdata";
+               width = "32";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT d_readdatavalid
+            {
+               type = "readdatavalid";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT d_waitrequest
+            {
+               type = "waitrequest";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT d_write
+            {
+               type = "write";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT d_writedata
+            {
+               type = "writedata";
+               width = "32";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT jtag_debug_module_debugaccess_to_roms
+            {
+               type = "debugaccess";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT clk
+            {
+               Is_Enabled = "1";
+               direction = "input";
+               type = "clk";
+               width = "1";
+            }
+         }
+         MEMORY_MAP 
+         {
+            Entry cpu_0/jtag_debug_module
+            {
+               address = "0x10001000";
+               span = "0x00000800";
+               is_bridge = "0";
+            }
+            Entry cfi_flash_0/s1
+            {
+               address = "0x00000000";
+               span = "0x04000000";
+               is_bridge = "0";
+            }
+            Entry timer_0/s1
+            {
+               address = "0x10000080";
+               span = "0x00000020";
+               is_bridge = "0";
+            }
+            Entry uart_0/s1
+            {
+               address = "0x10000000";
+               span = "0x00000020";
+               is_bridge = "0";
+            }
+            Entry altmemddr_0/s1
+            {
+               address = "0x08000000";
+               span = "0x08000000";
+               is_bridge = "0";
+            }
+            Entry opencores_i2c_master_0/s1
+            {
+               address = "0x1c100000";
+               span = "0x00000020";
+               is_bridge = "0";
+            }
+            Entry opencores_i2c_master_1/s1
+            {
+               address = "0x1c200000";
+               span = "0x00000020";
+               is_bridge = "0";
+            }
+            Entry opencores_i2c_master_2/s1
+            {
+               address = "0x1c300000";
+               span = "0x00000020";
+               is_bridge = "0";
+            }
+            Entry opencores_i2c_master_3/s1
+            {
+               address = "0x1c400000";
+               span = "0x00000020";
+               is_bridge = "0";
+            }
+            Entry opencores_i2c_master_4/s1
+            {
+               address = "0x1c500000";
+               span = "0x00000020";
+               is_bridge = "0";
+            }
+            Entry axonbus_0/ctrl
+            {
+               address = "0x1c600000";
+               span = "0x00000040";
+               is_bridge = "0";
+            }
+            Entry remote_update_cycloneiii_0/s1
+            {
+               address = "0x11000000";
+               span = "0x00000100";
+               is_bridge = "0";
+            }
+            Entry avalon_bus_contents_0/s1
+            {
+               address = "0x1c000000";
+               span = "0x00000800";
+               is_bridge = "0";
+            }
+         }
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         cache_has_dcache = "1";
+         cache_dcache_size = "2048";
+         cache_dcache_line_size = "32";
+         cache_dcache_bursts = "0";
+         cache_dcache_ram_block_type = "AUTO";
+         num_tightly_coupled_data_masters = "0";
+         gui_num_tightly_coupled_data_masters = "0";
+         gui_include_tightly_coupled_data_masters = "0";
+         gui_omit_avalon_data_master = "0";
+         cache_has_icache = "1";
+         cache_icache_size = "4096";
+         cache_icache_line_size = "32";
+         cache_icache_ram_block_type = "AUTO";
+         cache_icache_bursts = "0";
+         num_tightly_coupled_instruction_masters = "0";
+         gui_num_tightly_coupled_instruction_masters = "0";
+         gui_include_tightly_coupled_instruction_masters = "0";
+         debug_level = "2";
+         include_oci = "1";
+         oci_num_xbrk = "0";
+         oci_num_dbrk = "0";
+         oci_dbrk_trace = "0";
+         oci_dbrk_pairs = "0";
+         oci_onchip_trace = "0";
+         oci_offchip_trace = "0";
+         oci_data_trace = "0";
+         include_third_party_debug_port = "0";
+         oci_trace_addr_width = "7";
+         oci_debugreq_signals = "0";
+         oci_trigger_arming = "1";
+         oci_embedded_pll = "0";
+         oci_assign_jtag_instance_id = "0";
+         oci_jtag_instance_id = "0";
+         oci_num_pm = "0";
+         oci_pm_width = "32";
+         performance_counters_present = "0";
+         performance_counters_width = "32";
+         always_encrypt = "1";
+         debug_simgen = "0";
+         activate_model_checker = "0";
+         activate_test_end_checker = "0";
+         activate_trace = "1";
+         activate_monitors = "1";
+         clear_x_bits_ld_non_bypass = "1";
+         bit_31_bypass_dcache = "1";
+         hdl_sim_caches_cleared = "1";
+         hbreak_test = "0";
+         allow_full_address_range = "0";
+         extra_exc_info = "0";
+         branch_prediction_type = "Dynamic";
+         bht_ptr_sz = "8";
+         bht_index_pc_only = "0";
+         gui_branch_prediction_type = "Automatic";
+         full_waveform_signals = "0";
+         export_pcb = "0";
+         avalon_debug_port_present = "0";
+         illegal_instructions_trap = "0";
+         illegal_memory_access_detection = "0";
+         illegal_mem_exc = "0";
+         slave_access_error_exc = "0";
+         division_error_exc = "0";
+         eic_present = "0";
+         num_shadow_reg_sets = "0";
+         gui_mmu_present = "0";
+         mmu_present = "0";
+         process_id_num_bits = "8";
+         tlb_ptr_sz = "7";
+         tlb_num_ways = "16";
+         udtlb_num_entries = "6";
+         uitlb_num_entries = "4";
+         fast_tlb_miss_exc_slave = "";
+         fast_tlb_miss_exc_offset = "0x00000000";
+         mpu_present = "0";
+         mpu_num_data_regions = "8";
+         mpu_num_inst_regions = "8";
+         mpu_min_data_region_size_log2 = "12";
+         mpu_min_inst_region_size_log2 = "12";
+         mpu_use_limit = "0";
+         hardware_divide_present = "1";
+         gui_hardware_divide_setting = "1";
+         hardware_multiply_present = "1";
+         hardware_multiply_impl = "embedded_mul";
+         shift_rot_impl = "fast_le_shift";
+         gui_hardware_multiply_setting = "embedded_mul_fast_le_shift";
+         reset_slave = "cfi_flash_0/s1";
+         break_slave = "cpu_0/jtag_debug_module";
+         exc_slave = "altmemddr_0/s1";
+         reset_offset = "0x00400000";
+         break_offset = "0x00000020";
+         exc_offset = "0x00000020";
+         cpu_reset = "0";
+         CPU_Implementation = "fast";
+         cpu_selection = "f";
+         device_family_id = "CYCLONEIII";
+         address_stall_present = "1";
+         dsp_block_supports_shift = "0";
+         mrams_present = "0";
+         cpuid_value = "0";
+         dont_overwrite_cpuid = "1";
+         allow_legacy_sdk = "1";
+         legacy_sdk_support = "1";
+         inst_addr_width = "29";
+         data_addr_width = "29";
+         CPU_Architecture = "nios2";
+         cache_icache_burst_type = "none";
+         oci_sync_depth = "2";
+         hardware_multiply_omits_msw = "1";
+         big_endian = "0";
+         break_slave_override = "";
+         break_offset_override = "0x20";
+         altera_show_unreleased_features = "0";
+         altera_show_unpublished_features = "0";
+         altera_internal_test = "0";
+         alt_log_port_base = "";
+         alt_log_port_type = "";
+         cpuid_sz = "1";
+         gui_illegal_instructions_trap = "0";
+         advanced_exc = "0";
+         gui_illegal_memory_access_detection = "0";
+         cache_omit_dcache = "0";
+         cache_omit_icache = "0";
+         omit_instruction_master = "0";
+         omit_data_master = "0";
+         ras_ptr_sz = "4";
+         jtb_ptr_sz = "5";
+         ibuf_ptr_sz = "4";
+         always_bypass_dcache = "0";
+         iss_trace_on = "0";
+         iss_trace_warning = "1";
+         iss_trace_info = "1";
+         iss_trace_disassembly = "0";
+         iss_trace_registers = "0";
+         iss_trace_instr_count = "0";
+         iss_software_debug = "0";
+         iss_software_debug_port = "9996";
+         iss_memory_dump_start = "";
+         iss_memory_dump_end = "";
+         Boot_Copier = "boot_loader_cfi.srec";
+         Boot_Copier_EPCS = "boot_loader_epcs.srec";
+         Boot_Copier_EPCS_SII_SIII_CIII = "boot_loader_epcs_sii_siii_ciii.srec";
+         Boot_Copier_BE = "boot_loader_cfi_be.srec";
+         Boot_Copier_EPCS_BE = "boot_loader_epcs_be.srec";
+         Boot_Copier_EPCS_SII_SIII_CIII_BE = "boot_loader_epcs_sii_siii_ciii_be.srec";
+         CONSTANTS 
+         {
+            CONSTANT __nios_catch_irqs__
+            {
+               value = "1";
+               comment = "Include panic handler for all irqs (needs uart)";
+            }
+            CONSTANT __nios_use_constructors__
+            {
+               value = "1";
+               comment = "Call c++ static constructors";
+            }
+            CONSTANT __nios_use_small_printf__
+            {
+               value = "1";
+               comment = "Smaller non-ANSI printf, with no floating point";
+            }
+            CONSTANT nasys_has_icache
+            {
+               value = "1";
+               comment = "True if instruction cache present";
+            }
+            CONSTANT nasys_icache_size
+            {
+               value = "4096";
+               comment = "Size in bytes of instruction cache";
+            }
+            CONSTANT nasys_icache_line_size
+            {
+               value = "32";
+               comment = "Size in bytes of each icache line";
+            }
+            CONSTANT nasys_icache_line_size_log2
+            {
+               value = "5";
+               comment = "Log2 size in bytes of each icache line";
+            }
+            CONSTANT nasys_has_dcache
+            {
+               value = "1";
+               comment = "True if instruction cache present";
+            }
+            CONSTANT nasys_dcache_size
+            {
+               value = "2048";
+               comment = "Size in bytes of data cache";
+            }
+            CONSTANT nasys_dcache_line_size
+            {
+               value = "32";
+               comment = "Size in bytes of each dcache line";
+            }
+            CONSTANT nasys_dcache_line_size_log2
+            {
+               value = "5";
+               comment = "Log2 size in bytes of each dcache line";
+            }
+         }
+         license_status = "encrypted";
+         mainmem_slave = "altmemddr_0/s1";
+         datamem_slave = "altmemddr_0/s1";
+         maincomm_slave = "uart_0/s1";
+         germs_monitor_id = "";
+      }
+      class = "altera_nios2";
+      class_version = "7.080900";
+      SYSTEM_BUILDER_INFO 
+      {
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         Parameters_Signature = "";
+         Is_CPU = "1";
+         Instantiate_In_System_Module = "1";
+         Required_Device_Family = "STRATIX,STRATIXGX,STRATIXII,STRATIXIIGX,STRATIXIIGXLITE,STRATIXIII,STRATIXIV,CYCLONE,CYCLONEII,CYCLONEIII,HARDCOPYIII,ARRIAII,TARPON,HARDCOPYIV";
+         Default_Module_Name = "cpu";
+         Top_Level_Ports_Are_Enumerated = "1";
+         View 
+         {
+            Settings_Summary = "Nios II/f
+            <br>&nbsp;&nbsp;4-Kbyte Instruction Cache
+            <br>&nbsp;&nbsp;2-Kbyte Data Cache
+            <br>&nbsp;&nbsp;JTAG Debug Module
+            ";
+            MESSAGES 
+            {
+            }
+         }
+      }
+      iss_model_name = "altera_nios2";
+      HDL_INFO 
+      {
+         PLI_Files = "";
+         Precompiled_Simulation_Library_Files = "";
+         Simulation_HDL_Files = "";
+         Synthesis_HDL_Files = "__PROJECT_DIRECTORY__/cpu_0_test_bench.v, __PROJECT_DIRECTORY__/cpu_0_mult_cell.v, __PROJECT_DIRECTORY__/cpu_0_oci_test_bench.v, __PROJECT_DIRECTORY__/cpu_0_jtag_debug_module_tck.v, __PROJECT_DIRECTORY__/cpu_0_jtag_debug_module_sysclk.v, __PROJECT_DIRECTORY__/cpu_0_jtag_debug_module_wrapper.v, __PROJECT_DIRECTORY__/cpu_0.v";
+         Synthesis_Only_Files = "";
+      }
+      MASTER tightly_coupled_instruction_master_0
+      {
+         PORT_WIRING 
+         {
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Register_Incoming_Signals = "0";
+            Bus_Type = "avalon";
+            Data_Width = "32";
+            Max_Address_Width = "31";
+            Address_Width = "8";
+            Is_Instruction_Master = "1";
+            Has_IRQ = "0";
+            Is_Enabled = "0";
+            Is_Big_Endian = "0";
+            Connection_Limit = "1";
+            Is_Channel = "1";
+         }
+      }
+      MASTER tightly_coupled_instruction_master_1
+      {
+         PORT_WIRING 
+         {
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Register_Incoming_Signals = "0";
+            Bus_Type = "avalon";
+            Data_Width = "32";
+            Max_Address_Width = "31";
+            Address_Width = "8";
+            Address_Group = "0";
+            Is_Instruction_Master = "1";
+            Is_Readable = "1";
+            Is_Writeable = "0";
+            Has_IRQ = "0";
+            Is_Enabled = "0";
+            Is_Big_Endian = "0";
+            Connection_Limit = "1";
+            Is_Channel = "1";
+         }
+      }
+      MASTER tightly_coupled_instruction_master_2
+      {
+         PORT_WIRING 
+         {
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Register_Incoming_Signals = "0";
+            Bus_Type = "avalon";
+            Data_Width = "32";
+            Max_Address_Width = "31";
+            Address_Width = "8";
+            Address_Group = "0";
+            Is_Instruction_Master = "1";
+            Is_Readable = "1";
+            Is_Writeable = "0";
+            Has_IRQ = "0";
+            Is_Enabled = "0";
+            Is_Big_Endian = "0";
+            Connection_Limit = "1";
+            Is_Channel = "1";
+         }
+      }
+      MASTER tightly_coupled_instruction_master_3
+      {
+         PORT_WIRING 
+         {
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Register_Incoming_Signals = "0";
+            Bus_Type = "avalon";
+            Data_Width = "32";
+            Max_Address_Width = "31";
+            Address_Width = "8";
+            Address_Group = "0";
+            Is_Instruction_Master = "1";
+            Is_Readable = "1";
+            Is_Writeable = "0";
+            Has_IRQ = "0";
+            Is_Enabled = "0";
+            Is_Big_Endian = "0";
+            Connection_Limit = "1";
+            Is_Channel = "1";
+         }
+      }
+      MASTER data_master2
+      {
+         PORT_WIRING 
+         {
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Register_Incoming_Signals = "1";
+            Bus_Type = "avalon";
+            Data_Width = "32";
+            Max_Address_Width = "31";
+            Address_Width = "8";
+            Address_Group = "0";
+            Is_Data_Master = "1";
+            Is_Readable = "1";
+            Is_Writeable = "1";
+            Has_IRQ = "0";
+            Is_Enabled = "0";
+            Is_Big_Endian = "0";
+         }
+      }
+      MASTER tightly_coupled_data_master_0
+      {
+         PORT_WIRING 
+         {
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Register_Incoming_Signals = "0";
+            Bus_Type = "avalon";
+            Data_Width = "32";
+            Max_Address_Width = "31";
+            Address_Width = "8";
+            Address_Group = "0";
+            Is_Data_Master = "1";
+            Is_Readable = "1";
+            Is_Writeable = "1";
+            Has_IRQ = "0";
+            Is_Enabled = "0";
+            Is_Big_Endian = "0";
+            Connection_Limit = "1";
+            Is_Channel = "1";
+         }
+      }
+      MASTER tightly_coupled_data_master_1
+      {
+         PORT_WIRING 
+         {
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Register_Incoming_Signals = "0";
+            Bus_Type = "avalon";
+            Data_Width = "32";
+            Max_Address_Width = "31";
+            Address_Width = "8";
+            Address_Group = "0";
+            Is_Data_Master = "1";
+            Is_Readable = "1";
+            Is_Writeable = "1";
+            Has_IRQ = "0";
+            Is_Enabled = "0";
+            Is_Big_Endian = "0";
+            Connection_Limit = "1";
+            Is_Channel = "1";
+         }
+      }
+      MASTER tightly_coupled_data_master_2
+      {
+         PORT_WIRING 
+         {
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Register_Incoming_Signals = "0";
+            Bus_Type = "avalon";
+            Data_Width = "32";
+            Max_Address_Width = "31";
+            Address_Width = "8";
+            Address_Group = "0";
+            Is_Data_Master = "1";
+            Is_Readable = "1";
+            Is_Writeable = "1";
+            Has_IRQ = "0";
+            Is_Enabled = "0";
+            Is_Big_Endian = "0";
+            Connection_Limit = "1";
+            Is_Channel = "1";
+         }
+      }
+      MASTER tightly_coupled_data_master_3
+      {
+         PORT_WIRING 
+         {
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Register_Incoming_Signals = "0";
+            Bus_Type = "avalon";
+            Data_Width = "32";
+            Max_Address_Width = "31";
+            Address_Width = "8";
+            Address_Group = "0";
+            Is_Data_Master = "1";
+            Is_Readable = "1";
+            Is_Writeable = "1";
+            Has_IRQ = "0";
+            Is_Enabled = "0";
+            Is_Big_Endian = "0";
+            Connection_Limit = "1";
+            Is_Channel = "1";
+         }
+      }
+      PORT_WIRING 
+      {
+         PORT jtag_debug_trigout
+         {
+            width = "1";
+            direction = "output";
+            Is_Enabled = "0";
+         }
+         PORT jtag_debug_offchip_trace_clk
+         {
+            width = "1";
+            direction = "output";
+            Is_Enabled = "0";
+         }
+         PORT jtag_debug_offchip_trace_data
+         {
+            width = "18";
+            direction = "output";
+            Is_Enabled = "0";
+         }
+         PORT clkx2
+         {
+            width = "1";
+            direction = "input";
+            Is_Enabled = "0";
+            visible = "0";
+         }
+      }
+      SIMULATION 
+      {
+         DISPLAY 
+         {
+            SIGNAL aaa
+            {
+               format = "Logic";
+               name = "i_readdata";
+               radix = "hexadecimal";
+            }
+            SIGNAL aab
+            {
+               format = "Logic";
+               name = "i_readdatavalid";
+               radix = "hexadecimal";
+            }
+            SIGNAL aac
+            {
+               format = "Logic";
+               name = "i_waitrequest";
+               radix = "hexadecimal";
+            }
+            SIGNAL aad
+            {
+               format = "Logic";
+               name = "i_address";
+               radix = "hexadecimal";
+            }
+            SIGNAL aae
+            {
+               format = "Logic";
+               name = "i_read";
+               radix = "hexadecimal";
+            }
+            SIGNAL aaf
+            {
+               format = "Logic";
+               name = "clk";
+               radix = "hexadecimal";
+            }
+            SIGNAL aag
+            {
+               format = "Logic";
+               name = "reset_n";
+               radix = "hexadecimal";
+            }
+            SIGNAL aah
+            {
+               format = "Logic";
+               name = "d_readdata";
+               radix = "hexadecimal";
+            }
+            SIGNAL aai
+            {
+               format = "Logic";
+               name = "d_waitrequest";
+               radix = "hexadecimal";
+            }
+            SIGNAL aaj
+            {
+               format = "Logic";
+               name = "d_irq";
+               radix = "hexadecimal";
+            }
+            SIGNAL aak
+            {
+               format = "Logic";
+               name = "d_address";
+               radix = "hexadecimal";
+            }
+            SIGNAL aal
+            {
+               format = "Logic";
+               name = "d_byteenable";
+               radix = "hexadecimal";
+            }
+            SIGNAL aam
+            {
+               format = "Logic";
+               name = "d_read";
+               radix = "hexadecimal";
+            }
+            SIGNAL aan
+            {
+               format = "Logic";
+               name = "d_write";
+               radix = "hexadecimal";
+            }
+            SIGNAL aao
+            {
+               format = "Logic";
+               name = "d_writedata";
+               radix = "hexadecimal";
+            }
+            SIGNAL aap
+            {
+               format = "Logic";
+               name = "d_readdatavalid";
+               radix = "hexadecimal";
+            }
+            SIGNAL aaq
+            {
+               format = "Divider";
+               name = "base pipeline";
+               radix = "";
+            }
+            SIGNAL aar
+            {
+               format = "Logic";
+               name = "clk";
+               radix = "hexadecimal";
+            }
+            SIGNAL aas
+            {
+               format = "Logic";
+               name = "reset_n";
+               radix = "hexadecimal";
+            }
+            SIGNAL aat
+            {
+               format = "Logic";
+               name = "D_stall";
+               radix = "hexadecimal";
+            }
+            SIGNAL aau
+            {
+               format = "Logic";
+               name = "A_stall";
+               radix = "hexadecimal";
+            }
+            SIGNAL aav
+            {
+               format = "Logic";
+               name = "F_pcb_nxt";
+               radix = "hexadecimal";
+            }
+            SIGNAL aaw
+            {
+               format = "Logic";
+               name = "F_pcb";
+               radix = "hexadecimal";
+            }
+            SIGNAL aax
+            {
+               format = "Logic";
+               name = "D_pcb";
+               radix = "hexadecimal";
+            }
+            SIGNAL aay
+            {
+               format = "Logic";
+               name = "E_pcb";
+               radix = "hexadecimal";
+            }
+            SIGNAL aaz
+            {
+               format = "Logic";
+               name = "M_pcb";
+               radix = "hexadecimal";
+            }
+            SIGNAL aba
+            {
+               format = "Logic";
+               name = "A_pcb";
+               radix = "hexadecimal";
+            }
+            SIGNAL abb
+            {
+               format = "Logic";
+               name = "W_pcb";
+               radix = "hexadecimal";
+            }
+            SIGNAL abc
+            {
+               format = "Logic";
+               name = "F_vinst";
+               radix = "ascii";
+            }
+            SIGNAL abd
+            {
+               format = "Logic";
+               name = "D_vinst";
+               radix = "ascii";
+            }
+            SIGNAL abe
+            {
+               format = "Logic";
+               name = "E_vinst";
+               radix = "ascii";
+            }
+            SIGNAL abf
+            {
+               format = "Logic";
+               name = "M_vinst";
+               radix = "ascii";
+            }
+            SIGNAL abg
+            {
+               format = "Logic";
+               name = "A_vinst";
+               radix = "ascii";
+            }
+            SIGNAL abh
+            {
+               format = "Logic";
+               name = "W_vinst";
+               radix = "ascii";
+            }
+            SIGNAL abi
+            {
+               format = "Logic";
+               name = "F_inst_ram_hit";
+               radix = "hexadecimal";
+            }
+            SIGNAL abj
+            {
+               format = "Logic";
+               name = "F_issue";
+               radix = "hexadecimal";
+            }
+            SIGNAL abk
+            {
+               format = "Logic";
+               name = "F_kill";
+               radix = "hexadecimal";
+            }
+            SIGNAL abl
+            {
+               format = "Logic";
+               name = "D_kill";
+               radix = "hexadecimal";
+            }
+            SIGNAL abm
+            {
+               format = "Logic";
+               name = "D_refetch";
+               radix = "hexadecimal";
+            }
+            SIGNAL abn
+            {
+               format = "Logic";
+               name = "D_issue";
+               radix = "hexadecimal";
+            }
+            SIGNAL abo
+            {
+               format = "Logic";
+               name = "D_valid";
+               radix = "hexadecimal";
+            }
+            SIGNAL abp
+            {
+               format = "Logic";
+               name = "E_valid";
+               radix = "hexadecimal";
+            }
+            SIGNAL abq
+            {
+               format = "Logic";
+               name = "M_valid";
+               radix = "hexadecimal";
+            }
+            SIGNAL abr
+            {
+               format = "Logic";
+               name = "A_valid";
+               radix = "hexadecimal";
+            }
+            SIGNAL abs
+            {
+               format = "Logic";
+               name = "W_valid";
+               radix = "hexadecimal";
+            }
+            SIGNAL abt
+            {
+               format = "Logic";
+               name = "W_wr_dst_reg";
+               radix = "hexadecimal";
+            }
+            SIGNAL abu
+            {
+               format = "Logic";
+               name = "W_dst_regnum";
+               radix = "hexadecimal";
+            }
+            SIGNAL abv
+            {
+               format = "Logic";
+               name = "W_wr_data";
+               radix = "hexadecimal";
+            }
+            SIGNAL abw
+            {
+               format = "Logic";
+               name = "D_en";
+               radix = "hexadecimal";
+            }
+            SIGNAL abx
+            {
+               format = "Logic";
+               name = "E_en";
+               radix = "hexadecimal";
+            }
+            SIGNAL aby
+            {
+               format = "Logic";
+               name = "M_en";
+               radix = "hexadecimal";
+            }
+            SIGNAL abz
+            {
+               format = "Logic";
+               name = "A_en";
+               radix = "hexadecimal";
+            }
+            SIGNAL aca
+            {
+               format = "Logic";
+               name = "F_iw";
+               radix = "hexadecimal";
+            }
+            SIGNAL acb
+            {
+               format = "Logic";
+               name = "D_iw";
+               radix = "hexadecimal";
+            }
+            SIGNAL acc
+            {
+               format = "Logic";
+               name = "E_iw";
+               radix = "hexadecimal";
+            }
+            SIGNAL acd
+            {
+               format = "Logic";
+               name = "M_pipe_flush";
+               radix = "hexadecimal";
+            }
+            SIGNAL ace
+            {
+               format = "Logic";
+               name = "M_pipe_flush_baddr";
+               radix = "hexadecimal";
+            }
+            SIGNAL acf
+            {
+               format = "Logic";
+               name = "intr_req";
+               radix = "hexadecimal";
+            }
+            SIGNAL acg
+            {
+               format = "Logic";
+               name = "A_status_reg";
+               radix = "hexadecimal";
+            }
+            SIGNAL ach
+            {
+               format = "Logic";
+               name = "A_status_reg_pie";
+               radix = "hexadecimal";
+            }
+            SIGNAL aci
+            {
+               format = "Logic";
+               name = "A_estatus_reg";
+               radix = "hexadecimal";
+            }
+            SIGNAL acj
+            {
+               format = "Logic";
+               name = "A_estatus_reg_pie";
+               radix = "hexadecimal";
+            }
+            SIGNAL ack
+            {
+               format = "Logic";
+               name = "A_bstatus_reg";
+               radix = "hexadecimal";
+            }
+            SIGNAL acl
+            {
+               format = "Logic";
+               name = "A_bstatus_reg_pie";
+               radix = "hexadecimal";
+            }
+            SIGNAL acm
+            {
+               format = "Logic";
+               name = "A_ienable_reg";
+               radix = "hexadecimal";
+            }
+            SIGNAL acn
+            {
+               format = "Logic";
+               name = "A_ienable_reg_irq2";
+               radix = "hexadecimal";
+            }
+            SIGNAL aco
+            {
+               format = "Logic";
+               name = "A_ienable_reg_irq3";
+               radix = "hexadecimal";
+            }
+            SIGNAL acp
+            {
+               format = "Logic";
+               name = "A_ienable_reg_irq6";
+               radix = "hexadecimal";
+            }
+            SIGNAL acq
+            {
+               format = "Logic";
+               name = "A_ienable_reg_irq7";
+               radix = "hexadecimal";
+            }
+            SIGNAL acr
+            {
+               format = "Logic";
+               name = "A_ienable_reg_irq8";
+               radix = "hexadecimal";
+            }
+            SIGNAL acs
+            {
+               format = "Logic";
+               name = "A_ienable_reg_irq9";
+               radix = "hexadecimal";
+            }
+            SIGNAL act
+            {
+               format = "Logic";
+               name = "A_ienable_reg_irq10";
+               radix = "hexadecimal";
+            }
+            SIGNAL acu
+            {
+               format = "Logic";
+               name = "A_ienable_reg_irq11";
+               radix = "hexadecimal";
+            }
+            SIGNAL acv
+            {
+               format = "Logic";
+               name = "A_ipending_reg";
+               radix = "hexadecimal";
+            }
+            SIGNAL acw
+            {
+               format = "Logic";
+               name = "A_ipending_reg_irq2";
+               radix = "hexadecimal";
+            }
+            SIGNAL acx
+            {
+               format = "Logic";
+               name = "A_ipending_reg_irq3";
+               radix = "hexadecimal";
+            }
+            SIGNAL acy
+            {
+               format = "Logic";
+               name = "A_ipending_reg_irq6";
+               radix = "hexadecimal";
+            }
+            SIGNAL acz
+            {
+               format = "Logic";
+               name = "A_ipending_reg_irq7";
+               radix = "hexadecimal";
+            }
+            SIGNAL ada
+            {
+               format = "Logic";
+               name = "A_ipending_reg_irq8";
+               radix = "hexadecimal";
+            }
+            SIGNAL adb
+            {
+               format = "Logic";
+               name = "A_ipending_reg_irq9";
+               radix = "hexadecimal";
+            }
+            SIGNAL adc
+            {
+               format = "Logic";
+               name = "A_ipending_reg_irq10";
+               radix = "hexadecimal";
+            }
+            SIGNAL add
+            {
+               format = "Logic";
+               name = "A_ipending_reg_irq11";
+               radix = "hexadecimal";
+            }
+            SIGNAL ade
+            {
+               format = "Logic";
+               name = "A_cpuid_reg";
+               radix = "hexadecimal";
+            }
+            SIGNAL adf
+            {
+               format = "Logic";
+               name = "E_valid_prior_to_hbreak";
+               radix = "hexadecimal";
+            }
+         }
+      }
+   }
+   MODULE cfi_flash_0
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT data
+            {
+               type = "data";
+               width = "16";
+               direction = "inout";
+               Is_Enabled = "1";
+               is_shared = "1";
+            }
+            PORT address
+            {
+               type = "address";
+               width = "25";
+               direction = "input";
+               Is_Enabled = "1";
+               is_shared = "1";
+            }
+            PORT read_n
+            {
+               type = "read_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+               is_shared = "1";
+            }
+            PORT write_n
+            {
+               type = "write_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+               is_shared = "1";
+            }
+            PORT select_n
+            {
+               type = "chipselect_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+               is_shared = "0";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Bus_Type = "avalon_tristate";
+            Write_Wait_States = "120ns";
+            Read_Wait_States = "120ns";
+            Hold_Time = "20ns";
+            Setup_Time = "20ns";
+            Is_Printable_Device = "0";
+            Address_Alignment = "dynamic";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "1";
+            Address_Span = "67108864";
+            Read_Latency = "0";
+            Is_Memory_Device = "1";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "1";
+            Active_CS_Through_Read_Latency = "0";
+            Data_Width = "16";
+            Address_Width = "25";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY tri_state_bridge_0/tristate_master
+            {
+               priority = "1";
+               Offset_Address = "0x00000000";
+            }
+            Base_Address = "0x00000000";
+            Has_IRQ = "0";
+            Simulation_Num_Lanes = "1";
+            Convert_Xs_To_0 = "1";
+            Address_Group = "0";
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "NC";
+            }
+         }
+         WIZARD_SCRIPT_ARGUMENTS 
+         {
+            class = "altera_avalon_cfi_flash";
+            Supports_Flash_File_System = "1";
+            flash_reference_designator = "";
+         }
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         Setup_Value = "20";
+         Wait_Value = "120";
+         Hold_Value = "20";
+         Timing_Units = "ns";
+         Unit_Multiplier = "1";
+         Size = "67108864";
+         MAKE 
+         {
+            MACRO 
+            {
+               CFI_FLASH_0_FLASHTARGET_ALT_SIM_PREFIX = "$(CFI_FLASH_0_FLASHTARGET_TMP1:0=)";
+               CFI_FLASH_0_FLASHTARGET_TMP1 = "$(ALT_SIM_OPTIMIZE:1=RUN_ON_HDL_SIMULATOR_ONLY_)";
+            }
+            MASTER cpu_0
+            {
+               MACRO 
+               {
+                  BOOT_COPIER = "boot_loader_cfi.srec";
+                  CPU_CLASS = "altera_nios2";
+                  CPU_RESET_ADDRESS = "0x400000";
+               }
+            }
+            TARGET delete_placeholder_warning
+            {
+               cfi_flash_0 
+               {
+                  Command1 = "rm -f $(SIMDIR)/contents_file_warning.txt";
+                  Is_Phony = "1";
+                  Target_File = "do_delete_placeholder_warning";
+               }
+            }
+            TARGET flashfiles
+            {
+               cfi_flash_0 
+               {
+                  Command1 = "@echo Post-processing to create $(notdir $@)";
+                  Command2 = "elf2flash --input=$(ELF) --flash= --boot=$(DBL_QUOTE)$(shell $(DBL_QUOTE)$(QUARTUS_ROOTDIR)/sopc_builder/bin/find_sopc_component_dir$(DBL_QUOTE) $(CPU_CLASS) $(QUARTUS_PROJECT_DIR))/$(BOOT_COPIER)$(DBL_QUOTE) --outfile=$(CFI_FLASH_0_FLASHTARGET_ALT_SIM_PREFIX)cfi_flash_0.flash --sim_optimize=$(ALT_SIM_OPTIMIZE) --base=0x0 --end=0x3FFFFFF --reset=$(CPU_RESET_ADDRESS) ";
+                  Dependency = "$(ELF)";
+                  Target_File = "$(CFI_FLASH_0_FLASHTARGET_ALT_SIM_PREFIX)cfi_flash_0.flash";
+               }
+            }
+            TARGET sim
+            {
+               cfi_flash_0 
+               {
+                  Command1 = "if [ ! -d $(SIMDIR) ]; then mkdir $(SIMDIR) ; fi";
+                  Command2 = "@echo Hardware simulation is not enabled for the target SOPC Builder system. Skipping creation of hardware simulation model contents and simulation symbol files. \\(Note: This does not affect the instruction set simulator.\\)";
+                  Command3 = "touch $(SIMDIR)/dummy_file";
+                  Dependency = "$(ELF)";
+                  Target_File = "$(SIMDIR)/dummy_file";
+               }
+            }
+         }
+      }
+      SYSTEM_BUILDER_INFO 
+      {
+         Simulation_Num_Lanes = "2";
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         Make_Memory_Model = "1";
+         Instantiate_In_System_Module = "0";
+         Top_Level_Ports_Are_Enumerated = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+      class = "altera_avalon_cfi_flash";
+      class_version = "7.080900";
+      iss_model_name = "altera_avalon_flash";
+      HDL_INFO 
+      {
+      }
+   }
+   MODULE tri_state_bridge_0
+   {
+      SLAVE avalon_slave
+      {
+         PORT_WIRING 
+         {
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Bus_Type = "avalon";
+            Write_Wait_States = "0cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "dynamic";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Address_Span = "1";
+            Read_Latency = "0";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "1";
+            Register_Outgoing_Signals = "1";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/instruction_master
+            {
+               priority = "1";
+               Offset_Address = "N/A";
+               Base_Address = "N/A";
+            }
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "N/A";
+               Base_Address = "N/A";
+            }
+            Bridges_To = "tristate_master";
+            Base_Address = "N/A";
+            Has_IRQ = "0";
+            IRQ = "N/A";
+            Address_Group = "0";
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "NC";
+            }
+         }
+      }
+      MASTER tristate_master
+      {
+         SYSTEM_BUILDER_INFO 
+         {
+            Bus_Type = "avalon_tristate";
+            Is_Asynchronous = "0";
+            DBS_Big_Endian = "0";
+            Adapts_To = "";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            Bridges_To = "avalon_slave";
+         }
+         PORT_WIRING 
+         {
+         }
+         MEMORY_MAP 
+         {
+            Entry cfi_flash_0/s1
+            {
+               address = "0x00000000";
+               span = "0x04000000";
+               is_bridge = "0";
+            }
+         }
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+      }
+      class = "altera_avalon_tri_state_bridge";
+      class_version = "7.080900";
+      SYSTEM_BUILDER_INFO 
+      {
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         Instantiate_In_System_Module = "1";
+         Is_Bridge = "1";
+         Top_Level_Ports_Are_Enumerated = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+   }
+   MODULE timer_0
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT reset_n
+            {
+               type = "reset_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT irq
+            {
+               type = "irq";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT address
+            {
+               type = "address";
+               width = "3";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT writedata
+            {
+               type = "writedata";
+               width = "16";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT readdata
+            {
+               type = "readdata";
+               width = "16";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT chipselect
+            {
+               type = "chipselect";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT write_n
+            {
+               type = "write_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Bus_Type = "avalon";
+            Write_Wait_States = "0cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "0";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "16";
+            Address_Width = "3";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x10000080";
+            }
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "2";
+            }
+            Base_Address = "0x10000080";
+            Address_Group = "0";
+         }
+      }
+      class = "altera_avalon_timer";
+      class_version = "7.080900";
+      iss_model_name = "altera_avalon_timer";
+      SYSTEM_BUILDER_INFO 
+      {
+         Instantiate_In_System_Module = "1";
+         Is_Enabled = "1";
+         Top_Level_Ports_Are_Enumerated = "1";
+         View 
+         {
+            Settings_Summary = "Timer with 1 ms timeout period.";
+            Is_Collapsed = "1";
+            MESSAGES 
+            {
+            }
+         }
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         always_run = "0";
+         fixed_period = "0";
+         snapshot = "1";
+         period = "1";
+         period_units = "ms";
+         reset_output = "0";
+         timeout_pulse_output = "0";
+         load_value = "66666";
+         counter_size = "32";
+         mult = "0.0010";
+         ticks_per_sec = "1000";
+      }
+      HDL_INFO 
+      {
+         Precompiled_Simulation_Library_Files = "";
+         Simulation_HDL_Files = "";
+         Synthesis_HDL_Files = "__PROJECT_DIRECTORY__/timer_0.v";
+         Synthesis_Only_Files = "";
+      }
+      PORT_WIRING 
+      {
+      }
+   }
+   MODULE uart_0
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT reset_n
+            {
+               type = "reset_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT irq
+            {
+               type = "irq";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT address
+            {
+               type = "address";
+               width = "3";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT begintransfer
+            {
+               type = "begintransfer";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT chipselect
+            {
+               type = "chipselect";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT read_n
+            {
+               type = "read_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT write_n
+            {
+               type = "write_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT writedata
+            {
+               type = "writedata";
+               width = "16";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT dataavailable
+            {
+               type = "dataavailable";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT readdata
+            {
+               type = "readdata";
+               width = "16";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT readyfordata
+            {
+               type = "readyfordata";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Bus_Type = "avalon";
+            Write_Wait_States = "1cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "1";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "0";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "16";
+            Address_Width = "3";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x10000000";
+            }
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "3";
+            }
+            Base_Address = "0x10000000";
+            Address_Group = "0";
+         }
+      }
+      PORT_WIRING 
+      {
+         PORT txd
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT rxd
+         {
+            type = "export";
+            width = "1";
+            direction = "input";
+            Is_Enabled = "1";
+         }
+         PORT rxused
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "0";
+         }
+         PORT txused
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "0";
+         }
+         PORT transmitting
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "0";
+         }
+         PORT cts_n
+         {
+            type = "export";
+            width = "1";
+            direction = "input";
+            Is_Enabled = "0";
+         }
+         PORT rts_n
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "0";
+         }
+         PORT irqexport
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "0";
+         }
+      }
+      class = "fifoed_avalon_uart";
+      class_version = "7.1";
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         use_tx_fifo = "1";
+         use_rx_fifo = "1";
+         baud = "115200";
+         data_bits = "8";
+         fixed_baud = "1";
+         parity = "N";
+         stop_bits = "1";
+         use_cts_rts = "0";
+         use_eop_register = "0";
+         sim_true_baud = "0";
+         sim_char_stream = "";
+         use_fifo = "0";
+         fifo_size = "16";
+         fifo_export_used = "0";
+         export_irq = "0";
+         hw_cts = "0";
+         trans_pin = "0";
+         fifo_size_tx = "8";
+         fifo_size_rx = "64";
+         tx_fifo_LE = "0";
+         rx_fifo_LE = "0";
+         combine_fifo = "0";
+      }
+      SYSTEM_BUILDER_INFO 
+      {
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         Instantiate_In_System_Module = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+            Settings_Summary = "8-bit UART with 115200 baud, <br>
+                    1 stop bits and N parity";
+         }
+      }
+      SIMULATION 
+      {
+         DISPLAY 
+         {
+            SIGNAL a
+            {
+               name = "  Bus Interface";
+               format = "Divider";
+            }
+            SIGNAL b
+            {
+               name = "chipselect";
+            }
+            SIGNAL c
+            {
+               name = "address";
+               radix = "hexadecimal";
+            }
+            SIGNAL d
+            {
+               name = "writedata";
+               radix = "hexadecimal";
+            }
+            SIGNAL e
+            {
+               name = "readdata";
+               radix = "hexadecimal";
+            }
+            SIGNAL f
+            {
+               name = "  Internals";
+               format = "Divider";
+            }
+            SIGNAL g
+            {
+               name = "tx_ready";
+            }
+            SIGNAL h
+            {
+               name = "tx_data";
+               radix = "ascii";
+            }
+            SIGNAL i
+            {
+               name = "rx_char_ready";
+            }
+            SIGNAL j
+            {
+               name = "rx_data";
+               radix = "ascii";
+            }
+         }
+         INTERACTIVE_OUT log
+         {
+            enable = "0";
+            file = "_log_module.txt";
+            radix = "ascii";
+            signals = "temp,list";
+            exe = "perl -- tail-f.pl";
+         }
+         INTERACTIVE_IN drive
+         {
+            enable = "0";
+            file = "_input_data_stream.dat";
+            mutex = "_input_data_mutex.dat";
+            log = "_in.log";
+            rate = "100";
+            signals = "temp,list";
+            exe = "perl -- uart.pl";
+         }
+      }
+      HDL_INFO 
+      {
+         Precompiled_Simulation_Library_Files = "";
+         Simulation_HDL_Files = "";
+         Synthesis_HDL_Files = "__PROJECT_DIRECTORY__/uart_0.v";
+         Synthesis_Only_Files = "";
+      }
+   }
+   MODULE altmemddr_0
+   {
+      PORT_WIRING 
+      {
+         PORT pll_ref_clk
+         {
+            type = "clk";
+            width = "1";
+            direction = "input";
+            Is_Enabled = "1";
+         }
+         PORT soft_reset_n
+         {
+            type = "reset_n";
+            width = "1";
+            direction = "input";
+            Is_Enabled = "1";
+         }
+         PORT aux_full_rate_clk
+         {
+            type = "out_clk";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT aux_half_rate_clk
+         {
+            type = "out_clk";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT mem_odt
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+            declare_one_bit_as_std_logic_vector = "1";
+         }
+         PORT mem_clk
+         {
+            type = "export";
+            width = "2";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+         PORT mem_clk_n
+         {
+            type = "export";
+            width = "2";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+         PORT mem_cs_n
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+            declare_one_bit_as_std_logic_vector = "1";
+         }
+         PORT mem_cke
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+            declare_one_bit_as_std_logic_vector = "1";
+         }
+         PORT mem_addr
+         {
+            type = "export";
+            width = "13";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT mem_ba
+         {
+            type = "export";
+            width = "2";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT mem_ras_n
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT mem_cas_n
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT mem_we_n
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT mem_dq
+         {
+            type = "export";
+            width = "32";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+         PORT mem_dqs
+         {
+            type = "export";
+            width = "4";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+         PORT mem_dm
+         {
+            type = "export";
+            width = "4";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT local_refresh_ack
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT local_wdata_req
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT local_init_done
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT reset_phy_clk_n
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT global_reset_n
+         {
+            type = "export";
+            width = "1";
+            direction = "input";
+            Is_Enabled = "1";
+         }
+      }
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT phy_clk
+            {
+               type = "out_clk";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT local_address
+            {
+               type = "address";
+               width = "23";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT local_write_req
+            {
+               type = "write";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT local_read_req
+            {
+               type = "read";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT local_burstbegin
+            {
+               type = "beginbursttransfer";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT local_ready
+            {
+               type = "waitrequest_n";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT local_rdata
+            {
+               type = "readdata";
+               width = "128";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT local_rdata_valid
+            {
+               type = "readdatavalid";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT local_wdata
+            {
+               type = "writedata";
+               width = "128";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT local_be
+            {
+               type = "byteenable";
+               width = "16";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT local_size
+            {
+               type = "burstcount";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT reset_request_n
+            {
+               type = "resetrequest_n";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Bus_Type = "avalon";
+            Read_Wait_States = "peripheral_controlled";
+            Write_Wait_States = "peripheral_controlled";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "dynamic";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Address_Span = "134217728";
+            Read_Latency = "0";
+            Is_Memory_Device = "1";
+            Maximum_Pending_Read_Transactions = "32";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "128";
+            Address_Width = "23";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "1";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            Clock_Source = "altmemddr_0_phy_clk_out";
+            Has_Clock = "1";
+            MASTERED_BY cpu_0/instruction_master
+            {
+               priority = "1";
+               Offset_Address = "0x08000000";
+            }
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x08000000";
+            }
+            Base_Address = "0x08000000";
+            Address_Group = "0";
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "NC";
+            }
+         }
+      }
+      iss_model_name = "altera_memory";
+      class = "ddr2_high_perf";
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         device_family = "Cyclone III";
+         datawidth = "32";
+         memtype = "DDR2 SDRAM";
+         local_burst_length = "1";
+         num_chipselects = "1";
+         cas_latency = "4.0";
+         addr_width = "13";
+         ba_width = "2";
+         row_width = "13";
+         col_width = "10";
+         clockspeed = "7500";
+         data_width_ratio = "4";
+         reg_dimm = "false";
+         dq_per_dqs = "8";
+         phy_if_type_afi = "true";
+      }
+      SYSTEM_BUILDER_INFO 
+      {
+         Instantiate_In_System_Module = "1";
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         Default_Module_Name = "ddr2_sdram";
+         Required_Device_Family = "STRATIXIIGXLITE,STRATIXIIGX,STRATIXII,STRATIXIII,CYCLONEIII,STRATIXIV,ARRIAII,TARPON,HARDCOPYIII,HARDCOPYIV";
+         Pins_Assigned_Automatically = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+      class_version = "8.1";
+      SIMULATION 
+      {
+         DISPLAY 
+         {
+            SIGNAL a
+            {
+               name = "pll_ref_clk";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL b
+            {
+               name = "soft_reset_n";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL c
+            {
+               name = "global_reset_n";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL d
+            {
+               name = "reset_phy_clk_n";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL e
+            {
+               name = "reset_request_n";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL f
+            {
+               name = "phy_clk";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL g
+            {
+               name = "local_address";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL h
+            {
+               name = "local_size";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL i
+            {
+               name = "local_burstbegin";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL j
+            {
+               name = "local_read_req";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL k
+            {
+               name = "local_write_req";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL l
+            {
+               name = "local_ready";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL m
+            {
+               name = "local_wdata";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL n
+            {
+               name = "local_be";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL o
+            {
+               name = "local_rdata_valid";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL p
+            {
+               name = "local_rdata";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL q
+            {
+               name = "mem_clk";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL r
+            {
+               name = "mem_cs_n";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL s
+            {
+               name = "mem_addr";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL t
+            {
+               name = "mem_ba";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL u
+            {
+               name = "mem_ras_n";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL v
+            {
+               name = "mem_cas_n";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL w
+            {
+               name = "mem_we_n";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL x
+            {
+               name = "mem_dm";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL y
+            {
+               name = "mem_dq";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL z
+            {
+               name = "mem_dqs";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+            SIGNAL aa
+            {
+               name = "mem_cke";
+               radix = "hexadecimal";
+               format = "Logic";
+            }
+         }
+      }
+   }
+   MODULE opencores_i2c_master_0
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT csi_s1clk_clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT csi_s1clk_reset
+            {
+               type = "reset";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT ins_intout_irq
+            {
+               type = "irq";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_writedata
+            {
+               type = "writedata";
+               width = "8";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_readdata
+            {
+               type = "readdata";
+               width = "8";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_chipselect
+            {
+               type = "chipselect";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_write
+            {
+               type = "write";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_address
+            {
+               type = "address";
+               width = "3";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Bus_Type = "avalon";
+            Write_Wait_States = "0cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "0";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "8";
+            Address_Width = "3";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x1c100000";
+            }
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "11";
+            }
+            Base_Address = "0x1c100000";
+            Address_Group = "0";
+         }
+      }
+      PORT_WIRING 
+      {
+         PORT coe_ext_export_scl
+         {
+            type = "export";
+            width = "1";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+         PORT coe_ext_export_sda
+         {
+            type = "export";
+            width = "1";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+      }
+      class = "no_legacy_module";
+      class_version = "7.080900";
+      gtf_class_name = "opencores_i2c_master";
+      gtf_class_version = "2.0";
+      SYSTEM_BUILDER_INFO 
+      {
+         Do_Not_Generate = "1";
+         Instantiate_In_System_Module = "1";
+         Is_Bridge = "0";
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+      HDL_INFO 
+      {
+         Simulation_HDL_Files = "/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_bit_ctrl.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_byte_ctrl.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_top.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/oc_i2c_master.vhd,__PROJECT_DIRECTORY__/opencores_i2c_master_0.vhd";
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         terminated_ports 
+         {
+         }
+      }
+   }
+   MODULE opencores_i2c_master_1
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT csi_s1clk_clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT csi_s1clk_reset
+            {
+               type = "reset";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT ins_intout_irq
+            {
+               type = "irq";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_writedata
+            {
+               type = "writedata";
+               width = "8";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_readdata
+            {
+               type = "readdata";
+               width = "8";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_chipselect
+            {
+               type = "chipselect";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_write
+            {
+               type = "write";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_address
+            {
+               type = "address";
+               width = "3";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Bus_Type = "avalon";
+            Write_Wait_States = "0cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "0";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "8";
+            Address_Width = "3";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x1c200000";
+            }
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "6";
+            }
+            Base_Address = "0x1c200000";
+            Address_Group = "0";
+         }
+      }
+      PORT_WIRING 
+      {
+         PORT coe_ext_export_scl
+         {
+            type = "export";
+            width = "1";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+         PORT coe_ext_export_sda
+         {
+            type = "export";
+            width = "1";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+      }
+      class = "no_legacy_module";
+      class_version = "7.080900";
+      gtf_class_name = "opencores_i2c_master";
+      gtf_class_version = "2.0";
+      SYSTEM_BUILDER_INFO 
+      {
+         Do_Not_Generate = "1";
+         Instantiate_In_System_Module = "1";
+         Is_Bridge = "0";
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+      HDL_INFO 
+      {
+         Simulation_HDL_Files = "/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_bit_ctrl.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_byte_ctrl.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_top.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/oc_i2c_master.vhd,__PROJECT_DIRECTORY__/opencores_i2c_master_1.vhd";
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         terminated_ports 
+         {
+         }
+      }
+   }
+   MODULE opencores_i2c_master_2
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT csi_s1clk_clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT csi_s1clk_reset
+            {
+               type = "reset";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT ins_intout_irq
+            {
+               type = "irq";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_writedata
+            {
+               type = "writedata";
+               width = "8";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_readdata
+            {
+               type = "readdata";
+               width = "8";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_chipselect
+            {
+               type = "chipselect";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_write
+            {
+               type = "write";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_address
+            {
+               type = "address";
+               width = "3";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Bus_Type = "avalon";
+            Write_Wait_States = "0cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "0";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "8";
+            Address_Width = "3";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x1c300000";
+            }
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "7";
+            }
+            Base_Address = "0x1c300000";
+            Address_Group = "0";
+         }
+      }
+      PORT_WIRING 
+      {
+         PORT coe_ext_export_scl
+         {
+            type = "export";
+            width = "1";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+         PORT coe_ext_export_sda
+         {
+            type = "export";
+            width = "1";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+      }
+      class = "no_legacy_module";
+      class_version = "7.080900";
+      gtf_class_name = "opencores_i2c_master";
+      gtf_class_version = "2.0";
+      SYSTEM_BUILDER_INFO 
+      {
+         Do_Not_Generate = "1";
+         Instantiate_In_System_Module = "1";
+         Is_Bridge = "0";
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+      HDL_INFO 
+      {
+         Simulation_HDL_Files = "/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_bit_ctrl.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_byte_ctrl.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_top.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/oc_i2c_master.vhd,__PROJECT_DIRECTORY__/opencores_i2c_master_2.vhd";
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         terminated_ports 
+         {
+         }
+      }
+   }
+   MODULE opencores_i2c_master_3
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT csi_s1clk_clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT csi_s1clk_reset
+            {
+               type = "reset";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT ins_intout_irq
+            {
+               type = "irq";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_writedata
+            {
+               type = "writedata";
+               width = "8";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_readdata
+            {
+               type = "readdata";
+               width = "8";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_chipselect
+            {
+               type = "chipselect";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_write
+            {
+               type = "write";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_address
+            {
+               type = "address";
+               width = "3";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Bus_Type = "avalon";
+            Write_Wait_States = "0cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "0";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "8";
+            Address_Width = "3";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x1c400000";
+            }
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "8";
+            }
+            Base_Address = "0x1c400000";
+            Address_Group = "0";
+         }
+      }
+      PORT_WIRING 
+      {
+         PORT coe_ext_export_scl
+         {
+            type = "export";
+            width = "1";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+         PORT coe_ext_export_sda
+         {
+            type = "export";
+            width = "1";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+      }
+      class = "no_legacy_module";
+      class_version = "7.080900";
+      gtf_class_name = "opencores_i2c_master";
+      gtf_class_version = "2.0";
+      SYSTEM_BUILDER_INFO 
+      {
+         Do_Not_Generate = "1";
+         Instantiate_In_System_Module = "1";
+         Is_Bridge = "0";
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+      HDL_INFO 
+      {
+         Simulation_HDL_Files = "/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_bit_ctrl.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_byte_ctrl.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_top.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/oc_i2c_master.vhd,__PROJECT_DIRECTORY__/opencores_i2c_master_3.vhd";
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         terminated_ports 
+         {
+         }
+      }
+   }
+   MODULE opencores_i2c_master_4
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT csi_s1clk_clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT csi_s1clk_reset
+            {
+               type = "reset";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT ins_intout_irq
+            {
+               type = "irq";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_writedata
+            {
+               type = "writedata";
+               width = "8";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_readdata
+            {
+               type = "readdata";
+               width = "8";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_chipselect
+            {
+               type = "chipselect";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_write
+            {
+               type = "write";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_address
+            {
+               type = "address";
+               width = "3";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Bus_Type = "avalon";
+            Write_Wait_States = "0cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "0";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "8";
+            Address_Width = "3";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x1c500000";
+            }
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "9";
+            }
+            Base_Address = "0x1c500000";
+            Address_Group = "0";
+         }
+      }
+      PORT_WIRING 
+      {
+         PORT coe_ext_export_scl
+         {
+            type = "export";
+            width = "1";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+         PORT coe_ext_export_sda
+         {
+            type = "export";
+            width = "1";
+            direction = "inout";
+            Is_Enabled = "1";
+         }
+      }
+      class = "no_legacy_module";
+      class_version = "7.080900";
+      gtf_class_name = "opencores_i2c_master";
+      gtf_class_version = "2.0";
+      SYSTEM_BUILDER_INFO 
+      {
+         Do_Not_Generate = "1";
+         Instantiate_In_System_Module = "1";
+         Is_Bridge = "0";
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+      HDL_INFO 
+      {
+         Simulation_HDL_Files = "/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_bit_ctrl.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_byte_ctrl.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/i2c_master_top.vhd,/home/walter/Libs/VHDL/sopc/opencores/i2c_master/oc_i2c_master.vhd,__PROJECT_DIRECTORY__/opencores_i2c_master_4.vhd";
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         terminated_ports 
+         {
+         }
+      }
+   }
+   MODULE axonbus_0
+   {
+      SLAVE ctrl
+      {
+         PORT_WIRING 
+         {
+            PORT csi_ctrlclk_reset_n
+            {
+               type = "reset_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT csi_ctrlclk_clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT ins_ctrlirq_irq
+            {
+               type = "irq";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_ctrl_read
+            {
+               type = "read";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_ctrl_write
+            {
+               type = "write";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_ctrl_readdata
+            {
+               type = "readdata";
+               width = "16";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_ctrl_writedata
+            {
+               type = "writedata";
+               width = "16";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_ctrl_address
+            {
+               type = "address";
+               width = "4";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Bus_Type = "avalon";
+            Write_Wait_States = "0cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "0";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "16";
+            Address_Width = "4";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x1c600000";
+            }
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "10";
+            }
+            Base_Address = "0x1c600000";
+            Address_Group = "0";
+         }
+      }
+      PORT_WIRING 
+      {
+         PORT coe_export_txena
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+      }
+      MASTER uartm
+      {
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Irq_Scheme = "individual_requests";
+            Bus_Type = "avalon";
+            Is_Asynchronous = "0";
+            DBS_Big_Endian = "0";
+            Adapts_To = "";
+            Do_Stream_Reads = "0";
+            Do_Stream_Writes = "0";
+            Max_Address_Width = "32";
+            Data_Width = "16";
+            Address_Width = "8";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+         }
+         PORT_WIRING 
+         {
+            PORT avm_uartm_irq
+            {
+               type = "irq";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avm_uartm_waitrequest
+            {
+               type = "waitrequest";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avm_uartm_address
+            {
+               type = "address";
+               width = "8";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avm_uartm_read
+            {
+               type = "read";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avm_uartm_readdata
+            {
+               type = "readdata";
+               width = "16";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avm_uartm_write
+            {
+               type = "write";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avm_uartm_writedata
+            {
+               type = "writedata";
+               width = "16";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+         }
+         MEMORY_MAP 
+         {
+            Entry uart_1/s1
+            {
+               address = "0x00000000";
+               span = "0x00000020";
+               is_bridge = "0";
+            }
+         }
+      }
+      class = "no_legacy_module";
+      class_version = "7.080900";
+      gtf_class_name = "axonbus";
+      gtf_class_version = "1.0";
+      SYSTEM_BUILDER_INFO 
+      {
+         Do_Not_Generate = "1";
+         Instantiate_In_System_Module = "1";
+         Is_Bridge = "0";
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+      HDL_INFO 
+      {
+         Simulation_HDL_Files = "/home/walter/Libs/VHDL/sopc/axon/axonbus/axonbus.vhd,__PROJECT_DIRECTORY__/axonbus_0.vhd";
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         terminated_ports 
+         {
+         }
+      }
+   }
+   MODULE uart_1
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT reset_n
+            {
+               type = "reset_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT irq
+            {
+               type = "irq";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT address
+            {
+               type = "address";
+               width = "3";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT begintransfer
+            {
+               type = "begintransfer";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT chipselect
+            {
+               type = "chipselect";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT read_n
+            {
+               type = "read_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT write_n
+            {
+               type = "write_n";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT writedata
+            {
+               type = "writedata";
+               width = "16";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT readdata
+            {
+               type = "readdata";
+               width = "16";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT dataavailable
+            {
+               type = "dataavailable";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT readyfordata
+            {
+               type = "readyfordata";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Has_IRQ = "1";
+            Bus_Type = "avalon";
+            Write_Wait_States = "1cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "1";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "0";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "16";
+            Address_Width = "3";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY axonbus_0/uartm
+            {
+               priority = "1";
+               Offset_Address = "0x00000000";
+            }
+            IRQ_MASTER axonbus_0/uartm
+            {
+               IRQ_Number = "0";
+            }
+            Base_Address = "0x00000000";
+            Address_Group = "0";
+         }
+      }
+      PORT_WIRING 
+      {
+         PORT rxd
+         {
+            type = "export";
+            width = "1";
+            direction = "input";
+            Is_Enabled = "1";
+         }
+         PORT txd
+         {
+            type = "export";
+            width = "1";
+            direction = "output";
+            Is_Enabled = "1";
+         }
+         PORT cts_n
+         {
+            direction = "input";
+            width = "1";
+            Is_Enabled = "0";
+         }
+         PORT rts_n
+         {
+            direction = "output";
+            width = "1";
+            Is_Enabled = "0";
+         }
+      }
+      class = "altera_avalon_uart";
+      class_version = "7.080900";
+      iss_model_name = "altera_avalon_uart";
+      SYSTEM_BUILDER_INFO 
+      {
+         Instantiate_In_System_Module = "1";
+         Is_Enabled = "1";
+         Iss_Launch_Telnet = "0";
+         Top_Level_Ports_Are_Enumerated = "1";
+         View 
+         {
+            Settings_Summary = "9-bit UART with 115200 baud, <br>
+                    1 stop bits and N parity";
+            Is_Collapsed = "1";
+            MESSAGES 
+            {
+            }
+         }
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+      }
+      SIMULATION 
+      {
+         DISPLAY 
+         {
+            SIGNAL a
+            {
+               name = "  Bus Interface";
+               format = "Divider";
+            }
+            SIGNAL b
+            {
+               name = "chipselect";
+            }
+            SIGNAL c
+            {
+               name = "address";
+               radix = "hexadecimal";
+            }
+            SIGNAL d
+            {
+               name = "writedata";
+               radix = "hexadecimal";
+            }
+            SIGNAL e
+            {
+               name = "readdata";
+               radix = "hexadecimal";
+            }
+            SIGNAL f
+            {
+               name = "  Internals";
+               format = "Divider";
+            }
+            SIGNAL g
+            {
+               name = "tx_ready";
+            }
+            SIGNAL h
+            {
+               name = "tx_data";
+               radix = "ascii";
+            }
+            SIGNAL i
+            {
+               name = "rx_char_ready";
+            }
+            SIGNAL j
+            {
+               name = "rx_data";
+               radix = "ascii";
+            }
+         }
+         INTERACTIVE_OUT log
+         {
+            enable = "0";
+            file = "_log_module.txt";
+            radix = "ascii";
+            signals = "temp,list";
+            exe = "perl -- tail-f.pl";
+         }
+         INTERACTIVE_IN drive
+         {
+            enable = "0";
+            file = "_input_data_stream.dat";
+            mutex = "_input_data_mutex.dat";
+            log = "_in.log";
+            rate = "100";
+            signals = "temp,list";
+            exe = "perl -- uart.pl";
+         }
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         baud = "115200";
+         data_bits = "9";
+         fixed_baud = "1";
+         parity = "N";
+         stop_bits = "1";
+         sync_reg_depth = "2";
+         use_cts_rts = "0";
+         use_eop_register = "0";
+         sim_true_baud = "0";
+         sim_char_stream = "";
+      }
+      HDL_INFO 
+      {
+         Precompiled_Simulation_Library_Files = "";
+         Simulation_HDL_Files = "";
+         Synthesis_HDL_Files = "__PROJECT_DIRECTORY__/uart_1.v";
+         Synthesis_Only_Files = "";
+      }
+   }
+   MODULE remote_update_cycloneiii_0
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT reset
+            {
+               type = "reset";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT writedata
+            {
+               type = "writedata";
+               width = "32";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT readdata
+            {
+               type = "readdata";
+               width = "32";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT address
+            {
+               type = "address";
+               width = "6";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT chipselect
+            {
+               type = "chipselect";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT write
+            {
+               type = "write";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT read
+            {
+               type = "read";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT waitrequest
+            {
+               type = "waitrequest";
+               width = "1";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Bus_Type = "avalon";
+            Read_Wait_States = "peripheral_controlled";
+            Write_Wait_States = "peripheral_controlled";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "2";
+            Is_Memory_Device = "0";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "32";
+            Address_Width = "6";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x11000000";
+            }
+            Base_Address = "0x11000000";
+            Address_Group = "0";
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "NC";
+            }
+         }
+      }
+      class = "no_legacy_module";
+      class_version = "7.080900";
+      gtf_class_name = "altera_avalon_remote_update_cycloneiii";
+      gtf_class_version = "9.0";
+      SYSTEM_BUILDER_INFO 
+      {
+         Do_Not_Generate = "1";
+         Instantiate_In_System_Module = "1";
+         Is_Bridge = "0";
+         Is_Enabled = "1";
+         Clock_Source = "clk_33";
+         Has_Clock = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+      HDL_INFO 
+      {
+         Simulation_HDL_Files = "__PROJECT_DIRECTORY__/remote_update_cycloneiii_0.vo";
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         terminated_ports 
+         {
+         }
+      }
+   }
+   MODULE avalon_bus_contents_0
+   {
+      SLAVE s1
+      {
+         PORT_WIRING 
+         {
+            PORT csi_s1clk_clk
+            {
+               type = "clk";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_read
+            {
+               type = "read";
+               width = "1";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_readdata
+            {
+               type = "readdata";
+               width = "32";
+               direction = "output";
+               Is_Enabled = "1";
+            }
+            PORT avs_s1_address
+            {
+               type = "address";
+               width = "9";
+               direction = "input";
+               Is_Enabled = "1";
+            }
+         }
+         SYSTEM_BUILDER_INFO 
+         {
+            Bus_Type = "avalon";
+            Write_Wait_States = "0cycles";
+            Read_Wait_States = "1cycles";
+            Hold_Time = "0cycles";
+            Setup_Time = "0cycles";
+            Is_Printable_Device = "0";
+            Address_Alignment = "native";
+            Well_Behaved_Waitrequest = "0";
+            Is_Nonvolatile_Storage = "0";
+            Read_Latency = "0";
+            Is_Memory_Device = "1";
+            Maximum_Pending_Read_Transactions = "0";
+            Minimum_Uninterrupted_Run_Length = "1";
+            Accepts_Internal_Connections = "1";
+            Write_Latency = "0";
+            Is_Flash = "0";
+            Data_Width = "32";
+            Address_Width = "9";
+            Maximum_Burst_Size = "1";
+            Register_Incoming_Signals = "0";
+            Register_Outgoing_Signals = "0";
+            Interleave_Bursts = "0";
+            Linewrap_Bursts = "0";
+            Burst_On_Burst_Boundaries_Only = "0";
+            Always_Burst_Max_Burst = "0";
+            Is_Big_Endian = "0";
+            Is_Enabled = "1";
+            MASTERED_BY cpu_0/data_master
+            {
+               priority = "1";
+               Offset_Address = "0x1c000000";
+            }
+            Base_Address = "0x1c000000";
+            Address_Group = "0";
+            IRQ_MASTER cpu_0/data_master
+            {
+               IRQ_Number = "NC";
+            }
+         }
+      }
+      class = "no_legacy_module";
+      class_version = "7.080900";
+      gtf_class_name = "avalon_bus_contents";
+      gtf_class_version = "1.0";
+      SYSTEM_BUILDER_INFO 
+      {
+         Do_Not_Generate = "1";
+         Instantiate_In_System_Module = "1";
+         Is_Bridge = "0";
+         Is_Enabled = "1";
+         Clock_Source = "clk_66";
+         Has_Clock = "1";
+         View 
+         {
+            MESSAGES 
+            {
+            }
+         }
+      }
+      HDL_INFO 
+      {
+         Simulation_HDL_Files = "__PROJECT_DIRECTORY__/avalon_bus_contents_0.vhd";
+      }
+      WIZARD_SCRIPT_ARGUMENTS 
+      {
+         terminated_ports 
+         {
+         }
+      }
+   }
+}
diff --git a/recipes/linux/linux-nios2_2.6.28.bb b/recipes/linux/linux-nios2_2.6.28.bb
new file mode 100644
index 0000000..031f4f5
--- /dev/null
+++ b/recipes/linux/linux-nios2_2.6.28.bb
@@ -0,0 +1,36 @@
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "unifdef-native"
+PR = "r3"
+
+FILESPATH = "${FILE_DIRNAME}/${PN}/${PV}"
+
+#SRC_URI = "git://sopc.et.ntust.edu.tw/git/linux-2.6.git;branch=test-nios2;tags=3146b39c185f8a436d430132457e84fa1d8f8208 \
+SRC_URI = "http://127.0.0.1/linux-nios2-2.6.28-git.tbz \
+           file://procinfo.h \
+           file://system.ptf"
+SRC_URI += "file://defconfig"
+
+S = "${WORKDIR}/linux-2.6"
+
+COMPATIBLE_HOST = 'nios2.*-linux.*'
+COMPATIBLE_MACHINE = '(nios2|sygeg1)'
+
+inherit kernel
+
+ARCH = "nios2"
+KERNEL_IMAGETYPE = "zImage"
+
+
+do_configure() {
+        rm -f ${S}/.config
+
+        if [ ! -e ${WORKDIR}/defconfig ]; then
+                die "No default configuration for ${MACHINE} available."
+        fi
+        
+	echo "CONFIG_INITRAMFS_SOURCE=\"${DEPLOY_DIR_IMAGE}/initramfs_root.cpio\""   >> ${S}/.config
+        sed -e '/CONFIG_INITRAMFS_SOURCE/d' '${WORKDIR}/defconfig' >>'${S}/.config'
+
+	oe_runmake hwselect SYSPTF=../system.ptf CPU_SELECTION=1 MEM_SELECTION=2 ARCH=$ARCH
+        yes '' | oe_runmake oldconfig
+}
-- 
1.6.0.4



