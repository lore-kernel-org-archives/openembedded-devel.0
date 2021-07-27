Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.7458.1627364155392963553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jul 2021 22:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16R5Zr3i015794
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 22:35:53 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 26 Jul 2021 22:35:53 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 26 Jul 2021 22:35:52 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-oe][PATCH] mariadb: Upgrade to 10.5.10
Date: Tue, 27 Jul 2021 13:33:48 +0800
Message-ID: <20210727053348.39811-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

Drop fix-a-building-failure.patch because upstream has made is narrower
to apply to emulator builds and not just any cross compiling builds

Add missing dependency on boost

(master rev: 2183f0894110a6913c44bee9a1f4b1cea7639bdc)
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ve_10.5.9.bb => mariadb-native_10.5.10.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 ++--
 ...ng-failure.patch => cross-compiling.patch} | 22 +++++--------------
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  |  2 +-
 .../{mariadb_10.5.9.bb => mariadb_10.5.10.bb} |  2 +-
 5 files changed, 10 insertions(+), 20 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.9.bb => mariadb-native_10.5.10.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/mariadb/{fix-a-building-failure.patch => cross-compiling.patch} (61%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.9.bb => mariadb_10.5.10.bb} (85%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 9833b2885..2974341bf 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -11,7 +11,6 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://install_db \
            file://mysql-systemd-start \
            file://configure.cmake-fix-valgrind.patch \
-           file://fix-a-building-failure.patch \
            file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
            file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://0001-disable-ucontext-on-musl.patch \
@@ -22,10 +21,11 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://sys_futex.patch \
+           file://cross-compiling.patch \
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
-SRC_URI[sha256sum] = "40ab19aeb8de141fdc188cf2251213c9e7351bee4d0cd29db704fae68d1068cf"
+SRC_URI[sha256sum] = "a5ff32f9fcaaf26bf5cba94accc7b246d2d5eb75710d027e40122df6bac0babb"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
similarity index 61%
rename from meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
rename to meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
index 9149ee21f..0f4815b18 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
@@ -1,28 +1,21 @@
-From 1b2b6a61c9f82157cd2e0c3744f6c07e07aeb0bd Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 4 Mar 2019 01:11:30 -0800
-Subject: [PATCH] fix a building failure
-
-Upstream-Status: Inappropriate [configuration]
+This is not needed for OE builds
 
 building failed since native does not generate import_executables.cmake
 In fact, our building system will export the needed commands
 
+Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- CMakeLists.txt | 5 -----
- 1 file changed, 5 deletions(-)
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fc30750..4f9110e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -347,11 +347,6 @@ CHECK_PCRE()
+@@ -392,11 +392,6 @@ CHECK_PCRE()
  
  CHECK_SYSTEMD()
  
--IF(CMAKE_CROSSCOMPILING)
+-IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
 -  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
 -  INCLUDE(${IMPORT_EXECUTABLES})
 -ENDIF()
@@ -30,6 +23,3 @@ index fc30750..4f9110e 100644
  #
  # Setup maintainer mode options. Platform checks are
  # not run with the warning options as to not perturb fragile checks
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
index 1ca86bcca..d082d424b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
@@ -36,7 +36,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  __builtin_ppc_get_timebase();
  #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
    /* Mainly, prevent the compiler from optimizing away delay loops */
-   __asm__ __volatile__ ("":::"memory");
+   __asm__ __volatile__ ("isb":::"memory");
 --- a/storage/tokudb/PerconaFT/portability/toku_time.h
 +++ b/storage/tokudb/PerconaFT/portability/toku_time.h
 @@ -124,7 +124,7 @@ static inline tokutime_t toku_time_now(v
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
similarity index 85%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
index e6743fe97..8ae8241b0 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
@@ -2,7 +2,7 @@ require mariadb.inc
 
 EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
-DEPENDS += "mariadb-native bison-native libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
+DEPENDS += "mariadb-native bison-native boost libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
 
 PROVIDES += "mysql5 libmysqlclient"
 
-- 
2.29.2

