Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8F379660F6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:10 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so4685358wes.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3IW9RY/jfu8ZmeC7mxEO/k1UuaJzGr9ucUkNYXR9MMo=;
	b=yct/NDPu8p8hmr9f8ml77/rArEvGxRy4fVNar7kJlDc7GesXTanamOUnVSW4QWT7yi
	/9L6i+YfwHekU+8FggDs/OFUIRZHEdzBEmbNK3XNk/EDULWz7vh95sgBq/GjovUcRpmm
	x+7ZWusijpY+0QsQXbGbdzXkmI9ZNAmTiVyqzjMTT2BRrf3iP7D2C+b6vKe4Xv28yzB/
	uvXoIJu0Lf2oFaXd3N/BDWKbcX7iKdnKWvmpoNIwxmVfjZVqnlakGxGhOEgEOdRKPzTc
	bYPiTH3yPB89Nz+3jHSiTy0WwOCHLVFk5903glSloE5LrpTTjt4XDvE5zK1rLknkdlGG
	xLCA==
X-Received: by 10.194.62.5 with SMTP id u5mr10396707wjr.46.1403342351053;
	Sat, 21 Jun 2014 02:19:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dy10sm12462784wib.3.2014.06.21.02.19.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:18:59 +0200
Message-Id: <1403342349-11180-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 02/12] recipes: add missing pkgconfig class inherits
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:16 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

* These recipes all use pkg-config in some way but were missing
  dependencies on the tool, this patch adds them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb                     | 2 +-
 meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb | 2 +-
 meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb              | 2 +-
 meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb                     | 2 +-
 meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb  | 2 +-
 .../recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb           | 2 +-
 meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb           | 2 +-
 meta-networking/recipes-daemons/radvd/radvd.inc                        | 2 +-
 .../recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb            | 2 +-
 meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb              | 2 +-
 meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb       | 2 +-
 meta-networking/recipes-support/netcf/netcf_git.bb                     | 2 +-
 meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb         | 2 +-
 meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb                 | 2 +-
 meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb           | 2 +-
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb            | 2 +-
 meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb                | 3 +--
 meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb                | 2 +-
 meta-oe/recipes-devtools/libgee/libgee.inc                             | 2 +-
 .../recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc | 2 +-
 meta-oe/recipes-extended/collectd/collectd_5.2.2.bb                    | 2 +-
 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb                       | 2 +-
 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb                            | 2 +-
 meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb                       | 2 +-
 meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb                | 2 +-
 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb                        | 2 +-
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb                 | 2 +-
 meta-oe/recipes-navigation/omgps/omgps_svn.bb                          | 2 +-
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb                        | 2 +-
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb                      | 2 +-
 meta-oe/recipes-support/dfu-util/dfu-util.inc                          | 2 +-
 meta-oe/recipes-support/evtest/evtest_1.25.bb                          | 2 +-
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb                     | 2 +-
 meta-oe/recipes-support/gd/gd_2.1.0.bb                                 | 2 +-
 meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb                | 2 +-
 meta-oe/recipes-support/links/links.inc                                | 2 +-
 .../recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb    | 2 +-
 meta-oe/recipes-support/utouch/utouch-frame_git.bb                     | 2 +-
 meta-oe/recipes-support/utouch/utouch-mtview_git.bb                    | 2 +-
 meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb                  | 2 +-
 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb       | 2 +-
 41 files changed, 41 insertions(+), 42 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
index e7bff3f..26869fe 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
 SRC_URI[md5sum] = "d03cf9bad2983243837f4f6d76ef14a6"
 SRC_URI[sha256sum] = "eaa9d8d9542700e6750918d72a3ce00f8cf3a2771d3e2516efd1be5a05f78582"
 
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 PACKAGES =+ "obex-client obex-plugins"
 
diff --git a/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb b/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb
index ddd388c..57a8720 100644
--- a/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb
+++ b/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://www.freedesktop.org/software/desktop-file-utils/releases/deskt
 SRC_URI[md5sum] = "d966b743eb394650f98d5dd56b9aece1"
 SRC_URI[sha256sum] = "d9449956c1c8caa75281a3322b2bb433db42610942f0ceeaa65ccd9636c04231"
 
-inherit autotools
+inherit autotools pkgconfig
 
 CACHED_CONFIGUREVARS += "ac_cv_prog_EMACS=no"
 
diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
index 46ab1a0..3fb5776 100644
--- a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
+++ b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://tap.c;beginline=1;endline=20;md5=71756eeb144e9eeb177c69aa672b1635"
 PR = "r4"
 
-inherit autotools
+inherit autotools pkgconfig
 
 SRC_URI = "http://burtonini.com/temp/${PN}-${PV}.tar.gz \
     file://gtkstylus.sh"
diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
index f51f616..3f1e27e 100644
--- a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
+++ b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "762778421fae7c62d5ec6a9d27986166c0dbbe2ff51fc10bb9b8baff5c
 
 GPE_TARBALL_SUFFIX = "bz2"
 
-inherit gpe autotools
+inherit gpe autotools pkgconfig
 
 SRC_URI += "file://0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.patch \
     file://use.libsoup-2.4.patch \
diff --git a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
index fb0194b..871eb6a 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/01org/${BPN}.git"
 SRCREV = "1996ecbe4a06c95d22f7d958e32e3d28f7a4a2e9"
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
 
 do_install_append() {
     install -d ${D}${bindir}
diff --git a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
index 478b1c7..185d8fc 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/01org/${BPN}.git"
 SRCREV = "4a0b1d7cd8e22d3cb0e09c77c344ceccbcbbd34f"
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
 
 do_install_append() {
     install -d ${D}${bindir}
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
index b340c5a..ef4d7b5 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
@@ -8,4 +8,4 @@ SRC_URI = "http://www.musicpd.org/download/${PN}/${PV}/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "5ae3d87467d52aef3345407adb0a2488"
 SRC_URI[sha256sum] = "fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index d8b3893..ededf9a 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -18,7 +18,7 @@ SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
            file://radvd.init \
            file://volatiles.03_radvd"
 
-inherit autotools update-rc.d useradd
+inherit autotools update-rc.d useradd pkgconfig
 
 do_install_append () {
     install -m 0755 -d ${D}${sysconfdir}/init.d \
diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
index 49ef073..0cc1398 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
 SRC_URI[tar.md5sum] = "ee737c774e01349f75e935228a2d851b"
 SRC_URI[tar.sha256sum] = "036b032a5c4d180aad686df21399d74506b9b3d3000794eb13ac313482e24896"
 
-inherit autotools-brokensep update-rc.d
+inherit autotools-brokensep update-rc.d pkgconfig
 
 INITSCRIPT_NAME = "conntrackd"
 
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
index 29e54c4..f733a78 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "75592483d40dc4f76cc3b41af40caa4be80478946a699d46846d5d03e4
 
 DEPENDS = "openssl xz zlib bzip2 libcap"
 
-inherit autotools
+inherit autotools pkgconfig
 
 PACKAGECONFIG ??= " \
                    ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 5fc0de3..d8e1ddb 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -14,7 +14,7 @@ SRCREV = "a1d9615adde6d1a568813c24a128273ed755af04"
 
 S = "${WORKDIR}/git"
 
-inherit autotools python-dir
+inherit autotools python-dir pkgconfig
 
 CACHED_CONFIGUREVARS += "am_cv_python_pythondir=${PYTHON_SITEPACKAGES_DIR}/lowpan-tools"
 
diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index 5a301e3..d6ca30f 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -16,7 +16,7 @@ DEPENDS += "augeas libnl libxslt libxml2 gnulib"
 
 S = "${WORKDIR}/git"
 
-inherit gettext autotools-brokensep
+inherit gettext autotools-brokensep pkgconfig
 
 EXTRA_OECONF_append_class-target = " --with-driver=redhat"
 do_configure_prepend() {
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
index f8116e3..821d965 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
 PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
 
-inherit autotools systemd
+inherit autotools systemd pkgconfig
 
 RRECOMMENDS_${PN} = "kernel-module-ipsec"
 
diff --git a/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
index 7880a06..b4fbf7a 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "bb6c0125db30b697f80837941c17372b7484c64d57a6920b8bfa7ee3de
 
 S = "${WORKDIR}/irssi-${REALPV}"
 
-inherit autotools
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-ssl"
 
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
index a7f81e6..124b8ca 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
@@ -13,5 +13,5 @@ SRC_URI = "http://libtorrent.rakshasa.no/downloads/${PN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "e94f6c590bb02aaf4d58618f738a85f2"
 SRC_URI[sha256sum] = "34317d6783b7f8d0805274c9467475b5432a246c0de8e28fc16e3b0b43f35677"
 
-inherit autotools
+inherit autotools pkgconfig
 
diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index f12941e..4a2b2b1 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz"
 SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
 SRC_URI[sha256sum] = "b399465ddbd6d0217abedd9411d9d74a820effa0a6a142adc448268d3920094f"
 
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 FILES_${PN} += "${datadir}/dbus-1/"
 
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
index adc112f..d1b64fb 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
@@ -12,5 +12,4 @@ SRC_URI = "http://libtorrent.rakshasa.no/downloads/${PN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "0bf2f262faa8c8c8d3b11ce286ea2bf2"
 SRC_URI[sha256sum] = "9e93ca41beb1afe74ad7ad8013e0d53ae3586c9b0e97263d722f721535cc7310"
 
-inherit autotools
-
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
index d6cfd35..9768a6e 100644
--- a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
+++ b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
@@ -8,6 +8,6 @@ SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "5c5374d4f265b0abe4daef1d03f87104"
 SRC_URI[sha256sum] = "05f0216dd0c25a17859de66357f64da5033375b6fbf5f31ca54867311160b64d"
 
-inherit autotools
+inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/libgee/libgee.inc b/meta-oe/recipes-devtools/libgee/libgee.inc
index c681285..fcfd077 100644
--- a/meta-oe/recipes-devtools/libgee/libgee.inc
+++ b/meta-oe/recipes-devtools/libgee/libgee.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 INC_PR = "r6"
 PE = "1"
 
-inherit autotools vala
+inherit autotools vala pkgconfig
 do_configure_prepend() {
     MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
     for i in ${MACROS}; do
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
index a3db952..7c8e341 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -11,6 +11,6 @@ export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 
 SRC_URI = "http://downloads.freesmartphone.org/sources/${BPN}/${BP}.tar.bz2;name=archive"
 
-inherit autotools perlnative
+inherit autotools perlnative pkgconfig
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
index 8585ff3..6b9b7bd 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "29e61411e51845d5ae71ab676078867e"
 SRC_URI[sha256sum] = "7b8906d1c8866155b31820ef108be92abcee7fcd278d386bf0d449e704ba4696"
 
-inherit autotools pythonnative update-rc.d
+inherit autotools pythonnative update-rc.d pkgconfig
 
 # Floatingpoint layout, architecture dependent
 # 'nothing', 'endianflip' or 'intswap'
diff --git a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
index c5a25f8..b9b77e4 100644
--- a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
+++ b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
@@ -13,4 +13,4 @@ SRC_URI[sha256sum] = "9cab6c5d6b792eb828d17cec2b9c1baba2ef57f789a290464afab80b53
 
 DEPENDS = "gtk+"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
index 3433bd2..a983344 100644
--- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
+++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "3f6bf2de2952b9adcbeb3db12c2a979e999a81dd1e314a03bc58e24f1e
 
 PARALLEL_MAKE = ""
 
-inherit autotools
+inherit autotools pkgconfig
 
 # Don't use provided regex.c
 EXTRA_OECONF = "fim_cv_regex=no fim_cv_regex_broken=no \
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb b/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
index 36afb9f..45218c2 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${P
 SRC_URI[md5sum] = "2c702caede167323c9ed9eed2b933098"
 SRC_URI[sha256sum] = "0e82bbff62f626692a00f3772d8b17169a1842b8cc54d5f2ddb1fec2cede9e41"
 
-inherit autotools
+inherit autotools pkgconfig
 
 EXTRA_OECONF = " --disable-documentation "
 
diff --git a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
index e5ece21..27a38c1 100644
--- a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
@@ -7,6 +7,6 @@ SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.b
 SRC_URI[md5sum] = "09f56978a62854534deacc8aa8ff3031"
 SRC_URI[sha256sum] = "bc7171a0fa212da866fca2301241630e2009aea8c4ddb75f21b51a31c2e4c581"
 
-inherit autotools
+inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
index e7a0ee1..7b33927 100644
--- a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/jackaudio/jack1.git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-timestamps \
                 --disable-capabilities \
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
index 6c25c90..abe9a64 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
 
 DEPENDS = "jpeg virtual/libx11"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 # libv4l was absorbed into this, let OE know that
 PROVIDES = "libv4l"
diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index adcc749..2304b36 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -26,4 +26,4 @@ SRC_URI = "svn://omgps.googlecode.com/svn/trunk;module=omgps;protocol=http \
            file://0001-g_type_init-is-deprecated-for-glib-2.35.0.patch \
 "
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
index f5523e3..95c1b29 100644
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://orrery.c;endline=25;md5=d792bdf2b591972da175aecc38d88cfe"
 DEPENDS = "gtk+"
 
-inherit autotools
+inherit autotools pkgconfig
 
 SRC_URI = "http://projects.openmoko.org/frs/download.php/923/orrery_2.7_clean.tar.gz \
            file://orrery.png \
diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
index a793fde..214ca58 100644
--- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
+++ b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
@@ -29,7 +29,7 @@ do_configure_prepend() {
     done
 }
 
-inherit autotools
+inherit autotools pkgconfig
 
 do_install_append() {
     install -d ${D}${datadir}/applications
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util.inc b/meta-oe/recipes-support/dfu-util/dfu-util.inc
index 633b829..892acad 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util.inc
+++ b/meta-oe/recipes-support/dfu-util/dfu-util.inc
@@ -6,4 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://dfu-util.gnumonks.org/releases/dfu-util-${PV}.tar.gz"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/evtest/evtest_1.25.bb b/meta-oe/recipes-support/evtest/evtest_1.25.bb
index 34b5b74..640cec0 100644
--- a/meta-oe/recipes-support/evtest/evtest_1.25.bb
+++ b/meta-oe/recipes-support/evtest/evtest_1.25.bb
@@ -11,4 +11,4 @@ SRC_URI = "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-${PV}.tar.bz
 SRC_URI[archive.md5sum] = "770d6af03affe976bdbe3ad1a922c973"
 SRC_URI[archive.sha256sum] = "3d34123c68014dae6f7c19144ef79ea2915fa7a2f89ea35ca375a9cf9e191473"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 3205aaf..48a80e5 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -16,7 +16,7 @@ DEPENDS = "glib-2.0 gstreamer"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
 
-inherit autotools
+inherit autotools pkgconfig
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
diff --git a/meta-oe/recipes-support/gd/gd_2.1.0.bb b/meta-oe/recipes-support/gd/gd_2.1.0.bb
index d92e639..ec2a09d 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.0.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.0.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "f3e1bc472bd81ee976a739436659fe752a14727a964c64530fde68531d
 
 S = "${WORKDIR}/libgd-${PV}"
 
-inherit autotools binconfig gettext
+inherit autotools binconfig gettext pkgconfig
 
 EXTRA_OECONF += " --disable-rpath \
                   --with-jpeg=${STAGING_LIBDIR}/.. \
diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index 21f4e2a..16657b4 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://git.0pointer.de/libatasmart.git"
 
 S = "${WORKDIR}/git"
 
-inherit autotools lib_package
+inherit autotools lib_package pkgconfig
 
 do_install_append() {
     sed -i -e s://:/:g -e 's:=${libdir}/libudev.la:-ludev:g' ${D}${libdir}/libatasmart.la
diff --git a/meta-oe/recipes-support/links/links.inc b/meta-oe/recipes-support/links/links.inc
index 78d7ec7..ef48d73 100644
--- a/meta-oe/recipes-support/links/links.inc
+++ b/meta-oe/recipes-support/links/links.inc
@@ -14,4 +14,4 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,lzma"
 
-inherit autotools
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
index bb649a2..82e5d8a 100644
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://sources.openembedded.org/dpkg_${PV}.tar.bz2"
 SRC_URI[md5sum] = "d211a84f38987771a49ad1c0f144334a"
 SRC_URI[sha256sum] = "2a3d4ba83c743b3f004533fdd52372cb7b22f5c1da2042d0a31bbcc2b54c0ea5"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 S = "${WORKDIR}/dpkg-${PV}"
 
diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
index 00b7cf3..d9b38ae 100644
--- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 
 DEPENDS += "mtdev utouch-evemu"
 
-inherit autotools
+inherit autotools pkgconfig
 
 SRC_URI = "git://bitmath.org/git/frame.git;protocol=http"
 SRCREV = "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
index 6ebeb9f..bcf7e23 100644
--- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://bitmath.org/code/mtview/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c61b8950dc1aab4d2aa7c2ae6b1cfb3"
 
-inherit autotools
+inherit autotools pkgconfig
 
 SRC_URI = "git://bitmath.org/git/mtview.git;protocol=http"
 SRCREV = "ad437c38dc111cf3990a03abf14efe1b5d89604b"
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
index 4788110..fd8ed92 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "f78cc90dfa47caf3d83ad18fd6b4e85f237777c1733fc9088594b70ce2
 
 S = "${WORKDIR}/httpd-${PV}"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d pkgconfig
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
index ad3140e..1d1a082 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "glib-2.0"
 
-inherit autotools
+inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
 
-- 
2.0.0


