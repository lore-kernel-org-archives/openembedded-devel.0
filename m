Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C86C36B8D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 19:58:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5NJwW58009016 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:58:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nOGnqTcTwkYR
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:58:32 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5NJwRhb009004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:58:29 +0100
Message-ID: <1403553501.2104.120.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jun 2014 20:58:21 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [meta-oe][PATCH] recipes: Add missing pkgconfig dependencies
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
X-List-Received-Date: Mon, 23 Jun 2014 19:58:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These recipes were all missing pkgconfig dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
index 2e7a616..6957ea9 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[md5sum] = "2d6fb47ddf62b51733227126fe9227fe"
 SRC_URI[sha256sum] = "4b383f0074a3ab7683339d1f18222b107aaeb4983db119292c43c2b275cefb27"
 
-inherit autotools
+inherit autotools pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[uuid] = "--with-uuid,--without-uuid,util-linux"
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
index 722d0ed..ba64310 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/${P}.tar.gz"
 S = "${WORKDIR}/${P}"
 
-inherit autotools
+inherit autotools pkgconfig
 
 FILES_${PN} += "${libdir}/sshnodelay.so"
 
diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
index 7dc09da..2b85ff4 100644
--- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
+++ b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
 
 DEPENDS = "gnome-common glib-2.0 gdk-pixbuf cogl-1.0 clutter-1.0 clutter-gst-1.0"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 SRC_URI = "git://git.gnome.org/pinpoint"
 
diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
index 33318e1..c8a19dc 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/znc/znc.git"
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 # ZNC has a custom autogen.sh that states that this command is needed *and* expected to fail
 do_configure_prepend() {
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 655f907..b147b4b 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}-${PV}.tar.gz \
 
 DEPENDS += "cups python libusb"
 
-inherit autotools python-dir pythonnative
+inherit autotools python-dir pythonnative pkgconfig
 
 export BUILD_SYS
 export HOST_SYS
diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
index 8195ed9..c220ead 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -14,4 +14,4 @@ SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
index 298cfa5..2bc7886 100644
--- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tmux/${P}.tar.gz"
 SRC_URI[md5sum] = "3e37db24aa596bf108a0442a81c845b3"
 SRC_URI[sha256sum] = "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5967c56881a7efbd6"
 
-inherit autotools
+inherit autotools pkgconfig
 
 do_configure_prepend () {
     sed -i -e 's:-I/usr/local/include::' ${S}/Makefile.am || bb_fatal "sed failed"
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
index 54a14f9..24407b0 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "6fa90016530b3aa6102e254079461977439398531fb23e7ec076ff2c14
 
 PR = "r2"
 
-inherit autotools gettext update-alternatives
+inherit autotools gettext update-alternatives pkgconfig
 
 ALTERNATIVE_${PN}-core = "x-window-manager"
 ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/openbox"
diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index d8c56fb..78f4bf5 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a8
 
 S = "${WORKDIR}/SDL_image-${PV}"
 
-inherit autotools
+inherit autotools pkgconfig
 
 export SDL_CONFIG = "${STAGING_BINDIR_CROSS}/sdl-config"
 
diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
index efaf72d..14f8875 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://alioth.debian.org/frs/download.php/file/3768/ccid-${PV}.tar.b
 SRC_URI[md5sum] = "b6c37110f50b059a8ba94f118cfd679a"
 SRC_URI[sha256sum] = "7aca09fa4b9099e423402fd5df424adbafa502888710d1fda6015b6c1ff637ef"
 
-inherit autotools
+inherit autotools pkgconfig
 
 FILES_${PN} += "${libdir}/pcsc/"
 FILES_${PN}-dbg += "${libdir}/pcsc/drivers/*/*/*/.debug"
diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
index 6c3418a..500dc57 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
 SRC_URI[md5sum] = "cd834da49fbe92dd66df02cc5c61280f"
 SRC_URI[sha256sum] = "15723f0198303d4bcb99d480b7a773918e2d319f0348457988c063bdd03e109a"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 # Use openssl because libgcrypt drops root privileges
 # if libgcrypt is linked with libcap support
diff --git a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
index 3aa5746..2535b8e 100644
--- a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
+++ b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
@@ -13,4 +13,4 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "689b46c2b3ab1a39735ac33f714c4f7f"
 SRC_URI[sha256sum] = "0df60157b052f0e774ade8a8bac59d6e8d4b464058cc55f9208d72e41156811f"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 5f77fe6..1bbb158 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -35,7 +35,7 @@ PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '',
 
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
 
-inherit autotools
+inherit autotools pkgconfig
 
 do_install_append() {
     # Install machine specific configuration file
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
index 00a9635..5a58389 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "1e44049168d1ce55fd56c175f61206955254df0f385455f2a20ec7e8a0
 
 PR = "r3"
 
-inherit autotools systemd
+inherit autotools systemd pkgconfig
 
 EXTRA_OECONF = " \
     --disable-libusb \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
index e50f2b8..107480e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
@@ -6,7 +6,7 @@ DEPENDS = "expat-native pcre-native apr-native apr-util-native"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 
-inherit autotools native
+inherit autotools pkgconfig native
 
 SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \



