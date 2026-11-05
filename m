Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27343.1793854576557325274
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 20:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=F+XFB1Qh;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9503; q=dns/txt;
  s=iport01; t=1793854576; x=1795064176;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zesxGz9gfAYqv2ruZEnlEUbFQ5DSrajKFdK2o/PS0Xg=;
  b=F+XFB1QhUSSQKYNauxMW9Pk/NBZjOcRJ0ypG/c3DC4eWv4B9N7508Kh4
   pHXxas6DHN4RQS8IiGwc7q0CMNHNOryjQpFmf0IxqkPZQWltI4YffTG/7
   6DlENHXKO8p1cRv8vNOzwaTAcijmvUYUfW+Khs0uf35ciOc3X2bGXjAFu
   A2YhzUTmUaxq7+fvvlPNdHB2mj6+Vd9qr+08PT9h+zAXW4acGjCnb4U2v
   ULfi48qtUMPgSbaIB5wHf0+XqvucucmjUzsEddokRZWj9jC2p5UJab7JI
   ziQGrqjoNfy1p3soGislr5xuFqiSSfgqwIHjloo0zTuCJPf49mLZ/4amx
   w==;
X-CSE-ConnectionGUID: xXx+MucwRT2YseKQiCYLiQ==
X-CSE-MsgGUID: SlEMFhuNRCemDMtKLMiHOg==
X-IPAS-Result: =?us-ascii?q?A0AFAABGC+xq/5L/Ja1aEwEBBQEBAQEBAQEBAQEDAQEBA?=
 =?us-ascii?q?RIBAQEBAgIBAQEBgX0EAQEBAQsBglZ1YUJJA5QngiEDgROCCpsEgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQUCjhwCJjUIDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBIBAgEDJwsBGT0cAgEBAi8kByMIGYMCAYJxAwIBEQa8RYF5M4EBg?=
 =?us-ascii?q?yqBVNszAQsUAYE4AYFyg02II10YAYR9JxsbgXKBFYJzdoEFgVwCgUiGXgSCI?=
 =?us-ascii?q?noSgVqBA4wVAoFShnBIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEegRKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZAsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+b?=
 =?us-ascii?q?geSL4MPAnsJCgEqAX8SMgpfHhySdJJIgTWfXAoog3iMJJU6GjOEBJQZklQLm?=
 =?us-ascii?q?H2OCoFNhzeMfVCEaYFpATqBWXAVO4JnCUoZD445g2vOUyM1AgkDLwEBBwIHD?=
 =?us-ascii?q?gMLgWiRfgEB?=
IronPort-Data: A9a23:lWO3BK83eLHRNbTp1qjBDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 TEcUTqEM/iLY2v2eIh2PIiy9UpTvsCAmt8xGQRupCFEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpIs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kmDZ1b3/t8Hltyr
 80DJRM0bzuyo+OPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Mn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCwbIaKJoLSHpk9ckCwn
 Wbr2kr5HzcgH9Ga5R+Z0VaJh8/oknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:CmuORK3RoPpj5Vl1rqONPAqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:olKf6m5tO73NoiaS7dss5H4EWeU4eWLn8C3hOEKbMGdCeZmUcArF
X-Talos-MUID: 9a23:Dm2TLQRyKTbQOFKGRXTXgBxHGsd1xZ6FBUUhtIkln+yFFQt/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544746034"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 04:56:15 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 5DBA818000200
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 04:56:15 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 00362CC124C; Wed,  4 Nov 2026 20:56:14 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 2/8] python3-pyjwt: fix CVE-2026-102267
Date: Wed,  4 Nov 2026 20:56:08 -0800
Message-Id: <20261105045614.2677776-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105045614.2677776-1-hthakar@cisco.com>
References: <20261105045614.2677776-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 04:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131853
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

Reject redirects when PyJWKClient fetches a JWKS to prevent requests
from following redirects to unintended destinations.

[1] https://github.com/jpadilla/pyjwt/commit/0a795b8e1f6ef08f634aa7086fc41cc6d5ce3e56
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-9v7f-9g4p-ffgj

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-pyjwt/CVE-2026-102267.patch       | 223 ++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |   1 +
 2 files changed, 224 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102267.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102267.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102267.patch
new file mode 100644
index 0000000000..d83cd8ca59
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102267.patch
@@ -0,0 +1,223 @@
+From 67ef104edd43a60ba87db0740364778eae796fe2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Wed, 14 Oct 2026 02:41:53 -0700
+Subject: [PATCH] Reject redirects in PyJWKClient fetches
+
+CVE: CVE-2026-102267
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/0a795b8e1f6ef08f634aa7086fc41cc6d5ce3e56]
+
+Backport Changes:
+- Used the existing typing.List import for the handlers annotation.
+- Omitted the mocked_http_error_response opener-mock conversion because
+  that helper is absent from the PyJWT 2.8.0 test suite.
+- Adapted the two SSL-context tests from live requests to opener mocks;
+  the 2.8.0 success test needs a local ssl_ctx and an explicit mocked
+  get_jwk_set call, and its failure test needs the certificate-error mock.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/jwks_client.py        | 21 +++++++--
+ tests/test_jwks_client.py | 96 ++++++++++++++++++++++++++++++++++-----
+ 2 files changed, 103 insertions(+), 14 deletions(-)
+
+diff --git a/jwt/jwks_client.py b/jwt/jwks_client.py
+index 0e7d226..ab601a4 100644
+--- a/jwt/jwks_client.py
++++ b/jwt/jwks_client.py
+@@ -12,6 +12,19 @@ from .exceptions import PyJWKClientConnectionError, PyJWKClientError
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
+@@ -61,9 +74,11 @@ class PyJWKClient:
+     def fetch_data(self) -> Any:
+         try:
+             r = urllib.request.Request(url=self.uri, headers=self.headers)
+-            with urllib.request.urlopen(
+-                r, timeout=self.timeout, context=self.ssl_context
+-            ) as response:
++            handlers: List[Any] = [_NoRedirectHandler()]
++            if self.ssl_context is not None:
++                handlers.append(urllib.request.HTTPSHandler(context=self.ssl_context))
++            opener = urllib.request.build_opener(*handlers)
++            with opener.open(r, timeout=self.timeout) as response:
+                 jwk_set = json.load(response)
+         except (URLError, TimeoutError) as e:
+             raise PyJWKClientConnectionError(
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index 4a836f2..b3f2555 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -1,7 +1,9 @@
+ import contextlib
+ import json
+ import ssl
++import threading
+ import time
++from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
+ from unittest import mock
+ from urllib.error import URLError
+ 
+@@ -9,6 +11,7 @@ import pytest
+ 
+ import jwt
+ from jwt import PyJWKClient
++from jwt.jwks_client import _NoRedirectHandler
+ from jwt.api_jwk import PyJWK
+ from jwt.exceptions import PyJWKClientConnectionError, PyJWKClientError
+ 
+@@ -47,7 +50,10 @@ RESPONSE_DATA_NO_MATCHING_KID = {
+ 
+ @contextlib.contextmanager
+ def mocked_success_response(data):
+-    with mock.patch("urllib.request.urlopen") as urlopen_mock:
++    with mock.patch("urllib.request.build_opener") as build_opener_mock:
++        opener = mock.Mock()
++        build_opener_mock.return_value = opener
++        urlopen_mock = opener.open
+         response = mock.Mock()
+         response.__enter__ = mock.Mock(return_value=response)
+         response.__exit__ = mock.Mock()
+@@ -58,7 +64,10 @@ def mocked_success_response(data):
+ 
+ @contextlib.contextmanager
+ def mocked_failed_response():
+-    with mock.patch("urllib.request.urlopen") as urlopen_mock:
++    with mock.patch("urllib.request.build_opener") as build_opener_mock:
++        opener = mock.Mock()
++        build_opener_mock.return_value = opener
++        urlopen_mock = opener.open
+         urlopen_mock.side_effect = URLError("Fail to process the request.")
+         yield urlopen_mock
+ 
+@@ -67,7 +76,10 @@ def mocked_failed_response():
+ def mocked_first_call_wrong_kid_second_call_correct_kid(
+     response_data_one, response_data_two
+ ):
+-    with mock.patch("urllib.request.urlopen") as urlopen_mock:
++    with mock.patch("urllib.request.build_opener") as build_opener_mock:
++        opener = mock.Mock()
++        build_opener_mock.return_value = opener
++        urlopen_mock = opener.open
+         response = mock.Mock()
+         response.__enter__ = mock.Mock(return_value=response)
+         response.__exit__ = mock.Mock()
+@@ -81,13 +93,60 @@ def mocked_first_call_wrong_kid_second_call_correct_kid(
+ 
+ @contextlib.contextmanager
+ def mocked_timeout():
+-    with mock.patch("urllib.request.urlopen") as urlopen_mock:
++    with mock.patch("urllib.request.build_opener") as build_opener_mock:
++        opener = mock.Mock()
++        build_opener_mock.return_value = opener
++        urlopen_mock = opener.open
+         urlopen_mock.side_effect = TimeoutError("timed out")
+         yield urlopen_mock
+ 
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
+     def test_fetch_data_forwards_headers_to_correct_url(self):
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+ 
+@@ -372,9 +431,22 @@ class TestPyJWKClient:
+ 
+     def test_get_jwt_set_sslcontext_default(self):
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+-        jwks_client = PyJWKClient(url, ssl_context=ssl.create_default_context())
+-
+-        jwk_set = jwks_client.get_jwk_set()
++        ssl_ctx = ssl.create_default_context()
++        jwks_client = PyJWKClient(url, ssl_context=ssl_ctx)
++
++        with mock.patch("urllib.request.build_opener") as build_opener_mock:
++            opener = mock.Mock()
++            build_opener_mock.return_value = opener
++            response = mock.Mock()
++            response.__enter__ = mock.Mock(return_value=response)
++            response.__exit__ = mock.Mock()
++            response.read.return_value = json.dumps(RESPONSE_DATA_WITH_MATCHING_KID)
++            opener.open.return_value = response
++            jwk_set = jwks_client.get_jwk_set()
++            handlers = build_opener_mock.call_args.args
++            assert any(
++                getattr(handler, "_context", None) is ssl_ctx for handler in handlers
++            )
+ 
+         assert jwk_set is not None
+ 
+@@ -384,7 +456,9 @@ class TestPyJWKClient:
+             url, ssl_context=ssl.SSLContext(protocol=ssl.PROTOCOL_TLS_CLIENT)
+         )
+ 
+-        with pytest.raises(PyJWKClientError):
+-            jwks_client.get_jwk_set()
+-
+-        assert "Failed to get an expected error"
++        with mock.patch("urllib.request.build_opener") as build_opener_mock:
++            build_opener_mock.return_value.open.side_effect = URLError(
++                ssl.SSLCertVerificationError("certificate verify failed")
++            )
++            with pytest.raises(PyJWKClientError):
++                jwks_client.get_jwk_set()
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 5a1dac4df6..fa03d1e616 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -13,6 +13,7 @@ SRC_URI += " \
     file://CVE-2026-48526.patch \
     file://CVE-2026-102269_p1.patch \
     file://CVE-2026-102269_p2.patch \
+    file://CVE-2026-102267.patch \
 "
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
-- 
2.35.6

