Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6DAEA60017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 14:50:27 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id b13so20941786wgh.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tZWwcCYnc6RgT1Afpib68VcbkDaEFh9jeiPSXE+41Ds=;
	b=uF9IcohXzCQ7MjGWybppVnLABv+znXutTqmzic1GTLJ3jJAYfrpEkttWDD9rRo23DP
	ieeyRZC/XAxxBHnJ8j+NeXnabYPcQvBkbgOfOK32rMNMl19r56fNb+4q/01Fc0s5yl9M
	6HpDtlRsrDGpnRc5s8ohjHT2DCB1Ux8P9pYZoYfK0q/WpEpok4DUDW/G5GUe6bKJXkX+
	YlhHXZHMtu0yLg2sWjy7FffB7OY7fn4l/X9nLmXLbX6b1h/pKsr62D+IV3amOD5s4r8I
	fDKxwCaW+PU8W+jK6kKLFBk0vCALdYLWUC2pAi/rc1o5fdSpDIj1ZJ2b3DPbuWuZ7qBI
	JTCA==
X-Received: by 10.194.242.6 with SMTP id wm6mr8361641wjc.7.1422456628011;
	Wed, 28 Jan 2015 06:50:28 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cx3sm3134600wib.10.2015.01.28.06.50.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 06:50:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jan 2015 15:50:26 +0100
Message-Id: <1422456627-5199-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [meta-oe][PATCH] recipes: add x11 to required DISTRO_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Jan 2015 14:50:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc                      | 4 +++-
 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb               | 4 +++-
 meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb                          | 4 +++-
 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb                           | 2 +-
 meta-oe/recipes-extended/gnuplot/gnuplot.inc                        | 4 +++-
 meta-oe/recipes-extended/sip/sip_4.16.4.bb                          | 4 +++-
 meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb                       | 4 +++-
 meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb         | 4 +++-
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb                           | 4 +++-
 meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb                    | 4 +++-
 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb                   | 4 +++-
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb                   | 4 +++-
 meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb         | 4 ++++
 meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb       | 4 ++++
 .../recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb    | 5 ++++-
 meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb          | 4 ++++
 .../xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb              | 4 ++++
 meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb   | 4 ++++
 meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb        | 4 ++++
 meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb          | 4 ++++
 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb             | 4 +++-
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb                     | 4 +++-
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb                       | 4 +++-
 meta-oe/recipes-support/links/links-x11_2.7.bb                      | 4 ++++
 meta-oe/recipes-support/synergy/synergy_1.3.8.bb                    | 6 ++++--
 meta-oe/recipes-support/utouch/utouch-mtview_git.bb                 | 4 +++-
 26 files changed, 86 insertions(+), 19 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 1b6f02a..0362f39 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -15,7 +15,9 @@ DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native gst-plugins-bad \
 
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig distro_features_check
+# depends on libxinerama libxpm xcb-util-keysyms
+REQUIRED_DISTRO_FEATURES = "x11"
 
 ARM_INSTRUCTION_SET = "arm"
 
diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
index 140456e..989f2cf 100644
--- a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
@@ -22,7 +22,9 @@ S = "${WORKDIR}/PyQt-x11-gpl-${PV}"
 
 PARALLEL_MAKE = ""
 
-inherit qmake2 pythonnative python-dir
+inherit qmake2 pythonnative python-dir distro_features_check
+# depends on qt4-x11-free
+REQUIRED_DISTRO_FEATURES = "x11"
 
 DISABLED_FEATURES = "PyQt_Desktop_OpenGL PyQt_Accessibility PyQt_SessionManager"
 
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
index 1177d03..14c6ce5 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
@@ -35,7 +35,9 @@ S = "${WORKDIR}/${BPN}${PV}/unix"
 VER = "${@os.path.splitext(d.getVar('PV', True))[0]}"
 
 LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
-inherit autotools
+inherit autotools distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "\
     --enable-threads \
diff --git a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
index 0de707e..560630c 100644
--- a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
+++ b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
 
 DEPENDS = "corosync systemd"
 
-inherit pkgconfig systemd
+inherit pkgconfig systemd distro_features_check
 
 SYSTEMD_SERVICE_${PN} = "dlm.service"
 SYSTEMD_AUTO_ENABLE = "enable"
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
index 6c27e6d..69bc74b 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
@@ -6,7 +6,9 @@ LICENSE = "gnuplot"
 LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
 DEPENDS = "virtual/libx11 gd readline"
 
-inherit autotools
+inherit autotools distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 acpaths = ""
 
diff --git a/meta-oe/recipes-extended/sip/sip_4.16.4.bb b/meta-oe/recipes-extended/sip/sip_4.16.4.bb
index 2a2674f..607ace6 100644
--- a/meta-oe/recipes-extended/sip/sip_4.16.4.bb
+++ b/meta-oe/recipes-extended/sip/sip_4.16.4.bb
@@ -14,7 +14,9 @@ SRC_URI[sha256sum] = "ceda443fc5e129e67a067e2cd7b73ff037f8b10b50e407baa2b1d9f219
 
 BBCLASSEXTEND = "native"
 
-inherit qmake2 python-dir pythonnative
+inherit qmake2 python-dir pythonnative distro_features_check
+# depends on qt4-x11-free
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_QMAKEVARS_POST += "CONFIG=console"
 
diff --git a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
index 90a0290..1d670a7 100644
--- a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
+++ b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
@@ -13,7 +13,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/t/t1lib/t1lib_${PV}.orig.tar.gz \
 SRC_URI[md5sum] = "a5629b56b93134377718009df1435f3c"
 SRC_URI[sha256sum] = "821328b5054f7890a0d0cd2f52825270705df3641dbd476d58d17e56ed957b59"
 
-inherit autotools-brokensep
+inherit autotools-brokensep distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 # Fix GNU_HASH problem
 TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
index 51f57b9..d0f4494 100644
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
@@ -11,4 +11,6 @@ SRC_URI = "https://launchpad.net/glcompbench/trunk/${PV}/+download/${BPN}-${PV}.
 SRC_URI[md5sum] = "c939d9156fe940960098f38707fea827"
 SRC_URI[sha256sum] = "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b0379542ee"
 
-inherit pkgconfig waf
+inherit pkgconfig waf distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index a3dcc1b..a05e533 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -20,7 +20,9 @@ DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}
 # combine oe-core way with angstrom DISTRO_TYPE
 DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
-inherit autotools pkgconfig gettext systemd
+inherit autotools pkgconfig gettext systemd distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb b/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
index f23621d..404ee53 100644
--- a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
+++ b/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
@@ -9,6 +9,8 @@ PV = "8.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu"
diff --git a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
index 47ec504..08d7f5b 100644
--- a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
+++ b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
@@ -10,7 +10,9 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/numlockx/numlockx-${PV}.tar.g
 SRC_URI[md5sum] = "be9109370447eae23f6f3f8527bb1a67"
 SRC_URI[sha256sum] = "e468eb9121c94c9089dc6a287eeb347e900ce04a14be37da29d7696cbce772e4"
 
-inherit autotools
+inherit autotools distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR} \
                 --x-libraries=${STAGING_LIBDIR}"
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
index 7c1d4a0..d9e58f1 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
@@ -11,7 +11,9 @@ SRC_URI[sha256sum] = "6fa90016530b3aa6102e254079461977439398531fb23e7ec076ff2c14
 
 PR = "r2"
 
-inherit autotools gettext update-alternatives pkgconfig
+inherit autotools gettext update-alternatives pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 ALTERNATIVE_${PN}-core = "x-window-manager"
 ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/openbox"
diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
index e718465..43e6fda 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
@@ -7,6 +7,10 @@ DEPENDS = "virtual/libx11 libxtst"
 
 PR = "r1"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "http://semicomplete.googlecode.com/files/xdotool-${PV}.tar.gz"
 SRC_URI[md5sum] = "1d5be641e512c343abfe5f78b39e6f19"
 SRC_URI[sha256sum] = "42d7271fbc796e53db71bb221f311b9ff3c51d90a71c9487a9bd3101ca39894f"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
index 04d3efa..85a4466 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
@@ -10,5 +10,9 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_class-native = "font-util-native"
 
+inherit distro_features_check
+# depends on bdftopcf-native -> virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[md5sum] = "1347c3031b74c9e91dc4dfa53b12f143"
 SRC_URI[sha256sum] = "b2c08433eab5cb202470aa9f779efefce8d9cab2534f34f3aa4a31d05671c054"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
index f3d2815..16e3d2c 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
@@ -10,6 +10,9 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_class-native = "font-util-native"
 
+inherit distro_features_check
+# depends on bdftopcf-native -> virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[md5sum] = "66fb6de561648a6dce2755621d6aea17"
 SRC_URI[sha256sum] = "d16f5e3f227cc6dd07a160a71f443559682dbc35f1c056a5385085aaec4fada5"
-
diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
index 3ee91ce..08ed6b6 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
@@ -10,5 +10,9 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_class-native = "font-util-native"
 
+inherit distro_features_check
+# depends on bdftopcf-native -> virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[md5sum] = "9f11ade089d689b9d59e0f47d26f39cd"
 SRC_URI[sha256sum] = "23c07162708e4b79eb33095c8bfa62c783717a9431254bbf44863734ea239481"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
index c83137b..5ded41a 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
@@ -10,5 +10,9 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_class-native = "font-util-native"
 
+inherit distro_features_check
+# depends on bdftopcf-native -> virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[md5sum] = "c8b73a53dcefe3e8d3907d3500e484a9"
 SRC_URI[sha256sum] = "62a83363c2536095fda49d260d21e0847675676e4e3415054064cbdffa641fbb"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
index 9a83ac1..e8cfb61 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
@@ -10,5 +10,9 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_class-native = "font-util-native"
 
+inherit distro_features_check
+# depends on bdftopcf-native -> virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[md5sum] = "6b223a54b15ecbd5a1bc52312ad790d8"
 SRC_URI[sha256sum] = "ebe0d7444e3d7c8da7642055ac2206f0190ee060700d99cd876f8fc9964cb6ce"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
index 7db03eb..d425ce5 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
@@ -9,5 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8b32ccac3ad25e75e68478deb7780265"
 DEPENDS = "util-macros-native font-util-native bdftopcf-native"
 RDEPENDS_${PN} = "encodings font-util"
 
+inherit distro_features_check
+# depends on bdftopcf-native -> virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[md5sum] = "3e0069d4f178a399cffe56daa95c2b63"
 SRC_URI[sha256sum] = "17363eb35eece2e08144da5f060c70103b59d0972b4f4d77fd84c9a7a2dba635"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
index 685d647..a7c284a 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
@@ -9,5 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=200c507f595ee97008c7c5c3e94ab9a8"
 DEPENDS = "util-macros-native font-util-native bdftopcf-native"
 RDEPENDS_${PN} = "encodings font-util"
 
+inherit distro_features_check
+# depends on bdftopcf-native -> virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[md5sum] = "c88eb44b3b903d79fb44b860a213e623"
 SRC_URI[sha256sum] = "b8e77940e4e1769dc47ef1805918d8c9be37c708735832a07204258bacc11794"
diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
index fd6c992..158416b 100644
--- a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
+++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
@@ -1,7 +1,9 @@
 SUMMARY = "Xorg 100 DPI font set"
 LICENSE = "Custom"
 
-inherit packagegroup
+inherit packagegroup distro_features_check
+# rdepends on font recipes with this restriction
+REQUIRED_DISTRO_FEATURES = "x11"
 
 RDEPENDS_${PN} = "\
 	font-adobe-100dpi \
diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
index 1ca8b1f..d65546d 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -9,7 +9,9 @@ SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/${BPN}/${BPN}_${
            file://auxdir.patch;striplevel=0"
 S = "${WORKDIR}/xpext-1.0"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "1b0cb67b6f2bd7c4abef17648b062896"
 SRC_URI[sha256sum] = "a3b06f5188fd9effd0799ae31352b3cd65cb913b964e2c1a923ffa9d3c08abbe"
diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
index 968d342..c7a068d 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -7,7 +7,9 @@ SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/${BPN}_${PV}
            file://xsp-fix-pc.patch"
 S = "${WORKDIR}/Xsp"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "2a0d8d02228d4cbd28b6e07bb7c17cf5"
 SRC_URI[sha256sum] = "8b722b952b64841d996c70c3278499886c81bb5012991beed5f66f4158418f59"
diff --git a/meta-oe/recipes-support/links/links-x11_2.7.bb b/meta-oe/recipes-support/links/links-x11_2.7.bb
index 8766653..2ae11ac 100644
--- a/meta-oe/recipes-support/links/links-x11_2.7.bb
+++ b/meta-oe/recipes-support/links/links-x11_2.7.bb
@@ -3,6 +3,10 @@ require links.inc
 DEPENDS += "virtual/libx11"
 RCONFLICTS_${PN} = "links"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI += " file://links2.desktop \
              http://www.xora.org.uk/oe/links2.png;name=icon"
 
diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
index 642845f..45c0bc2 100644
--- a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
+++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9772a11e3569985855e2ce450e56f991"
 LICENSE = "GPL-2.0"
 SECTION = "x11/utils"
 
-DEPENDS = "libx11 libxtst libxinerama"
+DEPENDS = "virtual/libx11 libxtst libxinerama"
 
 SRC_URI = "http://synergy.googlecode.com/files/synergy-${PV}-Source.tar.gz"
 
@@ -13,7 +13,9 @@ SRC_URI[sha256sum] = "0afc83e4ed0b46ed497d4229b2b2854e8d3c581a112f4da05110943edb
 
 S = "${WORKDIR}/${PN}-${PV}-Source"
 
-inherit cmake
+inherit cmake distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_install() {
     install -d ${D}/usr/bin
diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
index bcf7e23..8cb180d 100644
--- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
@@ -5,7 +5,9 @@ HOMEPAGE = "http://bitmath.org/code/mtview/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c61b8950dc1aab4d2aa7c2ae6b1cfb3"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://bitmath.org/git/mtview.git;protocol=http"
 SRCREV = "ad437c38dc111cf3990a03abf14efe1b5d89604b"
-- 
2.2.1


