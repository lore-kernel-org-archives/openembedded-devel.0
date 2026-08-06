Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9058C56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:51:33 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13570.1785995483792386520
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 22:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=J+79oaAB;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6080; q=dns/txt;
  s=iport01; t=1785995483; x=1787205083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AX/kCCdUpt6CUVQU001ZLy1CMrygQ5TCX6KwTlnC3WU=;
  b=J+79oaABCwqigukTpoIA+antf+F2mBZGfaw2IxWpHwPEmgQgPb4gUvMu
   hNUmw9Jx5esOq11GoTJABxG+x6TDc11Ym52Rjezz3aV4gvOMl4ZVxLlxY
   Q/CL5+OZnA1R8B4L4ydF82FCPWX5J0aTM7X9KB8dxz8Ek9esvvR6fAe98
   PWaHbYB3f6+BR9MCuBEpwt979oijfkQ9DXpaEnS7kbxnjMcaqeBKvJiSi
   6ByZvTlUALRVtvPt+U3CcvOCT4Yz6e22BvuBVEVRxSi8LBrUGq1XoUc4E
   sm3gV/WqDW5z60YJcOTbIaUJNpMPKV8IjjF6O5j/K1Ch+DeHUJAyNj8Qk
   Q==;
X-CSE-ConnectionGUID: ggn5gfX5Qtu1wkpDdtjqGQ==
X-CSE-MsgGUID: 9Or5jJn2SUy58ErxxPUHxQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgC3H3Rq/5UQJK1aEwEBgkSCV3ReQ0mVXmwDkUqMU?=
 =?us-ascii?q?YF+DwEBAQ9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhloBAgEDJwsBFAQBGxIQHAMBAi8rIwgZgwIBgnQDEQa8a?=
 =?us-ascii?q?4F5M4EBgk9ZAYFU2y4BCxQBBYEzgWGDXoghXRgBhHwnGxuBcoEVg2mBBYFcA?=
 =?us-ascii?q?oglBIIiehKBWpEWSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFg?=
 =?us-ascii?q?R2BKIRoIxk2eoEJXoEtKmQBEheBCYJvAoJ6gSkLGA1IESw3FBkEPm4HjX8gg?=
 =?us-ascii?q?iEgewkKASsEe4FLBJMMkkiBNZ9aCiiDdYwhlToaM4QEpmgLmH2CWYsxgU2Ta?=
 =?us-ascii?q?UoBT4RpgWg8gVlwFYMiCUoZD44uCguDYMw5JzICCTIBAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:tSBP3aAZ7Sa6mhVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApGsg1T0Ey
 TBNW2GDaPiCYmv9KtElPoy08RsCuJfSzdYwOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/9hmYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEzPpoUU44DdAh5vsuHmJW2
 fAEKikiV0XW7w626OrTpuhEj8AnKozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWsHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCMnV0oj+K8aIe9ltqiFOJPw0S6o
 Dj9wnWkUjwAJMyn9BqVyyf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIk/CS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:GY5XXapsElnF3UakkyuynBEaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: =?us-ascii?q?9a23=3AQDECY2iwo8ykSk63p9BFOvLYpTJufXLbkXjeExK?=
 =?us-ascii?q?BFXswV76NZVOM+rpLqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ar/+4hQ3/pfovs1zasfYq2iiokzUjsoO0VUIvl88?=
 =?us-ascii?q?9htjZZQFqKyelsRSne9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,207,1779148800"; 
   d="scan'208";a="799172905"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Aug 2026 05:51:22 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id BBAA11800016D;
	Thu,  6 Aug 2026 05:51:22 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 67780CC12A6; Wed,  5 Aug 2026 22:51:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH 2/5] python3-pyjwt: Fix CVE-2026-48524
Date: Wed,  5 Aug 2026 22:50:58 -0700
Message-Id: <20260806055101.23160-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260806055101.23160-1-hthakar@cisco.com>
References: <20260806055101.23160-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 05:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128833

From: Hetvi Thakar <hthakar@cisco.com>

Preserve a valid cached JWK set when a refresh request fails. The
previous finally block stored None on errors, turning a transient JWKS
outage into an authentication failure for otherwise cached keys.

This patch applies the relevant subset of the upstream 2.13.0 fix.
The upstream commit is referenced in [1], and the public advisory is
referenced in [2].

[1] https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81
[2] https://github.com/advisories/GHSA-fhv5-28vv-h8m8

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-pyjwt/CVE-2026-48524.patch | 91 +++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48524.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48524.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48524.patch
new file mode 100644
index 0000000000..4dc49771b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48524.patch
@@ -0,0 +1,91 @@
+From cb19f697eff2807d28c66639e5ee39cc92de4985 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Mon, 3 Aug 2026 03:21:01 -0700
+Subject: [PATCH] PyJWKClient: preserve cached JWKS on fetch errors
+
+Only replace the cached JWK set after a successful fetch. A failed
+refresh previously stored None from the finally block and discarded
+valid cached keys.
+
+CVE: CVE-2026-48524
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81]
+
+Backport Changes:
+- Extracted only the CVE-2026-48524 successful-fetch cache update and
+  regression test from the bundled upstream 2.13.0 commit. The other
+  requested CVE fixes are carried as separate patches.
+- Adapted the hunk and test locations to PyJWT 2.8.0 and shortened the
+  upstream explanatory comments without changing behavior or assertions.
+- Omitted the 2.13.0 version and changelog updates, CVE-2026-48523 (which
+  does not affect 2.8.0), and unrelated hardening from the bundled commit.
+
+(cherry picked from commit 95791b1759b8aa4f2203575d344d5c78564cdc81)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/jwks_client.py        | 12 ++++++------
+ tests/test_jwks_client.py | 12 ++++++++++--
+ 2 files changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/jwt/jwks_client.py b/jwt/jwks_client.py
+index 18de342..0e7d226 100644
+--- a/jwt/jwks_client.py
++++ b/jwt/jwks_client.py
+@@ -59,7 +59,6 @@ class PyJWKClient:
+             self.get_signing_key = lru_cache(maxsize=max_cached_keys)(self.get_signing_key)  # type: ignore
+ 
+     def fetch_data(self) -> Any:
+-        jwk_set: Any = None
+         try:
+             r = urllib.request.Request(url=self.uri, headers=self.headers)
+             with urllib.request.urlopen(
+@@ -70,11 +69,12 @@ class PyJWKClient:
+             raise PyJWKClientConnectionError(
+                 f'Fail to fetch data from the url, err: "{e}"'
+             )
+-        else:
+-            return jwk_set
+-        finally:
+-            if self.jwk_set_cache is not None:
+-                self.jwk_set_cache.put(jwk_set)
++
++        # Only update the cache on a successful fetch. Writing None from a
++        # finally block on error would discard a previously cached JWKS.
++        if self.jwk_set_cache is not None:
++            self.jwk_set_cache.put(jwk_set)
++        return jwk_set
+ 
+     def get_jwk_set(self, refresh: bool = False) -> PyJWKSet:
+         data = None
+diff --git a/tests/test_jwks_client.py b/tests/test_jwks_client.py
+index d4bdd35..4a836f2 100644
+--- a/tests/test_jwks_client.py
++++ b/tests/test_jwks_client.py
+@@ -271,18 +271,26 @@ class TestPyJWKClient:
+ 
+         assert repeated_call.call_count == 1
+ 
+-    def test_get_jwt_set_failed_request_should_clear_cache(self):
++    def test_get_jwt_set_failed_refresh_preserves_cached_jwks(self) -> None:
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
++
++        with mocked_success_response(RESPONSE_DATA_WITH_MATCHING_KID) as call:
++            jwks_client.get_jwk_set()
++        assert call.call_count == 0
+ 
+     def test_failed_request_should_raise_connection_error(self):
+         token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ik5FRTFRVVJCT1RNNE16STVSa0ZETlRZeE9UVTFNRGcyT0Rnd1EwVXpNVGsxUWpZeVJrUkZRdyJ9.eyJpc3MiOiJodHRwczovL2Rldi04N2V2eDlydS5hdXRoMC5jb20vIiwic3ViIjoiYVc0Q2NhNzl4UmVMV1V6MGFFMkg2a0QwTzNjWEJWdENAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vZXhwZW5zZXMtYXBpIiwiaWF0IjoxNTcyMDA2OTU0LCJleHAiOjE1NzIwMDY5NjQsImF6cCI6ImFXNENjYTc5eFJlTFdVejBhRTJINmtEME8zY1hCVnRDIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.PUxE7xn52aTCohGiWoSdMBZGiYAHwE5FYie0Y1qUT68IHSTXwXVd6hn02HTah6epvHHVKA2FqcFZ4GGv5VTHEvYpeggiiZMgbxFrmTEY0csL6VNkX1eaJGcuehwQCRBKRLL3zKmA5IKGy5GeUnIbpPHLHDxr-GXvgFzsdsyWlVQvPX2xjeaQ217r2PtxDeqjlf66UYl6oY6AqNS8DH3iryCvIfCcybRZkc_hdy-6ZMoKT6Piijvk_aXdm7-QQqKJFHLuEqrVSOuBqqiNfVrG27QzAPuPOxvfXTVLXL2jek5meH6n-VWgrBdoMFH93QEszEDowDAEhQPHVs0xj7SIzA"
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 55884cddad..7b72cfb4bd 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 SRC_URI += " \
     file://CVE-2026-32597.patch \
     file://CVE-2026-48522.patch \
+    file://CVE-2026-48524.patch \
 "
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
-- 
2.35.6


