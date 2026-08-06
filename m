Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DAAC55838
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:51:33 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13113.1785995489081352051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 22:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Eb8VOEq/;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5034; q=dns/txt;
  s=iport01; t=1785995489; x=1787205089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mUydsJW6QMzVznEqTelXm++5wEJGKl8GT9EHb7XDBN0=;
  b=Eb8VOEq/TYgxRx/zQoH0MvlvjR1iA40IEOrKOSVSJ8KCI2Uz97ju6i4l
   Uq+wYy5ReM/GLSqmsyQgcUObSLnPO8PdMA6KSzWs6BBnYcKkVexyvA24F
   cGypOg2iT6kG1Vl0qEY/PwUuoVCunE1t/rvKbvw6F68c4WdW3xLqzC/pg
   +VEZkfV+n4KfRVOUABBXGjOeORKgZO1AzDZGeTk1bqI3WfDNzHHj82VL+
   av8grb451AHPdGyg8JCKVe1EvcvKMCVfNG6GwDiWHd8+z1QFtGVkA5a5n
   BGRWfD4fU5A21k/1DPTYg6DfZZS6o6bSsq1g/mNa4MZDx/GLGyJWGcF5h
   w==;
X-CSE-ConnectionGUID: /lVJyTC8Qtqa50Wal0Cnkg==
X-CSE-MsgGUID: DEqH5WOBTgKOIMw11nmYJQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgA8IHRq/40QJK1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDJwsBGAEbEhAcAwECLysjCBmDAgGCdAMRvHKBeTOBAYMoA?=
 =?us-ascii?q?YFU2y4BCxQBBYEzhT+IIV0YAUSEOCcbG4FygRWDaYEFgVwCiCUEgiJ6EoFak?=
 =?us-ascii?q?RZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBwWBHYEohGgjGTZ6g?=
 =?us-ascii?q?QlegS0qZAESF4EJgm8CgnqBKQsYDUgRLDcUGQQ+bgeNfyCCQWQqASt/EoE5p?=
 =?us-ascii?q?VihDwoog3WMIZU6GjOEBIFXkkCSUQuYfY4KlgEFSoRpgWg8gVlwFYMiCUoZD?=
 =?us-ascii?q?444g2uFZMZVJzICCTIBAQcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:NjADFqkfXDKMN1ZifvecGs/o5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYWziBMvfcYmqjfY0iPdznoxsHvsLTz4Q2HgA/rylhRFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEs//b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FcocxMRmPUoez
 OABIW1VURmH38mww73uH4GAhux7RCXqFIobvnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEWUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3Fb4uFJoXUG5wF9qqej
 k7r5kSkPTYwCNO87hug7Sv1gOr+vxquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:u11c8KOaBNtJVsBcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: 9a23:K18NdmNSOSjroO5DHy1Z1l8oMZAcbmTUkS/vKkvgImBqR+jA
X-Talos-MUID: 9a23:dqmrygqbOSoqP2o7mlUezx1PLec13IOENE8utrQjpJDdMylBGQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,207,1779148800"; 
   d="scan'208";a="798416618"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Aug 2026 05:51:28 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 1117418000183;
	Thu,  6 Aug 2026 05:51:28 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id B0A87CC12A6; Wed,  5 Aug 2026 22:51:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH 4/5] python3-pyjwt: Fix CVE-2026-48526
Date: Wed,  5 Aug 2026 22:51:00 -0700
Message-Id: <20260806055101.23160-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260806055101.23160-1-hthakar@cisco.com>
References: <20260806055101.23160-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 05:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128835

From: Hetvi Thakar <hthakar@cisco.com>

Reject JSON Web Key documents passed directly as HMAC secrets. This
prevents public asymmetric JWK data from being reused as an HMAC key
when an application permits mixed symmetric and asymmetric algorithms.

This patch applies the relevant subset of the upstream 2.13.0 fix.
The upstream commit is referenced in [1], and the public advisory is
referenced in [2].

[1] https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81
[2] https://github.com/advisories/GHSA-xgmm-8j9v-c9wx

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-pyjwt/CVE-2026-48526.patch | 87 +++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48526.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48526.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48526.patch
new file mode 100644
index 0000000000..6cde3ccce3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48526.patch
@@ -0,0 +1,87 @@
+From 9d2064bccc0ac60884906d9dd89ace589f9f8281 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Mon, 3 Aug 2026 03:22:08 -0700
+Subject: [PATCH] algorithms: reject raw JWK documents as HMAC secrets
+
+Reject JSON Web Key documents passed directly to
+HMACAlgorithm.prepare_key. Public asymmetric JWK data must not be
+accepted as an HMAC secret when callers permit mixed algorithm families.
+
+CVE: CVE-2026-48526
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81]
+
+Backport Changes:
+- Extracted only the CVE-2026-48526 raw-JWK rejection and regression tests
+  from the bundled upstream 2.13.0 commit. The other requested CVE fixes
+  are carried as separate patches.
+- Adapted the hunk and test locations to PyJWT 2.8.0, renamed the upstream
+  local variable `jwk_obj` to `jwk`, and omitted explanatory comments;
+  the validation logic and assertions are unchanged.
+- Excluded the separate empty-HMAC-key hardening bundled in the same file.
+- Omitted the 2.13.0 version and changelog updates, CVE-2026-48523 (which
+  does not affect 2.8.0), and unrelated hardening from the bundled commit.
+
+(cherry picked from commit 95791b1759b8aa4f2203575d344d5c78564cdc81)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/algorithms.py        | 13 +++++++++++++
+ tests/test_algorithms.py | 22 ++++++++++++++++++++++
+ 2 files changed, 35 insertions(+)
+
+diff --git a/jwt/algorithms.py b/jwt/algorithms.py
+index ed18715..b6303ed 100644
+--- a/jwt/algorithms.py
++++ b/jwt/algorithms.py
+@@ -270,6 +270,19 @@ class HMACAlgorithm(Algorithm):
+                 " should not be used as an HMAC secret."
+             )
+ 
++        stripped = key_bytes.lstrip()
++        if stripped.startswith(b"{"):
++            try:
++                jwk = json.loads(key_bytes)
++            except ValueError:
++                jwk = None
++            if isinstance(jwk, dict) and "kty" in jwk:
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
+index 1a39552..e5220c6 100644
+--- a/tests/test_algorithms.py
++++ b/tests/test_algorithms.py
+@@ -108,6 +108,28 @@ class TestAlgorithms:
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
++        algo = HMACAlgorithm(HMACAlgorithm.SHA256)
++
++        key = algo.prepare_key('{"this": "is just a json-shaped secret"}')
++        assert key == b'{"this": "is just a json-shaped secret"}'
++
+     @crypto_required
+     def test_rsa_should_parse_pem_public_key(self):
+         algo = RSAAlgorithm(RSAAlgorithm.SHA256)
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index fc3e0bc31d..3804d8ab72 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -10,6 +10,7 @@ SRC_URI += " \
     file://CVE-2026-48522.patch \
     file://CVE-2026-48524.patch \
     file://CVE-2026-48525.patch \
+    file://CVE-2026-48526.patch \
 "
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
-- 
2.35.6


