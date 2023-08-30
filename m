Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328DBC83F17
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:28:01 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8871.1693380470694769243
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RAU5RIee;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-313e742a787so309677f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 00:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693380469; x=1693985269; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ai4yY7mzjjalmt+qWVN0pKqYiWq/KJ/vC2zOHTMBdaw=;
        b=RAU5RIeevfkmSByWNyBcoN8DVdunmIqKBRU7XeSwYSmT6zY5WKEOQjDmOmRNDM/5SS
         xifQLhO8EvLNNYOAOB125lBCZvPITXjwyoZvT4KgFiu4tNLT5BkfCaPquBVj2BB4UA4n
         +X5L83o3BNZP3K8LQylipoKfCg13zgVIYiUPCR1X7x7gWJ4YJKlNw8ww8//Rd4+bi7JF
         0TFEV9BGmLgOCNe1U0CVk7UHoS1MrLIjxDau0OkCn5zrdJDfb3KV7FqT1gfTTOZ55xnL
         TxbzZ0enL/FrPPPr8RThHXRbigONQHRLlc7rsVszvWEd6TXqIB2+BlwQWM0XQo5TYrSQ
         UBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693380469; x=1693985269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ai4yY7mzjjalmt+qWVN0pKqYiWq/KJ/vC2zOHTMBdaw=;
        b=CEQVko1+DdIshTztK9sTnsibRZZrNEI6hocCWR+Q3NeSwYp8sBRxMof1Q/Pcwhmr6c
         RyyCnZpjVdhfIv6J38qdcM6cgEPmF0oBYBaP2v6xNiao45u1GHDUpf+6YYb4PqbXxtpo
         aVIjAQikEjsk8mTUh49zvbMcZCwECpP+VP+jaKlDSdkFZSvqvlOb7TKUh6ki0CT15VIW
         YCvSTAiDwH5A+tr056OSTlHCzJcvtCxnYXoExewysZNpJIJ2qldvy+lbHZM3+OBC0m09
         GZfiZk7H6WH/7WLVgFvBVZleIou0w/Q+/j/gOlWBvYAi9tBCIlIkrf99cbt/ZxxbHlOQ
         31Vg==
X-Gm-Message-State: AOJu0YxXz1rUQjGa/7drNC+9dH0AoLquQ8+4Zvpgk9mPs3ZofGoiEOqi
	cwRMkdb/K8rRkx46x9gX5P/kD5FYTxHzXb110XY=
X-Google-Smtp-Source: AGHT+IGL4oGCGOwoMu1m0GfDm+7A81NZuVn0uqPGx7isGv33Tro1wW9B8e3OBN8rTRq0PhpjGWwIly+s5Up9H2Vo9w0=
X-Received: by 2002:adf:dc8b:0:b0:317:de66:259b with SMTP id
 r11-20020adfdc8b000000b00317de66259bmr3652968wrj.15.1693380468973; Wed, 30
 Aug 2023 00:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230822180328.64197-1-par.golchin@gmail.com>
In-Reply-To: <20230822180328.64197-1-par.golchin@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 09:27:25 +0200
Message-ID: <CA+chaQdhEoT03kXOeicMJcgS2Vp+Xwf_etjvGCdNWbJ3KVb+Qw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] json-schema-validator: Updrade to 2.2.0
To: Parian Golchin <par.golchin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000052a40f06041edd28"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104652

--00000000000052a40f06041edd28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Was meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
01-cmake-Use-GNUInstallDirs.patch
really merged upstream?

It now fails in multilib builds with:
ERROR: lib32-json-schema-validator-2.2.0-r0 do_package: QA Issue:
lib32-json-schema-validator: Files/directories were installed but not
shipped in any package:
  /usr/lib/libnlohmann_json_schema_validator.so.2
  /usr/lib/libnlohmann_json_schema_validator.so.2.2.0
  /usr/lib/libnlohmann_json_schema_validator.so
  /usr/lib/cmake
  /usr/lib/cmake/nlohmann_json_schema_validator

/usr/lib/cmake/nlohmann_json_schema_validator/nlohmann_json_schema_validato=
rConfig.cmake

/usr/lib/cmake/nlohmann_json_schema_validator/nlohmann_json_schema_validato=
rConfigVersion.cmake

/usr/lib/cmake/nlohmann_json_schema_validator/nlohmann_json_schema_validato=
rTargets.cmake

/usr/lib/cmake/nlohmann_json_schema_validator/nlohmann_json_schema_validato=
rTargets-noconfig.cmake
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
lib32-json-schema-validator: 9 installed and not shipped files.
[installed-vs-shipped]

https://github.com/pboettch/json-schema-validator/pull/197 was closed due
to branch rename, but I don't see this change applied in:
https://github.com/pboettch/json-schema-validator/commits/main/CMakeLists.t=
xt
so I guess the .patch is still needed.

On Tue, Aug 22, 2023 at 8:03=E2=80=AFPM Parian Golchin <par.golchin@gmail.c=
om>
wrote:

> Upgrade and add important patches to the release
>
> Signed-off-by: Parian Golchin <par.golchin@gmail.com>
> ---
>  ...or-Install-off-if-it-finds-it-via-li.patch | 29 ++++++++
>  .../0001-cmake-Use-GNUInstallDirs.patch       | 46 ------------
>  .../0002-Fix-assumed-signed-char.patch        | 71 +++++++++++++++++++
>  ...003-For-root-value-use-empty-pointer.patch | 41 +++++++++++
>  .../json-schema-validator_2.1.0.bb            | 16 -----
>  .../json-schema-validator_2.2.0.bb            | 18 +++++
>  6 files changed, 159 insertions(+), 62 deletions(-)
>  create mode 100644
> meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001=
-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
>  delete mode 100644
> meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001=
-cmake-Use-GNUInstallDirs.patch
>  create mode 100644
> meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002=
-Fix-assumed-signed-char.patch
>  create mode 100644
> meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003=
-For-root-value-use-empty-pointer.patch
>  delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/
> json-schema-validator_2.1.0.bb
>  create mode 100644 meta-oe/recipes-devtools/json-schema-validator/
> json-schema-validator_2.2.0.bb
>
> diff --git
> a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
01-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
01-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
> new file mode 100644
> index 000000000..6e6a4b93e
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
01-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
> @@ -0,0 +1,29 @@
> +From 35939115142db6cd366ab11b29692a0179338ddf Mon Sep 17 00:00:00 2001
> +From: Parian Golchin <Parian.Golchin@iris-sensing.com>
> +Date: Fri, 18 Aug 2023 15:54:25 +0200
> +Subject: [PATCH 1/3] Set Json_validator Install off if it finds it via
> linking
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
> +@@ -55,6 +55,9 @@ option(JSON_VALIDATOR_BUILD_EXAMPLES "Build examples"
> ${JSON_VALIDATOR_IS_TOP_LE
> +
> + if(NOT TARGET nlohmann_json::nlohmann_json)
> +     find_package(nlohmann_json REQUIRED)
> ++else()
> ++    message(STATUS "Found nlohmann_json::nlohmann_json-target - linking
> with it")
> ++    set(JSON_VALIDATOR_INSTALL OFF)
> + endif()
> +
> + target_link_libraries(
> +--
> +2.25.1
> +
> diff --git
> a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
01-cmake-Use-GNUInstallDirs.patch
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
01-cmake-Use-GNUInstallDirs.patch
> deleted file mode 100644
> index 4b1184a39..000000000
> ---
> a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
01-cmake-Use-GNUInstallDirs.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From e0b1ad02c678513412aba95a1b2fb4005c3c0452 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 19 Mar 2022 22:40:49 -0700
> -Subject: [PATCH] cmake: Use GNUInstallDirs
> -
> -This helps it make it platform independent, some platforms e.g.
> -ppc64/linux use /usr/lib64 for system libraries
> -
> -Upstream-Status: Submitted [
> https://github.com/pboettch/json-schema-validator/pull/197]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - CMakeLists.txt | 8 +++++---
> - 1 file changed, 5 insertions(+), 3 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index c4cc218..594dc5f 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -122,11 +122,13 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
> -     endif()
> - endif()
> -
> -+include(GNUInstallDirs)
> -+
> - if(JSON_VALIDATOR_INSTALL)
> -     install(TARGETS nlohmann_json_schema_validator
> -             EXPORT ${PROJECT_NAME}Targets
> --            LIBRARY DESTINATION lib
> --            ARCHIVE DESTINATION lib
> -+            LIBRARY DESTINATION ${LIBDIR}
> -+            ARCHIVE DESTINATION ${LIBDIR}
> -             RUNTIME DESTINATION bin)
> -
> -     install(FILES src/nlohmann/json-schema.hpp
> -@@ -155,7 +157,7 @@ if(JSON_VALIDATOR_INSTALL)
> -     # Set Up the Project Targets and Config Files for CMake
> -
> -     # Set the install path to the cmake config files
> --    set(INSTALL_CMAKE_DIR
> ${CMAKE_INSTALL_PREFIX}/lib/cmake/${PROJECT_NAME})
> -+    set(INSTALL_CMAKE_DIR
> ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
> -
> -     # Create the ConfigVersion file
> -     include(CMakePackageConfigHelpers) # write_basic_package_version_fi=
le
> ---
> -2.35.1
> -
> diff --git
> a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
02-Fix-assumed-signed-char.patch
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
02-Fix-assumed-signed-char.patch
> new file mode 100644
> index 000000000..2ee0a3912
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
02-Fix-assumed-signed-char.patch
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
> +       smtp-address-validator.cpp:213:1: error: narrowing conversion of
> '-32' from 'int' to 'char' [-Wnarrowing]
> +
> +Fix this by specifying signed char.
> +
> +Upstream-Status: Accepted [
> https://github.com/pboettch/json-schema-validator/commit/491ac44026e08f31=
790f5cacffa62e168bb35e32
> ]
> +
> +Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
> +---
> + src/smtp-address-validator.cpp | 16 ++++++++--------
> + 1 file changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/smtp-address-validator.cpp
> b/src/smtp-address-validator.cpp
> +index a63ead0..3903b51 100644
> +--- a/src/smtp-address-validator.cpp
> ++++ b/src/smtp-address-validator.cpp
> +@@ -63,7 +63,7 @@ static const short _address_key_offsets[] =3D {
> +       1363, 1365, 1367, 1368, 1370, 1388, 0
> + };
> +
> +-static const char _address_trans_keys[] =3D {
> ++static const signed char _address_trans_keys[] =3D {
> +       -32, -19, -16, -12, 34, 45, 61, 63,
> +       -62, -33, -31, -17, -15, -13, 33, 39,
> +       42, 43, 47, 57, 65, 90, 94, 126,
> +@@ -711,7 +711,7 @@ bool is_address(const char* p, const char* pe)
> +       {
> +               int _klen;
> +               unsigned int _trans =3D 0;
> +-              const char * _keys;
> ++              const signed char * _keys;
> +               const signed char * _acts;
> +               unsigned int _nacts;
> +               _resume: {}
> +@@ -728,9 +728,9 @@ bool is_address(const char* p, const char* pe)
> +
> +                       _klen =3D (int)_address_single_lengths[cs];
> +                       if ( _klen > 0 ) {
> +-                              const char *_lower =3D _keys;
> +-                              const char *_upper =3D _keys + _klen - 1;
> +-                              const char *_mid;
> ++                              const signed char *_lower =3D _keys;
> ++                              const signed char *_upper =3D _keys + _kl=
en
> - 1;
> ++                              const signed char *_mid;
> +                               while ( 1 ) {
> +                                       if ( _upper < _lower ) {
> +                                               _keys +=3D _klen;
> +@@ -752,9 +752,9 @@ bool is_address(const char* p, const char* pe)
> +
> +                       _klen =3D (int)_address_range_lengths[cs];
> +                       if ( _klen > 0 ) {
> +-                              const char *_lower =3D _keys;
> +-                              const char *_upper =3D _keys + (_klen<<1)=
 -
> 2;
> +-                              const char *_mid;
> ++                              const signed char *_lower =3D _keys;
> ++                              const signed char *_upper =3D _keys +
> (_klen<<1) - 2;
> ++                              const signed char *_mid;
> +                               while ( 1 ) {
> +                                       if ( _upper < _lower ) {
> +                                               _trans +=3D (unsigned
> int)_klen;
> +--
> +2.25.1
> +
> diff --git
> a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
03-For-root-value-use-empty-pointer.patch
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
03-For-root-value-use-empty-pointer.patch
> new file mode 100644
> index 000000000..e0d0cf8ce
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/00=
03-For-root-value-use-empty-pointer.patch
> @@ -0,0 +1,41 @@
> +From fa49c29942763285c51b7d2dea417d9f51e4961f Mon Sep 17 00:00:00 2001
> +From: Sven Fink <sven.fink@wipotec.com>
> +Date: Fri, 13 Jan 2023 09:15:42 +0100
> +Subject: [PATCH 3/3] For root value, use empty pointer
> +
> +Upstream-Status: Accepted [
> https://github.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54=
b4fc717ec1660c91eddb4d1a
> ]
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
> +                                       else_->validate(ptr, instance,
> patch, e);
> +                       }
> +               }
> ++              if (instance.is_null()) {
> ++                      patch.add(nlohmann::json::json_pointer{},
> default_value_);
> ++              }
> +       }
> +
> + protected:
> +@@ -1134,6 +1137,11 @@ public:
> +                       propertyNames_ =3D schema::make(attr.value(), roo=
t,
> {"propertyNames"}, uris);
> +                       sch.erase(attr);
> +               }
> ++
> ++              attr =3D sch.find("default");
> ++              if (attr !=3D sch.end()) {
> ++                      set_default_value(*attr);
> ++              }
> +       }
> + };
> +
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/
> json-schema-validator_2.1.0.bb
> b/meta-oe/recipes-devtools/json-schema-validator/
> json-schema-validator_2.1.0.bb
> deleted file mode 100644
> index 00d26d7b3..000000000
> --- a/meta-oe/recipes-devtools/json-schema-validator/
> json-schema-validator_2.1.0.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY =3D "JSON schema validator for JSON for Modern C++"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc441d022da1b1663c70181a32225d=
006"
> -
> -SRC_URI =3D "git://
> github.com/pboettch/json-schema-validator;branch=3Dmaster;protocol=3Dhttp=
s \
> -           file://0001-cmake-Use-GNUInstallDirs.patch \
> -          "
> -SRCREV =3D "27fc1d094503623dfe39365ba82581507524545c"
> -
> -S =3D "${WORKDIR}/git"
> -
> -DEPENDS +=3D "nlohmann-json"
> -
> -inherit cmake
> -EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DBUILD_EXAMPLES=3DOFF
> -DBUILD_TESTS=3DOFF"
> -
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/
> json-schema-validator_2.2.0.bb
> b/meta-oe/recipes-devtools/json-schema-validator/
> json-schema-validator_2.2.0.bb
> new file mode 100644
> index 000000000..6f0b42402
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/json-schema-validator/
> json-schema-validator_2.2.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "JSON schema validator for JSON for Modern C++"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc441d022da1b1663c70181a32225d=
006"
> +
> +SRC_URI =3D "git://
> github.com/pboettch/json-schema-validator;branch=3Dmain;protocol=3Dhttps =
\
> +
>  file://0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch \
> +           file://0002-Fix-assumed-signed-char.patch \
> +           file://0003-For-root-value-use-empty-pointer.patch \
> +           "
> +
> +SRCREV =3D "6b17782d6a5d1dee5d2c4fc5d25ffb1123913431"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS +=3D "nlohmann-json"
> +
> +inherit cmake
> +EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DJSON_VALIDATOR_BUILD_TESTS=
=3DOFF
> -DJSON_VALIDATOR_BUILD_EXAMPLES=3DOFF"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104520):
> https://lists.openembedded.org/g/openembedded-devel/message/104520
> Mute This Topic: https://lists.openembedded.org/mt/100899596/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000052a40f06041edd28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Was meta-oe/recipes-devtools/json-<span class=3D"gmail-il"=
>schema</span>-<span class=3D"gmail-il">validator</span>/<span class=3D"gma=
il-il">json</span>-<span class=3D"gmail-il">schema</span>-<span class=3D"gm=
ail-il">validator</span>/0001-cmake-Use-GNUInstallDirs.patch really merged =
upstream?<div><br></div><div>It now fails in multilib builds with:</div><di=
v>ERROR: lib32-json-schema-validator-2.2.0-r0 do_package: QA Issue: lib32-j=
son-schema-validator: Files/directories were installed but not shipped in a=
ny package:<br>=C2=A0 /usr/lib/libnlohmann_json_schema_validator.so.2<br>=
=C2=A0 /usr/lib/libnlohmann_json_schema_validator.so.2.2.0 <br>=C2=A0 /usr/=
lib/libnlohmann_json_schema_validator.so <br>=C2=A0 /usr/lib/cmake<br>=C2=
=A0 /usr/lib/cmake/nlohmann_json_schema_validator<br>=C2=A0 /usr/lib/cmake/=
nlohmann_json_schema_validator/nlohmann_json_schema_validatorConfig.cmake<b=
r>=C2=A0 /usr/lib/cmake/nlohmann_json_schema_validator/nlohmann_json_schema=
_validatorConfigVersion.cmake<br>=C2=A0 /usr/lib/cmake/nlohmann_json_schema=
_validator/nlohmann_json_schema_validatorTargets.cmake<br>=C2=A0 /usr/lib/c=
make/nlohmann_json_schema_validator/nlohmann_json_schema_validatorTargets-n=
oconfig.cmake<br>Please set FILES such that these items are packaged. Alter=
natively if they are unneeded, avoid installing them or delete them within =
do_install.<br>lib32-json-schema-validator: 9 installed and not shipped fil=
es. [installed-vs-shipped]<br></div><div><br></div><div><a href=3D"https://=
github.com/pboettch/json-schema-validator/pull/197">https://github.com/pboe=
ttch/json-schema-validator/pull/197</a> was closed due to branch rename, bu=
t I don&#39;t see this change applied in:<br></div><div><a href=3D"https://=
github.com/pboettch/json-schema-validator/commits/main/CMakeLists.txt">http=
s://github.com/pboettch/json-schema-validator/commits/main/CMakeLists.txt</=
a><br></div><div>so I guess the .patch is still needed.</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 22=
, 2023 at 8:03=E2=80=AFPM Parian Golchin &lt;<a href=3D"mailto:par.golchin@=
gmail.com">par.golchin@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Upgrade and add important patches to the r=
elease<br>
<br>
Signed-off-by: Parian Golchin &lt;<a href=3D"mailto:par.golchin@gmail.com" =
target=3D"_blank">par.golchin@gmail.com</a>&gt;<br>
---<br>
=C2=A0...or-Install-off-if-it-finds-it-via-li.patch | 29 ++++++++<br>
=C2=A0.../0001-cmake-Use-GNUInstallDirs.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4=
6 ------------<br>
=C2=A0.../0002-Fix-assumed-signed-char.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7=
1 +++++++++++++++++++<br>
=C2=A0...003-For-root-value-use-empty-pointer.patch | 41 +++++++++++<br>
=C2=A0.../<a href=3D"http://json-schema-validator_2.1.0.bb" rel=3D"noreferr=
er" target=3D"_blank">json-schema-validator_2.1.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 16 -----<br>
=C2=A0.../<a href=3D"http://json-schema-validator_2.2.0.bb" rel=3D"noreferr=
er" target=3D"_blank">json-schema-validator_2.2.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++++<br>
=C2=A06 files changed, 159 insertions(+), 62 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/json-schema-validator/jso=
n-schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-l=
i.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/jso=
n-schema-validator/0001-cmake-Use-GNUInstallDirs.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/json-schema-validator/jso=
n-schema-validator/0002-Fix-assumed-signed-char.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/json-schema-validator/jso=
n-schema-validator/0003-For-root-value-use-empty-pointer.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/<a =
href=3D"http://json-schema-validator_2.1.0.bb" rel=3D"noreferrer" target=3D=
"_blank">json-schema-validator_2.1.0.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/json-schema-validator/<a =
href=3D"http://json-schema-validator_2.2.0.bb" rel=3D"noreferrer" target=3D=
"_blank">json-schema-validator_2.2.0.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-val=
idator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch b/me=
ta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set=
-Json_validator-Install-off-if-it-finds-it-via-li.patch<br>
new file mode 100644<br>
index 000000000..6e6a4b93e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/=
0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch<br>
@@ -0,0 +1,29 @@<br>
+From 35939115142db6cd366ab11b29692a0179338ddf Mon Sep 17 00:00:00 2001<br>
+From: Parian Golchin &lt;<a href=3D"mailto:Parian.Golchin@iris-sensing.com=
" target=3D"_blank">Parian.Golchin@iris-sensing.com</a>&gt;<br>
+Date: Fri, 18 Aug 2023 15:54:25 +0200<br>
+Subject: [PATCH 1/3] Set Json_validator Install off if it finds it via lin=
king<br>
+<br>
+Upstream-Status: Inappropriate [newer version of cmake in main branch]<br>
+<br>
+Signed-off-by: Parian Golchin &lt;<a href=3D"mailto:Parian.Golchin@iris-se=
nsing.com" target=3D"_blank">Parian.Golchin@iris-sensing.com</a>&gt;<br>
+---<br>
+ CMakeLists.txt | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
+index f636734..9e4587f 100644<br>
+--- a/CMakeLists.txt<br>
++++ b/CMakeLists.txt<br>
+@@ -55,6 +55,9 @@ option(JSON_VALIDATOR_BUILD_EXAMPLES &quot;Build example=
s&quot; ${JSON_VALIDATOR_IS_TOP_LE<br>
+ <br>
+ if(NOT TARGET nlohmann_json::nlohmann_json)<br>
+=C2=A0 =C2=A0 =C2=A0find_package(nlohmann_json REQUIRED)<br>
++else()<br>
++=C2=A0 =C2=A0 message(STATUS &quot;Found nlohmann_json::nlohmann_json-tar=
get - linking with it&quot;)<br>
++=C2=A0 =C2=A0 set(JSON_VALIDATOR_INSTALL OFF)<br>
+ endif()<br>
+ <br>
+ target_link_libraries(<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-val=
idator/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-devtools/json-=
schema-validator/json-schema-validator/0001-cmake-Use-GNUInstallDirs.patch<=
br>
deleted file mode 100644<br>
index 4b1184a39..000000000<br>
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/=
0001-cmake-Use-GNUInstallDirs.patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From e0b1ad02c678513412aba95a1b2fb4005c3c0452 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Sat, 19 Mar 2022 22:40:49 -0700<br>
-Subject: [PATCH] cmake: Use GNUInstallDirs<br>
-<br>
-This helps it make it platform independent, some platforms e.g.<br>
-ppc64/linux use /usr/lib64 for system libraries<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/pboettch/json-sc=
hema-validator/pull/197" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/pboettch/json-schema-validator/pull/197</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- CMakeLists.txt | 8 +++++---<br>
- 1 file changed, 5 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index c4cc218..594dc5f 100644<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
-@@ -122,11 +122,13 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL &quot;GNU&quot;)<b=
r>
-=C2=A0 =C2=A0 =C2=A0endif()<br>
- endif()<br>
- <br>
-+include(GNUInstallDirs)<br>
-+<br>
- if(JSON_VALIDATOR_INSTALL)<br>
-=C2=A0 =C2=A0 =C2=A0install(TARGETS nlohmann_json_schema_validator<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXPORT ${PROJECT_NAME}Targ=
ets<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBRARY DESTINATION lib<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARCHIVE DESTINATION lib<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBRARY DESTINATION ${LIBDIR}<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARCHIVE DESTINATION ${LIBDIR}<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION bin)<b=
r>
- <br>
-=C2=A0 =C2=A0 =C2=A0install(FILES src/nlohmann/json-schema.hpp<br>
-@@ -155,7 +157,7 @@ if(JSON_VALIDATOR_INSTALL)<br>
-=C2=A0 =C2=A0 =C2=A0# Set Up the Project Targets and Config Files for CMak=
e<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0# Set the install path to the cmake config files<br>
--=C2=A0 =C2=A0 set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_PREFIX}/lib/cmake/${P=
ROJECT_NAME})<br>
-+=C2=A0 =C2=A0 set(INSTALL_CMAKE_DIR ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTA=
LL_LIBDIR}/cmake/${PROJECT_NAME})<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0# Create the ConfigVersion file<br>
-=C2=A0 =C2=A0 =C2=A0include(CMakePackageConfigHelpers) # write_basic_packa=
ge_version_file<br>
--- <br>
-2.35.1<br>
-<br>
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-val=
idator/0002-Fix-assumed-signed-char.patch b/meta-oe/recipes-devtools/json-s=
chema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch<br=
>
new file mode 100644<br>
index 000000000..2ee0a3912<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/=
0002-Fix-assumed-signed-char.patch<br>
@@ -0,0 +1,71 @@<br>
+From 2065015da40cf79dd8ec9e3f186538e17c3b592f Mon Sep 17 00:00:00 2001<br>
+From: Robert Joslyn &lt;<a href=3D"mailto:robert.joslyn@redrectangle.org" =
target=3D"_blank">robert.joslyn@redrectangle.org</a>&gt;<br>
+Date: Wed, 30 Nov 2022 13:07:29 -0800<br>
+Subject: [PATCH 2/3] Fix assumed signed char<br>
+<br>
+The code assumes that char is signed, but whether char is signed or<br>
+unsigned is implementation defined. On some architectures like PowerPC,<br=
>
+GCC treats char as unsigned resulting in compile errors:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0smtp-address-validator.cpp:213:1: error: narrow=
ing conversion of &#39;-32&#39; from &#39;int&#39; to &#39;char&#39; [-Wnar=
rowing]<br>
+<br>
+Fix this by specifying signed char.<br>
+<br>
+Upstream-Status: Accepted [<a href=3D"https://github.com/pboettch/json-sch=
ema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32" rel=3D"noref=
errer" target=3D"_blank">https://github.com/pboettch/json-schema-validator/=
commit/491ac44026e08f31790f5cacffa62e168bb35e32</a>]<br>
+<br>
+Signed-off-by: Parian Golchin &lt;<a href=3D"mailto:Parian.Golchin@iris-se=
nsing.com" target=3D"_blank">Parian.Golchin@iris-sensing.com</a>&gt;<br>
+---<br>
+ src/smtp-address-validator.cpp | 16 ++++++++--------<br>
+ 1 file changed, 8 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/src/smtp-address-validator.cpp b/src/smtp-address-validator.c=
pp<br>
+index a63ead0..3903b51 100644<br>
+--- a/src/smtp-address-validator.cpp<br>
++++ b/src/smtp-address-validator.cpp<br>
+@@ -63,7 +63,7 @@ static const short _address_key_offsets[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A01363, 1365, 1367, 1368, 1370, 1388, 0<br>
+ };<br>
+ <br>
+-static const char _address_trans_keys[] =3D {<br>
++static const signed char _address_trans_keys[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-32, -19, -16, -12, 34, 45, 61, 63,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-62, -33, -31, -17, -15, -13, 33, 39,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A042, 43, 47, 57, 65, 90, 94, 126,<br>
+@@ -711,7 +711,7 @@ bool is_address(const char* p, const char* pe)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int _klen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int _trans=
 =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char * _keys;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const signed char * _key=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const signed char *=
 _acts;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int _nacts=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_resume: {}<br>
+@@ -728,9 +728,9 @@ bool is_address(const char* p, const char* pe)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0_klen =3D (int)_address_single_lengths[cs];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ( _klen &gt; 0 ) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *_lower =3D _keys;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *_upper =3D _keys + _klen - 1;<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *_mid;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const signed char *_lower =3D _keys;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const signed char *_upper =3D _keys + _klen=
 - 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const signed char *_mid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ( 1 ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( _upp=
er &lt; _lower ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0_keys +=3D _klen;<br>
+@@ -752,9 +752,9 @@ bool is_address(const char* p, const char* pe)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0_klen =3D (int)_address_range_lengths[cs];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ( _klen &gt; 0 ) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *_lower =3D _keys;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *_upper =3D _keys + (_klen&lt;&l=
t;1) - 2;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *_mid;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const signed char *_lower =3D _keys;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const signed char *_upper =3D _keys + (_kle=
n&lt;&lt;1) - 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const signed char *_mid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ( 1 ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( _upp=
er &lt; _lower ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0_trans +=3D (unsigned int)_klen;<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-val=
idator/0003-For-root-value-use-empty-pointer.patch b/meta-oe/recipes-devtoo=
ls/json-schema-validator/json-schema-validator/0003-For-root-value-use-empt=
y-pointer.patch<br>
new file mode 100644<br>
index 000000000..e0d0cf8ce<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/=
0003-For-root-value-use-empty-pointer.patch<br>
@@ -0,0 +1,41 @@<br>
+From fa49c29942763285c51b7d2dea417d9f51e4961f Mon Sep 17 00:00:00 2001<br>
+From: Sven Fink &lt;<a href=3D"mailto:sven.fink@wipotec.com" target=3D"_bl=
ank">sven.fink@wipotec.com</a>&gt;<br>
+Date: Fri, 13 Jan 2023 09:15:42 +0100<br>
+Subject: [PATCH 3/3] For root value, use empty pointer<br>
+<br>
+Upstream-Status: Accepted [<a href=3D"https://github.com/pboettch/json-sch=
ema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a" rel=3D"noref=
errer" target=3D"_blank">https://github.com/pboettch/json-schema-validator/=
commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a</a>]<br>
+<br>
+Signed-off-by: Parian Golchin &lt;<a href=3D"mailto:Parian.Golchin@iris-se=
nsing.com" target=3D"_blank">Parian.Golchin@iris-sensing.com</a>&gt;<br>
+---<br>
+ src/json-validator.cpp | 8 ++++++++<br>
+ 1 file changed, 8 insertions(+)<br>
+<br>
+diff --git a/src/json-validator.cpp b/src/json-validator.cpp<br>
+index 7f34553..3c73d98 100644<br>
+--- a/src/json-validator.cpp<br>
++++ b/src/json-validator.cpp<br>
+@@ -553,6 +553,9 @@ class type_schema : public schema<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else_-&gt=
;validate(ptr, instance, patch, e);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (instance.is_null()) =
{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 patch.add(nlohmann::json::json_pointer{}, default_value_);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+ protected:<br>
+@@ -1134,6 +1137,11 @@ public:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0propertyNames_ =3D schema::make(attr.value(), root, {&quot;proper=
tyNames&quot;}, uris);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sch.erase(attr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr =3D sch.find(&quot;=
default&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attr !=3D sch.end())=
 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 set_default_value(*attr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ };<br>
+ <br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-oe/recipes-devtools/json-schema-validator/<a href=3D"http=
://json-schema-validator_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">jso=
n-schema-validator_2.1.0.bb</a> b/meta-oe/recipes-devtools/json-schema-vali=
dator/<a href=3D"http://json-schema-validator_2.1.0.bb" rel=3D"noreferrer" =
target=3D"_blank">json-schema-validator_2.1.0.bb</a><br>
deleted file mode 100644<br>
index 00d26d7b3..000000000<br>
--- a/meta-oe/recipes-devtools/json-schema-validator/<a href=3D"http://json=
-schema-validator_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">json-schem=
a-validator_2.1.0.bb</a><br>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-SUMMARY =3D &quot;JSON schema validator for JSON for Modern C++&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc441d022da1b1663c70181a322=
25d006&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/pboettch/json-schema-=
validator;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/pboettch/json-schema-validator;branch=3Dmaster;protocol=3D=
https</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cmake-Use-GNUInstallD=
irs.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;27fc1d094503623dfe39365ba82581507524545c&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-DEPENDS +=3D &quot;nlohmann-json&quot;<br>
-<br>
-inherit cmake<br>
-EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON -DBUILD_EXAMPLES=3DOFF -D=
BUILD_TESTS=3DOFF&quot;<br>
-<br>
diff --git a/meta-oe/recipes-devtools/json-schema-validator/<a href=3D"http=
://json-schema-validator_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">jso=
n-schema-validator_2.2.0.bb</a> b/meta-oe/recipes-devtools/json-schema-vali=
dator/<a href=3D"http://json-schema-validator_2.2.0.bb" rel=3D"noreferrer" =
target=3D"_blank">json-schema-validator_2.2.0.bb</a><br>
new file mode 100644<br>
index 000000000..6f0b42402<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/json-schema-validator/<a href=3D"http://json=
-schema-validator_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">json-schem=
a-validator_2.2.0.bb</a><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;JSON schema validator for JSON for Modern C++&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc441d022da1b1663c70181a322=
25d006&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/pboettch/json-schema-=
validator;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/pboettch/json-schema-validator;branch=3Dmain;protocol=3Dhttp=
s</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Set-Json_validator-In=
stall-off-if-it-finds-it-via-li.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Fix-assumed-signed-ch=
ar.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-For-root-value-use-em=
pty-pointer.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+SRCREV =3D &quot;6b17782d6a5d1dee5d2c4fc5d25ffb1123913431&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+DEPENDS +=3D &quot;nlohmann-json&quot;<br>
+<br>
+inherit cmake<br>
+EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON -DJSON_VALIDATOR_BUILD_TE=
STS=3DOFF -DJSON_VALIDATOR_BUILD_EXAMPLES=3DOFF&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104520): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104520" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104520</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100899596/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100899596/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000052a40f06041edd28--

