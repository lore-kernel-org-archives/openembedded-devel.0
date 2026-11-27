Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10307.1795752931755217645
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=p0s339yE;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38431138772so9925677eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752931; x=1796357731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fC9pqkeYIjeie0SIUJGBBTrV/d+xmaLT3d5er4t+TOM=;
        b=p0s339yEOLus8DTJVBpTikSYz4zcPUDb4N5bvg69AzRjcyo5qz2ITj5FXQg1spGpeJ
         PkkTlM+Ux1IaPyP4bc56Rd3+0DtxR+0Dty7YqHu5KeYoZEDOYbmEfO8hQD8cppxhiYTq
         vXf9+63G7vHVCEv028cKFaOagApjC7S9IrwjIsL23U7m4lAVXITIkCdbjZS0PIpZmoo+
         xV1+BNe2/JWU/sT3qVIxoFpbc/mdoLfHFvkrqwly8ks5XVtlQywzDsGcOLTQ0VlJzUq1
         L1FnSptUu6k27A9goTrazA7Ejva7wk68HdpVkRXKd+bD/2VKmFGEfFHx9+Ee7bw9ssep
         Grcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752931; x=1796357731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fC9pqkeYIjeie0SIUJGBBTrV/d+xmaLT3d5er4t+TOM=;
        b=ev1WZzU9k8Fi7yJ/mnp431rCuRT+vR/ZU6hs66AuL42Dt7nU8n0uOUvIiN4BHrkKdl
         f/XTW63m0b5wlRLVu7La8eEwsaNdoYDSqvZFxz12YtzAhzr3TTLsYjK/64eJbaFibVuS
         krU0p07GlL9s1Wy/pRqgeYp7wYxQ/aOvA4wRvZH+kvtXGZeBi7cTJPBLlFsxBCPmp7ZD
         bUyPep1VqKoLIHQXJFLW467byaezFqaB9L1oqjQv4QAza69tVfATYx33b1PsmRYBQsIB
         zEH5Sg8p8ktFypsaXWU1nWG0beWmbN98mN/2B9q54e9nC7TQBQBHKLKiqUY+5iAukLPw
         wF3Q==
X-Gm-Message-State: APuU4Z9UQJzQhsKPzLtM20MSYrLBwTRRQitGzAxAgGygFzh77QGxBarQ
	Bdb/dj2QAd6iMcOpqA8QKIh+zU72kMRT3zI+wyweiiIcO/w04AYfn7E+WMGFMCBX
X-Gm-Gg: AZFdTZeTMubwoh/z9y1rO6OglgYPELWITYCpnaqJvtp3/gnjlVihsusMTrc+eAA6Cel
	WEs2Lt2oSzO0SWANo0deaIGjujWYovFoEWZIhSBqqAasSq/cpu0ok2NCO9KH9nAed4I+Gz9QwuP
	3t28Yv3k0dnVHTAin0sVekfkB8//AL4RBa6XQsVQPKi5hZS6JFW9QTj947rY0tXL3XG2Ej1gnIJ
	crqaPGksaSm2AAILeL5nmAJ+L8eYavlEzNDf24WYUN0VMs5Gsl5fqLyPnYn0k2wc94blpj/nG/l
	0d3I18JsvF8WKbBzQ1YbV6iisJ8Wu4LhMzj4SNs0fNJpz6arPyvSBgxhBg5Nd1h3gEITLqJYB1v
	jeWjyYPcE6widM2eBTuyHmT6uKqJb/9iaFGKJIhRxo8CmSP59tw3j0psq0eI4bQflTKHX7+LZZ+
	AADKM8+fasz3PwEscNaqL/JMAcDEiqXfpoS5+REy4i+U1uLgK3UkycmlGZUJAB/5/n8M8RPuvip
	/9SjZa978QHERK5cAQiKNKhQ/qYuH5FoWs6DIH6GZAGvfWAFfkVXyaXbkeqGxwuNaPTw1/N3GHz
	bt7cJH/e7WirkB6srWwoMNSDUAgsJ9To+Mc/gTzw8qOg1JNq0ceRdasZiopeHY7zpuVDSLrW1Ub
	FJNyS4JJOZE+qGz//J9TrXgy97Ht6a/OAfQ23BJwEQGIQzIlJISUzZY5y9SkTwOgFMTVl2AhFrO
	knCSw7Cb7YRa4JVz+7us5umigqn4wSGF2vhbfBY76DDbzQd+JEIxLylF2K2LyYqsV1/VBYusfoJ
	ZznUQaCqqioX8f4MV1pAtI/Or0IxlGhHaQAkVNK9rS4k3+xhAUG3BSyrR5e4twTM2U4KKFPikgA
	PGG08xo/k5RRU0oRt8Ufn98eVg==
X-Received: by 2002:a05:7300:1c95:b0:385:8851:fa4a with SMTP id 5a478bee46e88-385885211c2mr23306459eec.6.1795752930606;
        Thu, 26 Nov 2026 20:15:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm60340062eec.8.2026.11.26.20.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 7/8] minifi-cpp: upgrade 0.99.2 -> 1.1.0
Date: Thu, 26 Nov 2026 20:15:16 -0800
Message-ID: <20261127041517.1773986-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
References: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133217
Content-Type: text/plain; charset="utf-8"

1.1.0 adds a stable C extension API (with optional Rust extensions) and
LMDB repositories, removes the SYSTEM dependency source, the bundled
mbedTLS, libuvc and expected-lite and the OpenCV extension, and always
builds expression language.

Rewrite 0001-Do-not-use-bundled-packages.patch to add a SYSTEM source
to the cmake/Get*.cmake files used here, use upstream's
BUILD_ROCKSDB=OFF path, and bump the FetchContent dependencies to the
versions pinned in cmake/ with FETCHCONTENT_FULLY_DISCONNECTED set so
nothing is downloaded at configure time. lz4 and zstd have no SYSTEM
source any more and are dropped from DEPENDS. Patches fixed upstream are
dropped and the rest refreshed. The new asset and Python venv
directories move to /var/lib/minifi.

License-Update: notices for the removed mbedTLS, libuvc, OpenCV (and its bundled libraries), cJSON and expected-lite bundles dropped from LICENSE

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-Add-missing-include-for-malloc-free.patch |  38 --
 .../0001-Do-not-use-bundled-packages.patch    | 330 ++++++------------
 .../files/0001-Fix-build-with-gcc-16.patch    |  49 ---
 ...sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch |  17 +-
 .../files/0002-Fix-osspuuid-build.patch       |  22 +-
 .../files/0003-Fix-libsodium-build.patch      |  13 +-
 .../files/0004-Pass-noline-flag-to-flex.patch |  21 +-
 ...erateVersion.sh-set-correct-buildrev.patch |  13 +-
 ...006-CMakeLists.txt-do-not-use-ccache.patch |  31 +-
 ...h-add-missing-cstdint-include-for-in.patch |  35 --
 ...nifi-cpp_0.99.2.bb => minifi-cpp_1.1.0.bb} | 112 +++---
 11 files changed, 228 insertions(+), 453 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-include-for-malloc-free.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch
 rename meta-oe/recipes-extended/minifi-cpp/{minifi-cpp_0.99.2.bb => minifi-cpp_1.1.0.bb} (77%)

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-include-for-malloc-free.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-include-for-malloc-free.patch
deleted file mode 100644
index e844bf9b7d..0000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-include-for-malloc-free.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From f01a1ae37d3e502a900b5a6cfa5be217003cf7d4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Aug 2025 21:46:26 -0700
-Subject: [PATCH] Add missing include for malloc/free
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/fmt/format.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/include/fmt/format.h b/include/fmt/format.h
-index 287e7163..0412812f 100644
---- a/include/fmt/format.h
-+++ b/include/fmt/format.h
-@@ -44,6 +44,7 @@
- #  include <cmath>    // std::signbit
- #  include <cstddef>  // std::byte
- #  include <cstdint>  // uint32_t
-+#  include <cstdlib>  // std::malloc, std::free
- #  include <cstring>  // std::memcpy
- #  include <limits>   // std::numeric_limits
- #  include <new>      // std::bad_alloc
-@@ -744,12 +745,12 @@ template <typename T> struct allocator {
- 
-   T* allocate(size_t n) {
-     FMT_ASSERT(n <= max_value<size_t>() / sizeof(T), "");
--    T* p = static_cast<T*>(malloc(n * sizeof(T)));
-+    T* p = static_cast<T*>(std::malloc(n * sizeof(T)));
-     if (!p) FMT_THROW(std::bad_alloc());
-     return p;
-   }
- 
--  void deallocate(T* p, size_t) { free(p); }
-+  void deallocate(T* p, size_t) { std::free(p); }
- };
- 
- }  // namespace detail
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
index 98044877cd..e2f9c5b02a 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
@@ -1,10 +1,11 @@
-From ff886f41c471a4b7d97a5a4473727a8b1d8ba2bb Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
-Date: Tue, 19 Mar 2024 19:39:04 +0800
+Date: Mon, 23 Nov 2026 08:02:00 -0800
 Subject: [PATCH] Do not use bundled packages
 
-Use external dependencies for openssl, curl, bzip2, zlib, libarchive,
-xz, yaml-cpp and libxml2.
+Add a SYSTEM source option that uses find_package() for openssl, curl,
+zlib, bzip2, xz, libarchive, yaml-cpp, pugixml and civetweb instead of
+building them from downloaded sources.
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -13,232 +14,131 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 adapted the patch for context changes;
 added using external dependencies for pugixml.]
 Signed-off-by: Li Zhou <li.zhou@windriver.com>
+[kr: Rewritten for 1.1.0, which selects bundled or system dependencies
+through MINIFI_*_SOURCE options.]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+[kr: Rewritten for 1.1.0, which dropped the SYSTEM source option and
+moved libarchive, xz and yaml-cpp handling to cmake/Get*.cmake.]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- CMakeLists.txt                       |  3 +--
- cmake/GetBZip2.cmake                 |  3 +++
- cmake/GetCatch2.cmake                |  4 ++++
- cmake/GetCivetWeb.cmake              |  3 +++
- cmake/GetFmt.cmake                   |  3 +++
- cmake/GetLibCURL.cmake               |  3 +++
- cmake/GetLibXml2.cmake               |  3 +++
- cmake/GetOpenSSL.cmake               |  3 +++
- cmake/GetRocksDB.cmake               |  4 ++++
- cmake/GetSpdlog.cmake                |  4 ++++
- cmake/GetZLIB.cmake                  |  3 +++
- cmake/GetZstd.cmake                  |  4 ++++
- cmake/PugiXml.cmake                  | 20 ++++++++++++--------
- extensions/libarchive/CMakeLists.txt |  6 ++----
- 14 files changed, 52 insertions(+), 14 deletions(-)
+ cmake/GetBZip2.cmake      | 3 +++
+ cmake/GetCivetWeb.cmake   | 3 +++
+ cmake/GetLibArchive.cmake | 3 +++
+ cmake/GetLibCURL.cmake    | 3 +++
+ cmake/GetLibLZMA.cmake    | 3 +++
+ cmake/GetOpenSSL.cmake    | 3 +++
+ cmake/GetPugiXml.cmake    | 3 +++
+ cmake/GetYamlCpp.cmake    | 3 +++
+ cmake/GetZLIB.cmake       | 3 +++
+ 9 files changed, 27 insertions(+)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5cf1c4e5f..36aee1508 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -285,8 +285,7 @@ include(GetSpdlog)
- get_spdlog()
- 
- # yaml-cpp
--include(BundledYamlCpp)
--use_bundled_yamlcpp(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
-+find_package(yaml-cpp REQUIRED)
- 
- # concurrentqueue
- add_library(concurrentqueue INTERFACE)
 diff --git a/cmake/GetBZip2.cmake b/cmake/GetBZip2.cmake
-index 2a7d47e9e..754122895 100644
+index 7da1424d..40ce02c9 100644
 --- a/cmake/GetBZip2.cmake
 +++ b/cmake/GetBZip2.cmake
-@@ -23,5 +23,8 @@ function(get_bzip2 SOURCE_DIR BINARY_DIR)
-         message("Using CMake to build bzip2 from source")
-         include(BundledBZip2)
-         use_bundled_bzip2(${SOURCE_DIR} ${BINARY_DIR})
-+    elseif(MINIFI_BZIP2_SOURCE STREQUAL "SYSTEM")
-+        message("Using bzip2 provided by system")
-+        find_package(BZip2 REQUIRED)
-     endif()
- endfunction(get_bzip2)
-diff --git a/cmake/GetCatch2.cmake b/cmake/GetCatch2.cmake
-index d6c1d6acc..ec11b0a77 100644
---- a/cmake/GetCatch2.cmake
-+++ b/cmake/GetCatch2.cmake
-@@ -23,5 +23,9 @@ function(get_catch2)
-     elseif(MINIFI_CATCH2_SOURCE STREQUAL "BUILD")
-         message("Using CMake to build Catch2 from source")
-         include(Catch2)
-+    elseif(MINIFI_CATCH2_SOURCE STREQUAL "SYSTEM")
-+        message("Using Catch2 provided by system")
-+        find_package(Catch2 REQUIRED)
-+        add_library(Catch2WithMain ALIAS Catch2::Catch2WithMain)
-     endif()
- endfunction(get_catch2)
+@@ -22,4 +22,7 @@ elseif(MINIFI_BZIP2_SOURCE STREQUAL "BUILD")
+     message("Using CMake to build bzip2 from source")
+     include(BundledBZip2)
+     use_bundled_bzip2(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
++elseif(MINIFI_BZIP2_SOURCE STREQUAL "SYSTEM")
++    message("Using bzip2 provided by system")
++    find_package(BZip2 REQUIRED)
+ endif()
 diff --git a/cmake/GetCivetWeb.cmake b/cmake/GetCivetWeb.cmake
-index f30d22289..8fc39a0e2 100644
+index 6604e22c..77428b51 100644
 --- a/cmake/GetCivetWeb.cmake
 +++ b/cmake/GetCivetWeb.cmake
-@@ -22,5 +22,8 @@ function(get_civetweb)
-     elseif(MINIFI_CIVETWEB_SOURCE STREQUAL "BUILD")
-         message("Using CMake to build CivetWeb from source")
-         include(CivetWeb)
-+    elseif(MINIFI_CIVETWEB_SOURCE STREQUAL "SYSTEM")
-+        message("Using CivetWeb provided by system")
-+        find_package(civetweb REQUIRED)
-     endif()
- endfunction(get_civetweb)
-diff --git a/cmake/GetFmt.cmake b/cmake/GetFmt.cmake
-index f4f28458d..579a63897 100644
---- a/cmake/GetFmt.cmake
-+++ b/cmake/GetFmt.cmake
-@@ -22,5 +22,8 @@ function(get_fmt)
-     elseif(MINIFI_FMT_SOURCE STREQUAL "BUILD")
-         message("Using CMake to build Fmt from source")
-         include(fmt)
-+    elseif(MINIFI_FMT_SOURCE STREQUAL "SYSTEM")
-+        message("Using Fmt provided by system")
-+        find_package(fmt REQUIRED)
-     endif()
- endfunction(get_fmt)
+@@ -21,4 +21,7 @@ if(MINIFI_CIVETWEB_SOURCE STREQUAL "CONAN")
+ elseif(MINIFI_CIVETWEB_SOURCE STREQUAL "BUILD")
+     message("Using CMake to build CivetWeb from source")
+     include(CivetWeb)
++elseif(MINIFI_CIVETWEB_SOURCE STREQUAL "SYSTEM")
++    message("Using CivetWeb provided by system")
++    find_package(civetweb REQUIRED)
+ endif()
+diff --git a/cmake/GetLibArchive.cmake b/cmake/GetLibArchive.cmake
+index 0aa925fa..f8f53a20 100644
+--- a/cmake/GetLibArchive.cmake
++++ b/cmake/GetLibArchive.cmake
+@@ -22,4 +22,7 @@ elseif(MINIFI_LIBARCHIVE_SOURCE STREQUAL "BUILD")
+     message("Using CMake to build LibArchive from source")
+     include(BundledLibArchive)
+     use_bundled_libarchive(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
++elseif(MINIFI_LIBARCHIVE_SOURCE STREQUAL "SYSTEM")
++    message("Using LibArchive provided by system")
++    find_package(LibArchive REQUIRED)
+ endif()
 diff --git a/cmake/GetLibCURL.cmake b/cmake/GetLibCURL.cmake
-index afd38f3c9..0eac59ec4 100644
+index a0654a10..5f800210 100644
 --- a/cmake/GetLibCURL.cmake
 +++ b/cmake/GetLibCURL.cmake
-@@ -23,5 +23,8 @@ function(get_curl SOURCE_DIR BINARY_DIR)
-         message("Using CMake to build libcurl from source")
-         include(BundledLibcURL)
-         use_bundled_curl(${SOURCE_DIR} ${BINARY_DIR})
-+    elseif(MINIFI_LIBCURL_SOURCE STREQUAL "SYSTEM")
-+        message("Using libcurl provided by system")
-+        find_package(CURL REQUIRED)
-     endif()
- endfunction(get_curl SOURCE_DIR BINARY_DIR)
-diff --git a/cmake/GetLibXml2.cmake b/cmake/GetLibXml2.cmake
-index 2a6c618f6..093b57a4b 100644
---- a/cmake/GetLibXml2.cmake
-+++ b/cmake/GetLibXml2.cmake
-@@ -22,5 +22,8 @@ function(get_libxml2 SOURCE_DIR BINARY_DIR)
-     elseif(MINIFI_LIBXML2_SOURCE STREQUAL "BUILD")
-         message("Using CMake to build libxml2 from source")
-         include(LibXml2)
-+    elseif(MINIFI_LIBXML2_SOURCE STREQUAL "SYSTEM")
-+        message("Using libxml2 provided by system")
-+        find_package(libxml2 REQUIRED)
-     endif()
- endfunction(get_libxml2)
+@@ -21,4 +21,7 @@ if(MINIFI_LIBCURL_SOURCE STREQUAL "CONAN")
+ elseif(MINIFI_LIBCURL_SOURCE STREQUAL "BUILD")
+     message("Using CMake to build libcurl from source")
+     include(FetchLibcURL)
++elseif(MINIFI_LIBCURL_SOURCE STREQUAL "SYSTEM")
++    message("Using libcurl provided by system")
++    find_package(CURL REQUIRED)
+ endif()
+diff --git a/cmake/GetLibLZMA.cmake b/cmake/GetLibLZMA.cmake
+index d7f25867..22c14db0 100644
+--- a/cmake/GetLibLZMA.cmake
++++ b/cmake/GetLibLZMA.cmake
+@@ -21,4 +21,7 @@ if(MINIFI_LIBLZMA_SOURCE STREQUAL "CONAN")
+ elseif(MINIFI_LIBLZMA_SOURCE STREQUAL "BUILD")
+     message("Using CMake to build LibLZMA from source")
+     include(LibLZMA)
++elseif(MINIFI_LIBLZMA_SOURCE STREQUAL "SYSTEM")
++    message("Using LibLZMA provided by system")
++    find_package(LibLZMA REQUIRED)
+ endif()
 diff --git a/cmake/GetOpenSSL.cmake b/cmake/GetOpenSSL.cmake
-index 58132c6bf..2b142f94e 100644
+index 025ce48d..b565f6a4 100644
 --- a/cmake/GetOpenSSL.cmake
 +++ b/cmake/GetOpenSSL.cmake
-@@ -23,5 +23,8 @@ function(get_openssl SOURCE_DIR BINARY_DIR)
-         message("Using CMake to build OpenSSL from source")
-         include(BundledOpenSSL)
-         use_openssl(${SOURCE_DIR} ${BINARY_DIR})
-+    elseif(MINIFI_OPENSSL_SOURCE STREQUAL "SYSTEM")
-+        message("Using OpenSSL provided by system")
-+        find_package(OpenSSL REQUIRED)
-     endif()
- endfunction(get_openssl)
-diff --git a/cmake/GetRocksDB.cmake b/cmake/GetRocksDB.cmake
-index 0968afc38..3ca1fe565 100644
---- a/cmake/GetRocksDB.cmake
-+++ b/cmake/GetRocksDB.cmake
-@@ -30,5 +30,9 @@ function(get_rocksdb SOURCE_DIR BINARY_DIR)
-             list(APPEND CMAKE_MODULE_PATH "${SOURCE_DIR}/cmake/rocksdb/sys")
-             find_package(RocksDB REQUIRED)
-         endif()
-+    elseif(MINIFI_ROCKSDB_SOURCE STREQUAL "SYSTEM")
-+        message("Using RocksDB provided by system")
-+        list(APPEND CMAKE_MODULE_PATH "${SOURCE_DIR}/cmake/rocksdb/sys")
-+        find_package(RocksDB REQUIRED)
-     endif()
- endfunction(get_rocksdb SOURCE_DIR BINARY_DIR)
-diff --git a/cmake/GetSpdlog.cmake b/cmake/GetSpdlog.cmake
-index 9fe3b9c46..60f5c01d7 100644
---- a/cmake/GetSpdlog.cmake
-+++ b/cmake/GetSpdlog.cmake
-@@ -32,5 +32,9 @@ function(get_spdlog)
-     elseif(MINIFI_SPDLOG_SOURCE STREQUAL "BUILD")
-         message("Using CMake to build spdlog from source")
-         include(Spdlog)
-+    elseif(MINIFI_SPDLOG_SOURCE STREQUAL "SYSTEM")
-+        message("Using spdlog provided by system")
-+        find_package(spdlog REQUIRED)
-+        add_library(spdlog ALIAS spdlog::spdlog)
-     endif()
- endfunction(get_spdlog)
+@@ -79,4 +79,7 @@ elseif(MINIFI_OPENSSL_SOURCE STREQUAL "BUILD")
+     include(BundledOpenSSL)
+     use_openssl(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
+     list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/ssl")
++elseif(MINIFI_OPENSSL_SOURCE STREQUAL "SYSTEM")
++    message("Using OpenSSL provided by system")
++    find_package(OpenSSL REQUIRED)
+ endif()
+diff --git a/cmake/GetPugiXml.cmake b/cmake/GetPugiXml.cmake
+index 1e784009..d31ef613 100644
+--- a/cmake/GetPugiXml.cmake
++++ b/cmake/GetPugiXml.cmake
+@@ -21,4 +21,7 @@ if(MINIFI_PUGIXML_SOURCE STREQUAL "CONAN")
+ elseif(MINIFI_PUGIXML_SOURCE STREQUAL "BUILD")
+     message("Using CMake to build PugiXML from source")
+     include(PugiXml)
++elseif(MINIFI_PUGIXML_SOURCE STREQUAL "SYSTEM")
++    message("Using PugiXML provided by system")
++    find_package(pugixml REQUIRED)
+ endif()
+diff --git a/cmake/GetYamlCpp.cmake b/cmake/GetYamlCpp.cmake
+index bfae7ad0..4d4f77b9 100644
+--- a/cmake/GetYamlCpp.cmake
++++ b/cmake/GetYamlCpp.cmake
+@@ -21,4 +21,7 @@ if(MINIFI_YAMLCPP_SOURCE STREQUAL "CONAN")
+ elseif(MINIFI_YAMLCPP_SOURCE STREQUAL "BUILD")
+     message("Using CMake to build yaml-cpp from source")
+     include(YamlCpp)
++elseif(MINIFI_YAMLCPP_SOURCE STREQUAL "SYSTEM")
++    message("Using yaml-cpp provided by system")
++    find_package(yaml-cpp REQUIRED)
+ endif()
 diff --git a/cmake/GetZLIB.cmake b/cmake/GetZLIB.cmake
-index 6e7bea1e3..c15e2246a 100644
+index f8793c9c..1e0af57e 100644
 --- a/cmake/GetZLIB.cmake
 +++ b/cmake/GetZLIB.cmake
-@@ -23,5 +23,8 @@ function(get_zlib SOURCE_DIR BINARY_DIR)
-         message("Using CMake to build zlib from source")
-         include(BundledZLIB)
-         use_bundled_zlib(${SOURCE_DIR} ${BINARY_DIR})
-+    elseif(MINIFI_ZLIB_SOURCE STREQUAL "SYSTEM")
-+        message("Using zlib provided by system")
-+        find_package(ZLIB REQUIRED)
-     endif()
- endfunction(get_zlib)
-diff --git a/cmake/GetZstd.cmake b/cmake/GetZstd.cmake
-index a0334b02d..0e7600c22 100644
---- a/cmake/GetZstd.cmake
-+++ b/cmake/GetZstd.cmake
-@@ -23,5 +23,9 @@ function(get_zstd)
-     elseif(MINIFI_ZSTD_SOURCE STREQUAL "BUILD")
-         message("Using CMake to build zstd from source")
-         include(Zstd)
-+    elseif(MINIFI_ZSTD_SOURCE STREQUAL "SYSTEM")
-+        message("Using zstd provided by system")
-+        find_package(zstd REQUIRED)
-+        add_library(zstd::zstd ALIAS zstd::libzstd_static)
-     endif()
- endfunction(get_zstd)
-diff --git a/cmake/PugiXml.cmake b/cmake/PugiXml.cmake
-index ba5a4df38..7a1a72b9b 100644
---- a/cmake/PugiXml.cmake
-+++ b/cmake/PugiXml.cmake
-@@ -15,12 +15,16 @@
- # specific language governing permissions and limitations
- # under the License.
- include(FetchContent)
-+if(MINIFI_PUGIXML_SOURCE STREQUAL "SYSTEM")
-+    message("Using pugixml provided by system")
-+    find_package(PUGIXML REQUIRED)
-+else()
-+    set(PUGIXML_BUILD_TESTS OFF CACHE BOOL "" FORCE)
- 
--set(PUGIXML_BUILD_TESTS OFF CACHE BOOL "" FORCE)
--
--FetchContent_Declare(
--    pugixml
--    URL      https://github.com/zeux/pugixml/archive/refs/tags/v1.15.tar.gz
--    URL_HASH SHA256=b39647064d9e28297a34278bfb897092bf33b7c487906ddfc094c9e8868bddcb
--)
--FetchContent_MakeAvailable(pugixml)
-+    FetchContent_Declare(
-+        pugixml
-+        URL      https://github.com/zeux/pugixml/archive/refs/tags/v1.15.tar.gz
-+        URL_HASH SHA256=b39647064d9e28297a34278bfb897092bf33b7c487906ddfc094c9e8868bddcb
-+    )
-+    FetchContent_MakeAvailable(pugixml)
-+endif()
-diff --git a/extensions/libarchive/CMakeLists.txt b/extensions/libarchive/CMakeLists.txt
-index 14b75dcc2..ad2b13c25 100644
---- a/extensions/libarchive/CMakeLists.txt
-+++ b/extensions/libarchive/CMakeLists.txt
-@@ -22,12 +22,10 @@ if (NOT ENABLE_LIBARCHIVE)
+@@ -21,4 +21,7 @@ if(MINIFI_ZLIB_SOURCE STREQUAL "CONAN")
+ elseif(MINIFI_ZLIB_SOURCE STREQUAL "BUILD")
+     message("Using CMake to build zlib from source")
+     include(ZLIB)
++elseif(MINIFI_ZLIB_SOURCE STREQUAL "SYSTEM")
++    message("Using zlib provided by system")
++    find_package(ZLIB REQUIRED)
  endif()
- 
- if (ENABLE_LZMA)
--    include(LibLZMA)
--    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/liblzma/dummy")
-+    find_package(LibLZMA REQUIRED)
- endif()
- 
--include(BundledLibArchive)
--use_bundled_libarchive(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
-+find_package(LibArchive REQUIRED)
- 
- include(${CMAKE_SOURCE_DIR}/extensions/ExtensionHeader.txt)
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch
deleted file mode 100644
index ca1b67783d..0000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 950aea28ffefd88f230d6bd25fa0352e9ca157c9 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 3 Jun 2026 02:12:01 -0700
-Subject: [PATCH] Fix build with gcc 16
-
-Fixes:
-  extensions/systemd/libwrapper/LibWrapper.h:38:31: error: 'uint64_t' has not been declared
-   38 |   virtual int getRealtimeUsec(uint64_t* usec_out) noexcept = 0;
-      |                               ^~~~~~~~
-
-  minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h:29:5: error: 'uint64_t' does not name a type
-  |    29 |     uint64_t table_readers_size{};
-  |       |     ^~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/apache/nifi-minifi-cpp/pull/2194]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- extensions/systemd/libwrapper/LibWrapper.h       | 1 +
- minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/extensions/systemd/libwrapper/LibWrapper.h b/extensions/systemd/libwrapper/LibWrapper.h
-index d7e7b7c..c8af00e 100644
---- a/extensions/systemd/libwrapper/LibWrapper.h
-+++ b/extensions/systemd/libwrapper/LibWrapper.h
-@@ -19,6 +19,7 @@
- #pragma once
- 
- #include <memory>
-+#include <cstdint>
- 
- #include "../Common.h"
- #include "utils/gsl.h"
-diff --git a/minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h b/minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h
-index 6c933b7..f39fccf 100644
---- a/minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h
-+++ b/minifi-api/include/minifi-cpp/core/RepositoryMetricsSource.h
-@@ -20,6 +20,7 @@
- 
- #include <string>
- #include <optional>
-+#include <cstdint>
- 
- namespace org::apache::nifi::minifi::core {
- 
--- 
-2.49.0
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch
index a61873e21a..2290f38159 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch
@@ -1,6 +1,6 @@
-From ee9722731b3f9cfc3d8e338ab09bc0ad409a6941 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 18 Sep 2025 14:43:11 +0000
+Date: Mon, 23 Nov 2026 08:02:54 -0800
 Subject: [PATCH] generateVersion.sh: set BUILD_DATE to SOURCE_DATE_EPOCH
 
 Use SOURCE_DATE_EPOCH to set BUILD_DATE to improve reproducibility.
@@ -13,12 +13,12 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/generateVersion.sh b/generateVersion.sh
-index 0b50a16..96cc3ae 100755
+index 5c614240..0af066fa 100755
 --- a/generateVersion.sh
 +++ b/generateVersion.sh
-@@ -25,7 +25,11 @@ flags=$6
- extensions=$7
- buildident=$8
+@@ -24,7 +24,11 @@ compiler_version=$5
+ flags=$6
+ buildident=$7
  
 -date=$(date +%s)
 +if [ -n "${SOURCE_DATE_EPOCH}" ]; then
@@ -28,7 +28,4 @@ index 0b50a16..96cc3ae 100755
 +fi
  
  if [ -d "${src_dir}"/.git ]; then
-   buildrev=$(git -C "${src_dir}" log -1 --pretty=format:"%H")
--- 
-2.48.1
-
+   buildrev=$(git log -1 --pretty=format:"%H")
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch
index 537beb85d3..ba581dab70 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch
@@ -1,6 +1,6 @@
-From 429b2b357e5142e2b845da95bdd38e8fc1229831 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
-Date: Tue, 19 Mar 2024 20:48:25 +0800
+Date: Mon, 23 Nov 2026 08:02:53 -0800
 Subject: [PATCH] Fix osspuuid build
 
 * Specify correct configure options to fix osspuuid cross build.
@@ -9,6 +9,9 @@ Subject: [PATCH] Fix osspuuid build
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+[kr: Refreshed for minifi-cpp 1.1.0, which moved the ossp-uuid patches
+to thirdparty/ossp-uuid/all/patches.]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
  cmake/BundledOSSPUUID.cmake                         | 10 +++++-----
  .../ossp-uuid/ossp-uuid-cross-compile-fix.patch     | 13 +++++++++++++
@@ -16,13 +19,13 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  create mode 100644 thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
 
 diff --git a/cmake/BundledOSSPUUID.cmake b/cmake/BundledOSSPUUID.cmake
-index 747e52c27..fb6e2164d 100644
+index 218d4075..0a853974 100644
 --- a/cmake/BundledOSSPUUID.cmake
 +++ b/cmake/BundledOSSPUUID.cmake
 @@ -23,10 +23,12 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
-     set(PATCH_FILE1 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-fix.patch")
-     set(PATCH_FILE2 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-no-prog.patch")
-     set(PATCH_FILE3 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-update-config-guess.patch")
+     set(PATCH_FILE1 "${SOURCE_DIR}/thirdparty/ossp-uuid/all/patches/ossp-uuid-mac-fix.patch")
+     set(PATCH_FILE2 "${SOURCE_DIR}/thirdparty/ossp-uuid/all/patches/ossp-uuid-no-prog.patch")
+     set(PATCH_FILE3 "${SOURCE_DIR}/thirdparty/ossp-uuid/all/patches/ossp-uuid-update-config-guess.patch")
 +    set(PATCH_FILE4 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch")
      set(PC ${Bash_EXECUTABLE} -c "set -x &&\
              (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATCH_FILE1}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE1}\") &&\
@@ -38,7 +41,7 @@ index 747e52c27..fb6e2164d 100644
          string(APPEND ADDITIONAL_COMPILER_FLAGS "-isysroot ${CMAKE_OSX_SYSROOT} ")
      endif()
 -    set(CONFIGURE_COMMAND ./configure "CC=${CMAKE_C_COMPILER}" "CXX=${CMAKE_CXX_COMPILER}" "CFLAGS=${PASSTHROUGH_CMAKE_C_FLAGS} ${ADDITIONAL_COMPILER_FLAGS}" "CXXFLAGS=${PASSTHROUGH_CMAKE_CXX_FLAGS} ${ADDITIONAL_COMPILER_FLAGS}" --enable-shared=no --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
-+    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure --host=${HOST_SYS} --build=${BUILD_SYS} "CC=${CMAKE_C_COMPILER}" "CXX=${CMAKE_CXX_COMPILER}" "CFLAGS=${PASSTHROUGH_CMAKE_C_FLAGS} -fPIC" "CXXFLAGS=${PASSTHROUGH_CMAKE_CXX_FLAGS} -fPIC" --enable-shared=no --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
++    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure --host=${HOST_SYS} --build=${BUILD_SYS} "CC=${CMAKE_C_COMPILER}" "CXX=${CMAKE_CXX_COMPILER}" "CFLAGS=${PASSTHROUGH_CMAKE_C_FLAGS} ${ADDITIONAL_COMPILER_FLAGS}" "CXXFLAGS=${PASSTHROUGH_CMAKE_CXX_FLAGS} ${ADDITIONAL_COMPILER_FLAGS}" --enable-shared=no --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
  
      string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
      if(build_type MATCHES debug)
@@ -56,7 +59,7 @@ index 747e52c27..fb6e2164d 100644
              UPDATE_COMMAND ""
 diff --git a/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch b/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
 new file mode 100644
-index 000000000..b8d7b0bba
+index 00000000..b8d7b0bb
 --- /dev/null
 +++ b/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
 @@ -0,0 +1,13 @@
@@ -73,6 +76,3 @@ index 000000000..b8d7b0bba
 +         fi
 +         if [ ".$opt_o" != . ]; then
 +             if [ ".$opt_t" = .yes ]; then
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
index 9ce5600327..fe32cbdc4a 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
@@ -1,6 +1,6 @@
-From d48ababf341708885ecf687ebc46bb1d84ca868d Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
-Date: Tue, 19 Mar 2024 20:56:05 +0800
+Date: Mon, 23 Nov 2026 08:02:54 -0800
 Subject: [PATCH] Fix libsodium build
 
 * Specify correct configure options to fix libsodium cross build.
@@ -14,12 +14,14 @@ from 0.99.1 to 0.99.2; adapted the patch when upgrading libsodium
 from 1.0.19 to 1.0.20 because the top-level directory name inside the
 tarball changed from libsodium-stable to libsodium-1.0.20.]
 Signed-off-by: Li Zhou <li.zhou@windriver.com>
+[kr: Adapted for libsodium 1.0.22 used by minifi-cpp 1.1.0.]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
  cmake/BundledLibSodium.cmake | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/cmake/BundledLibSodium.cmake b/cmake/BundledLibSodium.cmake
-index 001a90dad..87a3244fd 100644
+index 4232ed3e..f2045723 100644
 --- a/cmake/BundledLibSodium.cmake
 +++ b/cmake/BundledLibSodium.cmake
 @@ -60,14 +60,12 @@ function(use_bundled_libsodium SOURCE_DIR BINARY_DIR)
@@ -35,10 +37,7 @@ index 001a90dad..87a3244fd 100644
 -                URL_HASH ${LIBSODIUM_URL_HASH}
                  BUILD_IN_SOURCE true
 -                SOURCE_DIR "${BINARY_DIR}/thirdparty/libsodium-src"
-+                SOURCE_DIR "${SOURCE_DIR}/thirdparty/libsodium-1.0.20"
++                SOURCE_DIR "${SOURCE_DIR}/thirdparty/libsodium-1.0.22"
                  BUILD_COMMAND make
                  CMAKE_COMMAND ""
                  UPDATE_COMMAND ""
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0004-Pass-noline-flag-to-flex.patch b/meta-oe/recipes-extended/minifi-cpp/files/0004-Pass-noline-flag-to-flex.patch
index 344e8839e7..eb28122770 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0004-Pass-noline-flag-to-flex.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0004-Pass-noline-flag-to-flex.patch
@@ -1,6 +1,6 @@
-From 229137659501ae51774dcb3249f94545bdd6e21f Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
-Date: Tue, 19 Mar 2024 21:00:59 +0800
+Date: Mon, 23 Nov 2026 08:03:07 -0800
 Subject: [PATCH] Pass --noline flag to flex
 
 This ensures that line directive is not emitted into lexer output which
@@ -10,22 +10,19 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- extensions/expression-language/CMakeLists.txt | 2 +-
+ cmake/ExpressionLanguage.cmake | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/extensions/expression-language/CMakeLists.txt b/extensions/expression-language/CMakeLists.txt
-index c179ab3ef..7f507b03a 100644
---- a/extensions/expression-language/CMakeLists.txt
-+++ b/extensions/expression-language/CMakeLists.txt
-@@ -103,7 +103,7 @@ flex_target(
+diff --git a/cmake/ExpressionLanguage.cmake b/cmake/ExpressionLanguage.cmake
+index 4ce4e8f6..5a9f7a5e 100644
+--- a/cmake/ExpressionLanguage.cmake
++++ b/cmake/ExpressionLanguage.cmake
+@@ -58,7 +58,7 @@ flex_target(
      el-scanner
-     ${CMAKE_CURRENT_SOURCE_DIR}/Scanner.ll
+     ${CMAKE_SOURCE_DIR}/libminifi/include/expression-language/Scanner.ll
      ${CMAKE_BINARY_DIR}/el-generated/Scanner.cpp
 -    COMPILE_FLAGS --c++
 +    COMPILE_FLAGS "--c++ --noline"
  )
  
  set(EL_GENERATED_INCLUDE_DIR ${CMAKE_BINARY_DIR}/el-generated)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0005-generateVersion.sh-set-correct-buildrev.patch b/meta-oe/recipes-extended/minifi-cpp/files/0005-generateVersion.sh-set-correct-buildrev.patch
index 2e78b1087e..d7477a0545 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0005-generateVersion.sh-set-correct-buildrev.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0005-generateVersion.sh-set-correct-buildrev.patch
@@ -1,6 +1,6 @@
-From 1861170c6de3dd851324debf3a6eaeff4d8d8bce Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 14 Mar 2025 20:26:38 +0800
+Date: Mon, 23 Nov 2026 08:02:55 -0800
 Subject: [PATCH] generateVersion.sh: set correct buildrev
 
 Since this script is run outside the source directory, git log can not
@@ -15,11 +15,11 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generateVersion.sh b/generateVersion.sh
-index ff25afba8..0b50a1693 100755
+index 0af066fa..7ca743e1 100755
 --- a/generateVersion.sh
 +++ b/generateVersion.sh
-@@ -28,7 +28,7 @@ buildident=$8
- date=$(date +%s)
+@@ -31,7 +31,7 @@ else
+ fi
  
  if [ -d "${src_dir}"/.git ]; then
 -  buildrev=$(git log -1 --pretty=format:"%H")
@@ -27,6 +27,3 @@ index ff25afba8..0b50a1693 100755
  else
    buildrev="Unknown"
  fi
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0006-CMakeLists.txt-do-not-use-ccache.patch b/meta-oe/recipes-extended/minifi-cpp/files/0006-CMakeLists.txt-do-not-use-ccache.patch
index 055a3e7b57..62d0a75f87 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0006-CMakeLists.txt-do-not-use-ccache.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0006-CMakeLists.txt-do-not-use-ccache.patch
@@ -1,38 +1,43 @@
-From bbe5c95ef1755c4804c4561c03cafedeb004cb36 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 21 Mar 2024 10:18:39 +0800
+Date: Mon, 23 Nov 2026 08:03:07 -0800
 Subject: [PATCH] CMakeLists.txt: do not use ccache
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- CMakeLists.txt | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
+ CMakeLists.txt | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fc1718dfd..70c94c2ff 100644
+index f9c6474c..6932d1dd 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -84,12 +84,12 @@ if (MINIFI_USE_REAL_ODBC_TEST_DRIVER)
+@@ -85,16 +85,16 @@ if (MINIFI_USE_REAL_ODBC_TEST_DRIVER)
  endif()
  
  # Use ccache if present
 -find_program(CCACHE_FOUND ccache)
 -if(CCACHE_FOUND)
--    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
--    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
+-    if(NOT CMAKE_C_COMPILER_LAUNCHER)
+-        set(CMAKE_C_COMPILER_LAUNCHER "${CCACHE_FOUND}")
+-    endif()
+-    if(NOT CMAKE_CXX_COMPILER_LAUNCHER)
+-        set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_FOUND}")
+-    endif()
 -    message("-- Found ccache: ${CCACHE_FOUND}")
 -endif(CCACHE_FOUND)
 +#find_program(CCACHE_FOUND ccache)
 +#if(CCACHE_FOUND)
-+#    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
-+#    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
++#    if(NOT CMAKE_C_COMPILER_LAUNCHER)
++#        set(CMAKE_C_COMPILER_LAUNCHER "${CCACHE_FOUND}")
++#    endif()
++#    if(NOT CMAKE_CXX_COMPILER_LAUNCHER)
++#        set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_FOUND}")
++#    endif()
 +#    message("-- Found ccache: ${CCACHE_FOUND}")
 +#endif(CCACHE_FOUND)
  
  # Check for exec info before we enable the backtrace features.
  CHECK_INCLUDE_FILE("execinfo.h" HAS_EXECINFO)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch b/meta-oe/recipes-extended/minifi-cpp/files/0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch
deleted file mode 100644
index f19cea494c..0000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Tue, 29 Sep 2026 01:54:51 +0000
-Subject: [PATCH] StreamCallback.h: add missing <cstdint> include for
- int64_t
-
-StreamCallback.h uses int64_t in ReadWriteResult and in the
-InputStreamCallback/OutputStreamCallback std::function aliases, but
-never includes <cstdint> itself. On glibc/libstdc++ this happens to
-compile because some other transitively-included standard header
-provides int64_t first, but musl's libc++ headers do not provide
-this transitive declaration, so the header fails to parse with
-"unknown type name 'int64_t'" (which then cascades into std::function
-template errors). This is the same class of issue already fixed for
-LibWrapper.h and RepositoryMetricsSource.h by
-0001-Fix-build-with-gcc-16.patch; StreamCallback.h needs the same
-treatment.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- minifi-api/include/minifi-cpp/io/StreamCallback.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/minifi-api/include/minifi-cpp/io/StreamCallback.h b/minifi-api/include/minifi-cpp/io/StreamCallback.h
-index 1111111..2222222 100644
---- a/minifi-api/include/minifi-cpp/io/StreamCallback.h
-+++ b/minifi-api/include/minifi-cpp/io/StreamCallback.h
-@@ -16,6 +16,7 @@
-  */
- #pragma once
-
-+#include <cstdint>
- #include <functional>
- #include <memory>
- #include <optional>
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_1.1.0.bb
similarity index 77%
rename from meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
rename to meta-oe/recipes-extended/minifi-cpp/minifi-cpp_1.1.0.bb
index 5854483ba9..46b4a96d66 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_1.1.0.bb
@@ -5,69 +5,65 @@ management, focusing on the collection of data at the source of its creation."
 HOMEPAGE = "https://nifi.apache.org/minifi/index.html"
 SECTION = "console/network"
 LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND ISC AND MIT AND Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cb72a6f151096df9e2f5f01b6bf9d735"
-
-SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=main \
-           git://github.com/martinmoene/expected-lite.git;protocol=https;branch=master;name=expected-lite;destsuffix=${S}/thirdparty/expected-lite-src \
-           git://github.com/ericniebler/range-v3.git;protocol=https;branch=master;name=range-v3;destsuffix=${S}/thirdparty/range-v3-src \
-           git://github.com/Neargye/magic_enum.git;protocol=https;branch=master;name=magic-enum;destsuffix=${S}/thirdparty/magic-enum-src \
-           git://github.com/p-ranav/argparse.git;protocol=https;branch=master;name=argparse;destsuffix=${S}/thirdparty/argparse-src \
-           git://github.com/gsl-lite/gsl-lite.git;protocol=https;branch=master;name=gsl-lite;destsuffix=${S}/thirdparty/gsl-lite-src \
-           git://github.com/HowardHinnant/date.git;protocol=https;branch=master;name=date;destsuffix=${S}/thirdparty/date-src \
-           git://github.com/chriskohlhoff/asio.git;protocol=https;branch=master;name=asio;destsuffix=${S}/thirdparty/asio-src \
-           git://github.com/fmtlib/fmt.git;protocol=https;branch=main;name=fmt;destsuffix=${S}/thirdparty/fmt-src \
-           git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;tag=v1.15.3;name=spdlog;destsuffix=${S}/thirdparty/spdlog-src \
-           git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;name=jsoncons;destsuffix=${S}/thirdparty/jsoncons-src \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=50c0151bf7c3999dcb7de9652ec6e3a6"
+
+SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=main;tag=rel/minifi-cpp-${PV} \
+           git://github.com/ericniebler/range-v3.git;protocol=https;branch=master;tag=0.12.0;name=range-v3;destsuffix=${S}/thirdparty/range-v3-src \
+           git://github.com/Neargye/magic_enum.git;protocol=https;branch=master;tag=v0.9.8;name=magic-enum;destsuffix=${S}/thirdparty/magic-enum-src \
+           git://github.com/p-ranav/argparse.git;protocol=https;branch=master;tag=v3.2;name=argparse;destsuffix=${S}/thirdparty/argparse-src \
+           git://github.com/gsl-lite/gsl-lite.git;protocol=https;branch=master;tag=v1.1.0;name=gsl-lite;destsuffix=${S}/thirdparty/gsl-lite-src \
+           git://github.com/HowardHinnant/date.git;protocol=https;branch=master;tag=v3.0.4;name=date;destsuffix=${S}/thirdparty/date-src \
+           git://github.com/chriskohlhoff/asio.git;protocol=https;branch=master;tag=asio-1-38-0;name=asio;destsuffix=${S}/thirdparty/asio-src \
+           git://github.com/fmtlib/fmt.git;protocol=https;branch=main;tag=12.1.0;name=fmt;destsuffix=${S}/thirdparty/fmt-src \
+           git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;tag=v1.17.0;name=spdlog;destsuffix=${S}/thirdparty/spdlog-src \
+           git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v1.7.0;name=jsoncons;destsuffix=${S}/thirdparty/jsoncons-src \
            ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz;name=ossp-uuid;subdir=${S}/thirdparty \
-           https://download.libsodium.org/libsodium/releases/libsodium-1.0.20.tar.gz;name=libsodium;subdir=${S}/thirdparty \
+           https://download.libsodium.org/libsodium/releases/libsodium-1.0.22.tar.gz;name=libsodium;subdir=${S}/thirdparty \
            file://0001-Do-not-use-bundled-packages.patch \
            file://0002-Fix-osspuuid-build.patch \
            file://0003-Fix-libsodium-build.patch \
-           file://0004-Pass-noline-flag-to-flex.patch \
+           file://0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch \
            file://0005-generateVersion.sh-set-correct-buildrev.patch \
+           file://0004-Pass-noline-flag-to-flex.patch \
            file://0006-CMakeLists.txt-do-not-use-ccache.patch \
-           file://0001-Add-missing-include-for-malloc-free.patch;patchdir=thirdparty/fmt-src \
-           file://0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch \
-           file://0001-Fix-build-with-gcc-16.patch \
-           file://0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
           "
 
-# minifi-cpp: 0.99.2
-SRCREV = "92fb88dca9aaff75b5c6795d25d6e437649c1c77"
-# expected-lite: 0.9.0
-SRCREV_expected-lite = "e45e8d5f295d54efe9cace331b9e9f5efa8a84c3"
+# minifi-cpp: 1.1.0
+SRCREV = "1a4b84eb8b53eebcf7c92d83f6ae818f440e33ee"
+# The third-party revisions below are the versions pinned in cmake/*.cmake
 # range-v3: 0.12.0
 SRCREV_range-v3 = "a81477931a8aa2ad025c6bda0609f38e09e4d7ec"
-# magic-enum: 0.9.6
-SRCREV_magic-enum = "dd6a39d0ba1852cf06907e0f0573a2a10d23c2ad"
-# argparse: 3.0
-SRCREV_argparse = "af442b4da0cd7a07b56fa709bd16571889dc7fda"
-# gsl-lite: 0.41.0
-SRCREV_gsl-lite = "755ba124b54914e672737acace6a9314f59e8d6f"
-# date: 3.0.3
-SRCREV_date = "5bdb7e6f31fac909c090a46dbd9fea27b6e609a4"
-# asio: 1.34.2
-SRCREV_asio = "ed6aa8a13d51dfc6c00ae453fc9fb7df5d6ea963"
-# fmt: 11.2.0
-SRCREV_fmt = "40626af88bd7df9a5fb80be7b25ac85b122d6c21"
-# spdlog: 1.15.3
-SRCREV_spdlog = "6fa36017cfd5731d617e1a934f0e5ea9c4445b13"
-# jsoncons: 1.3.2
-SRCREV_jsoncons = "64b9da1e9f15eeff4ec9d6bc856538db542118f2"
-
-SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_argparse_gsl-lite_date_asio_fmt_spdlog_jsoncons"
+# magic-enum: 0.9.8
+SRCREV_magic-enum = "1384769c66bd16ec9bb1353f45fe8ec8ccc12dbd"
+# argparse: 3.2
+SRCREV_argparse = "3eda91b2e1ce7d569f84ba295507c4cd8fd96910"
+# gsl-lite: 1.1.0
+SRCREV_gsl-lite = "c767277c1cad4d4446ba30a13a48ed18ebf9754a"
+# date: 3.0.4
+SRCREV_date = "f94b8f36c6180be0021876c4a397a054fe50c6f2"
+# asio: 1.38.0
+SRCREV_asio = "03cf5f86a780dd102f1cdd3a59d1244d12143e46"
+# fmt: 12.1.0
+SRCREV_fmt = "407c905e45ad75fc29bf0f9bb7c5c2fd3475976f"
+# spdlog: 1.17.0
+SRCREV_spdlog = "79524ddd08a4ec981b7fea76afd08ee05f83755d"
+# jsoncons: 1.7.0
+SRCREV_jsoncons = "cb54cdc3134a62634466bf7bcd24f1a906f4ef25"
+
+SRCREV_FORMAT .= "_range-v3_magic-enum_argparse_gsl-lite_date_asio_fmt_spdlog_jsoncons"
 
 # ossp-uuid: 1.6.2
 SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
-# libsodium: 1.0.20
-SRC_URI[libsodium.sha256sum] = "ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19"
+# libsodium: 1.0.22
+SRC_URI[libsodium.sha256sum] = "adbdd8f16149e81ac6078a03aca6fc03b592b89ef7b5ed83841c086191be3349"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^rel/minifi-cpp-(?P<pver>\d+(\.\d+)+)$"
 
 inherit pkgconfig cmake systemd
 
-DEPENDS = "virtual/crypt bison-native flex-native flex openssl curl zlib xz bzip2 yaml-cpp zstd lz4 pugixml"
+DEPENDS = "virtual/crypt bison-native flex-native flex openssl curl zlib xz bzip2 yaml-cpp pugixml"
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 
@@ -103,17 +99,17 @@ EXTRA_OECMAKE = " \
                  -DSKIP_TESTS=ON \
                  -DMINIFI_OPENSSL_SOURCE=SYSTEM \
                  -DMINIFI_LIBCURL_SOURCE=SYSTEM \
-                 -DMINIFI_ZSTD_SOURCE=SYSTEM \
-                 -DMINIFI_BZIP2_SOURCE=SYSTEM \
-                 -DMINIFI_LIBXML2_SOURCE=SYSTEM \
-                 -DMINIFI_CATCH2_SOURCE=SYSTEM \
                  -DMINIFI_ZLIB_SOURCE=SYSTEM \
+                 -DMINIFI_BZIP2_SOURCE=SYSTEM \
+                 -DMINIFI_LIBLZMA_SOURCE=SYSTEM \
+                 -DMINIFI_LIBARCHIVE_SOURCE=SYSTEM \
+                 -DMINIFI_YAMLCPP_SOURCE=SYSTEM \
                  -DMINIFI_PUGIXML_SOURCE=SYSTEM \
                  -DMINIFI_FMT_SOURCE=BUILD \
                  -DMINIFI_SPDLOG_SOURCE=BUILD \
+                 -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
                  -DFETCHCONTENT_SOURCE_DIR_GSL-LITE=${S}/thirdparty/gsl-lite-src \
                  -DFETCHCONTENT_SOURCE_DIR_DATE_SRC=${S}/thirdparty/date-src \
-                 -DFETCHCONTENT_SOURCE_DIR_EXPECTED-LITE=${S}/thirdparty/expected-lite-src \
                  -DFETCHCONTENT_SOURCE_DIR_RANGE-V3_SRC=${S}/thirdparty/range-v3-src \
                  -DFETCHCONTENT_SOURCE_DIR_MAGIC_ENUM=${S}/thirdparty/magic-enum-src \
                  -DFETCHCONTENT_SOURCE_DIR_ASIO=${S}/thirdparty/asio-src \
@@ -122,19 +118,21 @@ EXTRA_OECMAKE = " \
                  -DFETCHCONTENT_SOURCE_DIR_SPDLOG=${S}/thirdparty/spdlog-src \
                  -DFETCHCONTENT_SOURCE_DIR_JSONCONS=${S}/thirdparty/jsoncons-src \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DENABLE_SYSTEMD=ON', '-DENABLE_SYSTEMD=OFF', d)} \
-                 -DBUILD_IDENTIFIER=${PV} \
+                 -DBUILD_IDENTIFIER=${MINIFI_BUILD_IDENTIFIER} \
                 "
 
-PACKAGECONFIG ??= "libarchive expression-language"
+# Used in the extension registration function name, so it must be an identifier
+MINIFI_BUILD_IDENTIFIER = "${@d.getVar('PV').replace('.', '_')}"
+
+PACKAGECONFIG ??= "libarchive"
 
 # rocksdb is not compatible with libc-musl:powerpc & armv5
 PACKAGECONFIG:remove:libc-musl:powerpc = "rocksdb"
 PACKAGECONFIG:remove:armv5 = "rocksdb"
 
 PACKAGECONFIG[libarchive] = "-DENABLE_LIBARCHIVE=ON,-DENABLE_LIBARCHIVE=OFF,libarchive"
-PACKAGECONFIG[expression-language] = "-DENABLE_EXPRESSION_LANGUAGE=ON, -DENABLE_EXPRESSION_LANGUAGE=OFF"
 PACKAGECONFIG[civetweb] = "-DENABLE_CIVET=ON -DMINIFI_CIVETWEB_SOURCE=SYSTEM,-DENABLE_CIVET=OFF,civetweb"
-PACKAGECONFIG[rocksdb] = "-DENABLE_ROCKSDB=ON -DBUILD_ROCKSDB=OFF -DMINIFI_ROCKSDB_SOURCE=SYSTEM,-DENABLE_ROCKSDB=OFF,rocksdb"
+PACKAGECONFIG[rocksdb] = "-DENABLE_ROCKSDB=ON -DBUILD_ROCKSDB=OFF,-DENABLE_ROCKSDB=OFF,rocksdb"
 
 SYSTEMD_PACKAGES = "minifi-cpp"
 SYSTEMD_SERVICE:${PN} = "minifi.service"
@@ -165,7 +163,7 @@ do_install() {
     for i in minifi-encrypt-config minifi minifi.sh minifi-controller; do
         install -m 755 ${WORKDIR}/minifi-install/usr/bin/${i} ${D}${MINIFI_BIN}
     done
-    for i in config.yml minifi-log.properties minifi.properties minifi-uid.properties; do
+    for i in minifi-log.properties minifi.properties minifi-uid.properties; do
         install -m 644 ${WORKDIR}/minifi-install/usr/conf/${i} ${D}${MINIFI_HOME}/conf
     done
 
@@ -189,6 +187,10 @@ do_install() {
         ${D}${MINIFI_HOME}/conf/minifi.properties
     sed -i "s|nifi.database.content.repository.directory.default=.*|nifi.database.content.repository.directory.default=${MINIFI_RUN}/content_repository|g" \
         ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i "s|nifi.asset.directory=.*|nifi.asset.directory=${MINIFI_RUN}/asset|g" \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i "s|nifi.python.virtualenv.directory=.*|nifi.python.virtualenv.directory=${MINIFI_RUN}/minifi-python-env|g" \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
     sed -i "s|nifi.flow.configuration.file=.*|nifi.flow.configuration.file=${MINIFI_HOME}/conf/config.yml|g" \
         ${D}${MINIFI_HOME}/conf/minifi.properties
     sed -i "s|nifi.python.processor.dir=.*|nifi.python.processor.dir=${libexecdir}/minifi-python|g" \
@@ -204,7 +206,7 @@ do_install() {
         install -m 755 -d ${D}${systemd_system_unitdir}
         install -m 644 ${WORKDIR}/minifi-install/usr/bin/minifi.service ${D}${systemd_system_unitdir}
 
-        sed -i -e "s|^Environment=.*|Environment=MINIFI_HOME=${MINIFI_HOME}|g" ${D}${systemd_system_unitdir}/minifi.service
+        sed -i -e "s|^Environment=MINIFI_HOME=.*|Environment=MINIFI_HOME=${MINIFI_HOME}|g" ${D}${systemd_system_unitdir}/minifi.service
         sed -i -e "s|^ExecStart=.*|ExecStart=${MINIFI_BIN}/minifi|g" ${D}${systemd_system_unitdir}/minifi.service
     fi
 
