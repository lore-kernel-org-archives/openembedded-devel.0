Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 40508772E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676906"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:45 +0200
Message-Id: <b646c93b776c495f6da9b82d691319aaa6536a52.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/34] libgdata: update to 0.16.1
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:20 -0000

This fixes gobject introspection support.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{libgdata_0.7.1.bb => libgdata_0.16.1.bb}       | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/libgdata/{libgdata_0.7.1.bb => libgdata_0.16.1.bb} (43%)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
similarity index 43%
rename from meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
rename to meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
index a641270..c1f1238 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
@@ -7,10 +7,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://gdata/gdata.h;endline=20;md5=079a554efcf65d46f96a515806e7e99a \
                     file://gdata/gdata-types.h;endline=20;md5=7399b111aac8718da13888fc634be6ef"
 
-DEPENDS = "libxml2 glib-2.0 libsoup-2.4 intltool-native"
+DEPENDS = "libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr json-glib"
 
-inherit gnomebase pkgconfig autotools-brokensep gettext gtk-doc
+inherit gnomebase pkgconfig autotools-brokensep gettext gtk-doc vala
 
-SRC_URI[archive.md5sum] = "ec5262cbcb07b63b58d45aa3ac636096"
-SRC_URI[archive.sha256sum] = "fb244138276a5ce98510b0e2408bbf6f9ce0fd8cdcf86f07cd4be38afbb7c2bc"
-GNOME_COMPRESS_TYPE="bz2"
+do_configure_prepend_class-target () {
+    # introspection.m4 pre-packaged with upstream tarballs does not yet
+    # have our fixes
+    rm -f ${S}/introspection.m4
+}
+
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/gdata/.libs"
+}
+
+EXTRA_OECONF += "--disable-goa --disable-tests"
+
+SRC_URI[archive.md5sum] = "eb552a8a8482e4231a3d1baf7262e64d"
+SRC_URI[archive.sha256sum] = "8740e071ecb2ae0d2a4b9f180d2ae5fdf9dc4c41e7ff9dc7e057f62442800827"
-- 
2.7.0


