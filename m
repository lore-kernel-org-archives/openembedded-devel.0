Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1O6lqk-0002FW-SL
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 16:33:23 +0200
Received: by mail-bw0-f220.google.com with SMTP id 20so2940304bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 07:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+5Uik/+SvN8yvLnd7oF+J5wsheLNau6xZvGYozqZClU=;
	b=MAMJp3ub6HIk7Z5/kA6/sliyXiN99KJVifEKIY4UNREhC7fKrXBwI4KiEY7kdSziQf
	lwnSQW1s5hCjTRKHhp31060krE5dxvIgqv9+T8W0LIrlqkawqaYnrccRAAmd8Tyx+4US
	Mi/HAykgpHuyGtr/B0oAg0cEk2lI4wXblq+8c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=D9ruiPwzNPLL0zYfY9Q8SFbNTkXjQLQw7aoeylcHeSDn6oJ1/SwRiLDTGxg91bUm1A
	3/SDZsjr7Tp5NgfnjByL8z6VSUSPgSXD3NMtFOsa05keaMlwEczxhLePWz2Gj2ccZjMJ
	O6BcizV+bbknM1VR4CJN6aNzKGVFvsmXqqO9o=
Received: by 10.204.81.80 with SMTP id w16mr3741280bkk.84.1272378583118;
	Tue, 27 Apr 2010 07:29:43 -0700 (PDT)
Received: from localhost.localdomain ([201.153.217.127])
	by mx.google.com with ESMTPS id a11sm171739bkc.21.2010.04.27.07.29.40
	(version=SSLv3 cipher=RC4-MD5); Tue, 27 Apr 2010 07:29:42 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Apr 2010 09:29:13 -0500
Message-Id: <1272378556-21914-2-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1272378556-21914-1-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1272378556-21914-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/5] defconfig: enable framebuffer
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
X-List-Received-Date: Tue, 27 Apr 2010 14:33:23 -0000

* enable boot logo
* enable input events

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/linux/linux-xilinx-ml507/defconfig |   95 +++++++++++++++++++++------
 1 files changed, 74 insertions(+), 21 deletions(-)

diff --git a/recipes/linux/linux-xilinx-ml507/defconfig b/recipes/linux/linux-xilinx-ml507/defconfig
index 693e141..087a530 100644
--- a/recipes/linux/linux-xilinx-ml507/defconfig
+++ b/recipes/linux/linux-xilinx-ml507/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Linux kernel version: 2.6.32
-# Fri Feb 26 23:31:02 2010
+# Linux kernel version: 2.6.33
+# Thu Apr 22 23:23:13 2010
 #
 # CONFIG_PPC64 is not set
 
@@ -36,6 +36,7 @@ CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
 # CONFIG_HAVE_SETUP_PER_CPU_AREA is not set
 # CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK is not set
 CONFIG_IRQ_PER_CPU=y
+CONFIG_NR_IRQS=512
 CONFIG_STACKTRACE_SUPPORT=y
 CONFIG_HAVE_LATENCYTOP_SUPPORT=y
 CONFIG_TRACE_IRQFLAGS_SUPPORT=y
@@ -59,6 +60,7 @@ CONFIG_AUDIT_ARCH=y
 CONFIG_GENERIC_BUG=y
 CONFIG_DTC=y
 CONFIG_DEFAULT_UIMAGE=y
+CONFIG_ARCH_HIBERNATION_POSSIBLE=y
 CONFIG_PPC_DCR_NATIVE=y
 CONFIG_PPC_DCR_MMIO=y
 CONFIG_PPC_DCR=y
@@ -89,6 +91,7 @@ CONFIG_POSIX_MQUEUE_SYSCTL=y
 #
 CONFIG_TREE_RCU=y
 # CONFIG_TREE_PREEMPT_RCU is not set
+# CONFIG_TINY_RCU is not set
 # CONFIG_RCU_TRACE is not set
 CONFIG_RCU_FANOUT=32
 # CONFIG_RCU_FANOUT_EXACT is not set
@@ -98,8 +101,7 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_GROUP_SCHED is not set
 # CONFIG_CGROUPS is not set
-CONFIG_SYSFS_DEPRECATED=y
-CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
 # CONFIG_RELAY is not set
 CONFIG_NAMESPACES=y
 # CONFIG_UTS_NS is not set
@@ -112,6 +114,7 @@ CONFIG_INITRAMFS_SOURCE=""
 CONFIG_RD_GZIP=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
+CONFIG_RD_LZO=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_SYSCTL=y
 CONFIG_ANON_INODES=y
@@ -172,14 +175,14 @@ CONFIG_MODVERSIONS=y
 # CONFIG_MODULE_SRCVERSION_ALL is not set
 CONFIG_BLOCK=y
 CONFIG_LBDAF=y
-# CONFIG_BLK_DEV_BSG is not set
+CONFIG_BLK_DEV_BSG=y
 # CONFIG_BLK_DEV_INTEGRITY is not set
 
 #
 # IO Schedulers
 #
 CONFIG_IOSCHED_NOOP=y
-CONFIG_IOSCHED_AS=y
+# CONFIG_IOSCHED_AS=y
 CONFIG_IOSCHED_DEADLINE=y
 CONFIG_IOSCHED_CFQ=y
 # CONFIG_DEFAULT_AS is not set
@@ -187,6 +190,35 @@ CONFIG_IOSCHED_CFQ=y
 CONFIG_DEFAULT_CFQ=y
 # CONFIG_DEFAULT_NOOP is not set
 CONFIG_DEFAULT_IOSCHED="cfq"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_SPIN_UNLOCK is not set
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_READ_UNLOCK is not set
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQ is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_WRITE_UNLOCK is not set
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
 # CONFIG_FREEZER is not set
 # CONFIG_PPC4xx_PCI_EXPRESS is not set
 
@@ -257,6 +289,7 @@ CONFIG_MATH_EMULATION=y
 CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
 CONFIG_ARCH_HAS_WALK_MEMORY=y
 CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
+CONFIG_SPARSE_IRQ=y
 CONFIG_MAX_ACTIVE_REGIONS=32
 CONFIG_ARCH_FLATMEM_ENABLE=y
 CONFIG_ARCH_POPULATES_NODE_MAP=y
@@ -273,8 +306,8 @@ CONFIG_PHYS_ADDR_T_64BIT=y
 CONFIG_ZONE_DMA_FLAG=1
 CONFIG_BOUNCE=y
 CONFIG_VIRT_TO_BUS=y
-CONFIG_HAVE_MLOCK=y
-CONFIG_HAVE_MLOCKED_PAGE_BIT=y
+# CONFIG_HAVE_MLOCK=y
+# CONFIG_HAVE_MLOCKED_PAGE_BIT=y
 # CONFIG_KSM is not set
 CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
 CONFIG_STDBINUTILS=y
@@ -285,7 +318,7 @@ CONFIG_PPC_4K_PAGES=y
 CONFIG_FORCE_MAX_ZONEORDER=11
 CONFIG_PROC_DEVICETREE=y
 CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE=""
+CONFIG_CMDLINE=" debug "
 CONFIG_EXTRA_TARGETS="simpleImage.virtex440-ml507 simpleImage.initrd.virtex440-ml507"
 CONFIG_SECCOMP=y
 # CONFIG_COMPRESSED_DEVICE_TREE is not set
@@ -383,6 +416,7 @@ CONFIG_INET6_XFRM_MODE_TUNNEL=m
 CONFIG_INET6_XFRM_MODE_BEET=m
 # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
 CONFIG_IPV6_SIT=m
+# CONFIG_IPV6_SIT_6RD is not set
 CONFIG_IPV6_NDISC_NODETYPE=y
 # CONFIG_IPV6_TUNNEL is not set
 # CONFIG_IPV6_MULTIPLE_TABLES is not set
@@ -493,8 +527,8 @@ CONFIG_IP_NF_MANGLE=m
 # CONFIG_AF_RXRPC is not set
 CONFIG_WIRELESS=y
 # CONFIG_CFG80211 is not set
-CONFIG_CFG80211_DEFAULT_PS_VALUE=0
-CONFIG_WIRELESS_OLD_REGULATORY=y
+# CONFIG_CFG80211_DEFAULT_PS_VALUE=0
+# CONFIG_WIRELESS_OLD_REGULATORY=y
 # CONFIG_WIRELESS_EXT is not set
 # CONFIG_LIB80211 is not set
 
@@ -512,8 +546,9 @@ CONFIG_WIRELESS_OLD_REGULATORY=y
 #
 # Generic Driver Options
 #
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-# CONFIG_DEVTMPFS is not set
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_STANDALONE=y
 CONFIG_PREVENT_FIRMWARE_BUILD=y
 CONFIG_FW_LOADER=y
@@ -619,6 +654,10 @@ CONFIG_BLK_DEV=y
 # CONFIG_BLK_DEV_COW_COMMON is not set
 CONFIG_BLK_DEV_LOOP=y
 # CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
 # CONFIG_BLK_DEV_NBD is not set
 # CONFIG_BLK_DEV_SX8 is not set
 CONFIG_BLK_DEV_RAM=y
@@ -667,7 +706,7 @@ CONFIG_HAVE_IDE=y
 #
 
 #
-# See the help texts for more information.
+# The newer stack is recommended.
 #
 # CONFIG_FIREWIRE is not set
 # CONFIG_IEEE1394 is not set
@@ -742,8 +781,10 @@ CONFIG_XILINX_LLTEMAC_MARVELL_88E1111_GMII=y
 # CONFIG_NETDEV_10000 is not set
 # CONFIG_TR is not set
 CONFIG_WLAN=y
-# CONFIG_WLAN_PRE80211 is not set
-# CONFIG_WLAN_80211 is not set
+# CONFIG_AIRO is not set
+# CONFIG_ATMEL is not set
+# CONFIG_PRISM54 is not set
+# CONFIG_HOSTAP is not set
 
 #
 # Enable WiMAX (Networking options) to see the WiMAX drivers
@@ -756,6 +797,7 @@ CONFIG_WLAN=y
 # CONFIG_NETCONSOLE is not set
 # CONFIG_NETPOLL is not set
 # CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_VMXNET3 is not set
 # CONFIG_ISDN is not set
 # CONFIG_PHONE is not set
 
@@ -765,6 +807,7 @@ CONFIG_WLAN=y
 CONFIG_INPUT=y
 # CONFIG_INPUT_FF_MEMLESS is not set
 # CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
 
 #
 # Userland interfaces
@@ -774,7 +817,7 @@ CONFIG_INPUT_MOUSEDEV_PSAUX=y
 CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
 CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
 # CONFIG_INPUT_JOYDEV is not set
-# CONFIG_INPUT_EVDEV is not set
+CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_EVBUG is not set
 
 #
@@ -818,6 +861,7 @@ CONFIG_SERIO_LIBPS2=y
 # CONFIG_SERIO_XILINXPS2 is not set
 CONFIG_SERIO_XILINX_XPS_PS2=y
 # CONFIG_SERIO_RAW is not set
+# CONFIG_SERIO_ALTERA_PS2 is not set
 # CONFIG_GAMEPORT is not set
 
 #
@@ -852,6 +896,7 @@ CONFIG_SERIAL_CORE_CONSOLE=y
 # CONFIG_SERIAL_JSM is not set
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_SERIAL_OF_PLATFORM_NWPSERIAL is not set
+# CONFIG_SERIAL_GRLIB_GAISLER_APBUART is not set
 CONFIG_UNIX98_PTYS=y
 # CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
 CONFIG_LEGACY_PTYS=y
@@ -892,6 +937,7 @@ CONFIG_GPIO_XILINX=y
 #
 # PCI GPIO expanders:
 #
+# CONFIG_GPIO_CS5535 is not set
 # CONFIG_GPIO_BT8XX is not set
 # CONFIG_GPIO_LANGWELL is not set
 
@@ -1014,8 +1060,8 @@ CONFIG_FONT_8x16=y
 # CONFIG_FONT_SUN12x22 is not set
 # CONFIG_FONT_10x18 is not set
 CONFIG_LOGO=y
-CONFIG_LOGO_LINUX_MONO=y
-CONFIG_LOGO_LINUX_VGA16=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_LOGO_LINUX_CLUT224=y
 # CONFIG_SOUND is not set
 # CONFIG_HID_SUPPORT is not set
@@ -1077,6 +1123,7 @@ CONFIG_INOTIFY_USER=y
 CONFIG_AUTOFS_FS=y
 CONFIG_AUTOFS4_FS=y
 # CONFIG_FUSE_FS is not set
+CONFIG_GENERIC_ACL=y
 
 #
 # Caches
@@ -1108,7 +1155,7 @@ CONFIG_PROC_SYSCTL=y
 CONFIG_PROC_PAGE_MONITOR=y
 CONFIG_SYSFS=y
 CONFIG_TMPFS=y
-# CONFIG_TMPFS_POSIX_ACL is not set
+CONFIG_TMPFS_POSIX_ACL=y
 # CONFIG_HUGETLB_PAGE is not set
 # CONFIG_CONFIGFS_FS is not set
 CONFIG_MISC_FILESYSTEMS=y
@@ -1214,9 +1261,11 @@ CONFIG_CRC32=y
 # CONFIG_CRC7 is not set
 # CONFIG_LIBCRC32C is not set
 CONFIG_ZLIB_INFLATE=y
+CONFIG_LZO_DECOMPRESS=y
 CONFIG_DECOMPRESS_GZIP=y
 CONFIG_DECOMPRESS_BZIP2=y
 CONFIG_DECOMPRESS_LZMA=y
+CONFIG_DECOMPRESS_LZO=y
 CONFIG_HAS_IOMEM=y
 CONFIG_HAS_IOPORT=y
 CONFIG_HAS_DMA=y
@@ -1321,7 +1370,11 @@ CONFIG_PRINT_STACK_DEPTH=64
 # CONFIG_KEYS is not set
 # CONFIG_SECURITY is not set
 # CONFIG_SECURITYFS is not set
-# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+# CONFIG_DEFAULT_SECURITY_SELINUX is not set
+# CONFIG_DEFAULT_SECURITY_SMACK is not set
+# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
 CONFIG_CRYPTO=y
 
 #
-- 
1.6.6.1



