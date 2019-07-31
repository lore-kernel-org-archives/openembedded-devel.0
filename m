Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07C037F377
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 06:11:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6V6BMLu022468
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 23:11:22 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 30 Jul 2019 23:11:09 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jul 2019 02:11:07 -0400
Message-ID: <20190731061107.129941-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] poppler: 0.75.0 -> 0.79.0
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
X-List-Received-Date: Wed, 31 Jul 2019 06:11:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update poppler from 0.75.0 to 0.79.0:

* remove patch which has been fixed in upstream
* correct the way to toggle gobject-introspect support respect to
  variable GI_DATA_ENABLED

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...txt-Add-libpoppler-to-link-along-wit.patch | 32 -------------------
 .../{poppler_0.75.0.bb => poppler_0.79.0.bb}  |  6 ++--
 2 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
 rename meta-oe/recipes-support/poppler/{poppler_0.75.0.bb => poppler_0.79.0.bb} (89%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch b/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
deleted file mode 100644
index c364d7372..000000000
--- a/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d488de23b75b2f3e235f1c184b2253d1402b4c0f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 10 May 2018 23:47:56 -0700
-Subject: [PATCH] glib/CMakeLists.txt: Add libpoppler to link along with
- poppler-glib
-
-This is required since poppler-glib uses symbols from poppler and
-we use --as-needed
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- glib/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/glib/CMakeLists.txt b/glib/CMakeLists.txt
-index 6f91669..ca5021f 100644
---- a/glib/CMakeLists.txt
-+++ b/glib/CMakeLists.txt
-@@ -135,7 +135,7 @@ if (HAVE_INTROSPECTION AND BUILD_SHARED_LIBS)
-   get_directory_property(_tmp_includes INCLUDE_DIRECTORIES)
-   _list_prefix(_includes _tmp_includes "-I")
-   set(Poppler_0_18_gir_CFLAGS ${_includes} -L${CMAKE_BINARY_DIR} -L${CMAKE_CURRENT_BINARY_DIR})
--  set(Poppler_0_18_gir_LIBS poppler-glib)
-+  set(Poppler_0_18_gir_LIBS poppler-glib poppler)
-   _list_prefix(_abs_introspection_files introspection_files "${CMAKE_CURRENT_SOURCE_DIR}/")
-   list(APPEND _abs_introspection_files
-     ${CMAKE_CURRENT_BINARY_DIR}/poppler-enums.c
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-support/poppler/poppler_0.75.0.bb b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
similarity index 89%
rename from meta-oe/recipes-support/poppler/poppler_0.75.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.79.0.bb
index 0704f1a2a..b285eecd2 100644
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
 
@@ -35,6 +34,7 @@ EXTRA_OECMAKE += " \
     -DBUILD_GTK_TESTS=OFF \
     -DENABLE_ZLIB=ON \
     -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH='${STAGING_INCDIR}' \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_GOBJECT_INTROSPECTION=ON', '-DENABLE_GOBJECT_INTROSPECTION=OFF', d)} \
 "
 
 do_configure_append() {
-- 
2.20.0


