Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D68E16FFEA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869117"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:09 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:31 +0200
Message-Id: <afad23bdd4a4d898d6b10ae79835905654f919fd.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/38] gstreamer-0.10: disable gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:09 -0000

Making it work would require significant patching - if you need it,
update your stack to gstreamer 1.x

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc      | 2 +-
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb   | 2 ++
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
index 123df42..dec6920 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
@@ -9,7 +9,7 @@ inherit autotools pkgconfig
 SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2"
 
 GSTREAMER_DEBUG ?= "--disable-debug"
-EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_DEBUG} --disable-examples "
+EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_DEBUG} --disable-examples --disable-introspection"
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
index 9318656..b78bcaf 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "9915887cf8515bda87462c69738646afb715b597613edc7340477ccab6
 
 DEPENDS = "gst-plugins-base gstreamer"
 
+EXTRA_OECONF = "--disable-introspection"
+
 # Configure always checks for Python so inherit pythonnative. Better solution
 # would be to disable the checks entirely.
 inherit autotools pythonnative gettext
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
index 5b30603..3444511 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
@@ -28,6 +28,7 @@ EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
             --disable-dependency-tracking --disable-check \
             --disable-examples --disable-tests \
             --disable-valgrind ${GSTREAMER_DEBUG} \
+            --disable-introspection \
             "
 
 CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
-- 
2.7.0


