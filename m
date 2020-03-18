Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 248C760AE0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 22:24:49 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id t3so117591plz.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pvbWiiTfCy13iguwg7WxH/ztNKAfXyjF97hrR3LkkL8=;
	b=XLZ4jvkebI5h6PRrv+0hVdYMDu8MIA4zwT+9zieVcxwnzvun7AZKq5iBqlsnaz8NeE
	U6YboSEKMLRqpaBx3AQfPVS/E7w9chHTJd+7FGM8atcN+ZAoVMqNU4F/N8VKmU/JLjvf
	mQuo5pi6o4TmZUDxRtrxycqFHyfZWZkQlWfYTkdAxfl6gO651yNjSJqKgWFSOxaCbgoD
	q7Wyg+Zm9TzYKfMCGCCwdfnSsvscAFe/9IP6yJ8wk5HDvTALq9332Q2yY35SjaI4Aism
	/ADR9qFXvmGllLG+k+LPccyw0ylAC3JhvSnYPDAa09R0DS/mDKK5fm4p1Zgj/a/w7lQY
	HdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pvbWiiTfCy13iguwg7WxH/ztNKAfXyjF97hrR3LkkL8=;
	b=HS9dT0AzSazlxzU5azZJQjg7ysfLrK/zcyNjM1zwDlRHN9gMIs1IXz7iP6GZfp51Hp
	7XJNc06Y03hbzVTGATd4j7wMWnmL0YrRPwGn2Butb+pZ+KpgRnGMRAXYd4ycVrEEpXbd
	BCqa2OZQGbabJ78x4ysbCG1BEKPqnf98TEIWzr//2tzBb1dcxnps3uLZCTwlbIMz3FpG
	z8m16ke2lzSpoa2F2SNasEG3riVkJjBGCEHlMpFh4E+C9OPWxShjHvF2sZ81hZuxCvIz
	WqYZGfKhoiPxUD8A/m0GbE/HtmDTb38g47r8waB6R9M1bRaM96QrNw2iD3Iprpi13kGb
	8PBQ==
X-Gm-Message-State: ANhLgQ3ltvs88Zcifwyt8XV1WIS7m/v4C0Lp5k9Al6Q9AxCi6k19Zssn
	vmgd/3f1ARd+2vGrLM/JdLsxuVVJB/s=
X-Google-Smtp-Source: ADFU+vt9O5MbvUvLRkKA8FBXqVT4tzmB1nfuGGYsFpiyXACc0r6z4d1q+w7MQlRrQcxcDSKg46OETg==
X-Received: by 2002:a17:90a:d593:: with SMTP id
	v19mr362991pju.177.1584570289662; 
	Wed, 18 Mar 2020 15:24:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::593])
	by smtp.gmail.com with ESMTPSA id j4sm53604pfg.133.2020.03.18.15.24.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 15:24:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 15:25:00 -0700
Message-Id: <20200318222500.3249882-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200318222500.3249882-1-raj.khem@gmail.com>
References: <20200318222500.3249882-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rocksdb: Fix build on platforms not having all atomic intrinsics
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
X-List-Received-Date: Wed, 18 Mar 2020 22:24:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-cmake-Add-check-for-atomic-support.patch | 127 ++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
new file mode 100644
index 0000000000..82dc2d584b
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
@@ -0,0 +1,127 @@
+From ba0a0e54d9544babbd3963891f4e3200dd5583f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2020 15:10:37 -0700
+Subject: [PATCH] cmake: Add check for atomic support
+
+Detect if libatomic should be linked in or compiler and platform can
+provide the needed atomic instrinsics, this helps build on certain
+platforms like mips or clang/i386
+
+Fixes
+
+| /mnt/b/yoe/build/tmp/work/mips32r2-yoe-linux/rocksdb/6.6.4-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld: librocksdb.so.6.6.4: undefined reference to `__atomic_exchange_8'
+| /mnt/b/yoe/build/tmp/work/mips32r2-yoe-linux/rocksdb/6.6.4-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld: librocksdb.so.6.6.4: undefined reference to `__atomic_fetch_or_8'
+| /mnt/b/yoe/build/tmp/work/mips32r2-yoe-linux/rocksdb/6.6.4-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld: librocksdb.so.6.6.4: undefined reference to `__atomic_compare_exchange_8'
+| /mnt/b/yoe/build/tmp/work/mips32r2-yoe-linux/rocksdb/6.6.4-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld: librocksdb.so.6.6.4: undefined reference to `__atomic_fetch_sub_8'
+| /mnt/b/yoe/build/tmp/work/mips32r2-yoe-linux/rocksdb/6.6.4-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld: librocksdb.so.6.6.4: undefined reference to `__atomic_load_8'
+| /mnt/b/yoe/build/tmp/work/mips32r2-yoe-linux/rocksdb/6.6.4-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld: librocksdb.so.6.6.4: undefined reference to `__atomic_store_8'
+| /mnt/b/yoe/build/tmp/work/mips32r2-yoe-linux/rocksdb/6.6.4-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld: librocksdb.so.6.6.4: undefined reference to `__atomic_fetch_add_8'
+
+Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/6555]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt                  |  6 +++
+ cmake/modules/CheckAtomic.cmake | 69 +++++++++++++++++++++++++++++++++
+ 2 files changed, 75 insertions(+)
+ create mode 100644 cmake/modules/CheckAtomic.cmake
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index eebda35e9..692d71911 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -776,11 +776,17 @@ if(WITH_LIBRADOS)
+   list(APPEND THIRDPARTY_LIBS rados)
+ endif()
+ 
++# check if linking against libatomic is necessary
++include(CheckAtomic)
++
+ if(WIN32)
+   set(SYSTEM_LIBS ${SYSTEM_LIBS} shlwapi.lib rpcrt4.lib)
+   set(LIBS ${ROCKSDB_STATIC_LIB} ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
+ else()
+   set(SYSTEM_LIBS ${CMAKE_THREAD_LIBS_INIT})
++  if(HAVE_CXX_ATOMIC_WITH_LIB OR HAVE_CXX_ATOMICS64_WITH_LIB)
++    set(SYSTEM_LIBS ${SYSTEM_LIBS} atomic)
++  endif()
+   set(LIBS ${ROCKSDB_SHARED_LIB} ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
+ 
+   add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES})
+diff --git a/cmake/modules/CheckAtomic.cmake b/cmake/modules/CheckAtomic.cmake
+new file mode 100644
+index 000000000..8b7dc8a37
+--- /dev/null
++++ b/cmake/modules/CheckAtomic.cmake
+@@ -0,0 +1,69 @@
++# Checks if atomic operations are supported natively or if linking against
++# libatomic is needed.
++
++# Check inspired by LLVMs cmake/modules/CheckAtomic.cmake
++
++INCLUDE(CheckCXXSourceCompiles)
++INCLUDE(CheckLibraryExists)
++
++function(check_working_cxx_atomics varname)
++  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
++  set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} -std=c++11")
++  CHECK_CXX_SOURCE_COMPILES("
++#include <atomic>
++std::atomic<int> x;
++int main() {
++  return x;
++}
++" ${varname})
++  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
++endfunction(check_working_cxx_atomics)
++
++function(check_working_cxx_atomics64 varname)
++  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
++  set(CMAKE_REQUIRED_FLAGS "-std=c++11 ${CMAKE_REQUIRED_FLAGS}")
++  CHECK_CXX_SOURCE_COMPILES("
++#include <atomic>
++#include <cstdint>
++std::atomic<uint64_t> x (0);
++std::atomic<double> y (0);
++int main() {
++  uint64_t i = x.load(std::memory_order_relaxed);
++  return int(y);
++}
++" ${varname})
++  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
++endfunction(check_working_cxx_atomics64)
++
++# Check if atomics work without libatomic
++check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITHOUT_LIB)
++
++if(NOT HAVE_CXX_ATOMICS_WITHOUT_LIB)
++  check_library_exists(atomic __atomic_fetch_add_4 "" HAVE_LIBATOMIC)
++  if( HAVE_LIBATOMIC )
++    list(APPEND CMAKE_REQUIRED_LIBRARIES "atomic")
++    check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITH_LIB)
++    if (NOT HAVE_CXX_ATOMICS_WITH_LIB)
++      message(FATAL_ERROR "Host compiler must support std::atomic!")
++    endif()
++  else()
++    message(FATAL_ERROR "Host compiler appears to require libatomic, but cannot find it.")
++  endif()
++endif()
++
++# Check if 64bit atomics work without libatomic
++check_working_cxx_atomics64(HAVE_CXX_ATOMICS64_WITHOUT_LIB)
++
++if(NOT HAVE_CXX_ATOMICS64_WITHOUT_LIB)
++  check_library_exists(atomic __atomic_load_8 "" HAVE_CXX_LIBATOMICS64)
++  if(HAVE_CXX_LIBATOMICS64)
++    list(APPEND CMAKE_REQUIRED_LIBRARIES "atomic")
++    check_working_cxx_atomics64(HAVE_CXX_ATOMICS64_WITH_LIB)
++    if (NOT HAVE_CXX_ATOMICS64_WITH_LIB)
++      message(FATAL_ERROR "Host compiler must support std::atomic!")
++    endif()
++  else()
++    message(FATAL_ERROR "Host compiler appears to require libatomic, but cannot find it.")
++  endif()
++endif()
++
+-- 
+2.25.2
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index e82b77e147..addf9552b5 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -12,6 +12,7 @@ PV = "6.6.4"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-db-write_thread.cc-Initialize-state.patch \
+           file://0001-cmake-Add-check-for-atomic-support.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.25.2


