Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id EC1B479D6A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 17:35:28 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l9so24301535wrt.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 09:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=21gPo8REdQwiWHIpG/Dp/K7gA/0203GgEoK2maAdKPk=;
	b=hCbDIGREDMl3+2NVweDV5qVJu4DAyvV65CpAClBCNLL62P4wnVGN7jnAehx6xKeuZo
	9GZHAtQkjSD4t8j6Qx5da3gkCKceSbs1iJuPYFlZEf8K/NqjYo+reKzcvEnshZupTpOe
	mHQR7juHloJkmRg6wkUPLwUS2T0TnPOZKiBxx3kBtmtkjZJdqi8OB6EezPLp/Hivfrib
	sXrSrhHStJ/pGYe4txbNraEP8QL46dXeabo0LUGwR5HMIAhQjGCLHztaJBIjCpNJGwnx
	byzGqUGGCDO4NFOf6MF4u+pGF6m4SGMYK6gHmrmLL3OHj7iIk1U115Hzr+UJVvLY6ba6
	UD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=21gPo8REdQwiWHIpG/Dp/K7gA/0203GgEoK2maAdKPk=;
	b=BvEeqv3Yhfhl6/0Ze8Y2UpMkkvNEp2TZGH+81GfAmpcLaKMbV2OH1Yg4gZjQecu34q
	D2Oq3wmXu12nKGAspsvFgnE/1JMZqBC0cMiXpSXr4yFS8KgMDat3e9ILe2CDLHuhpxdx
	VBAd4mrKdQUFQRlGzajPzLyWL+QWpwEAk5X+7eRXjYKDnA/NIxxUyABrQIYZtzPu2TiJ
	U3HkPHLxpkLQPv9/nLCZDdq+CBv2pYiOi+GxQ5fs3X4dkbZpbcdx75TJmboZDh+ORXP8
	bYdjCjtY+AL6ZEOOaZha5ySm3TxPUOGNr0K3Zp1EJ/oN063rxbNWWBjytLNtHMnCuioI
	Gjpg==
X-Gm-Message-State: AJcUuke+smIhiciOtqAnq9kMOudnBrABGrrSySDFXzAk3ekVdJNj16qm
	pEagXShN4rFv4yzBdPYKrvgmvkSO
X-Google-Smtp-Source: ALg8bN45gI51+l67KOcTwpgSuDHulrD06OzwUwj/1whNOho0N9UYrn7LIOYLQUmqiCeQXUKF/UMBwA==
X-Received: by 2002:a5d:45d0:: with SMTP id b16mr15048831wrs.86.1548092129172; 
	Mon, 21 Jan 2019 09:35:29 -0800 (PST)
Received: from localhost.localdomain ([93.68.193.65])
	by smtp.gmail.com with ESMTPSA id
	h16sm189675871wrb.62.2019.01.21.09.35.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 09:35:28 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2019 18:35:24 +0100
Message-Id: <20190121173524.11180-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: update to 2.10.9, drop patches, now useless in this version. Seems like with both Ubuntu, Debian and Yocto builds that network is not accessed anymore with this upstream release.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2019 17:35:29 -0000

---
 .../cpprest/cpprest/disable-float-tests.patch |  25 ---
 .../cpprest/disable-outside-tests.patch       | 142 ------------------
 .../cpprest/disable-test-timeouts.patch       | 103 -------------
 .../recipes-support/cpprest/cpprest_2.10.8.bb |  21 ---
 4 files changed, 291 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb

diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
deleted file mode 100644
index 75f74ec65..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Description: new toolchain might have increased the float precision
-Author: Gianfranco Costamagna <locutusofborg@debian.org>
-Last-Update: 2017-10-28
-Forwarded: https://github.com/Microsoft/cpprestsdk/issues/576
-
---- casablanca-2.10.0.orig/Release/tests/functional/streams/istream_tests.cpp
-+++ casablanca-2.10.0/Release/tests/functional/streams/istream_tests.cpp
-@@ -1302,7 +1302,7 @@ void compare_float(float expected, float
- {
-     compare_floating(expected, actual, FLT_EPSILON);
- }
--
-+/*
- TEST(extract_floating_point)
- {
-     std::string test_string;
-@@ -1349,7 +1349,7 @@ TEST(extract_floating_point)
-             VERIFY_ARE_EQUAL(1 / expected, 1 / actual);
-     } while (!std_istream.eof());
- }
--
-+*/
- TEST(extract_floating_point_with_exceptions)
- {
-     std::vector<std::pair<std::string, std::string>> tests;
diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
deleted file mode 100644
index 2dff0d97c..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-Description: Debian forbids calls to external websites.
-
-Author: Gianfranco Costamagna <locutus@debian.org>
-Origin: Debian
-Forwarded: not-needed
-Reviewed-By: Gianfranco Costamagna <locutusofborg@debian.org>
-Last-Update: 2015-11-25
-
-Index: casablanca/Release/tests/functional/http/client/CMakeLists.txt
-===================================================================
---- casablanca.orig/Release/tests/functional/http/client/CMakeLists.txt
-+++ casablanca/Release/tests/functional/http/client/CMakeLists.txt
-@@ -12,7 +12,6 @@
-   multiple_requests.cpp
-   oauth1_tests.cpp
-   oauth2_tests.cpp
--  outside_tests.cpp
-   pipeline_stage_tests.cpp
-   progress_handler_tests.cpp
-   proxy_tests.cpp
-Index: casablanca/Release/tests/functional/http/client/authentication_tests.cpp
-===================================================================
---- casablanca.orig/Release/tests/functional/http/client/authentication_tests.cpp
-+++ casablanca/Release/tests/functional/http/client/authentication_tests.cpp
-@@ -663,15 +663,19 @@
-     VERIFY_ARE_EQUAL(return_code, response.status_code());
- }
- 
-+/*
- TEST(auth_no_data)
- {
-     auth_test_impl(false);
- }
-+*/
- 
-+/*
- TEST(unsuccessful_auth_with_basic_cred)
- {
-     auth_test_impl(true);
- }
-+*/
- 
- TEST_FIXTURE(uri_address, set_user_options_asio_http)
- {
-@@ -692,7 +696,7 @@
-     auto response = client.request(methods::GET).get();
-     VERIFY_ARE_EQUAL(200, response.status_code());
- }
--
-+/*
- TEST_FIXTURE(uri_address, set_user_options_asio_https)
- {
-     handle_timeout([]
-@@ -714,7 +718,7 @@
-         VERIFY_IS_FALSE(v.empty());
-     });
- }
--
-+*/
- #endif
- 
- } // SUITE(authentication_tests)
-Index: casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
-===================================================================
---- casablanca.orig/Release/tests/functional/websockets/client/authentication_tests.cpp
-+++ casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
-@@ -86,7 +86,7 @@
-     }
-     return false;
- }
--
-+/*
- TEST(ssl_test)
- {
-     websocket_client client;
-@@ -122,7 +122,7 @@
-         throw;
-     }
- }
--
-+*/
- // These tests are specific to our websocketpp based implementation.
- #if !defined(__cplusplus_winrt)
- 
-@@ -153,14 +153,15 @@
-         throw;
-     }
- }
--
-+/*
- // Test specifically for server SignalR team hit interesting cases with.
- TEST(sni_with_older_server_test)
- {
-     websocket_client client;
-     sni_test_impl(client);
- }
--
-+*/
-+/*
- // WinRT doesn't expose option for disabling.
- // No stable server is available to reliably test this.
- // The configuration below relies on a timeout in the success case.
-@@ -188,7 +189,8 @@
-         throw;
-     }
- }
--
-+*/
-+/*
- // Winrt doesn't allow explicitly setting server host for SNI.
- TEST(sni_explicit_hostname)
- {
-@@ -199,7 +201,7 @@
-     websocket_client client(config);
-     sni_test_impl(client);
- }
--
-+*/
- void handshake_error_test_impl(const ::utility::string_t &host)
- {
-     websocket_client client;
-Index: casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
-===================================================================
---- casablanca.orig/Release/tests/functional/http/client/connections_and_errors.cpp
-+++ casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
-@@ -415,6 +415,7 @@
- }
- #endif
- 
-+/*
- // Try to connect to a server on a closed port and cancel the operation.
- TEST_FIXTURE(uri_address, cancel_bad_port)
- {
-@@ -446,7 +447,7 @@
- 
-     VERIFY_THROWS_HTTP_ERROR_CODE(t.get(), std::errc::operation_canceled);
- }
--
-+*/
- } // SUITE(connections_and_errors)
- 
- }}}}
diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch
deleted file mode 100644
index 93c3e8a26..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-Description: Some tests takes too long on slow architectures and timeouts
- We can safely disable them.
- e.g.
- Release/tests/functional/http/client/connections_and_errors.cpp:142: error: Failure in request_timeout_microsecond: Test case timed out and is hung. Aborting all remaining test cases. Expected under 180000ms. FAILED
-
-Index: casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
-===================================================================
---- casablanca.orig/Release/tests/functional/http/client/connections_and_errors.cpp
-+++ casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
-@@ -127,7 +127,7 @@
-     // Try sending another request.
-     VERIFY_THROWS(client.request(methods::GET).wait(), web::http::http_exception);
- }
--
-+/*
- TEST_FIXTURE(uri_address, request_timeout)
- {
-     test_http_server::scoped_server scoped(m_uri);
-@@ -146,7 +146,8 @@
- #endif
-     t.get();
- }
--
-+*/
-+/*
- TEST_FIXTURE(uri_address, request_timeout_microsecond)
- {
-     pplx::task<test_request*> t;
-@@ -168,7 +169,7 @@
-     try { t.get(); }
-     catch (...) {}
- }
--
-+*/
- TEST_FIXTURE(uri_address, invalid_method)
- {
-     web::http::uri uri(U("http://www.bing.com/"));
-Index: casablanca/Release/tests/functional/http/listener/requests_tests.cpp
-===================================================================
---- casablanca.orig/Release/tests/functional/http/listener/requests_tests.cpp
-+++ casablanca/Release/tests/functional/http/listener/requests_tests.cpp
-@@ -173,7 +173,7 @@
- 
-     listener.close().wait();
- }
--
-+/*
- TEST_FIXTURE(uri_address, response_order)
- {
-     http_listener listener(m_uri);
-@@ -217,7 +217,7 @@
- 
-     listener.close().wait();
- }
--
-+*/
- TEST_FIXTURE(uri_address, uri_encoding, "Ignore", "Codeplex 201")
- {
-     http_listener listener(m_uri);
-Index: casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
-===================================================================
---- casablanca.orig/Release/tests/functional/websockets/client/authentication_tests.cpp
-+++ casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
-@@ -221,7 +221,7 @@
-         VERIFY_ARE_EQUAL("TLS handshake failed", e.error_code().message());
-     }
- }
--
-+/*
- TEST(self_signed_cert)
- {
-     handshake_error_test_impl(U("wss://self-signed.badssl.com/"));
-@@ -236,7 +236,7 @@
- {
-     handshake_error_test_impl(U("wss://expired.badssl.com/"));
- }
--
-+*/
- #endif
- 
- } // SUITE(authentication_tests)
-Index: casablanca/Release/tests/functional/websockets/client/client_construction.cpp
-===================================================================
---- casablanca.orig/Release/tests/functional/websockets/client/client_construction.cpp
-+++ casablanca/Release/tests/functional/websockets/client/client_construction.cpp
-@@ -81,7 +81,7 @@
-     VERIFY_ARE_EQUAL(config2.credentials().username(), cred.username());
- }
- 
--
-+/*
- // Verify that we can get the baseuri from websocket_client connect.
- TEST_FIXTURE(uri_address, uri_test)
- {
-@@ -101,7 +101,7 @@
-     VERIFY_ARE_EQUAL(client2.uri(), m_uri);
-     client2.close().wait();
- }
--
-+*/
- TEST_FIXTURE(uri_address, move_operations)
- {
-     std::string body("hello");
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
deleted file mode 100644
index b4b1c81e8..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
-SECTION = "libs/network"
-HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
-DEPENDS = "openssl websocketpp zlib boost brotli"
-
-EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
-
-SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
-           file://disable-outside-tests.patch \
-           file://disable-test-timeouts.patch \
-           file://disable-float-tests.patch \
-           "
-
-# tag 2.10.8
-SRCREV= "204a52610234ac5180e80a6883b62c0ad085f51e"
-
-S = "${WORKDIR}/git"
-
-inherit cmake pkgconfig
-- 
2.17.1


