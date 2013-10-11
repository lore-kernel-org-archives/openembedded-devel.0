Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 51E246D08A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 22:29:55 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so2200237ead.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LwTZuj9V6WV/H/q6rrFiQ4jPfR4E0BSqyXMHkWHnM+I=;
	b=jbw+YUij+Q7HckH5/dpCo6VsDDQMZtlwWuXUp7HPxiBGiDA7t/wF+A5zl8IEvOo4Ei
	AZjbjEhGRjfbPOEOlLfP0y0vqjZBRswooIZhWbQ2hggh8Fz33bnmurq9QsuBxVJMbsrV
	hNjlFsJb7Yekgu6tDWPBIXEPeUllTK9nMDdQZhD4pyHZkzJUD36bMIw7RLxU3enBYEA1
	3HIOhDi4nJspEp+FgwRMMpf2hWJqaq3D/VxIUVTJgsAT3pPJGV2gnBJo4W1BbanvRqNB
	XvjYAf0N6jV/mfXg2QeKn/zpFj0dedEg4Lczv53dIs2jcBrEm3+9ydYz02ywjJyURTrp
	XLrQ==
X-Received: by 10.14.198.197 with SMTP id v45mr16506408een.52.1381530596811;
	Fri, 11 Oct 2013 15:29:56 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	l49sm35660600eeo.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 15:29:56 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2013 00:29:49 +0200
Message-Id: <1381530590-25182-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381530590-25182-1-git-send-email-andrea.adami@gmail.com>
References: <1381530590-25182-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] linux-yocto: initial commit of hx4700 defconfig
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
X-List-Received-Date: Fri, 11 Oct 2013 22:29:55 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/hx4700/defconfig        | 182 +++++++++++++++++++++
 .../hx4700-change-led-trigger-assignments.patch    |  33 ++++
 recipes-kernel/linux/linux-yocto-handhelds.inc     |   6 +
 recipes-kernel/linux/linux-yocto_3.10.bbappend     |   3 +-
 4 files changed, 223 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/hx4700/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/hx4700/hx4700-change-led-trigger-assignments.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/hx4700/defconfig b/recipes-kernel/linux/linux-yocto-3.10/hx4700/defconfig
new file mode 100644
index 0000000..ef3669f
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/hx4700/defconfig
@@ -0,0 +1,182 @@
+CONFIG_CROSS_COMPILE="arm-softfloat-linux-gnueabi-"
+CONFIG_LOCALVERSION="-yocto-standard"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_DEFAULT_HOSTNAME="hx4700"
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_FHANDLE=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+CONFIG_TASKSTATS=y
+CONFIG_TASK_DELAY_ACCT=y
+CONFIG_TASK_XACCT=y
+CONFIG_TASK_IO_ACCOUNTING=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUP_DEBUG=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_RESOURCE_COUNTERS=y
+CONFIG_BLK_CGROUP=y
+CONFIG_NAMESPACES=y
+CONFIG_SCHED_AUTOGROUP=y
+# CONFIG_UID16 is not set
+CONFIG_EMBEDDED=y
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_LBDAF is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_PXA=y
+CONFIG_MACH_H4700=y
+CONFIG_PCCARD=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+CONFIG_PCMCIA_PXA2XX=y
+CONFIG_AEABI=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE=" loglevel=3"
+CONFIG_KEXEC=y
+CONFIG_CPU_IDLE=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_APM_EMULATION=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+CONFIG_CFG80211=m
+# CONFIG_CFG80211_DEFAULT_PS is not set
+CONFIG_MAC80211=m
+CONFIG_RFKILL=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_GEOMETRY=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_SCSI_PROC_FS is not set
+CONFIG_BLK_DEV_SD=y
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+# CONFIG_ATA_BMDMA is not set
+CONFIG_PATA_PCMCIA=y
+CONFIG_NETDEVICES=y
+CONFIG_PCMCIA_PCNET=m
+# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=y
+# CONFIG_SERIO is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
+CONFIG_LEGACY_PTY_COUNT=2
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+# CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_I2C_PXA=y
+CONFIG_SPI=y
+CONFIG_SPI_PXA2XX=y
+CONFIG_W1=y
+CONFIG_W1_MASTER_DS1WM=y
+CONFIG_W1_SLAVE_DS2760=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PDA_POWER=y
+CONFIG_BATTERY_DS2760=y
+# CONFIG_HWMON is not set
+CONFIG_MFD_ASIC3=y
+CONFIG_HTC_EGPIO=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_DUMMY=y
+CONFIG_REGULATOR_GPIO=y
+CONFIG_REGULATOR_MAX1586=y
+CONFIG_FB=y
+CONFIG_FB_W100=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LCD_PLATFORM=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_BACKLIGHT_PWM=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FONTS=y
+CONFIG_LOGO=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y
+CONFIG_SND_PXA2XX_SOC=y
+CONFIG_SND_PXA2XX_SOC_HX4700=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_PXA27X=y
+CONFIG_USB_ETH=y
+CONFIG_MMC=y
+CONFIG_MMC_UNSAFE_RESUME=y
+CONFIG_MMC_TMIO=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_BACKLIGHT=y
+CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PXA=y
+CONFIG_PWM=y
+CONFIG_PWM_PXA=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT2_FS_SECURITY=y
+CONFIG_EXT3_FS=y
+CONFIG_FANOTIFY=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_FUSE_FS=m
+CONFIG_CUSE=m
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_DEFAULT="utf8"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_PRINTK_TIME=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+# CONFIG_ARM_UNWIND is not set
+CONFIG_CRYPTO_ECB=m
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+CONFIG_CRYPTO_SHA1=m
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
+CONFIG_CRC_CCITT=y
diff --git a/recipes-kernel/linux/linux-yocto-3.10/hx4700/hx4700-change-led-trigger-assignments.patch b/recipes-kernel/linux/linux-yocto-3.10/hx4700/hx4700-change-led-trigger-assignments.patch
new file mode 100644
index 0000000..75975d9
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/hx4700/hx4700-change-led-trigger-assignments.patch
@@ -0,0 +1,33 @@
+From c0cb3e77aadddc46e6e41b3dd1e10c56bc699df2 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 26 Jul 2011 11:44:47 +0200
+Subject: [PATCH] hx4700: change led trigger assignments
+
+Updated for 3.10
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-pxa/hx4700.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
+index cae9dbb..e7bda03 100644
+--- a/arch/arm/mach-pxa/hx4700.c
++++ b/arch/arm/mach-pxa/hx4700.c
+@@ -283,11 +283,11 @@ static struct asic3_led asic3_leds[ASIC3_NUM_LEDS] = {
+ 	},
+ 	[1] = {
+ 		.name = "hx4700:green",
+-		.default_trigger = "unused",
++		.default_trigger = "heartbeat",
+ 	},
+ 	[2] = {
+ 		.name = "hx4700:blue",
+-		.default_trigger = "hx4700-radio",
++		.default_trigger = "mmc0",
+ 	},
+ };
+ 
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-yocto-handhelds.inc b/recipes-kernel/linux/linux-yocto-handhelds.inc
index 90026ee..e23437f 100644
--- a/recipes-kernel/linux/linux-yocto-handhelds.inc
+++ b/recipes-kernel/linux/linux-yocto-handhelds.inc
@@ -2,6 +2,7 @@ KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
 KMACHINE_collie = "collie"
 KMACHINE_h3600 = "h3600"
+KMACHINE_hx4700 = "hx4700"
 KMACHINE_poodle = "poodle"
 KMACHINE_spitz = "spitz"
 KMACHINE_tosa = "tosa"
@@ -26,6 +27,11 @@ SRC_URI_append_h3600 = " \
            file://qvga/logo_linux_clut224.ppm.bz2 \
            "
 
+SRC_URI_append_hx4700 = " \
+           file://defconfig \
+           file://hx4700-change-led-trigger-assignments.patch \
+           "
+
 SRC_URI_append_poodle = " \
            file://feature-top.scc \
            file://qvga/logo_linux_clut224.ppm.bz2 \
diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
index 12810ba..6e10db5 100644
--- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.10:${THISDIR}/${PN}:${THISDIR}/files:"
 
-COMPATIBLE_MACHINE .= "|akita|c7x0|collie|h3600|poodle|spitz|tosa"
+COMPATIBLE_MACHINE .= "|akita|c7x0|collie|h3600|hx4700|poodle|spitz|tosa"
 
 # Override kernel features
 #KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
@@ -9,6 +9,7 @@ KERNEL_EXTRA_FEATURES_akita ?= ""
 KERNEL_EXTRA_FEATURES_c7x0 ?= ""
 KERNEL_EXTRA_FEATURES_collie ?= ""
 KERNEL_EXTRA_FEATURES_h3600 ?= ""
+KERNEL_EXTRA_FEATURES_hx4700 ?= ""
 KERNEL_EXTRA_FEATURES_poodle ?= ""
 KERNEL_EXTRA_FEATURES_spitz ?= ""
 KERNEL_EXTRA_FEATURES_tosa ?= ""
-- 
1.8.1.5


