Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9518576E04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 20:55:08 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ZrXkP-0004iT-Bp for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2015 21:55:05 +0100
Received: from hsi-kbw-078-043-227-090.hsi4.kabel-badenwuerttemberg.de
	([78.43.227.90]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 21:55:05 +0100
Received: from js by hsi-kbw-078-043-227-090.hsi4.kabel-badenwuerttemberg.de
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 21:55:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Joachim Schiele <js@lastlog.de>
Date: Wed, 28 Oct 2015 21:35:44 +0100
Message-ID: <n0rbj0$tj9$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: hsi-kbw-078-043-227-090.hsi4.kabel-badenwuerttemberg.de
X-Mozilla-News-Host: news://news.gmane.org:119
X-Enigmail-Draft-Status: N1110
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
Subject: [meta-qt5] how to setup and use a cross-compiler for qt5 applications?
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
X-List-Received-Date: Wed, 28 Oct 2015 20:55:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

hi,

i need some directions on how to go on.


# questions
- should i use meta-qt5 master instead of daisy on my platform?
- is meta-toolchain-qt5 the right way to cross compile an application
vom x86_64 to ppc64 or did i miss something?
- how to get all qtdemo applications onto the target image (read:
sd-card image)





# my requirements
- develop qt 5.x applications on yocto+poky on PPC64
- either use a cross compiler, meta-toolchain-qt5, or compile software
natively

for testing:
- want all qt5 demos (or qtdemo, or what it is actually called) on the
ppc64 target to execute them and see that qt5 actually is working

# my platform
- freescale ppc64 board (big endian) using QorIQ 1.8 from freescale

Build Configuration:
BB_VERSION        = “1.22.0“
BUILD_SYS         = “x86_64-linux"
NATIVELSBSTRING   = “Ubuntu-14.04“
TARGET_SYS        = “powerpc64-fsl-linux"
MACHINE           = “t4240rdb-64b"
DISTRO            = “fsl-networking"
DISTRO_VERSION    = “QorIQ-SDK-V1.8“
TUNE_FEATURES     = “m64 fpu-hard e6500 altivec"
TARGET_FPU        = “hard"
meta
meta-yocto
meta-yocto-bsp    = “daisy:18837ea4cdd4fdab608e0a032a11a2dfb6b1ee1a"
meta-fsl-ppc      = “daisy:ed8d8f097eb9fb9c4d76cfeb617da5ce72d9b414“
meta-fsl-toolchain = “daisy:a253b3594d8d9e0a4ed869d1fb502c395c4438ac"
meta-fsl-networking = “daisy:6eb28ed659bbadfa470237dfce98bcbf53c18fe1“
meta-oe
meta-networking
meta-ruby
meta-perl
meta-filesystems
meta-multimedia
meta-xfce
meta-gnome        = “daisy:4a44c4107899363b22c01eb5621b0c86db1c659c"
meta-security     = “daisy:9f4c3849521465b459845dcc1a7a885bacaae9d9“
meta-qt5          = “daisy:23405d3a66c308e0b2ea64308b834285850c5c9f"

# after building and installing on the freescale PPC64 board

- qt 5.2.1 from meta-qt5::daisy
 - i got qt 5.2.1 working, qt assistant can be started! however, it
 - does not install qmake into the target
 - does not install the qt examples

i can't use this to compile anything natively without qmake/moc. see
https://github.com/meta-qt5/meta-qt5/blob/daisy/recipes-qt/qt5/qtbase.inc#L204



# meta-toolchain-qt5

bitbake meta-toolchain-qt5 builds:

fsl-networking-eglibc-x86_64-ppc64e6500-toolchain-QorIQ-SDK-V1.8.sh

after installation on a different VM i do this:

cd /opt/fsl-networking/QorIQ-SDK-V1.8/

ls
environment-setup-ppc64e6500-fsl-linux
environment-setup-ppce6500-fsl-linux
site-config-ppc64e6500-fsl-linux
site-config-ppce6500-fsl-linux
sysroots
version-ppc64e6500-fsl-linux
version-ppce6500-fsl-linux

note: i also tried environment-setup-ppce6500-fsl-linux but doesn't work
either

source  environment-setup-ppc64e6500-fsl-linux

cd ~/screenshot-example/

which qmake
/opt/fsl-networking/QorIQ-SDK-V1.8/sysroots/x86_64-fslsdk-linux/usr/bin/qt5/qmake

qmake
Project ERROR: Unknown module(s) in QT: widgets gui core









# my local.conf

... some lines i think are not important ...

MACHINE ??= "t4240rdb"

SDKMACHINE            ?= "x86_64"
TOOLCHAIN_BUILD       ?= "True"
DEFAULTTUNE           ?= "ppc64e6500"

DISTRO_FEATURES_append = " opengl"
DISTRO_FEATURES_remove = "bluetooth irda wifi nfc virtualization
pulseaudio wayland 3g touch touchscreen"
MACHINE_FEATURES_remove = "touchscreen"

# EXTRA_IMAGE_FEATURES: Valid features: dbg-pkgs debug-tweaks dev-pkgs
doc doc-pkgs eclipse-debug hwcodecs nfs-server
# package-management ptest-pkgs qt4-pkgs qtcreator-debug
read-only-rootfs splash ssh-server-dropbear ssh-server-openssh
# staticdev-pkgs tools-debug tools-profile tools-sdk tools-testapps x11
x11-base x11-sato
EXTRA_IMAGE_FEATURES += "dev-pkgs ssh-server-openssh tools-debug
tools-sdk tools-debug tools-profile"

# this created the 'qtbase-examples' once, so now this issue seems to be
not relevant anymore:
PACKAGECONFIG_append_pn-qtbase = " tools icu examples accessibility gl
udev openssl widgets developer sql-sqlite sql-mysql sql-psql sm"


#PACKAGECONFIG_remove_pn-qttools= "qtwebkit"

#qtbase-examples, ERROR: qtbase-examples not found in the base feeds
(t4240rdb_64b ppc64e6500 powerpc64 noarch any all).
#query the config with this command:
#   bitbake -e qtbase | grep ^PACKAGECONFIG=

# For recipes inheriting the packagegroup class, setting
PACKAGEGROUP_DISABLE_COMPLEMENTARY to "1"
# specifies that the normal complementary packages (i.e. -dev, -dbg, and
so forth) should not be
# automatically created by the packagegroup recipe, which is the default
behavior.
# FIXME PACKAGEGROUP_DISABLE_COMPLEMENTARY = "0"

# FIXME should packagegroup-xfce-base be removed from IMAGE_INSTALL_append?
CORE_IMAGE_EXTRA_INSTALL += "\
  packagegroup-xfce-base \
  packagegroup-xfce-extended \
  packagegroup-xfce-multimedia \
  packagegroup-qt5-toolchain-target \
  packagegroup-qt5-qtcreator-debug \
"

IMAGE_INSTALL_append  += "gcc g++ binutils gdb \
                          git subversion \
                          bc \
                          nix libxslt libdbd-sqlite-perl www-curl-perl \
                          mariadb \
                          postgresql \
                          libgcc libgcc-dev \
                          libstdc++ libstdc++-dev \
                          automake ccache chkconfig \
                          glib-2.0 glib-networking glibmm \
                          packagegroup-core-buildessential pkgconfig \
                          cmake zlib \
                          boost jpeg libpng12 \
                          cairo pango fontconfig freetype pulseaudio dbus \
                          xterm vim nano \
                          ruby \
                          libstdc++-staticdev \
                          autoconf \
                          alsa-lib alsa-tools alsa-state
alsa-utils-alsaconf \
                          i2c-tools \
                          cpufrequtils \
                          gstreamer1.0               \
                          gstreamer1.0-meta-base     \
                          gstreamer1.0-plugins-bad   \
                          gstreamer1.0-plugins-base  \
                          gstreamer1.0-plugins-good  \
                          pciutils \
                          usbutils \
                          python-core \
                          ltrace \
                          strace \
                          linux-firmware \
                          htop \
                          tcpdump \
                          bash \
                          util-linux \
                          e2fsprogs \
                          e2fsprogs-mke2fs \
                          e2fsprogs-e2fsck \
                          e2fsprogs-tune2fs \
                          mtd-utils \
                          mtd-utils-jffs2 \
                          mtd-utils-ubifs \
                          dosfstools \
                          net-tools \
                          kmod \
                          sysfsutils \
                          sysklogd \
                          sysstat \
                          qtbase               \
                          qttools              \
                          qtconnectivity       \
                          qtdeclarative        \
                          qtimageformats       \
                          qtlocation           \
                          qtscript             \
                          qtsensors            \
                          qtserialport         \
                          qtxmlpatterns        \
                          qtx11extras          \
                          qtsvg                \
                          qtmultimedia         \
                          qtquick1             \
"

#
#
#
#
#
# not found in base feeds issued packages:
#                          qttools-native       \
#                          qtquickcontrols      \
#                          qtgraphicaleffects   \
#ERROR: qtgraphicaleffects not found in the base feeds (t4240rdb_64b
ppc64e6500 powerpc64 noarch any all).

# stuff i don't want for now
#
#                          nativesdk-qttools    \
#                          qtbase-native        \
#                          qtwebkit             \
#                          qtwebkit-examples    \
#
#
#qtdeclarative \
# packages which fail on installation
#libglu mesa-glut
#cinematicexperience \
#
#IMAGE_INSTALL_append  \
#    qtdeclarative-plugins \
#    qtdeclarative-tools \
#    qtdeclarative-examples \
#    qtdeclarative-qmlplugins \
#    qtmultimedia \
#    qtmultimedia-plugins \
#    qtmultimedia-examples \
#    qtmultimedia-qmlplugins \
#    qtsvg \
#    qtsvg-plugins \
#    qtsensors \
#    qtimageformats-plugins \
#    qtsystems \
#    qtsystems-tools \
#    qtsystems-examples \
#    qtsystems-qmlplugins \
#    qtscript \
#    qt3d \
#    qt3d-examples \
#    qt3d-qmlplugins \
#    qt3d-tools \
#    qtwebkit \
#    qtwebkit-examples-examples \
#    qtwebkit-qmlplugins \
#    qtgraphicaleffects-qmlplugins \
#    qtconnectivity-qmlplugins \
#    qtlocation-plugins \
#    qtlocation-qmlplugins \
#    "

#


