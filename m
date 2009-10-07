Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1MvYOT-0007ua-2K
	for openembedded-devel@openembedded.org; Wed, 07 Oct 2009 17:25:36 +0200
Received: (qmail 3015 invoked by uid 1003); 7 Oct 2009 15:24:42 -0000
Received: from localhost (HELO ?192.168.0.174?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 7 Oct 2009 15:24:39 -0000
Message-ID: <4ACCB2B5.5050405@balister.org>
Date: Wed, 07 Oct 2009 08:24:37 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.1) Gecko/20090814 Fedora/3.0-2.6.b3.fc11 Thunderbird/3.0b3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1254921866-5356-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1254921866-5356-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] linux-bug: updated to newer svn revision, tweaked kernel configuration
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
X-List-Received-Date: Wed, 07 Oct 2009 15:25:36 -0000
X-Groupsio-MsgNum: 13352
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms030004000109020208010706"

--------------ms030004000109020208010706
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Acked-by: Philip Balister <philip@balister.org>

On 10/07/2009 06:24 AM, Marcin Juszkiewicz wrote:
> ---
>   conf/distro/include/sane-srcrevs.inc |    1 -
>   recipes/linux/linux-bug/defconfig    |  222 ++++++++++---------------=
---------
>   recipes/linux/linux-bug_2.6.27.2.bb  |    3 +-
>   3 files changed, 68 insertions(+), 158 deletions(-)
>
> diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include=
/sane-srcrevs.inc
> index edaa08b..ce34747 100644
> --- a/conf/distro/include/sane-srcrevs.inc
> +++ b/conf/distro/include/sane-srcrevs.inc
> @@ -100,7 +100,6 @@ SRCREV_pn-libw100 ?=3D "47"
>   SRCREV_pn-libowl ?=3D "277"
>   SRCREV_pn-libxosd ?=3D "627"
>   SRCREV_pn-linux-bfin ?=3D "3758"
> -SRCREV_pn-linux-bug ?=3D "8996"
>   SRCREV_pn-linux-hackndev-2.6 ?=3D "1308"
>   SRCREV_pn-linux-ixp4xx ?=3D "1085"
>   SRCREV_pn-linux-openmoko-2.6.24 ?=3D "fb42ce6724576fc173faf8abfb04aa2=
c36d213b7"
> diff --git a/recipes/linux/linux-bug/defconfig b/recipes/linux/linux-bu=
g/defconfig
> index 3e685bf..c0b2990 100644
> --- a/recipes/linux/linux-bug/defconfig
> +++ b/recipes/linux/linux-bug/defconfig
> @@ -1,7 +1,7 @@
>   #
>   # Automatically generated make config: don't edit
>   # Linux kernel version: 2.6.27.2
> -# Thu Apr 23 18:31:57 2009
> +# Wed Oct  7 15:10:57 2009
>   #
>   CONFIG_ARM=3Dy
>   CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
> @@ -26,6 +26,8 @@ CONFIG_ARCH_SUPPORTS_AOUT=3Dy
>   CONFIG_ZONE_DMA=3Dy
>   CONFIG_ARCH_MTD_XIP=3Dy
>   CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
> +CONFIG_OPROFILE_ARMV6=3Dy
> +CONFIG_OPROFILE_ARM11_CORE=3Dy
>   CONFIG_VECTORS_BASE=3D0xffff0000
>   CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
>
> @@ -50,8 +52,7 @@ CONFIG_IKCONFIG_PROC=3Dy
>   CONFIG_LOG_BUF_SHIFT=3D14
>   # CONFIG_CGROUPS is not set
>   # CONFIG_GROUP_SCHED is not set
> -CONFIG_SYSFS_DEPRECATED=3Dy
> -CONFIG_SYSFS_DEPRECATED_V2=3Dy
> +# CONFIG_SYSFS_DEPRECATED_V2 is not set
>   # CONFIG_RELAY is not set
>   # CONFIG_NAMESPACES is not set
>   # CONFIG_BLK_DEV_INITRD is not set
> @@ -67,7 +68,7 @@ CONFIG_HOTPLUG=3Dy
>   CONFIG_PRINTK=3Dy
>   CONFIG_BUG=3Dy
>   CONFIG_ELF_CORE=3Dy
> -CONFIG_COMPAT_BRK=3Dy
> +# CONFIG_COMPAT_BRK is not set
>   CONFIG_BASE_FULL=3Dy
>   CONFIG_FUTEX=3Dy
>   CONFIG_ANON_INODES=3Dy
> @@ -80,8 +81,9 @@ CONFIG_VM_EVENT_COUNTERS=3Dy
>   CONFIG_SLAB=3Dy
>   # CONFIG_SLUB is not set
>   # CONFIG_SLOB is not set
> -# CONFIG_PROFILING is not set
> +CONFIG_PROFILING=3Dy
>   CONFIG_MARKERS=3Dy
> +CONFIG_OPROFILE=3Dm
>   CONFIG_HAVE_OPROFILE=3Dy
>   # CONFIG_KPROBES is not set
>   # CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
> @@ -292,6 +294,7 @@ CONFIG_BINFMT_ELF=3Dy
>   # Power management options
>   #
>   CONFIG_PM=3Dy
> +CONFIG_PM_BUG=3Dy
>   # CONFIG_PM_DEBUG is not set
>   CONFIG_PM_SLEEP=3Dy
>   CONFIG_SUSPEND=3Dy
> @@ -329,10 +332,10 @@ CONFIG_IP_PNP_BOOTP=3Dy
>   # CONFIG_INET_ESP is not set
>   # CONFIG_INET_IPCOMP is not set
>   # CONFIG_INET_XFRM_TUNNEL is not set
> -CONFIG_INET_TUNNEL=3Dy
> -CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
> -CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
> -CONFIG_INET_XFRM_MODE_BEET=3Dy
> +CONFIG_INET_TUNNEL=3Dm
> +CONFIG_INET_XFRM_MODE_TRANSPORT=3Dm
> +CONFIG_INET_XFRM_MODE_TUNNEL=3Dm
> +CONFIG_INET_XFRM_MODE_BEET=3Dm
>   # CONFIG_INET_LRO is not set
>   CONFIG_INET_DIAG=3Dy
>   CONFIG_INET_TCP_DIAG=3Dy
> @@ -340,21 +343,21 @@ CONFIG_INET_TCP_DIAG=3Dy
>   CONFIG_TCP_CONG_CUBIC=3Dy
>   CONFIG_DEFAULT_TCP_CONG=3D"cubic"
>   # CONFIG_TCP_MD5SIG is not set
> -CONFIG_IPV6=3Dy
> +CONFIG_IPV6=3Dm
>   # CONFIG_IPV6_PRIVACY is not set
>   # CONFIG_IPV6_ROUTER_PREF is not set
>   # CONFIG_IPV6_OPTIMISTIC_DAD is not set
>   # CONFIG_INET6_AH is not set
>   # CONFIG_INET6_ESP is not set
>   # CONFIG_INET6_IPCOMP is not set
> -CONFIG_IPV6_MIP6=3Dy
> +CONFIG_IPV6_MIP6=3Dm
>   # CONFIG_INET6_XFRM_TUNNEL is not set
>   CONFIG_INET6_TUNNEL=3Dm
> -CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dy
> -CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
> -CONFIG_INET6_XFRM_MODE_BEET=3Dy
> +CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dm
> +CONFIG_INET6_XFRM_MODE_TUNNEL=3Dm
> +CONFIG_INET6_XFRM_MODE_BEET=3Dm
>   # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
> -CONFIG_IPV6_SIT=3Dy
> +CONFIG_IPV6_SIT=3Dm
>   CONFIG_IPV6_NDISC_NODETYPE=3Dy
>   CONFIG_IPV6_TUNNEL=3Dm
>   # CONFIG_IPV6_MULTIPLE_TABLES is not set
> @@ -425,11 +428,7 @@ CONFIG_MAC80211_RC_DEFAULT=3D"pid"
>   # CONFIG_MAC80211_LEDS is not set
>   # CONFIG_MAC80211_DEBUGFS is not set
>   # CONFIG_MAC80211_DEBUG_MENU is not set
> -CONFIG_IEEE80211=3Dm
> -# CONFIG_IEEE80211_DEBUG is not set
> -CONFIG_IEEE80211_CRYPT_WEP=3Dm
> -# CONFIG_IEEE80211_CRYPT_CCMP is not set
> -# CONFIG_IEEE80211_CRYPT_TKIP is not set
> +# CONFIG_IEEE80211 is not set
>   # CONFIG_RFKILL is not set
>   # CONFIG_NET_9P is not set
>
> @@ -450,93 +449,7 @@ CONFIG_EXTRA_FIRMWARE=3D""
>   # CONFIG_DEBUG_DEVRES is not set
>   # CONFIG_SYS_HYPERVISOR is not set
>   # CONFIG_CONNECTOR is not set
> -CONFIG_MTD=3Dy
> -# CONFIG_MTD_DEBUG is not set
> -# CONFIG_MTD_CONCAT is not set
> -CONFIG_MTD_PARTITIONS=3Dy
> -CONFIG_MTD_REDBOOT_PARTS=3Dy
> -CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> -# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
> -# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> -CONFIG_MTD_CMDLINE_PARTS=3Dy
> -# CONFIG_MTD_AFS_PARTS is not set
> -# CONFIG_MTD_AR7_PARTS is not set
> -
> -#
> -# User Modules And Translation Layers
> -#
> -CONFIG_MTD_CHAR=3Dy
> -CONFIG_MTD_BLKDEVS=3Dy
> -CONFIG_MTD_BLOCK=3Dy
> -# CONFIG_FTL is not set
> -# CONFIG_NFTL is not set
> -# CONFIG_INFTL is not set
> -# CONFIG_RFD_FTL is not set
> -# CONFIG_SSFDC is not set
> -# CONFIG_MTD_OOPS is not set
> -
> -#
> -# RAM/ROM/Flash chip drivers
> -#
> -CONFIG_MTD_CFI=3Dy
> -# CONFIG_MTD_JEDECPROBE is not set
> -CONFIG_MTD_GEN_PROBE=3Dy
> -CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> -CONFIG_MTD_CFI_NOSWAP=3Dy
> -# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> -# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> -CONFIG_MTD_CFI_GEOMETRY=3Dy
> -# CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
> -CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> -# CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
> -# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> -# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> -# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> -CONFIG_MTD_CFI_I1=3Dy
> -# CONFIG_MTD_CFI_I2 is not set
> -# CONFIG_MTD_CFI_I4 is not set
> -# CONFIG_MTD_CFI_I8 is not set
> -# CONFIG_MTD_OTP is not set
> -CONFIG_MTD_CFI_INTELEXT=3Dy
> -CONFIG_MTD_CFI_AMDSTD=3Dy
> -# CONFIG_MTD_CFI_STAA is not set
> -CONFIG_MTD_CFI_UTIL=3Dy
> -CONFIG_MTD_RAM=3Dy
> -# CONFIG_MTD_ROM is not set
> -# CONFIG_MTD_ABSENT is not set
> -# CONFIG_MTD_XIP is not set
> -
> -#
> -# Mapping drivers for chip access
> -#
> -# CONFIG_MTD_COMPLEX_MAPPINGS is not set
> -# CONFIG_MTD_PHYSMAP is not set
> -# CONFIG_MTD_ARM_INTEGRATOR is not set
> -# CONFIG_MTD_PLATRAM is not set
> -
> -#
> -# Self-contained MTD device drivers
> -#
> -# CONFIG_MTD_DATAFLASH is not set
> -# CONFIG_MTD_M25P80 is not set
> -# CONFIG_MTD_SLRAM is not set
> -# CONFIG_MTD_PHRAM is not set
> -# CONFIG_MTD_MTDRAM is not set
> -# CONFIG_MTD_BLOCK2MTD is not set
> -
> -#
> -# Disk-On-Chip Device Drivers
> -#
> -# CONFIG_MTD_DOC2000 is not set
> -# CONFIG_MTD_DOC2001 is not set
> -# CONFIG_MTD_DOC2001PLUS is not set
> -# CONFIG_MTD_NAND is not set
> -# CONFIG_MTD_ONENAND is not set
> -
> -#
> -# UBI - Unsorted block images
> -#
> -# CONFIG_MTD_UBI is not set
> +# CONFIG_MTD is not set
>   # CONFIG_PARPORT is not set
>   CONFIG_BLK_DEV=3Dy
>   # CONFIG_BLK_DEV_COW_COMMON is not set
> @@ -544,15 +457,10 @@ CONFIG_BLK_DEV_LOOP=3Dy
>   # CONFIG_BLK_DEV_CRYPTOLOOP is not set
>   # CONFIG_BLK_DEV_NBD is not set
>   # CONFIG_BLK_DEV_UB is not set
> -CONFIG_BLK_DEV_RAM=3Dy
> -CONFIG_BLK_DEV_RAM_COUNT=3D16
> -CONFIG_BLK_DEV_RAM_SIZE=3D16384
> -# CONFIG_BLK_DEV_XIP is not set
> +# CONFIG_BLK_DEV_RAM is not set
>   # CONFIG_CDROM_PKTCDVD is not set
>   # CONFIG_ATA_OVER_ETH is not set
> -CONFIG_MISC_DEVICES=3Dy
> -# CONFIG_EEPROM_93CX6 is not set
> -# CONFIG_ENCLOSURE_SERVICES is not set
> +# CONFIG_MISC_DEVICES is not set
>   CONFIG_HAVE_IDE=3Dy
>   # CONFIG_IDE is not set
>
> @@ -564,7 +472,7 @@ CONFIG_SCSI=3Dy
>   CONFIG_SCSI_DMA=3Dy
>   # CONFIG_SCSI_TGT is not set
>   # CONFIG_SCSI_NETLINK is not set
> -CONFIG_SCSI_PROC_FS=3Dy
> +# CONFIG_SCSI_PROC_FS is not set
>
>   #
>   # SCSI support type (disk, tape, CD-ROM)
> @@ -572,7 +480,8 @@ CONFIG_SCSI_PROC_FS=3Dy
>   CONFIG_BLK_DEV_SD=3Dy
>   # CONFIG_CHR_DEV_ST is not set
>   # CONFIG_CHR_DEV_OSST is not set
> -# CONFIG_BLK_DEV_SR is not set
> +CONFIG_BLK_DEV_SR=3Dm
> +# CONFIG_BLK_DEV_SR_VENDOR is not set
>   # CONFIG_CHR_DEV_SG is not set
>   # CONFIG_CHR_DEV_SCH is not set
>
> @@ -593,9 +502,7 @@ CONFIG_SCSI_WAIT_SCAN=3Dm
>   # CONFIG_SCSI_ISCSI_ATTRS is not set
>   # CONFIG_SCSI_SAS_LIBSAS is not set
>   # CONFIG_SCSI_SRP_ATTRS is not set
> -CONFIG_SCSI_LOWLEVEL=3Dy
> -# CONFIG_ISCSI_TCP is not set
> -# CONFIG_SCSI_DEBUG is not set
> +# CONFIG_SCSI_LOWLEVEL is not set
>   # CONFIG_SCSI_DH is not set
>   # CONFIG_ATA is not set
>   # CONFIG_MD is not set
> @@ -604,7 +511,7 @@ CONFIG_NETDEVICES=3Dy
>   # CONFIG_BONDING is not set
>   # CONFIG_MACVLAN is not set
>   # CONFIG_EQUALIZER is not set
> -# CONFIG_TUN is not set
> +CONFIG_TUN=3Dm
>   # CONFIG_VETH is not set
>   # CONFIG_PHYLIB is not set
>   CONFIG_NET_ETHERNET=3Dy
> @@ -628,8 +535,9 @@ CONFIG_SMC911X=3Dy
>   # CONFIG_WLAN_PRE80211 is not set
>   CONFIG_WLAN_80211=3Dy
>   CONFIG_LIBERTAS=3Dm
> -# CONFIG_LIBERTAS_USB is not set
> +CONFIG_LIBERTAS_USB=3Dm
>   CONFIG_LIBERTAS_SDIO=3Dm
> +CONFIG_BUG_BASE_WIFI=3Dm
>   CONFIG_LIBERTAS_GSPI=3Dm
>   CONFIG_LIBERTAS_BMI=3Dm
>   CONFIG_LIBERTAS_DEBUG=3Dy
> @@ -670,7 +578,7 @@ CONFIG_PPP=3Dm
>   CONFIG_PPP_ASYNC=3Dm
>   CONFIG_PPP_SYNC_TTY=3Dm
>   CONFIG_PPP_DEFLATE=3Dm
> -# CONFIG_PPP_BSDCOMP is not set
> +CONFIG_PPP_BSDCOMP=3Dm
>   # CONFIG_PPP_MPPE is not set
>   # CONFIG_PPPOE is not set
>   # CONFIG_PPPOL2TP is not set
> @@ -759,8 +667,7 @@ CONFIG_SERIAL_MXC_CONSOLE=3Dy
>   CONFIG_SERIAL_CORE=3Dy
>   CONFIG_SERIAL_CORE_CONSOLE=3Dy
>   CONFIG_UNIX98_PTYS=3Dy
> -CONFIG_LEGACY_PTYS=3Dy
> -CONFIG_LEGACY_PTY_COUNT=3D256
> +# CONFIG_LEGACY_PTYS is not set
>   # CONFIG_IPMI_HANDLER is not set
>   CONFIG_HW_RANDOM=3Dy
>   # CONFIG_NVRAM is not set
> @@ -801,7 +708,7 @@ CONFIG_I2C_MXC=3Dy
>   # Miscellaneous I2C Chip support
>   #
>   # CONFIG_DS1682 is not set
> -# CONFIG_AT24 is not set
> +CONFIG_AT24=3Dm
>   # CONFIG_SENSORS_EEPROM is not set
>   # CONFIG_SENSORS_PCF8574 is not set
>   # CONFIG_PCF8575 is not set
> @@ -936,6 +843,7 @@ CONFIG_FB_CFB_IMAGEBLIT=3Dy
>   # CONFIG_FB_SYS_IMAGEBLIT is not set
>   # CONFIG_FB_FOREIGN_ENDIAN is not set
>   # CONFIG_FB_SYS_FOPS is not set
> +CONFIG_FB_DEFERRED_IO=3Dy
>   # CONFIG_FB_SVGALIB is not set
>   # CONFIG_FB_MACMODES is not set
>   # CONFIG_FB_BACKLIGHT is not set
> @@ -991,7 +899,7 @@ CONFIG_SND_MIXER_OSS=3Dy
>   CONFIG_SND_PCM_OSS=3Dy
>   CONFIG_SND_PCM_OSS_PLUGINS=3Dy
>   # CONFIG_SND_DYNAMIC_MINORS is not set
> -CONFIG_SND_SUPPORT_OLD_API=3Dy
> +# CONFIG_SND_SUPPORT_OLD_API is not set
>   CONFIG_SND_VERBOSE_PROCFS=3Dy
>   # CONFIG_SND_VERBOSE_PRINTK is not set
>   # CONFIG_SND_DEBUG is not set
> @@ -1023,7 +931,7 @@ CONFIG_USB_HID=3Dm
>   #
>   # USB HID Boot Protocol drivers
>   #
> -CONFIG_USB_KBD=3Dm
> +# CONFIG_USB_KBD is not set
>   # CONFIG_USB_MOUSE is not set
>   CONFIG_USB_SUPPORT=3Dy
>   CONFIG_USB_ARCH_HAS_HCD=3Dy
> @@ -1037,7 +945,7 @@ CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
>   # Miscellaneous USB options
>   #
>   CONFIG_USB_DEVICEFS=3Dy
> -CONFIG_USB_DEVICE_CLASS=3Dy
> +# CONFIG_USB_DEVICE_CLASS is not set
>   # CONFIG_USB_DYNAMIC_MINORS is not set
>   # CONFIG_USB_SUSPEND is not set
>   # CONFIG_USB_OTG is not set
> @@ -1068,9 +976,9 @@ CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
>   #
>   # USB Device Class drivers
>   #
> -# CONFIG_USB_ACM is not set
> -# CONFIG_USB_PRINTER is not set
> -# CONFIG_USB_WDM is not set
> +CONFIG_USB_ACM=3Dm
> +CONFIG_USB_PRINTER=3Dm
> +CONFIG_USB_WDM=3Dm
>
>   #
>   # NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
> @@ -1135,7 +1043,7 @@ CONFIG_USB_SERIAL_FTDI_SIO=3Dm
>   # CONFIG_USB_SERIAL_MOS7840 is not set
>   # CONFIG_USB_SERIAL_MOTOROLA is not set
>   # CONFIG_USB_SERIAL_NAVMAN is not set
> -# CONFIG_USB_SERIAL_PL2303 is not set
> +CONFIG_USB_SERIAL_PL2303=3Dm
>   # CONFIG_USB_SERIAL_OTI6858 is not set
>   # CONFIG_USB_SERIAL_SPCP8X5 is not set
>   # CONFIG_USB_SERIAL_HP4X is not set
> @@ -1206,7 +1114,7 @@ CONFIG_USB_FILE_STORAGE=3Dm
>   CONFIG_USB_G_SERIAL=3Dm
>   # CONFIG_USB_MIDI_GADGET is not set
>   # CONFIG_USB_G_PRINTER is not set
> -# CONFIG_USB_CDC_COMPOSITE is not set
> +CONFIG_USB_CDC_COMPOSITE=3Dm
>   CONFIG_MMC=3Dy
>   # CONFIG_MMC_DEBUG is not set
>   # CONFIG_MMC_UNSAFE_RESUME is not set
> @@ -1339,9 +1247,9 @@ CONFIG_BMI_CAMERA=3Dm
>   # CONFIG_BMI_CAMERA_VS6624 is not set
>   CONFIG_BMI_CAMERA_OV2640=3Dm
>   CONFIG_BMI_VH=3Dm
> -# CONFIG_BMI_SENSOR is not set
> +CONFIG_BMI_SENSOR=3Dm
>   CONFIG_BMI_ZB=3Dm
> -# CONFIG_BMI_GSM is not set
> +CONFIG_BMI_GSM=3Dm
>
>   #
>   # Advanced Power Management devices
> @@ -1405,20 +1313,28 @@ CONFIG_INOTIFY_USER=3Dy
>   # CONFIG_QUOTA is not set
>   # CONFIG_AUTOFS_FS is not set
>   CONFIG_AUTOFS4_FS=3Dm
> -# CONFIG_FUSE_FS is not set
> +CONFIG_FUSE_FS=3Dm
>
>   #
>   # CD-ROM/DVD Filesystems
>   #
> -# CONFIG_ISO9660_FS is not set
> -# CONFIG_UDF_FS is not set
> +CONFIG_ISO9660_FS=3Dm
> +CONFIG_JOLIET=3Dy
> +CONFIG_ZISOFS=3Dy
> +CONFIG_UDF_FS=3Dm
> +CONFIG_UDF_NLS=3Dy
>
>   #
>   # DOS/FAT/NT Filesystems
>   #
> +CONFIG_FAT_FS=3Dm
>   # CONFIG_MSDOS_FS is not set
> -# CONFIG_VFAT_FS is not set
> -# CONFIG_NTFS_FS is not set
> +CONFIG_VFAT_FS=3Dm
> +CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> +CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> +CONFIG_NTFS_FS=3Dm
> +# CONFIG_NTFS_DEBUG is not set
> +CONFIG_NTFS_RW=3Dy
>
>   #
>   # Pseudo filesystems
> @@ -1441,17 +1357,6 @@ CONFIG_TMPFS=3Dy
>   # CONFIG_BEFS_FS is not set
>   # CONFIG_BFS_FS is not set
>   # CONFIG_EFS_FS is not set
> -CONFIG_JFFS2_FS=3Dy
> -CONFIG_JFFS2_FS_DEBUG=3D0
> -CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
> -# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
> -# CONFIG_JFFS2_SUMMARY is not set
> -# CONFIG_JFFS2_FS_XATTR is not set
> -# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> -CONFIG_JFFS2_ZLIB=3Dy
> -# CONFIG_JFFS2_LZO is not set
> -CONFIG_JFFS2_RTIME=3Dy
> -# CONFIG_JFFS2_RUBIN is not set
>   CONFIG_CRAMFS=3Dy
>   # CONFIG_VXFS_FS is not set
>   # CONFIG_MINIX_FS is not set
> @@ -1474,7 +1379,12 @@ CONFIG_SUNRPC=3Dm
>   # CONFIG_RPCSEC_GSS_KRB5 is not set
>   # CONFIG_RPCSEC_GSS_SPKM3 is not set
>   # CONFIG_SMB_FS is not set
> -# CONFIG_CIFS is not set
> +CONFIG_CIFS=3Dm
> +# CONFIG_CIFS_STATS is not set
> +# CONFIG_CIFS_WEAK_PW_HASH is not set
> +# CONFIG_CIFS_XATTR is not set
> +# CONFIG_CIFS_DEBUG2 is not set
> +CONFIG_CIFS_EXPERIMENTAL=3Dy
>   # CONFIG_NCP_FS is not set
>   # CONFIG_CODA_FS is not set
>   # CONFIG_AFS_FS is not set
> @@ -1485,7 +1395,7 @@ CONFIG_SUNRPC=3Dm
>   # CONFIG_PARTITION_ADVANCED is not set
>   CONFIG_MSDOS_PARTITION=3Dy
>   CONFIG_NLS=3Dy
> -CONFIG_NLS_DEFAULT=3D"iso8859-1"
> +CONFIG_NLS_DEFAULT=3D"utf-8"
>   CONFIG_NLS_CODEPAGE_437=3Dy
>   # CONFIG_NLS_CODEPAGE_737 is not set
>   # CONFIG_NLS_CODEPAGE_775 is not set
> @@ -1523,7 +1433,7 @@ CONFIG_NLS_ISO8859_1=3Dy
>   # CONFIG_NLS_ISO8859_15 is not set
>   # CONFIG_NLS_KOI8_R is not set
>   # CONFIG_NLS_KOI8_U is not set
> -CONFIG_NLS_UTF8=3Dm
> +CONFIG_NLS_UTF8=3Dy
>   # CONFIG_DLM is not set
>
>   #
> @@ -1686,12 +1596,12 @@ CONFIG_BITREVERSE=3Dy
>   CONFIG_CRC_CCITT=3Dm
>   # CONFIG_CRC16 is not set
>   # CONFIG_CRC_T10DIF is not set
> -# CONFIG_CRC_ITU_T is not set
> +CONFIG_CRC_ITU_T=3Dm
>   CONFIG_CRC32=3Dy
>   # CONFIG_CRC7 is not set
>   # CONFIG_LIBCRC32C is not set
>   CONFIG_ZLIB_INFLATE=3Dy
> -CONFIG_ZLIB_DEFLATE=3Dy
> +CONFIG_ZLIB_DEFLATE=3Dm
>   CONFIG_PLIST=3Dy
>   CONFIG_HAS_IOMEM=3Dy
>   CONFIG_HAS_IOPORT=3Dy
> diff --git a/recipes/linux/linux-bug_2.6.27.2.bb b/recipes/linux/linux-=
bug_2.6.27.2.bb
> index 655defa..b5899a7 100644
> --- a/recipes/linux/linux-bug_2.6.27.2.bb
> +++ b/recipes/linux/linux-bug_2.6.27.2.bb
> @@ -2,11 +2,12 @@ DESCRIPTION =3D "Linux kernel for bug"
>
>   PV_append =3D "+svnr${SRCREV}"
>   KV =3D "2.6.27.2"
> -PR =3D "r27"
> +PR =3D "r28"
>
>   COMPATIBLE_MACHINE =3D "bug"
>
>   SVN_PRJ =3D "bug-linux-${KV}"
> +SRCREV =3D "10017"
>
>   SRC_URI =3D "svn://svn.buglabs.net/bug/branches/R1.4/qa;module=3D${SV=
N_PRJ};proto=3Dsvn \
>              file://defconfig \


--------------ms030004000109020208010706
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICECwlen/oUcoDd1VrNqKp/fwwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA5MDQxNTAwNDQ1OFoXDTEwMDQxNTAwNDQ1
OFowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx5Xoie8CV9dJeiaiKRdylvicHE9Aha6f9/CLlVs+Ezob7fIu
Ra4P9ugzZZ2VCtPMQU3Qsjw35mVmYaKXB1U+fZeffbyad6OJEIK1jhqBIz5jtJMc/YWXn/bRmqCl
MfTCgilUMOcsfiHAbmLVhYiNbEhOuy6vWdxSSolHqVa/IHE72qqjhoYWHd+5XVfx1c4jW+CePNMQ
EHxjCzuD+wq6Mzle72dXw+bnyIpG99hB26uNmV//h5iz1VmJU63FZWynSjG79NcY9+mTWXeX213V
V6kJ2wce2rETbYvKQ7err6NnZnG/tiwGI1M7fQqQAti+CkDciLJ129LO+APVYZQgEwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAIUyDAPIEniN6SUdbDiBqi2dtITdnkoUItm/tX9TRn66P0VtWug7k7xjo6piWRE7B
ZwhihotNY0ZnjlK+h0VorxfY63B5tarRB6qJ7f26ukmpltwWWLDB2hWFoKUCn6PE2NTdj+1xNinh
ZNQHy4GyygXjlVfVSn/ZnaGJ31z4PK0wggL9MIICZqADAgECAhAsJXp/6FHKA3dVazaiqf38MA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wOTA0MTUwMDQ0NThaFw0xMDA0MTUwMDQ0NThaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeV6InvAlfX
SXomoikXcpb4nBxPQIWun/fwi5VbPhM6G+3yLkWuD/boM2WdlQrTzEFN0LI8N+ZlZmGilwdVPn2X
n328mnejiRCCtY4agSM+Y7STHP2Fl5/20ZqgpTH0woIpVDDnLH4hwG5i1YWIjWxITrsur1ncUkqJ
R6lWvyBxO9qqo4aGFh3fuV1X8dXOI1vgnjzTEBB8Yws7g/sKujM5Xu9nV8Pm58iKRvfYQdurjZlf
/4eYs9VZiVOtxWVsp0oxu/TXGPfpk1l3l9td1VepCdsHHtqxE22LykO3q6+jZ2Zxv7YsBiNTO30K
kALYvgpA3IiyddvSzvgD1WGUIBMCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBACFMgwDyBJ4jeklHWw4gaotnbSE3
Z5KFCLZv7V/U0Z+uj9FbVroO5O8Y6OqYlkROwWcIYoaLTWNGZ45SvodFaK8X2OtwebWq0Qeqie39
urpJqZbcFliwwdoVhaClAp+jxNjU3Y/tcTYp4WTUB8uBssoF45VX1Up/2Z2hid9c+DytMIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE
pjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+n
ttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4
oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmww
CwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0
HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCA3EwggNtAgEBMHYwYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAsJXp/6FHKA3dVazaiqf38MAkGBSsOAwIa
BQCgggHQMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MTAwNzE1
MjQzN1owIwYJKoZIhvcNAQkEMRYEFHD/DmBVecJnDbRzxMW7ODAe0KvoMF8GCSqGSIb3DQEJDzFS
MFAwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIB
QDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDCBhQYJKwYBBAGCNxAEMXgwdjBiMQswCQYDVQQGEwJa
QTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECECwlen/oUcoDd1VrNqKp/fwwgYcGCyqGSIb3
DQEJEAILMXigdjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0
eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECECwl
en/oUcoDd1VrNqKp/fwwDQYJKoZIhvcNAQEBBQAEggEAPAT1Iwa6rXDikLbloyqoYpm4MIFwxaEM
xybKJ0iHHM0gbmAmOhkljlB8w8mYWSmRRHi7+bYYSHK51GhnoO2quyyiy0Ukz1vsTS+lfiwrLy0j
myruTaGYwOGvsVmJSMtQtwFQ+zMHIbeHtUqGb61fMSQbPAMetXuOuxyX5/iHxaLrKBDhJIYTAP5F
3tV1TuivXva4yC9UoDtudixwtZT5/thIQa9HY/KkLBtqLX4egAqIPYR3qv/1nDaQNIGYbyzhIMaL
d6EiQ1hj3fXfJA7kZaLXunRle2sM19zGFTKQeW+RnnsQiQlGT6cMdwNPMMNJvRhySVVIGoOOHq4o
I9UrkQAAAAAAAA==

--------------ms030004000109020208010706--
