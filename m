Received: from [63.245.244.68] (helo=mail.emacinc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tstratman@emacinc.com>) id 1Lgnt0-0006u8-5r
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 23:23:50 +0100
Received: from [63.245.244.67] (helo=emac081.emacinc.com)
	by mail.emacinc.com with esmtp (Exim 4.50)
	id 1Lgnnn-0008Mg-S1; Mon, 09 Mar 2009 17:18:34 -0500
From: Travis Stratman <tstratman@emacinc.com>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <200903071735.37618.raj.khem@gmail.com>
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
	<200903071735.37618.raj.khem@gmail.com>
Date: Mon, 09 Mar 2009 17:18:09 -0500
Message-Id: <1236637089.29394.59.camel@cheeto.emacinc.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-SA-Exim-Connect-IP: 63.245.244.67
X-SA-Exim-Mail-From: tstratman@emacinc.com
X-Spam-Checker-Version: SpamAssassin 3.1.4 (2006-07-26) on mail.emacinc.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	GREYLIST_ISWHITE,TW_PN,TW_XB,UPPERCASE_25_50 autolearn=ham 
	version=3.1.4
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: failure on gcc-cross-initial-4.2.4-r5 for i686
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
X-List-Received-Date: Mon, 09 Mar 2009 22:23:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Khem.

On Sat, 2009-03-07 at 17:35 -0800, Khem Raj wrote:
> 
> Are you using latest git? I do not get the error like yours for me it builds 
> fine for i686-generic machine. Could you post your local.conf ?
> are you using some pre existing distro and machine or defining your own.

I'm using the latest git (as of Saturday morning) of
org.openembedded.dev. I'm using i686-generic.conf for the machine file
and a custom distro file mostly taken directly from the Angstrom conf
for now. As of right now there is nothing in /opt/oe/EMAC-OE-x86 besides
the custom conf files that I am using and a custom busybox packages
directory. I have done a lot of work w/ OE for ARM but I'm starting out
with the latest and greatest for the x86 side.

conf files follow (minus comments and newlines):
----
travis@cheeto:/opt/oe/EMAC-OE-x86/conf$ sed -e 's/#.*//' -e '/^$/ d' local.conf
MNT = "/mnt/oe/x86"
DL_DIR = "${MNT}/sources"
BBFILES := "/opt/oe/EMAC-OE-x86/packages/*/*.bb ${MNT}/org.openembedded.dev/packages/*/*.bb"
BBFILE_COLLECTIONS = "upstream EMAC-OE-x86"
BBFILE_PATTERN_upstream = "${MNT}/org.openembedded.dev/"
BBFILE_PATTERN_EMAC-OE-x86 = "/opt/oe/EMAC-OE-x86/"
BBFILE_PRIORITY_upstream = "5"
BBFILE_PRIORITY_EMAC-OE-x86 = "10"
BBMASK = ""
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
TMPDIR = "/opt/oe/EMAC-OE-x86/tmp"
MACHINE = "i686-generic"
TARGET_OS = "linux"
DISTRO = "emac-x86"
ASSUME_PROVIDED += "qemu-native"
IMAGE_FSTYPES = "tar.bz2 ext3"
BBDEBUG = "yes"
BBINCLUDELOGS = "yes"

travis@cheeto:/opt/oe/EMAC-OE-x86/conf/distro$ sed -e 's/#.*//' -e '/^$/ d' emac-x86.conf
DISTRO_NAME = "EMAC"
EMAC_MAJOR = "0.0"
EMAC_MINOR = "0"
DISTRO_VERSION = "${EMAC_MAJOR}.${EMAC_MINOR}"
INHERIT += "package_ipk debian"
require conf/distro/include/sane-srcdates.inc
require conf/distro/include/sane-srcrevs.inc
require conf/distro/include/angstrom-2008-preferred-versions.inc
require conf/distro/include/preferred-opie-versions-1.2.4.inc
DISTRO_TYPE ?= "debug"
KERNEL = "kernel26"
MACHINE_KERNEL_VERSION = "2.6"
PCMCIA_MANAGER = "pcmciautils"
TARGET_OS = "linux"
PREFERRED_VERSION_linux-libc-headers    = "2.6.23"
PREFERRED_VERSION_glibc                 ?= "2.6.1"
PREFERRED_VERSION_glibc-initial         ?= "2.6.1"
PREFERRED_VERSION_uclibc                ?= "0.9.30"
PREFERRED_VERSION_uclibc-initial        ?= "0.9.30"
PREFERRED_PROVIDER_virtual/xserver  ?= "xserver-kdrive"
PREFERRED_PROVIDER_xserver          ?= "xserver-kdrive"
EMAC_GCC_VERSION                        ?= "4.2.4"
PREFERRED_VERSION_binutils      ?= "2.18.50.0.7"
PREFERRED_VERSION_binutils-cross        ?= "2.18.50.0.7"
PREFERRED_VERSION_binutils-cross-sdk    ?= "2.18.50.0.7"
PREFERRED_VERSION_gcc                    ?= "${EMAC_GCC_VERSION}"
PREFERRED_VERSION_gcc-cross              ?= "${EMAC_GCC_VERSION}"
PREFERRED_VERSION_gcc-cross-sdk          ?= "${EMAC_GCC_VERSION}"
PREFERRED_VERSION_gcc-cross-initial      ?= "${EMAC_GCC_VERSION}"
PREFERRED_VERSION_gcc-cross-intermediate ?= "${EMAC_GCC_VERSION}"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
PREFERRED_PROVIDER_hostap-conf                      ?= "hostap-conf"
PREFERRED_PROVIDER_hostap-modules_h2200             ?= "hostap-modules"
PREFERRED_PROVIDER_hostap-modules_hx4700            ?= "hostap-modules"
PREFERRED_PROVIDER_virtual/db           ?= "db"
PREFERRED_PROVIDER_virtual/db-native    ?= "db-native"
PREFERRED_PROVIDER_virtual/libsdl       ?= "libsdl-x11"
PREFERRED_PROVIDER_virtual/libx11       ?= "libx11"
PREFERRED_PROVIDER_virtual/libxine      ?= "libxine-x11"
PREFERRED_PROVIDER_virtual/xserver      ?= "xserver-kdrive"
PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
PREFERRED_PROVIDER_esound               ?= "pulseaudio"
PREFERRED_PROVIDER_gconf                ?= "gconf-dbus"
PREFERRED_PROVIDER_gnome-vfs            ?= "gnome-vfs"
PREFERRED_PROVIDER_gnome-vfs-plugin-file ?= "gnome-vfs"
PREFERRED_PROVIDER_tslib                ?= "tslib"
PREFERRED_PROVIDER_tslib-conf           ?= "tslib"
PREFERRED_PROVIDER_libgpewidget         ?= "libgpewidget"
PREFERRED_PROVIDER_ntp                  ?= "ntp"
PREFERRED_PROVIDER_hotplug               = "udev"
PREFERRED_PROVIDER_libxss                = "libxss"
PREFERRED_PROVIDER_bluez-utils-dbus      = "bluez-utils"
PREFERRED_PROVIDER_gtk+                   ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-ani  ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-bmpg ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-gif  ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-ico  ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-jpeg ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-pcx  ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-png  ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-pnm  ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-ras  ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-tga  ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-wbmp ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-xbm  ?= "gtk+"
PREFERRED_PROVIDER_gdk-pixbuf-loader-xpm  ?= "gtk+"
PREFERRED_VERSION_udev = "118"
PREFERRED_VERSION_busybox = "1.13.2"
DISTRO_LOGIN_MANAGER = "busybox"
PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
----

Thanks,

Travis



