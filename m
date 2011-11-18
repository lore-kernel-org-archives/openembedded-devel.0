Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RRCXm-0004yv-CU
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 01:43:02 +0100
Received: from mizar.localdomain (87.5.50.68) by smtp209.alice.it (8.5.124.08)
	id 4E850A86056661AC; Fri, 18 Nov 2011 01:36:39 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Nov 2011 01:36:06 +0100
Message-Id: <12484e4f844a3701fb3c6e96cf91bbbd51cec4f0.1321575642.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1321575642.git.andrea.adami@gmail.com>
References: <cover.1321575642.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1321575642.git.andrea.adami@gmail.com>
References: <cover.1321575642.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/5] linux-kexecboot: remove now unused git version
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
X-List-Received-Date: Fri, 18 Nov 2011 00:43:03 -0000

* used during migration from 2.6.2x to 2.6.3x

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-kexecboot/spitz/defconfig          |  129 --------------------
 recipes-kernel/linux/linux-kexecboot_git.bb        |    2 -
 2 files changed, 0 insertions(+), 131 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-kexecboot/spitz/defconfig
 delete mode 100644 recipes-kernel/linux/linux-kexecboot_git.bb

diff --git a/recipes-kernel/linux/linux-kexecboot/spitz/defconfig b/recipes-kernel/linux/linux-kexecboot/spitz/defconfig
deleted file mode 100644
index e62ab14..0000000
--- a/recipes-kernel/linux/linux-kexecboot/spitz/defconfig
+++ /dev/null
@@ -1,129 +0,0 @@
-CONFIG_EXPERIMENTAL=y
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_KERNEL_LZMA=y
-# CONFIG_SWAP is not set
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
-CONFIG_RD_LZMA=y
-CONFIG_INITRAMFS_COMPRESSION_LZMA=y
-# CONFIG_UID16 is not set
-# CONFIG_SYSCTL_SYSCALL is not set
-# CONFIG_KALLSYMS is not set
-# CONFIG_PRINTK is not set
-# CONFIG_BUG is not set
-# CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
-CONFIG_EMBEDDED=y
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_COMPAT_BRK is not set
-CONFIG_SLOB=y
-# CONFIG_LBDAF is not set
-# CONFIG_IOSCHED_CFQ is not set
-CONFIG_ARCH_PXA=y
-CONFIG_PXA_SHARPSL=y
-CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
-CONFIG_MACH_AKITA=y
-CONFIG_MACH_BORZOI=y
-CONFIG_PCCARD=y
-# CONFIG_PCMCIA_LOAD_CIS is not set
-CONFIG_PCMCIA_PXA2XX=y
-CONFIG_NO_HZ=y
-CONFIG_AEABI=y
-# CONFIG_OABI_COMPAT is not set
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
-CONFIG_KEXEC=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_CHAR=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_ROM=y
-CONFIG_MTD_COMPLEX_MAPPINGS=y
-CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_VERIFY_WRITE=y
-CONFIG_MTD_NAND_SHARPSL=y
-CONFIG_MTD_UBI=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_ATA=y
-# CONFIG_ATA_VERBOSE_ERROR is not set
-# CONFIG_SATA_PMP is not set
-CONFIG_PATA_PXA=y
-CONFIG_PATA_PCMCIA=y
-# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
-CONFIG_INPUT_EVDEV=y
-CONFIG_INPUT_APMPOWER=y
-# CONFIG_KEYBOARD_ATKBD is not set
-CONFIG_KEYBOARD_GPIO=y
-CONFIG_KEYBOARD_MATRIX=y
-# CONFIG_INPUT_MOUSE is not set
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_ADS7846=y
-# CONFIG_SERIO is not set
-# CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
-CONFIG_SERIAL_PXA=y
-CONFIG_SERIAL_PXA_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_I2C_COMPAT is not set
-CONFIG_SPI=y
-CONFIG_SPI_PXA2XX=y
-CONFIG_POWER_SUPPLY=y
-CONFIG_PDA_POWER=y
-CONFIG_APM_POWER=y
-# CONFIG_MFD_SUPPORT is not set
-CONFIG_FB=y
-CONFIG_FB_PXA=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-CONFIG_LCD_CORGI=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
-CONFIG_FONTS=y
-CONFIG_FONT_8x16=y
-# CONFIG_HID_SUPPORT is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_MMC=y
-CONFIG_MMC_PXA=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_PXA=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=y
-# CONFIG_EXT4_FS_XATTR is not set
-# CONFIG_FILE_LOCKING is not set
-# CONFIG_DNOTIFY is not set
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-# CONFIG_PROC_PAGE_MONITOR is not set
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_SUMMARY=y
-CONFIG_JFFS2_COMPRESSION_OPTIONS=y
-CONFIG_JFFS2_LZO=y
-CONFIG_JFFS2_RUBIN=y
-CONFIG_UBIFS_FS=y
-CONFIG_UBIFS_FS_ADVANCED_COMPR=y
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_ENABLE_WARN_DEPRECATED is not set
-# CONFIG_ENABLE_MUST_CHECK is not set
-CONFIG_FRAME_WARN=2048
-CONFIG_MAGIC_SYSRQ=y
-# CONFIG_ARM_UNWIND is not set
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-# CONFIG_CRYPTO_HW is not set
diff --git a/recipes-kernel/linux/linux-kexecboot_git.bb b/recipes-kernel/linux/linux-kexecboot_git.bb
deleted file mode 100644
index 1e8c56f..0000000
--- a/recipes-kernel/linux/linux-kexecboot_git.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require linux-kexecboot.inc
-require linux-git.inc
-- 
1.7.3.4



