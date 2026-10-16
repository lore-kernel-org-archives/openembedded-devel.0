Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E711CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:33:31 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13365.1792118004177269008
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jW+vt7N9;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6266; q=dns/txt;
  s=iport01; t=1792118004; x=1793327604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=49w3mBKgraj6SNqABf4/6IlI0lPk/yPM3oZWboItfPo=;
  b=jW+vt7N93fCQCW4vpf9iriGYAF9jRgTKaXzN+gLsv+PyS0svxYVycFv5
   MFtFWa6+4euJFSOWN7LVvBvlx71bm6Ys8KtFDZP43oL8vZ7FGkT6WQ3Gs
   OirVN8JHalI8KvbF3ngnJmO1DlvsdwZrUMOLROn5s0rCvmB3cpv/T0NQZ
   KALesw/uDTxvWhWNU2BygJnanDWA1H3ri52fTH0W535xQYOhyVM0lZieh
   WYKg26PBO/fUOeFQ4eRj1wQzIYkJEQG2l4H2HP1ToOa1ILBNCYFA8jfZV
   Ocrg3GIZFMyVf/O/b7kwvWtfgMtO7NAm0CZnQAnzT9Zty+aByV5Pdd5kY
   Q==;
X-CSE-ConnectionGUID: KZrsxZLTR7GKdYUD483KeQ==
X-CSE-MsgGUID: Tz8tIqbsSN2IHwjKT7fq5g==
X-IPAS-Result: =?us-ascii?q?A0CYAwBdi9Fq/5D/Ja1aHgEBCxIMhGd1YENJA5ZHA6AaD?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4VAiY4EwECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxG8YoF5M4EBg?=
 =?us-ascii?q?ykBgVTbMgELFAEFgTOFQIgjXRgBRIMZgR8nGxuBcoEVg2mBBYFcAoglBIIig?=
 =?us-ascii?q?QyBWh6VKUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCF?=
 =?us-ascii?q?iMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5ITHoI4LXsTASsXa?=
 =?us-ascii?q?IEtHpMhkBWCIaEPCiiDdowilToaM6pvC5h9jgqVX3CEaYF/JYFZcBWDIglKG?=
 =?us-ascii?q?Q+OKw4Lg2DOWicyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:D8IXCK2lzbiRLFJTwvbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2QAm
 mAfDzyDa/aJNjHxeotxbYi19hsB6pbSx9IwTwU+3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGL3MsJp0q3tpNXk5t+
 c0lBGxdNTOOvrfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjeOwbYeMIozWLSlTtnqK9
 n7n5m7iOTdAFfyAyxm5rXy12+CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:i5smT6gd9nb+2NAoezLVHk8umHBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: 9a23:ZOPUq21d7ic65b8C42rXZ7xfOfI/aW3v6EvqfGCbBVdUZOHFEnydwfYx
X-Talos-MUID: 9a23:yIvY3wnNXmd+Krb0XU36dnpeJpd0wr2kE3sry7QmpMunCXN+ImqS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535551084"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:33:23 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 22A1218000206;
	Fri, 16 Oct 2026 02:33:23 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id C0E44CBF203; Thu, 15 Oct 2026 19:33:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 3/9] python3-pyjwt: fix CVE-2026-102269
Date: Thu, 15 Oct 2026 19:33:16 -0700
Message-Id: <20261016023322.344365-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016023322.344365-1-hthakar@cisco.com>
References: <20261016023322.344365-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131012

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/jpadilla/pyjwt/commit/e6f48401001609a8f99e71fcaf355fb895d508a8
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-hxm8-2xgr-2p9m

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-102269.patch        | 133 ++++++++++++++++++
 .../python/python3-pyjwt_2.12.1.bb            |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102269.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-102269.patch b/meta-python/recipes-devtools/python/files/CVE-2026-102269.patch
new file mode 100644
index 0000000000..ebf2d280cf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-102269.patch
@@ -0,0 +1,133 @@
+From e6f48401001609a8f99e71fcaf355fb895d508a8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Wed, 9 Sep 2026 09:46:01 -0400
+Subject: [PATCH] Reject non-canonical compact JWS segments
+
+CVE: CVE-2026-102269
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/e6f48401001609a8f99e71fcaf355fb895d508a8]
+
+(cherry picked from commit e6f48401001609a8f99e71fcaf355fb895d508a8)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/api_jws.py               | 35 +++++++++++++++++++++++------------
+ tests/test_api_jws.py        | 11 +++++++++++
+ tests/test_compressed_jwt.py |  8 ++++----
+ 3 files changed, 38 insertions(+), 16 deletions(-)
+
+diff --git a/jwt/api_jws.py b/jwt/api_jws.py
+index 5a91bce..2ee2f22 100644
+--- a/jwt/api_jws.py
++++ b/jwt/api_jws.py
+@@ -28,6 +28,9 @@ if TYPE_CHECKING:
+     from .types import SigOptions
+ 
+ _ALGORITHM_UNSET = object()
++_BASE64URL_ALPHABET = (
++    b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
++)
+ 
+ 
+ class PyJWS:
+@@ -291,6 +294,23 @@ class PyJWS:
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
+@@ -304,10 +324,7 @@ class PyJWS:
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
+             header: dict[str, Any] = json.loads(header_data)
+@@ -331,15 +348,9 @@ class PyJWS:
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
+index 01de813..7e0a97b 100644
+--- a/tests/test_api_jws.py
++++ b/tests/test_api_jws.py
+@@ -658,6 +658,17 @@ class TestJWS:
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
+     def test_decode_with_algo_none_should_fail(
+         self, jws: PyJWS, payload: bytes
+     ) -> None:
+diff --git a/tests/test_compressed_jwt.py b/tests/test_compressed_jwt.py
+index 1968cb4..51c61a8 100644
+--- a/tests/test_compressed_jwt.py
++++ b/tests/test_compressed_jwt.py
+@@ -22,8 +22,8 @@ def test_decodes_complete_valid_jwt_with_compressed_payload() -> None:
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
+@@ -33,7 +33,7 @@ def test_decodes_complete_valid_jwt_with_compressed_payload() -> None:
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
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index f7542cab2e..a159f2fbbb 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://CVE-2026-48522.patch \
            file://CVE-2026-48526.patch \
            file://CVE-2026-103001.patch \
            file://CVE-2026-102274.patch \
+           file://CVE-2026-102269.patch \
            "
 
 SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
-- 
2.35.6


