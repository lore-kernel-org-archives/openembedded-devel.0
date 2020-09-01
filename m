Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.3209.1598985879793691283
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 11:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 081IicjG024990
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Sep 2020 11:44:39 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Sep 2020
 11:44:38 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] openjpeg: fix CVE-2020-15389
Date: Tue, 1 Sep 2020 11:44:37 -0700
Message-ID: <20200901184437.26767-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Backport from github meta-xilinx-tools.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../openjpeg/openjpeg/CVE-2020-15389.patch    | 51 +++++++++++++++++++
 .../openjpeg/openjpeg_2.3.1.bb                |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
new file mode 100644
index 000000000..5c5d3f48e
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
@@ -0,0 +1,51 @@
+From e8e258ab049240c2dd1f1051b4e773b21e2d3dc0 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 28 Jun 2020 14:19:59 +0200
+Subject: [PATCH] opj_decompress: fix double-free on input directory with mix
+ of valid and invalid images (CVE-2020-15389)
+
+Fixes #1261
+
+Credits to @Ruia-ruia for reporting and analysis.
+---
+ src/bin/jp2/opj_decompress.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+ 
+--- end of original header ---
+
+CVE: CVE-2020-15389
+
+Upstream-Status: Backport [git://github/uclouvain/openjpeg.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
+index 7eeb0952..2634907f 100644
+--- a/src/bin/jp2/opj_decompress.c
++++ b/src/bin/jp2/opj_decompress.c
+@@ -1316,10 +1316,6 @@ static opj_image_t* upsample_image_components(opj_image_t* original)
+ int main(int argc, char **argv)
+ {
+     opj_decompress_parameters parameters;           /* decompression parameters */
+-    opj_image_t* image = NULL;
+-    opj_stream_t *l_stream = NULL;              /* Stream */
+-    opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
+-    opj_codestream_index_t* cstr_index = NULL;
+ 
+     OPJ_INT32 num_images, imageno;
+     img_fol_t img_fol;
+@@ -1393,6 +1389,10 @@ int main(int argc, char **argv)
+ 
+     /*Decoding image one by one*/
+     for (imageno = 0; imageno < num_images ; imageno++)  {
++        opj_image_t* image = NULL;
++        opj_stream_t *l_stream = NULL;              /* Stream */
++        opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
++        opj_codestream_index_t* cstr_index = NULL;
+ 
+         if (!parameters.quiet) {
+             fprintf(stderr, "\n");
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
index 42011efa9..a0740a274 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
     file://CVE-2020-6851.patch \
     file://CVE-2020-8112.patch \
+    file://CVE-2020-15389.patch \
 "
 SRCREV = "57096325457f96d8cd07bd3af04fe81d7a2ba788"
 S = "${WORKDIR}/git"
-- 
2.17.1

