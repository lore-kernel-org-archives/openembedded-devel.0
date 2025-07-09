Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E13C83F0F
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:15 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.3041.1752082269259966363
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d2Dvk/Md;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-558fa0b2c99so46662e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082267; x=1752687067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fa3MvJJHYurEEo5zvO+BQMixdbtGW3HYl+VfE8m7lTs=;
        b=d2Dvk/Md8ae2dcO2k0dl4ucr9J+CuCuoQ0nxWTDbo7mDUAxnLV/o8HVVzRfp2v9ySL
         4wUnvJASq307dmwDLOcUrGJ8J6B1KaCYPwnIcbL4687cDemqMex5T2ma/+lQvoax8xA5
         lm5jD1XJCPVegbxlV/P4MLHfra1Y7s0SzeHDXkMw3ormaCEJku13ZaOi0FE7DcK27NSr
         WJ/JQIjxGqNVsySRUkjXNwZ1TrzovTqU17ElzMCCgh2iKvq0kdAcX65FdH9YZOxi1/5K
         HXKIQeBAZDTtL2qasN6/9nWoNIO3m9X3d3mBCG26mTJnPrMm+wtMmZQ+Wxr7UXOVnjZc
         pxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082267; x=1752687067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fa3MvJJHYurEEo5zvO+BQMixdbtGW3HYl+VfE8m7lTs=;
        b=IIVX6cmx0BWwwgRkNNyYT2/ej7cm9nHolM2I1LTgzZir0bab/OvC3SV031HkclvdQf
         6rzI5BGQamZg5WuOAQaZtQaJYmIPJZN8JonA/Mlx3AhTBirL5sfeF5Zoyh+6XBfCt0N2
         tOYmTLibASvntKRS/ZVCG0CdvMOJ5z87I950I3ulGdno8csufEEjJ+gz/iATrcJVd471
         fPIoiqivsaIN2KyUwrCLO9ks1oAfer9HxHdNHeS1+0XQfkay97zyQxLDekr3jvM7+yjW
         eprBEMXSqHX8RIbWLaBJURjR6SnRtt1WloA5Vl2WaHB2mA3WzCNY17LL+mPfQViKiFVo
         sPQg==
X-Gm-Message-State: AOJu0Yxp9LekCIKTW6ct4zlZ5Szkz/UzndjOlEw0zhHMPGKwmmFZVsbh
	ZXLYYn7UUtbhVmTGFqHersIbMGygnsR8IP9sqtcKs0wq5EUfnJ2kdX/8J+dVyQ==
X-Gm-Gg: ASbGnctQhTgfwVKzDsKONri3v+g8uIQ5T9cosp6lQg7C3RxMvh89Kw4uNU82YiRD9nb
	C+GnDz9E5VvqIfqndXi1mIDzIYzGFg3xE7WcSE3QaG5490HEtngmo1zUW/8e7QDUCLymb8Q3LGH
	o+6x1WgFUIYnvUOHbm0SbiFQ13AN5zRoECZHmBLmegjK47rw7yIf0SK2QDDkTiIWwjjz+0gLh1u
	NDFxaiWqhkr6PaTPOTZCWtqL/Vqcn27gbncVsmK0nKNru44wTIIuCfartI2VbKgNPiU2bg4UQ9i
	uYf7idFfxzCeYUQHCTgfqjTtz87q5lbvc7O/UYHrih9yPFxzs69M1bm5NUvSjKaxXUaEgsAQ5xr
	wIek=
X-Google-Smtp-Source: AGHT+IGUrGMywHHMMvCHDyXlE1uFtLCRYamMroULx2qIzoRge6U+8+gUhwpz5S5v7cB3dt7WrffGXw==
X-Received: by 2002:a05:6512:3182:b0:558:f948:b57a with SMTP id 2adb3069b0e04-558fa8fac64mr1345130e87.37.1752082266593;
        Wed, 09 Jul 2025 10:31:06 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:06 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 01/20] librdkafka: Upgrade 1.8.2 -> 2.11.0 to allow CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:35 +0300
Message-ID: <20250709173054.605430-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118355

- Dropped patch because fixed in the newer version.
- The LICENSE file has changed so updated LIC_FILES_CHKSUM to match the new md5sum.
- curl is needed as a dependency, so add it to prevent build error.

Changelog:

https://github.com/confluentinc/librdkafka/blob/v2.11.0/CHANGELOG.md

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch | 30 -------------------
 ...brdkafka_1.8.2.bb => librdkafka_2.11.0.bb} | 11 +++----
 2 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
 rename meta-oe/recipes-support/librdkafka/{librdkafka_1.8.2.bb => librdkafka_2.11.0.bb} (66%)

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch b/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
deleted file mode 100644
index 053a4cc2d8..0000000000
--- a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ed1dd35e0e23a98e57567718a0d474fd29cc348a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 19 Mar 2022 21:36:41 -0700
-Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR
-
-this ensures that it is portable across platforms e.g. ppc64/linux
-uses lib64 not lib
-
-Upstream-Status: Submitted [https://github.com/edenhill/librdkafka/pull/3770]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d1129bce..774473fa 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -219,7 +219,7 @@ configure_file("packaging/cmake/config.h.in" "${GENERATED_DIR}/config.h")
- 
- include(GNUInstallDirs)
- 
--set(config_install_dir "lib/cmake/${PROJECT_NAME}")
-+set(config_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
- 
- set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
- 
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb b/meta-oe/recipes-support/librdkafka/librdkafka_2.11.0.bb
similarity index 66%
rename from meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
rename to meta-oe/recipes-support/librdkafka/librdkafka_2.11.0.bb
index 968094daff..b1f5196f93 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_2.11.0.bb
@@ -5,18 +5,15 @@ HOMEPAGE = "https://github.com/edenhill/librdkafka"
 SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2be8675acbfdac48935e73897af5f646"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=40b04809b5d6f648f20f45143cbcb1ad"
 
-SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master \
-           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch \
-          "
-SRCREV = "063a9ae7a65cebdf1cc128da9815c05f91a2a996"
+SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master"
+SRCREV = "c56a3e68483ae33622901988ab9c4085f0785c3c"
 
-DEPENDS = "zlib openssl zstd"
+DEPENDS = "zlib openssl zstd curl"
 
 inherit cmake
 
-
 FILES:${PN} += "${datadir}"
 
 EXTRA_OECMAKE += "-DRDKAFKA_BUILD_EXAMPLES=OFF -DRDKAFKA_BUILD_TESTS=OFF"
-- 
2.43.0


