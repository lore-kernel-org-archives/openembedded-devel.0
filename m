Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC34C5DF8D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:37 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15139.1787076932485178118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UVrFqAws;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4460; q=dns/txt;
  s=iport01; t=1787076932; x=1788286532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YNx4hI1zFv0AajteU5N/fu4vAxmlNLMr8VPmu0Hp3ns=;
  b=UVrFqAwsma12zi2IHScThXKnRcYmPvtb4OPnvn2so90Xs/4oHJOAbijx
   rX7CI6VfLkxP6fvUimA9/PJgnSYVYELZMH3wJoVdt1h9aoRcuX+CgnlD6
   pthbnOBbAiYA5uADGPDkMOPV9rlpsUvP4EoC0gvZVm9xogbWpxoBRtzRk
   zjz06d8Ab1UuRBgNc7Cql//l2spcKGo6CJRna8hqmXce/NMsMPkOGOkRO
   JbFkOJizhzX/6sS9XNyRdTu3SfrkOZ7fbnmdVL/oMX9r1W872hirLuwTM
   LziVRzgYZ8N6hzEp6Xr7X8EkO9Q8sGu7ctm9KGondCVurnzQnZS3ZCtKI
   Q==;
X-CSE-ConnectionGUID: Y3F1DKpkRU6Q+V+1Iw39ww==
X-CSE-MsgGUID: QVAwFYoMSxOgkP1PpoPQkg==
X-IPAS-Result: =?us-ascii?q?A0BHAgDJn4Rq/40QJK1aHgEBCxIMggULgld0XkNJlkoDn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGEP0YCjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEcQfg?=
 =?us-ascii?q?XkzgQGDKAGBVNswAQsUAQWBM4U/iCJdGAFEhDgnGxuBcoEVgTuCLoEFgVwCi?=
 =?us-ascii?q?CUEgiKBDIFakVZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBH?=
 =?us-ascii?q?YEohDcjGTZ6gQlegSsqYQESF4EJggoCgnOCBgIBSUUOCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?444IIJDgQ4BKxdogUkCpVihDwoog3aMIZU6GjOFW6URC5h9jgqWUIRpgWg8g?=
 =?us-ascii?q?VlwFYMiCUoZD44qDguDYIVkxlUnMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:KqNvvqK4X5QfckqEFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS3zMPm
 2IYDT+Cb6nZZDDzfN0kO97n/RhTuJLWzYU2Hlcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2crajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1fV29vEa4A+dxKX1gNy
 79BCS9WPw+c0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNXwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQhiOm1b4uFJoXiqcN9p3ixu
 Uz3+EHCEjYVN+TG8SKCykuvibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:cjkYy64fCiGMGdo6+QPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:YLPDGWMn4y5pO+5DaXJJrWI3AsMfTyPkj0mTem6nUjd2V+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AdO4MaA7Mqaj8+yVNq+ng0v+3xoxR3Y2xJnEKtK4?=
 =?us-ascii?q?WnMaHDXVIIzCltTe4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="809079841"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 824E7180004A8;
	Tue, 18 Aug 2026 18:15:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 26753CD02BA; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 03/10] python3-aiohttp: fix CVE-2026-50269
Date: Tue, 18 Aug 2026 11:15:21 -0700
Message-Id: <20260818181528.3405276-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260818181528.3405276-1-dkelaiya@cisco.com>
References: <20260818181528.3405276-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129235

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/bf88077ebb14f4c29924b8e8904cba20c55c28b8
[2] https://github.com/advisories/GHSA-m6qw-4cw2-hm4m

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-50269.patch      | 81 +++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch
new file mode 100644
index 0000000000..1bde87e4e8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch
@@ -0,0 +1,81 @@
+From 7fb9ddce2c1a376ef46f9ec2195e5d75db60c227 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Thu, 28 May 2026 23:57:41 +0100
+Subject: [PATCH] [PR #12719/879d48d1 backport][3.14] Reject invalid bytes in
+ multipart/payload headers (#12720)
+
+**This is a backport of PR #12719 as merged into master
+(879d48d1619b9bc3662037afcb8bfa790a205e9b).**
+
+CVE: CVE-2026-50269
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/bf88077ebb14f4c29924b8e8904cba20c55c28b8]
+
+Co-authored-by: Sam Bull <git@sambull.org>
+(cherry picked from commit bf88077ebb14f4c29924b8e8904cba20c55c28b8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12706.bugfix.rst |  1 +
+ aiohttp/payload.py       |  8 +++++---
+ tests/test_payload.py    | 15 +++++++++++++++
+ 3 files changed, 21 insertions(+), 3 deletions(-)
+ create mode 100644 CHANGES/12706.bugfix.rst
+
+diff --git a/CHANGES/12706.bugfix.rst b/CHANGES/12706.bugfix.rst
+new file mode 100644
+index 000000000..9248585f9
+--- /dev/null
++++ b/CHANGES/12706.bugfix.rst
+@@ -0,0 +1 @@
++Fixed invalid bytes being allowed in multipart/payload headers -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/payload.py b/aiohttp/payload.py
+index 5b88fa094..23d127056 100644
+--- a/aiohttp/payload.py
++++ b/aiohttp/payload.py
+@@ -35,6 +35,7 @@ from .helpers import (
+     parse_mimetype,
+     sentinel,
+ )
++from .http_writer import _safe_header
+ from .streams import StreamReader
+ from .typedefs import JSONEncoder, _CIMultiDict
+ 
+@@ -209,9 +210,10 @@ class Payload(ABC):
+     @property
+     def _binary_headers(self) -> bytes:
+         return (
+-            "".join([k + ": " + v + "\r\n" for k, v in self.headers.items()]).encode(
+-                "utf-8"
+-            )
++            "".join(
++                _safe_header(k) + ": " + _safe_header(v) + "\r\n"
++                for k, v in self.headers.items()
++            ).encode("utf-8")
+             + b"\r\n"
+         )
+ 
+diff --git a/tests/test_payload.py b/tests/test_payload.py
+index 9aa97b20d..b60aa7e7c 100644
+--- a/tests/test_payload.py
++++ b/tests/test_payload.py
+@@ -101,6 +101,21 @@ def test_payload_content_type() -> None:
+     assert p.content_type == "application/json"
+ 
+ 
++@pytest.mark.parametrize("bad_byte", ("\r", "\n", "\x00"))
++def test_binary_headers_reject_injection_in_value(bad_byte: str) -> None:
++    p = Payload("test", headers={"X-Custom": f"value{bad_byte}Injected: bad"})
++    with pytest.raises(ValueError, match="header injection"):
++        p._binary_headers
++
++
++@pytest.mark.parametrize("bad_byte", ("\r", "\n", "\x00"))
++def test_binary_headers_reject_injection_in_name(bad_byte: str) -> None:
++    p = Payload("test")
++    p.headers[f"X-Custom{bad_byte}Injected"] = "value"
++    with pytest.raises(ValueError, match="header injection"):
++        p._binary_headers
++
++
+ def test_bytes_payload_default_content_type() -> None:
+     p = payload.BytesPayload(b"data")
+     assert p.content_type == "application/octet-stream"
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index d17043bc3e..33ef64a59b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "9d98cc980ecc96be6eb4c1994ce35d28d8b1f5e5208a23b421187d1209
 SRC_URI += " \
     file://CVE-2026-34993.patch \
     file://CVE-2026-47265.patch \
+    file://CVE-2026-50269.patch \
 "
 
 CVE_PRODUCT = "aiohttp"
-- 
2.35.6


