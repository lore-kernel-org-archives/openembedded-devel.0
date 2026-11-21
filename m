Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18280.1795274085617208344
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Nov 2026 07:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SSvATqkc;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb628232d2so1088393a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2026 07:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795274085; x=1795878885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOZdnVR27xUzXKiGfY0VkkeqXzIjMTxnp6F336Gwqbc=;
        b=SSvATqkc7kgFo29d8qD9kHfI4FpJZkqbNw5ltK/RLOZSyrLhNpfqRSxpFvMmdZWu+H
         2/+bm9KlTDuuy31vQ8QX+OGBdjyZqf4G79L0OhjqMCoBJAwYbIfnLVvlIuO0tAJ9lChq
         0SBlC5wBc4Bkt501TnaivQxI58NEybqkeKp19KPsQDQ3nomMyD+g996x3T2V5q6mR/tK
         IB3pdimqtnA3WuCAXoFFbPokMczvqY4cYT8icyWPJCi7EtBWNVCWFmpSs3SdP6FonGXb
         sP4HgyX51/dx93QekrlaAIe/5ZNb/Vpnbb/+5PvHq9d0FzK3bo9EzCojZiZDodu4o/5z
         Q+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795274085; x=1795878885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOZdnVR27xUzXKiGfY0VkkeqXzIjMTxnp6F336Gwqbc=;
        b=S4xBAgkLhjYxTe2x3qHx/+7btbNNwYthTUQsJP1LiSDWYvImrj2kYrPT6pT2Vdd2tc
         fYNYbI401FTmLkr6d/tTdiNf8JEJpw7xJgCVj9n6kbgofY8s75IEUBlUAlqI/yzSydGB
         QTUK3CmoJ4bnMDDz2drTXYvsh0L9Znl9TIlFrVPo6FSdh80Xral7eEMBvTugzx52w3Hs
         RidS5qfChirzpgpopTKgTPFw7emND2RU5DjPT1BNULLPk+Q0Xc34lJr32HzW2I7v4Gd3
         96V4IP9EFclsmAVivcIMjg3HM6gvwIj2CXI7BqqSe1zs8Nm9lTm15STE+PHDTLyfF2Tl
         gPOA==
X-Gm-Message-State: APuU4Z8UdqeLkCu0UVpRCLeQlJNB6KJoGaAzhNvfbcMCHfkshLFMDnSj
	kDBk2bBxssNEzbh763RcjNf8IHaXLAa4L0ZEZwt5LaVg59Ewqp7mrRD2NsZ8sZ/Y58c=
X-Gm-Gg: AZFdTZev/Bfj+0x85/H+f3MJE8lbx/ax7XWeX6i3OJ3oytmtiiOthr13hoF4B4HAo2H
	5k6N0W3p9F6HOl6emMqwaD2huSgQV7jofsR7TD+l3Hx+Csvd6gjNhMpBf7vu7vhiYLQM1kAkth3
	JExu0adPRPc3AZYbTc7SJIX4auciFmoDEufgClf+p2F6jqPiH49MyepVUNPxCsJ4ctYjn6DOju6
	9G5eJtVrP0aMjSW00j+Iyl2iy4omccPVhFgI+Nw11RVKLo5/uQR9GDQ1K23ZnHqnpck08OaWbFI
	No5QY5cj1QeFYHeZXyiHgRdr0jE91iCS2Y8kLvaojZZFCJaEjAR5hQpEI4VR8DxC/wVXoTYBwOG
	v8MbiUeL1rVWqwJQmW4STXsu1gRjbgFBLyrNWq/E4GRY5W3LpQXEmdB+s8UcZWZl3ja/seteKqF
	BlJNSW3QuA6Mdu+y/9/dMFo1VMpuDXX/ubjc61e9XHow7I5o5JpZMjMn6P/57cfmO8b2aSaavLI
	YyWPWDML05LCxR06vEhabm6ELsMlFOMKP5CK/rDueUgyRvmzePWMxPM8G5mMvzNruXn9f3BUf/d
	ZLX9yd1NN2ZSE2Irtw2kJEmL/WF/QsfsUW+pb5lFcQDEZ+RWfH4v+mjqFB0q5cjXNZwefGUT4ay
	Kpeg1p7x25/bbmFPWlv6ePUM5
X-Received: by 2002:a17:90b:4d0a:b0:3b4:9d6:5be3 with SMTP id 98e67ed59e1d1-3b41c8fe203mr6122516a91.11.1795274084659;
        Sat, 21 Nov 2026 07:14:44 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from dld58y9k4-lin.dl.net ([2a02:b025:10:781d:2409:bedd:89f:9832])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm7836015a91.7.2026.11.21.07.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 07:14:44 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: update patch with upstream-merged version
Date: Sat, 21 Nov 2026 16:14:31 +0100
Message-ID: <20261121151431.1433598-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2026 15:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132782
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../cpprest/cpprest/{64.patch => 68.patch}    | 135 +++++++-----------
 .../cpprest/cpprest_2.10.20+cpprest-lts.bb    |   6 +-
 2 files changed, 56 insertions(+), 85 deletions(-)
 rename meta-oe/recipes-support/cpprest/cpprest/{64.patch => 68.patch} (54%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest/64.patch b/meta-oe/recipes-support/cpprest/cpprest/68.patch
similarity index 54%
rename from meta-oe/recipes-support/cpprest/cpprest/64.patch
rename to meta-oe/recipes-support/cpprest/cpprest/68.patch
index b02db9e024..a680e14d89 100644
--- a/meta-oe/recipes-support/cpprest/cpprest/64.patch
+++ b/meta-oe/recipes-support/cpprest/cpprest/68.patch
@@ -1,78 +1,49 @@
-Upstream-Status: Submitted [https://github.com/cpprest-lts/cpprestsdk/pull/64]
-From 3d7f0bddff0971970b7692d86ee14873c0bc1755 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <locutusofborg@debian.org>
-Date: Fri, 13 Nov 2026 13:46:50 +0100
-Subject: [PATCH] Add CMake option to skip network-dependent tests
+Upstream-Status: Submitted [https://github.com/cpprest-lts/cpprestsdk/pull/68]
+From b2409a5dc8e53c60df35a78e2aa703a8f2ed66b8 Mon Sep 17 00:00:00 2001
+From: Gareth Sylvester-Bradley <garethsb@nvidia.com>
+Date: Mon, 16 Nov 2026 23:49:03 +0000
+Subject: [PATCH] Run the tests that need the internet as a separate ctest test
 
+Ten httpclient_test tests send requests to hosts on the internet, so
+they fail in a build environment without network access, such as a
+distribution package build. They now have "Requires", "network", like
+the badssl tests have "Requires", "badssl", so test_runner runs them
+only when it is passed /network.
+
+The new httpclient_test_network ctest test runs them, and has the
+network label. The badssl ctest tests also have the network label, so
+ctest -LE network runs every test that needs only the local machine.
+CI runs ctest -LE badssl, which still includes the network tests.
+
+Signed-off-by: Gareth Sylvester-Bradley <garethsb@nvidia.com>
 ---
- Release/CMakeLists.txt                             |  7 ++++++-
- Release/tests/common/TestRunner/test_runner.cpp    |  5 +++++
- .../tests/functional/http/client/CMakeLists.txt    |  2 +-
+ .../tests/functional/http/client/CMakeLists.txt    |  7 ++++++-
  .../http/client/authentication_tests.cpp           |  4 ++--
  .../http/client/connections_and_errors.cpp         |  2 +-
  .../tests/functional/http/client/outside_tests.cpp | 14 +++++++-------
  Release/tests/functional/websockets/CMakeLists.txt |  2 +-
- 7 files changed, 23 insertions(+), 13 deletions(-)
+ 5 files changed, 17 insertions(+), 12 deletions(-)
 
-diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
-index 9fc12840e..46a80aaf8 100644
---- a/Release/CMakeLists.txt
-+++ b/Release/CMakeLists.txt
-@@ -18,6 +18,7 @@ enable_testing()
- set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
- set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
- set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
-+set(CPPREST_TEST_NETWORK ON CACHE BOOL "Run tests requiring external network access.")
- set(CPPREST_EXCLUDE_BROTLI ON CACHE BOOL "Exclude Brotli compression functionality.")
- set(CPPREST_EXPORT_DIR cmake/cpprestsdk CACHE STRING "Directory to install CMake config files.")
- set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
-@@ -255,10 +256,14 @@ function(add_casablanca_test NAME SOURCES_VAR)
-       # so that they share one exception table and catch the wrong exception
-       target_link_libraries(${NAME} PRIVATE -Wl,-no_deduplicate)
-     endif()
-+      set(_test_runner_args)
-+      if(NOT CPPREST_TEST_NETWORK)
-+        list(APPEND _test_runner_args /skip-network)
-+      endif()
-     if (BUILD_SHARED_LIBS)
-       add_test(NAME ${NAME}
-         WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
--        COMMAND test_runner $<TARGET_FILE_NAME:${NAME}>
-+        COMMAND test_runner ${_test_runner_args} $<TARGET_FILE_NAME:${NAME}>
-       )
-     endif()
-   endif()
-diff --git a/Release/tests/common/TestRunner/test_runner.cpp b/Release/tests/common/TestRunner/test_runner.cpp
-index abd280c6d..c9f710fb5 100644
---- a/Release/tests/common/TestRunner/test_runner.cpp
-+++ b/Release/tests/common/TestRunner/test_runner.cpp
-@@ -268,6 +268,11 @@ static bool matched_properties(const UnitTest::TestProperties& test_props)
- #endif
- #endif
- 
-+    if (UnitTest::GlobalSettings::Has("skip-network") && test_props.Has("NetworkRequired"))
-+    {
-+        return false;
-+    }
-+
-     // The 'Require' property on a test case is special.
-     // It requires a certain global setting to be fulfilled to execute.
-     if (test_props.Has("Requires"))
 diff --git a/Release/tests/functional/http/client/CMakeLists.txt b/Release/tests/functional/http/client/CMakeLists.txt
-index e21242a5c..d50a839c4 100644
+index e21242a5c..4efeefd02 100644
 --- a/Release/tests/functional/http/client/CMakeLists.txt
 +++ b/Release/tests/functional/http/client/CMakeLists.txt
-@@ -27,7 +27,7 @@ set(SOURCES
- )
- 
- add_casablanca_test(httpclient_test SOURCES)
--if(BUILD_SHARED_LIBS)
-+if(BUILD_SHARED_LIBS AND CPPREST_TEST_NETWORK)
-   add_test(NAME httpclient_test_badssl
+@@ -32,7 +32,12 @@ if(BUILD_SHARED_LIBS)
      WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
      COMMAND test_runner /badssl /select:@Requires=badssl $<TARGET_FILE_NAME:httpclient_test>
+   )
+-  set_tests_properties(httpclient_test_badssl PROPERTIES LABELS badssl)
++  set_tests_properties(httpclient_test_badssl PROPERTIES LABELS "badssl;network")
++  add_test(NAME httpclient_test_network
++    WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
++    COMMAND test_runner /network /select:@Requires=network $<TARGET_FILE_NAME:httpclient_test>
++  )
++  set_tests_properties(httpclient_test_network PROPERTIES LABELS network)
+ endif()
+ if(TEST_LIBRARY_TARGET_TYPE STREQUAL "OBJECT")
+   target_include_directories(httpclient_test PRIVATE ../utilities/include)
 diff --git a/Release/tests/functional/http/client/authentication_tests.cpp b/Release/tests/functional/http/client/authentication_tests.cpp
-index c90046be3..b857a43bc 100644
+index c90046be3..6570ea668 100644
 --- a/Release/tests/functional/http/client/authentication_tests.cpp
 +++ b/Release/tests/functional/http/client/authentication_tests.cpp
 @@ -676,9 +676,9 @@ SUITE(authentication_tests)
@@ -80,15 +51,15 @@ index c90046be3..b857a43bc 100644
      }
  
 -    TEST(auth_no_data) { auth_test_impl(false); }
-+    TEST(auth_no_data, "NetworkRequired", "true") { auth_test_impl(false); }
++    TEST(auth_no_data, "Requires", "network") { auth_test_impl(false); }
  
 -    TEST(unsuccessful_auth_with_basic_cred) { auth_test_impl(true); }
-+    TEST(unsuccessful_auth_with_basic_cred, "NetworkRequired", "true") { auth_test_impl(true); }
++    TEST(unsuccessful_auth_with_basic_cred, "Requires", "network") { auth_test_impl(true); }
  
      TEST_FIXTURE(uri_address, set_user_options_asio_http)
      {
 diff --git a/Release/tests/functional/http/client/connections_and_errors.cpp b/Release/tests/functional/http/client/connections_and_errors.cpp
-index 26a3b33e3..8b8b10e60 100644
+index 26a3b33e3..3b0cb4172 100644
 --- a/Release/tests/functional/http/client/connections_and_errors.cpp
 +++ b/Release/tests/functional/http/client/connections_and_errors.cpp
 @@ -409,7 +409,7 @@ SUITE(connections_and_errors)
@@ -96,12 +67,12 @@ index 26a3b33e3..8b8b10e60 100644
  
      // Try to connect to a server on a closed port and cancel the operation.
 -    TEST_FIXTURE(uri_address, cancel_bad_port)
-+    TEST_FIXTURE(uri_address, cancel_bad_port, "NetworkRequired", "true")
++    TEST_FIXTURE(uri_address, cancel_bad_port, "Requires", "network")
      {
          // http_client_asio had a bug where, when canceled, it would cancel only the
          // current connection but then go and try the next address from the list of
 diff --git a/Release/tests/functional/http/client/outside_tests.cpp b/Release/tests/functional/http/client/outside_tests.cpp
-index b8147b1f8..29551a43c 100644
+index b8147b1f8..d1c3205cb 100644
 --- a/Release/tests/functional/http/client/outside_tests.cpp
 +++ b/Release/tests/functional/http/client/outside_tests.cpp
 @@ -41,7 +41,7 @@ namespace client
@@ -109,7 +80,7 @@ index b8147b1f8..29551a43c 100644
  SUITE(outside_tests)
  {
 -    TEST_FIXTURE(uri_address, outside_cnn_dot_com)
-+    TEST_FIXTURE(uri_address, outside_cnn_dot_com, "NetworkRequired", "true")
++    TEST_FIXTURE(uri_address, outside_cnn_dot_com, "Requires", "network")
      {
          handle_timeout([] {
              // http://www.cnn.com redirects users from countries outside of the US to the "http://edition.cnn.com/" drop
@@ -118,7 +89,7 @@ index b8147b1f8..29551a43c 100644
      }
  
 -    TEST_FIXTURE(uri_address, outside_wikipedia_compressed_http_response)
-+    TEST_FIXTURE(uri_address, outside_wikipedia_compressed_http_response, "NetworkRequired", "true")
++    TEST_FIXTURE(uri_address, outside_wikipedia_compressed_http_response, "Requires", "network")
      {
          if (web::http::compression::builtin::supported() == false)
          {
@@ -127,7 +98,7 @@ index b8147b1f8..29551a43c 100644
      }
  
 -    TEST_FIXTURE(uri_address, outside_google_dot_com)
-+    TEST_FIXTURE(uri_address, outside_google_dot_com, "NetworkRequired", "true")
++    TEST_FIXTURE(uri_address, outside_google_dot_com, "Requires", "network")
      {
          // Use code.google.com instead of www.google.com, which redirects
          http_client client(U("http://code.google.com"));
@@ -136,7 +107,7 @@ index b8147b1f8..29551a43c 100644
      }
  
 -    TEST_FIXTURE(uri_address, multiple_https_requests)
-+    TEST_FIXTURE(uri_address, multiple_https_requests, "NetworkRequired", "true")
++    TEST_FIXTURE(uri_address, multiple_https_requests, "Requires", "network")
      {
          handle_timeout([&] {
              // Use code.google.com instead of www.google.com, which redirects
@@ -145,7 +116,7 @@ index b8147b1f8..29551a43c 100644
  
  #if (defined(_MSC_VER) && (_MSC_VER >= 1900)) && !CPPREST_FORCE_PPLX
 -    TEST_FIXTURE(uri_address, multiple_https_requests_sync_scheduler)
-+    TEST_FIXTURE(uri_address, multiple_https_requests_sync_scheduler, "NetworkRequired", "true")
++    TEST_FIXTURE(uri_address, multiple_https_requests_sync_scheduler, "Requires", "network")
      {
          struct sync_scheduler : public scheduler_interface
          {
@@ -154,7 +125,7 @@ index b8147b1f8..29551a43c 100644
  #endif
  
 -    TEST_FIXTURE(uri_address, reading_google_stream)
-+    TEST_FIXTURE(uri_address, reading_google_stream, "NetworkRequired", "true")
++    TEST_FIXTURE(uri_address, reading_google_stream, "Requires", "network")
      {
          handle_timeout([&] {
              // Use code.google.com instead of www.google.com, which redirects
@@ -163,20 +134,20 @@ index b8147b1f8..29551a43c 100644
      }
  
 -    TEST_FIXTURE(uri_address, no_transfer_encoding_content_length)
-+    TEST_FIXTURE(uri_address, no_transfer_encoding_content_length, "NetworkRequired", "true")
++    TEST_FIXTURE(uri_address, no_transfer_encoding_content_length, "Requires", "network")
      {
          handle_timeout([] {
              http_client client(U("http://ws.audioscrobbler.com/2.0/") U(
 diff --git a/Release/tests/functional/websockets/CMakeLists.txt b/Release/tests/functional/websockets/CMakeLists.txt
-index 9a33589f5..ab7926c22 100644
+index 9a33589f5..7571f9305 100644
 --- a/Release/tests/functional/websockets/CMakeLists.txt
 +++ b/Release/tests/functional/websockets/CMakeLists.txt
-@@ -28,7 +28,7 @@ if (NOT CPPREST_EXCLUDE_WEBSOCKETS)
-   )
- 
-   add_casablanca_test(websocketsclient_test SOURCES)
--  if(BUILD_SHARED_LIBS)
-+  if(BUILD_SHARED_LIBS AND CPPREST_TEST_NETWORK)
-     add_test(NAME websocketsclient_test_badssl
+@@ -33,7 +33,7 @@ if (NOT CPPREST_EXCLUDE_WEBSOCKETS)
        WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
        COMMAND test_runner /badssl /select:@Requires=badssl $<TARGET_FILE_NAME:websocketsclient_test>
+     )
+-    set_tests_properties(websocketsclient_test_badssl PROPERTIES LABELS badssl)
++    set_tests_properties(websocketsclient_test_badssl PROPERTIES LABELS "badssl;network")
+   endif()
+   if(NOT TEST_LIBRARY_TARGET_TYPE STREQUAL "OBJECT")
+     target_link_libraries(websocketsclient_test PRIVATE websockettest_utilities)
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb
index f8af506f4d..f5f0815023 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb
@@ -5,12 +5,12 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
 DEPENDS = "openssl websocketpp zlib boost brotli"
 
-EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake/cpprestsdk -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF -DCPPREST_TEST_NETWORK=OFF"
+EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake/cpprestsdk -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF"
 
 SRC_URI = "git://github.com/cpprest-lts/cpprestsdk.git;protocol=https;branch=cpprest-lts \
            file://63.patch \
-           file://64.patch \
-           file://65.patch "
+           file://65.patch \
+           file://68.patch "
 
 # tag 2.10.20+cpprest-lts
 SRCREV = "feadb5b7d01a09d124d6d6c7bfeee648c15b37d1"
-- 
2.43.0

