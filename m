Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EDFCCA46B
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:33:31 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13367.1792118004529976392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HDk+4Kbu;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6037; q=dns/txt;
  s=iport01; t=1792118004; x=1793327604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4QkVMfNcFDSXOpm7b1nBW4V+jTzeqZ+5wZoqRNuKrz0=;
  b=HDk+4KbuEwR/wydtjmZJ+k+5u3WK/dTZPxA1yqaBY1lPQioMOlQa98D0
   ET5NKQOwTrnV/Q4torZBLzOuyGd0H1HwUFnxnyQfEEjJ5nwT1mP7wZhMo
   nlFkIP927Sa4JKCu72ZDvhKZLNApcM9C8HL3kB9GCNpD17ks08TY/ZNAG
   Ju9dRwLWVLndJ3am5B0MvpDx3Lv+s+HYNdpcQaM5p43vguIByMH6TCacN
   +nR35LvWDVdB5FmKcDluXUP4lEuGXcHcrb33yQvfaYh/1w8UEFsrCFrL3
   pgcJ9VLjlnKq22bpzCQa/flrr6gdbbQioSNYTiOviUH2hA/vBH4PTsK7G
   w==;
X-CSE-ConnectionGUID: XA3wdq6nT3+HlfdprF7ypg==
X-CSE-MsgGUID: Te9wRqt+SoO7W8qsnEsZxg==
X-IPAS-Result: =?us-ascii?q?A0BIAgDZi9Fq/5L/Ja1aglmCV3VgQ0kDlkcDnhyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEbxngXkzgQGDK?=
 =?us-ascii?q?QGBVNsyAQsUAQWBM4VAiCNdGAFEhDgnGxuBcoEVg2mBBYFcAoEnhn4EgiKBD?=
 =?us-ascii?q?IFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjG?=
 =?us-ascii?q?TZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALg?=
 =?us-ascii?q?Rs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSEx6CYwKBDgErfxIPg?=
 =?us-ascii?q?QwepVeMAJUPCiiDdowilToaM4QEgVeSQJJUC5h9jgqWBUqEaYFoPIFZcBWDI?=
 =?us-ascii?q?glKGQ+OKw4Lg2CFZMh2JzICAQgDLwEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:Uhvq/aiv0CTRP07VGms3rSDMX161MREKZh0ujC45NGQN5FlHY01je
 htvUGCOPvbcYGWkc9p1boi390oG68OHm4BlQAVtqyhjE3tjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUo071oDXgQ8
 8BDaxAJYBybnczp0aq0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIIYLTFZ0Jxx/wS
 mTuw2moHSsDKJ+kzh3azSK1nenihhHrV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFm8HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:B7KsOaD2OgK4PMflHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:lF9Ol2PrzROZdu5DaAA860INRMYZKT79yHncO1WWVndxR+jA
X-Talos-MUID: 9a23:7hPz6AaBjl6hoeBTizK9mwt7KIRT5IPxNxAUipMroPuUOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536180411"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:33:23 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 7A79C1800048E;
	Fri, 16 Oct 2026 02:33:23 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id CD867CBEF8A; Thu, 15 Oct 2026 19:33:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 6/9] python3-pyjwt: fix CVE-2026-102271
Date: Thu, 15 Oct 2026 19:33:19 -0700
Message-Id: <20261016023322.344365-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016023322.344365-1-hthakar@cisco.com>
References: <20261016023322.344365-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131018

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/jpadilla/pyjwt/commit/2798504fa2663364573cf2d1043d8d7fef389499
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-p4g4-x82p-q773

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-102271.patch        | 136 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102271.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-102271.patch b/meta-python/recipes-devtools/python/files/CVE-2026-102271.patch
new file mode 100644
index 0000000000..c6e255d62b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-102271.patch
@@ -0,0 +1,136 @@
+From 2798504fa2663364573cf2d1043d8d7fef389499 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Thu, 10 Sep 2026 08:33:25 -0400
+Subject: [PATCH] fix: reject DER public keys as HMAC secrets
+
+CVE: CVE-2026-102271
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/2798504fa2663364573cf2d1043d8d7fef389499]
+
+(cherry picked from commit 2798504fa2663364573cf2d1043d8d7fef389499)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/algorithms.py        | 27 ++++++++++++++++++++++++++-
+ tests/test_algorithms.py | 39 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 65 insertions(+), 1 deletion(-)
+
+diff --git a/jwt/algorithms.py b/jwt/algorithms.py
+index cf6da45..432fdcf 100644
+--- a/jwt/algorithms.py
++++ b/jwt/algorithms.py
+@@ -33,6 +33,7 @@ from .utils import (
+ )
+ 
+ try:
++    from cryptography import x509
+     from cryptography.exceptions import InvalidSignature, UnsupportedAlgorithm
+     from cryptography.hazmat.backends import default_backend
+     from cryptography.hazmat.primitives import hashes
+@@ -72,6 +73,7 @@ try:
+         NoEncryption,
+         PrivateFormat,
+         PublicFormat,
++        load_der_public_key,
+         load_pem_private_key,
+         load_pem_public_key,
+         load_ssh_public_key,
+@@ -322,10 +324,33 @@ class HMACAlgorithm(Algorithm):
+     def __init__(self, hash_alg: HashlibHash) -> None:
+         self.hash_alg = hash_alg
+ 
++    @staticmethod
++    def _is_der_key(key_bytes: bytes) -> bool:
++        if not has_crypto:
++            return False
++
++        try:
++            load_der_public_key(key_bytes)
++        except (TypeError, ValueError, UnsupportedAlgorithm):
++            pass
++        else:
++            return True
++
++        try:
++            x509.load_der_x509_certificate(key_bytes)
++        except (TypeError, ValueError, UnsupportedAlgorithm):
++            return False
++        else:
++            return True
++
+     def prepare_key(self, key: str | bytes) -> bytes:
+         key_bytes = force_bytes(key)
+ 
+-        if is_pem_format(key_bytes) or is_ssh_key(key_bytes):
++        if (
++            is_pem_format(key_bytes)
++            or is_ssh_key(key_bytes)
++            or self._is_der_key(key_bytes)
++        ):
+             raise InvalidKeyError(
+                 "The specified key is an asymmetric key or x509 certificate and"
+                 " should not be used as an HMAC secret."
+diff --git a/tests/test_algorithms.py b/tests/test_algorithms.py
+index 4e149a7..acaa1fe 100644
+--- a/tests/test_algorithms.py
++++ b/tests/test_algorithms.py
+@@ -12,6 +12,7 @@ from .keys import load_ec_pub_key_p_521, load_hmac_key, load_rsa_pub_key
+ from .utils import crypto_required, key_path
+ 
+ if has_crypto:
++    from cryptography import x509
+     from cryptography.hazmat.primitives.asymmetric.ec import (
+         EllipticCurvePrivateKey,
+         EllipticCurvePublicKey,
+@@ -28,6 +29,10 @@ if has_crypto:
+         RSAPrivateKey,
+         RSAPublicKey,
+     )
++    from cryptography.hazmat.primitives.serialization import (
++        Encoding,
++        PublicFormat,
++    )
+ 
+     from jwt.algorithms import ECAlgorithm, OKPAlgorithm, RSAAlgorithm, RSAPSSAlgorithm
+ 
+@@ -187,6 +192,40 @@ class TestAlgorithms:
+         key = algo.prepare_key('{"this": "is just a json-shaped secret"}')
+         assert key == b'{"this": "is just a json-shaped secret"}'
+ 
++    @crypto_required
++    @pytest.mark.parametrize(
++        "key_format_name",
++        ("SubjectPublicKeyInfo", "PKCS1"),
++    )
++    def test_hmac_prepare_key_rejects_der_public_key(
++        self, key_format_name: str
++    ) -> None:
++        algo = HMACAlgorithm(HMACAlgorithm.SHA256)
++        public_key = cast(RSAPublicKey, load_rsa_pub_key())
++        der_key = public_key.public_bytes(
++            Encoding.DER, getattr(PublicFormat, key_format_name)
++        )
++
++        with pytest.raises(InvalidKeyError, match="asymmetric key"):
++            algo.prepare_key(der_key)
++
++    @crypto_required
++    def test_hmac_prepare_key_rejects_der_certificate(self) -> None:
++        algo = HMACAlgorithm(HMACAlgorithm.SHA256)
++        with open(key_path("testkey_rsa.cer"), "rb") as certificate_file:
++            certificate = x509.load_pem_x509_certificate(certificate_file.read())
++        der_certificate = certificate.public_bytes(Encoding.DER)
++
++        with pytest.raises(InvalidKeyError, match="x509 certificate"):
++            algo.prepare_key(der_certificate)
++
++    @crypto_required
++    def test_hmac_prepare_key_accepts_non_key_binary_secret(self) -> None:
++        algo = HMACAlgorithm(HMACAlgorithm.SHA256)
++        secret = b"\x30\x82not-a-der-key"
++
++        assert algo.prepare_key(secret) == secret
++
+     @crypto_required
+     def test_rsa_should_parse_pem_public_key(self) -> None:
+         algo = RSAAlgorithm(RSAAlgorithm.SHA256)
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index b93806fe48..cd91139d58 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-102269.patch \
            file://CVE-2026-102267.patch \
            file://CVE-2026-102268_CVE-2026-102270.patch \
+           file://CVE-2026-102271.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6


