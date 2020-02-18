Return-Path: <leo.yan@linaro.org>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1649A61580
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:26:23 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 2so10028715pfg.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 21:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=B8YHvt82GYBD14opn6aloksLOY0Sg4OsfSJiTGhaIzc=;
	b=O/Zne5yN+M0xQcorUIEJNibRuI3pUACVNJ4Zp9Vr5I4fXdyU0lwlS5zhxRiQtGzVgW
	IuUZRKm3wh3GM5LRRfz0YFcyVBNC/MJ/7lHthhdnoUXexiT3Bx4DKBkXU2DYCtXxiTeX
	bIQMVy6PmjyQY+jyycnyApFW6iPBjkIetG1j+ytdDLH8/XN+wquCZmmfgEqNCjMqySXH
	VVyVz8kGvdvhhZgYj5lx7jOOaH5UGK/NxX8wLNTTowK2Si8U59mQbQCGN+U5vjqp9Sx7
	ZldmuR456pT/hGUCToRqBTjM6brteG7MA2VE7RRzurAbgENxwyvWcr4DYwsCgIK3TsBB
	0oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=B8YHvt82GYBD14opn6aloksLOY0Sg4OsfSJiTGhaIzc=;
	b=Gio9ReNbUFG05ABqHg9Hbz5BqnCSfkHXNY1YVA4hF9J2xTvHdFiKfFWwWmJt7PEDd+
	PwR+WS3qPbRDSBKZ7fU5pNeb1Wna7z+it9s3FDoekrEAuF/TZD8Iv793XowNiMVSFt1s
	BChnEJMsB4VTB89hxIhKm7zu+sAX7AnVWQyRFcIsNvqvsAwBEcRyKQq6cV5cIZWEkfbn
	pvR5/jI2rFdM2Avjl9asehAtGqxI+gvGL+ZyBVvAf9hbCNJWboiWGlyQ9Hs+NVfZDv9q
	0Af/FSAdIawiHSuvmZdbjT93htwzCUYk3VMPD3MftCWajmtm4RQ5w2D4JzGyQ+ELn3md
	sQfA==
X-Gm-Message-State: APjAAAUs0R9zFuoTqlUvgk+YbbYJ82k8/Xj+eSvjHLADMGgxMhm58KFA
	N/CujgmSSoP8Sq7BLlCZT33kxQcP37uKmQ==
X-Google-Smtp-Source: APXvYqzMAZKDHcfRJY1HaZsOU8tKOwzJanptkJCbGijycbcdos43624BiX5Y19mf0bLoC3tNCK1AzQ==
X-Received: by 2002:a65:56c6:: with SMTP id w6mr21802687pgs.167.1582003584946; 
	Mon, 17 Feb 2020 21:26:24 -0800 (PST)
Received: from localhost.localdomain (li1441-214.members.linode.com.
	[45.118.134.214])
	by smtp.gmail.com with ESMTPSA id z4sm2214427pfn.42.2020.02.17.21.26.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 21:26:24 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: openembedded-devel@lists.openembedded.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 18 Feb 2020 13:25:44 +0800
Message-Id: <20200218052544.9467-5-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218052544.9467-1-leo.yan@linaro.org>
References: <20200218052544.9467-1-leo.yan@linaro.org>
Subject: [meta-oe][PATCH v1 4/4] bpftrace: Add build recipe
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
X-List-Received-Date: Tue, 18 Feb 2020 05:26:24 -0000

From: Sumit Garg <sumit.garg@linaro.org>

bpftrace is a high-level tracing language for eBPF, its language is
inspired by awk and C, and predecessor tracers such as DTrace and
SystemTap.  bpftrace was created by Alastair Robertson.  bpftrace
language supports the usages for one-liner and script, it's very
powerful for tracing and profiling.  bpftrace internal mechanism
depends on BCC and LLVM/Clang, so the building dependency has contains
these modules.

Add recipe for bpftrace version 0.9.4.  This patch also contains a
patch to change cmake file so can look for libraries and headers which
are installed in target sysroot-recipe path for cross compilation.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Co-developed-by: Leo Yan <leo.yan@linaro.org>
---
 ...ith-OE-llvm-clang-cross-compiled-pac.patch | 65 +++++++++++++++++++
 .../bpftrace/bpftrace_0.9.4.bb                | 34 ++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/bpftrace/bpftrace/0001-Allow-to-build-with-OE-llvm-clang-cross-compiled-pac.patch
 create mode 100644 meta-oe/recipes-devtools/bpftrace/bpftrace_0.9.4.bb

diff --git a/meta-oe/recipes-devtools/bpftrace/bpftrace/0001-Allow-to-build-with-OE-llvm-clang-cross-compiled-pac.patch b/meta-oe/recipes-devtools/bpftrace/bpftrace/0001-Allow-to-build-with-OE-llvm-clang-cross-compiled-pac.patch
new file mode 100644
index 000000000..d6cb32222
--- /dev/null
+++ b/meta-oe/recipes-devtools/bpftrace/bpftrace/0001-Allow-to-build-with-OE-llvm-clang-cross-compiled-pac.patch
@@ -0,0 +1,65 @@
+From cdfd9284c7e83b1bd18c94c0f39c020f31759178 Mon Sep 17 00:00:00 2001
+From: Sumit Garg <sumit.garg@linaro.org>
+Date: Mon, 17 Feb 2020 09:45:38 +0000
+Subject: [PATCH] Allow to build with OE llvm & clang cross compiled packages
+
+The default llvm and clang cmake packages requires all libraries, headers
+and tools to be present but in case of cross compilation, OE only
+provides target specific libraries and headers and requires native llvm
+or clang tools.
+
+So instead of looking for a complete llvm & clang packages, look for
+libraries and headers which are installed in target sysroot-recipe path.
+
+Also, fix name for clang library lookup.
+
+Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
+---
+ CMakeLists.txt         | 6 +++---
+ src/ast/CMakeLists.txt | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b766669..e4de1e3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -14,7 +14,7 @@ set(STATIC_LIBC OFF CACHE BOOL "Attempt to embed libc, only known to work with m
+ set(EMBED_LLVM OFF CACHE BOOL "Build LLVM static libs as an ExternalProject and link to these instead of system libs.")
+ set(EMBED_CLANG OFF CACHE BOOL "Build Clang static libs as an ExternalProject and link to these instead of system libs.")
+ set(EMBED_LIBCLANG_ONLY OFF CACHE BOOL "Build only libclang.a, and link to system libraries statically")
+-set(LLVM_VERSION "8" CACHE STRING "Embedded LLVM/Clang version to build and link against.")
++set(LLVM_VERSION "9" CACHE STRING "Embedded LLVM/Clang version to build and link against.")
+ set(BUILD_ASAN OFF CACHE BOOL "Build bpftrace with -fsanitize=address")
+
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
+@@ -122,7 +122,7 @@ check_include_file("sys/sdt.h" HAVE_SYSTEMTAP_SYS_SDT_H)
+
+ if (EMBED_LLVM)
+   include(embed_llvm)
+-else()
++elseif(0)
+   # Some users have multiple versions of llvm installed and would like to specify
+   # a specific llvm version.
+   if(${LLVM_REQUESTED_VERSION})
+@@ -142,7 +142,7 @@ endif()
+
+ if(EMBED_CLANG)
+   include(embed_clang)
+-else()
++elseif(0)
+   find_package(Clang REQUIRED)
+   include_directories(SYSTEM ${CLANG_INCLUDE_DIRS})
+ endif()
+diff --git a/src/ast/CMakeLists.txt b/src/ast/CMakeLists.txt
+index f280f47..f8b9dff 100644
+--- a/src/ast/CMakeLists.txt
++++ b/src/ast/CMakeLists.txt
+@@ -57,5 +57,5 @@ else()
+     llvm_expand_dependencies(llvm_libs ${_llvm_libs})
+     target_link_libraries(ast ${llvm_libs})
+   endif()
+-  target_link_libraries(ast libclang)
++  target_link_libraries(ast clang)
+ endif()
+--
+2.17.1
diff --git a/meta-oe/recipes-devtools/bpftrace/bpftrace_0.9.4.bb b/meta-oe/recipes-devtools/bpftrace/bpftrace_0.9.4.bb
new file mode 100644
index 000000000..32a8b0baf
--- /dev/null
+++ b/meta-oe/recipes-devtools/bpftrace/bpftrace_0.9.4.bb
@@ -0,0 +1,34 @@
+SUMMARY = "bpftrace"
+HOMEPAGE = "https://github.com/iovisor/bpftrace"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS += "bison-native \
+            ninja-native \
+            elfutils-native \
+            flex-native \
+            gtest-native \
+            git-native \
+            ${MLPREFIX}elfutils \
+            ${MLPREFIX}binutils \
+            ${MLPREFIX}flex \
+            clang \
+            bcc \
+            "
+
+RDEPENDS_${PN} += "bash python3"
+
+SRC_URI = "git://github.com/iovisor/bpftrace \
+           file://0001-Allow-to-build-with-OE-llvm-clang-cross-compiled-pac.patch \
+           "
+SRCREV = "85f9eea624c83443816e37654d0c1c93366a2e66"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
+
+EXTRA_OECMAKE = " \
+    -DCMAKE_BUILD_TYPE=Release \
+"
-- 
2.17.1


