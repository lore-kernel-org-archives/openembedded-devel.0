Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.7131.1620484726058704246
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 07:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VxuHAEA4;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id q2so9883415pfh.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 07:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ovyxqjQQbpxXoBFji3R7LwHZvACiexB3Mn/2ELGqOgs=;
        b=VxuHAEA4bhmDiO0lSjPmilHfODYKU/CVSJ3c3n/bGpDL9jM4ey1zDpLUTGZ81UlbgG
         6qg2C4zPob3ojg+aV/aB0hew9B3K8LETcjBgN3aqBoNDC2bl0U0blWcihh+SwtPJItzJ
         9rjpdJdyhAkiFns5az4DcCwZXdVct9EzAvFXNkKvo558MgfLbKP634h5o7xLW/gOOPvV
         tjq7i5ZCPJc/XhNRpuf1ntM2LyD91T/qklfTN1r1xytODIHYxD85rWzvZNPA27mRInz3
         E/pTnPdiI4ojzWNWzeWxZMMRsmMgf6EMModapdgPbAH3GylTkt9VNU28nnOlzTNzdSSE
         pr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ovyxqjQQbpxXoBFji3R7LwHZvACiexB3Mn/2ELGqOgs=;
        b=pjUqwH9Uxd0wgwkaLgNTTAN1qAjmsFvaO7qgSFCKUctnFD6twcWcbsse39RPAiGAtd
         MkrAFV1u/0ZJZlKr2LU1/QbaY1wUMrPpVnPNUsud/3Uo/yvhCW7BzCQnmAKDVT0e6Jji
         GhmQ6jTJlf52lDg4wpKApIILJZUU3Jn+Jd5XG5hTCWmRId4WF1ke9Xa0ClKijJzPPSX5
         Qp8u6CUcKunvZjPTpDequcDFcUgq1SiUfiDx5KHknj+SG/LGUeaeSDHlLQ/UUErZfWwr
         I6jz77RRC4xT3sGPJgLv1r/Bnz0awkTN8T51NoTV2jP2wqDKLYFPTqasjh4skL56bC4r
         ra/A==
X-Gm-Message-State: AOAM532GZvRUVereUeLH1T0iAGsk5Y9oxnPlJwgm40C3uCFc3Bwb6/hH
	TL2nE10JWF1TMmqPhz/fnwIdjiKAdimJPA==
X-Google-Smtp-Source: ABdhPJyqjeBVgOzlJVDxtkhqOMwFSNPMJq0chEQYA6/Gmg5p4TTf131UhjG2Embrs7bsMiwndLwDmA==
X-Received: by 2002:aa7:838a:0:b029:28e:d71b:b9bd with SMTP id u10-20020aa7838a0000b029028ed71bb9bdmr15733556pfm.38.1620484725305;
        Sat, 08 May 2021 07:38:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id c195sm7325358pfb.5.2021.05.08.07.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 07:38:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.5.10
Date: Sat,  8 May 2021 07:38:43 -0700
Message-Id: <20210508143843.2039576-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop fix-a-building-failure.patch because upstream has made is narrower
to apply to emulator builds and not just any cross compiling builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ve_10.5.9.bb => mariadb-native_10.5.10.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 .../mariadb/fix-a-building-failure.patch      | 35 -------------------
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  |  2 +-
 .../{mariadb_10.5.9.bb => mariadb_10.5.10.bb} |  0
 5 files changed, 2 insertions(+), 38 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.9.bb => mariadb-native_10.5.10.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.9.bb => mariadb_10.5.10.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 9833b28857..50cf5ed236 100644
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
@@ -25,7 +24,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
-SRC_URI[sha256sum] = "40ab19aeb8de141fdc188cf2251213c9e7351bee4d0cd29db704fae68d1068cf"
+SRC_URI[sha256sum] = "a5ff32f9fcaaf26bf5cba94accc7b246d2d5eb75710d027e40122df6bac0babb"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
deleted file mode 100644
index 9149ee21f2..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1b2b6a61c9f82157cd2e0c3744f6c07e07aeb0bd Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 4 Mar 2019 01:11:30 -0800
-Subject: [PATCH] fix a building failure
-
-Upstream-Status: Inappropriate [configuration]
-
-building failed since native does not generate import_executables.cmake
-In fact, our building system will export the needed commands
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- CMakeLists.txt | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fc30750..4f9110e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -347,11 +347,6 @@ CHECK_PCRE()
- 
- CHECK_SYSTEMD()
- 
--IF(CMAKE_CROSSCOMPILING)
--  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
--  INCLUDE(${IMPORT_EXECUTABLES})
--ENDIF()
--
- #
- # Setup maintainer mode options. Platform checks are
- # not run with the warning options as to not perturb fragile checks
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
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
-- 
2.31.1

