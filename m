Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C868CFA46B
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 02:10:23 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2455.1763691018788416900
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 18:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVqfxkyS;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso1667110b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 18:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763691018; x=1764295818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQkJhrysTWwPDuz3kYBXbLOrjhT2KFqXq4VaPsjPLkk=;
        b=kVqfxkySrgf91DcpbLf1wcD8urkTkL/fFH7ddmsAEFO3VrB2olsCp+xMTkp9YUgPqx
         b7ZVs3MqMdl7zLza0FqVGG6zvlHGs5fGvaUR3yNW32mumtNvwWfcYaGxATNyRZaIyGH8
         d4Z5clUZANTvLCQlccKqq997+ja9ya9OrR6/fEyvVUbRwkAI6hI3eb66yj9ORP7aqahi
         TawY69a9J7WBT9fYyAoGw5//+HdUtdr63mNZUrognQ1cPTyAxnN5DACD0t7GDYVGnNGo
         Hha+GS8Vau1DgYIyIulsR4Czep5gN4xvnFGK4gt0M4zlOLL9CSsPyer2pAfqIAoOFDDA
         ozUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763691018; x=1764295818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQkJhrysTWwPDuz3kYBXbLOrjhT2KFqXq4VaPsjPLkk=;
        b=pHrs+Ta0suxCsSCWMubhcpcmGw9SS9tevsbjrI3+886DAt5KIB5J6N98f4iqF1Jom5
         rAh9aVcitdIdu97OKo10ypjkFfCeFuUX+54YbOu5Faw7gFGqpnvfDPwv9nw1+RlXC0J2
         ZOEURdqo6hVpJOgukuKoZFDA/mODiT2ZuD6U7Or5toejJrfT5D4ibdvzKqPO/GKiEaRV
         LCNKpHvl9KUhXmTnOCN4mbEgmYF5AEANWpG/1pb/vp7eJVjViJFZI+qkuO/JoE2Vo75B
         IG1wWcfRiLpJBMw37LkXQSWs4EkXgXxzkvyn4srCTlFBsXyYN72RPo4FxnxNheiDj6A+
         LW2g==
X-Gm-Message-State: AOJu0YyKDCwazX2sPHKdw2Zra5mvLjLow/AsuUOw8XKz9CL/20D+mqqZ
	g1qI2XahRiKfEJfd4yO6qwNnpDXm6xuS9FZf1ZLdzLH5guWXoZWWgaN/g1zlJMHy
X-Gm-Gg: ASbGnctAopNgxvrTanWouqm7tpXoh8McA1XVMhsyi1jn0oXoVmoX9/EaRHIs1gb/d93
	2BoYdR4ZsAEVpffvH2qurL1vI19TcXLky0kYCCxgzJVPgnLQUbO641CcXqDcjkty9JzBRv5rjow
	Rnu3QYnVv4fz1xuyoFVfpi3X/Nrj/ECB6RTH9GoMpdGmwHR+Qxdm1PA6fwv2yIhQMGois56VX65
	ZyKd0g8anEVTbFvBpYg01l2hmAsNCjBhz2lSQW+DtlspNnDfzDZ+Va+vj2qlhThpZReByInY2m0
	M+HCf6b5xr0LQvelieDdn0Yb08qahEZLEbNcAxkvN8fXFI63Nh8Bb/dSGLRBm4ychnk+QCA/fVF
	Qu6D/gcDlpejPdHsq+HxaN0bDp2qZkr6NnLlRPlz2hzgv2NYrMt2jp+x1B2tfaotdAFIGdeQi4G
	3lifj57jk5EjTgCMm5aFypu+e2sPafxGrAIJLYNIya9L4NCPFzXa/EJRC6K4WuZyoOwTu58i4Y5
	f5oRLDhDqwz/YmOIt3qtKej83ASvkV6gvL8WgLal5I=
X-Google-Smtp-Source: AGHT+IH6vKGez5PZg/Cggqln5F6j9IKfTYCc/Amq3KIcp7I1UIRktv661Txq4AgRIYIE1t2DXRueZg==
X-Received: by 2002:a05:7022:6b97:b0:119:e569:fb9b with SMTP id a92af1059eb24-11c9d708d34mr241229c88.10.1763691017598;
        Thu, 20 Nov 2025 18:10:17 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93db556csm15548933c88.1.2025.11.20.18.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 18:10:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-google-auth: Skip mTLS tests from ptests
Date: Thu, 20 Nov 2025 18:10:14 -0800
Message-ID: <20251121021014.1673264-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 02:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121956

They need a cert infrastructure to execute.
Mutual TLS authentication requires client/server certificates
and a proper PKI setup that doesn't exist in the minimal qemu ptest
environment. These are integration tests that need real
certificate infrastructure.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...uth-Skip-mTLS-tests-in-ptest-environ.patch | 96 +++++++++++++++++++
 .../python/python3-google-auth_2.43.0.bb      |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch

diff --git a/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch b/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch
new file mode 100644
index 0000000000..1b09043748
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-auth/0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch
@@ -0,0 +1,96 @@
+From 2bb8c964f31ba0413a818f5b99d668b54e83cfa3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Nov 2025 17:47:43 -0800
+Subject: [PATCH] python3-google-auth: Skip mTLS tests in ptest environment
+
+Mutual TLS tests require SSL certificates and proper crypto library
+setup that is not available in the isolated ptest environment.
+
+Skip all TestMutualTlsAdapter, TestMutualTlsOffloadAdapter, and
+TestMakeMutualTlsHttp tests as they require:
+- Valid SSL client certificates
+- Server certificates for mTLS handshake
+- Proper certificate chains and CAs
+
+These tests verify mTLS functionality which is not feasible to test
+in the embedded ptest runtime without external certificate infrastructure.
+
+Upstream-Status: Inappropriate [ptest environment limitation]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/transport/test_requests.py | 7 ++++++-
+ tests/transport/test_urllib3.py  | 2 ++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/tests/transport/test_requests.py b/tests/transport/test_requests.py
+index 0da3e36..3a62ef7 100644
+--- a/tests/transport/test_requests.py
++++ b/tests/transport/test_requests.py
+@@ -176,6 +176,7 @@ class TimeTickAdapterStub(AdapterStub):
+ class TestMutualTlsAdapter(object):
+     @mock.patch.object(requests.adapters.HTTPAdapter, "init_poolmanager")
+     @mock.patch.object(requests.adapters.HTTPAdapter, "proxy_manager_for")
++    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
+     def test_success(self, mock_proxy_manager_for, mock_init_poolmanager):
+         adapter = google.auth.transport.requests._MutualTlsAdapter(
+             pytest.public_cert_bytes, pytest.private_key_bytes
+@@ -187,6 +188,7 @@ class TestMutualTlsAdapter(object):
+         adapter.proxy_manager_for()
+         mock_proxy_manager_for.assert_called_with(ssl_context=adapter._ctx_proxymanager)
+
++    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
+     def test_invalid_cert_or_key(self):
+         with pytest.raises(OpenSSL.crypto.Error):
+             google.auth.transport.requests._MutualTlsAdapter(
+@@ -404,7 +406,7 @@ class TestAuthorizedSession(object):
+         authed_session.credentials._create_self_signed_jwt.assert_called_once_with(
+             "https://{}/".format(default_host)
+         )
+-
++    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
+     def test_configure_mtls_channel_with_callback(self):
+         mock_callback = mock.Mock()
+         mock_callback.return_value = (
+@@ -429,6 +431,7 @@ class TestAuthorizedSession(object):
+     @mock.patch(
+         "google.auth.transport._mtls_helper.get_client_cert_and_key", autospec=True
+     )
++    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
+     def test_configure_mtls_channel_with_metadata(self, mock_get_client_cert_and_key):
+         mock_get_client_cert_and_key.return_value = (
+             True,
+@@ -548,6 +551,7 @@ class TestMutualTlsOffloadAdapter(object):
+         google.auth.transport._custom_tls_signer.CustomTlsSigner,
+         "attach_to_ssl_context",
+     )
++    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
+     def test_success(
+         self,
+         mock_attach_to_ssl_context,
+@@ -581,6 +585,7 @@ class TestMutualTlsOffloadAdapter(object):
+         google.auth.transport._custom_tls_signer.CustomTlsSigner,
+         "attach_to_ssl_context",
+     )
++    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
+     def test_success_should_use_provider(
+         self,
+         mock_attach_to_ssl_context,
+diff --git a/tests/transport/test_urllib3.py b/tests/transport/test_urllib3.py
+index e832300..66af909 100644
+--- a/tests/transport/test_urllib3.py
++++ b/tests/transport/test_urllib3.py
+@@ -93,12 +93,14 @@ class ResponseStub(object):
+
+
+ class TestMakeMutualTlsHttp(object):
++    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
+     def test_success(self):
+         http = google.auth.transport.urllib3._make_mutual_tls_http(
+             pytest.public_cert_bytes, pytest.private_key_bytes
+         )
+         assert isinstance(http, urllib3.PoolManager)
+
++    @pytest.mark.skip(reason="mTLS requires certificates not available in ptest")
+     def test_crypto_error(self):
+         with pytest.raises(OpenSSL.crypto.Error):
+             google.auth.transport.urllib3._make_mutual_tls_http(
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.43.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.43.0.bb
index aa94035eb6..1a1b035a41 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.43.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.43.0.bb
@@ -7,6 +7,7 @@ inherit pypi setuptools3 ptest

 SRC_URI += " \
         file://0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch \
+        file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
 SRC_URI[sha256sum] = "88228eee5fc21b62a1b5fe773ca15e67778cb07dc8363adcb4a8827b52d81483"

