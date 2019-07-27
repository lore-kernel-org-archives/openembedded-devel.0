Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C682C75C60
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 14:26:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6REQdxI015183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 07:26:49 -0700
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 27 Jul 2019 07:26:28 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 27 Jul 2019 10:26:28 -0400
Message-ID: <20190727142628.6417-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] poppler: update from 0.75.0 to 0.79.0
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
X-List-Received-Date: Sat, 27 Jul 2019 14:26:58 -0000
Content-Type: text/plain

Adjust the basename-include patch to deal with upstream change
of introducing goo/gbasename.cc.

Drop 0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
since that was done upstream in:
   9481c473 glib: pass poppler to gir libs.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../poppler/poppler/basename-include.patch    | 31 +++++++++++++------
 .../{poppler_0.75.0.bb => poppler_0.79.0.bb}  |  5 ++-
 2 files changed, 23 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.75.0.bb => poppler_0.79.0.bb} (91%)

diff --git a/meta-oe/recipes-support/poppler/poppler/basename-include.patch b/meta-oe/recipes-support/poppler/poppler/basename-include.patch
index ab6bdb080..c18a5f5c0 100644
--- a/meta-oe/recipes-support/poppler/poppler/basename-include.patch
+++ b/meta-oe/recipes-support/poppler/poppler/basename-include.patch
@@ -1,20 +1,31 @@
-Minic GNU basename() API for non-glibc library e.g. musl
+From 2ac679158062b14729f82f513fc7cafbb6f4f7a6 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Fri, 26 Jul 2019 14:26:54 -0400
+Subject: [PATCH 3/3] Minic GNU basename() API for non-glibc library e.g. musl
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ goo/gbasename.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
 
-Index: poppler-0.64.0/utils/pdfsig.cc
-===================================================================
---- poppler-0.64.0.orig/utils/pdfsig.cc
-+++ poppler-0.64.0/utils/pdfsig.cc
-@@ -35,6 +35,10 @@
- #include "numberofcharacters.h"
- #include <libgen.h>
+diff --git a/goo/gbasename.cc b/goo/gbasename.cc
+index 830c1c80..e93eb368 100644
+--- a/goo/gbasename.cc
++++ b/goo/gbasename.cc
+@@ -46,6 +46,10 @@
+ #include <stdlib.h>
+ #include <string.h>
  
 +#if !defined(__GLIBC__)
 +#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
 +#endif
 +
- static const char * getReadableSigState(SignatureValidationStatus sig_vs)
+ std::string gbasename(const char* filename)
  {
-   switch(sig_vs) {
+ #ifdef _MSC_VER
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-support/poppler/poppler_0.75.0.bb b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
similarity index 91%
rename from meta-oe/recipes-support/poppler/poppler_0.75.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.79.0.bb
index 0704f1a2a..068433475 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.75.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
@@ -5,11 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch \
-           file://0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "3fb4ca803d989742695ca586c5cc489e"
-SRC_URI[sha256sum] = "3bbaedb0fa2797cac933a0659d144303e4d09eec6892c65600da987d8707199a"
+SRC_URI[md5sum] = "0aac1fcb6466f8b7bdf51871264c7e83"
+SRC_URI[sha256sum] = "f985a4608fe592d2546d9d37d4182e502ff6b4c42f8db4be0a021a1c369528c8"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.17.0


