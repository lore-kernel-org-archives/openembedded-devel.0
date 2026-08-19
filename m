Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C12C5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:00:35 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4434.1787137229715356396
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hhaLqr1R;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7938; q=dns/txt;
  s=iport01; t=1787137229; x=1788346829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7W97qm/+img5ntf3UCFpjXT3rIn50JVpGVShZbfMuXM=;
  b=hhaLqr1R+xFvR9nM87PkgmsPjUh2zWiQW2sRM8CH9OHqfVcMbxYSmqaR
   XziltoEE+4A/WQqjXAVl8GrBo1iNSZLuyiclD8iFH9zucrDxJz/eAuY5F
   kiN4sqeeL2DA7RTSnltmdkDobD6MkIJ6NBO+PVkxenNr7+/N5BVxjk4wA
   oSg84AML/vp3DTNE0/eJ9WV/lXMHKpFthA6o8dxkRDA/+m/6j5bJbnMtL
   dS0b1LtJTSMUMOBztBdIgIsCLRvTQv489RH2SxxQnBWjSDs5PAHBFnH8p
   Vp4D/74T65Uatwqt2v0su+Eq7Ob2G0VqU439GJS5emvaaPVNGzMXXk8Ug
   A==;
X-CSE-ConnectionGUID: G0JrjoyuSGKEFcMg02IfDg==
X-CSE-MsgGUID: BBKz6gF9TXS/voadaWVUZw==
X-IPAS-Result: =?us-ascii?q?A0BMAgDpi4Vq/5QQJK1aglmCV3ReQ0mEV5EHbAOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1rAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDIwQLARgBGwYMEBwDAQIDAiYCAisjCBAJgwIBgnQDE?=
 =?us-ascii?q?cNJen8zgQGDKAGBVNswAQsUAQWBBS6FP4MfAYUCXRgBRIQ4JxsbgXKBFYNpg?=
 =?us-ascii?q?QWBXAKFO4JqBIIigQyBWoEtiE2Ha0iBAhwDWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XNVgbBgWBHYEohDcjGTZ6gQlegSsqYQESF4EJggoCgnOCBgIBSUURC?=
 =?us-ascii?q?gsLGA1IESw3FBkEPQFuB45JIIIaDQ4SZBcTAQogARdkBIEEKR4tkm0aHpIGg?=
 =?us-ascii?q?TWfWgoog3aMIZU6GjOEBJQXklELmH2OCpYGEzeEaYFoPIFZcBU7gmcJShkPj?=
 =?us-ascii?q?ioECguDYMw5JzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:aVJbKK6Sl6ckQlDZeyulDgxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 msaDG+BPKuPYWOjf950a4zg9k1Tv8Dcm9VlTFFo+X0zZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eEtU64ORwEHx12
 t81BjsoYUjZpuyaz+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP00n1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZC9aYOEIYXTGJ89ckCwj
 Ejl7Tr2LEAmBOfY1z2M/nuTuNL9gnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:tiDpR65e89w7LfGW3wPXwBbXdLJyesId70hD6qm+c3Nom6uj5q
 aTdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfCFHZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce36m+okcfng9OXL/f6
 DsnfZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3AsYiqpmixxEnbEttqeK5dB80FUDJuXSX/1nXXMlK?=
 =?us-ascii?q?DJkVEZrawRgfK2a1InJ87?=
X-Talos-MUID: 9a23:wiorZwSRiujmxAMkRXTGrhJwashGspieMwcTlpwKsva6CB5vbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="811931152"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:00:28 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 9D0CF1800098F;
	Wed, 19 Aug 2026 11:00:28 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 428CCCCA79B; Wed, 19 Aug 2026 04:00:28 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][wrynose][PATCH 4/6] python3-pyjwt: Fix CVE-2026-48525
Date: Wed, 19 Aug 2026 04:00:14 -0700
Message-Id: <20260819110016.252278-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819110016.252278-1-hthakar@cisco.com>
References: <20260819110016.252278-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129344

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream 2.13.0 backport for
CVE-2026-48525. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81
[2] https://github.com/advisories/GHSA-w7vc-732c-9m39

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-48525.patch         | 146 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   1 +
 2 files changed, 147 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-48525.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-48525.patch b/meta-python/recipes-devtools/python/files/CVE-2026-48525.patch
new file mode 100644
index 0000000000..9b7ffb97eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-48525.patch
@@ -0,0 +1,146 @@
+From e6152fb27dd439bf4541aab9b26a93134c48135f Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-48525
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81]
+
+Backport Changes:
+- Split out the b64=false payload-decoding DoS fix because the upstream
+  commit bundles multiple CVEs.
+- Omitted CHANGELOG.rst because it conflicted and is release documentation.
+- Carried the focused
+  `test_decode_b64_false_rejects_non_empty_payload_segment` regression test.
+  Omitted other tests/test_api_jws.py hunks for unrelated bundled fixes.
+- Omitted the 2.13.0 version bump and other bundled fixes; applicable CVE
+  fixes are carried in separate patches.
+
+(cherry picked from commit 95791b1759b8aa4f2203575d344d5c78564cdc81)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/api_jws.py        | 22 ++++++++++++++++++----
+ tests/test_api_jws.py | 36 +++++++++++++++++++++++++++++++++++-
+ 2 files changed, 53 insertions(+), 5 deletions(-)
+
+diff --git a/jwt/api_jws.py b/jwt/api_jws.py
+index 91d2ae3..5a91bce 100644
+--- a/jwt/api_jws.py
++++ b/jwt/api_jws.py
+@@ -317,10 +317,24 @@ class PyJWS:
+         if not isinstance(header, dict):
+             raise DecodeError("Invalid header string: must be a json object")
+ 
+-        try:
+-            payload = base64url_decode(payload_segment)
+-        except (TypeError, binascii.Error) as err:
+-            raise DecodeError("Invalid payload padding") from err
++        if header.get("b64", True) is False:
++            # Detached payload form (RFC 7515 Appendix F): the compact-form
++            # payload segment must be empty; the caller supplies the actual
++            # payload via the `detached_payload` argument in decode_complete.
++            # Skipping the base64 decode here removes an unauthenticated work
++            # amplifier — otherwise an attacker can inflate the unused
++            # segment to force CPU + memory cost before the signature is
++            # even checked.
++            if payload_segment:
++                raise DecodeError(
++                    "Payload segment must be empty when 'b64' is false."
++                )
++            payload = b""
++        else:
++            try:
++                payload = base64url_decode(payload_segment)
++            except (TypeError, binascii.Error) as err:
++                raise DecodeError("Invalid payload padding") from err
+ 
+         try:
+             signature = base64url_decode(crypto_segment)
+diff --git a/tests/test_api_jws.py b/tests/test_api_jws.py
+index 0715b9e..01de813 100644
+--- a/tests/test_api_jws.py
++++ b/tests/test_api_jws.py
+@@ -12,7 +12,7 @@ from jwt.exceptions import (
+     InvalidSignatureError,
+     InvalidTokenError,
+ )
+-from jwt.utils import base64url_decode
++from jwt.utils import base64url_decode, base64url_encode
+ from jwt.warnings import RemovedInPyjwt3Warning
+ 
+ from .utils import crypto_required, key_path, no_crypto_required
+@@ -984,6 +984,40 @@ class TestJWS:
+         assert "b64" not in msg_header_obj
+         assert msg_payload
+ 
++    def test_decode_b64_false_rejects_non_empty_payload_segment(
++        self, jws: PyJWS, payload: bytes
++    ) -> None:
++        # RFC 7515 Appendix F detached form: when b64=false, the compact-
++        # serialization payload segment must be empty. PyJWT must reject a
++        # non-empty middle segment without doing any base64-decoding work
++        # on it — that decode used to be the unauthenticated DoS amplifier.
++        secret = "secret"
++        import hmac as _hmac
++        import hashlib as _hashlib
++
++        header_obj = {
++            "typ": "JWT",
++            "alg": "HS256",
++            "b64": False,
++            "crit": ["b64"],
++        }
++        header_b64 = base64url_encode(
++            json.dumps(header_obj, separators=(",", ":")).encode()
++        )
++        # Stuff the middle segment with arbitrary attacker-controlled bytes.
++        # This should be rejected without being base64-decoded.
++        attacker_segment = b"A" * 1024
++        signing_input = b".".join([header_b64, payload])
++        sig = _hmac.new(secret.encode(), signing_input, _hashlib.sha256).digest()
++        token = b".".join(
++            [header_b64, attacker_segment, base64url_encode(sig)]
++        ).decode()
++
++        with pytest.raises(DecodeError, match="Payload segment must be empty"):
++            jws.decode(
++                token, secret, algorithms=["HS256"], detached_payload=payload
++            )
++
+     def test_decode_detached_content_without_proper_argument(self, jws: PyJWS) -> None:
+         example_jws = (
+             "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImI2NCI6ZmFsc2V9"
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index ff3eb8814d..3e68f9c0b3 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-48523.patch \
            file://CVE-2026-48524.patch \
+           file://CVE-2026-48525.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6


