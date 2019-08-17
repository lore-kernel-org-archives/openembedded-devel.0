Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id E9B3E7F32F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 22:00:39 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id C4997103740;
	Sat, 17 Aug 2019 22:00:40 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Aug 2019 00:00:31 +0200
Message-Id: <20190817220032.6778-2-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190817220032.6778-1-tworaz@tworaz.net>
References: <20190817220032.6778-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 2/3] libgdata: Update to version 0.17.10.
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
X-List-Received-Date: Sat, 17 Aug 2019 22:00:40 -0000
Content-Transfer-Encoding: 8bit

This is the latest upstream stable version of this library. Besides
simple version bump this patch also makes the following changes:

1. Switch from autotools to meson.
2. Drop gnome-common-native from DEPENDS. Its no longer needed to build
   the package.
3. Drop X11 feature check. This package itself does not actually depend
   on X11. Its prefectly usable in headless or wayland only environments.
   The only case where it depends on X11 indirectly is when its build
   with gtk support which can, but does not have to depend on X11.
4. Add PACKAGECONFIGs for customization options the package has. The
   defaults config is left unchanged compared to the previous version.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../recipes-gnome/libgdata/libgdata_0.16.1.bb | 33 -------------------
 .../libgdata/libgdata_0.17.10.bb              | 30 +++++++++++++++++
 2 files changed, 30 insertions(+), 33 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
 create mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
deleted file mode 100644
index 80cbae39f..000000000
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "GLib-based library for accessing online service APIs using the GData protocol"
-HOMEPAGE = "http://live.gnome.org/libgdata"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
-                    file://gdata/gdata.h;endline=20;md5=079a554efcf65d46f96a515806e7e99a \
-                    file://gdata/gdata-types.h;endline=20;md5=7399b111aac8718da13888fc634be6ef"
-
-DEPENDS = "gnome-common-native libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr json-glib"
-
-inherit distro_features_check gnomebase pkgconfig autotools-brokensep gettext gtk-doc vala gobject-introspection
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-do_configure_prepend_class-target () {
-    # introspection.m4 pre-packaged with upstream tarballs does not yet
-    # have our fixes
-    rm -f ${S}/introspection.m4
-    
-    # remove the pre-built gtk-doc files, as they're installed (or attempted to be installed)
-    # even if gtk-doc is explicitly disabled
-    rm -rf ${S}/docs/reference/html
-}
-
-do_compile_prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/gdata/.libs"
-}
-
-EXTRA_OECONF += "--disable-goa --disable-tests --disable-gtk-doc"
-
-SRC_URI[archive.md5sum] = "eb552a8a8482e4231a3d1baf7262e64d"
-SRC_URI[archive.sha256sum] = "8740e071ecb2ae0d2a4b9f180d2ae5fdf9dc4c41e7ff9dc7e057f62442800827"
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb
new file mode 100644
index 000000000..7bedd87ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb
@@ -0,0 +1,30 @@
+SUMMARY = "GLib-based library for accessing online service APIs using the GData protocol"
+HOMEPAGE = "http://live.gnome.org/libgdata"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
+                    file://gdata/gdata.h;endline=20;md5=079a554efcf65d46f96a515806e7e99a \
+                    file://gdata/gdata-types.h;endline=20;md5=7399b111aac8718da13888fc634be6ef"
+
+DEPENDS = "libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr json-glib"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase pkgconfig gettext gtk-doc vala gobject-introspection manpages
+
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/gdata/.libs"
+}
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
+PACKAGECONFIG[goa] = "-Dgoa=enabled,-Dgoa=disabled,gnome-online-accounts"
+PACKAGECONFIG[gtk] = "-Dgtk=enabled,-Dgtk=disabled,gtk+3"
+PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
+
+EXTRA_OEMESON = "-Dalways_build_tests=false"
+
+SRC_URI[archive.md5sum] = "d858d411ad394c275643b14993dfeed4"
+SRC_URI[archive.sha256sum] = "c1d3d1f303f6a0416a0dac355a195276c31157a74bb1d040772d46d1cb15b012"
-- 
2.21.0


