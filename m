Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31F6C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 15:07:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.30210.1652713621416804431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 08:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KF93Dn11;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652713619; i=@fujitsu.com;
	bh=W+rJu92tU3nsd6uls4WviJzgNdi321LFTEswj/UX0F4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KF93Dn11TDe1C97/1eHY9Jk3K0hGsgQbCfMcjseM5wh0DP1zpaHx/Gr+9ZW+29Ivd
	 NBA003id9Jvqg0C2NIIiAvp/9ta46JtBeyJ5vzSiE0pBBG/9cPeGViLyvxLw1oCOfv
	 CM1BsRjvjUoZPHV9Ykqww2KO/zEIwlCETMcyUidp7FsE//i0OVJ2FWw/o1h2/gGN9E
	 R8DomDhXNfQCNHb3shRAwi5G4zUGx9Q0YoMDwrVNp1DFYOpzG4a2TH060ehO4wN6d8
	 gMZTaY8YZWZjVciz+d08PnfLd07q7UXQpDOQBI6Hc6C2kVee5kU7gY4LONRIiXuYzY
	 5HaznIM5KdMzA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8ORqDspoyn
  J4PcMC4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPXl8PMBS1eFdtbHjM3MB6y62Lk4hASeMIo
  8ej6PzYI5wKTxM5zW1ghnD2MEh3bFjB2MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgILH3ZwsTiM0CFJ97fx5YPa+Ak0TbzftgNRICChJTHr4H6+UUcJY4dG8n2HwhoJrdH6
  cyQdQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzNjGBmGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVonVSUmZ5RkpuYmaNraGCga2hoqmtsqmtoYaKXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdc
  mZuck6KXl1qyiREYyCnFyjt2MLat+ql3iFGSg0lJlHdNclOSEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQnehjSgnGBRanpqRVpmDjCqYNISHDxKIrzH44HSvMUFibnFmekQqVOMlhx3F+7dy8xxeM
  IlILlzy+W9zEIsefl5qVLivCcTgBoEQBoySvPgxsEi/xKjrJQwLyMDA4MQT0FqUW5mCar8K0Z
  xDkYlYV7TdKApPJl5JXBbXwEdxAR0kIh+I8hBJYkIKakGpqbCddXqUyqeCWQL8S9QmiW1stQs
  WrHi/oHmSz9jDgZpLMx+YZu8cbuI45mDkw+nHVaryGCYsOqWVLdrJ/eGNY3rFk4/dnJny3HJJ
  16BThWPTvA2hFhI7UsTOdMas0n04Zb1p/NOLElZ87IncpWRVt0m1xs6Gzb815C++1rpr1yS4C
  rFjY+FrD9OW3dN+Nac3+sS2j9fXqf/X3xqH59/8zUv7fwp3bXz7fdaTtvh7Vzyq/GO26oL7Hs
  Xtd3pPFWXsUi9/Tk7+52LTJv5g2NOCyY7Xn1d0qMcnn1KxXMjY+TUxuevmqrU9srVafzZftBH
  61C55z2Bux6eRz8FLlL9/GSq5WbmDoGgt2qLt72a06/EUpyRaKjFXFScCABzv9IAdwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1652713618!85134!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26797 invoked from network); 16 May 2022 15:06:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 May 2022 15:06:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4FD7A100196
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:06:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0F398100182
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:06:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 16 May 2022 16:06:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] openjpeg: upgrade 2.4.0 -> 2.5.0
Date: Fri, 6 May 2022 22:48:29 +0800
Message-ID: <1651848510-13012-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651848510-13012-1-git-send-email-wangmy@fujitsu.com>
References: <1651848510-13012-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 15:07:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97129

file://0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch
file://CVE-2021-29338.patch
file://CVE-2022-1122.patch
removed since they're included in 2.5.0


Changelog:
==========
No API/ABI break compared to v2.4.0, but additional symbols for subset of components decoding (hence the MINOR version bump).

    Encoder: add support for generation of TLM markers
    Decoder: add support for high throughput (HTJ2K) decoding.
    Decoder: add support for partial bitstream decoding

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-include-dir-to-usr-include-.-Obviou.patch | 36 ---------
 .../openjpeg/openjpeg/CVE-2021-29338.patch    | 78 -------------------
 .../openjpeg/openjpeg/CVE-2022-1122.patch     | 31 --------
 .../{openjpeg_2.4.0.bb => openjpeg_2.5.0.bb}  | 12 +--
 4 files changed, 4 insertions(+), 153 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2022-1122.patch
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.4.0.bb => openjpeg_2.5.0.bb} (55%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch
deleted file mode 100644
index 663f499df..000000000
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3e4fe4c42d4d63c36df966baea87da6fbc032553 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Thu, 7 Jan 2021 16:05:28 +0900
-Subject: [PATCH] This patch fixed include dir to /usr/include/. Obviously, it
- is not suitble for cross-compile. So, removed this patch temporarily.
-https://github.com/uclouvain/openjpeg/issues/1174
-
-Upsteam-Status: Pending
-https://github.com/uclouvain/openjpeg/issues/1320
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- cmake/OpenJPEGConfig.cmake.in | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/cmake/OpenJPEGConfig.cmake.in b/cmake/OpenJPEGConfig.cmake.in
-index 8a726697..2925108a 100644
---- a/cmake/OpenJPEGConfig.cmake.in
-+++ b/cmake/OpenJPEGConfig.cmake.in
-@@ -27,8 +27,12 @@ if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
-   # This is an install tree
-   include(${SELF_DIR}/OpenJPEGTargets.cmake)
- 
-+  # We find a relative path from the PKG directory to header files.
-+  set(PKG_DIR "@CMAKE_INSTALL_PREFIX@/@OPENJPEG_INSTALL_PACKAGE_DIR@")
-   set(INC_DIR "@CMAKE_INSTALL_PREFIX@/@OPENJPEG_INSTALL_INCLUDE_DIR@")
--  get_filename_component(OPENJPEG_INCLUDE_DIRS "${INC_DIR}" ABSOLUTE)
-+  file(RELATIVE_PATH PKG_TO_INC_RPATH "${PKG_DIR}" "${INC_DIR}")
-+
-+  get_filename_component(OPENJPEG_INCLUDE_DIRS "${SELF_DIR}/${PKG_TO_INC_RPATH}" ABSOLUTE)
- 
- else()
-   if(EXISTS ${SELF_DIR}/OpenJPEGExports.cmake)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch
deleted file mode 100644
index a7c2bb4f3..000000000
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-29338.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/pull/1395/commits/f0727df]
-CVE: CVE-2021-29338
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From f0727df07c4d944d7d1c5002451cfbc9545d3288 Mon Sep 17 00:00:00 2001
-From: Brad Parham <brad.a.parham@intel.com>
-Date: Wed, 12 Jan 2022 12:20:28 +0100
-Subject: [PATCH] Fix integer overflow in num_images
-
-Includes the fix for CVE-2021-29338
-Credit to @kaniini based on #1346
-Fixes #1338
----
- src/bin/jp2/opj_compress.c   | 4 ++--
- src/bin/jp2/opj_decompress.c | 5 ++---
- src/bin/jp2/opj_dump.c       | 7 ++++---
- 3 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/bin/jp2/opj_compress.c b/src/bin/jp2/opj_compress.c
-index 8c71d4536..1399d5277 100644
---- a/src/bin/jp2/opj_compress.c
-+++ b/src/bin/jp2/opj_compress.c
-@@ -1959,9 +1959,9 @@ int main(int argc, char **argv)
-         num_images = get_num_images(img_fol.imgdirpath);
-         dirptr = (dircnt_t*)malloc(sizeof(dircnt_t));
-         if (dirptr) {
--            dirptr->filename_buf = (char*)malloc(num_images * OPJ_PATH_LEN * sizeof(
-+            dirptr->filename_buf = (char*)calloc(num_images, OPJ_PATH_LEN * sizeof(
-                     char)); /* Stores at max 10 image file names*/
--            dirptr->filename = (char**) malloc(num_images * sizeof(char*));
-+            dirptr->filename = (char**) calloc(num_images, sizeof(char*));
-             if (!dirptr->filename_buf) {
-                 ret = 0;
-                 goto fin;
-diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
-index fc0012b63..e1217f891 100644
---- a/src/bin/jp2/opj_decompress.c
-+++ b/src/bin/jp2/opj_decompress.c
-@@ -1374,14 +1374,13 @@ int main(int argc, char **argv)
-             return EXIT_FAILURE;
-         }
-         /* Stores at max 10 image file names */
--        dirptr->filename_buf = (char*)malloc(sizeof(char) *
--                                             (size_t)num_images * OPJ_PATH_LEN);
-+        dirptr->filename_buf = calloc((size_t) num_images, sizeof(char) * OPJ_PATH_LEN);
-         if (!dirptr->filename_buf) {
-             failed = 1;
-             goto fin;
-         }
- 
--        dirptr->filename = (char**) malloc((size_t)num_images * sizeof(char*));
-+        dirptr->filename = (char**) calloc((size_t) num_images, sizeof(char*));
- 
-         if (!dirptr->filename) {
-             failed = 1;
-diff --git a/src/bin/jp2/opj_dump.c b/src/bin/jp2/opj_dump.c
-index 6111d2ab6..d2646f10e 100644
---- a/src/bin/jp2/opj_dump.c
-+++ b/src/bin/jp2/opj_dump.c
-@@ -515,13 +515,14 @@ int main(int argc, char *argv[])
-         if (!dirptr) {
-             return EXIT_FAILURE;
-         }
--        dirptr->filename_buf = (char*)malloc((size_t)num_images * OPJ_PATH_LEN * sizeof(
--                char)); /* Stores at max 10 image file names*/
-+        /* Stores at max 10 image file names*/
-+        dirptr->filename_buf = (char*) calloc((size_t) num_images,
-+                                              OPJ_PATH_LEN * sizeof(char));
-         if (!dirptr->filename_buf) {
-             free(dirptr);
-             return EXIT_FAILURE;
-         }
--        dirptr->filename = (char**) malloc((size_t)num_images * sizeof(char*));
-+        dirptr->filename = (char**) calloc((size_t) num_images, sizeof(char*));
- 
-         if (!dirptr->filename) {
-             goto fails;
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2022-1122.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2022-1122.patch
deleted file mode 100644
index 8aa9c15e3..000000000
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2022-1122.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/0afbdcf3e6d0d2bd2e16a0c4d513ee3cf86e460d]
-CVE: CVE-2022-1122
-
-While this patch improves things re-CVE-2022-1122, the defect is undergoing re-analysis and there may be follow-up commits.
-
-From 0afbdcf3e6d0d2bd2e16a0c4d513ee3cf86e460d Mon Sep 17 00:00:00 2001
-From: xiaoxiaoafeifei <lliangliang2007@163.com>
-Date: Wed, 14 Jul 2021 09:35:13 +0800
-Subject: [PATCH] Fix segfault in src/bin/jp2/opj_decompress.c due to
- uninitialized pointer (fixes #1368) (#1369)
-
----
- src/bin/jp2/opj_decompress.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
-index 0e028735..18ead672 100644
---- a/src/bin/jp2/opj_decompress.c
-+++ b/src/bin/jp2/opj_decompress.c
-@@ -1356,7 +1356,7 @@ int main(int argc, char **argv)
-         int it_image;
-         num_images = get_num_images(img_fol.imgdirpath);
- 
--        dirptr = (dircnt_t*)malloc(sizeof(dircnt_t));
-+        dirptr = (dircnt_t*)calloc(1, sizeof(dircnt_t));
-         if (!dirptr) {
-             destroy_parameters(&parameters);
-             return EXIT_FAILURE;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
similarity index 55%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
index f248619ec..c71e53564 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
@@ -5,14 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
 
 DEPENDS = "libpng tiff lcms zlib"
 
-SRC_URI = " \
-    git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
-    file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
-    file://0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch \
-    file://CVE-2021-29338.patch \
-    file://CVE-2022-1122.patch \
-"
-SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
+SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
+           file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+           "
+SRCREV = "a5891555eb49ed7cc26b2901ea680acda136d811"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.25.1


