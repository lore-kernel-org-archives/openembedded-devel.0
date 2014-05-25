Return-Path: <>
X-Greylist: delayed 139588 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 25 May 2014 13:25:29 UTC
Received: from mail-wi0-f179.google.com (unknown [209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1BF65FFC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 May 2014 13:25:29 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id bs8so3034403wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 May 2014 06:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ndYB3mInar9uWE24LrDCvjHqPA9u+lSIRORFsYqJ8Iw=;
	b=f1i2RbPmqt7YHaJmEWT99iUWLwAaCZMyprs80crrwE3K0Myu8Oj4DrI/XC051ROCMf
	1mXPlpvQ82h19tI+LMQXUVSTM+92RWGBwWyFBlcno4dvxAGpZRBeIcLKuiY2X7uLSys8
	azx3Lw6MuiZVMbMbAzMzbLjP2xghEwmGewP/KqKuei7PLU9vduLl1PBMtJ5b1RRRfVny
	pnxDc/1tvMGwwPUFN0bnMkIZhIbgt+GZywGCOvHJ7b5xpPlKJCIBNo8QKb0DIXWTWDh6
	ceXCKMwqJYcc88OuybY4toU2NwGP9TfIl24PQBGLj/w0NKJ6ACnVlDe3NcN5DnuKqgf4
	Htwg==
X-Received: by 10.180.74.78 with SMTP id r14mr18811325wiv.2.1401024330213;
	Sun, 25 May 2014 06:25:30 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host53-12-dynamic.21-79-r.retail.telecomitalia.it. [79.21.12.53])
	by mx.google.com with ESMTPSA id p18sm18293262wik.3.2014.05.25.06.25.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 May 2014 06:25:29 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
X-Google-Original-From: Andrea Adami <andrea.adami@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 May 2014 15:25:21 +0200
Message-Id: <1401024321-11869-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] linux-gcw0-kexecboot_3.12: initial commit
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
X-List-Received-Date: Sun, 25 May 2014 13:25:32 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Notes:
 - strangely on mips /init seems not allowed to be a symlink
 - kernel doesn't boot using kexec_2.0.2 klibc-static but maybe
   it is a kernel and not userspace issue. Plan is to update to
   kexec-tools_2.0.6 as soon as possible and retest.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig | 210 +++++++++++++++++++++
 recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb  |  25 +++
 2 files changed, 235 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig
 create mode 100644 recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb

diff --git a/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig b/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig
new file mode 100644
index 0000000..ca4b4be
--- /dev/null
+++ b/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig
@@ -0,0 +1,210 @@
+CONFIG_MACH_JZ4770=y
+CONFIG_FORCE_MAX_ZONEORDER=14
+CONFIG_HIGHMEM=y
+# CONFIG_COMPACTION is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_KEXEC=y
+# CONFIG_SECCOMP is not set
+CONFIG_LOCALVERSION="-dingux"
+CONFIG_DEFAULT_HOSTNAME="gcw-zero"
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.gz"
+CONFIG_INITRAMFS_COMPRESSION_GZIP=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_EMBEDDED=y
+CONFIG_SLAB=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_IOSCHED_CFQ is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_SUSPEND is not set
+CONFIG_PM_RUNTIME=y
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
+CONFIG_CFG80211=y
+CONFIG_CFG80211_INTERNAL_REGDB=y
+CONFIG_MAC80211=y
+CONFIG_RFKILL=y
+CONFIG_RFKILL_REGULATOR=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FW_LOADER_USER_HELPER is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_JZ_VPU=y
+CONFIG_NETDEVICES=y
+# CONFIG_ETHERNET is not set
+CONFIG_RTL8188EU=m
+CONFIG_RTL8192CU_ALT=m
+# CONFIG_RTL_CARDS is not set
+CONFIG_INPUT_POLLDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=320
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=240
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_LINKDEV=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_JOYSTICK=y
+CONFIG_JOYSTICK_JZ_SADC=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_UINPUT=y
+# CONFIG_SERIO is not set
+CONFIG_LEGACY_PTY_COUNT=2
+# CONFIG_DEVMEM is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_GPIO=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PMU_ACT8600_SUPPORT=y
+CONFIG_BATTERY_JZ4770=y
+CONFIG_CHARGER_GPIO=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_JZ4740_WDT=y
+CONFIG_MFD_JZ4770_ADC=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_GPIO=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_RADIO_SUPPORT=y
+CONFIG_RADIO_RDA5807=y
+# CONFIG_MEDIA_TUNER_SIMPLE is not set
+# CONFIG_MEDIA_TUNER_TDA8290 is not set
+# CONFIG_MEDIA_TUNER_TDA827X is not set
+# CONFIG_MEDIA_TUNER_TDA18271 is not set
+# CONFIG_MEDIA_TUNER_TDA9887 is not set
+# CONFIG_MEDIA_TUNER_TEA5761 is not set
+# CONFIG_MEDIA_TUNER_TEA5767 is not set
+# CONFIG_MEDIA_TUNER_MT20XX is not set
+# CONFIG_MEDIA_TUNER_MT2060 is not set
+# CONFIG_MEDIA_TUNER_MT2063 is not set
+# CONFIG_MEDIA_TUNER_MT2266 is not set
+# CONFIG_MEDIA_TUNER_MT2131 is not set
+# CONFIG_MEDIA_TUNER_QT1010 is not set
+# CONFIG_MEDIA_TUNER_XC2028 is not set
+# CONFIG_MEDIA_TUNER_XC5000 is not set
+# CONFIG_MEDIA_TUNER_XC4000 is not set
+# CONFIG_MEDIA_TUNER_MXL5005S is not set
+# CONFIG_MEDIA_TUNER_MXL5007T is not set
+# CONFIG_MEDIA_TUNER_MC44S803 is not set
+# CONFIG_MEDIA_TUNER_MAX2165 is not set
+# CONFIG_MEDIA_TUNER_TDA18218 is not set
+# CONFIG_MEDIA_TUNER_FC0011 is not set
+# CONFIG_MEDIA_TUNER_FC0012 is not set
+# CONFIG_MEDIA_TUNER_FC0013 is not set
+# CONFIG_MEDIA_TUNER_TDA18212 is not set
+# CONFIG_MEDIA_TUNER_E4000 is not set
+# CONFIG_MEDIA_TUNER_FC2580 is not set
+# CONFIG_MEDIA_TUNER_TUA9001 is not set
+# CONFIG_MEDIA_TUNER_IT913X is not set
+# CONFIG_MEDIA_TUNER_R820T is not set
+# CONFIG_DVB_AU8522_V4L is not set
+# CONFIG_DVB_TUNER_DIB0070 is not set
+# CONFIG_DVB_TUNER_DIB0090 is not set
+CONFIG_GPU_VIVANTE_V4=y
+CONFIG_FB=y
+CONFIG_FB_JZ4770=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LCD_PLATFORM=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_BACKLIGHT_PWM=y
+CONFIG_PANEL_NT39016=y
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+CONFIG_LOGO_GCWZERO_CLUT224=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SEQUENCER=y
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_VERBOSE_PROCFS is not set
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_MIPS is not set
+# CONFIG_SND_USB is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_JZ4770_SOC=y
+CONFIG_SND_JZ4770_SOC_GCW0=y
+# CONFIG_USB_HID is not set
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+# CONFIG_USB_OTG_WHITELIST is not set
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_MUSB_HDRC=y
+CONFIG_USB_MUSB_JZ4770=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_ETH=y
+CONFIG_MMC=y
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+CONFIG_MMC_JZ4770=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_RTC_CLASS=y
+# CONFIG_RTC_INTF_PROC is not set
+CONFIG_RTC_DRV_JZ4770=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_PWM=y
+CONFIG_PWM_JZ4770=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_CRAMFS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_XZ=y
+CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_936=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_FTRACE is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="panic=5 rdinit=/usr/bin/kexecboot console=ttyS2,57600 console=tty0 rfkill.default_state=0"
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
+CONFIG_FONTS=y
+CONFIG_FONT_6x10=y
diff --git a/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb b/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb
new file mode 100644
index 0000000..5094035
--- /dev/null
+++ b/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb
@@ -0,0 +1,25 @@
+require recipes-kernel/linux/linux-gcw0_3.12.bb
+SUMMARY = "GCW Zero kernel embedding a minimalistic kexecboot initramfs"
+
+PACKAGES = ""
+PROVIDES = ""
+
+KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-gcw0-kexecboot-${PV}-${MACHINE}"
+KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-gcw0-kexecboot-${MACHINE}"
+
+INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
+INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
+
+# disable unneeded tasks
+do_install[noexec] = "1"
+do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
+do_package_deb[noexec] = "1"
+do_package_ipk[noexec] = "1"
+do_package_rpm[noexec] = "1"
+do_package_tar[noexec] = "1"
+do_package_write_deb[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
+do_package_write_tar[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
-- 
1.9.1


