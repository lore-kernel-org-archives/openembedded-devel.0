Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BEBC433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:23 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.16149.1647763702652366527
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K60htsUp;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so5563799pjo.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vZiapg0IWWN0BOVgFjZ32cX9hOjg+iS0XoQdO10Zz5w=;
        b=K60htsUpmWY1d6heTs5Yyjo5C2+m5kRro9Vkh/dr5l2HxiqAMIXwz48TEoDljNkTCo
         ZFHDGjP/d+B/nWNvT2VPYlN+C2vhfwpj3upriato+f2Z4+nBqsYTkmRvHROyiAsIqzxR
         KcevJdgSLMh97hIEKeZPU2fZbGq9461p47NYdPBzHgO7DmgF5GVz9kX2gWEzfqC+VsfF
         +UUqwayxaNsTzyY03iy7OF0OgRXoVZPUpIBmK9oSgUw79kMfhHVXBiOAMWrEnRhoiMx7
         BFG2Wq5dKL1V3898nbifanjjuaDjpOJj/Z61OK5gSR3ik/g6NNgJ6dRT/jFAW7yr6ATq
         DAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vZiapg0IWWN0BOVgFjZ32cX9hOjg+iS0XoQdO10Zz5w=;
        b=QZgs9mlHy2gcyhSItO8ps0oFCHJt2iSFUsiFd6tmnJcY1OXlDEPkUrEY3FA6GCvHFg
         2AatOkru5lLFutDrgcsMLifWpV7/Oi1BBgKlVeOYZxL0GIuD1nw/4r6DFc7HB0wbys6P
         FIZWvrijAwnZg8iltno4JVH4+BoaOlPk0aZEA6YBhq0Pw1A/ojZ+5N3uUDobrqSqC46R
         xvSskilyM2VsPrXT5vaOnNq0PRazhyorVx7GijOrsP+Tm3Q+EAq2MFhPMP4uJmapRhT/
         AoVygSmiJPaChIfqDe3FMZV82jGcawbs7J/8Geio5zmMt9mmoWF+KCmpxyh5I+D8qKB6
         EUSA==
X-Gm-Message-State: AOAM532AYTfYfuBFkUgzaqolfFZVWAU2zEm5FeSGCpQfwk8NLbf1BWdk
	xigbXJQrpg1fSXHU+IKxz5SYd3iQ5AzXFw==
X-Google-Smtp-Source: 
 ABdhPJz+wie6OaNeypxCb5gg0MonOT6AUqYMsfqFnreOAT7NxpsWWq+hBBt1xvZ6j3j8kxY7WZLUGQ==
X-Received: by 2002:a17:902:cccf:b0:14e:eb44:40a1 with SMTP id
 z15-20020a170902cccf00b0014eeb4440a1mr7374601ple.111.1647763701938;
        Sun, 20 Mar 2022 01:08:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/17] json-schema-validator: Use GNUInstallDirs in
 cmake
Date: Sun, 20 Mar 2022 01:08:05 -0700
Message-Id: <20220320080815.825928-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96071

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-Use-GNUInstallDirs.patch       | 46 +++++++++++++++++++
 .../json-schema-validator_2.1.0.bb            |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch
new file mode 100644
index 0000000000..4b1184a394
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch
@@ -0,0 +1,46 @@
+From e0b1ad02c678513412aba95a1b2fb4005c3c0452 Mon Sep 17 00:00:00 2001
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
+index c4cc218..594dc5f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -122,11 +122,13 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
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
+@@ -155,7 +157,7 @@ if(JSON_VALIDATOR_INSTALL)
+     # Set Up the Project Targets and Config Files for CMake
+ 
+     # Set the install path to the cmake config files
+-    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_PREFIX}/lib/cmake/${PROJECT_NAME})
++    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
+ 
+     # Create the ConfigVersion file
+     include(CMakePackageConfigHelpers) # write_basic_package_version_file
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
index 4a8de5f3b0..00d26d7b34 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
@@ -2,7 +2,9 @@ SUMMARY = "JSON schema validator for JSON for Modern C++"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
 
-SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=master;protocol=https"
+SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=master;protocol=https \
+           file://0001-cmake-Use-GNUInstallDirs.patch \
+          "
 SRCREV = "27fc1d094503623dfe39365ba82581507524545c"
 
 S = "${WORKDIR}/git"
-- 
2.35.1


