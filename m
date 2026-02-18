Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38F0E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 13:08:31 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11479.1771420102994651238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 05:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d9h0qREn;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: mail2szahir@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7bced39cfso54028945ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771420102; x=1772024902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QmdJMA9n4aI8VPbDjZ64nJ2IfS4GCkkRzLaUFfE8QjI=;
        b=d9h0qREnqPK6KD4pT2ScEp4LwCn0Oh02ODTmVGhOpRaIHSLLY7Pd116xtsPSKTwKbA
         LifsDby5V2/PsfnwDiLSxpii64tNIDVC1tv1XJThEBWToCHW969cZ+mn7/C6/o9uDm9o
         A1MLUTcWwhHEPi1rMygCJ/ZsAB5oB2oMv1XyUbRo6YZshknnPze/qjGigMCcPnLJ8Esf
         djSQ6cQS6Vzy3OdRxpK7Bi0P+jnfc8OOjNzDlyfpIXr380033srsMcQxltWZHJGxySuI
         yumc6PW6aFFaM8pUDWY3pNhXpZInFVwH//H1PWKht1GTz4Gq22f9H2DRmkcQVkESWdBV
         1CuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771420102; x=1772024902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmdJMA9n4aI8VPbDjZ64nJ2IfS4GCkkRzLaUFfE8QjI=;
        b=QnUKoxdgXETDkbcB0Jj37GKCPB6N0rjXxA6nDZh/zj90cIp5mDo+ATq52Xyvb3v2bh
         WUTwXzZphQ0pK7ZoLfJEGzYm8hUSkrk27VeJeIv969yffGPpJfrhCteYPxHq5nSmmnrJ
         gJUVSv9NJCbCjTcYHuBjgH56eugCWD5V0u20nJdlpUCugjgQugUtJXZzL1jgg0efRP95
         ZdNgJHx8KczRCiCNeiFloongOben8j3FLBk7hdGZQv7Uen/qeKbgkV5c+jyHuH7swAho
         G+g9rxBGEaipru9+UmcMATUlVCzyBD6ETS4lNToM4dyb3uVe7o5RbyK9FlxoqNeYoDW7
         ynUQ==
X-Gm-Message-State: AOJu0YyN9ek3Psx4DzFW6SMkINWbwnHKPE4PqgSbKxXl1CJVd8mVjuJ0
	6etkiZxEW0yL2brBUVm4tCoPZxZOk+eD2EEhZrEjAIOEDLHMwKUkyFGb4gI5cm0uKOE=
X-Gm-Gg: AZuq6aJjWvqjb9T8eThlwzujmKyez/fN+wEXFvklfxM66GQIoZD2xJvSG1oeUD2crlL
	Hp1reB6c3Vb3qC2VEC79xyenhSsUTr4tl2/33lCVtHpHgrlcmWTNIfC2JEq/ZWygGvNM88qWJYN
	sY3u1YcAEaq+lk2HEyWKehVfK7bDpKsr0yoBfEDul7/9XZoUQxi/iH0268H2RN8UmJCr6Hw4k5v
	qgv/W2yojCR7iO9Np4EHK0yzCj3bwnkLg69jHI0dHMXlUZG+wkCmTvvFXhbNDqe1mazII/w4ZOr
	SNZo0ULh6K2tl900JzyLwVcM868zvyljZUzH4z0n4ccd9AHArB5r1unSycwY6Dex9AMfiw/voOw
	zrI6+hFrmex2xr4gfdsbqFbI+y11mQhEFIUMnlFarSjYtbtIpuUlV4Q6TQEnSHJnYC33qikh890
	1bVP94g8uUgHQPxQAnnp66IVfDqz31XQ==
X-Received: by 2002:a17:903:2f4e:b0:2a9:5e25:4708 with SMTP id d9443c01a7336-2ad50e59df7mr17669175ad.3.1771420101984;
        Wed, 18 Feb 2026 05:08:21 -0800 (PST)
Received: from L-17367L.kpit.com ([49.47.218.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a72e444sm140191085ad.34.2026.02.18.05.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 05:08:21 -0800 (PST)
From: Zahir Hussain <mail2szahir@gmail.com>
X-Google-Original-From: Zahir Hussain <zahir.basha@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	zahir.basha@kpit.com
Cc: mail2szahir@gmail.com,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH V3] rocksdb: Add an option to set static library
Date: Wed, 18 Feb 2026 18:37:50 +0530
Message-Id: <20260218130750.474415-1-zahir.basha@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 13:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124481

Modify the CMakeLists.txt to add an Option for
STATIC target import, as available for shared library.

Link: https://github.com/facebook/rocksdb/pull/12890

Configure static library as option, default to ON.
Provides option to make it off thru PACKCONFIG, if needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 233079a41caded6b68972317f01dc09435ba1ae0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 72018ca1b1a471226917e8246e8bbf9a374ccf97)
Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 .../files/static_library_as_option.patch      | 72 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  4 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
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
index 8164f856e2..7bfe157c1f 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
            file://mips.patch \
            file://arm.patch \
            file://run-ptest \
+           file://static_library_as_option.patch \
           "
 
 SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
@@ -30,13 +31,14 @@ S = "${WORKDIR}/git"
 
 inherit cmake ptest
 
-PACKAGECONFIG ??= "bzip2 zlib lz4 gflags"
+PACKAGECONFIG ??= "bzip2 zlib lz4 gflagsi rocksdb_static"
 PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
 PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
 PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 PACKAGECONFIG[zstd] = "-DWITH_ZSTD=ON,-DWITH_ZSTD=OFF,zstd"
 PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
 PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
+PACKAGECONFIG[rocksdb_static] = "-DROCKSDB_BUILD_STATIC=ON, -DROCKSDB_BUILD_STATIC=OFF"
 
 # Tools and tests currently don't compile on armv5 so we disable them
 EXTRA_OECMAKE = "\
-- 
2.34.1


