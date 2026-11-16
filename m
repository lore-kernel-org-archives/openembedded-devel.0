Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34315.1794851696727049597
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vDoEIhaG;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-380b40312e2so1300676eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851696; x=1795456496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pI4UW4ZbN358f6jZPppYU8VHTv6giO0VdRPO+QBkQ9c=;
        b=vDoEIhaGK0+ZRVQ+5jqBIfHEZdJx6pJX/0ztd4RB79vNiICpZ+fLjLbXvjp9nqlnvi
         gxb0Xp9PH2wJmxjDIXO5mlE/8BLOZcVMF9g8oqvuTFrAnInUKiccvsOhpF707y9nKxSU
         cgktws66ZYC7h5LJbZyIEUhZEPCK7gAGL5eB3aVa6qu24KMPJkIhsXV67XcNd6b8Dx+n
         PSg6GES8uR0IAD1NImfHa2n3bqvuFPceUbjKIcVAFdb7OZeKSAnFGfKGn6NHJUs940QW
         GEZ2WpMv2JaQaVpGXznBQqwoJw8kl2gpCcF4Zx49VL+Mnm+NbL32m5t1AgJC08A359S4
         n4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851696; x=1795456496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pI4UW4ZbN358f6jZPppYU8VHTv6giO0VdRPO+QBkQ9c=;
        b=vDZJOVopAu8cg08Fa2eVol7hVTLnia6owrpTyz+5g4Vqb/ncVfHzqXGOZFir7CBOkM
         X4r+I87ESXGIUQq26c/iUMLAv0q+ujX6ie3GXweFp1+IHtrWs1GAInD6ckZST9guD5EK
         7CrnwrRKu5ed/JBHMyPDSjlvJA5lVPzG/30tQSvHAeMLvV+p9HQfwgyqWTpGUUzedgMO
         ORulQ5P6kqy6MfOfdPeC7yHu10bQO3CTQCvD8MGXTCF//nhdqfnpv8eL3wbGAzvrfE6s
         wOYQXvZtWBforksr7lWhMx19vztz22GBdt0CEVSlGTWZrFdxaQcqi5hIvsKSS6h6GbdH
         OCuQ==
X-Gm-Message-State: APuU4Z8n6Hw0ejmCUb52oY4N4RCmXLuNDYoqxv3BLNDZ5h3OYLBQuYN6
	7edz1NDsgyAC3k+pSgptwor5qE6aarsNwZNmvia5cfWfhYhbS3eevbPsiQv8d1B6
X-Gm-Gg: AZFdTZcq5Q6yEJCFUxzHRuO/MhzSUs0Ufcn7u27Z0r5o8Y8+4dYh0v3/K0GgUJ+E/Pm
	xmMnw3JURfbk8LbcQUA9o3FtYeMlc88QEn/EEQlZkbzLM2Y0z7wK4wg+FFNhbv90QA1QANa4BhU
	0zW8loXolaJ7KLLgM4tp2p/vApNdPE8VUqfYiDqJVcrhO+eEOrZwu9RdPka0knGetQQLSs6qocJ
	ySAg2SKW5ai0tzmjfP7j6aBKpJRJh5lubbngB3oMXWXUU/NHW138Qc3LAqJXVOoI1kr49gIhu4Z
	hiAqJAIEli3Tb6zhdRXJWSs8ZQq0rmll5iL7l8ZaOgG1rGnKO899WOapM1Hl8SooWbEslJgiNL8
	7Bm7/q3JhbZWUAPvpjsWAxfVqV0kCGqp+JZgfqVcuPegyl/NtmvPagIpySduflLCwtVHIYPLFzb
	1Jrky5BSOZRDegjUWyrQp+NTTDENt6lWcWJsbuBlBaS01kZ/P7NbivFeiZDhTR4DFjNC1T025DH
	y8M0hMLELsQ9oSqJ8C00QHy+poAamFctXM7gUvu2hlM0IOIo93taX5WJZhGY6LawmS/WTebbVGP
	twIFWGzhpHX3ioXOTbAww59pxFCS1LB7bb/IVch01oaupZYJsYNhyhCusGRG5RZWekGo1LXV9GZ
	k71m+Y+PGjWJ3VLWorQSPEkVjko737bKOLuwG9OvgtMFLEwD6Didoc4OlEiLbHOocQlcg4jPiae
	dAfd0s9ncopCNO/KrUGQKSGaoK2Bcy5a+W67HpgCnfxVkqmwL/2bpCmv7tkJEVSRgTaSznwQ6YN
	lNYcJ3aNR2jQcEmZB0f30d8k66dCT0aCTVum3vGvarufyh/m5RF+1Wc+ro1YFMhNLVMd/j7nXrO
	2036
X-Received: by 2002:a05:693c:895a:20b0:369:f97f:72c1 with SMTP id 5a478bee46e88-3796721d051mr10887676eec.36.1794851695868;
        Mon, 16 Nov 2026 09:54:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 037/105] python3-google-auth: upgrade 2.57.0 -> 2.62.2
Date: Mon, 16 Nov 2026 09:52:49 -0800
Message-ID: <20261116175359.342679-37-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132493
Content-Type: text/plain; charset="utf-8"

Rework the mTLS test skip patch for the reorganized tests. The transport
tests import zoneinfo; add python3-zoneinfo to the ptest RDEPENDS.

Changes:
- oauth2.verify_firebase_token now validates the Firebase issuer and
  subject and warns when the audience is omitted (2.62.2).
- mTLS: fix races during certificate rotation on 401 responses, use an
  unencrypted key for rotation, support mTLS in requests.Request
  refresh/impersonation, and add aiohttp reconfiguration on cert
  mismatch.
- Add bound access and ID tokens for GKE and Cloud Run; sync
  credentials in AsyncAuthorizedSession; strip -fips from the AWS
  service name in SigV4 signing; declare Python 3.15 support.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...uth-Skip-mTLS-tests-in-ptest-environ.patch | 65 +++++++++----------
 ....57.0.bb => python3-google-auth_2.62.2.bb} |  3 +-
 2 files changed, 32 insertions(+), 36 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.57.0.bb => python3-google-auth_2.62.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch b/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch
index 345c25cfb3..73678c4160 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch
+++ b/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch
@@ -18,31 +18,30 @@ in the embedded ptest runtime without external certificate infrastructure.
 Upstream-Status: Inappropriate [ptest environment limitation]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- tests/transport/test_requests.py | 6 ++++++
- tests/transport/test_urllib3.py  | 2 ++
+ tests/transport/test_requests.py |    6 ++++++
+ tests/transport/test_urllib3.py  |    2 ++
  2 files changed, 8 insertions(+)
 
 diff --git a/tests/transport/test_requests.py b/tests/transport/test_requests.py
-index f14ccea..6a1cc55 100644
 --- a/tests/transport/test_requests.py
 +++ b/tests/transport/test_requests.py
-@@ -178,6 +178,7 @@ class TimeTickAdapterStub(AdapterStub):
+@@ -504,6 +504,7 @@
+ 
+ 
  class TestMutualTlsAdapter(object):
++    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
      @mock.patch.object(requests.adapters.HTTPAdapter, "init_poolmanager")
      @mock.patch.object(requests.adapters.HTTPAdapter, "proxy_manager_for")
-+    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
      def test_success(self, mock_proxy_manager_for, mock_init_poolmanager):
-         adapter = google.auth.transport.requests._MutualTlsAdapter(
-             pytest.public_cert_bytes, pytest.private_key_bytes
-@@ -189,6 +190,7 @@ class TestMutualTlsAdapter(object):
-         adapter.proxy_manager_for()
-         mock_proxy_manager_for.assert_called_with(ssl_context=adapter._ctx_proxymanager)
+@@ -530,6 +531,7 @@
+         assert adapter._ctx_poolmanager.verify_mode == ssl.CERT_NONE
+         assert adapter._ctx_proxymanager.verify_mode == ssl.CERT_NONE
  
 +    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
      def test_invalid_cert_or_key(self):
          with pytest.raises(exceptions.MutualTLSChannelError):
              google.auth.transport.requests._MutualTlsAdapter(
-@@ -408,6 +410,7 @@ class TestAuthorizedSession(object):
+@@ -750,6 +752,7 @@
              "https://{}/".format(default_host)
          )
  
@@ -50,35 +49,34 @@ index f14ccea..6a1cc55 100644
      def test_configure_mtls_channel_with_callback(self):
          mock_callback = mock.Mock()
          mock_callback.return_value = (
-@@ -432,6 +435,7 @@ class TestAuthorizedSession(object):
+@@ -771,6 +774,7 @@
+             google.auth.transport.requests._MutualTlsAdapter,
+         )
+ 
++    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
      @mock.patch(
          "google.auth.transport._mtls_helper.get_client_cert_and_key", autospec=True
      )
+@@ -1671,6 +1675,7 @@
+ 
+ 
+ class TestMutualTlsOffloadAdapter(object):
 +    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
-     def test_configure_mtls_channel_with_metadata(self, mock_get_client_cert_and_key):
-         mock_get_client_cert_and_key.return_value = (
-             True,
-@@ -888,6 +892,7 @@ class TestMutualTlsOffloadAdapter(object):
-         google.auth.transport._custom_tls_signer.CustomTlsSigner,
-         "attach_to_ssl_context",
-     )
-+    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
-     def test_success(
-         self,
-         mock_attach_to_ssl_context,
-@@ -921,6 +926,7 @@ class TestMutualTlsOffloadAdapter(object):
-         google.auth.transport._custom_tls_signer.CustomTlsSigner,
-         "attach_to_ssl_context",
-     )
+     @mock.patch.object(requests.adapters.HTTPAdapter, "init_poolmanager")
+     @mock.patch.object(requests.adapters.HTTPAdapter, "proxy_manager_for")
+     @mock.patch.object(
+@@ -1701,6 +1706,7 @@
+         adapter.proxy_manager_for()
+         mock_proxy_manager_for.assert_called_with(ssl_context=adapter._ctx_proxymanager)
+ 
 +    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
-     def test_success_should_use_provider(
-         self,
-         mock_attach_to_ssl_context,
+     @mock.patch.object(requests.adapters.HTTPAdapter, "init_poolmanager")
+     @mock.patch.object(requests.adapters.HTTPAdapter, "proxy_manager_for")
+     @mock.patch.object(
 diff --git a/tests/transport/test_urllib3.py b/tests/transport/test_urllib3.py
-index 3367403..88d0963 100644
 --- a/tests/transport/test_urllib3.py
 +++ b/tests/transport/test_urllib3.py
-@@ -94,12 +94,14 @@ class ResponseStub(object):
+@@ -94,12 +94,14 @@
  
  
  class TestMakeMutualTlsHttp(object):
@@ -93,6 +91,3 @@ index 3367403..88d0963 100644
      def test_crypto_error(self):
          with pytest.raises(exceptions.MutualTLSChannelError):
              google.auth.transport.urllib3._make_mutual_tls_http(
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.57.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.62.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.57.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.62.2.bb
index 7965a2e2b4..3883345f68 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.57.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.62.2.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "9b4f96d6a1feb5f7201231f47cfb3de08d8f176f8a61f9e461555116e95a8789"
+SRC_URI[sha256sum] = "046c61a72d3a847d6df6417a7f0d5cf054e3b82bbcb54fb1e69d47880964049c"
 
 RDEPENDS:${PN}-ptest += " \
         python3-aioresponses \
@@ -28,6 +28,7 @@ RDEPENDS:${PN}-ptest += " \
         python3-responses \
         python3-unittest-automake-output \
         python3-unixadmin \
+        python3-zoneinfo \
 "
 
 do_install_ptest() {
