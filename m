Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430AFE6817F
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 12:55:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11191.1771332940427115142
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 04:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jxDkIMdf;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: mail2szahir@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a9296b3926so28176135ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 04:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771332939; x=1771937739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QRyy6I9ChtTd2cuWx5WbRDbu9oE6+6y6L8FCAddUuzc=;
        b=jxDkIMdfj8768jyVN2ThBBhM/ctXtr/sLnlB/mvH4awK9XC7+T4zyUghRKyy7tEXDM
         5UprSPYmiy37NjhgJs2bBjICnYa69Vqps/UOxGJOmOHl6C2rc6vJzbsd3QWyk0E+cqKF
         tgK1EZWPighhx+5hcyXTEjP3ntvQwk6C40klQeJIqF9YMkapn2wp+pmgrj9FOoNt/aWQ
         pWxXOlYu5ov2rPArLeyb2nSRoB4X+Ui0fjiZViawnxhokOq66Jc2Tt88VB0zVYqHLcPo
         5Z6xX7z17fX8ldu/agIzgb0sD3i0jWdTKypBlKsxalwTBg8FCqrZYlELlSAXtC6tbzQQ
         RRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771332939; x=1771937739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRyy6I9ChtTd2cuWx5WbRDbu9oE6+6y6L8FCAddUuzc=;
        b=nfs3tSxgKVeFORN3+oxb1C2m96g8smbXvTKahKdftDAmjbQiTwgeX+Xc/ioGWWYjon
         K2RQ8HD1ORJzofxy+6SLQi+GCzt9cpObBnrHHUTzJ44OWt9PPwmsGV2eSF8zAl1Ff7x+
         T3kXRP5/VlZVrr3J3Ad9+pEdS8koPFRYOTUc0gMoc2Dz68mV/XfJO5mTxndyy2J9xHVO
         5gnZwHfoQd3gqvJD8PD9DCs99XM/vi/g68OC9PwMYZ6pyKquHKi2NPr97/P/dYOgQ4hb
         2N7EIjobAqsCydnEAjiWOxWJ3Xfpi6iDWyOqAcWaM+6lekWTjMbp/BEx/FqlY23sEtZf
         SVaw==
X-Gm-Message-State: AOJu0YxB/51j4T2jYFWM9tMn8phz52Ny3EcVeoQNHSR/2LxBI+wtZkwt
	T95Eb5Dg+6S7eaa20q4r2SHmAA7Or82WhVzWNBYK7mu4vU3d3CKk7SSSwTh6zHQo
X-Gm-Gg: AZuq6aLtswLdUU5yBfKXX4EhbojvANDRhdyE1Xhvs22BWq0j9rjnDk3njlV0cdJhxiX
	g0Lzzk6dsB26L8C1IHsuz5eTJr32qcLUELjJaUA+1sSlqnEG3GmroysI0dnlPhynGEKF8SOcgfu
	jDnxE1iAHey5XXq6iI8eyQYDtyabS7dtTBWotuZMfHkLRhwT6/WMdqropnTeCGRaDOv6O+PG+nj
	7aLgM9+BOt1FDU/j1YPtfb42MwTA5Mj65B9UgmfmMQcGkqSxUDJg2lZZdXpdIFgrZAPz9v5iuwv
	UDMyDTzRTOvvAfPS1AYtQJbofd7vDJ819caNrVl4glDhN9wANZ86Oajm/xc6CNOfmXLH6/xohKr
	IVfrburEDVkjdFrQcJ4XsQRc03DoMRPWLjKM/cY5gR9U4R/ou7VmakD4WFdcgHLaoxs1NoiqzWb
	4VXT6vrulf4UevNkNQjdnfqsK4w4n6GnpOVWSLzDm9
X-Received: by 2002:a17:903:1b46:b0:2a9:327f:a8ff with SMTP id d9443c01a7336-2ab505b82bamr119172535ad.33.1771332939408;
        Tue, 17 Feb 2026 04:55:39 -0800 (PST)
Received: from L-17367L.kpit.com ([122.171.20.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa31asm105033065ad.4.2026.02.17.04.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:55:39 -0800 (PST)
From: Zahir Hussain <mail2szahir@gmail.com>
X-Google-Original-From: Zahir Hussain <zahir.basha@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	zahir.basha@kpit.com
Cc: mail2szahir@gmail.com,
	Bhabu Bindu <bindu.bhabu@kpit.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH V1] rocksdb: Add an option to set static library
Date: Tue, 17 Feb 2026 18:25:14 +0530
Message-Id: <20260217125514.34002-1-zahir.basha@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 12:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124451

Modify the CMakeLists.txt to add an Option for
STATIC target import, as available for shared library.

Link: https://github.com/facebook/rocksdb/pull/12890

Configure static library default to switched off
as shared libraries are sufficient in most cases.

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 233079a41caded6b68972317f01dc09435ba1ae0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 72018ca1b1a471226917e8246e8bbf9a374ccf97)
Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 .../files/static_library_as_option.patch      | 72 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
new file mode 100644
index 0000000000..09b30681f8
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
@@ -0,0 +1,72 @@
+From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001
+From: Bindu-Bhabu <bindudaniel1996@gmail.com>
+Date: Fri, 26 Jul 2024 15:14:45 +0530
+Subject: Add option to CMake for building static libraries
+
+ROCKSDB creates a STATIC library target reference by default.
+Modify the cmake so that the STATIC library is also an option
+just like creating a SHARED library and set default to ON.
+refersh the patch according to kirkstone version.
+
+Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/12890]
+
+Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
+Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ CMakeLists.txt | 25 +++++++++++++++----------
+ 1 file changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b68a82b..6f0de6f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -919,6 +919,7 @@ set(ROCKSDB_STATIC_LIB rocksdb${ARTIFACT_SUFFIX})
+ set(ROCKSDB_SHARED_LIB rocksdb-shared${ARTIFACT_SUFFIX})
+ 
+ option(ROCKSDB_BUILD_SHARED "Build shared versions of the RocksDB libraries" ON)
++option(ROCKSDB_BUILD_STATIC "Build static versions of the RocksDB libraries" ON)
+ 
+ option(WITH_LIBRADOS "Build with librados" OFF)
+ if(WITH_LIBRADOS)
+@@ -938,9 +939,11 @@ else()
+   endif()
+ endif()
+ 
+-add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
+-target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
+-  ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
++if(ROCKSDB_BUILD_STATIC)
++  add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
++  target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
++    ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
++endif()
+ 
+ if(ROCKSDB_BUILD_SHARED)
+   add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES} ${BUILD_VERSION_CC})
+@@ -1021,13 +1024,15 @@ if(NOT WIN32 OR ROCKSDB_INSTALL_ON_WINDOWS)
+ 
+   install(DIRECTORY "${PROJECT_SOURCE_DIR}/cmake/modules" COMPONENT devel DESTINATION ${package_config_destination})
+ 
+-  install(
+-    TARGETS ${ROCKSDB_STATIC_LIB}
+-    EXPORT RocksDBTargets
+-    COMPONENT devel
+-    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
+-    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+-  )
++  if(ROCKSDB_BUILD_STATIC)
++    install(
++      TARGETS ${ROCKSDB_STATIC_LIB}
++      EXPORT RocksDBTargets
++      COMPONENT devel
++      ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++      INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
++    )
++  endif()
+ 
+   if(ROCKSDB_BUILD_SHARED)
+     install(
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index 8164f856e2..7f4a4e8ee0 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
            file://mips.patch \
            file://arm.patch \
            file://run-ptest \
+           file://static_library_as_option.patch \
           "
 
 SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
-- 
2.34.1


