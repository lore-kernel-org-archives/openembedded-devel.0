Return-Path: <par.golchin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D16DEE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 18:03:45 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.3161.1692727418998708171
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 11:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=o35Lm9Il;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: par.golchin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so6023663a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 11:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692727417; x=1693332217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YElQm4DmxFlG3CvRUL8Dllm/4KsEdSOlX0OVqousFYI=;
        b=o35Lm9IlXwJGjtmZ/21l/fsh1h9xqN0c8ypEmeF3ccrh72dLze39YqvtRqsQD+2omV
         VPcXagt/ExkB0g/bE9nhmeogdfddRSbh/x7ZI5OGN0mz1JFjPeGjCyz4bf0xPfwtMgf9
         i7JN5CXH589kwDfNVbzpKNnT+WfSemNX9ijLFsxtA75b2qj5uwNoiOKnLI9MPkmvtdTs
         2nz6xkSi8mXzxaUDIFEL2logpuQJKjMxZ7+PiNSaH7QOUeT/3WKyE3BvQXtNvpIxJl81
         ogjkNKEi1u2WveWDU10baF3GYQkRauy9hx90K6ghQbT9UOq+MS4LyEtEwP0snpIe5J9l
         VkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692727417; x=1693332217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YElQm4DmxFlG3CvRUL8Dllm/4KsEdSOlX0OVqousFYI=;
        b=khW7L55GhC8YKSNaIuhUULAzwTw0J8haxmWdaylFg6Lri7yZORSnI6h+9AWZXivf2F
         LquB1xV3eGqTsM4f67fU4PB0wzpOihMbOzndzfWkqpW6Vd91ckZhlk5Nf+vRpmIJGUw+
         Tj0Hh9w5QsxV/yFyW0IAjl7LhzURwJkbDpAshru36abcGPP5kUo20oOuM7SiDC5ZUknG
         SC4Ul0zU8K+irg8geNIEfi2JDMYwIBZiY5gxBlDdw+n2tLZR0lEsIMdwR+Ie5VfEeRDv
         /uTYCz6xenqi2WLOiGpx8tIoY2C9mdKipWm62EHt7miUr1aX8WhPKi8jUSAqcehZBcJW
         xwtw==
X-Gm-Message-State: AOJu0YzQM2xhl+nlqBiHYJrgSuyU6ZUVezjyvSe9ncNgyZ32/DtL1TtF
	hx3wjMj0LoiFRRbBBB2NDWIQSQwj3IxvEA==
X-Google-Smtp-Source: AGHT+IGvfPKkwIVL1kwzx1sp4YUVJ+7OJjGenRJiRBgB+Dn9fMKySTO1UimLrv3sz1oEgOxnfuu+kg==
X-Received: by 2002:a50:ee82:0:b0:527:251e:1be7 with SMTP id f2-20020a50ee82000000b00527251e1be7mr7959557edr.11.1692727416681;
        Tue, 22 Aug 2023 11:03:36 -0700 (PDT)
Received: from parian-ThinkPad-E580.. ([2a02:3038:2e0:5ff7:63ac:7477:bae6:7cb])
        by smtp.gmail.com with ESMTPSA id x12-20020aa7cd8c000000b0052595b17fd4sm7946438edv.26.2023.08.22.11.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 11:03:36 -0700 (PDT)
From: Parian Golchin <par.golchin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Parian Golchin <par.golchin@gmail.com>
Subject: [meta-oe][PATCH] json-schema-validator: Updrade to 2.2.0
Date: Tue, 22 Aug 2023 20:03:28 +0200
Message-Id: <20230822180328.64197-1-par.golchin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 18:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104520

Upgrade and add important patches to the release

Signed-off-by: Parian Golchin <par.golchin@gmail.com>
---
 ...or-Install-off-if-it-finds-it-via-li.patch | 29 ++++++++
 .../0001-cmake-Use-GNUInstallDirs.patch       | 46 ------------
 .../0002-Fix-assumed-signed-char.patch        | 71 +++++++++++++++++++
 ...003-For-root-value-use-empty-pointer.patch | 41 +++++++++++
 .../json-schema-validator_2.1.0.bb            | 16 -----
 .../json-schema-validator_2.2.0.bb            | 18 +++++
 6 files changed, 159 insertions(+), 62 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
 delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch
 create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
 create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
 delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
 create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
new file mode 100644
index 000000000..6e6a4b93e
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
@@ -0,0 +1,29 @@
+From 35939115142db6cd366ab11b29692a0179338ddf Mon Sep 17 00:00:00 2001
+From: Parian Golchin <Parian.Golchin@iris-sensing.com>
+Date: Fri, 18 Aug 2023 15:54:25 +0200
+Subject: [PATCH 1/3] Set Json_validator Install off if it finds it via linking
+
+Upstream-Status: Inappropriate [newer version of cmake in main branch]
+
+Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
+---
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f636734..9e4587f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -55,6 +55,9 @@ option(JSON_VALIDATOR_BUILD_EXAMPLES "Build examples" ${JSON_VALIDATOR_IS_TOP_LE
+ 
+ if(NOT TARGET nlohmann_json::nlohmann_json)
+     find_package(nlohmann_json REQUIRED)
++else()
++    message(STATUS "Found nlohmann_json::nlohmann_json-target - linking with it")
++    set(JSON_VALIDATOR_INSTALL OFF)
+ endif()
+ 
+ target_link_libraries(
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch
deleted file mode 100644
index 4b1184a39..000000000
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e0b1ad02c678513412aba95a1b2fb4005c3c0452 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 19 Mar 2022 22:40:49 -0700
-Subject: [PATCH] cmake: Use GNUInstallDirs
-
-This helps it make it platform independent, some platforms e.g.
-ppc64/linux use /usr/lib64 for system libraries
-
-Upstream-Status: Submitted [https://github.com/pboettch/json-schema-validator/pull/197]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c4cc218..594dc5f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -122,11 +122,13 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
-     endif()
- endif()
- 
-+include(GNUInstallDirs)
-+
- if(JSON_VALIDATOR_INSTALL)
-     install(TARGETS nlohmann_json_schema_validator
-             EXPORT ${PROJECT_NAME}Targets
--            LIBRARY DESTINATION lib
--            ARCHIVE DESTINATION lib
-+            LIBRARY DESTINATION ${LIBDIR}
-+            ARCHIVE DESTINATION ${LIBDIR}
-             RUNTIME DESTINATION bin)
- 
-     install(FILES src/nlohmann/json-schema.hpp
-@@ -155,7 +157,7 @@ if(JSON_VALIDATOR_INSTALL)
-     # Set Up the Project Targets and Config Files for CMake
- 
-     # Set the install path to the cmake config files
--    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_PREFIX}/lib/cmake/${PROJECT_NAME})
-+    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
- 
-     # Create the ConfigVersion file
-     include(CMakePackageConfigHelpers) # write_basic_package_version_file
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
new file mode 100644
index 000000000..2ee0a3912
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
@@ -0,0 +1,71 @@
+From 2065015da40cf79dd8ec9e3f186538e17c3b592f Mon Sep 17 00:00:00 2001
+From: Robert Joslyn <robert.joslyn@redrectangle.org>
+Date: Wed, 30 Nov 2022 13:07:29 -0800
+Subject: [PATCH 2/3] Fix assumed signed char
+
+The code assumes that char is signed, but whether char is signed or
+unsigned is implementation defined. On some architectures like PowerPC,
+GCC treats char as unsigned resulting in compile errors:
+
+	smtp-address-validator.cpp:213:1: error: narrowing conversion of '-32' from 'int' to 'char' [-Wnarrowing]
+
+Fix this by specifying signed char.
+
+Upstream-Status: Accepted [https://github.com/pboettch/json-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]
+
+Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
+---
+ src/smtp-address-validator.cpp | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/smtp-address-validator.cpp b/src/smtp-address-validator.cpp
+index a63ead0..3903b51 100644
+--- a/src/smtp-address-validator.cpp
++++ b/src/smtp-address-validator.cpp
+@@ -63,7 +63,7 @@ static const short _address_key_offsets[] = {
+ 	1363, 1365, 1367, 1368, 1370, 1388, 0
+ };
+ 
+-static const char _address_trans_keys[] = {
++static const signed char _address_trans_keys[] = {
+ 	-32, -19, -16, -12, 34, 45, 61, 63,
+ 	-62, -33, -31, -17, -15, -13, 33, 39,
+ 	42, 43, 47, 57, 65, 90, 94, 126,
+@@ -711,7 +711,7 @@ bool is_address(const char* p, const char* pe)
+ 	{
+ 		int _klen;
+ 		unsigned int _trans = 0;
+-		const char * _keys;
++		const signed char * _keys;
+ 		const signed char * _acts;
+ 		unsigned int _nacts;
+ 		_resume: {}
+@@ -728,9 +728,9 @@ bool is_address(const char* p, const char* pe)
+ 			
+ 			_klen = (int)_address_single_lengths[cs];
+ 			if ( _klen > 0 ) {
+-				const char *_lower = _keys;
+-				const char *_upper = _keys + _klen - 1;
+-				const char *_mid;
++				const signed char *_lower = _keys;
++				const signed char *_upper = _keys + _klen - 1;
++				const signed char *_mid;
+ 				while ( 1 ) {
+ 					if ( _upper < _lower ) {
+ 						_keys += _klen;
+@@ -752,9 +752,9 @@ bool is_address(const char* p, const char* pe)
+ 			
+ 			_klen = (int)_address_range_lengths[cs];
+ 			if ( _klen > 0 ) {
+-				const char *_lower = _keys;
+-				const char *_upper = _keys + (_klen<<1) - 2;
+-				const char *_mid;
++				const signed char *_lower = _keys;
++				const signed char *_upper = _keys + (_klen<<1) - 2;
++				const signed char *_mid;
+ 				while ( 1 ) {
+ 					if ( _upper < _lower ) {
+ 						_trans += (unsigned int)_klen;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
new file mode 100644
index 000000000..e0d0cf8ce
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
@@ -0,0 +1,41 @@
+From fa49c29942763285c51b7d2dea417d9f51e4961f Mon Sep 17 00:00:00 2001
+From: Sven Fink <sven.fink@wipotec.com>
+Date: Fri, 13 Jan 2023 09:15:42 +0100
+Subject: [PATCH 3/3] For root value, use empty pointer
+
+Upstream-Status: Accepted [https://github.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]
+
+Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
+---
+ src/json-validator.cpp | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/json-validator.cpp b/src/json-validator.cpp
+index 7f34553..3c73d98 100644
+--- a/src/json-validator.cpp
++++ b/src/json-validator.cpp
+@@ -553,6 +553,9 @@ class type_schema : public schema
+ 					else_->validate(ptr, instance, patch, e);
+ 			}
+ 		}
++		if (instance.is_null()) {
++			patch.add(nlohmann::json::json_pointer{}, default_value_);
++		}
+ 	}
+ 
+ protected:
+@@ -1134,6 +1137,11 @@ public:
+ 			propertyNames_ = schema::make(attr.value(), root, {"propertyNames"}, uris);
+ 			sch.erase(attr);
+ 		}
++
++		attr = sch.find("default");
++		if (attr != sch.end()) {
++			set_default_value(*attr);
++		}
+ 	}
+ };
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
deleted file mode 100644
index 00d26d7b3..000000000
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "JSON schema validator for JSON for Modern C++"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
-
-SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=master;protocol=https \
-           file://0001-cmake-Use-GNUInstallDirs.patch \
-          "
-SRCREV = "27fc1d094503623dfe39365ba82581507524545c"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "nlohmann-json"
-
-inherit cmake
-EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF"
-
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
new file mode 100644
index 000000000..6f0b42402
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "JSON schema validator for JSON for Modern C++"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
+
+SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=https \
+           file://0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch \
+           file://0002-Fix-assumed-signed-char.patch \
+           file://0003-For-root-value-use-empty-pointer.patch \
+           "
+
+SRCREV = "6b17782d6a5d1dee5d2c4fc5d25ffb1123913431"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "nlohmann-json"
+
+inherit cmake
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DJSON_VALIDATOR_BUILD_TESTS=OFF -DJSON_VALIDATOR_BUILD_EXAMPLES=OFF"
-- 
2.34.1


