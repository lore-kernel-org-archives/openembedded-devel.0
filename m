Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2DAC5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:00:35 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4424.1787137230871035805
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ddYjP2M3;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7087; q=dns/txt;
  s=iport01; t=1787137230; x=1788346830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8KiUFvX9678hCjDeMZcpu4hzcF/oa38TogZs9/DK8Vo=;
  b=ddYjP2M3WD67AEDDCUjKMV5W7aNw0vYitDV+lspDbFBmGcmfqdA5AIXK
   Au1uehGr5KXSYw58pGSgCxT9OgAbFIhc0cd939yLzRJ+gZlzWBFscI+/t
   sJ7w7CzzCbM2XUml2BOJJvomRbScEieTjFMy8dJDeI2/anMfUGqI3gAXd
   XGOhRzngs2EWsnaToRAmhSkShbTXnO95QfzD3Y0+YH9jgyIKbm9TnD/3W
   UvyT/4ayNFYVNOrHo5RYqdCUiQQH8N6KzzTYmKunAEJp5ZTuraGL61ZH3
   wGAKlToEuG7kJeCyT9//y9TbAiJBhilyJfwqyhotZO5cCVyaYThXSGCih
   A==;
X-CSE-ConnectionGUID: z3Z/7ag0S3uxtUqTuLUvSQ==
X-CSE-MsgGUID: iKGUC8j3Q9ui7TAvl60/yw==
X-IPAS-Result: =?us-ascii?q?A0BMAgDpi4Vq/5AQJK1aglmCV3ReQ0mEV5FzA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDIwQLARgBGwYMEBwDAQIDAiYCAisjCBAJgwIBgnQDE?=
 =?us-ascii?q?cNJen8zgQGDKAGBVNswAQsUAQWBBS6FP4MfAYUCXRgBRIQ4JxsbgXKBFYNpg?=
 =?us-ascii?q?QWBXAKFO4JqBIINFYEMgVqBLZA4SIECHANZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPhc1WBsGBYEdgSiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJRREKC?=
 =?us-ascii?q?wsYDUgRLDcUGQQ9AW4HjkkgghoNDhJkKgEKIAF7BBJyKR4EkzCSJKEPCiiDd?=
 =?us-ascii?q?owhlToaM4QEgVeSQJJRC5h9jgqWBhM3hGmBaDyBWXAVO4JnCUoZD44qDguDY?=
 =?us-ascii?q?IVkxlUnMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:P+mL/qwlcqJ1NRnwntt6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUPy
 WRNXj+GOqqLNGr3fYxzbYS//BxVuZ/XytZnHlY/+VhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHybuiJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkazNMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFNtD8pH8+kvOjpT5
 eAlMQwQSi2dvNvjldpXSsE07igiBMDvOIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUicC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOK9aoSJIIzWLSlTtke7i
 V/tr2aiO0AHNYOj4CSBrCrrl/CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:2nCGjKGNDr5gafo5pLqENseALOsnbusQ8zAXPo5KJiC9Ffbo8f
 xG/c5rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAdGSS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jcjpy1iZNNXN77V1TLu
 vm2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3AUSjPo2g/urxgwwvyUSyqyWYRwDJuYCbviyjZLBe?=
 =?us-ascii?q?DUnt5VICMdUK0xb1fqp87?=
X-Talos-MUID: 9a23:PQMQsQUHrRGrftzq/D7PqwxJZMUz2vWzCR8xuIsC5ZHDJDMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="828264284"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:00:29 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id CB711180004FB;
	Wed, 19 Aug 2026 11:00:29 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 68CA3CCA79B; Wed, 19 Aug 2026 04:00:29 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][wrynose][PATCH 5/6] python3-pyjwt: Fix CVE-2026-48526
Date: Wed, 19 Aug 2026 04:00:15 -0700
Message-Id: <20260819110016.252278-5-hthakar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129345

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream 2.13.0 backport for
CVE-2026-48526. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81
[2] https://github.com/advisories/GHSA-xgmm-8j9v-c9wx

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-48526.patch         | 126 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-48526.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-48526.patch b/meta-python/recipes-devtools/python/files/CVE-2026-48526.patch
new file mode 100644
index 0000000000..00c2a55838
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-48526.patch
@@ -0,0 +1,126 @@
+From 336f1a0c18c04b63cab024b9f030af2b6c6b248c Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-48526
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81]
+
+Backport Changes:
+- Split out the raw JWK-as-HMAC-secret rejection because the upstream
+  commit bundles multiple CVEs.
+- Omitted CHANGELOG.rst because it conflicted and is release documentation.
+- Carried `test_hmac_prepare_key_rejects_jwk_json` and
+  `test_hmac_prepare_key_accepts_json_without_kty` regression tests covering
+  the same JWK-classification security boundary.
+- Omitted other tests/test_algorithms.py hunks for separate empty-key and
+  per-call key-length hardening.
+- Omitted the 2.13.0 version bump and other bundled fixes; applicable CVE
+  fixes are carried in separate patches.
+
+(cherry picked from commit 95791b1759b8aa4f2203575d344d5c78564cdc81)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/algorithms.py        | 20 ++++++++++++++++++++
+ tests/test_algorithms.py | 23 +++++++++++++++++++++++
+ 2 files changed, 43 insertions(+)
+
+diff --git a/jwt/algorithms.py b/jwt/algorithms.py
+index 615dcf3..cf6da45 100644
+--- a/jwt/algorithms.py
++++ b/jwt/algorithms.py
+@@ -331,6 +331,26 @@ class HMACAlgorithm(Algorithm):
+                 " should not be used as an HMAC secret."
+             )
+ 
++        # Defense against algorithm-confusion attacks: an attacker with
++        # control over the token header can force this code path by setting
++        # alg=HS*, and HMACAlgorithm is the only algorithm that accepts
++        # arbitrary bytes as a valid secret. Other algorithms reject
++        # non-key-shaped input naturally. Even a symmetric (kty=oct) JWK
++        # should be loaded via PyJWK / from_jwk rather than fed as raw JSON
++        # bytes (whose contents are not the secret material).
++        stripped = key_bytes.lstrip()
++        if stripped.startswith(b"{"):
++            try:
++                jwk_obj = json.loads(key_bytes)
++            except ValueError:
++                jwk_obj = None
++            if isinstance(jwk_obj, dict) and "kty" in jwk_obj:
++                raise InvalidKeyError(
++                    "The specified key looks like a JWK and should not be "
++                    "used directly as an HMAC secret. Load it via "
++                    "PyJWK / HMACAlgorithm.from_jwk first."
++                )
++
+         return key_bytes
+ 
+     @overload
+diff --git a/tests/test_algorithms.py b/tests/test_algorithms.py
+index 5449f3c..82659cf 100644
+--- a/tests/test_algorithms.py
++++ b/tests/test_algorithms.py
+@@ -122,6 +122,29 @@ class TestAlgorithms:
+             with pytest.raises(InvalidKeyError):
+                 algo.from_jwk(keyfile.read())
+ 
++    @pytest.mark.parametrize(
++        "jwk_file",
++        [
++            "jwk_rsa_pub.json",
++            "jwk_ec_pub_P-256.json",
++            "jwk_okp_pub_Ed25519.json",
++            "jwk_hmac.json",
++        ],
++    )
++    def test_hmac_prepare_key_rejects_jwk_json(self, jwk_file: str) -> None:
++        algo = HMACAlgorithm(HMACAlgorithm.SHA256)
++
++        with open(key_path(jwk_file)) as keyfile:
++            with pytest.raises(InvalidKeyError, match="looks like a JWK"):
++                algo.prepare_key(keyfile.read())
++
++    def test_hmac_prepare_key_accepts_json_without_kty(self) -> None:
++        # JSON that doesn't look like a JWK (no "kty") should not be misclassified.
++        algo = HMACAlgorithm(HMACAlgorithm.SHA256)
++
++        key = algo.prepare_key('{"this": "is just a json-shaped secret"}')
++        assert key == b'{"this": "is just a json-shaped secret"}'
++
+     @crypto_required
+     def test_rsa_should_parse_pem_public_key(self) -> None:
+         algo = RSAAlgorithm(RSAAlgorithm.SHA256)
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index 3e68f9c0b3..bae7418565 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-48523.patch \
            file://CVE-2026-48524.patch \
            file://CVE-2026-48525.patch \
+           file://CVE-2026-48526.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6


