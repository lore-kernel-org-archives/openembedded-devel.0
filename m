Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 54E1771B13
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 05:33:18 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id d8so4511003pgt.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 22:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sbInVHfIGzU9e8BA2bFL1DaNESSCrUcLsw5QHq9URT0=;
	b=nOqEfGSJj5OZBegFUUnby4JQ52HRp0tsC5AMxnoGpD4uMw5/jVi64EMGQ0jdV3ipnY
	4DSiGF3ZeJ8Vlm8jIbXMPz4duhbR+hjYdxvU4IgoPpjqeY0xuG5vIsfGGG7I3dGwDjZq
	OUQ2Npt/vPUb95EOCrCgktLShp8qtxI7iTOWbHW8BpF2fcz8eILvyd6d441H8PlqLRee
	2E07qJRYD12PL34tJCkZ7Byjbsh4u92NQhPoxSHfNLeAnfMU83Sp3RcI+okPj6/iwQD7
	aNJQTdxkAS2B6Cj7KkaZfuVNNrEiVUod3gqBn0tWRiIz5BevMDjQY9GU54Bq99VZ4jkP
	MoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sbInVHfIGzU9e8BA2bFL1DaNESSCrUcLsw5QHq9URT0=;
	b=ekDEDQ1fxMXOzfJj9ObHnna1lX/IC2uGEy9wC2eJM1udMDFAepAU07MDoJ+58AGdWH
	YRgI62jf+IQUsYjb0MwBIrzdJGNmWrBZ10dwCIXUiFf8e9osr5Hzt+s4BP7kqr1iDy2h
	bCuZg+J5a1t1S1WJEbpaGAYlE8s5oTY1CjN/RBCW4Om0pIgFjYx38I3q7BY5gbdzA8i9
	aeyhrHzXzA3xiDGZfJGiT0/Kpm5VgILRFEnOWv92lJrvlCUkLAz1v0ptRW0Cxvq4bKtM
	lUVsWdmltGU956H8+040O8mGMdyW+8MLhH7X8qxYF4CvNDOAC3BLY0a9VWbuf/0fKiC9
	ED5A==
X-Gm-Message-State: AHPjjUhlic37k7Uo8dwhfQ1BY40GJR45bCtOj40OAg3uQ1bUZLkuxngV
	Xme+H1Igb9Am1gZ3
X-Google-Smtp-Source: ADKCNb5qLJgKylrWkEI4eCPzuC10YhhbdYZ1aUq2HwxhSdo2dnnDm/RlSb97TiIxwpCStGtAt0p94w==
X-Received: by 10.101.82.8 with SMTP id o8mr1515298pgp.261.1504762400158;
	Wed, 06 Sep 2017 22:33:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id
	d127sm1676723pga.47.2017.09.06.22.33.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 22:33:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Sep 2017 22:33:10 -0700
Message-Id: <20170907053310.7359-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH] fluentbit: Upgrade to 0.12.1
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
X-List-Received-Date: Thu, 07 Sep 2017 05:33:19 -0000

Drop upstreamed patches
Fix jemalloc build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...proxy-go-Add-missing-dependency-on-jemall.patch | 24 -------------------
 ...pack-Add-comment-for-intended-fallthrough.patch | 28 ----------------------
 .../fluentbit/fluentbit/jemalloc.patch             | 18 ++++++++++++++
 .../{fluentbit_0.11.11.bb => fluentbit_0.12.1.bb}  |  9 ++++---
 4 files changed, 22 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_0.11.11.bb => fluentbit_0.12.1.bb} (59%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch
deleted file mode 100644
index 90242aeb6..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 84d70b6bc744cd348e66a0bc6c7958cdfa9ce670 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Jun 2017 12:56:21 -0700
-Subject: [PATCH] flb-plugin-proxy-go: Add missing dependency on jemalloc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/proxy/go/CMakeLists.txt | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/proxy/go/CMakeLists.txt b/src/proxy/go/CMakeLists.txt
-index 3273346..02a54c2 100644
---- a/src/proxy/go/CMakeLists.txt
-+++ b/src/proxy/go/CMakeLists.txt
-@@ -2,3 +2,6 @@ set(src
-   go.c)
- 
- add_library(flb-plugin-proxy-go STATIC ${src})
-+if(FLB_JEMALLOC)
-+  target_link_libraries(flb-plugin-proxy-go libjemalloc)
-+endif()
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch
deleted file mode 100644
index 35cdb18ad..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d95c2977da074be0d3913e94fb8fb5ed1c64404a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Apr 2017 10:04:03 -0700
-Subject: [PATCH 2/2] msgpack: Add comment for intended fallthrough
-
-Helps fixing build with gcc7
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h b/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h
-index a6dae6f..651e6c2 100644
---- a/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h
-+++ b/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h
-@@ -248,7 +248,7 @@ msgpack_unpack_func(int, _execute)(msgpack_unpack_struct(_context)* ctx, const c
- 
-             _fixed_trail_again:
-                 ++p;
--
-+            // fallthrough
-             default:
-                 if((size_t)(pe - p) < trail) { goto _out; }
-                 n = p;  p += trail - 1;
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
new file mode 100644
index 000000000..abaf92c05
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
@@ -0,0 +1,18 @@
+Add  --with-jemalloc-prefix=je_ so it compiles on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: fluent-bit-0.12.1/CMakeLists.txt
+===================================================================
+--- fluent-bit-0.12.1.orig/CMakeLists.txt
++++ fluent-bit-0.12.1/CMakeLists.txt
+@@ -325,7 +325,7 @@ if(FLB_JEMALLOC AND ${CMAKE_SYSTEM_NAME}
+   # Link to Jemalloc as an external dependency
+   ExternalProject_Add(jemalloc
+     SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc
+-    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc/configure ${AUTOCONF_HOST_OPT} --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
++    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc/configure --with-jemalloc-prefix=je_ ${AUTOCONF_HOST_OPT} --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
+     CFLAGS=-std=gnu99\ -Wall\ -pipe\ -g3\ -O3\ -funroll-loops
+     BUILD_COMMAND ${MAKE}
+     INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
similarity index 59%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
index 521d00bf6..10878dcd6 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
@@ -2,12 +2,11 @@ SUMMARY = "Fast data collector for Embedded Linux"
 HOMEPAGE = "http://fluentbit.io"
 BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
 
-SRC_URI = "http://fluentbit.io/releases/0.11/fluent-bit-${PV}.tar.gz \
-           file://0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch \
-           file://0002-msgpack-Add-comment-for-intended-fallthrough.patch \
+SRC_URI = "http://fluentbit.io/releases/0.12/fluent-bit-${PV}.tar.gz \
+           file://jemalloc.patch \
            "
-SRC_URI[md5sum] = "7bce8091c41fb6412b7fe0185b3cb8d6"
-SRC_URI[sha256sum] = "93b1bdd14db20f2823cd31c6f1a2f3fcb7c94ec3e0c8daefabf130310b7fc4ed"
+SRC_URI[md5sum] = "6b4472cb7e7213a01425af9121576827"
+SRC_URI[sha256sum] = "8ec05365baea723033165687611b3bba3e67a77dce72e282e9f000f7acf9e37b"
 
 S = "${WORKDIR}/fluent-bit-${PV}"
 
-- 
2.14.1


