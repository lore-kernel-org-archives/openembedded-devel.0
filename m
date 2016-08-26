Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D8ACA7705D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 15:39:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 08:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1540599"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga005.jf.intel.com with ESMTP; 26 Aug 2016 08:39:30 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Aug 2016 18:37:53 +0300
Message-Id: <20160826153753.11755-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160826153753.11755-1-alexander.kanavin@linux.intel.com>
References: <20160826153753.11755-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] gtk-doc: disable where necessary
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
X-List-Received-Date: Fri, 26 Aug 2016 15:39:32 -0000

Several recipes in meta-oe layers are so old that they don't work
with modern gtk-doc (which was added and enabled by default in oe-core);
disable that where it is necessary for the build to succeed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb        | 2 +-
 meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb             | 2 +-
 meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb     | 2 +-
 meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb | 2 ++
 meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb                 | 2 +-
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb               | 2 ++
 meta-oe/recipes-support/udisks/udisks2_2.1.7.bb                  | 2 +-
 meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb              | 2 ++
 meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb                    | 2 ++
 9 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index a5664b0..c31de0c 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -48,7 +48,7 @@ do_compile_prepend() {
 
 EXTRA_OECONF = "--without-openldap \
                 --with-libdb=${STAGING_DIR_HOST}${prefix} \
-                --disable-nntp --disable-goa --disable-weather"
+                --disable-nntp --disable-goa --disable-weather --disable-gtk-doc"
 
 PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
              libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
index 2a6f04b..6ec6d46 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
@@ -21,7 +21,7 @@ do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gdata/.libs"
 }
 
-EXTRA_OECONF += "--disable-goa --disable-tests"
+EXTRA_OECONF += "--disable-goa --disable-tests --disable-gtk-doc"
 
 SRC_URI[archive.md5sum] = "eb552a8a8482e4231a3d1baf7262e64d"
 SRC_URI[archive.sha256sum] = "8740e071ecb2ae0d2a4b9f180d2ae5fdf9dc4c41e7ff9dc7e057f62442800827"
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
index 88f69ff..87a3ed0 100644
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "f96d30c09b0395ea4e146730fd52d9ea303b619bb139051d9f12d3f868
 
 GPE_TARBALL_SUFFIX = "bz2"
 
-EXTRA_OECONF = "--enable-cairo"
+EXTRA_OECONF = "--enable-cairo --disable-gtk-doc"
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
 PACKAGES =+ "${PN}-bin"
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb
index eb45974..ae95d4f 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb
@@ -2,3 +2,5 @@ require libmediaart.inc
 
 SRC_URI[archive.md5sum] = "1a44933d4cd0064e3c76d8d0ddacddc9"
 SRC_URI[archive.sha256sum] = "3a9dffcad862aed7c0921579b93080d694b8a66f3676bfee8037867f653a1cd3"
+
+EXTRA_OECONF_append = " --disable-gtk-doc"
diff --git a/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb b/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
index 553e19c..8cd023a 100644
--- a/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://glade-cruft.patch file://no-xml2.patch file://python_environm
 SRC_URI[archive.md5sum] = "d1776b40f4e166b5e9c107f1c8fe4139"
 SRC_URI[archive.sha256sum] = "64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec"
 
-EXTRA_OECONF += "--without-libxml2"
+EXTRA_OECONF += "--without-libxml2 --disable-gtk-doc"
 
 CFLAGS += "-lz"
 
diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 620ee1f..3c2a054 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -18,6 +18,8 @@ PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
 
 inherit autotools pkgconfig gtk-doc
 
+EXTRA_OECONF = "--disable-gtk-doc"
+
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
index 34762dd..fbf6701 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
@@ -17,7 +17,7 @@ inherit autotools systemd gtk-doc gobject-introspection
 
 S = "${WORKDIR}/udisks-${PV}"
 
-EXTRA_OECONF = "--disable-man"
+EXTRA_OECONF = "--disable-man --disable-gtk-doc"
 
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
                 ${datadir}/dbus-1/ \
diff --git a/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb b/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
index f27396c..824611a 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
@@ -24,6 +24,8 @@ SRC_URI[sha256sum] = "4b216f5200490f8d2a9bf1b3fcd9a8b20834c95249bf13b9170c82e1fc
 
 RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
 
+EXTRA_OECONF = "--disable-gtk-doc"
+
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[clutter] = "--enable-clutter, --disable-clutter, clutter"
 PACKAGECONFIG[notify] = "--enable-notify-plugin, --disable-notify-plugin, libnotify"
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
index 81f6ce1..81143b5 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
@@ -10,4 +10,6 @@ SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.pat
 SRC_URI[md5sum] = "aba62b80787aac295083bf7afd419ffb"
 SRC_URI[sha256sum] = "787dc859713b6518992d760d4b858fb02e8a30705e6f6e871d7a14cc97bca972"
 
+EXTRA_OECONF = "--disable-gtk-doc"
+
 FILES_${PN} += "${datadir}/desktop-directories"
-- 
2.9.3


