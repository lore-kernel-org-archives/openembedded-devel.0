Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42DDCA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 19:04:50 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.3020.1757012683953319569
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 12:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=inNJFl34;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b04271cfc3eso178041066b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 12:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757012682; x=1757617482; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KLaNs8YPHUIMIAyV/NBOt52R2+0pjn09wFsMIJqyz30=;
        b=inNJFl34gQv7f2qyPTVgLJ+I69o//JCmspFRNhvWCizo3pI6dbpNCiFLYoz/OYIwCL
         +YGv0R/97FLikWnkp4aYxRvPhEHV4O4JYJW1nDjsDqMzn2kC+qE9C4Z3VC3hGhNh6sXE
         zL3z/48hafQHw6ApTxIAi+HMMHUl80Bkl1gEiLM/5XxVZ4iJk8dOpIR2hQPrAM2mj3a9
         njDhJ5oqfKUC92UyF4mVztCQNxISTqDz/kpzv2lYGSRzr8yWNymn+ynD+VSB6Fd0aeai
         /EwBNfo1Ynl8vU6JaNZ79L4JQLl2SAtgSnUm3x0SuOElIvmMoy8r16oUMwJ1Y0aPvWnY
         pLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012682; x=1757617482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLaNs8YPHUIMIAyV/NBOt52R2+0pjn09wFsMIJqyz30=;
        b=TmKx9oVDpvi7jSyES8lmCkkZojLZPIxKCgymPocBitwbL3rHEjpMfH8of1FNx/XqXh
         kQLz61nrxwifwIIveMIka5lC4yMee+C+FAbf3gtke4w4hT+JEsJFQGtF+dnDzeh2nQl8
         PXh5i/5Mc1chnxMk55CVDcBNhiVZzX76rkaRjpGqs8H4JuOQBBwWQRvildyJAJYLySri
         OcEtgfhp/kwkZFJfLfapx40sn40L2cjeDhXHv2NbiehIDkuWHidIi7FVnOsOsGW4FoSA
         EvdolmNMtJrz9wZwfHaBGcCeWo2yEAFdWpVL8gyoqpfqc7LPFuiLXM2MtfcAdyPmg7LL
         hnWg==
X-Forwarded-Encrypted: i=1; AJvYcCXaO/cFhxxP2iLP8VkrXHG0IZguiZd1DpF7hDn9R9QmC5bZU00P6hz7qnBLsLwYp9GSf8OW0JlM34OWtdlppAbV1xs=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRf6WbW7iJeVIlovpNZb4o8pYE+PGkOh7OC2/fM7A363dEHx5M
	jL4HPgKzj+0OPVjxPdg8MPZY1T7gLdxG+/2HL58fM74Es7GGlC3Bnb8A
X-Gm-Gg: ASbGncugI0u/N92GvrjvwuuWTXx8hFamGKiYT9Ik6WOh3LrQ/e47WAyPW8xd58ykHBO
	cPZMc5KwfnLm0Eb20HyaZaYhWdnH8oslHkJ9FAbYX8D6BQIDAOWILfqv+CM6R+QS7uxx3Gjjdc8
	0cjQi+tVPB1M6/pJdbzd/8TVzzPbiBwocJlHn6FwhIDl9ewOblOWO2swNuE3Z0ZC2Xsja6AqsgX
	2Kqc50He8Od8bE/kyBprl8ociiHmvfkvkLF7TSg9ZcsfHxVXwy0Mmhb9LeC3bk52mqoRJxZHYv1
	+cYNkdq6cHtTGTi32IDMDP1tA3sKRDsSRgR9d7yNvwCyeRkXjDFYDqgzpLV5KacuZPCv7jC1FSD
	81nwJOGUnuyJeg3Rv91mslcePSOiwYnEk7pjEmfZI3Q==
X-Google-Smtp-Source: AGHT+IFkguBNDpnKrj1iA1PfFFxMgGNX0fpmyCk56nUcgythFBt7/pNBsDhP+WXoJ4ZZiFTpxclgJQ==
X-Received: by 2002:a17:906:dc90:b0:b04:4ba7:4e0d with SMTP id a640c23a62f3a-b044ba75282mr1161815766b.26.1757012682018;
        Thu, 04 Sep 2025 12:04:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b047373afcesm348521066b.57.2025.09.04.12.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 12:04:41 -0700 (PDT)
Message-ID: <10b93aea-92a8-4d0a-a365-0e3215e892ee@gmail.com>
Date: Thu, 4 Sep 2025 21:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] json-schema-validator: backport
 v2.2.0
To: youngseok1.jeong@lge.com, openembedded-devel@lists.openembedded.org
References: <20250818063802.12680-1-youngseok1.jeong@lge.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250818063802.12680-1-youngseok1.jeong@lge.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 19:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119294

This seems to be a proper release, not only a bugfix one - the author
also summarizes as "a while bunch of changes".
I think a targeted patch for the sysroot issue from 
https://lists.openembedded.org/g/openembedded-devel/message/119084 would
be better.

On 8/18/25 08:38, youngseok1.jeong via lists.openembedded.org wrote:
> From: Youngseok Jeong <youngseok1.jeong@lge.com>
>
> The v2.1.0 has issues related sysroot when some recipes DEPENDS it.
> For details, when CMakeList in some recipes has the line like
> find_package(nlohmann_json_schema_validator REQUIRED),
> that issue is occurred.
>
> See error log:
> The imported target "nlohmann_json_schema_validator" references the file
> "/usr/lib/libnlohmann_json_schema_validator.so.2.1.0"
> but this file does not exist.
>
> A patch to fix this sysroot issue exists and was included in v2.2.0:
> https://github.com/pboettch/json-schema-validator/pull/128/commits/63406ef87f23c55d8a03a0ac6e3149a59edf037e
> So backporting the 2.2.0 from scarthgap is better way rather than
> applied that patch to kirkstone.
>
> Signed-off-by: Youngseok Jeong <youngseok1.jeong@lge.com>
> ---
>  ...or-Install-off-if-it-finds-it-via-li.patch | 29 ++++++++
>  .../0002-Fix-assumed-signed-char.patch        | 71 +++++++++++++++++++
>  ...003-For-root-value-use-empty-pointer.patch | 41 +++++++++++
>  ...ch => 0004-cmake-Use-GNUInstallDirs.patch} | 23 +++---
>  .../json-schema-validator_2.1.0.bb            | 16 -----
>  .../json-schema-validator_2.2.0.bb            | 19 +++++
>  6 files changed, 170 insertions(+), 29 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
>  create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
>  create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
>  rename meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/{0001-cmake-Use-GNUInstallDirs.patch => 0004-cmake-Use-GNUInstallDirs.patch} (60%)
>  delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
>  create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
>
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
> new file mode 100644
> index 0000000000..6e6a4b93e8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
> @@ -0,0 +1,29 @@
> +From 35939115142db6cd366ab11b29692a0179338ddf Mon Sep 17 00:00:00 2001
> +From: Parian Golchin <Parian.Golchin@iris-sensing.com>
> +Date: Fri, 18 Aug 2023 15:54:25 +0200
> +Subject: [PATCH 1/3] Set Json_validator Install off if it finds it via linking
> +
> +Upstream-Status: Inappropriate [newer version of cmake in main branch]
> +
> +Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
> +---
> + CMakeLists.txt | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index f636734..9e4587f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -55,6 +55,9 @@ option(JSON_VALIDATOR_BUILD_EXAMPLES "Build examples" ${JSON_VALIDATOR_IS_TOP_LE
> + 
> + if(NOT TARGET nlohmann_json::nlohmann_json)
> +     find_package(nlohmann_json REQUIRED)
> ++else()
> ++    message(STATUS "Found nlohmann_json::nlohmann_json-target - linking with it")
> ++    set(JSON_VALIDATOR_INSTALL OFF)
> + endif()
> + 
> + target_link_libraries(
> +-- 
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
> new file mode 100644
> index 0000000000..1c4b871bb6
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
> @@ -0,0 +1,71 @@
> +From 2065015da40cf79dd8ec9e3f186538e17c3b592f Mon Sep 17 00:00:00 2001
> +From: Robert Joslyn <robert.joslyn@redrectangle.org>
> +Date: Wed, 30 Nov 2022 13:07:29 -0800
> +Subject: [PATCH 2/3] Fix assumed signed char
> +
> +The code assumes that char is signed, but whether char is signed or
> +unsigned is implementation defined. On some architectures like PowerPC,
> +GCC treats char as unsigned resulting in compile errors:
> +
> +	smtp-address-validator.cpp:213:1: error: narrowing conversion of '-32' from 'int' to 'char' [-Wnarrowing]
> +
> +Fix this by specifying signed char.
> +
> +Upstream-Status: Backport [https://github.com/pboettch/json-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]
> +
> +Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
> +---
> + src/smtp-address-validator.cpp | 16 ++++++++--------
> + 1 file changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/smtp-address-validator.cpp b/src/smtp-address-validator.cpp
> +index a63ead0..3903b51 100644
> +--- a/src/smtp-address-validator.cpp
> ++++ b/src/smtp-address-validator.cpp
> +@@ -63,7 +63,7 @@ static const short _address_key_offsets[] = {
> + 	1363, 1365, 1367, 1368, 1370, 1388, 0
> + };
> + 
> +-static const char _address_trans_keys[] = {
> ++static const signed char _address_trans_keys[] = {
> + 	-32, -19, -16, -12, 34, 45, 61, 63,
> + 	-62, -33, -31, -17, -15, -13, 33, 39,
> + 	42, 43, 47, 57, 65, 90, 94, 126,
> +@@ -711,7 +711,7 @@ bool is_address(const char* p, const char* pe)
> + 	{
> + 		int _klen;
> + 		unsigned int _trans = 0;
> +-		const char * _keys;
> ++		const signed char * _keys;
> + 		const signed char * _acts;
> + 		unsigned int _nacts;
> + 		_resume: {}
> +@@ -728,9 +728,9 @@ bool is_address(const char* p, const char* pe)
> + 			
> + 			_klen = (int)_address_single_lengths[cs];
> + 			if ( _klen > 0 ) {
> +-				const char *_lower = _keys;
> +-				const char *_upper = _keys + _klen - 1;
> +-				const char *_mid;
> ++				const signed char *_lower = _keys;
> ++				const signed char *_upper = _keys + _klen - 1;
> ++				const signed char *_mid;
> + 				while ( 1 ) {
> + 					if ( _upper < _lower ) {
> + 						_keys += _klen;
> +@@ -752,9 +752,9 @@ bool is_address(const char* p, const char* pe)
> + 			
> + 			_klen = (int)_address_range_lengths[cs];
> + 			if ( _klen > 0 ) {
> +-				const char *_lower = _keys;
> +-				const char *_upper = _keys + (_klen<<1) - 2;
> +-				const char *_mid;
> ++				const signed char *_lower = _keys;
> ++				const signed char *_upper = _keys + (_klen<<1) - 2;
> ++				const signed char *_mid;
> + 				while ( 1 ) {
> + 					if ( _upper < _lower ) {
> + 						_trans += (unsigned int)_klen;
> +-- 
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
> new file mode 100644
> index 0000000000..eac997ae58
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
> @@ -0,0 +1,41 @@
> +From fa49c29942763285c51b7d2dea417d9f51e4961f Mon Sep 17 00:00:00 2001
> +From: Sven Fink <sven.fink@wipotec.com>
> +Date: Fri, 13 Jan 2023 09:15:42 +0100
> +Subject: [PATCH 3/3] For root value, use empty pointer
> +
> +Upstream-Status: Backport [https://github.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]
> +
> +Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
> +---
> + src/json-validator.cpp | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/json-validator.cpp b/src/json-validator.cpp
> +index 7f34553..3c73d98 100644
> +--- a/src/json-validator.cpp
> ++++ b/src/json-validator.cpp
> +@@ -553,6 +553,9 @@ class type_schema : public schema
> + 					else_->validate(ptr, instance, patch, e);
> + 			}
> + 		}
> ++		if (instance.is_null()) {
> ++			patch.add(nlohmann::json::json_pointer{}, default_value_);
> ++		}
> + 	}
> + 
> + protected:
> +@@ -1134,6 +1137,11 @@ public:
> + 			propertyNames_ = schema::make(attr.value(), root, {"propertyNames"}, uris);
> + 			sch.erase(attr);
> + 		}
> ++
> ++		attr = sch.find("default");
> ++		if (attr != sch.end()) {
> ++			set_default_value(*attr);
> ++		}
> + 	}
> + };
> + 
> +-- 
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch
> similarity index 60%
> rename from meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch
> rename to meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch
> index 4b1184a394..8199e4f8d4 100644
> --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patch
> @@ -1,4 +1,4 @@
> -From e0b1ad02c678513412aba95a1b2fb4005c3c0452 Mon Sep 17 00:00:00 2001
> +From a42d374aa260caec5f683c75d0db322811e51ab9 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 19 Mar 2022 22:40:49 -0700
>  Subject: [PATCH] cmake: Use GNUInstallDirs
> @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 5 insertions(+), 3 deletions(-)
>  
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index c4cc218..594dc5f 100644
> +index 9e4587f..3eff234 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -122,11 +122,13 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
> +@@ -93,11 +93,13 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
>       endif()
>   endif()
>   
> @@ -32,15 +32,12 @@ index c4cc218..594dc5f 100644
>               RUNTIME DESTINATION bin)
>   
>       install(FILES src/nlohmann/json-schema.hpp
> -@@ -155,7 +157,7 @@ if(JSON_VALIDATOR_INSTALL)
> -     # Set Up the Project Targets and Config Files for CMake
> +@@ -129,7 +131,7 @@ endif()
>   
> -     # Set the install path to the cmake config files
> --    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_PREFIX}/lib/cmake/${PROJECT_NAME})
> -+    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
> + if(JSON_VALIDATOR_INSTALL)
> +     # Set the install path to the cmake config files (Relative, so install works correctly under Hunter as well)
> +-    set(INSTALL_CMAKE_DIR "lib/cmake/${PROJECT_NAME}")
> ++    set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
> +     set(INSTALL_CMAKEDIR_ROOT share/cmake)
>   
> -     # Create the ConfigVersion file
> -     include(CMakePackageConfigHelpers) # write_basic_package_version_file
> --- 
> -2.35.1
> -
> +     # Install Targets
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
> deleted file mode 100644
> index 00d26d7b34..0000000000
> --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "JSON schema validator for JSON for Modern C++"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
> -
> -SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=master;protocol=https \
> -           file://0001-cmake-Use-GNUInstallDirs.patch \
> -          "
> -SRCREV = "27fc1d094503623dfe39365ba82581507524545c"
> -
> -S = "${WORKDIR}/git"
> -
> -DEPENDS += "nlohmann-json"
> -
> -inherit cmake
> -EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF"
> -
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
> new file mode 100644
> index 0000000000..02dcdb2696
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "JSON schema validator for JSON for Modern C++"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
> +
> +SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=https \
> +           file://0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch \
> +           file://0002-Fix-assumed-signed-char.patch \
> +           file://0003-For-root-value-use-empty-pointer.patch \
> +           file://0004-cmake-Use-GNUInstallDirs.patch \
> +           "
> +
> +SRCREV = "6b17782d6a5d1dee5d2c4fc5d25ffb1123913431"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "nlohmann-json"
> +
> +inherit cmake
> +EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DJSON_VALIDATOR_BUILD_TESTS=OFF -DJSON_VALIDATOR_BUILD_EXAMPLES=OFF"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118991): https://lists.openembedded.org/g/openembedded-devel/message/118991
> Mute This Topic: https://lists.openembedded.org/mt/114759438/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


