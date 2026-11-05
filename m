Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27344.1793854576576944746
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 20:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TJMLlHIV;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6388; q=dns/txt;
  s=iport01; t=1793854576; x=1795064176;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bnPyfC0+S+GTyVtefcAWnPAbJybUGKgHLmj15/2fuTU=;
  b=TJMLlHIV+ZDVMMFEtNlqUPoka7QVka0v6N3A7kdATQ3VjfDJw5fW9aU/
   UrBjkXl4uRS25ksxVda357BKPqfW2hTdGF1byuPPskMNbwnu+zev99NUQ
   a2wdfMLLTsKItH7xeHE6p1b81que2ZIvknT11nyZXrbrALsh5OX5/XTHQ
   GmKFdrww+yTb7hZPAVRQr+jNqMZfhslM9CDOhnHGjxHhB20IZ8jkW3MRV
   EJBS5q/o0pzTC7MigG+ZzYSH9v9rKWOrXcZsjTsbwdxhDQTgKMg8L/+HK
   WokkRDC8twuq/d9+QdeNb2pFKvsRHatzW9PgT4E2nJQD5/w2XaQxJp6vs
   w==;
X-CSE-ConnectionGUID: BHtQZuZST0SbBIkqAoUeuA==
X-CSE-MsgGUID: 3z5q52OHRS6uC8M0ndaGWg==
X-IPAS-Result: =?us-ascii?q?A0BIAgBGC+xq/5H/Ja1aHgEBCxIMggULgld1YUJJA5Qng?=
 =?us-ascii?q?iEDniGBfg8BAQEPRA0EAQGFBQKOHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAIBE?=
 =?us-ascii?q?bxLgXkzgQGDKQGBVNszAQsUAYE4hUCII10YAUSEOScbG4FygRWDaYEFgVwCi?=
 =?us-ascii?q?CYEgg0VehKBWo0YAoFShnBIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QcbBgWBHYEegRKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZAsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeSL4MPAoEOASt/Eg8jaR6lWKERCiiDeIwklToaM4QEgVeSQpJUC5h9j?=
 =?us-ascii?q?gqWB0qEaYFoPIFZcBWDIglKGQ+OKw4Lg2CFZMhvIzUCAQgDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiRfgEB?=
IronPort-Data: A9a23:RZiM7q9i2D6C9fmCesWaDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jMbDGiDMv7camCnfNt2b4mx80pTvp/cytU3GlBk+X9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpIs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kcHZEhyPtFOl0Wz
 vYyCTMURxe+iv+flefTpulE3qzPLeHxN48Z/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0An1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCwa4KPI4XVH5g9ckCw/
 XCb5jmjJTEgD4KC4mqgqnSgj8DwknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:kmuXSaz8mZV9QnQWmURqKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:v6BW8mMGYOLsi+5Dcgl7zXwJKPsZKkbX5lbTOma/NGt0YejA
X-Talos-MUID: 9a23:ZsskDwsNBfi4pTE8782n3yM/LZoyxISUMx4QusUj48+IPANPNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="530211725"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 04:56:15 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 68654180001C5
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 04:56:15 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 0BFE7CC124E; Wed,  4 Nov 2026 20:56:15 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 4/8] python3-pyjwt: fix CVE-2026-102271
Date: Wed,  4 Nov 2026 20:56:10 -0800
Message-Id: <20261105045614.2677776-4-hthakar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131855
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

Reject DER-encoded public keys and certificates when preparing an HMAC
key to prevent asymmetric-key material from being accepted as an HMAC
secret.

[1] https://github.com/jpadilla/pyjwt/commit/2798504fa2663364573cf2d1043d8d7fef389499
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-p4g4-x82p-q773

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-pyjwt/CVE-2026-102271.patch       | 141 ++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102271.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102271.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102271.patch
new file mode 100644
index 0000000000..82938afb27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102271.patch
@@ -0,0 +1,141 @@
+From 20f172fe70aad3314ee988d343c5f1fb05b4ff70 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Wed, 14 Oct 2026 05:10:38 -0700
+Subject: [PATCH] fix: reject DER public keys as HMAC secrets
+
+CVE: CVE-2026-102271
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/2798504fa2663364573cf2d1043d8d7fef389499]
+
+Backport Changes:
+- Import UnsupportedAlgorithm, which the PyJWT 2.8.0 algorithms module
+  does not already import, for the DER loader exception handlers.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/algorithms.py        | 29 +++++++++++++++++++++++++++--
+ tests/test_algorithms.py | 39 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 66 insertions(+), 2 deletions(-)
+
+diff --git a/jwt/algorithms.py b/jwt/algorithms.py
+index b6303ed..fcfca89 100644
+--- a/jwt/algorithms.py
++++ b/jwt/algorithms.py
+@@ -28,7 +28,8 @@ else:
+ 
+ 
+ try:
+-    from cryptography.exceptions import InvalidSignature
++    from cryptography import x509
++    from cryptography.exceptions import InvalidSignature, UnsupportedAlgorithm
+     from cryptography.hazmat.backends import default_backend
+     from cryptography.hazmat.primitives import hashes
+     from cryptography.hazmat.primitives.asymmetric import padding
+@@ -67,6 +68,7 @@ try:
+         NoEncryption,
+         PrivateFormat,
+         PublicFormat,
++        load_der_public_key,
+         load_pem_private_key,
+         load_pem_public_key,
+         load_ssh_public_key,
+@@ -261,10 +263,33 @@ class HMACAlgorithm(Algorithm):
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
+index 0fbffc9..c843903 100644
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
+@@ -172,6 +177,40 @@ class TestAlgorithms:
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
+     def test_rsa_should_parse_pem_public_key(self):
+         algo = RSAAlgorithm(RSAAlgorithm.SHA256)
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index f62b8aa7bb..612b1c9cde 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
     file://CVE-2026-102269_p2.patch \
     file://CVE-2026-102267.patch \
     file://CVE-2026-102268_CVE-2026-102270.patch \
+    file://CVE-2026-102271.patch \
 "
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
-- 
2.35.6

