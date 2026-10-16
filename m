Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DD2CCA473
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:33:31 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13505.1792118004225238696
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U1MmOKrV;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9643; q=dns/txt;
  s=iport01; t=1792118004; x=1793327604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o0tES20EJuvVNJFOiw+IpqYYRjfyd3RhoKpDNqFBWpU=;
  b=U1MmOKrVCkOJ9OQMI7j7ig9bdq6OmU7hPhlGEt9SXrFABt+U0CVsXFAZ
   LWvkyPTJmDwOQ1z62hllbfNSVsYbuBRxJsDL5EWn/OczLVp2IpJdGSwxs
   p+ovErlvlApQl2Of9fbVWhVTKQoKjD9sNxFDneGXX7u8NZT4ycrDvjonh
   P4SLRwtowLDysDBwNSWnmwyeSew8diCEqCXwJHz1gbnKQZY00YY7cWAyu
   ApEmNcT7ZVqG1lmUYx966Yu2NnXADh4U0xrio9bLzssUag8hrc0daTvBZ
   jHZG8LI9nBZ/Bqbv9LIHBDKfGit1eXt3XK4siFprtAZTcD9jepDQG4wi/
   w==;
X-CSE-ConnectionGUID: XdPmMppFT4esoDWDBbHV+A==
X-CSE-MsgGUID: RK9CxGFUQ7iDYeHeO6O7hA==
X-IPAS-Result: =?us-ascii?q?A0DOAgBdi9Fq/5X/Ja1aEwEBCQEBCxIMggULgld1YENJA?=
 =?us-ascii?q?5ZHA4ETggqafxSBag8BAQEPRA0EAQGFBQKOFQImNQgOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEZLRAcAgEBAi8kByMIG?=
 =?us-ascii?q?YMCAYJxAwMRBrxcgXkzgQGDKoFU2zIBCxQBBYEzgXODTYgjXRgBhHwnGxuBc?=
 =?us-ascii?q?oEVgnN2gQWBXAKBKwESAQmGXQSCIoEMgVqBA5RESIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUg?=
 =?us-ascii?q?gACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpG?=
 =?us-ascii?q?A1IESw3FRkEPm4HkhMegmMCexMBKgF/EjxfHhySdJJHgTWfWgoog3aMIpU6G?=
 =?us-ascii?q?jOEBJQXklQLmH2FVIg2gU2HNox8UIRpgWkBOmlwcBU7gmcJShkPjjmDa85aJ?=
 =?us-ascii?q?zICCQMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:mT7R66orIrcmrWM13LycdsXfSzReBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmOMq2PMTf2c9klPNvi/RhSuZOBnIU2TlRqrH1mRC8RoOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tZ7OWRr7
 eQ2FGwAdRevuM6cypKFCcA506zPLOGzVG8ekmtrwTecCbMtRorOBvyQo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWfrSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHRGJ8LzxnI/
 Qoq+UzDIUAxJPOx9APa816di8/Cun3cB4I7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:2yxrsakQucVIWB9nda4C+LLQwzTpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:skLlC283hrvVAaP0wMOVv34YIsUAamXz8CvdOEiUNkpDQp2rCnbFrQ==
X-Talos-MUID: 9a23:y6dhkQpiLar2KiThcV4ezwtBZex4zIqTMR8MvaQLm8SjawsvOx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535269783"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:33:23 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 25091180001CB;
	Fri, 16 Oct 2026 02:33:23 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id C4E92CBF204; Thu, 15 Oct 2026 19:33:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 4/9] python3-pyjwt: fix CVE-2026-102267
Date: Thu, 15 Oct 2026 19:33:17 -0700
Message-Id: <20261016023322.344365-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016023322.344365-1-hthakar@cisco.com>
References: <20261016023322.344365-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131016

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/jpadilla/pyjwt/commit/0a795b8e1f6ef08f634aa7086fc41cc6d5ce3e56
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-9v7f-9g4p-ffgj

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-102267.patch        | 223 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   1 +
 2 files changed, 224 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102267.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-102267.patch b/meta-python/recipes-devtools/python/files/CVE-2026-102267.patch
new file mode 100644
index 0000000000..97dfd88364
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-102267.patch
@@ -0,0 +1,223 @@
+From 0a795b8e1f6ef08f634aa7086fc41cc6d5ce3e56 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Wed, 9 Sep 2026 20:20:46 -0400
+Subject: [PATCH] Reject redirects in PyJWKClient fetches
+
+CVE: CVE-2026-102267
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/0a795b8e1f6ef08f634aa7086fc41cc6d5ce3e56]
+
+(cherry picked from commit 0a795b8e1f6ef08f634aa7086fc41cc6d5ce3e56)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/jwks_client.py        | 21 +++++++--
+ tests/test_jwks_client.py | 91 ++++++++++++++++++++++++++++++++++-----
+ 2 files changed, 99 insertions(+), 13 deletions(-)
+
+diff --git a/jwt/jwks_client.py b/jwt/jwks_client.py
+index 41f333a..cfc9003 100644
+--- a/jwt/jwks_client.py
++++ b/jwt/jwks_client.py
+@@ -14,6 +14,19 @@ from .exceptions import PyJWKClientConnectionError, PyJWKClientError
+ from .jwk_set_cache import JWKSetCache
+ 
+ 
++class _NoRedirectHandler(urllib.request.HTTPRedirectHandler):
++    def redirect_request(
++        self,
++        req: urllib.request.Request,
++        fp: Any,
++        code: int,
++        msg: str,
++        headers: Any,
++        newurl: str,
++    ) -> None:
++        return None
++
++
+ class PyJWKClient:
+     def __init__(
+         self,
+@@ -115,9 +128,11 @@ class PyJWKClient:
+         """
+         try:
+             r = urllib.request.Request(url=self.uri, headers=self.headers)
+-            with urllib.request.urlopen(
+-                r, timeout=self.timeout, context=self.ssl_context
+-            ) as response:
++            handlers: list[Any] = [_NoRedirectHandler()]
++            if self.ssl_context is not None:
++                handlers.append(urllib.request.HTTPSHandler(context=self.ssl_context))
++            opener = urllib.request.build_opener(*handlers)
++            with opener.open(r, timeout=self.timeout) as response:
+                 jwk_set = json.load(response)
+         except (URLError, TimeoutError) as e:
+             if isinstance(e, HTTPError):
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index da68664..49471ac 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -2,8 +2,10 @@ import contextlib
+ import io
+ import json
+ import ssl
++import threading
+ import time
+ from collections.abc import Iterator
++from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
+ from unittest import mock
+ from urllib.error import HTTPError, URLError
+ from email.message import Message
+@@ -12,6 +14,7 @@ import pytest
+ 
+ import jwt
+ from jwt import PyJWKClient
++from jwt.jwks_client import _NoRedirectHandler
+ from jwt.api_jwk import PyJWK
+ from jwt.exceptions import PyJWKClientConnectionError, PyJWKClientError
+ 
+@@ -50,7 +53,10 @@ RESPONSE_DATA_NO_MATCHING_KID = {
+ 
+ @contextlib.contextmanager
+ def mocked_success_response(data: object) -> Iterator[mock.Mock]:
+-    with mock.patch("urllib.request.urlopen") as urlopen_mock:
++    with mock.patch("urllib.request.build_opener") as build_opener_mock:
++        opener = mock.Mock()
++        build_opener_mock.return_value = opener
++        urlopen_mock = opener.open
+         response = mock.Mock()
+         response.__enter__ = mock.Mock(return_value=response)
+         response.__exit__ = mock.Mock()
+@@ -61,7 +67,10 @@ def mocked_success_response(data: object) -> Iterator[mock.Mock]:
+ 
+ @contextlib.contextmanager
+ def mocked_failed_response() -> Iterator[mock.Mock]:
+-    with mock.patch("urllib.request.urlopen") as urlopen_mock:
++    with mock.patch("urllib.request.build_opener") as build_opener_mock:
++        opener = mock.Mock()
++        build_opener_mock.return_value = opener
++        urlopen_mock = opener.open
+         urlopen_mock.side_effect = URLError("Fail to process the request.")
+         yield urlopen_mock
+ 
+@@ -70,7 +79,10 @@ def mocked_failed_response() -> Iterator[mock.Mock]:
+ def mocked_first_call_wrong_kid_second_call_correct_kid(
+     response_data_one: object, response_data_two: object
+ ) -> Iterator[mock.Mock]:
+-    with mock.patch("urllib.request.urlopen") as urlopen_mock:
++    with mock.patch("urllib.request.build_opener") as build_opener_mock:
++        opener = mock.Mock()
++        build_opener_mock.return_value = opener
++        urlopen_mock = opener.open
+         response = mock.Mock()
+         response.__enter__ = mock.Mock(return_value=response)
+         response.__exit__ = mock.Mock()
+@@ -84,14 +96,20 @@ def mocked_first_call_wrong_kid_second_call_correct_kid(
+ 
+ @contextlib.contextmanager
+ def mocked_timeout() -> Iterator[mock.Mock]:
+-    with mock.patch("urllib.request.urlopen") as urlopen_mock:
++    with mock.patch("urllib.request.build_opener") as build_opener_mock:
++        opener = mock.Mock()
++        build_opener_mock.return_value = opener
++        urlopen_mock = opener.open
+         urlopen_mock.side_effect = TimeoutError("timed out")
+         yield urlopen_mock
+ 
+ 
+ @contextlib.contextmanager
+ def mocked_http_error_response() -> Iterator[tuple[mock.Mock, HTTPError]]:
+-    with mock.patch("urllib.request.urlopen") as urlopen_mock:
++    with mock.patch("urllib.request.build_opener") as build_opener_mock:
++        opener = mock.Mock()
++        build_opener_mock.return_value = opener
++        urlopen_mock = opener.open
+         http_error = HTTPError(
+             url="https://example.com",
+             code=401,
+@@ -105,6 +123,50 @@ def mocked_http_error_response() -> Iterator[tuple[mock.Mock, HTTPError]]:
+ 
+ @crypto_required
+ class TestPyJWKClient:
++    def test_fetch_data_rejects_redirect_without_contacting_destination(self) -> None:
++        destination_requests = 0
++
++        class RedirectHandler(BaseHTTPRequestHandler):
++            def do_GET(self) -> None:  # noqa: N802 - stdlib handler API
++                nonlocal destination_requests
++                if self.path == "/start":
++                    self.send_response(302)
++                    self.send_header("Location", f"{base_url}/destination")
++                    self.end_headers()
++                else:
++                    destination_requests += 1
++                    self.send_response(200)
++                    self.end_headers()
++
++            def log_message(self, _format: str, *args: object) -> None:
++                return
++
++        server = ThreadingHTTPServer(("127.0.0.1", 0), RedirectHandler)
++        base_url = f"http://127.0.0.1:{server.server_port}"
++        thread = threading.Thread(target=server.serve_forever, daemon=True)
++        thread.start()
++        try:
++            client = PyJWKClient(
++                f"{base_url}/start", headers={"Authorization": "secret"}
++            )
++            with pytest.raises(PyJWKClientConnectionError):
++                client.fetch_data()
++            assert destination_requests == 0
++        finally:
++            server.shutdown()
++            server.server_close()
++            thread.join()
++
++    def test_redirect_handler_does_not_follow_redirects(self) -> None:
++        handler = _NoRedirectHandler()
++
++        assert (
++            handler.redirect_request(
++                mock.Mock(), mock.Mock(), 302, "Found", {}, "https://other.test"
++            )
++            is None
++        )
++
+     def test_fetch_data_forwards_headers_to_correct_url(self) -> None:
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+ 
+@@ -401,10 +463,19 @@ class TestPyJWKClient:
+         ssl_ctx = ssl.create_default_context()
+         jwks_client = PyJWKClient(url, ssl_context=ssl_ctx)
+ 
+-        with mocked_success_response(RESPONSE_DATA_WITH_MATCHING_KID) as mock_request:
++        with mock.patch("urllib.request.build_opener") as build_opener_mock:
++            opener = mock.Mock()
++            build_opener_mock.return_value = opener
++            response = mock.Mock()
++            response.__enter__ = mock.Mock(return_value=response)
++            response.__exit__ = mock.Mock()
++            response.read.return_value = json.dumps(RESPONSE_DATA_WITH_MATCHING_KID)
++            opener.open.return_value = response
+             jwk_set = jwks_client.get_jwk_set()
+-            request_call = mock_request.call_args
+-            assert request_call[1].get("context") is ssl_ctx
++            handlers = build_opener_mock.call_args.args
++            assert any(
++                getattr(handler, "_context", None) is ssl_ctx for handler in handlers
++            )
+ 
+         assert jwk_set is not None
+ 
+@@ -414,8 +485,8 @@ class TestPyJWKClient:
+             url, ssl_context=ssl.SSLContext(protocol=ssl.PROTOCOL_TLS_CLIENT)
+         )
+ 
+-        with mock.patch("urllib.request.urlopen") as urlopen_mock:
+-            urlopen_mock.side_effect = URLError(
++        with mock.patch("urllib.request.build_opener") as build_opener_mock:
++            build_opener_mock.return_value.open.side_effect = URLError(
+                 ssl.SSLCertVerificationError("certificate verify failed")
+             )
+             with pytest.raises(PyJWKClientError):
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index a159f2fbbb..f7134a1367 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-103001.patch \
            file://CVE-2026-102274.patch \
            file://CVE-2026-102269.patch \
+           file://CVE-2026-102267.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6


