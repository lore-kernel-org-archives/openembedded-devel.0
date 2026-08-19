Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF68C5DF87
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:00:35 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4431.1787137226501769204
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LkTISsv6;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6728; q=dns/txt;
  s=iport01; t=1787137226; x=1788346826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1xYXyjOp5FdViteZDDgpBWpK09q26mHP7mRNk2IHpqs=;
  b=LkTISsv69wILI9gPPXfRbS8afK6no32AVQxSehUbK6P2QdkWFhNdoqmW
   i1V4oqAEBRj9HXiR9a5SZER1qHl5YL1o/+uUsOhs89e8ZXEm9dZsr8dED
   IC3s/vDpDsLx2OIAn96weZ5E8ME71gFKmbNBfzZMf27Q2lQYN/MzNMZ35
   +6typ5Xk6g0ZUXziH4Mui/R4XiLw2iaIrdO3v8cG+NQwbIAUdfacInaoS
   7vTTAOV3wEOub5w2BdeugB4tcnODdIqlpRzQjdzBO9XvbNiCbkI42SvoB
   j7xMfTRhdtYLoBsrzT+hpT8VQpCLNAuhdmt6Pu87SkdSanKq4I7fi+ikL
   A==;
X-CSE-ConnectionGUID: nso59mYyQji4ztJ5+5zSew==
X-CSE-MsgGUID: tlgfKWZ9SmezmKoEfbb8OQ==
X-IPAS-Result: =?us-ascii?q?A0BNAgBni4Vq/4sQJK1SCIJZgld0XkNJhFeRB2wDnhuBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKNawImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAyMECwEYARsGDBAcAwECAwImAgIrIwgQCYMCAYJ0A?=
 =?us-ascii?q?xHDRnp/M4EBgygBgVTbMAELFAEFgQUuhT+DHwGFAl0YAUSEOCcbG4FygRWDa?=
 =?us-ascii?q?YEFgVwCgScShAKCagSCInoSgVqBLZA4SIECHANZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPhc1WBsGBYEdgSiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJR?=
 =?us-ascii?q?REKCwsYDUgRLDcUGQQ9AW4HjkkgghoNDhIBYyoBCiABewQhYykekzSSJIwAl?=
 =?us-ascii?q?Q8KKIN2jCGVOhozhASUF5JRC5h9iyeCY5YGEzeEaYFoPIFZcBU7gmcJShkPj?=
 =?us-ascii?q?i4KC4NgzDknMgIJMgEBBwIHDgMLgWiQAAImB4FPAQE?=
IronPort-Data: A9a23:mI5aQ6528CAeg1TK6cipHAxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jAaCmCHPPjZZTP9f48kaY628RtV68WAxoJhQFRur302Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eO5Yfp7dyMHB39
 /1EOiwvM1Peldm73+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZOEwn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZC9aYCLKoTRGp09ckCwu
 mbJ8UfGMEAhMdGNzBmC33ymjL/opHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rd94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:pbO6Tq4vmJgrH/F+vQPXwBbXdLJyesId70hD6qm+c3Nom6uj5q
 aTdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfCFHZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce36m+okcfng9OXL/f6
 DsnfZ6mw==
X-Talos-CUID: 9a23:yW9Y92FSN/KqtXDCqmJh70lJS8UUY0TfzSvCP23lSjt7c7CKHAo=
X-Talos-MUID: 9a23:xmg1iQXyrNEHaGDq/CPoiz9BC/U52KGjGkUulrgIscPUEhUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="812680370"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:00:25 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 422DB180001BD;
	Wed, 19 Aug 2026 11:00:25 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id D4E35CCA79B; Wed, 19 Aug 2026 04:00:24 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][wrynose][PATCH 2/6] python3-pyjwt: Fix CVE-2026-48523
Date: Wed, 19 Aug 2026 04:00:12 -0700
Message-Id: <20260819110016.252278-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819110016.252278-1-hthakar@cisco.com>
References: <20260819110016.252278-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129342

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream 2.13.0 backport for
CVE-2026-48523. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81
[2] https://github.com/advisories/GHSA-jq35-7prp-9v3f

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-48523.patch         | 115 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   4 +-
 2 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-48523.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-48523.patch b/meta-python/recipes-devtools/python/files/CVE-2026-48523.patch
new file mode 100644
index 0000000000..f272338979
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-48523.patch
@@ -0,0 +1,115 @@
+From 6590add3a8d18098b107fe446ff256ae92e7238f Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-48523
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81]
+
+Backport Changes:
+- Split out the PyJWK algorithm-binding validation because the upstream
+  commit bundles multiple CVEs.
+- Omitted CHANGELOG.rst because it conflicted and is release documentation.
+- Omitted the 2.13.0 version bump and other bundled fixes; applicable CVE
+  fixes are carried in separate patches.
+
+(cherry picked from commit 95791b1759b8aa4f2203575d344d5c78564cdc81)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/api_jws.py        | 10 ++++++++++
+ tests/test_api_jws.py | 27 +++++++++++++++++++++++++++
+ 2 files changed, 37 insertions(+)
+
+diff --git a/jwt/api_jws.py b/jwt/api_jws.py
+index 0ab7e4b..91d2ae3 100644
+--- a/jwt/api_jws.py
++++ b/jwt/api_jws.py
+@@ -348,6 +348,16 @@ class PyJWS:
+             raise InvalidAlgorithmError("The specified alg value is not allowed")
+ 
+         if isinstance(key, PyJWK):
++            # The PyJWK has a fixed algorithm bound at construction time.
++            # Verification must use that algorithm, not whatever the token
++            # header advertises, otherwise the caller's allow-list check
++            # above degenerates into a string compare with no behavioural
++            # effect on which algorithm actually verifies the signature.
++            if alg != key.algorithm_name:
++                raise InvalidAlgorithmError(
++                    f"Token algorithm {alg!r} does not match the key's "
++                    f"algorithm {key.algorithm_name!r}"
++                )
+             alg_obj = key.Algorithm
+             prepared_key = key.key
+         else:
+diff --git a/tests/test_api_jws.py b/tests/test_api_jws.py
+index 9f7edc0..0715b9e 100644
+--- a/tests/test_api_jws.py
++++ b/tests/test_api_jws.py
+@@ -397,6 +397,33 @@ class TestJWS:
+         with pytest.raises(InvalidAlgorithmError):
+             jws.decode(example_jws, jwk)
+ 
++    def test_decodes_with_jwk_rejects_header_alg_outside_jwk_alg(
++        self, jws: PyJWS
++    ) -> None:
++        # Token header says HS256 and the caller's allow-list also accepts
++        # HS256, but the PyJWK is bound to HS512. Even though the allow-list
++        # would pass, verification must be locked to the PyJWK's algorithm
++        # rather than the header's — otherwise an attacker who controls a
++        # registered key can advertise a disallowed algorithm in the header
++        # and have it accepted.
++        jwk = PyJWK(
++            {
++                "kty": "oct",
++                "alg": "HS512",
++                "k": "c2VjcmV0",  # "secret"
++            }
++        )
++        example_jws = (
++            b"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9."
++            b"aGVsbG8gd29ybGQ."
++            b"gEW0pdU4kxPthjtehYdhxB9mMOGajt1xCKlGGXDJ8PM"
++        )
++
++        with pytest.raises(
++            InvalidAlgorithmError, match="does not match the key's algorithm"
++        ):
++            jws.decode(example_jws, jwk, algorithms=["HS256", "HS512"])
++
+     # 'Control' Elliptic Curve jws created by another library.
+     # Used to test for regressions that could affect both
+     # encoding / decoding operations equally (causing tests
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index ed7a280ee5..e67c7bae2f 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -5,7 +5,9 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI += "file://CVE-2026-48522.patch"
+SRC_URI += "file://CVE-2026-48522.patch \
+           file://CVE-2026-48523.patch \
+           "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
 
-- 
2.35.6


