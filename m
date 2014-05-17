Return-Path: <andrea.adami@gmail.com>
X-Greylist: delayed 330 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 17 May 2014 23:08:13 UTC
Received: from mail-ee0-f41.google.com (unknown [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3299E605B2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2014 23:08:13 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2504086eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2014 16:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X49KZoGQDPT52cR2uDyh91VtttwnbTnIBEnhwwHOYdc=;
	b=u6r2yhgkD5gXFi9yX6Ti4y/l57FeWRyFoXvyv7aaWVizZ1NOIjehXg7VWmBimvGbhi
	/pC1BHbBkTbq5Mq3Xr4nomCZVr8mMQSowLfs65mbCTS9scz5I5kBk4R/WdPrTdARpgzZ
	8uNnFHRpBMqaW6X3dmJ6t/6HLsBCqkJVhFtkmKYOuTPnXGrCXD5JD4DxkZQ9xr9zQ2a/
	YMUcLHH8TeLqXILW7nllI7P2G7GjawY8oahyLKDXC9S81Uw2zLTKO32kzUpAVxWl1NYK
	xl0Yje0udmijEh6zIrYDPDSMBDtR960esyTLByWOUN0KvptiYmADGnTG6dyJFTLSlDWN
	6Qgw==
X-Received: by 10.14.202.5 with SMTP id c5mr272233eeo.94.1400367769613;
	Sat, 17 May 2014 16:02:49 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host88-90-dynamic.180-80-r.retail.telecomitalia.it. [80.180.90.88])
	by mx.google.com with ESMTPSA id
	o49sm11571687eep.33.2014.05.17.16.02.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 May 2014 16:02:48 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 May 2014 01:02:31 +0200
Message-Id: <1400367752-27224-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1400367752-27224-1-git-send-email-andrea.adami@gmail.com>
References: <1400367752-27224-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] gcw0: initial commit of custom kernel 3.12
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
X-List-Received-Date: Sat, 17 May 2014 23:08:20 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-gcw0-3.12/gcw0/defconfig           | 200 +++++++++++++++++++++
 recipes-kernel/linux/linux-gcw0_3.12.bb            |  15 ++
 2 files changed, 215 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig
 create mode 100644 recipes-kernel/linux/linux-gcw0_3.12.bb

diff --git a/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig b/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig
new file mode 100644
index 0000000..a2a0db4
--- /dev/null
+++ b/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig
@@ -0,0 +1,200 @@
+CONFIG_MACH_JZ4770=y
+CONFIG_FORCE_MAX_ZONEORDER=14
+CONFIG_HIGHMEM=y
+# CONFIG_COMPACTION is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_PREEMPT_VOLUNTARY=y
+# CONFIG_SECCOMP is not set
+CONFIG_LOCALVERSION="-dingux"
+CONFIG_DEFAULT_HOSTNAME="gcw-zero"
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initrd/tree.txt"
+# CONFIG_RD_GZIP is not set
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
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_SQUASHFS=y
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
+CONFIG_CMDLINE="panic=5 console=ttyS2,57600 console=tty0 boot=/dev/mmcblk0p1 loop0=/boot/rootfs.squashfs root=/dev/loop0 rfkill.default_state=0"
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
+CONFIG_FONTS=y
+CONFIG_FONT_6x10=y
diff --git a/recipes-kernel/linux/linux-gcw0_3.12.bb b/recipes-kernel/linux/linux-gcw0_3.12.bb
new file mode 100644
index 0000000..6d9e54e
--- /dev/null
+++ b/recipes-kernel/linux/linux-gcw0_3.12.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Linux kernel 3.12 for the GCW Zero"
+SECTION = "kernel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+COMPATIBLE_MACHINE = "gcw0"
+
+SRC_URI = "git://github.com/gcwnow/linux.git;branch=jz-3.12 \
+	file://defconfig"
+
+SRCREV = "${AUTOREV}"
+
+S = "${WORKDIR}/git"
+
+inherit kernel
-- 
1.9.1


