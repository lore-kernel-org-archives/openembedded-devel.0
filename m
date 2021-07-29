Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.17208.1627601818354375500
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VywsO7YC;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id ca5so12466589pjb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5ZBKAlaTa8OMDk65g7dUp/3xpF32vmT10fSic/Tfdw0=;
        b=VywsO7YCPgk4lMaX3TOdzwrusa0QvNTvczGqZ36jzBxIS2wA25iUYJhgzR/QK9lkJX
         8ystAhjcNKBRF1OdYfLVVLhvLKrMLNsI2pWyY3oBYed8gTTtQ/ziN7rmHKPSNytx2bMe
         MieBaqP7evvhgG/3ryFjeJE2222IJ7KvZS9h5OOOhF/6ZVeO1TN+K4Ry3MtMiiLU/p8w
         AQTkbHrgqZdsUZkQvF6QA+vm2k4cHvDNQU8LEK7BckcZ9xzEQ0IIGx6LGTC/GwbnHTr2
         vE814KFxdfA371wwURF7VzzoMN07hYCPHNz+kJ/wQ4693CM2ydmowoO+Mt99loc197dV
         Opvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ZBKAlaTa8OMDk65g7dUp/3xpF32vmT10fSic/Tfdw0=;
        b=ccSeQwQFjRAxstFH7eiilPaWv+uB5p0K/jfZ5vwNrb7HxUmsgPTH0At4dVfJZSp8Hj
         m29bdh+z79myYbdzx4qXfHwcWTlLbvBa3lE86cR5RNPTGAmDatJYywUUlV5w0ctvB3PX
         TiMnQ5lTuru10FC4dYpdVRkcHPJ+KCh4PvCvS7dSZYZWDiV1qWgaaBOHf9noxELo0bq7
         TvB5Rs3JIlCcn5rmFor1t/8PMPfeLq3LFPpjW2yLVQTix5HF313pBNG0I/i7XIL82Mj8
         7+wZAJB+haC2oiIWxp54bYLX65Xwma5DbOQkbk2JBZvnA2s08DqoYYNioA/xgzeVj97m
         O+uA==
X-Gm-Message-State: AOAM532ipV0n2UfukjhCwS2qlJOpjHzQU5XbjSC9Wg2i+y8NAd/AwU7m
	+mbKo8MHHXoH3Ll9c6gbH4qGp48VA21L0Q==
X-Google-Smtp-Source: ABdhPJy+Vy0vVQ9uqlBlSa4m4ND6wHlaNZuZSE1ho+MCxSonnPetWyu8QhdkGrKj4KuDWGdbDJr9OA==
X-Received: by 2002:a63:2fc2:: with SMTP id v185mr5818549pgv.71.1627601817769;
        Thu, 29 Jul 2021 16:36:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.36.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:36:57 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 05/15] mariadb: Upgrade to 10.5.10
Date: Thu, 29 Jul 2021 16:36:38 -0700
Message-Id: <5a9c8a31b73e97a60cd682b53c2497f8d4835dc7.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Drop fix-a-building-failure.patch because upstream has made is narrower
to apply to emulator builds and not just any cross compiling builds

Add missing dependency on boost

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2183f0894110a6913c44bee9a1f4b1cea7639bdc)
[Bug fix only update:
CVE-2021-2166
CVE-2021-2154 ]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ve_10.5.9.bb => mariadb-native_10.5.10.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  5 ++-
 ...onfigure-by-closing-IF-ELSE-properly.patch | 35 -------------------
 ...ng-failure.patch => cross-compiling.patch} | 22 ++++--------
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  |  2 +-
 .../{mariadb_10.5.9.bb => mariadb_10.5.10.bb} |  2 +-
 6 files changed, 10 insertions(+), 56 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.9.bb => mariadb-native_10.5.10.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch
 rename meta-oe/recipes-dbs/mysql/mariadb/{fix-a-building-failure.patch => cross-compiling.patch} (61%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.9.bb => mariadb_10.5.10.bb} (85%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 92e54d7592..2974341bfe 100644
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
@@ -22,11 +21,11 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://sys_futex.patch \
-           file://0002-Fix-configure-by-closing-IF-ELSE-properly.patch \
+           file://cross-compiling.patch \
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
-SRC_URI[sha256sum] = "40ab19aeb8de141fdc188cf2251213c9e7351bee4d0cd29db704fae68d1068cf"
+SRC_URI[sha256sum] = "a5ff32f9fcaaf26bf5cba94accc7b246d2d5eb75710d027e40122df6bac0babb"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch b/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch
deleted file mode 100644
index 36c74d8f94..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From fdd08a8774265618668c7f24697e138587c47a16 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 10 May 2021 13:35:54 +0200
-Subject: [PATCH] Fix configure by closing IF ELSE properly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-| CMake Error at libmariadb/cmake/ConnectorName.cmake:30 (ENDMACRO):
-|   Flow control statements are not properly nested.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- libmariadb/cmake/ConnectorName.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libmariadb/cmake/ConnectorName.cmake b/libmariadb/cmake/ConnectorName.cmake
-index b7bbbad..357b8ac 100644
---- a/libmariadb/cmake/ConnectorName.cmake
-+++ b/libmariadb/cmake/ConnectorName.cmake
-@@ -22,7 +22,7 @@ IF(CMAKE_SYSTEM_NAME MATCHES "Windows")
-     SET(MACHINE_NAME "x64")
-   ELSE()
-     SET(MACHINE_NAME "32")
--  END()
-+  ENDIF()
- ENDIF()
- 
- SET(product_name "mysql-connector-c-${CPACK_PACKAGE_VERSION}-${PLATFORM_NAME}${CONCAT_SIGN}${MACHINE_NAME}")
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
similarity index 61%
rename from meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
rename to meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
index 9149ee21f2..0f4815b185 100644
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
index 1ca86bcca2..d082d424b0 100644
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
index e6743fe97a..8ae8241b05 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
@@ -2,7 +2,7 @@ require mariadb.inc
 
 EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
-DEPENDS += "mariadb-native bison-native libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
+DEPENDS += "mariadb-native bison-native boost libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
 
 PROVIDES += "mysql5 libmysqlclient"
 
-- 
2.25.1

