Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhNqk-0007WS-TQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 17:29:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2011 08:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,529,1304319600"; d="scan'208";a="25856512"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.207])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2011 08:25:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jul 2011 16:25:08 +0100
Message-Id: <972c7cd711b5b09a9bda9c384f043202d1c4a4e8.1310656986.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310656986.git.paul.eggleton@linux.intel.com>
References: <cover.1310656986.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310656986.git.paul.eggleton@linux.intel.com>
References: <cover.1310656986.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 1/3] Drop PRIORITY variable
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
X-List-Received-Date: Thu, 14 Jul 2011 15:29:16 -0000

As discussed on the mailing list, this variable isn't useful and if wanted
would be better implemented by distros using pn-X overrides.

This patch executes:

find . -regex ".*\.\(bb\|inc\)$" | xargs sed -i '/^PRIORITY = ".*"$/d'

against the tree removing the references. Thanks to Phil Blundell for
the command.

(Prompted by oe-core rev: d122343362669c683acc4af295971a62cbc823fc)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb      |    1 -
 meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb |    1 -
 .../libgpewidget/libgpewidget_0.117.bb             |    1 -
 .../bluez/bluez-hcidump_2.0.bb                     |    1 -
 meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb  |    1 -
 meta-oe/recipes-connectivity/iw/iw_0.9.20.bb       |    1 -
 meta-oe/recipes-core/libcgroup/libcgroup_0.36.2.bb |    1 -
 meta-oe/recipes-core/systemd/systemd_git.bb        |    1 -
 .../recipes-devtools/libfribidi/fribidi_0.19.2.bb  |    1 -
 .../python/python-argparse_1.2.1.bb                |    1 -
 .../python/python-cheetah_2.4.4.bb                 |    1 -
 .../recipes-devtools/python/python-cython_0.13.bb  |    1 -
 .../python/python-dateutil_1.4.1.bb                |    1 -
 .../recipes-devtools/python/python-numeric_24.2.bb |    1 -
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    1 -
 .../recipes-devtools/python/python-pexpect_2.3.bb  |    1 -
 .../python/python-pyalsaaudio_0.4.bb               |    1 -
 .../recipes-devtools/python/python-pyserial_2.4.bb |    1 -
 .../python/python-setuptools_0.6c11.bb             |    1 -
 .../python/python-vobject_0.8.1c.bb                |    1 -
 meta-oe/recipes-extended/tzdata/tzdata.inc         |    1 -
 meta-oe/recipes-graphics/cairo/cairo.inc           |    1 -
 meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc  |    1 -
 meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb   |    1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |    1 -
 meta-oe/recipes-graphics/xorg-lib/pixman.inc       |    1 -
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    1 -
 .../foxtrotgps/foxtrotgps_1.0.1.bb                 |    1 -
 meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb       |    1 -
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |    1 -
 meta-oe/recipes-qt/qt4/qmake2.inc                  |    1 -
 meta-oe/recipes-support/atk/atk.inc                |    1 -
 meta-oe/recipes-support/atk/atk_1.30.0.bb          |    1 -
 .../ca-certificates_20090814+nmu2.bb               |    1 -
 meta-oe/recipes-support/check/check_0.9.5.bb       |    1 -
 meta-oe/recipes-support/evtest/evtest_1.25.bb      |    1 -
 meta-oe/recipes-support/fftw/benchfft_3.1.bb       |    1 -
 meta-oe/recipes-support/fftw/fftw.inc              |    1 -
 meta-oe/recipes-support/flite/flite.inc            |    1 -
 meta-oe/recipes-support/htop/htop_0.9.bb           |    1 -
 meta-oe/recipes-support/inih/libinih_git.bb        |    1 -
 meta-oe/recipes-support/libgcrypt/libgcrypt.inc    |    1 -
 meta-oe/recipes-support/libiconv/libiconv.inc      |    1 -
 .../libsdl-ttf/libsdl-ttf_2.0.10.bb                |    1 -
 .../recipes-support/nfs-utils/nfs-utils_1.1.2.bb   |    1 -
 meta-oe/recipes-support/ntp/ntp.inc                |    1 -
 .../recipes-support/portaudio/portaudio-v19_svn.bb |    1 -
 meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb    |    1 -
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    1 -
 meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb   |    1 -
 50 files changed, 0 insertions(+), 50 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb
index 945290c..712ca87 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb
@@ -4,7 +4,6 @@ set of widgets, GTK+ is suitable for projects ranging from small one-off project
 HOMEPAGE = "http://www.gtk.org"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
-PRIORITY = "optional"
 
 DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
            gtk-doc-native docbook-utils-native libxrandr libgcrypt \
diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
index cc889c7..9577f2f 100644
--- a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
+++ b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "A GPE application that allows you to take screenshots."
 SECTION = "gpe"
-PRIORITY = "optional"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
index ca5b66c..cacf28b 100644
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "libgpewidget contains a collection of widgets and other common code shared by many GPE applications."
 SECTION = "gpe/libs"
-PRIORITY = "optional"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
index 7ad8eef..f269045 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "The hcidump tool reads raw HCI data coming from and going to a Bl
 and displays the commands, events and data in a human-readable form."
 
 SECTION = "console"
-PRIORITY = "optional"
 DEPENDS = "bluez4"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb
index 5e3a557..ab85776 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb
@@ -2,7 +2,6 @@ SUMMARY = "Linux Bluetooth Stack Userland V4"
 DESCRIPTION = "Linux Bluetooth stack V4 userland components.  These include a system configurations, daemons, tools and system libraries."
 HOMEPAGE = "http://www.bluez.org"
 SECTION = "libs"
-PRIORITY = "optional"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
diff --git a/meta-oe/recipes-connectivity/iw/iw_0.9.20.bb b/meta-oe/recipes-connectivity/iw/iw_0.9.20.bb
index 3e1b09b..0b66e8d 100644
--- a/meta-oe/recipes-connectivity/iw/iw_0.9.20.bb
+++ b/meta-oe/recipes-connectivity/iw/iw_0.9.20.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "nl80211 based CLI configuration utility for wireless devices"
 HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
 SECTION = "base"
-PRIORITY = "optional"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
 
diff --git a/meta-oe/recipes-core/libcgroup/libcgroup_0.36.2.bb b/meta-oe/recipes-core/libcgroup/libcgroup_0.36.2.bb
index 8d2a099..bf4675e 100644
--- a/meta-oe/recipes-core/libcgroup/libcgroup_0.36.2.bb
+++ b/meta-oe/recipes-core/libcgroup/libcgroup_0.36.2.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Libcgroup"
-PRIORITY = "optional"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index ebb8e7f..acab23c 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -8,7 +8,6 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
 
-PRIORITY = "optional"
 SECTION = "base/shell"
 
 inherit gitpkgv
diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
index fd4ef7a..71858e3 100644
--- a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
+++ b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Fribidi library for bidirectional text"
 SECTION = "libs"
-PRIORITY = "optional"
 PR = "r1"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta-oe/recipes-devtools/python/python-argparse_1.2.1.bb b/meta-oe/recipes-devtools/python/python-argparse_1.2.1.bb
index a026a25..a74c533 100644
--- a/meta-oe/recipes-devtools/python/python-argparse_1.2.1.bb
+++ b/meta-oe/recipes-devtools/python/python-argparse_1.2.1.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Python command-line parsing library"
 SECTION = "devel/python"
-PRIORITY = "optional"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=09d08bb5b7047e2688ea3faad6408aa8"
 SRCNAME = argparse
diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
index 30c3d47..e1a4053 100644
--- a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Python template engine and code generation tool"
 SECTION = "devel/python"
-PRIORITY = "optional"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aff1107514aa6aae948f9fe71fdc393b"
 
diff --git a/meta-oe/recipes-devtools/python/python-cython_0.13.bb b/meta-oe/recipes-devtools/python/python-cython_0.13.bb
index f705756..b547de6 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.13.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.13.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Cython is a language specially designed for writing Python extens
 It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
 and the messy, low-level world of C."
 SECTION = "devel/python"
-PRIORITY = "optional"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 SRCNAME = "Cython"
diff --git a/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb b/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
index 8cde288..e69b946 100644
--- a/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "Extensions to the standard Python date/time support"
 HOMEPAGE = "http://labix.org/python-dateutil"
 SECTION = "devel/python"
-PRIORITY = "optional"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d82268718c68bda0b091006ec6e583c6"
 SRCNAME = "${PN}"
diff --git a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb b/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
index 436718f..1bee01d 100644
--- a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
+++ b/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
-PRIORITY = "optional"
 LICENSE = "PSF & LLNL"
 LIC_FILES_CHKSUM = "file://Legal.htm;md5=e3ce75dedd4043918d15979ae43e312e"
 
diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index ed47f47..44d60b1 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
-PRIORITY = "optional"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3c42211d73c3faa1026e671dd39883fa"
 
diff --git a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb b/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
index 8111ba3..c4d7486 100644
--- a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "A Pure Python Expect like Module for Python"
 SECTION = "devel/python"
-PRIORITY = "optional"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04a2bf11b85ce49d4a8c0c413fd34404"
 SRCNAME = "pexpect"
diff --git a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb b/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
index 5a6dd54..2c3a622 100644
--- a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
+++ b/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "Support for the Linux 2.6.x ALSA Sound System"
 SECTION = "devel/python"
 DEPENDS = "alsa-lib"
-PRIORITY = "optional"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 SRCNAME = "pyalsaaudio"
diff --git a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb b/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
index cc138d1..4684744 100644
--- a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
+++ b/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Serial Port Support for Python"
 SECTION = "devel/python"
-PRIORITY = "optional"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7424386ffe323e815ee62ee9ad591dd8"
 SRCNAME = "pyserial"
diff --git a/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb
index 6b17a41..ca7335e 100644
--- a/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ b/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
 HOMEPAGE = "http://cheeseshop.python.org/pypi/setuptools"
 SECTION = "devel/python"
-PRIORITY = "optional"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=23;endline=23;md5=8a314270dd7a8dbca741775415f1716e"
 
diff --git a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb b/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
index 6b7e7a4..85affe8 100644
--- a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
+++ b/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Python package for parsing and generating vCard and vCalendar files" 
 SECTION = "devel/python" 
-PRIORITY = "optional" 
 LICENSE = "Apache License V2.0" 
 LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 HOMEPAGE = "http://vobject.skyhouseconsulting.com/" 
diff --git a/meta-oe/recipes-extended/tzdata/tzdata.inc b/meta-oe/recipes-extended/tzdata/tzdata.inc
index 6739b59..ceec924 100644
--- a/meta-oe/recipes-extended/tzdata/tzdata.inc
+++ b/meta-oe/recipes-extended/tzdata/tzdata.inc
@@ -1,6 +1,5 @@
 DESCRIPTION = "Timezone data"
 SECTION = "base"
-PRIORITY = "optional"
 DEPENDS = "tzcode-native"
 
 INC_PR = "r10"
diff --git a/meta-oe/recipes-graphics/cairo/cairo.inc b/meta-oe/recipes-graphics/cairo/cairo.inc
index 42774e0..6157004 100644
--- a/meta-oe/recipes-graphics/cairo/cairo.inc
+++ b/meta-oe/recipes-graphics/cairo/cairo.inc
@@ -1,5 +1,4 @@
 SECTION = "libs"
-PRIORITY = "optional"
 DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
 DESCRIPTION = "Cairo graphics library"
 LICENSE = "MPL LGPL"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc
index 8c458e2..92627e3 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc
@@ -1,6 +1,5 @@
 DESCRIPTION = "Simple DirectMedia Layer (DirectFB and Framebuffer support)"
 SECTION = "libs"
-PRIORITY = "optional"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb b/meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb
index ecf2dd1..449e769 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "C++ bindings for the pango library."
 SECTION = "libs"
-PRIORITY = "optional"
 LICENSE = "LGPL"
 DEPENDS = "mm-common cairomm glibmm"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
index 978d2f4..bba94bd 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
@@ -1,6 +1,5 @@
 DESCRIPTION ?= "TrueType font package ${PN}"
 SECTION = "fonts"
-PRIORITY = "optional"
 # don't use RRECOMMENDS_${PN} here because sometimes each font is packaged to separate package and each one needs this dep to call update-fonts
 RRECOMMENDS += "font-update-common"
 
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman.inc b/meta-oe/recipes-graphics/xorg-lib/pixman.inc
index 5661fae..f77c6a8 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman.inc
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman.inc
@@ -1,5 +1,4 @@
 SECTION = "libs"
-PRIORITY = "optional"
 DESCRIPTION = "Low-level pixel manipulation library."
 LICENSE = "X11"
 
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index eb53a4d..de378e6 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PRIORITY = "optional"
 RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
 DEFAULT_PREFERENCE = "-1"
 PR = "r5"
diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb
index 8b685ac..c517f08 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "http://www.foxtrotgps.org/"
 SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-PRIORITY = "optional"
 DEPENDS = "curl gtk+ gconf libglade sqlite3 libexif gpsd"
 
 SRC_URI = "http://www.foxtrotgps.org/releases/${P}.tar.gz"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb b/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
index a674119..c65f538 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
-PRIORITY = "optional"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus-glib ncurses python libusb1"
diff --git a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
index a5706d3..d583637 100644
--- a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
+++ b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "http://tangogps.org/"
 SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-PRIORITY = "optional"
 DEPENDS = "curl gtk+ gconf sqlite3 libexif libsoup-2.4"
 
 SRC_URI = "http://www.tangogps.org/downloads/${P}.tar.gz"
diff --git a/meta-oe/recipes-qt/qt4/qmake2.inc b/meta-oe/recipes-qt/qt4/qmake2.inc
index d38e83e..6ede742 100644
--- a/meta-oe/recipes-qt/qt4/qmake2.inc
+++ b/meta-oe/recipes-qt/qt4/qmake2.inc
@@ -1,5 +1,4 @@
 DESCRIPTION = "TrollTech Makefile Generator"
-PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
 SECTION = "devel"
 LICENSE = "LGPLv2.1 | GPLv3"
diff --git a/meta-oe/recipes-support/atk/atk.inc b/meta-oe/recipes-support/atk/atk.inc
index a508012..604e6ca 100644
--- a/meta-oe/recipes-support/atk/atk.inc
+++ b/meta-oe/recipes-support/atk/atk.inc
@@ -1,6 +1,5 @@
 DESCRIPTION = "An accessibility toolkit for GNOME."
 SECTION = "x11/libs"
-PRIORITY = "optional"
 LICENSE = "LGPL"
 
 DEPENDS = "glib-2.0 gtk-doc-native"
diff --git a/meta-oe/recipes-support/atk/atk_1.30.0.bb b/meta-oe/recipes-support/atk/atk_1.30.0.bb
index cc8f573..7efb4fe 100644
--- a/meta-oe/recipes-support/atk/atk_1.30.0.bb
+++ b/meta-oe/recipes-support/atk/atk_1.30.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "An accessibility toolkit for GNOME."
 SECTION = "x11/libs"
-PRIORITY = "optional"
 LICENSE = "LGPLv2 & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20090814+nmu2.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20090814+nmu2.bb
index 3be567f..4641bfd 100644
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates_20090814+nmu2.bb
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates_20090814+nmu2.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "Common CA certificates"
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
-PRIORITY = "optional"
 LICENSE = "GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=6275b491c91b57d92ebe11205ebf4dfe"
 
diff --git a/meta-oe/recipes-support/check/check_0.9.5.bb b/meta-oe/recipes-support/check/check_0.9.5.bb
index 132b563..2f1ae94 100644
--- a/meta-oe/recipes-support/check/check_0.9.5.bb
+++ b/meta-oe/recipes-support/check/check_0.9.5.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "a unit test framework for C"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
-PRIORITY = "optional"
 SECTION = "devel"
 
 PR = "r2"
diff --git a/meta-oe/recipes-support/evtest/evtest_1.25.bb b/meta-oe/recipes-support/evtest/evtest_1.25.bb
index fdc023f..5e11131 100644
--- a/meta-oe/recipes-support/evtest/evtest_1.25.bb
+++ b/meta-oe/recipes-support/evtest/evtest_1.25.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Simple tool for input event debugging."
 HOMEPAGE = "http://people.freedesktop.org/~whot/evtest/"
 AUTHOR = "Vojtech Pavlik <vojtech@suse.cz>"
 SECTION = "console/utils"
-PRIORITY = "optional"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-support/fftw/benchfft_3.1.bb b/meta-oe/recipes-support/fftw/benchfft_3.1.bb
index efa76cd..52fd1bf 100644
--- a/meta-oe/recipes-support/fftw/benchfft_3.1.bb
+++ b/meta-oe/recipes-support/fftw/benchfft_3.1.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "FFTW benchmarks"
 SECTION = "libs"
-PRIORITY = "optional"
 LICENSE = "GPLv2"
 
 # single precision fftw is called fftwf 
diff --git a/meta-oe/recipes-support/fftw/fftw.inc b/meta-oe/recipes-support/fftw/fftw.inc
index a71b7e1..80fc656 100644
--- a/meta-oe/recipes-support/fftw/fftw.inc
+++ b/meta-oe/recipes-support/fftw/fftw.inc
@@ -1,6 +1,5 @@
 DESCRIPTION = "FFTW"
 SECTION = "libs"
-PRIORITY = "optional"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
diff --git a/meta-oe/recipes-support/flite/flite.inc b/meta-oe/recipes-support/flite/flite.inc
index 401c836..a0d718c 100644
--- a/meta-oe/recipes-support/flite/flite.inc
+++ b/meta-oe/recipes-support/flite/flite.inc
@@ -1,5 +1,4 @@
 DESCRIPTION = "flite - the festival light speech synthesizer"
-PRIORITY = "optional"
 HOMEPAGE = "http://www.speech.cs.cmu.edu/flite/"
 SECTION = "console/utils"
 LICENSE = "flite"
diff --git a/meta-oe/recipes-support/htop/htop_0.9.bb b/meta-oe/recipes-support/htop/htop_0.9.bb
index 25dac4c..6d12d72 100644
--- a/meta-oe/recipes-support/htop/htop_0.9.bb
+++ b/meta-oe/recipes-support/htop/htop_0.9.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "htop process monitor"
 HOMEPAGE = "http://htop.sf.net"
 SECTION = "console/utils"
-PRIORITY = "optional"
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index fbdb520..f8fd3e3 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "C and C++ INI Library"
 HOMEPAGE = "http://code.google.com/p/inih/"
-PRIORITY = "optional"
 PV = "0.0+gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 LICENSE = "BSD"
diff --git a/meta-oe/recipes-support/libgcrypt/libgcrypt.inc b/meta-oe/recipes-support/libgcrypt/libgcrypt.inc
index da882dc..8eb78a9 100644
--- a/meta-oe/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta-oe/recipes-support/libgcrypt/libgcrypt.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "A general purpose cryptographic library based on the code from Gn
 HOMEPAGE = "http://directory.fsf.org/project/libgcrypt/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 SECTION = "libs"
-PRIORITY = "optional"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta-oe/recipes-support/libiconv/libiconv.inc b/meta-oe/recipes-support/libiconv/libiconv.inc
index 11dfaf2..e3e8e11 100644
--- a/meta-oe/recipes-support/libiconv/libiconv.inc
+++ b/meta-oe/recipes-support/libiconv/libiconv.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "GNU libiconv - libiconv is for you if your application needs to s
 multiple character encodings, but that support lacks from your system."
 HOMEPAGE = "http://www.gnu.org/software/libiconv"
 SECTION = "libs"
-PRIORITY = "optional"
 NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
 
 SRC_URI = "ftp://ftp.gnu.org/pub/gnu/libiconv/libiconv-${PV}.tar.gz \
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
index f02c8f6..61b7521 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Simple DirectMedia Layer truetype font library."
 SECTION = "libs"
-PRIORITY = "optional"
 DEPENDS = "virtual/libsdl freetype"
 LICENSE = "LGPL"
 PR = "r1"
diff --git a/meta-oe/recipes-support/nfs-utils/nfs-utils_1.1.2.bb b/meta-oe/recipes-support/nfs-utils/nfs-utils_1.1.2.bb
index 9510b30..e41749c 100644
--- a/meta-oe/recipes-support/nfs-utils/nfs-utils_1.1.2.bb
+++ b/meta-oe/recipes-support/nfs-utils/nfs-utils_1.1.2.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "userspace utilities for kernel nfs"
-PRIORITY = "optional"
 SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta-oe/recipes-support/ntp/ntp.inc b/meta-oe/recipes-support/ntp/ntp.inc
index c72e40e..3dc7bdf 100644
--- a/meta-oe/recipes-support/ntp/ntp.inc
+++ b/meta-oe/recipes-support/ntp/ntp.inc
@@ -4,7 +4,6 @@ another server or reference time source, such as a radio \
 or satellite receiver or modem."
 HOMEPAGE = "http://ntp.isc.org/bin/view/Main/WebHome"
 SECTION = "console/network"
-PRIORITY = "optional"
 LICENSE = "ntp"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
 RSUGGESTS_${PN} = "iana-etc"
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
index a897a3d..2ae9eb4 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "A portable audio library"
 SECTION = "libs/multimedia"
-PRIORITY = "optional"
 LICENSE = "PortAudio"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
 SRCREV = "1387"
diff --git a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
index 75678f6..b8e03c4 100644
--- a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
+++ b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "An Embeddable SQL Database Engine"
 HOMEPAGE = "http://www.sqlite.org/"
 SECTION = "libs"
-PRIORITY = "optional"
 DEPENDS = "readline ncurses"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=10;md5=e98469a8efa024a38ad5b2e4b92f4a96"
diff --git a/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb b/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb
index 8642c8e..c92447e 100644
--- a/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "ftp://ftp.porcupine.org/pub/security/index.html"
 LICENSE = "tcp-wrappers"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
 SECTION = "console/network"
-PRIORITY = "optional"
 PR ="r6"
 
 SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb b/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
index 109bc77..9fd0ac0 100644
--- a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
+++ b/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://www.tcpdump.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
 SECTION = "console/network"
-PRIORITY = "optional"
 DEPENDS = "libpcap"
 PR = "r1"
 
-- 
1.7.4.1



