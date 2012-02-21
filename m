Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rze6V-0006mn-7l
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 02:01:16 +0100
Received: by pbcum15 with SMTP id um15so1166755pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 16:52:55 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.74.72 as permitted sender) client-ip=10.68.74.72; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.74.72 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.74.72])
	by 10.68.74.72 with SMTP id r8mr61915586pbv.86.1329785575898 (num_hops
	= 1); Mon, 20 Feb 2012 16:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4TVYQn/M6mbkTNgw1rFCbyNOoqNfuxKpK35kxUjmok4=;
	b=TMKAg8ftWqOqG6Bwdwvji43NhAO6Dk9gO1rfR88rv8Exc87GcfOq62yptM498OwJGi
	O8BFulr/SIWpFM/UgLZrLh452rxG8ly7mWUpAO5Z7Ctcg6USVT1G2+SLevtQ7jBKlnNq
	AqEcGXCxjzIBAPKLdYsEs1mGOqZ/JHPzay5+g=
MIME-Version: 1.0
Received: by 10.68.74.72 with SMTP id r8mr50889188pbv.86.1329785575663; Mon,
	20 Feb 2012 16:52:55 -0800 (PST)
Received: by 10.143.147.17 with HTTP; Mon, 20 Feb 2012 16:52:55 -0800 (PST)
In-Reply-To: <1329783724-10816-3-git-send-email-andrea.adami@gmail.com>
References: <cover.1329780628.git.andrea.adami@gmail.com>
	<1329783724-10816-3-git-send-email-andrea.adami@gmail.com>
Date: Tue, 21 Feb 2012 01:52:55 +0100
Message-ID: <CAAQYJAvTekJU7_fL3Gd25ndKqUa2jSP0r-nGhnMo5L6fsezCtA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 6/6] meta-initramfs: add linux-kexecboot_3.1 from meta-handheld
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
X-List-Received-Date: Tue, 21 Feb 2012 01:01:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 1:21 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0.../linux/files/qvga/logo_linux_clut224.ppm.bz2 =A0 =A0| =A0Bin 0 -> 5=
547 bytes
> =A0.../linux/files/vga/logo_linux_clut224.ppm.bz2 =A0 =A0 | =A0Bin 0 -> 6=
436 bytes
> =A0...xx_sharpsl-retain-ops-structure-on-collie.patch | =A0 34 +++++
> =A0.../linux/linux-kexecboot-3.1/akita/defconfig =A0 =A0 =A0| =A0132 ++++=
++++++++++++++
> =A0.../linux/linux-kexecboot-3.1/c7x0/defconfig =A0 =A0 =A0 | =A0134 ++++=
++++++++++++++
> =A0.../linux/linux-kexecboot-3.1/collie/defconfig =A0 =A0 | =A0144 ++++++=
++++++++++++++
> =A0.../linux-kexecboot-3.1/locomo_kbd_tweak-r2.patch =A0| =A0 66 ++++++++=
+
> =A0.../linux/linux-kexecboot-3.1/poodle/defconfig =A0 =A0 | =A0136 ++++++=
++++++++++++
> =A0.../linux/linux-kexecboot-3.1/spitz/defconfig =A0 =A0 =A0| =A0132 ++++=
++++++++++++++
> =A0.../linux/linux-kexecboot-3.1/tosa/defconfig =A0 =A0 =A0 | =A0134 ++++=
++++++++++++++
> =A0.../recipes-kernel/linux/linux-kexecboot.inc =A0 =A0 =A0 | =A0136 ++++=
++++++++++++++
> =A0.../recipes-kernel/linux/linux-kexecboot_3.1.bb =A0 =A0| =A0 15 ++
> =A012 files changed, 1063 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/files/qvga/logo=
_linux_clut224.ppm.bz2
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/files/vga/logo_=
linux_clut224.ppm.bz2
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot=
-3.1/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot=
-3.1/akita/defconfig
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot=
-3.1/c7x0/defconfig
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot=
-3.1/collie/defconfig
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot=
-3.1/locomo_kbd_tweak-r2.patch
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot=
-3.1/poodle/defconfig
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot=
-3.1/spitz/defconfig
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot=
-3.1/tosa/defconfig
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot=
.inc
> =A0create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot=
_3.1.bb
>
> diff --git a/meta-initramfs/recipes-kernel/linux/files/qvga/logo_linux_cl=
ut224.ppm.bz2 b/meta-initramfs/recipes-kernel/linux/files/qvga/logo_linux_c=
lut224.ppm.bz2
> new file mode 100644
> index 0000000000000000000000000000000000000000..ddc39a3c64dfadcd18c3d3f44=
89378c59fd649cc
> GIT binary patch
> literal 5547
> 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
t
> zb0Cno?Xc$0`}zOIKnQdr-p4{f9%ayPRl=3Dt@k6(u|XxQ;+q5dygE~VDw#1Y+{$R$hQ
> zAG>0g{KhkN|AxGo{7mm5#YeD^_Kva6wmP^4%>*P+8rLfN&8>3e*r0uTEc2)6r}$o$
> z1S=3D~lY?Dvd_+{Fe984_lmrb6jHY?vH@gSjE$Q%hurxB20fi6KFvmY(uh#+Z>f{RBR
> zD;~7&s<(9fv1MlBQVg%vucq~v_hT>sohkqT!ghcPh=3Dv?-A(geU<P=3D>8UH5GNK=3DZTN
> Sex#Cb>7?Lnq(&RAkNSUT^P|B4
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta-initramfs/recipes-kernel/linux/files/vga/logo_linux_clu=
t224.ppm.bz2 b/meta-initramfs/recipes-kernel/linux/files/vga/logo_linux_clu=
t224.ppm.bz2
> new file mode 100644
> index 0000000000000000000000000000000000000000..c3aeaac1833469a6de74f75a7=
7d655d600c5bd99
> GIT binary patch
> literal 6436
> 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
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/0001=
-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch b/meta-initramf=
s/recipes-kernel/linux/linux-kexecboot-3.1/0001-pcmcia-pxa2xx_sharpsl-retai=
n-ops-structure-on-collie.patch
> new file mode 100644
> index 0000000..d86b47d
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/0001-pcmcia=
-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
> @@ -0,0 +1,34 @@
> +From 31d99c4c9f14e571ca0e22c5862dd5b6a871e2dd Mon Sep 17 00:00:00 2001
> +From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> +Date: Fri, 5 Aug 2011 15:32:23 +0400
> +Subject: [PATCH] pcmcia/pxa2xx_sharpsl: retain ops structure on collie
> +
> +The pxa2xx_sharpsl driver part is also used on collie, which (as
> +a StrongARM board) has different expectations for PCMCIA drivers.
> +So, on collie place sharpsl_pcmcia_ops in .data section rather than
> +in __initdata.
> +
> +Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> +---
> + drivers/pcmcia/pxa2xx_sharpsl.c | =A0 =A04 ++++
> + 1 files changed, 4 insertions(+), 0 deletions(-)
> +
> +diff --git a/drivers/pcmcia/pxa2xx_sharpsl.c b/drivers/pcmcia/pxa2xx_sha=
rpsl.c
> +index 81af2b3..1b5b749 100644
> +--- a/drivers/pcmcia/pxa2xx_sharpsl.c
> ++++ b/drivers/pcmcia/pxa2xx_sharpsl.c
> +@@ -222,7 +222,11 @@ static void sharpsl_pcmcia_socket_suspend(struct so=
c_pcmcia_socket *skt)
> + =A0 =A0 =A0 sharpsl_pcmcia_init_reset(skt);
> + }
> +
> ++#ifdef CONFIG_SA1100_COLLIE
> ++static struct pcmcia_low_level sharpsl_pcmcia_ops =3D {
> ++#else
> + static struct pcmcia_low_level sharpsl_pcmcia_ops __initdata =3D {
> ++#endif
> + =A0 =A0 =A0 .owner =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 .hw_init =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D sharpsl_pcmcia_=
hw_init,
> + =A0 =A0 =A0 .hw_shutdown =A0 =A0 =A0 =A0 =A0 =A0=3D sharpsl_pcmcia_hw_s=
hutdown,
> +--
> +1.7.2.5
> +
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/akit=
a/defconfig b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/akita=
/defconfig
> new file mode 100644
> index 0000000..b066839
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/akita/defco=
nfig
> @@ -0,0 +1,132 @@
> +CONFIG_EXPERIMENTAL=3Dy
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_KERNEL_LZMA=3Dy
> +# CONFIG_SWAP is not set
> +CONFIG_LOG_BUF_SHIFT=3D14
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_INITRAMFS_SOURCE=3D"initramfs.cpio.lzma"
> +CONFIG_RD_LZMA=3Dy
> +CONFIG_INITRAMFS_COMPRESSION_LZMA=3Dy
> +# CONFIG_UID16 is not set
> +# CONFIG_SYSCTL_SYSCALL is not set
> +# CONFIG_KALLSYMS is not set
> +# CONFIG_PRINTK is not set
> +# CONFIG_BUG is not set
> +# CONFIG_ELF_CORE is not set
> +# CONFIG_BASE_FULL is not set
> +CONFIG_EMBEDDED=3Dy
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLOB=3Dy
> +# CONFIG_LBDAF is not set
> +# CONFIG_IOSCHED_CFQ is not set
> +CONFIG_ARCH_PXA=3Dy
> +CONFIG_PXA_SHARPSL=3Dy
> +CONFIG_PXA_SHARPSL_DETECT_MACH_ID=3Dy
> +CONFIG_MACH_AKITA=3Dy
> +CONFIG_MACH_BORZOI=3Dy
> +CONFIG_PCCARD=3Dy
> +# CONFIG_PCMCIA_LOAD_CIS is not set
> +CONFIG_PCMCIA_PXA2XX=3Dy
> +CONFIG_NO_HZ=3Dy
> +CONFIG_AEABI=3Dy
> +# CONFIG_OABI_COMPAT is not set
> +CONFIG_ZBOOT_ROM_TEXT=3D0x0
> +CONFIG_ZBOOT_ROM_BSS=3D0x0
> +CONFIG_CMDLINE=3D"console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotate=
:1 loglevel=3D3"
> +CONFIG_KEXEC=3Dy
> +CONFIG_DEVTMPFS=3Dy
> +CONFIG_DEVTMPFS_MOUNT=3Dy
> +CONFIG_MTD=3Dy
> +CONFIG_MTD_CMDLINE_PARTS=3Dy
> +CONFIG_MTD_CHAR=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_ROM=3Dy
> +CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> +CONFIG_MTD_PHYSMAP=3Dy
> +CONFIG_MTD_NAND=3Dy
> +CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
> +CONFIG_MTD_NAND_SHARPSL=3Dy
> +CONFIG_MTD_UBI=3Dy
> +CONFIG_BLK_DEV_LOOP=3Dy
> +CONFIG_BLK_DEV_SD=3Dy
> +CONFIG_ATA=3Dy
> +# CONFIG_ATA_VERBOSE_ERROR is not set
> +# CONFIG_SATA_PMP is not set
> +CONFIG_PATA_PXA=3Dy
> +CONFIG_PATA_PCMCIA=3Dy
> +# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> +CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D640
> +CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D480
> +CONFIG_INPUT_EVDEV=3Dy
> +CONFIG_INPUT_APMPOWER=3Dy
> +# CONFIG_KEYBOARD_ATKBD is not set
> +CONFIG_KEYBOARD_GPIO=3Dy
> +CONFIG_KEYBOARD_MATRIX=3Dy
> +# CONFIG_INPUT_MOUSE is not set
> +CONFIG_INPUT_TOUCHSCREEN=3Dy
> +CONFIG_TOUCHSCREEN_ADS7846=3Dy
> +# CONFIG_SERIO is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_DEVKMEM is not set
> +CONFIG_SERIAL_PXA=3Dy
> +CONFIG_SERIAL_PXA_CONSOLE=3Dy
> +# CONFIG_HW_RANDOM is not set
> +# CONFIG_I2C_COMPAT is not set
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_PXA2XX=3Dy
> +CONFIG_POWER_SUPPLY=3Dy
> +CONFIG_PDA_POWER=3Dy
> +CONFIG_APM_POWER=3Dy
> +# CONFIG_MFD_SUPPORT is not set
> +CONFIG_FB=3Dy
> +CONFIG_FB_PXA=3Dy
> +CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> +CONFIG_LCD_CORGI=3Dy
> +CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> +CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> +CONFIG_FONTS=3Dy
> +CONFIG_FONT_8x16=3Dy
> +CONFIG_LOGO=3Dy
> +# CONFIG_LOGO_LINUX_MONO is not set
> +# CONFIG_LOGO_LINUX_VGA16 is not set
> +# CONFIG_HID_SUPPORT is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=3Dy
> +CONFIG_MMC_PXA=3Dy
> +CONFIG_NEW_LEDS=3Dy
> +CONFIG_LEDS_CLASS=3Dy
> +CONFIG_LEDS_GPIO=3Dy
> +CONFIG_LEDS_TRIGGERS=3Dy
> +CONFIG_LEDS_TRIGGER_TIMER=3Dy
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_DRV_PXA=3Dy
> +CONFIG_EXT2_FS=3Dy
> +CONFIG_EXT3_FS=3Dy
> +# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> +# CONFIG_EXT3_FS_XATTR is not set
> +CONFIG_EXT4_FS=3Dy
> +# CONFIG_EXT4_FS_XATTR is not set
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +CONFIG_MSDOS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +# CONFIG_PROC_PAGE_MONITOR is not set
> +CONFIG_TMPFS=3Dy
> +CONFIG_TMPFS_POSIX_ACL=3Dy
> +CONFIG_JFFS2_FS=3Dy
> +CONFIG_JFFS2_SUMMARY=3Dy
> +CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> +CONFIG_JFFS2_LZO=3Dy
> +CONFIG_JFFS2_RUBIN=3Dy
> +CONFIG_UBIFS_FS=3Dy
> +CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> +CONFIG_PARTITION_ADVANCED=3Dy
> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
> +# CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_FRAME_WARN=3D2048
> +CONFIG_MAGIC_SYSRQ=3Dy
> +# CONFIG_ARM_UNWIND is not set
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> +# CONFIG_CRYPTO_HW is not set
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/c7x0=
/defconfig b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/c7x0/d=
efconfig
> new file mode 100644
> index 0000000..b08e27e
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/c7x0/defcon=
fig
> @@ -0,0 +1,134 @@
> +CONFIG_EXPERIMENTAL=3Dy
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_KERNEL_LZMA=3Dy
> +# CONFIG_SWAP is not set
> +CONFIG_LOG_BUF_SHIFT=3D14
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_INITRAMFS_SOURCE=3D"initramfs.cpio.lzma"
> +CONFIG_RD_LZMA=3Dy
> +CONFIG_INITRAMFS_COMPRESSION_LZMA=3Dy
> +# CONFIG_UID16 is not set
> +# CONFIG_SYSCTL_SYSCALL is not set
> +# CONFIG_KALLSYMS is not set
> +# CONFIG_PRINTK is not set
> +# CONFIG_BUG is not set
> +# CONFIG_ELF_CORE is not set
> +# CONFIG_BASE_FULL is not set
> +CONFIG_EMBEDDED=3Dy
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLOB=3Dy
> +# CONFIG_LBDAF is not set
> +# CONFIG_IOSCHED_CFQ is not set
> +CONFIG_ARCH_PXA=3Dy
> +CONFIG_PXA_SHARPSL=3Dy
> +CONFIG_PXA_SHARPSL_DETECT_MACH_ID=3Dy
> +CONFIG_MACH_CORGI=3Dy
> +CONFIG_MACH_SHEPHERD=3Dy
> +CONFIG_MACH_HUSKY=3Dy
> +CONFIG_PCCARD=3Dy
> +# CONFIG_PCMCIA_LOAD_CIS is not set
> +CONFIG_PCMCIA_PXA2XX=3Dy
> +CONFIG_NO_HZ=3Dy
> +CONFIG_AEABI=3Dy
> +# CONFIG_OABI_COMPAT is not set
> +CONFIG_ZBOOT_ROM_TEXT=3D0x0
> +CONFIG_ZBOOT_ROM_BSS=3D0x0
> +CONFIG_CMDLINE=3D"console=3Dtty1 console=3DttyS0,115200n8 loglevel=3D3"
> +CONFIG_KEXEC=3Dy
> +CONFIG_DEVTMPFS=3Dy
> +CONFIG_DEVTMPFS_MOUNT=3Dy
> +CONFIG_MTD=3Dy
> +CONFIG_MTD_CMDLINE_PARTS=3Dy
> +CONFIG_MTD_CHAR=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_ROM=3Dy
> +CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> +CONFIG_MTD_PHYSMAP=3Dy
> +CONFIG_MTD_NAND=3Dy
> +CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
> +CONFIG_MTD_NAND_SHARPSL=3Dy
> +CONFIG_MTD_UBI=3Dy
> +CONFIG_BLK_DEV_LOOP=3Dy
> +CONFIG_BLK_DEV_SD=3Dy
> +CONFIG_ATA=3Dy
> +# CONFIG_ATA_VERBOSE_ERROR is not set
> +# CONFIG_SATA_PMP is not set
> +CONFIG_PATA_PXA=3Dy
> +CONFIG_PATA_PCMCIA=3Dy
> +# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> +CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D640
> +CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D480
> +CONFIG_INPUT_EVDEV=3Dy
> +CONFIG_INPUT_APMPOWER=3Dy
> +# CONFIG_KEYBOARD_ATKBD is not set
> +CONFIG_KEYBOARD_GPIO=3Dy
> +CONFIG_KEYBOARD_MATRIX=3Dy
> +# CONFIG_INPUT_MOUSE is not set
> +CONFIG_INPUT_TOUCHSCREEN=3Dy
> +CONFIG_TOUCHSCREEN_ADS7846=3Dy
> +# CONFIG_SERIO is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_DEVKMEM is not set
> +CONFIG_SERIAL_PXA=3Dy
> +CONFIG_SERIAL_PXA_CONSOLE=3Dy
> +# CONFIG_HW_RANDOM is not set
> +CONFIG_I2C=3Dy
> +# CONFIG_I2C_COMPAT is not set
> +CONFIG_I2C_PXA=3Dy
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_PXA2XX=3Dy
> +CONFIG_POWER_SUPPLY=3Dy
> +CONFIG_PDA_POWER=3Dy
> +CONFIG_APM_POWER=3Dy
> +# CONFIG_MFD_SUPPORT is not set
> +CONFIG_FB=3Dy
> +CONFIG_FB_W100=3Dy
> +CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> +CONFIG_LCD_CORGI=3Dy
> +CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> +CONFIG_FONTS=3Dy
> +CONFIG_FONT_8x16=3Dy
> +CONFIG_LOGO=3Dy
> +# CONFIG_LOGO_LINUX_MONO is not set
> +# CONFIG_LOGO_LINUX_VGA16 is not set
> +# CONFIG_HID_SUPPORT is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=3Dy
> +CONFIG_MMC_PXA=3Dy
> +CONFIG_NEW_LEDS=3Dy
> +CONFIG_LEDS_CLASS=3Dy
> +CONFIG_LEDS_GPIO=3Dy
> +CONFIG_LEDS_TRIGGERS=3Dy
> +CONFIG_LEDS_TRIGGER_TIMER=3Dy
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_DRV_SA1100=3Dy
> +CONFIG_EXT2_FS=3Dy
> +CONFIG_EXT3_FS=3Dy
> +# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> +# CONFIG_EXT3_FS_XATTR is not set
> +CONFIG_EXT4_FS=3Dy
> +# CONFIG_EXT4_FS_XATTR is not set
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +CONFIG_MSDOS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +# CONFIG_PROC_PAGE_MONITOR is not set
> +CONFIG_TMPFS=3Dy
> +CONFIG_TMPFS_POSIX_ACL=3Dy
> +CONFIG_JFFS2_FS=3Dy
> +CONFIG_JFFS2_SUMMARY=3Dy
> +CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> +CONFIG_JFFS2_LZO=3Dy
> +CONFIG_JFFS2_RUBIN=3Dy
> +CONFIG_UBIFS_FS=3Dy
> +CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> +CONFIG_PARTITION_ADVANCED=3Dy
> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
> +# CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_FRAME_WARN=3D2048
> +CONFIG_MAGIC_SYSRQ=3Dy
> +# CONFIG_ARM_UNWIND is not set
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> +# CONFIG_CRYPTO_HW is not set
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/coll=
ie/defconfig b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/coll=
ie/defconfig
> new file mode 100644
> index 0000000..ce1299d
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/collie/defc=
onfig
> @@ -0,0 +1,144 @@
> +CONFIG_EXPERIMENTAL=3Dy
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_KERNEL_LZMA=3Dy
> +# CONFIG_SWAP is not set
> +CONFIG_LOG_BUF_SHIFT=3D14
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_INITRAMFS_SOURCE=3D"initramfs.cpio.lzma"
> +CONFIG_RD_LZMA=3Dy
> +CONFIG_INITRAMFS_COMPRESSION_LZMA=3Dy
> +# CONFIG_UID16 is not set
> +# CONFIG_SYSCTL_SYSCALL is not set
> +# CONFIG_KALLSYMS is not set
> +# CONFIG_PRINTK is not set
> +# CONFIG_BUG is not set
> +# CONFIG_ELF_CORE is not set
> +# CONFIG_BASE_FULL is not set
> +CONFIG_EMBEDDED=3Dy
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLOB=3Dy
> +# CONFIG_LBDAF is not set
> +# CONFIG_IOSCHED_CFQ is not set
> +CONFIG_ARCH_SA1100=3Dy
> +CONFIG_SA1100_COLLIE=3Dy
> +CONFIG_PCCARD=3Dy
> +# CONFIG_PCMCIA_LOAD_CIS is not set
> +CONFIG_PCMCIA_SA1100=3Dy
> +CONFIG_NO_HZ=3Dy
> +CONFIG_AEABI=3Dy
> +# CONFIG_OABI_COMPAT is not set
> +CONFIG_ZBOOT_ROM_TEXT=3D0x0
> +CONFIG_ZBOOT_ROM_BSS=3D0x0
> +CONFIG_CMDLINE=3D"console=3Dtty1 console=3DttySA0,115200n8 fbcon=3Drotat=
e:1 mem=3D64M loglevel=3D3"
> +CONFIG_KEXEC=3Dy
> +CONFIG_APM_EMULATION=3Dy
> +CONFIG_DEVTMPFS=3Dy
> +CONFIG_DEVTMPFS_MOUNT=3Dy
> +CONFIG_MTD=3Dy
> +CONFIG_MTD_CMDLINE_PARTS=3Dy
> +CONFIG_MTD_CHAR=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_CFI=3Dy
> +CONFIG_MTD_JEDECPROBE=3Dy
> +CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> +CONFIG_MTD_CFI_GEOMETRY=3Dy
> +# CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
> +# CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
> +# CONFIG_MTD_CFI_I1 is not set
> +# CONFIG_MTD_CFI_I2 is not set
> +CONFIG_MTD_CFI_I4=3Dy
> +CONFIG_MTD_CFI_INTELEXT=3Dy
> +CONFIG_MTD_ROM=3Dy
> +CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> +CONFIG_MTD_PHYSMAP=3Dy
> +CONFIG_MTD_SA1100=3Dy
> +CONFIG_MTD_NAND=3Dy
> +CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
> +CONFIG_MTD_UBI=3Dy
> +CONFIG_BLK_DEV_LOOP=3Dy
> +CONFIG_BLK_DEV_SD=3Dy
> +CONFIG_ATA=3Dy
> +# CONFIG_ATA_VERBOSE_ERROR is not set
> +# CONFIG_SATA_PMP is not set
> +CONFIG_PATA_PCMCIA=3Dy
> +# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> +CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D240
> +CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D320
> +CONFIG_INPUT_EVDEV=3Dy
> +CONFIG_INPUT_APMPOWER=3Dy
> +# CONFIG_KEYBOARD_ATKBD is not set
> +CONFIG_KEYBOARD_LOCOMO=3Dy
> +# CONFIG_INPUT_MOUSE is not set
> +CONFIG_INPUT_TOUCHSCREEN=3Dy
> +# CONFIG_SERIO is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_DEVKMEM is not set
> +CONFIG_SERIAL_SA1100=3Dy
> +CONFIG_SERIAL_SA1100_CONSOLE=3Dy
> +# CONFIG_HW_RANDOM is not set
> +CONFIG_I2C=3Dy
> +# CONFIG_I2C_COMPAT is not set
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_GPIO=3Dy
> +CONFIG_POWER_SUPPLY=3Dy
> +CONFIG_PDA_POWER=3Dy
> +CONFIG_APM_POWER=3Dy
> +CONFIG_BATTERY_COLLIE=3Dy
> +# CONFIG_HWMON is not set
> +# CONFIG_MFD_SUPPORT is not set
> +CONFIG_MCP_SA11X0=3Dy
> +CONFIG_MCP_UCB1200=3Dy
> +CONFIG_MCP_UCB1200_TS=3Dy
> +CONFIG_FB=3Dy
> +CONFIG_FB_SA1100=3Dy
> +CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> +# CONFIG_BACKLIGHT_GENERIC is not set
> +CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> +CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> +CONFIG_FONTS=3Dy
> +CONFIG_FONT_8x8=3Dy
> +CONFIG_LOGO=3Dy
> +# CONFIG_LOGO_LINUX_MONO is not set
> +# CONFIG_LOGO_LINUX_VGA16 is not set
> +# CONFIG_HID_SUPPORT is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=3Dy
> +CONFIG_MMC_SPI=3Dy
> +CONFIG_NEW_LEDS=3Dy
> +CONFIG_LEDS_CLASS=3Dy
> +CONFIG_LEDS_LOCOMO=3Dy
> +CONFIG_LEDS_GPIO=3Dy
> +CONFIG_LEDS_TRIGGERS=3Dy
> +CONFIG_LEDS_TRIGGER_TIMER=3Dy
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_DRV_SA1100=3Dy
> +CONFIG_EXT2_FS=3Dy
> +CONFIG_EXT3_FS=3Dy
> +# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> +# CONFIG_EXT3_FS_XATTR is not set
> +CONFIG_EXT4_FS=3Dy
> +# CONFIG_EXT4_FS_XATTR is not set
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +CONFIG_MSDOS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +# CONFIG_PROC_PAGE_MONITOR is not set
> +CONFIG_TMPFS=3Dy
> +CONFIG_TMPFS_POSIX_ACL=3Dy
> +CONFIG_JFFS2_FS=3Dy
> +CONFIG_JFFS2_SUMMARY=3Dy
> +CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> +CONFIG_JFFS2_LZO=3Dy
> +CONFIG_JFFS2_RUBIN=3Dy
> +CONFIG_UBIFS_FS=3Dy
> +CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> +CONFIG_PARTITION_ADVANCED=3Dy
> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
> +# CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_FRAME_WARN=3D2048
> +CONFIG_MAGIC_SYSRQ=3Dy
> +# CONFIG_ARM_UNWIND is not set
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> +# CONFIG_CRYPTO_HW is not set
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/loco=
mo_kbd_tweak-r2.patch b/meta-initramfs/recipes-kernel/linux/linux-kexecboot=
-3.1/locomo_kbd_tweak-r2.patch
> new file mode 100644
> index 0000000..0d47ade
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/locomo_kbd_=
tweak-r2.patch
> @@ -0,0 +1,66 @@
> + drivers/input/keyboard/locomokbd.c | =A0 61 +++++++++++++++++++++++----=
----------
> + 1 file changed, 39 insertions(+), 22 deletions(-)
> +
> +Index: linux-2.6.26-rc4/drivers/input/keyboard/locomokbd.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux-2.6.26-rc4.orig/drivers/input/keyboard/locomokbd.c =A0 2008-05=
-26 19:08:11.000000000 +0100
> ++++ linux-2.6.26-rc4/drivers/input/keyboard/locomokbd.c =A0 =A0 =A0 =A02=
008-06-01 18:35:55.000000000 +0100
> +@@ -41,25 +41,32 @@
> +
> + #define LOCOMOKBD_NUMKEYS =A0 =A0 128
> +
> +-#define KEY_ACTIVITY =A0 =A0 =A0 =A0 =A0KEY_F16
> +-#define KEY_CONTACT =A0 =A0 =A0 =A0 =A0 KEY_F18
> +-#define KEY_CENTER =A0 =A0 =A0 =A0 =A0 =A0KEY_F15
> ++#define LOCOMO_KEY_CALENDER =A0 KEY_LEFTCTRL
> ++#define LOCOMO_KEY_ADDRESS =A0 =A0KEY_LEFTALT =A0 =A0 /* Needed for Sys=
RQ */
> ++#define LOCOMO_KEY_HOME =A0 =A0 =A0 =A0 =A0 =A0 =A0 KEY_SYSRQ =A0 =A0 =
=A0 /* Needed for SysRQ */
> ++#define LOCOMO_KEY_MENU =A0 =A0 =A0 =A0 =A0 =A0 =A0 KEY_F12
> ++#define LOCOMO_KEY_MAIL =A0 =A0 =A0 =A0 =A0 =A0 =A0 KEY_F10
> ++#define LOCOMO_KEY_OK =A0 =A0 =A0 =A0 KEY_F11 =A0 =A0 =A0 =A0 /* Don't =
hardwire to KEY_RETURN */
> ++#define LOCOMO_KEY_CANCEL =A0 =A0 KEY_POWER
> ++#define LOCOMO_KEY_CENTER =A0 =A0 KEY_F5 =A0 =A0 =A0 =A0 =A0/* Don't ha=
rdwire to KEY_RETURN */
> +
> +-static const unsigned char
> ++#define LOCOMO_KEY_FN =A0 =A0 =A0 =A0 KEY_F9
> ++
> ++static const unsigned char
> + locomokbd_keycode[LOCOMOKBD_NUMKEYS] __devinitconst =3D {
> +- =A0 =A0 =A00, KEY_ESC, KEY_ACTIVITY, 0, 0, 0, 0, 0, 0, 0, =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 0 - 9 */
> +- =A0 =A0 =A00, 0, 0, 0, 0, 0, 0, KEY_MENU, KEY_HOME, KEY_CONTACT, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 10 - 19 */
> +- =A0 =A0 =A00, 0, 0, 0, 0, 0, 0, 0, 0, 0, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 20 - 29 */
> +- =A0 =A0 =A00, 0, 0, KEY_CENTER, 0, KEY_MAIL, 0, 0, 0, 0, =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 30 - 39 */
> +- =A0 =A0 =A00, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT, =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 40 - 49 */
> +- =A0 =A0 =A0KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_=
T, =A0 =A0 =A0 =A0 =A0 /* 50 - 59 */
> +- =A0 =A0 =A0KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, KEY_ENTER, 0, 0, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 60 - 69 */
> +- =A0 =A0 =A0KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q,=
 0, 0, =A0 =A0 =A0 /* 70 - 79 */
> +- =A0 =A0 =A00, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J, =
=A0 =A0 =A0 =A0 =A0 =A0 =A0/* 80 - 89 */
> +- =A0 =A0 =A0KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0, =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 90 - 99 */
> +- =A0 =A0 =A00, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KE=
Y_A, =A0 =A0 =A0 =A0 /* 100 - 109 */
> +- =A0 =A0 =A0KEY_LEFTSHIFT, KEY_TAB, KEY_LEFTCTRL, 0, 0, 0, 0, 0, 0, 0, =
=A0 =A0 =A0 =A0 =A0 =A0 =A0/* 110 - 119 */
> +- =A0 =A0 =A0KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0=
 =A0 =A0 =A0 =A0 =A0 =A0 /* 120 - 128 */
> ++ =A0 =A0 =A00, LOCOMO_KEY_CANCEL, LOCOMO_KEY_CALENDER, LOCOMO_KEY_HOME,=
 0, 0, 0, 0, 0, 0, =A0 /* 0 - 9 */
> ++ =A0 =A0 =A00, 0, 0, 0, 0, 0, 0, LOCOMO_KEY_MENU, 0, LOCOMO_KEY_ADDRESS=
, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 10 - 19 */
> ++ =A0 =A0 =A00, 0, 0, 0, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0, =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 20 - 29 */
> ++ =A0 =A0 =A00, 0, 0, LOCOMO_KEY_CENTER, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 30 - 39 */
> ++ =A0 =A0 =A00, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT, =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 40 - 49 =
*/
> ++ =A0 =A0 =A0KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_=
T, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 50 - 59 */
> ++ =A0 =A0 =A0KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, LOCOMO_KEY_OK, 0, 0, =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 60 - 69 */
> ++ =A0 =A0 =A0KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q,=
 0, 0, =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 70 - 79 */
> ++ =A0 =A0 =A00, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J, =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 80 - 89 */
> ++ =A0 =A0 =A0KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0, =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 90 - 99 */
> ++ =A0 =A0 =A00, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KE=
Y_A, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 100 - 109 */
> ++ =A0 =A0 =A0KEY_LEFTSHIFT, KEY_TAB, LOCOMO_KEY_FN, 0, 0, 0, 0, 0, 0, 0,=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 110 - 119 */
> ++ =A0 =A0 =A0KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 120 - 128 */
> + };
> +
> + #define KB_ROWS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 16
> +@@ -68,7 +75,7 @@
> + #define SCANCODE(c,r) =A0 =A0 =A0 =A0 ( ((c)<<4) + (r) + 1 )
> +
> + #define KB_DELAY =A0 =A0 =A0 =A0 =A0 =A0 =A08
> +-#define SCAN_INTERVAL =A0 =A0 =A0 =A0 (HZ/10)
> ++#define SCAN_INTERVAL =A0 =A0 =A0 =A0 (HZ/20)
> +
> + struct locomokbd {
> + =A0 =A0 =A0 unsigned char keycode[LOCOMOKBD_NUMKEYS];
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/pood=
le/defconfig b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/pood=
le/defconfig
> new file mode 100644
> index 0000000..68c37e6
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/poodle/defc=
onfig
> @@ -0,0 +1,136 @@
> +CONFIG_EXPERIMENTAL=3Dy
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_KERNEL_LZMA=3Dy
> +# CONFIG_SWAP is not set
> +CONFIG_LOG_BUF_SHIFT=3D14
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_INITRAMFS_SOURCE=3D"initramfs.cpio.lzma"
> +CONFIG_RD_LZMA=3Dy
> +CONFIG_INITRAMFS_COMPRESSION_LZMA=3Dy
> +# CONFIG_UID16 is not set
> +# CONFIG_SYSCTL_SYSCALL is not set
> +# CONFIG_KALLSYMS is not set
> +# CONFIG_PRINTK is not set
> +# CONFIG_BUG is not set
> +# CONFIG_ELF_CORE is not set
> +# CONFIG_BASE_FULL is not set
> +CONFIG_EMBEDDED=3Dy
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLOB=3Dy
> +# CONFIG_LBDAF is not set
> +# CONFIG_IOSCHED_CFQ is not set
> +CONFIG_ARCH_PXA=3Dy
> +CONFIG_PXA_SHARPSL=3Dy
> +CONFIG_PXA_SHARPSL_DETECT_MACH_ID=3Dy
> +CONFIG_MACH_POODLE=3Dy
> +CONFIG_PCCARD=3Dy
> +# CONFIG_PCMCIA_LOAD_CIS is not set
> +CONFIG_PCMCIA_PXA2XX=3Dy
> +CONFIG_NO_HZ=3Dy
> +CONFIG_AEABI=3Dy
> +# CONFIG_OABI_COMPAT is not set
> +CONFIG_ZBOOT_ROM_TEXT=3D0x0
> +CONFIG_ZBOOT_ROM_BSS=3D0x0
> +CONFIG_CMDLINE=3D"console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotate=
:1 loglevel=3D3"
> +CONFIG_KEXEC=3Dy
> +CONFIG_APM_EMULATION=3Dy
> +CONFIG_DEVTMPFS=3Dy
> +CONFIG_DEVTMPFS_MOUNT=3Dy
> +CONFIG_MTD=3Dy
> +CONFIG_MTD_CMDLINE_PARTS=3Dy
> +CONFIG_MTD_CHAR=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_ROM=3Dy
> +CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> +CONFIG_MTD_PHYSMAP=3Dy
> +CONFIG_MTD_NAND=3Dy
> +CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
> +CONFIG_MTD_NAND_SHARPSL=3Dy
> +CONFIG_MTD_UBI=3Dy
> +CONFIG_BLK_DEV_LOOP=3Dy
> +CONFIG_BLK_DEV_SD=3Dy
> +CONFIG_ATA=3Dy
> +# CONFIG_ATA_VERBOSE_ERROR is not set
> +# CONFIG_SATA_PMP is not set
> +CONFIG_PATA_PXA=3Dy
> +CONFIG_PATA_PCMCIA=3Dy
> +# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> +CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D240
> +CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D320
> +CONFIG_INPUT_EVDEV=3Dy
> +CONFIG_INPUT_APMPOWER=3Dy
> +# CONFIG_KEYBOARD_ATKBD is not set
> +CONFIG_KEYBOARD_GPIO=3Dy
> +CONFIG_KEYBOARD_LOCOMO=3Dy
> +# CONFIG_INPUT_MOUSE is not set
> +CONFIG_INPUT_TOUCHSCREEN=3Dy
> +CONFIG_TOUCHSCREEN_ADS7846=3Dy
> +# CONFIG_SERIO is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_DEVKMEM is not set
> +CONFIG_SERIAL_PXA=3Dy
> +CONFIG_SERIAL_PXA_CONSOLE=3Dy
> +# CONFIG_HW_RANDOM is not set
> +CONFIG_I2C=3Dy
> +# CONFIG_I2C_COMPAT is not set
> +CONFIG_I2C_PXA=3Dy
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_PXA2XX=3Dy
> +CONFIG_POWER_SUPPLY=3Dy
> +CONFIG_PDA_POWER=3Dy
> +CONFIG_APM_POWER=3Dy
> +# CONFIG_HWMON is not set
> +# CONFIG_MFD_SUPPORT is not set
> +CONFIG_FB=3Dy
> +CONFIG_FB_PXA=3Dy
> +CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> +# CONFIG_BACKLIGHT_GENERIC is not set
> +CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> +CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> +CONFIG_FONTS=3Dy
> +CONFIG_FONT_8x8=3Dy
> +CONFIG_LOGO=3Dy
> +# CONFIG_LOGO_LINUX_MONO is not set
> +# CONFIG_LOGO_LINUX_VGA16 is not set
> +# CONFIG_HID_SUPPORT is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=3Dy
> +CONFIG_MMC_PXA=3Dy
> +CONFIG_NEW_LEDS=3Dy
> +CONFIG_LEDS_CLASS=3Dy
> +CONFIG_LEDS_LOCOMO=3Dy
> +CONFIG_LEDS_GPIO=3Dy
> +CONFIG_LEDS_TRIGGERS=3Dy
> +CONFIG_LEDS_TRIGGER_TIMER=3Dy
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_DRV_SA1100=3Dy
> +CONFIG_EXT2_FS=3Dy
> +CONFIG_EXT3_FS=3Dy
> +# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> +# CONFIG_EXT3_FS_XATTR is not set
> +CONFIG_EXT4_FS=3Dy
> +# CONFIG_EXT4_FS_XATTR is not set
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +CONFIG_MSDOS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +# CONFIG_PROC_PAGE_MONITOR is not set
> +CONFIG_TMPFS=3Dy
> +CONFIG_TMPFS_POSIX_ACL=3Dy
> +CONFIG_JFFS2_FS=3Dy
> +CONFIG_JFFS2_SUMMARY=3Dy
> +CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> +CONFIG_JFFS2_LZO=3Dy
> +CONFIG_JFFS2_RUBIN=3Dy
> +CONFIG_UBIFS_FS=3Dy
> +CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> +CONFIG_PARTITION_ADVANCED=3Dy
> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
> +# CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_FRAME_WARN=3D2048
> +CONFIG_MAGIC_SYSRQ=3Dy
> +# CONFIG_ARM_UNWIND is not set
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> +# CONFIG_CRYPTO_HW is not set
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/spit=
z/defconfig b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/spitz=
/defconfig
> new file mode 100644
> index 0000000..b066839
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/spitz/defco=
nfig
> @@ -0,0 +1,132 @@
> +CONFIG_EXPERIMENTAL=3Dy
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_KERNEL_LZMA=3Dy
> +# CONFIG_SWAP is not set
> +CONFIG_LOG_BUF_SHIFT=3D14
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_INITRAMFS_SOURCE=3D"initramfs.cpio.lzma"
> +CONFIG_RD_LZMA=3Dy
> +CONFIG_INITRAMFS_COMPRESSION_LZMA=3Dy
> +# CONFIG_UID16 is not set
> +# CONFIG_SYSCTL_SYSCALL is not set
> +# CONFIG_KALLSYMS is not set
> +# CONFIG_PRINTK is not set
> +# CONFIG_BUG is not set
> +# CONFIG_ELF_CORE is not set
> +# CONFIG_BASE_FULL is not set
> +CONFIG_EMBEDDED=3Dy
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLOB=3Dy
> +# CONFIG_LBDAF is not set
> +# CONFIG_IOSCHED_CFQ is not set
> +CONFIG_ARCH_PXA=3Dy
> +CONFIG_PXA_SHARPSL=3Dy
> +CONFIG_PXA_SHARPSL_DETECT_MACH_ID=3Dy
> +CONFIG_MACH_AKITA=3Dy
> +CONFIG_MACH_BORZOI=3Dy
> +CONFIG_PCCARD=3Dy
> +# CONFIG_PCMCIA_LOAD_CIS is not set
> +CONFIG_PCMCIA_PXA2XX=3Dy
> +CONFIG_NO_HZ=3Dy
> +CONFIG_AEABI=3Dy
> +# CONFIG_OABI_COMPAT is not set
> +CONFIG_ZBOOT_ROM_TEXT=3D0x0
> +CONFIG_ZBOOT_ROM_BSS=3D0x0
> +CONFIG_CMDLINE=3D"console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotate=
:1 loglevel=3D3"
> +CONFIG_KEXEC=3Dy
> +CONFIG_DEVTMPFS=3Dy
> +CONFIG_DEVTMPFS_MOUNT=3Dy
> +CONFIG_MTD=3Dy
> +CONFIG_MTD_CMDLINE_PARTS=3Dy
> +CONFIG_MTD_CHAR=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_ROM=3Dy
> +CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> +CONFIG_MTD_PHYSMAP=3Dy
> +CONFIG_MTD_NAND=3Dy
> +CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
> +CONFIG_MTD_NAND_SHARPSL=3Dy
> +CONFIG_MTD_UBI=3Dy
> +CONFIG_BLK_DEV_LOOP=3Dy
> +CONFIG_BLK_DEV_SD=3Dy
> +CONFIG_ATA=3Dy
> +# CONFIG_ATA_VERBOSE_ERROR is not set
> +# CONFIG_SATA_PMP is not set
> +CONFIG_PATA_PXA=3Dy
> +CONFIG_PATA_PCMCIA=3Dy
> +# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> +CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D640
> +CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D480
> +CONFIG_INPUT_EVDEV=3Dy
> +CONFIG_INPUT_APMPOWER=3Dy
> +# CONFIG_KEYBOARD_ATKBD is not set
> +CONFIG_KEYBOARD_GPIO=3Dy
> +CONFIG_KEYBOARD_MATRIX=3Dy
> +# CONFIG_INPUT_MOUSE is not set
> +CONFIG_INPUT_TOUCHSCREEN=3Dy
> +CONFIG_TOUCHSCREEN_ADS7846=3Dy
> +# CONFIG_SERIO is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_DEVKMEM is not set
> +CONFIG_SERIAL_PXA=3Dy
> +CONFIG_SERIAL_PXA_CONSOLE=3Dy
> +# CONFIG_HW_RANDOM is not set
> +# CONFIG_I2C_COMPAT is not set
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_PXA2XX=3Dy
> +CONFIG_POWER_SUPPLY=3Dy
> +CONFIG_PDA_POWER=3Dy
> +CONFIG_APM_POWER=3Dy
> +# CONFIG_MFD_SUPPORT is not set
> +CONFIG_FB=3Dy
> +CONFIG_FB_PXA=3Dy
> +CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> +CONFIG_LCD_CORGI=3Dy
> +CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> +CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> +CONFIG_FONTS=3Dy
> +CONFIG_FONT_8x16=3Dy
> +CONFIG_LOGO=3Dy
> +# CONFIG_LOGO_LINUX_MONO is not set
> +# CONFIG_LOGO_LINUX_VGA16 is not set
> +# CONFIG_HID_SUPPORT is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=3Dy
> +CONFIG_MMC_PXA=3Dy
> +CONFIG_NEW_LEDS=3Dy
> +CONFIG_LEDS_CLASS=3Dy
> +CONFIG_LEDS_GPIO=3Dy
> +CONFIG_LEDS_TRIGGERS=3Dy
> +CONFIG_LEDS_TRIGGER_TIMER=3Dy
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_DRV_PXA=3Dy
> +CONFIG_EXT2_FS=3Dy
> +CONFIG_EXT3_FS=3Dy
> +# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> +# CONFIG_EXT3_FS_XATTR is not set
> +CONFIG_EXT4_FS=3Dy
> +# CONFIG_EXT4_FS_XATTR is not set
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +CONFIG_MSDOS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +# CONFIG_PROC_PAGE_MONITOR is not set
> +CONFIG_TMPFS=3Dy
> +CONFIG_TMPFS_POSIX_ACL=3Dy
> +CONFIG_JFFS2_FS=3Dy
> +CONFIG_JFFS2_SUMMARY=3Dy
> +CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> +CONFIG_JFFS2_LZO=3Dy
> +CONFIG_JFFS2_RUBIN=3Dy
> +CONFIG_UBIFS_FS=3Dy
> +CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> +CONFIG_PARTITION_ADVANCED=3Dy
> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
> +# CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_FRAME_WARN=3D2048
> +CONFIG_MAGIC_SYSRQ=3Dy
> +# CONFIG_ARM_UNWIND is not set
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> +# CONFIG_CRYPTO_HW is not set
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/tosa=
/defconfig b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/tosa/d=
efconfig
> new file mode 100644
> index 0000000..59cf640
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot-3.1/tosa/defcon=
fig
> @@ -0,0 +1,134 @@
> +CONFIG_EXPERIMENTAL=3Dy
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_KERNEL_LZMA=3Dy
> +# CONFIG_SWAP is not set
> +CONFIG_LOG_BUF_SHIFT=3D14
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_INITRAMFS_SOURCE=3D"initramfs.cpio.lzma"
> +CONFIG_RD_LZMA=3Dy
> +CONFIG_INITRAMFS_COMPRESSION_LZMA=3Dy
> +# CONFIG_UID16 is not set
> +# CONFIG_SYSCTL_SYSCALL is not set
> +# CONFIG_KALLSYMS is not set
> +# CONFIG_PRINTK is not set
> +# CONFIG_BUG is not set
> +# CONFIG_ELF_CORE is not set
> +# CONFIG_BASE_FULL is not set
> +CONFIG_EMBEDDED=3Dy
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLOB=3Dy
> +# CONFIG_LBDAF is not set
> +# CONFIG_IOSCHED_CFQ is not set
> +CONFIG_ARCH_PXA=3Dy
> +CONFIG_PXA_SHARPSL=3Dy
> +CONFIG_PXA_SHARPSL_DETECT_MACH_ID=3Dy
> +CONFIG_MACH_TOSA=3Dy
> +CONFIG_PCCARD=3Dy
> +# CONFIG_PCMCIA_LOAD_CIS is not set
> +CONFIG_PCMCIA_PXA2XX=3Dy
> +CONFIG_NO_HZ=3Dy
> +CONFIG_AEABI=3Dy
> +# CONFIG_OABI_COMPAT is not set
> +CONFIG_ZBOOT_ROM_TEXT=3D0x0
> +CONFIG_ZBOOT_ROM_BSS=3D0x0
> +CONFIG_CMDLINE=3D"console=3Dtty1 console=3DttyS0,115200n8 loglevel=3D3"
> +CONFIG_KEXEC=3Dy
> +CONFIG_APM_EMULATION=3Dy
> +CONFIG_DEVTMPFS=3Dy
> +CONFIG_DEVTMPFS_MOUNT=3Dy
> +CONFIG_MTD=3Dy
> +CONFIG_MTD_CMDLINE_PARTS=3Dy
> +CONFIG_MTD_CHAR=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_ROM=3Dy
> +CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> +CONFIG_MTD_PHYSMAP=3Dy
> +CONFIG_MTD_NAND=3Dy
> +CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
> +CONFIG_MTD_NAND_TMIO=3Dy
> +CONFIG_MTD_UBI=3Dy
> +CONFIG_BLK_DEV_LOOP=3Dy
> +CONFIG_BLK_DEV_SD=3Dy
> +CONFIG_ATA=3Dy
> +# CONFIG_ATA_VERBOSE_ERROR is not set
> +# CONFIG_SATA_PMP is not set
> +CONFIG_PATA_PXA=3Dy
> +CONFIG_PATA_PCMCIA=3Dy
> +# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> +CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D480
> +CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D640
> +CONFIG_INPUT_EVDEV=3Dy
> +CONFIG_INPUT_APMPOWER=3Dy
> +# CONFIG_KEYBOARD_ATKBD is not set
> +CONFIG_KEYBOARD_GPIO=3Dy
> +CONFIG_KEYBOARD_MATRIX=3Dy
> +# CONFIG_INPUT_MOUSE is not set
> +CONFIG_INPUT_TOUCHSCREEN=3Dy
> +# CONFIG_SERIO is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_DEVKMEM is not set
> +CONFIG_SERIAL_PXA=3Dy
> +CONFIG_SERIAL_PXA_CONSOLE=3Dy
> +# CONFIG_HW_RANDOM is not set
> +CONFIG_I2C=3Dy
> +# CONFIG_I2C_COMPAT is not set
> +CONFIG_I2C_PXA=3Dy
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_PXA2XX=3Dy
> +CONFIG_POWER_SUPPLY=3Dy
> +CONFIG_PDA_POWER=3Dy
> +CONFIG_APM_POWER=3Dy
> +# CONFIG_HWMON is not set
> +CONFIG_MFD_TC6393XB=3Dy
> +CONFIG_FB=3Dy
> +CONFIG_FB_TMIO=3Dy
> +CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> +CONFIG_LCD_TOSA=3Dy
> +CONFIG_BACKLIGHT_TOSA=3Dy
> +CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> +CONFIG_FONTS=3Dy
> +CONFIG_FONT_8x16=3Dy
> +CONFIG_LOGO=3Dy
> +# CONFIG_LOGO_LINUX_MONO is not set
> +# CONFIG_LOGO_LINUX_VGA16 is not set
> +# CONFIG_HID_SUPPORT is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=3Dy
> +CONFIG_MMC_PXA=3Dy
> +CONFIG_NEW_LEDS=3Dy
> +CONFIG_LEDS_CLASS=3Dy
> +CONFIG_LEDS_GPIO=3Dy
> +CONFIG_LEDS_TRIGGERS=3Dy
> +CONFIG_LEDS_TRIGGER_TIMER=3Dy
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_DRV_SA1100=3Dy
> +CONFIG_EXT2_FS=3Dy
> +CONFIG_EXT3_FS=3Dy
> +# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> +# CONFIG_EXT3_FS_XATTR is not set
> +CONFIG_EXT4_FS=3Dy
> +# CONFIG_EXT4_FS_XATTR is not set
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +CONFIG_MSDOS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +# CONFIG_PROC_PAGE_MONITOR is not set
> +CONFIG_TMPFS=3Dy
> +CONFIG_TMPFS_POSIX_ACL=3Dy
> +CONFIG_JFFS2_FS=3Dy
> +CONFIG_JFFS2_SUMMARY=3Dy
> +CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> +CONFIG_JFFS2_LZO=3Dy
> +CONFIG_JFFS2_RUBIN=3Dy
> +CONFIG_UBIFS_FS=3Dy
> +CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> +CONFIG_PARTITION_ADVANCED=3Dy
> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
> +# CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_FRAME_WARN=3D2048
> +CONFIG_MAGIC_SYSRQ=3Dy
> +# CONFIG_ARM_UNWIND is not set
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> +# CONFIG_CRYPTO_HW is not set
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot.inc b/me=
ta-initramfs/recipes-kernel/linux/linux-kexecboot.inc
> new file mode 100644
> index 0000000..28b9ec2
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot.inc
> @@ -0,0 +1,136 @@
> +DESCRIPTION =3D "Linux Kernel"
> +SECTION =3D "kernel"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
> +
> +INC_PR =3D "r2"
> +
> +inherit kernel siteinfo
> +
> +# FILESEXTRAPATHS cannot be used, because it puts extra paths before FIL=
ESPATH and we need it at the end
> +# only as fallback for patches available only in linux-PV dir and ie def=
configs needs to go from linux-kexecboot-PV
> +FILESPATH_append =3D ":${FILE_DIRNAME}/linux-${PV}"
> +
> +DEPENDS +=3D "xz-native"
> +
> +# Kernel bootlogo is distro-specific (default is OE logo).
> +# Logo resolution (qvga, vga, ...) is machine-specific.
> +LOGO_SIZE ?=3D "."
> +# To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or sim=
ilar
> +# to your kernel recipe, and then structure your logos for each resoluti=
on
> +# accordingly.
> +
> +# Set the verbosity of kernel messages during runtime
> +# You can define CMDLINE_DEBUG in your local.conf or distro.conf to over=
ride this behaviour
> +CMDLINE_DEBUG ?=3D "loglevel=3D3"
> +
> +# Note we set loglevel=3D3 and master console on serial to protect bootl=
ogo.
> +
> +PACKAGES =3D ""
> +PROVIDES =3D ""
> +
> +KERNEL_IMAGE_BASE_NAME =3D "${KERNEL_IMAGETYPE}-kexecboot-${PV}-${PR}-${=
MACHINE}"
> +KERNEL_IMAGE_SYMLINK_NAME =3D "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}"
> +
> +LOCALVERSION ?=3D ""
> +
> +# we want the smallest size
> +INITRAMFS_IMAGE =3D "initramfs-kexecboot-klibc-image"
> +
> +kernel_conf_variable() {
> + =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_$1[ =3D]/d;"
> + =A0 =A0 =A0 =A0if test "$2" =3D "n"
> + =A0 =A0 =A0 =A0then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "# CONFIG_$1 is not set" >> ${S}/.c=
onfig
> + =A0 =A0 =A0 =A0else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "CONFIG_$1=3D$2" >> ${S}/.config
> + =A0 =A0 =A0 =A0fi
> +}
> +
> +do_configure_prepend() {
> +
> + =A0 =A0 =A0 =A0echo "" > ${S}/.config
> + =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D""
> +
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0# CONFIG_CMDLINE mangling
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_BOOL y
> + =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEB=
UG}\""
> +
> + =A0 =A0 =A0 =A0# mips and x86
> + =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_OVERRIDE y
> +
> + =A0 =A0 =A0 =A0# sh only
> + =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_OVERWRITE y
> + =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_EXTEND n
> +
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0# endian support
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0if [ "${SITEINFO_ENDIANNESS}" =3D "be" ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CPU_BIG_ENDIAN y
> + =A0 =A0 =A0 =A0fi
> +
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0# logo support, if you supply logo_linux_clut224.ppm in =
SRC_URI, then it is going to be used
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${WORKDIR}/logo_linux_cl=
ut224.ppm drivers/video/logo/logo_linux_clut224.ppm
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable LOGO y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable LOGO_LINUX_CLUT224 =
y
> + =A0 =A0 =A0 =A0fi
> +
> + =A0 =A0 =A0 =A0# When enabling thumb for userspace we also need thumb s=
upport in the kernel
> + =A0 =A0 =A0 =A0if [ "${ARM_INSTRUCTION_SET}" =3D "thumb" ] ; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable ARM_THUMB y
> + =A0 =A0 =A0 =A0fi
> +
> + =A0 =A0 =A0 =A0kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
> + =A0 =A0 =A0 =A0kernel_conf_variable LOCALVERSION_AUTO n
> +
> + =A0 =A0 =A0 =A0# Force sane defaults for kexec-enabled kernels and keep=
 size small
> + =A0 =A0 =A0 =A0kernel_conf_variable BLK_DEV_INITRD y
> + =A0 =A0 =A0 =A0kernel_conf_variable KEXEC y
> + =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /=3Dm/d;"
> + =A0 =A0 =A0 =A0kernel_conf_variable MODULES n
> + =A0 =A0 =A0 =A0if ${@base_contains("CMDLINE_DEBUG", "debug", "true", "f=
alse", d)}; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_LL y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable PRINTK y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable EARLY_PRINTK y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable BUG y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_ERRORS y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_BUGVERBOSE y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_KERNEL y
> + =A0 =A0 =A0 =A0else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_ERRORS n
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_BUGVERBOSE n
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_KERNEL n
> + =A0 =A0 =A0 =A0fi
> +
> + =A0 =A0 =A0 =A0# Force lzma for arm kernels only
> + =A0 =A0 =A0 =A0if [ "${ARCH}" =3D "arm" ] ; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_KERNEL/d;"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_RD/d;"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_INITRAMFS_COMPRESSION/d;"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_INITRAMFS_SOURCE/d;"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable KERNEL_LZMA y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable RD_LZMA y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable INITRAMFS_COMPRESSI=
ON_LZMA y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable INITRAMFS_SOURCE "\=
"initramfs.cpio.lzma\""
> + =A0 =A0 =A0 =A0fi
> +
> + =A0 =A0 =A0 =A0sed -e "${CONF_SED_SCRIPT}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0< '${WORKDIR}/defconfig'=
 >>'${S}/.config'
> +
> + =A0 =A0 =A0 =A0yes '' | oe_runmake oldconfig
> +}
> +
> +do_populate_sysroot() {
> + =A0 =A0 =A0 =A0:
> +}
> +
> +do_install() {
> + =A0 =A0 =A0 =A0:
> +}
> +
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb b=
/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb
> new file mode 100644
> index 0000000..466efd4
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb
> @@ -0,0 +1,15 @@
> +require linux-kexecboot.inc
> +
> +PR =3D "${INC_PR}.8"
> +S =3D "${WORKDIR}/linux-${PV}"
> +
> +SRC_URI +=3D "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;=
name=3Dkernel \
> + =A0 =A0 =A0 =A0 =A0 ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.1=
0.bz2;apply=3Dyes;name=3Dstablepatch \
> + =A0 =A0 =A0 =A0 =A0 file://defconfig \
> + =A0 =A0 =A0 =A0 =A0 file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
> + =A0 =A0 =A0 =A0 =A0 "
> +
> +SRC_URI[kernel.md5sum] =3D "8d43453f8159b2332ad410b19d86a931"
> +SRC_URI[kernel.sha256sum] =3D "2573d2378c754b0c602b57586e9311e5b38c5d1e6=
c137f02873833633a4b9359"
> +SRC_URI[stablepatch.md5sum] =3D "a8e1c25a93a685ec2a1c3a808715fe9d"
> +SRC_URI[stablepatch.sha256sum] =3D "f25126052d1a083a415ddd313b40c7fcdb37=
42f40474cb4a826af7e43fee29d3"
> --
> 1.7.3.4
>

Sorry, I realized this patch adds specific defconfigs and patches
which should be hosted in the BSP layer.
PATCH V2 will follow soon.

Regards

Andrea


