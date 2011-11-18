Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RRLGS-0002Jg-43
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 11:01:44 +0100
Received: by eyd9 with SMTP id 9so2961719eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 01:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=prb0RVooQkl9lxxtfV9dYPz5IrAY1Q9FnwpWkA3MquI=;
	b=bTtp08FG0McdbtxFU2ucGG5dczBq7K7waXloTwMNABzspmrmhWOqZ+JgQxPUCpfkFc
	gpcWz6DTtvPMqzEpVBMBXXfm160qEEzLiEZlaiNrS7R2tnPrTHdYGyEl6czHFTcPmvzj
	EBk/ys+0hnCbJLWZMAxZesHPtiRva8dueMcD4=
Received: by 10.213.31.204 with SMTP id z12mr346349ebc.10.1321610116467;
	Fri, 18 Nov 2011 01:55:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm975365fao.1.2011.11.18.01.55.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 01:55:15 -0800 (PST)
Date: Fri, 18 Nov 2011 10:55:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111118095503.GA3549@jama.jama.net>
References: <cover.1321575642.git.andrea.adami@gmail.com>
	<c4465784961e18f1e86e94fe2d57b93ea1e6ec58.1321575642.git.andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c4465784961e18f1e86e94fe2d57b93ea1e6ec58.1321575642.git.andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH 5/5] linux: remove unused git version
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
X-List-Received-Date: Fri, 18 Nov 2011 10:01:45 -0000
X-Groupsio-MsgNum: 35445
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 01:36:07AM +0100, Andrea Adami wrote:
> * for our old beloved handhelds the kernel

I'm using it.. but if I'm alone then I can keep it in my own branch..
currently upgrading from 3.1.0-rc10 to 3.2.0-rc2

> * development is slow and based on stable kernels

but still better to report regressions agains our beloved handhelds as
soon as possible in development cycle then after release.

> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux/spitz/defconfig |  379 ----------------------=
------
>  recipes-kernel/linux/linux_git.bb          |   10 -
>  2 files changed, 0 insertions(+), 389 deletions(-)
>  delete mode 100644 recipes-kernel/linux/linux/spitz/defconfig
>  delete mode 100644 recipes-kernel/linux/linux_git.bb
>=20
> diff --git a/recipes-kernel/linux/linux/spitz/defconfig b/recipes-kernel/=
linux/linux/spitz/defconfig
> deleted file mode 100644
> index 65aed48..0000000
> --- a/recipes-kernel/linux/linux/spitz/defconfig
> +++ /dev/null
> @@ -1,379 +0,0 @@
> -CONFIG_EXPERIMENTAL=3Dy
> -# CONFIG_LOCALVERSION_AUTO is not set
> -CONFIG_SYSVIPC=3Dy
> -CONFIG_BSD_PROCESS_ACCT=3Dy
> -CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> -CONFIG_IKCONFIG=3Dm
> -CONFIG_IKCONFIG_PROC=3Dy
> -CONFIG_LOG_BUF_SHIFT=3D14
> -CONFIG_BLK_DEV_INITRD=3Dy
> -CONFIG_RD_BZIP2=3Dy
> -CONFIG_RD_LZMA=3Dy
> -CONFIG_RD_LZO=3Dy
> -CONFIG_EMBEDDED=3Dy
> -CONFIG_SLOB=3Dy
> -CONFIG_PROFILING=3Dy
> -CONFIG_OPROFILE=3Dm
> -CONFIG_MODULES=3Dy
> -CONFIG_MODULE_UNLOAD=3Dy
> -CONFIG_MODULE_FORCE_UNLOAD=3Dy
> -# CONFIG_LBDAF is not set
> -CONFIG_IOSCHED_DEADLINE=3Dm
> -CONFIG_IOSCHED_CFQ=3Dm
> -CONFIG_ARCH_PXA=3Dy
> -CONFIG_PXA_SHARPSL=3Dy
> -CONFIG_MACH_AKITA=3Dy
> -CONFIG_MACH_BORZOI=3Dy
> -CONFIG_PCCARD=3Dy
> -CONFIG_PCMCIA_PXA2XX=3Dy
> -CONFIG_NO_HZ=3Dy
> -CONFIG_HIGH_RES_TIMERS=3Dy
> -CONFIG_AEABI=3Dy
> -# CONFIG_OABI_COMPAT is not set
> -CONFIG_ZBOOT_ROM_TEXT=3D0x0
> -CONFIG_ZBOOT_ROM_BSS=3D0x0
> -CONFIG_CMDLINE=3D"console=3DttyS0,115200n8 console=3Dtty1 fbcon=3Drotate=
:1 loglevel=3D3"
> -CONFIG_KEXEC=3Dy
> -# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> -CONFIG_BINFMT_AOUT=3Dm
> -CONFIG_BINFMT_MISC=3Dm
> -CONFIG_PM_RUNTIME=3Dy
> -CONFIG_NET=3Dy
> -CONFIG_PACKET=3Dm
> -CONFIG_UNIX=3Dy
> -CONFIG_XFRM_USER=3Dm
> -CONFIG_INET=3Dy
> -CONFIG_INET_XFRM_MODE_TRANSPORT=3Dm
> -CONFIG_INET_XFRM_MODE_TUNNEL=3Dm
> -CONFIG_INET_XFRM_MODE_BEET=3Dm
> -# CONFIG_INET_LRO is not set
> -CONFIG_INET_DIAG=3Dm
> -CONFIG_INET6_AH=3Dm
> -CONFIG_INET6_ESP=3Dm
> -CONFIG_INET6_IPCOMP=3Dm
> -CONFIG_IPV6_TUNNEL=3Dm
> -CONFIG_NETFILTER=3Dy
> -CONFIG_NF_CONNTRACK=3Dm
> -CONFIG_NF_CONNTRACK_FTP=3Dm
> -CONFIG_NF_CONNTRACK_H323=3Dm
> -CONFIG_NF_CONNTRACK_IRC=3Dm
> -CONFIG_NF_CONNTRACK_SIP=3Dm
> -CONFIG_NF_CONNTRACK_IPV4=3Dm
> -CONFIG_IP_NF_IPTABLES=3Dm
> -CONFIG_IP_NF_MATCH_AH=3Dm
> -CONFIG_IP_NF_MATCH_ECN=3Dm
> -CONFIG_IP_NF_MATCH_TTL=3Dm
> -CONFIG_IP_NF_FILTER=3Dm
> -CONFIG_IP_NF_TARGET_REJECT=3Dm
> -CONFIG_IP_NF_TARGET_LOG=3Dm
> -CONFIG_IP_NF_TARGET_ULOG=3Dm
> -CONFIG_NF_NAT=3Dm
> -CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> -CONFIG_IP_NF_TARGET_NETMAP=3Dm
> -CONFIG_IP_NF_TARGET_REDIRECT=3Dm
> -CONFIG_IP_NF_MANGLE=3Dm
> -CONFIG_IP_NF_TARGET_ECN=3Dm
> -CONFIG_IP_NF_TARGET_TTL=3Dm
> -CONFIG_IP_NF_RAW=3Dm
> -CONFIG_IP_NF_ARPTABLES=3Dm
> -CONFIG_IP_NF_ARPFILTER=3Dm
> -CONFIG_IP_NF_ARP_MANGLE=3Dm
> -CONFIG_IRDA=3Dm
> -CONFIG_IRLAN=3Dm
> -CONFIG_IRNET=3Dm
> -CONFIG_IRCOMM=3Dm
> -CONFIG_PXA_FICP=3Dm
> -CONFIG_BT=3Dm
> -CONFIG_BT_L2CAP=3Dy
> -CONFIG_BT_SCO=3Dy
> -CONFIG_BT_RFCOMM=3Dm
> -CONFIG_BT_RFCOMM_TTY=3Dy
> -CONFIG_BT_BNEP=3Dm
> -CONFIG_BT_BNEP_MC_FILTER=3Dy
> -CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> -CONFIG_BT_HIDP=3Dm
> -CONFIG_BT_HCIBTUSB=3Dm
> -CONFIG_BT_HCIBTSDIO=3Dm
> -CONFIG_BT_HCIUART=3Dm
> -CONFIG_BT_HCIUART_H4=3Dy
> -CONFIG_BT_HCIUART_BCSP=3Dy
> -CONFIG_BT_HCIUART_ATH3K=3Dy
> -CONFIG_BT_HCIUART_LL=3Dy
> -CONFIG_BT_HCIBCM203X=3Dm
> -CONFIG_BT_HCIBPA10X=3Dm
> -CONFIG_BT_HCIBFUSB=3Dm
> -CONFIG_BT_HCIDTL1=3Dm
> -CONFIG_BT_HCIBT3C=3Dm
> -CONFIG_BT_HCIBLUECARD=3Dm
> -CONFIG_BT_HCIBTUART=3Dm
> -CONFIG_BT_HCIVHCI=3Dm
> -CONFIG_BT_MRVL=3Dm
> -CONFIG_BT_MRVL_SDIO=3Dm
> -CONFIG_BT_ATH3K=3Dm
> -CONFIG_CFG80211=3Dm
> -# CONFIG_CFG80211_DEFAULT_PS is not set
> -CONFIG_MAC80211=3Dm
> -# CONFIG_MAC80211_RC_MINSTREL is not set
> -CONFIG_DEVTMPFS=3Dy
> -CONFIG_DEVTMPFS_MOUNT=3Dy
> -CONFIG_MTD=3Dy
> -CONFIG_MTD_CMDLINE_PARTS=3Dy
> -CONFIG_MTD_CHAR=3Dy
> -CONFIG_MTD_BLOCK=3Dy
> -CONFIG_MTD_ROM=3Dy
> -CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> -CONFIG_MTD_PHYSMAP=3Dy
> -CONFIG_MTD_NAND=3Dy
> -CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
> -CONFIG_MTD_NAND_SHARPSL=3Dy
> -CONFIG_MTD_UBI=3Dy
> -CONFIG_MTD_UBI_GLUEBI=3Dm
> -CONFIG_BLK_DEV_LOOP=3Dy
> -CONFIG_MISC_DEVICES=3Dy
> -CONFIG_BLK_DEV_SD=3Dy
> -CONFIG_BLK_DEV_SR=3Dm
> -CONFIG_CHR_DEV_SG=3Dm
> -CONFIG_SCSI_MULTI_LUN=3Dy
> -CONFIG_ATA=3Dy
> -CONFIG_PATA_PXA=3Dy
> -CONFIG_PATA_PCMCIA=3Dy
> -CONFIG_NETDEVICES=3Dy
> -CONFIG_TUN=3Dm
> -CONFIG_NET_ETHERNET=3Dy
> -# CONFIG_NETDEV_1000 is not set
> -# CONFIG_NETDEV_10000 is not set
> -CONFIG_AIRO_CS=3Dm
> -CONFIG_HOSTAP=3Dm
> -CONFIG_HOSTAP_FIRMWARE=3Dy
> -CONFIG_HOSTAP_CS=3Dm
> -CONFIG_USB_CATC=3Dm
> -CONFIG_USB_KAWETH=3Dm
> -CONFIG_USB_PEGASUS=3Dm
> -CONFIG_USB_RTL8150=3Dm
> -CONFIG_USB_USBNET=3Dm
> -CONFIG_USB_NET_DM9601=3Dm
> -# CONFIG_USB_NET_CDC_SUBSET is not set
> -CONFIG_USB_SIERRA_NET=3Dm
> -CONFIG_NET_PCMCIA=3Dy
> -CONFIG_PCMCIA_PCNET=3Dm
> -CONFIG_PPP=3Dm
> -CONFIG_PPP_ASYNC=3Dm
> -CONFIG_PPP_DEFLATE=3Dm
> -CONFIG_PPP_BSDCOMP=3Dm
> -# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> -CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D640
> -CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D480
> -CONFIG_INPUT_EVDEV=3Dy
> -CONFIG_INPUT_APMPOWER=3Dy
> -# CONFIG_KEYBOARD_ATKBD is not set
> -CONFIG_KEYBOARD_GPIO=3Dy
> -CONFIG_KEYBOARD_MATRIX=3Dy
> -# CONFIG_INPUT_MOUSE is not set
> -CONFIG_INPUT_TOUCHSCREEN=3Dy
> -CONFIG_TOUCHSCREEN_ADS7846=3Dy
> -CONFIG_INPUT_MISC=3Dy
> -CONFIG_INPUT_UINPUT=3Dm
> -# CONFIG_SERIO is not set
> -# CONFIG_LEGACY_PTYS is not set
> -CONFIG_SERIAL_8250=3Dm
> -CONFIG_SERIAL_8250_CS=3Dm
> -CONFIG_SERIAL_PXA=3Dy
> -CONFIG_SERIAL_PXA_CONSOLE=3Dy
> -CONFIG_RAMOOPS=3Dy
> -CONFIG_SPI=3Dy
> -CONFIG_SPI_PXA2XX=3Dy
> -CONFIG_GPIO_SYSFS=3Dy
> -CONFIG_POWER_SUPPLY=3Dy
> -CONFIG_POWER_SUPPLY_DEBUG=3Dy
> -CONFIG_PDA_POWER=3Dy
> -CONFIG_APM_POWER=3Dy
> -CONFIG_FB=3Dy
> -CONFIG_FB_PXA=3Dy
> -CONFIG_FB_PXA_OVERLAY=3Dy
> -CONFIG_FB_PXA_SMARTPANEL=3Dy
> -CONFIG_FB_PXA_PARAMETERS=3Dy
> -CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> -CONFIG_LCD_CLASS_DEVICE=3Dy
> -CONFIG_LCD_CORGI=3Dy
> -CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> -CONFIG_DISPLAY_SUPPORT=3Dy
> -CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> -CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> -CONFIG_FONTS=3Dy
> -CONFIG_FONT_8x16=3Dy
> -CONFIG_LOGO=3Dy
> -# CONFIG_LOGO_LINUX_MONO is not set
> -# CONFIG_LOGO_LINUX_VGA16 is not set
> -CONFIG_SOUND=3Dm
> -CONFIG_SND=3Dm
> -CONFIG_SND_SEQUENCER=3Dm
> -CONFIG_SND_MIXER_OSS=3Dm
> -CONFIG_SND_PCM_OSS=3Dm
> -CONFIG_SND_PXA2XX_AC97=3Dm
> -CONFIG_SND_USB_AUDIO=3Dm
> -CONFIG_SND_SOC=3Dm
> -CONFIG_SND_PXA2XX_SOC=3Dm
> -CONFIG_SND_PXA2XX_SOC_SPITZ=3Dm
> -CONFIG_HID=3Dm
> -CONFIG_USB_KBD=3Dm
> -CONFIG_USB_MOUSE=3Dm
> -CONFIG_USB=3Dm
> -CONFIG_USB_DEBUG=3Dy
> -CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> -CONFIG_USB_DEVICEFS=3Dy
> -CONFIG_USB_OTG_WHITELIST=3Dy
> -CONFIG_USB_MON=3Dm
> -CONFIG_USB_OHCI_HCD=3Dm
> -CONFIG_USB_SL811_HCD=3Dm
> -CONFIG_USB_SL811_CS=3Dm
> -CONFIG_USB_ACM=3Dm
> -CONFIG_USB_PRINTER=3Dm
> -CONFIG_USB_STORAGE=3Dm
> -CONFIG_USB_MDC800=3Dm
> -CONFIG_USB_MICROTEK=3Dm
> -CONFIG_USB_SERIAL=3Dm
> -CONFIG_USB_SERIAL_GENERIC=3Dy
> -CONFIG_USB_SERIAL_BELKIN=3Dm
> -CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dm
> -CONFIG_USB_SERIAL_CYPRESS_M8=3Dm
> -CONFIG_USB_SERIAL_EMPEG=3Dm
> -CONFIG_USB_SERIAL_FTDI_SIO=3Dm
> -CONFIG_USB_SERIAL_VISOR=3Dm
> -CONFIG_USB_SERIAL_IPAQ=3Dm
> -CONFIG_USB_SERIAL_IR=3Dm
> -CONFIG_USB_SERIAL_EDGEPORT=3Dm
> -CONFIG_USB_SERIAL_EDGEPORT_TI=3Dm
> -CONFIG_USB_SERIAL_GARMIN=3Dm
> -CONFIG_USB_SERIAL_IPW=3Dm
> -CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dm
> -CONFIG_USB_SERIAL_KEYSPAN=3Dm
> -CONFIG_USB_SERIAL_KLSI=3Dm
> -CONFIG_USB_SERIAL_KOBIL_SCT=3Dm
> -CONFIG_USB_SERIAL_MCT_U232=3Dm
> -CONFIG_USB_SERIAL_PL2303=3Dm
> -CONFIG_USB_SERIAL_SAFE=3Dm
> -CONFIG_USB_SERIAL_TI=3Dm
> -CONFIG_USB_SERIAL_CYBERJACK=3Dm
> -CONFIG_USB_SERIAL_XIRCOM=3Dm
> -CONFIG_USB_SERIAL_OMNINET=3Dm
> -CONFIG_USB_EMI62=3Dm
> -CONFIG_USB_EMI26=3Dm
> -CONFIG_USB_RIO500=3Dm
> -CONFIG_USB_LEGOTOWER=3Dm
> -CONFIG_USB_LCD=3Dm
> -CONFIG_USB_LED=3Dm
> -CONFIG_USB_CYTHERM=3Dm
> -CONFIG_USB_IDMOUSE=3Dm
> -CONFIG_USB_GADGET=3Dm
> -CONFIG_USB_GADGET_DEBUG_FILES=3Dy
> -CONFIG_USB_GADGET_DEBUG_FS=3Dy
> -CONFIG_USB_PXA27X=3Dm
> -CONFIG_USB_ZERO=3Dm
> -CONFIG_USB_ETH=3Dm
> -CONFIG_USB_ETH_EEM=3Dy
> -CONFIG_USB_GADGETFS=3Dm
> -CONFIG_USB_FILE_STORAGE=3Dm
> -CONFIG_USB_MASS_STORAGE=3Dm
> -CONFIG_USB_G_SERIAL=3Dm
> -CONFIG_USB_CDC_COMPOSITE=3Dm
> -CONFIG_USB_G_MULTI=3Dm
> -CONFIG_USB_G_MULTI_CDC=3Dy
> -CONFIG_USB_GPIO_VBUS=3Dm
> -CONFIG_USB_ULPI=3Dy
> -CONFIG_NOP_USB_XCEIV=3Dm
> -CONFIG_MMC=3Dy
> -CONFIG_MMC_UNSAFE_RESUME=3Dy
> -CONFIG_MMC_PXA=3Dy
> -CONFIG_MMC_SPI=3Dy
> -CONFIG_NEW_LEDS=3Dy
> -CONFIG_LEDS_CLASS=3Dy
> -CONFIG_LEDS_GPIO=3Dy
> -CONFIG_LEDS_TRIGGERS=3Dy
> -CONFIG_LEDS_TRIGGER_TIMER=3Dy
> -CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> -CONFIG_RTC_CLASS=3Dy
> -CONFIG_RTC_DRV_SA1100=3Dm
> -CONFIG_RTC_DRV_PXA=3Dm
> -CONFIG_EXT2_FS=3Dy
> -CONFIG_EXT3_FS=3Dy
> -# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> -# CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=3Dy
> -CONFIG_VFAT_FS=3Dy
> -CONFIG_TMPFS=3Dy
> -CONFIG_TMPFS_POSIX_ACL=3Dy
> -CONFIG_JFFS2_FS=3Dy
> -CONFIG_JFFS2_SUMMARY=3Dy
> -CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> -CONFIG_JFFS2_LZO=3Dy
> -CONFIG_JFFS2_RUBIN=3Dy
> -CONFIG_UBIFS_FS=3Dy
> -CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> -CONFIG_CRAMFS=3Dm
> -CONFIG_NFS_FS=3Dm
> -CONFIG_NFS_V3=3Dy
> -CONFIG_NFS_V4=3Dy
> -CONFIG_NFSD=3Dm
> -CONFIG_NFSD_V4=3Dy
> -CONFIG_CIFS=3Dm
> -CONFIG_PARTITION_ADVANCED=3Dy
> -CONFIG_NLS_DEFAULT=3D"cp437"
> -CONFIG_NLS_CODEPAGE_437=3Dy
> -CONFIG_NLS_CODEPAGE_737=3Dm
> -CONFIG_NLS_CODEPAGE_775=3Dm
> -CONFIG_NLS_CODEPAGE_850=3Dm
> -CONFIG_NLS_CODEPAGE_852=3Dm
> -CONFIG_NLS_CODEPAGE_855=3Dm
> -CONFIG_NLS_CODEPAGE_857=3Dm
> -CONFIG_NLS_CODEPAGE_860=3Dm
> -CONFIG_NLS_CODEPAGE_861=3Dm
> -CONFIG_NLS_CODEPAGE_862=3Dm
> -CONFIG_NLS_CODEPAGE_863=3Dm
> -CONFIG_NLS_CODEPAGE_864=3Dm
> -CONFIG_NLS_CODEPAGE_865=3Dm
> -CONFIG_NLS_CODEPAGE_866=3Dm
> -CONFIG_NLS_CODEPAGE_869=3Dm
> -CONFIG_NLS_CODEPAGE_936=3Dm
> -CONFIG_NLS_CODEPAGE_950=3Dm
> -CONFIG_NLS_CODEPAGE_932=3Dm
> -CONFIG_NLS_CODEPAGE_949=3Dm
> -CONFIG_NLS_CODEPAGE_874=3Dm
> -CONFIG_NLS_ISO8859_8=3Dm
> -CONFIG_NLS_CODEPAGE_1250=3Dm
> -CONFIG_NLS_CODEPAGE_1251=3Dm
> -CONFIG_NLS_ASCII=3Dm
> -CONFIG_NLS_ISO8859_1=3Dy
> -CONFIG_NLS_ISO8859_2=3Dm
> -CONFIG_NLS_ISO8859_3=3Dm
> -CONFIG_NLS_ISO8859_4=3Dm
> -CONFIG_NLS_ISO8859_5=3Dm
> -CONFIG_NLS_ISO8859_6=3Dm
> -CONFIG_NLS_ISO8859_7=3Dm
> -CONFIG_NLS_ISO8859_9=3Dm
> -CONFIG_NLS_ISO8859_13=3Dm
> -CONFIG_NLS_ISO8859_14=3Dm
> -CONFIG_NLS_ISO8859_15=3Dm
> -CONFIG_NLS_KOI8_R=3Dm
> -CONFIG_NLS_KOI8_U=3Dm
> -CONFIG_NLS_UTF8=3Dy
> -CONFIG_MAGIC_SYSRQ=3Dy
> -CONFIG_DEBUG_FS=3Dy
> -CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
> -CONFIG_CRYPTO_NULL=3Dm
> -CONFIG_CRYPTO_TEST=3Dm
> -CONFIG_CRYPTO_PCBC=3Dm
> -CONFIG_CRYPTO_SHA256=3Dm
> -CONFIG_CRYPTO_SHA512=3Dm
> -CONFIG_CRYPTO_WP512=3Dm
> -CONFIG_CRYPTO_ANUBIS=3Dm
> -CONFIG_CRYPTO_BLOWFISH=3Dm
> -CONFIG_CRYPTO_CAMELLIA=3Dm
> -CONFIG_CRYPTO_CAST5=3Dm
> -CONFIG_CRYPTO_CAST6=3Dm
> -CONFIG_CRYPTO_KHAZAD=3Dm
> -CONFIG_CRYPTO_SERPENT=3Dm
> -CONFIG_CRYPTO_TEA=3Dm
> -CONFIG_CRYPTO_TWOFISH=3Dm
> -# CONFIG_CRYPTO_HW is not set
> -CONFIG_CRC_CCITT=3Dy
> -CONFIG_LIBCRC32C=3Dm
> diff --git a/recipes-kernel/linux/linux_git.bb b/recipes-kernel/linux/lin=
ux_git.bb
> deleted file mode 100644
> index fbe3049..0000000
> --- a/recipes-kernel/linux/linux_git.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -CMDLINE_DEBUG =3D "debug"
> -require linux.inc
> -require linux-git.inc
> -
> -SRC_URI_append_akita =3D " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz=
2 "
> -SRC_URI_append_c7x0 =3D " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2=
 "
> -SRC_URI_append_collie =3D " file://${LOGO_SIZE}/logo_linux_clut224.ppm.b=
z2 "
> -SRC_URI_append_poodle =3D " file://${LOGO_SIZE}/logo_linux_clut224.ppm.b=
z2 "
> -SRC_URI_append_tosa =3D " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2=
 "
> -SRC_URI_append_spitz =3D " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz=
2 "
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7GK3cACgkQN1Ujt2V2gByllQCcDaI8oro695D+LulkrmkxZuE3
4Y8An0w3mqHTULCeNwsfYRCnQuNOGa7f
=+BrB
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
