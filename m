Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AC1C0032E
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 00:06:12 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.69300.1697846764884557917
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 17:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nSnKyXEB;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so2041195a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 17:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697846763; x=1698451563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b2+lDKjtuZgGVr0DaF1Vq90aD1ItOgJyakZbZGX33xo=;
        b=nSnKyXEB2nMq4fV4qlQqxMeLTIrx2QrDpT3LYbzG7u49ThPxtS8BxB6GzAp8uQgLbx
         lc6eGHSM4XeMkfei/8v8bq9f/9lMaFUp4tDo6bwepJRUVzubfqgtECQMsCrhcNrkWy1C
         FLJiG74cBtctpu/AfkbrU216An1BEd6wljQRDm9jusaLq+0KKmOrTCz638NUZkv18Vpz
         HMqB4CZOInG8S90/PEiBB3F35c1lN7ldKjcSorrdRSaIasf1QxMzPCmRgTA2f1VcXCJy
         gqKSlaI93solrdbQa1JwuLNSkbHSkFQ0WsyjuJSJKrTZUPRCOi4MiVG0RVFttHa8Cmmo
         NLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697846763; x=1698451563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2+lDKjtuZgGVr0DaF1Vq90aD1ItOgJyakZbZGX33xo=;
        b=R20NkHcO4h1lrztGUgBGLGcYGz/FWUrhr01NTO3zFHQk4+NznrCWFiE4yT7VYdEkMu
         KpRr194RKyTMlugvuPobcFUZETbEkkZGI30LwaL6xll7DO51QKVGM6/JaSKUlewphozB
         m/xljOjMJyhWCtpr+aohKJKpPxuuoNtRSmqSTvoyyrjKG69pG4ssmez9LsUNbMcdWeTw
         Gzj4UKw5cjg0WdBqKEPEMmskligNTKExGSoCvkM1o5FuIU476R5FvvWK+urQh+PIhKHC
         tcVj+KvNa9MjzZIXTFD1jjiLoeti4/xs78U3NXBUEXwPrtZlGMLLIWHSIxXc20pNF+ci
         Zt+w==
X-Gm-Message-State: AOJu0Yw8aIYTKu/HVedF145b6WME2s9/uBiOc0DU9gYIAfk4A6b4BAmQ
	lKeqvXIghVcoo24pKuggj3MaKnOgnrM=
X-Google-Smtp-Source: AGHT+IH/9pXRWxlVuf4l6D++UM7oD6J0UOatscbZB8tziQHahZsio2tfpBaFhG+A2zq0pyNpiNQOWQ==
X-Received: by 2002:a17:907:802:b0:9c2:a072:78c4 with SMTP id wv2-20020a170907080200b009c2a07278c4mr2516546ejb.25.1697846762895;
        Fri, 20 Oct 2023 17:06:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t11-20020a1709066bcb00b009be14e5cd54sm2414899ejs.57.2023.10.20.17.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 17:06:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] leveldb: prevent installing gtest
Date: Sat, 21 Oct 2023 02:05:52 +0200
Message-ID: <20231021000552.2844350-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Oct 2023 00:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105623

* Causes conflicts when leveldb is used in component which itself also depends
  on gtest e.g. leveldb-tl in meta-webosose:

  ERROR: lib32-leveldb-tl-0.1.6-r4 do_prepare_recipe_sysroot: The file
  /usr/lib/pkgconfig/gtest.pc is installed by both lib32-googletest and
  lib32-leveldb, aborting

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...s.txt-fix-googletest-related-options.patch | 55 +++++++++++++++++++
 meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb   |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-googletest-related-options.patch

diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-googletest-related-options.patch b/meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-googletest-related-options.patch
new file mode 100644
index 0000000000..b0bfb8bf16
--- /dev/null
+++ b/meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-googletest-related-options.patch
@@ -0,0 +1,55 @@
+From 77da477840f89da7ced29da315de77571e8f190e Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 20 Oct 2023 22:57:48 +0200
+Subject: [PATCH] CMakeLists.txt: fix googletest related options
+
+* https://cmake.org/cmake/help/book/mastering-cmake/chapter/Writing%20CMakeLists%20Files.html
+  says that CMake options are case-sensitive and I don't see lower-case version in
+  currently used googletest submodules and gtest is indeed installed with leveldb
+
+* install_gmock option I don't see at all, so I've kept it as is, INSTALL_GTEST, BUILD_GMOCK
+  do exist as upper-case
+
+$ grep -Ri install_.*mock .
+./CMakeLists.txt:  set(install_gmock OFF)
+./third_party/googletest/googlemock/CMakeLists.txt:install_project(gmock gmock_main)
+$ grep -Ri build_gmock .
+./CMakeLists.txt:  set(BUILD_GMOCK ON)
+./third_party/googletest/googletest/README.md:cmake .. -DBUILD_GMOCK=OFF
+./third_party/googletest/CMakeLists.txt:option(BUILD_GMOCK "Builds the googlemock subproject" ON)
+./third_party/googletest/CMakeLists.txt:if(BUILD_GMOCK)
+$ grep -Ri install_gtest .
+./CMakeLists.txt:  set(INSTALL_GTEST OFF)
+./third_party/googletest/googletest/cmake/internal_utils.cmake:  if(INSTALL_GTEST)
+./third_party/googletest/googletest/CMakeLists.txt:if (INSTALL_GTEST)
+./third_party/googletest/CMakeLists.txt:option(INSTALL_GTEST "Enable installation of googletest. (Projects embedding googletest may want to turn this OFF.)" ON)
+
+* also use CACHE and FORCE as sugested in:
+  https://cmake.org/cmake/help/latest/command/set.html
+  https://stackoverflow.com/questions/20239334/cmake-set-subdirectory-options
+  for the value to correctly propagate into third_party/googletest subdirectory
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/google/leveldb/pull/1152]
+
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fda9e01..f8a2629 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -295,9 +295,9 @@ if(LEVELDB_BUILD_TESTS)
+ 
+   # Prevent overriding the parent project's compiler/linker settings on Windows.
+   set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
+-  set(install_gtest OFF)
+-  set(install_gmock OFF)
+-  set(build_gmock ON)
++  set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)
++  set(install_gmock OFF CACHE BOOL "" FORCE)
++  set(BUILD_GMOCK ON CACHE BOOL "" FORCE)
+ 
+   # This project is tested using GoogleTest.
+   add_subdirectory("third_party/googletest")
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
index 61fa02c154..ab0176ff9b 100644
--- a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
@@ -5,7 +5,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
 
 SRC_URI = "gitsm://github.com/google/${BPN}.git;branch=main;protocol=https \
-           file://run-ptest"
+    file://0001-CMakeLists.txt-fix-googletest-related-options.patch \
+    file://run-ptest \
+"
 
 SRCREV = "068d5ee1a3ac40dabd00d211d5013af44be55bea"
 S = "${WORKDIR}/git"
-- 
2.42.0


