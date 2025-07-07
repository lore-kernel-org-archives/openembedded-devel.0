Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25F4C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 22:54:39 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.5693.1751928871773501985
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 15:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jepdyNRO;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b9eb2299so3829587e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928869; x=1752533669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2febJ7tb0Cvu4gLJ7+OHWLn1oBaZSrc37/f9pIpgl6A=;
        b=jepdyNROnKhsW2efqzWVltf0SWc1v4ZOtxBMBdEXbG4+yt+V5fDa1nI4t1jIFlujbO
         hJKiBTDrfxlYBl8E7gP5TdY7kEc3mBv4op8hNWuhAunkr2aX/CvTTs7ckaz8SypvD8so
         hxJgiKGKp3lXz/ds9jzVm/JdnBghJEqpN7NxhO/YjDGS44anZ+QhyPZrR7SkuI9yBjNh
         Gl1t/XxZQPvSGl4V21QJqH0KfziVsIaSJPTULGTWq5MXcNH2uho1GOnjSTUNGV9kRDnR
         WPBy9K0bsxGJgyL/+sIfNvM29N/jHAmXvel7eCAHVNXQL5/PUNdKlt91jLJgE9Nwtxvw
         oskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928869; x=1752533669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2febJ7tb0Cvu4gLJ7+OHWLn1oBaZSrc37/f9pIpgl6A=;
        b=FVoXOsz87j/6x/f/K7Mjzzju75WBqp/2Ea+zIm7mZ+WXhbqcH2Ct+CnO1INoCbPgjN
         2JgVkKr623qVyt5ru0dkCNwB+o9zeJidwYcwjCi1Ft8XO/VJP0vCDJO76jpQwSgsk+1m
         sFqsaJXfL266uGhJK0CuFFKchhkTUQWC/t9J48OsDMxWNIcImdo50Yaa9uL/+xt7vak/
         WwnofI+gUZIHgVX8wsH7sksyOC3steO++gRdu4tfmnl3GvxiOoCV46+6L/ihYuoKE7AQ
         HLrigWQe7Tzpfb9DmodH3aWwvYfu5zMMajvrn1x854HsQa2i27FiZb+HK3T2xa3QuDfq
         FgMA==
X-Gm-Message-State: AOJu0YxEy0yjgv6uRXZxkNdUqcT0uuYjM5nZMFoIWY++foujQvGGdTiP
	Fb6jRt94RBnMfZXvAR43VSgR95OuLzNwjU+gUgXRBLz44uyuc6FU/nIthYVrBw==
X-Gm-Gg: ASbGncskv/4u6nIE2EA8SZHqHnPXUBWe4k6+z6UYlD+8ERngByfpVFKuNIuvRE7GVux
	ePUCrAZW1WzHBLVReVNbdhsVZcN4ffepxDKwzjahCMTknaZFj4I5P2DZ1ZvPktqYRX2f0aPJi7R
	PrBU4f6ImxraJpLeAZ7ai7/Zlie3L61D7LEEm8vQ4tgShD9ueqH+JntKQYSAq5mdizoURNskeEK
	8q6+Ds1lkhpOFZd9u5+BSGx3Bopi8gz20DBrNKjG1f0IKc5qmr2YWaJYTZhoqF+XZaMi4HgrNOu
	3G21Mop1z0dNCA2XJGTpYxz9QCE5tykb2FY9Aovz7ZspdOZ6RAfEZJ9UGj1YLPk/ghSzonZNY/s
	DmxA=
X-Google-Smtp-Source: AGHT+IEExPD4eSGUwXHRdo3UIN/O0hcjv0YOY0tweOj8TkJilBK0RqQyLSBvsJ+KBvBfGjAb/Ndtig==
X-Received: by 2002:a05:6512:2381:b0:553:2308:1ac5 with SMTP id 2adb3069b0e04-557f8d6a9efmr95200e87.4.1751928869266;
        Mon, 07 Jul 2025 15:54:29 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b836dsm1476347e87.197.2025.07.07.15.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:54:28 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 9/9] json-schema-validator: Upgrade 2.2.0 -> 2.3.0 to allow CMake 4+ compatibility
Date: Tue,  8 Jul 2025 01:54:07 +0300
Message-ID: <20250707225407.1558421-9-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707225407.1558421-1-alperyasinak1@gmail.com>
References: <20250707225407.1558421-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 22:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118297

- Drop patches because all of them fixed in the newer version.

A few explanation for 0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch:

For newer version CMakeLists.txt, this logic is now handled automatically using the PROJECT_IS_TOP_LEVEL variable. The JSON_VALIDATOR_INSTALL option is set to ON only when the project is being built as the top-level project, and it is automatically disabled when included as a dependency.

As a result, the patch is no longer needed and the behavior it intended to provide is already covered by the new build system logic.

Changelog:

- Some bugfixes, but mainly a big re-work of the CMakeLists.txt making it
use and usable for FetchContent-users.

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
 ...or-Install-off-if-it-finds-it-via-li.patch | 29 --------
 .../0002-Fix-assumed-signed-char.patch        | 71 -------------------
 ...003-For-root-value-use-empty-pointer.patch | 41 -----------
 .../0004-cmake-Use-GNUInstallDirs.patch       | 43 -----------
 ....2.0.bb => json-schema-validator_2.3.0.bb} | 12 +---
 5 files changed, 3 insertions(+), 193 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
 delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
 delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
 delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch
 rename meta-oe/recipes-devtools/json-schema-validator/{json-schema-validator_2.2.0.bb => json-schema-validator_2.3.0.bb} (53%)

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
deleted file mode 100644
index 6e6a4b93e8..0000000000
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 35939115142db6cd366ab11b29692a0179338ddf Mon Sep 17 00:00:00 2001
-From: Parian Golchin <Parian.Golchin@iris-sensing.com>
-Date: Fri, 18 Aug 2023 15:54:25 +0200
-Subject: [PATCH 1/3] Set Json_validator Install off if it finds it via linking
-
-Upstream-Status: Inappropriate [newer version of cmake in main branch]
-
-Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
----
- CMakeLists.txt | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f636734..9e4587f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -55,6 +55,9 @@ option(JSON_VALIDATOR_BUILD_EXAMPLES "Build examples" ${JSON_VALIDATOR_IS_TOP_LE
- 
- if(NOT TARGET nlohmann_json::nlohmann_json)
-     find_package(nlohmann_json REQUIRED)
-+else()
-+    message(STATUS "Found nlohmann_json::nlohmann_json-target - linking with it")
-+    set(JSON_VALIDATOR_INSTALL OFF)
- endif()
- 
- target_link_libraries(
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
deleted file mode 100644
index 1c4b871bb6..0000000000
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 2065015da40cf79dd8ec9e3f186538e17c3b592f Mon Sep 17 00:00:00 2001
-From: Robert Joslyn <robert.joslyn@redrectangle.org>
-Date: Wed, 30 Nov 2022 13:07:29 -0800
-Subject: [PATCH 2/3] Fix assumed signed char
-
-The code assumes that char is signed, but whether char is signed or
-unsigned is implementation defined. On some architectures like PowerPC,
-GCC treats char as unsigned resulting in compile errors:
-
-	smtp-address-validator.cpp:213:1: error: narrowing conversion of '-32' from 'int' to 'char' [-Wnarrowing]
-
-Fix this by specifying signed char.
-
-Upstream-Status: Backport [https://github.com/pboettch/json-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]
-
-Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
----
- src/smtp-address-validator.cpp | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/smtp-address-validator.cpp b/src/smtp-address-validator.cpp
-index a63ead0..3903b51 100644
---- a/src/smtp-address-validator.cpp
-+++ b/src/smtp-address-validator.cpp
-@@ -63,7 +63,7 @@ static const short _address_key_offsets[] = {
- 	1363, 1365, 1367, 1368, 1370, 1388, 0
- };
- 
--static const char _address_trans_keys[] = {
-+static const signed char _address_trans_keys[] = {
- 	-32, -19, -16, -12, 34, 45, 61, 63,
- 	-62, -33, -31, -17, -15, -13, 33, 39,
- 	42, 43, 47, 57, 65, 90, 94, 126,
-@@ -711,7 +711,7 @@ bool is_address(const char* p, const char* pe)
- 	{
- 		int _klen;
- 		unsigned int _trans = 0;
--		const char * _keys;
-+		const signed char * _keys;
- 		const signed char * _acts;
- 		unsigned int _nacts;
- 		_resume: {}
-@@ -728,9 +728,9 @@ bool is_address(const char* p, const char* pe)
- 			
- 			_klen = (int)_address_single_lengths[cs];
- 			if ( _klen > 0 ) {
--				const char *_lower = _keys;
--				const char *_upper = _keys + _klen - 1;
--				const char *_mid;
-+				const signed char *_lower = _keys;
-+				const signed char *_upper = _keys + _klen - 1;
-+				const signed char *_mid;
- 				while ( 1 ) {
- 					if ( _upper < _lower ) {
- 						_keys += _klen;
-@@ -752,9 +752,9 @@ bool is_address(const char* p, const char* pe)
- 			
- 			_klen = (int)_address_range_lengths[cs];
- 			if ( _klen > 0 ) {
--				const char *_lower = _keys;
--				const char *_upper = _keys + (_klen<<1) - 2;
--				const char *_mid;
-+				const signed char *_lower = _keys;
-+				const signed char *_upper = _keys + (_klen<<1) - 2;
-+				const signed char *_mid;
- 				while ( 1 ) {
- 					if ( _upper < _lower ) {
- 						_trans += (unsigned int)_klen;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
deleted file mode 100644
index eac997ae58..0000000000
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From fa49c29942763285c51b7d2dea417d9f51e4961f Mon Sep 17 00:00:00 2001
-From: Sven Fink <sven.fink@wipotec.com>
-Date: Fri, 13 Jan 2023 09:15:42 +0100
-Subject: [PATCH 3/3] For root value, use empty pointer
-
-Upstream-Status: Backport [https://github.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]
-
-Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
----
- src/json-validator.cpp | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/json-validator.cpp b/src/json-validator.cpp
-index 7f34553..3c73d98 100644
---- a/src/json-validator.cpp
-+++ b/src/json-validator.cpp
-@@ -553,6 +553,9 @@ class type_schema : public schema
- 					else_->validate(ptr, instance, patch, e);
- 			}
- 		}
-+		if (instance.is_null()) {
-+			patch.add(nlohmann::json::json_pointer{}, default_value_);
-+		}
- 	}
- 
- protected:
-@@ -1134,6 +1137,11 @@ public:
- 			propertyNames_ = schema::make(attr.value(), root, {"propertyNames"}, uris);
- 			sch.erase(attr);
- 		}
-+
-+		attr = sch.find("default");
-+		if (attr != sch.end()) {
-+			set_default_value(*attr);
-+		}
- 	}
- };
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch
deleted file mode 100644
index 8199e4f8d4..0000000000
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a42d374aa260caec5f683c75d0db322811e51ab9 Mon Sep 17 00:00:00 2001
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
-index 9e4587f..3eff234 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -93,11 +93,13 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
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
-@@ -129,7 +131,7 @@ endif()
- 
- if(JSON_VALIDATOR_INSTALL)
-     # Set the install path to the cmake config files (Relative, so install works correctly under Hunter as well)
--    set(INSTALL_CMAKE_DIR "lib/cmake/${PROJECT_NAME}")
-+    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
-     set(INSTALL_CMAKEDIR_ROOT share/cmake)
- 
-     # Install Targets
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.3.0.bb
similarity index 53%
rename from meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
rename to meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.3.0.bb
index c6e910a137..4561f1b285 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.3.0.bb
@@ -2,19 +2,13 @@ SUMMARY = "JSON schema validator for JSON for Modern C++"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
 
-SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=https \
-           file://0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch \
-           file://0002-Fix-assumed-signed-char.patch \
-           file://0003-For-root-value-use-empty-pointer.patch \
-           file://0004-cmake-Use-GNUInstallDirs.patch \
-           "
-
-SRCREV = "6b17782d6a5d1dee5d2c4fc5d25ffb1123913431"
-
+SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=https"
+SRCREV = "349cba9f7e3cb423bbc1811bdd9f6770f520b468"
 
 DEPENDS += "nlohmann-json"
 
 inherit cmake
+
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DJSON_VALIDATOR_BUILD_TESTS=OFF -DJSON_VALIDATOR_BUILD_EXAMPLES=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


