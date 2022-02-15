Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0093EC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 09:34:19 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.7562.1644917657225117779
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 01:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21F9YGDn013001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 01:34:16 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 15 Feb 2022 01:34:15 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Feb 2022 01:34:15 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 15 Feb 2022 01:34:14 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] openjpeg: fix CVE-2021-29338
Date: Tue, 15 Feb 2022 17:34:12 +0800
Message-ID: <20220215093412.29506-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Feb 2022 09:34:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95316

From: Kai Kang <kai.kang@windriver.com>

CVE: CVE-2021-29338

Ref:
* https://github.com/uclouvain/openjpeg/issues/1338

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../openjpeg/openjpeg/CVE-2021-29338.patch    | 78 +++++++++++++++++++
 .../openjpeg/openjpeg_2.4.0.bb                |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch
new file mode 100644
index 000000000..a7c2bb4f3
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch
@@ -0,0 +1,78 @@
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/pull/1395/commits/f0727df]
+CVE: CVE-2021-29338
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From f0727df07c4d944d7d1c5002451cfbc9545d3288 Mon Sep 17 00:00:00 2001
+From: Brad Parham <brad.a.parham@intel.com>
+Date: Wed, 12 Jan 2022 12:20:28 +0100
+Subject: [PATCH] Fix integer overflow in num_images
+
+Includes the fix for CVE-2021-29338
+Credit to @kaniini based on #1346
+Fixes #1338
+---
+ src/bin/jp2/opj_compress.c   | 4 ++--
+ src/bin/jp2/opj_decompress.c | 5 ++---
+ src/bin/jp2/opj_dump.c       | 7 ++++---
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/bin/jp2/opj_compress.c b/src/bin/jp2/opj_compress.c
+index 8c71d4536..1399d5277 100644
+--- a/src/bin/jp2/opj_compress.c
++++ b/src/bin/jp2/opj_compress.c
+@@ -1959,9 +1959,9 @@ int main(int argc, char **argv)
+         num_images = get_num_images(img_fol.imgdirpath);
+         dirptr = (dircnt_t*)malloc(sizeof(dircnt_t));
+         if (dirptr) {
+-            dirptr->filename_buf = (char*)malloc(num_images * OPJ_PATH_LEN * sizeof(
++            dirptr->filename_buf = (char*)calloc(num_images, OPJ_PATH_LEN * sizeof(
+                     char)); /* Stores at max 10 image file names*/
+-            dirptr->filename = (char**) malloc(num_images * sizeof(char*));
++            dirptr->filename = (char**) calloc(num_images, sizeof(char*));
+             if (!dirptr->filename_buf) {
+                 ret = 0;
+                 goto fin;
+diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
+index fc0012b63..e1217f891 100644
+--- a/src/bin/jp2/opj_decompress.c
++++ b/src/bin/jp2/opj_decompress.c
+@@ -1374,14 +1374,13 @@ int main(int argc, char **argv)
+             return EXIT_FAILURE;
+         }
+         /* Stores at max 10 image file names */
+-        dirptr->filename_buf = (char*)malloc(sizeof(char) *
+-                                             (size_t)num_images * OPJ_PATH_LEN);
++        dirptr->filename_buf = calloc((size_t) num_images, sizeof(char) * OPJ_PATH_LEN);
+         if (!dirptr->filename_buf) {
+             failed = 1;
+             goto fin;
+         }
+ 
+-        dirptr->filename = (char**) malloc((size_t)num_images * sizeof(char*));
++        dirptr->filename = (char**) calloc((size_t) num_images, sizeof(char*));
+ 
+         if (!dirptr->filename) {
+             failed = 1;
+diff --git a/src/bin/jp2/opj_dump.c b/src/bin/jp2/opj_dump.c
+index 6111d2ab6..d2646f10e 100644
+--- a/src/bin/jp2/opj_dump.c
++++ b/src/bin/jp2/opj_dump.c
+@@ -515,13 +515,14 @@ int main(int argc, char *argv[])
+         if (!dirptr) {
+             return EXIT_FAILURE;
+         }
+-        dirptr->filename_buf = (char*)malloc((size_t)num_images * OPJ_PATH_LEN * sizeof(
+-                char)); /* Stores at max 10 image file names*/
++        /* Stores at max 10 image file names*/
++        dirptr->filename_buf = (char*) calloc((size_t) num_images,
++                                              OPJ_PATH_LEN * sizeof(char));
+         if (!dirptr->filename_buf) {
+             free(dirptr);
+             return EXIT_FAILURE;
+         }
+-        dirptr->filename = (char**) malloc((size_t)num_images * sizeof(char*));
++        dirptr->filename = (char**) calloc((size_t) num_images, sizeof(char*));
+ 
+         if (!dirptr->filename) {
+             goto fails;
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index 0533f9262..b41bb9eb8 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
     file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
     file://0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch \
+    file://CVE-2021-29338.patch \
 "
 SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
 S = "${WORKDIR}/git"
-- 
2.17.1


