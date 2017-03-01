Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 638F460069
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 17:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DF55A1836D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:30:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Ohd6Q45EdXWH
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:30:52 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id E77C4182A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:30:51 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC61C1A07F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:30:51 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B630D1A077
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:30:51 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:30:51 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id A8B5823C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:30:51 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v21HUpjo001226
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 1 Mar 2017 18:30:51 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v21HUp0B001225
	for openembedded-devel@lists.openembedded.org;
	Wed, 1 Mar 2017 18:30:51 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Mar 2017 18:30:49 +0100
Message-Id: <20170301173049.1177-1-pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [PATCH] Make use of the new bb.utils.filter() function
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Mar 2017 17:31:03 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-efl/recipes-efl/e17/e-wm.inc                          |  4 +---
 meta-efl/recipes-efl/efl/efl.inc                           |  2 +-
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb  |  2 +-
 meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb               |  2 +-
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb       |  2 +-
 .../recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb      |  2 +-
 .../gstreamer-0.10/gst-plugins-base_0.10.36.bb             |  2 +-
 .../gstreamer-0.10/gst-plugins-good_0.10.31.bb             |  3 +--
 meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb    |  2 +-
 .../recipes-multimedia/openal/openal-soft_1.15.1.bb        |  5 +----
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb       |  3 +--
 meta-networking/recipes-connectivity/daq/daq_2.0.6.bb      |  2 +-
 .../recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb           |  2 +-
 .../recipes-connectivity/inetutils/inetutils_1.9.4.bb      |  4 ++--
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb  |  3 +--
 .../recipes-connectivity/wolfssl/wolfssl_3.9.0.bb          |  2 +-
 meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb     |  2 +-
 .../recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb        |  6 ++----
 meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb        |  2 +-
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb  |  3 +--
 meta-networking/recipes-daemons/squid/squid_3.5.20.bb      |  2 +-
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb   |  2 +-
 meta-networking/recipes-irc/znc/znc_git.bb                 |  2 +-
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb           |  6 +++---
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb           |  2 +-
 meta-networking/recipes-protocols/quagga/quagga.inc        |  2 +-
 meta-networking/recipes-support/chrony/chrony_2.4.bb       |  2 +-
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc        |  6 +++---
 meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb  |  5 +----
 meta-networking/recipes-support/fping/fping_3.5.bb         |  2 +-
 meta-networking/recipes-support/libldb/libldb_1.1.29.bb    |  2 +-
 .../recipes-support/libtalloc/libtalloc_2.1.8.bb           |  2 +-
 meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb    |  2 +-
 .../recipes-support/libtevent/libtevent_0.9.31.bb          |  2 +-
 meta-networking/recipes-support/mtr/mtr_0.86.bb            |  2 +-
 meta-networking/recipes-support/netcf/netcf_git.bb         |  2 +-
 meta-networking/recipes-support/nis/ypbind-mt_1.38.bb      |  2 +-
 meta-networking/recipes-support/nis/ypbind-mt_2.2.bb       |  2 +-
 meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb         |  2 +-
 .../recipes-support/strongswan/strongswan_5.5.1.bb         |  2 +-
 meta-networking/recipes-support/stunnel/stunnel_5.35.bb    |  4 +---
 meta-networking/recipes-support/tnftp/tnftp_20151004.bb    |  2 +-
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb |  2 +-
 meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb      |  2 +-
 meta-oe/recipes-connectivity/bluez/bluez4.inc              |  6 +-----
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb       |  2 +-
 .../modemmanager/modemmanager_1.6.4.bb                     |  2 +-
 .../networkmanager/networkmanager_1.4.2.bb                 |  8 ++++----
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb              |  2 +-
 meta-oe/recipes-devtools/php/php.inc                       |  3 +--
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb          |  2 +-
 meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb        |  3 +--
 meta-oe/recipes-extended/corosync/corosync_2.4.0.bb        |  2 +-
 meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb    |  2 +-
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb             |  2 +-
 meta-oe/recipes-extended/polkit/polkit_0.113.bb            |  4 ++--
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb           |  2 +-
 meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb          |  2 +-
 meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb         |  3 +--
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb    |  2 +-
 .../recipes-extended/smartmontools/smartmontools_6.5.bb    |  4 +---
 meta-oe/recipes-graphics/fbida/fbida_2.10.bb               | 14 +++++++-------
 .../recipes-graphics/terminus-font/terminus-font_4.38.bb   |  2 +-
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb       |  2 +-
 .../recipes-support/canonical-multitouch/frame_2.5.0.bb    |  2 +-
 .../recipes-support/canonical-multitouch/grail_3.1.1.bb    |  2 +-
 meta-oe/recipes-support/emacs/emacs.inc                    |  4 ++--
 meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb               |  2 +-
 meta-oe/recipes-support/freerdp/freerdp_git.bb             | 12 ++++--------
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb   |  2 +-
 meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb         |  2 +-
 meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb    |  5 ++---
 .../recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb  |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc                      |  2 +-
 meta-oe/recipes-support/mysql/mariadb.inc                  |  2 +-
 meta-oe/recipes-support/openct/openct_0.6.20.bb            |  2 +-
 meta-oe/recipes-support/openldap/openldap_2.4.44.bb        |  2 +-
 meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb         |  2 +-
 meta-oe/recipes-support/postgresql/postgresql.inc          |  2 +-
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc            |  3 +--
 meta-oe/recipes-support/udisks/udisks2_2.1.7.bb            |  2 +-
 meta-oe/recipes-support/udisks/udisks_1.0.5.bb             |  2 +-
 meta-oe/recipes-support/upower/upower_0.99.4.bb            |  2 +-
 meta-oe/recipes-support/vim/vim_8.0.0022.bb                |  3 +--
 meta-oe/recipes-support/zbar/zbar_0.10.bb                  |  2 +-
 meta-oe/recipes-support/zile/zile_2.4.11.bb                |  2 +-
 meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb     |  2 +-
 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb   |  2 +-
 .../recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb         |  2 +-
 .../mailwatch/xfce4-mailwatch-plugin_1.2.0.bb              |  2 +-
 .../xfce4-power-manager/xfce4-power-manager_1.6.0.bb       |  2 +-
 91 files changed, 112 insertions(+), 144 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
index 444ec89..a6e964b 100644
--- a/meta-efl/recipes-efl/e17/e-wm.inc
+++ b/meta-efl/recipes-efl/e17/e-wm.inc
@@ -7,12 +7,10 @@ SRCNAME = "e"
 inherit e update-alternatives gettext pkgconfig
 S = "${WORKDIR}/${SRCNAME}"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 
-
 EXTRA_OECONF = "\
     --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
     --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 5436b40..59ae8d7 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -51,7 +51,7 @@ EXTRA_OECONF_append_class-native = " \
     --disable-image-loader-dds \
 "
 
-PACKAGECONFIG ?= "egl opengl-es gstreamer1 pulseaudio luajit ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
+PACKAGECONFIG ?= "egl opengl-es gstreamer1 pulseaudio luajit ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
 PACKAGECONFIG_class-native = "luajit"
 
 PACKAGECONFIG[wayland] = "--enable-wayland --enable-wayland-ivi-shell,--disable-wayland --disable-wayland-ivi-shell,wayland"
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 8a7425a..a3af09c 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -16,7 +16,7 @@ SRCREV = "0160f6725cfb872e017f3958f108792c3b882872"
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio glib-2.0 libcanberra"
 PACKAGECONFIG[smartcard] = "--enable-smartcard-support,--disable-smartcard-support,nss"
 
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
index 746d73c..62b757f 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
@@ -40,7 +40,7 @@ FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/trash.moun
 
 RRECOMMENDS_gvfsd-ftp += "openssh-sftp openssh-ssh"
 
-PACKAGECONFIG ?= "libgphoto2 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ?= "libgphoto2 ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 PACKAGECONFIG[afc] = "--enable-afc, --disable-afc, libimobiledevice libplist"
 PACKAGECONFIG[archive] = "--enable-archive, --disable-archive, libarchive"
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index c806370..b91f3fa 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -27,7 +27,7 @@ EXTRA_OECONF = "--prefix=${prefix} \
                "
 
 # RDEPEND on systemd optionally
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,,systemd"
 
 EXTRA_OEMAKE += 'libdir=${prefix}/lib'
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
index 54e8697..88981e4 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d96b5bcce
 
 inherit autotools-brokensep pkgconfig lib_package
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
 PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-support,libsndfile1"
 PACKAGECONFIG[jack] = "--enable-jack-support,--disable-jack-support,jack"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse-support,--disable-pulse-support,pulseaudio"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
index eefd993..a3bfa5f 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
@@ -23,7 +23,7 @@ inherit gettext
 
 EXTRA_OECONF += "--disable-freetypetest"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
 PACKAGECONFIG[gnomevfs] = "--enable-gnome_vfs,--disable-gnome_vfs,gnome-vfs"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
index 7e4a525..f993cfc 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 PR = "r8"
 
 PACKAGECONFIG ?= "jpeg v4l \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
 "
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index 1339df6..4c0976e 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -27,7 +27,7 @@ python populate_packages_prepend () {
     do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug data')
 }
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
 PACKAGECONFIG[esound] = "--enable-esd,--disable-esd,esound"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
index 5895234..e0f1a26 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
@@ -9,10 +9,7 @@ SRC_URI = "http://kcat.strangesoft.net/openal-releases/${BP}.tar.bz2"
 SRC_URI[md5sum] = "ea83dec3b9655a27d28e7bc7cae9cd71"
 SRC_URI[sha256sum] = "0e29a162f0841ccb4135ce76e92e8a704589b680a85eddf76f898de5236eb056"
 
-PACKAGECONFIG ?= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
 PACKAGECONFIG[alsa] = "-DALSA=TRUE, -DALSA=FALSE, alsa-lib"
 PACKAGECONFIG[pulseaudio] = "-DPULSEAUDIO=TRUE, -DPULSEAUDIO=FALSE, pulseaudio"
 # currently doesn't work with libav-9
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index 4b73aa3..ada958b 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -8,8 +8,7 @@ DEPENDS = "libpng ffmpeg libsndfile1 libvorbis"
 
 PR = "r2"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
                    magic \
 "
 PACKAGECONFIG[pulseaudio] = "--with-pulseaudio=dyn,--with-pulseaudio=no,pulseaudio,"
diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
index 3ed3aab..952d7a4 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
 EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${includedir} \
     --with-libpcap-includes=${STAGING_INCDIR} --with-dnet-includes=${STAGING_LIBDIR}"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb
index 197dfb1..cb3b5c2 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "5abd12c4df2947d608f60a35227f9bf8ae8ab9de06ce975cdab1144d8f
 
 inherit autotools-brokensep
 
-PACKAGECONFIG ?= "udev ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
+PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index e3f5aa3..b42b197 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -34,7 +34,7 @@ acpaths = "-I ./m4"
 SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
 
 PACKAGECONFIG ??= "ftp uucpd \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6 ping6', '', d)} \
                   "
 PACKAGECONFIG[ftp] = "--enable-ftp,--disable-ftp,readline"
@@ -153,7 +153,7 @@ ALTERNATIVE_LINK_NAME[ifconfig]  = "${base_sbindir}/ifconfig"
 ALTERNATIVE_${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping]   = "${base_bindir}/ping"
 
-ALTERNATIVE_${PN}-ping6 = "${@bb.utils.contains('PACKAGECONFIG', 'ping6', 'ping6', '', d)}"
+ALTERNATIVE_${PN}-ping6 = "${@bb.utils.filter('PACKAGECONFIG', 'ping6', d)}"
 ALTERNATIVE_LINK_NAME[ping6]  = "${base_bindir}/ping6"
 
 
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 0ba59c7..1d9ed7c 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -48,8 +48,7 @@ SYSTEMD_PACKAGES = "${PN}-base winbind"
 SYSTEMD_SERVICE_${PN}-base = "nmb.service smb.service"
 SYSTEMD_SERVICE_winbind = "winbind.service"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'zeroconf', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd zeroconf', d)} \
                    acl cups ldap \
 "
 
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.9.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.9.0.bb
index 0040f67..afae3c8 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.9.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.9.0.bb
@@ -19,5 +19,5 @@ SRC_URI[sha256sum] = "98f50244f7b43f8683bd0cf5c599849d330e75e6cf077e96f14e83bda8
 
 inherit autotools
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
index 4a888c8..8d55596 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
@@ -36,7 +36,7 @@ CFLAGS += "${LDFLAGS}"
 
 PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd,systemd"
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 EXTRA_OEMAKE = "DONTSTRIP=1"
 EXTRA_OECONF += "--disable-mount-locking \
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 69df274..61b7ad4 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -24,10 +24,8 @@ EXTRA_OECONF += "--with-dblib=berkeley \
                  andrew_cv_runpath_switch=none"
 
 PACKAGECONFIG ??= "ntlm \
-        ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
-        ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-        ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
-        "
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 ldap pam', d)} \
+"
 PACKAGECONFIG[gssapi] = "--enable-gssapi=yes,--enable-gssapi=no,krb5,"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[opie] = "--with-opie,--without-opie,opie,"
diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
index b5851a9..126878f 100644
--- a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
+++ b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
@@ -22,7 +22,7 @@ SYSTEMD_SERVICE_${PN} = "dnrd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 inherit autotools
-inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
 
 do_install() {
     oe_runmake install DESTDIR=${D} INSTALL="install -p"
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb
index c27a1cc..73efac2 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb
@@ -20,8 +20,7 @@ SRC_URI[sha256sum] = "afc1789f2478acf88dfdc7d70da90a4fa2786d628218e9574273295d04
 inherit autotools-brokensep useradd update-rc.d systemd
 
 PACKAGECONFIG ??= "shadow \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
                   "
 
 PACKAGECONFIG[curses] = "--enable-curses --enable-ncurses, --disable-curses --disable-ncurses, ncurses"
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
index fc7f768..2e9e1f1 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
@@ -39,7 +39,7 @@ USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --she
 PACKAGECONFIG ??= "${@bb.utils.contains('TARGET_ARCH', 'powerpc', 'noatomics', '', d)} \
                    ${@bb.utils.contains('TARGET_ARCH', 'mips', 'noatomics', '', d)} \
                    ${@bb.utils.contains('TARGET_ARCH', 'mipsel', 'noatomics', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
                   "
 PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
 PACKAGECONFIG[noatomics] = "squid_cv_gnu_atomics=no,squid_cv_gnu_atomics=yes,,"
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 5932f85..7f56713 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -37,7 +37,7 @@ export AR = "${HOST_PREFIX}ar cq"
 
 EXTRA_OECONF += "--disable-option-checking"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 # configure.in has errors
diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
index f3345a9..c2d7156 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 # ZNC has a custom autogen.sh that states that this command is needed *and* expected to fail
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index 8f08acf..d61636e 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -36,14 +36,14 @@ CFLAGS += " -D_GNU_SOURCE -Wno-deprecated-declarations"
 LDFLAGS += " -L${STAGING_LIBDIR} -lutil -lcrypt"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam", "", d)}"
+PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = " , --without-pam, libpam, libpam"
 
 do_configure () {
     ./configure --prefix=${prefix} --exec-prefix=${exec_prefix}
     echo "INSTALLROOT=${D}" > MCONFIG
 
-    if [ "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'pam', d)}" ]; then
         echo "USE_PAM=1" >> MCONFIG
     fi
 
@@ -65,7 +65,7 @@ do_install () {
     'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
     'MANDIR=${mandir}' install
 
-    if [ "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'pam', d)}" ]; then
         install -d ${D}${sysconfdir}/pam.d
         install -m 0644 debian/hosts.equiv ${D}/${sysconfdir}
         install -m 0644 ${WORKDIR}/rexec.pam ${D}/${sysconfdir}/pam.d/rexec
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 79e7766..b60a246 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
 PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
 
 EXTRA_OECONF = "--disable-embedded-perl \
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index bf0b89e..13dc4dd 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -37,7 +37,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
            file://zebra.service \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
 
diff --git a/meta-networking/recipes-support/chrony/chrony_2.4.bb b/meta-networking/recipes-support/chrony/chrony_2.4.bb
index deb2148..ad81701 100644
--- a/meta-networking/recipes-support/chrony/chrony_2.4.bb
+++ b/meta-networking/recipes-support/chrony/chrony_2.4.bb
@@ -59,7 +59,7 @@ inherit update-rc.d systemd
 #   - 'scfilter' enables support for system call filtering, but requires the
 #     kernel to have CONFIG_SECCOMP enabled.
 PACKAGECONFIG ??= "editline scfilter \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 PACKAGECONFIG[readline] = "--without-editline,--without-readline,readline"
 PACKAGECONFIG[editline] = ",--without-editline,libedit"
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 424a06b..ef79c5f 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -53,7 +53,7 @@ do_install () {
 
     install -d ${D}${systemd_unitdir}/system
 
-    if [ "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'resolvconf', d)}" ]; then
         install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
     else
         install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
@@ -61,11 +61,11 @@ do_install () {
 
     install -m 0755 ${S}/contrib/lease-tools/dhcp_release ${D}${bindir}
 
-    if [ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'dbus', d)}" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
     fi
-    if [ "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'resolvconf', d)}" ]; then
         install -d ${D}${sysconfdir}/resolvconf/update.d/
         install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
 
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
index 66af361..b2ead4b 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
@@ -16,10 +16,7 @@ DEPENDS = "openssl xz zlib bzip2 libcap icu"
 
 inherit autotools pkgconfig systemd useradd
 
-PACKAGECONFIG ??= " \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                  "
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ldap pam', d)}"
 
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[ldap] = "--with-ldap=plugin,--without-ldap,openldap,"
diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb b/meta-networking/recipes-support/fping/fping_3.5.bb
index 2f5f2b6..82e3bf0 100644
--- a/meta-networking/recipes-support/fping/fping_3.5.bb
+++ b/meta-networking/recipes-support/fping/fping_3.5.bb
@@ -21,5 +21,5 @@ inherit autotools
 
 EXTRA_OECONF = "--enable-ipv4"
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.29.bb b/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
index 28cb847..a90919b 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
           "
 
 PACKAGECONFIG ??= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
index 26bd1d5..0283088 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "22d14911164d4de67ff76b5269fa5250d01f78c955bc77e28615350996
 inherit waf-samba
 
 PACKAGECONFIG ??= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
index fa1f0c5..e256ac9 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
@@ -14,7 +14,7 @@ SRC_URI[md5sum] = "d9627e7aacd535a8251401f914bb6924"
 SRC_URI[sha256sum] = "60134e32253cac8e2efe5e0185d20123c208bcf6ad15edf2f50d80daadf8c348"
 
 PACKAGECONFIG ??= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
index f9657d2..ad711e7 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "4a13f2256ad804c860e84068258bd0f8be31cf0c79aa8f3019fa32f692
 inherit waf-samba
 
 PACKAGECONFIG ??= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
diff --git a/meta-networking/recipes-support/mtr/mtr_0.86.bb b/meta-networking/recipes-support/mtr/mtr_0.86.bb
index 1d8a2cf..92f4f3c 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.86.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.86.bb
@@ -17,5 +17,5 @@ inherit autotools
 
 EXTRA_OECONF = "--without-gtk"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index ed713ac..90c77c9 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -20,7 +20,7 @@ inherit gettext autotools pkgconfig systemd
 
 EXTRA_OECONF_append_class-target = " --with-driver=redhat"
 
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
 
 do_configure_prepend() {
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
index 9fc6406..b9c0aa7 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
@@ -19,7 +19,7 @@ This is the final IPv4-only version of ypbind-mt. \
 HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
 DEPENDS = " \
            yp-tools \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+           ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
           "
 RDEPENDS_${PN} += "yp-tools"
 
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
index 82544e7..5e00567 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
@@ -15,7 +15,7 @@ of known secure NIS server (/etc/yp.conf) Binds to \
 the server which answered as first. \
 "
 HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
-DEPENDS = "yp-tools ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+DEPENDS = "yp-tools ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PROVIDES += "ypbind"
 
 PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
index 9d74c96..58b31c5 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
@@ -47,7 +47,7 @@ USERADD_PARAM_${PN} = "--system --home-dir ${NTP_USER_HOME} \
 
 # NB: debug is default-enabled by NTP; keep it default-enabled here.
 PACKAGECONFIG ??= "cap debug refclocks openssl \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           --with-openssl-incdir=${STAGING_INCDIR} \
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
index 9c11904..f9e7ae3 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
@@ -22,7 +22,7 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-syst
 
 
 PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
-        ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
+        ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,"
 PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
index 51369f4..3e2e2c2 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
@@ -16,8 +16,6 @@ inherit autotools
 
 EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
-"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)}"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-networking/recipes-support/tnftp/tnftp_20151004.bb b/meta-networking/recipes-support/tnftp/tnftp_20151004.bb
index 8c2c111..83ad11b 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20151004.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20151004.bb
@@ -33,7 +33,7 @@ SRC_URI[md5sum] = "a49fbe752318d5a7893f900046ea00d5"
 SRC_URI[sha256sum] = "c94a8a49d3f4aec1965feea831d4d5bf6f90c65fd8381ee0863d11a5029a43a0"
 
 PACKAGECONFIG ?= "openssl \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 PACKAGECONFIG[openssl] = "--enable-ssl, --disable-ssl --with-ssl=no, openssl"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 72553cf..823e07c 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -38,7 +38,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 #The CUSTOM_LDSCRIPTS doesn't work with the gold linker
 inherit cpan-base
 do_configure() {
-    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
       sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile
     fi
 
diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
index fdf54e3..708c71f 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.ori
 SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
 SRC_URI[sha256sum] = "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)}"
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[aio] = "--enable-aio,--disable-aio,libaio,"
 PACKAGECONFIG[mysql] = "--with-mysql \
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4.inc b/meta-oe/recipes-connectivity/bluez/bluez4.inc
index 59c35e4..5240ccf 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez4.inc
+++ b/meta-oe/recipes-connectivity/bluez/bluez4.inc
@@ -15,11 +15,7 @@ RCONFLICTS_${PN} += "${PN}-systemd"
 DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline libsndfile1"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
-PACKAGECONFIG ??= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '', d)} \
-"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pie systemd', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,"
 PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index 1d367ad..b22f820 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2"
 DEPENDS = "glib-2.0 intltool-native"
 X11DEPENDS = " libxpm gtk+"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 PACKAGECONFIG[libical] = "--enable-libical,--disable-libical,libical"
 PACKAGECONFIG[pcsc-lite] = "--enable-libpcsclite,--disable-libpcsclite,pcsc-lite"
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
index 5e4e220..e60cd4b 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "cdd5b4cb1e4d7643643a28ccbfc4bb354bfa9cb89a77ea160ebdf79261
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi polkit \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
 
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.2.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.2.bb
index 90d0232..064c58b 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.2.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.2.bb
@@ -48,9 +48,9 @@ do_compile_prepend() {
 }
 
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
-    ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','bluetooth','${BLUEZ}','',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','wifi','wifi','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi', d)} \
 "
 PACKAGECONFIG[systemd] = " \
     --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
@@ -95,7 +95,7 @@ FILES_${PN} += " \
 "
 
 RRECOMMENDS_${PN} += "iptables \
-    ${@bb.utils.contains('PACKAGECONFIG','dnsmasq','dnsmasq','',d)} \
+    ${@bb.utils.filter('PACKAGECONFIG', 'dnsmasq', d)} \
 "
 RCONFLICTS_${PN} = "connman"
 
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 8ae0185..8f4e5b1 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 
diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index c4fb1d9..f882e32 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -69,8 +69,7 @@ EXTRA_OECONF_class-native = " \
 "
 
 PACKAGECONFIG ??= "mysql sqlite3 imap \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
 "
 PACKAGECONFIG_class-native = ""
 
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 402c42e..0849e88 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "53e15a2b5c1bc80161d42e9f69792a3fa18332b7b771910131004eb520
 
 S = "${WORKDIR}/imap-${PV}"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = ",,libpam"
 
 EXTRA_OEMAKE = "CC='${CC}' ARRC='${AR} -rc' RANLIB='${RANLIB}'"
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
index 68a15f8..4aa8ded 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
@@ -31,8 +31,7 @@ SYSTEMD_SERVICE_${PN} = "cfengine3.service cfengine3-web.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
 PACKAGECONFIG ??= "libpcre openssl \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)} \
 "
 PACKAGECONFIG[libxml2] = "--with-libxml2=yes,--with-libxml2=no,libxml2,"
 PACKAGECONFIG[mysql] = "--with-mysql=yes,--with-mysql=no,mysql,"
diff --git a/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb b/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb
index a213a27..c168e0c 100644
--- a/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb
+++ b/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb
@@ -21,7 +21,7 @@ SYSTEMD_AUTO_ENABLE = "enable"
 
 INITSCRIPT_NAME = "corosync-daemon"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_unitdir}/system/,--with-systemddir="
 
diff --git a/meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb b/meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb
index 3488b19..64a258b 100644
--- a/meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb
+++ b/meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb
@@ -19,5 +19,5 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-man-pages"
 
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--enable-journal, --disable-journal, systemd"
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 24631e4..3424669 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -42,7 +42,7 @@ EXTRA_OECONF_append_armv4 = " \
     --disable-methodjit \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
 
 # mozjs requires autoreconf 2.13
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
index daafaf5..326c934 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
@@ -9,8 +9,8 @@ DEPENDS = "expat glib-2.0 intltool-native mozjs"
 
 inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection
 
-PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                 ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+                 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit', d)}"
 
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
 PACKAGECONFIG[systemd] = "--enable-libsystemd-login=yes --with-systemdsystemunitdir=${systemd_unitdir}/system/,--enable-libsystemd-login=no --with-systemdsystemunitdir=,systemd"
diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
index a112168..4025b80 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
+++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
@@ -44,7 +44,7 @@ do_install() {
     fi
 }
 
-inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','',d)}
+inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "rarpd.service"
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
index f168c16..a3aac45 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
@@ -24,7 +24,7 @@ SYSTEMD_SERVICE_rrdcached = "rrdcached.socket rrdcached.service"
 
 EXTRA_AUTORECONF = "-I m4"
 
-PACKAGECONFIG ??= "python perl ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ??= "python perl ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 PACKAGECONFIG[python] = "--enable-python=yes \
 am_cv_python_pythondir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages \
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
index 62126f8..70abb18 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
@@ -37,8 +37,7 @@ EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
 PACKAGECONFIG ??= " \
     rsyslogd rsyslogrt klog inet regexp uuid libgcrypt \
     imdiag gnutls imfile \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'snmp', 'snmp', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'snmp systemd', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'testbench relp ${VALGRIND}', '', d)} \
 "
 
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 84e465d..fa75fcc 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -25,7 +25,7 @@ SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
 
 inherit autotools
-inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "sblim-sfcb.service"
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.5.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.5.bb
index 55d366e..0970d2a 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.5.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.5.bb
@@ -18,9 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
     file://smartd.service \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'libcap-ng', 'libcap-ng', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)}"
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
index 6e786f2..e0f8128 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
@@ -34,25 +34,25 @@ do_compile() {
 
     # Be sure to respect preferences (force to "no")
     # Also avoid issues when ${BUILD_ARCH} == ${HOST_ARCH}
-    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'curl', 'curl', '', d)}" ]; then
+    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'curl', d)}" ]; then
         sed -i -e '/^HAVE_LIBCURL/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'gif', 'gif', '', d)}" ]; then
+    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'gif', d)}" ]; then
         sed -i -e '/^HAVE_LIBGIF/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'png', 'png', '', d)}" ]; then
+    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'png', d)}" ]; then
         sed -i -e '/^HAVE_LIBPNG/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'tiff', 'tiff', '', d)}" ]; then
+    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'tiff', d)}" ]; then
         sed -i -e '/^HAVE_LIBTIFF/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'motif', 'motif', '', d)}" ]; then
+    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'motif', d)}" ]; then
         sed -i -e '/^HAVE_MOTIF/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'webp', 'webp', '', d)}" ]; then
+    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'webp', d)}" ]; then
         sed -i -e '/^HAVE_LIBWEBP/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'lirc', 'lirc', '', d)}" ]; then
+    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'lirc', d)}" ]; then
         sed -i -e '/^HAVE_LIBLIRC/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
 
diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
index de8038a..b4b1641 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "f6f4876a4dabe6a37c270c20bb9e141e38fb50e0bba200e1b9d0470e5e
 
 inherit allarch fontcache
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = ""
 
 # Don't use font cache mecanism for console packages
diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
index 9d31c92..d53dff6 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
@@ -24,5 +24,5 @@ EXTRA_OECONF = "\
     --enable-threads \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
diff --git a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
index 0ad10a4..d5a7338 100644
--- a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/v${PV}/+download/${BPN}-${PV}.tar.
 SRC_URI[md5sum] = "02baa941091c5d198cd1623b3ad36e68"
 SRC_URI[sha256sum] = "cfb9ab52cdccd926f1822a457264d0014c7eb9f4600a72626063dd073b26256f"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--enable-x11, --disable-x11, libxi xext virtual/xserver"
 
 PACKAGE_BEFORE_PN += "${PN}-test"
diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
index 3026744..e654a40 100644
--- a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.b
 SRC_URI[md5sum] = "0df1b3ec6167920f310e2effe6e2ad44"
 SRC_URI[sha256sum] = "5eed1f650f042481daa3a2de5e7d43261fe343b2a1b1e240f3b7fc26572c9df3"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--with-x11, --without-x11, libxi"
 
 PACKAGE_BEFORE_PN += "${PN}-test"
diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index 012895e..5b905f9 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -18,7 +18,7 @@ X11DEPENDS = " \
 
 EXTRA_OECONF =  "--without-sound --with-crt-dir=${STAGING_LIBDIR} "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--with-x-toolkit=gtk,--without-x --without-dbus,${X11DEPENDS}"
 
 
@@ -86,7 +86,7 @@ do_compile_prepend() {
     ${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \
     ${STAGING_DIR_TARGET}/${base_libdir}/libpthread* $treedir/${base_libdir}/
 
-    if [ ! -z "${@bb.utils.contains('PACKAGECONFIG', 'x11', 'x11', '', d)}" ] ; then
+    if [ ! -z "${@bb.utils.filter('PACKAGECONFIG', 'x11', d)}" ]; then
         echo "X11 build enabled"
         # copy only as much stuff as we need
         # before: 5.5G   ../../qemu-treedir/
diff --git a/meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb b/meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb
index f08d547..801c8e7 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb
@@ -27,7 +27,7 @@ EXTRA_OECONF = "--enable-shared \
                 --enable-xft \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
 PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 339a053..f2d0a4d 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -32,14 +32,10 @@ EXTRA_OECMAKE += " \
     -DWITH_MANPAGES=OFF \
 "
 
-PACKAGECONFIG ??= "  \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
-                ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
-                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}\
-                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}\
-                ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}\
-                gstreamer cups \
-                "
+PACKAGECONFIG ??= " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb pam pulseaudio wayland x11', d)}\
+    gstreamer cups \
+"
 
 X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
 PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
index cfaa7c3..960cb00 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
@@ -23,7 +23,7 @@ inherit autotools pkgconfig update-alternatives
 EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl --disable-openmp --without-xml --disable-opencl"
 
 CACHED_CONFIGUREVARS = "ac_cv_sys_file_offset_bits=yes"
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[graphviz] = "--with-gvc,--without-gvc,graphviz"
 PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
index aa3700d..ee0766e 100644
--- a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
+++ b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
@@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "884c1f3d8bfb0b33c303973d286c3166f5a537976451a0312e3524af54
 inherit autotools-brokensep pkgconfig systemd
 
 PACKAGECONFIG ?= "lanplus gpl"
-PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--enable-systemd=${datadir}/${BPN}, --enable-systemd=no"
 PACKAGECONFIG[sha256] = "--enable-sha256, --enable-sha256=no, openssl-native, openssl"
 PACKAGECONFIG[lanplus] = "--enable-lanplus, --enable-lanplus=no, openssl-native, openssl"
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
index f473775..72c93ab 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
@@ -22,9 +22,8 @@ EXTRA_OECONF = "\
     --disable-lynx \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','alsa','alsa','',d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES','pulseaudio','pulseaudio','',d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES','x11','gtk gtk3','',d)} \
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk gtk3', '', d)} \
 "
 PACKAGECONFIG[alsa] = "--enable-alsa, --disable-alsa, alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse, --disable-pulse, pulseaudio"
diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
index 2a006b5..b22cc73 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
@@ -15,7 +15,7 @@ EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
 
 PACKAGECONFIG ?= "curl"
 PACKAGECONFIG_append_class-target = "\
-        ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
+        ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
 "
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 2bb0134..b25d775 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -19,7 +19,7 @@ inherit autotools-brokensep pkgconfig systemd
 
 LVM2_PACKAGECONFIG = "dmeventd lvmetad"
 LVM2_PACKAGECONFIG_append_class-target = " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
     thin-provisioning-tools \
     udev \
 "
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 689b8ab..0a0caa3 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -48,7 +48,7 @@ FILES_${PN}-setupdb = "${sysconfdir}/init.d/install_db"
 
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} setupdb"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} setupdb"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index 85ca851..0f5568c 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
 SYSTEMD_SERVICE_${PN} += "openct.service "
 SYSTEMD_AUTO_ENABLE = "enable"
 
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
index e8e0c85..4b7ed35 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
@@ -54,7 +54,7 @@ EXTRA_OECONF += "--enable-dynamic"
 
 PACKAGECONFIG ??= "gnutls modules \
                    mdb ldap meta monitor null passwd shell proxycache dnssrv \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
 PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls libgcrypt"
diff --git a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
index f5896e6..542627d 100644
--- a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
+++ b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
@@ -93,7 +93,7 @@ do_install() {
     touch ${D}/var/lib/openwbem/{classassociation,instances,instassociation,namespaces,schema}.{dat,ndx,lock}
 }
 
-inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
 SYSTEMD_SERVICE_${PN} = "owcimomd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 FILES_${PN} += " \
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index dd41188..812c2ae 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -54,7 +54,7 @@ pkg_postinst_${PN} () {
     fi
 }
 
-enable_pam = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+enable_pam = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 21d1748..7ce2f80 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -41,8 +41,7 @@ CONFIG_TLS = "--enable-thread-tls"
 CONFIG_TLS_arm = "${@base_conditional( "DEBUG_BUILD", "1", " --disable-thread-tls", " --enable-thread-tls", d )}"
 
 PACKAGECONFIG ??= "openssl \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
 "
 PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl,openssl,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
index 976d36a..d8f7eaa 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
 
 DEPENDS = "acl libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native libxslt-native"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 RDEPENDS_${PN} = "acl"
 
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
index 7df49a3..ffe2c26 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
@@ -7,7 +7,7 @@ DEPENDS = "libatasmart sg3-utils polkit libgudev dbus-glib glib-2.0 intltool-nat
 "
 # optional dependencies: device-mapper parted
 
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
     dbus-glib-native \
 "
 
diff --git a/meta-oe/recipes-support/upower/upower_0.99.4.bb b/meta-oe/recipes-support/upower/upower_0.99.4.bb
index 44a04de..3651e18 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.4.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.4.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "9ca325a6ccef505529b268ebbbd9becd0ce65a65f6ac7ee31e2e5b1764
 
 inherit autotools pkgconfig gettext gobject-introspection systemd
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[idevice] = "--with-idevice,--without-idevice,libimobiledevice libplist"
 PACKAGECONFIG[systemd] = "--with-systemdutildir=${systemd_unitdir} --with-systemdsystemunitdir=${systemd_system_unitdir}, \
                           --without-systemdutildir --without-systemdsystemunitdir,systemd"
diff --git a/meta-oe/recipes-support/vim/vim_8.0.0022.bb b/meta-oe/recipes-support/vim/vim_8.0.0022.bb
index 126fe61..1ccc52c 100644
--- a/meta-oe/recipes-support/vim/vim_8.0.0022.bb
+++ b/meta-oe/recipes-support/vim/vim_8.0.0022.bb
@@ -32,8 +32,7 @@ do_configure () {
 
 #Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
 PACKAGECONFIG ??= ""
-PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
-PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
 PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
diff --git a/meta-oe/recipes-support/zbar/zbar_0.10.bb b/meta-oe/recipes-support/zbar/zbar_0.10.bb
index 77733aa..6b6e501 100644
--- a/meta-oe/recipes-support/zbar/zbar_0.10.bb
+++ b/meta-oe/recipes-support/zbar/zbar_0.10.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "234efb39dbbe5cef4189cc76f37afbe3cfcfb45ae52493bfe8e191318b
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG = "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)}"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
 PACKAGECONFIG[x11] = "--with-x,-without-x,libxcb libx11 libsm libxau libxext libxv libice libxdmcp"
 
diff --git a/meta-oe/recipes-support/zile/zile_2.4.11.bb b/meta-oe/recipes-support/zile/zile_2.4.11.bb
index b3f1918..ff0517c 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.11.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.11.bb
@@ -15,6 +15,6 @@ SRC_URI[sha256sum] = "1fd27bbddc61491b1fbb29a345d0d344734aa9e80cfa07b02892eedf83
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
 
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
index 60f6fb9..0ba7d3c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
@@ -57,7 +57,7 @@ EXTRA_OECONF = "--enable-ssl \
     --enable-mpms-shared \
     ac_cv_have_threadsafe_pollset=no"
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[openldap] = "--enable-ldap --enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
 
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 82fbb77..9d22985 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "042b5687b1a3db3ca818167548ce5d32c35e227c6640732dcb622a6f4a
 
 inherit autotools pkgconfig binconfig update-rc.d systemd
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ffmpeg] = "--with-ffmpeg,--without-ffmpeg,libav"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[geoip] = "--with-geoip,--without-geoip,geoip"
diff --git a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
index 99e58bd..8b2ff44 100644
--- a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
+++ b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
@@ -12,5 +12,5 @@ SRC_URI[sha256sum] = "ab327462cb99894a3699f874425a421d934f957cb24221f00bb888108d
 
 inherit autotools
 
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb
index 8d4e77e..c822414 100644
--- a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb
@@ -10,5 +10,5 @@ DEPENDS += "gnutls libgcrypt"
 SRC_URI[md5sum] = "7263114ec0f2987a3aff15afeeb45577"
 SRC_URI[sha256sum] = "624acc8229a8593c0dfeb28f883f4958119a715cc81cecdbaf29efc8ab1edcad"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
index e69118c..08d00df 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
@@ -20,7 +20,7 @@ EXTRA_OECONF = " \
     --enable-panel-plugins \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--enable-polkit, --disable-polkit, polkit"
 
 PACKAGES += "xfce4-powermanager-plugin"
-- 
2.9.0


