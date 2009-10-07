Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MvWW8-0000JL-MB
	for openembedded-devel@openembedded.org; Wed, 07 Oct 2009 15:25:23 +0200
Received: (qmail 5161 invoked by uid 813007); 7 Oct 2009 13:24:32 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Oct 2009 13:24:32 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2009 15:24:26 +0200
Message-Id: <1254921866-5356-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.4.3
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE][PATCH] linux-bug: updated to newer svn revision, tweaked kernel configuration
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
X-List-Received-Date: Wed, 07 Oct 2009 13:25:24 -0000

---
 conf/distro/include/sane-srcrevs.inc |    1 -
 recipes/linux/linux-bug/defconfig    |  222 ++++++++++------------------------
 recipes/linux/linux-bug_2.6.27.2.bb  |    3 +-
 3 files changed, 68 insertions(+), 158 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index edaa08b..ce34747 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -100,7 +100,6 @@ SRCREV_pn-libw100 ?= "47"
 SRCREV_pn-libowl ?= "277"
 SRCREV_pn-libxosd ?= "627"
 SRCREV_pn-linux-bfin ?= "3758"
-SRCREV_pn-linux-bug ?= "8996"
 SRCREV_pn-linux-hackndev-2.6 ?= "1308"
 SRCREV_pn-linux-ixp4xx ?= "1085"
 SRCREV_pn-linux-openmoko-2.6.24 ?= "fb42ce6724576fc173faf8abfb04aa2c36d213b7"
diff --git a/recipes/linux/linux-bug/defconfig b/recipes/linux/linux-bug/defconfig
index 3e685bf..c0b2990 100644
--- a/recipes/linux/linux-bug/defconfig
+++ b/recipes/linux/linux-bug/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.27.2
-# Thu Apr 23 18:31:57 2009
+# Wed Oct  7 15:10:57 2009
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -26,6 +26,8 @@ CONFIG_ARCH_SUPPORTS_AOUT=y
 CONFIG_ZONE_DMA=y
 CONFIG_ARCH_MTD_XIP=y
 CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_OPROFILE_ARMV6=y
+CONFIG_OPROFILE_ARM11_CORE=y
 CONFIG_VECTORS_BASE=0xffff0000
 CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
 
@@ -50,8 +52,7 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CGROUPS is not set
 # CONFIG_GROUP_SCHED is not set
-CONFIG_SYSFS_DEPRECATED=y
-CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
 # CONFIG_RELAY is not set
 # CONFIG_NAMESPACES is not set
 # CONFIG_BLK_DEV_INITRD is not set
@@ -67,7 +68,7 @@ CONFIG_HOTPLUG=y
 CONFIG_PRINTK=y
 CONFIG_BUG=y
 CONFIG_ELF_CORE=y
-CONFIG_COMPAT_BRK=y
+# CONFIG_COMPAT_BRK is not set
 CONFIG_BASE_FULL=y
 CONFIG_FUTEX=y
 CONFIG_ANON_INODES=y
@@ -80,8 +81,9 @@ CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_SLAB=y
 # CONFIG_SLUB is not set
 # CONFIG_SLOB is not set
-# CONFIG_PROFILING is not set
+CONFIG_PROFILING=y
 CONFIG_MARKERS=y
+CONFIG_OPROFILE=m
 CONFIG_HAVE_OPROFILE=y
 # CONFIG_KPROBES is not set
 # CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
@@ -292,6 +294,7 @@ CONFIG_BINFMT_ELF=y
 # Power management options
 #
 CONFIG_PM=y
+CONFIG_PM_BUG=y
 # CONFIG_PM_DEBUG is not set
 CONFIG_PM_SLEEP=y
 CONFIG_SUSPEND=y
@@ -329,10 +332,10 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_ESP is not set
 # CONFIG_INET_IPCOMP is not set
 # CONFIG_INET_XFRM_TUNNEL is not set
-CONFIG_INET_TUNNEL=y
-CONFIG_INET_XFRM_MODE_TRANSPORT=y
-CONFIG_INET_XFRM_MODE_TUNNEL=y
-CONFIG_INET_XFRM_MODE_BEET=y
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=m
+CONFIG_INET_XFRM_MODE_TUNNEL=m
+CONFIG_INET_XFRM_MODE_BEET=m
 # CONFIG_INET_LRO is not set
 CONFIG_INET_DIAG=y
 CONFIG_INET_TCP_DIAG=y
@@ -340,21 +343,21 @@ CONFIG_INET_TCP_DIAG=y
 CONFIG_TCP_CONG_CUBIC=y
 CONFIG_DEFAULT_TCP_CONG="cubic"
 # CONFIG_TCP_MD5SIG is not set
-CONFIG_IPV6=y
+CONFIG_IPV6=m
 # CONFIG_IPV6_PRIVACY is not set
 # CONFIG_IPV6_ROUTER_PREF is not set
 # CONFIG_IPV6_OPTIMISTIC_DAD is not set
 # CONFIG_INET6_AH is not set
 # CONFIG_INET6_ESP is not set
 # CONFIG_INET6_IPCOMP is not set
-CONFIG_IPV6_MIP6=y
+CONFIG_IPV6_MIP6=m
 # CONFIG_INET6_XFRM_TUNNEL is not set
 CONFIG_INET6_TUNNEL=m
-CONFIG_INET6_XFRM_MODE_TRANSPORT=y
-CONFIG_INET6_XFRM_MODE_TUNNEL=y
-CONFIG_INET6_XFRM_MODE_BEET=y
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
 # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
-CONFIG_IPV6_SIT=y
+CONFIG_IPV6_SIT=m
 CONFIG_IPV6_NDISC_NODETYPE=y
 CONFIG_IPV6_TUNNEL=m
 # CONFIG_IPV6_MULTIPLE_TABLES is not set
@@ -425,11 +428,7 @@ CONFIG_MAC80211_RC_DEFAULT="pid"
 # CONFIG_MAC80211_LEDS is not set
 # CONFIG_MAC80211_DEBUGFS is not set
 # CONFIG_MAC80211_DEBUG_MENU is not set
-CONFIG_IEEE80211=m
-# CONFIG_IEEE80211_DEBUG is not set
-CONFIG_IEEE80211_CRYPT_WEP=m
-# CONFIG_IEEE80211_CRYPT_CCMP is not set
-# CONFIG_IEEE80211_CRYPT_TKIP is not set
+# CONFIG_IEEE80211 is not set
 # CONFIG_RFKILL is not set
 # CONFIG_NET_9P is not set
 
@@ -450,93 +449,7 @@ CONFIG_EXTRA_FIRMWARE=""
 # CONFIG_DEBUG_DEVRES is not set
 # CONFIG_SYS_HYPERVISOR is not set
 # CONFIG_CONNECTOR is not set
-CONFIG_MTD=y
-# CONFIG_MTD_DEBUG is not set
-# CONFIG_MTD_CONCAT is not set
-CONFIG_MTD_PARTITIONS=y
-CONFIG_MTD_REDBOOT_PARTS=y
-CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
-# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
-# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
-CONFIG_MTD_CMDLINE_PARTS=y
-# CONFIG_MTD_AFS_PARTS is not set
-# CONFIG_MTD_AR7_PARTS is not set
-
-#
-# User Modules And Translation Layers
-#
-CONFIG_MTD_CHAR=y
-CONFIG_MTD_BLKDEVS=y
-CONFIG_MTD_BLOCK=y
-# CONFIG_FTL is not set
-# CONFIG_NFTL is not set
-# CONFIG_INFTL is not set
-# CONFIG_RFD_FTL is not set
-# CONFIG_SSFDC is not set
-# CONFIG_MTD_OOPS is not set
-
-#
-# RAM/ROM/Flash chip drivers
-#
-CONFIG_MTD_CFI=y
-# CONFIG_MTD_JEDECPROBE is not set
-CONFIG_MTD_GEN_PROBE=y
-CONFIG_MTD_CFI_ADV_OPTIONS=y
-CONFIG_MTD_CFI_NOSWAP=y
-# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
-# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
-CONFIG_MTD_CFI_GEOMETRY=y
-# CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
-CONFIG_MTD_MAP_BANK_WIDTH_2=y
-# CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
-# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
-# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
-# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
-CONFIG_MTD_CFI_I1=y
-# CONFIG_MTD_CFI_I2 is not set
-# CONFIG_MTD_CFI_I4 is not set
-# CONFIG_MTD_CFI_I8 is not set
-# CONFIG_MTD_OTP is not set
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_CFI_AMDSTD=y
-# CONFIG_MTD_CFI_STAA is not set
-CONFIG_MTD_CFI_UTIL=y
-CONFIG_MTD_RAM=y
-# CONFIG_MTD_ROM is not set
-# CONFIG_MTD_ABSENT is not set
-# CONFIG_MTD_XIP is not set
-
-#
-# Mapping drivers for chip access
-#
-# CONFIG_MTD_COMPLEX_MAPPINGS is not set
-# CONFIG_MTD_PHYSMAP is not set
-# CONFIG_MTD_ARM_INTEGRATOR is not set
-# CONFIG_MTD_PLATRAM is not set
-
-#
-# Self-contained MTD device drivers
-#
-# CONFIG_MTD_DATAFLASH is not set
-# CONFIG_MTD_M25P80 is not set
-# CONFIG_MTD_SLRAM is not set
-# CONFIG_MTD_PHRAM is not set
-# CONFIG_MTD_MTDRAM is not set
-# CONFIG_MTD_BLOCK2MTD is not set
-
-#
-# Disk-On-Chip Device Drivers
-#
-# CONFIG_MTD_DOC2000 is not set
-# CONFIG_MTD_DOC2001 is not set
-# CONFIG_MTD_DOC2001PLUS is not set
-# CONFIG_MTD_NAND is not set
-# CONFIG_MTD_ONENAND is not set
-
-#
-# UBI - Unsorted block images
-#
-# CONFIG_MTD_UBI is not set
+# CONFIG_MTD is not set
 # CONFIG_PARPORT is not set
 CONFIG_BLK_DEV=y
 # CONFIG_BLK_DEV_COW_COMMON is not set
@@ -544,15 +457,10 @@ CONFIG_BLK_DEV_LOOP=y
 # CONFIG_BLK_DEV_CRYPTOLOOP is not set
 # CONFIG_BLK_DEV_NBD is not set
 # CONFIG_BLK_DEV_UB is not set
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_COUNT=16
-CONFIG_BLK_DEV_RAM_SIZE=16384
-# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_BLK_DEV_RAM is not set
 # CONFIG_CDROM_PKTCDVD is not set
 # CONFIG_ATA_OVER_ETH is not set
-CONFIG_MISC_DEVICES=y
-# CONFIG_EEPROM_93CX6 is not set
-# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_MISC_DEVICES is not set
 CONFIG_HAVE_IDE=y
 # CONFIG_IDE is not set
 
@@ -564,7 +472,7 @@ CONFIG_SCSI=y
 CONFIG_SCSI_DMA=y
 # CONFIG_SCSI_TGT is not set
 # CONFIG_SCSI_NETLINK is not set
-CONFIG_SCSI_PROC_FS=y
+# CONFIG_SCSI_PROC_FS is not set
 
 #
 # SCSI support type (disk, tape, CD-ROM)
@@ -572,7 +480,8 @@ CONFIG_SCSI_PROC_FS=y
 CONFIG_BLK_DEV_SD=y
 # CONFIG_CHR_DEV_ST is not set
 # CONFIG_CHR_DEV_OSST is not set
-# CONFIG_BLK_DEV_SR is not set
+CONFIG_BLK_DEV_SR=m
+# CONFIG_BLK_DEV_SR_VENDOR is not set
 # CONFIG_CHR_DEV_SG is not set
 # CONFIG_CHR_DEV_SCH is not set
 
@@ -593,9 +502,7 @@ CONFIG_SCSI_WAIT_SCAN=m
 # CONFIG_SCSI_ISCSI_ATTRS is not set
 # CONFIG_SCSI_SAS_LIBSAS is not set
 # CONFIG_SCSI_SRP_ATTRS is not set
-CONFIG_SCSI_LOWLEVEL=y
-# CONFIG_ISCSI_TCP is not set
-# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_LOWLEVEL is not set
 # CONFIG_SCSI_DH is not set
 # CONFIG_ATA is not set
 # CONFIG_MD is not set
@@ -604,7 +511,7 @@ CONFIG_NETDEVICES=y
 # CONFIG_BONDING is not set
 # CONFIG_MACVLAN is not set
 # CONFIG_EQUALIZER is not set
-# CONFIG_TUN is not set
+CONFIG_TUN=m
 # CONFIG_VETH is not set
 # CONFIG_PHYLIB is not set
 CONFIG_NET_ETHERNET=y
@@ -628,8 +535,9 @@ CONFIG_SMC911X=y
 # CONFIG_WLAN_PRE80211 is not set
 CONFIG_WLAN_80211=y
 CONFIG_LIBERTAS=m
-# CONFIG_LIBERTAS_USB is not set
+CONFIG_LIBERTAS_USB=m
 CONFIG_LIBERTAS_SDIO=m
+CONFIG_BUG_BASE_WIFI=m
 CONFIG_LIBERTAS_GSPI=m
 CONFIG_LIBERTAS_BMI=m
 CONFIG_LIBERTAS_DEBUG=y
@@ -670,7 +578,7 @@ CONFIG_PPP=m
 CONFIG_PPP_ASYNC=m
 CONFIG_PPP_SYNC_TTY=m
 CONFIG_PPP_DEFLATE=m
-# CONFIG_PPP_BSDCOMP is not set
+CONFIG_PPP_BSDCOMP=m
 # CONFIG_PPP_MPPE is not set
 # CONFIG_PPPOE is not set
 # CONFIG_PPPOL2TP is not set
@@ -759,8 +667,7 @@ CONFIG_SERIAL_MXC_CONSOLE=y
 CONFIG_SERIAL_CORE=y
 CONFIG_SERIAL_CORE_CONSOLE=y
 CONFIG_UNIX98_PTYS=y
-CONFIG_LEGACY_PTYS=y
-CONFIG_LEGACY_PTY_COUNT=256
+# CONFIG_LEGACY_PTYS is not set
 # CONFIG_IPMI_HANDLER is not set
 CONFIG_HW_RANDOM=y
 # CONFIG_NVRAM is not set
@@ -801,7 +708,7 @@ CONFIG_I2C_MXC=y
 # Miscellaneous I2C Chip support
 #
 # CONFIG_DS1682 is not set
-# CONFIG_AT24 is not set
+CONFIG_AT24=m
 # CONFIG_SENSORS_EEPROM is not set
 # CONFIG_SENSORS_PCF8574 is not set
 # CONFIG_PCF8575 is not set
@@ -936,6 +843,7 @@ CONFIG_FB_CFB_IMAGEBLIT=y
 # CONFIG_FB_SYS_IMAGEBLIT is not set
 # CONFIG_FB_FOREIGN_ENDIAN is not set
 # CONFIG_FB_SYS_FOPS is not set
+CONFIG_FB_DEFERRED_IO=y
 # CONFIG_FB_SVGALIB is not set
 # CONFIG_FB_MACMODES is not set
 # CONFIG_FB_BACKLIGHT is not set
@@ -991,7 +899,7 @@ CONFIG_SND_MIXER_OSS=y
 CONFIG_SND_PCM_OSS=y
 CONFIG_SND_PCM_OSS_PLUGINS=y
 # CONFIG_SND_DYNAMIC_MINORS is not set
-CONFIG_SND_SUPPORT_OLD_API=y
+# CONFIG_SND_SUPPORT_OLD_API is not set
 CONFIG_SND_VERBOSE_PROCFS=y
 # CONFIG_SND_VERBOSE_PRINTK is not set
 # CONFIG_SND_DEBUG is not set
@@ -1023,7 +931,7 @@ CONFIG_USB_HID=m
 #
 # USB HID Boot Protocol drivers
 #
-CONFIG_USB_KBD=m
+# CONFIG_USB_KBD is not set
 # CONFIG_USB_MOUSE is not set
 CONFIG_USB_SUPPORT=y
 CONFIG_USB_ARCH_HAS_HCD=y
@@ -1037,7 +945,7 @@ CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 # Miscellaneous USB options
 #
 CONFIG_USB_DEVICEFS=y
-CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DEVICE_CLASS is not set
 # CONFIG_USB_DYNAMIC_MINORS is not set
 # CONFIG_USB_SUSPEND is not set
 # CONFIG_USB_OTG is not set
@@ -1068,9 +976,9 @@ CONFIG_USB_EHCI_ROOT_HUB_TT=y
 #
 # USB Device Class drivers
 #
-# CONFIG_USB_ACM is not set
-# CONFIG_USB_PRINTER is not set
-# CONFIG_USB_WDM is not set
+CONFIG_USB_ACM=m
+CONFIG_USB_PRINTER=m
+CONFIG_USB_WDM=m
 
 #
 # NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
@@ -1135,7 +1043,7 @@ CONFIG_USB_SERIAL_FTDI_SIO=m
 # CONFIG_USB_SERIAL_MOS7840 is not set
 # CONFIG_USB_SERIAL_MOTOROLA is not set
 # CONFIG_USB_SERIAL_NAVMAN is not set
-# CONFIG_USB_SERIAL_PL2303 is not set
+CONFIG_USB_SERIAL_PL2303=m
 # CONFIG_USB_SERIAL_OTI6858 is not set
 # CONFIG_USB_SERIAL_SPCP8X5 is not set
 # CONFIG_USB_SERIAL_HP4X is not set
@@ -1206,7 +1114,7 @@ CONFIG_USB_FILE_STORAGE=m
 CONFIG_USB_G_SERIAL=m
 # CONFIG_USB_MIDI_GADGET is not set
 # CONFIG_USB_G_PRINTER is not set
-# CONFIG_USB_CDC_COMPOSITE is not set
+CONFIG_USB_CDC_COMPOSITE=m
 CONFIG_MMC=y
 # CONFIG_MMC_DEBUG is not set
 # CONFIG_MMC_UNSAFE_RESUME is not set
@@ -1339,9 +1247,9 @@ CONFIG_BMI_CAMERA=m
 # CONFIG_BMI_CAMERA_VS6624 is not set
 CONFIG_BMI_CAMERA_OV2640=m
 CONFIG_BMI_VH=m
-# CONFIG_BMI_SENSOR is not set
+CONFIG_BMI_SENSOR=m
 CONFIG_BMI_ZB=m
-# CONFIG_BMI_GSM is not set
+CONFIG_BMI_GSM=m
 
 #
 # Advanced Power Management devices
@@ -1405,20 +1313,28 @@ CONFIG_INOTIFY_USER=y
 # CONFIG_QUOTA is not set
 # CONFIG_AUTOFS_FS is not set
 CONFIG_AUTOFS4_FS=m
-# CONFIG_FUSE_FS is not set
+CONFIG_FUSE_FS=m
 
 #
 # CD-ROM/DVD Filesystems
 #
-# CONFIG_ISO9660_FS is not set
-# CONFIG_UDF_FS is not set
+CONFIG_ISO9660_FS=m
+CONFIG_JOLIET=y
+CONFIG_ZISOFS=y
+CONFIG_UDF_FS=m
+CONFIG_UDF_NLS=y
 
 #
 # DOS/FAT/NT Filesystems
 #
+CONFIG_FAT_FS=m
 # CONFIG_MSDOS_FS is not set
-# CONFIG_VFAT_FS is not set
-# CONFIG_NTFS_FS is not set
+CONFIG_VFAT_FS=m
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+CONFIG_NTFS_FS=m
+# CONFIG_NTFS_DEBUG is not set
+CONFIG_NTFS_RW=y
 
 #
 # Pseudo filesystems
@@ -1441,17 +1357,6 @@ CONFIG_TMPFS=y
 # CONFIG_BEFS_FS is not set
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
-CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_FS_DEBUG=0
-CONFIG_JFFS2_FS_WRITEBUFFER=y
-# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
-# CONFIG_JFFS2_SUMMARY is not set
-# CONFIG_JFFS2_FS_XATTR is not set
-# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
-CONFIG_JFFS2_ZLIB=y
-# CONFIG_JFFS2_LZO is not set
-CONFIG_JFFS2_RTIME=y
-# CONFIG_JFFS2_RUBIN is not set
 CONFIG_CRAMFS=y
 # CONFIG_VXFS_FS is not set
 # CONFIG_MINIX_FS is not set
@@ -1474,7 +1379,12 @@ CONFIG_SUNRPC=m
 # CONFIG_RPCSEC_GSS_KRB5 is not set
 # CONFIG_RPCSEC_GSS_SPKM3 is not set
 # CONFIG_SMB_FS is not set
-# CONFIG_CIFS is not set
+CONFIG_CIFS=m
+# CONFIG_CIFS_STATS is not set
+# CONFIG_CIFS_WEAK_PW_HASH is not set
+# CONFIG_CIFS_XATTR is not set
+# CONFIG_CIFS_DEBUG2 is not set
+CONFIG_CIFS_EXPERIMENTAL=y
 # CONFIG_NCP_FS is not set
 # CONFIG_CODA_FS is not set
 # CONFIG_AFS_FS is not set
@@ -1485,7 +1395,7 @@ CONFIG_SUNRPC=m
 # CONFIG_PARTITION_ADVANCED is not set
 CONFIG_MSDOS_PARTITION=y
 CONFIG_NLS=y
-CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_DEFAULT="utf-8"
 CONFIG_NLS_CODEPAGE_437=y
 # CONFIG_NLS_CODEPAGE_737 is not set
 # CONFIG_NLS_CODEPAGE_775 is not set
@@ -1523,7 +1433,7 @@ CONFIG_NLS_ISO8859_1=y
 # CONFIG_NLS_ISO8859_15 is not set
 # CONFIG_NLS_KOI8_R is not set
 # CONFIG_NLS_KOI8_U is not set
-CONFIG_NLS_UTF8=m
+CONFIG_NLS_UTF8=y
 # CONFIG_DLM is not set
 
 #
@@ -1686,12 +1596,12 @@ CONFIG_BITREVERSE=y
 CONFIG_CRC_CCITT=m
 # CONFIG_CRC16 is not set
 # CONFIG_CRC_T10DIF is not set
-# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC_ITU_T=m
 CONFIG_CRC32=y
 # CONFIG_CRC7 is not set
 # CONFIG_LIBCRC32C is not set
 CONFIG_ZLIB_INFLATE=y
-CONFIG_ZLIB_DEFLATE=y
+CONFIG_ZLIB_DEFLATE=m
 CONFIG_PLIST=y
 CONFIG_HAS_IOMEM=y
 CONFIG_HAS_IOPORT=y
diff --git a/recipes/linux/linux-bug_2.6.27.2.bb b/recipes/linux/linux-bug_2.6.27.2.bb
index 655defa..b5899a7 100644
--- a/recipes/linux/linux-bug_2.6.27.2.bb
+++ b/recipes/linux/linux-bug_2.6.27.2.bb
@@ -2,11 +2,12 @@ DESCRIPTION = "Linux kernel for bug"
 
 PV_append = "+svnr${SRCREV}"
 KV = "2.6.27.2"
-PR = "r27"
+PR = "r28"
 
 COMPATIBLE_MACHINE = "bug"
 
 SVN_PRJ = "bug-linux-${KV}"
+SRCREV = "10017"
 
 SRC_URI = "svn://svn.buglabs.net/bug/branches/R1.4/qa;module=${SVN_PRJ};proto=svn \
            file://defconfig \
-- 
1.6.4.3





