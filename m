Received: from blrmail.mistralsolutions.com ([220.227.112.130]
	helo=mistralsolutions.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anilm@mistralsolutions.com>) id 1PJTS1-0008Mc-5P
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 17:05:48 +0100
X-MDAV-Processed: mistralsolutions.com, Fri, 19 Nov 2010 21:33:52 +0530
Received: from [192.168.13.139] by mistralsolutions.com (Cipher
	TLSv1:RC4-MD5:128) (MDaemon PRO v11.0.2)
	with ESMTP id md50003865729.msg
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 21:33:49 +0530
X-Spam-Processed: mistralsolutions.com, Fri, 19 Nov 2010 21:33:49 +0530
	(not processed: message size (447746) exceeds spam filter configured
	max size of (102400))
X-Authenticated-Sender: anilm@mistralsolutions.com
X-MDRemoteIP: 192.168.13.139
X-Return-Path: anilm@mistralsolutions.com
X-Envelope-From: anilm@mistralsolutions.com
X-MDaemon-Deliver-To: openembedded-devel@lists.openembedded.org
Message-ID: <4CE69FC7.2040607@mistralsolutions.com>
Date: Fri, 19 Nov 2010 21:33:19 +0530
From: Anil <anilm@mistralsolutions.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PJRde-0007Xb-3l@melo.openembedded.org>
In-Reply-To: <E1PJRde-0007Xb-3l@melo.openembedded.org>
X-SA-Exim-Connect-IP: 220.227.112.130
X-SA-Exim-Mail-From: anilm@mistralsolutions.com
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
Cc: Nagendra <nagendra@mistralsolutions.com>,
	Srinath R <srinath@mistralsolutions.com>, jdk@ti.com,
	umeshk@mistralsolutions.com
Subject: am3517/05 : Add am3517-crane machine type
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
X-List-Received-Date: Fri, 19 Nov 2010 16:05:49 -0000
X-Groupsio-MsgNum: 26326
Content-Type: multipart/mixed; boundary="------------020304050605000808070609"

--------------020304050605000808070609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

Adding support for AM3517/05-Craneboard machine type to openembedded.

Craneboard is a hardware development platform based on the Sitara AM3517 
ARM Cortex - A8 microprocessor device. This is a low cost reference design.

These patches adds support for craneboard  x-load,  u-boot and kernel 
along with configuration file for openembedded.

     [1] http://www.ti.com/arm
     [2] http://www.mistralsolutions.com/products/craneboard.php

Please review and let me know your comments.

.--
Thanks and regards
Anil kumar .M



Please do not print this email unless it is absolutely necessary. Spread environmental awareness.

-------------------------------------------------------DISCLAIMER------------------------------------------------------
The information transmitted herewith is confidential and proprietary information intended only for use by the individual or entity to which it is addressed. If the reader of this message is not the intended recipient, you are hereby notified that any review, retransmission, dissemination, distribution, copying or other use of, or taking of any action in reliance upon this information is strictly prohibited. If you have received this communication in error, please contact the sender and delete the material from your computer.
---------------------------------------------------------------------------------------------------------------------------

--------------020304050605000808070609
Content-Type: text/x-patch;
 name="0001-Adding-new-am3517-crane-machine-type.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Adding-new-am3517-crane-machine-type.patch"

From 0e10a0d089e33508d2423a95c4e0fe1bc19eff6b Mon Sep 17 00:00:00 2001
From: Anil Kumar <anilm@mistralsolutions.com>
Date: Thu, 18 Nov 2010 21:23:23 +0530
Subject: [PATCH] Adding new am3517-crane machine type

Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
---
 conf/machine/am3517-crane.conf |   52 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/am3517-crane.conf

diff --git a/conf/machine/am3517-crane.conf b/conf/machine/am3517-crane.conf
new file mode 100644
index 0000000..dad4625
--- /dev/null
+++ b/conf/machine/am3517-crane.conf
@@ -0,0 +1,52 @@
+#@TYPE: Machine
+#@NAME: craneboard machine
+#@DESCRIPTION: Machine configuration for the AM3517 Crane board
+TARGET_ARCH = "arm"
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
+require conf/machine/include/omap3.inc
+
+# Ship all kernel modules
+
+IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
+EXTRA_IMAGEDEPENDS += " u-boot x-load"
+
+SERIAL_CONSOLE = "115200 ttyS2"
+USE_VT = "2"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
+
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+
+UBOOT_ARCH = "arm"
+UBOOT_MACHINE = "am3517_crane_config"
+XLOAD_MACHINE = "am3517crane_config"
+
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen ethernet"
+
+# NOTE: there are NAND and OneNAND versions of this board...
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    129024 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1996 LEBs
+MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
+
-- 
1.7.0.4


--------------020304050605000808070609
Content-Type: text/x-patch;
 name="0001-Applied-kernel-patch-for-Am3517-Crane-board-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Applied-kernel-patch-for-Am3517-Crane-board-support.pat";
 filename*1="ch"

From 8f7d4ee920a5838d74a5d5a95b3d7a6e6e514823 Mon Sep 17 00:00:00 2001
From: Anil Kumar <anilm@mistralsolutions.com>
Date: Thu, 18 Nov 2010 21:39:35 +0530
Subject: [PATCH] Applied kernel patch for Am3517 Crane board support

Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
---
 .../0001-Craneboard-patch-on-PSP-03.00.01.06.patch | 6537 ++++++++++++++++++++
 .../linux-omap-psp-2.6.32/am3517-crane/defconfig   | 1769 ++++++
 recipes/linux/linux-omap-psp_2.6.32.bb             |    3 +-
 3 files changed, 8308 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-omap-psp-2.6.32/0001-Craneboard-patch-on-PSP-03.00.01.06.patch
 create mode 100644 recipes/linux/linux-omap-psp-2.6.32/am3517-crane/defconfig

diff --git a/recipes/linux/linux-omap-psp-2.6.32/0001-Craneboard-patch-on-PSP-03.00.01.06.patch b/recipes/linux/linux-omap-psp-2.6.32/0001-Craneboard-patch-on-PSP-03.00.01.06.patch
new file mode 100644
index 0000000..5ecef16
--- /dev/null
+++ b/recipes/linux/linux-omap-psp-2.6.32/0001-Craneboard-patch-on-PSP-03.00.01.06.patch
@@ -0,0 +1,6537 @@
+From aaf9be9da50a9b20e82760761c0badd1e28158e0 Mon Sep 17 00:00:00 2001
+From: Srinath <srinath@mistralsolutions.com>
+Date: Wed, 3 Nov 2010 11:19:01 +0530
+Subject: [PATCH] Craneboard patch on PSP-03.00.01.06
+
+
+Signed-off-by: Srinath <srinath@mistralsolutions.com>
+---
+ arch/arm/configs/am3517_crane_defconfig      | 1769 ++++++++++++++++++++++++++
+ arch/arm/mach-omap2/Kconfig                  |    6 +
+ arch/arm/mach-omap2/Makefile                 |    2 +
+ arch/arm/mach-omap2/board-am3517crane.c      |  773 +++++++++++
+ arch/arm/mach-omap2/mmc-am3517crane.c        |  267 ++++
+ arch/arm/mach-omap2/mmc-am3517crane.h        |   22 +
+ arch/arm/mach-omap2/tps65910-pmic.c          |  195 +++
+ arch/arm/tools/mach-types                    |    1 +
+ drivers/gpio/Kconfig                         |    7 +
+ drivers/gpio/Makefile                        |    2 +
+ drivers/gpio/tps65910-gpio.c                 |  364 ++++++
+ drivers/i2c/busses/i2c-omap.c                |    3 +-
+ drivers/input/misc/Kconfig                   |   10 +
+ drivers/input/misc/Makefile                  |    1 +
+ drivers/input/misc/tps65910-pwrbutton.c      |  148 +++
+ drivers/mfd/Kconfig                          |   13 +
+ drivers/mfd/Makefile                         |    4 +-
+ drivers/mfd/tps65910-core.c                  |  741 +++++++++++
+ drivers/regulator/Kconfig                    |    7 +
+ drivers/regulator/Makefile                   |    1 +
+ drivers/regulator/tps65910-regulator.c       |  674 ++++++++++
+ drivers/rtc/Kconfig                          |    8 +
+ drivers/rtc/Makefile                         |    1 +
+ drivers/rtc/rtc-tps65910.c                   |  657 ++++++++++
+ drivers/usb/host/ehci-hub.c                  |    9 +-
+ drivers/usb/musb/Kconfig                     |    6 +-
+ drivers/usb/musb/Makefile                    |    3 +-
+ drivers/usb/musb/musb_core.c                 |    2 +-
+ drivers/usb/musb/musb_core.h                 |    2 +-
+ drivers/usb/musb/musb_gadget.c               |    2 +-
+ drivers/usb/musb/musb_gadget_ep0.c           |    2 +-
+ drivers/usb/musb/musb_io.h                   |    5 +-
+ drivers/usb/musb/musb_virthub.c              |    8 +-
+ drivers/video/omap2/displays/panel-generic.c |    5 +-
+ drivers/video/omap2/dss/venc.c               |   15 +-
+ include/linux/i2c/tps65910.h                 |  278 ++++
+ 36 files changed, 5987 insertions(+), 26 deletions(-)
+ create mode 100644 arch/arm/configs/am3517_crane_defconfig
+ create mode 100644 arch/arm/mach-omap2/board-am3517crane.c
+ create mode 100644 arch/arm/mach-omap2/mmc-am3517crane.c
+ create mode 100644 arch/arm/mach-omap2/mmc-am3517crane.h
+ create mode 100644 arch/arm/mach-omap2/tps65910-pmic.c
+ create mode 100644 drivers/gpio/tps65910-gpio.c
+ create mode 100644 drivers/input/misc/tps65910-pwrbutton.c
+ create mode 100644 drivers/mfd/tps65910-core.c
+ create mode 100644 drivers/regulator/tps65910-regulator.c
+ create mode 100644 drivers/rtc/rtc-tps65910.c
+ create mode 100644 include/linux/i2c/tps65910.h
+
+diff --git a/arch/arm/configs/am3517_crane_defconfig b/arch/arm/configs/am3517_crane_defconfig
+new file mode 100644
+index 0000000..7af351e
+--- /dev/null
++++ b/arch/arm/configs/am3517_crane_defconfig
+@@ -0,0 +1,1769 @@
++#
++# Automatically generated make config: don't edit
++# Linux kernel version: 2.6.32
++# Fri Sep  3 09:45:07 2010
++#
++CONFIG_ARM=y
++CONFIG_SYS_SUPPORTS_APM_EMULATION=y
++CONFIG_GENERIC_GPIO=y
++CONFIG_GENERIC_TIME=y
++CONFIG_GENERIC_CLOCKEVENTS=y
++CONFIG_GENERIC_HARDIRQS=y
++CONFIG_STACKTRACE_SUPPORT=y
++CONFIG_HAVE_LATENCYTOP_SUPPORT=y
++CONFIG_LOCKDEP_SUPPORT=y
++CONFIG_TRACE_IRQFLAGS_SUPPORT=y
++CONFIG_HARDIRQS_SW_RESEND=y
++CONFIG_GENERIC_IRQ_PROBE=y
++CONFIG_RWSEM_GENERIC_SPINLOCK=y
++CONFIG_ARCH_HAS_CPUFREQ=y
++CONFIG_GENERIC_HWEIGHT=y
++CONFIG_GENERIC_CALIBRATE_DELAY=y
++CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
++CONFIG_VECTORS_BASE=0xffff0000
++CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
++CONFIG_CONSTRUCTORS=y
++
++#
++# General setup
++#
++CONFIG_EXPERIMENTAL=y
++CONFIG_BROKEN_ON_SMP=y
++CONFIG_INIT_ENV_ARG_LIMIT=32
++CONFIG_LOCALVERSION=""
++# CONFIG_LOCALVERSION_AUTO is not set
++CONFIG_SWAP=y
++CONFIG_SYSVIPC=y
++CONFIG_SYSVIPC_SYSCTL=y
++# CONFIG_POSIX_MQUEUE is not set
++CONFIG_BSD_PROCESS_ACCT=y
++# CONFIG_BSD_PROCESS_ACCT_V3 is not set
++# CONFIG_TASKSTATS is not set
++# CONFIG_AUDIT is not set
++
++#
++# RCU Subsystem
++#
++CONFIG_TREE_RCU=y
++# CONFIG_TREE_PREEMPT_RCU is not set
++# CONFIG_TINY_RCU is not set
++# CONFIG_RCU_TRACE is not set
++CONFIG_RCU_FANOUT=32
++# CONFIG_RCU_FANOUT_EXACT is not set
++# CONFIG_TREE_RCU_TRACE is not set
++CONFIG_IKCONFIG=y
++CONFIG_IKCONFIG_PROC=y
++CONFIG_LOG_BUF_SHIFT=14
++CONFIG_GROUP_SCHED=y
++CONFIG_FAIR_GROUP_SCHED=y
++# CONFIG_RT_GROUP_SCHED is not set
++CONFIG_USER_SCHED=y
++# CONFIG_CGROUP_SCHED is not set
++# CONFIG_CGROUPS is not set
++CONFIG_SYSFS_DEPRECATED=y
++CONFIG_SYSFS_DEPRECATED_V2=y
++# CONFIG_RELAY is not set
++# CONFIG_NAMESPACES is not set
++CONFIG_BLK_DEV_INITRD=y
++CONFIG_INITRAMFS_SOURCE=""
++CONFIG_RD_GZIP=y
++# CONFIG_RD_BZIP2 is not set
++# CONFIG_RD_LZMA is not set
++CONFIG_CC_OPTIMIZE_FOR_SIZE=y
++CONFIG_SYSCTL=y
++CONFIG_ANON_INODES=y
++CONFIG_EMBEDDED=y
++CONFIG_UID16=y
++# CONFIG_SYSCTL_SYSCALL is not set
++CONFIG_KALLSYMS=y
++# CONFIG_KALLSYMS_ALL is not set
++CONFIG_KALLSYMS_EXTRA_PASS=y
++CONFIG_HOTPLUG=y
++CONFIG_PRINTK=y
++CONFIG_BUG=y
++CONFIG_ELF_CORE=y
++CONFIG_BASE_FULL=y
++CONFIG_FUTEX=y
++CONFIG_EPOLL=y
++CONFIG_SIGNALFD=y
++CONFIG_TIMERFD=y
++CONFIG_EVENTFD=y
++CONFIG_SHMEM=y
++CONFIG_AIO=y
++
++#
++# Kernel Performance Events And Counters
++#
++CONFIG_VM_EVENT_COUNTERS=y
++CONFIG_COMPAT_BRK=y
++CONFIG_SLAB=y
++# CONFIG_SLUB is not set
++# CONFIG_SLOB is not set
++# CONFIG_PROFILING is not set
++CONFIG_HAVE_OPROFILE=y
++# CONFIG_KPROBES is not set
++CONFIG_HAVE_KPROBES=y
++CONFIG_HAVE_KRETPROBES=y
++CONFIG_HAVE_CLK=y
++
++#
++# GCOV-based kernel profiling
++#
++# CONFIG_SLOW_WORK is not set
++CONFIG_HAVE_GENERIC_DMA_COHERENT=y
++CONFIG_SLABINFO=y
++CONFIG_RT_MUTEXES=y
++CONFIG_BASE_SMALL=0
++CONFIG_MODULES=y
++# CONFIG_MODULE_FORCE_LOAD is not set
++CONFIG_MODULE_UNLOAD=y
++# CONFIG_MODULE_FORCE_UNLOAD is not set
++CONFIG_MODVERSIONS=y
++CONFIG_MODULE_SRCVERSION_ALL=y
++CONFIG_BLOCK=y
++CONFIG_LBDAF=y
++# CONFIG_BLK_DEV_BSG is not set
++# CONFIG_BLK_DEV_INTEGRITY is not set
++
++#
++# IO Schedulers
++#
++CONFIG_IOSCHED_NOOP=y
++CONFIG_IOSCHED_DEADLINE=y
++CONFIG_IOSCHED_CFQ=y
++# CONFIG_DEFAULT_DEADLINE is not set
++CONFIG_DEFAULT_CFQ=y
++# CONFIG_DEFAULT_NOOP is not set
++CONFIG_DEFAULT_IOSCHED="cfq"
++# CONFIG_INLINE_SPIN_TRYLOCK is not set
++# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
++# CONFIG_INLINE_SPIN_LOCK is not set
++# CONFIG_INLINE_SPIN_LOCK_BH is not set
++# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
++# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
++CONFIG_INLINE_SPIN_UNLOCK=y
++# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
++CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
++# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
++# CONFIG_INLINE_READ_TRYLOCK is not set
++# CONFIG_INLINE_READ_LOCK is not set
++# CONFIG_INLINE_READ_LOCK_BH is not set
++# CONFIG_INLINE_READ_LOCK_IRQ is not set
++# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
++CONFIG_INLINE_READ_UNLOCK=y
++# CONFIG_INLINE_READ_UNLOCK_BH is not set
++CONFIG_INLINE_READ_UNLOCK_IRQ=y
++# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
++# CONFIG_INLINE_WRITE_TRYLOCK is not set
++# CONFIG_INLINE_WRITE_LOCK is not set
++# CONFIG_INLINE_WRITE_LOCK_BH is not set
++# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
++# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
++CONFIG_INLINE_WRITE_UNLOCK=y
++# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
++CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
++# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
++# CONFIG_MUTEX_SPIN_ON_OWNER is not set
++CONFIG_FREEZER=y
++
++#
++# System Type
++#
++CONFIG_MMU=y
++# CONFIG_ARCH_AAEC2000 is not set
++# CONFIG_ARCH_INTEGRATOR is not set
++# CONFIG_ARCH_REALVIEW is not set
++# CONFIG_ARCH_VERSATILE is not set
++# CONFIG_ARCH_AT91 is not set
++# CONFIG_ARCH_CLPS711X is not set
++# CONFIG_ARCH_GEMINI is not set
++# CONFIG_ARCH_EBSA110 is not set
++# CONFIG_ARCH_EP93XX is not set
++# CONFIG_ARCH_FOOTBRIDGE is not set
++# CONFIG_ARCH_MXC is not set
++# CONFIG_ARCH_STMP3XXX is not set
++# CONFIG_ARCH_NETX is not set
++# CONFIG_ARCH_H720X is not set
++# CONFIG_ARCH_NOMADIK is not set
++# CONFIG_ARCH_IOP13XX is not set
++# CONFIG_ARCH_IOP32X is not set
++# CONFIG_ARCH_IOP33X is not set
++# CONFIG_ARCH_IXP23XX is not set
++# CONFIG_ARCH_IXP2000 is not set
++# CONFIG_ARCH_IXP4XX is not set
++# CONFIG_ARCH_L7200 is not set
++# CONFIG_ARCH_DOVE is not set
++# CONFIG_ARCH_KIRKWOOD is not set
++# CONFIG_ARCH_LOKI is not set
++# CONFIG_ARCH_MV78XX0 is not set
++# CONFIG_ARCH_ORION5X is not set
++# CONFIG_ARCH_MMP is not set
++# CONFIG_ARCH_KS8695 is not set
++# CONFIG_ARCH_NS9XXX is not set
++# CONFIG_ARCH_W90X900 is not set
++# CONFIG_ARCH_PNX4008 is not set
++# CONFIG_ARCH_PXA is not set
++# CONFIG_ARCH_MSM is not set
++# CONFIG_ARCH_RPC is not set
++# CONFIG_ARCH_SA1100 is not set
++# CONFIG_ARCH_S3C2410 is not set
++# CONFIG_ARCH_S3C64XX is not set
++# CONFIG_ARCH_S5PC1XX is not set
++# CONFIG_ARCH_SHARK is not set
++# CONFIG_ARCH_LH7A40X is not set
++# CONFIG_ARCH_U300 is not set
++# CONFIG_ARCH_DAVINCI is not set
++CONFIG_ARCH_OMAP=y
++# CONFIG_ARCH_BCMRING is not set
++# CONFIG_ARCH_U8500 is not set
++
++#
++# TI OMAP Implementations
++#
++CONFIG_ARCH_OMAP_OTG=y
++# CONFIG_ARCH_OMAP1 is not set
++# CONFIG_ARCH_OMAP2 is not set
++CONFIG_ARCH_OMAP3=y
++# CONFIG_ARCH_OMAP4 is not set
++
++#
++# OMAP Feature Selections
++#
++CONFIG_OMAP_RESET_CLOCKS=y
++CONFIG_OMAP_MUX=y
++# CONFIG_OMAP_MUX_DEBUG is not set
++CONFIG_OMAP_MUX_WARNINGS=y
++CONFIG_OMAP_MCBSP=y
++# CONFIG_OMAP_MBOX_FWK is not set
++# CONFIG_OMAP_MPU_TIMER is not set
++CONFIG_OMAP_32K_TIMER=y
++# CONFIG_OMAP3_L2_AUX_SECURE_SAVE_RESTORE is not set
++CONFIG_OMAP_32K_TIMER_HZ=128
++CONFIG_OMAP_DM_TIMER=y
++# CONFIG_OMAP_LL_DEBUG_UART1 is not set
++# CONFIG_OMAP_LL_DEBUG_UART2 is not set
++CONFIG_OMAP_LL_DEBUG_UART3=y
++# CONFIG_OMAP_LL_DEBUG_NONE is not set
++# CONFIG_OMAP_PM_NONE is not set
++CONFIG_OMAP_PM_NOOP=y
++# CONFIG_OMAP_PM_SRF is not set
++CONFIG_ARCH_OMAP34XX=y
++CONFIG_ARCH_OMAP3430=y
++CONFIG_OMAP_PACKAGE_CBB=y
++
++#
++# OMAP Board Type
++#
++# CONFIG_MACH_OMAP3_BEAGLE is not set
++# CONFIG_MACH_OMAP_LDP is not set
++# CONFIG_MACH_OVERO is not set
++# CONFIG_MACH_OMAP3EVM is not set
++# CONFIG_MACH_OMAP3517EVM is not set
++CONFIG_MACH_CRANEBOARD=y
++# CONFIG_MACH_OMAP3_PANDORA is not set
++# CONFIG_MACH_OMAP3_TOUCHBOOK is not set
++# CONFIG_MACH_OMAP_3430SDP is not set
++# CONFIG_MACH_NOKIA_RX51 is not set
++# CONFIG_MACH_OMAP_ZOOM2 is not set
++# CONFIG_MACH_OMAP_ZOOM3 is not set
++# CONFIG_MACH_CM_T35 is not set
++# CONFIG_MACH_IGEP0020 is not set
++# CONFIG_MACH_OMAP_3630SDP is not set
++# CONFIG_OMAP3_EMU is not set
++# CONFIG_OMAP3_SDRC_AC_TIMING is not set
++
++#
++# Processor Type
++#
++CONFIG_CPU_32=y
++CONFIG_CPU_32v6K=y
++CONFIG_CPU_V7=y
++CONFIG_CPU_32v7=y
++CONFIG_CPU_ABRT_EV7=y
++CONFIG_CPU_PABRT_V7=y
++CONFIG_CPU_CACHE_V7=y
++CONFIG_CPU_CACHE_VIPT=y
++CONFIG_CPU_COPY_V6=y
++CONFIG_CPU_TLB_V7=y
++CONFIG_CPU_HAS_ASID=y
++CONFIG_CPU_CP15=y
++CONFIG_CPU_CP15_MMU=y
++
++#
++# Processor Features
++#
++CONFIG_ARM_THUMB=y
++# CONFIG_ARM_THUMBEE is not set
++# CONFIG_CPU_ICACHE_DISABLE is not set
++# CONFIG_CPU_DCACHE_DISABLE is not set
++# CONFIG_CPU_BPREDICT_DISABLE is not set
++CONFIG_HAS_TLS_REG=y
++CONFIG_ARM_L1_CACHE_SHIFT=6
++CONFIG_ARM_ERRATA_430973=y
++CONFIG_ARM_ERRATA_458693=y
++CONFIG_ARM_ERRATA_460075=y
++CONFIG_COMMON_CLKDEV=y
++
++#
++# Bus support
++#
++# CONFIG_PCI_SYSCALL is not set
++# CONFIG_ARCH_SUPPORTS_MSI is not set
++# CONFIG_PCCARD is not set
++
++#
++# Kernel Features
++#
++CONFIG_TICK_ONESHOT=y
++CONFIG_NO_HZ=y
++CONFIG_HIGH_RES_TIMERS=y
++CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
++CONFIG_VMSPLIT_3G=y
++# CONFIG_VMSPLIT_2G is not set
++# CONFIG_VMSPLIT_1G is not set
++CONFIG_PAGE_OFFSET=0xC0000000
++CONFIG_PREEMPT_NONE=y
++# CONFIG_PREEMPT_VOLUNTARY is not set
++# CONFIG_PREEMPT is not set
++CONFIG_HZ=128
++# CONFIG_THUMB2_KERNEL is not set
++CONFIG_AEABI=y
++CONFIG_OABI_COMPAT=y
++CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
++# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
++# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
++# CONFIG_HIGHMEM is not set
++CONFIG_SELECT_MEMORY_MODEL=y
++CONFIG_FLATMEM_MANUAL=y
++# CONFIG_DISCONTIGMEM_MANUAL is not set
++# CONFIG_SPARSEMEM_MANUAL is not set
++CONFIG_FLATMEM=y
++CONFIG_FLAT_NODE_MEM_MAP=y
++CONFIG_PAGEFLAGS_EXTENDED=y
++CONFIG_SPLIT_PTLOCK_CPUS=4
++# CONFIG_PHYS_ADDR_T_64BIT is not set
++CONFIG_ZONE_DMA_FLAG=0
++CONFIG_VIRT_TO_BUS=y
++# CONFIG_KSM is not set
++CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
++# CONFIG_LEDS is not set
++CONFIG_ALIGNMENT_TRAP=y
++# CONFIG_UACCESS_WITH_MEMCPY is not set
++
++#
++# Boot options
++#
++CONFIG_ZBOOT_ROM_TEXT=0x0
++CONFIG_ZBOOT_ROM_BSS=0x0
++CONFIG_CMDLINE="root=/dev/nfs nfsroot=192.168.0.1:/home/user/buildroot ip=192.168.0.2:192.168.0.1:192.168.0.1:255.255.255.0:tgt:eth0:off rw console=ttyS2,115200n8"
++# CONFIG_XIP_KERNEL is not set
++# CONFIG_KEXEC is not set
++
++#
++# CPU Power Management
++#
++# CONFIG_CPU_FREQ is not set
++# CONFIG_CPU_IDLE is not set
++
++#
++# Floating point emulation
++#
++
++#
++# At least one emulation must be selected
++#
++CONFIG_FPE_NWFPE=y
++# CONFIG_FPE_NWFPE_XP is not set
++# CONFIG_FPE_FASTFPE is not set
++CONFIG_VFP=y
++CONFIG_VFPv3=y
++CONFIG_NEON=y
++
++#
++# Userspace binary formats
++#
++CONFIG_BINFMT_ELF=y
++# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
++CONFIG_HAVE_AOUT=y
++# CONFIG_BINFMT_AOUT is not set
++CONFIG_BINFMT_MISC=y
++
++#
++# Power management options
++#
++CONFIG_PM=y
++CONFIG_PM_DEBUG=y
++# CONFIG_PM_VERBOSE is not set
++CONFIG_CAN_PM_TRACE=y
++CONFIG_PM_SLEEP=y
++CONFIG_SUSPEND=y
++# CONFIG_PM_TEST_SUSPEND is not set
++CONFIG_SUSPEND_FREEZER=y
++# CONFIG_APM_EMULATION is not set
++# CONFIG_PM_RUNTIME is not set
++CONFIG_ARCH_SUSPEND_POSSIBLE=y
++CONFIG_NET=y
++
++#
++# Networking options
++#
++CONFIG_PACKET=y
++# CONFIG_PACKET_MMAP is not set
++CONFIG_UNIX=y
++CONFIG_XFRM=y
++# CONFIG_XFRM_USER is not set
++# CONFIG_XFRM_SUB_POLICY is not set
++# CONFIG_XFRM_MIGRATE is not set
++# CONFIG_XFRM_STATISTICS is not set
++CONFIG_NET_KEY=y
++# CONFIG_NET_KEY_MIGRATE is not set
++CONFIG_INET=y
++# CONFIG_IP_MULTICAST is not set
++# CONFIG_IP_ADVANCED_ROUTER is not set
++CONFIG_IP_FIB_HASH=y
++CONFIG_IP_PNP=y
++CONFIG_IP_PNP_DHCP=y
++CONFIG_IP_PNP_BOOTP=y
++CONFIG_IP_PNP_RARP=y
++# CONFIG_NET_IPIP is not set
++# CONFIG_NET_IPGRE is not set
++# CONFIG_ARPD is not set
++# CONFIG_SYN_COOKIES is not set
++# CONFIG_INET_AH is not set
++# CONFIG_INET_ESP is not set
++# CONFIG_INET_IPCOMP is not set
++# CONFIG_INET_XFRM_TUNNEL is not set
++# CONFIG_INET_TUNNEL is not set
++CONFIG_INET_XFRM_MODE_TRANSPORT=y
++CONFIG_INET_XFRM_MODE_TUNNEL=y
++CONFIG_INET_XFRM_MODE_BEET=y
++# CONFIG_INET_LRO is not set
++CONFIG_INET_DIAG=y
++CONFIG_INET_TCP_DIAG=y
++# CONFIG_TCP_CONG_ADVANCED is not set
++CONFIG_TCP_CONG_CUBIC=y
++CONFIG_DEFAULT_TCP_CONG="cubic"
++# CONFIG_TCP_MD5SIG is not set
++# CONFIG_IPV6 is not set
++# CONFIG_NETWORK_SECMARK is not set
++# CONFIG_NETFILTER is not set
++# CONFIG_IP_DCCP is not set
++# CONFIG_IP_SCTP is not set
++# CONFIG_RDS is not set
++# CONFIG_TIPC is not set
++# CONFIG_ATM is not set
++# CONFIG_BRIDGE is not set
++# CONFIG_NET_DSA is not set
++# CONFIG_VLAN_8021Q is not set
++# CONFIG_DECNET is not set
++# CONFIG_LLC2 is not set
++# CONFIG_IPX is not set
++# CONFIG_ATALK is not set
++# CONFIG_X25 is not set
++# CONFIG_LAPB is not set
++# CONFIG_ECONET is not set
++# CONFIG_WAN_ROUTER is not set
++# CONFIG_PHONET is not set
++# CONFIG_IEEE802154 is not set
++# CONFIG_NET_SCHED is not set
++# CONFIG_DCB is not set
++
++#
++# Network testing
++#
++# CONFIG_NET_PKTGEN is not set
++# CONFIG_HAMRADIO is not set
++CONFIG_CAN=y
++CONFIG_CAN_RAW=y
++CONFIG_CAN_BCM=y
++
++#
++# CAN Device Drivers
++#
++CONFIG_CAN_VCAN=y
++CONFIG_CAN_DEV=y
++CONFIG_CAN_CALC_BITTIMING=y
++CONFIG_CAN_TI_HECC=y
++# CONFIG_CAN_SJA1000 is not set
++
++#
++# CAN USB interfaces
++#
++# CONFIG_CAN_EMS_USB is not set
++CONFIG_CAN_DEBUG_DEVICES=y
++# CONFIG_IRDA is not set
++# CONFIG_BT is not set
++# CONFIG_AF_RXRPC is not set
++CONFIG_WIRELESS=y
++# CONFIG_CFG80211 is not set
++# CONFIG_LIB80211 is not set
++
++#
++# CFG80211 needs to be enabled for MAC80211
++#
++# CONFIG_WIMAX is not set
++# CONFIG_RFKILL is not set
++# CONFIG_NET_9P is not set
++
++#
++# Device Drivers
++#
++
++#
++# Generic Driver Options
++#
++CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
++# CONFIG_DEVTMPFS is not set
++CONFIG_STANDALONE=y
++CONFIG_PREVENT_FIRMWARE_BUILD=y
++# CONFIG_FW_LOADER is not set
++# CONFIG_DEBUG_DRIVER is not set
++# CONFIG_DEBUG_DEVRES is not set
++# CONFIG_SYS_HYPERVISOR is not set
++# CONFIG_CONNECTOR is not set
++CONFIG_MTD=y
++# CONFIG_MTD_DEBUG is not set
++# CONFIG_MTD_TESTS is not set
++CONFIG_MTD_CONCAT=y
++CONFIG_MTD_PARTITIONS=y
++# CONFIG_MTD_REDBOOT_PARTS is not set
++CONFIG_MTD_CMDLINE_PARTS=y
++# CONFIG_MTD_AFS_PARTS is not set
++# CONFIG_MTD_AR7_PARTS is not set
++
++#
++# User Modules And Translation Layers
++#
++CONFIG_MTD_CHAR=y
++CONFIG_MTD_BLKDEVS=y
++CONFIG_MTD_BLOCK=y
++# CONFIG_FTL is not set
++# CONFIG_NFTL is not set
++# CONFIG_INFTL is not set
++# CONFIG_RFD_FTL is not set
++# CONFIG_SSFDC is not set
++# CONFIG_MTD_OOPS is not set
++
++#
++# RAM/ROM/Flash chip drivers
++#
++# CONFIG_MTD_CFI is not set
++# CONFIG_MTD_JEDECPROBE is not set
++CONFIG_MTD_MAP_BANK_WIDTH_1=y
++CONFIG_MTD_MAP_BANK_WIDTH_2=y
++CONFIG_MTD_MAP_BANK_WIDTH_4=y
++# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
++# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
++# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
++CONFIG_MTD_CFI_I1=y
++CONFIG_MTD_CFI_I2=y
++# CONFIG_MTD_CFI_I4 is not set
++# CONFIG_MTD_CFI_I8 is not set
++# CONFIG_MTD_RAM is not set
++# CONFIG_MTD_ROM is not set
++# CONFIG_MTD_ABSENT is not set
++
++#
++# Mapping drivers for chip access
++#
++# CONFIG_MTD_COMPLEX_MAPPINGS is not set
++# CONFIG_MTD_PLATRAM is not set
++
++#
++# Self-contained MTD device drivers
++#
++# CONFIG_MTD_SLRAM is not set
++# CONFIG_MTD_PHRAM is not set
++# CONFIG_MTD_MTDRAM is not set
++# CONFIG_MTD_BLOCK2MTD is not set
++
++#
++# Disk-On-Chip Device Drivers
++#
++# CONFIG_MTD_DOC2000 is not set
++# CONFIG_MTD_DOC2001 is not set
++# CONFIG_MTD_DOC2001PLUS is not set
++CONFIG_MTD_NAND=y
++# CONFIG_MTD_NAND_VERIFY_WRITE is not set
++# CONFIG_MTD_NAND_ECC_SMC is not set
++# CONFIG_MTD_NAND_MUSEUM_IDS is not set
++# CONFIG_MTD_NAND_GPIO is not set
++CONFIG_MTD_NAND_OMAP2=y
++# CONFIG_MTD_NAND_OMAP_PREFETCH is not set
++CONFIG_MTD_NAND_IDS=y
++# CONFIG_MTD_NAND_DISKONCHIP is not set
++# CONFIG_MTD_NAND_NANDSIM is not set
++# CONFIG_MTD_NAND_PLATFORM is not set
++# CONFIG_MTD_ALAUDA is not set
++# CONFIG_MTD_ONENAND is not set
++
++#
++# LPDDR flash memory drivers
++#
++# CONFIG_MTD_LPDDR is not set
++
++#
++# UBI - Unsorted block images
++#
++# CONFIG_MTD_UBI is not set
++# CONFIG_PARPORT is not set
++CONFIG_BLK_DEV=y
++# CONFIG_BLK_DEV_COW_COMMON is not set
++CONFIG_BLK_DEV_LOOP=y
++# CONFIG_BLK_DEV_CRYPTOLOOP is not set
++
++#
++# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
++#
++# CONFIG_BLK_DEV_NBD is not set
++# CONFIG_BLK_DEV_UB is not set
++CONFIG_BLK_DEV_RAM=y
++CONFIG_BLK_DEV_RAM_COUNT=16
++CONFIG_BLK_DEV_RAM_SIZE=32768
++# CONFIG_BLK_DEV_XIP is not set
++# CONFIG_CDROM_PKTCDVD is not set
++# CONFIG_ATA_OVER_ETH is not set
++# CONFIG_MG_DISK is not set
++# CONFIG_MISC_DEVICES is not set
++CONFIG_HAVE_IDE=y
++# CONFIG_IDE is not set
++
++#
++# SCSI device support
++#
++# CONFIG_RAID_ATTRS is not set
++CONFIG_SCSI=y
++CONFIG_SCSI_DMA=y
++# CONFIG_SCSI_TGT is not set
++# CONFIG_SCSI_NETLINK is not set
++CONFIG_SCSI_PROC_FS=y
++
++#
++# SCSI support type (disk, tape, CD-ROM)
++#
++CONFIG_BLK_DEV_SD=y
++# CONFIG_CHR_DEV_ST is not set
++# CONFIG_CHR_DEV_OSST is not set
++# CONFIG_BLK_DEV_SR is not set
++# CONFIG_CHR_DEV_SG is not set
++# CONFIG_CHR_DEV_SCH is not set
++# CONFIG_SCSI_MULTI_LUN is not set
++# CONFIG_SCSI_CONSTANTS is not set
++# CONFIG_SCSI_LOGGING is not set
++# CONFIG_SCSI_SCAN_ASYNC is not set
++CONFIG_SCSI_WAIT_SCAN=m
++
++#
++# SCSI Transports
++#
++# CONFIG_SCSI_SPI_ATTRS is not set
++# CONFIG_SCSI_FC_ATTRS is not set
++# CONFIG_SCSI_ISCSI_ATTRS is not set
++# CONFIG_SCSI_SAS_LIBSAS is not set
++# CONFIG_SCSI_SRP_ATTRS is not set
++CONFIG_SCSI_LOWLEVEL=y
++# CONFIG_ISCSI_TCP is not set
++# CONFIG_LIBFC is not set
++# CONFIG_LIBFCOE is not set
++# CONFIG_SCSI_DEBUG is not set
++# CONFIG_SCSI_DH is not set
++# CONFIG_SCSI_OSD_INITIATOR is not set
++# CONFIG_ATA is not set
++# CONFIG_MD is not set
++CONFIG_NETDEVICES=y
++# CONFIG_DUMMY is not set
++# CONFIG_BONDING is not set
++# CONFIG_MACVLAN is not set
++# CONFIG_EQUALIZER is not set
++# CONFIG_TUN is not set
++# CONFIG_VETH is not set
++CONFIG_PHYLIB=y
++
++#
++# MII PHY device drivers
++#
++# CONFIG_MARVELL_PHY is not set
++# CONFIG_DAVICOM_PHY is not set
++# CONFIG_QSEMI_PHY is not set
++# CONFIG_LXT_PHY is not set
++# CONFIG_CICADA_PHY is not set
++# CONFIG_VITESSE_PHY is not set
++# CONFIG_SMSC_PHY is not set
++# CONFIG_BROADCOM_PHY is not set
++# CONFIG_ICPLUS_PHY is not set
++# CONFIG_REALTEK_PHY is not set
++# CONFIG_NATIONAL_PHY is not set
++# CONFIG_STE10XP is not set
++# CONFIG_LSI_ET1011C_PHY is not set
++# CONFIG_FIXED_PHY is not set
++# CONFIG_MDIO_BITBANG is not set
++CONFIG_NET_ETHERNET=y
++CONFIG_MII=y
++# CONFIG_AX88796 is not set
++# CONFIG_SMC91X is not set
++CONFIG_TI_DAVINCI_EMAC=y
++# CONFIG_DM9000 is not set
++# CONFIG_ETHOC is not set
++# CONFIG_SMC911X is not set
++# CONFIG_SMSC911X is not set
++# CONFIG_DNET is not set
++# CONFIG_IBM_NEW_EMAC_ZMII is not set
++# CONFIG_IBM_NEW_EMAC_RGMII is not set
++# CONFIG_IBM_NEW_EMAC_TAH is not set
++# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
++# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
++# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
++# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
++# CONFIG_B44 is not set
++# CONFIG_KS8842 is not set
++# CONFIG_KS8851_MLL is not set
++CONFIG_NETDEV_1000=y
++CONFIG_NETDEV_10000=y
++CONFIG_WLAN=y
++# CONFIG_USB_ZD1201 is not set
++# CONFIG_HOSTAP is not set
++
++#
++# Enable WiMAX (Networking options) to see the WiMAX drivers
++#
++
++#
++# USB Network Adapters
++#
++# CONFIG_USB_CATC is not set
++# CONFIG_USB_KAWETH is not set
++# CONFIG_USB_PEGASUS is not set
++# CONFIG_USB_RTL8150 is not set
++CONFIG_USB_USBNET=y
++# CONFIG_USB_NET_AX8817X is not set
++CONFIG_USB_NET_CDCETHER=y
++# CONFIG_USB_NET_CDC_EEM is not set
++CONFIG_USB_NET_DM9601=y
++# CONFIG_USB_NET_SMSC95XX is not set
++# CONFIG_USB_NET_GL620A is not set
++# CONFIG_USB_NET_NET1080 is not set
++# CONFIG_USB_NET_PLUSB is not set
++# CONFIG_USB_NET_MCS7830 is not set
++# CONFIG_USB_NET_RNDIS_HOST is not set
++# CONFIG_USB_NET_CDC_SUBSET is not set
++# CONFIG_USB_NET_ZAURUS is not set
++# CONFIG_USB_NET_INT51X1 is not set
++# CONFIG_WAN is not set
++# CONFIG_PPP is not set
++# CONFIG_SLIP is not set
++# CONFIG_NETCONSOLE is not set
++# CONFIG_NETPOLL is not set
++# CONFIG_NET_POLL_CONTROLLER is not set
++# CONFIG_ISDN is not set
++# CONFIG_PHONE is not set
++
++#
++# Input device support
++#
++CONFIG_INPUT=y
++# CONFIG_INPUT_FF_MEMLESS is not set
++# CONFIG_INPUT_POLLDEV is not set
++# CONFIG_INPUT_SPARSEKMAP is not set
++
++#
++# Userland interfaces
++#
++# CONFIG_INPUT_MOUSEDEV is not set
++# CONFIG_INPUT_JOYDEV is not set
++CONFIG_INPUT_EVDEV=y
++# CONFIG_INPUT_EVBUG is not set
++
++#
++# Input Device Drivers
++#
++# CONFIG_INPUT_KEYBOARD is not set
++# CONFIG_INPUT_MOUSE is not set
++# CONFIG_INPUT_JOYSTICK is not set
++# CONFIG_INPUT_TABLET is not set
++# CONFIG_INPUT_TOUCHSCREEN is not set
++# CONFIG_INPUT_MISC is not set
++
++#
++# Hardware I/O ports
++#
++CONFIG_SERIO=y
++CONFIG_SERIO_SERPORT=y
++CONFIG_SERIO_LIBPS2=y
++# CONFIG_SERIO_RAW is not set
++# CONFIG_SERIO_ALTERA_PS2 is not set
++# CONFIG_GAMEPORT is not set
++
++#
++# Character devices
++#
++CONFIG_VT=y
++CONFIG_CONSOLE_TRANSLATIONS=y
++CONFIG_VT_CONSOLE=y
++CONFIG_HW_CONSOLE=y
++# CONFIG_VT_HW_CONSOLE_BINDING is not set
++CONFIG_DEVKMEM=y
++# CONFIG_SERIAL_NONSTANDARD is not set
++
++#
++# Serial drivers
++#
++CONFIG_SERIAL_8250=y
++CONFIG_SERIAL_8250_CONSOLE=y
++CONFIG_SERIAL_8250_NR_UARTS=32
++CONFIG_SERIAL_8250_RUNTIME_UARTS=4
++CONFIG_SERIAL_8250_EXTENDED=y
++CONFIG_SERIAL_8250_MANY_PORTS=y
++CONFIG_SERIAL_8250_SHARE_IRQ=y
++CONFIG_SERIAL_8250_DETECT_IRQ=y
++CONFIG_SERIAL_8250_RSA=y
++
++#
++# Non-8250 serial port support
++#
++CONFIG_SERIAL_CORE=y
++CONFIG_SERIAL_CORE_CONSOLE=y
++CONFIG_UNIX98_PTYS=y
++# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
++# CONFIG_LEGACY_PTYS is not set
++# CONFIG_IPMI_HANDLER is not set
++CONFIG_HW_RANDOM=y
++# CONFIG_HW_RANDOM_TIMERIOMEM is not set
++# CONFIG_R3964 is not set
++# CONFIG_RAW_DRIVER is not set
++# CONFIG_TCG_TPM is not set
++CONFIG_I2C=y
++CONFIG_I2C_BOARDINFO=y
++CONFIG_I2C_COMPAT=y
++# CONFIG_I2C_CHARDEV is not set
++CONFIG_I2C_HELPER_AUTO=y
++
++#
++# I2C Hardware Bus support
++#
++
++#
++# I2C system bus drivers (mostly embedded / system-on-chip)
++#
++# CONFIG_I2C_DESIGNWARE is not set
++# CONFIG_I2C_GPIO is not set
++# CONFIG_I2C_OCORES is not set
++CONFIG_I2C_OMAP=y
++# CONFIG_I2C_SIMTEC is not set
++
++#
++# External I2C/SMBus adapter drivers
++#
++# CONFIG_I2C_PARPORT_LIGHT is not set
++# CONFIG_I2C_TAOS_EVM is not set
++# CONFIG_I2C_TINY_USB is not set
++
++#
++# Other I2C/SMBus bus drivers
++#
++# CONFIG_I2C_PCA_PLATFORM is not set
++# CONFIG_I2C_STUB is not set
++
++#
++# Miscellaneous I2C Chip support
++#
++# CONFIG_SENSORS_TSL2550 is not set
++# CONFIG_I2C_DEBUG_CORE is not set
++# CONFIG_I2C_DEBUG_ALGO is not set
++# CONFIG_I2C_DEBUG_BUS is not set
++# CONFIG_I2C_DEBUG_CHIP is not set
++# CONFIG_SPI is not set
++
++#
++# PPS support
++#
++# CONFIG_PPS is not set
++CONFIG_ARCH_REQUIRE_GPIOLIB=y
++CONFIG_GPIOLIB=y
++# CONFIG_DEBUG_GPIO is not set
++CONFIG_GPIO_SYSFS=y
++
++#
++# Memory mapped GPIO expanders:
++#
++
++#
++# I2C GPIO expanders:
++#
++# CONFIG_GPIO_MAX732X is not set
++# CONFIG_GPIO_PCA953X is not set
++# CONFIG_GPIO_PCF857X is not set
++# CONFIG_GPIO_TPS65910 is not set
++
++#
++# PCI GPIO expanders:
++#
++
++#
++# SPI GPIO expanders:
++#
++
++#
++# AC97 GPIO expanders:
++#
++# CONFIG_W1 is not set
++# CONFIG_POWER_SUPPLY is not set
++# CONFIG_HWMON is not set
++# CONFIG_THERMAL is not set
++CONFIG_WATCHDOG=y
++CONFIG_WATCHDOG_NOWAYOUT=y
++
++#
++# Watchdog Device Drivers
++#
++# CONFIG_SOFT_WATCHDOG is not set
++CONFIG_OMAP_WATCHDOG=y
++
++#
++# USB-based Watchdog Cards
++#
++# CONFIG_USBPCWATCHDOG is not set
++CONFIG_SSB_POSSIBLE=y
++
++#
++# Sonics Silicon Backplane
++#
++# CONFIG_SSB is not set
++
++#
++# Multifunction device drivers
++#
++# CONFIG_MFD_CORE is not set
++# CONFIG_MFD_SM501 is not set
++# CONFIG_MFD_ASIC3 is not set
++# CONFIG_HTC_EGPIO is not set
++# CONFIG_HTC_PASIC3 is not set
++# CONFIG_TPS65010 is not set
++# CONFIG_TWL4030_CORE is not set
++CONFIG_TPS65910_CORE=y
++# CONFIG_MFD_TMIO is not set
++# CONFIG_MFD_T7L66XB is not set
++# CONFIG_MFD_TC6387XB is not set
++# CONFIG_MFD_TC6393XB is not set
++# CONFIG_PMIC_DA903X is not set
++# CONFIG_PMIC_ADP5520 is not set
++# CONFIG_MFD_WM8400 is not set
++# CONFIG_MFD_WM831X is not set
++# CONFIG_MFD_WM8350_I2C is not set
++# CONFIG_MFD_PCF50633 is not set
++# CONFIG_AB3100_CORE is not set
++# CONFIG_MFD_88PM8607 is not set
++CONFIG_REGULATOR=y
++# CONFIG_REGULATOR_DEBUG is not set
++# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
++# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
++# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
++# CONFIG_REGULATOR_BQ24022 is not set
++# CONFIG_REGULATOR_MAX1586 is not set
++# CONFIG_REGULATOR_TPS65910 is not set
++# CONFIG_REGULATOR_LP3971 is not set
++# CONFIG_REGULATOR_TPS65023 is not set
++# CONFIG_REGULATOR_TPS6507X is not set
++CONFIG_MEDIA_SUPPORT=y
++
++#
++# Multimedia core support
++#
++CONFIG_VIDEO_DEV=y
++CONFIG_VIDEO_V4L2_COMMON=y
++CONFIG_VIDEO_ALLOW_V4L1=y
++CONFIG_VIDEO_V4L1_COMPAT=y
++# CONFIG_DVB_CORE is not set
++CONFIG_VIDEO_MEDIA=y
++
++#
++# Multimedia drivers
++#
++# CONFIG_MEDIA_ATTACH is not set
++CONFIG_MEDIA_TUNER=y
++# CONFIG_MEDIA_TUNER_CUSTOMISE is not set
++CONFIG_MEDIA_TUNER_SIMPLE=y
++CONFIG_MEDIA_TUNER_TDA8290=y
++CONFIG_MEDIA_TUNER_TDA9887=y
++CONFIG_MEDIA_TUNER_TEA5761=y
++CONFIG_MEDIA_TUNER_TEA5767=y
++CONFIG_MEDIA_TUNER_MT20XX=y
++CONFIG_MEDIA_TUNER_XC2028=y
++CONFIG_MEDIA_TUNER_XC5000=y
++CONFIG_MEDIA_TUNER_MC44S803=y
++CONFIG_VIDEO_V4L2=y
++CONFIG_VIDEO_V4L1=y
++# CONFIG_VIDEO_CAPTURE_DRIVERS is not set
++# CONFIG_RADIO_ADAPTERS is not set
++# CONFIG_DAB is not set
++
++#
++# Graphics support
++#
++# CONFIG_VGASTATE is not set
++# CONFIG_VIDEO_OUTPUT_CONTROL is not set
++CONFIG_FB=y
++# CONFIG_FIRMWARE_EDID is not set
++# CONFIG_FB_DDC is not set
++# CONFIG_FB_BOOT_VESA_SUPPORT is not set
++CONFIG_FB_CFB_FILLRECT=y
++CONFIG_FB_CFB_COPYAREA=y
++CONFIG_FB_CFB_IMAGEBLIT=y
++# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
++# CONFIG_FB_SYS_FILLRECT is not set
++# CONFIG_FB_SYS_COPYAREA is not set
++# CONFIG_FB_SYS_IMAGEBLIT is not set
++# CONFIG_FB_FOREIGN_ENDIAN is not set
++# CONFIG_FB_SYS_FOPS is not set
++# CONFIG_FB_SVGALIB is not set
++# CONFIG_FB_MACMODES is not set
++# CONFIG_FB_BACKLIGHT is not set
++# CONFIG_FB_MODE_HELPERS is not set
++# CONFIG_FB_TILEBLITTING is not set
++
++#
++# Frame buffer hardware drivers
++#
++# CONFIG_FB_S1D13XXX is not set
++# CONFIG_FB_VIRTUAL is not set
++# CONFIG_FB_METRONOME is not set
++# CONFIG_FB_MB862XX is not set
++# CONFIG_FB_BROADSHEET is not set
++# CONFIG_FB_OMAP_BOOTLOADER_INIT is not set
++CONFIG_OMAP2_VRAM=y
++CONFIG_OMAP2_VRFB=y
++CONFIG_OMAP2_DSS=y
++CONFIG_OMAP2_VRAM_SIZE=4
++# CONFIG_OMAP2_DSS_DEBUG_SUPPORT is not set
++# CONFIG_OMAP2_DSS_RFBI is not set
++CONFIG_OMAP2_DSS_VENC=y
++# CONFIG_OMAP2_VENC_OUT_TYPE_SVIDEO is not set
++CONFIG_OMAP2_VENC_OUT_TYPE_COMPOSITE=y
++# CONFIG_OMAP2_DSS_SDI is not set
++# CONFIG_OMAP2_DSS_DSI is not set
++# CONFIG_OMAP2_DSS_FAKE_VSYNC is not set
++CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=1
++CONFIG_FB_OMAP2=y
++# CONFIG_FB_OMAP2_DEBUG_SUPPORT is not set
++# CONFIG_FB_OMAP2_FORCE_AUTO_UPDATE is not set
++CONFIG_FB_OMAP2_NUM_FBS=1
++
++#
++# OMAP2/3 Display Device Drivers
++#
++CONFIG_PANEL_GENERIC=y
++# CONFIG_PANEL_SHARP_LS037V7DW01 is not set
++# CONFIG_PANEL_SHARP_LQ043T1DG01 is not set
++# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
++
++#
++# Display device support
++#
++# CONFIG_DISPLAY_SUPPORT is not set
++
++#
++# Console display driver support
++#
++# CONFIG_VGA_CONSOLE is not set
++CONFIG_DUMMY_CONSOLE=y
++# CONFIG_FRAMEBUFFER_CONSOLE is not set
++CONFIG_LOGO=y
++CONFIG_LOGO_LINUX_MONO=y
++CONFIG_LOGO_LINUX_VGA16=y
++CONFIG_LOGO_LINUX_CLUT224=y
++# CONFIG_SOUND is not set
++CONFIG_HID_SUPPORT=y
++CONFIG_HID=y
++# CONFIG_HIDRAW is not set
++
++#
++# USB Input Devices
++#
++CONFIG_USB_HID=y
++# CONFIG_HID_PID is not set
++# CONFIG_USB_HIDDEV is not set
++
++#
++# Special HID drivers
++#
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
++# CONFIG_HID_TWINHAN is not set
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
++# CONFIG_HID_ZEROPLUS is not set
++CONFIG_USB_SUPPORT=y
++CONFIG_USB_ARCH_HAS_HCD=y
++CONFIG_USB_ARCH_HAS_OHCI=y
++CONFIG_USB_ARCH_HAS_EHCI=y
++CONFIG_USB=y
++# CONFIG_USB_DEBUG is not set
++CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
++
++#
++# Miscellaneous USB options
++#
++CONFIG_USB_DEVICEFS=y
++CONFIG_USB_DEVICE_CLASS=y
++# CONFIG_USB_DYNAMIC_MINORS is not set
++CONFIG_USB_SUSPEND=y
++CONFIG_USB_OTG=y
++# CONFIG_USB_OTG_WHITELIST is not set
++# CONFIG_USB_OTG_BLACKLIST_HUB is not set
++# CONFIG_USB_MON is not set
++# CONFIG_USB_WUSB is not set
++# CONFIG_USB_WUSB_CBAF is not set
++
++#
++# USB Host Controller Drivers
++#
++# CONFIG_USB_C67X00_HCD is not set
++CONFIG_USB_EHCI_HCD=y
++# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
++CONFIG_USB_EHCI_TT_NEWSCHED=y
++# CONFIG_USB_OXU210HP_HCD is not set
++# CONFIG_USB_ISP116X_HCD is not set
++# CONFIG_USB_ISP1760_HCD is not set
++# CONFIG_USB_ISP1362_HCD is not set
++# CONFIG_USB_OHCI_HCD is not set
++# CONFIG_USB_SL811_HCD is not set
++# CONFIG_USB_R8A66597_HCD is not set
++# CONFIG_USB_HWA_HCD is not set
++CONFIG_USB_MUSB_HDRC=y
++CONFIG_USB_MUSB_SOC=y
++
++#
++# OMAP 343x high speed USB support
++#
++# CONFIG_USB_MUSB_HOST is not set
++# CONFIG_USB_MUSB_PERIPHERAL is not set
++CONFIG_USB_MUSB_OTG=y
++CONFIG_USB_GADGET_MUSB_HDRC=y
++CONFIG_USB_MUSB_HDRC_HCD=y
++# CONFIG_MUSB_PIO_ONLY is not set
++# CONFIG_USB_TI_CPPI_DMA is not set
++CONFIG_USB_TI_CPPI41_DMA=y
++CONFIG_USB_MUSB_DEBUG=y
++
++#
++# USB Device Class drivers
++#
++# CONFIG_USB_ACM is not set
++# CONFIG_USB_PRINTER is not set
++# CONFIG_USB_WDM is not set
++# CONFIG_USB_TMC is not set
++
++#
++# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
++#
++
++#
++# also be needed; see USB_STORAGE Help for more info
++#
++CONFIG_USB_STORAGE=y
++# CONFIG_USB_STORAGE_DEBUG is not set
++# CONFIG_USB_STORAGE_DATAFAB is not set
++# CONFIG_USB_STORAGE_FREECOM is not set
++# CONFIG_USB_STORAGE_ISD200 is not set
++# CONFIG_USB_STORAGE_USBAT is not set
++# CONFIG_USB_STORAGE_SDDR09 is not set
++# CONFIG_USB_STORAGE_SDDR55 is not set
++# CONFIG_USB_STORAGE_JUMPSHOT is not set
++# CONFIG_USB_STORAGE_ALAUDA is not set
++# CONFIG_USB_STORAGE_ONETOUCH is not set
++# CONFIG_USB_STORAGE_KARMA is not set
++# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
++# CONFIG_USB_LIBUSUAL is not set
++
++#
++# USB Imaging devices
++#
++# CONFIG_USB_MDC800 is not set
++# CONFIG_USB_MICROTEK is not set
++
++#
++# USB port drivers
++#
++# CONFIG_USB_SERIAL is not set
++
++#
++# USB Miscellaneous drivers
++#
++# CONFIG_USB_EMI62 is not set
++# CONFIG_USB_EMI26 is not set
++# CONFIG_USB_ADUTUX is not set
++# CONFIG_USB_SEVSEG is not set
++# CONFIG_USB_RIO500 is not set
++# CONFIG_USB_LEGOTOWER is not set
++# CONFIG_USB_LCD is not set
++# CONFIG_USB_BERRY_CHARGE is not set
++# CONFIG_USB_LED is not set
++# CONFIG_USB_CYPRESS_CY7C63 is not set
++# CONFIG_USB_CYTHERM is not set
++# CONFIG_USB_IDMOUSE is not set
++# CONFIG_USB_FTDI_ELAN is not set
++# CONFIG_USB_APPLEDISPLAY is not set
++# CONFIG_USB_SISUSBVGA is not set
++# CONFIG_USB_LD is not set
++# CONFIG_USB_TRANCEVIBRATOR is not set
++# CONFIG_USB_IOWARRIOR is not set
++CONFIG_USB_TEST=y
++# CONFIG_USB_ISIGHTFW is not set
++# CONFIG_USB_VST is not set
++CONFIG_USB_GADGET=y
++# CONFIG_USB_GADGET_DEBUG is not set
++# CONFIG_USB_GADGET_DEBUG_FILES is not set
++CONFIG_USB_GADGET_VBUS_DRAW=2
++CONFIG_USB_GADGET_SELECTED=y
++# CONFIG_USB_GADGET_AT91 is not set
++# CONFIG_USB_GADGET_ATMEL_USBA is not set
++# CONFIG_USB_GADGET_FSL_USB2 is not set
++# CONFIG_USB_GADGET_LH7A40X is not set
++# CONFIG_USB_GADGET_OMAP is not set
++# CONFIG_USB_GADGET_PXA25X is not set
++# CONFIG_USB_GADGET_R8A66597 is not set
++# CONFIG_USB_GADGET_PXA27X is not set
++# CONFIG_USB_GADGET_S3C_HSOTG is not set
++# CONFIG_USB_GADGET_IMX is not set
++# CONFIG_USB_GADGET_S3C2410 is not set
++# CONFIG_USB_GADGET_M66592 is not set
++# CONFIG_USB_GADGET_AMD5536UDC is not set
++# CONFIG_USB_GADGET_FSL_QE is not set
++# CONFIG_USB_GADGET_CI13XXX is not set
++# CONFIG_USB_GADGET_NET2280 is not set
++# CONFIG_USB_GADGET_GOKU is not set
++# CONFIG_USB_GADGET_LANGWELL is not set
++# CONFIG_USB_GADGET_DUMMY_HCD is not set
++CONFIG_USB_GADGET_DUALSPEED=y
++# CONFIG_USB_ZERO is not set
++# CONFIG_USB_AUDIO is not set
++CONFIG_USB_ETH=y
++CONFIG_USB_ETH_RNDIS=y
++# CONFIG_USB_ETH_EEM is not set
++# CONFIG_USB_GADGETFS is not set
++# CONFIG_USB_FILE_STORAGE is not set
++# CONFIG_USB_MASS_STORAGE is not set
++# CONFIG_USB_G_SERIAL is not set
++# CONFIG_USB_MIDI_GADGET is not set
++# CONFIG_USB_G_PRINTER is not set
++# CONFIG_USB_CDC_COMPOSITE is not set
++# CONFIG_USB_G_MULTI is not set
++
++#
++# OTG and related infrastructure
++#
++CONFIG_USB_OTG_UTILS=y
++# CONFIG_USB_GPIO_VBUS is not set
++# CONFIG_ISP1301_OMAP is not set
++# CONFIG_USB_ULPI is not set
++CONFIG_NOP_USB_XCEIV=y
++CONFIG_MMC=y
++# CONFIG_MMC_DEBUG is not set
++# CONFIG_MMC_UNSAFE_RESUME is not set
++
++#
++# MMC/SD/SDIO Card Drivers
++#
++CONFIG_MMC_BLOCK=y
++CONFIG_MMC_BLOCK_BOUNCE=y
++# CONFIG_SDIO_UART is not set
++# CONFIG_MMC_TEST is not set
++
++#
++# MMC/SD/SDIO Host Controller Drivers
++#
++# CONFIG_MMC_SDHCI is not set
++# CONFIG_MMC_OMAP is not set
++CONFIG_MMC_OMAP_HS=y
++# CONFIG_MMC_AT91 is not set
++# CONFIG_MMC_ATMELMCI is not set
++# CONFIG_MEMSTICK is not set
++# CONFIG_NEW_LEDS is not set
++# CONFIG_ACCESSIBILITY is not set
++CONFIG_RTC_LIB=y
++CONFIG_RTC_CLASS=y
++CONFIG_RTC_HCTOSYS=y
++CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
++# CONFIG_RTC_DEBUG is not set
++
++#
++# RTC interfaces
++#
++CONFIG_RTC_INTF_SYSFS=y
++CONFIG_RTC_INTF_PROC=y
++CONFIG_RTC_INTF_DEV=y
++# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
++# CONFIG_RTC_DRV_TEST is not set
++
++#
++# I2C RTC drivers
++#
++# CONFIG_RTC_DRV_DS1307 is not set
++# CONFIG_RTC_DRV_DS1374 is not set
++# CONFIG_RTC_DRV_DS1672 is not set
++# CONFIG_RTC_DRV_MAX6900 is not set
++# CONFIG_RTC_DRV_RS5C372 is not set
++# CONFIG_RTC_DRV_ISL1208 is not set
++# CONFIG_RTC_DRV_X1205 is not set
++# CONFIG_RTC_DRV_PCF8563 is not set
++# CONFIG_RTC_DRV_PCF8583 is not set
++# CONFIG_RTC_DRV_M41T80 is not set
++CONFIG_RTC_DRV_TPS65910=y
++# CONFIG_RTC_DRV_S35390A is not set
++# CONFIG_RTC_DRV_FM3130 is not set
++# CONFIG_RTC_DRV_RX8581 is not set
++# CONFIG_RTC_DRV_RX8025 is not set
++
++#
++# SPI RTC drivers
++#
++
++#
++# Platform RTC drivers
++#
++# CONFIG_RTC_DRV_CMOS is not set
++# CONFIG_RTC_DRV_DS1286 is not set
++# CONFIG_RTC_DRV_DS1511 is not set
++# CONFIG_RTC_DRV_DS1553 is not set
++# CONFIG_RTC_DRV_DS1742 is not set
++# CONFIG_RTC_DRV_STK17TA8 is not set
++# CONFIG_RTC_DRV_M48T86 is not set
++# CONFIG_RTC_DRV_M48T35 is not set
++# CONFIG_RTC_DRV_M48T59 is not set
++# CONFIG_RTC_DRV_MSM6242 is not set
++# CONFIG_RTC_DRV_BQ4802 is not set
++# CONFIG_RTC_DRV_RP5C01 is not set
++# CONFIG_RTC_DRV_V3020 is not set
++
++#
++# on-CPU RTC drivers
++#
++# CONFIG_DMADEVICES is not set
++# CONFIG_AUXDISPLAY is not set
++# CONFIG_UIO is not set
++
++#
++# TI VLYNQ
++#
++# CONFIG_STAGING is not set
++
++#
++# CBUS support
++#
++# CONFIG_CBUS is not set
++
++#
++# File systems
++#
++CONFIG_FS_JOURNAL_INFO=y
++CONFIG_EXT2_FS=y
++# CONFIG_EXT2_FS_XATTR is not set
++# CONFIG_EXT2_FS_XIP is not set
++CONFIG_EXT3_FS=y
++# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
++# CONFIG_EXT3_FS_XATTR is not set
++# CONFIG_EXT4_FS is not set
++CONFIG_JBD=y
++# CONFIG_REISERFS_FS is not set
++# CONFIG_JFS_FS is not set
++# CONFIG_FS_POSIX_ACL is not set
++# CONFIG_XFS_FS is not set
++# CONFIG_GFS2_FS is not set
++# CONFIG_OCFS2_FS is not set
++# CONFIG_BTRFS_FS is not set
++# CONFIG_NILFS2_FS is not set
++CONFIG_FILE_LOCKING=y
++CONFIG_FSNOTIFY=y
++CONFIG_DNOTIFY=y
++CONFIG_INOTIFY=y
++CONFIG_INOTIFY_USER=y
++CONFIG_QUOTA=y
++# CONFIG_QUOTA_NETLINK_INTERFACE is not set
++CONFIG_PRINT_QUOTA_WARNING=y
++CONFIG_QUOTA_TREE=y
++# CONFIG_QFMT_V1 is not set
++CONFIG_QFMT_V2=y
++CONFIG_QUOTACTL=y
++# CONFIG_AUTOFS_FS is not set
++# CONFIG_AUTOFS4_FS is not set
++# CONFIG_FUSE_FS is not set
++
++#
++# Caches
++#
++# CONFIG_FSCACHE is not set
++
++#
++# CD-ROM/DVD Filesystems
++#
++# CONFIG_ISO9660_FS is not set
++# CONFIG_UDF_FS is not set
++
++#
++# DOS/FAT/NT Filesystems
++#
++CONFIG_FAT_FS=y
++CONFIG_MSDOS_FS=y
++CONFIG_VFAT_FS=y
++CONFIG_FAT_DEFAULT_CODEPAGE=437
++CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
++# CONFIG_NTFS_FS is not set
++
++#
++# Pseudo filesystems
++#
++CONFIG_PROC_FS=y
++CONFIG_PROC_SYSCTL=y
++CONFIG_PROC_PAGE_MONITOR=y
++CONFIG_SYSFS=y
++CONFIG_TMPFS=y
++# CONFIG_TMPFS_POSIX_ACL is not set
++# CONFIG_HUGETLB_PAGE is not set
++# CONFIG_CONFIGFS_FS is not set
++CONFIG_MISC_FILESYSTEMS=y
++# CONFIG_ADFS_FS is not set
++# CONFIG_AFFS_FS is not set
++# CONFIG_HFS_FS is not set
++# CONFIG_HFSPLUS_FS is not set
++# CONFIG_BEFS_FS is not set
++# CONFIG_BFS_FS is not set
++# CONFIG_EFS_FS is not set
++CONFIG_JFFS2_FS=y
++CONFIG_JFFS2_FS_DEBUG=0
++CONFIG_JFFS2_FS_WRITEBUFFER=y
++# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
++# CONFIG_JFFS2_SUMMARY is not set
++# CONFIG_JFFS2_FS_XATTR is not set
++CONFIG_JFFS2_COMPRESSION_OPTIONS=y
++CONFIG_JFFS2_ZLIB=y
++# CONFIG_JFFS2_LZO is not set
++CONFIG_JFFS2_RTIME=y
++# CONFIG_JFFS2_RUBIN is not set
++# CONFIG_JFFS2_CMODE_NONE is not set
++CONFIG_JFFS2_CMODE_PRIORITY=y
++# CONFIG_JFFS2_CMODE_SIZE is not set
++# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
++# CONFIG_CRAMFS is not set
++# CONFIG_SQUASHFS is not set
++# CONFIG_VXFS_FS is not set
++# CONFIG_MINIX_FS is not set
++# CONFIG_OMFS_FS is not set
++# CONFIG_HPFS_FS is not set
++# CONFIG_QNX4FS_FS is not set
++# CONFIG_ROMFS_FS is not set
++# CONFIG_SYSV_FS is not set
++# CONFIG_UFS_FS is not set
++CONFIG_NETWORK_FILESYSTEMS=y
++CONFIG_NFS_FS=y
++CONFIG_NFS_V3=y
++# CONFIG_NFS_V3_ACL is not set
++CONFIG_NFS_V4=y
++# CONFIG_NFS_V4_1 is not set
++CONFIG_ROOT_NFS=y
++# CONFIG_NFSD is not set
++CONFIG_LOCKD=y
++CONFIG_LOCKD_V4=y
++CONFIG_NFS_COMMON=y
++CONFIG_SUNRPC=y
++CONFIG_SUNRPC_GSS=y
++CONFIG_RPCSEC_GSS_KRB5=y
++# CONFIG_RPCSEC_GSS_SPKM3 is not set
++# CONFIG_SMB_FS is not set
++# CONFIG_CIFS is not set
++# CONFIG_NCP_FS is not set
++# CONFIG_CODA_FS is not set
++# CONFIG_AFS_FS is not set
++
++#
++# Partition Types
++#
++CONFIG_PARTITION_ADVANCED=y
++# CONFIG_ACORN_PARTITION is not set
++# CONFIG_OSF_PARTITION is not set
++# CONFIG_AMIGA_PARTITION is not set
++# CONFIG_ATARI_PARTITION is not set
++# CONFIG_MAC_PARTITION is not set
++CONFIG_MSDOS_PARTITION=y
++# CONFIG_BSD_DISKLABEL is not set
++# CONFIG_MINIX_SUBPARTITION is not set
++# CONFIG_SOLARIS_X86_PARTITION is not set
++# CONFIG_UNIXWARE_DISKLABEL is not set
++# CONFIG_LDM_PARTITION is not set
++# CONFIG_SGI_PARTITION is not set
++# CONFIG_ULTRIX_PARTITION is not set
++# CONFIG_SUN_PARTITION is not set
++# CONFIG_KARMA_PARTITION is not set
++# CONFIG_EFI_PARTITION is not set
++# CONFIG_SYSV68_PARTITION is not set
++CONFIG_NLS=y
++CONFIG_NLS_DEFAULT="iso8859-1"
++CONFIG_NLS_CODEPAGE_437=y
++# CONFIG_NLS_CODEPAGE_737 is not set
++# CONFIG_NLS_CODEPAGE_775 is not set
++# CONFIG_NLS_CODEPAGE_850 is not set
++# CONFIG_NLS_CODEPAGE_852 is not set
++# CONFIG_NLS_CODEPAGE_855 is not set
++# CONFIG_NLS_CODEPAGE_857 is not set
++# CONFIG_NLS_CODEPAGE_860 is not set
++# CONFIG_NLS_CODEPAGE_861 is not set
++# CONFIG_NLS_CODEPAGE_862 is not set
++# CONFIG_NLS_CODEPAGE_863 is not set
++# CONFIG_NLS_CODEPAGE_864 is not set
++# CONFIG_NLS_CODEPAGE_865 is not set
++# CONFIG_NLS_CODEPAGE_866 is not set
++# CONFIG_NLS_CODEPAGE_869 is not set
++# CONFIG_NLS_CODEPAGE_936 is not set
++# CONFIG_NLS_CODEPAGE_950 is not set
++# CONFIG_NLS_CODEPAGE_932 is not set
++# CONFIG_NLS_CODEPAGE_949 is not set
++# CONFIG_NLS_CODEPAGE_874 is not set
++# CONFIG_NLS_ISO8859_8 is not set
++# CONFIG_NLS_CODEPAGE_1250 is not set
++# CONFIG_NLS_CODEPAGE_1251 is not set
++# CONFIG_NLS_ASCII is not set
++CONFIG_NLS_ISO8859_1=y
++# CONFIG_NLS_ISO8859_2 is not set
++# CONFIG_NLS_ISO8859_3 is not set
++# CONFIG_NLS_ISO8859_4 is not set
++# CONFIG_NLS_ISO8859_5 is not set
++# CONFIG_NLS_ISO8859_6 is not set
++# CONFIG_NLS_ISO8859_7 is not set
++# CONFIG_NLS_ISO8859_9 is not set
++# CONFIG_NLS_ISO8859_13 is not set
++# CONFIG_NLS_ISO8859_14 is not set
++# CONFIG_NLS_ISO8859_15 is not set
++# CONFIG_NLS_KOI8_R is not set
++# CONFIG_NLS_KOI8_U is not set
++# CONFIG_NLS_UTF8 is not set
++# CONFIG_DLM is not set
++
++#
++# Kernel hacking
++#
++# CONFIG_PRINTK_TIME is not set
++CONFIG_ENABLE_WARN_DEPRECATED=y
++CONFIG_ENABLE_MUST_CHECK=y
++CONFIG_FRAME_WARN=1024
++CONFIG_MAGIC_SYSRQ=y
++# CONFIG_STRIP_ASM_SYMS is not set
++# CONFIG_UNUSED_SYMBOLS is not set
++# CONFIG_DEBUG_FS is not set
++# CONFIG_HEADERS_CHECK is not set
++CONFIG_DEBUG_KERNEL=y
++# CONFIG_DEBUG_SHIRQ is not set
++CONFIG_DETECT_SOFTLOCKUP=y
++# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
++CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
++CONFIG_DETECT_HUNG_TASK=y
++# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
++CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
++# CONFIG_SCHED_DEBUG is not set
++# CONFIG_SCHEDSTATS is not set
++# CONFIG_TIMER_STATS is not set
++# CONFIG_DEBUG_OBJECTS is not set
++# CONFIG_DEBUG_SLAB is not set
++# CONFIG_DEBUG_KMEMLEAK is not set
++# CONFIG_DEBUG_RT_MUTEXES is not set
++# CONFIG_RT_MUTEX_TESTER is not set
++# CONFIG_DEBUG_SPINLOCK is not set
++CONFIG_DEBUG_MUTEXES=y
++# CONFIG_DEBUG_LOCK_ALLOC is not set
++# CONFIG_PROVE_LOCKING is not set
++# CONFIG_LOCK_STAT is not set
++# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
++# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
++# CONFIG_DEBUG_KOBJECT is not set
++# CONFIG_DEBUG_BUGVERBOSE is not set
++CONFIG_DEBUG_INFO=y
++# CONFIG_DEBUG_VM is not set
++# CONFIG_DEBUG_WRITECOUNT is not set
++# CONFIG_DEBUG_MEMORY_INIT is not set
++# CONFIG_DEBUG_LIST is not set
++# CONFIG_DEBUG_SG is not set
++# CONFIG_DEBUG_NOTIFIERS is not set
++# CONFIG_DEBUG_CREDENTIALS is not set
++# CONFIG_BOOT_PRINTK_DELAY is not set
++# CONFIG_RCU_TORTURE_TEST is not set
++# CONFIG_RCU_CPU_STALL_DETECTOR is not set
++# CONFIG_BACKTRACE_SELF_TEST is not set
++# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
++# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
++# CONFIG_FAULT_INJECTION is not set
++# CONFIG_LATENCYTOP is not set
++# CONFIG_SYSCTL_SYSCALL_CHECK is not set
++# CONFIG_PAGE_POISONING is not set
++CONFIG_HAVE_FUNCTION_TRACER=y
++CONFIG_TRACING_SUPPORT=y
++CONFIG_FTRACE=y
++# CONFIG_FUNCTION_TRACER is not set
++# CONFIG_IRQSOFF_TRACER is not set
++# CONFIG_SCHED_TRACER is not set
++# CONFIG_ENABLE_DEFAULT_TRACERS is not set
++# CONFIG_BOOT_TRACER is not set
++CONFIG_BRANCH_PROFILE_NONE=y
++# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
++# CONFIG_PROFILE_ALL_BRANCHES is not set
++# CONFIG_STACK_TRACER is not set
++# CONFIG_KMEMTRACE is not set
++# CONFIG_WORKQUEUE_TRACER is not set
++# CONFIG_BLK_DEV_IO_TRACE is not set
++# CONFIG_SAMPLES is not set
++CONFIG_HAVE_ARCH_KGDB=y
++# CONFIG_KGDB is not set
++CONFIG_ARM_UNWIND=y
++# CONFIG_DEBUG_USER is not set
++# CONFIG_DEBUG_ERRORS is not set
++# CONFIG_DEBUG_STACK_USAGE is not set
++CONFIG_DEBUG_LL=y
++# CONFIG_EARLY_PRINTK is not set
++# CONFIG_DEBUG_ICEDCC is not set
++# CONFIG_OC_ETM is not set
++
++#
++# Security options
++#
++# CONFIG_KEYS is not set
++# CONFIG_SECURITY is not set
++# CONFIG_SECURITYFS is not set
++# CONFIG_DEFAULT_SECURITY_SELINUX is not set
++# CONFIG_DEFAULT_SECURITY_SMACK is not set
++# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
++CONFIG_DEFAULT_SECURITY_DAC=y
++CONFIG_DEFAULT_SECURITY=""
++CONFIG_CRYPTO=y
++
++#
++# Crypto core or helper
++#
++CONFIG_CRYPTO_ALGAPI=y
++CONFIG_CRYPTO_ALGAPI2=y
++CONFIG_CRYPTO_AEAD2=y
++CONFIG_CRYPTO_BLKCIPHER=y
++CONFIG_CRYPTO_BLKCIPHER2=y
++CONFIG_CRYPTO_HASH=y
++CONFIG_CRYPTO_HASH2=y
++CONFIG_CRYPTO_RNG2=y
++CONFIG_CRYPTO_PCOMP=y
++CONFIG_CRYPTO_MANAGER=y
++CONFIG_CRYPTO_MANAGER2=y
++# CONFIG_CRYPTO_GF128MUL is not set
++# CONFIG_CRYPTO_NULL is not set
++CONFIG_CRYPTO_WORKQUEUE=y
++# CONFIG_CRYPTO_CRYPTD is not set
++# CONFIG_CRYPTO_AUTHENC is not set
++# CONFIG_CRYPTO_TEST is not set
++
++#
++# Authenticated Encryption with Associated Data
++#
++# CONFIG_CRYPTO_CCM is not set
++# CONFIG_CRYPTO_GCM is not set
++# CONFIG_CRYPTO_SEQIV is not set
++
++#
++# Block modes
++#
++CONFIG_CRYPTO_CBC=y
++# CONFIG_CRYPTO_CTR is not set
++# CONFIG_CRYPTO_CTS is not set
++CONFIG_CRYPTO_ECB=m
++# CONFIG_CRYPTO_LRW is not set
++CONFIG_CRYPTO_PCBC=m
++# CONFIG_CRYPTO_XTS is not set
++
++#
++# Hash modes
++#
++# CONFIG_CRYPTO_HMAC is not set
++# CONFIG_CRYPTO_XCBC is not set
++# CONFIG_CRYPTO_VMAC is not set
++
++#
++# Digest
++#
++CONFIG_CRYPTO_CRC32C=y
++# CONFIG_CRYPTO_GHASH is not set
++# CONFIG_CRYPTO_MD4 is not set
++CONFIG_CRYPTO_MD5=y
++# CONFIG_CRYPTO_MICHAEL_MIC is not set
++# CONFIG_CRYPTO_RMD128 is not set
++# CONFIG_CRYPTO_RMD160 is not set
++# CONFIG_CRYPTO_RMD256 is not set
++# CONFIG_CRYPTO_RMD320 is not set
++# CONFIG_CRYPTO_SHA1 is not set
++# CONFIG_CRYPTO_SHA256 is not set
++# CONFIG_CRYPTO_SHA512 is not set
++# CONFIG_CRYPTO_TGR192 is not set
++# CONFIG_CRYPTO_WP512 is not set
++
++#
++# Ciphers
++#
++# CONFIG_CRYPTO_AES is not set
++# CONFIG_CRYPTO_ANUBIS is not set
++# CONFIG_CRYPTO_ARC4 is not set
++# CONFIG_CRYPTO_BLOWFISH is not set
++# CONFIG_CRYPTO_CAMELLIA is not set
++# CONFIG_CRYPTO_CAST5 is not set
++# CONFIG_CRYPTO_CAST6 is not set
++CONFIG_CRYPTO_DES=y
++# CONFIG_CRYPTO_FCRYPT is not set
++# CONFIG_CRYPTO_KHAZAD is not set
++# CONFIG_CRYPTO_SALSA20 is not set
++# CONFIG_CRYPTO_SEED is not set
++# CONFIG_CRYPTO_SERPENT is not set
++# CONFIG_CRYPTO_TEA is not set
++# CONFIG_CRYPTO_TWOFISH is not set
++
++#
++# Compression
++#
++# CONFIG_CRYPTO_DEFLATE is not set
++# CONFIG_CRYPTO_ZLIB is not set
++# CONFIG_CRYPTO_LZO is not set
++
++#
++# Random Number Generation
++#
++# CONFIG_CRYPTO_ANSI_CPRNG is not set
++CONFIG_CRYPTO_HW=y
++# CONFIG_BINARY_PRINTF is not set
++
++#
++# Library routines
++#
++CONFIG_BITREVERSE=y
++CONFIG_GENERIC_FIND_LAST_BIT=y
++CONFIG_CRC_CCITT=y
++# CONFIG_CRC16 is not set
++# CONFIG_CRC_T10DIF is not set
++# CONFIG_CRC_ITU_T is not set
++CONFIG_CRC32=y
++# CONFIG_CRC7 is not set
++CONFIG_LIBCRC32C=y
++CONFIG_ZLIB_INFLATE=y
++CONFIG_ZLIB_DEFLATE=y
++CONFIG_DECOMPRESS_GZIP=y
++CONFIG_HAS_IOMEM=y
++CONFIG_HAS_IOPORT=y
++CONFIG_HAS_DMA=y
++CONFIG_NLATTR=y
+diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
+index b72ae06..d965d58 100644
+--- a/arch/arm/mach-omap2/Kconfig
++++ b/arch/arm/mach-omap2/Kconfig
+@@ -96,6 +96,11 @@ config MACH_OMAP3517EVM
+ 	depends on ARCH_OMAP3 && ARCH_OMAP34XX
+ 	select OMAP_PACKAGE_CBB
+
++config MACH_CRANEBOARD
++	bool "AM3517/05 Crane board"
++	depends on ARCH_OMAP3 && ARCH_OMAP34XX
++	select OMAP_PACKAGE_CBB
++
+ config PMIC_TPS65023
+ 	bool "TPS65023 Power Module"
+ 	default y
+@@ -171,6 +176,7 @@ config MACH_OMAP_4430SDP
+ 	bool "OMAP 4430 SDP board"
+ 	depends on ARCH_OMAP4
+
++
+ config OMAP3_EMU
+ 	bool "OMAP3 debugging peripherals"
+ 	depends on ARCH_OMAP3
+diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
+index fa01859..9042317 100644
+--- a/arch/arm/mach-omap2/Makefile
++++ b/arch/arm/mach-omap2/Makefile
+@@ -130,6 +130,8 @@ obj-$(CONFIG_MACH_OMAP_4430SDP)		+= board-4430sdp.o
+ obj-$(CONFIG_MACH_OMAP3517EVM)     	+= board-am3517evm.o \
+ 					   mmc-am3517evm.o
+
++obj-$(CONFIG_MACH_CRANEBOARD) 		+= board-am3517crane.o \
++					   mmc-am3517crane.o
+ # Platform specific device init code
+ obj-y					+= usb-musb.o
+ obj-$(CONFIG_MACH_OMAP2_TUSB6010)	+= usb-tusb6010.o
+diff --git a/arch/arm/mach-omap2/board-am3517crane.c b/arch/arm/mach-omap2/board-am3517crane.c
+new file mode 100644
+index 0000000..4880ace
+--- /dev/null
++++ b/arch/arm/mach-omap2/board-am3517crane.c
+@@ -0,0 +1,773 @@
++/*
++ * linux/arch/arm/mach-omap2/board-am3517crane.c
++ *
++ * Copyright (C) 2010 Mistral Solutions Pvt LtD <www.mistralsolutions.com>
++ * Author: Srinath.R <srinath@mistralsolutions.com>
++ *
++ * Based on mach-omap2/board-am3517evm.c
++ *
++ * This program is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License as  published by the
++ * Free Software Foundation version 2.
++ *
++ * This program is distributed "as is" WITHOUT ANY WARRANTY of any kind,
++ * whether express or implied; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ */
++
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/gpio.h>
++#include <linux/irq.h>
++#include <linux/i2c/tsc2004.h>
++#include <linux/mtd/mtd.h>
++#include <linux/mtd/partitions.h>
++#include <linux/mtd/nand.h>
++#include <linux/input.h>
++#include <linux/tca6416_keypad.h>
++#include <linux/davinci_emac.h>
++#include <linux/i2c/pca953x.h>
++#include <linux/regulator/machine.h>
++#include <linux/can/platform/ti_hecc.h>
++#include <linux/i2c/tps65910.h>
++
++#include <mach/hardware.h>
++#include <mach/am35xx.h>
++#include <asm/mach-types.h>
++#include <asm/mach/arch.h>
++#include <asm/mach/map.h>
++
++#include <plat/board.h>
++#include <plat/common.h>
++#include <plat/control.h>
++#include <plat/usb.h>
++#include <plat/display.h>
++#include <plat/gpmc.h>
++#include <plat/nand.h>
++
++#include "mmc-am3517crane.h"
++#include "mux.h"
++
++#define GPMC_CS0_BASE  0x60
++#define GPMC_CS_SIZE   0x30
++
++#define NAND_BLOCK_SIZE        SZ_128K
++
++static struct mtd_partition am3517crane_nand_partitions[] = {
++	/* All the partition sizes are listed in terms of NAND block size */
++	{
++		.name           = "xloader-nand",
++		.offset         = 0,
++		.size           = 4*(SZ_128K),
++		.mask_flags     = MTD_WRITEABLE
++	},
++	{
++		.name           = "uboot-nand",
++		.offset         = MTDPART_OFS_APPEND,
++		.size           = 14*(SZ_128K),
++		.mask_flags     = MTD_WRITEABLE
++	},
++	{
++		.name           = "params-nand",
++		.offset         = MTDPART_OFS_APPEND,
++		.size           = 2*(SZ_128K)
++	},
++	{
++		.name           = "linux-nand",
++		.offset         = MTDPART_OFS_APPEND,
++		.size           = 40*(SZ_128K)
++	},
++	{
++		.name           = "jffs2-nand",
++		.size           = MTDPART_SIZ_FULL,
++		.offset         = MTDPART_OFS_APPEND,
++	},
++};
++
++static struct omap_nand_platform_data am3517crane_nand_data = {
++	.parts          = am3517crane_nand_partitions,
++	.nr_parts       = ARRAY_SIZE(am3517crane_nand_partitions),
++	.nand_setup     = NULL,
++	.dma_channel    = -1,           /* disable DMA in OMAP NAND driver */
++	.dev_ready      = NULL,
++};
++
++static struct resource am3517crane_nand_resource = {
++	.flags          = IORESOURCE_MEM,
++};
++
++static struct platform_device am3517crane_nand_device = {
++	.name           = "omap2-nand",
++	.id             = 0,
++	.dev            = {
++		.platform_data  = &am3517crane_nand_data,
++	},
++	.num_resources  = 1,
++	.resource       = &am3517crane_nand_resource,
++};
++
++void __init am3517crane_flash_init(void)
++{
++	u8 cs = 0;
++	u8 nandcs = GPMC_CS_NUM + 1;
++	u32 gpmc_base_add = OMAP34XX_GPMC_VIRT;
++
++	while (cs < GPMC_CS_NUM) {
++		u32 ret = 0;
++		ret = gpmc_cs_read_reg(cs, GPMC_CS_CONFIG1);
++
++		if ((ret & 0xC00) == 0x800) {
++			/* Found it!! */
++			if (nandcs > GPMC_CS_NUM)
++				nandcs = cs;
++		}
++		cs++;
++	}
++	if (nandcs > GPMC_CS_NUM) {
++		printk(KERN_INFO "NAND: Unable to find configuration "
++				" in GPMC\n ");
++		return;
++	}
++
++	if (nandcs < GPMC_CS_NUM) {
++		am3517crane_nand_data.cs   = nandcs;
++		am3517crane_nand_data.gpmc_cs_baseaddr =
++		(void *)(gpmc_base_add + GPMC_CS0_BASE + nandcs*GPMC_CS_SIZE);
++
++		am3517crane_nand_data.gpmc_baseaddr = (void *)(gpmc_base_add);
++
++		if (platform_device_register(&am3517crane_nand_device) < 0)
++			printk(KERN_ERR "Unable to register NAND device\n");
++
++	}
++}
++
++
++#define AM35XX_EVM_PHY_MASK		(0xF)
++#define AM35XX_EVM_MDIO_FREQUENCY    	(1000000)
++
++static struct emac_platform_data am3517_crane_emac_pdata = {
++	.phy_mask       = AM35XX_EVM_PHY_MASK,
++	.mdio_max_freq  = AM35XX_EVM_MDIO_FREQUENCY,
++	.rmii_en        = 1,
++};
++
++static int __init eth_addr_setup(char *str)
++{
++	int i;
++
++	if (str == NULL)
++		return 0;
++	for (i = 0; i < ETH_ALEN; i++)
++		am3517_crane_emac_pdata.mac_addr[i] = simple_strtol(&str[i*3],
++							(char **)NULL, 16);
++	return 1;
++}
++
++/* Get MAC address from kernel boot parameter eth=AA:BB:CC:DD:EE:FF */
++__setup("eth=", eth_addr_setup);
++
++static struct resource am3517_emac_resources[] = {
++	{
++		.start  = AM35XX_IPSS_EMAC_BASE,
++		.end    = AM35XX_IPSS_EMAC_BASE + 0x3FFFF,
++		.flags  = IORESOURCE_MEM,
++	},
++	{
++		.start  = INT_35XX_EMAC_C0_RXTHRESH_IRQ,
++		.end    = INT_35XX_EMAC_C0_RXTHRESH_IRQ,
++		.flags  = IORESOURCE_IRQ,
++	},
++	{
++		.start  = INT_35XX_EMAC_C0_RX_PULSE_IRQ,
++		.end    = INT_35XX_EMAC_C0_RX_PULSE_IRQ,
++		.flags  = IORESOURCE_IRQ,
++	},
++	{
++		.start  = INT_35XX_EMAC_C0_TX_PULSE_IRQ,
++		.end    = INT_35XX_EMAC_C0_TX_PULSE_IRQ,
++		.flags  = IORESOURCE_IRQ,
++	},
++	{
++		.start  = INT_35XX_EMAC_C0_MISC_PULSE_IRQ,
++		.end    = INT_35XX_EMAC_C0_MISC_PULSE_IRQ,
++		.flags  = IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device am3517_emac_device = {
++	.name           = "davinci_emac",
++	.id             = -1,
++	.num_resources  = ARRAY_SIZE(am3517_emac_resources),
++	.resource       = am3517_emac_resources,
++};
++
++static void am3517_enable_ethernet_int(void)
++{
++	u32 regval;
++
++	regval = omap_ctrl_readl(AM35XX_CONTROL_LVL_INTR_CLEAR);
++	regval = (regval | AM35XX_CPGMAC_C0_RX_PULSE_CLR |
++		AM35XX_CPGMAC_C0_TX_PULSE_CLR |
++		AM35XX_CPGMAC_C0_MISC_PULSE_CLR |
++		AM35XX_CPGMAC_C0_RX_THRESH_CLR);
++
++	omap_ctrl_writel(regval, AM35XX_CONTROL_LVL_INTR_CLEAR);
++	regval = omap_ctrl_readl(AM35XX_CONTROL_LVL_INTR_CLEAR);
++}
++
++static void am3517_disable_ethernet_int(void)
++{
++	u32 regval;
++
++	regval = omap_ctrl_readl(AM35XX_CONTROL_LVL_INTR_CLEAR);
++	regval = (regval | AM35XX_CPGMAC_C0_RX_PULSE_CLR |
++			AM35XX_CPGMAC_C0_TX_PULSE_CLR);
++	omap_ctrl_writel(regval, AM35XX_CONTROL_LVL_INTR_CLEAR);
++	regval = omap_ctrl_readl(AM35XX_CONTROL_LVL_INTR_CLEAR);
++}
++
++void am3517_crane_ethernet_init(struct emac_platform_data *pdata)
++{
++	unsigned int regval;
++
++	pdata->ctrl_reg_offset          = AM35XX_EMAC_CNTRL_OFFSET;
++	pdata->ctrl_mod_reg_offset      = AM35XX_EMAC_CNTRL_MOD_OFFSET;
++	pdata->ctrl_ram_offset          = AM35XX_EMAC_CNTRL_RAM_OFFSET;
++	pdata->mdio_reg_offset          = AM35XX_EMAC_MDIO_OFFSET;
++	pdata->ctrl_ram_size            = AM35XX_EMAC_CNTRL_RAM_SIZE;
++	pdata->version                  = EMAC_VERSION_2;
++	pdata->hw_ram_addr              = AM35XX_EMAC_HW_RAM_ADDR;
++	pdata->interrupt_enable 	= am3517_enable_ethernet_int;
++	pdata->interrupt_disable 	= am3517_disable_ethernet_int;
++	am3517_emac_device.dev.platform_data     = pdata;
++	platform_device_register(&am3517_emac_device);
++
++	regval = omap_ctrl_readl(AM35XX_CONTROL_IP_SW_RESET);
++	regval = regval & (~(AM35XX_CPGMACSS_SW_RST));
++	omap_ctrl_writel(regval, AM35XX_CONTROL_IP_SW_RESET);
++	regval = omap_ctrl_readl(AM35XX_CONTROL_IP_SW_RESET);
++
++	return ;
++}
++
++static void __init am3517_crane_display_init(void)
++{
++	omap_mux_init_gpio(52, OMAP_PIN_OUTPUT);
++	gpio_request(52, "dvi_enable");
++	gpio_direction_output(52, 1);
++}
++
++
++
++static struct omap_dss_device am3517_crane_tv_device = {
++	.type 			= OMAP_DISPLAY_TYPE_VENC,
++	.name 			= "tv",
++	.driver_name		= "venc",
++	.phy.venc.type          = OMAP_DSS_VENC_TYPE_COMPOSITE,
++	.platform_enable	= NULL,
++	.platform_disable	= NULL,
++};
++
++static int am3517_crane_panel_enable_dvi(struct omap_dss_device *dssdev)
++{
++	gpio_set_value(52, 1);
++	return 0;
++}
++
++static void am3517_crane_panel_disable_dvi(struct omap_dss_device *dssdev)
++{
++	gpio_set_value(52, 0);
++}
++
++static struct omap_dss_device am3517_crane_dvi_device = {
++	.type			= OMAP_DISPLAY_TYPE_DPI,
++	.name			= "dvi",
++	.driver_name		= "generic_panel",
++	.phy.dpi.data_lines	= 24,
++	.platform_enable	= am3517_crane_panel_enable_dvi,
++	.platform_disable	= am3517_crane_panel_disable_dvi,
++};
++
++static struct omap_dss_device *am3517_crane_dss_devices[] = {
++	&am3517_crane_tv_device,
++	&am3517_crane_dvi_device,
++};
++
++static struct omap_dss_board_info am3517_crane_dss_data = {
++	.num_devices	= ARRAY_SIZE(am3517_crane_dss_devices),
++	.devices	= am3517_crane_dss_devices,
++	.default_device	= &am3517_crane_dvi_device,
++};
++
++struct platform_device am3517_crane_dss_device = {
++	.name		= "omapdss",
++	.id		= -1,
++	.dev		= {
++		.platform_data	= &am3517_crane_dss_data,
++	},
++};
++
++static u64 vpfe_capture_dma_mask = DMA_BIT_MASK(32);
++static struct resource dm644x_ccdc_resource[] = {
++	/* CCDC Base address */
++	{
++		.start	= AM35XX_IPSS_VPFE_BASE,
++		.end	= AM35XX_IPSS_VPFE_BASE + 0xffff,
++		.flags	= IORESOURCE_MEM,
++	},
++};
++
++static struct platform_device dm644x_ccdc_dev = {
++	.name		= "dm644x_ccdc",
++	.id		= -1,
++	.num_resources	= ARRAY_SIZE(dm644x_ccdc_resource),
++	.resource	= dm644x_ccdc_resource,
++	.dev = {
++		.dma_mask		= &vpfe_capture_dma_mask,
++		.coherent_dma_mask	= DMA_BIT_MASK(32),
++	},
++};
++
++static struct regulator_consumer_supply am3517_crane_vdd1_supplies[] = {
++	{
++		.supply = "vdd_core",
++	},
++};
++
++static struct regulator_init_data am3517_crane_regulator_vdd1 = {
++	.constraints = {
++		.min_uV = 1200000,
++		.max_uV = 1200000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL,
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = true,
++	},
++	.num_consumer_supplies = ARRAY_SIZE(am3517_crane_vdd1_supplies),
++	.consumer_supplies = am3517_crane_vdd1_supplies,
++};
++
++static struct regulator_consumer_supply am3517_crane_vdd2_supplies[] = {
++	{
++		.supply = "vddshv",
++	},
++};
++
++static struct regulator_init_data am3517_crane_regulator_vdd2 = {
++	.constraints = {
++		.min_uV = 3300000,
++		.max_uV = 3300000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL,
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = true,
++	},
++	.num_consumer_supplies = ARRAY_SIZE(am3517_crane_vdd2_supplies),
++	.consumer_supplies = am3517_crane_vdd2_supplies,
++};
++
++
++static struct regulator_consumer_supply am3517_crane_vio_supplies[] = {
++	{
++		.supply = "vdds",
++	},
++};
++
++static struct regulator_init_data am3517_crane_regulator_vio = {
++	.constraints = {
++		.min_uV = 1800000,
++		.max_uV = 1800000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL,
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = true,
++	},
++	.num_consumer_supplies = ARRAY_SIZE(am3517_crane_vio_supplies),
++	.consumer_supplies = am3517_crane_vio_supplies,
++};
++
++
++static struct regulator_consumer_supply am3517_crane_vaux1_supplies[] = {
++	{
++		.supply = "vdd_sram_mpu",
++	},
++	{
++		.supply = "vdd_sram_core_bg0",
++	},
++	{
++		.supply = "vddsosc",
++	},
++};
++
++static struct regulator_init_data am3517_crane_regulator_vaux1 = {
++	.constraints = {
++		.min_uV = 1800000,
++		.max_uV = 1800000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL,
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = true,
++	},
++	.num_consumer_supplies = ARRAY_SIZE(am3517_crane_vaux1_supplies),
++	.consumer_supplies = am3517_crane_vaux1_supplies,
++};
++
++
++static struct regulator_consumer_supply am3517_crane_vaux2_supplies[] = {
++	{
++		.supply = "vdda1p8v_usbphy",
++	},
++};
++
++static struct regulator_init_data am3517_crane_regulator_vaux2 = {
++	.constraints = {
++		.min_uV = 1800000,
++		.max_uV = 1800000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL,
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = true,
++	},
++	.num_consumer_supplies = ARRAY_SIZE(am3517_crane_vaux2_supplies),
++	.consumer_supplies = am3517_crane_vaux2_supplies,
++};
++
++
++static struct regulator_consumer_supply am3517_crane_vdac_supplies[] = {
++	{
++		.supply = "vdda_dac",
++		.dev    = &am3517_crane_dss_device.dev,
++	},
++};
++
++static struct regulator_init_data am3517_crane_regulator_vdac = {
++	.constraints = {
++		.min_uV = 1800000,
++		.max_uV = 1800000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL,
++		.valid_ops_mask = REGULATOR_CHANGE_MODE,
++		.always_on = true,
++		.apply_uV = true,
++	},
++	.num_consumer_supplies = ARRAY_SIZE(am3517_crane_vdac_supplies),
++	.consumer_supplies = am3517_crane_vdac_supplies,
++};
++
++static struct regulator_consumer_supply am3517_crane_vmmc_supplies[] = {
++	{
++		.supply = "vdda3p3v_usbphy",
++	},
++};
++
++static struct regulator_init_data am3517_crane_regulator_vmmc = {
++	.constraints = {
++		.min_uV = 3300000,
++		.max_uV = 3300000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL,
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = true,
++	},
++	.num_consumer_supplies = ARRAY_SIZE(am3517_crane_vmmc_supplies),
++	.consumer_supplies = am3517_crane_vmmc_supplies,
++};
++
++
++static struct regulator_consumer_supply am3517_crane_vpll_supplies[] = {
++	{
++		.supply = "vdds_dpll_mpu_usbhost",
++	},
++	{
++		.supply = "vdds_dpll_per_core",
++	},
++};
++
++static struct regulator_init_data am3517_crane_regulator_vpll = {
++	.constraints = {
++		.min_uV = 1800000,
++		.max_uV = 1800000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL,
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = true,
++	},
++	.num_consumer_supplies = ARRAY_SIZE(am3517_crane_vpll_supplies),
++	.consumer_supplies = am3517_crane_vpll_supplies,
++};
++
++static int am3517_crane_tps65910_config(struct tps65910_platform_data *pdata)
++{
++	u8 val 	= 0;
++	int i 	= 0;
++	int err = -1;
++
++
++	/* Configure TPS65910 for am3517_crane board needs */
++
++	/* Set sleep state active high */
++	val |= (TPS65910_DEV2_SLEEPSIG_POL);
++
++	err = tps65910_i2c_write_u8(TPS65910_I2C_ID0, val,
++			TPS65910_REG_DEVCTRL2);
++	if (err) {
++		printk(KERN_ERR "Unable to write TPS65910_REG_DEVCTRL2 reg\n");
++		return -EIO;
++	}
++
++	/* Mask ALL interrupts */
++	err = tps65910_i2c_write_u8(TPS65910_I2C_ID0, 0xFF,
++			TPS65910_REG_INT_MSK);
++	if (err) {
++		printk(KERN_ERR "Unable to write TPS65910_REG_INT_MSK reg\n");
++		return -EIO;
++	}
++	err = tps65910_i2c_write_u8(TPS65910_I2C_ID0, 0x03,
++			TPS65910_REG_INT_MSK2);
++	if (err) {
++		printk(KERN_ERR "Unable to write TPS65910_REG_INT_MSK2 reg\n");
++		return -EIO;
++	}
++
++	/* Set RTC regulator on during sleep */
++
++	val = TPS65910_VRTC_OFFMASK;
++	err = tps65910_i2c_write_u8(TPS65910_I2C_ID0, val,
++			TPS65910_REG_VRTC);
++
++	if (err) {
++		printk(KERN_ERR "Unable to write TPS65910_REG_VRTC reg\n");
++		return -EIO;
++	}
++	/* Set RTC Power, disable Smart Reflex in DEVCTRL_REG */
++	val = 0;
++	val &= ~TPS65910_RTC_PWDNN;
++	val |= (TPS65910_CK32K_CTRL | TPS65910_SR_CTL_I2C_SEL);
++
++	err = tps65910_i2c_write_u8(TPS65910_I2C_ID0, val,
++			TPS65910_REG_DEVCTRL);
++	if (err) {
++		printk(KERN_ERR "Unable to write TPS65910_REG_DEVCTRL reg\n");
++		return -EIO;
++	}
++
++	/* Enable and set back-up battery charger control*/
++
++	tps65910_enable_bbch(TPS65910_BBSEL_2P52);
++
++	err = tps65910_i2c_read_u8(TPS65910_I2C_ID0, &val,
++			TPS65910_REG_VRTC);
++	if (err) {
++		printk(KERN_ERR "Unable to read  TPS65910_REG_VRTC reg\n");
++		return -EIO;
++	}
++	val = TPS65910_VRTC_OFFMASK;
++
++	err = tps65910_i2c_write_u8(TPS65910_I2C_ID0, val,
++			TPS65910_REG_VRTC);
++	if (err) {
++		printk(KERN_ERR "Unable to write TPS65910_REG_VRTC reg\n");
++		return -EIO;
++	}
++
++	/* Disable SmartReflex control */
++	val &= 0;
++	val &= ~TPS65910_RTC_PWDNN;
++	val |= (TPS65910_CK32K_CTRL | TPS65910_SR_CTL_I2C_SEL);
++
++	err = tps65910_i2c_write_u8(TPS65910_I2C_ID0, val,
++			TPS65910_REG_DEVCTRL);
++	if (err) {
++		printk(KERN_ERR "Unabale to write TPS65910_REG_DEVCTRL reg\n");
++		return -EIO;
++	}
++
++	/* initilize all ISR work as NULL, specific driver will
++	 * assign function(s) later.
++	 */
++	for (i = 0; i < TPS65910_MAX_IRQS; i++)
++		pdata->handlers[i] = NULL;
++
++	return 0;
++}
++
++struct tps65910_platform_data am3517_crane_tps65910_data = {
++	.irq_num 	= (unsigned)TPS65910_HOST_IRQ,
++	.gpio  		= NULL,
++	.vio   		= &am3517_crane_regulator_vio,
++	.vdd1  		= &am3517_crane_regulator_vdd1,
++	.vdd2  		= &am3517_crane_regulator_vdd2,
++	.vdd3  		= NULL,
++	.vdig1		= NULL,
++	.vdig2		= NULL,
++	.vaux33		= NULL,
++	.vmmc		= &am3517_crane_regulator_vmmc,
++	.vaux1		= &am3517_crane_regulator_vaux1,
++	.vaux2		= &am3517_crane_regulator_vaux2,
++	.vdac		= &am3517_crane_regulator_vdac,
++	.vpll		= &am3517_crane_regulator_vpll,
++	.board_tps65910_config = am3517_crane_tps65910_config,
++};
++
++static struct i2c_board_info __initdata am3517crane_i2c1_boardinfo[] = {
++	{
++		I2C_BOARD_INFO("tps65910", TPS65910_I2C_ID0),
++		.flags          = I2C_CLIENT_WAKE,
++		.irq            = TPS65910_HOST_IRQ,
++		.platform_data  = &am3517_crane_tps65910_data,
++	},
++};
++
++
++static int __init am3517_crane_i2c_init(void)
++{
++	omap_register_i2c_bus(1, 400, am3517crane_i2c1_boardinfo,
++			ARRAY_SIZE(am3517crane_i2c1_boardinfo));
++	omap_register_i2c_bus(2, 400, NULL, 0);
++	omap_register_i2c_bus(3, 400, NULL, 0);
++
++	return 0;
++}
++
++/*
++ * HECC information
++ */
++static struct resource am3517_hecc_resources[] = {
++	{
++		.start  = AM35XX_IPSS_HECC_BASE,
++		.end    = AM35XX_IPSS_HECC_BASE + 0x3FFF,
++		.flags  = IORESOURCE_MEM,
++	},
++	{
++		.start  = INT_35XX_HECC0_IRQ,
++		.end    = INT_35XX_HECC0_IRQ,
++		.flags  = IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device am3517_hecc_device = {
++	.name           = "ti_hecc",
++	.id             = 1,
++	.num_resources  = ARRAY_SIZE(am3517_hecc_resources),
++	.resource       = am3517_hecc_resources,
++};
++
++static struct ti_hecc_platform_data am3517_crane_hecc_pdata = {
++	.scc_hecc_offset        = AM35XX_HECC_SCC_HECC_OFFSET,
++	.scc_ram_offset         = AM35XX_HECC_SCC_RAM_OFFSET,
++	.hecc_ram_offset        = AM35XX_HECC_RAM_OFFSET,
++	.mbx_offset            = AM35XX_HECC_MBOX_OFFSET,
++	.int_line               = AM35XX_HECC_INT_LINE,
++	.version                = AM35XX_HECC_VERSION,
++};
++
++static void am3517_crane_hecc_init(struct ti_hecc_platform_data *pdata)
++{
++	am3517_hecc_device.dev.platform_data = pdata;
++	platform_device_register(&am3517_hecc_device);
++}
++
++
++/*
++ * Board initialization
++ */
++static struct omap_board_config_kernel am3517_crane_config[] __initdata = {
++};
++
++static struct platform_device *am3517_crane_devices[] __initdata = {
++	&dm644x_ccdc_dev,
++	&am3517_crane_dss_device,
++};
++
++static void __init am3517_crane_init_irq(void)
++{
++	omap_board_config = am3517_crane_config;
++	omap_board_config_size = ARRAY_SIZE(am3517_crane_config);
++
++	omap2_init_common_hw(NULL, NULL, NULL, NULL, NULL);
++	omap_init_irq();
++	omap_gpio_init();
++}
++
++static struct ehci_hcd_omap_platform_data ehci_pdata __initdata = {
++	.port_mode[0] = EHCI_HCD_OMAP_MODE_PHY,
++	.port_mode[1] = EHCI_HCD_OMAP_MODE_UNKNOWN,
++	.port_mode[2] = EHCI_HCD_OMAP_MODE_UNKNOWN,
++
++	.phy_reset  = true,
++	.reset_gpio_port[0]  = 38,
++	.reset_gpio_port[1]  = -EINVAL,
++	.reset_gpio_port[2]  = -EINVAL
++};
++
++#ifdef CONFIG_OMAP_MUX
++static struct omap_board_mux board_mux[] __initdata = {
++	/* USB OTG DRVVBUS offset = 0x212 */
++	OMAP3_MUX(CHASSIS_DMAREQ3, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLDOWN),
++	OMAP3_MUX(MCBSP_CLKS, OMAP_MUX_MODE4 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(GPMC_NCS4, OMAP_MUX_MODE4 | OMAP_PIN_INPUT_PULLDOWN),
++	{ .reg_offset = OMAP_MUX_TERMINATOR },
++};
++#else
++#define board_mux       NULL
++#endif
++
++static struct am3517_hsmmc_info mmc[] = {
++	{
++		.mmc            = 1,
++		.wires          = 8,
++		.gpio_cd        = 41,
++		.gpio_wp        = 40,
++	},
++	{}      /* Terminator */
++};
++
++static void __init am3517_crane_init(void)
++{
++
++	am3517_crane_i2c_init();
++	omap3_mux_init(board_mux, OMAP_PACKAGE_CBB);
++	platform_add_devices(am3517_crane_devices,
++			ARRAY_SIZE(am3517_crane_devices));
++
++	omap_serial_init();
++	am3517crane_flash_init();
++	usb_musb_init();
++
++	/* Configure GPIO for EHCI port */
++	omap_mux_init_gpio(35, OMAP_PIN_OUTPUT);
++	gpio_request(35, "usb_ehci_enable");
++	gpio_direction_output(35, 1);
++	gpio_set_value(35, 1);
++	omap_mux_init_gpio(38, OMAP_PIN_OUTPUT);
++	usb_ehci_init(&ehci_pdata);
++
++	/* DSS */
++	am3517_crane_display_init();
++
++	/*Ethernet*/
++	am3517_crane_ethernet_init(&am3517_crane_emac_pdata);
++	am3517_crane_hecc_init(&am3517_crane_hecc_pdata);
++
++	/* MMC init function */
++	am3517_mmc_init(mmc);
++
++}
++
++static void __init am3517_crane_map_io(void)
++{
++	omap2_set_globals_343x();
++	omap2_map_common_io();
++}
++
++MACHINE_START(CRANEBOARD, "AM3517/05 CRANEBOARD")
++	.phys_io	= 0x48000000,
++	.io_pg_offst	= ((0xd8000000) >> 18) & 0xfffc,
++	.boot_params	= 0x80000100,
++	.map_io		= am3517_crane_map_io,
++	.init_irq	= am3517_crane_init_irq,
++	.init_machine	= am3517_crane_init,
++	.timer		= &omap_timer,
++MACHINE_END
+diff --git a/arch/arm/mach-omap2/mmc-am3517crane.c b/arch/arm/mach-omap2/mmc-am3517crane.c
+new file mode 100644
+index 0000000..80ad8ae
+--- /dev/null
++++ b/arch/arm/mach-omap2/mmc-am3517crane.c
+@@ -0,0 +1,267 @@
++/*
++ * linux/arch/arm/mach-omap2/mmc-crane.c
++ *
++ * Copyright (C) 2010 Mistral Solutions Pvt Ltd <www.mistralsolutions.com>
++ * Author: Srinath.R <srinath@mistralsolutions.com>
++ *
++ * Based on linux/arch/arm/mach-omap2/mmc-am3517evm.c
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++#include <linux/err.h>
++#include <linux/io.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/interrupt.h>
++#include <linux/delay.h>
++#include <linux/gpio.h>
++
++#include <mach/hardware.h>
++#include <plat/control.h>
++#include <plat/mmc.h>
++#include <plat/board.h>
++#include "mmc-am3517crane.h"
++
++#define LDO_CLR			0x00
++#define VSEL_S2_CLR		0x40
++
++#define VMMC1_DEV_GRP		0x27
++#define VMMC1_CLR		0x00
++#define VMMC1_315V		0x03
++#define VMMC1_300V		0x02
++#define VMMC1_285V		0x01
++#define VMMC1_185V		0x00
++#define VMMC1_DEDICATED		0x2A
++
++#define VMMC2_DEV_GRP		0x2B
++#define VMMC2_CLR		0x40
++#define VMMC2_315V		0x0c
++#define VMMC2_300V		0x0b
++#define VMMC2_285V		0x0a
++#define VMMC2_260V		0x08
++#define VMMC2_185V		0x06
++#define VMMC2_DEDICATED		0x2E
++
++#define VMMC_DEV_GRP_P1		0x20
++
++#define HSMMC_NAME_LEN	9
++
++#if defined(CONFIG_REGULATOR) || \
++	(defined(CONFIG_MMC_OMAP) || defined(CONFIG_MMC_OMAP_MODULE) || \
++	 defined(CONFIG_MMC_OMAP_HS) || defined(CONFIG_MMC_OMAP_HS_MODULE))
++
++/*
++ * MMC definitions
++ *
++ */
++static struct mmc_controller {
++	struct omap_mmc_platform_data	*mmc;
++	u8		vmmc_dev_grp;
++	u8		vmmc_dedicated;
++	char		name[HSMMC_NAME_LEN];
++} hsmmc[] = {
++	{
++		.vmmc_dev_grp		= VMMC1_DEV_GRP,
++		.vmmc_dedicated		= VMMC1_DEDICATED,
++	},
++	{
++		.vmmc_dev_grp		= VMMC2_DEV_GRP,
++		.vmmc_dedicated		= VMMC2_DEDICATED,
++	},
++};
++
++static int mmc_card_detect(int irq)
++{
++	unsigned i;
++
++	for (i = 0; i < ARRAY_SIZE(hsmmc); i++) {
++		struct omap_mmc_platform_data *mmc;
++
++		mmc = hsmmc[i].mmc;
++		if (!mmc)
++			continue;
++		if (irq != mmc->slots[0].card_detect_irq)
++			continue;
++
++		/* NOTE: assumes card detect signal is active-low */
++		return !gpio_get_value_cansleep(mmc->slots[0].switch_pin);
++	}
++	return -ENOSYS;
++}
++
++static int mmc_get_ro(struct device *dev, int slot)
++{
++	struct omap_mmc_platform_data *mmc = dev->platform_data;
++
++	/* NOTE: assumes write protect signal is active-high */
++	return gpio_get_value_cansleep(mmc->slots[0].gpio_wp);
++}
++
++/*
++ * MMC Slot Initialization.
++ */
++static int mmc_late_init(struct device *dev)
++{
++	struct omap_mmc_platform_data *mmc = dev->platform_data;
++	int ret = 0;
++	int i;
++
++	ret = gpio_request(mmc->slots[0].switch_pin, "mmc_cd");
++	if (ret)
++		goto done;
++	ret = gpio_direction_input(mmc->slots[0].switch_pin);
++	if (ret)
++		goto err;
++
++	for (i = 0; i < ARRAY_SIZE(hsmmc); i++) {
++		if (hsmmc[i].name == mmc->slots[0].name) {
++			hsmmc[i].mmc = mmc;
++			break;
++		}
++	}
++
++	return 0;
++
++err:
++	gpio_free(mmc->slots[0].switch_pin);
++done:
++	mmc->slots[0].card_detect_irq = 0;
++	mmc->slots[0].card_detect = NULL;
++
++	dev_err(dev, "err %d configuring card detect\n", ret);
++	return ret;
++}
++
++static void mmc_cleanup(struct device *dev)
++{
++	struct omap_mmc_platform_data *mmc = dev->platform_data;
++
++	gpio_free(mmc->slots[0].switch_pin);
++}
++
++#ifdef CONFIG_PM
++
++static int mmc_suspend(struct device *dev, int slot)
++{
++	struct omap_mmc_platform_data *mmc = dev->platform_data;
++
++	disable_irq(mmc->slots[0].card_detect_irq);
++	return 0;
++}
++
++static int mmc_resume(struct device *dev, int slot)
++{
++	struct omap_mmc_platform_data *mmc = dev->platform_data;
++
++	enable_irq(mmc->slots[0].card_detect_irq);
++	return 0;
++}
++
++#else
++#define mmc_suspend	NULL
++#define mmc_resume	NULL
++#endif
++
++/*
++ * the MMC power setting function
++ */
++
++static int mmc1_set_power(struct device *dev, int slot, int power_on,
++				int vdd)
++{
++	return 0;
++}
++
++static int mmc2_set_power(struct device *dev, int slot, int power_on, int vdd)
++{
++	return 0;
++}
++
++static struct omap_mmc_platform_data *hsmmc_data[OMAP34XX_NR_MMC] __initdata;
++
++void __init am3517_mmc_init(struct am3517_hsmmc_info *controllers)
++{
++	struct am3517_hsmmc_info *c;
++	int nr_hsmmc = ARRAY_SIZE(hsmmc_data);
++
++	for (c = controllers; c->mmc; c++) {
++		struct mmc_controller *mmc_control = hsmmc + c->mmc - 1;
++		struct omap_mmc_platform_data *mmc = hsmmc_data[c->mmc - 1];
++
++		if (!c->mmc || c->mmc > nr_hsmmc) {
++			pr_debug("MMC%d: no such controller\n", c->mmc);
++			continue;
++		}
++		if (mmc) {
++			pr_debug("MMC%d: already configured\n", c->mmc);
++			continue;
++		}
++
++		mmc = kzalloc(sizeof(struct omap_mmc_platform_data),
++					GFP_KERNEL);
++		if (!mmc) {
++			pr_err("Cannot allocate memory for mmc device!\n");
++			return;
++		}
++
++		sprintf(mmc_control->name, "mmc%islot%i", c->mmc, 1);
++		mmc->slots[0].name = mmc_control->name;
++		mmc->nr_slots = 1;
++		mmc->slots[0].ocr_mask = MMC_VDD_165_195 |
++					MMC_VDD_26_27 | MMC_VDD_27_28 |
++					MMC_VDD_29_30 |
++					MMC_VDD_30_31 | MMC_VDD_31_32;
++		mmc->slots[0].wires = c->wires;
++		mmc->slots[0].internal_clock = !c->ext_clock;
++		mmc->dma_mask = 0xffffffff;
++
++		if (1) {
++			mmc->init = mmc_late_init;
++			mmc->cleanup = mmc_cleanup;
++			mmc->suspend = mmc_suspend;
++			mmc->resume = mmc_resume;
++
++			mmc->slots[0].switch_pin = c->gpio_cd;
++			mmc->slots[0].card_detect_irq = gpio_to_irq(c->gpio_cd);
++			mmc->slots[0].card_detect = mmc_card_detect;
++		} else
++			mmc->slots[0].switch_pin = -EINVAL;
++
++		/* write protect normally uses an OMAP gpio */
++		if (gpio_is_valid(c->gpio_wp)) {
++			gpio_request(c->gpio_wp, "mmc_wp");
++			gpio_direction_input(c->gpio_wp);
++
++			mmc->slots[0].gpio_wp = c->gpio_wp;
++			mmc->slots[0].get_ro = mmc_get_ro;
++		} else
++			mmc->slots[0].gpio_wp = -EINVAL;
++
++		/* NOTE:  we assume OMAP's MMC1 and MMC2 use
++		 * the TWL4030's VMMC1 and VMMC2, respectively;
++		 * and that OMAP's MMC3 isn't used.
++		 */
++
++		switch (c->mmc) {
++		case 1:
++			mmc->slots[0].set_power = mmc1_set_power;
++			break;
++		case 2:
++			mmc->slots[0].set_power = mmc2_set_power;
++			break;
++		default:
++			pr_err("MMC%d configuration not supported!\n", c->mmc);
++			continue;
++		}
++		hsmmc_data[c->mmc - 1] = mmc;
++	}
++
++	omap2_init_mmc(hsmmc_data, OMAP34XX_NR_MMC);
++}
++#else
++inline void am3517_mmc_init(struct craneboard_hsmmc_info *info)
++{
++}
++#endif
+diff --git a/arch/arm/mach-omap2/mmc-am3517crane.h b/arch/arm/mach-omap2/mmc-am3517crane.h
+new file mode 100644
+index 0000000..97fd872
+--- /dev/null
++++ b/arch/arm/mach-omap2/mmc-am3517crane.h
+@@ -0,0 +1,22 @@
++/*
++ * MMC definitions for craneboard AM3517/05
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++struct am3517_hsmmc_info {
++	u8	mmc;		/* controller 1/2/3 */
++	u8	wires;		/* 1/4/8 wires */
++	bool	transceiver;	/* MMC-2 option */
++	bool	ext_clock;	/* use external pin for input clock */
++	bool	cover_only;	/* No card detect - just cover switch */
++	int	gpio_cd;	/* or -EINVAL */
++	int	gpio_wp;	/* or -EINVAL */
++	char	*name;		/* or NULL for default */
++	struct device *dev;	/* returned: pointer to mmc adapter */
++	int	ocr_mask;	/* temporary HACK */
++};
++
++void am3517_mmc_init(struct am3517_hsmmc_info *);
+diff --git a/arch/arm/mach-omap2/tps65910-pmic.c b/arch/arm/mach-omap2/tps65910-pmic.c
+new file mode 100644
+index 0000000..b17d662
+--- /dev/null
++++ b/arch/arm/mach-omap2/tps65910-pmic.c
+@@ -0,0 +1,195 @@
++/*
++ * tps65910-pmic.c
++ *
++ * Common regulator supplies and init data structs for TPS65910
++ * PMIC for AM35xx based EVMs. They can be used in various board-evm
++ * files for Am35xx based platforms using TPS65910.
++ *
++ * Copyright (C) 2010 Mistral Solutions Pvt Ltd <www.mistralsolutions.com>
++ *
++ * Based on arch/arm/mach-omap2/twl4030-pmic.c
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation version 2.
++ *
++ * This program is distributed "as is" WITHOUT ANY WARRANTY of any kind,
++ * whether express or implied; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ */
++
++/* Power domain maping for TPS65910 and AM35XX
++
++	   1.8V
++	   VIO -----------> VDDS
++
++	   1.8V
++	   VAUX1 ---------> VDDS_SRAM_CORE_BG
++				|
++				-------> VDDS_SRAM_MPU
++				|
++				-------> VDDOSC
++
++	   3.3V
++	   VDD2 ----------> VDDSHV
++
++	   1.2V
++	   VDD1 ----------> VDD_CORE
++
++	   1.8V
++	   VPLL ----------> VDDS_DPLL_PRE_CORE
++				|
++				-------> VDDSPLL_MPU_USBHOST
++
++	   1.8V
++	   VDAC ----------> VDDA_DAC
++
++	   1.8V
++	   VAUX2 ----------> VDDA1P8V_USBPHY
++
++	   3.3V
++	   VMMC ----------> VDDA3P3V_USBPHY
++
++*/
++#include <linux/regulator/machine.h>
++
++/* VIO */
++struct regulator_consumer_supply tps65910_vio_supply = {
++	.supply = "vdds",
++};
++
++
++/* VAUX1 */
++struct regulator_consumer_supply tps65910_vaux1_supply[] = {
++	{
++		.supply = "vdds_sram_core_bg",
++	},
++	{
++		.supply = "vdds_sram_mpu",
++	},
++	{
++		.supply = "vddosc",
++	},
++};
++
++/* VPLL */
++struct regulator_consumer_supply tps65910_vpll_supply[] = {
++	{
++		.supply = "vdds_dpll_pre_core",
++	},
++	{
++		.supply = "vddspll_mpu_usbhost",
++	},
++
++};
++
++/* VDAC */
++struct regulator_consumer_supply tps65910_vdac_supply = {
++	.supply = "vdda_dac",
++};
++
++/* VAUX2 */
++struct regulator_consumer_supply tps65910_vaux2_supply = {
++	.supply = "vdda1p8v_usbphy",
++};
++
++
++/* VMMC */
++struct regulator_consumer_supply tps65910_vmmc_supply = {
++	.supply = "vdda3p3v_usbphy",
++};
++
++
++/* Regulator initialization data */
++
++/* VIO  LDO */
++struct regulator_init_data vio_data = {
++	.constraints = {
++		.min_uV = 1800000,
++		.max_uV = 1800000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = true,
++	},
++	.num_consumer_supplies  = ARRAY_SIZE(tps65910_vaux1_supply),
++	.consumer_supplies      = &tps65910_vaux1_supply,
++};
++
++
++
++/* VAUX1  LDO */
++struct regulator_init_data vaux1_data = {
++	.constraints = {
++		.min_uV = 1800000,
++		.max_uV = 2850000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = false,
++	},
++	.num_consumer_supplies  = ARRAY_SIZE(tps65910_vaux1_supply),
++	.consumer_supplies      = &tps65910_vaux1_supply,
++};
++
++/* VAUX2  LDO */
++struct regulator_init_data vaux2_data = {
++	.constraints = {
++		.min_uV = 3300000,
++		.max_uV = 3300000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = true,
++	},
++	.num_consumer_supplies  = ARRAY_SIZE(tps65910_vaux2_supply),
++	.consumer_supplies      = &tps65910_vaux2_supply,
++
++};
++
++/* VMMC  LDO */
++struct regulator_init_data vmmc_data = {
++	.constraints = {
++		.min_uV = 1800000,
++		.max_uV = 3300000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = false,
++	},
++	.num_consumer_supplies  = ARRAY_SIZE(tps65910_vmmc_supply),
++	.consumer_supplies      = &tps65910_vmmc_supply,
++
++};
++
++/* VPLL  LDO */
++struct regulator_init_data vpll_data = {
++	.constraints = {
++		.min_uV = 100000,
++		.max_uV = 2500000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = false,
++	},
++	.num_consumer_supplies  = ARRAY_SIZE(tps65910_vpll_supply),
++	.consumer_supplies      = &tps65910_vpll_supply,
++};
++
++/* VDAC  LDO */
++struct regulator_init_data vdac_data = {
++	.constraints = {
++		.min_uV = 1800000,
++		.max_uV = 2850000,
++		.valid_modes_mask = REGULATOR_MODE_NORMAL
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++		.always_on = true,
++		.apply_uV = false,
++	},
++	.num_consumer_supplies  = ARRAY_SIZE(tps65910_vdac_supply),
++	.consumer_supplies      = &tps65910_vdac_supply,
++
++};
++
++
+diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
+index 07b976d..2c9a874 100644
+--- a/arch/arm/tools/mach-types
++++ b/arch/arm/tools/mach-types
+@@ -2536,3 +2536,4 @@ c3ax03			MACH_C3AX03		C3AX03			2549
+ mxt_td60		MACH_MXT_TD60		MXT_TD60		2550
+ esyx			MACH_ESYX		ESYX			2551
+ bulldog			MACH_BULLDOG		BULLDOG			2553
++craneboard		MACH_CRANEBOARD		CRANEBOARD		2932
+diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
+index 57ca339..fc0a3c6 100644
+--- a/drivers/gpio/Kconfig
++++ b/drivers/gpio/Kconfig
+@@ -155,6 +155,13 @@ config GPIO_TWL4030
+ 	  Say yes here to access the GPIO signals of various multi-function
+ 	  power management chips from Texas Instruments.
+
++config GPIO_TPS65910
++	bool "TPS65910 GPIOs"
++	depends on TPS65910_CORE
++	help
++	  Say yes here to access the GPIO signal of TPS65910x multi-function
++	  power management chips from Texas Instruments.
++
+ config GPIO_WM831X
+ 	tristate "WM831x GPIOs"
+ 	depends on MFD_WM831X
+diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
+index 270b6d7..40c4807 100644
+--- a/drivers/gpio/Makefile
++++ b/drivers/gpio/Makefile
+@@ -14,9 +14,11 @@ obj-$(CONFIG_GPIO_PCA953X)	+= pca953x.o
+ obj-$(CONFIG_GPIO_PCF857X)	+= pcf857x.o
+ obj-$(CONFIG_GPIO_PL061)	+= pl061.o
+ obj-$(CONFIG_GPIO_TWL4030)	+= twl4030-gpio.o
++obj-$(CONFIG_GPIO_TPS65910)	+= tps65910-gpio.o
+ obj-$(CONFIG_GPIO_UCB1400)	+= ucb1400_gpio.o
+ obj-$(CONFIG_GPIO_XILINX)	+= xilinx_gpio.o
+ obj-$(CONFIG_GPIO_CS5535)	+= cs5535-gpio.o
+ obj-$(CONFIG_GPIO_BT8XX)	+= bt8xxgpio.o
+ obj-$(CONFIG_GPIO_VR41XX)	+= vr41xx_giu.o
+ obj-$(CONFIG_GPIO_WM831X)	+= wm831x-gpio.o
++
+diff --git a/drivers/gpio/tps65910-gpio.c b/drivers/gpio/tps65910-gpio.c
+new file mode 100644
+index 0000000..36e1889
+--- /dev/null
++++ b/drivers/gpio/tps65910-gpio.c
+@@ -0,0 +1,364 @@
++/*
++ * tps65910_gpio.c -- access to GPIOs on TPS65910x chips
++ *
++ * Copyright (C) 2010 Mistral solutions Pvt Ltd <www.mistralsolutions.com>
++ *
++ * Based on twl4030-gpio.c
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
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/interrupt.h>
++#include <linux/kthread.h>
++#include <linux/irq.h>
++#include <linux/gpio.h>
++#include <linux/platform_device.h>
++#include <linux/slab.h>
++
++#include <linux/i2c/tps65910.h>
++
++static int gpio_tps65910_remove(struct platform_device *pdev);
++
++/*
++ * The GPIO "subchip" supports 1 GPIOs which can be configured as
++ * inputs or outputs, with pullups or pulldowns on each pin.  Each
++ * GPIO can trigger interrupts on either or both edges.
++ */
++
++
++/* Data structures */
++static struct gpio_chip tps65910_gpiochip;
++static DEFINE_MUTEX(gpio_lock);
++static unsigned int gpio_usage_count;
++static struct work_struct  gpio_work;
++static struct mutex work_lock;
++/*
++ * To configure TPS65910 GPIO registers
++ */
++static inline int gpio_tps65910_write(u8 address, u8 data)
++{
++	return tps65910_i2c_write_u8(TPS65910_I2C_ID0, data, address);
++}
++
++
++/*
++ * To read a TPS65910 GPIO module register
++ */
++static inline int gpio_tps65910_read(u8 address)
++{
++	u8 data;
++	int ret = 0;
++
++	ret = tps65910_i2c_read_u8(TPS65910_I2C_ID0, &data, address);
++	return (ret < 0) ? ret : data;
++}
++
++static int tps65910_request(struct gpio_chip *chip, unsigned offset)
++{
++	int status = 0;
++
++	mutex_lock(&gpio_lock);
++
++	/* initialize TPS65910 GPIO */
++	/* By default the GPIO_CKSYNC signal is GPIO */
++	if (!gpio_usage_count)
++		gpio_usage_count++;
++
++	mutex_unlock(&gpio_lock);
++	return status;
++}
++
++static void tps65910_free(struct gpio_chip *chip, unsigned offset)
++{
++	mutex_lock(&gpio_lock);
++
++	/* on last use, switch off GPIO module */
++	if (!gpio_usage_count)
++		gpio_usage_count--;
++
++	mutex_unlock(&gpio_lock);
++}
++
++static int tps65910_direction_in(struct gpio_chip *chip, unsigned offset)
++{
++	/* Configure TPS65910 GPIO as input */
++	u8 val;
++
++	mutex_lock(&gpio_lock);
++
++	val = gpio_tps65910_read(TPS65910_REG_GPIO0);
++
++	val &= ~(TPS65910_GPIO_CFG_OUTPUT);
++
++	val = gpio_tps65910_read(TPS65910_REG_GPIO0);
++
++	mutex_unlock(&gpio_lock);
++
++	return 0;
++}
++
++static int tps65910_get(struct gpio_chip *chip, unsigned offset)
++{
++	int status = 0;
++
++	mutex_lock(&gpio_lock);
++
++	status = gpio_tps65910_read(TPS65910_REG_GPIO0);
++
++	mutex_unlock(&gpio_lock);
++	if (status & 0x01)
++		return 1;
++	else
++		return 0;
++}
++static
++int tps65910_direction_out(struct gpio_chip *chip, unsigned offset, int value)
++{
++	/* Configure TPS65910 GPIO as input */
++	u8 val;
++	u32 ret;
++	mutex_lock(&gpio_lock);
++	val = gpio_tps65910_read(TPS65910_REG_GPIO0);
++
++	val |= TPS65910_GPIO_CFG_OUTPUT;
++
++	ret = gpio_tps65910_write(TPS65910_REG_GPIO0, val);
++	mutex_unlock(&gpio_lock);
++
++	if (ret != 0)
++		return -EIO;
++	return 0;
++}
++
++static void tps65910_set(struct gpio_chip *chip, unsigned offset, int value)
++{
++	int val = 0;
++	u32 ret;
++
++	mutex_lock(&gpio_lock);
++	val = gpio_tps65910_read(TPS65910_REG_GPIO0);
++
++	if (value == 1)
++		val |= 0x01;
++	else
++		val &= 0xFE;
++
++	ret = gpio_tps65910_write(TPS65910_REG_GPIO0, val);
++
++	mutex_unlock(&gpio_lock);
++}
++
++
++
++static void tps65910_gpio_set_debounce(u8 debounce)
++{
++	u8 val;
++
++	mutex_lock(&gpio_lock);
++
++	val = gpio_tps65910_read(TPS65910_REG_GPIO0);
++
++	if (debounce == TPS65910_DEBOUNCE_91_5_MS)
++		val = (0<<4);
++	else if (debounce == TPS65910_DEBOUNCE_150_MS)
++		val = (1<<4);
++	else
++		printk(KERN_ERR "Invalid argument to %s\n", __func__);
++
++	gpio_tps65910_write(TPS65910_REG_GPIO0, val);
++
++	mutex_unlock(&gpio_lock);
++}
++EXPORT_SYMBOL(tps65910_gpio_set_debounce);
++
++
++static void tps65910_gpio_pullup_enable(void)
++{
++	u8 val;
++	u32 ret;
++
++	mutex_lock(&gpio_lock);
++
++	val = gpio_tps65910_read(TPS65910_REG_GPIO0);
++
++	val = (1<<3);
++
++	ret = gpio_tps65910_write(TPS65910_REG_GPIO0, val);
++
++	mutex_unlock(&gpio_lock);
++
++	if (ret != 0)
++		printk(KERN_ERR "Error writing to TPS65910_REG_GPIO0 in %s \n",
++				__func__);
++}
++EXPORT_SYMBOL(tps65910_gpio_pullup_enable);
++
++static void tps65910_gpio_pullup_disable(void)
++{
++	u8 val;
++	u32 ret;
++
++	mutex_lock(&gpio_lock);
++
++	val = gpio_tps65910_read(TPS65910_REG_GPIO0);
++
++	val = (0<<3);
++
++	ret = gpio_tps65910_write(TPS65910_REG_GPIO0, val);
++
++	mutex_unlock(&gpio_lock);
++}
++EXPORT_SYMBOL(tps65910_gpio_pullup_disable);
++
++static void tps65910_gpio_work(struct work_struct *work)
++{
++
++	/* Read the status register and take action  */
++	u8 status2;
++	int err;
++	mutex_lock(&work_lock);
++	err =  tps65910_i2c_read_u8(TPS65910_I2C_ID0, &status2,
++			TPS65910_REG_INT_STS);
++	if (!err) {
++		switch (status2) {
++		case TPS65910_GPIO_F_IT:
++			printk(KERN_NOTICE "Received TPS65910 GPIO falling \
++				edge interrupt \n");
++			/* Clear interrupt */
++			tps65910_i2c_write_u8(TPS65910_I2C_ID0, status2,
++					TPS65910_REG_INT_STS);
++			/* Add code accroding to board requirment */
++			break;
++		case TPS65910_GPIO_R_IT:
++			printk(KERN_NOTICE "Received TPS65910 GPIO Raising \
++				 edge interrupt \n");
++			/* Clear interrupt */
++			tps65910_i2c_write_u8(TPS65910_I2C_ID0, status2,
++					TPS65910_REG_INT_STS);
++			/* Add code accroding to board requirment */
++			break;
++		}
++	} else {
++		printk(KERN_ERR"Could not read TPS65910_REG_INT_STS\n");
++	}
++
++	mutex_unlock(&work_lock);
++
++}
++
++
++
++static irqreturn_t tps65910_gpio_isr(int irq, void *_tps65910)
++{
++	/* Disable IRQ, schedule work, enable IRQ and  acknowledge */
++	disable_irq(irq);
++	(void) schedule_work(&gpio_work);
++	enable_irq(irq);
++	return IRQ_HANDLED;
++}
++
++
++static struct gpio_chip tps65910_gpiochip = {
++	.label			= "tps65910",
++	.owner			= THIS_MODULE,
++	.request		= tps65910_request,
++	.free			= tps65910_free,
++	.direction_input	= tps65910_direction_in,
++	.get			= tps65910_get,
++	.direction_output	= tps65910_direction_out,
++	.set			= tps65910_set,
++};
++
++
++static int __devinit gpio_tps65910_probe(struct platform_device *pdev)
++{
++	int ret = -1;
++	int status = 0;
++
++	struct tps65910_gpio *pdata = pdev->dev.platform_data;
++
++	if (pdata->gpio_mode == TPS65910_GPIO_AS_IRQ) {
++
++		if (pdata->irq_num) {
++			status = request_irq(pdata->irq_num, tps65910_gpio_isr,
++					IRQF_SHARED, "tps65910_gpio", pdev);
++			if (status < 0) {
++				pr_err("tps65910: could not claim irq%d: %d\n",
++					pdata->irq_num, status);
++			}
++
++		}
++
++		INIT_WORK(&gpio_work, tps65910_gpio_work);
++		mutex_init(&work_lock);
++
++		tps65910_gpiochip.ngpio = TPS65910_GPIO_MAX;
++		tps65910_gpiochip.dev = &pdev->dev;
++
++		ret = gpiochip_add(&tps65910_gpiochip);
++
++		if (ret < 0) {
++			dev_err(&pdev->dev, "could not register gpiochip \
++				 %d\n", ret);
++			tps65910_gpiochip.ngpio = 0;
++			gpio_tps65910_remove(pdev);
++			return -ENODEV;
++		}
++		if (pdata->gpio_setup)
++			pdata->gpio_setup(pdata);
++	}
++	return ret;
++}
++
++static int gpio_tps65910_remove(struct platform_device *pdev)
++{
++	struct tps65910_gpio *pdata = pdev->dev.platform_data;
++	int status;
++
++	if (pdata->gpio_taredown)
++		pdata->gpio_taredown(pdata);
++	if (pdata->gpio_mode == TPS65910_GPIO_AS_IRQ)
++		free_irq(pdata->irq_num, NULL);
++
++	status = gpiochip_remove(&tps65910_gpiochip);
++	if (status < 0)
++		return status;
++	return 0;
++}
++
++static struct platform_driver gpio_tps65910_driver = {
++	.driver.name	= "tps65910_gpio",
++	.driver.owner	= THIS_MODULE,
++	.probe		= gpio_tps65910_probe,
++	.remove		= gpio_tps65910_remove,
++};
++
++static int __init gpio_tps65910_init(void)
++{
++	return platform_driver_register(&gpio_tps65910_driver);
++}
++subsys_initcall(gpio_tps65910_init);
++
++static void __exit gpio_tps65910_exit(void)
++{
++	platform_driver_unregister(&gpio_tps65910_driver);
++}
++module_exit(gpio_tps65910_exit);
++
++MODULE_AUTHOR("Mistral Solutions Pvt Ltd.");
++MODULE_DESCRIPTION("GPIO interface for TPS65910");
++MODULE_LICENSE("GPL");
+diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
+index bbea8a0..48273d7 100644
+--- a/drivers/i2c/busses/i2c-omap.c
++++ b/drivers/i2c/busses/i2c-omap.c
+@@ -801,7 +801,7 @@ complete:
+ 							"data to send\n");
+ 					break;
+ 				}
+-
++#ifndef CONFIG_CRANEBOARD
+ 				/*
+ 				 * OMAP3430 Errata 1.153: When an XRDY/XDR
+ 				 * is hit, wait for XUDF before writing data
+@@ -821,6 +821,7 @@ complete:
+ 							stat = omap_i2c_read_reg(dev, OMAP_I2C_STAT_REG);
+ 						}
+ 				}
++#endif
+
+ 				omap_i2c_write_reg(dev, OMAP_I2C_DATA_REG, w);
+ 			}
+diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
+index 16ec523..af21c1a 100644
+--- a/drivers/input/misc/Kconfig
++++ b/drivers/input/misc/Kconfig
+@@ -204,6 +204,16 @@ config INPUT_TWL4030_PWRBUTTON
+ 	  To compile this driver as a module, choose M here. The module will
+ 	  be called twl4030_pwrbutton.
+
++config INPUT_TPS65910_PWRBUTTON
++	tristate "TPS65910 Power button Driver"
++	depends on TPS65910_CORE
++	help
++	  Say Y here if you want to enable power key reporting via the
++	  TPS65910 family of chips.
++
++	  To compile this driver as a module, choose M here. The module will
++	  be called tps65910_pwrbutton.
++
+ config INPUT_UINPUT
+ 	tristate "User level driver support"
+ 	help
+diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
+index a8b8485..3af2939 100644
+--- a/drivers/input/misc/Makefile
++++ b/drivers/input/misc/Makefile
+@@ -25,6 +25,7 @@ obj-$(CONFIG_INPUT_GPIO_ROTARY_ENCODER)	+= rotary_encoder.o
+ obj-$(CONFIG_INPUT_SGI_BTNS)		+= sgi_btns.o
+ obj-$(CONFIG_INPUT_SPARCSPKR)		+= sparcspkr.o
+ obj-$(CONFIG_INPUT_TWL4030_PWRBUTTON)	+= twl4030-pwrbutton.o
++obj-$(CONFIG_INPUT_TPS65910_PWRBUTTON)	+= tps65910-pwrbutton.o
+ obj-$(CONFIG_INPUT_UINPUT)		+= uinput.o
+ obj-$(CONFIG_INPUT_WINBOND_CIR)		+= winbond-cir.o
+ obj-$(CONFIG_INPUT_WISTRON_BTNS)	+= wistron_btns.o
+diff --git a/drivers/input/misc/tps65910-pwrbutton.c b/drivers/input/misc/tps65910-pwrbutton.c
+new file mode 100644
+index 0000000..587de97
+--- /dev/null
++++ b/drivers/input/misc/tps65910-pwrbutton.c
+@@ -0,0 +1,148 @@
++/**
++ * tps65910-pwrbutton.c - TPS65910 Power Button Input Driver
++ *
++ * Copyright (C) 2010 Mistral Solutions Pvt Ltd <www.mistralsolutions.com>
++ *
++ * Based on twl4030-pwrbutton.c
++ *
++ * Written by Srinath.R <srinath@mistralsolutions.com>
++ *
++ * This file is subject to the terms and conditions of the GNU General
++ * Public License. See the file "COPYING" in the main directory of this
++ * archive for more details.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/kernel.h>
++#include <linux/errno.h>
++#include <linux/input.h>
++#include <linux/interrupt.h>
++#include <linux/platform_device.h>
++#include <linux/i2c/tps65910.h>
++
++#define TPS65910_PWR_PWRON_IRQ (1 << 2)
++
++
++static irqreturn_t powerbutton_irq(int irq, void *_pwr)
++{
++	struct input_dev *pwr = _pwr;
++	int err;
++	u8 value;
++
++#ifdef CONFIG_LOCKDEP
++	/* WORKAROUND for lockdep forcing IRQF_DISABLED on us, which
++	 * we don't want and can't tolerate since this is a threaded
++	 * IRQ and can sleep due to the i2c reads it has to issue.
++	 * Although it might be friendlier not to borrow this thread
++	 * context...
++	 */
++	local_irq_enable();
++#endif
++	err = tps65910_i2c_read_u8(TPS65910_I2C_ID0, &value,
++				TPS65910_REG_INT_STS);
++	if (!err  && (value & TPS65910_PWR_PWRON_IRQ))  {
++
++		if (value & TPS65910_PWR_PWRON_IRQ) {
++
++			input_report_key(pwr, KEY_POWER,
++					TPS65910_PWR_PWRON_IRQ);
++			input_sync(pwr);
++			return IRQ_HANDLED;
++		}
++	} else {
++		dev_err(pwr->dev.parent, "tps65910: i2c error %d while reading"
++			" TPS65910_REG_INT_STS register\n", err);
++	}
++	return IRQ_HANDLED;
++}
++
++static int __devinit tps65910_pwrbutton_probe(struct platform_device *pdev)
++{
++	struct input_dev *pwr;
++	int irq = platform_get_irq(pdev, 0);
++	int err;
++
++	pwr = input_allocate_device();
++	if (!pwr) {
++		dev_dbg(&pdev->dev, "Can't allocate power button\n");
++		return -ENOMEM;
++	}
++
++	pwr->evbit[0] = BIT_MASK(EV_KEY);
++	pwr->keybit[BIT_WORD(KEY_POWER)] = BIT_MASK(KEY_POWER);
++	pwr->name = "tps65910_pwrbutton";
++	pwr->phys = "tps65910_pwrbutton/input0";
++	pwr->dev.parent = &pdev->dev;
++
++	err = request_irq(irq, powerbutton_irq,
++			(IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING |
++			IRQF_SHARED), "tps65910_pwrbutton", pwr);
++	if (err < 0) {
++		dev_dbg(&pdev->dev, "Can't get IRQ for pwrbutton: %d\n", err);
++		goto free_input_dev;
++	}
++
++	err = input_register_device(pwr);
++	if (err) {
++		dev_dbg(&pdev->dev, "Can't register power button: %d\n", err);
++		goto free_irq;
++	}
++
++	platform_set_drvdata(pdev, pwr);
++
++	return 0;
++
++free_irq:
++	free_irq(irq, NULL);
++free_input_dev:
++	input_free_device(pwr);
++	return err;
++}
++
++static int __devexit tps65910_pwrbutton_remove(struct platform_device *pdev)
++{
++	struct input_dev *pwr = platform_get_drvdata(pdev);
++	int irq = platform_get_irq(pdev, 0);
++
++	free_irq(irq, pwr);
++	input_unregister_device(pwr);
++
++	return 0;
++}
++
++struct platform_driver tps65910_pwrbutton_driver = {
++	.probe		= tps65910_pwrbutton_probe,
++	.remove		= __devexit_p(tps65910_pwrbutton_remove),
++	.driver		= {
++		.name	= "tps65910_pwrbutton",
++		.owner	= THIS_MODULE,
++	},
++};
++
++static int __init tps65910_pwrbutton_init(void)
++{
++	return platform_driver_register(&tps65910_pwrbutton_driver);
++}
++module_init(tps65910_pwrbutton_init);
++
++static void __exit tps65910_pwrbutton_exit(void)
++{
++	platform_driver_unregister(&tps65910_pwrbutton_driver);
++}
++module_exit(tps65910_pwrbutton_exit);
++
++MODULE_ALIAS("platform:tps65910_pwrbutton");
++MODULE_DESCRIPTION("TPS65910 Power Button");
++MODULE_LICENSE("GPL");
++MODULE_AUTHOR("Srinath R <srinath@mistralsolutions.com>");
++
+diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
+index 8782978..306b346 100644
+--- a/drivers/mfd/Kconfig
++++ b/drivers/mfd/Kconfig
+@@ -129,12 +129,25 @@ config TWL4030_POWER
+ 	  and load scripts controling which resources are switched off/on
+ 	  or reset when a sleep, wakeup or warm reset event occurs.
+
++config TPS65910_CORE
++	bool "Texas Instruments TPS65910 Support"
++	depends on I2C=y && GENERIC_HARDIRQS
++	help
++	  Say yes here if you have TPS65910 family chip on your board.
++	  This core driver provides register access and registers devices
++          for the various functions so that function-specific drivers can
++          bind to them.
++
++	  These multi-function chips are found on many AM35xx boards,
++          providing power management, RTC, GPIO features.
++
+ config TWL4030_CODEC
+ 	bool
+ 	depends on TWL4030_CORE
+ 	select MFD_CORE
+ 	default n
+
++
+ config MFD_TMIO
+ 	bool
+ 	default n
+diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
+index ca2f2c4..85dc3a7 100644
+--- a/drivers/mfd/Makefile
++++ b/drivers/mfd/Makefile
+@@ -30,6 +30,8 @@ obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
+ obj-$(CONFIG_TWL4030_POWER)    += twl4030-power.o
+ obj-$(CONFIG_TWL4030_CODEC)	+= twl4030-codec.o
+
++obj-$(CONFIG_TPS65910_CORE)     += tps65910-core.o
++
+ obj-$(CONFIG_MFD_MC13783)	+= mc13783-core.o
+
+ obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
+@@ -55,4 +57,4 @@ obj-$(CONFIG_AB3100_CORE)	+= ab3100-core.o
+ obj-$(CONFIG_AB3100_OTP)	+= ab3100-otp.o
+ obj-$(CONFIG_AB4500_CORE)	+= ab4500-core.o
+ obj-$(CONFIG_MFD_88PM8607)	+= 88pm8607.o
+-obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
+\ No newline at end of file
++obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
+diff --git a/drivers/mfd/tps65910-core.c b/drivers/mfd/tps65910-core.c
+new file mode 100644
+index 0000000..32d4566
+--- /dev/null
++++ b/drivers/mfd/tps65910-core.c
+@@ -0,0 +1,741 @@
++/*
++ * tps65910-core.c -- Multifunction core driver for  TPS65910x chips
++ *
++ * Copyright (C) 2010 Mistral solutions Pvt Ltd <www.mistralsolutions.com>
++ *
++ * Based on twl-core.c
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
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
++ */
++
++#include <linux/init.h>
++#include <linux/mutex.h>
++#include <linux/platform_device.h>
++#include <linux/clk.h>
++#include <linux/err.h>
++
++#include <linux/regulator/machine.h>
++
++#include <linux/i2c.h>
++#include <linux/i2c/tps65910.h>
++#include <plat/board.h>
++#include <linux/irq.h>
++#include <linux/interrupt.h>
++#include <linux/delay.h>
++
++#if defined(CONFIG_ARCH_OMAP2) || defined(CONFIG_ARCH_OMAP3)
++#include <plat/cpu.h>
++#endif
++
++#define DRIVER_NAME			"tps65910"
++
++#if defined(CONFIG_GPIO_TPS65910)
++#define tps65910_has_gpio()  		true
++#else
++#define tps65910_has_gpio()  		false
++#endif
++
++#if defined(CONFIG_REGULATOR_TPS65910)
++#define tps65910_has_regulator()     	true
++#else
++#define tps65910_has_regulator()     	false
++#endif
++
++#if defined(CONFIG_RTC_DRV_TPS65910)
++#define tps65910_has_rtc()   		true
++#else
++#define tps65910_has_rtc()   		false
++#endif
++
++#define TPS65910_GENERAL		0
++#define TPS65910_SMARTREFLEX		1
++
++
++struct tps65910_platform_data *the_tps65910;
++
++enum tps65910x_model {
++	TPS65910,   	/* TI processors OMAP3 family */
++	TPS659101,  	/* Samsung - S5PV210, S5PC1xx */
++	TPS659102,	/* Samsung - S3C64xx */
++	TPS659103,	/* Reserved */
++	TPS659104,	/* Reserved */
++	TPS659105,	/* TI processors - DM643x, DM644x */
++	TPS659106,	/* Reserved */
++	TPS659107,	/* Reserved */
++	TPS659108,	/* Reserved */
++	TPS659109,	/* Freescale - i.MX51 */
++
++};
++
++static bool inuse;
++static struct work_struct core_work;
++static struct mutex work_lock;
++
++/* Structure for each TPS65910 Slave */
++struct tps65910_client {
++	struct i2c_client *client;
++	u8 address;
++	/* max numb of i2c_msg required for read = 2 */
++	struct i2c_msg xfer_msg[2];
++	/* To lock access to xfer_msg */
++	struct mutex xfer_lock;
++};
++static struct tps65910_client tps65910_modules[TPS65910_NUM_SLAVES];
++
++/* bbch = Back-up battery charger control register */
++int tps65910_enable_bbch(u8 voltage)
++{
++
++	u8 val = 0;
++	int err;
++
++	if (voltage == TPS65910_BBSEL_3P0 || voltage == TPS65910_BBSEL_2P52 ||
++			voltage == TPS65910_BBSEL_3P15 ||
++			voltage == TPS65910_BBSEL_VBAT) {
++		val = (voltage | TPS65910_BBCHEN);
++		err = tps65910_i2c_write_u8(TPS65910_I2C_ID0, val,
++				TPS65910_REG_BBCH);
++		if (err) {
++			printk(KERN_ERR "Unable write TPS65910_REG_BBCH reg\n");
++			return -EIO;
++		}
++	} else {
++		printk(KERN_ERR"Invalid argumnet for %s \n", __func__);
++		return -EINVAL;
++	}
++
++	return 0;
++}
++EXPORT_SYMBOL(tps65910_enable_bbch);
++
++int tps65910_disable_bbch(void)
++{
++
++	u8 val = 0;
++	int err;
++
++	err = tps65910_i2c_read_u8(TPS65910_I2C_ID0, &val, TPS65910_REG_BBCH);
++
++	if (!err) {
++		val &= ~TPS65910_BBCHEN;
++
++		err = tps65910_i2c_write_u8(TPS65910_I2C_ID0, val,
++				TPS65910_REG_BBCH);
++		if (err) {
++			printk(KERN_ERR "Unable write TPS65910_REG_BBCH \
++					reg\n");
++			return -EIO;
++		}
++	} else {
++		printk(KERN_ERR "Unable to read TPS65910_REG_BBCH reg\n");
++		return -EIO;
++	}
++	return 0;
++}
++EXPORT_SYMBOL(tps65910_disable_bbch);
++
++int tps65910_i2c_read(u8 slave_addr, u8 *value, u8 reg, unsigned num_bytes)
++{
++	u8 		val;
++	u32 		ret;
++	struct 		tps65910_client *tps65910;
++	struct i2c_msg *msg;
++
++	switch (slave_addr) {
++	case TPS65910_I2C_ID0:
++		tps65910 = &tps65910_modules[0];
++		tps65910->address = TPS65910_I2C_ID0;
++		break;
++	case TPS65910_I2C_ID1:
++		tps65910 = &tps65910_modules[1];
++		tps65910->address = TPS65910_I2C_ID1;
++		break;
++	default:
++		printk(KERN_ERR "Invalid Slave address for TPS65910\n");
++		return -ENODEV;
++	}
++	mutex_lock(&tps65910->xfer_lock);
++	/* [MSG1] fill the register address data */
++	msg = &tps65910->xfer_msg[0];
++	msg->addr = tps65910->address;
++	msg->len = 1;
++	msg->flags = 0;
++	val = reg;
++	msg->buf = &val;
++	/* [MSG2] fill the data rx buffer */
++	msg = &tps65910->xfer_msg[1];
++	msg->addr = tps65910->address;
++	msg->flags = I2C_M_RD;  /* Read the register value */
++	msg->len = num_bytes;   /* only n bytes */
++	msg->buf = value;
++
++	ret = i2c_transfer(tps65910->client->adapter, tps65910->xfer_msg, 2);
++	mutex_unlock(&tps65910->xfer_lock);
++
++	/* i2c_transfer returns number of messages transferred */
++	if (ret != 2) {
++		pr_err("%s: i2c_read failed to transfer all messages\n",
++				"TPS65910C");
++		return -EIO;
++	} else {
++		return 0;
++	}
++}
++EXPORT_SYMBOL(tps65910_i2c_read);
++
++
++int tps65910_i2c_write(u8 slave_addr, u8 *value, u8 reg, unsigned num_bytes)
++{
++	int ret;
++	struct tps65910_client *tps65910;
++	struct i2c_msg *msg;
++	u8 write_buf[66]; /* Max 65 Regs + offset*/
++
++	switch (slave_addr) {
++	case TPS65910_I2C_ID0:
++		tps65910 = &tps65910_modules[0];
++		tps65910->address = TPS65910_I2C_ID0;
++		break;
++	case TPS65910_I2C_ID1:
++		tps65910 = &tps65910_modules[1];
++		tps65910->address = TPS65910_I2C_ID1;
++		break;
++	default:
++		printk(KERN_ERR "Invalid Slave address for TPS65910\n");
++		return -ENODEV;
++	}
++
++	mutex_lock(&tps65910->xfer_lock);
++	/* [MSG1]: fill the register address data fill the data Tx buffer */
++	msg = &tps65910->xfer_msg[0];
++	msg->addr = tps65910->address;
++	msg->len = num_bytes + 1;
++	msg->flags = 0;
++	write_buf[0] = reg;
++	memcpy(&write_buf[1], value, num_bytes);
++	msg->buf = &write_buf[0];
++	ret = i2c_transfer(tps65910->client->adapter, tps65910->xfer_msg, 1);
++	mutex_unlock(&tps65910->xfer_lock);
++
++	/* i2c_transfer returns number of messages transferred */
++	if (ret != 1) {
++		pr_err("%s: i2c_write failed to transfer all messages\n",
++				__func__);
++		return -EIO;
++	} else {
++		return 0;
++	}
++}
++EXPORT_SYMBOL(tps65910_i2c_write);
++
++int tps65910_i2c_read_u8(u8 mod_no, u8 *value, u8 reg)
++{
++	struct tps65910_client *tps65910;
++
++	switch (mod_no) {
++	case TPS65910_I2C_ID0:
++		tps65910 = &tps65910_modules[0];
++		tps65910->address = TPS65910_I2C_ID0;
++		break;
++	case TPS65910_I2C_ID1:
++		tps65910 = &tps65910_modules[1];
++		tps65910->address = TPS65910_I2C_ID1;
++		break;
++	default:
++		printk(KERN_ERR "Invalid Slave address for TPS65910\n");
++		return -ENODEV;
++	}
++
++	(*value) = i2c_smbus_read_byte_data(tps65910->client, reg);
++	mdelay(10);
++	if (*value < 0)
++		return -EIO;
++	else
++		return 0;
++}
++EXPORT_SYMBOL(tps65910_i2c_read_u8);
++
++int tps65910_i2c_write_u8(u8 slave_addr, u8 value, u8 reg)
++{
++	int 			ret;
++	struct tps65910_client *tps65910;
++
++	switch (slave_addr) {
++	case TPS65910_I2C_ID0:
++		tps65910 = &tps65910_modules[0];
++		tps65910->address = TPS65910_I2C_ID0;
++		break;
++	case TPS65910_I2C_ID1:
++		tps65910 = &tps65910_modules[1];
++		tps65910->address = TPS65910_I2C_ID1;
++		break;
++	default:
++		printk(KERN_ERR "Invalid Slave address for TPS65910\n");
++		return -ENODEV;
++	}
++	ret = i2c_smbus_write_byte_data(tps65910->client, reg, value);
++	if (ret < 0)
++		return -EIO;
++	else
++		return 0;
++}
++EXPORT_SYMBOL(tps65910_i2c_write_u8);
++
++
++int tps65910_enable_irq(int irq)
++{
++	u8  mask = 0x00;
++
++	if (irq > 7) {
++		irq -= 8;
++		tps65910_i2c_read_u8(TPS65910_I2C_ID0,
++				&mask, TPS65910_REG_INT_MSK2);
++		mask &= ~(1 << irq);
++		return tps65910_i2c_write_u8(TPS65910_I2C_ID0,
++				mask, TPS65910_REG_INT_MSK2);
++	} else {
++		tps65910_i2c_read_u8(TPS65910_I2C_ID0,
++				&mask, TPS65910_REG_INT_MSK);
++		mask &= ~(1 << irq);
++		return tps65910_i2c_write_u8(TPS65910_I2C_ID0,
++				mask, TPS65910_REG_INT_MSK);
++	}
++}
++EXPORT_SYMBOL(tps65910_enable_irq);
++
++int tps65910_disable_irq(int irq)
++{
++	u8  mask = 0x00;
++
++	if (irq > 7) {
++		irq -= 8;
++		tps65910_i2c_read_u8(TPS65910_I2C_ID0,
++				&mask, TPS65910_REG_INT_MSK2);
++		mask |= (1 << irq);
++		return tps65910_i2c_write_u8(TPS65910_I2C_ID0,
++				mask, TPS65910_REG_INT_MSK2);
++	} else {
++		tps65910_i2c_read_u8(TPS65910_I2C_ID0,
++				&mask, TPS65910_REG_INT_MSK);
++		mask = (1 << irq);
++		return tps65910_i2c_write_u8(TPS65910_I2C_ID0,
++				mask, TPS65910_REG_INT_MSK);
++	}
++}
++EXPORT_SYMBOL(tps65910_disable_irq);
++
++int tps65910_add_irq_work(int irq,
++		void (*handler)(void *data))
++{
++	int ret = 0;
++	the_tps65910->handlers[irq] = handler;
++	ret = tps65910_enable_irq(irq);
++
++	return ret;
++}
++EXPORT_SYMBOL(tps65910_add_irq_work);
++
++int tps65910_remove_irq_work(int irq)
++{
++	int ret = 0;
++	ret = tps65910_disable_irq(irq);
++	the_tps65910->handlers[irq] = NULL;
++	return ret;
++}
++EXPORT_SYMBOL(tps65910_remove_irq_work);
++
++static void tps65910_core_work(struct work_struct *work)
++{
++	/* Read the status register and take action  */
++	u8	status = 0x00;
++	u8	status2 = 0x00;
++	u8 	mask = 0x00;
++	u8 	mask2 = 0x00;
++	u16 	isr = 0x00;
++	u16 	irq = 0;
++	void	(*handler)(void *data) = NULL;
++
++	mutex_lock(&work_lock);
++	while (1) {
++		tps65910_i2c_read_u8(TPS65910_I2C_ID0, &status2,
++				TPS65910_REG_INT_STS2);
++		tps65910_i2c_read_u8(TPS65910_I2C_ID0, &mask2,
++				TPS65910_REG_INT_MSK2);
++		status2 &= (~mask2);
++		isr = (status2 << 8);
++		tps65910_i2c_read_u8(TPS65910_I2C_ID0, &status,
++				TPS65910_REG_INT_STS);
++		tps65910_i2c_read_u8(TPS65910_I2C_ID0, &mask,
++				TPS65910_REG_INT_MSK);
++		status &= ~(mask);
++		isr |= status;
++		if (!isr)
++			break;
++
++		while (isr) {
++			irq = fls(isr) - 1;
++			isr &= ~(1 << irq);
++			handler = the_tps65910->handlers[irq];
++			if (handler)
++				handler(the_tps65910);
++		}
++	}
++	enable_irq(the_tps65910->irq_num);
++	mutex_unlock(&work_lock);
++}
++
++
++static irqreturn_t tps65910_isr(int irq,  void *data)
++{
++
++#ifdef CONFIG_LOCKDEP
++	/* WORKAROUND for lockdep forcing IRQF_DISABLED on us, which
++	 * we don't want and can't tolerate.  Although it might be
++	 * friendlier not to borrow this thread context...
++	 */
++	local_irq_enable();
++#endif
++	disable_irq_nosync(irq);
++	(void) schedule_work(&core_work);
++	return IRQ_HANDLED;
++}
++
++
++static struct device *add_numbered_child(unsigned chip, const char *name,
++	int num, void *pdata, unsigned pdata_len, bool can_wakeup, int irq)
++{
++
++	struct platform_device  *pdev;
++	struct tps65910_client  *tps65910 = &tps65910_modules[chip];
++	int  status;
++
++	pdev = platform_device_alloc(name, num);
++	if (!pdev) {
++		dev_dbg(&tps65910->client->dev, "can't alloc dev\n");
++		status = -ENOMEM;
++		goto err;
++	}
++	device_init_wakeup(&pdev->dev, can_wakeup);
++	pdev->dev.parent = &tps65910->client->dev;
++
++	if (pdata) {
++		status = platform_device_add_data(pdev, pdata, pdata_len);
++		if (status < 0) {
++			dev_dbg(&pdev->dev, "can't add platform_data\n");
++			goto err;
++		}
++	}
++	status = platform_device_add(pdev);
++
++err:
++	if (status < 0) {
++		platform_device_put(pdev);
++		dev_err(&tps65910->client->dev, "can't add %s dev\n", name);
++		return ERR_PTR(status);
++	}
++	return &pdev->dev;
++
++}
++
++static inline struct device *add_child(unsigned chip, const char *name,
++		void *pdata, unsigned pdata_len,
++		bool can_wakeup, int irq)
++{
++	return add_numbered_child(chip, name, -1, pdata, pdata_len,
++			can_wakeup, irq);
++}
++	static
++struct device *add_regulator_linked(int num, struct regulator_init_data *pdata,
++		struct regulator_consumer_supply *consumers,
++		unsigned num_consumers)
++{
++	/* regulator framework demands init_data */
++	if (!pdata)
++		return NULL;
++
++	if (consumers) {
++		pdata->consumer_supplies = consumers;
++		pdata->num_consumer_supplies = num_consumers;
++	}
++	return add_numbered_child(TPS65910_GENERAL, "tps65910_regulator", num,
++			pdata, sizeof(*pdata), false, TPS65910_HOST_IRQ);
++}
++
++	static struct device *
++add_regulator(int num, struct regulator_init_data *pdata)
++{
++	return add_regulator_linked(num, pdata, NULL, 0);
++}
++
++	static int
++add_children(struct tps65910_platform_data *pdata, unsigned long features)
++{
++	int 		status;
++	struct device   *child;
++
++	struct platform_device  *pdev = NULL;
++
++	if (tps65910_has_gpio() && (pdata->gpio != NULL)) {
++
++		pdev = platform_device_alloc("tps65910_gpio", -1);
++		if (!pdev) {
++			status = -ENOMEM;
++			goto err;
++		}
++		pdev->dev.parent = &tps65910_modules[0].client->dev;
++		device_init_wakeup(&pdev->dev, 0);
++		if (pdata) {
++			status = platform_device_add_data(pdev, pdata,
++							sizeof(*pdata));
++			if (status < 0) {
++				dev_dbg(&pdev->dev,
++				"can't add platform_data\n");
++				goto err;
++			}
++		}
++	}
++	if (tps65910_has_rtc()) {
++		child = add_child(TPS65910_GENERAL, "tps65910_rtc",
++				NULL, 0, true, pdata->irq_num);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++	}
++
++	if (tps65910_has_regulator()) {
++
++		child = add_regulator(TPS65910_VIO, pdata->vio);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VDD1, pdata->vdd1);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VDD2, pdata->vdd2);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VDD3, pdata->vdd3);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VDIG1, pdata->vdig1);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VDIG2, pdata->vdig2);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VAUX33, pdata->vaux33);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VMMC, pdata->vmmc);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VAUX1, pdata->vaux1);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VAUX2, pdata->vaux2);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VDAC, pdata->vdac);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++
++		child = add_regulator(TPS65910_VPLL, pdata->vpll);
++		if (IS_ERR(child))
++			return PTR_ERR(child);
++	}
++	return 0;
++
++err:
++	return -1;
++
++}
++
++static int tps65910_remove(struct i2c_client *client)
++{
++	unsigned i;
++
++	for (i = 0; i < TPS65910_NUM_SLAVES; i++) {
++
++		struct tps65910_client *tps65910 = &tps65910_modules[i];
++
++		if (tps65910->client && tps65910->client != client)
++			i2c_unregister_device(tps65910->client);
++
++		tps65910_modules[i].client = NULL;
++	}
++	inuse = false;
++	return 0;
++}
++
++static int __init
++tps65910_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
++{
++	int	 status;
++	unsigned i;
++	struct 	 tps65910_platform_data	*pdata;
++
++	pdata = client->dev.platform_data;
++	the_tps65910 = pdata;
++
++	if (!pdata) {
++		dev_dbg(&client->dev, "no platform data?\n");
++		return -EINVAL;
++	}
++
++	if (i2c_check_functionality(client->adapter,
++				(I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE)) == 0) {
++		dev_dbg(&client->dev, "can't talk I2C?\n");
++		return -EIO;
++	}
++
++	if (inuse) {
++		dev_dbg(&client->dev, "driver is already in use\n");
++		return -EBUSY;
++	}
++
++	for (i = 0; i < TPS65910_NUM_SLAVES; i++) {
++
++		struct tps65910_client  *tps65910 = &tps65910_modules[i];
++
++		tps65910->address = client->addr + i;
++
++		if (i == 0)
++			tps65910->client = client;
++		else {
++			tps65910->client = i2c_new_dummy(client->adapter,
++					tps65910->address);
++
++			if (!tps65910->client) {
++				dev_err(&client->dev,
++						"can't attach client %d\n", i);
++				status = -ENOMEM;
++				goto fail;
++			}
++		}
++		mutex_init(&tps65910->xfer_lock);
++	}
++
++	inuse = true;
++
++	if (pdata->board_tps65910_config != NULL)
++		pdata->board_tps65910_config(pdata);
++
++
++	if (pdata->irq_num) {
++		/* TPS65910 power ON interrupt(s) would have already been
++		 * occurred, so immediately after request_irq the control will
++		 * be transferred to tps65910_isr, if we do core_work
++		 * initialization after requesting IRQ, the system crashes
++		 * and does not boot; to avoid this we do core_work
++		 * initialization before requesting IRQ
++		 */
++		mutex_init(&work_lock);
++		INIT_WORK(&core_work, tps65910_core_work);
++
++		status = request_irq(pdata->irq_num, tps65910_isr,
++					IRQF_DISABLED, "tps65910", pdata);
++		if (status < 0) {
++			pr_err("tps65910: could not claim irq%d: %d\n",
++					pdata->irq_num,	status);
++			goto fail;
++		}
++	}
++
++	status = add_children(pdata, 0x00);
++	if (status < 0)
++		goto fail;
++
++	return 0;
++
++fail:
++	if (status < 0)
++		tps65910_remove(client);
++
++	return status;
++}
++
++
++static int tps65910_i2c_remove(struct i2c_client *client)
++{
++	unsigned i;
++
++	for (i = 0; i < TPS65910_NUM_SLAVES; i++) {
++
++		struct tps65910_client	*tps65910 = &tps65910_modules[i];
++
++		if (tps65910->client && tps65910->client != client)
++			i2c_unregister_device(tps65910->client);
++
++		tps65910_modules[i].client = NULL;
++	}
++	inuse = false;
++	return 0;
++}
++
++/* chip-specific feature flags, for i2c_device_id.driver_data */
++static const struct i2c_device_id tps65910_i2c_ids[] = {
++	{ "tps65910", TPS65910 },
++	{ "tps659101", TPS659101 },
++	{ "tps659102", TPS659102 },
++	{ "tps659103", TPS659103 },
++	{ "tps659104", TPS659104 },
++	{ "tps659105", TPS659105 },
++	{ "tps659106", TPS659106 },
++	{ "tps659107", TPS659107 },
++	{ "tps659108", TPS659108 },
++	{ "tps659109", TPS659109 },
++	{/* end of list */ },
++};
++MODULE_DEVICE_TABLE(i2c, tps65910_i2c_ids);
++
++/* One Client Driver ,3 Clients - Regulator, RTC , GPIO */
++static struct i2c_driver tps65910_i2c_driver = {
++	.driver.name    = DRIVER_NAME,
++	.id_table       = tps65910_i2c_ids,
++	.probe          = tps65910_i2c_probe,
++	.remove         = tps65910_i2c_remove,
++};
++
++static int __init tps65910_init(void)
++{
++	int res;
++
++	res = i2c_add_driver(&tps65910_i2c_driver);
++	if (res < 0) {
++		pr_err(DRIVER_NAME ": driver registration failed\n");
++		return res;
++	}
++
++	return 0;
++}
++subsys_initcall(tps65910_init);
++
++static void __exit tps65910_exit(void)
++{
++	i2c_del_driver(&tps65910_i2c_driver);
++}
++module_exit(tps65910_exit);
++
++MODULE_AUTHOR("Mistral Solutions Pvt Ltd");
++MODULE_DESCRIPTION("I2C Core interface for TPS65910");
++MODULE_LICENSE("GPL");
+diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
+index 7cfdd65..6cec8b4 100644
+--- a/drivers/regulator/Kconfig
++++ b/drivers/regulator/Kconfig
+@@ -76,6 +76,13 @@ config REGULATOR_TWL4030
+ 	  This driver supports the voltage regulators provided by
+ 	  this family of companion chips.
+
++config REGULATOR_TPS65910
++	bool "TI TPS69510x PMIC"
++	depends on TPS65910_CORE
++	help
++	  This driver supports the voltage regulators provided by
++	  this family of companion chips.
++
+ config REGULATOR_WM831X
+ 	tristate "Wolfson Microelcronics WM831x PMIC regulators"
+ 	depends on MFD_WM831X
+diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
+index 9ae3cc4..8a2bb9a 100644
+--- a/drivers/regulator/Makefile
++++ b/drivers/regulator/Makefile
+@@ -12,6 +12,7 @@ obj-$(CONFIG_REGULATOR_BQ24022) += bq24022.o
+ obj-$(CONFIG_REGULATOR_LP3971) += lp3971.o
+ obj-$(CONFIG_REGULATOR_MAX1586) += max1586.o
+ obj-$(CONFIG_REGULATOR_TWL4030) += twl-regulator.o
++obj-$(CONFIG_REGULATOR_TPS65910) += tps65910-regulator.o
+ obj-$(CONFIG_REGULATOR_WM831X) += wm831x-dcdc.o
+ obj-$(CONFIG_REGULATOR_WM831X) += wm831x-isink.o
+ obj-$(CONFIG_REGULATOR_WM831X) += wm831x-ldo.o
+diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
+new file mode 100644
+index 0000000..7c66315
+--- /dev/null
++++ b/drivers/regulator/tps65910-regulator.c
+@@ -0,0 +1,674 @@
++/*
++ * tps65910-regulator.c -- support regulators in tps65910x family chips
++ *
++ *
++ * Copyright (C) 2010 Mistral Solutions Pvt Ltd <www.mistralsolutions.com>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation version 2.
++ *
++ * This program is distributed "as is" WITHOUT ANY WARRANTY of any kind,
++ * whether express or implied; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ */
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/err.h>
++#include <linux/delay.h>
++#include <linux/platform_device.h>
++#include <linux/regulator/driver.h>
++#include <linux/regulator/machine.h>
++#include <linux/i2c/tps65910.h>
++
++/*
++ * The TPS65910x family chips include power management, a GPIO
++ * RTC. These chips are often used in AM35xx-based systems.
++ *
++ * This driver implements software-based resource control for various
++ * voltage regulators.  This is usually augmented with state machine
++ * based control.
++ */
++
++
++struct tps65910reg_info {
++	/* tps65910 resource ID, for resource control state machine */
++	u8                      id;
++	/* voltage in mV = table[VSEL]; table_len must be a power-of-two */
++	u8                      table_len;
++	const u16               *table;
++
++	/* regulator specific turn-on delay */
++	u32                     delay;
++	/* chip constraints on regulator behavior */
++	u16                     min_mV;
++	u16                     max_mV;
++	/* used by regulator core */
++	struct regulator_desc   desc;
++};
++
++
++/* Supported voltage values for regulators */
++
++/* TPS65910  VIO */
++static const u16 VIO_VSEL_table[] = {
++	1500, 1800, 2500, 3300,
++};
++
++/* TPS65910 VDD1 */
++/* value round off 12.5 is made as 12 */
++static const u16 VDD1_VSEL_table[] = {
++	600, 612, 625, 637, 650, 662, 675, 687,
++	700, 712, 725, 737, 750, 762, 775, 787,
++	800, 812, 825, 837, 850, 862, 875, 887,
++	900, 912, 925, 937, 950, 962, 975, 987,
++	1000, 1012, 1025, 1037, 1050, 1062, 1075, 1087,
++	1100, 1112, 1125, 1137, 1150, 1162, 1175, 1187,
++	1200, 1212, 1225, 1237, 1250, 1262, 1275, 1287,
++	1300, 1312, 1325, 1337, 1350, 1362, 1375, 1387,
++	1400, 1412, 1425, 1437, 1450, 1462, 1475, 1487,
++	1500,
++};
++
++/* TPS65910 VDD2 */
++static const u16 VDD2_VSEL_table[] = {
++	600, 612, 625, 637, 650, 662, 675, 687,
++	700, 712, 725, 737, 750, 762, 775, 787,
++	800, 812, 825, 837, 850, 862, 875, 887,
++	900, 912, 925, 937, 950, 962, 975, 987,
++	1000, 1012, 1025, 1037, 1050, 1062, 1075, 1087,
++	1100, 1112, 1125, 1137, 1150, 1162, 1175, 1187,
++	1200, 1212, 1225, 1237, 1250, 1262, 1275, 1287,
++	1300, 1312, 1325, 1337, 1350, 1362, 1375, 1387,
++	1400, 1412, 1425, 1437, 1450, 1462, 1475, 1487,
++	1500, 2200, 3300,
++};
++
++/* TPS65910 VDD3 */
++static const u16 VDD3_VSEL_table[] = {
++	5000,
++};
++
++/* VDIG1 */
++static const u16 VDIG1_VSEL_table[] = {
++	1200, 1500, 1800, 2700,
++};
++
++/* VDIG2 */
++static const u16 VDIG2_VSEL_table[] = {
++	1000, 1100, 1200, 1800,
++};
++
++/* VAUX33 */
++static const u16 VAUX33_VSEL_table[] = {
++	1800, 2000, 2800, 3300,
++};
++
++/* VMMC */
++static const u16 VMMC_VSEL_table[] = {
++	1800, 2800, 3000, 3300,
++};
++
++/* VAUX1 */
++static const u16 VAUX1_VSEL_table[] = {
++	1800, 2000, 2800, 3300,
++};
++
++/* VAUX2 */
++static const u16 VAUX2_VSEL_table[] = {
++	1800, 2800, 2900, 3300,
++};
++
++/* VDAC */
++static const u16 VDAC_VSEL_table[] = {
++	1800, 2600, 2800, 2850,
++};
++
++
++/* VPLL */
++static const u16 VPLL_VSEL_table[] = {
++	1000, 1100, 1800, 2500,
++};
++
++/* VRTC, supports only enable/disable */
++static const u16 VRTC_VSEL_table[] = {
++	1800,
++};
++
++static inline int
++tps65910reg_read(struct tps65910reg_info *info, unsigned slave_addr,
++		u8 offset)
++{
++	u8 value;
++	int status;
++	status = tps65910_i2c_read_u8(slave_addr, &value, offset);
++
++	return (status < 0) ? status : value;
++}
++
++static inline int
++tps65910reg_write(struct tps65910reg_info *info, unsigned slave_addr,
++		u8 offset, u8 value)
++{
++	if (0 == tps65910_i2c_write_u8(slave_addr, value, offset))
++		return 0;
++	else
++		return -1;
++}
++
++static u8 tps65910reg_find_offset(u8 regulator_id)
++{
++	u8 offset = 0;
++
++	switch (regulator_id) {
++
++	case TPS65910_VIO:
++		offset =  TPS65910_REG_VIO;
++		break;
++	case TPS65910_VDD1:
++		offset =  TPS65910_REG_VDD1_OP;
++		break;
++	case TPS65910_VDD2:
++		offset =  TPS65910_REG_VDD2_OP;
++		break;
++	case TPS65910_VDD3:
++		offset =  TPS65910_REG_VDD3;
++		break;
++	case TPS65910_VDIG1:
++		offset =  TPS65910_REG_VDIG1;
++		break;
++	case  TPS65910_VDIG2:
++		offset =  TPS65910_REG_VDIG2;
++		break;
++	case TPS65910_VAUX33:
++		offset =  TPS65910_REG_VAUX33;
++		break;
++	case TPS65910_VMMC:
++		offset =  TPS65910_REG_VMMC;
++		break;
++	case TPS65910_VAUX1:
++		offset =  TPS65910_REG_VAUX1;
++		break;
++	case TPS65910_VAUX2:
++		offset =  TPS65910_REG_VAUX2;
++		break;
++	case TPS65910_VDAC:
++		offset =  TPS65910_REG_VDAC;
++		break;
++	case TPS65910_VPLL:
++		offset =  TPS65910_REG_VPLL;
++		break;
++	}
++	return offset;
++}
++
++static int tps65910reg_is_enabled(struct regulator_dev *rdev)
++{
++	int    val;
++	u8    offset;
++
++	struct tps65910reg_info *info = rdev_get_drvdata(rdev);
++
++	offset = tps65910reg_find_offset(info->id);
++
++	val = tps65910reg_read(info, TPS65910_I2C_ID0, offset);
++	if (val < 0) {
++		printk(KERN_ERR "Unable to read TPS65910 Reg at offset 0x%x= \
++				\n", offset);
++		return -EIO;
++	}
++	if ((val & TPS65910_REG_OHP) || (val & TPS65910_REG_OLP))
++		return 1;
++	else
++		return 0;
++}
++
++
++static int tps65910reg_enable(struct regulator_dev *rdev)
++{
++
++	int	val;
++	u8   	offset;
++	struct tps65910reg_info *info = rdev_get_drvdata(rdev);
++
++	offset = tps65910reg_find_offset(info->id);
++
++	val = tps65910reg_read(info, TPS65910_I2C_ID0, offset);
++
++	if (val < 0) {
++
++		printk(KERN_ERR "Unable to read TPS65910 Reg at offset = 0x%x \
++				\n", offset);
++		return -EIO;
++	}
++	val |= TPS65910_REG_OHP;
++
++	return tps65910reg_write(info, TPS65910_I2C_ID0, offset, val);
++}
++
++static int tps65910reg_disable(struct regulator_dev *rdev)
++{
++	int	val;
++	u8   	offset;
++
++	struct tps65910reg_info *info = rdev_get_drvdata(rdev);
++
++	offset = tps65910reg_find_offset(info->id);
++
++	val = tps65910reg_read(info, TPS65910_I2C_ID0, offset);
++
++	if (val < 0) {
++
++		printk(KERN_ERR "Unable to read TPS65910 Reg at offset = \
++			 0x%x\n", offset);
++		return -EIO;
++	}
++	val &= TPS65910_REG_OFF_00;
++
++	return tps65910reg_write(info, TPS65910_I2C_ID0, offset, val);
++}
++
++static int tps65910reg_get_status(struct regulator_dev *rdev)
++{
++	int     val;
++	u8      offset;
++	u8 	ret;
++	struct tps65910reg_info *info = rdev_get_drvdata(rdev);
++
++	offset = tps65910reg_find_offset(info->id);
++
++	val = tps65910reg_read(info, TPS65910_I2C_ID0, offset);
++
++	if (val < 0) {
++
++		printk(KERN_ERR "Unable to read TPS65910 Reg at offset = \
++			0x%x\n", offset);
++		return -EIO;
++	}
++	switch ((val & SUPPLY_STATE_FLAG)) {
++
++	case TPS65910_REG_OFF_00:
++	case TPS65910_REG_OFF_10:
++		ret =  REGULATOR_STATUS_OFF;
++		break;
++	case TPS65910_REG_OHP:
++	case TPS65910_REG_OLP:
++		ret =  REGULATOR_STATUS_ON;
++		break;
++	default:
++		ret =  REGULATOR_STATUS_OFF;
++	}
++	return ret;
++}
++
++
++static int tps65910reg_set_mode(struct regulator_dev *rdev, unsigned mode)
++{
++	struct 	tps65910reg_info   *info = rdev_get_drvdata(rdev);
++	u8      offset;
++	u8 	val;
++
++	offset = tps65910reg_find_offset(info->id);
++	val = tps65910reg_read(info, TPS65910_I2C_ID0, offset);
++
++	if (val < 0) {
++		printk(KERN_ERR"Unable to read TPS65910 Reg at offset \
++			 = 0x%x\n", offset);
++		return -EIO;
++	}
++
++	switch (mode) {
++	case REGULATOR_MODE_NORMAL:
++		return tps65910reg_write(info, TPS65910_I2C_ID0, offset,
++						(val | TPS65910_REG_OHP));
++	case REGULATOR_MODE_STANDBY:
++		return tps65910reg_write(info, TPS65910_I2C_ID0, offset,
++						(val | TPS65910_REG_OLP));
++	default:
++		return -EINVAL;
++	}
++}
++
++static
++int tps65910_ldo_list_voltage(struct regulator_dev *rdev, unsigned index)
++{
++
++	struct tps65910reg_info      *info = rdev_get_drvdata(rdev);
++	int    mV = info->table[index];
++	return mV * 1000;
++}
++
++static int get_voltage_index(int ldo_id, int uv)
++{
++	u16 i = 0;
++	u16 *ptr = NULL;
++
++	uv = uv/1000;
++
++	if (((ldo_id == TPS65910_VDD1) || (ldo_id == TPS65910_VDD2))) {
++		/* For VDD2  2.2 and  3.3 V */
++		if (ldo_id == TPS65910_VDD2 &&
++			(uv == 3300000 || uv == 2200000)) {
++			return 43;
++		} else {
++			for (i = 0; i < 72; i++) {
++
++				if (VDD1_VSEL_table[i] == uv)
++					return i;
++			}
++		}
++		if (i == 72)
++			return -1;
++	}
++
++	/* Lookup table to match LDO volatge to Index*/
++	switch (ldo_id) {
++
++	case TPS65910_VIO:
++		ptr = (u16 *)&VIO_VSEL_table[0];
++		break;
++	case TPS65910_VDIG1:
++		ptr = (u16 *)&VDIG1_VSEL_table[0];
++		break;
++	case TPS65910_VDIG2:
++		ptr = (u16 *)&VDIG2_VSEL_table[0];
++		break;
++	case TPS65910_VAUX33:
++		ptr = (u16 *)&VAUX33_VSEL_table[0];
++		break;
++	case TPS65910_VMMC:
++		ptr = (u16 *)&VMMC_VSEL_table[0];
++		break;
++	case TPS65910_VAUX1:
++		ptr = (u16 *)&VAUX1_VSEL_table[0];
++		break;
++	case TPS65910_VAUX2:
++		ptr = (u16 *)&VAUX2_VSEL_table[0];
++		break;
++	case TPS65910_VDAC:
++		ptr = (u16 *)&VDAC_VSEL_table[0];
++		break;
++	case TPS65910_VPLL:
++		ptr = (u16 *)&VPLL_VSEL_table[0];
++		break;
++	default:
++		ptr = NULL;
++		break;
++	}
++
++	if (ptr != NULL) {
++		for (i = 0; i < 4; i++) {
++			if (*ptr++  == uv)
++				return i;
++		}
++	}
++	if (ptr == NULL || i == 4)
++		return -1;
++	/* For warning */
++	return -1;
++}
++
++static int
++tps65910_ldo_set_voltage(struct regulator_dev *rdev, int min_uV, int max_uV)
++{
++	struct tps65910reg_info      *info = rdev_get_drvdata(rdev);
++	int    	vsel;
++	u8 	offset;
++	u8 	val;
++	u8 	index;
++
++	offset = tps65910reg_find_offset(info->id);
++
++	val = tps65910reg_read(info, TPS65910_I2C_ID0, offset);
++	if (val < 0) {
++		printk(KERN_ERR"Unable to read TPS65910 Reg at offset = 0x%x\n",
++				offset);
++		return -EIO;
++	}
++
++	if (rdev->constraints) {
++		index = get_voltage_index(info->id, rdev->constraints->min_uV);
++
++		if (info->id == TPS65910_VDD1 || info->id == TPS65910_VDD2) {
++			val |= index;
++			return tps65910reg_write(info, TPS65910_I2C_ID0,
++							offset, val);
++		} else {
++			val = 2 << index;
++			val |= 0x01;
++			return tps65910reg_write(info, TPS65910_I2C_ID0,
++							offset, val);
++		}
++	} else {
++		return 0;
++	}
++
++	for (vsel = 0; vsel < info->table_len; vsel++) {
++
++		int mV = info->table[vsel];
++		int uV;
++
++		uV = mV * 1000;
++		if (info == NULL)
++			return 0;
++
++		index = get_voltage_index(info->id, uV);
++		/* For VDD1 and VDD2 */
++		if (info->id == TPS65910_VDD1 || info->id == TPS65910_VDD2) {
++			return tps65910reg_write(info, TPS65910_I2C_ID0,
++							offset, val);
++		}
++		val &= 0xF3;
++		val =  2 << index;
++		val |= 0x01;
++		if (index < 0) {
++			printk(KERN_ERR "Invaild voltage for LDO \n");
++			return	EINVAL;
++		}
++		return tps65910reg_write(info, TPS65910_I2C_ID0, offset, val);
++	}
++	return -EINVAL;
++}
++
++static int tps65910_ldo_get_voltage(struct regulator_dev *rdev)
++{
++	struct tps65910reg_info      *info = rdev_get_drvdata(rdev);
++	int    	vsel;
++	u8 	offset;
++
++	offset = tps65910reg_find_offset(info->id);
++
++	vsel = tps65910reg_read(info, TPS65910_I2C_ID0, offset);
++
++	if (vsel < 0) {
++		printk(KERN_ERR"Unable to read TPS65910 Reg at offset = \
++			0x%x\n", offset);
++		return -EIO;
++	}
++	/* Get the index of voltage value from Reg and map to table */
++	vsel &= 0xF3;
++	vsel = (vsel >> 2);
++	return info->table[vsel] * 1000;
++}
++
++
++static struct regulator_ops tps65910_ldo_ops = {
++	.list_voltage   = tps65910_ldo_list_voltage,
++	.set_voltage    = tps65910_ldo_set_voltage,
++	.get_voltage    = tps65910_ldo_get_voltage,
++	.enable         = tps65910reg_enable,
++	.disable        = tps65910reg_disable,
++	.is_enabled     = tps65910reg_is_enabled,
++	.set_mode       = tps65910reg_set_mode,
++	.get_status     = tps65910reg_get_status,
++};
++
++static
++int tps65910_fixed_list_voltage(struct regulator_dev *rdev, unsigned index)
++{
++	struct tps65910reg_info      *info = rdev_get_drvdata(rdev);
++
++	return info->min_mV * 1000;
++}
++
++static int tps65910_fixed_get_voltage(struct regulator_dev *rdev)
++{
++	struct tps65910reg_info      *info = rdev_get_drvdata(rdev);
++
++	return info->min_mV * 1000;
++}
++
++static struct regulator_ops tps65910_fixed_ops = {
++	.list_voltage   = tps65910_fixed_list_voltage,
++	.get_voltage    = tps65910_fixed_get_voltage,
++	.enable         = tps65910reg_enable,
++	.disable        = tps65910reg_disable,
++	.is_enabled     = tps65910reg_is_enabled,
++	.set_mode       = tps65910reg_set_mode,
++	.get_status     = tps65910reg_get_status,
++};
++
++#define TPS65910_ADJUSTABLE_LDO(label, num, min_mVolts, max_mVolts,\
++				 turnon_delay) { \
++	.id = num, \
++	.table_len = ARRAY_SIZE(label##_VSEL_table), \
++	.table = label##_VSEL_table, \
++	.min_mV = min_mVolts, \
++	.max_mV = max_mVolts, \
++	.delay = turnon_delay, \
++	.desc = { \
++		.name = #label, \
++		.id = TPS65910_##label, \
++		.n_voltages = ARRAY_SIZE(label##_VSEL_table), \
++		.ops = &tps65910_ldo_ops, \
++		.type = REGULATOR_VOLTAGE, \
++		.owner = THIS_MODULE, \
++	}, \
++}
++
++#define TPS65910_FIXED_LDO(label, num, mVolts, turnon_delay) { \
++	.id = num, \
++	.min_mV = mVolts, \
++	.delay = turnon_delay, \
++	.desc = { \
++		.name = #label, \
++		.id = TPS65910_##label, \
++		.n_voltages = 1, \
++		.ops = &tps65910_fixed_ops, \
++		.type = REGULATOR_VOLTAGE, \
++		.owner = THIS_MODULE, \
++	}, \
++}
++
++/*
++ * We list regulators here if systems need some level of
++ * software control over them after boot.
++ */
++static struct tps65910reg_info tps65910_regs[] = {
++
++	TPS65910_ADJUSTABLE_LDO(VIO, TPS65910_VIO, 350, 1500, 3300),
++	TPS65910_ADJUSTABLE_LDO(VDD1, TPS65910_VDD1, 350, 600, 1500),
++	TPS65910_ADJUSTABLE_LDO(VDD2, TPS65910_VDD2, 350, 600, 1500),
++
++	TPS65910_FIXED_LDO(VDD3, TPS65910_VDD3, 5000, 200),
++
++	TPS65910_ADJUSTABLE_LDO(VDIG1, TPS65910_VDIG1, 100, 1200, 2700),
++	TPS65910_ADJUSTABLE_LDO(VDIG2, TPS65910_VDIG2, 100, 1000, 1800),
++	TPS65910_ADJUSTABLE_LDO(VAUX33, TPS65910_VAUX33, 100, 1800, 3300),
++	TPS65910_ADJUSTABLE_LDO(VMMC, TPS65910_VMMC, 100, 1800, 3300),
++	TPS65910_ADJUSTABLE_LDO(VAUX1, TPS65910_VAUX1, 100, 1800, 3300),
++	TPS65910_ADJUSTABLE_LDO(VAUX2, TPS65910_VAUX1, 100, 1800, 3300),
++	TPS65910_ADJUSTABLE_LDO(VDAC, TPS65910_VDAC, 100, 1800, 2850),
++	TPS65910_ADJUSTABLE_LDO(VPLL, TPS65910_VPLL, 100, 1000, 2500),
++
++	TPS65910_FIXED_LDO(VDD3, TPS65910_VRTC, 1800, 220000),
++};
++
++static int tps65910_regulator_probe(struct platform_device *pdev)
++{
++	int                             i;
++	struct tps65910reg_info         *info;
++	struct regulator_init_data      *initdata;
++	struct regulation_constraints   *c;
++	struct regulator_dev            *rdev;
++
++	for (i = 0, info = NULL; i < ARRAY_SIZE(tps65910_regs); i++) {
++		if (tps65910_regs[i].desc.id != pdev->id)
++			continue;
++		info = tps65910_regs + i;
++		break;
++	}
++	if (!info)
++		return -ENODEV;
++
++	initdata = pdev->dev.platform_data;
++	if (!initdata)
++		return -EINVAL;
++
++	/* Constrain board-specific capabilities according to what
++	 * this driver and the chip itself can actually do.
++	 */
++	c = &initdata->constraints;
++	c->valid_modes_mask &= REGULATOR_MODE_NORMAL | REGULATOR_MODE_STANDBY;
++	c->valid_ops_mask &= REGULATOR_CHANGE_VOLTAGE
++		| REGULATOR_CHANGE_MODE
++		| REGULATOR_CHANGE_STATUS;
++
++	switch (pdev->id) {
++	case TPS65910_REG_VIO:
++	case TPS65910_REG_VDD1:
++	case TPS65910_REG_VDD2:
++	case TPS65910_REG_VDD3:
++	case TPS65910_REG_VPLL:
++	case TPS65910_REG_VDIG1:
++	case TPS65910_REG_VDIG2:
++	case TPS65910_REG_VRTC:
++		c->always_on = true;
++		break;
++	default:
++		break;
++	}
++
++	rdev = regulator_register(&info->desc, &pdev->dev, initdata, info);
++
++	if (IS_ERR(rdev)) {
++		dev_err(&pdev->dev, "can't register %s, %ld\n",
++				info->desc.name, PTR_ERR(rdev));
++		return PTR_ERR(rdev);
++	}
++	platform_set_drvdata(pdev, rdev);
++
++	return 0;
++}
++
++static int __devexit tps65910_regulator_remove(struct platform_device *pdev)
++{
++	regulator_unregister(platform_get_drvdata(pdev));
++	return 0;
++}
++
++static struct platform_driver tps65910_regulator_driver = {
++	.probe          = tps65910_regulator_probe,
++	.remove         = tps65910_regulator_remove,
++	.driver.name    = "tps65910_regulator",
++	.driver.owner   = THIS_MODULE,
++};
++
++static int __init tps65910_regulator_init(void)
++{
++	return platform_driver_register(&tps65910_regulator_driver);
++}
++module_init(tps65910_regulator_init);
++
++static void __exit tps65910_regulator_exit(void)
++{
++	platform_driver_unregister(&tps65910_regulator_driver);
++}
++module_exit(tps65910_regulator_exit)
++
++MODULE_AUTHOR("Srinath R <srinath@mistralsolutions.com>");
++MODULE_DESCRIPTION("TPS65910 voltage regulator driver");
++MODULE_LICENSE("GPL");
+diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
+index 71fbd6e..0ddf4c2 100644
+--- a/drivers/rtc/Kconfig
++++ b/drivers/rtc/Kconfig
+@@ -267,6 +267,14 @@ config RTC_DRV_TWL4030
+ 	  This driver can also be built as a module. If so, the module
+ 	  will be called rtc-twl.
+
++config RTC_DRV_TPS65910
++	boolean "TI TPS65910"
++	depends on RTC_CLASS && TPS65910_CORE
++	help
++	  If you say yes here you get support for the RTC on the
++	  TPS65910 family chips, used mostly with OMAP3/AM35xx platforms.
++
++
+ config RTC_DRV_S35390A
+ 	tristate "Seiko Instruments S-35390A"
+ 	select BITREVERSE
+diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
+index 7da6efb..8fcfe49 100644
+--- a/drivers/rtc/Makefile
++++ b/drivers/rtc/Makefile
+@@ -81,6 +81,7 @@ obj-$(CONFIG_RTC_DRV_STMP)	+= rtc-stmp3xxx.o
+ obj-$(CONFIG_RTC_DRV_SUN4V)	+= rtc-sun4v.o
+ obj-$(CONFIG_RTC_DRV_TEST)	+= rtc-test.o
+ obj-$(CONFIG_RTC_DRV_TWL4030)	+= rtc-twl.o
++obj-$(CONFIG_RTC_DRV_TPS65910)	+= rtc-tps65910.o
+ obj-$(CONFIG_RTC_DRV_TX4939)	+= rtc-tx4939.o
+ obj-$(CONFIG_RTC_DRV_V3020)	+= rtc-v3020.o
+ obj-$(CONFIG_RTC_DRV_VR41XX)	+= rtc-vr41xx.o
+diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
+new file mode 100644
+index 0000000..7e7ed4b
+--- /dev/null
++++ b/drivers/rtc/rtc-tps65910.c
+@@ -0,0 +1,657 @@
++/*
++ * rtc-tps65910.c -- TPS65910 Real Time Clock interface
++ *
++ * Copyright (C) 2010 Mistral Solutions Pvt Ltd. <www.mistralsolutions.com>
++ * Author: Umesh K <umeshk@mistralsolutions.com>
++ *
++ * Based on rtc-twl.c
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version
++ * 2 of the License, or (at your option) any later version.
++ */
++
++#include <linux/kernel.h>
++#include <linux/errno.h>
++#include <linux/init.h>
++#include <linux/module.h>
++#include <linux/types.h>
++#include <linux/rtc.h>
++#include <linux/bcd.h>
++#include <linux/platform_device.h>
++#include <linux/interrupt.h>
++#include <linux/i2c/tps65910.h>
++#include <linux/gpio.h>
++#include <linux/delay.h>
++
++/* RTC Definitions */
++/* RTC_CTRL_REG bitfields */
++#define BIT_RTC_CTRL_REG_STOP_RTC_M		0x01
++#define BIT_RTC_CTRL_REG_ROUND_30S_M		0x02
++#define BIT_RTC_CTRL_REG_AUTO_COMP_M		0x04
++#define BIT_RTC_CTRL_REG_MODE_12_24_M		0x08
++#define BIT_RTC_CTRL_REG_TEST_MODE_M		0x10
++#define BIT_RTC_CTRL_REG_SET_32_COUNTER_M	0x20
++#define BIT_RTC_CTRL_REG_GET_TIME_M		0x40
++#define BIT_RTC_CTRL_REG_RTC_V_OPT_M		0x80
++
++/* RTC_STATUS_REG bitfields */
++#define BIT_RTC_STATUS_REG_RUN_M		0x02
++#define BIT_RTC_STATUS_REG_1S_EVENT_M		0x04
++#define BIT_RTC_STATUS_REG_1M_EVENT_M		0x08
++#define BIT_RTC_STATUS_REG_1H_EVENT_M		0x10
++#define BIT_RTC_STATUS_REG_1D_EVENT_M		0x20
++#define BIT_RTC_STATUS_REG_ALARM_M		0x40
++#define BIT_RTC_STATUS_REG_POWER_UP_M		0x80
++
++/* RTC_INTERRUPTS_REG bitfields */
++#define BIT_RTC_INTERRUPTS_REG_EVERY_M		0x03
++#define BIT_RTC_INTERRUPTS_REG_IT_TIMER_M	0x04
++#define BIT_RTC_INTERRUPTS_REG_IT_ALARM_M	0x08
++
++/* DEVCTRL bitfields */
++#define BIT_RTC_PWDN				0x40
++
++/* REG_SECONDS_REG through REG_YEARS_REG is how many registers? */
++#define ALL_TIME_REGS				6
++
++/*
++ * Supports 1 byte read from TPS65910 RTC register.
++ */
++static int tps65910_rtc_read_u8(u8 *data, u8 reg)
++{
++	int ret;
++
++	ret = tps65910_i2c_read_u8(TPS65910_I2C_ID0, data, reg);
++
++	if (ret < 0)
++		pr_err("tps65910_rtc: Could not read TPS65910"
++				"register %X - error %d\n", reg, ret);
++	return ret;
++}
++
++/*
++ * Supports 1 byte write to TPS65910 RTC registers.
++ */
++static int tps65910_rtc_write_u8(u8 data, u8 reg)
++{
++	int ret;
++
++	ret = tps65910_i2c_write_u8(TPS65910_I2C_ID0, data, reg);
++	if (ret < 0)
++		pr_err("tps65910_rtc: Could not write TPS65910"
++				"register %X - error %d\n", reg, ret);
++	return ret;
++}
++
++/*
++ * Cache the value for timer/alarm interrupts register; this is
++ * only changed by callers holding rtc ops lock (or resume).
++ */
++static unsigned char rtc_irq_bits;
++
++/*
++ * Enable 1/second update and/or alarm interrupts.
++ */
++static int set_rtc_irq_bit(unsigned char bit)
++{
++	unsigned char val;
++	int ret;
++
++	val = rtc_irq_bits | bit;
++	val |= bit;
++	ret = tps65910_rtc_write_u8(val, TPS65910_REG_RTC_INTERRUPTS);
++	if (ret == 0)
++		rtc_irq_bits = val;
++
++	return ret;
++}
++
++/*
++ * Disable update and/or alarm interrupts.
++ */
++static int mask_rtc_irq_bit(unsigned char bit)
++{
++	unsigned char val;
++	int ret;
++
++	val = rtc_irq_bits & ~bit;
++	ret = tps65910_rtc_write_u8(val, TPS65910_REG_RTC_INTERRUPTS);
++	if (ret == 0)
++		rtc_irq_bits = val;
++
++	return ret;
++}
++
++static int tps65910_rtc_alarm_irq_enable(struct device *dev, unsigned enabled)
++{
++	int ret;
++
++	if (enabled)
++		ret = set_rtc_irq_bit(BIT_RTC_INTERRUPTS_REG_IT_ALARM_M);
++	else
++		ret = mask_rtc_irq_bit(BIT_RTC_INTERRUPTS_REG_IT_ALARM_M);
++
++	return ret;
++}
++
++static int tps65910_rtc_update_irq_enable(struct device *dev, unsigned enabled)
++{
++	int ret;
++
++	if (enabled)
++		ret = set_rtc_irq_bit(BIT_RTC_INTERRUPTS_REG_IT_TIMER_M);
++	else
++		ret = mask_rtc_irq_bit(BIT_RTC_INTERRUPTS_REG_IT_TIMER_M);
++
++	return ret;
++}
++
++#if 1 /* Debugging periodic interrupts */
++/*
++ * We will just handle setting the frequency and make use the framework for
++ * reading the periodic interupts.
++ *
++ * @freq: Current periodic IRQ freq:
++ * bit 0: every second
++ * bit 1: every minute
++ * bit 2: every hour
++ * bit 3: every day
++ */
++
++static int tps65910_rtc_irq_set_freq(struct device *dev, int freq)
++{
++	struct rtc_device *rtc = dev_get_drvdata(dev);
++
++	if (freq < 0 || freq > 3)
++		return -EINVAL;
++
++	rtc->irq_freq = freq;
++	/* set rtc irq freq to user defined value */
++	set_rtc_irq_bit(freq);
++
++	return 0;
++}
++#endif
++
++/*
++ * Gets current TPS65910 RTC time and date parameters.
++ *
++ * The RTC's time/alarm representation is not what gmtime(3) requires
++ * Linux to use:
++ *
++ *  - Months are 1..12 vs Linux 0-11
++ *  - Years are 0..99 vs Linux 1900..N (we assume 21st century)
++ */
++static int tps65910_rtc_read_time(struct device *dev, struct rtc_time *tm)
++{
++	unsigned char rtc_data[ALL_TIME_REGS + 1];
++	int ret;
++	u8 save_control;
++
++	tps65910_rtc_read_u8(&save_control, TPS65910_REG_RTC_CTRL);
++	ret = tps65910_rtc_read_u8(&save_control, TPS65910_REG_RTC_CTRL);
++	if (ret < 0)
++		return ret;
++
++	save_control &= ~BIT_RTC_CTRL_REG_RTC_V_OPT_M;
++
++	ret = tps65910_rtc_write_u8(save_control, TPS65910_REG_RTC_CTRL);
++	if (ret < 0)
++		return ret;
++
++	ret = tps65910_rtc_read_u8(&rtc_data[0], TPS65910_REG_SECONDS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_read_u8(&rtc_data[1], TPS65910_REG_MINUTES);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_read_u8(&rtc_data[2], TPS65910_REG_HOURS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_read_u8(&rtc_data[3], TPS65910_REG_DAYS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_read_u8(&rtc_data[4], TPS65910_REG_MONTHS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_read_u8(&rtc_data[5], TPS65910_REG_YEARS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++
++	tm->tm_sec = bcd2bin(rtc_data[0]);
++	tm->tm_min = bcd2bin(rtc_data[1]);
++	tm->tm_hour = bcd2bin(rtc_data[2]);
++	tm->tm_mday = bcd2bin(rtc_data[3]);
++	tm->tm_mon = bcd2bin(rtc_data[4]) - 1;
++	tm->tm_year = bcd2bin(rtc_data[5]) + 100;
++
++	return ret;
++}
++
++static int tps65910_rtc_set_time(struct device *dev, struct rtc_time *tm)
++{
++	unsigned char save_control;
++	unsigned char rtc_data[ALL_TIME_REGS + 1];
++	int ret;
++
++	rtc_data[1] = bin2bcd(tm->tm_sec);
++	rtc_data[2] = bin2bcd(tm->tm_min);
++	rtc_data[3] = bin2bcd(tm->tm_hour);
++	rtc_data[4] = bin2bcd(tm->tm_mday);
++	rtc_data[5] = bin2bcd(tm->tm_mon + 1);
++	rtc_data[6] = bin2bcd(tm->tm_year - 100);
++
++	/*Dummy read*/
++	ret = tps65910_rtc_read_u8(&save_control, TPS65910_REG_RTC_CTRL);
++
++	/* Stop RTC while updating the TC registers */
++	ret = tps65910_rtc_read_u8(&save_control, TPS65910_REG_RTC_CTRL);
++	if (ret < 0)
++		goto out;
++
++	save_control &= ~BIT_RTC_CTRL_REG_STOP_RTC_M;
++
++	tps65910_rtc_write_u8(save_control, TPS65910_REG_RTC_CTRL);
++
++	/* update all the time registers in one shot */
++	ret = tps65910_rtc_write_u8(rtc_data[1], TPS65910_REG_SECONDS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_write_u8(rtc_data[2], TPS65910_REG_MINUTES);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_write_u8(rtc_data[3], TPS65910_REG_HOURS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_write_u8(rtc_data[4], TPS65910_REG_DAYS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_write_u8(rtc_data[5], TPS65910_REG_MONTHS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_write_u8(rtc_data[6], TPS65910_REG_YEARS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++
++	/*Dummy read*/
++	ret = tps65910_rtc_read_u8(&save_control, TPS65910_REG_RTC_CTRL);
++
++	ret = tps65910_rtc_read_u8(&save_control, TPS65910_REG_RTC_CTRL);
++	if (ret < 0)
++		goto out;
++	/* Start back RTC */
++	save_control |= BIT_RTC_CTRL_REG_STOP_RTC_M;
++	ret = tps65910_rtc_write_u8(save_control, TPS65910_REG_RTC_CTRL);
++
++out:
++	return ret;
++}
++
++/*
++ * Gets current TPS65910 RTC alarm time.
++ */
++static int tps65910_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
++{
++	unsigned char rtc_data[ALL_TIME_REGS + 1];
++	int ret;
++
++	ret = tps65910_rtc_read_u8(&rtc_data[0], TPS65910_REG_ALARM_SECONDS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_read_u8(&rtc_data[1], TPS65910_REG_ALARM_MINUTES);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_read_u8(&rtc_data[2], TPS65910_REG_ALARM_HOURS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_read_u8(&rtc_data[3], TPS65910_REG_ALARM_DAYS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_read_u8(&rtc_data[4], TPS65910_REG_ALARM_MONTHS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_read_u8(&rtc_data[5], TPS65910_REG_ALARM_YEARS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_read_time error %d\n", ret);
++		return ret;
++	}
++
++	/* some of these fields may be wildcard/"match all" */
++	alm->time.tm_sec = bcd2bin(rtc_data[0]);
++	alm->time.tm_min = bcd2bin(rtc_data[1]);
++	alm->time.tm_hour = bcd2bin(rtc_data[2]);
++	alm->time.tm_mday = bcd2bin(rtc_data[3]);
++	alm->time.tm_mon = bcd2bin(rtc_data[4]) - 1;
++	alm->time.tm_year = bcd2bin(rtc_data[5]) + 100;
++
++	/* report cached alarm enable state */
++	if (rtc_irq_bits & BIT_RTC_INTERRUPTS_REG_IT_ALARM_M)
++		alm->enabled = 1;
++
++	return ret;
++}
++
++static int tps65910_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
++{
++	unsigned char alarm_data[ALL_TIME_REGS + 1];
++	int ret;
++
++	ret = tps65910_rtc_alarm_irq_enable(dev, 0);
++	if (ret)
++		goto out;
++
++	alarm_data[1] = bin2bcd(alm->time.tm_sec);
++	alarm_data[2] = bin2bcd(alm->time.tm_min);
++	alarm_data[3] = bin2bcd(alm->time.tm_hour);
++	alarm_data[4] = bin2bcd(alm->time.tm_mday);
++	alarm_data[5] = bin2bcd(alm->time.tm_mon + 1);
++	alarm_data[6] = bin2bcd(alm->time.tm_year - 100);
++
++	/* update all the alarm registers in one shot */
++	ret = tps65910_rtc_write_u8(alarm_data[1], TPS65910_REG_ALARM_SECONDS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_write_u8(alarm_data[2], TPS65910_REG_ALARM_MINUTES);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_write_u8(alarm_data[3], TPS65910_REG_ALARM_HOURS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_write_u8(alarm_data[4], TPS65910_REG_ALARM_DAYS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_write_u8(alarm_data[5], TPS65910_REG_ALARM_MONTHS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++	ret = tps65910_rtc_write_u8(alarm_data[6], TPS65910_REG_ALARM_YEARS);
++	if (ret < 0) {
++		dev_err(dev, "rtc_write_time error %d\n", ret);
++		return ret;
++	}
++
++	if (alm->enabled)
++		ret = tps65910_rtc_alarm_irq_enable(dev, 1);
++out:
++	return ret;
++}
++
++
++struct work_struct rtc_wq;
++unsigned long rtc_events;
++struct rtc_device *global_rtc;
++
++void  rtc_work(void  *data)
++{
++
++	int res;
++	u8 rd_reg;
++	unsigned long events = 0;
++
++	res = tps65910_rtc_read_u8(&rd_reg, TPS65910_REG_INT_STS);
++
++	if (res < 0)
++		goto out;
++	/*
++	 * Figure out source of interrupt: ALARM or TIMER in RTC_STATUS_REG.
++	 * only one (ALARM or RTC) interrupt source may be enabled
++	 * at time, we also could check our results
++	 * by reading RTS_INTERRUPTS_REGISTER[IT_TIMER,IT_ALARM]
++	 */
++	if (rd_reg & TPS65910_RTC_ALARM_IT) {
++		res = tps65910_rtc_write_u8(rd_reg | TPS65910_RTC_ALARM_IT,
++				TPS65910_REG_INT_STS);
++		if (res < 0)
++			goto out;
++
++		/*Dummy read -- mandatory for status register*/
++		res = tps65910_rtc_read_u8(&rd_reg, TPS65910_REG_RTC_STATUS);
++		mdelay(100);
++		res = tps65910_rtc_read_u8(&rd_reg, TPS65910_REG_RTC_STATUS);
++		res = tps65910_rtc_write_u8(rd_reg, TPS65910_REG_RTC_STATUS);
++
++		rtc_events |= RTC_IRQF | RTC_AF;
++	} else if (rd_reg & TPS65910_RTC_PERIOD_IT) {
++		res = tps65910_rtc_write_u8(rd_reg | TPS65910_RTC_PERIOD_IT,
++				TPS65910_REG_INT_STS);
++		if (res < 0)
++			goto out;
++
++		/*Dummy read -- mandatory for status register*/
++		res = tps65910_rtc_read_u8(&rd_reg, TPS65910_REG_RTC_STATUS);
++		mdelay(100);
++		res = tps65910_rtc_read_u8(&rd_reg, TPS65910_REG_RTC_STATUS);
++		rd_reg &= 0xC3;
++		res = tps65910_rtc_write_u8(rd_reg, TPS65910_REG_RTC_STATUS);
++		rtc_events |= RTC_IRQF | RTC_UF;
++	}
++out:
++	/* Notify RTC core on event */
++	events = rtc_events;
++	rtc_update_irq(global_rtc, 1, events);
++}
++
++static struct rtc_class_ops tps65910_rtc_ops = {
++	.read_time	= tps65910_rtc_read_time,
++	.set_time	= tps65910_rtc_set_time,
++	.read_alarm	= tps65910_rtc_read_alarm,
++	.set_alarm	= tps65910_rtc_set_alarm,
++	.alarm_irq_enable = tps65910_rtc_alarm_irq_enable,
++	.update_irq_enable = tps65910_rtc_update_irq_enable,
++	.irq_set_freq	= tps65910_rtc_irq_set_freq,
++};
++
++static int __devinit tps65910_rtc_probe(struct platform_device *pdev)
++{
++	struct rtc_device *rtc;
++	int ret = 0;
++	u8 rd_reg;
++
++	rtc = rtc_device_register(pdev->name,
++			&pdev->dev, &tps65910_rtc_ops, THIS_MODULE);
++
++	if (IS_ERR(rtc)) {
++		ret = PTR_ERR(rtc);
++		dev_err(&pdev->dev, "can't register TPS65910 RTC device,\
++					 err %ld\n", PTR_ERR(rtc));
++		goto out0;
++
++	}
++	printk(KERN_INFO "TPS65910 RTC device successfully registered\n");
++
++	platform_set_drvdata(pdev, rtc);
++
++	/* Take rtc out of reset */
++	tps65910_rtc_read_u8(&rd_reg, TPS65910_REG_DEVCTRL);
++	rd_reg &= ~BIT_RTC_PWDN;
++	ret = tps65910_rtc_write_u8(rd_reg, TPS65910_REG_DEVCTRL);
++
++	/* Dummy read to ensure that the register gets updated.
++	 * Please refer tps65910 TRM table:25 for details
++	 */
++	tps65910_rtc_read_u8(&rd_reg, TPS65910_REG_RTC_STATUS);
++
++	ret = tps65910_rtc_read_u8(&rd_reg, TPS65910_REG_RTC_STATUS);
++	if (ret < 0) {
++		printk(KERN_ERR "TPS65910 RTC STATUS REG READ FAILED\n");
++		goto out1;
++	}
++
++	if (rd_reg & BIT_RTC_STATUS_REG_POWER_UP_M)
++		dev_warn(&pdev->dev, "Power up reset detected.\n");
++
++	if (rd_reg & BIT_RTC_STATUS_REG_ALARM_M)
++		dev_warn(&pdev->dev, "Pending Alarm interrupt detected.\n");
++
++	/* Clear RTC Power up reset and pending alarm interrupts */
++	ret = tps65910_rtc_write_u8(rd_reg, TPS65910_REG_RTC_STATUS);
++	if (ret < 0)
++		goto out1;
++	ret = tps65910_rtc_read_u8(&rd_reg, TPS65910_REG_INT_STS);
++	if (ret < 0) {
++		printk(KERN_ERR "TPS65910 RTC STATUS REG READ FAILED\n");
++		goto out1;
++	}
++
++	if (rd_reg & 0x40) {
++		printk(KERN_INFO "pending alarm interrupt!!! clearing!!!");
++		tps65910_rtc_write_u8(rd_reg, TPS65910_REG_INT_STS);
++	}
++
++	global_rtc = rtc;
++
++	/* Link RTC IRQ handler to TPS65910 Core */
++	tps65910_add_irq_work(TPS65910_RTC_ALARM_IRQ, rtc_work);
++	tps65910_add_irq_work(TPS65910_RTC_PERIOD_IRQ, rtc_work);
++
++	/* Check RTC module status, Enable if it is off */
++	ret = tps65910_rtc_read_u8(&rd_reg, TPS65910_REG_RTC_CTRL);
++	if (ret < 0)
++		goto out1;
++
++	if (!(rd_reg & BIT_RTC_CTRL_REG_STOP_RTC_M)) {
++		dev_info(&pdev->dev, "Enabling TPS65910-RTC.\n");
++		rd_reg |= BIT_RTC_CTRL_REG_STOP_RTC_M;
++		ret = tps65910_rtc_write_u8(rd_reg, TPS65910_REG_RTC_CTRL);
++		if (ret < 0)
++			goto out1;
++	}
++
++	/* init cached IRQ enable bits */
++	ret = tps65910_rtc_read_u8(&rtc_irq_bits, TPS65910_REG_RTC_INTERRUPTS);
++	if (ret < 0)
++		goto out1;
++
++	tps65910_rtc_write_u8(0x3F, TPS65910_REG_INT_MSK);
++	return ret;
++
++out1:
++	rtc_device_unregister(rtc);
++out0:
++	return ret;
++}
++
++/*
++ * Disable all TPS65910 RTC module interrupts.
++ * Sets status flag to free.
++ */
++static int __devexit tps65910_rtc_remove(struct platform_device *pdev)
++{
++	/* leave rtc running, but disable irqs */
++	struct rtc_device *rtc = platform_get_drvdata(pdev);
++	int irq = platform_get_irq(pdev, 0);
++
++	mask_rtc_irq_bit(BIT_RTC_INTERRUPTS_REG_IT_ALARM_M);
++	mask_rtc_irq_bit(BIT_RTC_INTERRUPTS_REG_IT_TIMER_M);
++
++
++	free_irq(irq, rtc);
++
++	rtc_device_unregister(rtc);
++	platform_set_drvdata(pdev, NULL);
++	return 0;
++}
++
++static void tps65910_rtc_shutdown(struct platform_device *pdev)
++{
++	/* mask timer interrupts, but leave alarm interrupts on to enable
++	 * power-on when alarm is triggered
++	 */
++	mask_rtc_irq_bit(BIT_RTC_INTERRUPTS_REG_IT_TIMER_M);
++}
++
++#ifdef CONFIG_PM
++
++static unsigned char irqstat;
++
++	static
++int tps65910_rtc_suspend(struct platform_device *pdev, pm_message_t state)
++{
++	irqstat = rtc_irq_bits;
++	mask_rtc_irq_bit(BIT_RTC_INTERRUPTS_REG_IT_TIMER_M);
++	return 0;
++}
++
++static int tps65910_rtc_resume(struct platform_device *pdev)
++{
++	set_rtc_irq_bit(irqstat);
++	return 0;
++}
++
++#else
++#define tps65910_rtc_suspend NULL
++#define tps65910_rtc_resume  NULL
++#endif
++
++
++static struct platform_driver tps65910rtc_driver = {
++	.probe		= tps65910_rtc_probe,
++	.remove		= __devexit_p(tps65910_rtc_remove),
++	.shutdown	= tps65910_rtc_shutdown,
++	.suspend	= tps65910_rtc_suspend,
++	.resume		= tps65910_rtc_resume,
++	.driver		= {
++		.owner	= THIS_MODULE,
++		.name	= "tps65910_rtc",
++	},
++};
++static int __init tps65910_rtc_init(void)
++{
++	return platform_driver_register(&tps65910rtc_driver);
++}
++module_init(tps65910_rtc_init);
++
++static void __exit tps65910_rtc_exit(void)
++{
++	platform_driver_unregister(&tps65910rtc_driver);
++}
++module_exit(tps65910_rtc_exit);
++
++MODULE_ALIAS("platform:tps65910_rtc");
++MODULE_AUTHOR("Umesh K  <umeshk@mistralsolutions.com");
++MODULE_LICENSE("GPL");
+diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
+index c80105b..1d9cf0c 100644
+--- a/drivers/usb/host/ehci-hub.c
++++ b/drivers/usb/host/ehci-hub.c
+@@ -468,7 +468,8 @@ static int check_reset_complete (
+ 			index + 1);
+
+ 		// what happens if HCS_N_CC(params) == 0 ?
+-#if !defined(CONFIG_MACH_OMAP3EVM) && !defined(CONFIG_MACH_OMAP3517EVM)
++#if !defined(CONFIG_MACH_OMAP3EVM) && !defined(CONFIG_MACH_OMAP3517EVM) && \
++    !defined(CONFIG_MACH_CRANEBOARD)
+ 		port_status |= PORT_OWNER;
+ #endif
+ 		port_status &= ~PORT_RWC_BITS;
+@@ -927,7 +928,8 @@ static int ehci_hub_control (
+ 				ehci_dbg (ehci,
+ 					"port %d low speed --> companion\n",
+ 					wIndex + 1);
+-#if !defined(CONFIG_MACH_OMAP3EVM) && !defined(CONFIG_MACH_OMAP3517EVM)
++#if !defined(CONFIG_MACH_OMAP3EVM) && !defined(CONFIG_MACH_OMAP3517EVM) && \
++    !defined(CONFIG_MACH_CRANEBOARD)
+ 				temp |= PORT_OWNER;
+ #endif
+ 			} else {
+@@ -978,7 +980,8 @@ error_exit:
+
+ static void ehci_relinquish_port(struct usb_hcd *hcd, int portnum)
+ {
+-#if !defined(CONFIG_MACH_OMAP3EVM) && !defined(CONFIG_MACH_OMAP3517EVM)
++#if !defined(CONFIG_MACH_OMAP3EVM) && !defined(CONFIG_MACH_OMAP3517EVM) && \
++    !defined(CONFIG_MACH_CRANEBOARD)
+ 	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
+
+ 	if (ehci_is_TDI(ehci))
+diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
+index dd1edfd..5ac688d 100644
+--- a/drivers/usb/musb/Kconfig
++++ b/drivers/usb/musb/Kconfig
+@@ -10,7 +10,7 @@ comment "Enable Host or Gadget support to see Inventra options"
+ config USB_MUSB_HDRC
+ 	depends on (USB || USB_GADGET)
+ 	depends on (ARM || (BF54x && !BF544) || (BF52x && !BF522 && !BF523))
+-	select NOP_USB_XCEIV if (ARCH_DAVINCI || MACH_OMAP3EVM || BLACKFIN || MACH_OMAP3517EVM)
++	select NOP_USB_XCEIV if (ARCH_DAVINCI || MACH_OMAP3EVM || BLACKFIN || MACH_OMAP3517EVM || MACH_CRANEBOARD)
+ 	select TWL4030_USB if MACH_OMAP_3430SDP
+ 	select USB_OTG_UTILS
+ 	tristate 'Inventra Highspeed Dual Role Controller (TI, ADI, ...)'
+@@ -152,7 +152,7 @@ config MUSB_PIO_ONLY
+
+ config USB_INVENTRA_DMA
+ 	bool
+-	depends on USB_MUSB_HDRC && !MUSB_PIO_ONLY && !MACH_OMAP3517EVM
++	depends on USB_MUSB_HDRC && !MUSB_PIO_ONLY && !MACH_OMAP3517EVM && !MACH_CRANEBOARD
+ 	default ARCH_OMAP2430 || ARCH_OMAP34XX || BLACKFIN
+ 	help
+ 	  Enable DMA transfers using Mentor's engine.
+@@ -182,7 +182,7 @@ config USB_TI_CPPI_DMA
+ config USB_TI_CPPI41_DMA
+ 	bool
+ 	depends on USB_MUSB_HDRC && !MUSB_PIO_ONLY
+-	default ARCH_DAVINCI_DA830 || MACH_OMAP3517EVM
++	default ARCH_DAVINCI_DA830 || MACH_OMAP3517EVM || MACH_CRANEBOARD
+ 	select CPPI41
+ 	help
+ 	 Enable DMA transfers when TI CPPI 4.1 DMA is available.
+diff --git a/drivers/usb/musb/Makefile b/drivers/usb/musb/Makefile
+index 01de383..daf3415 100644
+--- a/drivers/usb/musb/Makefile
++++ b/drivers/usb/musb/Makefile
+@@ -19,7 +19,8 @@ ifeq ($(CONFIG_ARCH_OMAP2430),y)
+ endif
+
+ ifeq ($(CONFIG_ARCH_OMAP3430),y)
+-   ifeq ($(CONFIG_MACH_OMAP3517EVM),y)
++
++   ifeq ($(CONFIG_MACH_CRANEBOARD),y)
+ 	musb_hdrc-objs  += am3517.o
+    else
+ 	musb_hdrc-objs	+= omap2430.o
+diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
+index 98874c5..71ec7e8 100644
+--- a/drivers/usb/musb/musb_core.c
++++ b/drivers/usb/musb/musb_core.c
+@@ -1019,7 +1019,7 @@ static void musb_shutdown(struct platform_device *pdev)
+  */
+ #if defined(CONFIG_USB_TUSB6010) || \
+ 	defined(CONFIG_ARCH_OMAP2430) || defined(CONFIG_ARCH_OMAP34XX) || \
+-	defined(CONFIG_MACH_OMAP3517EVM)
++	defined(CONFIG_MACH_OMAP3517EVM) ||  defined(CONFIG_MACH_CRANEBOARD)
+ static ushort __initdata fifo_mode = 4;
+ #else
+ static ushort __initdata fifo_mode = 2;
+diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
+index 0b19d0b..d7850c7 100644
+--- a/drivers/usb/musb/musb_core.h
++++ b/drivers/usb/musb/musb_core.h
+@@ -380,7 +380,7 @@ struct musb {
+ 	void __iomem		*sync_va;
+ #endif
+
+-#ifdef CONFIG_MACH_OMAP3517EVM
++#if defined(CONFIG_MACH_OMAP3517EVM) || defined(CONFIG_MACH_CRANEBOARD)
+ /* Backup registers required for the workaround of AM3517 bytewise
+  * read issue. FADDR, POWER, INTRTXE, INTRRXE and INTRUSBE register
+  * read would actually clear the interrupt registers and would cause
+diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
+index c0e2efc..bb93de7 100644
+--- a/drivers/usb/musb/musb_gadget.c
++++ b/drivers/usb/musb/musb_gadget.c
+@@ -2024,7 +2024,7 @@ __acquires(musb->lock)
+
+
+ 	/* what speed did we negotiate? */
+-#ifdef CONFIG_MACH_OMAP3517EVM
++#if defined(CONFIG_MACH_OMAP3517EVM) || defined(CONFIG_MACH_CRANEBOARD)
+ 	musb->read_mask &= ~AM3517_READ_ISSUE_POWER;
+ #endif
+ 	power = musb_readb(mbase, MUSB_POWER);
+diff --git a/drivers/usb/musb/musb_gadget_ep0.c b/drivers/usb/musb/musb_gadget_ep0.c
+index 7a9dc1e..bcc754d 100644
+--- a/drivers/usb/musb/musb_gadget_ep0.c
++++ b/drivers/usb/musb/musb_gadget_ep0.c
+@@ -770,7 +770,7 @@ setup:
+ 				printk(KERN_NOTICE "%s: peripheral reset "
+ 						"irq lost!\n",
+ 						musb_driver_name);
+-#ifdef CONFIG_MACH_OMAP3517EVM
++#if defined(CONFIG_MACH_OMAP3517EVM) || defined(CONFIG_MACH_CRANEBOARD)
+ 				musb->read_mask &= ~AM3517_READ_ISSUE_POWER;
+ #endif
+ 				power = musb_readb(mbase, MUSB_POWER);
+diff --git a/drivers/usb/musb/musb_io.h b/drivers/usb/musb/musb_io.h
+index 0969d88..e578061 100644
+--- a/drivers/usb/musb/musb_io.h
++++ b/drivers/usb/musb/musb_io.h
+@@ -56,7 +56,8 @@ static inline void writesb(const void __iomem *addr, const void *buf, int len)
+
+ #endif
+
+-#if !defined(CONFIG_BLACKFIN) && !defined(CONFIG_MACH_OMAP3517EVM)
++#if !defined(CONFIG_BLACKFIN) && !defined(CONFIG_MACH_OMAP3517EVM) && \
++    !defined(CONFIG_MACH_CRANEBOARD)
+
+ /* NOTE:  these offsets are all in bytes */
+
+@@ -136,7 +137,7 @@ static inline void musb_writew(void __iomem *addr, unsigned offset, u16 data)
+ static inline void musb_writel(void __iomem *addr, unsigned offset, u32 data)
+ 	{ bfin_write16(addr + offset, (u16) data); }
+
+-#elif defined(CONFIG_MACH_OMAP3517EVM)
++#elif (defined(CONFIG_MACH_OMAP3517EVM) || defined(CONFIG_MACH_CRANEBOARD))
+
+ /* AM3517 has a limitation on read operation. Only 32 bit read is
+  * allowed and thus 8bit and 16bit read has to be handled differently
+diff --git a/drivers/usb/musb/musb_virthub.c b/drivers/usb/musb/musb_virthub.c
+index 0200a62..c1570b6 100644
+--- a/drivers/usb/musb/musb_virthub.c
++++ b/drivers/usb/musb/musb_virthub.c
+@@ -68,12 +68,12 @@ static void musb_port_suspend(struct musb *musb, bool do_suspend)
+ 		musb_writeb(mbase, MUSB_POWER, power);
+
+ 		/* Needed for OPT A tests */
+-#ifdef CONFIG_MACH_OMAP3517EVM
++#if defined(CONFIG_MACH_OMAP3517EVM) || defined(CONFIG_MACH_CRANEBOARD)
+ 		musb->read_mask &= ~AM3517_READ_ISSUE_POWER;
+ #endif
+ 		power = musb_readb(mbase, MUSB_POWER);
+ 		while (power & MUSB_POWER_SUSPENDM) {
+-#ifdef CONFIG_MACH_OMAP3517EVM
++#if defined(CONFIG_MACH_OMAP3517EVM) || defined(CONFIG_MACH_CRANEBOARD)
+ 			musb->read_mask &= ~AM3517_READ_ISSUE_POWER;
+ #endif
+ 			power = musb_readb(mbase, MUSB_POWER);
+@@ -135,7 +135,7 @@ static void musb_port_reset(struct musb *musb, bool do_reset)
+ 	/* NOTE:  caller guarantees it will turn off the reset when
+ 	 * the appropriate amount of time has passed
+ 	 */
+-#ifdef CONFIG_MACH_OMAP3517EVM
++#if defined(CONFIG_MACH_OMAP3517EVM) || defined(CONFIG_MACH_CRANEBOARD)
+ 	musb->read_mask &= ~AM3517_READ_ISSUE_POWER;
+ #endif
+ 	power = musb_readb(mbase, MUSB_POWER);
+@@ -171,7 +171,7 @@ static void musb_port_reset(struct musb *musb, bool do_reset)
+
+ 		musb->ignore_disconnect = false;
+
+-#ifdef CONFIG_MACH_OMAP3517EVM
++#if defined(CONFIG_MACH_OMAP3517EVM) || defined(CONFIG_MACH_CRANEBOARD)
+ 		musb->read_mask &= ~AM3517_READ_ISSUE_POWER;
+ #endif
+ 		power = musb_readb(mbase, MUSB_POWER);
+diff --git a/drivers/video/omap2/displays/panel-generic.c b/drivers/video/omap2/displays/panel-generic.c
+index eb48d1a..c069e8f 100644
+--- a/drivers/video/omap2/displays/panel-generic.c
++++ b/drivers/video/omap2/displays/panel-generic.c
+@@ -26,7 +26,7 @@ static struct omap_video_timings generic_panel_timings = {
+ 	/* 640 x 480 @ 60 Hz  Reduced blanking VESA CVT 0.31M3-R */
+ 	.x_res		= 640,
+ 	.y_res		= 480,
+-	.pixel_clock	= 23500,
++	.pixel_clock	= 24000,
+ 	.hfp		= 48,
+ 	.hsw		= 32,
+ 	.hbp		= 80,
+@@ -37,7 +37,8 @@ static struct omap_video_timings generic_panel_timings = {
+
+ static int generic_panel_probe(struct omap_dss_device *dssdev)
+ {
+-	dssdev->panel.config = OMAP_DSS_LCD_TFT;
++	dssdev->panel.config = (OMAP_DSS_LCD_TFT | OMAP_DSS_LCD_IVS |
++				OMAP_DSS_LCD_IHS | OMAP_DSS_LCD_IPC);
+ 	dssdev->panel.timings = generic_panel_timings;
+
+ 	return 0;
+diff --git a/drivers/video/omap2/dss/venc.c b/drivers/video/omap2/dss/venc.c
+index 1127e85..8be116f 100644
+--- a/drivers/video/omap2/dss/venc.c
++++ b/drivers/video/omap2/dss/venc.c
+@@ -292,7 +292,9 @@ static struct {
+ 	void __iomem *base;
+ 	struct mutex venc_lock;
+ 	u32 wss_data;
++#ifndef CONFIG_MACH_CRANEBOARD
+ 	struct regulator *vdda_dac_reg;
++#endif
+ } venc;
+
+ static inline void venc_write_reg(int idx, u32 val)
+@@ -503,13 +505,14 @@ int venc_init(struct platform_device *pdev)
+ 		return -ENOMEM;
+ 	}
+
++#ifndef CONFIG_MACH_CRANEBOARD
+ 	venc.vdda_dac_reg = regulator_get(&pdev->dev, "vdda_dac");
+ 	if (IS_ERR(venc.vdda_dac_reg)) {
+ 		iounmap(venc.base);
+ 		DSSERR("can't get VDDA_DAC regulator\n");
+ 		return PTR_ERR(venc.vdda_dac_reg);
+ 	}
+-
++#endif
+ 	venc_enable_clocks(1);
+
+ 	rev_id = (u8)(venc_read_reg(VENC_REV_ID) & 0xff);
+@@ -523,9 +526,9 @@ int venc_init(struct platform_device *pdev)
+ void venc_exit(void)
+ {
+ 	omap_dss_unregister_driver(&venc_driver);
+-
++#ifndef CONFIG_MACH_CRANEBOARD
+ 	regulator_put(venc.vdda_dac_reg);
+-
++#endif
+ 	iounmap(venc.base);
+ }
+
+@@ -576,8 +579,9 @@ static int venc_power_on(struct omap_dss_device *dssdev)
+ 	dispc_set_digit_size(dssdev->panel.timings.x_res,
+ 			dssdev->panel.timings.y_res/2);
+
++#ifndef CONFIG_MACH_CRANEBOARD
+ 	regulator_enable(venc.vdda_dac_reg);
+-
++#endif
+ 	if (dssdev->platform_enable)
+ 		dssdev->platform_enable(dssdev);
+
+@@ -604,8 +608,9 @@ static void venc_power_off(struct omap_dss_device *dssdev)
+ 	if (dssdev->platform_disable)
+ 		dssdev->platform_disable(dssdev);
+
++#ifndef CONFIG_MACH_CRANEBOARD
+ 	regulator_disable(venc.vdda_dac_reg);
+-
++#endif
+ #ifdef CONFIG_OMAP2_DSS_USE_DSI_PLL
+ 	dsi_pll_uninit();
+ 	dss_clk_disable(DSS_CLK_FCK2);
+diff --git a/include/linux/i2c/tps65910.h b/include/linux/i2c/tps65910.h
+new file mode 100644
+index 0000000..1362de4
+--- /dev/null
++++ b/include/linux/i2c/tps65910.h
+@@ -0,0 +1,278 @@
++/* linux/i2c/tps65910.h
++ *
++ *  TPS65910 Power Management Device Definitions.
++ *
++ * Based on include/linux/i2c/twl.h
++ *
++ * Copyright (C) 2010 Mistral Solutions Pvt Ltd <www.mistralsolutions.com>
++ *
++ * This program is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License as published by the
++ * Free Software Foundation; either version 2 of the License, or (at your
++ * option) any later version.
++ *
++ * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED
++ * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
++ * NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
++ * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
++ * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * You should have received a copy of the  GNU General Public License along
++ * with this program; if not, write  to the Free Software Foundation, Inc.,
++ * 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#ifndef __LINUX_I2C_TPS65910_H
++#define __LINUX_I2C_TPS65910_H
++
++#define TPS65910_NUM_SLAVES	2
++/* I2C Slave Address 7-bit */
++#define	TPS65910_I2C_ID0	0x2D /* general-purpose */
++#define	TPS65910_I2C_ID1	0x12 /* Smart Reflex */
++
++/* TPS65910 to host IRQ */
++#define TPS65910_HOST_IRQ 	INT_34XX_SYS_NIRQ
++
++/* TPS65910 MAX GPIOs */
++#define TPS65910_GPIO_MAX	1
++
++/*
++ * ----------------------------------------------------------------------------
++ * Registers, all 8 bits
++ * ----------------------------------------------------------------------------
++ */
++#define	TPS65910_REG_SECONDS		0x00
++#define TPS65910_REG_MINUTES		0x01
++#define TPS65910_REG_HOURS		0x02
++#define TPS65910_REG_DAYS		0x03
++#define TPS65910_REG_MONTHS		0x04
++#define TPS65910_REG_YEARS		0x05
++#define TPS65910_REG_WEEKS		0x06
++#define TPS65910_REG_ALARM_SECONDS	0x08
++#define TPS65910_REG_ALARM_MINUTES	0x09
++#define TPS65910_REG_ALARM_HOURS	0x0A
++#define TPS65910_REG_ALARM_DAYS		0x0B
++#define TPS65910_REG_ALARM_MONTHS	0x0C
++#define TPS65910_REG_ALARM_YEARS	0x0D
++
++#define TPS65910_REG_RTC_CTRL		0x10
++#define TPS65910_REG_RTC_STATUS		0x11
++#define TPS65910_REG_RTC_INTERRUPTS	0x12
++#define TPS65910_REG_RTC_COMP_LSB	0x13
++#define TPS65910_REG_RTC_COMP_MSB	0x14
++#define TPS65910_REG_RTC_RES_PROG	0x15
++#define TPS65910_REG_RTC_RESET_STATUS	0x16
++#define TPS65910_REG_BCK1		0x17
++#define TPS65910_REG_BCK2		0x18
++#define TPS65910_REG_BCK3		0x19
++#define TPS65910_REG_BCK4		0x1A
++#define TPS65910_REG_BCK5		0x1B
++#define TPS65910_REG_PUADEN		0x1C
++#define TPS65910_REG_REF		0x1D
++#define TPS65910_REG_VRTC		0x1E
++
++#define TPS65910_REG_VIO		0x20
++#define TPS65910_REG_VDD1		0x21
++#define TPS65910_REG_VDD1_OP		0x22
++#define TPS65910_REG_VDD1_SR		0x23
++#define TPS65910_REG_VDD2		0x24
++#define TPS65910_REG_VDD2_OP		0x25
++#define TPS65910_REG_VDD2_SR		0x26
++#define TPS65910_REG_VDD3		0x27
++
++#define TPS65910_REG_VDIG1		0x30
++#define TPS65910_REG_VDIG2		0x31
++#define TPS65910_REG_VAUX1		0x32
++#define TPS65910_REG_VAUX2		0x33
++#define TPS65910_REG_VAUX33		0x34
++#define TPS65910_REG_VMMC		0x35
++#define TPS65910_REG_VPLL		0x36
++#define TPS65910_REG_VDAC		0x37
++#define TPS65910_REG_THERM		0x38
++#define TPS65910_REG_BBCH		0x39
++
++#define TPS65910_REG_DCDCCTRL		0x3E
++#define TPS65910_REG_DEVCTRL		0x3F
++#define TPS65910_REG_DEVCTRL2		0x40
++#define TPS65910_REG_SLEEP_KEEP_LDO_ON	0x41
++#define TPS65910_REG_SLEEP_KEEP_RES_ON	0x42
++#define TPS65910_REG_SLEEP_SET_LDO_OFF	0x43
++#define TPS65910_REG_SLEEP_SET_RES_OFF	0x44
++#define TPS65910_REG_EN1_LDO_ASS	0x45
++#define TPS65910_REG_EN1_SMPS_ASS	0x46
++#define TPS65910_REG_EN2_LDO_ASS	0x47
++#define TPS65910_REG_EN2_SMPS_ASS	0x48
++#define TPS65910_REG_EN3_LDO_ASS	0x49
++#define TPS65910_REG_SPARE		0x4A
++
++#define TPS65910_REG_INT_STS		0x50
++#define TPS65910_REG_INT_MSK		0x51
++#define TPS65910_REG_INT_STS2		0x52
++#define TPS65910_REG_INT_MSK2		0x53
++#define TPS65910_REG_INT_STS3		0x54
++#define TPS65910_REG_INT_MSK3		0x55
++
++#define TPS65910_REG_GPIO0		0x60
++
++#define TPS65910_REG_JTAGVERNUM		0x80
++
++/* TPS65910 GPIO Specific flags */
++#define TPS65910_GPIO_INT_FALLING	0
++#define TPS65910_GPIO_INT_RISING	1
++
++#define TPS65910_DEBOUNCE_91_5_MS	0
++#define TPS65910_DEBOUNCE_150_MS	1
++
++#define TPS65910_GPIO_PUDIS		(1 << 3)
++#define TPS65910_GPIO_CFG_OUTPUT	(1 << 2)
++
++
++
++/* TPS65910 Interrupt events */
++
++/* RTC Driver */
++#define TPS65910_RTC_ALARM_IT		0x80
++#define TPS65910_RTC_PERIOD_IT		0x40
++
++/*Core Driver */
++#define TPS65910_HOT_DIE_IT		0x20
++#define TPS65910_PWRHOLD_IT		0x10
++#define TPS65910_PWRON_LP_IT		0x08
++#define TPS65910_PWRON_IT		0x04
++#define TPS65910_VMBHI_IT		0x02
++#define TPS65910_VMBGCH_IT		0x01
++
++/* GPIO driver */
++#define TPS65910_GPIO_F_IT		0x02
++#define TPS65910_GPIO_R_IT		0x01
++
++
++#define TPS65910_VRTC_OFFMASK		(1<<3)
++
++/* Back-up battery charger control */
++#define TPS65910_BBCHEN			0x01
++
++/* Back-up battery charger voltage */
++#define TPS65910_BBSEL_3P0		0x00
++#define TPS65910_BBSEL_2P52		0x02
++#define TPS65910_BBSEL_3P15		0x04
++#define TPS65910_BBSEL_VBAT		0x06
++
++/* DEVCTRL_REG flags */
++#define TPS65910_RTC_PWDNN		0x40
++#define TPS65910_CK32K_CTRL		0x20
++#define TPS65910_SR_CTL_I2C_SEL 	0x10
++#define TPS65910_DEV_OFF_RST		0x08
++#define TPS65910_DEV_ON			0x04
++#define TPS65910_DEV_SLP		0x02
++#define TPS65910_DEV_OFF		0x01
++
++/* DEVCTRL2_REG flags */
++#define TPS65910_DEV2_TSLOT_LENGTH	0x30
++#define TPS65910_DEV2_SLEEPSIG_POL	0x08
++#define TPS65910_DEV2_PWON_LP_OFF	0x04
++#define TPS65910_DEV2_PWON_LP_RST	0x02
++#define TPS65910_DEV2_IT_POL		0x01
++
++/* TPS65910 SMPS/LDO's */
++#define TPS65910_VIO			0
++#define TPS65910_VDD1			1
++#define TPS65910_VDD2			2
++#define TPS65910_VDD3			3
++/* LDOs */
++#define TPS65910_VDIG1			4
++#define TPS65910_VDIG2			5
++#define TPS65910_VAUX33			6
++#define TPS65910_VMMC			7
++#define TPS65910_VAUX1			8
++#define TPS65910_VAUX2			9
++#define TPS65910_VDAC			10
++#define TPS65910_VPLL			11
++/* Internal LDO */
++#define TPS65910_VRTC			12
++
++/* Number of step-down/up converters available */
++#define TPS65910_NUM_DCDC		4
++
++/* Number of LDO voltage regulators  available */
++#define TPS65910_NUM_LDO		9
++
++/* Number of total regulators available */
++#define TPS65910_NUM_REGULATOR  (TPS65910_NUM_DCDC + TPS65910_NUM_LDO)
++
++
++/* Regulator Supply state */
++#define SUPPLY_STATE_FLAG		0x03
++/* OFF States */
++#define TPS65910_REG_OFF_00		0x00
++#define TPS65910_REG_OFF_10		0x02
++/* OHP - on High Power */
++#define TPS65910_REG_OHP		0x01
++/* OLP - on Low Power */
++#define TPS65910_REG_OLP		0x03
++
++#define TPS65910_MAX_IRQS		10
++#define TPS65910_VMBDCH_IRQ     	0
++#define TPS65910_VMBHI_IRQ      	1
++#define TPS65910_PWRON_IRQ      	2
++#define TPS65910_PWRON_LP_IRQ   	3
++#define TPS65910_PWRHOLD_IRQ    	4
++#define TPS65910_HOTDIE_IRQ     	5
++#define TPS65910_RTC_ALARM_IRQ  	6
++#define TPS65910_RTC_PERIOD_IRQ 	7
++#define TPS65910_GPIO0_R_IRQ    	8
++#define TPS65910_GPIO0_F_IRQ    	9
++
++/* TPS65910 has 1 GPIO  */
++struct tps65910_gpio {
++	u8      debounce;
++	u8      pullup_pulldown;
++	u8 	gpio_config;  /* Input or output */
++	u8 	gpio_val;    /* Output value */
++	int (*gpio_setup)(struct tps65910_gpio *pdata);
++	int (*gpio_taredown)(struct tps65910_gpio *pdata);
++};
++
++struct tps65910_platform_data {
++
++	unsigned irq_num;  /* TPS65910 to Host IRQ Number */
++	struct tps65910_gpio	*gpio;
++
++	/* plaform specific data to be initialised in board file */
++	struct regulator_init_data *vio;
++	struct regulator_init_data *vdd1;
++	struct regulator_init_data *vdd2;
++	struct regulator_init_data *vdd3;
++	struct regulator_init_data *vdig1;
++	struct regulator_init_data *vdig2;
++	struct regulator_init_data *vaux33;
++	struct regulator_init_data *vmmc;
++	struct regulator_init_data *vaux1;
++	struct regulator_init_data *vaux2;
++	struct regulator_init_data *vdac;
++	struct regulator_init_data *vpll;
++
++	void  (*handlers[TPS65910_MAX_IRQS]) (void  *data);
++	/* Configure TP65910 to board specific usage*/
++	int (*board_tps65910_config)(struct tps65910_platform_data *pdata);
++};
++
++int tps65910_enable_bbch(u8 voltage);
++int tps65910_disable_bbch(void);
++
++int tps65910_remove_irq_work(int irq);
++int tps65910_add_irq_work(int irq, void (*handler)(void *data));
++
++int tps65910_i2c_write_u8(u8 slave_addr, u8 val, u8 reg);
++int tps65910_i2c_read_u8(u8 slave_addr, u8 *val, u8 reg);
++
++int tps65910_i2c_write(u8 slave_addr, u8 *value, u8 reg, unsigned num_bytes);
++int tps65910_i2c_read(u8 slave_addr, u8 *value, u8 reg, unsigned num_bytes);
++
++#endif /*  __LINUX_I2C_TPS65910_H */
++
+--
+1.7.1.226.g770c5
+
diff --git a/recipes/linux/linux-omap-psp-2.6.32/am3517-crane/defconfig b/recipes/linux/linux-omap-psp-2.6.32/am3517-crane/defconfig
new file mode 100644
index 0000000..7af351e
--- /dev/null
+++ b/recipes/linux/linux-omap-psp-2.6.32/am3517-crane/defconfig
@@ -0,0 +1,1769 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.32
+# Fri Sep  3 09:45:07 2010
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
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
+CONFIG_BSD_PROCESS_ACCT=y
+# CONFIG_BSD_PROCESS_ACCT_V3 is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TREE_RCU=y
+# CONFIG_TREE_PREEMPT_RCU is not set
+# CONFIG_TINY_RCU is not set
+# CONFIG_RCU_TRACE is not set
+CONFIG_RCU_FANOUT=32
+# CONFIG_RCU_FANOUT_EXACT is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_GROUP_SCHED=y
+CONFIG_FAIR_GROUP_SCHED=y
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=y
+# CONFIG_CGROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EMBEDDED=y
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+CONFIG_KALLSYMS_EXTRA_PASS=y
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
+# Kernel Performance Events And Counters
+#
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_CLK=y
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
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+CONFIG_MODVERSIONS=y
+CONFIG_MODULE_SRCVERSION_ALL=y
+CONFIG_BLOCK=y
+CONFIG_LBDAF=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+CONFIG_IOSCHED_CFQ=y
+# CONFIG_DEFAULT_DEADLINE is not set
+CONFIG_DEFAULT_CFQ=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="cfq"
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
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_DOVE is not set
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
+# CONFIG_ARCH_S5PC1XX is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_DAVINCI is not set
+CONFIG_ARCH_OMAP=y
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_U8500 is not set
+
+#
+# TI OMAP Implementations
+#
+CONFIG_ARCH_OMAP_OTG=y
+# CONFIG_ARCH_OMAP1 is not set
+# CONFIG_ARCH_OMAP2 is not set
+CONFIG_ARCH_OMAP3=y
+# CONFIG_ARCH_OMAP4 is not set
+
+#
+# OMAP Feature Selections
+#
+CONFIG_OMAP_RESET_CLOCKS=y
+CONFIG_OMAP_MUX=y
+# CONFIG_OMAP_MUX_DEBUG is not set
+CONFIG_OMAP_MUX_WARNINGS=y
+CONFIG_OMAP_MCBSP=y
+# CONFIG_OMAP_MBOX_FWK is not set
+# CONFIG_OMAP_MPU_TIMER is not set
+CONFIG_OMAP_32K_TIMER=y
+# CONFIG_OMAP3_L2_AUX_SECURE_SAVE_RESTORE is not set
+CONFIG_OMAP_32K_TIMER_HZ=128
+CONFIG_OMAP_DM_TIMER=y
+# CONFIG_OMAP_LL_DEBUG_UART1 is not set
+# CONFIG_OMAP_LL_DEBUG_UART2 is not set
+CONFIG_OMAP_LL_DEBUG_UART3=y
+# CONFIG_OMAP_LL_DEBUG_NONE is not set
+# CONFIG_OMAP_PM_NONE is not set
+CONFIG_OMAP_PM_NOOP=y
+# CONFIG_OMAP_PM_SRF is not set
+CONFIG_ARCH_OMAP34XX=y
+CONFIG_ARCH_OMAP3430=y
+CONFIG_OMAP_PACKAGE_CBB=y
+
+#
+# OMAP Board Type
+#
+# CONFIG_MACH_OMAP3_BEAGLE is not set
+# CONFIG_MACH_OMAP_LDP is not set
+# CONFIG_MACH_OVERO is not set
+# CONFIG_MACH_OMAP3EVM is not set
+# CONFIG_MACH_OMAP3517EVM is not set
+CONFIG_MACH_CRANEBOARD=y
+# CONFIG_MACH_OMAP3_PANDORA is not set
+# CONFIG_MACH_OMAP3_TOUCHBOOK is not set
+# CONFIG_MACH_OMAP_3430SDP is not set
+# CONFIG_MACH_NOKIA_RX51 is not set
+# CONFIG_MACH_OMAP_ZOOM2 is not set
+# CONFIG_MACH_OMAP_ZOOM3 is not set
+# CONFIG_MACH_CM_T35 is not set
+# CONFIG_MACH_IGEP0020 is not set
+# CONFIG_MACH_OMAP_3630SDP is not set
+# CONFIG_OMAP3_EMU is not set
+# CONFIG_OMAP3_SDRC_AC_TIMING is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=y
+CONFIG_CPU_32v6K=y
+CONFIG_CPU_V7=y
+CONFIG_CPU_32v7=y
+CONFIG_CPU_ABRT_EV7=y
+CONFIG_CPU_PABRT_V7=y
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
+CONFIG_ARM_L1_CACHE_SHIFT=6
+CONFIG_ARM_ERRATA_430973=y
+CONFIG_ARM_ERRATA_458693=y
+CONFIG_ARM_ERRATA_460075=y
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
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=128
+# CONFIG_THUMB2_KERNEL is not set
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
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
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
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
+CONFIG_CMDLINE="root=/dev/nfs nfsroot=192.168.0.1:/home/user/buildroot ip=192.168.0.2:192.168.0.1:192.168.0.1:255.255.255.0:tgt:eth0:off rw console=ttyS2,115200n8"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Power Management
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
+CONFIG_FPE_NWFPE=y
+# CONFIG_FPE_NWFPE_XP is not set
+# CONFIG_FPE_FASTFPE is not set
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
+CONFIG_BINFMT_MISC=y
+
+#
+# Power management options
+#
+CONFIG_PM=y
+CONFIG_PM_DEBUG=y
+# CONFIG_PM_VERBOSE is not set
+CONFIG_CAN_PM_TRACE=y
+CONFIG_PM_SLEEP=y
+CONFIG_SUSPEND=y
+# CONFIG_PM_TEST_SUSPEND is not set
+CONFIG_SUSPEND_FREEZER=y
+# CONFIG_APM_EMULATION is not set
+# CONFIG_PM_RUNTIME is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+# CONFIG_XFRM_USER is not set
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_NET_KEY=y
+# CONFIG_NET_KEY_MIGRATE is not set
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
+# CONFIG_RDS is not set
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
+CONFIG_CAN=y
+CONFIG_CAN_RAW=y
+CONFIG_CAN_BCM=y
+
+#
+# CAN Device Drivers
+#
+CONFIG_CAN_VCAN=y
+CONFIG_CAN_DEV=y
+CONFIG_CAN_CALC_BITTIMING=y
+CONFIG_CAN_TI_HECC=y
+# CONFIG_CAN_SJA1000 is not set
+
+#
+# CAN USB interfaces
+#
+# CONFIG_CAN_EMS_USB is not set
+CONFIG_CAN_DEBUG_DEVICES=y
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+# CONFIG_CFG80211 is not set
+# CONFIG_LIB80211 is not set
+
+#
+# CFG80211 needs to be enabled for MAC80211
+#
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
+# CONFIG_DEVTMPFS is not set
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+# CONFIG_FW_LOADER is not set
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_TESTS is not set
+CONFIG_MTD_CONCAT=y
+CONFIG_MTD_PARTITIONS=y
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
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_OMAP2=y
+# CONFIG_MTD_NAND_OMAP_PREFETCH is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
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
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=16
+CONFIG_BLK_DEV_RAM_SIZE=32768
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
+CONFIG_TI_DAVINCI_EMAC=y
+# CONFIG_DM9000 is not set
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
+# CONFIG_KS8851_MLL is not set
+CONFIG_NETDEV_1000=y
+CONFIG_NETDEV_10000=y
+CONFIG_WLAN=y
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
+CONFIG_USB_USBNET=y
+# CONFIG_USB_NET_AX8817X is not set
+CONFIG_USB_NET_CDCETHER=y
+# CONFIG_USB_NET_CDC_EEM is not set
+CONFIG_USB_NET_DM9601=y
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
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
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
+CONFIG_SERIO_SERPORT=y
+CONFIG_SERIO_LIBPS2=y
+# CONFIG_SERIO_RAW is not set
+# CONFIG_SERIO_ALTERA_PS2 is not set
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
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=32
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DETECT_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
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
+CONFIG_I2C_OMAP=y
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
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+# CONFIG_SPI is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
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
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_TPS65910 is not set
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+
+#
+# AC97 GPIO expanders:
+#
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+CONFIG_OMAP_WATCHDOG=y
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
+CONFIG_TPS65910_CORE=y
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_AB3100_CORE is not set
+# CONFIG_MFD_88PM8607 is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_DEBUG is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_REGULATOR_MAX1586 is not set
+# CONFIG_REGULATOR_TPS65910 is not set
+# CONFIG_REGULATOR_LP3971 is not set
+# CONFIG_REGULATOR_TPS65023 is not set
+# CONFIG_REGULATOR_TPS6507X is not set
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
+# CONFIG_MEDIA_TUNER_CUSTOMISE is not set
+CONFIG_MEDIA_TUNER_SIMPLE=y
+CONFIG_MEDIA_TUNER_TDA8290=y
+CONFIG_MEDIA_TUNER_TDA9887=y
+CONFIG_MEDIA_TUNER_TEA5761=y
+CONFIG_MEDIA_TUNER_TEA5767=y
+CONFIG_MEDIA_TUNER_MT20XX=y
+CONFIG_MEDIA_TUNER_XC2028=y
+CONFIG_MEDIA_TUNER_XC5000=y
+CONFIG_MEDIA_TUNER_MC44S803=y
+CONFIG_VIDEO_V4L2=y
+CONFIG_VIDEO_V4L1=y
+# CONFIG_VIDEO_CAPTURE_DRIVERS is not set
+# CONFIG_RADIO_ADAPTERS is not set
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
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_OMAP_BOOTLOADER_INIT is not set
+CONFIG_OMAP2_VRAM=y
+CONFIG_OMAP2_VRFB=y
+CONFIG_OMAP2_DSS=y
+CONFIG_OMAP2_VRAM_SIZE=4
+# CONFIG_OMAP2_DSS_DEBUG_SUPPORT is not set
+# CONFIG_OMAP2_DSS_RFBI is not set
+CONFIG_OMAP2_DSS_VENC=y
+# CONFIG_OMAP2_VENC_OUT_TYPE_SVIDEO is not set
+CONFIG_OMAP2_VENC_OUT_TYPE_COMPOSITE=y
+# CONFIG_OMAP2_DSS_SDI is not set
+# CONFIG_OMAP2_DSS_DSI is not set
+# CONFIG_OMAP2_DSS_FAKE_VSYNC is not set
+CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=1
+CONFIG_FB_OMAP2=y
+# CONFIG_FB_OMAP2_DEBUG_SUPPORT is not set
+# CONFIG_FB_OMAP2_FORCE_AUTO_UPDATE is not set
+CONFIG_FB_OMAP2_NUM_FBS=1
+
+#
+# OMAP2/3 Display Device Drivers
+#
+CONFIG_PANEL_GENERIC=y
+# CONFIG_PANEL_SHARP_LS037V7DW01 is not set
+# CONFIG_PANEL_SHARP_LQ043T1DG01 is not set
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
+CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
+CONFIG_LOGO_LINUX_CLUT224=y
+# CONFIG_SOUND is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
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
+# CONFIG_HID_TWINHAN is not set
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
+# CONFIG_HID_ZEROPLUS is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DYNAMIC_MINORS is not set
+CONFIG_USB_SUSPEND=y
+CONFIG_USB_OTG=y
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
+# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
+CONFIG_USB_EHCI_TT_NEWSCHED=y
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_ISP1362_HCD is not set
+# CONFIG_USB_OHCI_HCD is not set
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+CONFIG_USB_MUSB_HDRC=y
+CONFIG_USB_MUSB_SOC=y
+
+#
+# OMAP 343x high speed USB support
+#
+# CONFIG_USB_MUSB_HOST is not set
+# CONFIG_USB_MUSB_PERIPHERAL is not set
+CONFIG_USB_MUSB_OTG=y
+CONFIG_USB_GADGET_MUSB_HDRC=y
+CONFIG_USB_MUSB_HDRC_HCD=y
+# CONFIG_MUSB_PIO_ONLY is not set
+# CONFIG_USB_TI_CPPI_DMA is not set
+CONFIG_USB_TI_CPPI41_DMA=y
+CONFIG_USB_MUSB_DEBUG=y
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
+CONFIG_USB_TEST=y
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG is not set
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_AT91 is not set
+# CONFIG_USB_GADGET_ATMEL_USBA is not set
+# CONFIG_USB_GADGET_FSL_USB2 is not set
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
+# CONFIG_USB_GADGET_R8A66597 is not set
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
+CONFIG_USB_GADGET_DUALSPEED=y
+# CONFIG_USB_ZERO is not set
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=y
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_ETH_EEM is not set
+# CONFIG_USB_GADGETFS is not set
+# CONFIG_USB_FILE_STORAGE is not set
+# CONFIG_USB_MASS_STORAGE is not set
+# CONFIG_USB_G_SERIAL is not set
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+# CONFIG_USB_G_MULTI is not set
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_ISP1301_OMAP is not set
+# CONFIG_USB_ULPI is not set
+CONFIG_NOP_USB_XCEIV=y
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
+# CONFIG_MMC_OMAP is not set
+CONFIG_MMC_OMAP_HS=y
+# CONFIG_MMC_AT91 is not set
+# CONFIG_MMC_ATMELMCI is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_NEW_LEDS is not set
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
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+CONFIG_RTC_DRV_TPS65910=y
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+
+#
+# SPI RTC drivers
+#
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
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# TI VLYNQ
+#
+# CONFIG_STAGING is not set
+
+#
+# CBUS support
+#
+# CONFIG_CBUS is not set
+
+#
+# File systems
+#
+CONFIG_FS_JOURNAL_INFO=y
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+CONFIG_QUOTA=y
+# CONFIG_QUOTA_NETLINK_INTERFACE is not set
+CONFIG_PRINT_QUOTA_WARNING=y
+CONFIG_QUOTA_TREE=y
+# CONFIG_QFMT_V1 is not set
+CONFIG_QFMT_V2=y
+CONFIG_QUOTACTL=y
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
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
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+# CONFIG_JFFS2_CMODE_NONE is not set
+CONFIG_JFFS2_CMODE_PRIORITY=y
+# CONFIG_JFFS2_CMODE_SIZE is not set
+# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
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
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+CONFIG_SUNRPC_GSS=y
+CONFIG_RPCSEC_GSS_KRB5=y
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
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=y
+# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
+CONFIG_DETECT_HUNG_TASK=y
+# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
+CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+CONFIG_DEBUG_MUTEXES=y
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+CONFIG_DEBUG_INFO=y
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
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
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+CONFIG_DEBUG_LL=y
+# CONFIG_EARLY_PRINTK is not set
+# CONFIG_DEBUG_ICEDCC is not set
+# CONFIG_OC_ETM is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_DEFAULT_SECURITY_SELINUX is not set
+# CONFIG_DEFAULT_SECURITY_SMACK is not set
+# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
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
+CONFIG_CRYPTO_PCBC=m
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
+CONFIG_CRC_CCITT=y
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+CONFIG_LIBCRC32C=y
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb
index 7d0118d..b7fb6f9 100644
--- a/recipes/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes/linux/linux-omap-psp_2.6.32.bb
@@ -3,7 +3,7 @@ require multi-kernel.inc
 DESCRIPTION = "Linux kernel for OMAP processors"
 KERNEL_IMAGETYPE = "uImage"
 
-COMPATIBLE_MACHINE = "beagleboard|omap3evm|am3517-evm|dm37x-evm|am37x-evm|omap3-touchbook|overo"
+COMPATIBLE_MACHINE = "am3517-crane|beagleboard|omap3evm|am3517-evm|dm37x-evm|am37x-evm|omap3-touchbook|overo"
 
 # This is the v2.6.32_OMAPPSP_03.00.01.06 branch
 SRCREV = "a6bad4464f985fdd3bed72e1b82dcbfc004d7869"
@@ -13,6 +13,7 @@ MACHINE_KERNEL_PR_append = "+gitr${SRCREV}"
 
 SRC_URI = "git://arago-project.org/git/people/sriram/ti-psp-omap.git;protocol=git;branch=master \
            file://0001-Revert-omap3-beagle-Fix-compile-time-errors.patch \
+           file://0001-Craneboard-patch-on-PSP-03.00.01.06.patch \
            file://0002-board-omap3touchbook-make-it-build-against-TI-linux-.patch \
            file://0003-ARM-OMAP-add-support-for-TCT-Zippy-to-Beagle-board-f.patch \
            file://0004-ARM-OMAP-Make-beagle-u-boot-partition-writable.patch \
-- 
1.7.0.4


--------------020304050605000808070609
Content-Type: text/x-patch;
 name="0001-Applied-patch-to-u-boot-for-am3517-crane-board.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Applied-patch-to-u-boot-for-am3517-crane-board.patch"

From ec94ad0a85e36a9b8e1a7925b699ba4f3967f0c0 Mon Sep 17 00:00:00 2001
From: Anil Kumar <anilm@mistralsolutions.com>
Date: Fri, 19 Nov 2010 11:21:17 +0530
Subject: [PATCH] Applied patch to u-boot for am3517-crane board

Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
---
 ...ed-Support-for-AM3517-05-based-Craneboard.patch | 3139 ++++++++++++++++++++
 recipes/u-boot/u-boot_git.bb                       |    9 +-
 2 files changed, 3147 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-git/am3517-crane/0001-Added-Support-for-AM3517-05-based-Craneboard.patch

diff --git a/recipes/u-boot/u-boot-git/am3517-crane/0001-Added-Support-for-AM3517-05-based-Craneboard.patch b/recipes/u-boot/u-boot-git/am3517-crane/0001-Added-Support-for-AM3517-05-based-Craneboard.patch
new file mode 100644
index 0000000..363570a
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/am3517-crane/0001-Added-Support-for-AM3517-05-based-Craneboard.patch
@@ -0,0 +1,3139 @@
+From 5f749dc254b2ad312e3d9e03ec763135f88b56e9 Mon Sep 17 00:00:00 2001
+From: Srinath <srinath@mistralsolutions.com>
+Date: Wed, 10 Nov 2010 14:11:22 +0530
+Subject: [PATCH]  Added Support for AM3517/05 based Craneboard
+
+
+Signed-off-by: Srinath <srinath@mistralsolutions.com>
+---
+ Makefile                            |    4 +-
+ board/ti/am3517crane/Makefile       |   47 +
+ board/ti/am3517crane/am3517crane.c  |  146 +++
+ board/ti/am3517crane/am3517crane.h  |  339 +++++++
+ board/ti/am3517crane/config.mk      |   29 +
+ common/Makefile                     |    1 +
+ common/cmd_readmacid.c              |   51 +
+ cpu/arm_cortexa8/omap3/clock.c      |    4 +-
+ drivers/net/davinci_emac.c          |   10 +-
+ drivers/net/davinci_emac.h          |    3 +-
+ drivers/usb/musb/musb_core.c        |    4 +-
+ drivers/usb/musb/musb_udc.c         |    1 +
+ include/asm-arm/arch-omap3/clocks.h |    2 +-
+ include/asm-arm/arch-omap3/mem.h    |    6 +-
+ include/asm-arm/mach-types.h        | 1829 ++++++++++++++++++++++++++++++++++-
+ include/configs/am3517_crane.h      |  352 +++++++
+ 16 files changed, 2794 insertions(+), 34 deletions(-)
+ create mode 100644 board/ti/am3517crane/Makefile
+ create mode 100644 board/ti/am3517crane/am3517crane.c
+ create mode 100644 board/ti/am3517crane/am3517crane.h
+ create mode 100644 board/ti/am3517crane/config.mk
+ create mode 100644 common/cmd_readmacid.c
+ create mode 100644 include/configs/am3517_crane.h
+
+diff --git a/Makefile b/Makefile
+index 1733d32..1e34872 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3144,7 +3144,6 @@ SMN42_config	:	unconfig
+ #########################################################################
+ ## ARM CORTEX Systems
+ #########################################################################
+-
+ devkit8000_config :	unconfig
+ 	@$(MKCONFIG) $(@:_config=) arm arm_cortexa8 devkit8000 timll omap3
+
+@@ -3157,6 +3156,9 @@ omap3_overo_config :	unconfig
+ omap3_evm_config :	unconfig
+ 	@$(MKCONFIG) $(@:_config=) arm arm_cortexa8 evm ti omap3
+
++am3517_crane_config :	unconfig
++	@$(MKCONFIG) $(@:_config=) arm arm_cortexa8 am3517crane ti omap3
++
+ am3517_evm_config :	unconfig
+ 	@$(MKCONFIG) $(@:_config=) arm arm_cortexa8 am3517evm ti omap3
+
+diff --git a/board/ti/am3517crane/Makefile b/board/ti/am3517crane/Makefile
+new file mode 100644
+index 0000000..021602e
+--- /dev/null
++++ b/board/ti/am3517crane/Makefile
+@@ -0,0 +1,47 @@
++#
++# Author: Srinath.R <srinath@mistralsolutions.com>
++#
++# Based on ti/am3517evm/Makefile
++#
++# Copyright (C) 2010 Mistral Solutions Pvt Ltd
++#
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 2 of the License, or
++# (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++#
++
++include $(TOPDIR)/config.mk
++
++LIB	= $(obj)lib$(BOARD).a
++
++COBJS	:= am3517crane.o
++
++SRCS	:= $(COBJS:.o=.c)
++OBJS	:= $(addprefix $(obj),$(COBJS))
++
++$(LIB):	$(obj).depend $(OBJS)
++	$(AR) $(ARFLAGS) $@ $(OBJS)
++
++clean:
++	rm -f $(OBJS)
++
++distclean:	clean
++	rm -f $(LIB) core *.bak $(obj).depend
++
++#########################################################################
++
++# defines $(obj).depend target
++include $(SRCTREE)/rules.mk
++
++sinclude $(obj).depend
++
+diff --git a/board/ti/am3517crane/am3517crane.c b/board/ti/am3517crane/am3517crane.c
+new file mode 100644
+index 0000000..2f525b6
+--- /dev/null
++++ b/board/ti/am3517crane/am3517crane.c
+@@ -0,0 +1,146 @@
++/*
++ * am3517crane.c - board file for AM3517/05 Craneboard.
++ *
++ * Author: Srinath.R <srinath@mistralsolutions.com>
++ *
++ * Based on ti/am3517evm/am3517evm.c
++ *
++ * Copyright (C) 2010 Mistral Solutions Pvt Ltd
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
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#include <common.h>
++#include <netdev.h>
++#include <asm/io.h>
++#include <asm/arch/mem.h>
++#include <asm/arch/mux.h>
++#include <asm/arch/sys_proto.h>
++#include <asm/arch/emac_defs.h>
++#include <asm/arch/gpio.h>
++#include <i2c.h>
++#include <asm/mach-types.h>
++#include "am3517crane.h"
++
++
++#if defined(CONFIG_DRIVER_TI_EMAC)
++#define AM3517_IP_SW_RESET	0x48002598
++#define CPGMACSS_SW_RST		(1 << 1)
++#define ETHERNET_NRST		34
++#define EMACID_ADDR_LSB 	0x48002380
++#define EMACID_ADDR_MSB 	0x48002384
++#endif
++
++DECLARE_GLOBAL_DATA_PTR;
++
++/*
++ * Routine: board_init
++ * Description: Early hardware init.
++ */
++int board_init(void)
++{
++	gpmc_init(); /* in SRAM or SDRAM, finish GPMC */
++	/* board id for Linux */
++	gd->bd->bi_arch_number = MACH_TYPE_CRANEBOARD;
++	/* boot param addr */
++	gd->bd->bi_boot_params = (OMAP34XX_SDRC_CS0 + 0x100);
++
++	return 0;
++}
++
++/*
++ * Routine: misc_init_r
++ * Description: Init ethernet (done here so udelay works)
++ */
++int misc_init_r(void)
++{
++	u32 ctr;
++	u32 reset;
++
++#ifdef CONFIG_DRIVER_OMAP34XX_I2C
++	i2c_init(CONFIG_SYS_I2C_SPEED, CONFIG_SYS_I2C_SLAVE);
++#endif
++	dieid_num_r();
++#if defined(CONFIG_DRIVER_TI_EMAC)
++	omap_request_gpio(ETHERNET_NRST);
++	omap_set_gpio_direction(ETHERNET_NRST, 0);
++	omap_set_gpio_dataout(ETHERNET_NRST, 0);
++	ctr  = 0;
++	do {
++		udelay(1000);
++		ctr++;
++		} while (ctr < 300);
++	omap_set_gpio_dataout(ETHERNET_NRST, 1);
++	ctr = 0;
++	/* allow the PHY to stabilize and settle down */
++	do {
++		udelay(1000);
++		ctr++;
++		} while (ctr < 300);
++
++	/*ensure that the module is out of reset*/
++	reset = readl(AM3517_IP_SW_RESET);
++	reset &= (~CPGMACSS_SW_RST);
++	writel(reset, AM3517_IP_SW_RESET);
++#endif
++	return 0;
++}
++
++/*
++ * Initializes on-chip ethernet controllers.
++ * to override, implement board_eth_init()
++ */
++int cpu_eth_init(bd_t *bis)
++{
++#if defined(CONFIG_DRIVER_TI_EMAC)
++	char mac_buf_lsb[8];
++	char mac_buf_msb[16];
++	char mac_id[24];
++	const unsigned char separator = ':';
++
++	printf("davinci_emac_initialize\n");
++	davinci_emac_initialize();
++
++	memset(mac_buf_lsb, '\0', sizeof(mac_buf_lsb));
++	memset(mac_buf_msb, '\0', sizeof(mac_buf_msb));
++	memset(mac_id, '\0', sizeof(mac_id));
++
++	sprintf(mac_buf_msb, "%x", readl(EMACID_ADDR_MSB));
++	sprintf(mac_buf_lsb, "%x", readl(EMACID_ADDR_LSB));
++	strcat(mac_buf_msb, mac_buf_lsb);
++	sprintf(mac_id, "%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",
++			mac_buf_msb[0], mac_buf_msb[1], separator,
++			mac_buf_msb[2], mac_buf_msb[3], separator,
++			mac_buf_msb[4], mac_buf_msb[5], separator,
++			mac_buf_msb[6], mac_buf_msb[7], separator,
++			mac_buf_msb[8], mac_buf_msb[9], separator,
++			mac_buf_msb[10], mac_buf_msb[11]);
++
++	printf("EMAC ID %s\n", mac_id);
++	setenv("ethaddr", mac_id);
++#endif
++	return 0;
++}
++
++/*
++ * Routine: set_muxconf_regs
++ * Description: Setting up the configuration Mux registers specific to the
++ *		hardware. Many pins need to be moved from protect to primary
++ *		mode.
++ */
++void set_muxconf_regs(void)
++{
++	MUX_AM3517CRANE();
++}
+diff --git a/board/ti/am3517crane/am3517crane.h b/board/ti/am3517crane/am3517crane.h
+new file mode 100644
+index 0000000..dbe2c34
+--- /dev/null
++++ b/board/ti/am3517crane/am3517crane.h
+@@ -0,0 +1,339 @@
++/*
++ * am3517crane.h - Header file for the AM3517/05 Craneboard.
++ *
++ * Author: Srinath R <srinath@mistralsolutions.com>
++ *
++ * Based on ti/am3517evm/am3517evm.h
++ *
++ * Copyright (C) 2010 Mistral Solutions Pvt Ltd
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
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#ifndef _AM3517CRANE_H_
++#define _AM3517CRANE_H_
++
++const omap3_sysinfo sysinfo = {
++	DDR_DISCRETE,
++	"Craneboard",
++	"NAND",
++};
++
++/*
++ * IEN  - Input Enable
++ * IDIS - Input Disable
++ * PTD  - Pull type Down
++ * PTU  - Pull type Up
++ * DIS  - Pull type selection is inactive
++ * EN   - Pull type selection is active
++ * M0   - Mode 0
++ * The commented string gives the final mux configuration for that pin
++ */
++#define MUX_AM3517CRANE() \
++ /* SDRC */\
++	MUX_VAL(CP(SDRC_D0),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D1),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D2),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D3),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D4),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D5),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D6),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D7),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D8),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D9),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D10),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D11),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D12),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D13),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D14),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D15),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D16),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D17),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D18),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D19),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D20),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D21),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D22),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D23),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D24),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D25),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D26),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D27),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D28),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D29),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D30),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_D31),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_CLK),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_DQS0),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_CKE0),		(M0)) \
++	MUX_VAL(CP(SDRC_DQS1),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_DQS2),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_DQS3),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SDRC_DQS0N),		(IEN  | PTD | EN  | M0)) \
++	MUX_VAL(CP(SDRC_DQS1N),		(IEN  | PTD | EN  | M0)) \
++	MUX_VAL(CP(SDRC_DQS2N),		(IEN  | PTD | EN  | M0)) \
++	MUX_VAL(CP(SDRC_DQS3N),		(IEN  | PTD | EN  | M0)) \
++	MUX_VAL(CP(STRBEN_DLY0),	(IEN  | PTD | EN  | M0)) \
++	MUX_VAL(CP(STRBEN_DLY1),	(IEN  | PTD | EN  | M0)) \
++/* GPMC */\
++	/* GPIO_34 ETHERNET_nRST */ \
++	MUX_VAL(CP(GPMC_A1),		(IDIS | PTU | EN  | M4)) \
++	/* GPIO_35 USB1_HOST_EN */ \
++	MUX_VAL(CP(GPMC_A2),		(IDIS | PTU | EN  | M4)) \
++	/* GPIO_36 USB0_OVER_CURRENT*/ \
++	MUX_VAL(CP(GPMC_A3),		(IDIS | PTU | EN  | M4)) \
++	/* GPIO_37 USB1_OVER_CURRENT */ \
++	MUX_VAL(CP(GPMC_A4),		(IDIS | PTU | EN  | M4)) \
++	/* GPIO_38 USB3320_RESET# */ \
++	MUX_VAL(CP(GPMC_A5),		(IDIS | PTU | EN  | M4)) \
++	MUX_VAL(CP(GPMC_A6),		(M7)) \
++	/* GPIO_40 MMC1_WP */ \
++	MUX_VAL(CP(GPMC_A7),		(IDIS | PTU | EN  | M4)) \
++	/* GPIO_41 MMC1_CD */ \
++	MUX_VAL(CP(GPMC_A8),		(IEN  | PTU | EN  | M4)) \
++	MUX_VAL(CP(GPMC_A9),		(M7)) \
++	MUX_VAL(CP(GPMC_A10),		(M7)) \
++	MUX_VAL(CP(GPMC_D0),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D1),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D2),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D3),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D4),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D5),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D6),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D7),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D8),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D9),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D10),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D11),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D12),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D13),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D14),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_D15),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_NCS0),		(IDIS | PTU | EN  | M0)) \
++	/* GPIO_52 DVI_LCD_PD */ \
++	MUX_VAL(CP(GPMC_NCS1),		(IDIS | PTU | EN  | M4)) \
++	MUX_VAL(CP(GPMC_NCS2),		(M7)) \
++	MUX_VAL(CP(GPMC_NCS3),		(M7)) \
++	MUX_VAL(CP(GPMC_NCS4),		(M7)) \
++	MUX_VAL(CP(GPMC_NCS5),		(M7)) \
++	MUX_VAL(CP(GPMC_NCS6),		(M7)) \
++	MUX_VAL(CP(GPMC_NCS7),		(M7)) \
++	MUX_VAL(CP(GPMC_CLK),		(IDIS | PTU | EN  | M0)) /* TP */ \
++	MUX_VAL(CP(GPMC_NADV_ALE),	(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(GPMC_NOE),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(GPMC_NWE),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(GPMC_NBE0_CLE),	(IDIS | PTU | EN  | M0)) \
++	MUX_VAL(CP(GPMC_NBE1),		(M7)) \
++	MUX_VAL(CP(GPMC_NWP),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(GPMC_WAIT0),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(GPMC_WAIT1),		(M7)) \
++	MUX_VAL(CP(GPMC_WAIT2),		(M7)) \
++	MUX_VAL(CP(GPMC_WAIT3),		(M7)) \
++/* DSS */\
++	MUX_VAL(CP(DSS_PCLK),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_HSYNC),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_VSYNC),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_ACBIAS),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA0),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA1),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA2),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA3),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA4),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA5),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA6),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA7),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA8),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA9),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA10),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA11),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA12),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA13),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA14),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA15),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA16),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA17),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA18),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA19),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA20),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA21),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA22),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(DSS_DATA23),		(IDIS | PTD | DIS | M0)) \
++ /* CCDC */\
++	MUX_VAL(CP(CCDC_PCLK),		(IEN  | PTU | EN  | M0)) \
++	/* CCDC_DATA8 */ \
++	MUX_VAL(CP(CCDC_FIELD),		(IEN  | PTD | DIS | M1)) \
++	MUX_VAL(CP(CCDC_HD),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(CCDC_VD),		(IEN  | PTU | EN  | M0)) \
++	/* CCDC_DATA9 */ \
++	MUX_VAL(CP(CCDC_WEN),		(IEN  | PTD | DIS | M1)) \
++	MUX_VAL(CP(CCDC_DATA0),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(CCDC_DATA1),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(CCDC_DATA2),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(CCDC_DATA3),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(CCDC_DATA4),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(CCDC_DATA5),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(CCDC_DATA6),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(CCDC_DATA7),		(IEN  | PTD | DIS | M0)) \
++ /* RMII */\
++	MUX_VAL(CP(RMII_MDIO_DATA),	(IEN  |  M0)) \
++	MUX_VAL(CP(RMII_MDIO_CLK),	(M0)) \
++	MUX_VAL(CP(RMII_RXD0)	,	(IEN  | PTD | M0)) \
++	MUX_VAL(CP(RMII_RXD1),		(IEN  | PTD | M0)) \
++	MUX_VAL(CP(RMII_CRS_DV),	(IEN  | PTD | M0)) \
++	MUX_VAL(CP(RMII_RXER),		(PTD  | M0)) \
++	MUX_VAL(CP(RMII_TXD0),		(PTD  | M0)) \
++	MUX_VAL(CP(RMII_TXD1),		(PTD  | M0)) \
++	MUX_VAL(CP(RMII_TXEN),		(PTD  | M0)) \
++	MUX_VAL(CP(RMII_50MHZ_CLK),	(IEN  | PTD | EN  | M0)) \
++ /* McBSP2 */\
++	MUX_VAL(CP(MCBSP2_FSX),		(M7)) \
++	MUX_VAL(CP(MCBSP2_CLKX),	(M7)) \
++	MUX_VAL(CP(MCBSP2_DR),		(M7)) \
++	MUX_VAL(CP(MCBSP2_DX),		(M7)) \
++ /* MMC1 */\
++	MUX_VAL(CP(MMC1_CLK),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(MMC1_CMD),		(IEN  | PTU | DIS | M0)) \
++	MUX_VAL(CP(MMC1_DAT0),		(IEN  | PTU | DIS | M0)) \
++	MUX_VAL(CP(MMC1_DAT1),		(IEN  | PTU | DIS | M0)) \
++	MUX_VAL(CP(MMC1_DAT2),		(IEN  | PTU | DIS | M0)) \
++	MUX_VAL(CP(MMC1_DAT3),		(IEN  | PTU | DIS | M0)) \
++	MUX_VAL(CP(MMC1_DAT4),		(IEN  | PTU | DIS | M0)) \
++	MUX_VAL(CP(MMC1_DAT5),		(IEN  | PTU | DIS | M0)) \
++	MUX_VAL(CP(MMC1_DAT6),		(IEN  | PTU | DIS | M0)) \
++	MUX_VAL(CP(MMC1_DAT7),		(IEN  | PTU | DIS | M0)) \
++ /* MMC2 */\
++	MUX_VAL(CP(MMC2_CLK),		(IEN  | PTD | EN  | M0)) \
++	MUX_VAL(CP(MMC2_CMD),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MMC2_DAT0),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MMC2_DAT1),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MMC2_DAT2),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MMC2_DAT3),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MMC2_DAT4),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MMC2_DAT5),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MMC2_DAT6),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MMC2_DAT7),		(IEN  | PTD | DIS | M0)) \
++ /* McBSP3 */\
++	MUX_VAL(CP(MCBSP3_DX),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(MCBSP3_DR),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MCBSP3_CLKX),	(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MCBSP3_FSX),		(IEN  | PTD | DIS | M0)) \
++ /* UART2 */\
++	MUX_VAL(CP(UART2_CTS),		(M7)) \
++	MUX_VAL(CP(UART2_RTS),		(M7)) \
++	MUX_VAL(CP(UART2_TX),		(M7)) \
++	MUX_VAL(CP(UART2_RX),		(M7)) \
++ /* UART1 */\
++	MUX_VAL(CP(UART1_TX),		(M7)) \
++	MUX_VAL(CP(UART1_RTS),		(M7)) \
++	MUX_VAL(CP(UART1_CTS),		(M7)) \
++	MUX_VAL(CP(UART1_RX),		(M7)) \
++	MUX_VAL(CP(MCBSP4_CLKX),	(M7)) \
++	MUX_VAL(CP(MCBSP4_DR),		(M7)) \
++	MUX_VAL(CP(MCBSP4_DX),		(M7)) \
++	MUX_VAL(CP(MCBSP4_FSX),		(M7)) \
++ /* McBSP1 */ \
++	MUX_VAL(CP(MCBSP_CLKS),		(IEN  | PTU | DIS | M0)) \
++	MUX_VAL(CP(MCBSP1_CLKR),	(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MCBSP1_FSR),		(IDIS | PTU | EN  | M0)) \
++	MUX_VAL(CP(MCBSP1_DX),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(MCBSP1_DR),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MCBSP1_FSX),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(MCBSP1_CLKX),	(IEN  | PTD | DIS | M0)) \
++ /* UART3 */\
++	MUX_VAL(CP(UART3_CTS_RCTX),	(IEN  | PTU | DIS | M0)) \
++	MUX_VAL(CP(UART3_RTS_SD),	(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(UART3_RX_IRRX),	(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(UART3_TX_IRTX),	(IDIS | PTD | DIS | M0)) \
++ /* HSUSB */\
++	MUX_VAL(CP(USB0_DRVBUS),	(IEN  | PTD | EN  | M0)) \
++ /* HECC */\
++	MUX_VAL(CP(HECC1_TXD),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(HECC1_RXD),		(IEN  | PTU | EN  | M0)) \
++ /* I2C 1, 2, 3 */\
++	MUX_VAL(CP(I2C1_SCL),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(I2C1_SDA),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(I2C2_SCL),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(I2C2_SDA),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(I2C3_SCL),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(I2C3_SDA),		(IEN  | PTU | EN  | M0)) \
++ /* HDQ */\
++	/* GPIO_170 TP */ \
++	MUX_VAL(CP(HDQ_SIO),		(IEN  | PTU | EN  | M4)) \
++	/* McSPI1 */\
++	/* GPIO_171 TP */ \
++	MUX_VAL(CP(MCSPI1_CLK),		(IEN  | PTU | EN  | M4)) \
++	/* GPIO_172 TP */ \
++	MUX_VAL(CP(MCSPI1_SIMO),	(IEN  | PTU | EN  | M4)) \
++	/* GPIO_173 TP */ \
++	MUX_VAL(CP(MCSPI1_SOMI),	(IEN  | PTU | EN  | M4)) \
++	 /* GPIO_174 TP */ \
++	MUX_VAL(CP(MCSPI1_CS0),		(IEN  | PTU | EN  | M4)) \
++	/* GPIO_175 TP */ \
++	MUX_VAL(CP(MCSPI1_CS1),		(IEN  | PTU | EN  | M4)) \
++	/* GPIO_176 TP*/ \
++	MUX_VAL(CP(MCSPI1_CS2),		(IEN  | PTU | EN  | M4)) \
++	 /* GPIO_176 TP*/ \
++	MUX_VAL(CP(MCSPI1_CS3),		(IEN  | PTD | EN  | M4)) \
++ /* McSPI2 */\
++	MUX_VAL(CP(MCSPI2_CLK),		(M7)) \
++	MUX_VAL(CP(MCSPI2_SIMO),	(M7)) \
++	MUX_VAL(CP(MCSPI2_SOMI),	(M7)) \
++	MUX_VAL(CP(MCSPI2_CS0),		(M7)) \
++	MUX_VAL(CP(MCSPI2_CS1),		(M7)) \
++	MUX_VAL(CP(SYS_NIRQ),		(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(SYS_CLKOUT2),	(IEN  | PTU | EN  | M0)) \
++ /* ETK (ES2 onwards) */\
++	MUX_VAL(CP(ETK_CLK_ES2),	(IEN  | PTU | EN  | M3)) \
++	MUX_VAL(CP(ETK_CTL_ES2),	(IDIS | PTD | DIS | M3)) \
++	MUX_VAL(CP(ETK_D0_ES2),		(IEN  | PTD | DIS | M3)) \
++	MUX_VAL(CP(ETK_D1_ES2),		(IEN  | PTD | DIS | M3)) \
++	MUX_VAL(CP(ETK_D2_ES2),		(IEN  | PTD | EN  | M3)) \
++	MUX_VAL(CP(ETK_D3_ES2),		(IEN  | PTD | DIS | M3)) \
++	MUX_VAL(CP(ETK_D4_ES2),		(IEN  | PTD | DIS | M3)) \
++	MUX_VAL(CP(ETK_D5_ES2),		(IEN  | PTD | DIS | M3)) \
++	MUX_VAL(CP(ETK_D6_ES2),		(IEN  | PTD | DIS | M3)) \
++	MUX_VAL(CP(ETK_D7_ES2),		(IEN  | PTD | DIS | M3)) \
++	MUX_VAL(CP(ETK_D8_ES2),		(IEN  | PTD | DIS | M3)) \
++	MUX_VAL(CP(ETK_D9_ES2),		(IEN  | PTD | DIS | M3)) \
++	MUX_VAL(CP(ETK_D10_ES2),	(M7)) \
++	MUX_VAL(CP(ETK_D11_ES2),	(M7)) \
++	MUX_VAL(CP(ETK_D12_ES2),	(M7)) \
++	MUX_VAL(CP(ETK_D13_ES2),	(M7)) \
++	MUX_VAL(CP(ETK_D14_ES2),	(M7)) \
++	MUX_VAL(CP(ETK_D15_ES2),	(M7)) \
++	MUX_VAL(CP(SYS_32K),		(IEN  | PTD | DIS | M0)) \
++	/* GPIO_1 TPS_SLEEP */ \
++	MUX_VAL(CP(SYS_CLKREQ),		(IEN  | PTD | DIS | M4)) \
++	/* GPIO_30 TO Exp */ \
++	MUX_VAL(CP(SYS_NRESWARM),     	(IEN  | PTU | EN  | M0)) \
++	MUX_VAL(CP(SYS_BOOT1),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SYS_BOOT2),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SYS_BOOT3),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SYS_BOOT4),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SYS_BOOT5),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(SYS_BOOT6),		(IDIS | PTD | DIS | M0)) \
++	MUX_VAL(CP(SYS_BOOT7),		(IEN  | PTD | EN  | M0)) \
++	MUX_VAL(CP(SYS_BOOT8),		(IEN  | PTD | EN  | M0)) \
++	/* GPIO_10 TP */ \
++	MUX_VAL(CP(SYS_CLKOUT1),	(IEN  | PTD | DIS | M4)) \
++ /* JTAG */ \
++	MUX_VAL(CP(JTAG_nTRST),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(JTAG_TCK),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(JTAG_TMS),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(JTAG_TDI),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(JTAG_EMU0),		(IEN  | PTD | DIS | M0)) \
++	MUX_VAL(CP(JTAG_EMU1),		(IEN  | PTD | DIS | M0)) \
++
++#endif /* _AM3517CRANE_H_ */
+diff --git a/board/ti/am3517crane/config.mk b/board/ti/am3517crane/config.mk
+new file mode 100644
+index 0000000..529edb5
+--- /dev/null
++++ b/board/ti/am3517crane/config.mk
+@@ -0,0 +1,29 @@
++#
++# Author: Srinath.R <srinath@mistralsolutions.com>
++#
++# Based on ti/am3517evm/config.mk
++#
++# Copyright (C) 2010 Mistral Solutions Pvt Ltd
++#
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 2 of the License, or
++# (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++#
++# Physical Address:
++# 8000'0000 (bank0)
++# A000/0000 (bank1)
++# Linux-Kernel is expected to be at 8000'8000, entry 8000'8000
++# (mem base + reserved)
++
++# For use with external or internal boots.
++TEXT_BASE = 0x80e80000
+diff --git a/common/Makefile b/common/Makefile
+index 47f6a71..e5a7b7c 100644
+--- a/common/Makefile
++++ b/common/Makefile
+@@ -159,6 +159,7 @@ COBJS-$(CONFIG_LYNXKDI) += lynxkdi.o
+ COBJS-$(CONFIG_MODEM_SUPPORT) += modem.o
+ COBJS-$(CONFIG_UPDATE_TFTP) += update.o
+ COBJS-$(CONFIG_USB_KEYBOARD) += usb_kbd.o
++COBJS-$(CONFIG_DRIVER_TI_EMAC) += cmd_readmacid.o
+
+
+ COBJS	:= $(sort $(COBJS-y))
+diff --git a/common/cmd_readmacid.c b/common/cmd_readmacid.c
+new file mode 100644
+index 0000000..4ebe870
+--- /dev/null
++++ b/common/cmd_readmacid.c
+@@ -0,0 +1,51 @@
++/*
++ * cmd_readmacid.c
++ *
++ * Displays Craneboard's EMAC ID
++ *
++ * Author : Ulaganathan.V  <ulaganathan@mistralsolutions.com>
++ *
++ * Copyright (C) 2010 Mistral Solutions Pvt Ltd  <www.mistralsolutions.com>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ *
++ */
++/*
++ * modification history
++ * --------------------
++ * 23 Aug 2010 - Created
++ *
++ */
++#include <common.h>
++
++#if defined(CONFIG_DRIVER_TI_EMAC)
++/* MAC ID */
++#define EMAC_MACID_ADDR_LSB 0x48002380
++#define EMAC_MACID_ADDR_MSB 0x48002384
++
++int read_mac_id(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
++{
++	run_command("print ethaddr", 0);
++	return 0;
++}
++U_BOOT_CMD(readmacid, 10, 1, read_mac_id, "Display the EMAC ID of the board\n",
++		"\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
++#endif
++
++
++
++
++
+diff --git a/cpu/arm_cortexa8/omap3/clock.c b/cpu/arm_cortexa8/omap3/clock.c
+index 5b90c5f..90d8a57 100644
+--- a/cpu/arm_cortexa8/omap3/clock.c
++++ b/cpu/arm_cortexa8/omap3/clock.c
+@@ -685,7 +685,7 @@ void per_clocks_enable(void)
+ 	sr32(&prcm_base->fclken1_core, 25, 1, 1);
+ 	sr32(&prcm_base->iclken_wkup, 25, 1, 1);
+
+-#ifndef CONFIG_OMAP3_AM3517EVM
++#if  (!defined(CONFIG_OMAP3_AM3517EVM) || !defined(CONFIG_OMAP3_AM3517CRANE))
+ 	sr32(&prcm_base->fclken_iva2, 0, 32, FCK_IVA2_ON);
+ #endif
+
+@@ -697,7 +697,7 @@ void per_clocks_enable(void)
+ 	sr32(&prcm_base->fclken_dss, 0, 32, FCK_DSS_ON);
+ 	sr32(&prcm_base->iclken_dss, 0, 32, ICK_DSS_ON);
+
+-#ifndef CONFIG_OMAP3_AM3517EVM
++#if  (!defined(CONFIG_OMAP3_AM3517EVM) || !defined(CONFIG_OMAP3_AM3517CRANE))
+ 	sr32(&prcm_base->fclken_cam, 0, 32, FCK_CAM_ON);
+ 	sr32(&prcm_base->iclken_cam, 0, 32, ICK_CAM_ON);
+ #endif
+diff --git a/drivers/net/davinci_emac.c b/drivers/net/davinci_emac.c
+index d0ee3a2..3f761ed 100644
+--- a/drivers/net/davinci_emac.c
++++ b/drivers/net/davinci_emac.c
+@@ -301,7 +301,9 @@ static int davinci_eth_open(struct eth_device *dev, bd_t *bis)
+ 	adap_emac->SOFTRESET = 1;
+ 	while (adap_emac->SOFTRESET != 0) {;}
+
+-#if defined(CONFIG_SOC_DM646x) || defined(CONFIG_SOC_DM365) || (CONFIG_OMAP3_AM3517EVM)
++#if (defined(CONFIG_SOC_DM646x) || defined(CONFIG_SOC_DM365) || \
++     defined(CONFIG_OMAP3_AM3517EVM) || defined(CONFIG_OMAP3_AM3517CRANE))
++
+ 	adap_ewrap->SOFTRST = 1;
+ 	while (adap_ewrap->SOFTRST != 0) {;}
+ #else
+@@ -324,7 +326,8 @@ static int davinci_eth_open(struct eth_device *dev, bd_t *bis)
+ 		(davinci_eth_mac_addr[2] << 16) |
+ 		(davinci_eth_mac_addr[1] << 8)  |
+ 		(davinci_eth_mac_addr[0]);
+-#if defined(CONFIG_SOC_DM646x) || defined(CONFIG_SOC_DM365) || (CONFIG_OMAP3_AM3517EVM)
++#if (defined(CONFIG_SOC_DM646x) || defined(CONFIG_SOC_DM365) || \
++     defined(CONFIG_OMAP3_AM3517EVM) || defined(CONFIG_OMAP3_AM3517CRANE))
+ 	adap_emac->MACADDRLO =
+ 		(davinci_eth_mac_addr[5] << 8) |
+ 		(davinci_eth_mac_addr[4]| (1 << 19) | (1 << 20));
+@@ -477,7 +480,8 @@ static void davinci_eth_close(struct eth_device *dev)
+ 	/* Reset EMAC module and disable interrupts in wrapper */
+ 	adap_emac->SOFTRESET = 1;
+
+-#if defined(CONFIG_SOC_DM646x) || defined(CONFIG_SOC_DM365) || (CONFIG_OMAP3_AM3517EVM)
++#if (defined(CONFIG_SOC_DM646x) || defined(CONFIG_SOC_DM365) ||  \
++     defined(CONFIG_OMAP3_AM3517EVM) || defined(CONFIG_OMAP3_AM3517CRANE))
+ 	adap_ewrap->SOFTRST = 1;
+ #else
+ 	adap_ewrap->EWCTL = 0;
+diff --git a/drivers/net/davinci_emac.h b/drivers/net/davinci_emac.h
+index 66f4cdb..d1d19e1 100644
+--- a/drivers/net/davinci_emac.h
++++ b/drivers/net/davinci_emac.h
+@@ -257,7 +257,8 @@ typedef struct  {
+
+ /* EMAC Wrapper Registers Structure */
+ typedef struct  {
+-#if defined(CONFIG_SOC_DM646x) || defined(CONFIG_SOC_DM365) || (CONFIG_OMAP3_AM3517EVM)
++#if (defined(CONFIG_SOC_DM646x) || defined(CONFIG_SOC_DM365) || \
++     defined(CONFIG_OMAP3_AM3517EVM) || defined(CONFIG_OMAP3_AM3517CRANE))
+ 	dv_reg		IDVER;
+ 	dv_reg		SOFTRST;
+ 	dv_reg		EMCTRL;
+diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
+index 99c6c90..094ae0f 100644
+--- a/drivers/usb/musb/musb_core.c
++++ b/drivers/usb/musb/musb_core.c
+@@ -142,7 +142,7 @@ void write_fifo(u8 ep, u32 length, void *fifo_data)
+ void read_fifo(u8 ep, u32 length, void *fifo_data)
+ {
+ 	u8  *data = (u8 *)fifo_data;
+-#ifdef CONFIG_OMAP3_AM3517EVM
++#if (defined(CONFIG_OMAP3_AM3517EVM) || defined(CONFIG_OMAP3_AM3517CRANE))
+ 	int i;
+ 	u32 val;
+ #endif
+@@ -151,7 +151,7 @@ void read_fifo(u8 ep, u32 length, void *fifo_data)
+ 	writeb(ep, &musbr->index);
+
+ 	/* read the data to the fifo */
+-#ifdef CONFIG_OMAP3_AM3517EVM
++#if (defined(CONFIG_OMAP3_AM3517EVM) || defined(CONFIG_OMAP3_AM3517CRANE))
+ 	/* AM3517 FIFO should be read double word wise as bytewise
+ 	 * FIFO read corrupts the FIFO
+ 	 */
+diff --git a/drivers/usb/musb/musb_udc.c b/drivers/usb/musb/musb_udc.c
+index 8244602..746e0b5 100644
+--- a/drivers/usb/musb/musb_udc.c
++++ b/drivers/usb/musb/musb_udc.c
+@@ -62,6 +62,7 @@
+ #elif defined(CONFIG_USB_DAVINCI)
+ #include "davinci.h"
+ #endif
++#include "omap3.h"
+
+ /* Define MUSB_DEBUG for debugging */
+ /* #define MUSB_DEBUG */
+diff --git a/include/asm-arm/arch-omap3/clocks.h b/include/asm-arm/arch-omap3/clocks.h
+index 117965a..cceedd2 100644
+--- a/include/asm-arm/arch-omap3/clocks.h
++++ b/include/asm-arm/arch-omap3/clocks.h
+@@ -31,7 +31,7 @@
+ #define S38_4M		38400000
+
+ #define FCK_IVA2_ON	0x00000001
+-#ifdef CONFIG_OMAP3_AM3517EVM
++#if (defined(CONFIG_OMAP3_AM3517EVM) || defined(CONFIG_OMAP3_AM3517CRANE))
+ #define FCK_CORE1_ON    0x037ffe00
+ #define ICK_CORE1_ON    0x037ffe42
+ #define ICK_CORE2_ON    0x00000000
+diff --git a/include/asm-arm/arch-omap3/mem.h b/include/asm-arm/arch-omap3/mem.h
+index d3a0838..fd14f3f 100644
+--- a/include/asm-arm/arch-omap3/mem.h
++++ b/include/asm-arm/arch-omap3/mem.h
+@@ -186,7 +186,7 @@ enum {
+ #define SMNAND_GPMC_CONFIG6	0x1F0F0A80
+ #define SMNAND_GPMC_CONFIG7	0x00000C44
+
+-#if defined(CONFIG_OMAP3_AM3517EVM)
++#if (defined(CONFIG_OMAP3_AM3517EVM) || defined(CONFIG_OMAP3_AM3517CRANE))
+ #define M_NAND_GPMC_CONFIG1	0x00001800
+ #define M_NAND_GPMC_CONFIG2	0x00080800
+ #define M_NAND_GPMC_CONFIG3	0x00080800
+@@ -194,7 +194,7 @@ enum {
+ #define M_NAND_GPMC_CONFIG5	0x00080808
+ #define M_NAND_GPMC_CONFIG6	0x000003cf
+ #define M_NAND_GPMC_CONFIG7	0x00000848
+-#else	/* CONFIG_OMAP3_AM3517EVM */
++#else	/* CONFIG_OMAP3_AM3517EVM or CONFIG_OMAP3_AM3517CRANE */
+ #define M_NAND_GPMC_CONFIG1	0x00001800
+ #define M_NAND_GPMC_CONFIG2	0x00141400
+ #define M_NAND_GPMC_CONFIG3	0x00141400
+@@ -202,7 +202,7 @@ enum {
+ #define M_NAND_GPMC_CONFIG5	0x010C1414
+ #define M_NAND_GPMC_CONFIG6	0x1f0f0A80
+ #define M_NAND_GPMC_CONFIG7	0x00000C44
+-#endif	/* CONFIG_OMAP3_AM3517EVM */
++#endif	/* CONFIG_OMAP3_AM3517EVM or CONFIG_OMAP3_AM3517CRANE */
+
+ #define STNOR_GPMC_CONFIG1	0x3
+ #define STNOR_GPMC_CONFIG2	0x00151501
+diff --git a/include/asm-arm/mach-types.h b/include/asm-arm/mach-types.h
+index 6c1f5ac..c7d6f66 100644
+--- a/include/asm-arm/mach-types.h
++++ b/include/asm-arm/mach-types.h
+@@ -1,9 +1,6 @@
+ /*
+- * This was automagically generated from mach-types!
++ * This was automagically generated from arch/arm/tools/mach-types!
+  * Do NOT edit
+- *
+- * Last update: Fri Sep 4 22:16:22 2009
+- *
+  */
+
+ #ifndef __ASM_ARM_MACH_TYPE_H
+@@ -1637,7 +1634,7 @@ extern unsigned int __machine_arch_type;
+ #define MACH_TYPE_AML_M8050            1644
+ #define MACH_TYPE_MX35_3DS             1645
+ #define MACH_TYPE_MARS                 1646
+-#define MACH_TYPE_NTOSD_644XA          1647
++#define MACH_TYPE_NEUROS_OSD2          1647
+ #define MACH_TYPE_BADGER               1648
+ #define MACH_TYPE_TRIZEPS4WL           1649
+ #define MACH_TYPE_TRIZEPS5             1650
+@@ -1653,7 +1650,7 @@ extern unsigned int __machine_arch_type;
+ #define MACH_TYPE_ZORAN43XX            1660
+ #define MACH_TYPE_SONIX926             1661
+ #define MACH_TYPE_CELESTIALSEMI        1662
+-#define MACH_TYPE_CC9M2443             1663
++#define MACH_TYPE_CC9M2443JS           1663
+ #define MACH_TYPE_TW5334               1664
+ #define MACH_TYPE_HTCARTEMIS           1665
+ #define MACH_TYPE_NAL_HLITE            1666
+@@ -1801,7 +1798,7 @@ extern unsigned int __machine_arch_type;
+ #define MACH_TYPE_RD88F5181L_GE        1812
+ #define MACH_TYPE_SIFMAIN              1813
+ #define MACH_TYPE_SAM9_L9261           1814
+-#define MACH_TYPE_CC9M2443JS           1815
++#define MACH_TYPE_CC9M2443             1815
+ #define MACH_TYPE_XARIA300             1816
+ #define MACH_TYPE_IT9200               1817
+ #define MACH_TYPE_RD88F5181L_FXO       1818
+@@ -2401,6 +2398,141 @@ extern unsigned int __machine_arch_type;
+ #define MACH_TYPE_MULTIBUS_MASTER      2416
+ #define MACH_TYPE_MULTIBUS_PBK         2417
+ #define MACH_TYPE_TNETV107X            2418
++#define MACH_TYPE_SNAKE                2419
++#define MACH_TYPE_CWMX27               2420
++#define MACH_TYPE_SCH_M480             2421
++#define MACH_TYPE_PLATYPUS             2422
++#define MACH_TYPE_PSS2                 2423
++#define MACH_TYPE_DAVINCI_APM150       2424
++#define MACH_TYPE_STR9100              2425
++#define MACH_TYPE_NET5BIG              2426
++#define MACH_TYPE_SEABED9263           2427
++#define MACH_TYPE_MX51_M2ID            2428
++#define MACH_TYPE_OCTVOCPLUS_EB        2429
++#define MACH_TYPE_KLK_FIREFOX          2430
++#define MACH_TYPE_KLK_WIRMA_MODULE     2431
++#define MACH_TYPE_KLK_WIRMA_MMI        2432
++#define MACH_TYPE_SUPERSONIC           2433
++#define MACH_TYPE_LIBERTY              2434
++#define MACH_TYPE_MH355                2435
++#define MACH_TYPE_PC7802               2436
++#define MACH_TYPE_GNET_SGC             2437
++#define MACH_TYPE_EINSTEIN15           2438
++#define MACH_TYPE_CMPD                 2439
++#define MACH_TYPE_DAVINCI_HASE1        2440
++#define MACH_TYPE_LGEINCITEPHONE       2441
++#define MACH_TYPE_EA313X               2442
++#define MACH_TYPE_FWBD_39064           2443
++#define MACH_TYPE_FWBD_390128          2444
++#define MACH_TYPE_PELCO_MOE            2445
++#define MACH_TYPE_MINIMIX27            2446
++#define MACH_TYPE_OMAP3_THUNDER        2447
++#define MACH_TYPE_PASSIONC             2448
++#define MACH_TYPE_MX27AMATA            2449
++#define MACH_TYPE_BGAT1                2450
++#define MACH_TYPE_BUZZ                 2451
++#define MACH_TYPE_MB9G20               2452
++#define MACH_TYPE_YUSHAN               2453
++#define MACH_TYPE_LIZARD               2454
++#define MACH_TYPE_OMAP3POLYCOM         2455
++#define MACH_TYPE_SMDKV210             2456
++#define MACH_TYPE_BRAVO                2457
++#define MACH_TYPE_SIOGENTOO1           2458
++#define MACH_TYPE_SIOGENTOO2           2459
++#define MACH_TYPE_SM3K                 2460
++#define MACH_TYPE_ACER_TEMPO_F900      2461
++#define MACH_TYPE_SST61VC010_DEV       2462
++#define MACH_TYPE_GLITTERTIND          2463
++#define MACH_TYPE_OMAP_ZOOM3           2464
++#define MACH_TYPE_OMAP_3630SDP         2465
++#define MACH_TYPE_CYBOOK2440           2466
++#define MACH_TYPE_TORINO_S             2467
++#define MACH_TYPE_HAVANA               2468
++#define MACH_TYPE_BEAUMONT_11          2469
++#define MACH_TYPE_VANGUARD             2470
++#define MACH_TYPE_S5PC110_DRACO        2471
++#define MACH_TYPE_CARTESIO_TWO         2472
++#define MACH_TYPE_ASTER                2473
++#define MACH_TYPE_VOGUESV210           2474
++#define MACH_TYPE_ACM500X              2475
++#define MACH_TYPE_KM9260               2476
++#define MACH_TYPE_NIDEFLEXG1           2477
++#define MACH_TYPE_CTERA_PLUG_IO        2478
++#define MACH_TYPE_SMARTQ7              2479
++#define MACH_TYPE_AT91SAM9G10EK2       2480
++#define MACH_TYPE_ASUSP527             2481
++#define MACH_TYPE_AT91SAM9G20MPM2      2482
++#define MACH_TYPE_TOPASA900            2483
++#define MACH_TYPE_ELECTRUM_100         2484
++#define MACH_TYPE_MX51GRB              2485
++#define MACH_TYPE_XEA300               2486
++#define MACH_TYPE_HTCSTARTREK          2487
++#define MACH_TYPE_LIMA                 2488
++#define MACH_TYPE_CSB740               2489
++#define MACH_TYPE_USB_S8815            2490
++#define MACH_TYPE_WATSON_EFM_PLUGIN    2491
++#define MACH_TYPE_MILKYWAY             2492
++#define MACH_TYPE_G4EVM                2493
++#define MACH_TYPE_PICOMOD6             2494
++#define MACH_TYPE_OMAPL138_HAWKBOARD   2495
++#define MACH_TYPE_IP6000               2496
++#define MACH_TYPE_IP6010               2497
++#define MACH_TYPE_UTM400               2498
++#define MACH_TYPE_OMAP3_ZYBEX          2499
++#define MACH_TYPE_WIRELESS_SPACE       2500
++#define MACH_TYPE_SX560                2501
++#define MACH_TYPE_TS41X                2502
++#define MACH_TYPE_ELPHEL10373          2503
++#define MACH_TYPE_RHOBOT               2504
++#define MACH_TYPE_MX51_REFRESH         2505
++#define MACH_TYPE_LS9260               2506
++#define MACH_TYPE_SHANK                2507
++#define MACH_TYPE_QSD8X50_ST1          2508
++#define MACH_TYPE_AT91SAM9M10EKES      2509
++#define MACH_TYPE_HIRAM                2510
++#define MACH_TYPE_PHY3250              2511
++#define MACH_TYPE_EA3250               2512
++#define MACH_TYPE_FDI3250              2513
++#define MACH_TYPE_WHITESTONE           2514
++#define MACH_TYPE_AT91SAM9263NIT       2515
++#define MACH_TYPE_CCMX51               2516
++#define MACH_TYPE_CCMX51JS             2517
++#define MACH_TYPE_CCWMX51              2518
++#define MACH_TYPE_CCWMX51JS            2519
++#define MACH_TYPE_MINI6410             2520
++#define MACH_TYPE_TINY6410             2521
++#define MACH_TYPE_NANO6410             2522
++#define MACH_TYPE_AT572D940HFNLDB      2523
++#define MACH_TYPE_HTCLEO               2524
++#define MACH_TYPE_AVP13                2525
++#define MACH_TYPE_XXSVIDEOD            2526
++#define MACH_TYPE_VPNEXT               2527
++#define MACH_TYPE_SWARCO_ITC3          2528
++#define MACH_TYPE_TX51                 2529
++#define MACH_TYPE_DOLBY_CAT1021        2530
++#define MACH_TYPE_MX28EVK              2531
++#define MACH_TYPE_PHOENIX260           2532
++#define MACH_TYPE_UVACA_STORK          2533
++#define MACH_TYPE_SMARTQ5              2534
++#define MACH_TYPE_ALL3078              2535
++#define MACH_TYPE_CTERA_2BAY_DS        2536
++#define MACH_TYPE_SIOGENTOO3           2537
++#define MACH_TYPE_EPB5000              2538
++#define MACH_TYPE_HY9263               2539
++#define MACH_TYPE_ACER_TEMPO_M900      2540
++#define MACH_TYPE_ACER_TEMPO_DX900     2541
++#define MACH_TYPE_ACER_TEMPO_X960      2542
++#define MACH_TYPE_ACER_ETEN_V900       2543
++#define MACH_TYPE_ACER_ETEN_X900       2544
++#define MACH_TYPE_BONNELL              2545
++#define MACH_TYPE_OHT_MX27             2546
++#define MACH_TYPE_HTCQUARTZ            2547
++#define MACH_TYPE_DAVINCI_DM6467TEVM   2548
++#define MACH_TYPE_C3AX03               2549
++#define MACH_TYPE_MXT_TD60             2550
++#define MACH_TYPE_ESYX                 2551
++#define MACH_TYPE_BULLDOG              2553
++#define MACH_TYPE_CRANEBOARD           2932
+
+ #ifdef CONFIG_ARCH_EBSA110
+ # ifdef machine_arch_type
+@@ -13353,9 +13485,9 @@ extern unsigned int __machine_arch_type;
+ # else
+ #  define machine_arch_type	MACH_TYPE_REA_2D
+ # endif
+-# define machine_is_rea_2d()	(machine_arch_type == MACH_TYPE_REA_2D)
++# define machine_is_rea_cpu2()	(machine_arch_type == MACH_TYPE_REA_2D)
+ #else
+-# define machine_is_rea_2d()	(0)
++# define machine_is_rea_cpu2()	(0)
+ #endif
+
+ #ifdef CONFIG_MACH_TI3E524
+@@ -21866,16 +21998,16 @@ extern unsigned int __machine_arch_type;
+ # define machine_is_mars()	(0)
+ #endif
+
+-#ifdef CONFIG_MACH_NTOSD_644XA
++#ifdef CONFIG_MACH_NEUROS_OSD2
+ # ifdef machine_arch_type
+ #  undef machine_arch_type
+ #  define machine_arch_type	__machine_arch_type
+ # else
+-#  define machine_arch_type	MACH_TYPE_NTOSD_644XA
++#  define machine_arch_type	MACH_TYPE_NEUROS_OSD2
+ # endif
+-# define machine_is_ntosd_644xa()	(machine_arch_type == MACH_TYPE_NTOSD_644XA)
++# define machine_is_neuros_osd2() (machine_arch_type == MACH_TYPE_NEUROS_OSD2)
+ #else
+-# define machine_is_ntosd_644xa()	(0)
++# define machine_is_neuros_osd2()	(0)
+ #endif
+
+ #ifdef CONFIG_MACH_BADGER
+@@ -22058,16 +22190,16 @@ extern unsigned int __machine_arch_type;
+ # define machine_is_celestialsemi()	(0)
+ #endif
+
+-#ifdef CONFIG_MACH_CC9M2443
++#ifdef CONFIG_MACH_CC9M2443JS
+ # ifdef machine_arch_type
+ #  undef machine_arch_type
+ #  define machine_arch_type	__machine_arch_type
+ # else
+-#  define machine_arch_type	MACH_TYPE_CC9M2443
++#  define machine_arch_type	MACH_TYPE_CC9M2443JS
+ # endif
+-# define machine_is_cc9m2443()	(machine_arch_type == MACH_TYPE_CC9M2443)
++# define machine_is_cc9m2443js() (machine_arch_type == MACH_TYPE_CC9M2443JS)
+ #else
+-# define machine_is_cc9m2443()	(0)
++# define machine_is_cc9m2443js()	(0)
+ #endif
+
+ #ifdef CONFIG_MACH_TW5334
+@@ -23834,16 +23966,16 @@ extern unsigned int __machine_arch_type;
+ # define machine_is_sam9_l9261()	(0)
+ #endif
+
+-#ifdef CONFIG_MACH_CC9M2443JS
++#ifdef CONFIG_MACH_CC9M2443
+ # ifdef machine_arch_type
+ #  undef machine_arch_type
+ #  define machine_arch_type	__machine_arch_type
+ # else
+-#  define machine_arch_type	MACH_TYPE_CC9M2443JS
++#  define machine_arch_type	MACH_TYPE_CC9M2443
+ # endif
+-# define machine_is_cc9m2443js()	(machine_arch_type == MACH_TYPE_CC9M2443JS)
++# define machine_is_cc9m2443()	(machine_arch_type == MACH_TYPE_CC9M2443)
+ #else
+-# define machine_is_cc9m2443js()	(0)
++# define machine_is_cc9m2443()	(0)
+ #endif
+
+ #ifdef CONFIG_MACH_XARIA300
+@@ -31034,6 +31166,1661 @@ extern unsigned int __machine_arch_type;
+ # define machine_is_tnetv107x()	(0)
+ #endif
+
++#ifdef CONFIG_MACH_SNAKE
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SNAKE
++# endif
++# define machine_is_snake()	(machine_arch_type == MACH_TYPE_SNAKE)
++#else
++# define machine_is_snake()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CWMX27
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CWMX27
++# endif
++# define machine_is_cwmx27()	(machine_arch_type == MACH_TYPE_CWMX27)
++#else
++# define machine_is_cwmx27()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SCH_M480
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SCH_M480
++# endif
++# define machine_is_sch_m480()	(machine_arch_type == MACH_TYPE_SCH_M480)
++#else
++# define machine_is_sch_m480()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PLATYPUS
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PLATYPUS
++# endif
++# define machine_is_platypus()	(machine_arch_type == MACH_TYPE_PLATYPUS)
++#else
++# define machine_is_platypus()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PSS2
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PSS2
++# endif
++# define machine_is_pss2()	(machine_arch_type == MACH_TYPE_PSS2)
++#else
++# define machine_is_pss2()	(0)
++#endif
++
++#ifdef CONFIG_MACH_DAVINCI_APM150
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_DAVINCI_APM150
++# endif
++# define machine_is_davinci_apm150() \
++			(machine_arch_type == MACH_TYPE_DAVINCI_APM150)
++#else
++# define machine_is_davinci_apm150()	(0)
++#endif
++
++#ifdef CONFIG_MACH_STR9100
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_STR9100
++# endif
++# define machine_is_str9100()	(machine_arch_type == MACH_TYPE_STR9100)
++#else
++# define machine_is_str9100()	(0)
++#endif
++
++#ifdef CONFIG_MACH_NET5BIG
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_NET5BIG
++# endif
++# define machine_is_net5big()	(machine_arch_type == MACH_TYPE_NET5BIG)
++#else
++# define machine_is_net5big()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SEABED9263
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SEABED9263
++# endif
++# define machine_is_seabed9263() (machine_arch_type == MACH_TYPE_SEABED9263)
++#else
++# define machine_is_seabed9263()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MX51_M2ID
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MX51_M2ID
++# endif
++# define machine_is_mx51_m2id()	(machine_arch_type == MACH_TYPE_MX51_M2ID)
++#else
++# define machine_is_mx51_m2id()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OCTVOCPLUS_EB
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OCTVOCPLUS_EB
++# endif
++# define machine_is_octvocplus_eb() \
++				(machine_arch_type == MACH_TYPE_OCTVOCPLUS_EB)
++#else
++# define machine_is_octvocplus_eb()	(0)
++#endif
++
++#ifdef CONFIG_MACH_KLK_FIREFOX
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_KLK_FIREFOX
++# endif
++# define machine_is_klk_firefox() (machine_arch_type == MACH_TYPE_KLK_FIREFOX)
++#else
++# define machine_is_klk_firefox()	(0)
++#endif
++
++#ifdef CONFIG_MACH_KLK_WIRMA_MODULE
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_KLK_WIRMA_MODULE
++# endif
++# define machine_is_klk_wirma_module() \
++			(machine_arch_type == MACH_TYPE_KLK_WIRMA_MODULE)
++#else
++# define machine_is_klk_wirma_module()	(0)
++#endif
++
++#ifdef CONFIG_MACH_KLK_WIRMA_MMI
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_KLK_WIRMA_MMI
++# endif
++# define machine_is_klk_wirma_mmi() \
++				(machine_arch_type == MACH_TYPE_KLK_WIRMA_MMI)
++#else
++# define machine_is_klk_wirma_mmi()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SUPERSONIC
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SUPERSONIC
++# endif
++# define machine_is_supersonic() (machine_arch_type == MACH_TYPE_SUPERSONIC)
++#else
++# define machine_is_supersonic()	(0)
++#endif
++
++#ifdef CONFIG_MACH_LIBERTY
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_LIBERTY
++# endif
++# define machine_is_liberty()	(machine_arch_type == MACH_TYPE_LIBERTY)
++#else
++# define machine_is_liberty()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MH355
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MH355
++# endif
++# define machine_is_mh355()	(machine_arch_type == MACH_TYPE_MH355)
++#else
++# define machine_is_mh355()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PC7802
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PC7802
++# endif
++# define machine_is_pc7802()	(machine_arch_type == MACH_TYPE_PC7802)
++#else
++# define machine_is_pc7802()	(0)
++#endif
++
++#ifdef CONFIG_MACH_GNET_SGC
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_GNET_SGC
++# endif
++# define machine_is_gnet_sgc()	(machine_arch_type == MACH_TYPE_GNET_SGC)
++#else
++# define machine_is_gnet_sgc()	(0)
++#endif
++
++#ifdef CONFIG_MACH_EINSTEIN15
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_EINSTEIN15
++# endif
++# define machine_is_einstein15() (machine_arch_type == MACH_TYPE_EINSTEIN15)
++#else
++# define machine_is_einstein15()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CMPD
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CMPD
++# endif
++# define machine_is_cmpd()	(machine_arch_type == MACH_TYPE_CMPD)
++#else
++# define machine_is_cmpd()	(0)
++#endif
++
++#ifdef CONFIG_MACH_DAVINCI_HASE1
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_DAVINCI_HASE1
++# endif
++# define machine_is_davinci_hase1() \
++			 (machine_arch_type == MACH_TYPE_DAVINCI_HASE1)
++#else
++# define machine_is_davinci_hase1()	(0)
++#endif
++
++#ifdef CONFIG_MACH_LGEINCITEPHONE
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_LGEINCITEPHONE
++# endif
++# define machine_is_lgeincitephone() \
++			(machine_arch_type == MACH_TYPE_LGEINCITEPHONE)
++#else
++# define machine_is_lgeincitephone()	(0)
++#endif
++
++#ifdef CONFIG_MACH_EA313X
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_EA313X
++# endif
++# define machine_is_ea313x()	(machine_arch_type == MACH_TYPE_EA313X)
++#else
++# define machine_is_ea313x()	(0)
++#endif
++
++#ifdef CONFIG_MACH_FWBD_39064
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_FWBD_39064
++# endif
++# define machine_is_fwbd_39064() (machine_arch_type == MACH_TYPE_FWBD_39064)
++#else
++# define machine_is_fwbd_39064()	(0)
++#endif
++
++#ifdef CONFIG_MACH_FWBD_390128
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_FWBD_390128
++# endif
++# define machine_is_fwbd_390128() (machine_arch_type == MACH_TYPE_FWBD_390128)
++#else
++# define machine_is_fwbd_390128()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PELCO_MOE
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PELCO_MOE
++# endif
++# define machine_is_pelco_moe()	(machine_arch_type == MACH_TYPE_PELCO_MOE)
++#else
++# define machine_is_pelco_moe()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MINIMIX27
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MINIMIX27
++# endif
++# define machine_is_minimix27()	(machine_arch_type == MACH_TYPE_MINIMIX27)
++#else
++# define machine_is_minimix27()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OMAP3_THUNDER
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OMAP3_THUNDER
++# endif
++# define machine_is_omap3_thunder() \
++				(machine_arch_type == MACH_TYPE_OMAP3_THUNDER)
++#else
++# define machine_is_omap3_thunder()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PASSIONC
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PASSIONC
++# endif
++# define machine_is_passionc()	(machine_arch_type == MACH_TYPE_PASSIONC)
++#else
++# define machine_is_passionc()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MX27AMATA
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MX27AMATA
++# endif
++# define machine_is_mx27amata()	(machine_arch_type == MACH_TYPE_MX27AMATA)
++#else
++# define machine_is_mx27amata()	(0)
++#endif
++
++#ifdef CONFIG_MACH_BGAT1
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_BGAT1
++# endif
++# define machine_is_bgat1()	(machine_arch_type == MACH_TYPE_BGAT1)
++#else
++# define machine_is_bgat1()	(0)
++#endif
++
++#ifdef CONFIG_MACH_BUZZ
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_BUZZ
++# endif
++# define machine_is_buzz()	(machine_arch_type == MACH_TYPE_BUZZ)
++#else
++# define machine_is_buzz()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MB9G20
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MB9G20
++# endif
++# define machine_is_mb9g20()	(machine_arch_type == MACH_TYPE_MB9G20)
++#else
++# define machine_is_mb9g20()	(0)
++#endif
++
++#ifdef CONFIG_MACH_YUSHAN
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_YUSHAN
++# endif
++# define machine_is_yushan()	(machine_arch_type == MACH_TYPE_YUSHAN)
++#else
++# define machine_is_yushan()	(0)
++#endif
++
++#ifdef CONFIG_MACH_LIZARD
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_LIZARD
++# endif
++# define machine_is_lizard()	(machine_arch_type == MACH_TYPE_LIZARD)
++#else
++# define machine_is_lizard()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OMAP3POLYCOM
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OMAP3POLYCOM
++# endif
++# define machine_is_omap3polycom() \
++				(machine_arch_type == MACH_TYPE_OMAP3POLYCOM)
++#else
++# define machine_is_omap3polycom()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SMDKV210
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SMDKV210
++# endif
++# define machine_is_smdkv210()	(machine_arch_type == MACH_TYPE_SMDKV210)
++#else
++# define machine_is_smdkv210()	(0)
++#endif
++
++#ifdef CONFIG_MACH_BRAVO
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_BRAVO
++# endif
++# define machine_is_bravo()	(machine_arch_type == MACH_TYPE_BRAVO)
++#else
++# define machine_is_bravo()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SIOGENTOO1
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SIOGENTOO1
++# endif
++# define machine_is_siogentoo1() (machine_arch_type == MACH_TYPE_SIOGENTOO1)
++#else
++# define machine_is_siogentoo1()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SIOGENTOO2
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SIOGENTOO2
++# endif
++# define machine_is_siogentoo2() (machine_arch_type == MACH_TYPE_SIOGENTOO2)
++#else
++# define machine_is_siogentoo2()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SM3K
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SM3K
++# endif
++# define machine_is_sm3k()	(machine_arch_type == MACH_TYPE_SM3K)
++#else
++# define machine_is_sm3k()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ACER_TEMPO_F900
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ACER_TEMPO_F900
++# endif
++# define machine_is_acer_tempo_f900() \
++			(machine_arch_type == MACH_TYPE_ACER_TEMPO_F900)
++#else
++# define machine_is_acer_tempo_f900()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SST61VC010_DEV
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SST61VC010_DEV
++# endif
++# define machine_is_sst61vc010_dev() \
++			(machine_arch_type == MACH_TYPE_SST61VC010_DEV)
++#else
++# define machine_is_sst61vc010_dev()	(0)
++#endif
++
++#ifdef CONFIG_MACH_GLITTERTIND
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_GLITTERTIND
++# endif
++# define machine_is_glittertind() (machine_arch_type == MACH_TYPE_GLITTERTIND)
++#else
++# define machine_is_glittertind()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OMAP_ZOOM3
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OMAP_ZOOM3
++# endif
++# define machine_is_omap_zoom3() (machine_arch_type == MACH_TYPE_OMAP_ZOOM3)
++#else
++# define machine_is_omap_zoom3()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OMAP_3630SDP
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OMAP_3630SDP
++# endif
++# define machine_is_omap_3630sdp() \
++			 (machine_arch_type == MACH_TYPE_OMAP_3630SDP)
++#else
++# define machine_is_omap_3630sdp()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CYBOOK2440
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CYBOOK2440
++# endif
++# define machine_is_cybook2440() (machine_arch_type == MACH_TYPE_CYBOOK2440)
++#else
++# define machine_is_cybook2440()	(0)
++#endif
++
++#ifdef CONFIG_MACH_TORINO_S
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_TORINO_S
++# endif
++# define machine_is_torino_s()	(machine_arch_type == MACH_TYPE_TORINO_S)
++#else
++# define machine_is_torino_s()	(0)
++#endif
++
++#ifdef CONFIG_MACH_HAVANA
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_HAVANA
++# endif
++# define machine_is_havana()	(machine_arch_type == MACH_TYPE_HAVANA)
++#else
++# define machine_is_havana()	(0)
++#endif
++
++#ifdef CONFIG_MACH_BEAUMONT_11
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_BEAUMONT_11
++# endif
++# define machine_is_beaumont_11() (machine_arch_type == MACH_TYPE_BEAUMONT_11)
++#else
++# define machine_is_beaumont_11()	(0)
++#endif
++
++#ifdef CONFIG_MACH_VANGUARD
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_VANGUARD
++# endif
++# define machine_is_vanguard()	(machine_arch_type == MACH_TYPE_VANGUARD)
++#else
++# define machine_is_vanguard()	(0)
++#endif
++
++#ifdef CONFIG_MACH_S5PC110_DRACO
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_S5PC110_DRACO
++# endif
++# define machine_is_s5pc110_draco() \
++			(machine_arch_type == MACH_TYPE_S5PC110_DRACO)
++#else
++# define machine_is_s5pc110_draco()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CARTESIO_TWO
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CARTESIO_TWO
++# endif
++# define machine_is_cartesio_two() \
++				(machine_arch_type == MACH_TYPE_CARTESIO_TWO)
++#else
++# define machine_is_cartesio_two()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ASTER
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ASTER
++# endif
++# define machine_is_aster()	(machine_arch_type == MACH_TYPE_ASTER)
++#else
++# define machine_is_aster()	(0)
++#endif
++
++#ifdef CONFIG_MACH_VOGUESV210
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_VOGUESV210
++# endif
++# define machine_is_voguesv210() (machine_arch_type == MACH_TYPE_VOGUESV210)
++#else
++# define machine_is_voguesv210()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ACM500X
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ACM500X
++# endif
++# define machine_is_acm500x()	(machine_arch_type == MACH_TYPE_ACM500X)
++#else
++# define machine_is_acm500x()	(0)
++#endif
++
++#ifdef CONFIG_MACH_KM9260
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_KM9260
++# endif
++# define machine_is_km9260()	(machine_arch_type == MACH_TYPE_KM9260)
++#else
++# define machine_is_km9260()	(0)
++#endif
++
++#ifdef CONFIG_MACH_NIDEFLEXG1
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_NIDEFLEXG1
++# endif
++# define machine_is_nideflexg1() (machine_arch_type == MACH_TYPE_NIDEFLEXG1)
++#else
++# define machine_is_nideflexg1()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CTERA_PLUG_IO
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CTERA_PLUG_IO
++# endif
++# define machine_is_ctera_plug_io() \
++				(machine_arch_type == MACH_TYPE_CTERA_PLUG_IO)
++#else
++# define machine_is_ctera_plug_io()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SMARTQ7
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SMARTQ7
++# endif
++# define machine_is_smartq7()	(machine_arch_type == MACH_TYPE_SMARTQ7)
++#else
++# define machine_is_smartq7()	(0)
++#endif
++
++#ifdef CONFIG_MACH_AT91SAM9G10EK2
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_AT91SAM9G10EK2
++# endif
++# define machine_is_at91sam9g10ek2() \
++			(machine_arch_type == MACH_TYPE_AT91SAM9G10EK2)
++#else
++# define machine_is_at91sam9g10ek2()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ASUSP527
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ASUSP527
++# endif
++# define machine_is_asusp527()	(machine_arch_type == MACH_TYPE_ASUSP527)
++#else
++# define machine_is_asusp527()	(0)
++#endif
++
++#ifdef CONFIG_MACH_AT91SAM9G20MPM2
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_AT91SAM9G20MPM2
++# endif
++# define machine_is_at91sam9g20mpm2() \
++			(machine_arch_type == MACH_TYPE_AT91SAM9G20MPM2)
++#else
++# define machine_is_at91sam9g20mpm2()	(0)
++#endif
++
++#ifdef CONFIG_MACH_TOPASA900
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_TOPASA900
++# endif
++# define machine_is_topasa900()	(machine_arch_type == MACH_TYPE_TOPASA900)
++#else
++# define machine_is_topasa900()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ELECTRUM_100
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ELECTRUM_100
++# endif
++# define machine_is_electrum_100() \
++			(machine_arch_type == MACH_TYPE_ELECTRUM_100)
++#else
++# define machine_is_electrum_100()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MX51GRB
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MX51GRB
++# endif
++# define machine_is_mx51grb()	(machine_arch_type == MACH_TYPE_MX51GRB)
++#else
++# define machine_is_mx51grb()	(0)
++#endif
++
++#ifdef CONFIG_MACH_XEA300
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_XEA300
++# endif
++# define machine_is_xea300()	(machine_arch_type == MACH_TYPE_XEA300)
++#else
++# define machine_is_xea300()	(0)
++#endif
++
++#ifdef CONFIG_MACH_HTCSTARTREK
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_HTCSTARTREK
++# endif
++# define machine_is_htcstartrek() (machine_arch_type == MACH_TYPE_HTCSTARTREK)
++#else
++# define machine_is_htcstartrek()	(0)
++#endif
++
++#ifdef CONFIG_MACH_LIMA
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_LIMA
++# endif
++# define machine_is_lima()	(machine_arch_type == MACH_TYPE_LIMA)
++#else
++# define machine_is_lima()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CSB740
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CSB740
++# endif
++# define machine_is_csb740()	(machine_arch_type == MACH_TYPE_CSB740)
++#else
++# define machine_is_csb740()	(0)
++#endif
++
++#ifdef CONFIG_MACH_USB_S8815
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_USB_S8815
++# endif
++# define machine_is_usb_s8815()	(machine_arch_type == MACH_TYPE_USB_S8815)
++#else
++# define machine_is_usb_s8815()	(0)
++#endif
++
++#ifdef CONFIG_MACH_WATSON_EFM_PLUGIN
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_WATSON_EFM_PLUGIN
++# endif
++# define machine_is_watson_efm_plugin() \
++			(machine_arch_type == MACH_TYPE_WATSON_EFM_PLUGIN)
++#else
++# define machine_is_watson_efm_plugin()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MILKYWAY
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MILKYWAY
++# endif
++# define machine_is_milkyway()	(machine_arch_type == MACH_TYPE_MILKYWAY)
++#else
++# define machine_is_milkyway()	(0)
++#endif
++
++#ifdef CONFIG_MACH_G4EVM
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_G4EVM
++# endif
++# define machine_is_g4evm()	(machine_arch_type == MACH_TYPE_G4EVM)
++#else
++# define machine_is_g4evm()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PICOMOD6
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PICOMOD6
++# endif
++# define machine_is_picomod6()	(machine_arch_type == MACH_TYPE_PICOMOD6)
++#else
++# define machine_is_picomod6()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OMAPL138_HAWKBOARD
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OMAPL138_HAWKBOARD
++# endif
++# define machine_is_omapl138_hawkboard()\
++			(machine_arch_type == MACH_TYPE_OMAPL138_HAWKBOARD)
++#else
++# define machine_is_omapl138_hawkboard()	(0)
++#endif
++
++#ifdef CONFIG_MACH_IP6000
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_IP6000
++# endif
++# define machine_is_ip6000()	(machine_arch_type == MACH_TYPE_IP6000)
++#else
++# define machine_is_ip6000()	(0)
++#endif
++
++#ifdef CONFIG_MACH_IP6010
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_IP6010
++# endif
++# define machine_is_ip6010()	(machine_arch_type == MACH_TYPE_IP6010)
++#else
++# define machine_is_ip6010()	(0)
++#endif
++
++#ifdef CONFIG_MACH_UTM400
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_UTM400
++# endif
++# define machine_is_utm400()	(machine_arch_type == MACH_TYPE_UTM400)
++#else
++# define machine_is_utm400()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OMAP3_ZYBEX
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OMAP3_ZYBEX
++# endif
++# define machine_is_omap3_zybex() (machine_arch_type == MACH_TYPE_OMAP3_ZYBEX)
++#else
++# define machine_is_omap3_zybex()	(0)
++#endif
++
++#ifdef CONFIG_MACH_WIRELESS_SPACE
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_WIRELESS_SPACE
++# endif
++# define machine_is_wireless_space() \
++			(machine_arch_type == MACH_TYPE_WIRELESS_SPACE)
++#else
++# define machine_is_wireless_space()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SX560
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SX560
++# endif
++# define machine_is_sx560()	(machine_arch_type == MACH_TYPE_SX560)
++#else
++# define machine_is_sx560()	(0)
++#endif
++
++#ifdef CONFIG_MACH_TS41X
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_TS41X
++# endif
++# define machine_is_ts41x()	(machine_arch_type == MACH_TYPE_TS41X)
++#else
++# define machine_is_ts41x()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ELPHEL10373
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ELPHEL10373
++# endif
++# define machine_is_elphel10373() (machine_arch_type == MACH_TYPE_ELPHEL10373)
++#else
++# define machine_is_elphel10373()	(0)
++#endif
++
++#ifdef CONFIG_MACH_RHOBOT
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_RHOBOT
++# endif
++# define machine_is_rhobot()	(machine_arch_type == MACH_TYPE_RHOBOT)
++#else
++# define machine_is_rhobot()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MX51_REFRESH
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MX51_REFRESH
++# endif
++# define machine_is_mx51_refresh() \
++			(machine_arch_type == MACH_TYPE_MX51_REFRESH)
++#else
++# define machine_is_mx51_refresh()	(0)
++#endif
++
++#ifdef CONFIG_MACH_LS9260
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_LS9260
++# endif
++# define machine_is_ls9260()	(machine_arch_type == MACH_TYPE_LS9260)
++#else
++# define machine_is_ls9260()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SHANK
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SHANK
++# endif
++# define machine_is_shank()	(machine_arch_type == MACH_TYPE_SHANK)
++#else
++# define machine_is_shank()	(0)
++#endif
++
++#ifdef CONFIG_MACH_QSD8X50_ST1
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_QSD8X50_ST1
++# endif
++# define machine_is_qsd8x50_st1() (machine_arch_type == MACH_TYPE_QSD8X50_ST1)
++#else
++# define machine_is_qsd8x50_st1()	(0)
++#endif
++
++#ifdef CONFIG_MACH_AT91SAM9M10EKES
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_AT91SAM9M10EKES
++# endif
++# define machine_is_at91sam9m10ekes() \
++			(machine_arch_type == MACH_TYPE_AT91SAM9M10EKES)
++#else
++# define machine_is_at91sam9m10ekes()	(0)
++#endif
++
++#ifdef CONFIG_MACH_HIRAM
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_HIRAM
++# endif
++# define machine_is_hiram()	(machine_arch_type == MACH_TYPE_HIRAM)
++#else
++# define machine_is_hiram()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PHY3250
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PHY3250
++# endif
++# define machine_is_phy3250()	(machine_arch_type == MACH_TYPE_PHY3250)
++#else
++# define machine_is_phy3250()	(0)
++#endif
++
++#ifdef CONFIG_MACH_EA3250
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_EA3250
++# endif
++# define machine_is_ea3250()	(machine_arch_type == MACH_TYPE_EA3250)
++#else
++# define machine_is_ea3250()	(0)
++#endif
++
++#ifdef CONFIG_MACH_FDI3250
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_FDI3250
++# endif
++# define machine_is_fdi3250()	(machine_arch_type == MACH_TYPE_FDI3250)
++#else
++# define machine_is_fdi3250()	(0)
++#endif
++
++#ifdef CONFIG_MACH_WHITESTONE
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_WHITESTONE
++# endif
++# define machine_is_whitestone() (machine_arch_type == MACH_TYPE_WHITESTONE)
++#else
++# define machine_is_whitestone()	(0)
++#endif
++
++#ifdef CONFIG_MACH_AT91SAM9263NIT
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_AT91SAM9263NIT
++# endif
++# define machine_is_at91sam9263nit() \
++			(machine_arch_type == MACH_TYPE_AT91SAM9263NIT)
++#else
++# define machine_is_at91sam9263nit()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CCMX51
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CCMX51
++# endif
++# define machine_is_ccmx51()	(machine_arch_type == MACH_TYPE_CCMX51)
++#else
++# define machine_is_ccmx51()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CCMX51JS
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CCMX51JS
++# endif
++# define machine_is_ccmx51js()	(machine_arch_type == MACH_TYPE_CCMX51JS)
++#else
++# define machine_is_ccmx51js()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CCWMX51
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CCWMX51
++# endif
++# define machine_is_ccwmx51()	(machine_arch_type == MACH_TYPE_CCWMX51)
++#else
++# define machine_is_ccwmx51()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CCWMX51JS
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CCWMX51JS
++# endif
++# define machine_is_ccwmx51js()	(machine_arch_type == MACH_TYPE_CCWMX51JS)
++#else
++# define machine_is_ccwmx51js()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MINI6410
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MINI6410
++# endif
++# define machine_is_mini6410()	(machine_arch_type == MACH_TYPE_MINI6410)
++#else
++# define machine_is_mini6410()	(0)
++#endif
++
++#ifdef CONFIG_MACH_TINY6410
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_TINY6410
++# endif
++# define machine_is_tiny6410()	(machine_arch_type == MACH_TYPE_TINY6410)
++#else
++# define machine_is_tiny6410()	(0)
++#endif
++
++#ifdef CONFIG_MACH_NANO6410
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_NANO6410
++# endif
++# define machine_is_nano6410()	(machine_arch_type == MACH_TYPE_NANO6410)
++#else
++# define machine_is_nano6410()	(0)
++#endif
++
++#ifdef CONFIG_MACH_AT572D940HFNLDB
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_AT572D940HFNLDB
++# endif
++# define machine_is_at572d940hfnldb() \
++			(machine_arch_type == MACH_TYPE_AT572D940HFNLDB)
++#else
++# define machine_is_at572d940hfnldb()	(0)
++#endif
++
++#ifdef CONFIG_MACH_HTCLEO
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_HTCLEO
++# endif
++# define machine_is_htcleo()	(machine_arch_type == MACH_TYPE_HTCLEO)
++#else
++# define machine_is_htcleo()	(0)
++#endif
++
++#ifdef CONFIG_MACH_AVP13
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_AVP13
++# endif
++# define machine_is_avp13()	(machine_arch_type == MACH_TYPE_AVP13)
++#else
++# define machine_is_avp13()	(0)
++#endif
++
++#ifdef CONFIG_MACH_XXSVIDEOD
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_XXSVIDEOD
++# endif
++# define machine_is_xxsvideod()	(machine_arch_type == MACH_TYPE_XXSVIDEOD)
++#else
++# define machine_is_xxsvideod()	(0)
++#endif
++
++#ifdef CONFIG_MACH_VPNEXT
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_VPNEXT
++# endif
++# define machine_is_vpnext()	(machine_arch_type == MACH_TYPE_VPNEXT)
++#else
++# define machine_is_vpnext()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SWARCO_ITC3
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SWARCO_ITC3
++# endif
++# define machine_is_swarco_itc3() \
++			(machine_arch_type == MACH_TYPE_SWARCO_ITC3)
++#else
++# define machine_is_swarco_itc3()	(0)
++#endif
++
++#ifdef CONFIG_MACH_TX51
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_TX51
++# endif
++# define machine_is_tx51()	(machine_arch_type == MACH_TYPE_TX51)
++#else
++# define machine_is_tx51()	(0)
++#endif
++
++#ifdef CONFIG_MACH_DOLBY_CAT1021
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_DOLBY_CAT1021
++# endif
++# define machine_is_dolby_cat1021() \
++				(machine_arch_type == MACH_TYPE_DOLBY_CAT1021)
++#else
++# define machine_is_dolby_cat1021()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MX28EVK
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MX28EVK
++# endif
++# define machine_is_mx28evk()	(machine_arch_type == MACH_TYPE_MX28EVK)
++#else
++# define machine_is_mx28evk()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PHOENIX260
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PHOENIX260
++# endif
++# define machine_is_phoenix260() \
++			(machine_arch_type == MACH_TYPE_PHOENIX260)
++#else
++# define machine_is_phoenix260()	(0)
++#endif
++
++#ifdef CONFIG_MACH_UVACA_STORK
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_UVACA_STORK
++# endif
++# define machine_is_uvaca_stork() \
++				(machine_arch_type == MACH_TYPE_UVACA_STORK)
++#else
++# define machine_is_uvaca_stork()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SMARTQ5
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SMARTQ5
++# endif
++# define machine_is_smartq5()	(machine_arch_type == MACH_TYPE_SMARTQ5)
++#else
++# define machine_is_smartq5()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ALL3078
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ALL3078
++# endif
++# define machine_is_all3078()	(machine_arch_type == MACH_TYPE_ALL3078)
++#else
++# define machine_is_all3078()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CTERA_2BAY_DS
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CTERA_2BAY_DS
++# endif
++# define machine_is_ctera_2bay_ds() \
++				(machine_arch_type == MACH_TYPE_CTERA_2BAY_DS)
++#else
++# define machine_is_ctera_2bay_ds()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SIOGENTOO3
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SIOGENTOO3
++# endif
++# define machine_is_siogentoo3() (machine_arch_type == MACH_TYPE_SIOGENTOO3)
++#else
++# define machine_is_siogentoo3()	(0)
++#endif
++
++#ifdef CONFIG_MACH_EPB5000
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_EPB5000
++# endif
++# define machine_is_epb5000()	(machine_arch_type == MACH_TYPE_EPB5000)
++#else
++# define machine_is_epb5000()	(0)
++#endif
++
++#ifdef CONFIG_MACH_HY9263
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_HY9263
++# endif
++# define machine_is_hy9263()	(machine_arch_type == MACH_TYPE_HY9263)
++#else
++# define machine_is_hy9263()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ACER_TEMPO_M900
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ACER_TEMPO_M900
++# endif
++# define machine_is_acer_tempo_m900() \
++			(machine_arch_type == MACH_TYPE_ACER_TEMPO_M900)
++#else
++# define machine_is_acer_tempo_m900()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ACER_TEMPO_DX900
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ACER_TEMPO_DX900
++# endif
++# define machine_is_acer_tempo_dx650() \
++			(machine_arch_type == MACH_TYPE_ACER_TEMPO_DX900)
++#else
++# define machine_is_acer_tempo_dx650()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ACER_TEMPO_X960
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ACER_TEMPO_X960
++# endif
++# define machine_is_acer_tempo_x960() \
++			(machine_arch_type == MACH_TYPE_ACER_TEMPO_X960)
++#else
++# define machine_is_acer_tempo_x960()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ACER_ETEN_V900
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ACER_ETEN_V900
++# endif
++# define machine_is_acer_eten_v900() \
++			(machine_arch_type == MACH_TYPE_ACER_ETEN_V900)
++#else
++# define machine_is_acer_eten_v900()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ACER_ETEN_X900
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ACER_ETEN_X900
++# endif
++# define machine_is_acer_eten_x900() \
++			(machine_arch_type == MACH_TYPE_ACER_ETEN_X900)
++#else
++# define machine_is_acer_eten_x900()	(0)
++#endif
++
++#ifdef CONFIG_MACH_BONNELL
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_BONNELL
++# endif
++# define machine_is_bonnell()	(machine_arch_type == MACH_TYPE_BONNELL)
++#else
++# define machine_is_bonnell()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OHT_MX27
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OHT_MX27
++# endif
++# define machine_is_oht_mx27()	(machine_arch_type == MACH_TYPE_OHT_MX27)
++#else
++# define machine_is_oht_mx27()	(0)
++#endif
++
++#ifdef CONFIG_MACH_HTCQUARTZ
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_HTCQUARTZ
++# endif
++# define machine_is_htcquartz()	(machine_arch_type == MACH_TYPE_HTCQUARTZ)
++#else
++# define machine_is_htcquartz()	(0)
++#endif
++
++#ifdef CONFIG_MACH_DAVINCI_DM6467TEVM
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_DAVINCI_DM6467TEVM
++# endif
++# define machine_is_davinci_dm6467tevm() \
++			(machine_arch_type == MACH_TYPE_DAVINCI_DM6467TEVM)
++#else
++# define machine_is_davinci_dm6467tevm()	(0)
++#endif
++
++#ifdef CONFIG_MACH_C3AX03
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_C3AX03
++# endif
++# define machine_is_c3ax03()	(machine_arch_type == MACH_TYPE_C3AX03)
++#else
++# define machine_is_c3ax03()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MXT_TD60
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MXT_TD60
++# endif
++# define machine_is_mxt_td60()	(machine_arch_type == MACH_TYPE_MXT_TD60)
++#else
++# define machine_is_mxt_td60()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ESYX
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ESYX
++# endif
++# define machine_is_esyx()	(machine_arch_type == MACH_TYPE_ESYX)
++#else
++# define machine_is_esyx()	(0)
++#endif
++
++#ifdef CONFIG_MACH_BULLDOG
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_BULLDOG
++# endif
++# define machine_is_bulldog()	(machine_arch_type == MACH_TYPE_BULLDOG)
++#else
++# define machine_is_bulldog()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CRANEBOARD
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CRANEBOARD
++# endif
++# define machine_is_craneboard() (machine_arch_type == MACH_TYPE_CRANEBOARD)
++#else
++# define machine_is_craneboard()	(0)
++#endif
++
+ /*
+  * These have not yet been registered
+  */
+diff --git a/include/configs/am3517_crane.h b/include/configs/am3517_crane.h
+new file mode 100644
+index 0000000..9637e9d
+--- /dev/null
++++ b/include/configs/am3517_crane.h
+@@ -0,0 +1,352 @@
++/*
++ * am3517_crane.h - Default configuration for AM3517/05 Craneboard.
++ *
++ * Author: Srinath.R <srinath@mistralsolutions.com>
++ *
++ * Based on include/configs/am3517evm.h
++ *
++ * Copyright (C) 2010 Mistral Solutions pvt Ltd
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
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#ifndef __CONFIG_H
++#define __CONFIG_H
++
++/*
++ * High Level Configuration Options
++ */
++#define CONFIG_ARMCORTEXA8	1	/* This is an ARM V7 CPU core */
++#define CONFIG_OMAP		1	/* in a TI OMAP core */
++#define CONFIG_OMAP34XX		1	/* which is a 34XX */
++#define CONFIG_EMIF4		1	/* The chip has EMIF4 controller */
++
++/* working with AM3517/05 Craneboard */
++#define CONFIG_OMAP3_AM3517CRANE	1
++
++
++#include <asm/arch/cpu.h>		/* get chip and board defs */
++#include <asm/arch/omap3.h>
++
++/*
++ * Display CPU and Board information
++ */
++#define CONFIG_DISPLAY_CPUINFO		1
++#define CONFIG_DISPLAY_BOARDINFO	1
++
++/* Clock Defines */
++#define V_OSCK			26000000	/* Clock output from T2 */
++#define V_SCLK			(V_OSCK >> 1)
++
++#undef CONFIG_USE_IRQ				/* no support for IRQs */
++#define CONFIG_MISC_INIT_R
++
++#define CONFIG_CMDLINE_TAG		1	/* enable passing of ATAGs */
++#define CONFIG_SETUP_MEMORY_TAGS	1
++#define CONFIG_INITRD_TAG		1
++#define CONFIG_REVISION_TAG		1
++
++/*
++ * Size of malloc() pool
++ */
++#define CONFIG_ENV_SIZE			(128 << 10)	/* 128 KiB sector */
++#define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + (128 << 10))
++#define CONFIG_SYS_GBL_DATA_SIZE	128	/* bytes reserved for */
++						/* initial data */
++/*
++ * DDR related
++ */
++#define CONFIG_OMAP3_MICRON_DDR		1	/* Micron DDR */
++#define CONFIG_SYS_CS0_SIZE		(256 * 1024 * 1024)
++
++/*
++ * Hardware drivers
++ */
++
++/*
++ * NS16550 Configuration
++ */
++#define V_NS16550_CLK			48000000	/* 48MHz (APLL96/2) */
++
++#define CONFIG_SYS_NS16550
++#define CONFIG_SYS_NS16550_SERIAL
++#define CONFIG_SYS_NS16550_REG_SIZE	(-4)
++#define CONFIG_SYS_NS16550_CLK		V_NS16550_CLK
++
++/*
++ * select serial console configuration
++ */
++#define CONFIG_CONS_INDEX		3
++#define CONFIG_SYS_NS16550_COM3		OMAP34XX_UART3
++#define CONFIG_SERIAL3			3	/* UART3 on AM3517 CRANE */
++
++/* allow to overwrite serial and ethaddr */
++#define CONFIG_ENV_OVERWRITE
++#define CONFIG_BAUDRATE			115200
++#define CONFIG_SYS_BAUDRATE_TABLE	{4800, 9600, 19200, 38400, 57600,\
++					115200}
++#define CONFIG_MMC			1
++#define CONFIG_OMAP3_MMC		1
++#define CONFIG_DOS_PARTITION		1
++
++/* USB
++ * Enable CONFIG_MUSB_HCD for Host functionalities MSC, keyboard
++ * Enable CONFIG_MUSB_UDD for Device functionalities.
++ */
++#define CONFIG_USB_AM3517		1
++#define CONFIG_MUSB_HCD			1
++#define CONFIG_MUSB_UDC			1
++
++#ifdef CONFIG_USB_AM3517
++
++#ifdef CONFIG_MUSB_HCD
++#define CONFIG_CMD_USB
++
++#define CONFIG_USB_STORAGE
++#define CONGIG_CMD_STORAGE
++#define CONFIG_CMD_FAT
++
++#ifdef CONFIG_USB_KEYBOARD
++#define CONFIG_SYS_USB_EVENT_POLL
++#define CONFIG_PREBOOT "usb start"
++#endif /* CONFIG_USB_KEYBOARD */
++
++#endif /* CONFIG_MUSB_HCD */
++
++#ifdef CONFIG_MUSB_UDC
++/* USB device configuration */
++#define CONFIG_USB_DEVICE		1
++#define CONFIG_USB_TTY			1
++#define CONFIG_SYS_CONSOLE_IS_IN_ENV	1
++/* Change these to suit your needs */
++#define CONFIG_USBD_VENDORID		0x0451
++#define CONFIG_USBD_PRODUCTID		0x5678
++#define CONFIG_USBD_MANUFACTURER	"Texas Instruments"
++#define CONFIG_USBD_PRODUCT_NAME	"CRANE"
++#endif /* CONFIG_MUSB_UDC */
++
++#endif /* CONFIG_USB_AM3517 */
++/* commands to include */
++#include <config_cmd_default.h>
++
++#define CONFIG_CMD_EXT2		/* EXT2 Support			*/
++#define CONFIG_CMD_FAT		/* FAT support			*/
++#define CONFIG_CMD_JFFS2	/* JFFS2 Support		*/
++
++#define CONFIG_CMD_I2C		/* I2C serial bus support	*/
++#define CONFIG_CMD_MMC		/* MMC support			*/
++#define CONFIG_CMD_NAND		/* NAND support			*/
++#define CONFIG_CMD_DHCP
++#define CONFIG_CMD_PING
++
++#undef CONFIG_CMD_FLASH		/* flinfo, erase, protect	*/
++#undef CONFIG_CMD_FPGA		/* FPGA configuration Support	*/
++#undef CONFIG_CMD_IMI		/* iminfo			*/
++#undef CONFIG_CMD_IMLS		/* List all found images	*/
++
++#define CONFIG_SYS_NO_FLASH
++#define CONFIG_HARD_I2C			1
++#define CONFIG_SYS_I2C_SPEED		100000
++#define CONFIG_SYS_I2C_SLAVE		1
++#define CONFIG_SYS_I2C_BUS		0
++#define CONFIG_SYS_I2C_BUS_SELECT	1
++#define CONFIG_DRIVER_OMAP34XX_I2C	1
++
++#define CONFIG_CMD_NET
++/*
++ * Board NAND Info.
++ */
++#define CONFIG_SYS_NAND_ADDR		NAND_BASE	/* physical address */
++							/* to access nand */
++#define CONFIG_SYS_NAND_BASE		NAND_BASE	/* physical address */
++							/* to access */
++							/* nand at CS0 */
++
++#define CONFIG_SYS_MAX_NAND_DEVICE	1		/* Max number of */
++							/* NAND devices */
++#define CONFIG_SYS_64BIT_VSPRINTF		/* needed for nand_util.c */
++
++#define CONFIG_JFFS2_NAND
++/* nand device jffs2 lives on */
++#define CONFIG_JFFS2_DEV		"nand0"
++/* start of jffs2 partition */
++#define CONFIG_JFFS2_PART_OFFSET	0x680000
++#define CONFIG_JFFS2_PART_SIZE		0xf980000	/* sz of jffs2 part */
++
++/* Environment information */
++#define CONFIG_BOOTDELAY	10
++
++#define CONFIG_BOOTFILE		uImage
++
++#define CONFIG_EXTRA_ENV_SETTINGS \
++	"loadaddr=0x82000000\0" \
++	"console=ttyS2,115200n8\0" \
++	"mmcargs=setenv bootargs console=${console} " \
++		"root=/dev/mmcblk0p2 rw " \
++		"rootfstype=ext3 rootwait eth=${ethaddr} ip=dhcp\0" \
++	"nandargs=setenv bootargs console=${console} " \
++		"root=/dev/mtdblock4 rw " \
++		"rootfstype=jffs2 eth=${ethaddr} ip=dhcp\0" \
++	"loadbootscript=fatload mmc 0 ${loadaddr} boot.scr\0" \
++	"bootscript=echo Running bootscript from mmc ...; " \
++		"source ${loadaddr}\0" \
++	"loaduimage=fatload mmc 0 ${loadaddr} uImage\0" \
++	"mmcboot=echo Booting from mmc ...; " \
++		"run mmcargs; " \
++		"bootm ${loadaddr}\0" \
++	"nandboot=echo Booting from nand ...; " \
++		"run nandargs; " \
++		"nand read ${loadaddr} 480000 e80000; " \
++		"bootm ${loadaddr}\0" \
++
++#define CONFIG_BOOTCOMMAND \
++	"if mmc init; then " \
++		"if run loadbootscript; then " \
++			"run bootscript; " \
++		"else " \
++			"if run loaduimage; then " \
++				"run mmcboot; " \
++			"else run nandboot; " \
++			"fi; " \
++		"fi; " \
++	"else run nandboot; fi"
++
++#define CONFIG_AUTO_COMPLETE	1
++/*
++ * Miscellaneous configurable options
++ */
++#define V_PROMPT			"AM3517_CRANE # "
++
++#define CONFIG_SYS_LONGHELP		/* undef to save memory */
++#define CONFIG_SYS_HUSH_PARSER		/* use "hush" command parser */
++#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
++#define CONFIG_SYS_PROMPT		V_PROMPT
++#define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
++/* Print Buffer Size */
++#define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + \
++					sizeof(CONFIG_SYS_PROMPT) + 16)
++#define CONFIG_SYS_MAXARGS		32	/* max number of command */
++						/* args */
++/* Boot Argument Buffer Size */
++#define CONFIG_SYS_BARGSIZE		(CONFIG_SYS_CBSIZE)
++/* memtest works on */
++#define CONFIG_SYS_MEMTEST_START	(OMAP34XX_SDRC_CS0)
++#define CONFIG_SYS_MEMTEST_END		(OMAP34XX_SDRC_CS0 + \
++					0x01F00000) /* 31MB */
++
++#define CONFIG_SYS_LOAD_ADDR		(OMAP34XX_SDRC_CS0) /* default load */
++								/* address */
++
++/*
++ * AM3517 has 12 GP timers, they can be driven by the system clock
++ * (12/13/16.8/19.2/38.4MHz) or by 32KHz clock. We use 13MHz (V_SCLK).
++ * This rate is divided by a local divisor.
++ */
++#define CONFIG_SYS_TIMERBASE		OMAP34XX_GPT2
++#define CONFIG_SYS_PTV			2	/* Divisor: 2^(PTV+1) => 8 */
++#define CONFIG_SYS_HZ			1000
++
++/*-----------------------------------------------------------------------
++ * Stack sizes
++ *
++ * The stack sizes are set up in start.S using the settings below
++ */
++#define CONFIG_STACKSIZE	(128 << 10)	/* regular stack 128 KiB */
++#ifdef CONFIG_USE_IRQ
++#define CONFIG_STACKSIZE_IRQ	(4 << 10)	/* IRQ stack 4 KiB */
++#define CONFIG_STACKSIZE_FIQ	(4 << 10)	/* FIQ stack 4 KiB */
++#endif
++
++/*-----------------------------------------------------------------------
++ * Physical Memory Map
++ */
++#define CONFIG_NR_DRAM_BANKS	2	/* CS1 may or may not be populated */
++#define PHYS_SDRAM_1		OMAP34XX_SDRC_CS0
++#define PHYS_SDRAM_1_SIZE	(32 << 20)	/* at least 32 MiB */
++#define PHYS_SDRAM_2		OMAP34XX_SDRC_CS1
++
++/* SDRAM Bank Allocation method */
++#define SDRC_R_B_C		1
++
++/*-----------------------------------------------------------------------
++ * FLASH and environment organization
++ */
++
++/* **** PISMO SUPPORT *** */
++
++/* Configure the PISMO */
++#define PISMO1_NAND_SIZE		GPMC_SIZE_128M
++#define PISMO1_ONEN_SIZE		GPMC_SIZE_128M
++
++#define CONFIG_SYS_MAX_FLASH_SECT	520	/* max number of sectors */
++						/* on one chip */
++#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* max number of flash banks */
++#define CONFIG_SYS_MONITOR_LEN		(256 << 10)	/* Reserve 2 sectors */
++
++#define CONFIG_SYS_FLASH_BASE		boot_flash_base
++
++/* Monitor at start of flash */
++#define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
++
++#define CONFIG_NAND_OMAP_GPMC
++#define GPMC_NAND_ECC_LP_x16_LAYOUT	1
++#define CONFIG_ENV_IS_IN_NAND		1
++#define SMNAND_ENV_OFFSET		0x260000 /* environment starts here */
++
++#define CONFIG_SYS_ENV_SECT_SIZE	boot_flash_sec
++#define CONFIG_ENV_OFFSET		boot_flash_off
++#define CONFIG_ENV_ADDR			boot_flash_env_addr
++
++/*-----------------------------------------------------------------------
++ * CFI FLASH driver setup
++ */
++/* timeout values are in ticks */
++#define CONFIG_SYS_FLASH_ERASE_TOUT	(100 * CONFIG_SYS_HZ)
++#define CONFIG_SYS_FLASH_WRITE_TOUT	(100 * CONFIG_SYS_HZ)
++
++/* Flash banks JFFS2 should use */
++#define CONFIG_SYS_MAX_MTD_BANKS	(CONFIG_SYS_MAX_FLASH_BANKS + \
++					CONFIG_SYS_MAX_NAND_DEVICE)
++#define CONFIG_SYS_JFFS2_MEM_NAND
++/* use flash_info[2] */
++#define CONFIG_SYS_JFFS2_FIRST_BANK	CONFIG_SYS_MAX_FLASH_BANKS
++#define CONFIG_SYS_JFFS2_NUM_BANKS	1
++
++
++/*
++ * Include flash related variables
++ */
++#include <asm/arch/omap3_flash.h>
++
++
++
++/*-----------------------------------------------------
++ * ethernet support for AM3517/05 Craneboard
++ *------------------------------------------------
++ */
++#if defined(CONFIG_CMD_NET)
++#define CONFIG_DRIVER_TI_EMAC
++#define CONFIG_DRIVER_TI_EMAC_USE_RMII
++#define CONFIG_MII
++#define	CONFIG_BOOTP_DEFAULT
++#define CONFIG_BOOTP_DNS
++#define CONFIG_BOOTP_DNS2
++#define CONFIG_BOOTP_SEND_HOSTNAME
++#define CONFIG_NET_RETRY_COUNT 10
++#define CONFIG_NET_MULTI
++#endif
++
++#endif /* __CONFIG_H */
++
+--
+1.7.1.226.g770c5
+
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 7e61b21..55f0244 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r65"
+PR ="r66"
 
 FILESPATHPKG =. "u-boot-git:"
 
@@ -171,6 +171,13 @@ SRCREV_am37x-evm = "c0a8fb217fdca7888d89f9a3dee74a4cec865620"
 PV_am37x-evm = "2009.11+${PR}+gitr${SRCREV}"
 
 # ~ TI PSP v2009.11_OMAPPSP_03.00.01.06 (+ couple of commits)
+SRC_URI_am3517-crane = "git://arago-project.org/git/projects/u-boot-omap3.git;protocol=git \
+			file://0001-Added-Support-for-AM3517-05-based-Craneboard.patch   \                     
+"
+SRCREV_am3517-crane = "c0a8fb217fdca7888d89f9a3dee74a4cec865620"
+PV_am3517-crane = "2009.11+${PR}+gitr${SRCREV}"
+
+# ~ TI PSP v2009.11_OMAPPSP_03.00.01.06 (+ couple of commits)
 SRC_URI_am3517-evm = "git://arago-project.org/git/projects/u-boot-omap3.git;protocol=git"
 SRCREV_am3517-evm = "c0a8fb217fdca7888d89f9a3dee74a4cec865620"
 PV_am3517-evm = "2009.11+${PR}+gitr${SRCREV}"
-- 
1.7.0.4


--------------020304050605000808070609
Content-Type: text/x-patch;
 name="0001-Applied-patch-on-x-load-for-AM3517-Crane-board-suppo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Applied-patch-on-x-load-for-AM3517-Crane-board-suppo.pa";
 filename*1="tch"

From 95403dddb0f2a862bf04b8755eabfa153820272e Mon Sep 17 00:00:00 2001
From: Anil Kumar <anilm@mistralsolutions.com>
Date: Fri, 19 Nov 2010 11:23:21 +0530
Subject: [PATCH] Applied patch on x-load for AM3517 Crane board support

Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
---
 ...0001-Added-support-for-Am3517-Crane-board.patch | 2890 ++++++++++++++++++++
 recipes/x-load/x-load_git.bb                       |    9 +-
 2 files changed, 2898 insertions(+), 1 deletions(-)
 create mode 100644 recipes/x-load/x-load-git/am3517-crane/0001-Added-support-for-Am3517-Crane-board.patch

diff --git a/recipes/x-load/x-load-git/am3517-crane/0001-Added-support-for-Am3517-Crane-board.patch b/recipes/x-load/x-load-git/am3517-crane/0001-Added-support-for-Am3517-Crane-board.patch
new file mode 100644
index 0000000..1b8ddb0
--- /dev/null
+++ b/recipes/x-load/x-load-git/am3517-crane/0001-Added-support-for-Am3517-Crane-board.patch
@@ -0,0 +1,2890 @@
+From fe8eebffed1d945fb07cc03068d644582746d9b1 Mon Sep 17 00:00:00 2001
+From: Anil Kumar <anilm@mistralsolutions.com>
+Date: Tue, 16 Nov 2010 19:14:46 +0530
+Subject: [PATCH] Added support for Am3517 Crane board
+
+Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
+---
+ Makefile                           |   11 +
+ board/am3517crane/Makefile         |   49 ++
+ board/am3517crane/am3517crane.c    |  864 ++++++++++++++++++++++++++++++++++++
+ board/am3517crane/am3517crane.h    |  103 +++++
+ board/am3517crane/config.mk        |   20 +
+ board/am3517crane/platform.S       |  436 ++++++++++++++++++
+ board/am3517crane/x-load.lds       |   53 +++
+ board/am3517evm/platform.S         |   10 +-
+ board/omap3evm/omap3evm.c          |   35 +--
+ board/omap3evm/platform.S          |   10 +-
+ common/Makefile                    |   50 ++
+ common/cmd_load.c                  |  537 ++++++++++++++++++++++
+ common/cmd_load.h                  |   47 ++
+ cpu/omap3/mmc.c                    |    3 +-
+ drivers/Makefile                   |    4 +
+ drivers/k9f1g08r0a.c               |   39 +--
+ include/asm/arch-omap3/cpu.h       |    6 +-
+ include/asm/arch-omap3/mem.h       |    9 +-
+ include/asm/arch-omap3/omap3430.h  |    3 +-
+ include/asm/arch-omap3/sys_proto.h |    2 +-
+ include/configs/am3517crane.h      |  200 +++++++++
+ lib/board.c                        |   10 +-
+ 22 files changed, 2425 insertions(+), 76 deletions(-)
+ create mode 100644 board/am3517crane/Makefile
+ create mode 100644 board/am3517crane/am3517crane.c
+ create mode 100644 board/am3517crane/am3517crane.h
+ create mode 100644 board/am3517crane/config.mk
+ create mode 100644 board/am3517crane/platform.S
+ create mode 100644 board/am3517crane/x-load.lds
+ create mode 100644 common/Makefile
+ create mode 100644 common/cmd_load.c
+ create mode 100644 common/cmd_load.h
+ create mode 100644 include/configs/am3517crane.h
+
+diff --git a/Makefile b/Makefile
+index 4c94438..6bfae50 100644
+--- a/Makefile
++++ b/Makefile
+@@ -70,6 +70,7 @@ LIBS += lib/lib$(ARCH).a
+ LIBS += fs/fat/libfat.a
+ LIBS += disk/libdisk.a
+ LIBS += drivers/libdrivers.a
++LIBS += common/libcommon.a
+ .PHONY : $(LIBS)
+
+ # Add GCC lib
+@@ -152,6 +153,15 @@ omap3evm_config :	unconfig
+ am3517evm_config :       unconfig
+ 	@./mkconfig $(@:_config=) arm omap3 am3517evm
+
++am3517crane_config :       unconfig
++	@./mkconfig $(@:_config=) arm omap3 am3517crane
++
++am3517crane_download_config :       unconfig
++	@./mkconfig am3517crane arm omap3 am3517crane; \
++	echo "#define START_LOADB_DOWNLOAD" >> ./include/config-2.h; \
++	cat ./include/config.h >> ./include/config-2.h; \
++	mv ./include/config-2.h ./include/config.h
++
+ #########################################################################
+
+ clean:
+@@ -168,6 +178,7 @@ clobber:	clean
+ 	rm -f $(OBJS) *.bak tags TAGS
+ 	rm -fr *.*~
+ 	rm -f x-load x-load.map $(ALL)
++	rm -f x-load.bin.ift
+ 	rm -f include/asm/proc include/asm/arch
+
+ mrproper \
+diff --git a/board/am3517crane/Makefile b/board/am3517crane/Makefile
+new file mode 100644
+index 0000000..46a5b46
+--- /dev/null
++++ b/board/am3517crane/Makefile
+@@ -0,0 +1,49 @@
++#
++# (C) Copyright 2010 Mistral Solutions Pvt Ltd. <www.mistralsolutions.com>
++# Umesh Krishnan <umeshk@mistralsolutions.com>
++#
++# This file is copied from board/am3517evm/Makefile
++#
++# See file CREDITS for list of people who contributed to this
++# project.
++#
++# This program is free software; you can redistribute it and/or
++# modify it under the terms of the GNU General Public License as
++# published by the Free Software Foundation; either version 2 of
++# the License, or (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++# MA 02111-1307 USA
++#
++
++include $(TOPDIR)/config.mk
++
++LIB	= lib$(BOARD).a
++
++OBJS	:= am3517crane.o
++SOBJS	:= platform.o
++
++$(LIB):	$(OBJS) $(SOBJS)
++	$(AR) crv $@ $^
++
++clean:
++	rm -f $(SOBJS) $(OBJS)
++
++distclean:	clean
++	rm -f $(LIB) core *.bak .depend
++
++#########################################################################
++
++.depend:	Makefile $(SOBJS:.o=.S) $(OBJS:.o=.c)
++		$(CC) -M $(CPPFLAGS) $(SOBJS:.o=.S) $(OBJS:.o=.c) > $@
++
++-include .depend
++
++#########################################################################
+diff --git a/board/am3517crane/am3517crane.c b/board/am3517crane/am3517crane.c
+new file mode 100644
+index 0000000..a6006d3
+--- /dev/null
++++ b/board/am3517crane/am3517crane.c
+@@ -0,0 +1,864 @@
++/*
++ * (C) Copyright 2010 Mistral Solutions Pvt Ltd. <www.mistralsolutions.com>
++ * Umesh Krishnan <umeshk@mistralsolutions.com>
++ *
++ * This file is copied from board/am3517evm/am3517evm.c
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++#include <common.h>
++#include <command.h>
++#include <part.h>
++#include <fat.h>
++#include <asm/arch/cpu.h>
++#include <asm/arch/bits.h>
++#include <asm/arch/mux.h>
++#include <asm/arch/sys_proto.h>
++#include <asm/arch/sys_info.h>
++#include <asm/arch/clocks.h>
++#include <asm/arch/mem.h>
++#include "am3517crane.h"
++
++/* Used to index into DPLL parameter tables */
++struct dpll_param {
++	unsigned int m;
++	unsigned int n;
++	unsigned int fsel;
++	unsigned int m2;
++};
++
++/*******************************************************
++ * Routine: delay
++ * Description: spinning delay to use before udelay works
++ ******************************************************/
++static inline void delay(unsigned long loops)
++{
++	__asm__ volatile ("1:\n" "subs %0, %1, #1\n"
++			  "bne 1b" : "=r" (loops) : "0"(loops));
++}
++
++/*****************************************
++ * Routine: board_init
++ * Description: Early hardware init.
++ *****************************************/
++int board_init(void)
++{
++	return 0;
++}
++
++/* TODO: Move it to common place so that should be used
++ * for all OMAP series of devices
++ */
++u32 is_cpu_family(void)
++{
++	u32 cpuid = 0, cpu_family = 0;
++	u16 hawkeye;
++
++	cpuid = __raw_readl(OMAP34XX_CONTROL_ID);
++	hawkeye  = (cpuid >> HAWKEYE_SHIFT) & 0xffff;
++
++	switch (hawkeye) {
++	case HAWKEYE_AM35XX:
++	default:
++		cpu_family = CPU_AM35XX;
++		break;
++	}
++	return cpu_family;
++}
++/*************************************************************
++ *  get_device_type(): tell if GP/HS/EMU/TST
++ *************************************************************/
++u32 get_device_type(void)
++{
++	int mode;
++	mode = __raw_readl(CONTROL_STATUS) & (DEVICE_MASK);
++	return mode >>= 8;
++}
++
++/************************************************
++ * get_sysboot_value(void) - return SYS_BOOT[4:0]
++ ************************************************/
++u32 get_sysboot_value(void)
++{
++	int mode;
++	mode = __raw_readl(CONTROL_STATUS) & (SYSBOOT_MASK);
++	return mode;
++}
++/*************************************************************
++ * Routine: get_mem_type(void) - returns the kind of memory connected
++ * to GPMC that we are trying to boot form. Uses SYS BOOT settings.
++ *************************************************************/
++u32 get_mem_type(void)
++{
++	u32   mem_type = get_sysboot_value();
++	switch (mem_type) {
++
++	case 1:
++	case 12:
++	case 15:
++	case 21:
++	case 27:
++		return GPMC_NAND;
++	case 13:
++	case 16:
++	case 17:
++	case 18:
++	case 24:
++		return MMC_NAND;
++	default:
++		return GPMC_NAND;
++	}
++}
++
++/******************************************
++ * get_cpu_rev(void) - extract version info
++ ******************************************/
++u32 get_cpu_rev(void)
++{
++	u32 cpuid = 0;
++	/* On ES1.0 the IDCODE register is not exposed on L4
++	 * so using CPU ID to differentiate
++	 * between ES2.0 and ES1.0.
++	 */
++	__asm__ __volatile__("mrc p15, 0, %0, c0, c0, 0" : "=r" (cpuid));
++	if ((cpuid  & 0xf) == 0x0)
++		return CPU_3430_ES1;
++	else
++		return CPU_3430_ES2;
++
++}
++
++/*****************************************************************
++ * sr32 - clear & set a value in a bit range for a 32 bit address
++ *****************************************************************/
++void sr32(u32 addr, u32 start_bit, u32 num_bits, u32 value)
++{
++	u32 tmp, msk = 0;
++	msk = 1 << num_bits;
++	--msk;
++	tmp = __raw_readl(addr) & ~(msk << start_bit);
++	tmp |=  value << start_bit;
++	__raw_writel(tmp, addr);
++}
++
++/*********************************************************************
++ * wait_on_value() - common routine to allow waiting for changes in
++ *   volatile regs.
++ *********************************************************************/
++u32 wait_on_value(u32 read_bit_mask, u32 match_value, u32 read_addr, u32 bound)
++{
++	u32 i = 0, val;
++	do {
++		++i;
++		val = __raw_readl(read_addr) & read_bit_mask;
++		if (val == match_value)
++			return 1;
++		if (i == bound)
++			return 0;
++	} while (1);
++}
++
++/*********************************************************************
++ * config_emif4_ddr() - Init/Configure DDR on AM3517 EVM board.
++ *********************************************************************/
++void config_emif4_ddr(void)
++{
++	unsigned int regval;
++
++	/* Set the DDR PHY parameters in PHY ctrl registers */
++	regval = (EMIF4_DDR1_RD_LAT | (EMIF4_DDR1_PWRDN_DIS << 6) |
++		(EMIF4_DDR1_STRBEN_EXT << 7) | (EMIF4_DDR1_DLL_MODE << 12) |
++		(EMIF4_DDR1_VTP_DYN << 15) | (EMIF4_DDR1_LB_CK_SEL << 23));
++	__raw_writel(regval, EMIF4_DDR_PHYCTL1);
++	__raw_writel(regval, EMIF4_DDR_PHYCTL1_SHDW);
++
++	regval = (EMIF4_DDR2_TX_DATA_ALIGN | (EMIF4_DDR2_RX_DLL_BYPASS << 1));
++	__raw_writel(regval, EMIF4_DDR_PHYCTL2);
++
++	/* Reset the DDR PHY and wait till completed */
++	sr32(EMIF4_IODFT_TLGC, 10, 1, 1);
++	/*Wait till that bit clears*/
++	while ((__raw_readl(EMIF4_IODFT_TLGC) & BIT10) == 0x1)
++		;
++	/*Re-verify the DDR PHY status*/
++	while ((__raw_readl(EMIF4_SDRAM_STS) & BIT2) == 0x0)
++		;
++
++	sr32(EMIF4_IODFT_TLGC, 0, 1, 1);
++	/* Set SDR timing registers */
++	regval = (EMIF4_TIM1_T_WTR | (EMIF4_TIM1_T_RRD << 3) |
++		(EMIF4_TIM1_T_RC << 6) | (EMIF4_TIM1_T_RAS << 12) |
++		(EMIF4_TIM1_T_WR << 17) | (EMIF4_TIM1_T_RCD << 21) |
++		(EMIF4_TIM1_T_RP << 25));
++	__raw_writel(regval, EMIF4_SDRAM_TIM1);
++	__raw_writel(regval, EMIF4_SDRAM_TIM1_SHDW);
++
++	regval = (EMIF4_TIM2_T_CKE | (EMIF4_TIM2_T_RTP << 3) |
++		(EMIF4_TIM2_T_XSRD << 6) | (EMIF4_TIM2_T_XSNR << 16) |
++		(EMIF4_TIM2_T_ODT << 25) | (EMIF4_TIM2_T_XP << 28));
++	__raw_writel(regval, EMIF4_SDRAM_TIM2);
++	__raw_writel(regval, EMIF4_SDRAM_TIM2_SHDW);
++
++	regval = (EMIF4_TIM3_T_RAS_MAX | (EMIF4_TIM3_T_RFC << 4) |
++		(EMIF4_TIM3_T_TDQSCKMAX << 13));
++	__raw_writel(regval, EMIF4_SDRAM_TIM3);
++	__raw_writel(regval, EMIF4_SDRAM_TIM3_SHDW);
++
++	/* Set the PWR control register */
++	regval = (EMIF4_PWR_PM_TIM | (EMIF4_PWR_PM_EN << 8) |
++		(EMIF4_PWR_DPD_EN << 10) | (EMIF4_PWR_IDLE << 30));
++	__raw_writel(regval, EMIF4_PWR_MGT_CTRL);
++	__raw_writel(regval, EMIF4_PWR_MGT_CTRL_SHDW);
++
++	/* Set the DDR refresh rate control register */
++	regval = (EMIF4_REFRESH_RATE | (EMIF4_PASR << 24) |
++		(EMIF4_INITREF_DIS << 31));
++	__raw_writel(regval, EMIF4_SDRAM_RFCR);
++	__raw_writel(regval, EMIF4_SDRAM_RFCR_SHDW);
++
++	/* set the SDRAM configuration register */
++	regval = (EMIF4_CFG_PGSIZE | (EMIF4_CFG_EBANK << 3) |
++		(EMIF4_CFG_IBANK << 4) | (EMIF4_CFG_ROWSIZE << 7) |
++		(EMIF4_CFG_CL << 10) | (EMIF4_CFG_NARROW_MD << 14) |
++		(EMIF4_CFG_CWL << 16) | (EMIF4_CFG_SDR_DRV << 18) |
++		(EMIF4_CFG_DDR_DIS_DLL << 20) | (EMIF4_CFG_DYN_ODT << 21) |
++		(EMIF4_CFG_DDR2_DDQS << 23) | (EMIF4_CFG_DDR_TERM << 24) |
++		(EMIF4_CFG_IBANK_POS << 27) | (EMIF4_CFG_SDRAM_TYP << 29));
++	__raw_writel(regval, EMIF4_SDRAM_CFG);
++}
++
++/*************************************************************
++ * get_sys_clk_speed - determine reference oscillator speed
++ *  based on known 32kHz clock and gptimer.
++ *************************************************************/
++u32 get_osc_clk_speed(void)
++{
++	u32 start, cstart, cend, cdiff, val;
++
++	val = __raw_readl(PRM_CLKSRC_CTRL);
++	/* If SYS_CLK is being divided by 2, remove for now */
++	val = (val & (~BIT7)) | BIT6;
++	__raw_writel(val, PRM_CLKSRC_CTRL);
++
++	/* enable timer2 */
++	val = __raw_readl(CM_CLKSEL_WKUP) | BIT0;
++	/* select sys_clk for GPT1 */
++	__raw_writel(val, CM_CLKSEL_WKUP);
++
++	/* Enable I and F Clocks for GPT1 */
++	val = __raw_readl(CM_ICLKEN_WKUP) | BIT0 | BIT2;
++	__raw_writel(val, CM_ICLKEN_WKUP);
++	val = __raw_readl(CM_FCLKEN_WKUP) | BIT0;
++	__raw_writel(val, CM_FCLKEN_WKUP);
++
++	/* start counting at 0 */
++	__raw_writel(0, OMAP34XX_GPT1 + TLDR);
++	/* enable clock */
++	__raw_writel(GPT_EN, OMAP34XX_GPT1 + TCLR);
++	/* enable 32kHz source *//* enabled out of reset */
++	/* determine sys_clk via gauging */
++
++	/* start time in 20 cycles */
++	start = 20 + __raw_readl(S32K_CR);
++	/* dead loop till start time */
++	while (__raw_readl(S32K_CR) < start)
++		;
++	/* get start sys_clk count */
++	cstart = __raw_readl(OMAP34XX_GPT1 + TCRR);
++	/* wait for 40 cycles */
++	while (__raw_readl(S32K_CR) < (start + 20))
++		;
++	/* get end sys_clk count */
++	cend = __raw_readl(OMAP34XX_GPT1 + TCRR);
++	/* get elapsed ticks */
++	cdiff = cend - cstart;
++
++	/* based on number of ticks assign speed */
++	if (cdiff > 19000)
++		return S38_4M;
++	else if (cdiff > 15200)
++		return S26M;
++	else if (cdiff > 13000)
++		return S24M;
++	else if (cdiff > 9000)
++		return S19_2M;
++	else if (cdiff > 7600)
++		return S13M;
++	else
++		return S12M;
++}
++
++/******************************************************************************
++ * get_sys_clkin_sel() - returns the sys_clkin_sel field value based on
++ *   -- input oscillator clock frequency.
++ *
++ *****************************************************************************/
++void get_sys_clkin_sel(u32 osc_clk, u32 *sys_clkin_sel)
++{
++	if (osc_clk == S38_4M)
++		*sys_clkin_sel =  4;
++	else if (osc_clk == S26M)
++		*sys_clkin_sel = 3;
++	else if (osc_clk == S19_2M)
++		*sys_clkin_sel = 2;
++	else if (osc_clk == S13M)
++		*sys_clkin_sel = 1;
++	else if (osc_clk == S12M)
++		*sys_clkin_sel = 0;
++}
++
++/******************************************************************************
++ * prcm_init() - inits clocks for PRCM as defined in clocks.h
++ *   -- called from SRAM, or Flash (using temp SRAM stack).
++ *****************************************************************************/
++void prcm_init(void)
++{
++	u32 osc_clk = 0, sys_clkin_sel;
++	struct dpll_param *dpll_param_p;
++	u32 clk_index, sil_index;
++
++	/* Gauge the input clock speed and find out the sys_clkin_sel
++	 * value corresponding to the input clock.
++	 */
++	osc_clk = get_osc_clk_speed();
++	get_sys_clkin_sel(osc_clk, &sys_clkin_sel);
++
++	sr32(PRM_CLKSEL, 0, 3, sys_clkin_sel); /* set input crystal speed */
++
++	/* If the input clock is greater than 19.2M always divide/2 */
++	if (sys_clkin_sel > 2) {
++		sr32(PRM_CLKSRC_CTRL, 6, 2, 2);/* input clock divider */
++		clk_index = sys_clkin_sel/2;
++	} else {
++		sr32(PRM_CLKSRC_CTRL, 6, 2, 1);/* input clock divider */
++		clk_index = sys_clkin_sel;
++	}
++
++	/* The DPLL tables are defined according to sysclk value and
++	 * silicon revision. The clk_index value will be used to get
++	 * the values for that input sysclk from the DPLL param table
++	 * and sil_index will get the values for that SysClk for the
++	 * appropriate silicon rev.
++	 */
++	sil_index = get_cpu_rev() - 1;
++
++	/* Unlock MPU DPLL (slows things down, and needed later) */
++	sr32(CM_CLKEN_PLL_MPU, 0, 3, PLL_LOW_POWER_BYPASS);
++	wait_on_value(BIT0, 0, CM_IDLEST_PLL_MPU, LDELAY);
++
++	/* Getting the base address of Core DPLL param table*/
++	dpll_param_p = (struct dpll_param *)get_core_dpll_param();
++	/* Moving it to the right sysclk and ES rev base */
++	dpll_param_p = dpll_param_p + 2*clk_index + sil_index;
++	/* CORE DPLL */
++	/* sr32(CM_CLKSEL2_EMU) set override to work when asleep */
++	sr32(CM_CLKEN_PLL, 0, 3, PLL_FAST_RELOCK_BYPASS);
++	wait_on_value(BIT0, 0, CM_IDLEST_CKGEN, LDELAY);
++	sr32(CM_CLKSEL1_EMU, 16, 5, CORE_M3X2);	/* m3x2 */
++	sr32(CM_CLKSEL1_PLL, 27, 2, dpll_param_p->m2);	/* Set M2 */
++	sr32(CM_CLKSEL1_PLL, 16, 11, dpll_param_p->m);	/* Set M */
++	sr32(CM_CLKSEL1_PLL, 8, 7, dpll_param_p->n);	/* Set N */
++	sr32(CM_CLKSEL1_PLL, 6, 1, 0);			/* 96M Src */
++	sr32(CM_CLKSEL_CORE, 2, 2, CORE_L4_DIV);	/* l4 */
++	sr32(CM_CLKSEL_CORE, 0, 2, CORE_L3_DIV);	/* l3 */
++	sr32(CM_CLKSEL_WKUP, 1, 2, WKUP_RSM);		/* reset mgr */
++	sr32(CM_CLKEN_PLL, 4, 4, dpll_param_p->fsel);	/* FREQSEL */
++	sr32(CM_CLKEN_PLL, 0, 3, PLL_LOCK);		/* lock mode */
++	wait_on_value(BIT0, 1, CM_IDLEST_CKGEN, LDELAY);
++
++	/* Getting the base address to PER  DPLL param table*/
++	dpll_param_p = (struct dpll_param *)get_per_dpll_param();
++	/* Moving it to the right sysclk base */
++	dpll_param_p = dpll_param_p + clk_index;
++	/* PER DPLL */
++	sr32(CM_CLKEN_PLL, 16, 3, PLL_STOP);
++	wait_on_value(BIT1, 0, CM_IDLEST_CKGEN, LDELAY);
++	sr32(CM_CLKSEL1_EMU, 24, 5, PER_M6X2);	/* set M6 */
++	sr32(CM_CLKSEL_CAM, 0, 5, PER_M5X2);	/* set M5 */
++	sr32(CM_CLKSEL_DSS, 0, 5, PER_M4X2);	/* set M4 */
++	sr32(CM_CLKSEL_DSS, 8, 5, PER_M3X2);	/* set M3 */
++	sr32(CM_CLKSEL3_PLL, 0, 5, dpll_param_p->m2);	/* set M2 */
++	sr32(CM_CLKSEL2_PLL, 8, 11, dpll_param_p->m);	/* set m */
++	sr32(CM_CLKSEL2_PLL, 0, 7, dpll_param_p->n);	/* set n */
++	sr32(CM_CLKEN_PLL, 20, 4, dpll_param_p->fsel);/* FREQSEL */
++	sr32(CM_CLKEN_PLL, 16, 3, PLL_LOCK);	/* lock mode */
++	wait_on_value(BIT1, 2, CM_IDLEST_CKGEN, LDELAY);
++
++	/* Getting the base address to MPU DPLL param table*/
++	dpll_param_p = (struct dpll_param *)get_mpu_dpll_param();
++	/* Moving it to the right sysclk and ES rev base */
++	dpll_param_p = dpll_param_p + 2*clk_index + sil_index;
++	/* MPU DPLL (unlocked already) */
++	sr32(CM_CLKSEL2_PLL_MPU, 0, 5, dpll_param_p->m2);	/* Set M2 */
++	sr32(CM_CLKSEL1_PLL_MPU, 8, 11, dpll_param_p->m);	/* Set M */
++	sr32(CM_CLKSEL1_PLL_MPU, 0, 7, dpll_param_p->n);	/* Set N */
++	sr32(CM_CLKEN_PLL_MPU, 4, 4, dpll_param_p->fsel);	/* FREQSEL */
++	sr32(CM_CLKEN_PLL_MPU, 0, 3, PLL_LOCK); /* lock mode */
++	wait_on_value(BIT0, 1, CM_IDLEST_PLL_MPU, LDELAY);
++
++	/* Set up GPTimers to sys_clk source only */
++	sr32(CM_CLKSEL_PER, 0, 8, 0xff);
++	sr32(CM_CLKSEL_WKUP, 0, 1, 1);
++
++	delay(5000);
++}
++
++/*****************************************
++ * Routine: secure_unlock
++ * Description: Setup security registers for access
++ * (GP Device only)
++ *****************************************/
++void secure_unlock(void)
++{
++	/* Permission values for registers -Full fledged permissions to all */
++	#define UNLOCK_1 0xFFFFFFFF
++	#define UNLOCK_2 0x00000000
++	#define UNLOCK_3 0x0000FFFF
++	/* Protection Module Register Target APE (PM_RT)*/
++	__raw_writel(UNLOCK_1, RT_REQ_INFO_PERMISSION_1);
++	__raw_writel(UNLOCK_1, RT_READ_PERMISSION_0);
++	__raw_writel(UNLOCK_1, RT_WRITE_PERMISSION_0);
++	__raw_writel(UNLOCK_2, RT_ADDR_MATCH_1);
++
++	__raw_writel(UNLOCK_3, GPMC_REQ_INFO_PERMISSION_0);
++	__raw_writel(UNLOCK_3, GPMC_READ_PERMISSION_0);
++	__raw_writel(UNLOCK_3, GPMC_WRITE_PERMISSION_0);
++
++	__raw_writel(UNLOCK_3, OCM_REQ_INFO_PERMISSION_0);
++	__raw_writel(UNLOCK_3, OCM_READ_PERMISSION_0);
++	__raw_writel(UNLOCK_3, OCM_WRITE_PERMISSION_0);
++	__raw_writel(UNLOCK_2, OCM_ADDR_MATCH_2);
++
++	__raw_writel(UNLOCK_1, SMS_RG_ATT0); /* SDRC region 0 public */
++}
++
++/**********************************************************
++ * Routine: try_unlock_sram()
++ * Description: If chip is GP type, unlock the SRAM for
++ *  general use.
++ ***********************************************************/
++void try_unlock_memory(void)
++{
++	int mode;
++
++	/* if GP device unlock device SRAM for general use */
++	/* secure code breaks for Secure/Emulation device - HS/E/T*/
++	mode = get_device_type();
++	if (mode == GP_DEVICE)
++		secure_unlock();
++	return;
++}
++
++/**********************************************************
++ * Routine: s_init
++ * Description: Does early system init of muxing and clocks.
++ * - Called at time when only stack is available.
++ **********************************************************/
++
++void s_init(void)
++{
++	watchdog_init();
++#ifdef CONFIG_3430_AS_3410
++	/* setup the scalability control register for
++	 * 3430 to work in 3410 mode
++	 */
++	__raw_writel(0x5ABF, CONTROL_SCALABLE_OMAP_OCP);
++#endif
++	try_unlock_memory();
++	set_muxconf_regs();
++	delay(100);
++	prcm_init();
++	per_clocks_enable();
++
++	/* enable the DDRPHY clk */
++	sr32((OMAP34XX_CTRL_BASE + 0x588), 15, 15, 0x1);
++	/* enable the EMIF4 clk */
++	sr32((OMAP34XX_CTRL_BASE + 0x588), 14, 14, 0x1);
++	/* Enable the peripheral clocks */
++	sr32((OMAP34XX_CTRL_BASE + 0x59C), 0, 4, 0xF);
++	sr32((OMAP34XX_CTRL_BASE + 0x59C), 8, 10, 0x7);
++
++	/* bring cpgmac out of reset */
++	sr32((OMAP34XX_CTRL_BASE + 0x598), 1, 1, 0x1);
++
++	/* Configure the EMIF4 for our DDR */
++	config_emif4_ddr();
++}
++
++/*******************************************************
++ * Routine: misc_init_r
++ * Description: Init ethernet (done here so udelay works)
++ ********************************************************/
++int misc_init_r(void)
++{
++	return 0;
++}
++
++/******************************************************
++ * Routine: wait_for_command_complete
++ * Description: Wait for posting to finish on watchdog
++ ******************************************************/
++void wait_for_command_complete(unsigned int wd_base)
++{
++	int pending = 1;
++	do {
++		pending = __raw_readl(wd_base + WWPS);
++	} while (pending);
++}
++
++/****************************************
++ * Routine: watchdog_init
++ * Description: Shut down watch dogs
++ *****************************************/
++void watchdog_init(void)
++{
++	/* There are 3 watch dogs WD1=Secure, WD2=MPU, WD3=IVA. WD1 is
++	 * either taken care of by ROM (HS/EMU) or not accessible (GP).
++	 * We need to take care of WD2-MPU or take a PRCM reset.  WD3
++	 * should not be running and does not generate a PRCM reset.
++	 */
++	sr32(CM_FCLKEN_WKUP, 5, 1, 1);
++	sr32(CM_ICLKEN_WKUP, 5, 1, 1);
++	wait_on_value(BIT5, 0x20, CM_IDLEST_WKUP, 5); /* some issue here */
++
++	__raw_writel(WD_UNLOCK1, WD2_BASE + WSPR);
++	wait_for_command_complete(WD2_BASE);
++	__raw_writel(WD_UNLOCK2, WD2_BASE + WSPR);
++}
++
++/**********************************************
++ * Routine: dram_init
++ * Description: sets uboots idea of sdram size
++ **********************************************/
++int dram_init(void)
++{
++	return 0;
++}
++
++/*****************************************************************
++ * Routine: peripheral_enable
++ * Description: Enable the clks & power for perifs (GPT2, UART1,...)
++ ******************************************************************/
++void per_clocks_enable(void)
++{
++	/* Enable GP2 timer. */
++	sr32(CM_CLKSEL_PER, 0, 1, 0x1); /* GPT2 = sys clk */
++	sr32(CM_ICLKEN_PER, 3, 1, 0x1); /* ICKen GPT2 */
++	sr32(CM_FCLKEN_PER, 3, 1, 0x1); /* FCKen GPT2 */
++
++#ifdef CFG_NS16550
++	/* Enable UART1 clocks */
++	sr32(CM_FCLKEN1_CORE, 13, 1, 0x1);
++	sr32(CM_ICLKEN1_CORE, 13, 1, 0x1);
++
++	/* Enable UART2 clocks */
++	sr32(CM_FCLKEN1_CORE, 14, 1, 0x1);
++	sr32(CM_ICLKEN1_CORE, 14, 1, 0x1);
++
++	/* Enable UART2 clocks */
++	sr32(CM_FCLKEN_PER, 11, 1, 0x1);
++	sr32(CM_ICLKEN_PER, 11, 1, 0x1);
++#endif
++	/* Enable MMC1 clocks */
++	sr32(CM_FCLKEN1_CORE, 24, 1, 0x1);
++	sr32(CM_ICLKEN1_CORE, 24, 1, 0x1);
++
++	/* Enable MMC2 clocks */
++	sr32(CM_FCLKEN1_CORE, 25, 1, 0x1);
++	sr32(CM_ICLKEN1_CORE, 25, 1, 0x1);
++
++	delay(1000);
++}
++
++/* Set MUX for UART, GPMC, SDRC, GPIO */
++
++#define 	MUX_VAL(OFFSET, VALUE)\
++		__raw_writew((VALUE), OMAP34XX_CTRL_BASE + (OFFSET));
++
++#define		CP(x)	(CONTROL_PADCONF_##x)
++/*
++ * IEN  - Input Enable
++ * IDIS - Input Disable
++ * PTD  - Pull type Down
++ * PTU  - Pull type Up
++ * DIS  - Pull type selection is inactive
++ * EN   - Pull type selection is active
++ * M0   - Mode 0
++ * The commented string gives the final mux configuration for that pin
++ */
++#define MUX_DEFAULT()\
++	MUX_VAL(CP(SDRC_D0),        (IEN  | PTD | DIS | M0)) /*SDRC_D0*/\
++	MUX_VAL(CP(SDRC_D1),        (IEN  | PTD | DIS | M0)) /*SDRC_D1*/\
++	MUX_VAL(CP(SDRC_D2),        (IEN  | PTD | DIS | M0)) /*SDRC_D2*/\
++	MUX_VAL(CP(SDRC_D3),        (IEN  | PTD | DIS | M0)) /*SDRC_D3*/\
++	MUX_VAL(CP(SDRC_D4),        (IEN  | PTD | DIS | M0)) /*SDRC_D4*/\
++	MUX_VAL(CP(SDRC_D5),        (IEN  | PTD | DIS | M0)) /*SDRC_D5*/\
++	MUX_VAL(CP(SDRC_D6),        (IEN  | PTD | DIS | M0)) /*SDRC_D6*/\
++	MUX_VAL(CP(SDRC_D7),        (IEN  | PTD | DIS | M0)) /*SDRC_D7*/\
++	MUX_VAL(CP(SDRC_D8),        (IEN  | PTD | DIS | M0)) /*SDRC_D8*/\
++	MUX_VAL(CP(SDRC_D9),        (IEN  | PTD | DIS | M0)) /*SDRC_D9*/\
++	MUX_VAL(CP(SDRC_D10),       (IEN  | PTD | DIS | M0)) /*SDRC_D10*/\
++	MUX_VAL(CP(SDRC_D11),       (IEN  | PTD | DIS | M0)) /*SDRC_D11*/\
++	MUX_VAL(CP(SDRC_D12),       (IEN  | PTD | DIS | M0)) /*SDRC_D12*/\
++	MUX_VAL(CP(SDRC_D13),       (IEN  | PTD | DIS | M0)) /*SDRC_D13*/\
++	MUX_VAL(CP(SDRC_D14),       (IEN  | PTD | DIS | M0)) /*SDRC_D14*/\
++	MUX_VAL(CP(SDRC_D15),       (IEN  | PTD | DIS | M0)) /*SDRC_D15*/\
++	MUX_VAL(CP(SDRC_D16),       (IEN  | PTD | DIS | M0)) /*SDRC_D16*/\
++	MUX_VAL(CP(SDRC_D17),       (IEN  | PTD | DIS | M0)) /*SDRC_D17*/\
++	MUX_VAL(CP(SDRC_D18),       (IEN  | PTD | DIS | M0)) /*SDRC_D18*/\
++	MUX_VAL(CP(SDRC_D19),       (IEN  | PTD | DIS | M0)) /*SDRC_D19*/\
++	MUX_VAL(CP(SDRC_D20),       (IEN  | PTD | DIS | M0)) /*SDRC_D20*/\
++	MUX_VAL(CP(SDRC_D21),       (IEN  | PTD | DIS | M0)) /*SDRC_D21*/\
++	MUX_VAL(CP(SDRC_D22),       (IEN  | PTD | DIS | M0)) /*SDRC_D22*/\
++	MUX_VAL(CP(SDRC_D23),       (IEN  | PTD | DIS | M0)) /*SDRC_D23*/\
++	MUX_VAL(CP(SDRC_D24),       (IEN  | PTD | DIS | M0)) /*SDRC_D24*/\
++	MUX_VAL(CP(SDRC_D25),       (IEN  | PTD | DIS | M0)) /*SDRC_D25*/\
++	MUX_VAL(CP(SDRC_D26),       (IEN  | PTD | DIS | M0)) /*SDRC_D26*/\
++	MUX_VAL(CP(SDRC_D27),       (IEN  | PTD | DIS | M0)) /*SDRC_D27*/\
++	MUX_VAL(CP(SDRC_D28),       (IEN  | PTD | DIS | M0)) /*SDRC_D28*/\
++	MUX_VAL(CP(SDRC_D29),       (IEN  | PTD | DIS | M0)) /*SDRC_D29*/\
++	MUX_VAL(CP(SDRC_D30),       (IEN  | PTD | DIS | M0)) /*SDRC_D30*/\
++	MUX_VAL(CP(SDRC_D31),       (IEN  | PTD | DIS | M0)) /*SDRC_D31*/\
++	MUX_VAL(CP(SDRC_CLK),       (IEN  | PTD | DIS | M0)) /*SDRC_CLK*/\
++	MUX_VAL(CP(SDRC_DQS0),      (IEN  | PTD | DIS | M0)) /*SDRC_DQS0*/\
++	MUX_VAL(CP(SDRC_DQS1),      (IEN  | PTD | DIS | M0)) /*SDRC_DQS1*/\
++	MUX_VAL(CP(SDRC_DQS2),      (IEN  | PTD | DIS | M0)) /*SDRC_DQS2*/\
++	MUX_VAL(CP(SDRC_DQS3),      (IEN  | PTD | DIS | M0)) /*SDRC_DQS3*/\
++	MUX_VAL(CP(sdrc_cke0),      (M0)) /*SDRC_CKE0*/\
++	MUX_VAL(CP(sdrc_cke1),      (M0)) /*SDRC_CKE1*/\
++	MUX_VAL(CP(GPMC_A1),        (IDIS | PTD | DIS | M0)) /*GPMC_A1*/\
++	MUX_VAL(CP(GPMC_A2),        (IDIS | PTD | DIS | M0)) /*GPMC_A2*/\
++	MUX_VAL(CP(GPMC_A3),        (IDIS | PTD | DIS | M0)) /*GPMC_A3*/\
++	MUX_VAL(CP(GPMC_A4),        (IDIS | PTD | DIS | M0)) /*GPMC_A4*/\
++	MUX_VAL(CP(GPMC_A5),        (IDIS | PTD | DIS | M0)) /*GPMC_A5*/\
++	MUX_VAL(CP(GPMC_A6),        (IDIS | PTD | DIS | M0)) /*GPMC_A6*/\
++	MUX_VAL(CP(GPMC_A7),        (IDIS | PTD | DIS | M0)) /*GPMC_A7*/\
++	MUX_VAL(CP(GPMC_A8),        (IDIS | PTD | DIS | M0)) /*GPMC_A8*/\
++	MUX_VAL(CP(GPMC_A9),        (IDIS | PTD | DIS | M0)) /*GPMC_A9*/\
++	MUX_VAL(CP(GPMC_A10),       (IDIS | PTD | DIS | M0)) /*GPMC_A10*/\
++	MUX_VAL(CP(GPMC_D0),        (IEN  | PTD | DIS | M0)) /*GPMC_D0*/\
++	MUX_VAL(CP(GPMC_D1),        (IEN  | PTD | DIS | M0)) /*GPMC_D1*/\
++	MUX_VAL(CP(GPMC_D2),        (IEN  | PTD | DIS | M0)) /*GPMC_D2*/\
++	MUX_VAL(CP(GPMC_D3),        (IEN  | PTD | DIS | M0)) /*GPMC_D3*/\
++	MUX_VAL(CP(GPMC_D4),        (IEN  | PTD | DIS | M0)) /*GPMC_D4*/\
++	MUX_VAL(CP(GPMC_D5),        (IEN  | PTD | DIS | M0)) /*GPMC_D5*/\
++	MUX_VAL(CP(GPMC_D6),        (IEN  | PTD | DIS | M0)) /*GPMC_D6*/\
++	MUX_VAL(CP(GPMC_D7),        (IEN  | PTD | DIS | M0)) /*GPMC_D7*/\
++	MUX_VAL(CP(GPMC_D8),        (IEN  | PTD | DIS | M0)) /*GPMC_D8*/\
++	MUX_VAL(CP(GPMC_D9),        (IEN  | PTD | DIS | M0)) /*GPMC_D9*/\
++	MUX_VAL(CP(GPMC_D10),       (IEN  | PTD | DIS | M0)) /*GPMC_D10*/\
++	MUX_VAL(CP(GPMC_D11),       (IEN  | PTD | DIS | M0)) /*GPMC_D11*/\
++	MUX_VAL(CP(GPMC_D12),       (IEN  | PTD | DIS | M0)) /*GPMC_D12*/\
++	MUX_VAL(CP(GPMC_D13),       (IEN  | PTD | DIS | M0)) /*GPMC_D13*/\
++	MUX_VAL(CP(GPMC_D14),       (IEN  | PTD | DIS | M0)) /*GPMC_D14*/\
++	MUX_VAL(CP(GPMC_D15),       (IEN  | PTD | DIS | M0)) /*GPMC_D15*/\
++	MUX_VAL(CP(GPMC_nCS0),      (IDIS | PTU | EN  | M0)) /*GPMC_nCS0*/\
++	MUX_VAL(CP(GPMC_nCS1),      (IDIS | PTU | EN  | M0)) /*GPMC_nCS1*/\
++	MUX_VAL(CP(GPMC_nCS2),      (IDIS | PTU | EN  | M0)) /*GPMC_nCS2*/\
++	MUX_VAL(CP(GPMC_nCS3),      (IDIS | PTU | EN  | M0)) /*GPMC_nCS3*/\
++	MUX_VAL(CP(GPMC_nCS4),      (IDIS | PTU | EN  | M0)) /*GPMC_nCS4*/\
++	MUX_VAL(CP(GPMC_nCS5),      (IDIS | PTU | EN  | M0)) /*GPMC_nCS5*/\
++	MUX_VAL(CP(GPMC_nCS6),      (IDIS | PTU | EN  | M0)) /*GPMC_nCS6*/\
++	MUX_VAL(CP(GPMC_nCS7),      (IDIS | PTU | EN  | M0)) /*GPMC_nCS7*/\
++	MUX_VAL(CP(GPMC_CLK),       (IDIS | PTD | DIS | M0)) /*GPMC_CLK*/\
++	MUX_VAL(CP(GPMC_nADV_ALE),  (IDIS | PTD | DIS | M0)) /*GPMC_nADV_ALE*/\
++	MUX_VAL(CP(GPMC_nOE),       (IDIS | PTD | DIS | M0)) /*GPMC_nOE*/\
++	MUX_VAL(CP(GPMC_nWE),       (IDIS | PTD | DIS | M0)) /*GPMC_nWE*/\
++	MUX_VAL(CP(GPMC_nBE0_CLE),  (IDIS | PTD | DIS | M0)) /*GPMC_nBE0_CLE*/\
++	MUX_VAL(CP(GPMC_nBE1),      (IDIS | PTD | DIS | M4)) /*GPIO_61*/\
++	MUX_VAL(CP(GPMC_nWP),       (IEN  | PTD | DIS | M0)) /*GPMC_nWP*/\
++	MUX_VAL(CP(GPMC_WAIT0),     (IEN  | PTU | EN  | M0)) /*GPMC_WAIT0*/\
++	MUX_VAL(CP(GPMC_WAIT1),     (IEN  | PTU | EN  | M0)) /*GPMC_WAIT1*/\
++	MUX_VAL(CP(GPMC_WAIT2),     (IEN  | PTU | EN  | M4)) /*GPIO_64*/\
++	MUX_VAL(CP(GPMC_WAIT3),     (IEN  | PTU | EN  | M4)) /*GPIO_65*/\
++	MUX_VAL(CP(DSS_DATA18),     (IEN  | PTD | DIS | M4)) /*GPIO_88*/\
++	MUX_VAL(CP(DSS_DATA19),     (IEN  | PTD | DIS | M4)) /*GPIO_89*/\
++	MUX_VAL(CP(DSS_DATA20),     (IEN  | PTD | DIS | M4)) /*GPIO_90*/\
++	MUX_VAL(CP(DSS_DATA21),     (IEN  | PTD | DIS | M4)) /*GPIO_91*/\
++	MUX_VAL(CP(CAM_WEN),        (IEN  | PTD | DIS | M4)) /*GPIO_167*/\
++	MUX_VAL(CP(UART3_TX_IRTX),       (IDIS | PTD | DIS | M0)) /*UART1_TX*/\
++	MUX_VAL(CP(UART3_RTS_SD),      (IDIS | PTD | DIS | M0)) /*UART1_RTS*/\
++	MUX_VAL(CP(UART3_CTS_RCTX),      (IEN | PTU | DIS | M0)) /*UART1_CTS*/\
++	MUX_VAL(CP(UART3_RX_IRRX),       (IEN | PTD | DIS | M0)) /*UART1_RX*/\
++	/*Expansion card  */\
++	MUX_VAL(CP(MMC1_CLK),          (IEN  | PTU | EN  | M0)) /*MMC1_CLK*/\
++	MUX_VAL(CP(MMC1_CMD),          (IEN  | PTU | DIS | M0)) /*MMC1_CMD*/\
++	MUX_VAL(CP(MMC1_DAT0),         (IEN  | PTU | DIS | M0)) /*MMC1_DAT0*/\
++	MUX_VAL(CP(MMC1_DAT1),         (IEN  | PTU | DIS | M0)) /*MMC1_DAT1*/\
++	MUX_VAL(CP(MMC1_DAT2),         (IEN  | PTU | DIS | M0)) /*MMC1_DAT2*/\
++	MUX_VAL(CP(MMC1_DAT3),         (IEN  | PTU | DIS | M0)) /*MMC1_DAT3*/\
++	MUX_VAL(CP(MMC1_DAT4),         (IEN  | PTU | DIS | M0)) /*MMC1_DAT4*/\
++	MUX_VAL(CP(MMC1_DAT5),         (IEN  | PTU | DIS | M0)) /*MMC1_DAT5*/\
++	MUX_VAL(CP(MMC1_DAT6),         (IEN  | PTU | DIS | M0)) /*MMC1_DAT6*/\
++	MUX_VAL(CP(MMC1_DAT7),         (IEN  | PTU | DIS | M0)) /*MMC1_DAT7*/\
++	MUX_VAL(CP(McBSP1_DX),      (IEN  | PTD | DIS | M4)) /*GPIO_158*/\
++	MUX_VAL(CP(SYS_32K),        (IEN  | PTD | DIS | M0)) /*SYS_32K*/\
++	MUX_VAL(CP(SYS_BOOT0),      (IEN  | PTD | DIS | M4)) /*GPIO_2 */\
++	MUX_VAL(CP(SYS_BOOT1),      (IEN  | PTD | DIS | M4)) /*GPIO_3 */\
++	MUX_VAL(CP(SYS_BOOT2),      (IEN  | PTD | DIS | M4)) /*GPIO_4 */\
++	MUX_VAL(CP(SYS_BOOT3),      (IEN  | PTD | DIS | M4)) /*GPIO_5 */\
++	MUX_VAL(CP(SYS_BOOT4),      (IEN  | PTD | DIS | M4)) /*GPIO_6 */\
++	MUX_VAL(CP(SYS_BOOT5),      (IEN  | PTD | DIS | M4)) /*GPIO_7 */\
++	MUX_VAL(CP(SYS_BOOT6),      (IEN  | PTD | DIS | M4)) /*GPIO_8 */\
++	MUX_VAL(CP(SYS_CLKOUT2),    (IEN  | PTU | EN  | M4)) /*GPIO_186*/\
++	MUX_VAL(CP(JTAG_nTRST),     (IEN  | PTD | DIS | M0)) /*JTAG_nTRST*/\
++	MUX_VAL(CP(JTAG_TCK),       (IEN  | PTD | DIS | M0)) /*JTAG_TCK*/\
++	MUX_VAL(CP(JTAG_TMS),       (IEN  | PTD | DIS | M0)) /*JTAG_TMS*/\
++	MUX_VAL(CP(JTAG_TDI),       (IEN  | PTD | DIS | M0)) /*JTAG_TDI*/\
++	MUX_VAL(CP(JTAG_EMU0),      (IEN  | PTD | DIS | M0)) /*JTAG_EMU0*/\
++	MUX_VAL(CP(JTAG_EMU1),      (IEN  | PTD | DIS | M0)) /*JTAG_EMU1*/\
++	MUX_VAL(CP(ETK_CLK),        (IEN  | PTD | DIS | M4)) /*GPIO_12*/\
++	MUX_VAL(CP(ETK_CTL),        (IEN  | PTD | DIS | M4)) /*GPIO_13*/\
++	MUX_VAL(CP(ETK_D0),        (IEN  | PTD | DIS | M4)) /*GPIO_14*/\
++	MUX_VAL(CP(ETK_D1),        (IEN  | PTD | DIS | M4)) /*GPIO_15*/\
++	MUX_VAL(CP(ETK_D2),        (IEN  | PTD | DIS | M4)) /*GPIO_16*/\
++	MUX_VAL(CP(ETK_D10),        (IEN  | PTD | DIS | M4)) /*GPIO_24*/\
++	MUX_VAL(CP(ETK_D11),        (IEN  | PTD | DIS | M4)) /*GPIO_25*/\
++	MUX_VAL(CP(ETK_D12),        (IEN  | PTD | DIS | M4)) /*GPIO_26*/\
++	MUX_VAL(CP(ETK_D13),        (IEN  | PTD | DIS | M4)) /*GPIO_27*/\
++	MUX_VAL(CP(ETK_D14),        (IEN  | PTD | DIS | M4)) /*GPIO_28*/\
++	MUX_VAL(CP(ETK_D15),        (IEN  | PTD | DIS | M4)) /*GPIO_29*/
++
++/**********************************************************
++ * Routine: set_muxconf_regs
++ * Description: Setting up the configuration Mux registers
++ *              specific to the hardware. Many pins need
++ *              to be moved from protect to primary mode.
++ *********************************************************/
++void set_muxconf_regs(void)
++{
++	MUX_DEFAULT();
++}
++
++/**********************************************************
++ * Routine: nand+_init
++ * Description: Set up nand for nand and jffs2 commands
++ *********************************************************/
++
++int nand_init(void)
++{
++	/* global settings */
++	__raw_writel(0x10, GPMC_SYSCONFIG);	/* smart idle */
++	__raw_writel(0x0, GPMC_IRQENABLE);	/* isr's sources masked */
++	__raw_writel(0, GPMC_TIMEOUT_CONTROL);/* timeout disable */
++
++	/* Set the GPMC Vals . For NAND boot on 3430SDP, NAND is mapped at CS0
++	 * , NOR at CS1 and MPDB at CS3. And oneNAND boot, we map oneNAND at
++	 * CS0. We configure only GPMC CS0 with required values. Configiring
++	 * other devices at other CS in done in u-boot anyway. So we don't
++	 * have to bother doing it here.
++	 */
++
++	__raw_writel(0, GPMC_CONFIG7 + GPMC_CONFIG_CS0);
++	delay(1000);
++
++	if ((get_mem_type() == GPMC_NAND) || (get_mem_type() == MMC_NAND)) {
++		__raw_writel(M_NAND_GPMC_CONFIG1,
++				GPMC_CONFIG1 + GPMC_CONFIG_CS0);
++		__raw_writel(M_NAND_GPMC_CONFIG2,
++				GPMC_CONFIG2 + GPMC_CONFIG_CS0);
++		__raw_writel(M_NAND_GPMC_CONFIG3,
++				GPMC_CONFIG3 + GPMC_CONFIG_CS0);
++		__raw_writel(M_NAND_GPMC_CONFIG4,
++				GPMC_CONFIG4 + GPMC_CONFIG_CS0);
++		__raw_writel(M_NAND_GPMC_CONFIG5,
++				GPMC_CONFIG5 + GPMC_CONFIG_CS0);
++		__raw_writel(M_NAND_GPMC_CONFIG6,
++				GPMC_CONFIG6 + GPMC_CONFIG_CS0);
++
++		/* Enable the GPMC Mapping */
++		__raw_writel((((OMAP34XX_GPMC_CS0_SIZE & 0xF)<<8) |
++					((NAND_BASE_ADR>>24) & 0x3F) | (1<<6)),
++				(GPMC_CONFIG7 + GPMC_CONFIG_CS0));
++		delay(2000);
++
++		if (nand_chip()) {
++#ifdef CFG_PRINTF
++			printf("Unsupported Chip!\n");
++#endif
++			return 1;
++		}
++	}
++
++	if ((get_mem_type() == GPMC_ONENAND) ||
++			(get_mem_type() == MMC_ONENAND)) {
++		__raw_writel(ONENAND_GPMC_CONFIG1,
++				GPMC_CONFIG1 + GPMC_CONFIG_CS0);
++		__raw_writel(ONENAND_GPMC_CONFIG2,
++				GPMC_CONFIG2 + GPMC_CONFIG_CS0);
++		__raw_writel(ONENAND_GPMC_CONFIG3,
++				GPMC_CONFIG3 + GPMC_CONFIG_CS0);
++		__raw_writel(ONENAND_GPMC_CONFIG4,
++				GPMC_CONFIG4 + GPMC_CONFIG_CS0);
++		__raw_writel(ONENAND_GPMC_CONFIG5,
++				GPMC_CONFIG5 + GPMC_CONFIG_CS0);
++		__raw_writel(ONENAND_GPMC_CONFIG6,
++				GPMC_CONFIG6 + GPMC_CONFIG_CS0);
++
++		/* Enable the GPMC Mapping */
++		__raw_writel((((OMAP34XX_GPMC_CS0_SIZE & 0xF)<<8) |
++					((ONENAND_BASE>>24) & 0x3F) | (1<<6)),
++				(GPMC_CONFIG7 + GPMC_CONFIG_CS0));
++		delay(2000);
++
++		if (onenand_chip()) {
++#ifdef CFG_PRINTF
++			printf("OneNAND Unsupported !\n");
++#endif
++			return 1;
++		}
++	}
++	return 0;
++}
++
++
++typedef int (mmc_boot_addr) (void);
++int mmc_boot(unsigned char *buf)
++{
++	long size = 0;
++#ifdef CFG_CMD_FAT
++	block_dev_desc_t *dev_desc = NULL;
++	unsigned char ret = 0;
++	printf("Starting X-loader on MMC \n");
++
++	ret = mmc_init(1);
++	if (ret == 0) {
++		printf("\n MMC init failed \n");
++		return 0;
++	}
++
++	dev_desc = mmc_get_dev(0);
++	fat_register_device(dev_desc, 1);
++	size = file_fat_read("u-boot.bin", buf, 0);
++	if (size == -1)
++		return 0;
++
++	printf("\n%ld Bytes Read from MMC \n", size);
++
++	printf("Starting OS Bootloader from MMC...\n");
++#endif
++	return size;
++}
++
++/* optionally do something like blinking LED */
++void board_hang(void)
++{
++	while (0)
++		;
++}
+diff --git a/board/am3517crane/am3517crane.h b/board/am3517crane/am3517crane.h
+new file mode 100644
+index 0000000..400b774
+--- /dev/null
++++ b/board/am3517crane/am3517crane.h
+@@ -0,0 +1,103 @@
++/*
++ * (C) Copyright 2010 Mistral Solutions Pvt Ltd. <www.mistralsolutions.com>
++ * Umesh Krishnan <umeshk@mistralsolutions.com>
++ *
++ * Header file for board/am3517crane/am3517crane.c
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#define MAX_SIL_INDEX	3
++
++/* Definitions for EMIF4 configuration values */
++#define	EMIF4_TIM1_T_RP		0x2
++#define	EMIF4_TIM1_T_RCD	0x2
++#define	EMIF4_TIM1_T_WR		0x2
++#define	EMIF4_TIM1_T_RAS	0x7
++#define	EMIF4_TIM1_T_RC		0x9
++#define	EMIF4_TIM1_T_RRD	0x1
++#define	EMIF4_TIM1_T_WTR	0x1
++
++#define	EMIF4_TIM2_T_XP		0x1
++#define	EMIF4_TIM2_T_ODT	0x2
++#define	EMIF4_TIM2_T_XSNR	0xE
++#define	EMIF4_TIM2_T_XSRD	0xC7
++#define	EMIF4_TIM2_T_RTP	0x1
++#define	EMIF4_TIM2_T_CKE	0x2
++
++#define	EMIF4_TIM3_T_TDQSCKMAX	0x0
++#define	EMIF4_TIM3_T_RFC	0x15
++#define	EMIF4_TIM3_T_RAS_MAX	0x7
++
++#define	EMIF4_PWR_IDLE		0x2
++#define	EMIF4_PWR_DPD_EN	0x0
++#define	EMIF4_PWR_PM_EN		0x0
++#define	EMIF4_PWR_PM_TIM	0x0
++
++#define	EMIF4_INITREF_DIS	0x0
++#define	EMIF4_PASR		0x0
++#define	EMIF4_REFRESH_RATE	0x50F
++
++/*
++ * SDRAM Config register
++ */
++#define	EMIF4_CFG_SDRAM_TYP	0x2
++#define	EMIF4_CFG_IBANK_POS	0x0
++#define	EMIF4_CFG_DDR_TERM	0x0
++#define	EMIF4_CFG_DDR2_DDQS	0x1
++#define	EMIF4_CFG_DYN_ODT	0x0
++#define	EMIF4_CFG_DDR_DIS_DLL	0x0
++#define	EMIF4_CFG_SDR_DRV	0x0
++#define	EMIF4_CFG_CWL		0x0
++#define	EMIF4_CFG_NARROW_MD	0x0
++#define	EMIF4_CFG_CL		0x6
++#define	EMIF4_CFG_ROWSIZE	0x0
++#define	EMIF4_CFG_IBANK		0x3
++#define	EMIF4_CFG_EBANK		0x0
++#define	EMIF4_CFG_PGSIZE	0x2
++
++/*
++ * EMIF4 PHY Control 1 register configuration
++ */
++#define EMIF4_DDR1_RD_LAT	0x6
++#define	EMIF4_DDR1_PWRDN_DIS	0x0
++#define EMIF4_DDR1_STRBEN_EXT	0x0
++#define EMIF4_DDR1_DLL_MODE	0x0
++#define EMIF4_DDR1_VTP_DYN	0x0
++#define EMIF4_DDR1_LB_CK_SEL	0x0
++
++/*
++ * EMIF4 PHY Control 2 register configuration
++ */
++#define EMIF4_DDR2_TX_DATA_ALIGN	0x0
++#define EMIF4_DDR2_RX_DLL_BYPASS	0x0
++
++/* Following functions are exported from lowlevel_init.S */
++extern struct dpll_param *get_mpu_dpll_param(void);
++extern struct dpll_param *get_core_dpll_param(void);
++extern struct dpll_param *get_per_dpll_param(void);
++
++extern int mmc_init(int verbose);
++extern block_dev_desc_t *mmc_get_dev(int dev);
++
++#define __raw_readl(a)    (*(volatile unsigned int *)(a))
++#define __raw_writel(v, a) (*(volatile unsigned int *)(a) = (v))
++#define __raw_readw(a)    (*(volatile unsigned short *)(a))
++#define __raw_writew(v, a) (*(volatile unsigned short *)(a) = (v))
++
+diff --git a/board/am3517crane/config.mk b/board/am3517crane/config.mk
+new file mode 100644
+index 0000000..bc696de
+--- /dev/null
++++ b/board/am3517crane/config.mk
+@@ -0,0 +1,20 @@
++#
++# (C) Copyright 2010 Mistral Solutions Pvt Ltd. <www.mistralsolutions.com>
++# Umesh Krishnan <umeshk@mistralsolutions.com>
++#
++# Craneboard uses AM3517 (ARM-CortexA8) cpu
++# see http://www.ti.com/ for more information
++#
++# Am3517 has 1 bank of 128MB Discrete SDRAM on CS0
++# Physical Address:
++# 8000'0000 (bank0)
++#
++# For use if you want X-Loader to relocate from SRAM to DDR
++#TEXT_BASE = 0x80e80000
++#
++# For XIP in 64K of SRAM or debug (GP device has it all availabe)
++# SRAM 40200000-4020FFFF base
++# initial stack at 0x4020fffc used in s_init (below xloader).
++# The run time stack is (above xloader, 2k below)
++# If any globals exist there needs to be room for them also
++TEXT_BASE = 0x40208800
+diff --git a/board/am3517crane/platform.S b/board/am3517crane/platform.S
+new file mode 100644
+index 0000000..f725bc5
+--- /dev/null
++++ b/board/am3517crane/platform.S
+@@ -0,0 +1,436 @@
++/*
++ * Board specific setup info
++ *
++ * (C) Copyright 2010 Mistral Solutions Pvt Ltd. <www.mistralsolutions.com>
++ * Umesh Krishnan <umeshk@mistralsolutions.com>
++ *
++ * This file is copied from board/am3517evm/platform.S
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#include <config.h>
++#include <asm/arch/cpu.h>
++#include <asm/arch/mem.h>
++#include <asm/arch/clocks.h>
++
++_TEXT_BASE:
++	.word	TEXT_BASE	/* sdram load addr from config.mk */
++
++#if !defined(CFG_NAND_BOOT) && !defined(CFG_NAND_BOOT)
++/**************************************************************************
++ * cpy_clk_code: relocates clock code into SRAM where its safer to execute
++ * R1 = SRAM destination address.
++ *************************************************************************/
++.global cpy_clk_code
++ cpy_clk_code:
++        /* Copy DPLL code into SRAM */
++        adr     r0, go_to_speed         /* get addr of clock setting code */
++        mov     r2, #384                /* r2 size to copy (div by 32 bytes) */
++        mov     r1, r1                  /* r1 <- dest address (passed in) */
++        add     r2, r2, r0              /* r2 <- source end address */
++next2:
++        ldmia   r0!, {r3-r10}           /* copy from source address [r0]    */
++        stmia   r1!, {r3-r10}           /* copy to   target address [r1]    */
++        cmp     r0, r2                  /* until source end address [r2]    */
++        bne     next2
++	mov	pc, lr                  /* back to caller */
++
++/* ****************************************************************************
++ * NOTE: 3430 X-loader currently does not use this code.
++*   It could be removed its is kept for compatabily with u-boot.
++ *
++ *  go_to_speed: -Moves to bypass, -Commits clock dividers, -puts dpll at speed
++ *               -executed from SRAM.
++ *  R0 = CM_CLKEN_PLL-bypass value
++ *  R1 = CM_CLKSEL1_PLL-m, n, and divider values
++ *  R2 = CM_CLKSEL_CORE-divider values
++ *  R3 = CM_IDLEST_CKGEN - addr dpll lock wait
++ *
++ *  Note: If core unlocks/relocks and SDRAM is running fast already it gets
++ *        confused.  A reset of the controller gets it back.  Taking away its
++ *        L3 when its not in self refresh seems bad for it.  Normally, this code
++ *        runs from flash before SDR is init so that should be ok.
++ ******************************************************************************/
++.global go_to_speed
++ go_to_speed:
++        stmfd sp!, {r4-r6}
++
++        /* move into fast relock bypass */
++        ldr     r4, pll_ctl_add
++        str     r0, [r4]
++wait1:
++        ldr     r5, [r3]       /* get status */
++        and     r5, r5, #0x1   /* isolate core status */
++        cmp     r5, #0x1       /* still locked? */
++        beq     wait1          /* if lock, loop */
++
++	/* set new dpll dividers _after_ in bypass */
++	ldr     r5, pll_div_add1
++        str     r1, [r5]          /* set m, n, m2 */
++        ldr     r5, pll_div_add2
++        str     r2, [r5]          /* set l3/l4/.. dividers*/
++        ldr     r5, pll_div_add3  /* wkup */
++        ldr     r2, pll_div_val3  /* rsm val */
++        str     r2, [r5]
++        ldr     r5, pll_div_add4  /* gfx */
++        ldr     r2, pll_div_val4
++        str     r2, [r5]
++        ldr     r5, pll_div_add5  /* emu */
++        ldr     r2, pll_div_val5
++        str     r2, [r5]
++
++        /* now prepare GPMC (flash) for new dpll speed */
++	/* flash needs to be stable when we jump back to it */
++        ldr     r5, flash_cfg3_addr
++        ldr     r2, flash_cfg3_val
++        str     r2, [r5]
++        ldr     r5, flash_cfg4_addr
++        ldr     r2, flash_cfg4_val
++        str     r2, [r5]
++        ldr     r5, flash_cfg5_addr
++        ldr     r2, flash_cfg5_val
++        str     r2, [r5]
++        ldr     r5, flash_cfg1_addr
++        ldr     r2, [r5]
++        orr     r2, r2, #0x3     /* up gpmc divider */
++        str     r2, [r5]
++
++        /* lock DPLL3 and wait a bit */
++        orr     r0, r0, #0x7   /* set up for lock mode */
++        str     r0, [r4]       /* lock */
++        nop                    /* ARM slow at this point working at sys_clk */
++        nop
++        nop
++        nop
++wait2:
++        ldr     r5, [r3]       /* get status */
++        and     r5, r5, #0x1   /* isolate core status */
++        cmp     r5, #0x1       /* still locked? */
++        bne     wait2          /* if lock, loop */
++        nop
++        nop
++        nop
++        nop
++        ldmfd sp!, {r4-r6}
++        mov     pc, lr           /* back to caller, locked */
++
++_go_to_speed: .word go_to_speed
++
++/* these constants need to be close for PIC code */
++/* The Nor has to be in the Flash Base CS0 for this condition to happen */
++flash_cfg1_addr:
++    .word (GPMC_CONFIG_CS0 + GPMC_CONFIG1)
++flash_cfg3_addr:
++    .word  (GPMC_CONFIG_CS0 + GPMC_CONFIG3)
++flash_cfg3_val:
++    .word  STNOR_GPMC_CONFIG3
++flash_cfg4_addr:
++    .word (GPMC_CONFIG_CS0 + GPMC_CONFIG4)
++flash_cfg4_val:
++    .word  STNOR_GPMC_CONFIG4
++flash_cfg5_val:
++    .word  STNOR_GPMC_CONFIG5
++flash_cfg5_addr:
++    .word (GPMC_CONFIG_CS0 + GPMC_CONFIG5)
++pll_ctl_add:
++    .word CM_CLKEN_PLL
++pll_div_add1:
++    .word CM_CLKSEL1_PLL
++pll_div_add2:
++    .word CM_CLKSEL_CORE
++pll_div_add3:
++    .word CM_CLKSEL_WKUP
++pll_div_val3:
++    .word (WKUP_RSM << 1)
++pll_div_add4:
++    .word CM_CLKSEL_GFX
++pll_div_val4:
++    .word (GFX_DIV << 0)
++pll_div_add5:
++    .word CM_CLKSEL1_EMU
++pll_div_val5:
++    .word CLSEL1_EMU_VAL
++
++#endif
++
++.globl lowlevel_init
++lowlevel_init:
++	ldr	sp,	SRAM_STACK
++        str     ip,	[sp]    /* stash old link register */
++	mov	ip,	lr	/* save link reg across call */
++        bl      s_init          /* go setup pll,mux,memory */
++        ldr     ip,	[sp]    /* restore save ip */
++	mov	lr,	ip	/* restore link reg */
++
++	/* back to arch calling code */
++	mov	pc,	lr
++
++	/* the literal pools origin */
++	.ltorg
++
++REG_CONTROL_STATUS:
++	.word CONTROL_STATUS
++SRAM_STACK:
++	.word LOW_LEVEL_SRAM_STACK
++
++
++/* DPLL(1-4) PARAM TABLES */
++/* Each of the tables has M, N, FREQSEL, M2 values defined for nominal
++ * OPP (1.2V). The fields are defined according to dpll_param struct(clock.c).
++ * The values are defined for all possible sysclk and for ES1 and ES2.
++ */
++
++mpu_dpll_param:
++/* 12MHz */
++/* ES1 */
++.word 0x0FE
++.word 0x07
++.word 0x05
++.word 0x01
++/* ES2 */
++.word 0x0FA
++.word 0x05
++.word 0x07
++.word 0x01
++
++/* 13MHz */
++/* ES1 */
++.word 0x17D
++.word 0x0C
++.word 0x03
++.word 0x01
++/* ES2 */
++.word 0x1F4
++.word 0x0C
++.word 0x03
++.word 0x01
++
++/* 19.2MHz */
++/* ES1 */
++.word 0x179
++.word 0x12
++.word 0x04
++.word 0x01
++/* ES2 */
++.word 0x271
++.word 0x17
++.word 0x03
++.word 0x01
++
++/* 26MHz */
++/* ES1 */
++.word 0x17D
++.word 0x19
++.word 0x03
++.word 0x01
++/* ES2 */
++.word 0x0FA
++.word 0x0C
++.word 0x07
++.word 0x01
++
++/* 38.4MHz */
++/* ES1 */
++.word 0x1FA
++.word 0x32
++.word 0x03
++.word 0x01
++/* ES2 */
++.word 0x271
++.word 0x2F
++.word 0x03
++.word 0x01
++
++
++.globl get_mpu_dpll_param
++get_mpu_dpll_param:
++	adr r0, mpu_dpll_param
++	mov pc, lr
++
++iva_dpll_param:
++/* 12MHz */
++/* ES1 */
++.word 0x07D
++.word 0x05
++.word 0x07
++.word 0x01
++/* ES2 */
++.word 0x0B4
++.word 0x05
++.word 0x07
++.word 0x01
++
++/* 13MHz */
++/* ES1 */
++.word 0x0FA
++.word 0x0C
++.word 0x03
++.word 0x01
++/* ES2 */
++.word 0x168
++.word 0x0C
++.word 0x03
++.word 0x01
++
++/* 19.2MHz */
++/* ES1 */
++.word 0x082
++.word 0x09
++.word 0x07
++.word 0x01
++/* ES2 */
++.word 0x0E1
++.word 0x0B
++.word 0x06
++.word 0x01
++
++/* 26MHz */
++/* ES1 */
++.word 0x07D
++.word 0x0C
++.word 0x07
++.word 0x01
++/* ES2 */
++.word 0x0B4
++.word 0x0C
++.word 0x07
++.word 0x01
++
++/* 38.4MHz */
++/* ES1 */
++.word 0x13F
++.word 0x30
++.word 0x03
++.word 0x01
++/* ES2 */
++.word 0x0E1
++.word 0x17
++.word 0x06
++.word 0x01
++
++
++.globl get_iva_dpll_param
++get_iva_dpll_param:
++	adr r0, iva_dpll_param
++	mov pc, lr
++
++core_dpll_param:
++/* 12MHz */
++/* ES1 */
++.word 0x19F
++.word 0x0E
++.word 0x03
++.word 0x01
++/* ES2 */
++.word 0x0A6
++.word 0x05
++.word 0x07
++.word 0x01
++
++/* 13MHz */
++/* ES1 */
++.word 0x1B2
++.word 0x10
++.word 0x03
++.word 0x01
++/* ES2 */
++.word 0x14C
++.word 0x0C
++.word 0x03
++.word 0x01
++
++/* 19.2MHz */
++/* ES1 */
++.word 0x19F
++.word 0x17
++.word 0x03
++.word 0x01
++/* ES2 */
++.word 0x19F
++.word 0x17
++.word 0x03
++.word 0x01
++
++/* 26MHz */
++/* ES1 */
++.word 0x1B2
++.word 0x21
++.word 0x03
++.word 0x01
++/* ES2 */
++.word 0x0A6
++.word 0x0C
++.word 0x07
++.word 0x01
++
++/* 38.4MHz */
++/* ES1 */
++.word 0x19F
++.word 0x2F
++.word 0x03
++.word 0x01
++/* ES2 */
++.word 0x19F
++.word 0x2F
++.word 0x03
++.word 0x01
++
++.globl get_core_dpll_param
++get_core_dpll_param:
++	adr r0, core_dpll_param
++	mov pc, lr
++
++/* PER DPLL values are same for both ES1 and ES2 */
++per_dpll_param:
++/* 12MHz */
++.word 0xD8
++.word 0x05
++.word 0x07
++.word 0x09
++
++/* 13MHz */
++.word 0x1B0
++.word 0x0C
++.word 0x03
++.word 0x09
++
++/* 19.2MHz */
++.word 0xE1
++.word 0x09
++.word 0x07
++.word 0x09
++
++/* 26MHz */
++.word 0xD8
++.word 0x0C
++.word 0x07
++.word 0x09
++
++/* 38.4MHz */
++.word 0xE1
++.word 0x13
++.word 0x07
++.word 0x09
++
++.globl get_per_dpll_param
++get_per_dpll_param:
++	adr r0, per_dpll_param
++	mov pc, lr
++
+diff --git a/board/am3517crane/x-load.lds b/board/am3517crane/x-load.lds
+new file mode 100644
+index 0000000..eb2a02a
+--- /dev/null
++++ b/board/am3517crane/x-load.lds
+@@ -0,0 +1,53 @@
++/*
++ * (C) Copyright 2010 Mistral Solutions Pvt Ltd. <www.mistralsolutions.com>
++ * Umesh Krishnan <umeshk@mistralsolutions.com>
++ *
++ * This file is copied from board/am3517evm/x-load.lds
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
++OUTPUT_ARCH(arm)
++ENTRY(_start)
++SECTIONS
++{
++	. = 0x00000000;
++
++	. = ALIGN(4);
++	.text      :
++	{
++	  cpu/omap3/start.o	(.text)
++	  *(.text)
++	}
++
++	. = ALIGN(4);
++	.rodata : { *(.rodata) }
++
++	. = ALIGN(4);
++	.data : { *(.data) }
++
++	. = ALIGN(4);
++	.got : { *(.got) }
++
++	. = ALIGN(4);
++	__bss_start = .;
++	.bss : { *(.bss) }
++	_end = .;
++}
+diff --git a/board/am3517evm/platform.S b/board/am3517evm/platform.S
+index f703ddb..c98f6e7 100644
+--- a/board/am3517evm/platform.S
++++ b/board/am3517evm/platform.S
+@@ -205,7 +205,7 @@ mpu_dpll_param:
+ .word 0x05
+ .word 0x01
+ /* ES2 */
+-.word 0x12C
++.word 0x0FA
+ .word 0x05
+ .word 0x07
+ .word 0x01
+@@ -217,7 +217,7 @@ mpu_dpll_param:
+ .word 0x03
+ .word 0x01
+ /* ES2 */
+-.word 0x258
++.word 0x1F4
+ .word 0x0C
+ .word 0x03
+ .word 0x01
+@@ -230,7 +230,7 @@ mpu_dpll_param:
+ .word 0x01
+ /* ES2 */
+ .word 0x271
+-.word 0x13
++.word 0x17
+ .word 0x03
+ .word 0x01
+
+@@ -241,7 +241,7 @@ mpu_dpll_param:
+ .word 0x03
+ .word 0x01
+ /* ES2 */
+-.word 0x12C
++.word 0x0FA
+ .word 0x0C
+ .word 0x07
+ .word 0x01
+@@ -254,7 +254,7 @@ mpu_dpll_param:
+ .word 0x01
+ /* ES2 */
+ .word 0x271
+-.word 0x27
++.word 0x2F
+ .word 0x03
+ .word 0x01
+
+diff --git a/board/omap3evm/omap3evm.c b/board/omap3evm/omap3evm.c
+index d232889..e7bcdfb 100755
+--- a/board/omap3evm/omap3evm.c
++++ b/board/omap3evm/omap3evm.c
+@@ -56,8 +56,6 @@ struct dpll_per_36x_param {
+
+ typedef struct dpll_param dpll_param;
+
+-extern unsigned int is_ddr_166M;
+-
+ #define MAX_SIL_INDEX	3
+
+ /* Following functions are exported from lowlevel_init.S */
+@@ -315,13 +313,8 @@ void config_3430sdram_ddr(void)
+
+ 	/* set timing */
+ 	if (is_cpu_family() == CPU_OMAP36XX) {
+-		if (is_ddr_166M) {
+-			__raw_writel(MICRON_SDRC_ACTIM_CTRLA_0, SDRC_ACTIM_CTRLA_0);
+-			__raw_writel(MICRON_SDRC_ACTIM_CTRLB_0, SDRC_ACTIM_CTRLB_0);
+-		} else {
+-			__raw_writel(HYNIX_SDRC_ACTIM_CTRLA_0, SDRC_ACTIM_CTRLA_0);
+-			__raw_writel(HYNIX_SDRC_ACTIM_CTRLB_0, SDRC_ACTIM_CTRLB_0);
+-		}
++		__raw_writel(HYNIX_SDRC_ACTIM_CTRLA_0, SDRC_ACTIM_CTRLA_0);
++		__raw_writel(HYNIX_SDRC_ACTIM_CTRLB_0, SDRC_ACTIM_CTRLB_0);
+
+ 	} else {
+ 		if ((get_mem_type() == GPMC_ONENAND) || (get_mem_type() == MMC_ONENAND)){
+@@ -363,22 +356,13 @@ void config_3430sdram_ddr(void)
+          (*(unsigned int*)0x6D000080) = 0x02584099;//from Micron
+
+ 	 if (is_cpu_family() == CPU_OMAP36XX) {
+-		 if (is_ddr_166M) {
+-			 /* SDRC_ACTIM_CTRLA0 register */
+-			 (*(unsigned int*)0x6D00009c) = 0xaa9db4c6;// for 166M
+-			 /* SDRC_ACTIM_CTRLB0 register */
+-			 (*(unsigned int*)0x6D0000a0) = 0x00011517;
+-		 } else {
+-			 /* SDRC_ACTIM_CTRLA0 register */
+-			 (*(unsigned int*)0x6D00009c) = 0x92e1c4c6;// for 200M
+-			 /* SDRC_ACTIM_CTRLB0 register */
+-			 (*(unsigned int*)0x6D0000a0) = 0x0002111c;
+-			 /* SDRC_MCFG0 register - for Hynix*/
+-			 (*(unsigned int *)0x6D000080) = 0x03588099;
+-		 }
++		 /* SDRC_ACTIM_CTRLA0 register */
++		 (*(unsigned int*)0x6D00009c) = 0x92e1c4c6;// for 200M
++		 /* SDRC_ACTIM_CTRLB0 register */
++		 (*(unsigned int*)0x6D0000a0) = 0x0002111c;
+ 	 } else {
+ 		 /* SDRC_ACTIM_CTRLA0 register */
+-		 (*(unsigned int*)0x6D00009c) = 0xaa9db4c6;// for 166M
++		 (*(unsigned int*)0x6D00009c) = 0xaa9db4c6;// for 166M from rkw
+ 		 /* SDRC_ACTIM_CTRLB0 register */
+ 		 (*(unsigned int*)0x6D0000a0) = 0x00011517;
+ 	 }
+@@ -936,11 +920,6 @@ void s_init(void)
+ 	delay(100);
+ 	prcm_init();
+ 	per_clocks_enable();
+-	/*
+-	 * WORKAROUND: To suuport both Micron and Hynix NAND/DDR parts
+-	 */
+-	if ((get_mem_type() == GPMC_NAND) || (get_mem_type() == MMC_NAND))
+-		nand_init();
+ 	config_3430sdram_ddr();
+ }
+
+diff --git a/board/omap3evm/platform.S b/board/omap3evm/platform.S
+index 1c85273..73a3c48 100755
+--- a/board/omap3evm/platform.S
++++ b/board/omap3evm/platform.S
+@@ -204,7 +204,7 @@ mpu_dpll_param:
+ .word 0x05
+ .word 0x01
+ /* ES2 */
+-.word 0x12C
++.word 0x0FA
+ .word 0x05
+ .word 0x07
+ .word 0x01
+@@ -216,7 +216,7 @@ mpu_dpll_param:
+ .word 0x03
+ .word 0x01
+ /* ES2 */
+-.word 0x258
++.word 0x1F4
+ .word 0x0C
+ .word 0x03
+ .word 0x01
+@@ -229,7 +229,7 @@ mpu_dpll_param:
+ .word 0x01
+ /* ES2 */
+ .word 0x271
+-.word 0x13
++.word 0x17
+ .word 0x03
+ .word 0x01
+
+@@ -240,7 +240,7 @@ mpu_dpll_param:
+ .word 0x03
+ .word 0x01
+ /* ES2 */
+-.word 0x12C
++.word 0x0FA
+ .word 0x0C
+ .word 0x07
+ .word 0x01
+@@ -253,7 +253,7 @@ mpu_dpll_param:
+ .word 0x01
+ /* ES2 */
+ .word 0x271
+-.word 0x27
++.word 0x2F
+ .word 0x03
+ .word 0x01
+
+diff --git a/common/Makefile b/common/Makefile
+new file mode 100644
+index 0000000..c1381e0
+--- /dev/null
++++ b/common/Makefile
+@@ -0,0 +1,50 @@
++
++#
++# (C) Copyright 2004
++# Wolfgang Denk, DENX Software Engineering, wd@denx.de.
++#
++# See file CREDITS for list of people who contributed to this
++# project.
++#
++# This program is free software; you can redistribute it and/or
++# modify it under the terms of the GNU General Public License as
++# published by the Free Software Foundation; either version 2 of
++# the License, or (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++# MA 02111-1307 USA
++#
++
++include $(TOPDIR)/config.mk
++
++LIB     = libcommon.a
++
++AOBJS   =
++
++COBJS   = cmd_load.o
++
++OBJS    = $(AOBJS) $(COBJS)
++
++CPPFLAGS += -I..
++
++all:    $(LIB) $(AOBJS)
++
++$(LIB): .depend $(OBJS)
++	$(AR) crv $@ $(OBJS)
++
++#########################################################################
++
++.depend:        Makefile $(AOBJS:.o=.S) $(COBJS:.o=.c)
++	        $(CC) -M $(CFLAGS) $(AOBJS:.o=.S) $(COBJS:.o=.c) > $@
++
++sinclude .depend
++
++#########################################################################
++
+diff --git a/common/cmd_load.c b/common/cmd_load.c
+new file mode 100644
+index 0000000..dcf89b4
+--- /dev/null
++++ b/common/cmd_load.c
+@@ -0,0 +1,537 @@
++/*
++ * (C) Copyright 2000-2004
++ * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++/*
++ * Serial up- and download support
++ */
++#include <common.h>
++#include "cmd_load.h"
++
++
++/*******************************************************
++ * Routine: delay
++ * Description: spinning delay to use before udelay works
++ ******************************************************/
++static inline void delay(unsigned long loops)
++{
++	__asm__ volatile ("1:\n" "subs %0, %1, #1\n"
++			  "bne 1b" : "=r" (loops) : "0"(loops));
++}
++static inline void udelay(unsigned long us)
++{
++	delay(us * 200); /* approximate */
++}
++
++#ifdef CFG_CMD_FAT
++extern void *memcpy(void *dest, const void *src, size_t count);
++#else
++void *memcpy(void *dest, const void *src, size_t count)
++{
++	char *tmp = (char *) dest, *s = (char *) src;
++
++	while (count--)
++		*tmp++ = *s++;
++
++	return dest;
++}
++#endif
++
++/* -------------------------------------------------------------------- */
++
++static void set_kerm_bin_mode(unsigned long *);
++static int k_recv(void);
++static ulong load_serial_bin(ulong offset);
++
++
++char his_eol;        /* character he needs at end of packet */
++int  his_pad_count;  /* number of pad chars he needs */
++char his_pad_char;   /* pad chars he needs */
++char his_quote;      /* quote chars he'll use */
++
++int do_load_serial_bin(ulong offset, int baudrate)
++{
++	ulong addr;
++	int rcode = 0;
++
++	printf("## Ready for binary (kermit) download "
++		"to 0x%08lX at %d bps...\n",
++		offset,
++		baudrate);
++	addr = load_serial_bin(offset);
++	if (addr == ~0) {
++		printf("## Binary (kermit) download aborted\n");
++		rcode = 1;
++	} else {
++		printf("## Start Addr      = 0x%08lX\n", addr);
++	}
++
++	return rcode;
++}
++
++
++static ulong load_serial_bin(ulong offset)
++{
++	int size, i;
++
++	set_kerm_bin_mode((ulong *) offset);
++	size = k_recv();
++
++	/*
++	 * Gather any trailing characters (for instance, the ^D which
++	 * is sent by 'cu' after sending a file), and give the
++	 * box some time (100 * 1 ms)
++	 */
++	for (i = 0; i < 100; ++i) {
++		if (tstc())
++			(void) getc();
++		udelay(1000);
++	}
++
++	printf("## Total Size      = 0x%08x = %d Bytes\n", size, size);
++
++	return offset;
++}
++
++void send_pad(void)
++{
++	int count = his_pad_count;
++
++	while (count-- > 0)
++		putc(his_pad_char);
++}
++
++/* converts escaped kermit char to binary char */
++char ktrans(char in)
++{
++	if ((in & 0x60) == 0x40)
++		return (char) (in & ~0x40);
++	else if ((in & 0x7f) == 0x3f)
++		return (char) (in | 0x40);
++	else
++		return in;
++}
++
++int chk1(char *buffer)
++{
++	int total = 0;
++
++	while (*buffer)
++		total += *buffer++;
++
++	return (int) ((total + ((total >> 6) & 0x03)) & 0x3f);
++}
++
++void s1_sendpacket(char *packet)
++{
++	send_pad();
++	while (*packet)
++		putc(*packet++);
++}
++
++static char a_b[24];
++void send_ack(int n)
++{
++	a_b[0] = START_CHAR;
++	a_b[1] = tochar(3);
++	a_b[2] = tochar(n);
++	a_b[3] = ACK_TYPE;
++	a_b[4] = '\0';
++	a_b[4] = tochar(chk1(&a_b[1]));
++	a_b[5] = his_eol;
++	a_b[6] = '\0';
++	s1_sendpacket(a_b);
++}
++
++void send_nack(int n)
++{
++	a_b[0] = START_CHAR;
++	a_b[1] = tochar(3);
++	a_b[2] = tochar(n);
++	a_b[3] = NACK_TYPE;
++	a_b[4] = '\0';
++	a_b[4] = tochar(chk1(&a_b[1]));
++	a_b[5] = his_eol;
++	a_b[6] = '\0';
++	s1_sendpacket(a_b);
++}
++
++
++/* os_data_* takes an OS Open image and puts it into memory, and
++   puts the boot header in an array named os_data_header
++
++   if image is binary, no header is stored in os_data_header.
++*/
++void (*os_data_init) (void);
++void (*os_data_char) (char new_char);
++static int os_data_state, os_data_state_saved;
++int os_data_count;
++static int os_data_count_saved;
++static char *os_data_addr, *os_data_addr_saved;
++static char *bin_start_address;
++int os_data_header[8];
++static void bin_data_init(void)
++{
++	os_data_state = 0;
++	os_data_count = 0;
++	os_data_addr = bin_start_address;
++}
++static void os_data_save(void)
++{
++	os_data_state_saved = os_data_state;
++	os_data_count_saved = os_data_count;
++	os_data_addr_saved = os_data_addr;
++}
++static void os_data_restore(void)
++{
++	os_data_state = os_data_state_saved;
++	os_data_count = os_data_count_saved;
++	os_data_addr = os_data_addr_saved;
++}
++static void bin_data_char(char new_char)
++{
++	switch (os_data_state) {
++	case 0:					/* data */
++		*os_data_addr++ = new_char;
++		--os_data_count;
++		break;
++	}
++}
++static void set_kerm_bin_mode(unsigned long *addr)
++{
++	bin_start_address = (char *) addr;
++	os_data_init = bin_data_init;
++	os_data_char = bin_data_char;
++}
++
++
++/* k_data_* simply handles the kermit escape translations */
++static int k_data_escape, k_data_escape_saved;
++void k_data_init(void)
++{
++	k_data_escape = 0;
++	os_data_init();
++}
++void k_data_save(void)
++{
++	k_data_escape_saved = k_data_escape;
++	os_data_save();
++}
++void k_data_restore(void)
++{
++	k_data_escape = k_data_escape_saved;
++	os_data_restore();
++}
++void k_data_char(char new_char)
++{
++	if (k_data_escape) {
++		/* last char was escape - translate this character */
++		os_data_char(ktrans(new_char));
++		k_data_escape = 0;
++	} else {
++		if (new_char == his_quote) {
++			/* this char is escape - remember */
++			k_data_escape = 1;
++		} else {
++			/* otherwise send this char as-is */
++			os_data_char(new_char);
++		}
++	}
++}
++
++#define SEND_DATA_SIZE  20
++char send_parms[SEND_DATA_SIZE];
++char *send_ptr;
++
++/* handle_send_packet interprits the protocol info and builds and
++   sends an appropriate ack for what we can do */
++void handle_send_packet(int n)
++{
++	int length = 3;
++	int bytes;
++
++	/* initialize some protocol parameters */
++	his_eol = END_CHAR;		/* default end of line character */
++	his_pad_count = 0;
++	his_pad_char = '\0';
++	his_quote = K_ESCAPE;
++
++	/* ignore last character if it filled the buffer */
++	if (send_ptr == &send_parms[SEND_DATA_SIZE - 1])
++		--send_ptr;
++	bytes = send_ptr - send_parms;	/* how many bytes we'll process */
++	do {
++		if (bytes-- <= 0)
++			break;
++		/* handle MAXL - max length */
++		/* ignore what he says - most I'll take (here) is 94 */
++		a_b[++length] = tochar(94);
++		if (bytes-- <= 0)
++			break;
++		/* handle TIME - time you should wait for my packets */
++		/* ignore what he says - don't wait for my
++		 * ack longer than 1 second */
++		a_b[++length] = tochar(1);
++		if (bytes-- <= 0)
++			break;
++		/* handle NPAD - number of pad chars I need */
++		/* remember what he says - I need none */
++		his_pad_count = untochar(send_parms[2]);
++		a_b[++length] = tochar(0);
++		if (bytes-- <= 0)
++			break;
++		/* handle PADC - pad chars I need */
++		/* remember what he says - I need none */
++		his_pad_char = ktrans(send_parms[3]);
++		a_b[++length] = 0x40;	/* He should ignore this */
++		if (bytes-- <= 0)
++			break;
++		/* handle EOL - end of line he needs */
++		/* remember what he says - I need CR */
++		his_eol = untochar(send_parms[4]);
++		a_b[++length] = tochar(END_CHAR);
++		if (bytes-- <= 0)
++			break;
++		/* handle QCTL - quote control char he'll use */
++		/* remember what he says - I'll use '#' */
++		his_quote = send_parms[5];
++		a_b[++length] = '#';
++		if (bytes-- <= 0)
++			break;
++		/* handle QBIN - 8-th bit prefixing */
++		/* ignore what he says - I refuse */
++		a_b[++length] = 'N';
++		if (bytes-- <= 0)
++			break;
++		/* handle CHKT - the clock check type */
++		/* ignore what he says - I do type 1 (for now) */
++		a_b[++length] = '1';
++		if (bytes-- <= 0)
++			break;
++		/* handle REPT - the repeat prefix */
++		/* ignore what he says - I refuse (for now) */
++		a_b[++length] = 'N';
++		if (bytes-- <= 0)
++			break;
++		/* handle CAPAS - the capabilities mask */
++		/* ignore what he says - I only do long packets
++		 * - I don't do windows */
++		a_b[++length] = tochar(2);	/* only long packets */
++		a_b[++length] = tochar(0);	/* no windows */
++		a_b[++length] = tochar(94);	/* large packet msb */
++		a_b[++length] = tochar(94);	/* large packet lsb */
++	} while (0);
++
++	a_b[0] = START_CHAR;
++	a_b[1] = tochar(length);
++	a_b[2] = tochar(n);
++	a_b[3] = ACK_TYPE;
++	a_b[++length] = '\0';
++	a_b[length] = tochar(chk1(&a_b[1]));
++	a_b[++length] = his_eol;
++	a_b[++length] = '\0';
++	s1_sendpacket(a_b);
++}
++
++/* k_recv receives a OS Open image file over kermit line */
++static int k_recv(void)
++{
++	char new_char;
++	char k_state, k_state_saved;
++	int sum;
++	int done;
++	int length;
++	int n, last_n;
++	int z = 0;
++	int len_lo, len_hi;
++
++	/* initialize some protocol parameters */
++	his_eol = END_CHAR;		/* default end of line character */
++	his_pad_count = 0;
++	his_pad_char = '\0';
++	his_quote = K_ESCAPE;
++
++	/* initialize the k_recv and k_data state machine */
++	done = 0;
++	k_state = 0;
++	k_data_init();
++	k_state_saved = k_state;
++	k_data_save();
++	n = 0;				/* just to get rid of a warning */
++	last_n = -1;
++
++	/* expect this "type" sequence (but don't check):
++	   S: send initiate
++	   F: file header
++	   D: data (multiple)
++	   Z: end of file
++	   B: break transmission
++	 */
++
++	/* enter main loop */
++	while (!done) {
++		/* set the send packet pointer to
++		 * begining of send packet parms */
++		send_ptr = send_parms;
++
++		/* With each packet, start summing the bytes starting
++		 * with the length.
++		 * Save the current sequence number.
++		 * Note the type of the packet.
++		 * If a character less than SPACE (0x20) is received - error.
++		 */
++
++#if 0
++		/* OLD CODE, Prior to checking sequence numbers */
++		/* first have all state machines save current states */
++		k_state_saved = k_state;
++		k_data_save();
++#endif
++
++		/* get a packet */
++		/* wait for the starting character or ^C */
++		for (;;) {
++			switch (getc()) {
++			case START_CHAR:	/* start packet */
++				goto START;
++			case ETX_CHAR:		/* ^C waiting for packet */
++				return 0;
++			default:
++				;
++			}
++		}
++START:
++		/* get length of packet */
++		sum = 0;
++		new_char = getc();
++		if ((new_char & 0xE0) == 0)
++			goto packet_error;
++		sum += new_char & 0xff;
++		length = untochar(new_char);
++		/* get sequence number */
++		new_char = getc();
++		if ((new_char & 0xE0) == 0)
++			goto packet_error;
++		sum += new_char & 0xff;
++		n = untochar(new_char);
++		--length;
++
++		/* NEW CODE - check sequence numbers for retried packets */
++		/* Note - this new code assumes that the sequence number is
++		 * correctly received.  Handling an invalid sequence number
++		 * adds another layer of complexity that may not be needed
++		 * - yet!  At this time, I'm hoping that I don't need to
++		 * buffer the incoming data packets and can write the data
++		 * into memory in real time.
++		 */
++		if (n == last_n) {
++			/* same sequence number, restore the previous state */
++			k_state = k_state_saved;
++			k_data_restore();
++		} else {
++			/* new sequence number, checkpoint the download */
++			last_n = n;
++			k_state_saved = k_state;
++			k_data_save();
++		}
++		/* END NEW CODE */
++
++		/* get packet type */
++		new_char = getc();
++		if ((new_char & 0xE0) == 0)
++			goto packet_error;
++		sum += new_char & 0xff;
++		k_state = new_char;
++		--length;
++		/* check for extended length */
++		if (length == -2) {
++			/* (length byte was 0, decremented twice) */
++			/* get the two length bytes */
++			new_char = getc();
++			if ((new_char & 0xE0) == 0)
++				goto packet_error;
++			sum += new_char & 0xff;
++			len_hi = untochar(new_char);
++			new_char = getc();
++			if ((new_char & 0xE0) == 0)
++				goto packet_error;
++			sum += new_char & 0xff;
++			len_lo = untochar(new_char);
++			length = len_hi * 95 + len_lo;
++			/* check header checksum */
++			new_char = getc();
++			if ((new_char & 0xE0) == 0)
++				goto packet_error;
++			if (new_char != tochar((sum + ((sum >> 6) & 0x03))
++						& 0x3f))
++				goto packet_error;
++			sum += new_char & 0xff;
++/* --length; */ /* new length includes only data and block check to come */
++		}
++		/* bring in rest of packet */
++		while (length > 1) {
++			new_char = getc();
++			if ((new_char & 0xE0) == 0)
++				goto packet_error;
++			sum += new_char & 0xff;
++			--length;
++			if (k_state == DATA_TYPE) {
++				/* pass on the data if this is a data packet */
++				k_data_char(new_char);
++			} else if (k_state == SEND_TYPE) {
++				/* save send pack in buffer as is */
++				*send_ptr++ = new_char;
++				/* if too much data, back off the pointer */
++				if (send_ptr >= &send_parms[SEND_DATA_SIZE])
++					--send_ptr;
++			}
++		}
++		/* get and validate checksum character */
++		new_char = getc();
++		if ((new_char & 0xE0) == 0)
++			goto packet_error;
++		if (new_char != tochar((sum + ((sum >> 6) & 0x03)) & 0x3f))
++			goto packet_error;
++		/* get END_CHAR */
++		new_char = getc();
++		if (new_char != END_CHAR) {
++packet_error:
++			/* restore state machines */
++			k_state = k_state_saved;
++			k_data_restore();
++			/* send a negative acknowledge packet in */
++			send_nack(n);
++		} else if (k_state == SEND_TYPE) {
++			/* Crack the protocol parms,
++			 * build an appropriate ack packet */
++			handle_send_packet(n);
++		} else {
++			/* send simple acknowledge packet in */
++			send_ack(n);
++			/* quit if end of transmission */
++			if (k_state == BREAK_TYPE)
++				done = 1;
++		}
++		++z;
++	}
++	return (ulong) os_data_addr - (ulong) bin_start_address;
++}
+diff --git a/common/cmd_load.h b/common/cmd_load.h
+new file mode 100644
+index 0000000..f1b6eb7
+--- /dev/null
++++ b/common/cmd_load.h
+@@ -0,0 +1,47 @@
++/*
++ * (C) Copyright 2010 Mistral Solutions Pvt Ltd.
++ * Umesh Krishnan <umeshk@mistralsolutions.com>
++ *
++ * Header file for common/cmd_load.c
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#define putc serial_putc
++#define tstc serial_tstc
++
++#define XON_CHAR        17
++#define XOFF_CHAR       19
++#define START_CHAR      0x01
++#define ETX_CHAR	0x03
++#define END_CHAR        0x0D
++#define SPACE           0x20
++#define K_ESCAPE        0x23
++#define SEND_TYPE       'S'
++#define DATA_TYPE       'D'
++#define ACK_TYPE        'Y'
++#define NACK_TYPE       'N'
++#define BREAK_TYPE      'B'
++#define tochar(x) ((char) (((x) + SPACE) & 0xff))
++#define untochar(x) ((int) (((x) - SPACE) & 0xff))
++
++extern int os_data_count;
++extern int os_data_header[8];
++
++
+diff --git a/cpu/omap3/mmc.c b/cpu/omap3/mmc.c
+index 365df49..4b19dde 100755
+--- a/cpu/omap3/mmc.c
++++ b/cpu/omap3/mmc.c
+@@ -46,7 +46,8 @@ block_dev_desc_t *mmc_get_dev(int dev)
+
+ unsigned char mmc_board_init(void)
+ {
+-#if defined (CONFIG_OMAP34XX) && !defined (CONFIG_AM3517EVM)
++#if defined(CONFIG_OMAP34XX) && !defined(CONFIG_AM3517EVM) && \
++				!defined(CONFIG_AM3517CRANE)
+ 	unsigned int value = 0;
+
+ 	value = CONTROL_PBIAS_LITE;
+diff --git a/drivers/Makefile b/drivers/Makefile
+index b39d983..d071397 100644
+--- a/drivers/Makefile
++++ b/drivers/Makefile
+@@ -44,6 +44,10 @@ ifeq ($(BOARD), am3517evm)
+ OBJS    += k9f1g08r0a.o
+ endif
+
++ifeq ($(BOARD), am3517crane)
++OBJS    += k9f1g08r0a.o
++endif
++
+ ifeq ($(BOARD), omap2420h4)
+ OBJS 	+= k9k1216.o
+ endif
+diff --git a/drivers/k9f1g08r0a.c b/drivers/k9f1g08r0a.c
+index 870690d..80afdd9 100755
+--- a/drivers/k9f1g08r0a.c
++++ b/drivers/k9f1g08r0a.c
+@@ -42,8 +42,7 @@
+  */
+ #define MT29F1G_MFR		0x2c  /* Micron */
+ #define MT29F1G_ID		0xa1  /* x8, 1GiB */
+-#define MT29F2G_ID		0xba	/* x16, 2GiB */
+-#define MT29F4G_ID		0xbc	/* x16, 4GiB */
++#define MT29F2G_ID      0xba  /* x16, 2GiB */
+
+ #define HYNIX4GiB_MFR		0xAD  /* Hynix */
+ #define HYNIX4GiB_ID		0xBC  /* x16, 4GiB */
+@@ -62,7 +61,6 @@
+ #define ECC_SIZE		24
+ #define ECC_STEPS		3
+
+-unsigned int is_ddr_166M;
+ /*******************************************************
+  * Routine: delay
+  * Description: spinning delay to use before udelay works
+@@ -185,30 +183,19 @@ int nand_chip()
+
+ 	NAND_DISABLE_CE();
+
+-	switch (mfr) {
+-		/* Hynix NAND Part */
+-		case HYNIX4GiB_MFR:
+-			is_ddr_166M = 0;
+-			if (is_cpu_family() == CPU_OMAP36XX)
+-				return (id != HYNIX4GiB_ID);
+-			break;
+-		/* Micron NAND Part */
+-		case MT29F1G_MFR:
+-			is_ddr_166M = 1;
+-			if ((is_cpu_family() == CPU_OMAP34XX) ||
+-					(is_cpu_family() == CPU_AM35XX) ||
+-					(is_cpu_family() == CPU_OMAP36XX))
+-				return (!((id == MT29F1G_ID) ||
+-						(id == MT29F2G_ID) ||
+-						(id ==MT29F4G_ID)));
+-			break;
+-		case K9F1G08R0A_MFR:
+-		default:
+-			is_ddr_166M = 1;
+-			break;
++	if (is_cpu_family() == CPU_OMAP36XX) {
++		return (mfr != HYNIX4GiB_MFR || id != HYNIX4GiB_ID);
++	} else {
++		if (get_cpu_rev() == CPU_3430_ES2)
++#if defined (CONFIG_OMAP34XX) || defined (CONFIG_OMAP3EVM)
++			return (mfr != MT29F1G_MFR || !(id == MT29F1G_ID || id == MT29F2G_ID));
++#elif defined(CONFIG_AM3517EVM) || defined(CONFIG_AM3517TEB) || \
++		defined(CONFIG_AM3517CRANE)
++		return (mfr != MT29F1G_MFR && !(id == MT29F1G_ID || id == MT29F2G_ID));
++#endif
++		else
++			return (mfr != K9F1G08R0A_MFR || id != K9F1G08R0A_ID);
+ 	}
+-
+-	return (id != K9F1G08R0A_ID);
+ }
+
+ /* read a block data to buf
+diff --git a/include/asm/arch-omap3/cpu.h b/include/asm/arch-omap3/cpu.h
+index 5035c58..49c745c 100644
+--- a/include/asm/arch-omap3/cpu.h
++++ b/include/asm/arch-omap3/cpu.h
+@@ -24,7 +24,8 @@
+
+ #ifndef _OMAP34XX_CPU_H
+ #define  _OMAP34XX_CPU_H
+-#if defined (CONFIG_AM3517EVM) || defined (CONFIG_AM3517TEB)
++#if defined(CONFIG_AM3517EVM) || defined(CONFIG_AM3517TEB) || \
++	defined(CONFIG_AM3517CRANE)
+ #include <asm/arch/omap3.h>
+ #elif defined (CONFIG_OMAP3430)
+ #include <asm/arch/omap3430.h>
+@@ -66,7 +67,8 @@
+ #define GPMC_CONFIG		(OMAP34XX_GPMC_BASE+0x50)
+ #define GPMC_STATUS		(OMAP34XX_GPMC_BASE+0x54)
+
+-#if defined (CONFIG_OMAP34XX) || defined (CONFIG_AM3517EVM)
++#if defined(CONFIG_OMAP34XX) || defined(CONFIG_AM3517EVM) || \
++	defined(CONFIG_AM3517CRANE)
+ #define GPMC_CONFIG_CS0		(OMAP34XX_GPMC_BASE+0x60)
+ #elif defined (CONFIG_AM3517TEB)
+ #define GPMC_CONFIG_CS0		(OMAP34XX_GPMC_BASE+0xC0)
+diff --git a/include/asm/arch-omap3/mem.h b/include/asm/arch-omap3/mem.h
+index 1982dcf..954d5ee 100644
+--- a/include/asm/arch-omap3/mem.h
++++ b/include/asm/arch-omap3/mem.h
+@@ -376,7 +376,8 @@ typedef enum {
+ # define M_NAND_GPMC_CONFIG5 SMNAND_GPMC_CONFIG5
+ # define M_NAND_GPMC_CONFIG6 SMNAND_GPMC_CONFIG6
+
+-#elif defined (CONFIG_AM3517EVM) || defined (CONFIG_AM3517TEB)
++#elif defined(CONFIG_AM3517EVM) || defined(CONFIG_AM3517TEB) || \
++	defined(CONFIG_AM3517CRANE)
+
+ #ifdef NAND_16BIT
+ # define M_NAND_GPMC_CONFIG1 0x00001800
+@@ -425,7 +426,8 @@ typedef enum {
+ # define M_NAND_GPMC_CONFIG6 SMNAND_GPMC_CONFIG6
+ # define M_NAND_GPMC_CONFIG7 SMNAND_GPMC_CONFIG7
+
+-#elif defined (CONFIG_AM3517EVM) || defined (CONFIG_AM3517TEB)
++#elif defined(CONFIG_AM3517EVM) || defined(CONFIG_AM3517TEB) || \
++	defined(CONFIG_AM3517CRANE)
+
+ #ifdef NAND_16BIT
+ # define M_NAND_GPMC_CONFIG1 0x00001800
+@@ -498,7 +500,8 @@ typedef enum {
+ # define M_NAND_GPMC_CONFIG6 SMNAND_GPMC_CONFIG6
+ # define M_NAND_GPMC_CONFIG7 SMNAND_GPMC_CONFIG7
+
+-#elif defined (CONFIG_AM3517EVM) || defined (CONFIG_AM3517TEB)
++#elif defined(CONFIG_AM3517EVM) || defined(CONFIG_AM3517TEB) || \
++	defined(CONFIG_AM3517CRANE)
+
+ #ifdef NAND_16BIT
+ # define M_NAND_GPMC_CONFIG1 0x00001800
+diff --git a/include/asm/arch-omap3/omap3430.h b/include/asm/arch-omap3/omap3430.h
+index 16cde63..4fd700a 100644
+--- a/include/asm/arch-omap3/omap3430.h
++++ b/include/asm/arch-omap3/omap3430.h
+@@ -130,7 +130,8 @@
+ #define ENHANCED_UI_EE_NAME		"750-2075"
+ #endif
+
+-#if defined (CONFIG_AM3517EVM) || defined (CONFIG_AM3517TEB)
++#if defined(CONFIG_AM3517EVM) || defined(CONFIG_AM3517TEB) || \
++	defined(CONFIG_AM3517CRANE)
+ /* EMIF 4 replaces SDRC in AM3517 for DDR */
+ #define EMIF4_MOD_ID			0x00
+ #define EMIF4_STATUS			0x04
+diff --git a/include/asm/arch-omap3/sys_proto.h b/include/asm/arch-omap3/sys_proto.h
+index f1149cd..980fb20 100644
+--- a/include/asm/arch-omap3/sys_proto.h
++++ b/include/asm/arch-omap3/sys_proto.h
+@@ -32,7 +32,7 @@ void gpmc_init(void);
+ void ether_init(void);
+ void watchdog_init(void);
+ void set_muxconf_regs(void);
+-u32 is_cpu_family();
++u32 is_cpu_family(void);
+ u32 get_cpu_type(void);
+ u32 get_cpu_rev(void);
+ u32 cpu_is_3410(void);
+diff --git a/include/configs/am3517crane.h b/include/configs/am3517crane.h
+new file mode 100644
+index 0000000..76ed2c0
+--- /dev/null
++++ b/include/configs/am3517crane.h
+@@ -0,0 +1,200 @@
++/*
++ * (C) Copyright 2010 Mistral Solutions Pvt Ltd. <www.mistralsolutions.com>
++ * Umesh Krishnan <umeshk@mistralsolutions.com>
++ *
++ * X-Loader Configuation settings for the CRANE board.
++ *
++ * Derived from include/configs/am3517evm.h
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#ifndef __CONFIG_H
++#define __CONFIG_H
++
++/* serial printf facility takes about 3.5K */
++#define CFG_PRINTF
++
++/*
++ * High Level Configuration Options
++ */
++#define CONFIG_ARMCORTEXA8	1    /* This is an ARM V7 CPU core */
++#define CONFIG_OMAP		1    /* in a TI OMAP core */
++
++#define CONFIG_AM3517CRANE	1    /* working with CraneBoard */
++
++/* Disabling CONFIG_MMC when serial download config (loadb)is used.
++ * If loadb and MMC support are enabled together, the size of x-loader
++ * (code + data) becomes greater than 32K - the size of SRAM. So don't enable
++ * them together.
++ */
++#if !defined(START_LOADB_DOWNLOAD)
++/* Enable the below macro if MMC boot support is required */
++#define CONFIG_MMC               1
++#endif
++
++#if defined(CONFIG_MMC)
++	#define CFG_CMD_MMC              1
++	#define CFG_CMD_FAT              1
++#endif
++
++#include <asm/arch/cpu.h>        /* get chip and board defs */
++
++/* uncomment it if you need timer based udelay(). it takes about 250 bytes */
++/* #define CFG_UDELAY */
++
++/* Clock Defines */
++#define V_OSCK                   26000000  /* Clock output from T2 */
++
++#if (V_OSCK > 19200000)
++#define V_SCLK                   (V_OSCK >> 1)
++#else
++#define V_SCLK                   V_OSCK
++#endif
++
++/* #define PRCM_CLK_CFG2_266MHZ   1   */ /* VDD2=1.15v - 133MHz DDR */
++#define PRCM_CLK_CFG2_332MHZ     1    /* VDD2=1.15v - 166MHz DDR */
++#define PRCM_PCLK_OPP2           1    /* ARM=381MHz - VDD1=1.20v */
++
++# define NAND_BASE_ADR           NAND_BASE  /* NAND flash */
++# define ONENAND_BASE            ONENAND_MAP  /* OneNand flash */
++
++#define OMAP34XX_GPMC_CS0_SIZE GPMC_SIZE_128M
++#define ONENAND_ADDR ONENAND_BASE  /* physical address of OneNAND at CS0*/
++
++#ifdef CFG_PRINTF
++
++#define CFG_NS16550
++#define CFG_NS16550_SERIAL
++#define CFG_NS16550_REG_SIZE     (-4)
++#define CFG_NS16550_CLK          (48000000)
++#define CFG_NS16550_COM3         OMAP34XX_UART3
++
++/*
++ * select serial console configuration
++ */
++#define CONFIG_SERIAL3           3    /* UART1 on OMAP3EVM */
++#define CONFIG_CONS_INDEX        3
++
++#define CONFIG_BAUDRATE          115200
++#define CFG_PBSIZE               256
++
++#endif /* CFG_PRINTF */
++
++/*
++ * Miscellaneous configurable options
++ */
++#define CFG_LOADADDR             0x80008000
++
++#undef	CFG_CLKS_IN_HZ		/* everything, incl board info, in Hz */
++
++/*-----------------------------------------------------------------------
++ * Stack sizes
++ *
++ * The stack sizes are set up in start.S using the settings below
++ */
++#define CONFIG_STACKSIZE         (128*1024) /* regular stack */
++
++/*-----------------------------------------------------------------------
++ * Board NAND Info.
++ */
++/* Samsung 8-bit 128MB chip large page NAND chip*/
++#define CFG_NAND_K9F1G08R0A
++#define NAND_16BIT
++
++/* NAND is partitioned:
++ * 0x00000000 - 0x0007FFFF  Booting Image
++ * 0x00080000 - 0x0023FFFF  U-Boot Image
++ * 0x00240000 - 0x0027FFFF  U-Boot Env Data (X-loader doesn't care)
++ * 0x00280000 - 0x0077FFFF  Kernel Image
++ * 0x00780000 - 0x08000000  depends on application
++ */
++/* Leaving first 4 blocks for x-load */
++#define NAND_UBOOT_START         0x0080000
++/* Giving a space of 2 blocks = 256KB */
++#define NAND_UBOOT_END           0x0240000
++#define NAND_BLOCK_SIZE          0x20000
++
++#define GPMC_CONFIG              (OMAP34XX_GPMC_BASE+0x50)
++
++#if defined(CONFIG_AM3517CRANE)
++#define GPMC_NAND_COMMAND_0      (OMAP34XX_GPMC_BASE+0x7C)
++#define GPMC_NAND_ADDRESS_0      (OMAP34XX_GPMC_BASE+0x80)
++#define GPMC_NAND_DATA_0         (OMAP34XX_GPMC_BASE+0x84)
++#endif
++
++#ifdef NAND_16BIT
++#define WRITE_NAND_COMMAND(d, adr) \
++	do {*(volatile u16 *)GPMC_NAND_COMMAND_0 = d; } while (0)
++#define WRITE_NAND_ADDRESS(d, adr) \
++	do {*(volatile u16 *)GPMC_NAND_ADDRESS_0 = d; } while (0)
++#define WRITE_NAND(d, adr) \
++	do {*(volatile u16 *)GPMC_NAND_DATA_0 = d; } while (0)
++#define READ_NAND(adr) \
++	(*(volatile u16 *)GPMC_NAND_DATA_0)
++#define NAND_WAIT_READY()
++#define NAND_WP_OFF()  \
++	do {*(volatile u32 *)(GPMC_CONFIG) |= 0x00000010; } while (0)
++#define NAND_WP_ON()  \
++	do {*(volatile u32 *)(GPMC_CONFIG) &= ~0x00000010; } while (0)
++
++#else /* to support 8-bit NAND devices */
++#define WRITE_NAND_COMMAND(d, adr) \
++	do {*(volatile u8 *)GPMC_NAND_COMMAND_0 = d; } while (0)
++#define WRITE_NAND_ADDRESS(d, adr) \
++	do {*(volatile u8 *)GPMC_NAND_ADDRESS_0 = d; } while (0)
++#define WRITE_NAND(d, adr) \
++	do {*(volatile u8 *)GPMC_NAND_DATA_0 = d; } while (0)
++#define READ_NAND(adr) \
++	(*(volatile u8 *)GPMC_NAND_DATA_0);
++#define NAND_WAIT_READY()
++#define NAND_WP_OFF()  \
++	do {*(volatile u32 *)(GPMC_CONFIG) |= 0x00000010; } while (0)
++#define NAND_WP_ON()  \
++	do {*(volatile u32 *)(GPMC_CONFIG) &= ~0x00000010; } while (0)
++
++#endif
++
++#define NAND_CTL_CLRALE(adr)
++#define NAND_CTL_SETALE(adr)
++#define NAND_CTL_CLRCLE(adr)
++#define NAND_CTL_SETCLE(adr)
++#define NAND_DISABLE_CE()
++#define NAND_ENABLE_CE()
++
++/*-----------------------------------------------------------------------
++ * Board oneNAND Info.
++ */
++#define CFG_SYNC_BURST_READ	1
++
++/* OneNAND is partitioned:
++ *   0x0000000 - 0x0080000  X-Loader
++ *   0x0080000 - 0x0240000   U-boot Image
++ *   0x0240000 - 0x0280000   U-Boot Env Data (X-loader doesn't care)
++ *   0x0280000 - 0x0780000   Kernel Image
++ *   0x0780000 - 0x8000000   depends on application
++ */
++
++#define ONENAND_START_BLOCK      4
++#define ONENAND_END_BLOCK        18
++#define ONENAND_PAGE_SIZE        2048     /* 2KB */
++#define ONENAND_BLOCK_SIZE       0x20000  /* 128KB */
++
++#endif /* __CONFIG_H */
++
+diff --git a/lib/board.c b/lib/board.c
+index d2b65dc..ce5eaa8 100755
+--- a/lib/board.c
++++ b/lib/board.c
+@@ -35,6 +35,7 @@
+
+ extern int misc_init_r (void);
+ extern u32 get_mem_type(void);
++extern int do_load_serial_bin(ulong , int);
+
+ #ifdef CFG_PRINTF
+ int print_info(void)
+@@ -61,7 +62,6 @@ init_fnc_t *init_sequence[] = {
+ void start_armboot (void)
+ {
+   	init_fnc_t **init_fnc_ptr;
+- 	int i;
+ 	uchar *buf;
+
+    	for (init_fnc_ptr = init_sequence; *init_fnc_ptr; ++init_fnc_ptr) {
+@@ -70,9 +70,13 @@ void start_armboot (void)
+ 		}
+ 	}
+
++#ifdef START_LOADB_DOWNLOAD
++	do_load_serial_bin(CFG_LOADADDR, 115200);
++#else
+ 	misc_init_r();
+ 	buf =  (uchar*) CFG_LOADADDR;
+
++	int i;
+ 	if ((get_mem_type() == MMC_ONENAND) || (get_mem_type() == MMC_NAND)){
+ 		buf += mmc_boot(buf);
+ 	}
+@@ -90,9 +94,7 @@ void start_armboot (void)
+ 				buf += NAND_BLOCK_SIZE; /* advance buf ptr */
+ 		}
+ 	}
+-
+-
+-
++#endif
+ 	if (buf == (uchar *)CFG_LOADADDR)
+ 		hang();
+
+--
+1.7.0.4
+
diff --git a/recipes/x-load/x-load_git.bb b/recipes/x-load/x-load_git.bb
index 9daaf6c..26ff5c3 100644
--- a/recipes/x-load/x-load_git.bb
+++ b/recipes/x-load/x-load_git.bb
@@ -9,7 +9,7 @@ SRCREV_beagleboard = "1c9276af4d6a5b7014a7630a1abeddf3b3177563"
 
 PV = "1.42+${PR}+gitr${SRCREV}"
 PV_beagleboard = "1.44+${PR}+gitr${SRCREV}"
-PR ="r17"
+PR ="r18"
 PE = "1"
 
 SRC_URI = "git://gitorious.org/x-load-omap3/mainline.git;branch=master;protocol=git"
@@ -27,6 +27,13 @@ SRC_URI_append_omap3-touchbook = " \
                              "
 
 # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
+SRC_URI_am3517-crane = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git \
+                        file://0001-Added-support-for-Am3517-Crane-board.patch \
+"
+SRCREV_am3517-crane = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
+PV_am3517-crane = "1.46+${PR}+gitr${SRCREV}"
+
+# TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
 SRC_URI_omap3evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
 SRCREV_omap3evm = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
 PV_omap3evm = "1.46+${PR}+gitr${SRCREV}"
-- 
1.7.0.4


--------------020304050605000808070609
Content-Type: text/x-patch;
 name="0001-Added-support-for-am3517-crane-in-sort.sh-file.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Added-support-for-am3517-crane-in-sort.sh-file.patch"

From 69f6afccff53366047c77f52086cca68e89cf092 Mon Sep 17 00:00:00 2001
From: Anil Kumar <anilm@mistralsolutions.com>
Date: Fri, 19 Nov 2010 20:54:28 +0530
Subject: [PATCH] Added support for am3517-crane in sort.sh file

Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
---
 contrib/angstrom/sort.sh |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
index 3e59466..c88cb3d 100755
--- a/contrib/angstrom/sort.sh
+++ b/contrib/angstrom/sort.sh
@@ -79,7 +79,11 @@ case "$arch" in
 	"armv6-novfp")
 			machines="htcblackstone htcdiamond htcdream htckaiser htcnike htcpolaris htcraphael htctitan htcvogue" ;;
 	"armv7a")
-			machines="am3517-evm archos5 archos5it beagleboard bug20 cm-t35 dm37x-evm am37x-evm am389x-evm babbage c6a816x-evm efikamx htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre omap4430-panda" ;;
+			machines="am3517-crane am3517-evm archos5 archos5it
+ beagleboard bug20 cm-t35 dm37x-evm am37x-evm am389x-evm babbage c6a816x-evm
+ efikamx htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora
+ omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre
+ omap4430-panda" ;;
 	"avr32")
 			machines="at32stk1000 atngw100" ;;
 	"bfin")
-- 
1.7.0.4


--------------020304050605000808070609--
