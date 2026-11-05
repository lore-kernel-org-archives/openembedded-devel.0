Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27342.1793854576520776416
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 20:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U8upZV75;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13453; q=dns/txt;
  s=iport01; t=1793854576; x=1795064176;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l4jbizkZc5D0f07bmC0rFVNWlnKK6Af2TkqDt+AaWJs=;
  b=U8upZV75PDnZMfhOdZgw94dMxthrHFK6hdm20GGoyQd5v6n0dtTXfJ2a
   rgUlJhqkfpjvxVykQ5SAoBMneqjQGqV9Z6P1Ry/C4mlguZPOaDfqm1aaZ
   f5zr5pnZKaqURMqEjGIBe005R5UzynuauxbSsU91bdIcwVJgT2cDJN9im
   f30twXuhOPMUu81WEVviDIzlTdF+wfcqAKpfrYodSHZieVaEqing9VIW4
   8w1tJfr4R/RhpiJGP9eun0ChwZPWh5ckiu8fuOyOphgUArEhD2mbb51RD
   VRrAFO1/AhhUbWIFMtw+iirFAPCvFqoHnysKGFF6LVvBTxdHt6gTDRNqt
   w==;
X-CSE-ConnectionGUID: of3gqFuASsqtvkuZW8KYVA==
X-CSE-MsgGUID: aoHsUgstRfO+AILOfME5gw==
X-IPAS-Result: =?us-ascii?q?A0APAACOCuxq/5H/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX8CAQEBAQsBglZ1YUJJA4RUj1OCIYtolDoPAQEBD0QNBAEBk?=
 =?us-ascii?q?yMCJjcGDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBK?=
 =?us-ascii?q?QQLARgBWQMBAgMCJgIiCyMYCYMCAYI6AzcCARG8R3p/M4EBgykBgVTYTA2CW?=
 =?us-ascii?q?gELFAGBCi4BhT+CfyABhQNdGAFEgxqBHycbG4FygRWDaYEFSwFOQgKFPIJqB?=
 =?us-ascii?q?IIiehKBWh6MegKBUoZwSIECHANZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPhcvW?=
 =?us-ascii?q?BsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZB?=
 =?us-ascii?q?D0BbgeSL4JkLWQXEwEHJBdoEg+BDB4ckwUyj2SCIYE1nmtxCiiDeIwkjz6Ff?=
 =?us-ascii?q?BozhASBV5JCklQLmH2CWYsxhAqRVwgbTYRpgX4mgVlwFYMiCUoZD44rDguDR?=
 =?us-ascii?q?BzOUyM1AgkDLwEBBwIHAQwBAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:G5wt/ql0Y469cug7AIk1PmXo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLUDiAa/vfNDb9fNkiaoS+/UgO6MWBm9FiGgRo+C88RltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYoWoeluL3xnz
 ucBNC4OcyK818GH/pvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiTBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIeOJIbUFJgLwC50o
 ErP+ETiPx4BKOaR7nms01aLiMriwCzkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cHnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:tDrzcaM7yBBNycBcTvejsMiBIKoaSvp037BN7TEVdfU1SL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3ACwX6BmmBt/78rfpNT47IJjNMcD/XOXrTl3jJDVK?=
 =?us-ascii?q?RMn1wVKOWVG2vqIBVreM7zg=3D=3D?=
X-Talos-MUID: 9a23:JB8A8Atvua5fDTVF2s2njTZCL/pn+LiUBmdOuLQinMehGHF/JGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="536269566"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 04:56:15 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 58877180001C2
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 04:56:15 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id F0128CC124B; Wed,  4 Nov 2026 20:56:14 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 1/8] python3-pyjwt: fix CVE-2026-102269
Date: Wed,  4 Nov 2026 20:56:07 -0800
Message-Id: <20261105045614.2677776-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 04:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131854
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

It also applies the upstream follow-up [3] to accept canonical Base64URL
padding while continuing to reject malformed JWS segments.

[1] https://github.com/jpadilla/pyjwt/commit/e6f48401001609a8f99e71fcaf355fb895d508a8
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-hxm8-2xgr-2p9m
[3] https://github.com/jpadilla/pyjwt/commit/7bf32526738fe837387bdedd4849a4a525c33a79

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-pyjwt/CVE-2026-102269_p1.patch    | 138 ++++++++++++++
 .../python3-pyjwt/CVE-2026-102269_p2.patch    | 169 ++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |   2 +
 3 files changed, 309 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102269_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102269_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102269_p1.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102269_p1.patch
new file mode 100644
index 0000000000..68fe3f4edc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102269_p1.patch
@@ -0,0 +1,138 @@
+From cfcc99413c41c6b59a6de6fc222291367d8922b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Wed, 14 Oct 2026 02:38:35 -0700
+Subject: [PATCH] Reject non-canonical compact JWS segments
+
+CVE: CVE-2026-102269
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/e6f48401001609a8f99e71fcaf355fb895d508a8]
+
+Backport Changes:
+- Added a separating blank line after _BASE64URL_ALPHABET to retain two
+  blank lines before PyJWS; PyJWT 2.8.0 lacks the adjacent upstream
+  _ALGORITHM_UNSET constant.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/api_jws.py               | 36 ++++++++++++++++++++++++------------
+ tests/test_api_jws.py        | 11 +++++++++++
+ tests/test_compressed_jwt.py |  8 ++++----
+ 3 files changed, 39 insertions(+), 16 deletions(-)
+
+diff --git a/jwt/api_jws.py b/jwt/api_jws.py
+index 0d5ab2b..10618b7 100644
+--- a/jwt/api_jws.py
++++ b/jwt/api_jws.py
+@@ -23,6 +23,10 @@ from .warnings import RemovedInPyjwt3Warning
+ if TYPE_CHECKING:
+     from .algorithms import AllowedPrivateKeys, AllowedPublicKeys
+ 
++_BASE64URL_ALPHABET = (
++    b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
++)
++
+ 
+ class PyJWS:
+     header_typ = "JWT"
+@@ -248,6 +252,23 @@ class PyJWS:
+ 
+         return headers
+ 
++    @staticmethod
++    def _decode_base64url_segment(segment: bytes, name: str) -> bytes:
++        if len(segment) % 4 == 1 or any(
++            character not in _BASE64URL_ALPHABET for character in segment
++        ):
++            raise DecodeError(f"Invalid {name} padding")
++
++        try:
++            decoded = base64url_decode(segment)
++        except (TypeError, binascii.Error) as err:
++            raise DecodeError(f"Invalid {name} padding") from err
++
++        if base64url_encode(decoded) != segment:
++            raise DecodeError(f"Invalid {name} padding")
++
++        return decoded
++
+     def _load(self, jwt: str | bytes) -> tuple[bytes, bytes, dict[str, Any], bytes]:
+         if isinstance(jwt, str):
+             jwt = jwt.encode("utf-8")
+@@ -261,10 +282,7 @@ class PyJWS:
+         except ValueError as err:
+             raise DecodeError("Not enough segments") from err
+ 
+-        try:
+-            header_data = base64url_decode(header_segment)
+-        except (TypeError, binascii.Error) as err:
+-            raise DecodeError("Invalid header padding") from err
++        header_data = self._decode_base64url_segment(header_segment, "header")
+ 
+         try:
+             header = json.loads(header_data)
+@@ -283,15 +301,9 @@ class PyJWS:
+                 )
+             payload = b""
+         else:
+-            try:
+-                payload = base64url_decode(payload_segment)
+-            except (TypeError, binascii.Error) as err:
+-                raise DecodeError("Invalid payload padding") from err
++            payload = self._decode_base64url_segment(payload_segment, "payload")
+ 
+-        try:
+-            signature = base64url_decode(crypto_segment)
+-        except (TypeError, binascii.Error) as err:
+-            raise DecodeError("Invalid crypto padding") from err
++        signature = self._decode_base64url_segment(crypto_segment, "crypto")
+ 
+         return (payload, signing_input, header, signature)
+ 
+diff --git a/tests/test_api_jws.py b/tests/test_api_jws.py
+index 29f84a7..3b05845 100644
+--- a/tests/test_api_jws.py
++++ b/tests/test_api_jws.py
+@@ -478,6 +478,17 @@ class TestJWS:
+ 
+         assert "Invalid crypto padding" in str(exc.value)
+ 
++    def test_decode_rejects_non_canonical_crypto_segment(
++        self, jws: PyJWS, payload: bytes
++    ) -> None:
++        secret = "a" * 32
++        token = jws.encode(payload, secret, algorithm="HS256")
++        header, encoded_payload, signature = token.split(".")
++        mutated_token = ".".join((header, encoded_payload, f"{signature}!!!!"))
++
++        with pytest.raises(DecodeError, match="Invalid crypto padding"):
++            jws.decode(mutated_token, secret, algorithms=["HS256"])
++
+     def test_decode_with_algo_none_should_fail(self, jws, payload):
+         jws_message = jws.encode(payload, key=None, algorithm=None)
+ 
+diff --git a/tests/test_compressed_jwt.py b/tests/test_compressed_jwt.py
+index 21fac3f..7603633 100644
+--- a/tests/test_compressed_jwt.py
++++ b/tests/test_compressed_jwt.py
+@@ -20,8 +20,8 @@ def test_decodes_complete_valid_jwt_with_compressed_payload():
+     # Buffer.from(pako.deflateRaw('{"hello": "world"}')).toString('base64')
+     example_jwt = (
+         b"eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9"
+-        b".q1bKSM3JyVeyUlAqzy/KSVGqBQA="
+-        b".08wHYeuh1rJXmcBcMrz6NxmbxAnCQp2rGTKfRNIkxiw="
++        b".q1bKSM3JyVeyUlAqzy_KSVGqBQA"
++        b".AAn1elCJC5MQCYFwTwa2tjjtyLgqLUVU-Y1vFBsU8jo"
+     )
+     decoded = CompressedPyJWT().decode_complete(
+         example_jwt, example_secret, algorithms=["HS256"]
+@@ -31,7 +31,7 @@ def test_decodes_complete_valid_jwt_with_compressed_payload():
+         "header": {"alg": "HS256", "typ": "JWT"},
+         "payload": example_payload,
+         "signature": (
+-            b"\xd3\xcc\x07a\xeb\xa1\xd6\xb2W\x99\xc0\\2\xbc\xfa7"
+-            b"\x19\x9b\xc4\t\xc2B\x9d\xab\x192\x9fD\xd2$\xc6,"
++            b"\x00\t\xf5zP\x89\x0b\x93\x10\t\x81pO\x06\xb6\xb68"
++            b"\xed\xc8\xb8*-ET\xf9\x8do\x14\x1b\x14\xf2:"
+         ),
+     }
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102269_p2.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102269_p2.patch
new file mode 100644
index 0000000000..dcd0daebd2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102269_p2.patch
@@ -0,0 +1,169 @@
+From 7bf32526738fe837387bdedd4849a4a525c33a79 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@webapplicate.com>
+Date: Mon, 28 Sep 2026 12:22:34 -0400
+Subject: [PATCH] Accept canonical Base64URL padding in JWT segments (#1216)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* Accept trailing Base64URL padding when decoding JWS segments
+
+The canonical encode/decode round-trip rejected AWS ALB tokens that
+include standard '=' padding. Keep rejecting non-alphabet junk such
+as '!!!!', but allow trailing padding so those tokens verify.
+
+Fixes #1209
+
+* [pre-commit.ci] auto fixes from pre-commit.com hooks
+
+for more information, see https://pre-commit.ci
+
+* test: cover padded Base64URL segment validation
+
+* test: verify padded ALB-style ES256 JWT decoding
+
+---------
+
+Co-authored-by: jaideeppyne <jaideeppyne1997@gmail.com>
+Co-authored-by: pre-commit-ci[bot] <66853113+pre-commit-ci[bot]@users.noreply.github.com>
+Co-authored-by: José Padilla <jpadilla@users.noreply.github.com>
+
+CVE: CVE-2026-102269
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/7bf32526738fe837387bdedd4849a4a525c33a79]
+
+Backport Changes:
+- Omitted the upstream release changelog update, which documents a later version.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/api_jws.py        | 21 +++++++++++++++++----
+ tests/test_api_jws.py | 44 ++++++++++++++++++++++++++++++++++++++++++++
+ tests/test_api_jwt.py | 12 ++++++++++--
+ 3 files changed, 71 insertions(+), 6 deletions(-)
+
+diff --git a/jwt/api_jws.py b/jwt/api_jws.py
+index 10618b7..acf04e2 100644
+--- a/jwt/api_jws.py
++++ b/jwt/api_jws.py
+@@ -254,17 +254,30 @@ class PyJWS:
+ 
+     @staticmethod
+     def _decode_base64url_segment(segment: bytes, name: str) -> bytes:
+-        if len(segment) % 4 == 1 or any(
+-            character not in _BASE64URL_ALPHABET for character in segment
++        # Accept trailing '=' used by some issuers (e.g. AWS ALB). Still
++        # reject non-alphabet junk such as '!!!!' (GHSA-hxm8-2xgr-2p9m).
++        padding = 0
++        stripped = segment
++        while stripped.endswith(b"="):
++            stripped = stripped[:-1]
++            padding += 1
++            if padding > 2:
++                raise DecodeError(f"Invalid {name} padding")
++
++        if padding and len(segment) % 4 != 0:
++            raise DecodeError(f"Invalid {name} padding")
++
++        if len(stripped) % 4 == 1 or any(
++            character not in _BASE64URL_ALPHABET for character in stripped
+         ):
+             raise DecodeError(f"Invalid {name} padding")
+ 
+         try:
+-            decoded = base64url_decode(segment)
++            decoded = base64url_decode(stripped)
+         except (TypeError, binascii.Error) as err:
+             raise DecodeError(f"Invalid {name} padding") from err
+ 
+-        if base64url_encode(decoded) != segment:
++        if base64url_encode(decoded) != stripped:
+             raise DecodeError(f"Invalid {name} padding")
+ 
+         return decoded
+diff --git a/tests/test_api_jws.py b/tests/test_api_jws.py
+index 1ceb8df..c903c64 100644
+--- a/tests/test_api_jws.py
++++ b/tests/test_api_jws.py
+@@ -489,6 +489,50 @@ class TestJWS:
+         with pytest.raises(DecodeError, match="Invalid crypto padding"):
+             jws.decode(mutated_token, secret, algorithms=["HS256"])
+ 
++    def test_decode_accepts_padded_crypto_segment(
++        self, jws: PyJWS, payload: bytes
++    ) -> None:
++        secret = "a" * 32
++        token = jws.encode(payload, secret, algorithm="HS256")
++        header, encoded_payload, signature = token.split(".")
++        pad = "=" * ((4 - len(signature) % 4) % 4)
++        assert pad, (
++            "HS256 signatures should need padding when restored to 4-char groups"
++        )
++        padded_token = ".".join((header, encoded_payload, signature + pad))
++
++        assert jws.decode(padded_token, secret, algorithms=["HS256"]) == payload
++
++    def test_decode_rejects_embedded_padding_in_crypto_segment(
++        self, jws: PyJWS, payload: bytes
++    ) -> None:
++        secret = "a" * 32
++        token = jws.encode(payload, secret, algorithm="HS256")
++        header, encoded_payload, signature = token.split(".")
++        mutated_token = ".".join(
++            (header, encoded_payload, signature[:2] + "=" + signature[2:])
++        )
++
++        with pytest.raises(DecodeError, match="Invalid crypto padding"):
++            jws.decode(mutated_token, secret, algorithms=["HS256"])
++
++    @pytest.mark.parametrize(
++        ("segment", "decoded"),
++        [(b"Zg", b"f"), (b"Zg==", b"f"), (b"Zm8=", b"fo")],
++    )
++    def test_decode_accepts_canonical_base64url_padding(
++        self, segment: bytes, decoded: bytes
++    ) -> None:
++        assert PyJWS._decode_base64url_segment(segment, "crypto") == decoded
++
++    @pytest.mark.parametrize(
++        "segment",
++        [b"Zg===", b"Zg=", b"a", b"Z?==", b"Zh", b"Zh=="],
++    )
++    def test_decode_rejects_invalid_base64url_padding(self, segment: bytes) -> None:
++        with pytest.raises(DecodeError, match="Invalid crypto padding"):
++            PyJWS._decode_base64url_segment(segment, "crypto")
++
+     def test_decode_with_algo_none_should_fail(self, jws, payload):
+         jws_message = jws.encode(payload, key=None, algorithm=None)
+ 
+diff --git a/tests/test_api_jwt.py b/tests/test_api_jwt.py
+index 618b60f..dc07b24 100644
+--- a/tests/test_api_jwt.py
++++ b/tests/test_api_jwt.py
+@@ -282,7 +282,12 @@ class TestJWT:
+     # encoding / decoding operations equally (causing tests
+     # to still pass).
+     @crypto_required
+-    def test_decodes_valid_es256_jwt(self, jwt):
++    @pytest.mark.parametrize(
++        "signature_padding", [b"", b"=="], ids=["compact", "alb-padded"]
++    )
++    def test_decodes_valid_es256_jwt(
++        self, jwt: PyJWT, signature_padding: bytes
++    ) -> None:
+         example_payload = {"hello": "world"}
+         with open(key_path("testkey_ec.pub")) as fp:
+             example_pubkey = fp.read()
+@@ -292,7 +297,10 @@ class TestJWT:
+             b"d2SsX8hhlnWelQFmPFSf_JzC2EbLnar92t-bXsDovzxp25ExazrVHkfPkQ"
+         )
+ 
+-        decoded_payload = jwt.decode(example_jwt, example_pubkey, algorithms=["ES256"])
++        # AWS ALB can include standard padding on its ES256 signature (#1209).
++        decoded_payload = jwt.decode(
++            example_jwt + signature_padding, example_pubkey, algorithms=["ES256"]
++        )
+         assert decoded_payload == example_payload
+ 
+     # 'Control' RSA JWT created by another library.
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 3804d8ab72..5a1dac4df6 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -11,6 +11,8 @@ SRC_URI += " \
     file://CVE-2026-48524.patch \
     file://CVE-2026-48525.patch \
     file://CVE-2026-48526.patch \
+    file://CVE-2026-102269_p1.patch \
+    file://CVE-2026-102269_p2.patch \
 "
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
-- 
2.35.6

