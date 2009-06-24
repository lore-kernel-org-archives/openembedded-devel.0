Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MJYAc-0006M7-Iy
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 21:30:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id DE9A01422AA0;
	Wed, 24 Jun 2009 21:20:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UdqjHr5bRRUC; Wed, 24 Jun 2009 21:20:28 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id B12AD1416BA2;
	Wed, 24 Jun 2009 21:20:27 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jun 2009 21:18:56 +0200
Message-Id: <1245871136.5939.3.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: [PATCH] introduction of virtual/libusb0
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
X-List-Received-Date: Wed, 24 Jun 2009 19:30:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo.

I plan to submit attached patch to oe.dev to fix clash of libusb-compat
and libusb in recipes by introduction of virtual/libusb0.

libusb-compat and libusb provide exactly the same API and ABI using a
different back-end, and applications should work with both of them
without recompilation.

After the commit, distro maintainers will be encouraged to set:
PREFERRED_PROVIDER_virtual/libusb0 = "libusb-compat"

Following technical problems may happen with libusb0 applications:

- Application does not compile of fail on runtime linking with
libusb-compat: Badly written application (using internal functions
etc.), application needs fix.
gnuradio is known to be affected.

- Application does not work libusb-compat: Application depends on an
obscure aspect of libusb behavior. Report it and help with debugging.
With libusb-compat-1.0.2, there are no known defects of this type.

The commit will also remove hack recipes/libusb/libusb_0.0.0.bb.

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index f0b8a04..dff9320 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -140,6 +140,7 @@ PREFERRED_PROVIDER_virtual/db           ?= "db"
 PREFERRED_PROVIDER_virtual/db-native    ?= "db-native"
 PREFERRED_PROVIDER_virtual/libsdl       ?= "libsdl-x11"
 PREFERRED_PROVIDER_virtual/libx11       ?= "libx11"
+PREFERRED_PROVIDER_virtual/libusb0      ?= "libusb-compat"
 
 # Others:
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
@@ -158,6 +159,7 @@ PREFERRED_PROVIDER_bluez-utils-dbus      = "bluez-utils"
 PREFERRED_PROVIDER_bluez-libs            = "bluez4"
 PREFERRED_PROVIDER_bluez-utils           = "bluez4"
 
+
 # we don't ship gtk-directfb by default
 PREFERRED_PROVIDER_gtk+                   ?= "gtk+"
 PREFERRED_PROVIDER_gdk-pixbuf-loader-ani  ?= "gtk+"
diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
index 992235a..0eae85b 100644
--- a/conf/distro/include/preferred-slugos-versions.inc
+++ b/conf/distro/include/preferred-slugos-versions.inc
@@ -63,11 +63,5 @@ PREFERRED_VERSION_udev				?= "118"
 
 ##################### Stuff with special notes, and broken stuff:
 
-# Hack alert - selecting this version of libusb effectively selects
-# the use of libusb1 and libusb-compat in the case that something
-# still depends on libusb. This is required because otherwise
-# libusb will overwrite libusb-compat in staging.
-PREFERRED_VERSION_libusb			?= "0.0.0"
-
 # boost 1.36 won't build
 PREFERRED_VERSION_boost				?= "1.33.1"
diff --git a/recipes/0xFFFF/0xffff-native_0.1.bb b/recipes/0xFFFF/0xffff-native_0.1.bb
index 2530388..3e694eb 100644
--- a/recipes/0xFFFF/0xffff-native_0.1.bb
+++ b/recipes/0xFFFF/0xffff-native_0.1.bb
@@ -1,6 +1,6 @@
 require 0xffff.inc
 
-DEPENDS = "libusb-native"
+DEPENDS = "virtual/libusb0-native"
 
 inherit native
 
diff --git a/recipes/0xFFFF/0xffff-native_0.2.bb b/recipes/0xFFFF/0xffff-native_0.2.bb
index eb82cb4..be15c8e 100644
--- a/recipes/0xFFFF/0xffff-native_0.2.bb
+++ b/recipes/0xFFFF/0xffff-native_0.2.bb
@@ -1,6 +1,6 @@
 require 0xffff.inc
 
-DEPENDS = "libusb-native"
+DEPENDS = "virtual/libusb0-native"
 
 inherit native
 
diff --git a/recipes/bluez/bluez-utils.inc b/recipes/bluez/bluez-utils.inc
index 298650a..7c84f4e 100644
--- a/recipes/bluez/bluez-utils.inc
+++ b/recipes/bluez/bluez-utils.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Linux Bluetooth Stack Userland Utilities."
 SECTION = "console"
 PRIORITY = "optional"
-DEPENDS = "gstreamer gst-plugins-base bluez-libs-${PV} libusb-compat dbus cups"
+DEPENDS = "gstreamer gst-plugins-base bluez-libs-${PV} virtual/libusb0 dbus cups"
 PROVIDES = "bluez-utils-dbus"
 RPROVIDES_${PN} = "bluez-pan bluez-sdp bluez-utils-dbus"
 RREPLACES = "bluez-utils-dbus"
diff --git a/recipes/bluez/bluez-utils3.inc b/recipes/bluez/bluez-utils3.inc
index 5fab6e7..df071b7 100644
--- a/recipes/bluez/bluez-utils3.inc
+++ b/recipes/bluez/bluez-utils3.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Linux Bluetooth Stack Userland Utilities."
 SECTION = "console"
 PRIORITY = "optional"
-DEPENDS = "gstreamer gst-plugins-base bluez-libs-${PV} libusb-compat dbus glib-2.0"
+DEPENDS = "gstreamer gst-plugins-base bluez-libs-${PV} virtual/libusb0 dbus glib-2.0"
 PROVIDES = "bluez-utils-dbus"
 RPROVIDES_${PN} = "bluez-pan bluez-sdp bluez-utils-dbus"
 RREPLACES = "bluez-utils-dbus"
diff --git a/recipes/bluez/bluez.inc b/recipes/bluez/bluez.inc
index 711ac38..66c7d31 100644
--- a/recipes/bluez/bluez.inc
+++ b/recipes/bluez/bluez.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.bluez.org"
 LICENSE = "GPL"
 PR = "r0"
 
-DEPENDS = "gstreamer gst-plugins-base libusb1 dbus glib-2.0"
+DEPENDS = "gstreamer gst-plugins-base virtual/libusb0 dbus glib-2.0"
 PROVIDES = "bluez-utils-dbus"
 RPROVIDES_${PN} = "bluez-pan bluez-sdp bluez-utils-dbus"
 RREPLACES = "bluez-utils-dbus"
diff --git a/recipes/bluez/bluez4.inc b/recipes/bluez/bluez4.inc
index f9a72a5..4c3bfb8 100644
--- a/recipes/bluez/bluez4.inc
+++ b/recipes/bluez/bluez4.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Linux Bluetooth Stack Userland V4"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "gst-plugins-base alsa-lib libusb-compat dbus-glib"
+DEPENDS = "gst-plugins-base alsa-lib virtual/libusb0 dbus-glib"
 HOMEPAGE = "http://www.bluez.org"
 LICENSE = "GPL"
 INC_PR = "r1"
diff --git a/recipes/bluez/bluez4_4.31.bb b/recipes/bluez/bluez4_4.31.bb
index 8c2f656..ef35f1b 100644
--- a/recipes/bluez/bluez4_4.31.bb
+++ b/recipes/bluez/bluez4_4.31.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Linux Bluetooth Stack Userland V4"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "gst-plugins-base alsa-lib libusb-compat dbus-glib"
+DEPENDS = "gst-plugins-base alsa-lib virtual/libusb0 dbus-glib"
 HOMEPAGE = "http://www.bluez.org"
 LICENSE = "GPL"
 PR = "r6"
diff --git a/recipes/bluez/bluez4_4.35.bb b/recipes/bluez/bluez4_4.35.bb
index ce9c5a3..1049e8d 100644
--- a/recipes/bluez/bluez4_4.35.bb
+++ b/recipes/bluez/bluez4_4.35.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Linux Bluetooth Stack Userland V4"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "gst-plugins-base alsa-lib libusb-compat dbus-glib"
+DEPENDS = "gst-plugins-base alsa-lib virtual/libusb0 dbus-glib"
 HOMEPAGE = "http://www.bluez.org"
 LICENSE = "GPL"
 
diff --git a/recipes/bluez/bluez4_4.37.bb b/recipes/bluez/bluez4_4.37.bb
index c28f260..f860b80 100644
--- a/recipes/bluez/bluez4_4.37.bb
+++ b/recipes/bluez/bluez4_4.37.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Linux Bluetooth Stack Userland V4"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "gst-plugins-base alsa-lib libusb-compat dbus-glib"
+DEPENDS = "gst-plugins-base alsa-lib virtual/libusb0 dbus-glib"
 HOMEPAGE = "http://www.bluez.org"
 LICENSE = "GPL"
 
diff --git a/recipes/ccid/ccid_1.3.8.bb b/recipes/ccid/ccid_1.3.8.bb
index c2ade31..af0303b 100644
--- a/recipes/ccid/ccid_1.3.8.bb
+++ b/recipes/ccid/ccid_1.3.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pcsclite.alioth.debian.org/ccid.html"
 LICENSE = "GPL"
 PR = "r0"
 
-DEPENDS = "libusb pcsc-lite"
+DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS = "pcsc-lite"
 
 SRC_URI = "http://alioth.debian.org/download.php/2482/ccid-${PV}.tar.bz2"
diff --git a/recipes/dfu-util/dfu-util-native_svn.bb b/recipes/dfu-util/dfu-util-native_svn.bb
index ad0bece..6b1cf91 100644
--- a/recipes/dfu-util/dfu-util-native_svn.bb
+++ b/recipes/dfu-util/dfu-util-native_svn.bb
@@ -2,7 +2,7 @@ require dfu-util_${PV}.bb
 
 inherit native
 
-DEPENDS = "libusb-native usbpath-native"
+DEPENDS = "virtual/libusb0-native usbpath-native"
 
 do_stage() {
 	install -d ${STAGING_BINDIR_NATIVE}
diff --git a/recipes/dfu-util/dfu-util_svn.bb b/recipes/dfu-util/dfu-util_svn.bb
index 5cb95cb..17329b3 100644
--- a/recipes/dfu-util/dfu-util_svn.bb
+++ b/recipes/dfu-util/dfu-util_svn.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 PV = "0.1+svnr${SRCREV}"
 PR = "r2"
 
-DEPENDS = "libusb usbpath"
+DEPENDS = "virtual/libusb0 usbpath"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=dfu-util;proto=http"
 S = "${WORKDIR}/dfu-util"
diff --git a/recipes/emul/emul_1.0.5.bb b/recipes/emul/emul_1.0.5.bb
index 261c604..6e1bf99 100644
--- a/recipes/emul/emul_1.0.5.bb
+++ b/recipes/emul/emul_1.0.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "EarthMate Userland Library"
 SECTION = "libs/network"
 PRIORITY = "optional"
 LICENSE = "GPL"
-DEPENDS = "libusb ncurses"
+DEPENDS = "virtual/libusb0 ncurses"
 PR = "r1"
 
 SRC_URI = "http://download.berlios.de/emul/emul-${PV}.tar.gz"
diff --git a/recipes/ezx/ezx-boot-usb-native_svn.bb b/recipes/ezx/ezx-boot-usb-native_svn.bb
index 426ad4a..0615686 100644
--- a/recipes/ezx/ezx-boot-usb-native_svn.bb
+++ b/recipes/ezx/ezx-boot-usb-native_svn.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Boot a Motorola EZX device with a user supplied kernel"
-DEPENDS = "libusb-native virtual/kernel"
+DEPENDS = "virtual/libusb0-native virtual/kernel"
 SECTION = "devel"
 AUTHOR = "Team OpenEZX <openezx-devel@lists.openezx.org>"
 LICENSE = "GPL"
diff --git a/recipes/gnuradio/gnuradio.inc b/recipes/gnuradio/gnuradio.inc
index 80536e7..8a0ca54 100644
--- a/recipes/gnuradio/gnuradio.inc
+++ b/recipes/gnuradio/gnuradio.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "GNU Radio"
 SECTION =  "apps"
 PRIORITY = "optional"
 LICENSE = "GPLv3"
-DEPENDS = "libusb guile-native fftwf python virtual/libsdl alsa-lib jack boost cppunit sdcc-native swig-native python-numpy"
+DEPENDS = "virtual/libusb0 guile-native fftwf python virtual/libsdl alsa-lib jack boost cppunit sdcc-native swig-native python-numpy"
 INC_PR = "r7"
 
 inherit distutils-base autotools autotools_stage pkgconfig
diff --git a/recipes/gphoto2/libgphoto2_2.1.4.bb b/recipes/gphoto2/libgphoto2_2.1.4.bb
index fed7c41..8b1d2f2 100644
--- a/recipes/gphoto2/libgphoto2_2.1.4.bb
+++ b/recipes/gphoto2/libgphoto2_2.1.4.bb
@@ -1,5 +1,5 @@
 SECTION = "libs"
-DEPENDS = "jpeg libusb libexif"
+DEPENDS = "jpeg virtual/libusb0 libexif"
 DESCRIPTION = "libgphoto2 allows you to access digital cameras"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2"
diff --git a/recipes/gphoto2/libgphoto2_2.1.5.bb b/recipes/gphoto2/libgphoto2_2.1.5.bb
index 67efc38..0407039 100644
--- a/recipes/gphoto2/libgphoto2_2.1.5.bb
+++ b/recipes/gphoto2/libgphoto2_2.1.5.bb
@@ -1,6 +1,5 @@
 SECTION = "libs"
-DEPENDS = "jpeg libusb libexif"
-RPEDENDS = "libusb"
+DEPENDS = "jpeg virtual/libusb0 libexif"
 DESCRIPTION = "libgphoto2 allows you to access digital cameras"
 PR = "r3"
 
diff --git a/recipes/gphoto2/libgphoto2_2.1.6.bb b/recipes/gphoto2/libgphoto2_2.1.6.bb
index ad57ba8..e7df749 100644
--- a/recipes/gphoto2/libgphoto2_2.1.6.bb
+++ b/recipes/gphoto2/libgphoto2_2.1.6.bb
@@ -1,6 +1,5 @@
 SECTION = "libs"
-DEPENDS = "jpeg libusb libexif"
-RPEDENDS = "libusb"
+DEPENDS = "jpeg virtual/libusb0 libexif"
 DESCRIPTION = "libgphoto2 allows you to access digital cameras"
 PR = "r6"
 
diff --git a/recipes/gphoto2/libgphoto2_2.4.2.bb b/recipes/gphoto2/libgphoto2_2.4.2.bb
index 991f3ec..c5e54f5 100644
--- a/recipes/gphoto2/libgphoto2_2.4.2.bb
+++ b/recipes/gphoto2/libgphoto2_2.4.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libgphoto2 allows you to access digital cameras"
 
 SECTION = "libs"
 LICENSE = "GPL"
-DEPENDS = "libtool jpeg libusb libexif"
+DEPENDS = "libtool jpeg virtual/libusb0 libexif"
 
 PR = "r0"
 
diff --git a/recipes/gphoto2/libgphoto2_2.4.4.bb b/recipes/gphoto2/libgphoto2_2.4.4.bb
index d5eb039..7c93d52 100644
--- a/recipes/gphoto2/libgphoto2_2.4.4.bb
+++ b/recipes/gphoto2/libgphoto2_2.4.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "libgphoto2 allows you to access digital cameras"
 SECTION = "libs"
 LICENSE = "GPL"
-DEPENDS = "libtool jpeg libusb libexif"
+DEPENDS = "libtool jpeg virtual/libusb0 libexif"
 
 PR = "r0"
 
diff --git a/recipes/gpsbabel/gpsbabel_1.2.5.bb b/recipes/gpsbabel/gpsbabel_1.2.5.bb
index 987b000..625ecc6 100644
--- a/recipes/gpsbabel/gpsbabel_1.2.5.bb
+++ b/recipes/gpsbabel/gpsbabel_1.2.5.bb
@@ -1,6 +1,6 @@
 SECTION = "console/utils"
 DESCRIPTION = "GPS data converter"
-DEPENDS = "expat libusb"
+DEPENDS = "expat virtual/libusb0"
 HOMEPAGE = "http://gpsbabel.sf.net"
 LICENSE = "GPL"
 
diff --git a/recipes/gpsbabel/gpsbabel_1.3.6.bb b/recipes/gpsbabel/gpsbabel_1.3.6.bb
index e0888b5..dd4e768 100644
--- a/recipes/gpsbabel/gpsbabel_1.3.6.bb
+++ b/recipes/gpsbabel/gpsbabel_1.3.6.bb
@@ -1,6 +1,6 @@
 SECTION = "console/utils"
 DESCRIPTION = "GPS data converter"
-DEPENDS = "expat libusb-compat"
+DEPENDS = "expat virtual/libusb0"
 HOMEPAGE = "http://www.gpsbabel.org/"
 LICENSE = "GPL"
 
diff --git a/recipes/hal/hal.inc b/recipes/hal/hal.inc
index da24afe..72df07f 100644
--- a/recipes/hal/hal.inc
+++ b/recipes/hal/hal.inc
@@ -9,7 +9,7 @@ S = "${WORKDIR}/hal-${PV}"
 
 inherit autotools pkgconfig
 
-DEPENDS = "virtual/kernel util-linux-ng dbus-glib udev intltool intltool-native expat libusb gperf-native"
+DEPENDS = "virtual/kernel util-linux-ng dbus-glib udev intltool intltool-native expat virtual/libusb0 gperf-native"
 RDEPENDS += "hal-info udev-utils"
 RRECOMMENDS += "eject"
 
diff --git a/recipes/hal/hal_0.5.9.1.bb b/recipes/hal/hal_0.5.9.1.bb
index ecc98e1..b666446 100644
--- a/recipes/hal/hal_0.5.9.1.bb
+++ b/recipes/hal/hal_0.5.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://freedesktop.org/Software/hal"
 SECTION = "unknown"
 LICENSE = "GPL LGPL AFL"
 
-DEPENDS = "virtual/kernel dbus-glib udev intltool-native expat libusb-compat"
+DEPENDS = "virtual/kernel dbus-glib udev intltool-native expat virtual/libusb0"
 RDEPENDS_${PN} += "udev-utils hal-info"
 
 PR = "r9"
diff --git a/recipes/hal/hal_git.bb b/recipes/hal/hal_git.bb
index 5fcd743..8bd8285 100644
--- a/recipes/hal/hal_git.bb
+++ b/recipes/hal/hal_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL LGPL AFL"
 
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS = "virtual/kernel dbus-glib udev intltool-native expat libusb-compat"
+DEPENDS = "virtual/kernel dbus-glib udev intltool-native expat virtual/libusb0"
 RDEPENDS_${PN} += "udev-utils hal-info"
 
 SRC_URI = "git://anongit.freedesktop.org/hal/;protocol=git \
diff --git a/recipes/lcd4linux/lcd4linux_0.10.0.bb b/recipes/lcd4linux/lcd4linux_0.10.0.bb
index fe73954..7764f2b 100644
--- a/recipes/lcd4linux/lcd4linux_0.10.0.bb
+++ b/recipes/lcd4linux/lcd4linux_0.10.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "LCD4Linux is a small program that grabs information from the kernel and some subsystems and displays it on an external liquid crystal display."
 LICENSE = "GPLv2"
 
-DEPENDS = "libusb-compat ncurses readline virtual/libx11"
+DEPENDS = "virtual/libusb0 ncurses readline virtual/libx11"
 
 PV = "0.10.0+0.10.1-RC2"
 PR = "r4"
diff --git a/recipes/lcd4linux/lcd4linux_0.11.0-SVN.bb b/recipes/lcd4linux/lcd4linux_0.11.0-SVN.bb
index 01471bd..b105aea 100644
--- a/recipes/lcd4linux/lcd4linux_0.11.0-SVN.bb
+++ b/recipes/lcd4linux/lcd4linux_0.11.0-SVN.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "LCD4Linux is a small program that grabs information from the kernel and some subsystems and displays it on an external liquid crystal display."
 LICENSE = "GPLv2"
 
-DEPENDS = "libusb-compat ncurses readline virtual/libx11"
+DEPENDS = "virtual/libusb0 ncurses readline virtual/libx11"
 
 PV = "0.11.0-SVN"
 PR = "r0"
diff --git a/recipes/lcdproc/lcdproc5.inc b/recipes/lcdproc/lcdproc5.inc
index de704bc..8aeba90 100644
--- a/recipes/lcdproc/lcdproc5.inc
+++ b/recipes/lcdproc/lcdproc5.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://lcdproc.org"
 SECTION = "utils"
 PRIORITY = "optional"
 LICENSE = "GPL"
-DEPENDS = "libusb ncurses"
+DEPENDS = "virtual/libusb0 ncurses"
 RRECOMMENDS_lcdproc = "lcdd"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcdproc/${P}.tar.gz"
diff --git a/recipes/libftdi/libftdi-native_0.13.bb b/recipes/libftdi/libftdi-native_0.13.bb
index 24f8277..e69e320 100644
--- a/recipes/libftdi/libftdi-native_0.13.bb
+++ b/recipes/libftdi/libftdi-native_0.13.bb
@@ -2,4 +2,4 @@ require libftdi_${PV}.bb
 
 inherit native
 
-DEPENDS = "libusb-native"
+DEPENDS = "virtual/libusb0-native"
diff --git a/recipes/libftdi/libftdi-native_0.9.bb b/recipes/libftdi/libftdi-native_0.9.bb
index 24f8277..e69e320 100644
--- a/recipes/libftdi/libftdi-native_0.9.bb
+++ b/recipes/libftdi/libftdi-native_0.9.bb
@@ -2,4 +2,4 @@ require libftdi_${PV}.bb
 
 inherit native
 
-DEPENDS = "libusb-native"
+DEPENDS = "virtual/libusb0-native"
diff --git a/recipes/libftdi/libftdi_0.13.bb b/recipes/libftdi/libftdi_0.13.bb
index 3e787ca..b336454 100644
--- a/recipes/libftdi/libftdi_0.13.bb
+++ b/recipes/libftdi/libftdi_0.13.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.intra2net.com/de/produkte/opensource/ftdi/"
 LICENSE = "LGPL"
 SECTION = "libs"
 
-DEPENDS = "libusb"
+DEPENDS = "virtual/libusb0"
 
 SRC_URI = "http://www.intra2net.com/de/produkte/opensource/ftdi/TGZ/libftdi-${PV}.tar.gz \
 	   file://autotools.patch;patch=1 \
diff --git a/recipes/libftdi/libftdi_0.9.bb b/recipes/libftdi/libftdi_0.9.bb
index f7426ce..a8cab45 100644
--- a/recipes/libftdi/libftdi_0.9.bb
+++ b/recipes/libftdi/libftdi_0.9.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libftdi is a library (using libusb) to talk to FTDI's \
 FT232BM, FT245BM and FT2232C type chips including the popular bitbang mode."
 HOMEPAGE = "http://www.intra2net.com/de/produkte/opensource/ftdi"
 LICENSE = "GPL"
-DEPENDS = "libusb"
+DEPENDS = "virtual/libusb0"
 
 SRC_URI = "http://www.intra2net.com/de/produkte/opensource/ftdi/TGZ/libftdi-${PV}.tar.gz \
            file://doxygen-configure.patch;patch=1"
diff --git a/recipes/libg15/libg15_1.2.1.bb b/recipes/libg15/libg15_1.2.1.bb
index 930cfe8..85b02a3 100644
--- a/recipes/libg15/libg15_1.2.1.bb
+++ b/recipes/libg15/libg15_1.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://g15tools.sourceforge.net"
 LICENSE = "GPLv2"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "libusb"
+DEPENDS = "virtual/libusb0"
 PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/g15tools/libg15-${PV}.tar.bz2"
diff --git a/recipes/libgphoto2/libgphoto2_2.4.0.bb b/recipes/libgphoto2/libgphoto2_2.4.0.bb
index c6f6337..ca51f98 100644
--- a/recipes/libgphoto2/libgphoto2_2.4.0.bb
+++ b/recipes/libgphoto2/libgphoto2_2.4.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libgphoto2 allows you to access digital cameras"
 
 SECTION = "libs"
 LICENSE = "GPL"
-DEPENDS = "libtool jpeg libusb libexif"
+DEPENDS = "libtool jpeg virtual/libusb0 libexif"
 
 PR = "r0"
 
diff --git a/recipes/librfid/librfid_svn.bb b/recipes/librfid/librfid_svn.bb
index 78800de..f687985 100644
--- a/recipes/librfid/librfid_svn.bb
+++ b/recipes/librfid/librfid_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "RFID library"
 SECTION = "devel"
 PRIORITY = "optional"
 LICENSE = "GPL"
-DEPENDS = "libusb"
+DEPENDS = "virtual/libusb0"
 SRCNAME = "librfid"
 
 PV = "0.2.0+svnr${SRCREV}"
diff --git a/recipes/libusb/libusb-compat_0.0.9+0.1.0-beta2.bb b/recipes/libusb/libusb-compat_0.0.9+0.1.0-beta2.bb
index 34cc1ac..aa64428 100644
--- a/recipes/libusb/libusb-compat_0.0.9+0.1.0-beta2.bb
+++ b/recipes/libusb/libusb-compat_0.0.9+0.1.0-beta2.bb
@@ -3,6 +3,7 @@ access to USB devices."
 HOMEPAGE = "http://libusb.sf.net"
 SECTION = "libs"
 LICENSE = "LGPL"
+PROVIDES = "virtual/libusb0"
 
 PE = "1"
 PR = "r0"
diff --git a/recipes/libusb/libusb-compat_0.1.0.bb b/recipes/libusb/libusb-compat_0.1.0.bb
index 4869440..9fcff0d 100644
--- a/recipes/libusb/libusb-compat_0.1.0.bb
+++ b/recipes/libusb/libusb-compat_0.1.0.bb
@@ -3,6 +3,7 @@ access to USB devices."
 HOMEPAGE = "http://libusb.sf.net"
 SECTION = "libs"
 LICENSE = "LGPL"
+PROVIDES = "virtual/libusb0"
 
 PE = "1"
 PR = "r0"
diff --git a/recipes/libusb/libusb-native_0.1.10a.bb b/recipes/libusb/libusb-native_0.1.10a.bb
index a76768c..a2eb061 100644
--- a/recipes/libusb/libusb-native_0.1.10a.bb
+++ b/recipes/libusb/libusb-native_0.1.10a.bb
@@ -1,4 +1,5 @@
 require libusb_${PV}.bb
 inherit native
+PROVIDES = "virtual/libusb0-native"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libusb-0.1.10a"
diff --git a/recipes/libusb/libusb-native_0.1.12.bb b/recipes/libusb/libusb-native_0.1.12.bb
index 637ded2..2efe2ee 100644
--- a/recipes/libusb/libusb-native_0.1.12.bb
+++ b/recipes/libusb/libusb-native_0.1.12.bb
@@ -1,3 +1,3 @@
 require libusb_${PV}.bb
 inherit native
-
+PROVIDES = "virtual/libusb0-native"
diff --git a/recipes/libusb/libusb_0.0.0.bb b/recipes/libusb/libusb_0.0.0.bb
index fe45956..09224fa 100644
--- a/recipes/libusb/libusb_0.0.0.bb
+++ b/recipes/libusb/libusb_0.0.0.bb
@@ -24,4 +24,4 @@ the replacement for libusb."
 
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS = "libusb-compat"
+DEPENDS = "virtual/libusb0"
diff --git a/recipes/libusb/libusb_0.1.10a.bb b/recipes/libusb/libusb_0.1.10a.bb
index 8648f96..a1334c5 100644
--- a/recipes/libusb/libusb_0.1.10a.bb
+++ b/recipes/libusb/libusb_0.1.10a.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "libusb is a library to provide userspace \
 access to USB devices."
 SECTION = "libs"
 LICENSE = "LGPL"
+PROVIDES = "virtual/libusb0"
 PR = "r7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.gz \
diff --git a/recipes/libusb/libusb_0.1.12.bb b/recipes/libusb/libusb_0.1.12.bb
index 3d6a213..75bc88c 100644
--- a/recipes/libusb/libusb_0.1.12.bb
+++ b/recipes/libusb/libusb_0.1.12.bb
@@ -3,6 +3,7 @@ access to USB devices."
 HOMEPAGE = "http://libusb.sf.net"
 SECTION = "libs"
 LICENSE = "LGPL"
+PROVIDES = "virtual/libusb0"
 PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.gz \
diff --git a/recipes/nut/nut_2.2.1.bb b/recipes/nut/nut_2.2.1.bb
index db33674..2e35bd2 100644
--- a/recipes/nut/nut_2.2.1.bb
+++ b/recipes/nut/nut_2.2.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Network UPS Tools"
 LICENSE = "GPL"
-DEPENDS = "libusb"
+DEPENDS = "virtual/libusb0"
 PR = "r1"
 
 inherit autotools
diff --git a/recipes/obexftp/obexftp_0.22.bb b/recipes/obexftp/obexftp_0.22.bb
index 89e10a7..b9c6ad3 100644
--- a/recipes/obexftp/obexftp_0.22.bb
+++ b/recipes/obexftp/obexftp_0.22.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "OBEX Ftp Client based on openobex."
 SECTION = "console/network"
 HOMEPAGE = "http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp"
 LICENSE = "GPL"
-DEPENDS = "openobex bluez-libs libusb virtual/libiconv"
+DEPENDS = "openobex bluez-libs virtual/libusb0 virtual/libiconv"
 PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/openobex/obexftp-${PV}.tar.bz2 \
diff --git a/recipes/obexftp/obexftp_0.23.bb b/recipes/obexftp/obexftp_0.23.bb
index 037fbbf..c37be4b 100644
--- a/recipes/obexftp/obexftp_0.23.bb
+++ b/recipes/obexftp/obexftp_0.23.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "OBEX Ftp Client based on openobex."
 SECTION = "console/network"
 HOMEPAGE = "http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp"
 LICENSE = "GPL"
-DEPENDS = "openobex bluez-libs libusb-compat virtual/libiconv"
+DEPENDS = "openobex bluez-libs virtual/libusb0 virtual/libiconv"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/openobex/obexftp-${PV}.tar.bz2 \
 	  "
diff --git a/recipes/openobex/openobex_1.2.bb b/recipes/openobex/openobex_1.2.bb
index 41648ca..9ddb7a3 100644
--- a/recipes/openobex/openobex_1.2.bb
+++ b/recipes/openobex/openobex_1.2.bb
@@ -3,7 +3,7 @@ Object Exchange (OBEX) protocol."
 HOMEPAGE = "http://openobex.triq.net"
 SECTION = "libs"
 PROVIDES = "openobex-apps"
-DEPENDS = "libusb bluez-libs"
+DEPENDS = "virtual/libusb0 bluez-libs"
 LICENSE = "GPL"
 PR = "r5"
 
diff --git a/recipes/openobex/openobex_1.3.bb b/recipes/openobex/openobex_1.3.bb
index 65e98e4..f1c3124 100644
--- a/recipes/openobex/openobex_1.3.bb
+++ b/recipes/openobex/openobex_1.3.bb
@@ -3,7 +3,7 @@ Object Exchange (OBEX) protocol."
 HOMEPAGE = "http://openobex.triq.net"
 SECTION = "libs"
 PROVIDES = "openobex-apps"
-DEPENDS = "libusb bluez-libs"
+DEPENDS = "virtual/libusb0 bluez-libs"
 LICENSE = "GPL"
 PR = "r0"
 
diff --git a/recipes/openobex/openobex_1.5.bb b/recipes/openobex/openobex_1.5.bb
index e692d4c..61c3708 100644
--- a/recipes/openobex/openobex_1.5.bb
+++ b/recipes/openobex/openobex_1.5.bb
@@ -3,7 +3,7 @@ Object Exchange (OBEX) protocol."
 HOMEPAGE = "http://openobex.triq.net"
 SECTION = "libs"
 PROVIDES = "openobex-apps"
-DEPENDS = "libusb-compat bluez-libs"
+DEPENDS = "virtual/libusb0 bluez-libs"
 LICENSE = "GPL"
 PR = "r1"
 
diff --git a/recipes/owfs/owfs_2.7p21.bb b/recipes/owfs/owfs_2.7p21.bb
index b195054..44fc878 100644
--- a/recipes/owfs/owfs_2.7p21.bb
+++ b/recipes/owfs/owfs_2.7p21.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.owfs.org/"
 SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
-DEPENDS += "fuse libusb"
+DEPENDS += "fuse virtual/libusb0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
            file://owhttpd \
diff --git a/recipes/python/python-pyusb_0.4.1.bb b/recipes/python/python-pyusb_0.4.1.bb
index 9ed3955..5f70182 100644
--- a/recipes/python/python-pyusb_0.4.1.bb
+++ b/recipes/python/python-pyusb_0.4.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libusb Python Bindings"
 SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "BSD"
-DEPENDS = "libusb"
+DEPENDS = "virtual/libusb0"
 SRCNAME = "pyusb"
 PR = "r1"
 
diff --git a/recipes/samsung-soc-utils/s3c2410-boot-usb-native_svn.bb b/recipes/samsung-soc-utils/s3c2410-boot-usb-native_svn.bb
index 675d07c..d839bb8 100644
--- a/recipes/samsung-soc-utils/s3c2410-boot-usb-native_svn.bb
+++ b/recipes/samsung-soc-utils/s3c2410-boot-usb-native_svn.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Boots a S3C2410 device with a user supplied kernel zImage"
-DEPENDS = "libusb-native"
+DEPENDS = "virtual/libusb0-native"
 SECTION = "devel"
 AUTHOR = "Harald Welte <laforge@openmoko.org>"
 LICENSE = "GPL"
diff --git a/recipes/sane/sane-backends_1.0.19.bb b/recipes/sane/sane-backends_1.0.19.bb
index 95ce49e..935541f 100644
--- a/recipes/sane/sane-backends_1.0.19.bb
+++ b/recipes/sane/sane-backends_1.0.19.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Scanner drivers for SANE"
-DEPENDS = "hal gphoto2 jpeg libusb"
+DEPENDS = "hal gphoto2 jpeg virtual/libusb0"
 LICENSE = "LGPL"
 
 SRC_URI = "http://alioth.debian.org/frs/download.php/2318/sane-backends-${PV}.tar.gz \
diff --git a/recipes/sdr/hamlib_1.2.9.bb b/recipes/sdr/hamlib_1.2.9.bb
index 8815c62..b959cee 100644
--- a/recipes/sdr/hamlib_1.2.9.bb
+++ b/recipes/sdr/hamlib_1.2.9.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Ham Radio Control Libraries, Hamlib for short, is a development effort to provide a consistent interface for programmers wanting to incorporate radio control in their programs"
 LICENSE = "GPLv2"
 
-DEPENDS = "swig-native perl python libusb-compat tcl gnuradio"
+DEPENDS = "swig-native perl python virtual/libusb0 tcl gnuradio"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hamlib/hamlib-${PV}.tar.gz"
 
diff --git a/recipes/usbpath/usbpath-native_svn.bb b/recipes/usbpath/usbpath-native_svn.bb
index 3b5ef7b..866e877 100644
--- a/recipes/usbpath/usbpath-native_svn.bb
+++ b/recipes/usbpath/usbpath-native_svn.bb
@@ -1,6 +1,6 @@
 require usbpath_svn.bb
 inherit native
-DEPENDS = "libusb-native"
+DEPENDS = "virtual/libusb0-native"
 
 do_stage () {
 	autotools_stage_all
diff --git a/recipes/usbpath/usbpath_svn.bb b/recipes/usbpath/usbpath_svn.bb
index 01ef343..d21d320 100644
--- a/recipes/usbpath/usbpath_svn.bb
+++ b/recipes/usbpath/usbpath_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Convert the physical locations of a USB device to/from its number
 AUTHOR = "Werner Almesberger <werner@openmoko.org>"
 SECTION = "console/utils"
 LICENSE = "GPL"
-DEPENDS = "libusb-compat"
+DEPENDS = "virtual/libusb0"
 
 PV = "0.0+svnr${SRCREV}"
 
diff --git a/recipes/usbutils/usbutils_0.70.bb b/recipes/usbutils/usbutils_0.70.bb
index 891d66f..7ec2327 100644
--- a/recipes/usbutils/usbutils_0.70.bb
+++ b/recipes/usbutils/usbutils_0.70.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Host side USB console utilities."
 SECTION = "base"
-DEPENDS += "libusb-compat"
+DEPENDS += "virtual/libusb0"
 LICENSE = "GPL"
 PRIORITY = "optional"
 DEFAULT_PREFERENCE = "1"
diff --git a/recipes/usbutils/usbutils_0.73.bb b/recipes/usbutils/usbutils_0.73.bb
index 3ec4ade..ebbc306 100644
--- a/recipes/usbutils/usbutils_0.73.bb
+++ b/recipes/usbutils/usbutils_0.73.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Host side USB console utilities."
 SECTION = "base"
-DEPENDS += "libusb-compat"
+DEPENDS += "virtual/libusb0"
 LICENSE = "GPL"
 PRIORITY = "optional"
 DEFAULT_PREFERENCE = "1"
diff --git a/recipes/usbutils/usbutils_0.82.bb b/recipes/usbutils/usbutils_0.82.bb
index c921a4a..436331d 100644
--- a/recipes/usbutils/usbutils_0.82.bb
+++ b/recipes/usbutils/usbutils_0.82.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Host side USB console utilities."
 SECTION = "base"
-DEPENDS += "libusb-compat"
+DEPENDS += "virtual/libusb0"
 LICENSE = "GPL"
 PRIORITY = "optional"
 
diff --git a/recipes/usbutils/usbutils_cvs.bb b/recipes/usbutils/usbutils_cvs.bb
index 5de33bb..9ef25c4 100644
--- a/recipes/usbutils/usbutils_cvs.bb
+++ b/recipes/usbutils/usbutils_cvs.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Host side USB console utilities."
 SECTION = "base"
-DEPENDS += "libusb-compat"
+DEPENDS += "virtual/libusb0"
 LICENSE = "GPL"
 PRIORITY = "optional"
 PV = "0.71+cvs${SRCDATE}"
diff --git a/recipes/usrp/usrp_0.12.bb b/recipes/usrp/usrp_0.12.bb
index 55ca848..6302080 100644
--- a/recipes/usrp/usrp_0.12.bb
+++ b/recipes/usrp/usrp_0.12.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Support software for the Universal Software Radio Peripheral (USR
 LICENSE = "GPL"
 HOMEPAGE = "http://comsec.com/wiki?UniversalSoftwareRadioPeripheral"
 SECTION = "devel"
-DEPENDS = "swig-native sdcc-native libusb-compat python boost"
+DEPENDS = "swig-native sdcc-native virtual/libusb0 python boost"
 RDEPENDS = "python-core"
 PR = "r1"
 




