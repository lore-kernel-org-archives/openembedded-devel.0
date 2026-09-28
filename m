Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F607CA5FAB
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:42 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63551.1790617414307827365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=I0VuPDsO;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7683; q=dns/txt;
  s=iport01; t=1790617414; x=1791827014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v1HxL/5LW2klpu6yeaobplMzJZ7cE3mo4UNUbDY2hjw=;
  b=I0VuPDsODrNz5G3errX8Buwq/8NkgA+L0/3EZx1q01kXMk2/eYfXL+4H
   sX9nxnOXWHe5Xk7S0WrjHnX1N36Ifgn8rOEN1g0N6aN/KcDs5kMWhjKRa
   FWbCLGo/ivY7Wyo398rZxjte3mcYRjHEkj/1LnoIuSuhmq9+OQT+YlhbR
   NpDjH4tEe5dQzJC26KZgL5jdMsKcdfSVFBA0fl36T1dqRu33h4idaSr0a
   /LeJmWG/xdbP8CQiXriZQTropDk1thpBYemHPao9HK/QABe9h6hDa9tRv
   eg29yB3Ov9FGH6qTyHHL1zwsBvO6ZA6T3wqoMIZDePsn1KfZmGHVkQ1Oi
   Q==;
X-CSE-ConnectionGUID: xQDm9izVQ1qx0PCUVjnxyw==
X-CSE-MsgGUID: L75ESegWRt+l4D9MNYTkPw==
X-IPAS-Result: =?us-ascii?q?A0BIAgC9prpq/4r/Ja1aHgEBCxIMggULgld1YENJlkoDn?=
 =?us-ascii?q?hqBfg8BAQEPRA0EAQGEP0YCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEbEhAcAwECLysjCBmDAgGCdAMRw?=
 =?us-ascii?q?kWBeTOBAYMpAT8CQ1DbMgELFAGBOIVAiCNdGAFEggWCMycbG4FyglCCLoEFg?=
 =?us-ascii?q?VwBAQKIIwSCIoEMgVqTQ0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgSCCGSMZNnqBCV6BKylgARAXgQeCBwKCVIIBAgFJQw4HRVMJJUEKE?=
 =?us-ascii?q?kcmIggSCQETGjALgSE4QQkoERgNSBEsNxUZBD5uB5AuHoJlUzsBKgEXaIEFA?=
 =?us-ascii?q?Q80AqVYoQ8KKIN2jCKVOhozhVulFAuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD?=
 =?us-ascii?q?44rDguDYIF/gxRRxlUnMgIJMgEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:6DGOHalBpJxRSDe582kKD2bo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXD3UOPbca2X1fNwlb4608xsG6J/cnN9jSgVkqyw3H1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDpFsfLb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZ0h1uMmAHNwz
 KUBOGg1RS29heSm0a3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaj/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIIIPbH54MxR7wS
 mTu2zukLyoXO+Ol1XmBrl79o8n+oSDDR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:A/vDuKja8Bpm+JEJVvnqtUBArHBQXvgji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:MrqKTmP+Si6w4u5DSBBL8R8VCP4cK2TNlE/7HnG6D3Z4V+jA
X-Talos-MUID: 9a23:QJtH4QooG/gsc14sL8cezxU9aepT7quRMlxOlckq6uyiBBBzAyjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="527923130"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id E748C180001E2;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 43B0DCBEF98; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 07/13] python3-aiohttp: fix CVE-2026-50269
Date: Mon, 28 Sep 2026 10:43:17 -0700
Message-Id: <20260928174323.1810308-8-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130455

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1].
For aiohttp 3.9.5, it also backports the required header
validation from prerequisite commit [2]. The advisory
identifying the fix is referenced in [3].

[1] https://github.com/aio-libs/aiohttp/commit/bf88077ebb14f4c29924b8e8904cba20c55c28b8
[2] https://github.com/aio-libs/aiohttp/commit/1e3ecd48ec423c1fcc729c98adff31172faae1ef
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-50269

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-50269.patch      | 166 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch
new file mode 100644
index 0000000000..e931822a27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch
@@ -0,0 +1,166 @@
+From a8ea4a13b9691357fdc7796506b0c85566ed1985 Mon Sep 17 00:00:00 2001
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
+Backport Changes:
+- Backported the pure-Python http_writer._safe_header()
+  control-character validation from prerequisite commit
+  1e3ecd48ec423c1fcc729c98adff31172faae1ef because aiohttp
+  3.9.5 rejects only CR/LF and the upstream CVE regression test
+  also requires NUL rejection.
+- Adapted the prerequisite regression coverage to test _safe_header()
+  directly using the aiohttp 3.9.5 test layout. Omitted its C
+  serializer, threat-model, changelog, and broader serializer-test
+  changes because Payload._binary_headers invokes the pure-Python
+  helper directly.
+
+Co-authored-by: Sam Bull <git@sambull.org>
+(cherry picked from commit 1e3ecd48ec423c1fcc729c98adff31172faae1ef)
+(cherry picked from commit bf88077ebb14f4c29924b8e8904cba20c55c28b8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12706.bugfix.rst  |  1 +
+ aiohttp/http_writer.py    | 10 ++++++++--
+ aiohttp/payload.py        |  8 +++++---
+ tests/test_http_writer.py | 19 +++++++++++++++++++
+ tests/test_payload.py     | 15 +++++++++++++++
+ 5 files changed, 48 insertions(+), 5 deletions(-)
+ create mode 100644 CHANGES/12706.bugfix.rst
+
+diff --git a/CHANGES/12706.bugfix.rst b/CHANGES/12706.bugfix.rst
+new file mode 100644
+index 000000000..9248585f9
+--- /dev/null
++++ b/CHANGES/12706.bugfix.rst
+@@ -0,0 +1 @@
++Fixed invalid bytes being allowed in multipart/payload headers -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/http_writer.py b/aiohttp/http_writer.py
+index 37cdc06e6..9573768f6 100644
+--- a/aiohttp/http_writer.py
++++ b/aiohttp/http_writer.py
+@@ -1,6 +1,7 @@
+ """Http related parsers and protocol."""
+ 
+ import asyncio
++import re
+ import zlib
+ from typing import Any, Awaitable, Callable, NamedTuple, Optional, Union  # noqa
+ 
+@@ -171,10 +172,15 @@ class StreamWriter(AbstractStreamWriter):
+             await self._protocol._drain_helper()
+ 
+ 
++# https://www.rfc-editor.org/info/rfc9110/#section-5.5-5
++# https://www.rfc-editor.org/info/rfc9112/#section-4-3
++_FORBIDDEN_HEADER_CHARS_RE = re.compile(r"[\x00-\x08\x0a-\x1f\x7f]")
++
++
+ def _safe_header(string: str) -> str:
+-    if "\r" in string or "\n" in string:
++    if _FORBIDDEN_HEADER_CHARS_RE.search(string) is not None:
+         raise ValueError(
+-            "Newline or carriage return detected in headers. "
++            "Forbidden control character detected in headers. "
+             "Potential header injection attack."
+         )
+     return string
+diff --git a/aiohttp/payload.py b/aiohttp/payload.py
+index 6593b05c6..77caf520c 100644
+--- a/aiohttp/payload.py
++++ b/aiohttp/payload.py
+@@ -33,6 +33,7 @@ from .helpers import (
+     parse_mimetype,
+     sentinel,
+ )
++from .http_writer import _safe_header
+ from .streams import StreamReader
+ from .typedefs import JSONEncoder, _CIMultiDict
+ 
+@@ -180,9 +181,10 @@ class Payload(ABC):
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
+diff --git a/tests/test_http_writer.py b/tests/test_http_writer.py
+index 5649f32f7..62d112cad 100644
+--- a/tests/test_http_writer.py
++++ b/tests/test_http_writer.py
+@@ -6,6 +6,7 @@ import pytest
+ from multidict import CIMultiDict
+ 
+ from aiohttp import http
++from aiohttp.http_writer import _safe_header
+ from aiohttp.test_utils import make_mocked_coro
+ 
+ 
+@@ -264,6 +265,24 @@ async def test_drain_no_transport(protocol, transport, loop) -> None:
+     assert not protocol._drain_helper.called
+ 
+ 
++@pytest.mark.parametrize(
++    "char",
++    [chr(c) for c in (*range(0x00, 0x09), *range(0x0A, 0x20), 0x7F)],
++)
++def test_safe_header_rejects_forbidden_control_chars(char: str) -> None:
++    with pytest.raises(
++        ValueError,
++        match="Forbidden control character detected in headers",
++    ):
++        _safe_header(f"value{char}")
++
++
++def test_safe_header_allows_htab() -> None:
++    value = "text/plain\tcharset=utf-8"
++
++    assert _safe_header(value) == value
++
++
+ async def test_write_headers_prevents_injection(protocol, transport, loop) -> None:
+     msg = http.StreamWriter(protocol, loop)
+     status_line = "HTTP/1.1 200 OK"
+diff --git a/tests/test_payload.py b/tests/test_payload.py
+index c8681cb5e..52ace65fd 100644
+--- a/tests/test_payload.py
++++ b/tests/test_payload.py
+@@ -54,6 +54,21 @@ def test_payload_content_type() -> None:
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
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index afb8cbff7d..58ae583423 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-34525_p1.patch \
            file://CVE-2026-34525_p2.patch \
            file://CVE-2026-47265.patch \
+           file://CVE-2026-50269.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


