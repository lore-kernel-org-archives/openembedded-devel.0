Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9Se-00053y-Df
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:45:49 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so871094fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7UYTaxadQWVlljGAeXmkCrv9XdA+9NJoTPxgD/pwTxA=;
	b=Tn5uTRsWsX7AaYjqTUrVCki+66nfHkn3m+qtp0B+zRwgjn4DWfFqpmxXKeBZgl4mdk
	zNmGSe9wbGITQeJZJJkK1UoUiDEOivi6TcCSQFtEyZhjU8ojrj33lrnigroezfNBusTJ
	zSOMj2VCeJpkS7Y2ttRE/PDKcwOQrB9u9NNec=
Received: by 10.223.64.66 with SMTP id d2mr481676fai.116.1314891654891;
	Thu, 01 Sep 2011 08:40:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c4sm123366fac.35.2011.09.01.08.40.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:40:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:39:10 +0200
Message-Id: <cd59dc8840c5c0e0a0d35049055fe2fc891b0af9.1314891222.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
References: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314891222.git.Martin.Jansa@gmail.com>
References: <cover.1314891222.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 03/10] linux-kexecboot: import from meta-zaurus
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
X-List-Received-Date: Thu, 01 Sep 2011 15:45:49 -0000

* from rev 36ad029194d2b57efa07896b5cda3231bc71f357 in meta-smartphone repo
  http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=36ad029194d2b57efa07896b5cda3231bc71f357

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot.inc           |  140 +++++++++++++++++++
 .../linux/linux-kexecboot/akita/defconfig          |  133 ++++++++++++++++++
 .../linux/linux-kexecboot/c7x0/defconfig           |  135 ++++++++++++++++++
 .../linux/linux-kexecboot/collie/defconfig         |  145 ++++++++++++++++++++
 .../linux/linux-kexecboot/poodle/defconfig         |  137 ++++++++++++++++++
 .../linux/linux-kexecboot/spitz/defconfig          |  133 ++++++++++++++++++
 .../linux/linux-kexecboot/tosa/defconfig           |  135 ++++++++++++++++++
 recipes-kernel/linux/linux-kexecboot_2.6.39.bb     |   27 ++++
 8 files changed, 985 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-kexecboot.inc
 create mode 100644 recipes-kernel/linux/linux-kexecboot/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot/tosa/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot_2.6.39.bb

diff --git a/recipes-kernel/linux/linux-kexecboot.inc b/recipes-kernel/linux/linux-kexecboot.inc
new file mode 100644
index 0000000..d4525b2
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot.inc
@@ -0,0 +1,140 @@
+# We set INC_PR here, since a change in the kexecboot recipe will need to get picked up by *all* the kernels:
+INC_PR = "r43"
+
+inherit kernel siteinfo
+
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+DEPENDS += "xz-native"
+
+# Kernel bootlogo is distro-specific (default is OE logo).
+# Logo resolution (qvga, vga, ...) is machine-specific.
+LOGO_SIZE ?= "."
+SRC_URI = "file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2"
+
+# Set the verbosity of kernel messages during runtime
+CMDLINE_DEBUG ?= '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "loglevel=3", d)}'
+
+# Note how we set master console on serial to protect bootlogo.
+CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8 ${CMDLINE_DEBUG}"
+CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8 ${CMDLINE_DEBUG}"
+CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 ${CMDLINE_DEBUG}"
+CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 ${CMDLINE_DEBUG}"
+CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M ${CMDLINE_DEBUG}"
+CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 ${CMDLINE_DEBUG}"
+
+PACKAGES = ""
+PROVIDES = ""
+
+# Zaurus machines need kernel size-check
+KERNEL_IMAGE_MAXSIZE_akita = "1294336"
+KERNEL_IMAGE_MAXSIZE_c7x0 = "1294336"
+KERNEL_IMAGE_MAXSIZE_collie = "1048576"
+KERNEL_IMAGE_MAXSIZE_poodle = "1294336"
+KERNEL_IMAGE_MAXSIZE_tosa = "1294336"
+KERNEL_IMAGE_MAXSIZE_spitz = "1294336"
+
+KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-kexecboot-${PV}-${PR}-${MACHINE}"
+KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}"
+
+LOCALVERSION ?= ""
+
+# we want the smallest size
+INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
+
+do_configure_prepend() {
+
+        echo "" > ${S}/.config
+
+        #
+        # CONFIG_CMDLINE mangling
+        #
+        echo "CONFIG_CMDLINE_BOOL=y" >> ${S}/.config
+        echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config
+
+        # mips and x86
+        echo "CONFIG_CMDLINE_OVERRIDE=y" >> ${S}/.config
+
+        # sh only
+        echo "CONFIG_CMDLINE_OVERWRITE=y" >> ${S}/.config
+        echo "# CONFIG_CMDLINE_EXTEND is not set" >> ${S}/.config
+
+        #
+        # endian support
+        #
+        if [ "${SITEINFO_ENDIANNESS}" = "be" ]; then
+                echo "CONFIG_CPU_BIG_ENDIAN=y"          >> ${S}/.config
+        fi
+
+        #
+        # logo support, if you supply logo_linux_clut224.ppm in SRC_URI, then it is going to be used
+        #
+        if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
+                install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
+                echo "CONFIG_LOGO=y"                    >> ${S}/.config
+                echo "CONFIG_LOGO_LINUX_CLUT224=y"      >> ${S}/.config
+        fi
+
+        # When enabling thumb for userspace we also need thumb support in the kernel
+        if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then
+            sed -i -e /CONFIG_ARM_THUMB/d ${WORKDIR}/defconfig 
+            echo "CONFIG_ARM_THUMB=y" >> ${S}/.config
+        fi
+
+        sed -e '/CONFIG_CMDLINE=/d' \
+            -e '/CONFIG_CMDLINE_BOOL/d' \
+            -e '/CONFIG_CMDLINE_OVERRIDE/d' \
+            -e '/CONFIG_CMDLINE_OVERWRITE/d' \
+            -e '/CONFIG_CMDLINE_EXTEND/d' \
+            -e '/CONFIG_CPU_BIG_ENDIAN/d' \
+            -e '/CONFIG_LOGO=/d' \
+            -e '/CONFIG_LOGO_LINUX_CLUT224=/d' \
+            -e '/CONFIG_LOCALVERSION/d' \
+            -e '/CONFIG_LOCALVERSION_AUTO/d' \
+            < '${WORKDIR}/defconfig' >>'${S}/.config'
+
+        echo 'CONFIG_LOCALVERSION="${LOCALVERSION}"' >>${S}/.config
+        echo '# CONFIG_LOCALVERSION_AUTO is not set' >>${S}/.config
+
+        # Force sane defaults for kexec-enabled kernels and keep size small
+        sed -i -e /CONFIG_BLK_DEV_INITRD/d \
+               -e /CONFIG_KEXEC/d \
+               -e /=m/d \
+               -e /CONFIG_MODULES/d \
+               -e /CONFIG_DEBUG_ERRORS/d \
+               -e /CONFIG_DEBUG_BUGVERBOSE/d \
+               -e /CONFIG_DEBUG_KERNEL/d \
+               ${S}/.config
+
+               echo 'CONFIG_BLK_DEV_INITRD=y' >>${S}/.config
+               echo 'CONFIG_KEXEC=y' >>${S}/.config
+               echo '# CONFIG_MODULES is not set' >> ${S}/.config
+
+        # Force lzma for arm kernels only
+        if [ "${ARCH}" = "arm" ] ; then
+
+            sed -i -e /CONFIG_KERNEL/d \
+               -e /CONFIG_INITRAMFS_COMPRESSION/d \
+               -e /CONFIG_INITRAMFS_SOURCE/d \
+               -e /CONFIG_RD/d \
+               ${S}/.config
+
+               echo 'CONFIG_KERNEL_LZMA=y' >>${S}/.config
+               echo 'CONFIG_INITRAMFS_COMPRESSION_LZMA=y' >>${S}/.config
+               echo 'CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"' >>${S}/.config
+               echo 'CONFIG_RD_LZMA=y' >>${S}/.config
+        fi
+
+        yes '' | oe_runmake oldconfig
+}
+
+do_populate_sysroot() {
+        :
+}
+
+do_install() {
+        :
+}
+
diff --git a/recipes-kernel/linux/linux-kexecboot/akita/defconfig b/recipes-kernel/linux/linux-kexecboot/akita/defconfig
new file mode 100644
index 0000000..75c23b3
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot/akita/defconfig
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
+# CONFIG_SYSCTL_SYSCALL is not set
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
+CONFIG_MTD_PARTITIONS=y
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
+CONFIG_SPI=y
+CONFIG_SPI_PXA2XX=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_MFD_SUPPORT is not set
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
diff --git a/recipes-kernel/linux/linux-kexecboot/c7x0/defconfig b/recipes-kernel/linux/linux-kexecboot/c7x0/defconfig
new file mode 100644
index 0000000..1d544cb
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot/c7x0/defconfig
@@ -0,0 +1,135 @@
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
+# CONFIG_SYSCTL_SYSCALL is not set
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
+CONFIG_MTD_PARTITIONS=y
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
+CONFIG_SPI=y
+CONFIG_SPI_PXA2XX=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_MFD_SUPPORT is not set
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
diff --git a/recipes-kernel/linux/linux-kexecboot/collie/defconfig b/recipes-kernel/linux/linux-kexecboot/collie/defconfig
new file mode 100644
index 0000000..0b5b2fe
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot/collie/defconfig
@@ -0,0 +1,145 @@
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
+# CONFIG_SYSCTL_SYSCALL is not set
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
+CONFIG_MTD_PARTITIONS=y
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
+# CONFIG_MFD_SUPPORT is not set
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
diff --git a/recipes-kernel/linux/linux-kexecboot/poodle/defconfig b/recipes-kernel/linux/linux-kexecboot/poodle/defconfig
new file mode 100644
index 0000000..c714c21
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot/poodle/defconfig
@@ -0,0 +1,137 @@
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
+# CONFIG_SYSCTL_SYSCALL is not set
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
+CONFIG_MTD_PARTITIONS=y
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
+# CONFIG_MFD_SUPPORT is not set
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
diff --git a/recipes-kernel/linux/linux-kexecboot/spitz/defconfig b/recipes-kernel/linux/linux-kexecboot/spitz/defconfig
new file mode 100644
index 0000000..75c23b3
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot/spitz/defconfig
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
+# CONFIG_SYSCTL_SYSCALL is not set
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
+CONFIG_MTD_PARTITIONS=y
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
+CONFIG_SPI=y
+CONFIG_SPI_PXA2XX=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_MFD_SUPPORT is not set
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
diff --git a/recipes-kernel/linux/linux-kexecboot/tosa/defconfig b/recipes-kernel/linux/linux-kexecboot/tosa/defconfig
new file mode 100644
index 0000000..f843ecb
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot/tosa/defconfig
@@ -0,0 +1,135 @@
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
+# CONFIG_SYSCTL_SYSCALL is not set
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
+CONFIG_MTD_PARTITIONS=y
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
diff --git a/recipes-kernel/linux/linux-kexecboot_2.6.39.bb b/recipes-kernel/linux/linux-kexecboot_2.6.39.bb
new file mode 100644
index 0000000..dae6a22
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot_2.6.39.bb
@@ -0,0 +1,27 @@
+require linux-kexecboot.inc
+
+PR = "${INC_PR}.4"
+
+S = "${WORKDIR}/linux-${PV}"
+
+# Mark archs/machines that this kernel supports
+DEFAULT_PREFERENCE = "-1"
+
+DEFAULT_PREFERENCE_akita = "1"
+DEFAULT_PREFERENCE_c7x0 = "1"
+DEFAULT_PREFERENCE_collie = "1"
+DEFAULT_PREFERENCE_poodle = "1"
+DEFAULT_PREFERENCE_spitz = "1"
+DEFAULT_PREFERENCE_tosa = "1"
+
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+            ${KERNELORG_MIRROR}/linux/kernel/v2.6/patch-${PV}.4.bz2;apply=yes;name=stablepatch \
+            file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
+            file://locomo_kbd_tweak-r2.patch \
+            file://defconfig \
+            "
+
+SRC_URI[kernel.md5sum] = "1aab7a741abe08d42e8eccf20de61e05"
+SRC_URI[kernel.sha256sum] = "584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6"
+SRC_URI[stablepatch.md5sum] = "ff5eb7323c054a128d2922bde3297ed5"
+SRC_URI[stablepatch.sha256sum] = "132ba590e92d5c9a1bb0dc0885795a095d48e7db2552f1c9e3c26ce946a70a40"
-- 
1.7.6.1



