Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7E59779CC0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 16:11:56 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id l12so24067125qtf.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 08:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u92pF/5z7v4/5C9P2do66Y6eUZO+zK0dLSx8x/sfKwk=;
	b=EdokEZVZocUd5iWTeDBZcclSYh1dqgf5nFjoa0LYeSTNYI4FYDON6TA/hPTmPJcJXN
	pdkfYBt/AHOo0CAMsecbMF3ObPfgMk4fJuku6bcY9CB8JJ5U40ZZjDUa4us7cPm1WqQ5
	FsG7jTJsDq0cXGhzZNBLXlj3kI0wxV/wDvrZyhSvmr6u+dzKhg7TwgJubIRJBCRoSzkO
	Rw62xFx/6RLlHsYZ+jCrEN0Xply7zoY2CCEeyQF9LGcexyjc+d9jDal5gsFPAKpZ4GgG
	kf86oLC7xj1LUymagxHqcJh9o2YmcEm4wXjK9SXns3dv1gR0OWa+UIhFPc1D3s5NfMKY
	GZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u92pF/5z7v4/5C9P2do66Y6eUZO+zK0dLSx8x/sfKwk=;
	b=aeqlfwS4ZfDWYoOy+S2sx9GeMAvoukttyb/z1R0tmFD1TBNiuuy20zr1+7B8icL3Am
	CJbCmVqdxbNg9nWuB+r2VHFxaXxwxmDEXDm3RVsYp327Lriy6f89wagArWaSdcqPecnG
	FgcTw0T299AtEsRJ3umVDf0SgsPNcvYxBKl/c+bb1El5/8GWmO2j0ReNyXv+b9EBnkcK
	6LKZehm4urIyVzmfi1NPfcb0q0B/Sq5IQ+vv3tLILLR0zt0nH5+y0PWnZyaO0RUbrt+D
	XKzQLLtsLNlzXZKf3+oJIocT4JxajMi8d4pVDBu0fq9CNNK3eOXBgt/gJk/F+c64AYsu
	iTIw==
X-Gm-Message-State: AJcUukckvYL5VJ+xkFcI31ja7R1pUn3E5EOoywvJChYxZqZ4pAxHlMfI
	s4sxGAvBlAtn0A9OF7ExqnqkU3CYnKo4MnzRjwY=
X-Google-Smtp-Source: ALg8bN6TYQ5qNqNBcui5pgVNPZfdqEB1Vczn1j1Xu4+9GiO2dJSShKqHEo0sKke4R6llvLR4FTDCqwLlzrzw7ZuzG6Y=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr26725926qva.50.1548087117022; 
	Mon, 21 Jan 2019 08:11:57 -0800 (PST)
MIME-Version: 1.0
References: <20190121114034.25655-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20190121114034.25655-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Jan 2019 08:11:31 -0800
Message-ID: <CAMKF1sr_MWHVHJdd8bOsUk95bPfzPFh9cY2inT31q3Sct5CjqA@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpprest: update to 2.10.9, drop patches
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
X-List-Received-Date: Mon, 21 Jan 2019 16:11:56 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Gianfranco

why are patches dropped

On Mon, Jan 21, 2019 at 3:40 AM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>
> ---
>  .../cpprest/cpprest/disable-float-tests.patch |  25 ---
>  .../cpprest/disable-outside-tests.patch       | 142 ------------------
>  .../cpprest/disable-test-timeouts.patch       | 103 -------------
>  .../{cpprest_2.10.8.bb => cpprest_2.10.9.bb}  |   7 +-
>  4 files changed, 2 insertions(+), 275 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
>  delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
>  delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch
>  rename meta-oe/recipes-support/cpprest/{cpprest_2.10.8.bb => cpprest_2.10.9.bb} (73%)
>
> diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
> deleted file mode 100644
> index 75f74ec65..000000000
> --- a/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Description: new toolchain might have increased the float precision
> -Author: Gianfranco Costamagna <locutusofborg@debian.org>
> -Last-Update: 2017-10-28
> -Forwarded: https://github.com/Microsoft/cpprestsdk/issues/576
> -
> ---- casablanca-2.10.0.orig/Release/tests/functional/streams/istream_tests.cpp
> -+++ casablanca-2.10.0/Release/tests/functional/streams/istream_tests.cpp
> -@@ -1302,7 +1302,7 @@ void compare_float(float expected, float
> - {
> -     compare_floating(expected, actual, FLT_EPSILON);
> - }
> --
> -+/*
> - TEST(extract_floating_point)
> - {
> -     std::string test_string;
> -@@ -1349,7 +1349,7 @@ TEST(extract_floating_point)
> -             VERIFY_ARE_EQUAL(1 / expected, 1 / actual);
> -     } while (!std_istream.eof());
> - }
> --
> -+*/
> - TEST(extract_floating_point_with_exceptions)
> - {
> -     std::vector<std::pair<std::string, std::string>> tests;
> diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
> deleted file mode 100644
> index 2dff0d97c..000000000
> --- a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
> +++ /dev/null
> @@ -1,142 +0,0 @@
> -Description: Debian forbids calls to external websites.
> -
> -Author: Gianfranco Costamagna <locutus@debian.org>
> -Origin: Debian
> -Forwarded: not-needed
> -Reviewed-By: Gianfranco Costamagna <locutusofborg@debian.org>
> -Last-Update: 2015-11-25
> -
> -Index: casablanca/Release/tests/functional/http/client/CMakeLists.txt
> -===================================================================
> ---- casablanca.orig/Release/tests/functional/http/client/CMakeLists.txt
> -+++ casablanca/Release/tests/functional/http/client/CMakeLists.txt
> -@@ -12,7 +12,6 @@
> -   multiple_requests.cpp
> -   oauth1_tests.cpp
> -   oauth2_tests.cpp
> --  outside_tests.cpp
> -   pipeline_stage_tests.cpp
> -   progress_handler_tests.cpp
> -   proxy_tests.cpp
> -Index: casablanca/Release/tests/functional/http/client/authentication_tests.cpp
> -===================================================================
> ---- casablanca.orig/Release/tests/functional/http/client/authentication_tests.cpp
> -+++ casablanca/Release/tests/functional/http/client/authentication_tests.cpp
> -@@ -663,15 +663,19 @@
> -     VERIFY_ARE_EQUAL(return_code, response.status_code());
> - }
> -
> -+/*
> - TEST(auth_no_data)
> - {
> -     auth_test_impl(false);
> - }
> -+*/
> -
> -+/*
> - TEST(unsuccessful_auth_with_basic_cred)
> - {
> -     auth_test_impl(true);
> - }
> -+*/
> -
> - TEST_FIXTURE(uri_address, set_user_options_asio_http)
> - {
> -@@ -692,7 +696,7 @@
> -     auto response = client.request(methods::GET).get();
> -     VERIFY_ARE_EQUAL(200, response.status_code());
> - }
> --
> -+/*
> - TEST_FIXTURE(uri_address, set_user_options_asio_https)
> - {
> -     handle_timeout([]
> -@@ -714,7 +718,7 @@
> -         VERIFY_IS_FALSE(v.empty());
> -     });
> - }
> --
> -+*/
> - #endif
> -
> - } // SUITE(authentication_tests)
> -Index: casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
> -===================================================================
> ---- casablanca.orig/Release/tests/functional/websockets/client/authentication_tests.cpp
> -+++ casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
> -@@ -86,7 +86,7 @@
> -     }
> -     return false;
> - }
> --
> -+/*
> - TEST(ssl_test)
> - {
> -     websocket_client client;
> -@@ -122,7 +122,7 @@
> -         throw;
> -     }
> - }
> --
> -+*/
> - // These tests are specific to our websocketpp based implementation.
> - #if !defined(__cplusplus_winrt)
> -
> -@@ -153,14 +153,15 @@
> -         throw;
> -     }
> - }
> --
> -+/*
> - // Test specifically for server SignalR team hit interesting cases with.
> - TEST(sni_with_older_server_test)
> - {
> -     websocket_client client;
> -     sni_test_impl(client);
> - }
> --
> -+*/
> -+/*
> - // WinRT doesn't expose option for disabling.
> - // No stable server is available to reliably test this.
> - // The configuration below relies on a timeout in the success case.
> -@@ -188,7 +189,8 @@
> -         throw;
> -     }
> - }
> --
> -+*/
> -+/*
> - // Winrt doesn't allow explicitly setting server host for SNI.
> - TEST(sni_explicit_hostname)
> - {
> -@@ -199,7 +201,7 @@
> -     websocket_client client(config);
> -     sni_test_impl(client);
> - }
> --
> -+*/
> - void handshake_error_test_impl(const ::utility::string_t &host)
> - {
> -     websocket_client client;
> -Index: casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
> -===================================================================
> ---- casablanca.orig/Release/tests/functional/http/client/connections_and_errors.cpp
> -+++ casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
> -@@ -415,6 +415,7 @@
> - }
> - #endif
> -
> -+/*
> - // Try to connect to a server on a closed port and cancel the operation.
> - TEST_FIXTURE(uri_address, cancel_bad_port)
> - {
> -@@ -446,7 +447,7 @@
> -
> -     VERIFY_THROWS_HTTP_ERROR_CODE(t.get(), std::errc::operation_canceled);
> - }
> --
> -+*/
> - } // SUITE(connections_and_errors)
> -
> - }}}}
> diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch
> deleted file mode 100644
> index 93c3e8a26..000000000
> --- a/meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -Description: Some tests takes too long on slow architectures and timeouts
> - We can safely disable them.
> - e.g.
> - Release/tests/functional/http/client/connections_and_errors.cpp:142: error: Failure in request_timeout_microsecond: Test case timed out and is hung. Aborting all remaining test cases. Expected under 180000ms. FAILED
> -
> -Index: casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
> -===================================================================
> ---- casablanca.orig/Release/tests/functional/http/client/connections_and_errors.cpp
> -+++ casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
> -@@ -127,7 +127,7 @@
> -     // Try sending another request.
> -     VERIFY_THROWS(client.request(methods::GET).wait(), web::http::http_exception);
> - }
> --
> -+/*
> - TEST_FIXTURE(uri_address, request_timeout)
> - {
> -     test_http_server::scoped_server scoped(m_uri);
> -@@ -146,7 +146,8 @@
> - #endif
> -     t.get();
> - }
> --
> -+*/
> -+/*
> - TEST_FIXTURE(uri_address, request_timeout_microsecond)
> - {
> -     pplx::task<test_request*> t;
> -@@ -168,7 +169,7 @@
> -     try { t.get(); }
> -     catch (...) {}
> - }
> --
> -+*/
> - TEST_FIXTURE(uri_address, invalid_method)
> - {
> -     web::http::uri uri(U("http://www.bing.com/"));
> -Index: casablanca/Release/tests/functional/http/listener/requests_tests.cpp
> -===================================================================
> ---- casablanca.orig/Release/tests/functional/http/listener/requests_tests.cpp
> -+++ casablanca/Release/tests/functional/http/listener/requests_tests.cpp
> -@@ -173,7 +173,7 @@
> -
> -     listener.close().wait();
> - }
> --
> -+/*
> - TEST_FIXTURE(uri_address, response_order)
> - {
> -     http_listener listener(m_uri);
> -@@ -217,7 +217,7 @@
> -
> -     listener.close().wait();
> - }
> --
> -+*/
> - TEST_FIXTURE(uri_address, uri_encoding, "Ignore", "Codeplex 201")
> - {
> -     http_listener listener(m_uri);
> -Index: casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
> -===================================================================
> ---- casablanca.orig/Release/tests/functional/websockets/client/authentication_tests.cpp
> -+++ casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
> -@@ -221,7 +221,7 @@
> -         VERIFY_ARE_EQUAL("TLS handshake failed", e.error_code().message());
> -     }
> - }
> --
> -+/*
> - TEST(self_signed_cert)
> - {
> -     handshake_error_test_impl(U("wss://self-signed.badssl.com/"));
> -@@ -236,7 +236,7 @@
> - {
> -     handshake_error_test_impl(U("wss://expired.badssl.com/"));
> - }
> --
> -+*/
> - #endif
> -
> - } // SUITE(authentication_tests)
> -Index: casablanca/Release/tests/functional/websockets/client/client_construction.cpp
> -===================================================================
> ---- casablanca.orig/Release/tests/functional/websockets/client/client_construction.cpp
> -+++ casablanca/Release/tests/functional/websockets/client/client_construction.cpp
> -@@ -81,7 +81,7 @@
> -     VERIFY_ARE_EQUAL(config2.credentials().username(), cred.username());
> - }
> -
> --
> -+/*
> - // Verify that we can get the baseuri from websocket_client connect.
> - TEST_FIXTURE(uri_address, uri_test)
> - {
> -@@ -101,7 +101,7 @@
> -     VERIFY_ARE_EQUAL(client2.uri(), m_uri);
> -     client2.close().wait();
> - }
> --
> -+*/
> - TEST_FIXTURE(uri_address, move_operations)
> - {
> -     std::string body("hello");
> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.9.bb
> similarity index 73%
> rename from meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
> rename to meta-oe/recipes-support/cpprest/cpprest_2.10.9.bb
> index b4b1c81e8..4bdc5c682 100644
> --- a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
> +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.9.bb
> @@ -8,13 +8,10 @@ DEPENDS = "openssl websocketpp zlib boost brotli"
>  EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
>
>  SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
> -           file://disable-outside-tests.patch \
> -           file://disable-test-timeouts.patch \
> -           file://disable-float-tests.patch \
>             "
>
> -# tag 2.10.8
> -SRCREV= "204a52610234ac5180e80a6883b62c0ad085f51e"
> +# tag 2.10.9
> +SRCREV= "8f0393dd7be08f2d9b44cc09b8b97f9bafb109a5"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

