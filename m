Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.288.1623866383228735154
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 10:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rF4cCxsq;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso2217425pjb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 10:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/sKupcarvZYZPDCWKhXJ69/Rwd4UOaTx+bxswIdm91Q=;
        b=rF4cCxsqqBHCdlc7eFVavshc/Pyx/u569urwhtsK7HolMGcI+FReep9r4a9dDlCrws
         HCG2Ej5Y1GKDK1S1MyCGE4FNlkYFVuqp+kOHeiD/AnvF0brE/P4YsQpVKaJ2ilyXfkTH
         Nw908LRA6huKGl5g14ND0Tu3LrBLClixi9Omu93WK+W9Ksnc/pEeacfH5PSRjWN/5S+l
         bCzGVh929WIyOUQ6mnc+jf3XL0hxvxw/dBMYQMhpR+yIAjZENOX1vdfUCQRLALBcZZsh
         yH20DAkQBAFdcD8/oJ+zEjDI4zaRgkKW3kIKXpsGbtzm6oocHxt26YWHBPP4ed4cS4wq
         Pisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/sKupcarvZYZPDCWKhXJ69/Rwd4UOaTx+bxswIdm91Q=;
        b=JtMxzH24A0A3jFQzRqDAwk3XPllYD00xPo5xaKeUZetmoiLNghaWXBUd3PyEGXIbov
         w5KkDDFFuNg/XEYubW1Y6Ybu2KIUoQG/xjgKUMWVnnG+O8rkLj5Y4XWauqSnv529In3T
         YH39e14oiUDUCuOD10kIrg09p2WJFgUR+uWs5cWXapuv04MD+9ivCzmbAeVroExTQLWh
         9+QQIlk4yQHtUaesFtI5RWhCSIXfR9wuIBet0zDZyXsfxSPN7JiUxt55jt8sscYVo+Ii
         zqkGmSWy2pDNTPR+Ph952amp3hTHwRGOPT1jsz4VXmSwnjjP7oS+sLsxjMMPe5cWK4+Y
         gsvw==
X-Gm-Message-State: AOAM532m7rAvoPwj7hLSaKxh22UCBP7h+7w9uQpSe3JE8GGWwVE36DUU
	p/Zz1OWeCrm2pAib36CBaGZPTGo995r60g==
X-Google-Smtp-Source: ABdhPJzSunP9u/aVTa5LtYHQbbQLYJJKPX4AfKUC7/kbA4PClMYb0Gki2WLxs79XKLnzCurHwJT+zA==
X-Received: by 2002:a17:902:b203:b029:11b:1549:da0d with SMTP id t3-20020a170902b203b029011b1549da0dmr694785plr.48.1623866382572;
        Wed, 16 Jun 2021 10:59:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2872982pfy.153.2021.06.16.10.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:59:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/9] rocksdb: Upgrade to 6.20.3
Date: Wed, 16 Jun 2021 10:59:33 -0700
Message-Id: <20210616175937.323664-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616175937.323664-1-raj.khem@gmail.com>
References: <20210616175937.323664-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh patches
Add a fix to build with clang on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-cmake-Add-check-for-atomic-support.patch | 12 ++--------
 ...01-cmake-Use-exported-target-for-bz2.patch |  7 +-----
 ...0001-folly-Use-SYS_futex-for-syscall.patch |  5 ----
 ...Limit-the-mm_malloc.h-hack-to-glibc-.patch | 23 +++++++++++++++++++
 .../{rocksdb_6.15.5.bb => rocksdb_6.20.3.bb}  |  5 ++--
 5 files changed, 29 insertions(+), 23 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch
 rename meta-oe/recipes-dbs/rocksdb/{rocksdb_6.15.5.bb => rocksdb_6.20.3.bb} (91%)

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
index eb9928a0ca..8bdd27ff25 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
@@ -25,11 +25,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 74 insertions(+)
  create mode 100644 cmake/modules/CheckAtomic.cmake
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f9c8f3346..4d604004b 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -852,7 +852,12 @@ endif()
+@@ -935,7 +935,12 @@ endif()
  if(WIN32)
    set(SYSTEM_LIBS ${SYSTEM_LIBS} shlwapi.lib rpcrt4.lib)
  else()
@@ -41,10 +39,7 @@ index f9c8f3346..4d604004b 100644
 +  endif()
  endif()
  
- add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES})
-diff --git a/cmake/modules/CheckAtomic.cmake b/cmake/modules/CheckAtomic.cmake
-new file mode 100644
-index 000000000..8b7dc8a37
+ add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
 --- /dev/null
 +++ b/cmake/modules/CheckAtomic.cmake
 @@ -0,0 +1,69 @@
@@ -117,6 +112,3 @@ index 000000000..8b7dc8a37
 +  endif()
 +endif()
 +
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
index 57433b057a..d3054759a7 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
@@ -11,8 +11,6 @@ Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/7541]
  CMakeLists.txt | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 676192913..801586c30 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -32,7 +32,7 @@
@@ -24,7 +22,7 @@ index 676192913..801586c30 100644
  
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/modules/")
  include(ReadVersion)
-@@ -148,12 +148,7 @@ else()
+@@ -152,12 +152,7 @@ else()
    if(WITH_BZ2)
      find_package(BZip2 REQUIRED)
      add_definitions(-DBZIP2)
@@ -38,6 +36,3 @@ index 676192913..801586c30 100644
    endif()
  
    if(WITH_LZ4)
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch
index aa291daa3e..9c70d4f6a6 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch
@@ -12,8 +12,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  third-party/folly/folly/detail/Futex.cpp | 10 ++++++++--
  1 file changed, 8 insertions(+), 2 deletions(-)
 
-diff --git a/third-party/folly/folly/detail/Futex.cpp b/third-party/folly/folly/detail/Futex.cpp
-index 62d6ea2b2..a914a8c73 100644
 --- a/third-party/folly/folly/detail/Futex.cpp
 +++ b/third-party/folly/folly/detail/Futex.cpp
 @@ -48,9 +48,15 @@ namespace {
@@ -42,6 +40,3 @@ index 62d6ea2b2..a914a8c73 100644
        addr, /* addr1 */
        op, /* op */
        expected, /* val */
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch
new file mode 100644
index 0000000000..dbb0dda221
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch
@@ -0,0 +1,23 @@
+From 1a69d4cc3f97e348dba9714c7ec60da1a8650664 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Jun 2021 22:05:36 -0700
+Subject: [PATCH] jemalloc_helper: Limit the mm_malloc.h hack to glibc on linux
+
+Musl does not need this hack
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ port/jemalloc_helper.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/port/jemalloc_helper.h
++++ b/port/jemalloc_helper.h
+@@ -5,7 +5,7 @@
+ 
+ #pragma once
+ 
+-#if defined(__clang__)
++#if defined(__clang__) && defined(__GLIBC__)
+ // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
+ // declaration does not. There is a hack in clang to make its re-declaration
+ // compatible with glibc's if they are declared consecutively. That hack breaks
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.15.5.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
similarity index 91%
rename from meta-oe/recipes-dbs/rocksdb/rocksdb_6.15.5.bb
rename to meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index acef05b015..ded454e167 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.15.5.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -6,13 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "abd4b1ff1504ae2a7ed6e60bc9c9797b880c33a5"
-SRCBRANCH = "6.15.fb"
+SRCREV = "8608d75d85f8e1b3b64b73a4fb6d19baec61ba5c"
+SRCBRANCH = "6.20.fb"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-cmake-Add-check-for-atomic-support.patch \
            file://0001-cmake-Use-exported-target-for-bz2.patch \
            file://0001-folly-Use-SYS_futex-for-syscall.patch \
+           file://0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.32.0

