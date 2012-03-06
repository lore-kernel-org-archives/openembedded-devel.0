Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S53FL-0002NX-MU
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 23:52:43 +0100
Received: from mizar.localdomain (87.14.251.210) by smtp205.alice.it
	(8.6.023.02) id 4F421F7B01EC42A1; Tue, 6 Mar 2012 23:44:07 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 23:44:02 +0100
Message-Id: <1331073844-5052-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 1/3] linux-kexecboot_3.2: add more defconfigs for Zaurus family
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
X-List-Received-Date: Tue, 06 Mar 2012 22:52:44 -0000

* prepare for systemd
* note: more fixes for pxa and sha1100 coming with 3.3 and 3.4
* (especially for collie)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 +++++
 .../linux/linux-kexecboot-3.2/akita/defconfig      |  129 ++++++++++++++++++
 .../linux/linux-kexecboot-3.2/c7x0/defconfig       |  131 ++++++++++++++++++
 .../linux/linux-kexecboot-3.2/collie/defconfig     |  142 ++++++++++++++++++++
 .../collie_remove_irq_to_gpio.patch                |   31 +++++
 .../linux-kexecboot-3.2/locomo_kbd_tweak-r2.patch  |   66 +++++++++
 .../linux/linux-kexecboot-3.2/poodle/defconfig     |  134 ++++++++++++++++++
 .../linux/linux-kexecboot-3.2/spitz/defconfig      |    7 +-
 .../linux/linux-kexecboot-3.2/tosa/defconfig       |  133 ++++++++++++++++++
 recipes-kernel/linux/linux-kexecboot_3.2.bbappend  |   18 ++-
 10 files changed, 814 insertions(+), 11 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.2/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.2/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.2/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.2/collie_remove_irq_to_gpio.patch
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.2/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.2/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.2/tosa/defconfig

diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch b/recipes-kernel/linux/linux-kexecboot-3.2/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
new file mode 100644
index 0000000..d86b47d
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
@@ -0,0 +1,34 @@
+From 31d99c4c9f14e571ca0e22c5862dd5b6a871e2dd Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Date: Fri, 5 Aug 2011 15:32:23 +0400
+Subject: [PATCH] pcmcia/pxa2xx_sharpsl: retain ops structure on collie
+
+The pxa2xx_sharpsl driver part is also used on collie, which (as
+a StrongARM board) has different expectations for PCMCIA drivers.
+So, on collie place sharpsl_pcmcia_ops in .data section rather than
+in __initdata.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ drivers/pcmcia/pxa2xx_sharpsl.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/pcmcia/pxa2xx_sharpsl.c b/drivers/pcmcia/pxa2xx_sharpsl.c
+index 81af2b3..1b5b749 100644
+--- a/drivers/pcmcia/pxa2xx_sharpsl.c
++++ b/drivers/pcmcia/pxa2xx_sharpsl.c
+@@ -222,7 +222,11 @@ static void sharpsl_pcmcia_socket_suspend(struct soc_pcmcia_socket *skt)
+ 	sharpsl_pcmcia_init_reset(skt);
+ }
+ 
++#ifdef CONFIG_SA1100_COLLIE
++static struct pcmcia_low_level sharpsl_pcmcia_ops = {
++#else
+ static struct pcmcia_low_level sharpsl_pcmcia_ops __initdata = {
++#endif
+ 	.owner                  = THIS_MODULE,
+ 	.hw_init                = sharpsl_pcmcia_hw_init,
+ 	.hw_shutdown            = sharpsl_pcmcia_hw_shutdown,
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
new file mode 100644
index 0000000..6c579fa
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
@@ -0,0 +1,129 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_SWAP is not set
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
+CONFIG_RD_LZMA=y
+CONFIG_INITRAMFS_COMPRESSION_LZMA=y
+# CONFIG_UID16 is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_ELF_CORE is not set
+# CONFIG_BASE_FULL is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLOB=y
+# CONFIG_LBDAF is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_PXA=y
+CONFIG_PXA_SHARPSL=y
+CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
+CONFIG_MACH_AKITA=y
+CONFIG_MACH_BORZOI=y
+CONFIG_PCCARD=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+CONFIG_PCMCIA_PXA2XX=y
+CONFIG_NO_HZ=y
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CONFIG_KEXEC=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_ROM=y
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+CONFIG_MTD_NAND_SHARPSL=y
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+CONFIG_PATA_PXA=y
+CONFIG_PATA_PCMCIA=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_APMPOWER=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_MATRIX=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=y
+# CONFIG_SERIO is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_I2C_COMPAT is not set
+CONFIG_SPI_PXA2XX=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+CONFIG_FB=y
+CONFIG_FB_PXA=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CORGI=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x16=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_PXA=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PXA=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4_FS_XATTR is not set
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RUBIN=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_ARM_UNWIND is not set
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/c7x0/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/c7x0/defconfig
new file mode 100644
index 0000000..d869fdd
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/c7x0/defconfig
@@ -0,0 +1,131 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_SWAP is not set
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
+CONFIG_RD_LZMA=y
+CONFIG_INITRAMFS_COMPRESSION_LZMA=y
+# CONFIG_UID16 is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_ELF_CORE is not set
+# CONFIG_BASE_FULL is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLOB=y
+# CONFIG_LBDAF is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_PXA=y
+CONFIG_PXA_SHARPSL=y
+CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
+CONFIG_MACH_CORGI=y
+CONFIG_MACH_SHEPHERD=y
+CONFIG_MACH_HUSKY=y
+CONFIG_PCCARD=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+CONFIG_PCMCIA_PXA2XX=y
+CONFIG_NO_HZ=y
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 loglevel=3"
+CONFIG_KEXEC=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_ROM=y
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+CONFIG_MTD_NAND_SHARPSL=y
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+CONFIG_PATA_PXA=y
+CONFIG_PATA_PCMCIA=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_APMPOWER=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_MATRIX=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=y
+# CONFIG_SERIO is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_PXA=y
+CONFIG_SPI_PXA2XX=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+CONFIG_FB=y
+CONFIG_FB_W100=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CORGI=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x16=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_PXA=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SA1100=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4_FS_XATTR is not set
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RUBIN=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_ARM_UNWIND is not set
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/collie/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/collie/defconfig
new file mode 100644
index 0000000..b690f25
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/collie/defconfig
@@ -0,0 +1,142 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_SWAP is not set
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
+CONFIG_RD_LZMA=y
+CONFIG_INITRAMFS_COMPRESSION_LZMA=y
+# CONFIG_UID16 is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_ELF_CORE is not set
+# CONFIG_BASE_FULL is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLOB=y
+# CONFIG_LBDAF is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_SA1100=y
+CONFIG_SA1100_COLLIE=y
+CONFIG_PCCARD=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+CONFIG_PCMCIA_SA1100=y
+CONFIG_NO_HZ=y
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M loglevel=3"
+CONFIG_KEXEC=y
+CONFIG_APM_EMULATION=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_JEDECPROBE=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_GEOMETRY=y
+# CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
+# CONFIG_MTD_CFI_I1 is not set
+# CONFIG_MTD_CFI_I2 is not set
+CONFIG_MTD_CFI_I4=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_ROM=y
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_SA1100=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+CONFIG_PATA_PCMCIA=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=240
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=320
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_APMPOWER=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_LOCOMO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_SERIO is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_SA1100=y
+CONFIG_SERIAL_SA1100_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_SPI=y
+CONFIG_SPI_GPIO=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+CONFIG_BATTERY_COLLIE=y
+# CONFIG_HWMON is not set
+CONFIG_MCP_SA11X0=y
+CONFIG_MCP_UCB1200=y
+CONFIG_MCP_UCB1200_TS=y
+CONFIG_FB=y
+CONFIG_FB_SA1100=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_SPI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_LOCOMO=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SA1100=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4_FS_XATTR is not set
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RUBIN=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_ARM_UNWIND is not set
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/collie_remove_irq_to_gpio.patch b/recipes-kernel/linux/linux-kexecboot-3.2/collie_remove_irq_to_gpio.patch
new file mode 100644
index 0000000..0c277e0
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/collie_remove_irq_to_gpio.patch
@@ -0,0 +1,31 @@
+From 629bcb4b72d49b3631ae3dd0fe1d345820fadfcc Mon Sep 17 00:00:00 2001
+From: Jochen Friedrich <jochen@scram.de>
+Date: Sat, 19 Nov 2011 19:26:37 +0100
+Subject: [PATCH] collie_battery: Get rid of irq_to_gpio usage
+
+Since 9d08d5d77a355510c2f5657c86b0a4b25acfe72c, irq_to_gpio() is no
+longer available but still in use by collie_battery.c. As it's just
+for a debug message, just get rid of this call.
+
+Signed-off-by: Jochen Friedrich <jochen@scram.de>
+Signed-off-by: Anton Vorontsov <cbouatmailru@gmail.com>
+---
+ drivers/power/collie_battery.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/power/collie_battery.c b/drivers/power/collie_battery.c
+index 548d263..7a40fce 100644
+--- a/drivers/power/collie_battery.c
++++ b/drivers/power/collie_battery.c
+@@ -146,7 +146,7 @@ static void collie_bat_external_power_changed(struct power_supply *psy)
+ 
+ static irqreturn_t collie_bat_gpio_isr(int irq, void *data)
+ {
+-	pr_info("collie_bat_gpio irq: %d\n", gpio_get_value(irq_to_gpio(irq)));
++	pr_info("collie_bat_gpio irq\n");
+ 	schedule_work(&bat_work);
+ 	return IRQ_HANDLED;
+ }
+-- 
+1.7.6.5
+
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-kexecboot-3.2/locomo_kbd_tweak-r2.patch
new file mode 100644
index 0000000..0d47ade
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/locomo_kbd_tweak-r2.patch
@@ -0,0 +1,66 @@
+ drivers/input/keyboard/locomokbd.c |   61 +++++++++++++++++++++++--------------
+ 1 file changed, 39 insertions(+), 22 deletions(-)
+
+Index: linux-2.6.26-rc4/drivers/input/keyboard/locomokbd.c
+===================================================================
+--- linux-2.6.26-rc4.orig/drivers/input/keyboard/locomokbd.c	2008-05-26 19:08:11.000000000 +0100
++++ linux-2.6.26-rc4/drivers/input/keyboard/locomokbd.c	2008-06-01 18:35:55.000000000 +0100
+@@ -41,25 +41,32 @@
+ 
+ #define LOCOMOKBD_NUMKEYS	128
+ 
+-#define KEY_ACTIVITY		KEY_F16
+-#define KEY_CONTACT		KEY_F18
+-#define KEY_CENTER		KEY_F15
++#define LOCOMO_KEY_CALENDER	KEY_LEFTCTRL
++#define LOCOMO_KEY_ADDRESS	KEY_LEFTALT	/* Needed for SysRQ */
++#define LOCOMO_KEY_HOME		KEY_SYSRQ	/* Needed for SysRQ */
++#define LOCOMO_KEY_MENU		KEY_F12
++#define LOCOMO_KEY_MAIL		KEY_F10
++#define LOCOMO_KEY_OK		KEY_F11		/* Don't hardwire to KEY_RETURN */
++#define LOCOMO_KEY_CANCEL	KEY_POWER
++#define LOCOMO_KEY_CENTER	KEY_F5		/* Don't hardwire to KEY_RETURN */
+ 
+-static const unsigned char
++#define LOCOMO_KEY_FN		KEY_F9
++
++static const unsigned char 
+ locomokbd_keycode[LOCOMOKBD_NUMKEYS] __devinitconst = {
+-	0, KEY_ESC, KEY_ACTIVITY, 0, 0, 0, 0, 0, 0, 0,				/* 0 - 9 */
+-	0, 0, 0, 0, 0, 0, 0, KEY_MENU, KEY_HOME, KEY_CONTACT,			/* 10 - 19 */
+-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,						/* 20 - 29 */
+-	0, 0, 0, KEY_CENTER, 0, KEY_MAIL, 0, 0, 0, 0,				/* 30 - 39 */
+-	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,					/* 40 - 49 */
+-	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,		/* 50 - 59 */
+-	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, KEY_ENTER, 0, 0,			/* 60 - 69 */
+-	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,	/* 70 - 79 */
+-	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,		/* 80 - 89 */
+-	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,				/* 90 - 99 */
+-	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,		/* 100 - 109 */
+-	KEY_LEFTSHIFT, KEY_TAB, KEY_LEFTCTRL, 0, 0, 0, 0, 0, 0, 0,		/* 110 - 119 */
+-	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0		/* 120 - 128 */
++	0, LOCOMO_KEY_CANCEL, LOCOMO_KEY_CALENDER, LOCOMO_KEY_HOME, 0, 0, 0, 0, 0, 0,	/* 0 - 9 */
++	0, 0, 0, 0, 0, 0, 0, LOCOMO_KEY_MENU, 0, LOCOMO_KEY_ADDRESS,			/* 10 - 19 */
++	0, 0, 0, 0, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,					/* 20 - 29 */
++	0, 0, 0, LOCOMO_KEY_CENTER, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,			/* 30 - 39 */
++	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,						/* 40 - 49 */
++	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,			/* 50 - 59 */
++	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, LOCOMO_KEY_OK, 0, 0,			/* 60 - 69 */
++	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,		/* 70 - 79 */
++	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,			/* 80 - 89 */
++	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,					/* 90 - 99 */
++	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,			/* 100 - 109 */
++	KEY_LEFTSHIFT, KEY_TAB, LOCOMO_KEY_FN, 0, 0, 0, 0, 0, 0, 0,			/* 110 - 119 */
++	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0			/* 120 - 128 */
+ };
+ 
+ #define KB_ROWS			16
+@@ -68,7 +75,7 @@
+ #define SCANCODE(c,r)		( ((c)<<4) + (r) + 1 )
+ 
+ #define KB_DELAY		8
+-#define SCAN_INTERVAL		(HZ/10)
++#define SCAN_INTERVAL		(HZ/20)
+ 
+ struct locomokbd {
+ 	unsigned char keycode[LOCOMOKBD_NUMKEYS];
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/poodle/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/poodle/defconfig
new file mode 100644
index 0000000..141abd7
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/poodle/defconfig
@@ -0,0 +1,134 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_SWAP is not set
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
+CONFIG_RD_LZMA=y
+CONFIG_INITRAMFS_COMPRESSION_LZMA=y
+# CONFIG_UID16 is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_ELF_CORE is not set
+# CONFIG_BASE_FULL is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLOB=y
+# CONFIG_LBDAF is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_PXA=y
+CONFIG_PXA_SHARPSL=y
+CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
+CONFIG_MACH_POODLE=y
+CONFIG_PCCARD=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+CONFIG_PCMCIA_PXA2XX=y
+CONFIG_NO_HZ=y
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CONFIG_KEXEC=y
+CONFIG_APM_EMULATION=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_ROM=y
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+CONFIG_MTD_NAND_SHARPSL=y
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+CONFIG_PATA_PXA=y
+CONFIG_PATA_PCMCIA=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=240
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=320
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_APMPOWER=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_LOCOMO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=y
+# CONFIG_SERIO is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_PXA=y
+CONFIG_SPI=y
+CONFIG_SPI_PXA2XX=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_HWMON is not set
+CONFIG_FB=y
+CONFIG_FB_PXA=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_PXA=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_LOCOMO=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SA1100=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4_FS_XATTR is not set
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RUBIN=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_ARM_UNWIND is not set
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/spitz/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/spitz/defconfig
index 6798921..6c579fa 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.2/spitz/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/spitz/defconfig
@@ -9,6 +9,8 @@ CONFIG_RD_LZMA=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_KALLSYMS is not set
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
 # CONFIG_ELF_CORE is not set
 # CONFIG_BASE_FULL is not set
 CONFIG_EMBEDDED=y
@@ -83,6 +85,8 @@ CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_FONTS=y
 CONFIG_FONT_8x16=y
 CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_HID_SUPPORT is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_MMC=y
@@ -120,9 +124,6 @@ CONFIG_PARTITION_ADVANCED=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_FRAME_WARN=2048
 CONFIG_MAGIC_SYSRQ=y
-# CONFIG_DEBUG_BUGVERBOSE is not set
 # CONFIG_ARM_UNWIND is not set
-CONFIG_DEBUG_LL=y
-CONFIG_EARLY_PRINTK=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
 # CONFIG_CRYPTO_HW is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/tosa/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/tosa/defconfig
new file mode 100644
index 0000000..971c49a
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/tosa/defconfig
@@ -0,0 +1,133 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_SWAP is not set
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
+CONFIG_RD_LZMA=y
+CONFIG_INITRAMFS_COMPRESSION_LZMA=y
+# CONFIG_UID16 is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_ELF_CORE is not set
+# CONFIG_BASE_FULL is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLOB=y
+# CONFIG_LBDAF is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_PXA=y
+CONFIG_PXA_SHARPSL=y
+CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
+CONFIG_MACH_TOSA=y
+CONFIG_PCCARD=y
+# CONFIG_PCMCIA_LOAD_CIS is not set
+CONFIG_PCMCIA_PXA2XX=y
+CONFIG_NO_HZ=y
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 loglevel=3"
+CONFIG_KEXEC=y
+CONFIG_APM_EMULATION=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_ROM=y
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+CONFIG_MTD_NAND_TMIO=y
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+CONFIG_PATA_PXA=y
+CONFIG_PATA_PCMCIA=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=480
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=640
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_APMPOWER=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_MATRIX=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_SERIO is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_PXA=y
+CONFIG_SERIAL_PXA_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_PXA=y
+CONFIG_SPI=y
+CONFIG_SPI_PXA2XX=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_HWMON is not set
+CONFIG_MFD_TC6393XB=y
+CONFIG_FB=y
+CONFIG_FB_TMIO=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_TOSA=y
+CONFIG_BACKLIGHT_TOSA=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x16=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_PXA=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SA1100=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+# CONFIG_EXT4_FS_XATTR is not set
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RUBIN=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_ARM_UNWIND is not set
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
diff --git a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
index 375dcdd..779deb9 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
+++ b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
@@ -1,16 +1,17 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/linux-kexecboot-${PV}:${THISDIR}/files:"
 
+# wait until klibc_2.0 is out (march/april 2012)
 DEFAULT_PREFERENCE = "-1"
-#COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
-COMPATIBLE_MACHINE = "(spitz)"
+
+COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
 # Note we set loglevel=3 and master console on serial to protect bootlogo.
-CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8"
-CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8"
-CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
-CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_c7x0 = "console=tty0 console=ttyS0,115200n8"
+CMDLINE_tosa = "console=tty0 console=ttyS0,115200n8"
+CMDLINE_poodle = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_akita = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_collie = "console=tty0 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
+CMDLINE_spitz = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
 
 # Zaurus machines need kernel size-check.
 KERNEL_IMAGE_MAXSIZE_akita = "1294336"
@@ -29,6 +30,7 @@ SRC_URI += "file://defconfig \
 SRC_URI_append_collie = " \
                          file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
                          file://locomo_kbd_tweak-r2.patch \
+                         file://collie_remove_irq_to_gpio.patch \
                          "
 
 SRC_URI_append_poodle = " \
-- 
1.7.3.4



