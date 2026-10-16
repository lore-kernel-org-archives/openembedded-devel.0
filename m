Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7D6CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:33:31 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13504.1792118004184969055
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YVht/R0D;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12827; q=dns/txt;
  s=iport01; t=1792118004; x=1793327604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=brzBJCWsfFd81JGtV8Q5JlvVKHMjPCNxbgyi8eZt13k=;
  b=YVht/R0DvGX7Ja7tvJJAKwVCCW3qmfe7CmMUwXrSDZz8Y5d4zio/Idgl
   itcYtq3rABNuTiCDQRMtV+/19lU3tpTPwkI/IgeaV3VKl3oiFC2pXnNAB
   xT7jWOEMAdd/lvd0pKQijUgf8KojvR1QOk9NRxkIk5Z0HdwV4Rg5Vf0b7
   PUwArhGsghrDEm7f+6Daqlsl4RNur2PVvnVlc7eH43jSW83qUuLx9g/Zp
   HCJBUVX9oTiX2WWAy8ljAQtrzSpypK7pnKQlOA49TgQ04GtscOSRdqzJk
   UhOMUjUa05ANlwWgZIPAZ6WiEpJdWzQJ6SianP8PHUDadmjaTmtLO2GBC
   Q==;
X-CSE-ConnectionGUID: 5uvOfY0kQUaUsUYXlAyjzQ==
X-CSE-MsgGUID: Ij7QEX1zSXimiA7jGAkcig==
X-IPAS-Result: =?us-ascii?q?A0AnAADZi9Fq/43/Ja1aEwEBCAEBAQEJARIBBQUBgXwIA?=
 =?us-ascii?q?QsBghc/dWBDSQOEVIgbiVgDgROdCYF+DwEBAQ9EDQQBAYUFAo4VAiY0CQ4BA?=
 =?us-ascii?q?gQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAyMECwEYA?=
 =?us-ascii?q?S0QHAMBAgMCJgICKyMIGYIqWAGCdAMRBrxhen8zgQGDKQGBVNsyAQsUAQWBB?=
 =?us-ascii?q?S4BhT+DHwGFA10YAUSEOCcbG4FygRWCc3aBBYFcAoU7gmoEgiKBDIFagQOUR?=
 =?us-ascii?q?EiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XL1gbBgWBHYEgghYjGTZ6g?=
 =?us-ascii?q?QlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4P?=
 =?us-ascii?q?AkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ9AW4HkhMegmU9HAEhBg0BCSJIK?=
 =?us-ascii?q?Q4SgRsepVehDwoog3aMIpU6GjOEBJQXklQLmH2OCoFNlAgqUIRpgWg8gVlwF?=
 =?us-ascii?q?TuCZwlKGQ+OKwMLC4NgzlonMgIJAy8BAQcCBw4DC4FokR5gAQE?=
IronPort-Data: A9a23:ZlC5Bq4acnQF7uYOAjjA9gxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mcdWj2GbPaPazD1Lo9yPYW39RtSu5GAmIdmQQRrrn00Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eYJAG3ehGWWJ3y
 PUlMw08XhSqluCk+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYCMK4HUHJUK9qqej
 kPEoF3UMkgID+yezDusrXCDr+zEnCyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:SrHVwqPghn06hMBcTh+jsMiBIKoaSvp037Dk7S9MoHtuA6qlfq
 GV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFeaTN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn9E4sLxKDwNeOGAbqBJb6
 ah2g==
X-Talos-CUID: 9a23:clB8wG8oiCQ/DAs0FeGVvxMJBOcrQyXe9UrZHlSFOFZtYayXW2bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AawjOoQ9CprdbVcJqECF+SiqQf+ZqvJ2DOBkfqqU?=
 =?us-ascii?q?Hvsitai5fEjSWjTviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="521956187"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:33:23 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 7A78F18000191;
	Fri, 16 Oct 2026 02:33:23 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id D13AECBEF98; Thu, 15 Oct 2026 19:33:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 7/9] python3-pyjwt: fix CVE-2026-101917
Date: Thu, 15 Oct 2026 19:33:20 -0700
Message-Id: <20261016023322.344365-8-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016023322.344365-1-hthakar@cisco.com>
References: <20261016023322.344365-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131021

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/jpadilla/pyjwt/commit/ba4853a75fb9676362da17f67d0f64bd18afd4e1
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-2gx3-rcp4-g85q

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-101917.patch        | 311 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   1 +
 2 files changed, 312 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-101917.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-101917.patch b/meta-python/recipes-devtools/python/files/CVE-2026-101917.patch
new file mode 100644
index 0000000000..e9e730ea7e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-101917.patch
@@ -0,0 +1,311 @@
+From ba4853a75fb9676362da17f67d0f64bd18afd4e1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Thu, 10 Sep 2026 14:10:52 -0400
+Subject: [PATCH] Throttle repeated PyJWKClient refreshes
+
+CVE: CVE-2026-101917
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/ba4853a75fb9676362da17f67d0f64bd18afd4e1]
+
+(cherry picked from commit ba4853a75fb9676362da17f67d0f64bd18afd4e1)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/jwks_client.py        |  63 ++++++++++++++---
+ tests/test_jwks_client.py | 141 +++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 192 insertions(+), 12 deletions(-)
+
+diff --git a/jwt/jwks_client.py b/jwt/jwks_client.py
+index cfc9003..dcf1edd 100644
+--- a/jwt/jwks_client.py
++++ b/jwt/jwks_client.py
+@@ -1,6 +1,9 @@
+ from __future__ import annotations
+ 
+ import json
++import math
++import threading
++import time
+ import urllib.request
+ from functools import lru_cache
+ from ssl import SSLContext
+@@ -38,6 +41,7 @@ class PyJWKClient:
+         headers: dict[str, Any] | None = None,
+         timeout: float = 30,
+         ssl_context: SSLContext | None = None,
++        cooldown_duration: float = 30,
+     ):
+         """A client for retrieving signing keys from a JWKS endpoint.
+ 
+@@ -54,6 +58,14 @@ class PyJWKClient:
+         - ``lifespan``: Time in seconds before the cached JWK Set expires.
+           Defaults to ``300`` (5 minutes). Must be greater than 0.
+ 
++        Unknown key IDs can trigger one forced refresh after the cooldown
++        period configured by ``cooldown_duration``. Every successful fetch
++        starts this cooldown, including the initial fetch and cache-expiry
++        fetches. A newly rotated key may therefore wait for the cooldown
++        period before it is fetched; set ``cooldown_duration`` to ``0`` to
++        disable this behavior. The cooldown is bypassed when
++        ``cache_jwk_set`` is ``False``.
++
+         **Tier 2 — Signing key cache** (disabled by default):
+         Caches individual signing keys (looked up by ``kid``) using an LRU
+         cache with **no time-based expiration**. Keys are evicted only when
+@@ -80,6 +92,9 @@ class PyJWKClient:
+         :type timeout: float
+         :param ssl_context: Optional SSL context for the request.
+         :type ssl_context: ssl.SSLContext or None
++        :param cooldown_duration: Minimum time in seconds between forced
++            refreshes after an unknown key ID. Defaults to ``30``.
++        :type cooldown_duration: float
+         """
+         if headers is None:
+             headers = {}
+@@ -98,6 +113,18 @@ class PyJWKClient:
+         self.headers = headers
+         self.timeout = timeout
+         self.ssl_context = ssl_context
++        if cooldown_duration < 0:
++            raise PyJWKClientError(
++                "Cooldown duration must be greater than or equal to 0, "
++                f'the input is "{cooldown_duration}"'
++            )
++        if not math.isfinite(cooldown_duration):
++            raise PyJWKClientError(
++                f'Cooldown duration must be finite, the input is "{cooldown_duration}"'
++            )
++        self.cooldown_duration = cooldown_duration
++        self._last_successful_fetch: float | None = None
++        self._client_lock = threading.RLock()
+ 
+         if cache_jwk_set:
+             # Init jwt set cache with default or given lifespan.
+@@ -147,6 +174,7 @@ class PyJWKClient:
+         # wipe that breaks legitimate auth.
+         if self.jwk_set_cache is not None:
+             self.jwk_set_cache.put(jwk_set)
++        self._last_successful_fetch = time.monotonic()
+         return jwk_set
+ 
+     def get_jwk_set(self, refresh: bool = False) -> PyJWKSet:
+@@ -186,6 +214,10 @@ class PyJWKClient:
+         :raises PyJWKClientError: If no signing keys are found.
+         """
+         jwk_set = self.get_jwk_set(refresh)
++        return self._get_signing_keys_from_jwk_set(jwk_set)
++
++    @staticmethod
++    def _get_signing_keys_from_jwk_set(jwk_set: PyJWKSet) -> list[PyJWK]:
+         signing_keys = [
+             jwk_set_key
+             for jwk_set_key in jwk_set.keys
+@@ -200,8 +232,9 @@ class PyJWKClient:
+     def get_signing_key(self, kid: str) -> PyJWK:
+         """Return the signing key matching the given ``kid``.
+ 
+-        If no match is found in the current JWK Set, the set is
+-        refreshed from the endpoint and the lookup is retried once.
++        If no match is found in the current JWK Set, the set is refreshed
++        from the endpoint and the lookup is retried once when the refresh
++        cooldown permits it.
+ 
+         :param kid: The key ID to look up.
+         :type kid: str
+@@ -210,20 +243,28 @@ class PyJWKClient:
+         :raises PyJWKClientError: If no matching key is found after
+             refreshing.
+         """
+-        signing_keys = self.get_signing_keys()
+-        signing_key = self.match_kid(signing_keys, kid)
+-
+-        if not signing_key:
+-            # If no matching signing key from the jwk set, refresh the jwk set and try again.
+-            signing_keys = self.get_signing_keys(refresh=True)
++        with self._client_lock:
++            signing_keys = self.get_signing_keys()
+             signing_key = self.match_kid(signing_keys, kid)
+ 
+             if not signing_key:
+-                raise PyJWKClientError(
+-                    f'Unable to find a signing key that matches: "{kid}"'
++                cooling_down = (
++                    self.jwk_set_cache is not None
++                    and self._last_successful_fetch is not None
++                    and time.monotonic() - self._last_successful_fetch
++                    < self.cooldown_duration
+                 )
++                if not cooling_down:
++                    signing_keys = self.get_signing_keys(refresh=True)
++                    self._last_successful_fetch = time.monotonic()
++                    signing_key = self.match_kid(signing_keys, kid)
+ 
+-        return signing_key
++                if not signing_key:
++                    raise PyJWKClientError(
++                        f'Unable to find a signing key that matches: "{kid}"'
++                    )
++
++            return signing_key
+ 
+     def get_signing_key_from_jwt(self, token: str | bytes) -> PyJWK:
+         """Return the signing key for a JWT by reading its ``kid`` header.
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index 49471ac..c66dfd7 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -386,7 +386,7 @@ class TestPyJWKClient:
+ 
+     def test_get_jwt_set_refresh_cache(self) -> None:
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+-        jwks_client = PyJWKClient(url)
++        jwks_client = PyJWKClient(url, cooldown_duration=0)
+ 
+         kid = "NEE1QURBOTM4MzI5RkFDNTYxOTU1MDg2ODgwQ0UzMTk1QjYyRkRFQw"
+ 
+@@ -411,6 +411,145 @@ class TestPyJWKClient:
+             ):
+                 jwks_client.get_signing_key(kid)
+ 
++    def test_unknown_kid_refresh_is_cooled_down(self) -> None:
++        url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
++        kid = "unknown-kid"
++        jwks_client = PyJWKClient(url, cooldown_duration=30)
++
++        with mock.patch("urllib.request.build_opener") as build_opener_mock:
++            opener = mock.Mock()
++            build_opener_mock.return_value = opener
++            response = mock.Mock()
++            response.__enter__ = mock.Mock(return_value=response)
++            response.__exit__ = mock.Mock()
++            response.read.return_value = json.dumps(RESPONSE_DATA_NO_MATCHING_KID)
++            opener.open.return_value = response
++
++            for _ in range(2):
++                with pytest.raises(PyJWKClientError, match="matches"):
++                    jwks_client.get_signing_key(kid)
++
++        assert opener.open.call_count == 1
++
++    def test_unknown_kid_refresh_runs_again_after_cooldown(self) -> None:
++        url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
++        kid = "unknown-kid"
++        jwks_client = PyJWKClient(url, cooldown_duration=0.01)
++
++        with mock.patch("urllib.request.build_opener") as build_opener_mock:
++            opener = mock.Mock()
++            build_opener_mock.return_value = opener
++            response = mock.Mock()
++            response.__enter__ = mock.Mock(return_value=response)
++            response.__exit__ = mock.Mock()
++            response.read.return_value = json.dumps(RESPONSE_DATA_NO_MATCHING_KID)
++            opener.open.return_value = response
++
++            clock = [0.0]
++            with mock.patch(
++                "jwt.jwks_client.time.monotonic", side_effect=lambda: clock[0]
++            ):
++                with pytest.raises(PyJWKClientError, match="matches"):
++                    jwks_client.get_signing_key(kid)
++                clock[0] = 0.02
++                with pytest.raises(PyJWKClientError, match="matches"):
++                    jwks_client.get_signing_key(kid)
++
++        assert opener.open.call_count == 2
++
++    def test_unknown_kid_refresh_serializes_concurrent_misses(self) -> None:
++        url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
++        kid = "unknown-kid"
++        jwks_client = PyJWKClient(url, cooldown_duration=30)
++        refresh_started = threading.Event()
++        second_done = threading.Event()
++        release_refresh = threading.Event()
++
++        with mock.patch("urllib.request.build_opener") as build_opener_mock:
++            opener = mock.Mock()
++            build_opener_mock.return_value = opener
++            response = mock.Mock()
++            response.__enter__ = mock.Mock(return_value=response)
++            response.__exit__ = mock.Mock()
++            response.read.return_value = json.dumps(RESPONSE_DATA_NO_MATCHING_KID)
++
++            opener.open.return_value = response
++            jwks_client.get_jwk_set()
++            jwks_client._last_successful_fetch = 0
++
++            def open_response(*args: object, **kwargs: object) -> mock.Mock:
++                if opener.open.call_count == 1:
++                    refresh_started.set()
++                    release_refresh.wait(timeout=5)
++                return response
++
++            opener.open.reset_mock()
++            opener.open.side_effect = open_response
++            errors: list[Exception] = []
++
++            def lookup() -> None:
++                try:
++                    jwks_client.get_signing_key(kid)
++                except PyJWKClientError as error:
++                    errors.append(error)
++
++            first = threading.Thread(target=lookup)
++
++            def second_lookup() -> None:
++                lookup()
++                second_done.set()
++
++            second = threading.Thread(target=second_lookup)
++            with mock.patch("jwt.jwks_client.time.monotonic", return_value=31):
++                first.start()
++                assert refresh_started.wait(timeout=5)
++                second.start()
++                assert not second_done.wait(timeout=0.1)
++                release_refresh.set()
++                first.join(timeout=5)
++                second.join(timeout=5)
++
++        assert len(errors) == 2
++        assert not first.is_alive()
++        assert not second.is_alive()
++        assert opener.open.call_count == 1
++
++    def test_unknown_kid_refresh_ignores_cooldown_when_cache_disabled(self) -> None:
++        url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
++        kid = "unknown-kid"
++        jwks_client = PyJWKClient(url, cache_jwk_set=False, cooldown_duration=30)
++
++        with mock.patch("urllib.request.build_opener") as build_opener_mock:
++            opener = mock.Mock()
++            build_opener_mock.return_value = opener
++            response = mock.Mock()
++            response.__enter__ = mock.Mock(return_value=response)
++            response.__exit__ = mock.Mock()
++            response.read.side_effect = [
++                json.dumps(RESPONSE_DATA_NO_MATCHING_KID),
++                json.dumps(RESPONSE_DATA_NO_MATCHING_KID),
++                json.dumps(RESPONSE_DATA_NO_MATCHING_KID),
++                json.dumps(RESPONSE_DATA_NO_MATCHING_KID),
++            ]
++            opener.open.return_value = response
++
++            for _ in range(2):
++                with pytest.raises(PyJWKClientError, match="matches"):
++                    jwks_client.get_signing_key(kid)
++
++        assert opener.open.call_count == 4
++
++    @pytest.mark.parametrize(
++        "cooldown_duration", [float("nan"), float("inf"), float("-inf")]
++    )
++    def test_unknown_kid_refresh_rejects_non_finite_cooldown(
++        self, cooldown_duration: float
++    ) -> None:
++        url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
++
++        with pytest.raises(PyJWKClientError, match="Cooldown duration"):
++            PyJWKClient(url, cooldown_duration=cooldown_duration)
++
+     def test_get_jwt_set_invalid_lifespan(self) -> None:
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+ 
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index cd91139d58..25f2451b2f 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -16,6 +16,7 @@ SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-102267.patch \
            file://CVE-2026-102268_CVE-2026-102270.patch \
            file://CVE-2026-102271.patch \
+           file://CVE-2026-101917.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6


