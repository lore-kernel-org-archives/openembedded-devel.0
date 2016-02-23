Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6D56A7738B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751677038"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:43 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:20:07 +0200
Message-Id: <55a693f43738f30d0878aaf1fdf94d3560c0d6f4.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 28/34] gimp: accept newer versins of babl and gegl
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:43 -0000

Add a patch that makes gimp accept new versions of babl and gegl,
taken from Debian.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gimp/gimp/bump_Babl-GEGL_versions.patch        | 53 ++++++++++++++++++++++
 meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb       |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_versions.patch

diff --git a/meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_versions.patch b/meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_versions.patch
new file mode 100644
index 0000000..b71bf32
--- /dev/null
+++ b/meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_versions.patch
@@ -0,0 +1,53 @@
+Bump acceptable versions of babl and gegl.
+
+Patch is taken from debian:
+https://packages.debian.org/stretch/gimp
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+diff --git a/app/sanity.c b/app/sanity.c
+index febddfb..85fea55 100644
+--- a/app/sanity.c
++++ b/app/sanity.c
+@@ -351,7 +351,7 @@ sanity_check_babl (void)
+ 
+ #define BABL_REQUIRED_MAJOR 0
+ #define BABL_REQUIRED_MINOR 1
+-#define BABL_REQUIRED_MICRO 10
++#define BABL_REQUIRED_MICRO 12
+ 
+   babl_get_version (&babl_major_version,
+                     &babl_minor_version,
+@@ -388,7 +388,7 @@ sanity_check_gegl (void)
+   gint gegl_micro_version;
+ 
+ #define GEGL_REQUIRED_MAJOR 0
+-#define GEGL_REQUIRED_MINOR 2
++#define GEGL_REQUIRED_MINOR 3
+ #define GEGL_REQUIRED_MICRO 0
+ 
+   gegl_get_version (&gegl_major_version,
+diff --git a/configure.ac b/configure.ac
+index 26812b6..4252fe9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,8 +40,8 @@ m4_define([gimp_stable],
+ m4_define([gimp_full_name], [GNU Image Manipulation Program])
+ 
+ # required versions of other packages
+-m4_define([babl_required_version], [0.1.10])
+-m4_define([gegl_required_version], [0.2.0])
++m4_define([babl_required_version], [0.1.12])
++m4_define([gegl_required_version], [0.3.0])
+ m4_define([glib_required_version], [2.30.2])
+ m4_define([atk_required_version], [2.2.0])
+ m4_define([gtk_required_version], [2.24.10])
+@@ -519,7 +519,7 @@ AC_SUBST(ISO_CODES_LOCALEDIR)
+ ###############################
+ 
+ PKG_CHECK_MODULES(BABL, babl >= babl_required_version)
+-PKG_CHECK_MODULES(GEGL, gegl-0.2 >= gegl_required_version)
++PKG_CHECK_MODULES(GEGL, gegl-0.3 >= gegl_required_version)
+ PKG_CHECK_MODULES(ATK, atk >= atk_required_version)
+ 
+ AM_PATH_GLIB_2_0(glib_required_version, :,
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
index 1522fd6..a647911 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
@@ -12,6 +12,7 @@ inherit gnome gtk-doc
 SRC_URI = " \
     http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
     file://0001-configure-ac-do-not-check-for-freetype-config.patch \
+    file://bump_Babl-GEGL_versions.patch \
 "
 SRC_URI[md5sum] = "233c948203383fa078434cc3f8f925cb"
 SRC_URI[sha256sum] = "d82a958641c9c752d68e35f65840925c08e314cea90222ad845892a40e05b22d"
-- 
2.7.0


