Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B33C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 19:18:10 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.2713.1704395883200351682
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jan 2024 11:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ivUy/rty;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6d9ac5bd128so554353b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jan 2024 11:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704395882; x=1705000682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmfYnJxn0eS7Yg+mIA55YexvrN2xqrAR3Dd9Ya/bhM4=;
        b=ivUy/rty3tGDLdLQDbnipX8pQkdZRkl3LqBeSKrLKoU/v75ShkASRbWP/h/V2aLzI6
         0H7V2o1c4LeTomlx/I38Mz8OtuwWArBrE22rZPpUUnsc5ypRdMRdZ4hbEsMvrNCJO1O8
         ECOXP9EJnhSmyePMgU5Nxjsxaid1BELXfO+PSU7r/2QVyFYKI2hlZpcWQNxOFDcuEya1
         XVzEaWlzHtXVjq3LMDImWiMylbtFLe7xlmZazfD23v32PsbeMlXUSpqD08zAIfTfKLFY
         FRrEwM6X1f5t12tqKFKdCw6VpbTY2KDntsCBy1vTC4hGK7SDXr90ZrcJ+xFukQEkcO08
         iyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704395882; x=1705000682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmfYnJxn0eS7Yg+mIA55YexvrN2xqrAR3Dd9Ya/bhM4=;
        b=W5y6CHd0FpFGFSlqKDD8rdanu3Lv18q07AthmQ5NPc805DIAyllEWZuko890nZflu8
         tjbPIJiyZ3RvtlARqmG7OCbD84TaCSN2SyTIAvNdcrQDB24Mmy2r8sFbSbk27fI8ZfVd
         FoHv7Mu4f7+ZRbrWnEGJzBp+sPnfOXj0INYHDLYx4PgE2QgJq0t68Pgps3a4ZHhwE86k
         Q5wQpW9LJ8xfUgwQIvWxS9nNdohda4L6AfqY/d63jmxVXk0HWTiorruzO0sKMr1bp/Un
         GLYDe+JPVcOSM6DA3mH5ZA2vZvn3DrHX1JIHTl93fqJyPtEGArhFwO9kbAdJ/lvpafTi
         WyyA==
X-Gm-Message-State: AOJu0Yz4lB5chGphHpAMymqiI2igzYfWKVJqhUL8hljKlLs60TAxg7M0
	UuqIrO2zdZrZMfXoQM/OYGRavvl+OVU=
X-Google-Smtp-Source: AGHT+IGcnX6BiNW7tSCnqqP5L4oJJd2whvbEnV2zatqYv4/JVpbwJHIGu0E8CK8bxE7PZUGkV/MfuA==
X-Received: by 2002:a05:6a00:93a2:b0:6d9:aaf1:d268 with SMTP id ka34-20020a056a0093a200b006d9aaf1d268mr1040545pfb.69.1704395882246;
        Thu, 04 Jan 2024 11:18:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id x5-20020aa784c5000000b006d997b5d009sm16662pfn.69.2024.01.04.11.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 11:18:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcppkafka: Update to tip of trunk
Date: Thu,  4 Jan 2024 11:17:59 -0800
Message-ID: <20240104191759.236775-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jan 2024 19:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108040

Fix the PV to point to last release + git as 0.4.0 is unreleased yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch | 30 -------------------
 .../libcppkafka/libcppkafka_git.bb            | 12 +++++---
 2 files changed, 8 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libcppkafka/libcppkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch

diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch b/meta-oe/recipes-support/libcppkafka/libcppkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
deleted file mode 100644
index d78ee7a8df..0000000000
--- a/meta-oe/recipes-support/libcppkafka/libcppkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 51ec4c1f533dee9a499490c1c5bbd23d2191a4a7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Mar 2022 11:14:25 -0700
-Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR
-
-Do not hardcode library path, this helps it install in right location
-independent of platforms, e.g. ppc64 uses lib64 and not lib
-
-Upstream-Status: Submitted [https://github.com/mfontanini/cppkafka/pull/291]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c4e44e6..25ec1ce 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -51,7 +51,7 @@ option(CPPKAFKA_EXPORT_CMAKE_CONFIG "Generate CMake config, target and version f
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")
- 
- if (NOT CPPKAFKA_CONFIG_DIR)
--    set(CPPKAFKA_CONFIG_DIR lib/cmake/${PROJECT_NAME})
-+    set(CPPKAFKA_CONFIG_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
- endif()
- 
- # Maintain previous compatibility
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
index fd57e4e283..cf2d933169 100644
--- a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
+++ b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
@@ -9,17 +9,21 @@ file://LICENSE;md5=d8b4ca15d239dc1485ef495c8f1bcc72 \
 "
 
 SRC_URI = "git://github.com/mfontanini/cppkafka;protocol=https;branch=master \
-           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch \
 "
-SRCREV = "5e4b350806d561473138ce7a982e8f6cf2e77733"
+SRCREV = "91ac543cbd2228588dcf24a6ca357f8be0f4e5ab"
 
-DEPENDS = "librdkafka boost chrpath-replacement-native"
+BASEPV = "0.4.0"
+PV = "${BASEPV}+git"
+
+DEPENDS = "librdkafka curl boost chrpath-replacement-native"
 
 inherit cmake
 
+EXTRA_OECMAKE = "-DCPPKAFKA_BUILD_SHARED=ON"
+
 S = "${WORKDIR}/git"
 
 do_install:append(){
-    chrpath -d ${D}${libdir}/libcppkafka.so.0.3.1
+    chrpath -d ${D}${libdir}/libcppkafka.so.${BASEPV}
     sed -i -e 's|${STAGING_INCDIR}|\$\{includedir\}|g' ${D}${datadir}/pkgconfig/cppkafka.pc
 }
-- 
2.43.0


