Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27343.1793854576557325274
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 20:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NMHCs/EN;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10557; q=dns/txt;
  s=iport01; t=1793854576; x=1795064176;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nseztBQOARNR0EE2fofIzZWoT/MtJ5mRWTNXZwEYW20=;
  b=NMHCs/ENLHZ+PG6HmRnVBRBb8Yl6G4nJRSy3Nh1jnI6Me7vcJagdy0st
   TqXbJd49cSoDGAGW93ynLKOhFzBjPjPv1CzxPcuw6+CJsi2mSwLCGEMA8
   hzuGxqm74fRhn+G5fVJMT9BwiY8jcQYkGMd99rgXaJpMpHKUAaj5d++VA
   9l+KZV0q4mpIk800HbS1iy8rUTWFSTS9zzKLT7JUHaG09ljlL+b/heJLd
   dTJ7gmG2+jGf9YSMJ/zxhXODQkeYy9RbzZo+5yIDUQW9ZtDHJvwXhnvyQ
   SPCsMxpK39PpND43AIg9hDNKGJ/BaqIKwv24R1np4/ju9QCDZUmX0an2j
   A==;
X-CSE-ConnectionGUID: PEdyv5oLRcCnvJMzx/lJOQ==
X-CSE-MsgGUID: LGwe60vqSV24+CtVPuJlRg==
X-IPAS-Result: =?us-ascii?q?A0BJAgBGC+xq/5P/Ja1aEwEBCQEBCxIMggULgld1YUJJA?=
 =?us-ascii?q?5QngiEDniGBfg8BAQEPRA0EAQGFBQKOHAImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCd?=
 =?us-ascii?q?AIBEQa8RYF5M4EBgykBgVTbMwELFAGBOIVAiCNdGAGEfScbG4FygRWDaYEFg?=
 =?us-ascii?q?VwCiCYEgiJ6EoFajRgCgVKGcEiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5IvgxGBDgEHJBdogS0ekyGSN6ERCiiDeIwklToaM6pxC5h9jgqBT?=
 =?us-ascii?q?ZQUIFCEaYFoPIFZcBWDIglKGQ+OLgsLg2DOUyM1AgkDLwEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:1Mm57alb/I+pYvZNX5k4COPo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbX2iCO67YNzOnLot2atux8x4BuJPdnIVgHABkpHxhH1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbU19vdpXGZqz
 /czLi4vSwKTwOaU54vuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZT/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIeJJoPWG50OwS50o
 Eri0Hv0XEkELeehk2bG2W6SvvLtmRn0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:54yaMa+q6fvo0Z0VGaluk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:tryG6WNvoUf1J+5DYARr5VBJHeQfeVbb0lX1MV//DUROcejA
X-Talos-MUID: 9a23:Xfd6VgY5LObUdeBTkxDziW86Kt5T3f7yS2sRr60bmc2+Onkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544746037"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 04:56:15 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id C34F11800025B
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 04:56:15 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 200D3CC2EF2; Wed,  4 Nov 2026 20:56:15 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 7/8] python3-pyjwt: fix CVE-2026-101918
Date: Wed,  4 Nov 2026 20:56:13 -0800
Message-Id: <20261105045614.2677776-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105045614.2677776-1-hthakar@cisco.com>
References: <20261105045614.2677776-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 04:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131857
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

Normalize recursive JSON payload failures to DecodeError. Include the
upstream follow-up [3] as a separate CVE-2026-101918_p2.patch.
It makes the regression tests deterministic and verifies that payload
recursion errors cause no JWKS request.

[1] https://github.com/jpadilla/pyjwt/commit/5fde08a6cf906aa7698de2d6391d88b73006b17b
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-42vr-xj54-vc7v
[3] https://github.com/jpadilla/pyjwt/commit/9bc06658f875b9b40091539140bbbdc4639161c3

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-pyjwt/CVE-2026-101918_p1.patch    | 121 ++++++++++++++++++
 .../python3-pyjwt/CVE-2026-101918_p2.patch    | 109 ++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |   2 +
 3 files changed, 232 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101918_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101918_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101918_p1.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101918_p1.patch
new file mode 100644
index 0000000000..be2a17d507
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101918_p1.patch
@@ -0,0 +1,121 @@
+From 5fde08a6cf906aa7698de2d6391d88b73006b17b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Tue, 22 Sep 2026 11:44:19 -0400
+Subject: [PATCH] fix: normalize recursive JWT payload errors
+
+CVE: CVE-2026-101918
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/5fde08a6cf906aa7698de2d6391d88b73006b17b]
+
+Backport Changes:
+- Add explicit exception chaining to the PyJWT 2.8.0 payload parser,
+  which lacks the upstream raise-from clause used by the regression tests.
+- Add DecodeError to the existing single-line jwt.exceptions import in
+  tests/test_jwks_client.py; newer upstream-only exceptions are absent.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/api_jwt.py            |  4 ++--
+ tests/test_api_jwt.py     | 18 +++++++++++++++++-
+ tests/test_jwks_client.py | 22 +++++++++++++++++++++-
+ 3 files changed, 40 insertions(+), 4 deletions(-)
+
+diff --git a/jwt/api_jwt.py b/jwt/api_jwt.py
+index 48d739a..ae0dc35 100644
+--- a/jwt/api_jwt.py
++++ b/jwt/api_jwt.py
+@@ -176,8 +176,8 @@ class PyJWT:
+         """
+         try:
+             payload = json.loads(decoded["payload"])
+-        except ValueError as e:
+-            raise DecodeError(f"Invalid payload string: {e}")
++        except (ValueError, RecursionError) as e:
++            raise DecodeError(f"Invalid payload string: {e}") from e
+         if not isinstance(payload, dict):
+             raise DecodeError("Invalid payload string: must be a json object")
+         return payload
+diff --git a/tests/test_api_jwt.py b/tests/test_api_jwt.py
+index 2598b12..0a5f91c 100644
+--- a/tests/test_api_jwt.py
++++ b/tests/test_api_jwt.py
+@@ -6,6 +6,7 @@ from decimal import Decimal
+ 
+ import pytest
+ 
++import jwt as pyjwt
+ from jwt.api_jwt import PyJWT
+ from jwt.exceptions import (
+     DecodeError,
+@@ -16,7 +17,7 @@ from jwt.exceptions import (
+     InvalidIssuerError,
+     MissingRequiredClaimError,
+ )
+-from jwt.utils import base64url_decode
++from jwt.utils import base64url_decode, base64url_encode
+ from jwt.warnings import RemovedInPyjwt3Warning
+ 
+ from .utils import crypto_required, key_path, utc_timestamp
+@@ -34,6 +35,21 @@ def payload():
+ 
+ 
+ class TestJWT:
++    def test_decode_deeply_nested_payload_throws_decode_error(self) -> None:
++        nested_payload = b"[" * 100_000 + b"]" * 100_000
++        token = ".".join(
++            (
++                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9",
++                base64url_encode(nested_payload).decode(),
++                "",
++            )
++        )
++
++        with pytest.raises(DecodeError, match="Invalid payload") as exc:
++            pyjwt.decode(token, options={"verify_signature": False})
++
++        assert isinstance(exc.value.__cause__, RecursionError)
++
+     def test_decodes_valid_jwt(self, jwt):
+         example_payload = {"hello": "world"}
+         example_secret = "secret"
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index ed730d7..43530df 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -13,7 +13,8 @@ import jwt
+ from jwt import PyJWKClient
+ from jwt.jwks_client import _NoRedirectHandler
+ from jwt.api_jwk import PyJWK
+-from jwt.exceptions import PyJWKClientConnectionError, PyJWKClientError
++from jwt.exceptions import DecodeError, PyJWKClientConnectionError, PyJWKClientError
++from jwt.utils import base64url_encode
+ 
+ from .utils import crypto_required
+ 
+@@ -103,6 +104,25 @@ def mocked_timeout():
+ 
+ @crypto_required
+ class TestPyJWKClient:
++    def test_get_signing_key_from_jwt_rejects_deeply_nested_payload(self) -> None:
++        nested_payload = b"[" * 100_000 + b"]" * 100_000
++        header = b'{"alg":"RS256","kid":"test-key"}'
++        token = ".".join(
++            (
++                base64url_encode(header).decode(),
++                base64url_encode(nested_payload).decode(),
++                "",
++            )
++        )
++
++        with mocked_success_response(RESPONSE_DATA_WITH_MATCHING_KID) as open_mock:
++            jwks_client = PyJWKClient("https://example.test/.well-known/jwks.json")
++            with pytest.raises(DecodeError, match="Invalid payload") as exc:
++                jwks_client.get_signing_key_from_jwt(token)
++
++        assert isinstance(exc.value.__cause__, RecursionError)
++        assert open_mock.call_count == 0
++
+     def test_fetch_data_rejects_redirect_without_contacting_destination(self) -> None:
+         destination_requests = 0
+ 
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101918_p2.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101918_p2.patch
new file mode 100644
index 0000000000..379e622212
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101918_p2.patch
@@ -0,0 +1,109 @@
+From 9bc06658f875b9b40091539140bbbdc4639161c3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Wed, 23 Sep 2026 09:32:36 -0400
+Subject: [PATCH] fix: make recursive payload tests deterministic
+
+CVE: CVE-2026-101918
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/9bc06658f875b9b40091539140bbbdc4639161c3]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ tests/test_api_jwt.py     | 22 ++++++++++------------
+ tests/test_jwks_client.py | 24 +++++++++++-------------
+ 2 files changed, 21 insertions(+), 25 deletions(-)
+
+diff --git a/tests/test_api_jwt.py b/tests/test_api_jwt.py
+index 0a5f91c..67d9a8a 100644
+--- a/tests/test_api_jwt.py
++++ b/tests/test_api_jwt.py
+@@ -3,6 +3,7 @@ import time
+ from calendar import timegm
+ from datetime import datetime, timedelta, timezone
+ from decimal import Decimal
++from unittest import mock
+ 
+ import pytest
+ 
+@@ -17,7 +18,7 @@ from jwt.exceptions import (
+     InvalidIssuerError,
+     MissingRequiredClaimError,
+ )
+-from jwt.utils import base64url_decode, base64url_encode
++from jwt.utils import base64url_decode
+ from jwt.warnings import RemovedInPyjwt3Warning
+ 
+ from .utils import crypto_required, key_path, utc_timestamp
+@@ -35,18 +36,15 @@ def payload():
+ 
+ 
+ class TestJWT:
+-    def test_decode_deeply_nested_payload_throws_decode_error(self) -> None:
+-        nested_payload = b"[" * 100_000 + b"]" * 100_000
+-        token = ".".join(
+-            (
+-                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9",
+-                base64url_encode(nested_payload).decode(),
+-                "",
+-            )
+-        )
++    def test_decode_payload_recursion_error_throws_decode_error(self) -> None:
++        token = "eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0.e30."
+ 
+-        with pytest.raises(DecodeError, match="Invalid payload") as exc:
+-            pyjwt.decode(token, options={"verify_signature": False})
++        with mock.patch(
++            "jwt.api_jwt.json.loads",
++            side_effect=[{"alg": "none", "typ": "JWT"}, RecursionError()],
++        ):
++            with pytest.raises(DecodeError, match="Invalid payload") as exc:
++                pyjwt.decode(token, options={"verify_signature": False})
+ 
+         assert isinstance(exc.value.__cause__, RecursionError)
+ 
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index 43530df..4333722 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -14,7 +14,6 @@ from jwt import PyJWKClient
+ from jwt.jwks_client import _NoRedirectHandler
+ from jwt.api_jwk import PyJWK
+ from jwt.exceptions import DecodeError, PyJWKClientConnectionError, PyJWKClientError
+-from jwt.utils import base64url_encode
+ 
+ from .utils import crypto_required
+ 
+@@ -104,21 +103,20 @@ def mocked_timeout():
+ 
+ @crypto_required
+ class TestPyJWKClient:
+-    def test_get_signing_key_from_jwt_rejects_deeply_nested_payload(self) -> None:
+-        nested_payload = b"[" * 100_000 + b"]" * 100_000
+-        header = b'{"alg":"RS256","kid":"test-key"}'
+-        token = ".".join(
+-            (
+-                base64url_encode(header).decode(),
+-                base64url_encode(nested_payload).decode(),
+-                "",
+-            )
+-        )
++    def test_get_signing_key_from_jwt_rejects_payload_recursion_error(self) -> None:
++        token = "eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5In0.e30."
+ 
+         with mocked_success_response(RESPONSE_DATA_WITH_MATCHING_KID) as open_mock:
+             jwks_client = PyJWKClient("https://example.test/.well-known/jwks.json")
+-            with pytest.raises(DecodeError, match="Invalid payload") as exc:
+-                jwks_client.get_signing_key_from_jwt(token)
++            with mock.patch(
++                "jwt.api_jwt.json.loads",
++                side_effect=[
++                    {"alg": "RS256", "kid": "test-key"},
++                    RecursionError(),
++                ],
++            ):
++                with pytest.raises(DecodeError, match="Invalid payload") as exc:
++                    jwks_client.get_signing_key_from_jwt(token)
+ 
+         assert isinstance(exc.value.__cause__, RecursionError)
+         assert open_mock.call_count == 0
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index c235499d24..b3a1c49726 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -18,6 +18,8 @@ SRC_URI += " \
     file://CVE-2026-102271.patch \
     file://CVE-2026-101917.patch \
     file://CVE-2026-102275.patch \
+    file://CVE-2026-101918_p1.patch \
+    file://CVE-2026-101918_p2.patch \
 "
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
-- 
2.35.6

