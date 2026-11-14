Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7493.1794645334079278771
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 00:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZUww3R4b;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2eb18f4da15so9329355ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 00:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645333; x=1795250133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CuSj5BYLAokdC8gb5ft5fQgEhwUgIJKqB/NfRhkaQU=;
        b=ZUww3R4bRED50h0zotsNH2Tjnbx3K2PbcbV5gQhXobodCHHQZH/MlNmv++1J2OzTDH
         +3ASMbCoJGDnc7iPKIYDGt7EJSuITJoxLw5wIVihTmbUeQPRj6UNo3A4OcDBSDjiatoh
         mjj4z/O5c3Q6yUwnJ7S/eMqMwITtROfOXJrLnyTTSzKg3Yp3fsLX44xpz35uxqoh/Ptr
         hdn7j3FC7j18NzNl8POnsDcEP/KxJ4mkRTKSVAyWFd1dlQhj7sHN6GEl5VRUXEsuwHEZ
         bFvLOmtGYDtUugN/t4tbBHblnI6TyZ8brEUnpU6HbGualPZ12EBOQZoCfqdsUKJEr0d4
         SfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645333; x=1795250133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CuSj5BYLAokdC8gb5ft5fQgEhwUgIJKqB/NfRhkaQU=;
        b=LtzatIp/R8PKgaT15AymUTUB7YhDlyb0psodXIY4+Z/dQVdKWRpBhbj3TbV4UBBEpn
         1+LiLUHOfa4E5XpNhUuhd55W8dhhomvkbRXsTD2UiaSbOPZaKH3TcKmSF7jrueszPjxf
         xCQbYWmZ4P7EqBjPfXWCoJbA2b+8sZAipVNv2fSlMM1Df1tR1V9gWO2DepMvR1oGXh5S
         wnXBSyfzG+xFsuL7PkTXaff/7Hk3SqiNC4aUs8qsRGU5MKyVQ8CiTpQDWT59pI1SYJTF
         A0Agz9ktsSY2jlr/9HD1l7MrMvYa7nXuxQ9KBmG/TtI9yISYKmU2zePciVRKK9Rey2a/
         eEQw==
X-Gm-Message-State: APuU4Z9ih73KkAImUgNDDDz9N0hJwN9oH7iMurkDOt8mvjHNEWTVjip5
	r/jv7aaFJ7UEv1hyD/WrNE5HfBFog92nt4sCVn0S5ZkquHlCEuj/c0csSJF6Tg==
X-Gm-Gg: AYBFou2gYa2V/fQRndjgM0UAs8F4GEv1X4AblTu5wAvYCsoh/od3Khu6oj8e2jXoSQw
	XgbDWKg4M02kF5tB0Pi80Mtl1inKH6A5/VdQ9gPOK7ADxSEeBcykmTZU1/hqaj+bIJRTNtmbJ6X
	ot4zp10zXKWw1vC1BM2LXGx2f34hkmbjHnBPsTQJ7zdKS2Zh9I+G4fvbCzchYzLC7BogmCG5C3n
	smtotroVP7HJfgQy0X88pHKTyE+JW/buyr3Q0JctTWcRBUWL+LmdhV8O95k1uwHDxOEJbXOw/sL
	4tSUn0COUneYkVJm+WJStxOJtiUEeFG28F7PQ8VhAVHkqGizbgGNYIM92CJsAQXsjEeFAyuyBOp
	CIgt3O8h7U9d4UW/d559JgmmDBKcyohxfhmIhZ4ebQsMypB8wz/dhSuQCEME56ai2AE7pfW9BNu
	zz7ThMBwbrxREhvd6ISeLiBVHce11wehW4phkUGYAOpwMvDN42eknv/BVS07KLt4y+KZ6l2fqmQ
	orA5S5f61zk2pJcJ12CcbJTHZsT5tbtuHPk+YPeqfWWUT0WGjVKnsf0QNUEZlUmZptCM2Rx2fO2
	iF7n8X7FBJssBJRLYXuIuwJHdNe6afsf/zSycjMUyaXQ7CIeT8NaVbDm1GEIDE6FEmZnMrRZLRX
	1qdhu
X-Received: by 2002:a17:903:1aa7:b0:2e9:5714:6075 with SMTP id d9443c01a7336-2ee0dc938eemr50727075ad.17.1794645333057;
        Sat, 14 Nov 2026 00:35:33 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from dld58y9k4-lin.dl.net ([2a02:b025:40:94c3:2c77:91fc:2a7f:9aac])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f9f13desm18484475ad.67.2026.11.14.00.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:35:32 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] cpprest: update to new maintained fork, update to 2.10.20-cpprest-lts and unblacklist
Date: Sat, 14 Nov 2026 09:35:14 +0100
Message-ID: <20261114083514.1798099-2-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114083514.1798099-1-locutusofborg@debian.org>
References: <20261114083514.1798099-1-locutusofborg@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 08:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132256
Content-Type: text/plain; charset="utf-8"

The new fork incorporated all the patches, delete them
Add 3 patches from Debian to:
- Fix Big Endian machines test
- Disable network tests via cmake switch
- Fix build on Big Endian machines

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../recipes-support/cpprest/cpprest/63.patch  | 180 +++++++++++++++++
 .../recipes-support/cpprest/cpprest/64.patch  | 182 ++++++++++++++++++
 .../recipes-support/cpprest/cpprest/65.patch  |  94 +++++++++
 .../cpprest/cpprest/disable-float-tests.patch |  27 ---
 .../cpprest/disable-outside-tests.patch       | 129 -------------
 .../cpprest/cpprest_2.10.20+cpprest-lts.bb    |  18 ++
 6 files changed, 474 insertions(+), 156 deletions(-)
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest/63.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest/64.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest/65.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb

diff --git a/meta-oe/recipes-support/cpprest/cpprest/63.patch b/meta-oe/recipes-support/cpprest/cpprest/63.patch
new file mode 100644
index 0000000000..72945b3db3
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest/63.patch
@@ -0,0 +1,180 @@
+Upstream-Status: Submitted [https://github.com/cpprest-lts/cpprestsdk/pull/63]
+From 80b15041c4001a8f49fe556b835e2781d54a7f69 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Fri, 13 Nov 2026 13:34:16 +0100
+Subject: [PATCH] Fix Base64 encoding and decoding on big-endian systems
+
+Replace implementation-defined bitfields with explicit byte shifts.
+---
+ Release/src/utilities/base64.cpp | 87 +++++++-------------------------
+ 1 file changed, 17 insertions(+), 70 deletions(-)
+
+diff --git a/Release/src/utilities/base64.cpp b/Release/src/utilities/base64.cpp
+index 1cb235c3b5..9038278d22 100644
+--- a/Release/src/utilities/base64.cpp
++++ b/Release/src/utilities/base64.cpp
+@@ -43,30 +43,6 @@ const std::array<unsigned char, 128> _base64_dectbl = {
+      23,  24,  25,  255, 255, 255, 255, 255, 255, 26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,  38,
+      39,  40,  41,  42,  43,  44,  45,  46,  47,  48,  49,  50,  51,  255, 255, 255, 255, 255}};
+ 
+-struct _triple_byte
+-{
+-    unsigned char _1_1 : 2;
+-    unsigned char _0 : 6;
+-    unsigned char _2_1 : 4;
+-    unsigned char _1_2 : 4;
+-    unsigned char _3 : 6;
+-    unsigned char _2_2 : 2;
+-};
+-
+-struct _double_byte
+-{
+-    unsigned char _1_1 : 2;
+-    unsigned char _0 : 6;
+-    unsigned char _2_1 : 4;
+-    unsigned char _1_2 : 4;
+-};
+-
+-struct _single_byte
+-{
+-    unsigned char _1_1 : 2;
+-    unsigned char _0 : 6;
+-};
+-
+ //
+ // A note on the implementation of BASE64 encoding and decoding:
+ //
+@@ -75,10 +51,6 @@ struct _single_byte
+ // ignoring CRLF, relaxed validation rules, etc. The decoder is currently pretty strict.
+ //
+ 
+-#ifdef __GNUC__
+-// gcc is concerned about the bitfield uses in the code, something we simply need to ignore.
+-#pragma GCC diagnostic ignored "-Wconversion"
+-#endif
+ std::vector<unsigned char> _from_base64(const utility::string_t& input)
+ {
+     std::vector<unsigned char> result;
+@@ -134,26 +106,14 @@ std::vector<unsigned char> _from_base64(const utility::string_t& input)
+     size_t idx = 0;
+     for (; size > 4; ++idx)
+     {
+-        unsigned char target[3];
+-        memset(target, 0, sizeof(target));
+-        _triple_byte* record = reinterpret_cast<_triple_byte*>(target);
+-
+         unsigned char val0 = _base64_dectbl[ptr[0]];
+         unsigned char val1 = _base64_dectbl[ptr[1]];
+         unsigned char val2 = _base64_dectbl[ptr[2]];
+         unsigned char val3 = _base64_dectbl[ptr[3]];
+ 
+-        record->_0 = val0;
+-        record->_1_1 = val1 >> 4;
+-        result[idx] = target[0];
+-
+-        record->_1_2 = val1 & 0xF;
+-        record->_2_1 = val2 >> 2;
+-        result[++idx] = target[1];
+-
+-        record->_2_2 = val2 & 0x3;
+-        record->_3 = val3 & 0x3F;
+-        result[++idx] = target[2];
++        result[idx] = static_cast<unsigned char>((val0 << 2) | (val1 >> 4));
++        result[++idx] = static_cast<unsigned char>((val1 << 4) | (val2 >> 2));
++        result[++idx] = static_cast<unsigned char>((val2 << 6) | val3);
+ 
+         ptr += 4;
+         size -= 4;
+@@ -163,45 +123,35 @@ std::vector<unsigned char> _from_base64(const utility::string_t& input)
+     // in all the iterations (a performance issue).
+ 
+     {
+-        unsigned char target[3];
+-        memset(target, 0, sizeof(target));
+-        _triple_byte* record = reinterpret_cast<_triple_byte*>(target);
+-
+         unsigned char val0 = _base64_dectbl[ptr[0]];
+         unsigned char val1 = _base64_dectbl[ptr[1]];
+         unsigned char val2 = _base64_dectbl[ptr[2]];
+         unsigned char val3 = _base64_dectbl[ptr[3]];
+ 
+-        record->_0 = val0;
+-        record->_1_1 = val1 >> 4;
+-        result[idx] = target[0];
++        result[idx] = static_cast<unsigned char>((val0 << 2) | (val1 >> 4));
+ 
+-        record->_1_2 = val1 & 0xF;
+         if (val2 != 254)
+         {
+-            record->_2_1 = val2 >> 2;
+-            result[++idx] = target[1];
++            result[++idx] = static_cast<unsigned char>((val1 << 4) | (val2 >> 2));
+         }
+         else
+         {
+             // There shouldn't be any information (ones) in the unused bits,
+-            if (record->_1_2 != 0)
++            if ((val1 & 0xF) != 0)
+             {
+                 throw std::runtime_error("Invalid end of base64 string");
+             }
+             return result;
+         }
+ 
+-        record->_2_2 = val2 & 0x3;
+         if (val3 != 254)
+         {
+-            record->_3 = val3 & 0x3F;
+-            result[++idx] = target[2];
++            result[++idx] = static_cast<unsigned char>((val2 << 6) | val3);
+         }
+         else
+         {
+             // There shouldn't be any information (ones) in the unused bits.
+-            if (record->_2_2 != 0)
++            if ((val2 & 0x3) != 0)
+             {
+                 throw std::runtime_error("Invalid end of base64 string");
+             }
+@@ -218,11 +168,10 @@ utility::string_t _to_base64(const unsigned char* ptr, size_t size)
+ 
+     for (; size >= 3;)
+     {
+-        const _triple_byte* record = reinterpret_cast<const _triple_byte*>(ptr);
+-        unsigned char idx0 = record->_0;
+-        unsigned char idx1 = (record->_1_1 << 4) | record->_1_2;
+-        unsigned char idx2 = (record->_2_1 << 2) | record->_2_2;
+-        unsigned char idx3 = record->_3;
++        unsigned char idx0 = static_cast<unsigned char>(ptr[0] >> 2);
++        unsigned char idx1 = static_cast<unsigned char>(((ptr[0] & 0x3) << 4) | (ptr[1] >> 4));
++        unsigned char idx2 = static_cast<unsigned char>(((ptr[1] & 0xF) << 2) | (ptr[2] >> 6));
++        unsigned char idx3 = static_cast<unsigned char>(ptr[2] & 0x3F);
+         result.push_back(char_t(_base64_enctbl[idx0]));
+         result.push_back(char_t(_base64_enctbl[idx1]));
+         result.push_back(char_t(_base64_enctbl[idx2]));
+@@ -234,9 +183,8 @@ utility::string_t _to_base64(const unsigned char* ptr, size_t size)
+     {
+         case 1:
+         {
+-            const _single_byte* record = reinterpret_cast<const _single_byte*>(ptr);
+-            unsigned char idx0 = record->_0;
+-            unsigned char idx1 = (record->_1_1 << 4);
++            unsigned char idx0 = static_cast<unsigned char>(ptr[0] >> 2);
++            unsigned char idx1 = static_cast<unsigned char>((ptr[0] & 0x3) << 4);
+             result.push_back(char_t(_base64_enctbl[idx0]));
+             result.push_back(char_t(_base64_enctbl[idx1]));
+             result.push_back('=');
+@@ -245,10 +193,9 @@ utility::string_t _to_base64(const unsigned char* ptr, size_t size)
+         }
+         case 2:
+         {
+-            const _double_byte* record = reinterpret_cast<const _double_byte*>(ptr);
+-            unsigned char idx0 = record->_0;
+-            unsigned char idx1 = (record->_1_1 << 4) | record->_1_2;
+-            unsigned char idx2 = (record->_2_1 << 2);
++            unsigned char idx0 = static_cast<unsigned char>(ptr[0] >> 2);
++            unsigned char idx1 = static_cast<unsigned char>(((ptr[0] & 0x3) << 4) | (ptr[1] >> 4));
++            unsigned char idx2 = static_cast<unsigned char>((ptr[1] & 0xF) << 2);
+             result.push_back(char_t(_base64_enctbl[idx0]));
+             result.push_back(char_t(_base64_enctbl[idx1]));
+             result.push_back(char_t(_base64_enctbl[idx2]));
diff --git a/meta-oe/recipes-support/cpprest/cpprest/64.patch b/meta-oe/recipes-support/cpprest/cpprest/64.patch
new file mode 100644
index 0000000000..b02db9e024
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest/64.patch
@@ -0,0 +1,182 @@
+Upstream-Status: Submitted [https://github.com/cpprest-lts/cpprestsdk/pull/64]
+From 3d7f0bddff0971970b7692d86ee14873c0bc1755 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Fri, 13 Nov 2026 13:46:50 +0100
+Subject: [PATCH] Add CMake option to skip network-dependent tests
+
+---
+ Release/CMakeLists.txt                             |  7 ++++++-
+ Release/tests/common/TestRunner/test_runner.cpp    |  5 +++++
+ .../tests/functional/http/client/CMakeLists.txt    |  2 +-
+ .../http/client/authentication_tests.cpp           |  4 ++--
+ .../http/client/connections_and_errors.cpp         |  2 +-
+ .../tests/functional/http/client/outside_tests.cpp | 14 +++++++-------
+ Release/tests/functional/websockets/CMakeLists.txt |  2 +-
+ 7 files changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
+index 9fc12840e..46a80aaf8 100644
+--- a/Release/CMakeLists.txt
++++ b/Release/CMakeLists.txt
+@@ -18,6 +18,7 @@ enable_testing()
+ set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
+ set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
+ set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
++set(CPPREST_TEST_NETWORK ON CACHE BOOL "Run tests requiring external network access.")
+ set(CPPREST_EXCLUDE_BROTLI ON CACHE BOOL "Exclude Brotli compression functionality.")
+ set(CPPREST_EXPORT_DIR cmake/cpprestsdk CACHE STRING "Directory to install CMake config files.")
+ set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
+@@ -255,10 +256,14 @@ function(add_casablanca_test NAME SOURCES_VAR)
+       # so that they share one exception table and catch the wrong exception
+       target_link_libraries(${NAME} PRIVATE -Wl,-no_deduplicate)
+     endif()
++      set(_test_runner_args)
++      if(NOT CPPREST_TEST_NETWORK)
++        list(APPEND _test_runner_args /skip-network)
++      endif()
+     if (BUILD_SHARED_LIBS)
+       add_test(NAME ${NAME}
+         WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
+-        COMMAND test_runner $<TARGET_FILE_NAME:${NAME}>
++        COMMAND test_runner ${_test_runner_args} $<TARGET_FILE_NAME:${NAME}>
+       )
+     endif()
+   endif()
+diff --git a/Release/tests/common/TestRunner/test_runner.cpp b/Release/tests/common/TestRunner/test_runner.cpp
+index abd280c6d..c9f710fb5 100644
+--- a/Release/tests/common/TestRunner/test_runner.cpp
++++ b/Release/tests/common/TestRunner/test_runner.cpp
+@@ -268,6 +268,11 @@ static bool matched_properties(const UnitTest::TestProperties& test_props)
+ #endif
+ #endif
+ 
++    if (UnitTest::GlobalSettings::Has("skip-network") && test_props.Has("NetworkRequired"))
++    {
++        return false;
++    }
++
+     // The 'Require' property on a test case is special.
+     // It requires a certain global setting to be fulfilled to execute.
+     if (test_props.Has("Requires"))
+diff --git a/Release/tests/functional/http/client/CMakeLists.txt b/Release/tests/functional/http/client/CMakeLists.txt
+index e21242a5c..d50a839c4 100644
+--- a/Release/tests/functional/http/client/CMakeLists.txt
++++ b/Release/tests/functional/http/client/CMakeLists.txt
+@@ -27,7 +27,7 @@ set(SOURCES
+ )
+ 
+ add_casablanca_test(httpclient_test SOURCES)
+-if(BUILD_SHARED_LIBS)
++if(BUILD_SHARED_LIBS AND CPPREST_TEST_NETWORK)
+   add_test(NAME httpclient_test_badssl
+     WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
+     COMMAND test_runner /badssl /select:@Requires=badssl $<TARGET_FILE_NAME:httpclient_test>
+diff --git a/Release/tests/functional/http/client/authentication_tests.cpp b/Release/tests/functional/http/client/authentication_tests.cpp
+index c90046be3..b857a43bc 100644
+--- a/Release/tests/functional/http/client/authentication_tests.cpp
++++ b/Release/tests/functional/http/client/authentication_tests.cpp
+@@ -676,9 +676,9 @@ SUITE(authentication_tests)
+         VERIFY_ARE_EQUAL(return_code, response.status_code());
+     }
+ 
+-    TEST(auth_no_data) { auth_test_impl(false); }
++    TEST(auth_no_data, "NetworkRequired", "true") { auth_test_impl(false); }
+ 
+-    TEST(unsuccessful_auth_with_basic_cred) { auth_test_impl(true); }
++    TEST(unsuccessful_auth_with_basic_cred, "NetworkRequired", "true") { auth_test_impl(true); }
+ 
+     TEST_FIXTURE(uri_address, set_user_options_asio_http)
+     {
+diff --git a/Release/tests/functional/http/client/connections_and_errors.cpp b/Release/tests/functional/http/client/connections_and_errors.cpp
+index 26a3b33e3..8b8b10e60 100644
+--- a/Release/tests/functional/http/client/connections_and_errors.cpp
++++ b/Release/tests/functional/http/client/connections_and_errors.cpp
+@@ -409,7 +409,7 @@ SUITE(connections_and_errors)
+ #endif
+ 
+     // Try to connect to a server on a closed port and cancel the operation.
+-    TEST_FIXTURE(uri_address, cancel_bad_port)
++    TEST_FIXTURE(uri_address, cancel_bad_port, "NetworkRequired", "true")
+     {
+         // http_client_asio had a bug where, when canceled, it would cancel only the
+         // current connection but then go and try the next address from the list of
+diff --git a/Release/tests/functional/http/client/outside_tests.cpp b/Release/tests/functional/http/client/outside_tests.cpp
+index b8147b1f8..29551a43c 100644
+--- a/Release/tests/functional/http/client/outside_tests.cpp
++++ b/Release/tests/functional/http/client/outside_tests.cpp
+@@ -41,7 +41,7 @@ namespace client
+ {
+ SUITE(outside_tests)
+ {
+-    TEST_FIXTURE(uri_address, outside_cnn_dot_com)
++    TEST_FIXTURE(uri_address, outside_cnn_dot_com, "NetworkRequired", "true")
+     {
+         handle_timeout([] {
+             // http://www.cnn.com redirects users from countries outside of the US to the "http://edition.cnn.com/" drop
+@@ -60,7 +60,7 @@ SUITE(outside_tests)
+         });
+     }
+ 
+-    TEST_FIXTURE(uri_address, outside_wikipedia_compressed_http_response)
++    TEST_FIXTURE(uri_address, outside_wikipedia_compressed_http_response, "NetworkRequired", "true")
+     {
+         if (web::http::compression::builtin::supported() == false)
+         {
+@@ -86,7 +86,7 @@ SUITE(outside_tests)
+         VERIFY_ARE_EQUAL(encoding, U("gzip"));
+     }
+ 
+-    TEST_FIXTURE(uri_address, outside_google_dot_com)
++    TEST_FIXTURE(uri_address, outside_google_dot_com, "NetworkRequired", "true")
+     {
+         // Use code.google.com instead of www.google.com, which redirects
+         http_client client(U("http://code.google.com"));
+@@ -98,7 +98,7 @@ SUITE(outside_tests)
+         }
+     }
+ 
+-    TEST_FIXTURE(uri_address, multiple_https_requests)
++    TEST_FIXTURE(uri_address, multiple_https_requests, "NetworkRequired", "true")
+     {
+         handle_timeout([&] {
+             // Use code.google.com instead of www.google.com, which redirects
+@@ -115,7 +115,7 @@ SUITE(outside_tests)
+     }
+ 
+ #if (defined(_MSC_VER) && (_MSC_VER >= 1900)) && !CPPREST_FORCE_PPLX
+-    TEST_FIXTURE(uri_address, multiple_https_requests_sync_scheduler)
++    TEST_FIXTURE(uri_address, multiple_https_requests_sync_scheduler, "NetworkRequired", "true")
+     {
+         struct sync_scheduler : public scheduler_interface
+         {
+@@ -148,7 +148,7 @@ SUITE(outside_tests)
+     }
+ #endif
+ 
+-    TEST_FIXTURE(uri_address, reading_google_stream)
++    TEST_FIXTURE(uri_address, reading_google_stream, "NetworkRequired", "true")
+     {
+         handle_timeout([&] {
+             // Use code.google.com instead of www.google.com, which redirects
+@@ -170,7 +170,7 @@ SUITE(outside_tests)
+         });
+     }
+ 
+-    TEST_FIXTURE(uri_address, no_transfer_encoding_content_length)
++    TEST_FIXTURE(uri_address, no_transfer_encoding_content_length, "NetworkRequired", "true")
+     {
+         handle_timeout([] {
+             http_client client(U("http://ws.audioscrobbler.com/2.0/") U(
+diff --git a/Release/tests/functional/websockets/CMakeLists.txt b/Release/tests/functional/websockets/CMakeLists.txt
+index 9a33589f5..ab7926c22 100644
+--- a/Release/tests/functional/websockets/CMakeLists.txt
++++ b/Release/tests/functional/websockets/CMakeLists.txt
+@@ -28,7 +28,7 @@ if (NOT CPPREST_EXCLUDE_WEBSOCKETS)
+   )
+ 
+   add_casablanca_test(websocketsclient_test SOURCES)
+-  if(BUILD_SHARED_LIBS)
++  if(BUILD_SHARED_LIBS AND CPPREST_TEST_NETWORK)
+     add_test(NAME websocketsclient_test_badssl
+       WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
+       COMMAND test_runner /badssl /select:@Requires=badssl $<TARGET_FILE_NAME:websocketsclient_test>
diff --git a/meta-oe/recipes-support/cpprest/cpprest/65.patch b/meta-oe/recipes-support/cpprest/cpprest/65.patch
new file mode 100644
index 0000000000..cd80d6a95d
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest/65.patch
@@ -0,0 +1,94 @@
+Upstream-Status: Submitted [https://github.com/cpprest-lts/cpprestsdk/pull/65]
+From 95a56289b4f4c38357b77bdeec5f68e3443209a9 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Fri, 13 Nov 2026 23:05:48 +0100
+Subject: [PATCH] Fix single-character file reads on big-endian systems
+
+---
+ Release/include/cpprest/filestream.h               | 12 ++++++------
+ .../tests/functional/streams/fstreambuf_tests.cpp  | 14 ++++++++++++++
+ 2 files changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/Release/include/cpprest/filestream.h b/Release/include/cpprest/filestream.h
+index da7743d89..2091503b6 100644
+--- a/Release/include/cpprest/filestream.h
++++ b/Release/include/cpprest/filestream.h
+@@ -399,7 +399,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
+             {
+                 pplx::extensibility::scoped_recursive_lock_t lck(m_info->m_lock);
+                 m_info->m_rdpos += 1;
+-                _CharType ch1 = (_CharType)callback->m_ch;
++                int_type ch1 = static_cast<int_type>(std::char_traits<_CharType>::to_int_type(callback->m_ch));
+                 delete callback;
+                 return pplx::task_from_result<int_type>(ch1);
+             }
+@@ -453,7 +453,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
+         if (ch == sizeof(_CharType))
+         {
+             pplx::extensibility::scoped_recursive_lock_t lck(m_info->m_lock);
+-            _CharType ch1 = (_CharType)callback->m_ch;
++            int_type ch1 = static_cast<int_type>(std::char_traits<_CharType>::to_int_type(callback->m_ch));
+             delete callback;
+             return pplx::task_from_result<int_type>(ch1);
+         }
+@@ -874,7 +874,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
+             if (result == sizeof(_CharType))
+             {
+                 m_info->m_rdpos += 1;
+-                m_op.set(m_ch);
++                m_op.set(static_cast<int_type>(std::char_traits<_CharType>::to_int_type(m_ch)));
+             }
+             else
+             {
+@@ -889,7 +889,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
+             delete this;
+         }
+ 
+-        int_type m_ch;
++        _CharType m_ch;
+ 
+     private:
+         _file_info* m_info;
+@@ -908,7 +908,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
+         {
+             if (result == sizeof(_CharType))
+             {
+-                m_op.set(m_ch);
++                m_op.set(static_cast<int_type>(std::char_traits<_CharType>::to_int_type(m_ch)));
+             }
+             else
+             {
+@@ -917,7 +917,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
+             delete this;
+         }
+ 
+-        int_type m_ch;
++        _CharType m_ch;
+ 
+         virtual void on_error(const std::exception_ptr& e)
+         {
+diff --git a/Release/tests/functional/streams/fstreambuf_tests.cpp b/Release/tests/functional/streams/fstreambuf_tests.cpp
+index bd6363309..9b38eaa99 100644
+--- a/Release/tests/functional/streams/fstreambuf_tests.cpp
++++ b/Release/tests/functional/streams/fstreambuf_tests.cpp
+@@ -305,6 +305,20 @@ SUITE(file_buffer_tests)
+         VERIFY_IS_FALSE(stream.is_open());
+     }
+ 
++    TEST(ReadSingleChar_full_value)
++    {
++        utility::string_t fname = U("ReadSingleChar_full_value.txt");
++        fill_file(fname);
++
++        auto peekStream = OPEN_R<uint8_t>(fname).get();
++        VERIFY_ARE_EQUAL('a', peekStream.getc().get());
++        peekStream.close().get();
++
++        auto readStream = OPEN_R<uint8_t>(fname).get();
++        VERIFY_ARE_EQUAL('a', readStream.bumpc().get());
++        readStream.close().get();
++    }
++
+     TEST(SequentialReadWrite)
+     {
+         utility::string_t fname = U("SequentialReadWrite.txt");
diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
deleted file mode 100644
index b956db22fd..0000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Pending
-
-Description: new toolchain might have increased the float precision
-Author: Gianfranco Costamagna <locutusofborg@debian.org>
-Last-Update: 2017-10-28
-Forwarded: https://github.com/Microsoft/cpprestsdk/issues/576
-
-Index: cpprest/Release/tests/functional/streams/istream_tests.cpp
-===================================================================
---- cpprest.orig/Release/tests/functional/streams/istream_tests.cpp
-+++ cpprest/Release/tests/functional/streams/istream_tests.cpp
-@@ -1297,6 +1297,7 @@
-     void compare_double(double expected, double actual) { compare_floating(expected, actual, DBL_EPSILON); }
-     void compare_float(float expected, float actual) { compare_floating(expected, actual, FLT_EPSILON); }
- 
-+    /*
-     TEST(extract_floating_point)
-     {
-         std::string test_string;
-@@ -1343,6 +1344,7 @@
-             if (expected == 0) VERIFY_ARE_EQUAL(1 / expected, 1 / actual);
-         } while (!std_istream.eof());
-     }
-+    */
- 
-     TEST(extract_floating_point_with_exceptions)
-     {
diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
deleted file mode 100644
index 961eaf7646..0000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-Upstream-Status: Pending
-
-Description: Debian forbids calls to external websites.
-
-Author: Gianfranco Costamagna <locutus@debian.org>
-Origin: Debian
-Forwarded: not-needed
-Reviewed-By: Gianfranco Costamagna <locutusofborg@debian.org>
-Last-Update: 2015-11-25
-
-Index: cpprest/Release/tests/functional/http/client/CMakeLists.txt
-===================================================================
---- cpprest.orig/Release/tests/functional/http/client/CMakeLists.txt
-+++ cpprest/Release/tests/functional/http/client/CMakeLists.txt
-@@ -12,7 +12,6 @@
-   multiple_requests.cpp
-   oauth1_tests.cpp
-   oauth2_tests.cpp
--  outside_tests.cpp
-   pipeline_stage_tests.cpp
-   progress_handler_tests.cpp
-   proxy_tests.cpp
-Index: cpprest/Release/tests/functional/http/client/authentication_tests.cpp
-===================================================================
---- cpprest.orig/Release/tests/functional/http/client/authentication_tests.cpp
-+++ cpprest/Release/tests/functional/http/client/authentication_tests.cpp
-@@ -675,9 +675,9 @@
-         VERIFY_ARE_EQUAL(return_code, response.status_code());
-     }
- 
--    TEST(auth_no_data) { auth_test_impl(false); }
-+    //TEST(auth_no_data) { auth_test_impl(false); }
- 
--    TEST(unsuccessful_auth_with_basic_cred) { auth_test_impl(true); }
-+    //TEST(unsuccessful_auth_with_basic_cred) { auth_test_impl(true); }
- 
-     TEST_FIXTURE(uri_address, set_user_options_asio_http)
-     {
-@@ -695,6 +695,7 @@
-         VERIFY_ARE_EQUAL(200, response.status_code());
-     }
- 
-+    /*
-     TEST_FIXTURE(uri_address, set_user_options_asio_https)
-     {
-         handle_timeout([] {
-@@ -714,6 +715,7 @@
-             VERIFY_IS_FALSE(v.empty());
-         });
-     }
-+    */
- 
- #endif
- 
-Index: cpprest/Release/tests/functional/websockets/client/authentication_tests.cpp
-===================================================================
---- cpprest.orig/Release/tests/functional/websockets/client/authentication_tests.cpp
-+++ cpprest/Release/tests/functional/websockets/client/authentication_tests.cpp
-@@ -93,6 +93,7 @@ SUITE(authentication_tests)
-         return false;
-     }
- 
-+    /*
-     TEST(ssl_test)
-     {
-         websocket_client client;
-@@ -127,6 +128,7 @@ SUITE(authentication_tests)
-             throw;
-         }
-     }
-+    */
- 
-     void handshake_error_test_impl(const ::utility::string_t& host)
-     {
-@@ -148,11 +150,11 @@ SUITE(authentication_tests)
-         }
-     }
- 
--    TEST(self_signed_cert) { handshake_error_test_impl(U("wss://self-signed.badssl.com/")); }
-+    //TEST(self_signed_cert) { handshake_error_test_impl(U("wss://self-signed.badssl.com/")); }
- 
--    TEST(hostname_mismatch) { handshake_error_test_impl(U("wss://wrong.host.badssl.com/")); }
-+    //TEST(hostname_mismatch) { handshake_error_test_impl(U("wss://wrong.host.badssl.com/")); }
- 
--    TEST(cert_expired) { handshake_error_test_impl(U("wss://expired.badssl.com/")); }
-+    //TEST(cert_expired) { handshake_error_test_impl(U("wss://expired.badssl.com/")); }
- 
- } // SUITE(authentication_tests)
- 
-Index: cpprest/Release/tests/functional/http/client/connections_and_errors.cpp
-===================================================================
---- cpprest.orig/Release/tests/functional/http/client/connections_and_errors.cpp
-+++ cpprest/Release/tests/functional/http/client/connections_and_errors.cpp
-@@ -408,6 +408,7 @@
-     }
- #endif
- 
-+    /*
-     // Try to connect to a server on a closed port and cancel the operation.
-     TEST_FIXTURE(uri_address, cancel_bad_port)
-     {
-@@ -439,6 +440,7 @@
- 
-         VERIFY_THROWS_HTTP_ERROR_CODE(t.get(), std::errc::operation_canceled);
-     }
-+    */
- 
- } // SUITE(connections_and_errors)
- 
---- cpprest-2.10.16.orig/Release/tests/functional/http/client/redirect_tests.cpp
-+++ cpprest-2.10.16/Release/tests/functional/http/client/redirect_tests.cpp
-@@ -159,7 +159,7 @@ SUITE(redirect_tests)
-             VERIFY_NO_THROWS(reply.get());
-         }
-     }
--
-+/*
-     TEST(does_not_follow_https_to_http_by_default)
-     {
-         handle_timeout([] {
-@@ -182,7 +182,7 @@ SUITE(redirect_tests)
-             );
-         });
-     }
--
-+*/
-     TEST_FIXTURE(uri_address, follows_permanent_redirect)
-     {
- #if USING_WINHTTP
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb
new file mode 100644
index 0000000000..f8af506f4d
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
+SECTION = "libs/network"
+HOMEPAGE = "https://github.com/cpprest-lts/cpprestsdk/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
+DEPENDS = "openssl websocketpp zlib boost brotli"
+
+EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake/cpprestsdk -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF -DCPPREST_TEST_NETWORK=OFF"
+
+SRC_URI = "git://github.com/cpprest-lts/cpprestsdk.git;protocol=https;branch=cpprest-lts \
+           file://63.patch \
+           file://64.patch \
+           file://65.patch "
+
+# tag 2.10.20+cpprest-lts
+SRCREV = "feadb5b7d01a09d124d6d6c7bfeee648c15b37d1"
+
+inherit cmake pkgconfig
-- 
2.43.0

