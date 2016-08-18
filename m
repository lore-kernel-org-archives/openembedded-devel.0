Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4FD7687B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:00:17 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so424504wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nwbJdu51AfmcXpv1/DhlubdT37iQl+SZUQNAewfs9dQ=;
	b=e18axIEVldR5vB0l/jaLMiRoO0QW2hw12c2WhYjtjQiNtwolpA+yFb9qtObjieZ+ct
	VqU3KYD+QwLCywT8n0GzSOI7dA8ck6CLE857YKljOt6QkrQuN4wBdeUvmQUpq9MaHljr
	Z8anVUOFwkidbYxCr0ZB7fHup0TGtjwfiV4J5Cft31P0Lz5Msxtr/2o+LA290tkjQitJ
	1e3TjBlBIQ1m2wqgcOjyLlsbIYgvT1DvCD7GluZT8XRbV62oDZVnwj4akz1kbRt2EzYJ
	HHfSHC360orv73HlVFcsrn2CMrKpD+6Vu2Kqb+OxSfze8r1aXAhgIxYGU3cEp9bhV2p7
	gv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nwbJdu51AfmcXpv1/DhlubdT37iQl+SZUQNAewfs9dQ=;
	b=iEKCJNsKRUVlpxFfJ6Rn0BlJ6b9DSNCG5/Cite/wRLrgT5O6K4hDsDxfvE1lil/APW
	vVkbz9aqysXPh99XdOdz6dTlUeE5J4DBCf9gKhAXv5QmGywB3U/wKyabJgB/adJ5sb6M
	JnENI6qG5POmf0f2kW5RNozAAsJxyvz7JPSC0cfL7nyh7yFVRkdIopY1WWYzKx29QBIl
	RRAcjWXGhaahAdWBMT4Ed9NlnPVQJ2HFjzXkZka4/X7mgRKJ4/TwWjwngkMTf1f7K5ZE
	6rv8tIzixqZ1yDgXn9YfWogKIwr/1Cf60MzlON/ctmFL2vpGj+ZwcOI3Cu9mUVoXwQ1u
	MtUQ==
X-Gm-Message-State: AEkoous9gQvwarkq6hD9Uw66cjPmMzDtRE6NZXtMFaOHm620Fh2lPGDD4uM+2cSCN11N0g==
X-Received: by 10.194.96.205 with SMTP id du13mr2798633wjb.89.1471539616991;
	Thu, 18 Aug 2016 10:00:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id p4sm3069713wjq.27.2016.08.18.10.00.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 10:00:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2016 19:00:10 +0200
Message-Id: <20160818170012.5819-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [meta-oe][PATCH 1/3] meta-oe: fix indentation
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
X-List-Received-Date: Thu, 18 Aug 2016 17:00:24 -0000

* remove tabs which sneaked in since last cleanup
* meta-oe layers are using consistent indentation with 4 spaces, see
  http://www.openembedded.org/wiki/Styleguide

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../unionfs-fuse/unionfs-fuse_0.26.bb              |   2 +-
 .../recipes-utils/dmapi/dmapi_2.2.12.bb            |   2 +-
 .../recipes-utils/xfsdump/xfsdump_3.1.4.bb         |   4 +-
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   |   4 +-
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb     |  10 +-
 .../gnome-panel/gnome-panel_2.32.1.bb              |   7 +-
 .../libart-lgpl/libart-lgpl_2.3.21.bb              |   2 +-
 .../recipes-devtools/grubby/grubby_8.40.bb         |   6 +-
 .../gstreamer-0.10/gst-plugins-bad_0.10.23.bb      |   4 +-
 .../gstreamer-0.10/gst-plugins-base_0.10.36.bb     |   4 +-
 .../gstreamer-0.10/gst-plugins-good_0.10.31.bb     |   4 +-
 .../gstreamer-0.10/gst-plugins-ugly_0.10.19.bb     |   4 +-
 .../gstreamer-0.10/gst-plugins.inc                 |   6 +-
 .../gstreamer-0.10/gstreamer_0.10.36.bb            |   2 +-
 .../sample-content/bigbuckbunny-1080p.bb           |   4 +-
 .../sample-content/bigbuckbunny-480p.bb            |   4 +-
 .../sample-content/bigbuckbunny-720p.bb            |   4 +-
 .../sample-content/tearsofsteel-1080p.bb           |   4 +-
 .../recipes-support/libsrtp/libsrtp_1.5.2.bb       |   2 +-
 .../recipes-connectivity/daq/daq_2.0.6.bb          |   2 +-
 .../recipes-daemons/autofs/autofs_5.1.1.bb         |   4 +-
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |  16 ++--
 meta-networking/recipes-daemons/radvd/radvd.inc    |   2 +-
 .../recipes-daemons/squid/squid_3.5.20.bb          |   8 +-
 .../recipes-daemons/vsftpd/vsftpd_3.0.3.bb         |  10 +-
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   |   5 +-
 .../recipes-protocols/quagga/quagga.inc            |   2 +-
 .../recipes-support/chrony/chrony_2.4.bb           |   5 +-
 .../cim-schema/cim-schema-exper_2.39.0.bb          |  24 ++---
 .../cim-schema/cim-schema-final_2.40.0.bb          |  28 +++---
 .../recipes-support/curlpp/curlpp_0.7.3.bb         |  14 +--
 .../recipes-support/geoip/geoip-perl_1.45.bb       |  10 +-
 .../recipes-support/geoip/geoip_1.6.9.bb           |  45 ++++-----
 .../lksctp-tools/lksctp-tools_1.0.16.bb            |  18 ++--
 .../lowpan-tools/lowpan-tools_git.bb               |   2 +-
 .../recipes-support/nuttcp/nuttcp_7.2.1.bb         |   6 +-
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb |   6 +-
 .../recipes-support/ssmping/ssmping_0.9.1.bb       |   4 +-
 .../recipes-support/tcpdump/tcpdump_4.7.4.bb       |   2 +-
 .../recipes-support/tcpdump/tcpslice_1.2a3.bb      |  14 +--
 .../recipes-support/tnftp/tnftp_20151004.bb        |   4 +-
 .../analyze-suspend/analyze-suspend_git.bb         |   4 +-
 .../phoronix-test-suite_6.0.1.bb                   |  24 ++---
 .../recipes-connectivity/gnokii/gnokii_0.6.31.bb   |   5 +-
 .../recipes-connectivity/linuxptp/linuxptp_1.6.bb  |   2 +-
 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb    |  10 +-
 .../smstools3/smstools3_3.1.15.bb                  |  40 ++++----
 .../telepathy/libtelepathy_0.3.3.bb                |   7 +-
 .../telepathy/telepathy-mission-control_5.16.1.bb  |  18 ++--
 .../recipes-connectivity/thrift/thrift_0.9.3.bb    |   2 +-
 .../recipes-connectivity/zabbix/zabbix_2.4.7.bb    |  31 +++---
 .../recipes-connectivity/zeromq/zeromq_4.1.5.bb    |  12 +--
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb    |  31 +++---
 meta-oe/recipes-core/usleep/usleep_1.0.bb          |  14 +--
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |   2 +-
 meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb      |  19 ++--
 meta-oe/recipes-devtools/pmtools/pmtools_git.bb    |  14 +--
 .../recipes-devtools/xerces-c/xerces-c_3.1.4.bb    |  25 ++---
 .../recipes-extended/cfengine/cfengine_3.9.0.bb    |  20 ++--
 .../recipes-extended/corosync/corosync_2.4.0.bb    |   2 +-
 meta-oe/recipes-extended/haveged/haveged_1.9.1.bb  |  20 ++--
 .../mml-widget/gtkmathview_0.8.0.bb                |   6 +-
 meta-oe/recipes-extended/polkit/polkit_0.113.bb    |   6 +-
 .../scsirastools/scsirastools_1.6.4.bb             |   3 +-
 .../smartmontools/smartmontools_6.4.bb             |  38 ++++----
 meta-oe/recipes-extended/wipe/wipe_git.bb          |   8 +-
 meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb |  10 +-
 .../libvncserver/libvncserver_0.9.10.bb            |   6 +-
 .../recipes-graphics/wayland/wayland-fits_git.bb   |   2 +-
 .../xorg-font/xorg-fonts-100dpi.bb                 |  10 +-
 .../makedumpfile/makedumpfile_1.6.0.bb             |  40 ++++----
 .../recipes-multimedia/libmad/libmad_0.15.1b.bb    |  18 ++--
 meta-oe/recipes-multimedia/minidlna/minidlna.inc   |  12 +--
 meta-oe/recipes-support/anthy/anthy_9100h.bb       |  25 ++---
 meta-oe/recipes-support/augeas/augeas.inc          |   2 +-
 meta-oe/recipes-support/ccid/ccid_1.4.24.bb        |   3 +-
 meta-oe/recipes-support/fbtest/fb-test_git.bb      |  12 +--
 meta-oe/recipes-support/gd/gd_2.2.3.bb             |   4 +-
 meta-oe/recipes-support/htop/htop_1.0.3.bb         |   2 +-
 meta-oe/recipes-support/libee/libee.inc            |  10 +-
 meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb     |   2 +-
 meta-oe/recipes-support/mysql/mariadb.inc          |   4 +-
 meta-oe/recipes-support/numactl/numactl_2.0.11.bb  |  56 +++++------
 meta-oe/recipes-support/opencv/opencv_3.1.bb       |  37 +++----
 .../pam-passwdqc/pam-passwdqc_1.0.5.bb             |  11 ++-
 .../recipes-support/sharutils/sharutils_4.14.bb    |   6 +-
 .../tomoyo-tools/tomoyo-tools_2.5.0.bb             |   4 +-
 meta-oe/recipes-support/uim/uim_1.8.6.bb           | 106 +++++++++++----------
 .../usb-modeswitch/usb-modeswitch_2.2.0.bb         |   2 +-
 .../libextutils/libextutils-parsexs-perl_3.24.bb   |  34 +++----
 .../libhtml/libhtml-parser-perl_3.72.bb            |   4 +-
 .../recipes-perl/libhtml/libhtml-tree-perl_5.03.bb |  16 ++--
 .../recipes-perl/libio/libio-stringy-perl_2.111.bb |  16 ++--
 .../libmodule/libmodule-pluggable-perl_5.2.bb      |  14 +--
 .../recipes-perl/libnet/libnet-dns-perl_0.81.bb    |   4 +-
 .../recipes-perl/libnet/libnet-libidn-perl_0.12.bb |   2 +-
 .../libxml/libxml-libxml-perl_2.0121.bb            |   9 +-
 .../python/python-twisted_13.2.0.bb                |   8 +-
 .../xfce4-notifyd/xfce4-notifyd_0.2.4.bb           |   2 +-
 .../xfce4-screenshooter_1.8.2.bb                   |   2 +-
 100 files changed, 592 insertions(+), 576 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
index 7df9c39..d98d35a 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
@@ -11,7 +11,7 @@ SRC_URI[md5sum] = "689c636484756f6f7a728ef354cbeac2"
 SRC_URI[sha256sum] = "8d5c9dcb51ecb9a9b03890e16d17e37d602b0c1f23ed6a9ddec2b0f719c9f662"
 
 do_install() {
-	oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
+    oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
 }
 
 RDEPENDS_${PN} += "bash"
diff --git a/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb b/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
index 4ff95f9..50ecef1 100644
--- a/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
+++ b/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=1678edfe8de9be9564d23761ae2fa794"
 DEPENDS = "xfsprogs"
 
 SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/dmapi-${PV}.tar.gz \
-	   file://remove-install-as-user.patch \
+           file://remove-install-as-user.patch \
            file://dmapi_aarch64_configure_support.patch \
           "
 SRC_URI[md5sum] = "cd825d4e141c16011367e0a0dd98c9c5"
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
index e053a6e..6121bcd 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=15c832894d10ddd00dfcf57bee490ecc"
 DEPENDS = "xfsprogs attr"
 
 SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz \
-	   file://remove-install-as-user.patch \
-          "
+    file://remove-install-as-user.patch \
+"
 SRC_URI[md5sum] = "a8b1761be5feb363131e7b506639ad4c"
 SRC_URI[sha256sum] = "570eafd0721515bdd79cb0e295b701d49cdf81e71a0a0ff0df6d4c5cc1960943"
 
diff --git a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
index 2621d15..8a21112 100644
--- a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
@@ -17,8 +17,8 @@ inherit distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
 do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 torturer ${D}${bindir}
+    install -d ${D}${bindir}
+    install -m 0755 torturer ${D}${bindir}
 }
 
 # http://errors.yoctoproject.org/Errors/Details/35132/
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index c3fae1d..1e826cd 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -18,12 +18,12 @@ EXTRA_OECONF += "--disable-man"
 PACKAGES =+ "dconf-editor"
 
 FILES_${PN} += " \
-	${datadir}/dbus-1 \
-	${libdir}/gio/modules/*.so \
+    ${datadir}/dbus-1 \
+    ${libdir}/gio/modules/*.so \
 "
 FILES_dconf-editor = " \
-	${bindir}/dconf-editor \
-	${datadir}/icons \
-	${datadir}/bash-completion \
+    ${bindir}/dconf-editor \
+    ${datadir}/icons \
+    ${datadir}/bash-completion \
 "
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index b85850e..2e36063 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -10,8 +10,9 @@ SECTION = "x11/gnome"
 PR = "r7"
 
 DEPENDS = "gnome-doc-utils gconf glib-2.0 gnome-desktop gtk+ \
-           pango libwnck gnome-menus cairo libgweather dbus dbus-glib \
-	   librsvg libcanberra"
+    pango libwnck gnome-menus cairo libgweather dbus dbus-glib \
+    librsvg libcanberra \
+"
 RDEPENDS_${PN} = "python"
 
 inherit gtk-doc gnome autotools-brokensep gettext pkgconfig gconf gobject-introspection
@@ -20,7 +21,7 @@ SRCREV = "8292bd2b8a36df7eed3c760899400790cde68590"
 SRC_URI = "git://git.gnome.org/gnome-panel;branch=gnome-2-32 \
            file://0001-Fix-build-with-gcc-5.patch \
            file://0001-Add-gnome-doc-utils.make.patch \
-	  "
+"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb
index 4966ea4..7b29506 100644
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb
@@ -24,5 +24,5 @@ FILES_${PN}-dev += "${bindir}/libart2-config"
 S = "${WORKDIR}/libart_lgpl-${PV}"
 
 do_configure_prepend() {
-	cp ${WORKDIR}/${ART_CONFIG} ${S}/art_config.h
+    cp ${WORKDIR}/${ART_CONFIG} ${S}/art_config.h
 }
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
index 1a9f68d..1a61e9d 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
@@ -28,9 +28,9 @@ inherit autotools-brokensep ptest
 EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}'"
 
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}
-	cp -r ${S}/test ${S}/test.sh ${D}${PTEST_PATH}
-	sed -i 's|./grubby|grubby|' ${D}${PTEST_PATH}/test.sh
+    install -d ${D}${PTEST_PATH}
+    cp -r ${S}/test ${S}/test.sh ${D}${PTEST_PATH}
+    sed -i 's|./grubby|grubby|' ${D}${PTEST_PATH}/test.sh
 }
 
 RDEPENDS_${PN}-ptest = "util-linux-getopt"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
index 8aad0b7..f8e77e1 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
@@ -52,8 +52,8 @@ FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/libresindvd.la"
 FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"
 
 do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm ${S}/m4/lib-link.m4 || true
+    # This m4 file contains nastiness which conflicts with libtool 2.2.2
+    rm ${S}/m4/lib-link.m4 || true
 }
 
 SRC_URI[md5sum] = "fcb09798114461955260e4d940db5987"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
index c86834f..e2dbb17 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
@@ -31,8 +31,8 @@ PACKAGECONFIG[x11] = "--enable-x --enable-xvideo,--disable-x --disable-xvideo,vi
 PACKAGECONFIG[cdparanoia] = "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
 
 do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm -f ${S}/m4/lib-link.m4
+    # This m4 file contains nastiness which conflicts with libtool 2.2.2
+    rm -f ${S}/m4/lib-link.m4
 }
 
 FILES_${PN} += "${datadir}/${BPN}"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
index d922895..7e4a525 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
@@ -37,8 +37,8 @@ EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcac
                  --disable-examples --disable-taglib"
 
 do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm ${S}/m4/lib-link.m4 || true
+    # This m4 file contains nastiness which conflicts with libtool 2.2.2
+    rm ${S}/m4/lib-link.m4 || true
 }
 
 SRC_URI[md5sum] = "24f98a294a2b521e1b29412bdadae2e6"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
index a8cb852..199b47d 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
@@ -23,8 +23,8 @@ PACKAGECONFIG[amrnb] = "--enable-amrnb,--disable-amrnb,opencore-amr"
 PACKAGECONFIG[amrwb] = "--enable-amrwb,--disable-amrwb,opencore-amr"
 
 do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm ${S}/m4/lib-link.m4 || true
+    # This m4 file contains nastiness which conflicts with libtool 2.2.2
+    rm ${S}/m4/lib-link.m4 || true
 }
 
 SRC_URI[md5sum] = "1d81c593e22a6cdf0f2b4f57eae93df2"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
index 68a70b1..6e163a8 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
@@ -23,7 +23,7 @@ PACKAGES_DYNAMIC += "^${PN}-.*"
 # ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed
 # http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
 oe_runconf_prepend() {
-	if [ -e ${S}/po/Makefile.in.in ]; then
-		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
-	fi
+    if [ -e ${S}/po/Makefile.in.in ]; then
+        sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
+    fi
 }
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
index f61a410..e3bd5e5 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
@@ -41,7 +41,7 @@ oe_runconf_prepend() {
 }
 
 #do_compile_prepend () {
-#	mv ${WORKDIR}/gstregistrybinary.[ch] ${S}/gst/
+#    mv ${WORKDIR}/gstregistrybinary.[ch] ${S}/gst/
 #}
 
 RRECOMMENDS_${PN}_qemux86    += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
index e91ba45..a80fc10 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -10,8 +10,8 @@ SRC_URI[sha256sum] = "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c2
 inherit allarch
 
 do_install() {
-	install -d ${D}${datadir}/movies
-	install -m 0644 ${WORKDIR}/big_buck_bunny_1080p_surround.avi ${D}${datadir}/movies/
+    install -d ${D}${datadir}/movies
+    install -m 0644 ${WORKDIR}/big_buck_bunny_1080p_surround.avi ${D}${datadir}/movies/
 }
 
 FILES_${PN} += "${datadir}/movies"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
index e7029d9..59ac478 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
@@ -10,8 +10,8 @@ SRC_URI[sha256sum] = "40d1cf5bc8e1b0e55dac7bb2e3fbc2aea05b6679444864781299b24db0
 inherit allarch
 
 do_install() {
-	install -d ${D}${datadir}/movies
-	install -m 0644 ${WORKDIR}/big_buck_bunny_480p_surround-fix.avi ${D}${datadir}/movies/
+    install -d ${D}${datadir}/movies
+    install -m 0644 ${WORKDIR}/big_buck_bunny_480p_surround-fix.avi ${D}${datadir}/movies/
 }
 
 FILES_${PN} += "${datadir}/movies"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
index 55fceab..21b8f8f 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
@@ -10,8 +10,8 @@ SRC_URI[sha256sum] = "b957d6e6212638441b52d3b620af157cc8d40c2a0342669294854a06ed
 inherit allarch
 
 do_install() {
-	install -d ${D}${datadir}/movies
-	install -m 0644 ${WORKDIR}/big_buck_bunny_720p_surround.avi ${D}${datadir}/movies/
+    install -d ${D}${datadir}/movies
+    install -m 0644 ${WORKDIR}/big_buck_bunny_720p_surround.avi ${D}${datadir}/movies/
 }
 
 FILES_${PN} += "${datadir}/movies"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
index bb7ee7c..0582a48 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
@@ -9,8 +9,8 @@ SRC_URI[sha256sum] = "bd2b5bc6c16d4085034f47ef7e4b3938afe86b4eec4ac3cf2685367d3b
 inherit allarch
 
 do_install() {
-	install -d ${D}${datadir}/movies
-	install -m 0644 ${WORKDIR}/ToS-4k-1920.mov ${D}${datadir}/movies/
+    install -d ${D}${datadir}/movies
+    install -m 0644 ${WORKDIR}/ToS-4k-1920.mov ${D}${datadir}/movies/
 }
 
 FILES_${PN} += "${datadir}/movies"
diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
index 8ee6634..3249828 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
@@ -14,5 +14,5 @@ inherit autotools
 do_install[postfuncs] += " rm_unused_bindir "
 
 rm_unused_bindir() {
-	rmdir ${D}/${bindir}
+    rmdir ${D}/${bindir}
 }
diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
index 48039f0..813c414 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
 # never look to /usr/local lib while cross compiling
 
 EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${includedir} \
-	--with-libpcap-includes=${STAGING_INCDIR} --with-dnet-includes=${STAGING_LIBDIR}"
+    --with-libpcap-includes=${STAGING_INCDIR} --with-dnet-includes=${STAGING_LIBDIR}"
 
 SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
 SRC_URI[sha256sum] = "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
index 3b52ed4..4a888c8 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
@@ -57,10 +57,10 @@ do_configure_prepend () {
 
 do_install_append () {
     if [ -d ${D}/run ]; then
-	rmdir ${D}/run
+        rmdir ${D}/run
     fi
     if [ -d ${D}${localstatedir}/run ]; then
-	rmdir ${D}${localstatedir}/run
+        rmdir ${D}${localstatedir}/run
     fi
 }
 
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 5046818..23cfc49 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -5,14 +5,14 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
 
 SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
-	   file://avoid-to-call-AC_TRY_RUN.patch \
-	   file://Fix-hardcoded-libdir.patch \
-	   file://debian_patches_0009_sasldb_al.diff \
-	   file://debian_patches_0014_avoid_pic_overwrite.diff \
-	   file://sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch \
-	   file://saslauthd.service \
-	   file://saslauthd.conf \
-	   "
+    file://avoid-to-call-AC_TRY_RUN.patch \
+    file://Fix-hardcoded-libdir.patch \
+    file://debian_patches_0009_sasldb_al.diff \
+    file://debian_patches_0014_avoid_pic_overwrite.diff \
+    file://sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch \
+    file://saslauthd.service \
+    file://saslauthd.conf \
+"
 
 inherit autotools-brokensep pkgconfig useradd systemd
 
diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index 47e4736..bff693c 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -62,6 +62,6 @@ USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup
 
 pkg_postinst_${PN} () {
     if [ -z "$D" -a -x /etc/init.d/populate-volatile.sh ]; then
-	/etc/init.d/populate-volatile.sh update
+        /etc/init.d/populate-volatile.sh update
     fi
 }
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
index 3ce195a..5595bdf 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
@@ -67,10 +67,10 @@ do_install_ptest() {
 }
 
 do_install_append() {
-	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/volatiles.03_squid  ${D}${sysconfdir}/default/volatiles/volatiles.03_squid
-	rmdir "${D}${localstatedir}/run/${BPN}"
-	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}/run"
+    install -d ${D}${sysconfdir}/default/volatiles
+    install -m 0644 ${WORKDIR}/volatiles.03_squid  ${D}${sysconfdir}/default/volatiles/volatiles.03_squid
+    rmdir "${D}${localstatedir}/run/${BPN}"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}/run"
 }
 
 FILES_${PN} += "${libdir} ${datadir}/errors ${datadir}/icons"
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index 6c8ba91..e398799 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -100,10 +100,10 @@ SYSTEMD_SERVICE_${PN} = "vsftpd.service"
 
 pkg_postinst_${PN}() {
     if [ -z "$D" ]; then
-	if type systemd-tmpfiles >/dev/null; then
-	    systemd-tmpfiles --create
-	elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
-	    ${sysconfdir}/init.d/populate-volatile.sh update
-	fi
+        if type systemd-tmpfiles >/dev/null; then
+            systemd-tmpfiles --create
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
     fi
 }
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index 4803d7b..8f08acf 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -25,8 +25,9 @@ SRC_URI[patch15.sha256sum] = "2bc071c438e8b0ed42a0bd2db2d8b681b27a1e9b1798694d98
 
 # Other support files
 PAM_SRC_URI = "file://rexec.pam \
-	file://rlogin.pam \
-	file://rsh.pam"
+    file://rlogin.pam \
+    file://rsh.pam \
+"
 SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 inherit pkgconfig
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index dc5f017..ae08a2d 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -88,7 +88,7 @@ do_install () {
     done
 
     for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
-	touch ${D}${sysconfdir}/quagga/$f.conf
+        touch ${D}${sysconfdir}/quagga/$f.conf
     done
     chown quagga:quaggavty ${D}${sysconfdir}/quagga
     chown quagga:quagga ${D}${sysconfdir}/quagga/*.conf
diff --git a/meta-networking/recipes-support/chrony/chrony_2.4.bb b/meta-networking/recipes-support/chrony/chrony_2.4.bb
index aa37caa..6619e00 100644
--- a/meta-networking/recipes-support/chrony/chrony_2.4.bb
+++ b/meta-networking/recipes-support/chrony/chrony_2.4.bb
@@ -31,8 +31,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
-	   file://chrony.conf \
-	   file://chronyd"
+    file://chrony.conf \
+    file://chronyd \
+"
 SRC_URI[md5sum] = "d0598aa8a9be8faccef9386f6fc0d5f2"
 SRC_URI[sha256sum] = "8d04e7cda2333289c2104b731d39c3c1db94816e43bae35d7ee4e7ae8af6391f"
 
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
index 4b07c0b..2b49096 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
@@ -5,24 +5,24 @@ LICENSE = "DMTF"
 RCONFLICTS_${PN} = "cim-schema-final"
 
 SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2390/cim_schema_${PV}Experimental-MOFs.zip;subdir=${BPN}-${PV} \
-           file://LICENSE \
-          "
+    file://LICENSE \
+"
 SRC_URI[md5sum] = "b82b31c609c6bcc69521829409f58ccc"
 SRC_URI[sha256sum] = "ed2096ef1ea25d189a02bbc6603fed7a48297f2987f254265763a6eecb7fc870"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
 
 do_install() {
-        install -d -m 0755 ${D}${datadir}/mof/cimv${PV}/
-        install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
-        install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
+    install -d -m 0755 ${D}${datadir}/mof/cimv${PV}/
+    install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
+    install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
 
-        cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/	
-        chown -R root:root ${D}${datadir}/mof/cimv${PV}
-        for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
-                sed -i -e 's/\r//g' $i
-        done
-        ln -s cimv${PV} ${D}${datadir}/mof/cim-current
-        ln -s cim_schema_${PV}.mof ${D}${datadir}/mof/cim-current/CIM_Schema.mof
+    cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/
+    chown -R root:root ${D}${datadir}/mof/cimv${PV}
+    for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
+        sed -i -e 's/\r//g' $i
+    done
+    ln -s cimv${PV} ${D}${datadir}/mof/cim-current
+    ln -s cim_schema_${PV}.mof ${D}${datadir}/mof/cim-current/CIM_Schema.mof
 }
 
 FILES_${PN} = "${datadir}/mof/* ${datadir}/doc/*"
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
index 5675384..d65c88d 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
@@ -5,29 +5,29 @@ LICENSE = "DMTF"
 RCONFLICTS_${PN} = "cim-schema-exper"
 
 SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_${PV}Final-MOFs.zip \
-           file://LICENSE \
-          "
+    file://LICENSE \
+"
 SRC_URI[md5sum] = "a9bdf17c7374e3b5b7adeaac4842c4ad"
 SRC_URI[sha256sum] = "dbfa3064ea427acd71a4bebbc172ca2dc44b0b09a6d83b0945b9ffa988a9058a"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
 
 do_unpack() {
-        unzip -q ${DL_DIR}/cim_schema_${PV}Final-MOFs.zip -d ${S}
-        cp -f ${FILE_DIRNAME}/files/LICENSE ${WORKDIR}/
+    unzip -q ${DL_DIR}/cim_schema_${PV}Final-MOFs.zip -d ${S}
+    cp -f ${FILE_DIRNAME}/files/LICENSE ${WORKDIR}/
 }
 
 do_install() {
-        install -d -m 0755 ${D}${datadir}/mof/cimv${PV}/
-        install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
-        install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
+    install -d -m 0755 ${D}${datadir}/mof/cimv${PV}/
+    install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
+    install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
 
-        cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/	
-        chown -R root:root ${D}${datadir}/mof/cimv${PV}/
-        for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
-                sed -i -e 's/\r//g' $i
-        done
-        ln -s cimv${PV} ${D}${datadir}/mof/cim-current
-        ln -s cim_schema_${PV}.mof ${D}${datadir}/mof/cim-current/CIM_Schema.mof
+    cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/	
+    chown -R root:root ${D}${datadir}/mof/cimv${PV}/
+    for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
+        sed -i -e 's/\r//g' $i
+    done
+    ln -s cimv${PV} ${D}${datadir}/mof/cim-current
+    ln -s cim_schema_${PV}.mof ${D}${datadir}/mof/cim-current/CIM_Schema.mof
 }
 
 FILES_${PN} = "${datadir}/mof/* ${datadir}/doc/*"
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index bbba576..1848aa6 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -8,8 +8,8 @@ DEPENDS = "curl boost"
 DEPENDS_class-native = "curl-native"
 
 SRC_URI = "http://curlpp.googlecode.com/files/curlpp-${PV}.tar.gz \
-           file://example21.cpp-remove-deprecated-code.patch \
-	"
+    file://example21.cpp-remove-deprecated-code.patch \
+"
 
 SRC_URI[md5sum] = "ccc3d30d4b3b5d2cdbed635898c29485"
 SRC_URI[sha256sum] = "e3f9427b27c5bddf898d383d45c0d3d5397e2056ff935d9a5cdaef6a9a653bd5"
@@ -26,13 +26,13 @@ do_install_append () {
 
 PACKAGES =+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
 
-FILES_lib${BPN} = "${libdir}/lib*.so.* \
-		"
+FILES_lib${BPN} = "${libdir}/lib*.so.*"
 
 FILES_lib${BPN}-dev = "${includedir} \
-                      ${libdir}/lib*.la \
-                      ${libdir}/pkgconfig \
-                      ${bindir}/*-config"
+    ${libdir}/lib*.la \
+    ${libdir}/pkgconfig \
+    ${bindir}/*-config \
+"
 
 FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
 
diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
index 728ad58..fd3aae9 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://README;md5=b0fa745303912bd2d64430f7ae69487d"
 # Note that we do not want to use the upstream file name locally.
 #
 SRC_URI = "http://github.com/maxmind/geoip-api-perl/archive/v${PV}.tar.gz;downloadfilename=${BPN}-${PV}.tar.gz \
-           file://run-ptest \
-          "
+    file://run-ptest \
+"
 
 SRC_URI[md5sum] = "0ce57140890bf81958e0cea4fe1885b2"
 SRC_URI[sha256sum] = "c56437b1cc8887736cb1e435d0320c1c1ff3754830249516317b99137005fb23"
@@ -30,10 +30,10 @@ EXTRA_CPANFLAGS = "LIBS='-L${STAGING_LIBDIR}' INC='-I${STAGING_INCDIR}'"
 # perl scripts and some special small data files
 #
 do_install_ptest () {
-	install -d -m 0755 ${D}${PTEST_PATH}/t/data
+    install -d -m 0755 ${D}${PTEST_PATH}/t/data
 
-	install ${S}/t/*.t* ${D}${PTEST_PATH}/t
-	install ${S}/t/data/* ${D}${PTEST_PATH}/t/data
+    install ${S}/t/*.t* ${D}${PTEST_PATH}/t
+    install ${S}/t/data/* ${D}${PTEST_PATH}/t/data
 }
 
 FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/Geo/IP/.debug"
diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.9.bb b/meta-networking/recipes-support/geoip/geoip_1.6.9.bb
index f46b3eb..9e8e071 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.9.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.9.bb
@@ -62,32 +62,29 @@ RDEPENDS_${PN} += "${PN}-database"
 inherit ptest
 
 do_configure_ptest() {
-	sed -i -e "s/noinst_PROGRAMS = /test_PROGRAMS = /g" \
-	    -e 's:SRCDIR=\\"$(top_srcdir)\\":SRCDIR=\\"$(testdir)\\":' \
-	  ${S}/test/Makefile.am
-
-	if ! grep "^testdir = " ${S}/test/Makefile.am ; then
-	  sed -e '/EXTRA_PROGRAMS = /itestdir = ${PTEST_PATH}/tests' \
-	    -i ${S}/test/Makefile.am
-	fi
-
-	sed -i -e "s:/usr/local/share:/usr/share:g" \
-	  ${S}/test/benchmark.c
-
-	sed -i -e 's:"../data/:"/usr/share/GeoIP/:g' \
-	  ${S}/test/test-geoip-city.c \
-	  ${S}/test/test-geoip-isp.c \
-	  ${S}/test/test-geoip-asnum.c \
-	  ${S}/test/test-geoip-netspeed.c \
-	  ${S}/test/test-geoip-org.c \
-	  ${S}/test/test-geoip-region.c
+    sed -i -e "s/noinst_PROGRAMS = /test_PROGRAMS = /g" \
+        -e 's:SRCDIR=\\"$(top_srcdir)\\":SRCDIR=\\"$(testdir)\\":' \
+        ${S}/test/Makefile.am
+
+    if ! grep "^testdir = " ${S}/test/Makefile.am ; then
+        sed -e '/EXTRA_PROGRAMS = /itestdir = ${PTEST_PATH}/tests' \
+            -i ${S}/test/Makefile.am
+    fi
+
+    sed -i -e "s:/usr/local/share:/usr/share:g" \
+        ${S}/test/benchmark.c
+
+    sed -i -e 's:"../data/:"/usr/share/GeoIP/:g' \
+        ${S}/test/test-geoip-city.c \
+        ${S}/test/test-geoip-isp.c \
+        ${S}/test/test-geoip-asnum.c \
+        ${S}/test/test-geoip-netspeed.c \
+        ${S}/test/test-geoip-org.c \
+        ${S}/test/test-geoip-region.c
 }
 
 
 do_install_ptest() {
-	oe_runmake -C test DESTDIR=${D}  install-testPROGRAMS
-	install ${S}/test/*.txt ${D}${PTEST_PATH}/tests
+    oe_runmake -C test DESTDIR=${D}  install-testPROGRAMS
+    install ${S}/test/*.txt ${D}${PTEST_PATH}/tests
 }
-
-
-
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
index f69e71c..e6a84cc 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz \
-           file://run-ptest \
-           file://v4test.sh \
-           file://v6test.sh \
-          "
+    file://run-ptest \
+    file://v4test.sh \
+    file://v6test.sh \
+"
 
 SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
 SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26"
@@ -30,11 +30,11 @@ BBCLASSEXTEND = "native"
 inherit autotools pkgconfig binconfig ptest
 
 do_install_ptest () {
-	install -m 0755 ${WORKDIR}/v4test.sh ${D}${PTEST_PATH}
-	install -m 0755 ${WORKDIR}/v6test.sh ${D}${PTEST_PATH}
-	for testcase in `find ${B}/src/apps/.libs ${B}/src/func_tests/.libs -maxdepth 1 -type f -executable`; do
-		install $testcase ${D}${PTEST_PATH}
-	done
+    install -m 0755 ${WORKDIR}/v4test.sh ${D}${PTEST_PATH}
+    install -m 0755 ${WORKDIR}/v6test.sh ${D}${PTEST_PATH}
+    for testcase in `find ${B}/src/apps/.libs ${B}/src/func_tests/.libs -maxdepth 1 -type f -executable`; do
+        install $testcase ${D}${PTEST_PATH}
+    done
 }
 
 SOLIBVERSION="${PV}"
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index b1bd926..76a4edf 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -19,7 +19,7 @@ inherit autotools python-dir pkgconfig
 CACHED_CONFIGUREVARS += "am_cv_python_pythondir=${PYTHON_SITEPACKAGES_DIR}/lowpan-tools"
 
 do_install_append() {
-	rmdir ${D}${localstatedir}/run
+    rmdir ${D}${localstatedir}/run
 }
 
 FILES_${PN}-dbg += "${libexecdir}/lowpan-tools/.debug/"
diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
index a275238..7f666fb 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
@@ -20,10 +20,10 @@ SRC_URI[sha256sum] = "c6e33810ccce67260f8d5d627f60e429d44f532365c58ed5673d035e2a
 S = "${WORKDIR}"
 
 do_compile () {
-	${CC} ${CFLAGS} -o nuttcp nuttcp-${PV}.c
+    ${CC} ${CFLAGS} -o nuttcp nuttcp-${PV}.c
 }
 
 do_install () {
-	install -d ${D}${bindir}
-	install -m 0755 nuttcp ${D}${bindir}
+    install -d ${D}${bindir}
+    install -m 0755 nuttcp ${D}${bindir}
 }
diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
index 3469043..41b8f6d 100644
--- a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
+++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
@@ -12,8 +12,8 @@ EXTRA_OEMAKE = "-e MAKEFLAGS="
 CFLAGS += "-I ${S}/include "
 
 do_install() {
-	unset datadir
-	unset mandir
-	oe_runmake 'DESTDIR=${D}' install
+    unset datadir
+    unset mandir
+    oe_runmake 'DESTDIR=${D}' install
 }
 
diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
index 32caec6..0531ffe 100644
--- a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
+++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://asmping.c;beginline=2;endline=11;md5=1ca8d1a1ca931e5cfe604ebf20a78b71"
 
 SRC_URI = "http://www.venaas.no/multicast/ssmping/${BP}.tar.gz \
-           file://0001-Makefile-tweak-install-dir.patch \
+    file://0001-Makefile-tweak-install-dir.patch \
 "
 SRC_URI[md5sum] = "ad8e3d13f6d72918f73be7e7975d7fad"
 SRC_URI[sha256sum] = "22103a37eaa28489169a0927bc01e0596c3485fc4d29fc8456c07fd2c70fca6d"
@@ -13,5 +13,5 @@ SRC_URI[sha256sum] = "22103a37eaa28489169a0927bc01e0596c3485fc4d29fc8456c07fd2c7
 CFLAGS += "-D_GNU_SOURCE "
 
 do_install() {
-	oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
+    oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
 }
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
index 150e55f..e18228f 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
@@ -47,5 +47,5 @@ do_install_append() {
 }
 
 do_compile_ptest() {
-	oe_runmake buildtest-TESTS
+    oe_runmake buildtest-TESTS
 }
diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
index 293760f..e65739a 100644
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
@@ -22,15 +22,15 @@ DEPENDS += "libpcap"
 # cross-compilation options to configure!
 #
 do_configure () {
-	oe_runconf \
-            --srcdir="." \
-            ac_cv_build=${BUILD_SYS} \
-            ac_cv_host=${HOST_SYS} \
-            ac_cv_target=${HOST_SYS}
+    oe_runconf \
+        --srcdir="." \
+        ac_cv_build=${BUILD_SYS} \
+        ac_cv_host=${HOST_SYS} \
+        ac_cv_target=${HOST_SYS}
 }
 
 do_install () {
-	mkdir -p ${D}/usr/sbin
-	install -c -m 555 tcpslice ${D}/usr/sbin
+    mkdir -p ${D}/usr/sbin
+    install -c -m 555 tcpslice ${D}/usr/sbin
 }
 
diff --git a/meta-networking/recipes-support/tnftp/tnftp_20151004.bb b/meta-networking/recipes-support/tnftp/tnftp_20151004.bb
index 4516345..b17ffeb 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20151004.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20151004.bb
@@ -15,8 +15,8 @@ LICENSE = "BSD-4-Clause"
 DEPENDS = "ncurses"
 
 SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
-	   file://tnftp-autotools.patch \
-	  "
+    file://tnftp-autotools.patch \
+"
 
 inherit autotools update-alternatives pkgconfig
 
diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
index afbaaba..8888b22 100644
--- a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
+++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
@@ -22,8 +22,8 @@ SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -Dm 0755 analyze_suspend.py ${D}${bindir}/analyze_suspend.py
-	install -Dm 0644 README ${D}${docdir}/analyze-suspend/README
+    install -Dm 0755 analyze_suspend.py ${D}${bindir}/analyze_suspend.py
+    install -Dm 0644 README ${D}${docdir}/analyze-suspend/README
 }
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb
index 5acfbf1..aab64a3 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb
@@ -13,23 +13,23 @@ S = "${WORKDIR}/phoronix-test-suite"
 inherit systemd allarch
 
 do_install() {
-	DESTDIR=${D} ./install-sh ${exec_prefix}
+    DESTDIR=${D} ./install-sh ${exec_prefix}
 
-	if [ "${systemd_unitdir}" != "/usr/lib/systemd" ]; then
-		install -d ${D}/${systemd_unitdir}/system/
-		mv ${D}/usr/lib/systemd/system/* ${D}/${systemd_unitdir}/system/
-		rm -rf ${D}/usr/lib/
-	fi
+    if [ "${systemd_unitdir}" != "/usr/lib/systemd" ]; then
+        install -d ${D}/${systemd_unitdir}/system/
+        mv ${D}/usr/lib/systemd/system/* ${D}/${systemd_unitdir}/system/
+        rm -rf ${D}/usr/lib/
+    fi
 }
 
 SYSTEMD_SERVICE_${PN} = "phoromatic-client.service phoromatic-server.service"
 RDEPENDS_${PN} += "bash python php-cli"
 
 FILES_${PN} += " \
-	${datadir}/phoronix-test-suite \
-	${datadir}/appdata/phoronix-test-suite.appdata.xml \
-	${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
-	${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png \
-	${datadir}/mime/packages/openbenchmarking-mime.xml \
-	${systemd_unitdir}/* \
+    ${datadir}/phoronix-test-suite \
+    ${datadir}/appdata/phoronix-test-suite.appdata.xml \
+    ${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
+    ${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png \
+    ${datadir}/mime/packages/openbenchmarking-mime.xml \
+    ${systemd_unitdir}/* \
 "
diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index f789dfd..2de547a 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -24,8 +24,9 @@ EXTRA_OECONF = "--disable-smsd"
 
 FILES_${PN} = "${bindir} ${sbindir}"
 FILES_libgnokii-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
-                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
-	        /lib/*.a /lib/*.o ${datadir}/aclocal"
+    ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
+    /lib/*.a /lib/*.o ${datadir}/aclocal \
+"
 FILES_${PN}-dev = ""
 FILES_libgnokii = "${libdir}/libgnokii.so.*"
 
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
index 254b855..0939d17 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
@@ -9,7 +9,7 @@ SRC_URI[md5sum] = "6aa15d83f5a35f1fd076ba9adc4e7285"
 SRC_URI[sha256sum] = "e7fd16a9f235b059be527bd512e86f0c1d9f2e7c36736e6d6d9727a4427ac14c"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
-		EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
+    EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
 
 do_install () {
     install -d ${D}/${bindir}
diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
index 16e2a7d..4bf238d 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
@@ -25,11 +25,11 @@ PACKAGE_BEFORE_PN += "${PN}-server"
 FILES_${PN}-server = "${bindir}/mosh-server"
 
 NEEDED_PERL_MODULES = "\
-	perl-module-socket \
-	perl-module-getopt-long \
-	perl-module-errno \
-	perl-module-io-socket-inet \
-	perl-module-posix \
+    perl-module-socket \
+    perl-module-getopt-long \
+    perl-module-errno \
+    perl-module-io-socket-inet \
+    perl-module-posix \
 "
 
 # mosh uses SSH to authenticate and the client uses OpenSSH-specific features
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
index 95adecd..b8a9d4a 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
@@ -22,25 +22,25 @@ INITSCRIPT_PARAMS = "defaults"
 inherit update-rc.d
 
 do_install () {
-	
-	install -d ${D}${bindir}	
-	install -m 755 ${S}/src/smsd "${D}${bindir}/smsd"
-	
-	install -m 755 ${S}/scripts/sendsms "${D}${bindir}/sendsms"
-	install -m 755 ${S}/scripts/sms2html "${D}${bindir}/sms2html"
-	install -m 755 ${S}/scripts/sms2unicode "${D}${bindir}/sms2unicode" 
-	install -m 755 ${S}/scripts/unicode2sms "${D}${bindir}/unicode2sms"
-
-	install -d ${D}${sysconfdir}	
-	install -m 644 ${S}/examples/smsd.conf.easy "${D}${sysconfdir}/smsd.conf"
-
-	install -d "${D}${localstatedir}/spool"
-	install -d "${D}${localstatedir}/spool/sms"
-	install -d "${D}${localstatedir}/spool/sms/incoming"
-	install -d "${D}${localstatedir}/spool/sms/outgoing"
-	install -d "${D}${localstatedir}/spool/sms/checked"
-
-	install -d ${D}${sysconfdir}/init.d
-	install -m 755 ${S}/scripts/sms3 "${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}"
+
+    install -d ${D}${bindir}
+    install -m 755 ${S}/src/smsd "${D}${bindir}/smsd"
+
+    install -m 755 ${S}/scripts/sendsms "${D}${bindir}/sendsms"
+    install -m 755 ${S}/scripts/sms2html "${D}${bindir}/sms2html"
+    install -m 755 ${S}/scripts/sms2unicode "${D}${bindir}/sms2unicode"
+    install -m 755 ${S}/scripts/unicode2sms "${D}${bindir}/unicode2sms"
+
+    install -d ${D}${sysconfdir}
+    install -m 644 ${S}/examples/smsd.conf.easy "${D}${sysconfdir}/smsd.conf"
+
+    install -d "${D}${localstatedir}/spool"
+    install -d "${D}${localstatedir}/spool/sms"
+    install -d "${D}${localstatedir}/spool/sms/incoming"
+    install -d "${D}${localstatedir}/spool/sms/outgoing"
+    install -d "${D}${localstatedir}/spool/sms/checked"
+
+    install -d ${D}${sysconfdir}/init.d
+    install -m 755 ${S}/scripts/sms3 "${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}"
 
 }
diff --git a/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
index f13e709..c398dc1 100644
--- a/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ b/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 PR = "r5"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/libtelepathy/libtelepathy-${PV}.tar.gz \
-           file://prefer_python_2.5.patch \
-           file://doublefix.patch"
+    file://prefer_python_2.5.patch \
+    file://doublefix.patch \
+"
 
 SRC_URI[md5sum] = "490ca1a0c614d4466394b72d43bf7370"
 SRC_URI[sha256sum] = "e0d230be855125163579743418203c6f6be2f10f98c4f065735c1dc9ed115878"
@@ -20,4 +21,4 @@ SRC_URI[sha256sum] = "e0d230be855125163579743418203c6f6be2f10f98c4f065735c1dc9ed
 inherit autotools pkgconfig pythonnative
 
 FILES_${PN} += "${datadir}/telepathy \
-		${datadir}/dbus-1"
+    ${datadir}/dbus-1"
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
index 9ae68dd..582783c 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
@@ -23,15 +23,15 @@ PACKAGECONFIG[connman] = "--with-connectivity=connman,,connman"
 PACKAGECONFIG[nm] = "--with-connectivity=nm,,networkmanager"
 
 PACKAGES =+ " \
-	libmissioncontrol \
-	libmissioncontrol-config \
-	libmissioncontrol-server \
-	libmissioncontrol-dev \
-	libmissioncontrol-config-dev \
-	libmissioncontrol-server-dev \
-	libmissioncontrol-dbg \
-	libmissioncontrol-config-dbg \
-	libmissioncontrol-server-dbg \
+    libmissioncontrol \
+    libmissioncontrol-config \
+    libmissioncontrol-server \
+    libmissioncontrol-dev \
+    libmissioncontrol-config-dev \
+    libmissioncontrol-server-dev \
+    libmissioncontrol-dbg \
+    libmissioncontrol-config-dbg \
+    libmissioncontrol-server-dbg \
 "
 
 FILES_${PN} += "${datadir}/dbus* ${datadir}/glib-2.0/schemas"
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
index e1413b0..ce0b492 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -30,7 +30,7 @@ EXTRA_OECMAKE_class-nativesdk = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
              -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_PYTHON=OFF"
 
 do_install_append () {
-	ln -sf thrift ${D}/${bindir}/thrift-compiler
+    ln -sf thrift ${D}/${bindir}/thrift-compiler
 }
 
 # http://errors.yoctoproject.org/Errors/Details/68622/
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
index 03bad31..a32bfa1 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
@@ -24,8 +24,9 @@ DEPENDS  = "openldap virtual/libiconv"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/${PV}/${BPN}-${PV}.tar.gz \
-           file://0001-Fix-configure.ac.patch \
-           file://zabbix-agent.service"
+    file://0001-Fix-configure.ac.patch \
+    file://zabbix-agent.service \
+"
 
 SRC_URI[md5sum] = "9f8aeb11d8415585f41c3f2f22566b78"
 SRC_URI[sha256sum] = "d2c47b8f5b9b91f18010d54c45de55845d979014a8b3fe4bef64e0b08f8b00da"
@@ -39,20 +40,22 @@ SYSTEMD_AUTO_ENABLE = "enable"
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r zabbix"
 USERADD_PARAM_${PN} = "-r -g zabbix -d /var/lib/zabbix \
-                       -s /sbin/nologin -c \"Zabbix Monitoring System\" zabbix"
+    -s /sbin/nologin -c \"Zabbix Monitoring System\" zabbix
+"
 
 KERNEL_VERSION = "${@get_kernelversion_headers('${STAGING_KERNEL_DIR}')}"
 
-EXTRA_OECONF = '--enable-dependency-tracking \
-	        --enable-agent \
-	        --enable-ipv6 \
-	        --with-net-snmp \
-	        --with-ldap=${STAGING_EXECPREFIXDIR} \
-	        --with-jabber \
-	        --with-unixodbc \
-	        --with-ssh2 \
-	        --with-sqlite3 \
-	        '
+EXTRA_OECONF = " \
+    --enable-dependency-tracking \
+    --enable-agent \
+    --enable-ipv6 \
+    --with-net-snmp \
+    --with-ldap=${STAGING_EXECPREFIXDIR} \
+    --with-jabber \
+    --with-unixodbc \
+    --with-ssh2 \
+    --with-sqlite3 \
+"
 CFLAGS_append = " -lldap -llber"
 
 do_configure_prepend() {
@@ -62,7 +65,7 @@ do_configure_prepend() {
 do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/zabbix-agent.service ${D}${systemd_unitdir}/system/
+        install -m 0644 ${WORKDIR}/zabbix-agent.service ${D}${systemd_unitdir}/system/
         sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/zabbix-agent.service
     fi
 }
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
index 34749d0..8da8674 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
@@ -7,8 +7,8 @@ PACKAGECONFIG ??= "libsodium"
 PACKAGECONFIG[libsodium] = "--with-libsodium, --without-libsodium, libsodium"
 
 SRC_URI = "http://github.com/zeromq/zeromq4-1/releases/download/v${PV}/zeromq-${PV}.tar.gz \
-           file://run-ptest \
-           "
+    file://run-ptest \
+"
 SRC_URI[md5sum] = "e7adf4b7dbae09b28cfd10d26cd67fac"
 SRC_URI[sha256sum] = "04aac57f081ffa3a2ee5ed04887be9e205df3a7ddade0027460b8042432bdbcf"
 
@@ -22,11 +22,11 @@ S = "${WORKDIR}/zeromq-${PV}"
 inherit autotools ptest pkgconfig
 
 do_compile_ptest () {
-	echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${B}/Makefile
-	oe_runmake buildtest-TESTS
+    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${B}/Makefile
+    oe_runmake buildtest-TESTS
 }
 
 do_install_ptest () {
-        install -d ${D}${PTEST_PATH}/tests
-        install -m 0755 ${B}/.libs/test_* ${D}${PTEST_PATH}/tests
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/.libs/test_* ${D}${PTEST_PATH}/tests
 }
diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index de23dcd..1c1a02d 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -1,8 +1,9 @@
 SUMMARY = "Plymouth is a project from Fedora providing a flicker-free graphical boot process."
 
 DESCRIPTION = "Plymouth is an application that runs very early in the boot process \
-               (even before the root filesystem is mounted!) that provides a \
-	       graphical boot animation while the boot process happens in the background."
+    (even before the root filesystem is mounted!) that provides a \
+    graphical boot animation while the boot process happens in the background. \
+"
 
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/Plymouth"
 SECTION = "base"
@@ -19,10 +20,10 @@ SRC_URI = "http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.ta
 SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
 SRC_URI[sha256sum] = "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
 
-EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation\
-		  --with-logo=${LOGO} \
-                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install', '', d)} \
-                "
+EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation \
+    --with-logo=${LOGO} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install', '', d)} \
+"
 
 PACKAGECONFIG ??= "pango initrd"
 PACKAGECONFIG_append_x86 = " drm"
@@ -38,15 +39,15 @@ LOGO ??= "${datadir}/plymouth/bizcom.png"
 inherit autotools pkgconfig systemd
 
 do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 644 ${B}/systemd-units/*.service ${D}${systemd_unitdir}/system
-	install -m 644 ${B}/systemd-units/systemd-ask-password-plymouth.path ${D}${systemd_unitdir}/system
-	# Remove /var/run from package as plymouth will populate it on startup
-	rm -fr "${D}${localstatedir}/run"
-
-	if ! ${@bb.utils.contains('PACKAGECONFIG', 'initrd', 'true', 'false', d)}; then
-		rm -rf "${D}${libexecdir}"
-	fi
+    install -d ${D}${systemd_unitdir}/system
+    install -m 644 ${B}/systemd-units/*.service ${D}${systemd_unitdir}/system
+    install -m 644 ${B}/systemd-units/systemd-ask-password-plymouth.path ${D}${systemd_unitdir}/system
+    # Remove /var/run from package as plymouth will populate it on startup
+    rm -fr "${D}${localstatedir}/run"
+
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'initrd', 'true', 'false', d)}; then
+        rm -rf "${D}${libexecdir}"
+    fi
 }
 
 PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'initrd', '${PN}-initrd ', '', d)}"
diff --git a/meta-oe/recipes-core/usleep/usleep_1.0.bb b/meta-oe/recipes-core/usleep/usleep_1.0.bb
index 2ef4b7c..403c6b7 100644
--- a/meta-oe/recipes-core/usleep/usleep_1.0.bb
+++ b/meta-oe/recipes-core/usleep/usleep_1.0.bb
@@ -9,18 +9,18 @@ S = "${WORKDIR}"
 DEPENDS = "popt"
 
 SRC_URI = "file://usleep.c \
-           file://usleep.1 \
-           file://GPLv2.patch \
+    file://usleep.1 \
+    file://GPLv2.patch \
 "
 
 do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} usleep.c -o usleep -lpopt
+    ${CC} ${CFLAGS} ${LDFLAGS} usleep.c -o usleep -lpopt
 }
 
 do_install() {
-	install -d ${D}${base_bindir}
-	install -d ${D}${mandir}/man1
+    install -d ${D}${base_bindir}
+    install -d ${D}${mandir}/man1
 
-	install -m 0755	${WORKDIR}/usleep	${D}${base_bindir}
-	install -m 0644	${WORKDIR}/usleep.1	${D}${mandir}/man1
+    install -m 0755 ${WORKDIR}/usleep   ${D}${base_bindir}
+    install -m 0644 ${WORKDIR}/usleep.1 ${D}${mandir}/man1
 }
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index c27e21d..8ae0185 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -28,5 +28,5 @@ PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 
 do_configure_prepend () {
-	( cd ${S}; ./autogen.sh )
+    ( cd ${S}; ./autogen.sh )
 }
diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
index 7d00906..ead1f61 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2106f0435056f3dd9349747a766e5816"
 
 SRC_URI = " \
-	http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz \
+    http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz \
 "
 
 SRC_URI[md5sum] = "40dc408b1e03cc36d80209baaa2d32b7"
@@ -18,14 +18,15 @@ RDEPENDS_${PN} += "bash perl libxml2"
 S = "${WORKDIR}/${BP}"
 
 EXTRA_OECONF = "--enable-debuginfo \
-                --enable-fast \
-                --enable-shared  \
-                --with-pm=gforker  \
-		--disable-rpath \
-                --disable-f77 \
-                --disable-fc \
-                --disable-fortran \
-                --disable-cxx"
+    --enable-fast \
+    --enable-shared  \
+    --with-pm=gforker  \
+    --disable-rpath \
+    --disable-f77 \
+    --disable-fc \
+    --disable-fortran \
+    --disable-cxx \
+"
 
 inherit autotools-brokensep gettext
 
diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
index 22ed8e2..94fc736 100644
--- a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
+++ b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "This is a small collection of power management \
-               test and investigation tools"
+    test and investigation tools"
 HOMEPAGE = "http://lesswatts.org/projects/acpi"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
@@ -17,13 +17,13 @@ S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
 do_compile() {
-	oe_runmake
+    oe_runmake
 }
 
 do_install() {
-	install -d ${D}${bindir} ${D}${docdir}
-	install -m 755 ${S}/acpidump/acpidump ${D}${bindir}
-	install -m 755 ${S}/acpixtract/acpixtract ${D}${bindir}
-	install -m 755 ${S}/madt/madt ${D}${bindir}
-	install -m 644 ${S}/README ${D}${docdir}
+    install -d ${D}${bindir} ${D}${docdir}
+    install -m 755 ${S}/acpidump/acpidump ${D}${bindir}
+    install -m 755 ${S}/acpixtract/acpixtract ${D}${bindir}
+    install -m 755 ${S}/madt/madt ${D}${bindir}
+    install -m 644 ${S}/README ${D}${docdir}
 }
diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
index 40612e5..f5d056e 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
@@ -20,25 +20,26 @@ PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR},--with-curl=no,curl"
 PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR},--with-icu=no,icu"
 
 do_install_prepend () {
-        sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
+    sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
 }
 
 PACKAGES = "libxerces-c \
-            libxerces-c-dbg \
-            libxerces-c-dev \
-            xerces-c-samples \
-            xerces-c-samples-dbg \
-            libxerces-c-staticdev \
-	   " 
+    libxerces-c-dbg \
+    libxerces-c-dev \
+    xerces-c-samples \
+    xerces-c-samples-dbg \
+    libxerces-c-staticdev \
+" 
 
 FILES_libxerces-c = "${libdir}/libxerces-c-3.1.so"
 FILES_libxerces-c-dbg = "${libdir}/.debug \ 
-                         ${prefix}/src/debug "
+    ${prefix}/src/debug \
+"
 FILES_libxerces-c-dev = "${libdir}/lib*.la \
-                         ${libdir}/libxerces-c.so \
-                         ${libdir}/pkgconfig/xerces-c.pc \
-                         ${includedir}/xercesc \
-			 "
+    ${libdir}/libxerces-c.so \
+    ${libdir}/pkgconfig/xerces-c.pc \
+    ${includedir}/xercesc \
+"
 FILES_xerces-c-samples = "${bindir}/*"
 FILES_xerces-c-samples-dbg = "${bindir}/.debug/"
 FILES_libxerces-c-staticdev = "${libdir}/lib*.a"
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
index 0bd5f32..68a15f8 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
@@ -49,23 +49,23 @@ PACKAGECONFIG[libcurl] = "--with-libcurl,--without-libcurl,curl,"
 EXTRA_OECONF = "hw_cv_func_va_copy=yes --with-init-script=${sysconfdir}/init.d --with-tokyocabinet"
 
 do_install_append() {
-	install -d ${D}${localstatedir}/${BPN}/bin
-	for f in `ls ${D}${bindir}`; do
-	    ln -s ${bindir}/`basename $f` ${D}${localstatedir}/${BPN}/bin/
-	done
+    install -d ${D}${localstatedir}/${BPN}/bin
+    for f in `ls ${D}${bindir}`; do
+        ln -s ${bindir}/`basename $f` ${D}${localstatedir}/${BPN}/bin/
+    done
 
-	install -d ${D}${sysconfdir}/default
-	cat << EOF > ${D}${sysconfdir}/default/cfengine3
+    install -d ${D}${sysconfdir}/default
+    cat << EOF > ${D}${sysconfdir}/default/cfengine3
 RUN_CF_SERVERD=1
 RUN_CF_EXECD=1
 RUN_CF_MONITORD=1
 RUN_CF_HUB=0
 EOF
 
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		install -m 0755 -D ${D}${sysconfdir}/init.d/cfengine3 ${D}${datadir}/${BPN}/cfengine3
-		sed -i -e 's#/etc/init.d#${datadir}/${BPN}#' ${D}${systemd_system_unitdir}/*.service
-	fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -m 0755 -D ${D}${sysconfdir}/init.d/cfengine3 ${D}${datadir}/${BPN}/cfengine3
+        sed -i -e 's#/etc/init.d#${datadir}/${BPN}#' ${D}${systemd_system_unitdir}/*.service
+    fi
 }
 
 RDEPENDS_${PN} += "${BPN}-masterfiles"
diff --git a/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb b/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb
index 50897f0..a213a27 100644
--- a/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb
+++ b/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb
@@ -48,7 +48,7 @@ do_install_append() {
         sed -i -e 's,@INITWRAPPERSDIR@,${sysconfdir}/init.d,g' ${D}${systemd_unitdir}/system/corosync.service
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/corosync-notifyd.service
         sed -i -e 's,@SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/corosync-notifyd.service
-    fi	
+    fi
 }
 
 RDEPENDS_${PN} += "bash"
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
index fbd1992..0fc6289 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb
@@ -6,8 +6,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://www.issihosts.com/haveged/haveged-${PV}.tar.gz \
-		file://remove-systemd-unit-503.patch \
-		"
+    file://remove-systemd-unit-503.patch \
+"
 
 SRC_URI[md5sum] = "015ff58cd10607db0e0de60aeca2f5f8"
 SRC_URI[sha256sum] = "9c2363ed9542a6784ff08e247182137e71f2ddb79e8e6c1ac4ad50d21ced3715"
@@ -17,16 +17,16 @@ PR = "r0"
 inherit autotools systemd
 
 EXTRA_OECONF = "\
-			--enable-init=service.redhat \
-			--enable-nistest=yes \
-			--enable-olt=yes \
-			--enable-threads=no \
-			"
+    --enable-init=service.redhat \
+    --enable-nistest=yes \
+    --enable-olt=yes \
+    --enable-threads=no \
+"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "haveged.service"
-			
+
 do_install_append() {
-	mkdir -p ${D}${systemd_unitdir}/system
-	install -p -m644 ${B}/init.d/haveged.service ${D}${systemd_unitdir}/system
+    mkdir -p ${D}${systemd_unitdir}/system
+    install -p -m644 ${B}/init.d/haveged.service ${D}${systemd_unitdir}/system
 }
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 9c6af16..cce3528 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -9,9 +9,9 @@ SRCREV = "0bc2cfa0a47aed2c8a63abd989cb8da4dcceb2ec"
 PV = "0.8.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/GNOME/gtkmathview.git \
-           file://use_hostcxx.patch \
-	   file://0001-include-cstdio-to-get-printf-definitions.patch \
-          "
+    file://use_hostcxx.patch \
+    file://0001-include-cstdio-to-get-printf-definitions.patch \
+"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
index fdd198a..daafaf5 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
@@ -19,8 +19,8 @@ PACKAGECONFIG[consolekit] = ",,,consolekit"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
-           file://0001-make-netgroup-support-configurable.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+    file://0001-make-netgroup-support-configurable.patch \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
 "
 SRC_URI[md5sum] = "4b77776c9e4f897dcfe03b2c34198edf"
 SRC_URI[sha256sum] = "e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81"
@@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6
 EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages"
 
 do_compile_prepend () {
-	export GIR_EXTRA_LIBS_PATH="${B}/src/polkit/.libs"
+    export GIR_EXTRA_LIBS_PATH="${B}/src/polkit/.libs"
 }
 
 PACKAGES =+ "${PN}-examples"
diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
index 13f93cc..edf84c1 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
@@ -9,8 +9,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=687ea108478d26152ae46eb29d9d1545"
 PR = "r0"
 
-SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.tar.gz \
-	  "
+SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.tar.gz"
 SRC_URI[md5sum] = "2d775111b62e2dfc1960a722f5fda211"
 SRC_URI[sha256sum] = "38d2c6c9b04a2c594e528927b950754f94c0522718d17c78e6589ba778339bf8"
 
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
index 86e6d9e..fce50e5 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
@@ -13,14 +13,14 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
-           file://initd.smartd \
-           file://smartmontools.default \
-           file://smartd.service \
-          "
+    file://initd.smartd \
+    file://smartmontools.default \
+    file://smartd.service \
+"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'libcap-ng', 'libcap-ng', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-                  "
+    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+"
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
@@ -33,19 +33,19 @@ SYSTEMD_SERVICE_${PN} = "smartd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 do_install_append () {
-	#install the init.d/smartd
-	install -d ${D}${sysconfdir}/init.d
-	install -p -m 0755 ${WORKDIR}/initd.smartd ${D}${sysconfdir}/init.d/smartd
-	install -d ${D}${sysconfdir}/default
-	install -p -m 0644 ${WORKDIR}/smartmontools.default ${D}${sysconfdir}/default/smartmontools
-
-	#install systemd service file
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/smartd.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		-e 's,@SBINDIR@,${sbindir},g' \
-		${D}${systemd_unitdir}/system/smartd.service
+    #install the init.d/smartd
+    install -d ${D}${sysconfdir}/init.d
+    install -p -m 0755 ${WORKDIR}/initd.smartd ${D}${sysconfdir}/init.d/smartd
+    install -d ${D}${sysconfdir}/default
+    install -p -m 0644 ${WORKDIR}/smartmontools.default ${D}${sysconfdir}/default/smartmontools
+
+    #install systemd service file
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/smartd.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+        -e 's,@SBINDIR@,${sbindir},g' \
+        ${D}${systemd_unitdir}/system/smartd.service
 }
 
 INITSCRIPT_NAME = "smartd"
diff --git a/meta-oe/recipes-extended/wipe/wipe_git.bb b/meta-oe/recipes-extended/wipe/wipe_git.bb
index dd49958..9a81016 100644
--- a/meta-oe/recipes-extended/wipe/wipe_git.bb
+++ b/meta-oe/recipes-extended/wipe/wipe_git.bb
@@ -10,9 +10,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "git://github.com/berke/wipe.git;branch=master \
-           file://support-cross-compile-for-linux.patch \
-           file://makefile-add-ldflags.patch \
-          "
+    file://support-cross-compile-for-linux.patch \
+    file://makefile-add-ldflags.patch \
+"
 SRCREV = "d9c100c9cd0b1cbbe4359e4d6c9a035d11e7597c"
 PV = "0.23+git${SRCPV}"
 
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "linux"
 
 do_install() {
-	make install DESTDIR=${D}
+    make install DESTDIR=${D}
 }
 
 do_configure[noexec] = "1"
diff --git a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
index 3d13e5a..be3a41f 100644
--- a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "https://wiki.gnome.org/Attic/LibUnique"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=libunique"
 
 SRC_URI = "${GNOME_MIRROR}/libunique/1.1/libunique-${PV}.tar.bz2 \
-	file://fix_for_compile_with_gcc-4.6.0.patch \
-	file://noconst.patch \
-        file://build.patch \
-        file://0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch \
-        "
+    file://fix_for_compile_with_gcc-4.6.0.patch \
+    file://noconst.patch \
+    file://build.patch \
+    file://0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch \
+"
 
 SRC_URI[md5sum] = "7955769ef31f1bc4f83446dbb3625e6d"
 SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66cdd4fbb"
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
index 235b17e..387202b 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
@@ -11,9 +11,9 @@ RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
 inherit autotools binconfig pkgconfig
 
 SRC_URI  = "\
-	 ${DEBIAN_MIRROR}/main/libv/libvncserver/libvncserver_0.9.10+dfsg.orig.tar.xz \
-	 file://0001-remove-webclients-build.patch \
-	 file://0002-common-add-sha1.patch \
+    ${DEBIAN_MIRROR}/main/libv/libvncserver/libvncserver_0.9.10+dfsg.orig.tar.xz \
+    file://0001-remove-webclients-build.patch \
+    file://0002-common-add-sha1.patch \
 "
 
 SRC_URI[md5sum] = "e883b6c7bd339a5e1c48645051abe5c4"
diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
index 6852fd3..d060c47 100755
--- a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
+++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG[elementary] = "--enable-efl-tests,--disable-efl-tests,elementary"
 PACKAGECONFIG[gtk+3] = "--enable-gtk-tests,--disable-gtk-tests,gtk+3"
 
 do_install_append() {
-	rm -f ${D}/${libdir}/weston/*.la
+    rm -f ${D}/${libdir}/weston/*.la
 }
 
 FILES_${PN} += "${bindir}/wfits ${libdir}/weston/*.so"
diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
index 158416b..45e3f7b 100644
--- a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
+++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
@@ -6,9 +6,9 @@ inherit packagegroup distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 RDEPENDS_${PN} = "\
-	font-adobe-100dpi \
-	font-adobe-utopia-100dpi \
-	font-bh-100dpi \
-	font-bh-lucidatypewriter-100dpi \
-	font-bitstream-100dpi \
+    font-adobe-100dpi \
+    font-adobe-utopia-100dpi \
+    font-bh-100dpi \
+    font-bh-lucidatypewriter-100dpi \
+    font-bitstream-100dpi \
 "
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb
index be859a2..c9a2270 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "VMcore extraction tool"
 DESCRIPTION = "\
-	This program is used to extract a subset of the memory available either \
-	via /dev/mem or /proc/vmcore (for crashdumps). It is used to get memory \
-	images without extra uneeded information (zero pages, userspace programs, \
-	etc). \
-	"
+    This program is used to extract a subset of the memory available either \
+    via /dev/mem or /proc/vmcore (for crashdumps). It is used to get memory \
+    images without extra uneeded information (zero pages, userspace programs, \
+    etc). \
+"
 HOMEPAGE = "http://makedumpfile.sourceforge.net"
 
 DEPENDS = "bzip2 zlib elfutils"
@@ -18,9 +18,9 @@ PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/*.pl"
 
 SRC_URI = "\
-	${SOURCEFORGE_MIRROR}/makedumpfile/${BPN}-${PV}.tar.gz \
-	file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
-	"
+    ${SOURCEFORGE_MIRROR}/makedumpfile/${BPN}-${PV}.tar.gz \
+    file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPLv2.0"
 
@@ -33,21 +33,21 @@ SECTION = "base"
 # target gcc.
 #
 EXTRA_OEMAKE = "\
-	LINKTYPE=static \
-	TARGET=${TARGET_ARCH} \
-	"
+    LINKTYPE=static \
+    TARGET=${TARGET_ARCH} \
+"
 
 do_install () {
-	mkdir -p ${D}/usr/bin
-	install -m 755 ${S}/makedumpfile ${D}/usr/bin
-	install -m 755 ${S}/makedumpfile-R.pl ${D}/usr/bin
+    mkdir -p ${D}/usr/bin
+    install -m 755 ${S}/makedumpfile ${D}/usr/bin
+    install -m 755 ${S}/makedumpfile-R.pl ${D}/usr/bin
 
-	mkdir -p ${D}/usr/share/man/man8
-	install -m 644 ${S}/makedumpfile.8.gz ${D}/usr/share/man/man8
+    mkdir -p ${D}/usr/share/man/man8
+    install -m 644 ${S}/makedumpfile.8.gz ${D}/usr/share/man/man8
 
-	mkdir -p ${D}/usr/share/man/man5
-	install -m 644 ${S}/makedumpfile.conf.5.gz ${D}/usr/share/man/man5
+    mkdir -p ${D}/usr/share/man/man5
+    install -m 644 ${S}/makedumpfile.conf.5.gz ${D}/usr/share/man/man5
 
-	mkdir -p ${D}/etc/
-	install -m 644 ${S}/makedumpfile.conf ${D}/etc/makedumpfile.conf.sample
+    mkdir -p ${D}/etc/
+    install -m 644 ${S}/makedumpfile.conf ${D}/etc/makedumpfile.conf.sample
 }
diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index d431abd..20983a7 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -4,18 +4,18 @@ BUGTRACKER = "http://sourceforge.net/tracker/?group_id=12349&atid=112349"
 LICENSE = "GPLv2+"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-			file://COPYRIGHT;md5=8e55eb14894e782b84488d5a239bc23d \
-			file://version.h;beginline=1;endline=8;md5=aa07311dd39288d4349f28e1de516454"
+    file://COPYRIGHT;md5=8e55eb14894e782b84488d5a239bc23d \
+    file://version.h;beginline=1;endline=8;md5=aa07311dd39288d4349f28e1de516454"
 SECTION = "libs"
 DEPENDS = "libid3tag"
 PR = "r3"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
-           file://no-force-mem.patch \
-           file://add-pkgconfig.patch \
-           file://fix_for_mips_with_gcc-4.5.0.patch \
-           file://obsolete_automake_macros.patch \
-           file://automake-foreign.patch \
+    file://no-force-mem.patch \
+    file://add-pkgconfig.patch \
+    file://fix_for_mips_with_gcc-4.5.0.patch \
+    file://obsolete_automake_macros.patch \
+    file://automake-foreign.patch \
 "
 
 SRC_URI[md5sum] = "1be543bc30c56fb6bea1d7bf6a64e66c"
@@ -29,8 +29,8 @@ EXTRA_OECONF = "-enable-speed --enable-shared"
 EXTRA_OECONF_append_arm = " --enable-fpm=arm"
 
 do_configure_prepend () {
-#	damn picky automake...
-	touch NEWS AUTHORS ChangeLog
+#   damn picky automake...
+    touch NEWS AUTHORS ChangeLog
 }
 
 ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
index ebca755..b333fce 100644
--- a/meta-oe/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
@@ -19,16 +19,16 @@ S = "${WORKDIR}/git"
 EXTRA_AUTORECONF = ""
 
 do_install_append(){
-	install -d ${D}${sysconfdir}
-	install -m 0755 minidlna.conf ${D}${sysconfdir}
+    install -d ${D}${sysconfdir}
+    install -m 0755 minidlna.conf ${D}${sysconfdir}
 
 # Systemd script
-	install -d ${D}${nonarch_base_libdir}/systemd/system
-	install -m 0755 ${WORKDIR}/minidlna.service ${D}${nonarch_base_libdir}/systemd/system
+    install -d ${D}${nonarch_base_libdir}/systemd/system
+    install -m 0755 ${WORKDIR}/minidlna.service ${D}${nonarch_base_libdir}/systemd/system
 
 # Sysvinit script
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/minidlna-daemon.init.d ${D}${sysconfdir}/init.d/minidlna
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/minidlna-daemon.init.d ${D}${sysconfdir}/init.d/minidlna
 
 }
 
diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index e121b44..a65d324 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -6,9 +6,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=11f384074d8e93e263b5664ef08a411a"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/anthy/37536/anthy-9100h.tar.gz \
-           file://not_build_elc.patch \
-           file://2ch_t.patch \
-          "
+    file://not_build_elc.patch \
+    file://2ch_t.patch \
+"
 
 SRC_URI_append_class-target = "file://target-helpers.patch"
 SRC_URI_append_class-native = "file://native-helpers.patch"
@@ -25,18 +25,21 @@ PACKAGES += "${PN}-el libanthy0 libanthy-dev"
 
 FILES_${PN}-dbg += "${libdir}/.debug"
 FILES_libanthy0 = "${libdir}/libanthy.so.*  \
-		   ${libdir}/libanthydic.so.*   \
-		   ${libdir}/libanthyinput.so.*"
+    ${libdir}/libanthydic.so.* \
+    ${libdir}/libanthyinput.so.* \
+"
 
 FILES_libanthy-dev = "${libdir}/libanthy*.la \
-		      ${libdir}/libanthy*.a \
-		      ${libdir}/libanthy*.so \
-		      ${includedir}/anthy   \
-		      ${libdir}/pkgconfig/anthy.pc"
+    ${libdir}/libanthy*.a \
+    ${libdir}/libanthy*.so \
+    ${includedir}/anthy \
+    ${libdir}/pkgconfig/anthy.pc \
+"
 
 FILES_${PN}-el = "${datadir}/emacs/*"
 FILES_${PN} = "${datadir}/* \
-	       ${bindir}/* \
-	       ${sysconfdir}/anthy-conf"
+    ${bindir}/* \
+    ${sysconfdir}/anthy-conf \
+"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/augeas/augeas.inc b/meta-oe/recipes-support/augeas/augeas.inc
index 23d12ca..354b180 100644
--- a/meta-oe/recipes-support/augeas/augeas.inc
+++ b/meta-oe/recipes-support/augeas/augeas.inc
@@ -26,5 +26,5 @@ RRECOMMENDS_lib${BPN} += "${PN}"
 LEAD_SONAME = "libaugeas.so"
 
 do_install_append() {
-	rm -fr ${D}${datadir}/vim
+    rm -fr ${D}${datadir}/vim
 }
diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.24.bb b/meta-oe/recipes-support/ccid/ccid_1.4.24.bb
index 49f7a0c..31145d0 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.24.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.24.bb
@@ -7,7 +7,8 @@ DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS_${PN} = "pcsc-lite"
 
 SRC_URI = "https://alioth.debian.org/frs/download.php/file/4171/ccid-${PV}.tar.bz2 \
-	   file://no-dep-on-libfl.patch "
+    file://no-dep-on-libfl.patch \
+"
 
 SRC_URI[md5sum] = "915a03cda85b60fefbe3654cbdc68ca9"
 SRC_URI[sha256sum] = "62cb73c6c009c9799c526f05a05e25f00f0ad86d50f82a714dedcfbf4a7e4176"
diff --git a/meta-oe/recipes-support/fbtest/fb-test_git.bb b/meta-oe/recipes-support/fbtest/fb-test_git.bb
index 13f9e37..6a9d4b2 100644
--- a/meta-oe/recipes-support/fbtest/fb-test_git.bb
+++ b/meta-oe/recipes-support/fbtest/fb-test_git.bb
@@ -11,10 +11,10 @@ SRC_URI = "git://github.com/prpplague/fb-test-app.git"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 fb-test ${D}${bindir}
-	# avoid collisions with perf (perf) and mesa-demos (offset)
-	for prog in perf rect offset ; do
-		install -m 0755 $prog ${D}${bindir}/fb-$prog
-	done
+    install -d ${D}${bindir}
+    install -m 0755 fb-test ${D}${bindir}
+    # avoid collisions with perf (perf) and mesa-demos (offset)
+    for prog in perf rect offset ; do
+        install -m 0755 $prog ${D}${bindir}/fb-$prog
+    done
 }
diff --git a/meta-oe/recipes-support/gd/gd_2.2.3.bb b/meta-oe/recipes-support/gd/gd_2.2.3.bb
index 80d66c9..c5aff66 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.3.bb
@@ -33,8 +33,8 @@ EXTRA_OECONF += " --disable-rpath \
 EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
 
 do_install_append() {
-	# cleanup buildpaths from gdlib.pc
-	sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gdlib.pc
+    # cleanup buildpaths from gdlib.pc
+    sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gdlib.pc
 }
 
 PACKAGES += "${PN}-tools"
diff --git a/meta-oe/recipes-support/htop/htop_1.0.3.bb b/meta-oe/recipes-support/htop/htop_1.0.3.bb
index 4e445c8..181661a 100644
--- a/meta-oe/recipes-support/htop/htop_1.0.3.bb
+++ b/meta-oe/recipes-support/htop/htop_1.0.3.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "055c57927f75847fdc222b5258b079a9542811a9dcf5421c615c7e17f5
 LDFLAGS_append_libc-uclibc = " -lubacktrace"
 
 do_configure_prepend () {
-	rm -rf ${S}/config.h
+    rm -rf ${S}/config.h
 }
 
 inherit autotools
diff --git a/meta-oe/recipes-support/libee/libee.inc b/meta-oe/recipes-support/libee/libee.inc
index 256fa05..e5a145a 100644
--- a/meta-oe/recipes-support/libee/libee.inc
+++ b/meta-oe/recipes-support/libee/libee.inc
@@ -28,12 +28,12 @@ TESTDIR = "tests"
 # We presume the tests we are going to install so just build them directly.
 #
 do_compile_ptest() {
-	oe_runmake -C ${TESTDIR} genfile ezapi1
+    oe_runmake -C ${TESTDIR} genfile ezapi1
 }
 
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}
-	install -m 0755 ${B}/${TESTDIR}/genfile ${D}${PTEST_PATH}
-	install -m 0755 ${B}/${TESTDIR}/.libs/ezapi1 ${D}${PTEST_PATH}
-	install -m 0755 ${WORKDIR}/ezapi1.sh ${D}${PTEST_PATH}
+    install -d ${D}${PTEST_PATH}
+    install -m 0755 ${B}/${TESTDIR}/genfile ${D}${PTEST_PATH}
+    install -m 0755 ${B}/${TESTDIR}/.libs/ezapi1 ${D}${PTEST_PATH}
+    install -m 0755 ${WORKDIR}/ezapi1.sh ${D}${PTEST_PATH}
 }
diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb b/meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb
index cf39278..9c1a520 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb
@@ -24,7 +24,7 @@ PACKAGECONFIG[enableboardconfig] = "--enable-board=${BOARD},,"
 PACKAGECONFIG[python] = "--enable-python=${PYTHON_PN},,${PYTHON_PN}"
 
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python', \
-	'${PYTHON_PN}-libsoc-staticdev ${PYTHON_PN}-libsoc', '', d)}"
+    '${PYTHON_PN}-libsoc-staticdev ${PYTHON_PN}-libsoc', '', d)}"
 
 RDEPENDS_${PN} = "libgcc"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 9c3d234..73905b6 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -139,8 +139,8 @@ do_install() {
                                                                    ${D}${systemd_unitdir}/system/install_db.service
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-	install -d ${D}${sysconfdir}/tmpfiles.d
-	echo "f /var/log/mysqld.err 0640 mysql mysql -" \
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "f /var/log/mysqld.err 0640 mysql mysql -" \
             > ${D}${sysconfdir}/tmpfiles.d/99-mysqld.conf
     fi
     install -d ${D}${bindir}
diff --git a/meta-oe/recipes-support/numactl/numactl_2.0.11.bb b/meta-oe/recipes-support/numactl/numactl_2.0.11.bb
index 199726f..dd159a3 100644
--- a/meta-oe/recipes-support/numactl/numactl_2.0.11.bb
+++ b/meta-oe/recipes-support/numactl/numactl_2.0.11.bb
@@ -11,12 +11,12 @@ inherit autotools-brokensep ptest
 LIC_FILES_CHKSUM = "file://README;beginline=19;endline=32;md5=5644cc3851cb2499f6c48e52fe198bd9"
 
 SRC_URI = "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV}.tar.gz \
-	   file://fix-null-pointer.patch \
-	   file://Fix-the-test-output-format.patch \
-	   file://Makefile \
-	   file://run-ptest \
-	   file://0001-define-run-test-target.patch \
-          "
+    file://fix-null-pointer.patch \
+    file://Fix-the-test-output-format.patch \
+    file://Makefile \
+    file://run-ptest \
+    file://0001-define-run-test-target.patch \
+"
 SRC_URI[md5sum] = "d3bc88b7ddb9f06d60898f4816ae9127"
 SRC_URI[sha256sum] = "450c091235f891ee874a8651b179c30f57a1391ca5c4673354740ba65e527861"
 
@@ -24,34 +24,34 @@ SRC_URI[sha256sum] = "450c091235f891ee874a8651b179c30f57a1391ca5c4673354740ba65e
 COMPATIBLE_HOST = "^((?!arm).*)$"
 
 do_install() {
-        oe_runmake DESTDIR=${D} prefix=${D}/usr install
-	#remove the empty man2 directory
-	rm -r ${D}${mandir}/man2
+    oe_runmake DESTDIR=${D} prefix=${D}/usr install
+    #remove the empty man2 directory
+    rm -r ${D}${mandir}/man2
 }
 
 do_compile_ptest() {
-	oe_runmake test
+    oe_runmake test
 }
 
 do_install_ptest() {
-	#install tests binaries
-        local test_binaries="distance ftok mbind_mig_pages migrate_pages move_pages \
-		mynode	nodemap node-parse pagesize prefered randmap realloc_test \
-		tbitmap tshared"
-
-	[ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
-	for i in $test_binaries; do
-		install -m 0755 ${B}/test/.libs/$i ${D}${PTEST_PATH}/test
-	done
-
-	local test_scripts="checktopology checkaffinity printcpu regress regress2 \
-			shmtest  runltp bind_range"
-	for i in $test_scripts; do
-		install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
-	done
-
-	install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
-	install -m 0755 ${B}/.libs/numactl ${D}${PTEST_PATH}/
+    #install tests binaries
+    local test_binaries="distance ftok mbind_mig_pages migrate_pages move_pages \
+    mynode    nodemap node-parse pagesize prefered randmap realloc_test \
+    tbitmap tshared"
+
+    [ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
+    for i in $test_binaries; do
+        install -m 0755 ${B}/test/.libs/$i ${D}${PTEST_PATH}/test
+    done
+
+    local test_scripts="checktopology checkaffinity printcpu regress regress2 \
+        shmtest  runltp bind_range"
+    for i in $test_scripts; do
+        install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
+    done
+
+    install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
+    install -m 0755 ${B}/.libs/numactl ${D}${PTEST_PATH}/
 }
 
 RDEPENDS_${PN}-ptest = "bash"
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 8ab9a2b..da11316 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -19,11 +19,12 @@ IPP_MD5 = "808b791a6eac9ed78d32a7666804320e"
 
 SRCREV_FORMAT = "opencv"
 SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
-            git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib \
-            git://github.com/Itseez/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=party3;name=party3 \
-            file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
-            file://fixgcc60.patch \
-            file://fixpkgconfig.patch"
+    git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib \
+    git://github.com/Itseez/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=party3;name=party3 \
+    file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
+    file://fixgcc60.patch \
+    file://fixpkgconfig.patch \
+"
 
 PV = "3.1+git${SRCPV}"
 
@@ -35,22 +36,22 @@ do_unpack_extra() {
 addtask unpack_extra after do_unpack before do_patch
 
 EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
-		 -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
-                 -DWITH_1394=OFF \
-                 -DCMAKE_SKIP_RPATH=ON \
-                 -DOPENCV_ICV_PACKAGE_DOWNLOADED=${IPP_MD5} \
-                 -DOPENCV_ICV_PATH=${WORKDIR}/ippicv_lnx \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+    -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
+    -DWITH_1394=OFF \
+    -DCMAKE_SKIP_RPATH=ON \
+    -DOPENCV_ICV_PACKAGE_DOWNLOADED=${IPP_MD5} \
+    -DOPENCV_ICV_PATH=${WORKDIR}/ippicv_lnx \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
+    ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+    ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
 EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
 PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb  gphoto2 \
-                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-		   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
@@ -80,7 +81,7 @@ export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
 TARGET_CC_ARCH += "-I${S}/include "
 
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)} \
-             ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
+    ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
 
 python populate_packages_prepend () {
     cv_libdir = d.expand('${libdir}')
diff --git a/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb b/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
index 4e8b7d8..4233ba4 100644
--- a/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
+++ b/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
@@ -12,9 +12,9 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e284d013ef08e66d4737f446c5890550"
 
 SRC_URI = "http://www.openwall.com/pam/modules/pam_passwdqc/pam_passwdqc-1.0.5.tar.gz \
-           file://1000patch-219201.patch \
-           file://7000Makefile-fix-CC.patch \
-          "
+    file://1000patch-219201.patch \
+    file://7000Makefile-fix-CC.patch \
+"
 SRC_URI[md5sum] = "cd9c014f736158b1a60384a8e2bdc28a"
 SRC_URI[sha256sum] = "32528ddf7d8219c788b6e7702361611ff16c6340b6dc0f418ff164aadc4a4a88"
 
@@ -24,10 +24,11 @@ S = "${WORKDIR}/pam_passwdqc-${PV}"
 DEPENDS = "libpam"
 
 EXTRA_OEMAKE = "CFLAGS="${CFLAGS} -Wall -fPIC -DHAVE_SHADOW" \
-                SECUREDIR=${base_libdir}/security"
+    SECUREDIR=${base_libdir}/security \
+"
 
 do_install() {
-	oe_runmake install DESTDIR=${D}
+    oe_runmake install DESTDIR=${D}
 }
 
 FILES_${PN} += "${base_libdir}/security/pam_passwdqc.so"
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.14.bb b/meta-oe/recipes-support/sharutils/sharutils_4.14.bb
index 49981e7..d69e6ec 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.14.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.14.bb
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 inherit gettext autotools-brokensep
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/sharutils/sharutils-4.14.tar.gz \
-	   file://fix-for-cross-compiling.patch \
-	  "
+    file://fix-for-cross-compiling.patch \
+"
 
 SRC_URI[md5sum] = "5686c11131b4c4c0841f8f3ef34d136a"
 SRC_URI[sha256sum] = "90f5107c167cfd1b299bb211828d2586471087863dbed698f53109cd5f717208"
 
 do_configure () {
-	oe_runconf
+    oe_runconf
 }
diff --git a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
index ac8593c..4a1b4ce 100644
--- a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
+++ b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
@@ -22,9 +22,9 @@ DEPENDS = "linux-libc-headers ncurses"
 EXTRA_OEMAKE = "-e USRLIBDIR=${libdir}"
 
 do_compile () {
-	oe_runmake 'CC=${CC}'
+    oe_runmake 'CC=${CC}'
 }
 
 do_install() {
-	oe_runmake install INSTALLDIR=${D}
+    oe_runmake install INSTALLDIR=${D}
 }
diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index ae193b2..c92880f 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -1,15 +1,14 @@
 DESCRIPTION = "A multilingual user input method library"
 HOMEPAGE = "http://uim.freedesktop.org/"
 LICENSE = "BSD-3-Clause & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
 SECTION = "inputmethods"
 
-SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2 \
-          "
+SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2"
 
 SRC_URI_append_class-target = "file://uim-module-manager.patch \
-                               file://0001-fix-bug-for-cross-compile.patch"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
+    file://0001-fix-bug-for-cross-compile.patch \
+"
 SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
 SRC_URI[sha256sum] = "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
 
@@ -24,12 +23,13 @@ LEAD_SONAME = "libuim.so.1"
 inherit autotools pkgconfig gettext
 
 EXTRA_OECONF += "--disable-emacs \
-                 --without-scim \
-                 --without-m17nlib \
-                 --without-prime \
-                 --without-canna \
-                 --without-mana \
-                 --without-eb"
+    --without-scim \
+    --without-m17nlib \
+    --without-prime \
+    --without-canna \
+    --without-mana \
+    --without-eb \
+"
 
 CONFIGUREOPTS_remove_class-target = "--disable-silent-rules"
 
@@ -45,60 +45,62 @@ do_install_append() {
 PACKAGES += "uim-xim uim-utils uim-skk uim-gtk2.0 uim-gtk3 uim-fep uim-common uim-anthy libuim0 libuim-dev"
 
 FILES_${PN} = "${bindir}/uim-help \
-               ${libdir}/uim/plugin/libuim-* \
-               ${libdir}/libuim-scm* \
-               ${libdir}/libgcroots* \
-               ${libdir}/uim/plugin/libuim-*"
+    ${libdir}/uim/plugin/libuim-* \
+    ${libdir}/libuim-scm* \
+    ${libdir}/libgcroots* \
+    ${libdir}/uim/plugin/libuim-* \
+"
 
 FILES_libuim0 = "${libdir}/uim/plugin/libuim-custom-enabler.* \
-                 ${libdir}/libuim-custom.so.* \
-                 ${datadir}/locale/ja/LC_MESSAGES/uim.mo \
-                 ${datadir}/locale/fr/LC_MESSAGES/uim.mo \
-                 ${datadir}/locale/ko/LC_MESSAGES/uim.mo \
-                 ${libdir}/libuim.so.*"
-
+    ${libdir}/libuim-custom.so.* \
+    ${datadir}/locale/ja/LC_MESSAGES/uim.mo \
+    ${datadir}/locale/fr/LC_MESSAGES/uim.mo \
+    ${datadir}/locale/ko/LC_MESSAGES/uim.mo \
+    ${libdir}/libuim.so.* \
+"
 FILES_libuim-dev = "${libdir}/libuim*.a \
-                    ${libdir}/libuim*.la \
-                    ${libdir}/libuim*.so \
-                    ${includedir}/uim \
-                    ${libdir}/pkgconfig/uim.pc"
-
+    ${libdir}/libuim*.la \
+    ${libdir}/libuim*.so \
+    ${includedir}/uim \
+    ${libdir}/pkgconfig/uim.pc \
+"
 FILES_uim-anthy = "${libdir}/uim/plugin/libuim-anthy.* \
-                   ${datadir}/uim/anthy*.scm"
-
+    ${datadir}/uim/anthy*.scm \
+"
 FILES_${PN}-dbg += "${libdir}/*/*/*/.debug ${libdir}/*/*/.debug"
 FILES_${PN}-dev += "${libdir}/uim/plugin/*.la"
 
 FILES_uim-utils = "${bindir}/uim-sh \
-                   ${bindir}/uim-module-manager \
-		   ${libexecdir}/uim-helper-server"
-
+    ${bindir}/uim-module-manager \
+    ${libexecdir}/uim-helper-server \
+"
 FILES_uim-xim = "${bindir}/uim-xim \
-                 ${libexecdir}/uim-candwin-*gtk \
-                 ${libexecdir}/uim-candwin-*gtk3 \
-                 ${datadir}/man/man1/uim-xim.1 \
-                 ${sysconfdir}/X11/xinit/xinput.d/uim*"
-
+    ${libexecdir}/uim-candwin-*gtk \
+    ${libexecdir}/uim-candwin-*gtk3 \
+    ${datadir}/man/man1/uim-xim.1 \
+    ${sysconfdir}/X11/xinit/xinput.d/uim* \
+"
 FILES_uim-common = "${datadir}/uim/pixmaps/*.png \
-                    ${datadir}/uim"
-
+    ${datadir}/uim \
+"
 FILES_uim-fep = "${bindir}/uim-fep*"
 
 FILES_uim-gtk2.0 = "${libdir}/gtk-2.0 \
-                    ${bindir}/uim-toolbar-gtk \
-                    ${bindir}/uim-toolbar-gtk-systray \
-                    ${bindir}/uim-*-gtk \
-                    ${bindir}/uim-input-pad-ja \
-                    ${libdir}/uim/uim-*-gtk"
-
+    ${bindir}/uim-toolbar-gtk \
+    ${bindir}/uim-toolbar-gtk-systray \
+    ${bindir}/uim-*-gtk \
+    ${bindir}/uim-input-pad-ja \
+    ${libdir}/uim/uim-*-gtk \
+"
 FILES_uim-gtk3 = "${libdir}/gtk-3.0 \
-                   ${bindir}/uim-toolbar-gtk3 \
-                   ${bindir}/uim-toolbar-gtk3-systray \
-                   ${bindir}/uim-*-gtk3 \
-                   ${libdir}/uim/uim-*-gtk3"
-
+    ${bindir}/uim-toolbar-gtk3 \
+    ${bindir}/uim-toolbar-gtk3-systray \
+    ${bindir}/uim-*-gtk3 \
+    ${libdir}/uim/uim-*-gtk3 \
+"
 FILES_uim-skk = "${libdir}/uim/plugin/libuim-skk.* \
-                 ${datadir}/uim/skk*.scm"
+    ${datadir}/uim/skk*.scm \
+"
 
 pkg_postinst_uim-anthy() {
     if [ -f /usr/bin/uim-module-manager ]; then
@@ -137,8 +139,8 @@ pkg_postrm_uim-skk() {
 pkg_postinst_uim-common() {
     if [ -f /usr/bin/uim-module-manager ]; then
         /usr/bin/uim-module-manager --path /etc/uim --register \
-                                    tutcode tcode hangul viqr \
-                                    ipa-x-sampa latin byeoru
+            tutcode tcode hangul viqr \
+            ipa-x-sampa latin byeoru
     fi
 }
 
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
index 52a2f56..425f66b 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
@@ -15,5 +15,5 @@ RDEPENDS_${PN} = "tcl"
 RRECOMMENDS_${PN} = "usb-modeswitch-data"
 
 do_install() {
-	oe_runmake DESTDIR=${D} install
+    oe_runmake DESTDIR=${D} install
 }
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb
index 1566f75..bc368ea 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb
@@ -22,26 +22,26 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit cpan
 
 RDEPENDS_${PN} = " perl-module-carp \
-                   perl-module-cwd \
-                   perl-module-dynaloader \
-                   perl-module-extutils-cbuilder \
-		   perl-module-extutils-makemaker \
-                   perl-module-file-basename \
-                   perl-module-file-spec \
-		   perl-module-lib \
-                   perl-module-symbol \
-                   perl-module-test-more \
+    perl-module-cwd \
+    perl-module-dynaloader \
+    perl-module-extutils-cbuilder \
+    perl-module-extutils-makemaker \
+    perl-module-file-basename \
+    perl-module-file-spec \
+    perl-module-lib \
+    perl-module-symbol \
+    perl-module-test-more \
 "
 
 RPROVIDES_${PN} += " libextutils-parsexs-constants-perl \
-                     libextutils-parsexs-countlines-perl \
-                     libextutils-parsexs-eval-perl \
-                     libextutils-parsexs-utilities-perl \
-                     libextutils-typemaps-perl \
-                     libextutils-typemaps-cmd-perl \
-                     libextutils-typemaps-inputmap-perl \
-                     libextutils-typemaps-outputmap-perl \
-                     libextutils-typemaps-type-perl \
+    libextutils-parsexs-countlines-perl \
+    libextutils-parsexs-eval-perl \
+    libextutils-parsexs-utilities-perl \
+    libextutils-typemaps-perl \
+    libextutils-typemaps-cmd-perl \
+    libextutils-typemaps-inputmap-perl \
+    libextutils-typemaps-outputmap-perl \
+    libextutils-typemaps-type-perl \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
index 9047d9f..19b61d1 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
@@ -19,7 +19,7 @@ EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}
 inherit cpan
 
 do_compile() {
-	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
-	cpan_do_compile
+    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+    cpan_do_compile
 }
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index 8eb0e06..56dc19c 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -25,17 +25,17 @@ DEPENDS += "libmodule-build-perl-native \
 "
 
 RPROVIDES_${PN} = " libhtml-element-perl \
-		    libhtml-tree-assubs-perl \
-		    libhtml-tree-perl \
-		    libhtml-treebuilder-perl \
+    libhtml-tree-assubs-perl \
+    libhtml-tree-perl \
+    libhtml-treebuilder-perl \
 "
 
 RDEPENDS_${PN} = " perl-module-b \
-                   perl-module-base \
-                   perl-module-strict \
-                   perl-module-warnings \
-                   perl-module-exporter \
-                   perl-module-carp \
+    perl-module-base \
+    perl-module-strict \
+    perl-module-warnings \
+    perl-module-exporter \
+    perl-module-carp \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
index b890a3e..0e566c0 100644
--- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
+++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
@@ -18,14 +18,14 @@ S = "${WORKDIR}/IO-stringy-${PV}"
 inherit cpan
 
 RPROVIDES_${PN} += " libio-atomicfile-perl \
-		     libio-innerfile-perl \
-                     libio-lines-perl \
-                     libio-scalar-perl \
-                     libio-scalararray-perl \
-                     libio-wrap-perl \
-                     libio-wraptie-perl \
-		     libio-wraptie-master-perl \
-		     libio-wraptie-slave-perl \
+    libio-innerfile-perl \
+    libio-lines-perl \
+    libio-scalar-perl \
+    libio-scalararray-perl \
+    libio-wrap-perl \
+    libio-wraptie-perl \
+    libio-wraptie-master-perl \
+    libio-wraptie-slave-perl \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
index 76cac50..c73a15a 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
@@ -26,13 +26,13 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit cpan
 
 RDEPENDS_${PN} = " perl-module-base \
-		   perl-module-deprecate \
-                   perl-module-file-basename \
-		   perl-module-file-find \
-                   perl-module-file-spec \
-		   perl-module-file-spec-functions \
-		   perl-module-if \
-                   perl-module-test-more \
+    perl-module-deprecate \
+    perl-module-file-basename \
+    perl-module-file-find \
+    perl-module-file-spec \
+    perl-module-file-spec-functions \
+    perl-module-if \
+    perl-module-test-more \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
index 9dc4268..acab271 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
@@ -19,7 +19,7 @@ EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}
 inherit cpan
 
 do_compile() {
-	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
-	cpan_do_compile
+    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+    cpan_do_compile
 }
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index fd3ff8d..0c53b6a 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -30,5 +30,5 @@ inherit cpan
 FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/Net/LibIDN/.debug/"
 
 do_configure_prepend() {
-	rm -rf ${S}/.pc/
+    rm -rf ${S}/.pc/
 }
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
index 8997a04..45c7aaa 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
@@ -20,12 +20,13 @@ RDEPENDS_${PN} += "libxml2 \
 "
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
-	file://disable-libxml2-check.patch \
-	file://fix-CATALOG-conditional-compile.patch \
-	file://using-DOCB-conditional.patch \
+    file://disable-libxml2-check.patch \
+    file://fix-CATALOG-conditional-compile.patch \
+    file://using-DOCB-conditional.patch \
 "
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
-			file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446"
+    file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446 \
+"
 SRC_URI[libxml.md5sum] = "1544ab9ac110f5da296015346561ce02"
 SRC_URI[libxml.sha256sum] = "ec431011cb37a04640fd2316f64d0405a274eece2c6f3847f7fbd336eb1c0dc9"
 
diff --git a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
index ac88ac9..071106e 100644
--- a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
@@ -239,7 +239,7 @@ ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
 
 RDEPENDS_{PN}-src = "${PN}"
 FILES_${PN}-src = " \
-	${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
-	${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
-	${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
-	"
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
+"
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb
index 5f874ad..6d170b6 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb
@@ -10,7 +10,7 @@ SRC_URI[md5sum] = "094be6f29206aac8299f27084e284e88"
 SRC_URI[sha256sum] = "8c7ed62f9496816d1391281f77d1b32216f9bf6fd22fbe4f6f3f4e07a6bbced0"
 
 do_compile_prepend() {
-	mkdir -p xfce4-notifyd
+    mkdir -p xfce4-notifyd
 }
 
 FILES_${PN} += " \
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
index de2bc61..d1cb684 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
@@ -13,7 +13,7 @@ SRC_URI[md5sum] = "3a32ecc5566453a58f6a4ddd70649444"
 SRC_URI[sha256sum] = "9dce2ddfaa87f703e870e29bae13f3fc82a1b3f06b44f8386640e45a135f5f69"
 
 do_compile_prepend() {
-	mkdir -p lib
+    mkdir -p lib
 }
 
 FILES_${PN} += " \
-- 
2.9.2


