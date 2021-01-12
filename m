Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.17376.1610489526557269831
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 14:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SPDyG3iO;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id x18so2198216pln.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 14:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=xAfPIXcpoJMjnasatBBx9dqjqrbsyZNpdvBDWoXBDqM=;
        b=SPDyG3iOvgdEjt3AM5R2fmvNc/cvUkDJMajjm7byPP84dSt9hM7E8JpxWpOi446fPJ
         g0PXJzhKdfJkaUeD9CrsbcIqBTnaRmTy34n/DRmBwmgGygUJCa9wofJHUHJzq4bX8Px9
         mPbpbo+mqN0ULmKhN+rvFYRGvqnDCenVhl9nCJw9vdmza0g9VuQmXVhpm2faK0qwQJuP
         mGyYqIGZU/vH8GavQlllUjCWoVks031oVdhpb0OM5LtQKRXzrcxMO0vA+tAkcDxH5YLn
         elIk/oBOQ1M8tVMWHmbA4HZomhm23ALXiY9r62X9ojZCpsWXinSOsM+IqUppHqpFefew
         EKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=xAfPIXcpoJMjnasatBBx9dqjqrbsyZNpdvBDWoXBDqM=;
        b=nRrWrrLnInTg9fvacUNoLDJfexFPm3dnn3VoVYdC1sM34A9a4DU94eNASEzA1HYgWj
         SRoxt2taZFIhx0eXsaXiw0Z7aqotUNXxhbuYsDN6BlKgr4FG951KPrkvMmhwnge/bSM+
         FCFqZZFSg8mYfdaEeytZRnShnDIh+M9+8Y8efiNP82nNZ46CulvrHOwomyFHJTMCwB3Z
         q/ZlTHrIVLmyufpLVOzYXe/jMpOtDvhN9hHHzQIR4qgvKCeGdYPlZ/zINU6n75Cf5QRh
         DXpChb1kASuug+qZEfPR8elgF6bBg9wk5lhj1aAcpoV7YqA3JsznUwEafVwKAcDky8zn
         Mpug==
X-Gm-Message-State: AOAM531YZc0MFZznfXJy/olMCuCGwEGs/OHrbc6A7Zdbi3uTaoQwHWFq
	pR/kJPBSmixrGW2zwUqqCHIyYsCKYW4Ljg==
X-Google-Smtp-Source: ABdhPJzZBHGMa2fDkkHJEStMexnZQQuU2o8p0IeWOTbwPaDA91MBfG5SCYLwfJv9Dr4AdJ4aYOxdJA==
X-Received: by 2002:a17:902:bf44:b029:da:d140:6f91 with SMTP id u4-20020a170902bf44b02900dad1406f91mr1188169pls.51.1610489525459;
        Tue, 12 Jan 2021 14:12:05 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:2960:99d5:cba5:7114])
        by smtp.gmail.com with ESMTPSA id z10sm79842pfr.204.2021.01.12.14.12.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 14:12:05 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] mariadb: update to 10.4.17 for cve fixes
Date: Tue, 12 Jan 2021 14:12:03 -0800
Message-Id: <20210112221203.14501-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Source: mariadb.org
MR: 107836, 107837, 107838, 107839, 107840, 107852, 106414, 106414, 107864, 107876, 107888
Type: Security Fix
Disposition: Backport from mariadb.org
ChangeID: 75fb83ced15990b94659af6e107c063d288cb037
Description:

refresh several patches
Drop 0001-Fix-build-breakage-from-lock_guard-error-6161.patch as fix included in update

Bugfix only update including these cves:

10.4.13
CVE-2020-2752
CVE-2020-2812
CVE-2020-2814
CVE-2020-2760
CVE-2020-13249

10.4.15
CVE-2020-15180

10.4.16
CVE-2020-14812
CVE-2020-14765
CVE-2020-14776
CVE-2020-14789
CVE-2020-28912 (MDEV-24040)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...e_10.4.12.bb => mariadb-native_10.4.17.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  6 ++--
 ...-breakage-from-lock_guard-error-6161.patch | 32 -------------------
 .../mariadb/0001-Fix-library-LZ4-lookup.patch | 19 +++++------
 .../mysql/mariadb/c11_atomics.patch           | 24 ++++++++------
 .../configure.cmake-fix-valgrind.patch        | 10 +++---
 .../mariadb/fix-a-building-failure.patch      | 13 +++-----
 .../mysql/mariadb/fix-arm-atomic.patch        | 13 +++-----
 ...Lists.txt-fix-gen_lex_hash-not-found.patch | 12 +++----
 ...akeLists.txt-fix-do_populate_sysroot.patch | 10 +++---
 ...{mariadb_10.4.12.bb => mariadb_10.4.17.bb} |  0
 11 files changed, 51 insertions(+), 88 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.12.bb => mariadb-native_10.4.17.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.12.bb => mariadb_10.4.17.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.17.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.4.17.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 95f5acba1f..1a86bc0446 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -18,11 +18,9 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://c11_atomics.patch \
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
-           file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch \
-           file://0001-Fix-library-LZ4-lookup.patch \
           "
-SRC_URI[md5sum] = "97d7c0f508c04a31c138fdb24e95dbc4"
-SRC_URI[sha256sum] = "fef1e1d38aa253dd8a51006bd15aad184912fce31c446bb69434fcde735aa208"
+SRC_URI[md5sum] = "e8193b9cd008b6d7f177f5a5c44c7a9f"
+SRC_URI[sha256sum] = "a7b104e264311cd46524ae546ff0c5107978373e4a01cf7fd8a241454548d16e"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
deleted file mode 100644
index 87c70617a1..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Subject: [PATCH] Fix build breakage from lock_guard error (#6161)
-
-Summary:
-This change fixes a source issue that caused compile time error which
-breaks build for many fbcode services in that setup. The size() member
-function of channel is a const member, so member variables accessed
-within it are implicitly const as well. This caused error when clang
-fails to resolve to a constructor that takes std::mutex because the
-suitable constructor got rejected due to loss of constness for its
-argument. The fix is to add mutable modifier to the lock_ member of
-channel.
-
-Pull Request resolved: https://github.com/facebook/rocksdb/pull/6161
-
-Differential Revision: D18967685
-
-Pulled By: maysamyabandeh
-
-Upstream-Status: Backport
-
-fbshipit-source-id:698b6a5153c3c92eeacb842c467aa28cc350d432 
---- a/storage/rocksdb/rocksdb/util/channel.h
-+++ b/storage/rocksdb/rocksdb/util/channel.h
-@@ -60,7 +60,7 @@ class channel {
- 
-  private:
-   std::condition_variable cv_;
--  std::mutex lock_;
-+  mutable std::mutex lock_;
-   std::queue<T> buffer_;
-   bool eof_;
- };
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
index 574dfd317a..4b90d280ac 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
@@ -8,15 +8,15 @@ Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
  cmake/FindLZ4.cmake | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
-diff --git a/cmake/FindLZ4.cmake b/cmake/FindLZ4.cmake
-index e97dd63e2b0..2f4694e727c 100644
---- a/cmake/FindLZ4.cmake
-+++ b/cmake/FindLZ4.cmake
-@@ -1,5 +1,10 @@
--find_path(LZ4_INCLUDE_DIR NAMES lz4.h)
--find_library(LZ4_LIBRARY NAMES lz4)
+Index: mariadb-10.4.17/cmake/FindLZ4.cmake
+===================================================================
+--- mariadb-10.4.17.orig/cmake/FindLZ4.cmake
++++ mariadb-10.4.17/cmake/FindLZ4.cmake
+@@ -1,5 +1,11 @@
+ find_path(LZ4_INCLUDE_DIR NAMES lz4.h)
+-find_library(LZ4_LIBRARIES NAMES lz4)
 +find_path(LZ4_INCLUDE_DIR
-+  NAMES	lz4.h
++  NAMES    lz4.h
 +  NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
 +
 +find_library(LZ4_LIBRARY
@@ -25,6 +25,3 @@ index e97dd63e2b0..2f4694e727c 100644
  
  include(FindPackageHandleStandardArgs)
  FIND_PACKAGE_HANDLE_STANDARD_ARGS(
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
index 169986130c..b1ce963602 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
@@ -10,9 +10,11 @@ Date:   Fri Dec 21 19:14:04 2018 +0200
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
---- a/configure.cmake
-+++ b/configure.cmake
-@@ -926,7 +926,25 @@ int main()
+Index: mariadb-10.4.17/configure.cmake
+===================================================================
+--- mariadb-10.4.17.orig/configure.cmake
++++ mariadb-10.4.17/configure.cmake
+@@ -863,7 +863,25 @@ int main()
    long long int *ptr= &var;
    return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
  }"
@@ -39,10 +41,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
---- a/mysys/CMakeLists.txt
-+++ b/mysys/CMakeLists.txt
+Index: mariadb-10.4.17/mysys/CMakeLists.txt
+===================================================================
+--- mariadb-10.4.17.orig/mysys/CMakeLists.txt
++++ mariadb-10.4.17/mysys/CMakeLists.txt
 @@ -78,6 +78,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings
-  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO} ${CRC32_LIBRARY})
+  ${LIBNSL} ${LIBM} ${LIBRT} ${CMAKE_DL_LIBS} ${LIBSOCKET} ${LIBEXECINFO} ${CRC32_LIBRARY})
  DTRACE_INSTRUMENT(mysys)
  
 +IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
@@ -52,9 +56,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  IF(HAVE_BFD_H)
    TARGET_LINK_LIBRARIES(mysys bfd)  
  ENDIF(HAVE_BFD_H)
---- a/sql/CMakeLists.txt
-+++ b/sql/CMakeLists.txt
-@@ -178,6 +178,10 @@ ELSE()
+Index: mariadb-10.4.17/sql/CMakeLists.txt
+===================================================================
+--- mariadb-10.4.17.orig/sql/CMakeLists.txt
++++ mariadb-10.4.17/sql/CMakeLists.txt
+@@ -196,6 +196,10 @@ ELSE()
    SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
  ENDIF()
  
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch b/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
index ac94279585..162b1e295b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
@@ -21,11 +21,11 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  configure.cmake | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)
 
-diff --git a/configure.cmake b/configure.cmake
-index 3cfc4b31..d017b3b3 100644
---- a/configure.cmake
-+++ b/configure.cmake
-@@ -930,10 +930,9 @@ HAVE_GCC_C11_ATOMICS)
+Index: mariadb-10.4.17/configure.cmake
+===================================================================
+--- mariadb-10.4.17.orig/configure.cmake
++++ mariadb-10.4.17/configure.cmake
+@@ -867,10 +867,9 @@ HAVE_GCC_C11_ATOMICS)
  
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
index 9149ee21f2..5fc94835ea 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
@@ -14,11 +14,11 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  CMakeLists.txt | 5 -----
  1 file changed, 5 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fc30750..4f9110e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -347,11 +347,6 @@ CHECK_PCRE()
+Index: mariadb-10.4.17/CMakeLists.txt
+===================================================================
+--- mariadb-10.4.17.orig/CMakeLists.txt
++++ mariadb-10.4.17/CMakeLists.txt
+@@ -376,11 +376,6 @@ CHECK_PCRE()
  
  CHECK_SYSTEMD()
  
@@ -30,6 +30,3 @@ index fc30750..4f9110e 100644
  #
  # Setup maintainer mode options. Platform checks are
  # not run with the warning options as to not perturb fragile checks
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
index 05b0cf8ff7..db72709439 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
@@ -15,11 +15,11 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  storage/rocksdb/build_rocksdb.cmake | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/build_rocksdb.cmake
-index d7895b0..3bcd52a 100644
---- a/storage/rocksdb/build_rocksdb.cmake
-+++ b/storage/rocksdb/build_rocksdb.cmake
-@@ -470,6 +470,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINARY_DIR}/build_version.cc)
+Index: mariadb-10.4.17/storage/rocksdb/build_rocksdb.cmake
+===================================================================
+--- mariadb-10.4.17.orig/storage/rocksdb/build_rocksdb.cmake
++++ mariadb-10.4.17/storage/rocksdb/build_rocksdb.cmake
+@@ -498,6 +498,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINA
  
  ADD_CONVENIENCE_LIBRARY(rocksdblib ${SOURCES})
  target_link_libraries(rocksdblib ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
@@ -29,6 +29,3 @@ index d7895b0..3bcd52a 100644
  IF(CMAKE_CXX_COMPILER_ID MATCHES "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set_target_properties(rocksdblib PROPERTIES COMPILE_FLAGS "-fPIC -fno-builtin-memcmp -Wno-error")
  endif()
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
index afc1be47b5..16cd584da9 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
@@ -15,11 +15,11 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
  1 file changed, 20 insertions(+), 10 deletions(-)
 
-diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index c6910f46..bf51f4cb 100644
---- a/sql/CMakeLists.txt
-+++ b/sql/CMakeLists.txt
-@@ -50,11 +50,16 @@ ${WSREP_INCLUDES}
+Index: mariadb-10.4.17/sql/CMakeLists.txt
+===================================================================
+--- mariadb-10.4.17.orig/sql/CMakeLists.txt
++++ mariadb-10.4.17/sql/CMakeLists.txt
+@@ -55,11 +55,16 @@ ${CMAKE_BINARY_DIR}/sql
  
  
  
@@ -41,7 +41,7 @@ index c6910f46..bf51f4cb 100644
  
  ADD_DEFINITIONS(-DMYSQL_SERVER -DHAVE_EVENT_SCHEDULER)
  
-@@ -370,11 +375,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
+@@ -364,11 +369,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
    ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
  ENDIF()
  
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
index 4f9a4e9b0e..937d13da31 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
@@ -15,11 +15,11 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  support-files/CMakeLists.txt | 7 -------
  1 file changed, 7 deletions(-)
 
-diff --git a/support-files/CMakeLists.txt b/support-files/CMakeLists.txt
-index b5767432..56733de1 100644
---- a/support-files/CMakeLists.txt
-+++ b/support-files/CMakeLists.txt
-@@ -165,12 +165,5 @@ IF(UNIX)
+Index: mariadb-10.4.17/support-files/CMakeLists.txt
+===================================================================
+--- mariadb-10.4.17.orig/support-files/CMakeLists.txt
++++ mariadb-10.4.17/support-files/CMakeLists.txt
+@@ -192,12 +192,5 @@ IF(UNIX)
        INSTALL(FILES rpm/enable_encryption.preset DESTINATION ${INSTALL_SYSCONF2DIR}
                COMPONENT IniFiles)
      ENDIF()
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.4.17.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.4.17.bb
-- 
2.17.1

