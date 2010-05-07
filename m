Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1OANwr-0004nI-Ox
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 15:50:39 +0200
Received: by wyf22 with SMTP id 22so790000wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=tffnbhCT8davRUwjkO5I+YVCqxrrk810lgqBOvS+Mdw=;
	b=wn46SNCBvZ5vc7ONCKQIKLsN7EhuT09XWv1sE/5tf5/Ql6Ao8vPfBbJuMBSX4tkXI/
	0Wi8plYloNjSvuLH3Ag7ob/L+xU+bZKOPnLLO1xudLnSGyFmlPHYIPX12aeDkhG1iVNh
	a+jbm/DyfPP5hjs5U9+2bSj6/8GjN6fTyksFo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	b=i5UF0VeuZhyj4UMltni9dWARz7elbUw/8WBo8xhqNLtHAPcLCSs1NWdRB9mGha+zIo
	1+0hdkxkJbzrOHmF6g4DXiyaOiZ0uE6YBcdtqdvEpbtiR+aj5koVI4rKWcBS6VB6gqT5
	hDnBJtBGLvw3cSD3qTrUG0PloqAsI0yhHKY5U=
Received: by 10.227.153.203 with SMTP id l11mr96804wbw.11.1273240007675;
	Fri, 07 May 2010 06:46:47 -0700 (PDT)
Received: from localhost.localdomain (delta360.server4you.de [85.25.136.130])
	by mx.google.com with ESMTPS id
	u8sm15807130wbc.23.2010.05.07.06.46.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 May 2010 06:46:46 -0700 (PDT)
Sender: Mickael Chazaux <mickael.chazaux@gmail.com>
From: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 May 2010 15:46:32 +0200
Message-Id: <1273239992-13847-1-git-send-email-mchazaux@adeneo-embedded.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
Subject: [PATCH] Add i.MX51 based "Babbage" board support
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
X-List-Received-Date: Fri, 07 May 2010 13:50:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

This is based on the patches released by Freescale as part
of LTIB.

Signed-off-by: Mickaël Chazaux <mchazaux@adeneo-embedded.com>
---
 conf/machine/babbage.conf                          |   43 +
 conf/machine/include/imx51.inc                     |   11 +
 ...NGR00119267-revert-to-gcc-4.1.2-toolchain.patch |   26 +
 recipes/linux/linux-2.6.31/babbage/defconfig       | 2102 ++++++++++++++++++++
 recipes/linux/linux_2.6.31.bb                      |   10 +
 recipes/u-boot/u-boot_2009.08.bb                   |    7 +
 6 files changed, 2199 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/babbage.conf
 create mode 100644 conf/machine/include/imx51.inc
 create mode 100644 recipes/linux/linux-2.6.31/babbage/0001-Revert-ENGR00119267-revert-to-gcc-4.1.2-toolchain.patch
 create mode 100644 recipes/linux/linux-2.6.31/babbage/defconfig

diff --git a/conf/machine/babbage.conf b/conf/machine/babbage.conf
new file mode 100644
index 0000000..d9fdaed
--- /dev/null
+++ b/conf/machine/babbage.conf
@@ -0,0 +1,43 @@
+#@TYPE: Machine
+#@NAME: Freescale i.MX51 Babbage
+#@DESCRIPTION: Machine configuration for the Babbage board
+#@URL: http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=i.MX515
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-omapfb \
+           xf86-input-keyboard"
+
+# Only has DVI connector for external screen
+GUI_MACHINE_CLASS = "bigscreen"
+
+require conf/machine/include/imx51.inc
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFFERED_PROVIDER_virtual/bootloader = "u-boot"
+
+UBOOT_MACHINE = "mx51_bbg_config"
+
+IMAGE_FSTYPES += "tar.bz2 ubi"
+EXTRA_IMAGECMD_jffs2 = "-lnp "
+
+SERIAL_CONSOLE = "115200 ttymxc0"
+
+MACHINE_FEATURES = "kernel26 screen apm usbhost vfat alsa"
+
+# The board expects the bootloader to be at offset 0x400 of SD-CARd in the bottom slot.
+# The generated u-boot.bin is zero-padded from offset 0x000 to offset 0x400.
+#
+# You may flash it using a command like :
+#	# dd if=/u-boot.bin of=/dev/sdX
+#
+# Alternatively, if you want to keep your partition table intact, you can use
+# something like :
+#	# dd if=/u-boot.bin of=/dev/sdX bs=512 seek=2 skip=2
+#
+# Note that both of these commands will destroy any filesystem present on the
+# sectors u-boot will be written. Please Consider creating your partition
+# table accordingly.
diff --git a/conf/machine/include/imx51.inc b/conf/machine/include/imx51.inc
new file mode 100644
index 0000000..543e09f
--- /dev/null
+++ b/conf/machine/include/imx51.inc
@@ -0,0 +1,11 @@
+require conf/machine/include/tune-cortexa8.inc
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+# Increase this everytime you change something in the kernel
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ENTRYPOINT = "0x90008000"
+UBOOT_LOADADDRESS = "0x90008000"
+
+EXTRA_IMAGEDEPENDS += "u-boot"
+
diff --git a/recipes/linux/linux-2.6.31/babbage/0001-Revert-ENGR00119267-revert-to-gcc-4.1.2-toolchain.patch b/recipes/linux/linux-2.6.31/babbage/0001-Revert-ENGR00119267-revert-to-gcc-4.1.2-toolchain.patch
new file mode 100644
index 0000000..80f0d0d
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/babbage/0001-Revert-ENGR00119267-revert-to-gcc-4.1.2-toolchain.patch
@@ -0,0 +1,26 @@
+From 1305372dfce86160fe103de0f4bd86d37d3fec4a Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
+Date: Tue, 4 May 2010 10:19:26 +0200
+Subject: [PATCH] Revert "ENGR00119267 revert to gcc 4.1.2 toolchain"
+
+This reverts commit a93beb448c82402736aaac2db070df7f17e9b0ad.
+---
+ arch/arm/Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/Makefile b/arch/arm/Makefile
+index d22dff6..c72dea4 100644
+--- a/arch/arm/Makefile
++++ b/arch/arm/Makefile
+@@ -50,7 +50,7 @@ comma = ,
+ # Note that GCC does not numerically define an architecture version
+ # macro, but instead defines a whole series of macros which makes
+ # testing for a specific architecture or later rather impossible.
+-arch-$(CONFIG_CPU_32v7)		:=-D__LINUX_ARM_ARCH__=7 $(call cc-option,-march=armv7a,-march=armv5t -Wa$(comma)-march=armv7a)
++arch-$(CONFIG_CPU_32v7)		:=-D__LINUX_ARM_ARCH__=7 $(call cc-option,-march=armv7-a,-march=armv5t -Wa$(comma)-march=armv7-a)
+ arch-$(CONFIG_CPU_32v6)		:=-D__LINUX_ARM_ARCH__=6 $(call cc-option,-march=armv6,-march=armv5t -Wa$(comma)-march=armv6)
+ # Only override the compiler option if ARMv6. The ARMv6K extensions are
+ # always available in ARMv7
+-- 
+1.6.3.3
+
diff --git a/recipes/linux/linux-2.6.31/babbage/defconfig b/recipes/linux/linux-2.6.31/babbage/defconfig
new file mode 100644
index 0000000..feb7efe
--- /dev/null
+++ b/recipes/linux/linux-2.6.31/babbage/defconfig
@@ -0,0 +1,2102 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.31
+# Sat Dec  5 00:11:48 2009
+#
+CONFIG_ARM=y
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
+CONFIG_ZONE_DMA=y
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
+CONFIG_LOCK_KERNEL=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+CONFIG_LOCALVERSION_AUTO=y
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
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_GROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_BLK_DEV_INITRD is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EMBEDDED=y
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
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
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_SLOW_WORK is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+CONFIG_LBDAF=y
+# CONFIG_BLK_DEV_BSG is not set
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
+CONFIG_ARCH_MXC=y
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
+# CONFIG_ARCH_PXA is not set
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
+CONFIG_DMA_ZONE_SIZE=64
+CONFIG_UTMI_MXC=y
+
+#
+# Freescale MXC Implementations
+#
+# CONFIG_ARCH_MX1 is not set
+# CONFIG_ARCH_MX2 is not set
+# CONFIG_ARCH_MX3 is not set
+# CONFIG_ARCH_MX25 is not set
+# CONFIG_ARCH_MX35 is not set
+# CONFIG_ARCH_MX37 is not set
+CONFIG_ARCH_MX51=y
+CONFIG_MXC_SDMA_API=y
+CONFIG_SDMA_IRAM=y
+CONFIG_SDMA_IRAM_SIZE=0x1000
+CONFIG_I2C_MXC_SELECT1=y
+CONFIG_I2C_MXC_SELECT2=y
+# CONFIG_I2C_MXC_SELECT3 is not set
+CONFIG_FORCE_MAX_ZONEORDER=13
+CONFIG_ARCH_MXC_HAS_NFC_V3=y
+
+#
+# MX51 Options
+#
+CONFIG_MX51_OPTIONS=y
+CONFIG_MACH_MX51_3DS=y
+CONFIG_MACH_MX51_BABBAGE=y
+CONFIG_ARCH_MXC_HAS_NFC_V3_2=y
+
+#
+# SDMA options
+#
+
+#
+# Device options
+#
+CONFIG_MXC_TZIC=y
+# CONFIG_MXC_IRQ_PRIOR is not set
+# CONFIG_MXC_PWM is not set
+CONFIG_MXC_DVFS_PER=y
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=y
+CONFIG_CPU_32v6K=y
+CONFIG_CPU_V7=y
+CONFIG_CPU_32v7=y
+CONFIG_CPU_ABRT_EV7=y
+CONFIG_CPU_PABRT_IFAR=y
+CONFIG_CPU_CACHE_V7=y
+CONFIG_CPU_CACHE_VIPT=y
+CONFIG_CPU_COPY_V6=y
+CONFIG_CPU_TLB_V7=y
+CONFIG_CPU_HAS_ASID=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+# CONFIG_ARM_THUMBEE is not set
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+CONFIG_HAS_TLS_REG=y
+# CONFIG_ARM_ERRATA_430973 is not set
+# CONFIG_ARM_ERRATA_458693 is not set
+# CONFIG_ARM_ERRATA_460075 is not set
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
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT=y
+CONFIG_HZ=100
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=1
+CONFIG_BOUNCE=y
+CONFIG_VIRT_TO_BUS=y
+CONFIG_HAVE_MLOCK=y
+CONFIG_HAVE_MLOCKED_PAGE_BIT=y
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+# CONFIG_LEDS is not set
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="noinitrd console=ttymxc0,115200 root=/dev/mtdblock2 rw rootfstype=jffs2 ip=off"
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
+# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
+CONFIG_CPU_FREQ_IMX=y
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_VFP=y
+CONFIG_VFPv3=y
+CONFIG_NEON=y
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
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=y
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_APM_EMULATION=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+CONFIG_PACKET_MMAP=y
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
+CONFIG_IP_PNP_BOOTP=y
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
+CONFIG_BT=y
+CONFIG_BT_L2CAP=y
+CONFIG_BT_SCO=y
+CONFIG_BT_RFCOMM=y
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=y
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=y
+
+#
+# Bluetooth device drivers
+#
+CONFIG_BT_HCIBTUSB=y
+# CONFIG_BT_HCIBTSDIO is not set
+# CONFIG_BT_HCIUART is not set
+# CONFIG_BT_HCIBCM203X is not set
+# CONFIG_BT_HCIBPA10X is not set
+# CONFIG_BT_HCIBFUSB is not set
+CONFIG_BT_HCIVHCI=y
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+# CONFIG_CFG80211 is not set
+CONFIG_WIRELESS_OLD_REGULATORY=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+# CONFIG_LIB80211 is not set
+
+#
+# CFG80211 needs to be enabled for MAC80211
+#
+CONFIG_MAC80211_DEFAULT_PS_VALUE=0
+# CONFIG_WIMAX is not set
+CONFIG_RFKILL=y
+CONFIG_RFKILL_INPUT=y
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
+CONFIG_CONNECTOR=y
+CONFIG_PROC_EVENTS=y
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=y
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
+# CONFIG_MTD_MXC is not set
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_DATAFLASH is not set
+CONFIG_MTD_MXC_DATAFLASH=y
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
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_IMX_NFC is not set
+CONFIG_MTD_NAND_MXC_V3=y
+# CONFIG_MTD_NAND_MXC_SWECC is not set
+# CONFIG_MTD_NAND_MXC_FORCE_CE is not set
+# CONFIG_MXC_NAND_LOW_LEVEL_ERASE is not set
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
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+CONFIG_MISC_DEVICES=y
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_ISL29003 is not set
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
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+CONFIG_ATA=m
+# CONFIG_ATA_NONSTANDARD is not set
+# CONFIG_SATA_PMP is not set
+CONFIG_ATA_SFF=y
+# CONFIG_SATA_MV is not set
+# CONFIG_PATA_PLATFORM is not set
+CONFIG_PATA_FSL=m
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
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
+CONFIG_NET_ETHERNET=y
+CONFIG_MII=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_ETHOC is not set
+# CONFIG_SMC911X is not set
+CONFIG_SMSC911X=y
+# CONFIG_DNET is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+# CONFIG_CS89x0 is not set
+# CONFIG_KS8842 is not set
+# CONFIG_KS8851 is not set
+CONFIG_FEC=y
+# CONFIG_FEC2 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
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
+# CONFIG_USB_HSO is not set
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
+CONFIG_INPUT_POLLDEV=y
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
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
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+CONFIG_KEYBOARD_MXC=y
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
+# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+CONFIG_TOUCHSCREEN_MXC=y
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+CONFIG_INPUT_MISC=y
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_UINPUT=y
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
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
+CONFIG_FM_SI4702=m
+CONFIG_MXC_IIM=y
+CONFIG_IMX_SIM=m
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_MXC=y
+CONFIG_SERIAL_MXC_CONSOLE=y
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_IMX is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+CONFIG_LEGACY_PTYS=y
+CONFIG_LEGACY_PTY_COUNT=256
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
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
+# CONFIG_I2C_IMX is not set
+CONFIG_I2C_MXC=y
+CONFIG_I2C_MXC_HS=y
+# CONFIG_I2C_OCORES is not set
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
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+# CONFIG_I2C_SLAVE is not set
+CONFIG_SPI=y
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+CONFIG_SPI_BITBANG=y
+# CONFIG_SPI_GPIO is not set
+CONFIG_SPI_MXC=y
+# CONFIG_SPI_MXC_TEST_LOOPBACK is not set
+CONFIG_SPI_MXC_SELECT1=y
+# CONFIG_SPI_MXC_SELECT2 is not set
+# CONFIG_SPI_MXC_SELECT3 is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_GPIO_SYSFS is not set
+
+#
+# Memory mapped GPIO expanders:
+#
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
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
+CONFIG_W1=m
+CONFIG_W1_CON=y
+
+#
+# 1-wire Bus Masters
+#
+# CONFIG_W1_MASTER_DS2490 is not set
+# CONFIG_W1_MASTER_DS2482 is not set
+CONFIG_W1_MASTER_MXC=m
+# CONFIG_W1_MASTER_GPIO is not set
+
+#
+# 1-wire Slaves
+#
+# CONFIG_W1_SLAVE_THERM is not set
+# CONFIG_W1_SLAVE_SMEM is not set
+# CONFIG_W1_SLAVE_DS2431 is not set
+# CONFIG_W1_SLAVE_DS2751 is not set
+# CONFIG_W1_SLAVE_DS2433 is not set
+CONFIG_W1_SLAVE_DS2438=m
+# CONFIG_W1_SLAVE_DS2760 is not set
+# CONFIG_W1_SLAVE_BQ27000 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+CONFIG_APM_POWER=y
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+CONFIG_HWMON=y
+# CONFIG_HWMON_VID is not set
+# CONFIG_SENSORS_AD7414 is not set
+# CONFIG_SENSORS_AD7418 is not set
+# CONFIG_SENSORS_ADCXX is not set
+# CONFIG_SENSORS_ADM1021 is not set
+# CONFIG_SENSORS_ADM1025 is not set
+# CONFIG_SENSORS_ADM1026 is not set
+# CONFIG_SENSORS_ADM1029 is not set
+# CONFIG_SENSORS_ADM1031 is not set
+# CONFIG_SENSORS_ADM9240 is not set
+# CONFIG_SENSORS_ADT7462 is not set
+# CONFIG_SENSORS_ADT7470 is not set
+# CONFIG_SENSORS_ADT7473 is not set
+# CONFIG_SENSORS_ADT7475 is not set
+# CONFIG_SENSORS_ATXP1 is not set
+# CONFIG_SENSORS_DS1621 is not set
+# CONFIG_SENSORS_F71805F is not set
+# CONFIG_SENSORS_F71882FG is not set
+# CONFIG_SENSORS_F75375S is not set
+# CONFIG_SENSORS_G760A is not set
+# CONFIG_SENSORS_GL518SM is not set
+# CONFIG_SENSORS_GL520SM is not set
+# CONFIG_SENSORS_IT87 is not set
+# CONFIG_SENSORS_LM63 is not set
+# CONFIG_SENSORS_LM70 is not set
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
+# CONFIG_SENSORS_LTC4215 is not set
+# CONFIG_SENSORS_LTC4245 is not set
+# CONFIG_SENSORS_LM95241 is not set
+# CONFIG_SENSORS_MAX1111 is not set
+# CONFIG_SENSORS_MAX1619 is not set
+# CONFIG_SENSORS_MAX6650 is not set
+# CONFIG_SENSORS_PC87360 is not set
+# CONFIG_SENSORS_PC87427 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_SHT15 is not set
+# CONFIG_SENSORS_DME1737 is not set
+# CONFIG_SENSORS_SMSC47M1 is not set
+# CONFIG_SENSORS_SMSC47M192 is not set
+# CONFIG_SENSORS_SMSC47B397 is not set
+# CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_THMC50 is not set
+# CONFIG_SENSORS_TMP401 is not set
+# CONFIG_SENSORS_VT1211 is not set
+# CONFIG_SENSORS_W83781D is not set
+# CONFIG_SENSORS_W83791D is not set
+# CONFIG_SENSORS_W83792D is not set
+# CONFIG_SENSORS_W83793 is not set
+# CONFIG_SENSORS_W83L785TS is not set
+# CONFIG_SENSORS_W83L786NG is not set
+# CONFIG_SENSORS_W83627HF is not set
+# CONFIG_SENSORS_W83627EHF is not set
+# CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_HWMON_DEBUG_CHIP is not set
+CONFIG_SENSORS_ISL29003=y
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+CONFIG_MXC_WATCHDOG=y
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
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
+# CONFIG_TPS65010 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_AB3100_CORE is not set
+# CONFIG_EZX_PCAP is not set
+CONFIG_MEDIA_SUPPORT=y
+
+#
+# Multimedia core support
+#
+CONFIG_VIDEO_DEV=y
+CONFIG_VIDEO_V4L2_COMMON=y
+CONFIG_VIDEO_ALLOW_V4L1=y
+CONFIG_VIDEO_V4L1_COMPAT=y
+# CONFIG_DVB_CORE is not set
+CONFIG_VIDEO_MEDIA=y
+
+#
+# Multimedia drivers
+#
+# CONFIG_MEDIA_ATTACH is not set
+CONFIG_MEDIA_TUNER=y
+CONFIG_MEDIA_TUNER_CUSTOMISE=y
+# CONFIG_MEDIA_TUNER_SIMPLE is not set
+# CONFIG_MEDIA_TUNER_TDA8290 is not set
+# CONFIG_MEDIA_TUNER_TDA827X is not set
+# CONFIG_MEDIA_TUNER_TDA18271 is not set
+# CONFIG_MEDIA_TUNER_TDA9887 is not set
+# CONFIG_MEDIA_TUNER_TEA5761 is not set
+# CONFIG_MEDIA_TUNER_TEA5767 is not set
+# CONFIG_MEDIA_TUNER_MT20XX is not set
+# CONFIG_MEDIA_TUNER_MT2060 is not set
+# CONFIG_MEDIA_TUNER_MT2266 is not set
+# CONFIG_MEDIA_TUNER_MT2131 is not set
+# CONFIG_MEDIA_TUNER_QT1010 is not set
+# CONFIG_MEDIA_TUNER_XC2028 is not set
+# CONFIG_MEDIA_TUNER_XC5000 is not set
+# CONFIG_MEDIA_TUNER_MXL5005S is not set
+# CONFIG_MEDIA_TUNER_MXL5007T is not set
+# CONFIG_MEDIA_TUNER_MC44S803 is not set
+CONFIG_VIDEO_V4L2=y
+CONFIG_VIDEO_V4L1=y
+CONFIG_VIDEO_CAPTURE_DRIVERS=y
+# CONFIG_VIDEO_ADV_DEBUG is not set
+# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
+# CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
+
+#
+# Encoders/decoders and other helper chips
+#
+
+#
+# Audio decoders
+#
+# CONFIG_VIDEO_TVAUDIO is not set
+# CONFIG_VIDEO_TDA7432 is not set
+# CONFIG_VIDEO_TDA9840 is not set
+# CONFIG_VIDEO_TDA9875 is not set
+# CONFIG_VIDEO_TEA6415C is not set
+# CONFIG_VIDEO_TEA6420 is not set
+# CONFIG_VIDEO_MSP3400 is not set
+# CONFIG_VIDEO_CS5345 is not set
+# CONFIG_VIDEO_CS53L32A is not set
+# CONFIG_VIDEO_M52790 is not set
+# CONFIG_VIDEO_TLV320AIC23B is not set
+# CONFIG_VIDEO_WM8775 is not set
+# CONFIG_VIDEO_WM8739 is not set
+# CONFIG_VIDEO_VP27SMPX is not set
+
+#
+# RDS decoders
+#
+# CONFIG_VIDEO_SAA6588 is not set
+
+#
+# Video decoders
+#
+# CONFIG_VIDEO_BT819 is not set
+# CONFIG_VIDEO_BT856 is not set
+# CONFIG_VIDEO_BT866 is not set
+# CONFIG_VIDEO_KS0127 is not set
+# CONFIG_VIDEO_OV7670 is not set
+# CONFIG_VIDEO_MT9V011 is not set
+# CONFIG_VIDEO_TCM825X is not set
+# CONFIG_VIDEO_SAA7110 is not set
+# CONFIG_VIDEO_SAA711X is not set
+# CONFIG_VIDEO_SAA717X is not set
+# CONFIG_VIDEO_SAA7191 is not set
+# CONFIG_VIDEO_TVP514X is not set
+# CONFIG_VIDEO_TVP5150 is not set
+# CONFIG_VIDEO_VPX3220 is not set
+
+#
+# Video and audio decoders
+#
+# CONFIG_VIDEO_CX25840 is not set
+
+#
+# MPEG video encoders
+#
+# CONFIG_VIDEO_CX2341X is not set
+
+#
+# Video encoders
+#
+# CONFIG_VIDEO_SAA7127 is not set
+# CONFIG_VIDEO_SAA7185 is not set
+# CONFIG_VIDEO_ADV7170 is not set
+# CONFIG_VIDEO_ADV7175 is not set
+# CONFIG_VIDEO_THS7303 is not set
+# CONFIG_VIDEO_ADV7343 is not set
+
+#
+# Video improvement chips
+#
+# CONFIG_VIDEO_UPD64031A is not set
+# CONFIG_VIDEO_UPD64083 is not set
+# CONFIG_VIDEO_VIVI is not set
+CONFIG_VIDEO_MXC_CAMERA=m
+
+#
+# MXC Camera/V4L2 PRP Features support
+#
+CONFIG_VIDEO_MXC_IPU_CAMERA=y
+# CONFIG_VIDEO_MXC_CSI_CAMERA is not set
+# CONFIG_MXC_CAMERA_MC521DA is not set
+# CONFIG_MXC_EMMA_CAMERA_MICRON111 is not set
+# CONFIG_MXC_CAMERA_OV2640_EMMA is not set
+# CONFIG_MXC_CAMERA_MICRON111 is not set
+# CONFIG_MXC_CAMERA_OV2640 is not set
+CONFIG_MXC_CAMERA_OV3640=m
+# CONFIG_MXC_TVIN_ADV7180 is not set
+CONFIG_MXC_IPU_PRP_VF_SDC=m
+CONFIG_MXC_IPU_PRP_ENC=m
+CONFIG_MXC_IPU_CSI_ENC=m
+CONFIG_VIDEO_MXC_OUTPUT=y
+CONFIG_VIDEO_MXC_IPU_OUTPUT=y
+# CONFIG_VIDEO_MXC_IPUV1_WVGA_OUTPUT is not set
+# CONFIG_VIDEO_MXC_OPL is not set
+# CONFIG_VIDEO_CPIA is not set
+# CONFIG_VIDEO_CPIA2 is not set
+# CONFIG_VIDEO_SAA5246A is not set
+# CONFIG_VIDEO_SAA5249 is not set
+# CONFIG_SOC_CAMERA is not set
+CONFIG_V4L_USB_DRIVERS=y
+CONFIG_USB_VIDEO_CLASS=y
+CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
+CONFIG_USB_GSPCA=m
+# CONFIG_USB_M5602 is not set
+# CONFIG_USB_STV06XX is not set
+# CONFIG_USB_GSPCA_CONEX is not set
+# CONFIG_USB_GSPCA_ETOMS is not set
+# CONFIG_USB_GSPCA_FINEPIX is not set
+# CONFIG_USB_GSPCA_MARS is not set
+# CONFIG_USB_GSPCA_MR97310A is not set
+# CONFIG_USB_GSPCA_OV519 is not set
+# CONFIG_USB_GSPCA_OV534 is not set
+# CONFIG_USB_GSPCA_PAC207 is not set
+# CONFIG_USB_GSPCA_PAC7311 is not set
+# CONFIG_USB_GSPCA_SN9C20X is not set
+# CONFIG_USB_GSPCA_SONIXB is not set
+# CONFIG_USB_GSPCA_SONIXJ is not set
+# CONFIG_USB_GSPCA_SPCA500 is not set
+# CONFIG_USB_GSPCA_SPCA501 is not set
+# CONFIG_USB_GSPCA_SPCA505 is not set
+# CONFIG_USB_GSPCA_SPCA506 is not set
+# CONFIG_USB_GSPCA_SPCA508 is not set
+# CONFIG_USB_GSPCA_SPCA561 is not set
+# CONFIG_USB_GSPCA_SQ905 is not set
+# CONFIG_USB_GSPCA_SQ905C is not set
+# CONFIG_USB_GSPCA_STK014 is not set
+# CONFIG_USB_GSPCA_SUNPLUS is not set
+# CONFIG_USB_GSPCA_T613 is not set
+# CONFIG_USB_GSPCA_TV8532 is not set
+# CONFIG_USB_GSPCA_VC032X is not set
+# CONFIG_USB_GSPCA_ZC3XX is not set
+# CONFIG_VIDEO_PVRUSB2 is not set
+# CONFIG_VIDEO_HDPVR is not set
+# CONFIG_VIDEO_EM28XX is not set
+# CONFIG_VIDEO_CX231XX is not set
+# CONFIG_VIDEO_USBVISION is not set
+# CONFIG_USB_VICAM is not set
+# CONFIG_USB_IBMCAM is not set
+# CONFIG_USB_KONICAWC is not set
+# CONFIG_USB_QUICKCAM_MESSENGER is not set
+# CONFIG_USB_ET61X251 is not set
+# CONFIG_VIDEO_OVCAMCHIP is not set
+# CONFIG_USB_OV511 is not set
+# CONFIG_USB_SE401 is not set
+# CONFIG_USB_SN9C102 is not set
+# CONFIG_USB_STV680 is not set
+# CONFIG_USB_ZC0301 is not set
+# CONFIG_USB_PWC is not set
+CONFIG_USB_PWC_INPUT_EVDEV=y
+# CONFIG_USB_ZR364XX is not set
+# CONFIG_USB_STKWEBCAM is not set
+# CONFIG_USB_S2255 is not set
+CONFIG_RADIO_ADAPTERS=y
+# CONFIG_USB_DSBR is not set
+# CONFIG_USB_SI470X is not set
+# CONFIG_USB_MR800 is not set
+# CONFIG_RADIO_TEA5764 is not set
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
+CONFIG_FB_MODE_HELPERS=y
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+CONFIG_FB_MXC=y
+CONFIG_FB_MXC_SYNC_PANEL=y
+CONFIG_FB_MXC_EPSON_VGA_SYNC_PANEL=y
+CONFIG_FB_MXC_TVOUT_TVE=y
+# CONFIG_FB_MXC_CLAA_WVGA_SYNC_PANEL is not set
+CONFIG_FB_MXC_CH7026=y
+# CONFIG_FB_MXC_TVOUT_CH7024 is not set
+# CONFIG_FB_MXC_ASYNC_PANEL is not set
+# CONFIG_FB_UVESA is not set
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_GENERIC=y
+CONFIG_BACKLIGHT_MXC=y
+CONFIG_BACKLIGHT_MXC_MC13892=y
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
+CONFIG_SOUND=y
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_JACK=y
+# CONFIG_SND_SEQUENCER is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=y
+CONFIG_SND_PCM_OSS=y
+CONFIG_SND_PCM_OSS_PLUGINS=y
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
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_MXC_SPDIF=m
+CONFIG_SND_SPI=y
+CONFIG_SND_USB=y
+# CONFIG_SND_USB_AUDIO is not set
+# CONFIG_SND_USB_CAIAQ is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_MXC_SOC=y
+CONFIG_SND_MXC_SOC_SSI=y
+CONFIG_SND_MXC_SOC_IRAM=y
+CONFIG_SND_SOC_IMX_3STACK_SGTL5000=y
+# CONFIG_SND_SOC_IMX_3STACK_AK4647 is not set
+# CONFIG_SND_SOC_IMX_3STACK_WM8580 is not set
+# CONFIG_SND_SOC_IMX_3STACK_AK5702 is not set
+# CONFIG_SND_SOC_IMX_3STACK_BLUETOOTH is not set
+CONFIG_SND_SOC_I2C_AND_SPI=y
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_SGTL5000=y
+# CONFIG_SOUND_PRIME is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HID_DEBUG is not set
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
+CONFIG_HID_A4TECH=m
+CONFIG_HID_APPLE=m
+CONFIG_HID_BELKIN=m
+CONFIG_HID_CHERRY=m
+CONFIG_HID_CHICONY=m
+CONFIG_HID_CYPRESS=m
+# CONFIG_HID_DRAGONRISE is not set
+CONFIG_HID_EZKEY=m
+# CONFIG_HID_KYE is not set
+CONFIG_HID_GYRATION=m
+# CONFIG_HID_KENSINGTON is not set
+CONFIG_HID_LOGITECH=m
+# CONFIG_LOGITECH_FF is not set
+# CONFIG_LOGIRUMBLEPAD2_FF is not set
+CONFIG_HID_MICROSOFT=m
+CONFIG_HID_MONTEREY=m
+# CONFIG_HID_NTRIG is not set
+CONFIG_HID_PANTHERLORD=m
+# CONFIG_PANTHERLORD_FF is not set
+CONFIG_HID_PETALYNX=m
+CONFIG_HID_SAMSUNG=m
+CONFIG_HID_SONY=m
+CONFIG_HID_SUNPLUS=m
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_WACOM is not set
+# CONFIG_HID_ZEROPLUS is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
+
+#
+# Miscellaneous USB options
+#
+# CONFIG_USB_DEVICEFS is not set
+CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DYNAMIC_MINORS is not set
+CONFIG_USB_SUSPEND=y
+# CONFIG_USB_OTG is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_MON is not set
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ARC=y
+CONFIG_USB_EHCI_ARC_H1=y
+# CONFIG_USB_EHCI_ARC_H2 is not set
+# CONFIG_USB_EHCI_ARC_OTG is not set
+# CONFIG_USB_STATIC_IRAM is not set
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+# CONFIG_USB_GADGET_MUSB_HDRC is not set
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
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_AT91 is not set
+# CONFIG_USB_GADGET_ATMEL_USBA is not set
+# CONFIG_USB_GADGET_FSL_USB2 is not set
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
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
+CONFIG_USB_GADGET_ARC=y
+CONFIG_USB_ARC=y
+# CONFIG_USB_GADGET_LANGWELL is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+CONFIG_USB_GADGET_ARC_OTG=y
+# CONFIG_USB_GADGET_FSL_MC13783 is not set
+# CONFIG_USB_GADGET_FSL_1301 is not set
+# CONFIG_USB_GADGET_FSL_1504 is not set
+CONFIG_USB_GADGET_FSL_UTMI=y
+# CONFIG_USB_ZERO is not set
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+CONFIG_USB_GADGETFS=m
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_NOP_USB_XCEIV is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+CONFIG_SDIO_UNIFI_FS=m
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_MXC is not set
+# CONFIG_MMC_SPI is not set
+CONFIG_MMC_IMX_ESDHCI=y
+# CONFIG_MMC_IMX_ESDHCI_PIO_MODE is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+CONFIG_LEDS_MC13892=y
+# CONFIG_LEDS_PCA9532 is not set
+# CONFIG_LEDS_GPIO is not set
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+
+#
+# LED Triggers
+#
+# CONFIG_LEDS_TRIGGERS is not set
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
+CONFIG_RTC_INTF_DEV_UIE_EMUL=y
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
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_MXC is not set
+# CONFIG_RTC_DRV_MXC_V2 is not set
+# CONFIG_RTC_DRV_IMXDI is not set
+CONFIG_RTC_MC13892=y
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_DEBUG is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_REGULATOR_MAX1586 is not set
+# CONFIG_REGULATOR_LP3971 is not set
+CONFIG_REGULATOR_MC13892=y
+CONFIG_UIO=y
+# CONFIG_UIO_PDRV is not set
+CONFIG_UIO_PDRV_GENIRQ=m
+# CONFIG_UIO_SMX is not set
+# CONFIG_UIO_SERCOS3 is not set
+# CONFIG_STAGING is not set
+
+#
+# MXC support drivers
+#
+CONFIG_MXC_IPU=y
+CONFIG_MXC_IPU_V3=y
+
+#
+# MXC SSI support
+#
+# CONFIG_MXC_SSI is not set
+
+#
+# MXC Digital Audio Multiplexer support
+#
+# CONFIG_MXC_DAM is not set
+
+#
+# MXC PMIC support
+#
+CONFIG_MXC_PMIC=y
+# CONFIG_MXC_PMIC_MC13783 is not set
+CONFIG_MXC_PMIC_MC13892=y
+CONFIG_MXC_PMIC_I2C=y
+CONFIG_MXC_PMIC_SPI=y
+# CONFIG_MXC_PMIC_MC34704 is not set
+# CONFIG_MXC_PMIC_MC9SDZ60 is not set
+# CONFIG_MXC_PMIC_CHARDEV is not set
+
+#
+# MXC PMIC Client Drivers
+#
+CONFIG_MXC_MC13892_ADC=y
+CONFIG_MXC_MC13892_RTC=y
+CONFIG_MXC_MC13892_LIGHT=y
+CONFIG_MXC_MC13892_BATTERY=y
+CONFIG_MXC_MC13892_CONNECTIVITY=y
+CONFIG_MXC_MC13892_POWER=y
+# CONFIG_MXC_PMIC_MC9S08DZ60 is not set
+
+#
+# MXC Security Drivers
+#
+# CONFIG_MXC_SECURITY_SCC is not set
+CONFIG_MXC_SECURITY_SCC2=y
+CONFIG_SCC_DEBUG=y
+# CONFIG_MXC_SECURITY_RNG is not set
+
+#
+# SAHARA2 Security Hardware Support
+#
+# CONFIG_MXC_SAHARA is not set
+
+#
+# MXC MPEG4 Encoder Kernel module support
+#
+# CONFIG_MXC_HMP4E is not set
+
+#
+# MXC HARDWARE EVENT
+#
+# CONFIG_MXC_HWEVENT is not set
+
+#
+# MXC VPU(Video Processing Unit) support
+#
+CONFIG_MXC_VPU=y
+CONFIG_MXC_VPU_IRAM=y
+# CONFIG_MXC_VPU_DEBUG is not set
+
+#
+# MXC Asynchronous Sample Rate Converter support
+#
+
+#
+# MXC Bluetooth support
+#
+CONFIG_MXC_BLUETOOTH=m
+
+#
+# Broadcom GPS ioctrl support
+#
+CONFIG_GPS_IOCTRL=m
+
+#
+# MXC Media Local Bus Driver
+#
+
+#
+# i.MX ADC support
+#
+# CONFIG_IMX_ADC is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4DEV_COMPAT is not set
+CONFIG_EXT4_FS_XATTR=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+CONFIG_JBD=y
+CONFIG_JBD2=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
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
+CONFIG_AUTOFS4_FS=m
+# CONFIG_FUSE_FS is not set
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
+# CONFIG_NILFS2_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+# CONFIG_NFS_V4 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
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
+CONFIG_NLS_ASCII=m
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
+CONFIG_NLS_UTF8=m
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
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_SLUB_DEBUG_ON is not set
+# CONFIG_SLUB_STATS is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
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
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_MANAGER2 is not set
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+# CONFIG_CRYPTO_CRYPTODEV is not set
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
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_HW=y
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+CONFIG_CRC_CCITT=m
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/recipes/linux/linux_2.6.31.bb b/recipes/linux/linux_2.6.31.bb
index 638622d..a8fa74c 100644
--- a/recipes/linux/linux_2.6.31.bb
+++ b/recipes/linux/linux_2.6.31.bb
@@ -13,6 +13,7 @@ DEFAULT_PREFERENCE_qemumips = "1"
 DEFAULT_PREFERENCE_qemux86 = "1"
 DEFAULT_PREFERENCE_iei-nanogx-466 = "1"
 DEFAULT_PREFERENCE_cm-x300 = "1"
+DEFAULT_PREFERENCE_babbage = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.12.bz2;patch=1;name=stablepatch \
@@ -71,6 +72,12 @@ SRC_URI_append_cm-x300 = "\
            file://linux-2.6.31-cm-x300.patch;patch=1 \
            "
 
+SRC_URI_append_babbage = " \
+           http://download.berlios.de/mx25patches/linux-2.6.31.12-imx-09.12.00.patch.bz2;patch=1;name=patchbabbage \
+	   file://0001-Revert-ENGR00119267-revert-to-gcc-4.1.2-toolchain.patch;patch=1 \
+           file://defconfig \
+           "
+
 do_devicetree_image_append_boc01() {
 	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree.v1 ${KERNEL_DEVICETREE}.v1
 	install -m 0644 devicetree.v1 ${D}/boot/devicetree-${KERNEL_VERSION}.v1
@@ -91,3 +98,6 @@ SRC_URI[stablepatch.md5sum] = "ce365b2c72ad0855e1746a80b7abdade"
 SRC_URI[stablepatch.sha256sum] = "7dea28a76ca6362ad949ec1bf45fada4a6fc888b40360d90d2f56f01d18f72ae"
 SRC_URI[at91patch.md5sum] = "bf420f0340e30b0a2c42b2b36d0b2577"
 SRC_URI[at91patch.sha256sum] = "738b88daa31e1a033646900813a5f1ce40ba21e2836500fd848a984565f27584"
+SRC_URI[patchbabbage.md5sum] = "a1687104ac3654a3a91cdeb039281369"
+SRC_URI[patchbabbage.sha256sum] = "2ecbc311e2887165f8d8327f8c7ff118c16d4c9554b281b733bb0d7619139779"
+
diff --git a/recipes/u-boot/u-boot_2009.08.bb b/recipes/u-boot/u-boot_2009.08.bb
index f5277a5..2d6bded 100644
--- a/recipes/u-boot/u-boot_2009.08.bb
+++ b/recipes/u-boot/u-boot_2009.08.bb
@@ -5,6 +5,7 @@ DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_at91sam9g20ek = "1"
 DEFAULT_PREFERENCE_at91sam9g45ek = "1"
 DEFAULT_PREFERENCE_igep0020 = "1"
+DEFAULT_PREFERENCE_babbage  = "1"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
 
@@ -12,6 +13,12 @@ SRC_URI_append_igep0020 = " \
 	file://update-mach-types.patch;patch=1 \
 	file://add-board-support-for-IGEP-v2-series-rev-B.patch;patch=1 \
 "
+SRC_URI_append_babbage ="\
+           http://download.berlios.de/mx25patches/u-boot-v2009.08-imx-09.12.00.patch.bz2;patch=1;name=ubootbabbage \
+           "
+
+SRC_URI[ubootbabbage.md5sum] = "b7bc4870b647de422b983ea3acc367a5"
+SRC_URI[ubootbabbage.sha256sum] = "c65baf791f987126251dfcb5fa100ffef6cf6b668b71d57c2ca4e1128870ff9b"
 
 TARGET_LDFLAGS = ""
 
-- 
1.6.3.3



