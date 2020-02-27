Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 56248610BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:37:33 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id p18so3618910wre.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nM4CpKfeGQ+v0uWIXZkCLXs4fUTwevWVuPtIONaPzCs=;
	b=FmjlUFlxB7ymLDjH/90dZKb8WCkrkKSzCVCBPTlNQaBhDDbkD1SVXM0QVxu9VADOM8
	GknylG73eTcQ3E5CizquYskg6+CEougPsB2pkGJBUhbO2QZlh7nZcyAzZLBffdLLqUpx
	Mn27Gsw6ddprRHfobt1ywnzgGqz3Qs/ai+iLaWWhKzVnZ1isXP0HLNqMdzdEGemJZpTI
	mQQ0kWdfo/f5cXWf9PLjyii+S+Xn1T1UmLkSJ/70Um3pA+QgLm2MZMpb467W2JqnimHt
	yqgQcK5KnxHohPsYuOexZCZlLbMNIugPEoC37HbmnU1u4/74RkezVdjF0DSpWvrCPRpr
	PLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nM4CpKfeGQ+v0uWIXZkCLXs4fUTwevWVuPtIONaPzCs=;
	b=YbluZVhCwbD573nwh6xgrPux7Cfy64rQRNmi/dvTT88Ntg6lNujfCUzUuOEZyzrKdT
	3Q+lNQp0mjm8R206PdzIX2Ocnlbo4REneAh22QEp8igFwMNIGuleQ33l8AsPqKKm5VAT
	jTeCXEcubXfGpXKfyzvrg+dgS4ensC0o9yXMwK4FqX6StDD5YcWZejTZ9MmMjVsDv/Ac
	yS1lpsipjB3YbO9f9OTt/hBYO7SES8gyPeB1ZN2NZQTCh62nccyaYZu8WwkFmelGGjlo
	MkE5makrGlG2f/JZAFFzenW8HAddKZr5AuH0JyRaG2FHf1d4c4cNB0MzV+etKV7577Ce
	Mv6A==
X-Gm-Message-State: APjAAAX9FjZ6u5HOO1YORPAyHQ9r9CyZ/728g9SYH9SOjPG9P/FoY/ns
	/qfg/aTi4E2pCdN4sqRnvFyjidL9
X-Google-Smtp-Source: APXvYqzgNKG0aVrPlIgDNa2A9zMxIhx1LO3t/JDfuiUuKVSOORtaqVPyu3RrpjVtm7CKlnlJ8wdElg==
X-Received: by 2002:adf:a114:: with SMTP id o20mr5157089wro.7.1582814253473;
	Thu, 27 Feb 2020 06:37:33 -0800 (PST)
Received: from localhost.localdomain ([5.171.136.238])
	by smtp.gmail.com with ESMTPSA id o9sm8697392wrw.20.2020.02.27.06.37.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 06:37:32 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 15:37:25 +0100
Message-Id: <20200227143726.28835-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 1/2] cpprest: update to 2.10.15 and refresh patches
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
X-List-Received-Date: Thu, 27 Feb 2020 14:37:33 -0000

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../cpprest/disable-outside-tests.patch       | 43 +++----------------
 ...{cpprest_2.10.14.bb => cpprest_2.10.15.bb} |  4 +-
 2 files changed, 8 insertions(+), 39 deletions(-)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.14.bb => cpprest_2.10.15.bb} (91%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
index 5232e2a1d..e108e0279 100644
--- a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
+++ b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
@@ -54,7 +54,7 @@ Index: cpprest/Release/tests/functional/websockets/client/authentication_tests.c
 ===================================================================
 --- cpprest.orig/Release/tests/functional/websockets/client/authentication_tests.cpp
 +++ cpprest/Release/tests/functional/websockets/client/authentication_tests.cpp
-@@ -93,6 +93,7 @@
+@@ -93,6 +93,7 @@ SUITE(authentication_tests)
          return false;
      }
  
@@ -62,46 +62,15 @@ Index: cpprest/Release/tests/functional/websockets/client/authentication_tests.c
      TEST(ssl_test)
      {
          websocket_client client;
-@@ -127,6 +128,7 @@
+@@ -127,6 +128,7 @@ SUITE(authentication_tests)
              throw;
          }
      }
 +    */
  
- // These tests are specific to our websocketpp based implementation.
- #if !defined(__cplusplus_winrt)
-@@ -159,12 +161,14 @@
-         }
-     }
- 
-+    /*
-     // Test specifically for server SignalR team hit interesting cases with.
-     TEST(sni_with_older_server_test)
-     {
-         websocket_client client;
-         sni_test_impl(client);
-     }
-+    */
- 
-     // WinRT doesn't expose option for disabling.
-     // No stable server is available to reliably test this.
-@@ -194,6 +198,7 @@
-         }
-     }
- 
-+    /*
-     // Winrt doesn't allow explicitly setting server host for SNI.
-     TEST(sni_explicit_hostname)
-     {
-@@ -204,6 +209,7 @@
-         websocket_client client(config);
-         sni_test_impl(client);
-     }
-+    */
- 
      void handshake_error_test_impl(const ::utility::string_t& host)
      {
-@@ -225,11 +231,11 @@
+@@ -148,11 +150,11 @@ SUITE(authentication_tests)
          }
      }
  
@@ -114,13 +83,13 @@ Index: cpprest/Release/tests/functional/websockets/client/authentication_tests.c
 -    TEST(cert_expired) { handshake_error_test_impl(U("wss://expired.badssl.com/")); }
 +    //TEST(cert_expired) { handshake_error_test_impl(U("wss://expired.badssl.com/")); }
  
- #endif
+ } // SUITE(authentication_tests)
  
 Index: cpprest/Release/tests/functional/http/client/connections_and_errors.cpp
 ===================================================================
 --- cpprest.orig/Release/tests/functional/http/client/connections_and_errors.cpp
 +++ cpprest/Release/tests/functional/http/client/connections_and_errors.cpp
-@@ -406,6 +406,7 @@
+@@ -408,6 +408,7 @@
      }
  #endif
  
@@ -128,7 +97,7 @@ Index: cpprest/Release/tests/functional/http/client/connections_and_errors.cpp
      // Try to connect to a server on a closed port and cancel the operation.
      TEST_FIXTURE(uri_address, cancel_bad_port)
      {
-@@ -437,6 +438,7 @@
+@@ -439,6 +440,7 @@
  
          VERIFY_THROWS_HTTP_ERROR_CODE(t.get(), std::errc::operation_canceled);
      }
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
similarity index 91%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
index 11c8eab55..dee5ae256 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
@@ -11,8 +11,8 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-float-tests.patch \
            file://disable-outside-tests.patch "
 
-# tag 2.10.14
-SRCREV= "6f602bee67b088a299d7901534af3bce6334ab38"
+# tag 2.10.15
+SRCREV= "b94bc32ff84e815ba44c567f6fe4af5f5f6b3048"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


