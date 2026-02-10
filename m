Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D9DEA8118
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 13:42:04 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19685.1770730522356362522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Feb 2026 05:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YkU7bKvY;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: mail2szahir@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-352e3d18fa7so3149510a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 05:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770730521; x=1771335321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKLFD4GxMKTmDRM/5IhdllN5fHpLme7OPKrNgziaUf4=;
        b=YkU7bKvYjUE2D021SbeZ7jAC2X3KyhqlqiMZtjJZMDSuOVkHhJ3S+5HOKJpFzTwYeu
         7rp9oFsqM/whgtA5KBWLGeBiXwWrvrS49mT/qRodt+LnRiggZnUF+5zzNQyoRXoX3jGU
         RwqZ4XRicABJXfyM0m9aeXxHmom9T4dlwtu0AWp666+yYbZjnVBEqNbFpD3scmputjJS
         Q82BF2numKK5j14HPKXmEQ5Tdr8OdE8RCwzUCB2hyvMa8755XjI60JQYaTyiZBb5rPtb
         lVfFjfvzwBMOxVTel2WozyBkjWnFfs1hhgcM76E03aVtZPBRkz2xmcw13AA4B/yWw3bH
         kaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730521; x=1771335321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKLFD4GxMKTmDRM/5IhdllN5fHpLme7OPKrNgziaUf4=;
        b=THC6MGL1bTzFXVhGHVP+GB4kivYSWUw8tXjz680VIQ18AlIfIj+sR6reBPzrF2OHqc
         Tg4fUELm6DAyATD4keV0faFEAk4wxEN1LBW+YCYL03uH8xAWgusyEljcCpiqHToGiwjk
         GR83JLjOK6Hsz1fLgY+q4MUqcMBXagkJ+wljx+gWW+HT4xQteqPK4XReBBcNaSyVtyKK
         RFpK+M1+MOR1O+2mr75ECkjbZs24hRBqJOAKcCAeZc5Qv0Pr0p1jVAYMs4Hkynq5sIWQ
         Cc6EWMnFA5hBZ8GUMqPtOvxE0nNYJpa0UHnYtiWRwPJaZ0cQc4QbDryhLt1T+YPCODT5
         +Jjw==
X-Gm-Message-State: AOJu0Yyr0RFmPuHX11LQFaYna3yAX/BmZzXivxA76oiREBaNj8Dz4hGG
	HXh1SXv8USpTnDBDjnLj8DccLPl9s/qnGuOH3a9m3kFHeWPqGie0Us+kA7FG/mBuN/Y=
X-Gm-Gg: AZuq6aKeMy9UnlEK/Kih5/eUlMBqMdFaMeOUjnDftGcO7W8G9CsRthF3MKMH14AzqKA
	8TXgDKJl5B/+/AuPVF0PIB3Ue7QUaj3HtXE8Ivv90s+2FytOUmbGdqudkhkRZCVOyxQUg1crA2T
	cFL2tINyPddc/Krl5fsMr/NCHTs8bA7CnS0gOPrRJFrB9OquHom2PiY0PSSpTIv+KtorFIUdUV7
	ZJM2XeOJ0bX0K6jcd0IZW+0Hw+oOq4kHic49hO1vRAABeBVCtsLCz0DJPEaxxkRQDliGjyLqP+M
	iyjXhEYbEkRg6TDxp65atDAvB5w9PUr/LYgGhMPoZkngfqxWYJAukVrxi33FArW/CoUuc09Xxoh
	NN+gafqOHv9qDuLi+1rGErDb9Hb8cQ1l62VF75/mUK8eN/LYLvwJxEoSPKTiWofNVbiV86Mxn+J
	WpFklikUG6GrEF+2fwQOVxsA==
X-Received: by 2002:a17:90b:28c5:b0:356:1db4:8fe7 with SMTP id 98e67ed59e1d1-3561db49346mr8399627a91.32.1770730521403;
        Tue, 10 Feb 2026 05:35:21 -0800 (PST)
Received: from L-17367L.. ([122.171.23.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354bfa7b293sm7368303a91.3.2026.02.10.05.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:35:21 -0800 (PST)
From: "aszh07" <mail2szahir@gmail.com>
X-Google-Original-From: Zahir Hussain <zahir.basha@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	zahir.basha@kpit.com
Cc: mail2szahir@gmail.com,
	Bhabu Bindu <bindu.bhabu@kpit.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] rocksdb: Add an option to set static library
Date: Tue, 10 Feb 2026 19:05:00 +0530
Message-Id: <20260210133500.30649-1-zahir.basha@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 13:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124320

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
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  2 +
 2 files changed, 74 insertions(+)
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
index 8164f856e2..9cdc2edf30 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
            file://mips.patch \
            file://arm.patch \
            file://run-ptest \
+           file://static_library_as_option.patch \
           "
 
 SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
@@ -45,6 +46,7 @@ EXTRA_OECMAKE = "\
     -DWITH_BENCHMARK_TOOLS=OFF \
     -DWITH_TOOLS=OFF \
     -DFAIL_ON_WARNINGS=OFF \
+    -DROCKSDB_BUILD_STATIC=OFF \
 "
 
 do_install:append() {
-- 
2.34.1


