Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7FB7BE7C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 11:40:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id g67so10400175wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 03:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=C7zVVXEPk8A59LGhnIUt3qGeGMvYGkNOhTUcnZ6jwQo=;
	b=irFv5cQT7weeBshX/ceLjJhPmrGJCTseqswWTcY75Zo88uUBcH/d/tSistwFb6SpSk
	59Xo7y5tVQTPWDavfVtB/w/PmtWD054JS4NjJ8h1FtOznc6U02lIXNOY5jHlQ8vLyPSp
	KnIz3mt2OZWvDYiQb+QLj4lHqt18mh7nMW99ahK9TSiZLAnwbnJ6PanKnYxQT6F5BbCO
	1TrVCgGqCzlGpuj/0ZP5AfpIypEBVQRpYO2+CNToT4cTpGQfqq4z0FSssYkZbt2dLm4F
	IRlL9wOLgjKkBkhtq8EDrphONuCX0swOtWrs2DrHw82/FXRSJqGflW1xY2Vmy3uie+dK
	KpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C7zVVXEPk8A59LGhnIUt3qGeGMvYGkNOhTUcnZ6jwQo=;
	b=NxqIFMI1yn0BSGEmXdqPaJKp0sGF4pVDg+L5lSVPGmsbmV7GZoL+QQCYBO+VMoNZGP
	xokZypepuhCKitS42pPIbKRRvQ+NWIPuYLmGT3y6M41jZrPOYj9zGm/WWWKQ91U9Xvbo
	ibW999rf3vuDxqPVwWPRUBpSrvsYBxpDDAoR5Tl2Bm4erFWAHxccRPUhiYlssP94S7I7
	89BT1Qs0pf7l4zlPp56UaK7x4sXJLc1wAR7VCHmphwMLDjN7kJaqXMdlz7FhreRry5RQ
	uy0DVjZbMRtFB+rQ9F4dgnmDurxTc+pcWQMIERZt1piuFegbzW1+lvS/rfdxgZg5s2iP
	HD8w==
X-Gm-Message-State: AJcUuke6iClHqvwPvbDuYSTptANDteftl3cl887JnAvPCHGrMsJvNZN3
	PnncctQj6gEBGP5oMVukFHZf1qgZ
X-Google-Smtp-Source: ALg8bN5Nj13sVfvco09ZYpZnyNPZTU5jpU/aIgWR1ezNtffC4fwX9elwqNg/YrS44jLAoOV1JzCMYA==
X-Received: by 2002:a1c:7011:: with SMTP id l17mr23673403wmc.34.1548070838182; 
	Mon, 21 Jan 2019 03:40:38 -0800 (PST)
Received: from Unimatrix05-Bionic.lan ([2.238.240.162])
	by smtp.gmail.com with ESMTPSA id
	n82sm49005629wma.42.2019.01.21.03.40.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 03:40:37 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2019 12:40:34 +0100
Message-Id: <20190121114034.25655-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: update to 2.10.9, drop patches
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
X-List-Received-Date: Mon, 21 Jan 2019 11:40:38 -0000

---
 .../cpprest/cpprest/disable-float-tests.patch |  25 ---
 .../cpprest/disable-outside-tests.patch       | 142 ------------------
 .../cpprest/disable-test-timeouts.patch       | 103 -------------
 .../{cpprest_2.10.8.bb => cpprest_2.10.9.bb}  |   7 +-
 4 files changed, 2 insertions(+), 275 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.8.bb => cpprest_2.10.9.bb} (73%)

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
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.9.bb
similarity index 73%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.9.bb
index b4b1c81e8..4bdc5c682 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.9.bb
@@ -8,13 +8,10 @@ DEPENDS = "openssl websocketpp zlib boost brotli"
 EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
 
 SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
-           file://disable-outside-tests.patch \
-           file://disable-test-timeouts.patch \
-           file://disable-float-tests.patch \
            "
 
-# tag 2.10.8
-SRCREV= "204a52610234ac5180e80a6883b62c0ad085f51e"
+# tag 2.10.9
+SRCREV= "8f0393dd7be08f2d9b44cc09b8b97f9bafb109a5"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


