Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3073.1610075049179965813
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 19:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,330,1602518400"; 
   d="scan'208";a="103294983"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jan 2021 11:03:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B4114CE602D
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Jan 2021 11:03:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 Jan 2021 11:03:55 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH v2] openjpeg: upgrade 2.3.1 -> 2.4.0
Date: Fri, 8 Jan 2021 23:03:53 +0800
Message-ID: <1610118233-5902-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7B4114CE602D.A1682
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

CVE-2020-15389.patch
CVE-2020-6851.patch
CVE-2020-8112.patch
Removed since these are included in 2.4.0.

Fixed an error where openjpeg.h could not be found.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-include-dir-to-usr-include-.-Obviou.patch | 36 +++++++++++++
 .../openjpeg/openjpeg/CVE-2020-15389.patch    | 51 -------------------
 .../openjpeg/openjpeg/CVE-2020-6851.patch     | 36 -------------
 .../openjpeg/openjpeg/CVE-2020-8112.patch     | 50 ------------------
 .../{openjpeg_2.3.1.bb => openjpeg_2.4.0.bb}  |  6 +--
 5 files changed, 38 insertions(+), 141 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.3.1.bb => openjpeg_2.4.0.bb} (78%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch
new file mode 100644
index 0000000000..663f499df6
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch
@@ -0,0 +1,36 @@
+From 3e4fe4c42d4d63c36df966baea87da6fbc032553 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Thu, 7 Jan 2021 16:05:28 +0900
+Subject: [PATCH] This patch fixed include dir to /usr/include/. Obviously, it
+ is not suitble for cross-compile. So, removed this patch temporarily.
+https://github.com/uclouvain/openjpeg/issues/1174
+
+Upsteam-Status: Pending
+https://github.com/uclouvain/openjpeg/issues/1320
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ cmake/OpenJPEGConfig.cmake.in | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/OpenJPEGConfig.cmake.in b/cmake/OpenJPEGConfig.cmake.in
+index 8a726697..2925108a 100644
+--- a/cmake/OpenJPEGConfig.cmake.in
++++ b/cmake/OpenJPEGConfig.cmake.in
+@@ -27,8 +27,12 @@ if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
+   # This is an install tree
+   include(${SELF_DIR}/OpenJPEGTargets.cmake)
+ 
++  # We find a relative path from the PKG directory to header files.
++  set(PKG_DIR "@CMAKE_INSTALL_PREFIX@/@OPENJPEG_INSTALL_PACKAGE_DIR@")
+   set(INC_DIR "@CMAKE_INSTALL_PREFIX@/@OPENJPEG_INSTALL_INCLUDE_DIR@")
+-  get_filename_component(OPENJPEG_INCLUDE_DIRS "${INC_DIR}" ABSOLUTE)
++  file(RELATIVE_PATH PKG_TO_INC_RPATH "${PKG_DIR}" "${INC_DIR}")
++
++  get_filename_component(OPENJPEG_INCLUDE_DIRS "${SELF_DIR}/${PKG_TO_INC_RPATH}" ABSOLUTE)
+ 
+ else()
+   if(EXISTS ${SELF_DIR}/OpenJPEGExports.cmake)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
deleted file mode 100644
index f5ce11a27f..0000000000
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From e8e258ab049240c2dd1f1051b4e773b21e2d3dc0 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sun, 28 Jun 2020 14:19:59 +0200
-Subject: [PATCH] opj_decompress: fix double-free on input directory with mix
- of valid and invalid images (CVE-2020-15389)
-
-Fixes #1261
-
-Credits to @Ruia-ruia for reporting and analysis.
----
- src/bin/jp2/opj_decompress.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
- 
---- end of original header ---
-
-CVE: CVE-2020-15389
-
-Upstream-Status: Backport [git://github.com/uclouvain/openjpeg.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
-diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
-index 7eeb0952..2634907f 100644
---- a/src/bin/jp2/opj_decompress.c
-+++ b/src/bin/jp2/opj_decompress.c
-@@ -1316,10 +1316,6 @@ static opj_image_t* upsample_image_components(opj_image_t* original)
- int main(int argc, char **argv)
- {
-     opj_decompress_parameters parameters;           /* decompression parameters */
--    opj_image_t* image = NULL;
--    opj_stream_t *l_stream = NULL;              /* Stream */
--    opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
--    opj_codestream_index_t* cstr_index = NULL;
- 
-     OPJ_INT32 num_images, imageno;
-     img_fol_t img_fol;
-@@ -1393,6 +1389,10 @@ int main(int argc, char **argv)
- 
-     /*Decoding image one by one*/
-     for (imageno = 0; imageno < num_images ; imageno++)  {
-+        opj_image_t* image = NULL;
-+        opj_stream_t *l_stream = NULL;              /* Stream */
-+        opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
-+        opj_codestream_index_t* cstr_index = NULL;
- 
-         if (!parameters.quiet) {
-             fprintf(stderr, "\n");
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
deleted file mode 100644
index 1e14149c85..0000000000
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 024b8407392cb0b82b04b58ed256094ed5799e04 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sat, 11 Jan 2020 01:51:19 +0100
-Subject: [PATCH] opj_j2k_update_image_dimensions(): reject images whose
- coordinates are beyond INT_MAX (fixes #1228)
-
-CVE: CVE-2020-6851
-
-Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
-
----
- src/lib/openjp2/j2k.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/lib/openjp2/j2k.c b/src/lib/openjp2/j2k.c
-index 14f6ff41..922550eb 100644
---- a/src/lib/openjp2/j2k.c
-+++ b/src/lib/openjp2/j2k.c
-@@ -9236,6 +9236,14 @@ static OPJ_BOOL opj_j2k_update_image_dim
-     l_img_comp = p_image->comps;
-     for (it_comp = 0; it_comp < p_image->numcomps; ++it_comp) {
-         OPJ_INT32 l_h, l_w;
-+        if (p_image->x0 > (OPJ_UINT32)INT_MAX ||
-+                p_image->y0 > (OPJ_UINT32)INT_MAX ||
-+                p_image->x1 > (OPJ_UINT32)INT_MAX ||
-+                p_image->y1 > (OPJ_UINT32)INT_MAX) {
-+            opj_event_msg(p_manager, EVT_ERROR,
-+                          "Image coordinates above INT_MAX are not supported\n");
-+            return OPJ_FALSE;
-+        }
- 
-         l_img_comp->x0 = (OPJ_UINT32)opj_int_ceildiv((OPJ_INT32)p_image->x0,
-                          (OPJ_INT32)l_img_comp->dx);
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
deleted file mode 100644
index 6158601af0..0000000000
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 05f9b91e60debda0e83977e5e63b2e66486f7074 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 30 Jan 2020 00:59:57 +0100
-Subject: [PATCH] opj_tcd_init_tile(): avoid integer overflow
-
-That could lead to later assertion failures.
-
-Fixes #1231 / CVE-2020-8112
-
-CVE: CVE-2020-8112
-
-Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
----
- src/lib/openjp2/tcd.c | 20 ++++++++++++++++++--
- 1 file changed, 18 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/openjp2/tcd.c b/src/lib/openjp2/tcd.c
-index deecc4df..aa419030 100644
---- a/src/lib/openjp2/tcd.c
-+++ b/src/lib/openjp2/tcd.c
-@@ -905,8 +905,24 @@ static INLINE OPJ_BOOL opj_tcd_init_tile(opj_tcd_t *p_tcd, OPJ_UINT32 p_tile_no,
-             /* p. 64, B.6, ISO/IEC FDIS15444-1 : 2000 (18 august 2000)  */
-             l_tl_prc_x_start = opj_int_floordivpow2(l_res->x0, (OPJ_INT32)l_pdx) << l_pdx;
-             l_tl_prc_y_start = opj_int_floordivpow2(l_res->y0, (OPJ_INT32)l_pdy) << l_pdy;
--            l_br_prc_x_end = opj_int_ceildivpow2(l_res->x1, (OPJ_INT32)l_pdx) << l_pdx;
--            l_br_prc_y_end = opj_int_ceildivpow2(l_res->y1, (OPJ_INT32)l_pdy) << l_pdy;
-+            {
-+                OPJ_UINT32 tmp = ((OPJ_UINT32)opj_int_ceildivpow2(l_res->x1,
-+                                  (OPJ_INT32)l_pdx)) << l_pdx;
-+                if (tmp > (OPJ_UINT32)INT_MAX) {
-+                    opj_event_msg(manager, EVT_ERROR, "Integer overflow\n");
-+                    return OPJ_FALSE;
-+                }
-+                l_br_prc_x_end = (OPJ_INT32)tmp;
-+            }
-+            {
-+                OPJ_UINT32 tmp = ((OPJ_UINT32)opj_int_ceildivpow2(l_res->y1,
-+                                  (OPJ_INT32)l_pdy)) << l_pdy;
-+                if (tmp > (OPJ_UINT32)INT_MAX) {
-+                    opj_event_msg(manager, EVT_ERROR, "Integer overflow\n");
-+                    return OPJ_FALSE;
-+                }
-+                l_br_prc_y_end = (OPJ_INT32)tmp;
-+            }
-             /*fprintf(stderr, "\t\t\tprc_x_start=%d, prc_y_start=%d, br_prc_x_end=%d, br_prc_y_end=%d \n", l_tl_prc_x_start, l_tl_prc_y_start, l_br_prc_x_end ,l_br_prc_y_end );*/
- 
-             l_res->pw = (l_res->x0 == l_res->x1) ? 0U : (OPJ_UINT32)((
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
similarity index 78%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index a0740a2740..8e264bf71b 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -8,11 +8,9 @@ DEPENDS = "libpng tiff lcms zlib"
 SRC_URI = " \
     git://github.com/uclouvain/openjpeg.git \
     file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
-    file://CVE-2020-6851.patch \
-    file://CVE-2020-8112.patch \
-    file://CVE-2020-15389.patch \
+    file://0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch \
 "
-SRCREV = "57096325457f96d8cd07bd3af04fe81d7a2ba788"
+SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.25.1



