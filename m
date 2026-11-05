Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27345.1793854576653952957
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 20:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PvHq+ecC;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13000; q=dns/txt;
  s=iport01; t=1793854576; x=1795064176;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VIzXuBLn8ztEl0kD4NSvtR/Clu/ZrfkooN7dPQjSWCA=;
  b=PvHq+ecC4YfQ5p2H1Ct8JzDVZWwPREtx37z6LxFDEwAqZ23MhJh/U20G
   Ulp5bNEEeMBuuzRiDT7VtWfDMgu7a1NJi82kbY5j9UzOrk23DAk84DaFG
   v/5Z5Ip6tlnVdp1ZkvpOteQLVd5T5CaM8FNeoelDfpc6g1hzY1XwOsZXx
   8s3EPBvElay5cih9ZaI0pcgiqdeGsACbNjzPcgAN1SaBQOOX7mtEywWhE
   XSOH2xVk8hynps1BDjvZWPqqz0bQGmMOHeVhxPH5VBi9A2CKwdSbh/r8S
   pojQYvcJ3mE9tjfSZohx32IvC+qjBhxrZFcb/9iG3IHMuAYTVYdKgS3/e
   g==;
X-CSE-ConnectionGUID: sPQhrhvZSAuMlje9z/szJA==
X-CSE-MsgGUID: oie4GMzwQAyddkjNltFD8w==
X-IPAS-Result: =?us-ascii?q?A0BKAgCOCuxq/5H/Ja1aEwEBCQEBCxIMggULghg/dWFCS?=
 =?us-ascii?q?QOUJ4IhA4ETnQ6Bfg8BAQEPRA0EAQGFBQKOHAImNAkOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmCK?=
 =?us-ascii?q?lgBgnQCAREGvEGBeTOBAYMpAYFU2zMBCxQBgTiFQIgjXRgBRIQ5JxsbgXKBF?=
 =?us-ascii?q?YJzdoEFgVwCiCYEgiJ6EoFagQOMFQKBUoZwSIEeA1ksAVUTDQoLBwWBaAM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAG?=
 =?us-ascii?q?woYGA1IESw3FRkEPm4Hki+CcSA9HCITAQkifxIyaR6TNZIjoREKKIN4jCSVO?=
 =?us-ascii?q?hozhASUGZJUC5h9jgqBTZQ0UIRpgWg8gVlwFTuCZwlKGQ+OLgsLg2DOUyM1A?=
 =?us-ascii?q?gkDLwEBBwIHDgMLgWiRHmABAQ?=
IronPort-Data: A9a23:S9rpqqBLmY3fqRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApG8i1zxSn
 TZLWWCPM/qNajD2KNxzPo6z9B4CvpTWzdExOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2M1XDFs2I78j0/tSBWNDp
 O5fMyIvR0XW7w626OrTpuhEnM8vKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYyBPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kVAtiuOzb4CLEjCMbcJUkxq3g
 3DZxk3oDh0ZNvqb1RSpom3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:2wWhraP/OKTJOcBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:YkMAHW+MMNyFZ6oJ4qCVv1UsI8A/cmPv917NBku6BDd7D6aHa3bFrQ==
X-Talos-MUID: 9a23:uSQiSwlz0//031mR1nWgdnplNco0zIG8F3kkgJkKuMuiMTBeF2eC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544236726"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 04:56:15 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 6D5681800046B
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 04:56:15 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 13180CC124F; Wed,  4 Nov 2026 20:56:15 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 5/8] python3-pyjwt: fix CVE-2026-101917
Date: Wed,  4 Nov 2026 20:56:11 -0800
Message-Id: <20261105045614.2677776-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105045614.2677776-1-hthakar@cisco.com>
References: <20261105045614.2677776-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 04:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131856
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

Throttle repeated JWKS refreshes for unknown key IDs with a client
cooldown to prevent repeated endpoint fetches.

[1] https://github.com/jpadilla/pyjwt/commit/ba4853a75fb9676362da17f67d0f64bd18afd4e1
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-2gx3-rcp4-g85q

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-pyjwt/CVE-2026-101917.patch       | 311 ++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |   1 +
 2 files changed, 312 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101917.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101917.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101917.patch
new file mode 100644
index 0000000000..eb5d0f3014
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101917.patch
@@ -0,0 +1,311 @@
+From 92c0ba0994dd1cc57321d3c70b17974de0e8ebb5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Wed, 14 Oct 2026 05:12:02 -0700
+Subject: [PATCH] Throttle repeated PyJWKClient refreshes
+
+CVE: CVE-2026-101917
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/ba4853a75fb9676362da17f67d0f64bd18afd4e1]
+
+Backport Changes:
+- Add minimal constructor and get_signing_key docstrings carrying the
+  upstream cooldown wording and parameter documentation because PyJWT 2.8.0
+  lacks the newer method docstrings.
+- Use Optional[float] for _last_successful_fetch and List[PyJWK] for the
+  extracted signing-key helper to match the 2.8.0 typing imports.
+- Also set cooldown_duration=0 in the existing
+  test_get_jwt_set_no_matching_kid_after_second_attempt test, which assumes
+  an immediate second fetch; upstream already has that setting.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/jwks_client.py        |  67 +++++++++++++++---
+ tests/test_jwks_client.py | 143 +++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 199 insertions(+), 11 deletions(-)
+
+diff --git a/jwt/jwks_client.py b/jwt/jwks_client.py
+index ab601a4..ab5f40c 100644
+--- a/jwt/jwks_client.py
++++ b/jwt/jwks_client.py
+@@ -1,4 +1,7 @@
+ import json
++import math
++import threading
++import time
+ import urllib.request
+ from functools import lru_cache
+ from ssl import SSLContext
+@@ -36,7 +39,22 @@ class PyJWKClient:
+         headers: Optional[Dict[str, Any]] = None,
+         timeout: int = 30,
+         ssl_context: Optional[SSLContext] = None,
++        cooldown_duration: float = 30,
+     ):
++        """A client for retrieving signing keys from a JWKS endpoint.
++
++        Unknown key IDs can trigger one forced refresh after the cooldown
++        period configured by ``cooldown_duration``. Every successful fetch
++        starts this cooldown, including the initial fetch and cache-expiry
++        fetches. A newly rotated key may therefore wait for the cooldown
++        period before it is fetched; set ``cooldown_duration`` to ``0`` to
++        disable this behavior. The cooldown is bypassed when
++        ``cache_jwk_set`` is ``False``.
++
++        :param cooldown_duration: Minimum time in seconds between forced
++            refreshes after an unknown key ID. Defaults to ``30``.
++        :type cooldown_duration: float
++        """
+         if headers is None:
+             headers = {}
+         # urllib's default OpenerDirector also handles file://, ftp://, and
+@@ -54,6 +72,18 @@ class PyJWKClient:
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
++        self._last_successful_fetch: Optional[float] = None
++        self._client_lock = threading.RLock()
+ 
+         if cache_jwk_set:
+             # Init jwt set cache with default or given lifespan.
+@@ -89,6 +119,7 @@ class PyJWKClient:
+         # finally block on error would discard a previously cached JWKS.
+         if self.jwk_set_cache is not None:
+             self.jwk_set_cache.put(jwk_set)
++        self._last_successful_fetch = time.monotonic()
+         return jwk_set
+ 
+     def get_jwk_set(self, refresh: bool = False) -> PyJWKSet:
+@@ -106,6 +137,10 @@ class PyJWKClient:
+ 
+     def get_signing_keys(self, refresh: bool = False) -> List[PyJWK]:
+         jwk_set = self.get_jwk_set(refresh)
++        return self._get_signing_keys_from_jwk_set(jwk_set)
++
++    @staticmethod
++    def _get_signing_keys_from_jwk_set(jwk_set: PyJWKSet) -> List[PyJWK]:
+         signing_keys = [
+             jwk_set_key
+             for jwk_set_key in jwk_set.keys
+@@ -118,20 +153,34 @@ class PyJWKClient:
+         return signing_keys
+ 
+     def get_signing_key(self, kid: str) -> PyJWK:
+-        signing_keys = self.get_signing_keys()
+-        signing_key = self.match_kid(signing_keys, kid)
+-
+-        if not signing_key:
+-            # If no matching signing key from the jwk set, refresh the jwk set and try again.
+-            signing_keys = self.get_signing_keys(refresh=True)
++        """Return the signing key matching the given ``kid``.
++
++        If no match is found in the current JWK Set, the set is refreshed
++        from the endpoint and the lookup is retried once when the refresh
++        cooldown permits it.
++        """
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
+     def get_signing_key_from_jwt(self, token: str) -> PyJWK:
+         unverified = decode_token(token, options={"verify_signature": False})
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index b3f2555..ed730d7 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -362,7 +362,7 @@ class TestPyJWKClient:
+ 
+     def test_get_jwt_set_refresh_cache(self):
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+-        jwks_client = PyJWKClient(url)
++        jwks_client = PyJWKClient(url, cooldown_duration=0)
+ 
+         kid = "NEE1QURBOTM4MzI5RkFDNTYxOTU1MDg2ODgwQ0UzMTk1QjYyRkRFQw"
+ 
+@@ -377,7 +377,7 @@ class TestPyJWKClient:
+ 
+     def test_get_jwt_set_no_matching_kid_after_second_attempt(self):
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+-        jwks_client = PyJWKClient(url)
++        jwks_client = PyJWKClient(url, cooldown_duration=0)
+ 
+         kid = "NEE1QURBOTM4MzI5RkFDNTYxOTU1MDg2ODgwQ0UzMTk1QjYyRkRFQw"
+ 
+@@ -387,6 +387,145 @@ class TestPyJWKClient:
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
+     def test_get_jwt_set_invalid_lifespan(self):
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+ 
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 612b1c9cde..f260bb1817 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
     file://CVE-2026-102267.patch \
     file://CVE-2026-102268_CVE-2026-102270.patch \
     file://CVE-2026-102271.patch \
+    file://CVE-2026-101917.patch \
 "
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
-- 
2.35.6

