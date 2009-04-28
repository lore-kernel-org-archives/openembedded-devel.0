Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1Lyp4C-0002Wm-1y
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 17:17:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 676582C82A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 15:10:21 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0eIueVXHRxb
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 15:10:19 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 47BB92C797
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 15:10:17 +0000 (UTC)
Message-ID: <49F71CF8.7030707@gmail.com>
Date: Tue, 28 Apr 2009 17:12:56 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [STABLE][PATCH] modified kaeilos distro configuration
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
X-List-Received-Date: Tue, 28 Apr 2009 15:18:00 -0000
Content-Type: text/x-diff;
	name="0001-modified-kaeilos-distro-configuration.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="0001-modified-kaeilos-distro-configuration.patch"

From 2c42e4c37bc640f38bf7d07901b8ac78f03c9df9 Mon Sep 17 00:00:00 2001
From: Marco Cavallini <m.cavallini@koansoftware.com>
Date: Tue, 28 Apr 2009 16:15:05 +0200
Subject: [PATCH] modified kaeilos distro configuration
 * changed version to 2009.1
 * solved bluez-utils problem with x86 targets


Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 conf/distro/kaeilos.conf |  129 ++++++++++++++++++++++++++++++++--------------
 1 files changed, 90 insertions(+), 39 deletions(-)

diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index a65bbff..a945f5f 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -1,12 +1,16 @@
 #@--------------------------------------------------------------------
 #@TYPE: Distribution
-#@NAME: KaeilOS 
+#@NAME: KaeilOS(R) - http://www.kaeilos.com
 #@DESCRIPTION: KaeilOS Linux Distribution for Kernel 2.6 based devices
 #@MAINTAINER: Marco Cavallini <m.cavallini@koansoftware.com>
+#@VERSION: 28-04-2009
+#
+# Use this at your own risk, we welcome bugreports filed at 
+#    http://bugs.openembedded.net
 #@--------------------------------------------------------------------
 
-#DISTRO_VERSION = "2008.1"
-DISTRO_VERSION = "2008.1-test-${DATE}"
+#DISTRO_VERSION = "2009.1"
+DISTRO_VERSION = "2009.1-test-${DATE}"
 DISTRO_REVISION = "1"
 DISTRO_PR = ".1"
 
@@ -20,7 +24,6 @@ require conf/distro/include/preferred-opie-versions-1.2.4.inc
 
 PREFERRED_VERSION_xserver-kdrive = "1.3.0.0"
 PREFERRED_VERSION_busybox        = "1.13.2"
-
 IMAGE_DEV_MANAGER = "busybox-mdev"
 
 #Images built can have to modes:
@@ -46,19 +49,38 @@ FEED_BASEPATH = "feeds/2008/${ANGSTROM_PKG_FORMAT}/${ANGSTROMLIBC}/"
 
 #The angstrom-mirrors.bbclass should have everything, but we can use this as a fallback
 CVS_TARBALL_STASH ?= "\
-             http://www.angstrom-distribution.org/unstable/sources/ \
-            "
+		     http://www.angstrom-distribution.org/unstable/sources/ \
+		    "
 
+#Make sure we use 2.6 on machines with a 2.4/2.6 selector
+KERNEL = "kernel26"
+MACHINE_KERNEL_VERSION = "2.6"
 PCMCIA_MANAGER = "pcmciautils"
 
+#Preferred version for the kernel on various machines
+PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
+
+#Initramfs for kernels
+#KERNEL_INITRAMFS_DIR = "${TMPDIR}/deploy/uclibc/images/${MACHINE}/"
+#KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
+
 #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
-PREFERRED_VERSION_linux-libc-headers    = "2.6.23"
+PREFERRED_VERSION_linux-libc-headers 	= "2.6.23"
 
 #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
-PREFERRED_VERSION_glibc         ?= "2.6.1"
-PREFERRED_VERSION_glibc-initial     ?= "2.6.1"
-PREFERRED_VERSION_uclibc            ?= "0.9.30"
-PREFERRED_VERSION_uclibc-initial    ?= "0.9.30"
+PREFERRED_VERSION_glibc 		?= "2.6.1"
+PREFERRED_VERSION_glibc-initial 	?= "2.6.1"
+PREFERRED_VERSION_uclibc        	?= "0.9.30"
+PREFERRED_VERSION_uclibc-initial	?= "0.9.30"
+
+# Preferred provider for virtual/psplash
+# This enforces a specific brand to be used, in our case the angstrom
+# one. In case you want to change the logo or something like that we
+# suggest you to create another recipe (e.g: psplash-<brand>) for that
+# and add that into your image.
+# You can also opt to change or override this line, but that isn't
+# needed because psplash is using update-alternatives.
+#PREFERRED_PROVIDER_virtual/psplash               ?= "psplash-kaeilos"
 
 PREFERRED_PROVIDER_avahi = "avahi"
 
@@ -67,31 +89,28 @@ PREFERRED_PROVIDER_virtual/xserver  ?= "xserver-kdrive"
 PREFERRED_PROVIDER_xserver          ?= "xserver-kdrive"
 
 #powerpc needs additional patches to gcc
-ANGSTROM_GCC_VERSION_ppc405         ?= "4.1.1"
-ANGSTROM_GCC_VERSION_xilinx-ml403   ?= "4.1.1"
-ANGSTROM_GCC_VERSION_xilinx-ml403   ?= "4.1.1"
+ANGSTROM_GCC_VERSION_ppc405 		?= "4.1.1"
+ANGSTROM_GCC_VERSION_xilinx-ml403	?= "4.1.1"
+ANGSTROM_GCC_VERSION_xilinx-ml403	?= "4.1.1"
 
 # Blackfin has its own gcc
-ANGSTROM_GCC_VERSION_bfin           = "4.1.2"
+ANGSTROM_GCC_VERSION_bfin			= "4.1.2"
 
-#for proper NEON support we need a CSL toolchain 
-#ANGSTROM_GCC_VERSION_armv7a         = "4.2.1+csl-arm-2007q3-53"
-ANGSTROM_GCC_VERSION_armv7a     = "4.3.1" 
+ANGSTROM_GCC_VERSION_armv7a		= "4.3.1" 
 
-#Horrible workaround for armv7a follows:
-# gcc 4.3.1 builds a kernel that oopses with a null-pointer in the rcu-update function
-# gcc 4.2.1 (the one from *gasp* csl) builds a working kernel, but non-working userspace
+ANGSTROM_GCC_VERSION_486sx = "4.3.2"
 
-KERNEL_CCSUFFIX_armv7a= "-4.2.1+csl-arm-2007q3-53"
+# Uncomment this if want need to build an armv7a kernel with CSL toolchain (<2.6.27 don't boot with mainline gcc)
+#KERNEL_CCSUFFIX_armv7a= "-4.2.1+csl-arm-2007q3-53"
 
 #avr32 only has support for gcc 4.2.2
-ANGSTROM_GCC_VERSION_avr32      ?= "4.2.2"
+ANGSTROM_GCC_VERSION_avr32		?= "4.2.2"
 
 #Everybody else can just use this: 
-ANGSTROM_GCC_VERSION            ?= "4.2.4"
-PREFERRED_VERSION_binutils              ?= "2.18.50.0.7"
-PREFERRED_VERSION_binutils-cross        ?= "2.18.50.0.7"
-PREFERRED_VERSION_binutils-cross-sdk    ?= "2.18.50.0.7"
+ANGSTROM_GCC_VERSION 			?= "4.2.4"
+PREFERRED_VERSION_binutils	?= "2.18.50.0.7"
+PREFERRED_VERSION_binutils-cross 	?= "2.18.50.0.7"
+PREFERRED_VERSION_binutils-cross-sdk 	?= "2.18.50.0.7"
 
 PREFERRED_VERSION_gcc                    ?= "${ANGSTROM_GCC_VERSION}"
 PREFERRED_VERSION_gcc-cross              ?= "${ANGSTROM_GCC_VERSION}"
@@ -118,6 +137,8 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 
 # hostap stuff, we prefer the in-kernel modules, but those don't work for all machines
 PREFERRED_PROVIDER_hostap-conf                      ?= "hostap-conf"
+PREFERRED_PROVIDER_hostap-modules_h2200             ?= "hostap-modules"
+PREFERRED_PROVIDER_hostap-modules_hx4700            ?= "hostap-modules"
 
 PREFERRED_PROVIDER_virtual/db           ?= "db"
 PREFERRED_PROVIDER_virtual/db-native    ?= "db-native"
@@ -127,19 +148,20 @@ PREFERRED_PROVIDER_virtual/libxine      ?= "libxine-x11"
 PREFERRED_PROVIDER_virtual/xserver      ?= "xserver-kdrive"
 
 # Others:
-PREFERRED_PROVIDER_linux-libc-headers     = "linux-libc-headers"
-PREFERRED_PROVIDER_dbus-glib              = "dbus-glib"
-PREFERRED_PROVIDER_esound                ?= "pulseaudio"
-PREFERRED_PROVIDER_gconf                 ?= "gconf-dbus"
-PREFERRED_PROVIDER_gnome-vfs             ?= "gnome-vfs"
+PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
+PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
+PREFERRED_PROVIDER_esound               ?= "pulseaudio"
+PREFERRED_PROVIDER_gconf                ?= "gconf-dbus"
+PREFERRED_PROVIDER_gnome-vfs            ?= "gnome-vfs"
 PREFERRED_PROVIDER_gnome-vfs-plugin-file ?= "gnome-vfs"
-PREFERRED_PROVIDER_tslib                 ?= "tslib"
-PREFERRED_PROVIDER_tslib-conf            ?= "tslib"
-PREFERRED_PROVIDER_libgpewidget          ?= "libgpewidget"
-PREFERRED_PROVIDER_ntp                   ?= "ntp"
-PREFERRED_PROVIDER_hotplug                = "udev"
-PREFERRED_PROVIDER_libxss                 = "libxss"
-PREFERRED_PROVIDER_bluez-utils-dbus       = "bluez-utils"
+PREFERRED_PROVIDER_tslib                ?= "tslib"
+PREFERRED_PROVIDER_tslib-conf           ?= "tslib"
+PREFERRED_PROVIDER_libgpewidget         ?= "libgpewidget"
+PREFERRED_PROVIDER_ntp                  ?= "ntp"
+PREFERRED_PROVIDER_hotplug               = "udev"
+PREFERRED_PROVIDER_libxss                = "libxss"
+PREFERRED_PROVIDER_bluez-utils-dbus      = "bluez-utils"
+PREFERRED_PROVIDER_bluez-libs            = "bluez4"
 
 # we don't ship gtk-directfb by default
 PREFERRED_PROVIDER_gtk+                   ?= "gtk+"
@@ -157,13 +179,29 @@ PREFERRED_PROVIDER_gdk-pixbuf-loader-wbmp ?= "gtk+"
 PREFERRED_PROVIDER_gdk-pixbuf-loader-xbm  ?= "gtk+"
 PREFERRED_PROVIDER_gdk-pixbuf-loader-xpm  ?= "gtk+"
 
+
 #Silence a warning during parsing
 PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
 
+#This is needed to get a correct PACKAGE_ARCH for packages that have PACKAGE_ARCH = ${MACHINE_ARCH}
+ARM_ABI ?= "${@['','oabi'][bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 require conf/distro/include/kaeilos.inc
 
+
+
+# If we're using an .ipk based rootfs, we want to have opkg-nogpg installed so postinst script can run
+# We also take this opportunity to inject angstrom-version and the feed configs into the rootfs
+IPKG_VARIANT = "opkg-nogpg angstrom-version ${ANGSTROM_FEED_CONFIGS}"
+
 # do some task-base stuff here
 
+# Prefer bluez4, it's needed for things like connman. Bluez4 is also largely backward compatible with
+# bluez 3.x
+DISTRO_BLUETOOTH_MANAGER = "\
+	blueprobe \
+	bluez4 \
+   "
+
 # We want to ship extra debug utils in the rootfs when doing a debug build 
 DEBUG_APPS ?= ""
 DEBUG_APPS += '${@base_conditional("DISTRO_TYPE", "release", "", "strace procps",d)}'
@@ -179,9 +217,22 @@ DISTRO_EXTRA_RDEPENDS += "\
     ${DEBUG_APPS} angstrom-libc-fixup-hack \
     "
 
+# This also hooks into task-base, but isn't mandatory.
+# If you don't want parts of this in your task-base using images you can put this in the image recipe:
+# BAD_RECOMMENDATIONS = "avahi-daemon avahi-autoipd"
+# Note that BAD_RECOMMENDATIONS is a feature of rootfs_ipk.bbclass, not angstrom
+# kernel modules: ship fs modules so you can mount stuff and af-packet so networking works
+# avahi: makes finding your device on the network a lot easier
+# openssh-sftp-server: provides sftp which combined with avahi makes it real easy to use things like sshfs
+# psplash-angstrom: angstrom branded psplash, you can add your own psplash-foo to an image, it uses update-alternatives
+# DEBUG_APPS: ship strace and procpc to make simple debugging a lot easier
 DISTRO_EXTRA_RRECOMMENDS += " \
     kernel-module-vfat \
     kernel-module-ext2 \
+    kernel-module-ext3 \
     kernel-module-af-packet \
     openssh-sftp-server \
     "
+
+ARM_INSTRUCTION_SET_pn-uclibc = "arm"
+ARM_INSTRUCTION_SET_pn-uclibc-initial = "arm"
-- 
1.5.6.5


