Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFFBC56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:51:34 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13570.1785995483792386520
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 22:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fJofwtnn;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5899; q=dns/txt;
  s=iport01; t=1785995486; x=1787205086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FIrhhcUH0piBRZyetKQadAfAOXNtVd8koGTcjlOolVk=;
  b=fJofwtnnxoytLHftV6htw5puNa8r/7lZlvWvZ8/Do9QZlmK//cvELFor
   BZvXGE5KZ3/7dZFw8ezwndT2VFLHhbWZntubFo1Tdg2ILUPJOoh5fuPsd
   OBfCL+Q/tvIx+q2L5McVuhlaO1VAWa1zEv1Cim7GhLDUczkseCqYT4Drr
   pyVIcGtpGYiwrMU/+IiQdjjXW/Nzns1K1qdgVP8/8t2xjPHsZqX4gDFXi
   kqs9piDY3P9A85zIHC5W/Rg0HPJ3RUPr6cm+GW4HCfAa6zHVqFWxyJXXq
   bfJbGKSb2cDsD1eFq39Np+4tlDFQKUS0gaPGfsg0spHtZvcCp2U/M3FAL
   w==;
X-CSE-ConnectionGUID: U3UxNaFYRV2zoGduKG0K7g==
X-CSE-MsgGUID: zY8RHkKnRqC0gaTVmTLfGA==
X-IPAS-Result: =?us-ascii?q?A0BIAgC3H3Rq/5IQJK1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDJwsBGAEbEhAcAwECLysjCBmDAgGCdAMRvHGBeTOBAYMoA?=
 =?us-ascii?q?YFU2y4BCxQBBYEzhT+IIV0YAYR8JxsbgXKBFYNpgQWBXAKIJQSCInoSgVqRF?=
 =?us-ascii?q?kiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsHBYEdgSiEaCMZNnqBC?=
 =?us-ascii?q?V6BLSpkARIXgQmCbwKCeoEpCxgNSBEsNxQZBD5uB41/IIJBAXoTASsXaIEGR?=
 =?us-ascii?q?aVYoQ8KKIN1jCGVOhozqmwLmH2OCpYBT4RpgWg8gVlwFYMiCUoZD44qDguDY?=
 =?us-ascii?q?Mw5JzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:JbS/+qnXcIX+vDvABgs+IZbo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbXW/SbP/bYjehfoskaY+yoRwD7Z7Vy9c3TQVoryo3QltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEs//b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbBDx/ZRCE9/z
 8JCOjciYg2gqLqVn73uH4GAhux7RCXqFIobvnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkERUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3Fb4uEI4PQFJ4O9qqej
 nD3r17ZATIcDsW0kTWMzkypusvBsgquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:vYn7J6koa5ynqzA1KDKTLFoKMsPpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:teyZRG5usYGy0RuzJNssyRUpCuYsXEzn8i3CJGC0FEVGEJ7KRgrF
X-Talos-MUID: 9a23:5aW5DgV1+XDKp1jq/C3d1AtCN+Ru2b2FUE8ErasDh+2KGgUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,207,1779148800"; 
   d="scan'208";a="799172933"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Aug 2026 05:51:25 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id C0AF71800021B;
	Thu,  6 Aug 2026 05:51:25 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 6BF7BCC12A6; Wed,  5 Aug 2026 22:51:25 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH 3/5] python3-pyjwt: Fix CVE-2026-48525
Date: Wed,  5 Aug 2026 22:50:59 -0700
Message-Id: <20260806055101.23160-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260806055101.23160-1-hthakar@cisco.com>
References: <20260806055101.23160-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 05:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128834

From: Hetvi Thakar <hthakar@cisco.com>

Reject a non-empty compact payload segment for b64=false tokens before
Base64URL decoding. The segment is unused for detached JWS verification,
so decoding it allowed unauthenticated CPU and memory consumption.

This patch applies the relevant subset of the upstream 2.13.0 fix.
The upstream commit is referenced in [1], and the public advisory is
referenced in [2].

[1] https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81
[2] https://github.com/advisories/GHSA-w7vc-732c-9m39

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-pyjwt/CVE-2026-48525.patch | 115 ++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48525.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48525.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48525.patch
new file mode 100644
index 0000000000..c43e576118
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48525.patch
@@ -0,0 +1,115 @@
+From 91ac94bdc85d24c6d35a5f6cdd58eb8c6c4df0f0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Mon, 3 Aug 2026 03:21:30 -0700
+Subject: [PATCH] api_jws: reject non-empty detached payload segments
+
+For b64=false tokens, reject a non-empty compact payload segment before
+Base64URL decoding. The segment is unused when detached_payload is
+supplied, so decoding attacker-controlled data only consumes CPU and
+memory.
+
+CVE: CVE-2026-48525
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/95791b1759b8aa4f2203575d344d5c78564cdc81]
+
+Backport Changes:
+- Extracted only the CVE-2026-48525 detached-payload segment check and
+  regression test from the bundled upstream 2.13.0 commit. The other
+  requested CVE fixes are carried as separate patches.
+- Adapted the hunk and test locations to PyJWT 2.8.0, used module-level
+  hashlib and hmac imports, and shortened explanatory comments without
+  changing the tested behavior.
+- Excluded the separate RFC 7797 b64/crit hardening bundled upstream.
+- Omitted the 2.13.0 version and changelog updates, CVE-2026-48523 (which
+  does not affect 2.8.0), and unrelated hardening from the bundled commit.
+
+(cherry picked from commit 95791b1759b8aa4f2203575d344d5c78564cdc81)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/api_jws.py        | 17 +++++++++++++----
+ tests/test_api_jws.py | 34 +++++++++++++++++++++++++++++++++-
+ 2 files changed, 46 insertions(+), 5 deletions(-)
+
+diff --git a/jwt/api_jws.py b/jwt/api_jws.py
+index 1750442..0d5ab2b 100644
+--- a/jwt/api_jws.py
++++ b/jwt/api_jws.py
+@@ -274,10 +274,19 @@ class PyJWS:
+         if not isinstance(header, dict):
+             raise DecodeError("Invalid header string: must be a json object")
+ 
+-        try:
+-            payload = base64url_decode(payload_segment)
+-        except (TypeError, binascii.Error) as err:
+-            raise DecodeError("Invalid payload padding") from err
++        if header.get("b64", True) is False:
++            # Detached compact serialization requires an empty payload
++            # segment. Reject it before decoding attacker-controlled data.
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
+index 434874b..29f84a7 100644
+--- a/tests/test_api_jws.py
++++ b/tests/test_api_jws.py
+@@ -1,3 +1,5 @@
++import hashlib
++import hmac
+ import json
+ from decimal import Decimal
+ 
+@@ -11,7 +13,7 @@ from jwt.exceptions import (
+     InvalidSignatureError,
+     InvalidTokenError,
+ )
+-from jwt.utils import base64url_decode
++from jwt.utils import base64url_decode, base64url_encode
+ from jwt.warnings import RemovedInPyjwt3Warning
+ 
+ from .utils import crypto_required, key_path, no_crypto_required
+@@ -766,6 +768,36 @@ class TestJWS:
+         assert "b64" not in msg_header_obj
+         assert msg_payload
+ 
++    def test_decode_b64_false_rejects_non_empty_payload_segment(
++        self, jws: PyJWS, payload: bytes
++    ) -> None:
++        secret = "secret"
++        header = {
++            "typ": "JWT",
++            "alg": "HS256",
++            "b64": False,
++            "crit": ["b64"],
++        }
++        encoded_header = base64url_encode(
++            json.dumps(header, separators=(",", ":")).encode()
++        )
++        attacker_segment = b"A" * 1024
++        signing_input = b".".join([encoded_header, payload])
++        signature = hmac.new(
++            secret.encode(), signing_input, hashlib.sha256
++        ).digest()
++        token = b".".join(
++            [encoded_header, attacker_segment, base64url_encode(signature)]
++        ).decode()
++
++        with pytest.raises(DecodeError, match="Payload segment must be empty"):
++            jws.decode(
++                token,
++                secret,
++                algorithms=["HS256"],
++                detached_payload=payload,
++            )
++
+     def test_decode_detached_content_without_proper_argument(self, jws):
+         example_jws = (
+             "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImI2NCI6ZmFsc2V9"
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 7b72cfb4bd..fc3e0bc31d 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -9,6 +9,7 @@ SRC_URI += " \
     file://CVE-2026-32597.patch \
     file://CVE-2026-48522.patch \
     file://CVE-2026-48524.patch \
+    file://CVE-2026-48525.patch \
 "
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
-- 
2.35.6


