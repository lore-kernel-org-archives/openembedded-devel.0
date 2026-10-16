Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DFBCCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:33:31 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13504.1792118004184969055
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YcNhczwc;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4722; q=dns/txt;
  s=iport01; t=1792118004; x=1793327604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ktX+2Dv9aIbmfh8YuRIkTp5jxlPSTfRUJlWbRO+03d8=;
  b=YcNhczwcX/VwxAW/PsZ91TuuQtVmMB5Bc98d8ohBGFCIcbSI0QvfAlTq
   UlMO386m79y7JNuNaZNJrvuJyQnAbWCDLTz9xYDVdT6MWa87/RkqlZQ2D
   qkG/Yi8YkEPFk9wdcolh4HpMfmrgxZmVKcO9kT5EmE6KbkUxqzVkvNev7
   f+4JT/E3n4HgCZajlsUwH+u5B9eyR7HJft9AC2ykjXhdu08c9KLxQJFbB
   10SBNtXBX6Vv0ceOLTy0CCF8l9u2fFGm8VCqY9U5jw1VS8drQxKG8Q1VX
   0+OSoeocnuheaaDfbnpvkk+kjl3tukuLrjIEiXWaeHOMrYk83UMTLCyMi
   A==;
X-CSE-ConnectionGUID: iM/VCInGSTmO5wYpB3ydkg==
X-CSE-MsgGUID: Bljn1xmmTwuAJU0kpkFhNg==
X-IPAS-Result: =?us-ascii?q?A0BIAgDZi9Fq/47/Ja1aHgEBCxIMggULgld1YENJA5ZHA?=
 =?us-ascii?q?54cgX4PAQEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxG8Z?=
 =?us-ascii?q?4F5M4EBgykBMQWBHtsyAQsUAQWBM4VAgwOBEYQPXRgBhHwnGxuBcoEVg2mBB?=
 =?us-ascii?q?YFcAoglBIIigQyBWoFNk3pIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QcbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSE?=
 =?us-ascii?q?x6COC2BDgErF2gSgRsekxqSPaEPCiiDdowilToaM4VbpRQLmH2OCpVfcIRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD44rDguDYIVkyHYnMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:qdGMWq5ZRVRbdA6hik/0twxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jdLWmqDOfmKYGT1f90katzg/EoH6JTUx4IxSlFlqyozZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ePKhfxM1WB051y
 fk/dS88djrYlu61z+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGc2FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEVUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYCMK4HUHJUL9qqej
 kjC/WKgEhQfCMOC4Bi4qnG0hcHPuyyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBZCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:/Hh66qHLFFijW/7qpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:3hucGm0YWPBP+pQ0cOesLbxfG+ViTFb8yljrH0qfVHlYUJfOWFOT9/Yx
X-Talos-MUID: 9a23:qOJ9LwWabZhsoMzq/BXohjc7JMJt37uzIWIwyZYeuOeEEyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="521956186"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:33:23 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 7D2AA18000223;
	Fri, 16 Oct 2026 02:33:23 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id D4C0ACBEFAB; Thu, 15 Oct 2026 19:33:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 8/9] python3-pyjwt: fix CVE-2026-102275
Date: Thu, 15 Oct 2026 19:33:21 -0700
Message-Id: <20261016023322.344365-9-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016023322.344365-1-hthakar@cisco.com>
References: <20261016023322.344365-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131019

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/jpadilla/pyjwt/commit/3cd9ceec33ced359decbad75b413ad668ae6332c
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-x33g-cr3x-6449

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-102275.patch        | 82 +++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102275.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-102275.patch b/meta-python/recipes-devtools/python/files/CVE-2026-102275.patch
new file mode 100644
index 0000000000..1aab8773d2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-102275.patch
@@ -0,0 +1,82 @@
+From 3cd9ceec33ced359decbad75b413ad668ae6332c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Fri, 11 Sep 2026 22:29:12 -0400
+Subject: [PATCH] fix: reject inconsistent OKP private keys
+
+CVE: CVE-2026-102275
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/3cd9ceec33ced359decbad75b413ad668ae6332c]
+
+(cherry picked from commit 3cd9ceec33ced359decbad75b413ad668ae6332c)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/algorithms.py        | 14 ++++++++++++--
+ tests/test_algorithms.py | 29 +++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+), 2 deletions(-)
+
+diff --git a/jwt/algorithms.py b/jwt/algorithms.py
+index 432fdcf..03976c9 100644
+--- a/jwt/algorithms.py
++++ b/jwt/algorithms.py
+@@ -1036,8 +1036,18 @@ if has_crypto:
+                         return Ed25519PublicKey.from_public_bytes(x)
+                     return Ed448PublicKey.from_public_bytes(x)
+                 d = base64url_decode(obj.get("d"))
++                private_key: Ed25519PrivateKey | Ed448PrivateKey
+                 if curve == "Ed25519":
+-                    return Ed25519PrivateKey.from_private_bytes(d)
+-                return Ed448PrivateKey.from_private_bytes(d)
++                    private_key = Ed25519PrivateKey.from_private_bytes(d)
++                else:
++                    private_key = Ed448PrivateKey.from_private_bytes(d)
++                if (
++                    private_key.public_key().public_bytes(
++                        encoding=Encoding.Raw, format=PublicFormat.Raw
++                    )
++                    != x
++                ):
++                    raise InvalidKeyError("Public key does not match private key")
++                return private_key
+             except ValueError as err:
+                 raise InvalidKeyError("Invalid key parameter") from err
+diff --git a/tests/test_algorithms.py b/tests/test_algorithms.py
+index acaa1fe..089b881 100644
+--- a/tests/test_algorithms.py
++++ b/tests/test_algorithms.py
+@@ -933,6 +933,35 @@ class TestAlgorithmsRFC7520:
+ 
+ @crypto_required
+ class TestOKPAlgorithms:
++    @pytest.mark.parametrize("curve", ("Ed25519", "Ed448"))
++    @pytest.mark.parametrize("as_dict", (False, True))
++    def test_okp_jwk_should_reject_inconsistent_private_key(
++        self, curve: str, as_dict: bool
++    ) -> None:
++        with open(key_path(f"jwk_okp_key_{curve}.json")) as keyfile:
++            jwk = json.load(keyfile)
++
++        d = base64url_decode(jwk["d"])
++        jwk["d"] = (
++            base64.urlsafe_b64encode(bytes([d[0] ^ 1]) + d[1:]).rstrip(b"=").decode()
++        )
++
++        with pytest.raises(InvalidKeyError):
++            OKPAlgorithm.from_jwk(jwk if as_dict else json.dumps(jwk))
++
++    @pytest.mark.parametrize("curve", ("Ed25519", "Ed448"))
++    @pytest.mark.parametrize("length", (0, 1, 56, 58))
++    def test_okp_jwk_should_reject_private_key_with_invalid_public_length(
++        self, curve: str, length: int
++    ) -> None:
++        with open(key_path(f"jwk_okp_key_{curve}.json")) as keyfile:
++            jwk = json.load(keyfile)
++
++        jwk["x"] = base64.urlsafe_b64encode(b"\x00" * length).rstrip(b"=").decode()
++
++        with pytest.raises(InvalidKeyError):
++            OKPAlgorithm.from_jwk(jwk)
++
+     hello_world_sig = b"Qxa47mk/azzUgmY2StAOguAd4P7YBLpyCfU3JdbaiWnXM4o4WibXwmIHvNYgN3frtE2fcyd8OYEaOiD/KiwkCg=="
+     hello_world_sig_pem = b"9ueQE7PT8uudHIQb2zZZ7tB7k1X3jeTnIfOVvGCINZejrqQbru1EXPeuMlGcQEZrGkLVcfMmr99W/+byxfppAg=="
+     hello_world = b"Hello World!"
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index 25f2451b2f..8953a781de 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-102268_CVE-2026-102270.patch \
            file://CVE-2026-102271.patch \
            file://CVE-2026-101917.patch \
+           file://CVE-2026-102275.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6


