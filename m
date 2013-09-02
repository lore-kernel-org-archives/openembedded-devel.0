Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5166BD13
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2013 02:54:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r822sG0F006262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Sep 2013 19:54:16 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 1 Sep 2013 19:54:15 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Sep 2013 10:54:11 +0800
Message-ID: <f93b4d4d2915213bb0528eb4724002768e39833d.1378089935.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1378089935.git.jackie.huang@windriver.com>
References: <cover.1378089935.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] remove the unnecessary protocol parameters
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
X-List-Received-Date: Mon, 02 Sep 2013 02:54:18 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It's not necessary to specify the protocol parameter when it's the
default protocol for the fetcher, e.g. the default protocol for
git fetcher it git, "protocol=git" isn't needed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-efl/recipes-efl/e17/e-tasks_git.bb            |    2 +-
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb   |    2 +-
 .../recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb   |    2 +-
 .../recipes-gnome/eds/evolution-data-server_git.bb |    2 +-
 .../gnome-settings-daemon_2.32.1.bb                |    2 +-
 meta-gnome/recipes-gnome/pimlico/contacts_git.bb   |    2 +-
 meta-gnome/recipes-gnome/pimlico/dates_git.bb      |    2 +-
 meta-gnome/recipes-gnome/pimlico/tasks_git.bb      |    2 +-
 .../recipes-bsp/kexecboot/kexecboot-klibc_git.bb   |    2 +-
 .../recipes-bsp/kexecboot/kexecboot_git.bb         |    2 +-
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |    2 +-
 .../recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb  |    2 +-
 .../recipes-mediacentre/xbmc/xbmc_git.bb           |    2 +-
 .../dleyna/media-service-demo_git.bb               |    2 +-
 meta-networking/recipes-daemons/atftp/atftp_git.bb |    2 +-
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  |    2 +-
 .../phonet-utils/phonet-utils_git.bb               |    2 +-
 meta-oe/recipes-connectivity/soft66/soft66_git.bb  |    2 +-
 meta-oe/recipes-connectivity/uhd/uhd_git.bb        |    2 +-
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb |    2 +-
 .../concurrencykit/concurrencykit_git.bb           |    2 +-
 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb  |    2 +-
 .../vala-dbus-binding-tool_git.bb                  |    2 +-
 .../recipes-extended/socketcan/canutils_4.0.6.bb   |    2 +-
 .../socketcan/libsocketcan_0.0.8.bb                |    2 +-
 .../recipes-graphics/dietsplash/dietsplash_git.bb  |    2 +-
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    2 +-
 .../xorg-driver/xf86-video-glamo_git.bb            |    2 +-
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    2 +-
 .../recipes-multimedia/v4l2apps/media-ctl_git.bb   |    2 +-
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |    2 +-
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb   |    2 +-
 meta-oe/recipes-navigation/gypsy/gypsy_git.bb      |    2 +-
 meta-oe/recipes-support/daemonize/daemonize_git.bb |    2 +-
 meta-oe/recipes-support/inih/libinih_git.bb        |    2 +-
 .../libatasmart/libatasmart_0.19.bb                |    2 +-
 meta-oe/recipes-support/lockdev/lockdev_git.bb     |    2 +-
 .../serial-utils/pty-forward-native.bb             |    2 +-
 .../serial-utils/serial-forward_git.bb             |    2 +-
 .../vala-terminal/vala-terminal_git.bb             |    2 +-
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb  |    2 +-
 .../closebutton/xfce4-closebutton-plugin_git.bb    |    2 +-
 43 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-tasks_git.bb b/meta-efl/recipes-efl/e17/e-tasks_git.bb
index 29dec4f..6e08861 100644
--- a/meta-efl/recipes-efl/e17/e-tasks_git.bb
+++ b/meta-efl/recipes-efl/e17/e-tasks_git.bb
@@ -12,7 +12,7 @@ SRCREV = "b640f0e7287877983645d9d9a36f85a0b6a54631"
 PV = "0.0.2+gitr${SRCPV}"
 PR = "r1"
 
-SRC_URI = "git://github.com/shr-project/e-tasks.git;protocol=git;branch=master \
+SRC_URI = "git://github.com/shr-project/e-tasks.git;branch=master \
 "
 S = "${WORKDIR}/git"
 
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index 2141137..32c2142 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -11,7 +11,7 @@ PKGV = "${GITPKGVTAG}"
 
 SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
 
-SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;protocol=git;branch=master"
+SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb
index 7755a7f..dbb42a0 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=15667d9b3cb737b57471c148b7c50734"
 DEPENDS = "util-linux"
 
 SRCREV = "da59f6146c37e727bb83ae4922ca56d42958e61c"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;protocol=git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git"
 S = "${WORKDIR}/git"
 
 inherit autotools
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index 155945f..13f6b3b 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -16,7 +16,7 @@ SRCREV = "a9e4e74ec4473a4fd09e56b690bd4fa72f686687"
 PV = "3.2.3+git${SRCPV}"
 
 SRC_URI = " \
-    git://git.gnome.org/evolution-data-server;protocol=git \
+    git://git.gnome.org/evolution-data-server \
     file://0001-contact-Replace-the-Novell-sample-contact-with-somet.patch \
     file://0002-Fix-for-automake-1.12.x.patch \
     file://0003-Disable-Werror-for-automake.patch \
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 47baea6..7a33c24 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "libxxf86misc libsndfile1 libxtst glib-2.0 polkit gtk+ gconf dbus-glib
 
 inherit gnome
 
-SRC_URI = "git://git.gnome.org/gnome-settings-daemon;protocol=git;branch=gnome-2-32"
+SRC_URI = "git://git.gnome.org/gnome-settings-daemon;branch=gnome-2-32"
 SRCREV = "0160f6725cfb872e017f3958f108792c3b882872"
 
 S = "${WORKDIR}/git"
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
index 28e5fe2..8a4a071 100644
--- a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
+++ b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
@@ -11,7 +11,7 @@ PR = "r4"
 
 S = "${WORKDIR}/git"
 
-SRC_URI =+ "git://git.gnome.org/${BPN};protocol=git \
+SRC_URI =+ "git://git.gnome.org/${BPN} \
         file://make-382.patch"
 
 S = "${WORKDIR}/git"
diff --git a/meta-gnome/recipes-gnome/pimlico/dates_git.bb b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
index 086abc7..a4a572f 100644
--- a/meta-gnome/recipes-gnome/pimlico/dates_git.bb
+++ b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
@@ -11,7 +11,7 @@ PR = "r9"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.gnome.org/${BPN};protocol=git \
+SRC_URI = "git://git.gnome.org/${BPN} \
     file://make-382.patch \
     file://dso_linking_change_build_fix.patch \
     file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks_git.bb b/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
index 16c0430..6a06da3 100644
--- a/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
+++ b/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
@@ -1,6 +1,6 @@
 require tasks.inc
 
-SRC_URI = "git://git.gnome.org/${BPN};protocol=git"
+SRC_URI = "git://git.gnome.org/${BPN}"
 
 SRCREV = "ea52d46d691c5fce4473ea4e24a35411381f3a65"
 PV = "0.13+git${SRCPV}"
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
index 5e33182..45741bf 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
@@ -1,7 +1,7 @@
 PV = "0.5.9"
 PR = "r10+gitr${SRCREV}"
 
-SRC_URI = "git://github.com/kexecboot/kexecboot.git;protocol=git"
+SRC_URI = "git://github.com/kexecboot/kexecboot.git"
 SRCREV = "b667914bb0cba1c30f9b771abccfe98f1419afeb"
 S = "${WORKDIR}/git"
 
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index d664261..c3c496d 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,7 +1,7 @@
 PV = "0.5.9"
 PR = "r10+gitr${SRCREV}"
 
-SRC_URI = "git://github.com/kexecboot/kexecboot.git;protocol=git"
+SRC_URI = "git://github.com/kexecboot/kexecboot.git"
 SRCREV = "b667914bb0cba1c30f9b771abccfe98f1419afeb"
 S = "${WORKDIR}/git"
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 4d5f6c4..a3bba53 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -27,7 +27,7 @@ KLIBC_ARCH_powerpc64 = 'ppc64'
 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
 
 SRCREV = "f05ff116bb9edbbb81d82fa47b78e630ce878470"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git;protocol=git"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
 
 SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
                                  file://armv4-fix-v4bx.patch \
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
index 3039eb7..aed9b90 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
@@ -11,7 +11,7 @@ PR = "r0"
 
 inherit klibc
 
-SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f \
+SRC_URI = "git://git.infradead.org/mtd-utils.git;tag=ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f \
             file://Makefile.patch \
             file://common.mk.patch \
             file://libubi.c.patch \
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 0b4d696..d1ccf6d 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -11,7 +11,7 @@ SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
 
 PV = "11.0+gitr${SRCPV}"
 PR = "r14"
-SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden;protocol=git \
+SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden \
            file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
            file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
            file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
diff --git a/meta-multimedia/recipes-multimedia/dleyna/media-service-demo_git.bb b/meta-multimedia/recipes-multimedia/dleyna/media-service-demo_git.bb
index 7bcfa12..f7457fd 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/media-service-demo_git.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/media-service-demo_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SRCREV = "f4440e104f0d13e454234184c2c6eba982725baf"
 PV = "0.0+git${SRCPV}"
 
-SRC_URI = "git://github.com/01org/media-service-demo.git;protocol=git"
+SRC_URI = "git://github.com/01org/media-service-demo.git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
index 4b9ff05..0bef7a6 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
@@ -8,7 +8,7 @@ PR = "r3"
 
 SRCREV = "be3291a18c069ae23a124ffdc56d64a5ff0bbec7"
 
-SRC_URI = "git://atftp.git.sourceforge.net/gitroot/atftp/atftp;protocol=git \
+SRC_URI = "git://atftp.git.sourceforge.net/gitroot/atftp/atftp \
            file://atftpd-0.7_circumvent_tftp_size_restrictions.patch \
            file://atftpd-0.7_unprotected_assignments_crash.patch \
            file://atftpd.init \
diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index b0fc630..1a78575 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
@@ -70,7 +70,7 @@ SRCREV = "a7b3a9339106aaba72195b693dfeaa98f194e0d5"
 GIT_REPO = "gnuradio.git"
 GIT_BRANCH = "master"
 
-SRC_URI = "git://git.gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git \
+SRC_URI = "git://git.gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH} \
            file://0001-gr-trellis-Kill-docs-hard.patch \
 "
 
diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
index f5bd1cf..874637f 100644
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
+++ b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This small package provides a few command line tools for Linux Ph
 HOMEPAGE = ""
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-SRC_URI = "git://gitorious.org/meego-cellular/phonet-utils.git;branch=master;protocol=git"
+SRC_URI = "git://gitorious.org/meego-cellular/phonet-utils.git;branch=master"
 PR = "r2"
 S = "${WORKDIR}/git"
 SRCREV = "4acfa720fd37d178a048fc2be17180137d4a70ea"
diff --git a/meta-oe/recipes-connectivity/soft66/soft66_git.bb b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
index a574c3c..b88411f 100644
--- a/meta-oe/recipes-connectivity/soft66/soft66_git.bb
+++ b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
@@ -9,7 +9,7 @@ PV = "0.1.3+gitr${SRCPV}"
 PR = "r1"
 
 SRCREV = "a1dab25e73896c90c98227ac8055f227b830d512"
-SRC_URI = "git://home.horsten.com/soft66;protocol=git \
+SRC_URI = "git://home.horsten.com/soft66 \
 file://fix-ar.patch"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-connectivity/uhd/uhd_git.bb b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
index 180fd27..ee02cc7 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd_git.bb
+++ b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
@@ -3,7 +3,7 @@ require uhd.inc
 PV = "3.5.3"
 PR = "${INC_PR}.0"
 
-SRC_URI = "git://ettus.sourcerepo.com/ettus/uhd.git;branch=maint;protocol=git \
+SRC_URI = "git://ettus.sourcerepo.com/ettus/uhd.git;branch=maint \
            file://0001-use-uint8_t-from-boost-namespace.patch;striplevel=2 \
           "
 S = "${WORKDIR}/git/host"
diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index 18d3efb..181e303 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -8,7 +8,7 @@ PR = "r1"
 
 ASNEEDED_pn-dbus-daemon-proxy = ""
 
-SRC_URI = "git://git.collabora.co.uk/git/user/alban/dbus-daemon-proxy;protocol=git"
+SRC_URI = "git://git.collabora.co.uk/git/user/alban/dbus-daemon-proxy"
 S = "${WORKDIR}/git"
 
 do_compile() {
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index 7dcbb21..fe57d9e 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -9,7 +9,7 @@ SECTION = "base"
 
 SRCREV = "900d203aa9e41288545368ea40da0bee89f7907f"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f12611e65e064515ce264249b2bdea98"
-SRC_URI = "git://git.concurrencykit.org/ck.git;protocol=git \
+SRC_URI = "git://git.concurrencykit.org/ck.git \
            file://cross.patch \
 "
 
diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
index e721e7e..c6ddf3d 100644
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
@@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRCREV = "5fba3d42f126ce13333fb7d0412d729b753ee5a4"
 BRANCH ?= "master"
 
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
index dd96187..32d2818 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
@@ -5,5 +5,5 @@ DEFAULT_PREFERENCE = "-1"
 SRCREV = "53d56816a4154e3467f07bd22f4e27d166e3e3f3"
 PV = "0.4.0+gitr${SRCPV}"
 
-SRC_URI = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;protocol=git;branch=master"
+SRC_URI = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;branch=master"
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
index cf1aa66..3bc2f93 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libsocketcan"
 
 TAG = "canutils-${PV}"
-SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git;tag=${TAG} \
+SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;tag=${TAG} \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb
index 4c5f918..34ba56b 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/libsocketcan.c;beginline=3;endline=17;md5=97e38ad
 
 SRCREV = "3a2cec63a4e6212cc63d21008453bd799cfe8774"
 
-SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git \
+SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
index a3f1aad..2c6a821 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
@@ -8,7 +8,7 @@ PV = "0.3"
 PR = "r1"
 
 SRCREV = "3098e4ad8aa07ad90b2a4413c0abeb6dcd8f1233"
-SRC_URI = "git://github.com/lucasdemarchi/dietsplash.git;protocol=git"
+SRC_URI = "git://github.com/lucasdemarchi/dietsplash.git"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index 8767e98..97bda4c 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://blog.lxde.org/?p=531"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = " \
-    git://lxde.git.sourceforge.net/gitroot/lxde/${BPN};protocol=git;branch=master \
+    git://lxde.git.sourceforge.net/gitroot/lxde/${BPN};branch=master \
     file://lxdm.conf \
     file://lxdm-pam \
     file://lxdm-pam-debug \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index c1180b8..35bd89d 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -8,7 +8,7 @@ SRCREV = "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
 PV = "0.1+gitr${SRCPV}"
 PR = "r3"
 
-SRC_URI = "git://github.com/android/platform_frameworks_base.git;protocol=git;branch=master"
+SRC_URI = "git://github.com/android/platform_frameworks_base.git;branch=master"
 
 S = "${WORKDIR}/git/data/fonts"
 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index c3d83a4..583730f 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -9,7 +9,7 @@ PE = "2"
 PV = "1.0.0+gitr${SRCPV}"
 PR = "${INC_PR}.4"
 
-SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=master \
+SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;branch=master \
            file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
            file://0001-fix-build-with-KMS-disabled.patch \
            file://0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch \
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 7c1357b..259792f 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -13,7 +13,7 @@ RCONFLICTS_${PN} = "mplayer"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "git://repo.or.cz/mplayer.git;protocol=git;branch=master \
+SRC_URI = "git://repo.or.cz/mplayer.git;branch=master \
            file://cross.compile.codec-cfg.patch \
 "
 
diff --git a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
index 37d130a..8f61571 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
 
 DEPENDS = "linux-libc-headers"
 
-SRC_URI = "git://git.ideasonboard.org/media-ctl.git;protocol=git"
+SRC_URI = "git://git.ideasonboard.org/media-ctl.git"
 SRCREV = "a6ec4a37028952ffd6e62eb52648cf66248eb519"
 
 PV = "0.0.1"
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
index c00f119..bf75a03 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
@@ -12,7 +12,7 @@ inherit autotools gettext
 # libv4l was absorbed into this, let OE know that
 PROVIDES = "libv4l"
 
-SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git \
+SRC_URI = "git://linuxtv.org/v4l-utils.git \
            file://openat.patch \
 "
 # 54f16ca8183dd8ae8bf4ccc07949795aff0301f5 -> v0.8.8 tag
diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
index 98b5e0e..a3c683a 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Yet Another V4L2 Test Application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://git.ideasonboard.org/yavta.git;protocol=git \
+SRC_URI = "git://git.ideasonboard.org/yavta.git \
            file://0001-Add-stdout-mode-to-allow-streaming-over-the-network-.patch"
 SRCREV = "82ff2efdb9787737b9f21b6f4759f077c827b238"
 
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_git.bb b/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
index e5c564f..5431c68 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
+++ b/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
@@ -14,5 +14,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
                     file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
 
-SRC_URI = "git://anongit.freedesktop.org/gypsy;protocol=git \
+SRC_URI = "git://anongit.freedesktop.org/gypsy \
            file://fixups.patch"
diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
index 2e747cd..f6e5203 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -7,6 +7,6 @@ PV = "1.7.3+git${SRCPV}"
 inherit autotools
 
 SRCREV = "93788682a4749d8b577ce6549d6d3dd6df166ba4"
-SRC_URI = "git://github.com/bmc/daemonize.git;protocol=git"
+SRC_URI = "git://github.com/bmc/daemonize.git"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index cb52503..4709be0 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -9,7 +9,7 @@ PR = "r3"
 
 # The github repository provides a cmake and pkg-config integration
 SRCREV = "7a43a3655ceffa9f0f7fd68262d8d478c6d0d0af"
-SRC_URI = "git://github.com/OSSystems/inih.git;protocol=git"
+SRC_URI = "git://github.com/OSSystems/inih.git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index e1e5ff2..0a378b4 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "udev"
 
 SRCREV = "de6258940960443038b4c1651dfda3620075e870"
-SRC_URI = "git://git.0pointer.de/libatasmart.git;protocol=git"
+SRC_URI = "git://git.0pointer.de/libatasmart.git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/lockdev/lockdev_git.bb b/meta-oe/recipes-support/lockdev/lockdev_git.bb
index beec5a6..22d14b9 100644
--- a/meta-oe/recipes-support/lockdev/lockdev_git.bb
+++ b/meta-oe/recipes-support/lockdev/lockdev_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM="file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 PV = "1.0.3+git${SRCPV}"
 
 SRCREV = "16b899645d32012cc94cc9232f64d4ddaaf0b795"
-SRC_URI = "git://anonscm.debian.org/lockdev/lockdev.git;protocol=git"
+SRC_URI = "git://anonscm.debian.org/lockdev/lockdev.git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
index 6bf1d85..ed87a14 100644
--- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -7,7 +7,7 @@ SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
 PV = "1.1+gitr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia;protocol=git"
+SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia"
 S = "${WORKDIR}/git/tools/serial_forward"
 
 inherit autotools native
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index cf66556..240597c 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -7,7 +7,7 @@ SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
 PV = "1.1+gitr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia;protocol=git"
+SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia"
 S = "${WORKDIR}/git/tools/serial_forward"
 
 inherit autotools
diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index 4e76534..0d22d1d 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -10,7 +10,7 @@ PR = "r1"
 
 inherit autotools perlnative vala
 
-SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;protocol=git;branch=master"
+SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;branch=master"
 S = "${WORKDIR}/git"
 
 RDEPENDS_${PN} = "ttf-liberation-mono"
diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index b616267..c383b82 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native"
 
-SRC_URI = "git://gitorious.org/xfce/xarchiver.git;protocol=git;branch=master"
+SRC_URI = "git://gitorious.org/xfce/xarchiver.git;branch=master"
 SRCREV = "e80e90528c9aab2fe36d9078b945b44c05cc20d3"
 PV = "0.5.3"
 S = "${WORKDIR}/git"
diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index 7348170..15b4ced 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -9,7 +9,7 @@ DEPENDS += "exo-native libwnck xfconf"
 
 PV = "0.1.0+gitr${SRCPV}"
 
-SRC_URI = "git://gitorious.org/xfce/xfce4-closebutton-plugin.git;protocol=git;branch=master"
+SRC_URI = "git://gitorious.org/xfce/xfce4-closebutton-plugin.git;branch=master"
 SRCREV = "bd76154afe26ba8a5251a1887d88f9d855301850"
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1


