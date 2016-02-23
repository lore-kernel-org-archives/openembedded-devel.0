Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A4C7A77354
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676947"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:26 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:51 +0200
Message-Id: <6caa4ddf3024f5d5cd9aaa3b019bc4cf76be6431.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/34] gupnp: fix gobject introspection
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:26 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp.inc         | 12 +++++++-----
 meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc      |  9 +++++++--
 .../recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb           |  4 +---
 .../recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb            |  6 +++---
 meta-multimedia/recipes-connectivity/gupnp/gupnp.inc         | 12 +++++++-----
 meta-multimedia/recipes-connectivity/gupnp/no-vala.inc       |  5 -----
 6 files changed, 25 insertions(+), 23 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/no-vala.inc

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
index ae965b9..5a4939c 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
@@ -2,13 +2,15 @@ SUMMARY = "Resource discovery and announcement over SSDP"
 DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-DEPENDS = "glib-2.0 libsoup-2.4 gobject-introspection-stub"
+DEPENDS = "glib-2.0 libsoup-2.4"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gobject-introspection vala
 
-require no-vala.inc
-
-EXTRA_OECONF = "--disable-introspection"
+# Copy vapigen.m4 so that it doesn't get removed by vala class
+# (normally this would be the right thing to do, but in gssdp the vapigen.m4 has only a custom macro)
+do_configure_prepend() {
+        cp -f ${S}/m4/vapigen.m4 ${S}/m4/vapigen-custom.m4 || true
+}
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc
index b076155..0544501 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc
@@ -3,6 +3,11 @@ DESCRIPTION = "GUPnP-AV is a collection of helpers for building AV (audio/video)
 LICENSE = "LGPLv2"
 DEPENDS = "gupnp"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gobject-introspection vala
+
+# Copy vapigen.m4 so that it doesn't get removed by vala class
+# (normally this would be the right thing to do, but in gupnp-av the vapigen.m4 has only a custom macro)
+do_configure_prepend() {
+        cp -f ${S}/m4/vapigen.m4 ${S}/m4/vapigen-custom.m4 || true
+}
 
-require no-vala.inc
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
index 17ec52f..053604e 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
@@ -9,9 +9,7 @@ SRC_URI = "http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "f93665e535a512e4d515a86311435cb6"
 SRC_URI[sha256sum] = "69969713f36c0e815fbbbcfdfb3ad9bd447cfd10d0fd86227d82dfd8edb6c807"
 
-inherit autotools pkgconfig
-
-require no-vala.inc
+inherit autotools pkgconfig gobject-introspection vala
 
 PACKAGECONFIG ?= "gstreamer"
 PACKAGECONFIG[gstreamer] = "--enable-gstreamer-metadata-backend,--disable-gstreamer-metadata-backend,gstreamer1.0 gstreamer1.0-plugins-base"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
index 667f7ef..0cc4a3a 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
@@ -3,12 +3,12 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libgupnp-igd/gupnp-simple-igd.c;beginline=1;endline=21;md5=aa292c0d9390463a6e1055dc5fc68e80"
 
-DEPENDS = "glib-2.0 gupnp gobject-introspection-stub-native sqlite3"
+DEPENDS = "glib-2.0 gupnp sqlite3"
 
 SRC_URI = "http://download.gnome.org/sources/${BPN}/0.2/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "f881323304185c02634034e3bda714ba"
 SRC_URI[sha256sum] = "73b6a98a0f13b29b34c3bfc07f99f78b1319211cb95a8585752873af2b9067d3"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gtk-doc gobject-introspection
 
-EXTRA_OECONF = "--disable-introspection --disable-python"
+EXTRA_OECONF = "--disable-python"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
index 28e9b35..6ce9631 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
@@ -2,13 +2,15 @@ SUMMARY = "UPnP framework"
 DESCRIPTION = "GUPnP is an elegant, object-oriented open source framework for creating UPnP  devices and control points, written in C using GObject and libsoup. The GUPnP API is intended to be easy to use, efficient and flexible. It provides the same set of features as libupnp, but shields the developer from most of UPnP's internals."
 LICENSE = "LGPLv2+"
 
-DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gobject-introspection-stub"
+DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2"
 
-require no-vala.inc
+inherit autotools pkgconfig vala gobject-introspection
 
-EXTRA_OECONF = "--disable-introspection"
-
-inherit autotools pkgconfig
+# Copy vapigen.m4 so that it doesn't get removed by vala class
+# (normally this would be the right thing to do, but in gupnp the vapigen.m4 has only a custom macro)
+do_configure_prepend() {
+        cp -f ${S}/m4/vapigen.m4 ${S}/m4/vapigen-custom.m4 || true
+}
 
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/no-vala.inc b/meta-multimedia/recipes-connectivity/gupnp/no-vala.inc
deleted file mode 100644
index 5a45cd1..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/no-vala.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-do_configure_prepend () {
-    # Vala needs gobject-introspection so won't work. Instead of depending
-    # on vala-native just to run configure, comment out the Vala macro.
-    sed -i -e 's/\(^[ \t]*VALA_PROG_VAPIGEN\)/dnl \1/g' ${S}/configure.ac
-}
-- 
2.7.0


