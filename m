Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id E946B7FC14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:48 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w62so6078023pfw.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1uV0vsXR5YiagN4XwALKOSUrijvxGMMmT655g1y3UZc=;
	b=Hgaow/nULmOa/UHB8dV2xI5i67h18ilTcEIq63/hlAz0cKZQck/N8FE2Pw8h5N+8rG
	gxgKJDXWcZhExKI00ua4MAayr5AIYtxgCSaSA9NtdZTwPUUbNmFWa9BDd+oAg7FHR/MN
	U/dFitNS/bvrkePz47DrfhCCQPtBFgw9Xj7vLffCVeNRo57lCI5jL10wSGQxcQGWB6Su
	Fk4nOuOaf2rnTJVMQd7YDYX+iVpGd5w+KhaEzBXulbp7hcGBV1+dObiF5oI7FtqahnwS
	IZTUbyUlVMGSdwY6/AWRfUxSgceOveBfcr1x3THErzpF0v/343KCLvPjqRBUZ6ilapnP
	JVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1uV0vsXR5YiagN4XwALKOSUrijvxGMMmT655g1y3UZc=;
	b=QYHsb1uTnwdUmwN2Bvu4lRYsRu5VbrjUxyouns+hhvuyr1sLp2BfY4BWZYl73Qjra5
	/ZrT7/OxbrfMoNawEyJF2vrKFO5sBCTsgiUeXuwqg1zLPwKQ+NdnyiPwkVrcEEe1Ke5g
	3q2j78mOJlYkCw6r6IpD51V6oGcW7iL2lpcV3hlm2TAuq//VtPwUO5ybtJi/zgl277V0
	SrCcMsLKdrJXvXpvvr7SZlhzSzejHIjuwnqbfbkNh64pI7uILvQwJnwMmNQ50ZMtT07y
	cml+Yahi1R59Sa0egAKyuG5HGD6pJO1ibnwS6/4rZC0hoaZTF57O0VBmEEq4GpIhEfmk
	2T0A==
X-Gm-Message-State: APjAAAVrAy4x6q2EBCJDyiLejgb+I9fQOjMlVeT0E0mSlz1ckWrwQGFM
	rr5t64L0wHGFuS7tsnh6DYFOiXxP65s=
X-Google-Smtp-Source: APXvYqwIJA2Mr6jx/3DS9L9sX6cUxEHNgUSqA9a9BHlU4rJG6/GW2HRGTWj206/tD6R+AQokptqNeg==
X-Received: by 2002:a63:1b47:: with SMTP id b7mr17562457pgm.446.1576886809399; 
	Fri, 20 Dec 2019 16:06:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:17 -0800
Message-Id: <20191221000635.1573390-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 05/23] avro-c: Update to 1.9.1
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport a patch to fix build with musl ( already in future 1.10.x release)
Add a cmake patch to fix build on mulilibbed env
delete already upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-C-to-be-built-on-musl-based-systems.patch | 42 +++++++++++
 ...avro-c-Fix-build-with-clang-compiler.patch | 37 ----------
 ...tallDirs-instead-of-hard-coded-paths.patch | 70 +++++++++++++++++++
 meta-oe/recipes-support/avro/avro-c_1.8.1.bb  | 20 ------
 meta-oe/recipes-support/avro/avro-c_1.9.1.bb  | 19 +++++
 5 files changed, 131 insertions(+), 57 deletions(-)
 create mode 100644 meta-oe/recipes-support/avro/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
 delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
 create mode 100644 meta-oe/recipes-support/avro/avro-c/0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch
 delete mode 100644 meta-oe/recipes-support/avro/avro-c_1.8.1.bb
 create mode 100644 meta-oe/recipes-support/avro/avro-c_1.9.1.bb

diff --git a/meta-oe/recipes-support/avro/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch b/meta-oe/recipes-support/avro/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
new file mode 100644
index 0000000000..8964d6b72f
--- /dev/null
+++ b/meta-oe/recipes-support/avro/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
@@ -0,0 +1,42 @@
+From 9b39a985bcd6cd34f0820f3680f145d46c0e56bd Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@railnova.eu>
+Date: Sun, 8 Dec 2019 01:55:59 +0100
+Subject: [PATCH] Allow avro C to be built on musl based systems.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The type `ssize_t` is defined in sys/types.h, and nowhere else
+in the musl standard C library, so it should be included for the
+compilation to succeed.
+
+This fixes several errors like:
+
+    In file included from src/generic.c:29:0:
+    src/generic.c: In function ‘avro_generic_value_new’:
+    src/avro_generic_internal.h:63:39:
+        error: ‘ssize_t’ undeclared (first use in this function);
+               did you mean ‘size_t’?
+
+Upstream-Status: Backport
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+---
+ lang/c/src/avro_generic_internal.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lang/c/src/avro_generic_internal.h b/lang/c/src/avro_generic_internal.h
+index 709403c03..9843ed652 100644
+--- a/lang/c/src/avro_generic_internal.h
++++ b/lang/c/src/avro_generic_internal.h
+@@ -24,6 +24,8 @@ extern "C" {
+ #define CLOSE_EXTERN
+ #endif
+ 
++#include <sys/types.h>
++
+ #include "avro/generic.h"
+ #include "avro/schema.h"
+ #include "avro/value.h"
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch b/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
deleted file mode 100644
index 01235d8ef3..0000000000
--- a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 518bb8ccfb3f3fc143fbd571782f3e40573d01b5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Apr 2017 09:15:04 -0700
-Subject: [PATCH] avro-c: Fix build with clang compiler
-
-Clang advertizes itself to be compatible with gcc 4.2.1
-while that was true several years ago, it now supports
-a lot more newer features, the test to just check gcc
-version should be supplanted with clang check as well
-so atomic support in clang can be asserted as well
-
-Fixes
-
-lang/c/src/avro/refcount.h:301:2: error: "No atomic implementation!"
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lang/c/src/avro/refcount.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lang/c/src/avro/refcount.h b/lang/c/src/avro/refcount.h
-index 69afa4fc..d76ba057 100644
---- a/lang/c/src/avro/refcount.h
-+++ b/lang/c/src/avro/refcount.h
-@@ -118,7 +118,8 @@ avro_refcount_dec(volatile int *refcount)
-  * GCC intrinsics
-  */
- 
--#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500
-+#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500 \
-+|| defined(__clang__)
- 
- static inline void
- avro_refcount_set(volatile int *refcount, int value)
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-support/avro/avro-c/0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch b/meta-oe/recipes-support/avro/avro-c/0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch
new file mode 100644
index 0000000000..6496b92dfe
--- /dev/null
+++ b/meta-oe/recipes-support/avro/avro-c/0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch
@@ -0,0 +1,70 @@
+From f24f863f3a8ca86f44123a58613f62c3b511da1e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 18:23:41 -0800
+Subject: [PATCH] cmake: Use GNUInstallDirs instead of hard-coded paths
+
+This ensures that it can be built on platforms where libdir is not
+/usr/lib e.g. ppc64
+
+Upstream-Status: Submitted [https://github.com/apache/avro/pull/749]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lang/c/CMakeLists.txt     |  2 +-
+ lang/c/src/CMakeLists.txt | 16 +++++++++-------
+ 2 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/lang/c/CMakeLists.txt b/lang/c/CMakeLists.txt
+index 11cbf018e..6c8d7aaf3 100644
+--- a/lang/c/CMakeLists.txt
++++ b/lang/c/CMakeLists.txt
+@@ -16,7 +16,7 @@
+ # specific language governing permissions and limitations
+ # under the License.
+ #
+-cmake_minimum_required(VERSION 2.4)
++cmake_minimum_required(VERSION 3.1)
+ project(AvroC)
+ enable_testing()
+ 
+diff --git a/lang/c/src/CMakeLists.txt b/lang/c/src/CMakeLists.txt
+index 6f5659750..c1761c8de 100644
+--- a/lang/c/src/CMakeLists.txt
++++ b/lang/c/src/CMakeLists.txt
+@@ -106,17 +106,19 @@ install(DIRECTORY
+         DESTINATION include
+         FILES_MATCHING PATTERN "*.h")
+ 
++include(GNUInstallDirs)
++
+ if (WIN32)
+ install(TARGETS avro-static
+-        RUNTIME DESTINATION bin
+-        LIBRARY DESTINATION lib
+-        ARCHIVE DESTINATION lib
++	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+        )
+ else(WIN32)
+ install(TARGETS avro-static avro-shared
+-        RUNTIME DESTINATION bin
+-        LIBRARY DESTINATION lib
+-        ARCHIVE DESTINATION lib
++	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+        )
+ endif(WIN32)
+ 
+@@ -126,7 +128,7 @@ set(prefix ${CMAKE_INSTALL_PREFIX})
+ set(VERSION ${AVRO_VERSION})
+ configure_file(avro-c.pc.in avro-c.pc)
+ install(FILES ${CMAKE_CURRENT_BINARY_DIR}/avro-c.pc
+-        DESTINATION lib/pkgconfig)
++        DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ 
+ add_executable(avrocat avrocat.c)
+ target_link_libraries(avrocat avro-static)
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
deleted file mode 100644
index 276fe2b5ae..0000000000
--- a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Apache Avro data serialization system."
-HOMEPAGE = "http://apr.apache.org/"
-SECTION = "libs"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=73bdf70f268f0b3b9c5a83dd7a6f3324"
-
-DEPENDS = "jansson zlib xz"
-PV .= "+git${SRCPV}"
-
-SRCREV = "4b3677c32b879e0e7f717eb95f9135ac654da760"
-SRC_URI = "git://github.com/apache/avro \
-           file://0001-avro-c-Fix-build-with-clang-compiler.patch;patchdir=../../ \
-"
-
-S = "${WORKDIR}/git/lang/c"
-
-LDFLAGS_append_libc-uclibc = " -lm"
-
-inherit cmake
diff --git a/meta-oe/recipes-support/avro/avro-c_1.9.1.bb b/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
new file mode 100644
index 0000000000..8954c9802f
--- /dev/null
+++ b/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Apache Avro data serialization system."
+HOMEPAGE = "http://apr.apache.org/"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
+
+DEPENDS = "jansson zlib xz"
+
+BRANCH = "branch-1.9"
+SRCREV = "89218262cde62e98fcb3778b86cd3f03056c54f3"
+SRC_URI = "git://github.com/apache/avro;branch=${BRANCH} \
+           file://0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch;patchdir=../../ \
+           file://0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch;patchdir=../../ \
+          "
+
+S = "${WORKDIR}/git/lang/c"
+
+inherit cmake
-- 
2.24.1


