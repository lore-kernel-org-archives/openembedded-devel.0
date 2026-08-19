Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62119C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:00:35 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4433.1787137228449757623
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lg5ZYzKs;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7864; q=dns/txt;
  s=iport01; t=1787137228; x=1788346828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vl7De/mRp26qIQqLtwko0B49VqNBxYA7pW2lTCLJ+Fo=;
  b=lg5ZYzKsaCNwfQaBVioWkt2ZOsj2QnUlQRl2BgWF5gv3/1R5Zqn9sKHp
   hJFF6LKvqfiERFKRtAJ4GH68U2Ldm2tp1p4lCFftDWCe7OnxW2cUwQvBr
   HVcwetvEG08VI8UlNIceJvuHe4/krLTRtEpAxxJnceSVvlNyVQTPHcxgL
   kjYzmiEHsV2W3M7e9DYsBOuY+o694/VuPb5CHNKkKP/TtjxFfw45ZxrSK
   +wsqyaKiRISZDDbeZYBiGZqqUc2e3TU23fj/M/80sMmpWjrLgUizv2TRx
   F+fVr9KvLPoTKZ/TzlCaxgnZk14tiiz13QkgXrsEs6/UD8ySRBpxb2ADR
   A==;
X-CSE-ConnectionGUID: aR78gCo8RNqdaWx+PglJUQ==
X-CSE-MsgGUID: 05qdfajBRaukb1n8Xu5W4g==
X-IPAS-Result: =?us-ascii?q?A0BOAgDpi4Vq/5AQJK1aEwEBgkSCV3ReQ0mEV5EHbAOBE?=
 =?us-ascii?q?50IgX4PAQEBD0QNBAEBhQUCjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMjBAsBGAEbBgwQHAMBAgMCJgICKyMIEAmDA?=
 =?us-ascii?q?gGCdAMRBsNDen8zgQGDKAGBVNswAQsUAQWBBS6FP4MfAYUCXRgBRIQ4Jxsbg?=
 =?us-ascii?q?XKBFYJzdoEFgVwChTuCagSCIoEMgVqBLZA4SIECHANZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPhc1WBsGBYEdgSiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGA?=
 =?us-ascii?q?gFJRREKCwsYDUgRLDcUGQQ9AW4HjkkgghoNDhJkFwkKAQogAUgzBIEEKR6TN?=
 =?us-ascii?q?JIkoQ8KKIN2jCGVOhozhASUF5JRC5h9glmLMYFNlDMGEzeEaYFoPIFZcBU7g?=
 =?us-ascii?q?mcJShkPji4KC4NgzDknMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:dUGnG63nZrcikFH6IPbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2NWx
 zBJXmmGOv6JamPzedkgaY7io0IBu5bVnYIwQAJr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tYzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGBXtpbYIz/bZNJ3hC/
 MMIawgCajK+vrfjqF67YrEEasULJc3vOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEiojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQhiOm8aYCPIYPiqcN9xhuBq
 mzP/U7DCwwZPoWZmQqYr03wibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:9k83L6AA27QVN5zlHely55DYdb4zR+YMi2TDGXofdfUzSL3/qy
 nOpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyIMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYANu5eeXcGPjWvwvECZe
 Gh2vY=
X-Talos-CUID: 9a23:CWuvcGNDQYaW1+5DURM4pEE/HZAfVGTRxUjAYHe3DURUcejA
X-Talos-MUID: 9a23:jZmLvQg73butCCrEXSG048MpbJpx76qnCmo3mIgFsZCCZRxtZgjBg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="809912237"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:00:27 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 3BD83180004FB;
	Wed, 19 Aug 2026 11:00:27 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id CEFCFCCA79B; Wed, 19 Aug 2026 04:00:26 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][wrynose][PATCH 3/6] python3-pyjwt: Fix CVE-2026-48524
Date: Wed, 19 Aug 2026 04:00:13 -0700
Message-Id: <20260819110016.252278-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819110016.252278-1-hthakar@cisco.com>
References: <20260819110016.252278-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129343

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream 2.13.0 backport for
CVE-2026-48524. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81
[2] https://github.com/advisories/GHSA-fhv5-28vv-h8m8

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-48524.patch         | 125 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-48524.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-48524.patch b/meta-python/recipes-devtools/python/files/CVE-2026-48524.patch
new file mode 100644
index 0000000000..d583ea1275
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-48524.patch
@@ -0,0 +1,125 @@
+From 9d971fad56d6571a3bfc037ca21e3be694b9cabd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Thu, 21 May 2026 14:11:10 -0400
+Subject: [PATCH] Bundle security fixes and hardening into 2.13.0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Security:
+- `HMACAlgorithm.prepare_key` rejects JWK JSON documents passed as raw
+  HMAC secrets to close an algorithm-confusion gap not covered by the
+  existing PEM/SSH guard. Reported by @aradona91 in GHSA-xgmm-8j9v-c9wx.
+- Bind the JWT header `alg` to `PyJWK.algorithm_name` during verification
+  so the caller's `algorithms` allow-list cannot be bypassed when decoding
+  with a `PyJWK` / `PyJWKClient` key. Reported by @sushi-gif in
+  GHSA-jq35-7prp-9v3f.
+- Skip the unconditional base64 decode of the compact-form payload
+  segment when `b64=false` is set, and require that segment to be empty
+  (RFC 7515 Appendix F detached form). Closes an unauthenticated DoS
+  amplifier. Reported by @thesmartshadow in GHSA-w7vc-732c-9m39.
+- `PyJWKClient` rejects any URI whose scheme is not `http` or `https` so
+  attacker-influenced URIs cannot read local files or reach unintended
+  schemes via urllib's default `file://` / `ftp://` / `data:` handlers.
+  Reported by @KEIJOT in GHSA-993g-76c3-p5m4.
+- Preserve the cached JWK Set on fetch errors in `PyJWKClient.fetch_data`.
+  The previous `finally`-block `put(None)` pattern cleared the cache on
+  any transient outage. Reported by @eddieran in GHSA-fhv5-28vv-h8m8.
+
+Fixes:
+- Reject empty HMAC keys outright in `HMACAlgorithm.prepare_key` with
+  `InvalidKeyError` instead of accepting them with only a warning.
+  Hardening prompted by reports from @SnailSploit and @spartan8806.
+- Forward per-call `options` (including `enforce_minimum_key_length`)
+  from `PyJWT.decode` through to `PyJWS._verify_signature`. Thanks to
+  @WLUB.
+- RFC 7797 §3 compliance for `b64=false`: encoder auto-adds `"b64"` to
+  `crit`; decoder rejects tokens that set `b64=false` without listing
+  it in `crit`. Thanks to @MachineLearning-Nerd.
+
+CVE: CVE-2026-48524
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81]
+
+Backport Changes:
+- Split out the cached-JWK-set preservation fix because the upstream
+  commit bundles multiple CVEs.
+- Omitted CHANGELOG.rst because it conflicted and is release documentation.
+- Omitted the 2.13.0 version bump and other bundled fixes; applicable CVE
+  fixes are carried in separate patches.
+
+(cherry picked from commit 95791b1759b8aa4f2203575d344d5c78564cdc81)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/jwks_client.py        | 14 ++++++++------
+ tests/test_jwks_client.py | 16 ++++++++++++++--
+ 2 files changed, 22 insertions(+), 8 deletions(-)
+
+diff --git a/jwt/jwks_client.py b/jwt/jwks_client.py
+index 8d1b0c4..41f333a 100644
+--- a/jwt/jwks_client.py
++++ b/jwt/jwks_client.py
+@@ -113,7 +113,6 @@ class PyJWKClient:
+         :returns: The parsed JWK Set as a dictionary.
+         :raises PyJWKClientConnectionError: If the HTTP request fails.
+         """
+-        jwk_set: Any = None
+         try:
+             r = urllib.request.Request(url=self.uri, headers=self.headers)
+             with urllib.request.urlopen(
+@@ -126,11 +125,14 @@ class PyJWKClient:
+             raise PyJWKClientConnectionError(
+                 f'Fail to fetch data from the url, err: "{e}"'
+             ) from e
+-        else:
+-            return jwk_set
+-        finally:
+-            if self.jwk_set_cache is not None:
+-                self.jwk_set_cache.put(jwk_set)
++
++        # Only update the cache on a successful fetch. Writing in a
++        # `finally` block with `jwk_set=None` on error clears any
++        # previously-cached JWKS, turning a transient outage into a cache
++        # wipe that breaks legitimate auth.
++        if self.jwk_set_cache is not None:
++            self.jwk_set_cache.put(jwk_set)
++        return jwk_set
+ 
+     def get_jwk_set(self, refresh: bool = False) -> PyJWKSet:
+         """Return the JWK Set, using the cache when available.
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index d6793cc..da68664 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -288,18 +288,30 @@ class TestPyJWKClient:
+ 
+         assert repeated_call.call_count == 1
+ 
+-    def test_get_jwt_set_failed_request_should_clear_cache(self) -> None:
++    def test_get_jwt_set_failed_refresh_preserves_cached_jwks(self) -> None:
++        # Regression: a transient fetch failure used to clear the cache via
++        # the previous `finally: put(jwk_set=None)` pattern, turning one bad
++        # request from the JWKS endpoint into application-wide auth failure.
++        # The cache must survive.
+         url = "https://dev-87evx9ru.auth0.com/.well-known/jwks.json"
+ 
+         jwks_client = PyJWKClient(url)
+         with mocked_success_response(RESPONSE_DATA_WITH_MATCHING_KID):
+             jwks_client.get_jwk_set()
+ 
++        assert jwks_client.jwk_set_cache is not None
++        assert jwks_client.jwk_set_cache.get() is not None
++
+         with pytest.raises(PyJWKClientError):
+             with mocked_failed_response():
+                 jwks_client.get_jwk_set(refresh=True)
+ 
+-            assert jwks_client.jwk_set_cache is None
++        cached = jwks_client.jwk_set_cache.get()
++        assert cached is not None
++        # Subsequent reads still serve from cache without another fetch.
++        with mocked_success_response(RESPONSE_DATA_WITH_MATCHING_KID) as call:
++            jwks_client.get_jwk_set()
++        assert call.call_count == 0
+ 
+     def test_failed_request_should_raise_connection_error(self) -> None:
+         token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ik5FRTFRVVJCT1RNNE16STVSa0ZETlRZeE9UVTFNRGcyT0Rnd1EwVXpNVGsxUWpZeVJrUkZRdyJ9.eyJpc3MiOiJodHRwczovL2Rldi04N2V2eDlydS5hdXRoMC5jb20vIiwic3ViIjoiYVc0Q2NhNzl4UmVMV1V6MGFFMkg2a0QwTzNjWEJWdENAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vZXhwZW5zZXMtYXBpIiwiaWF0IjoxNTcyMDA2OTU0LCJleHAiOjE1NzIwMDY5NjQsImF6cCI6ImFXNENjYTc5eFJlTFdVejBhRTJINmtEME8zY1hCVnRDIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.PUxE7xn52aTCohGiWoSdMBZGiYAHwE5FYie0Y1qUT68IHSTXwXVd6hn02HTah6epvHHVKA2FqcFZ4GGv5VTHEvYpeggiiZMgbxFrmTEY0csL6VNkX1eaJGcuehwQCRBKRLL3zKmA5IKGy5GeUnIbpPHLHDxr-GXvgFzsdsyWlVQvPX2xjeaQ217r2PtxDeqjlf66UYl6oY6AqNS8DH3iryCvIfCcybRZkc_hdy-6ZMoKT6Piijvk_aXdm7-QQqKJFHLuEqrVSOuBqqiNfVrG27QzAPuPOxvfXTVLXL2jek5meH6n-VWgrBdoMFH93QEszEDowDAEhQPHVs0xj7SIzA"
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index e67c7bae2f..ff3eb8814d 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
 SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-48523.patch \
+           file://CVE-2026-48524.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6


