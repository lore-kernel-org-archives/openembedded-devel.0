Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2165AC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3424.1784112010722241244
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cg8ToBC/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112010; x=1815648010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1sS872VysiwWjbNTvRlrUgqxyvKmg3f08HlYrB9Pzlo=;
  b=cg8ToBC/7pXabxXO5fd8Fvz1iM+rEm29dwn0o3RdIBXTjPxPAg7aid1f
   QyYhPlDQqUAiRXwKUJTTnAk5PGrHNmFBI8z1zJRl+GokK203BHSLa5P5l
   6L+hit9Gz04Gllsm2iSNBKVFWl17ObkeOs2hjwGagT4o02KmMh8ECKav2
   WQtLGCC0AxJGJRkSY4v75s3VBNBdN21qm00hcPXw/mG3vCPTNFnFG/nhu
   loBj/HXVxEg4CRqkMJqIRaRkA/dP+n/OtYzQMyzvni/84UOAOuMJwYryw
   YLYxTWC0XKCMyZqfRZI0sSvzovukVvdRBFTSk9fPD/S3W9+BVOowcBIP0
   g==;
X-CSE-ConnectionGUID: 0RU/7c7WRHGNlUlUoF0Png==
X-CSE-MsgGUID: uE9zT6hGTAOTyGpqkwRaUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="235473297"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="235473297"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:09 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 093C61000150
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:09 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A8B711C00179
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id ACA381800B81;
	Wed, 15 Jul 2026 10:40:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/44] python3-google-auth: upgrade 2.55.1 -> 2.55.2
Date: Wed, 15 Jul 2026 18:38:51 +0800
Message-ID: <20260715103914.2120-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128194

From: Wang Mingyu <wangmy@fujitsu.com>

python3-google-auth
refreshed for 2.55.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uth-Skip-mTLS-tests-in-ptest-environ.patch | 32 ++++++++++---------
 ....55.1.bb => python3-google-auth_2.55.2.bb} |  2 +-
 2 files changed, 18 insertions(+), 16 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.55.1.bb => python3-google-auth_2.55.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch b/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch
index 1b09043748..345c25cfb3 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch
+++ b/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch
@@ -18,15 +18,15 @@ in the embedded ptest runtime without external certificate infrastructure.
 Upstream-Status: Inappropriate [ptest environment limitation]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- tests/transport/test_requests.py | 7 ++++++-
+ tests/transport/test_requests.py | 6 ++++++
  tests/transport/test_urllib3.py  | 2 ++
- 2 files changed, 8 insertions(+), 1 deletion(-)
+ 2 files changed, 8 insertions(+)
 
 diff --git a/tests/transport/test_requests.py b/tests/transport/test_requests.py
-index 0da3e36..3a62ef7 100644
+index f14ccea..6a1cc55 100644
 --- a/tests/transport/test_requests.py
 +++ b/tests/transport/test_requests.py
-@@ -176,6 +176,7 @@ class TimeTickAdapterStub(AdapterStub):
+@@ -178,6 +178,7 @@ class TimeTickAdapterStub(AdapterStub):
  class TestMutualTlsAdapter(object):
      @mock.patch.object(requests.adapters.HTTPAdapter, "init_poolmanager")
      @mock.patch.object(requests.adapters.HTTPAdapter, "proxy_manager_for")
@@ -34,24 +34,23 @@ index 0da3e36..3a62ef7 100644
      def test_success(self, mock_proxy_manager_for, mock_init_poolmanager):
          adapter = google.auth.transport.requests._MutualTlsAdapter(
              pytest.public_cert_bytes, pytest.private_key_bytes
-@@ -187,6 +188,7 @@ class TestMutualTlsAdapter(object):
+@@ -189,6 +190,7 @@ class TestMutualTlsAdapter(object):
          adapter.proxy_manager_for()
          mock_proxy_manager_for.assert_called_with(ssl_context=adapter._ctx_proxymanager)
  
 +    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
      def test_invalid_cert_or_key(self):
-         with pytest.raises(OpenSSL.crypto.Error):
+         with pytest.raises(exceptions.MutualTLSChannelError):
              google.auth.transport.requests._MutualTlsAdapter(
-@@ -404,7 +406,7 @@ class TestAuthorizedSession(object):
-         authed_session.credentials._create_self_signed_jwt.assert_called_once_with(
+@@ -408,6 +410,7 @@ class TestAuthorizedSession(object):
              "https://{}/".format(default_host)
          )
--
+ 
 +    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
      def test_configure_mtls_channel_with_callback(self):
          mock_callback = mock.Mock()
          mock_callback.return_value = (
-@@ -429,6 +431,7 @@ class TestAuthorizedSession(object):
+@@ -432,6 +435,7 @@ class TestAuthorizedSession(object):
      @mock.patch(
          "google.auth.transport._mtls_helper.get_client_cert_and_key", autospec=True
      )
@@ -59,7 +58,7 @@ index 0da3e36..3a62ef7 100644
      def test_configure_mtls_channel_with_metadata(self, mock_get_client_cert_and_key):
          mock_get_client_cert_and_key.return_value = (
              True,
-@@ -548,6 +551,7 @@ class TestMutualTlsOffloadAdapter(object):
+@@ -888,6 +892,7 @@ class TestMutualTlsOffloadAdapter(object):
          google.auth.transport._custom_tls_signer.CustomTlsSigner,
          "attach_to_ssl_context",
      )
@@ -67,7 +66,7 @@ index 0da3e36..3a62ef7 100644
      def test_success(
          self,
          mock_attach_to_ssl_context,
-@@ -581,6 +585,7 @@ class TestMutualTlsOffloadAdapter(object):
+@@ -921,6 +926,7 @@ class TestMutualTlsOffloadAdapter(object):
          google.auth.transport._custom_tls_signer.CustomTlsSigner,
          "attach_to_ssl_context",
      )
@@ -76,10 +75,10 @@ index 0da3e36..3a62ef7 100644
          self,
          mock_attach_to_ssl_context,
 diff --git a/tests/transport/test_urllib3.py b/tests/transport/test_urllib3.py
-index e832300..66af909 100644
+index 3367403..88d0963 100644
 --- a/tests/transport/test_urllib3.py
 +++ b/tests/transport/test_urllib3.py
-@@ -93,12 +93,14 @@ class ResponseStub(object):
+@@ -94,12 +94,14 @@ class ResponseStub(object):
  
  
  class TestMakeMutualTlsHttp(object):
@@ -92,5 +91,8 @@ index e832300..66af909 100644
  
 +    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
      def test_crypto_error(self):
-         with pytest.raises(OpenSSL.crypto.Error):
+         with pytest.raises(exceptions.MutualTLSChannelError):
              google.auth.transport.urllib3._make_mutual_tls_http(
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.55.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.55.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.55.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.55.2.bb
index 58df3bca1a..8da1a61bf3 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.55.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.55.2.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "fb2d9b730f2c9b8d326ec8d7222f21aef2ead15bf0513793d6442485d87af0a1"
+SRC_URI[sha256sum] = "97ae7790ff740f2bc9db60eb864a7804f4ac19f5f02c38b3d942f2fea6e9b9ae"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


