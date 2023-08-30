Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA30C83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 16:34:23 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.2009.1693413261678724512
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 09:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=N82uuq0u;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-500c7796d8eso33198e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693413260; x=1694018060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KYhK8erjMUwRNJkZwnzpHqTUtI0Vq8JIBVX+wANMcIQ=;
        b=N82uuq0uwjoqPB2pqLI0OaDJFvdjcC8sZCKFuue2L9nlnX0jg0u7caWKlL64lN8RCM
         FPETr4HD6EVoSEIT5PaLovazi9iffygagoNB0smm8kS2SZnvbsFSEvmir2EjuWnIB4wp
         87K8xYgZfgG0g98hT63h1WmorDeM7/BwHXxioteEjXPGakfDbP2ujbMDTFywyWsuuH5y
         cGobZjEncfudsz6ABF1HrIenbok4AZtfv+cDaqCeps32I6mf6r4ge0ve+Kr/0CCGpy/X
         OCmKuIHW8gj8FA6uhChDSqQ5zjeRFkbjdq4NP1e+Q1GBaxr/6GJ+dn1rdNZ2FWdUQzTy
         xvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693413260; x=1694018060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYhK8erjMUwRNJkZwnzpHqTUtI0Vq8JIBVX+wANMcIQ=;
        b=JwDvgGXh7sO2YcoAj4Ng8Dn3j3SF5huxGb+OsCdLHBkSy0nmhCqYxJj7LptpRZIZFY
         JQAKK+qdfCw6Vkb6zYzPDBdW+uVL1QzB1pnJZLq4auQ3hB4AjszUFLY74Z61Cjrr1ihH
         MTh9twljDkeumYVRNPBBi6m9MLOhAzS6XMnabpQ02XDGt9KDcwQNiDNONDkNxfHBOPZl
         QsD5wNJKkGbNGtSN6zxhCJ+6eNznwOhvHfsKfIeGhrfq90oU6VFm9sXZ28po1jWIGlwE
         RRPV6h3r5LLXgYU6nmnjQNrTLtQNNoo4LLAE6e0a4Qr6eseiL4yD3sB/l+dd6hNObZBF
         R1sA==
X-Gm-Message-State: AOJu0YyUef33WOZ8uvIHl+ajY5RVrAouK4hPnneRZ+QBgMBak7uSwwYK
	/47bHIsHi7kbr6Xka+1UaM3809Cqu5g=
X-Google-Smtp-Source: AGHT+IEP/nzRMLbTYk2CkFdU2Usd7uzO33kMajQA5Yf7mZL/F4Ah2QqhhOs8eHs45YoRU9x6Msbmhg==
X-Received: by 2002:a05:6512:a86:b0:4f8:77db:1d9e with SMTP id m6-20020a0565120a8600b004f877db1d9emr2503385lfu.12.1693413259555;
        Wed, 30 Aug 2023 09:34:19 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d20-20020a50fb14000000b005231e3d89efsm6930641edq.31.2023.08.30.09.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:34:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] json-schema-validator: restore 0004-cmake-Use-GNUInstallDirs.patch
Date: Wed, 30 Aug 2023 18:34:03 +0200
Message-ID: <20230830163404.3466695-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 16:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104673

* it was removed in:
  https://git.openembedded.org/meta-openembedded/commit/?id=0697d52777cd530dc59bb05a506327c365bc78a2

* but the patch wasn't applied upstream yet
  and now fails in multilib builds with:
ERROR: lib32-json-schema-validator-2.2.0-r0 do_package: QA Issue: lib32-json-schema-validator: Files/directories were installed but not shipped in any package:
  /usr/lib/libnlohmann_json_schema_validator.so.2
  /usr/lib/libnlohmann_json_schema_validator.so.2.2.0
  /usr/lib/libnlohmann_json_schema_validator.so
  /usr/lib/cmake
  /usr/lib/cmake/nlohmann_json_schema_validator
  /usr/lib/cmake/nlohmann_json_schema_validator/nlohmann_json_schema_validatorConfig.cmake
  /usr/lib/cmake/nlohmann_json_schema_validator/nlohmann_json_schema_validatorConfigVersion.cmake
  /usr/lib/cmake/nlohmann_json_schema_validator/nlohmann_json_schema_validatorTargets.cmake
  /usr/lib/cmake/nlohmann_json_schema_validator/nlohmann_json_schema_validatorTargets-noconfig.cmake
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-json-schema-validator: 9 installed and not shipped files. [installed-vs-shipped]

https://github.com/pboettch/json-schema-validator/pull/197 was closed due to branch rename, but I don't see this change applied in:
https://github.com/pboettch/json-schema-validator/commits/main/CMakeLists.txt
so I guess the .patch is still needed.

* adjust the patch to apply on new version and restore it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0004-cmake-Use-GNUInstallDirs.patch       | 43 +++++++++++++++++++
 .../json-schema-validator_2.2.0.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch
new file mode 100644
index 0000000000..8199e4f8d4
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch
@@ -0,0 +1,43 @@
+From a42d374aa260caec5f683c75d0db322811e51ab9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 19 Mar 2022 22:40:49 -0700
+Subject: [PATCH] cmake: Use GNUInstallDirs
+
+This helps it make it platform independent, some platforms e.g.
+ppc64/linux use /usr/lib64 for system libraries
+
+Upstream-Status: Submitted [https://github.com/pboettch/json-schema-validator/pull/197]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9e4587f..3eff234 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -93,11 +93,13 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
+     endif()
+ endif()
+ 
++include(GNUInstallDirs)
++
+ if(JSON_VALIDATOR_INSTALL)
+     install(TARGETS nlohmann_json_schema_validator
+             EXPORT ${PROJECT_NAME}Targets
+-            LIBRARY DESTINATION lib
+-            ARCHIVE DESTINATION lib
++            LIBRARY DESTINATION ${LIBDIR}
++            ARCHIVE DESTINATION ${LIBDIR}
+             RUNTIME DESTINATION bin)
+ 
+     install(FILES src/nlohmann/json-schema.hpp
+@@ -129,7 +131,7 @@ endif()
+ 
+ if(JSON_VALIDATOR_INSTALL)
+     # Set the install path to the cmake config files (Relative, so install works correctly under Hunter as well)
+-    set(INSTALL_CMAKE_DIR "lib/cmake/${PROJECT_NAME}")
++    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
+     set(INSTALL_CMAKEDIR_ROOT share/cmake)
+ 
+     # Install Targets
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
index 6f0b424024..02dcdb2696 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=
            file://0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch \
            file://0002-Fix-assumed-signed-char.patch \
            file://0003-For-root-value-use-empty-pointer.patch \
+           file://0004-cmake-Use-GNUInstallDirs.patch \
            "
 
 SRCREV = "6b17782d6a5d1dee5d2c4fc5d25ffb1123913431"
-- 
2.42.0


