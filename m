Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA227C5DF8A
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:36 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15141.1787076933083490512
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MaTFXPFi;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6561; q=dns/txt;
  s=iport01; t=1787076933; x=1788286533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kdZu2S2Q5gHx05tTUWlI3x4rHUC0tEEZThxlELtBwME=;
  b=MaTFXPFiuNTaS2fEIBeqrBMRwgObegpuaRa+sHEWmNYKyUjusyzjAn1a
   DPHDliTzIHgJnD474MMNYd0JYIq0TKwUiJ/8zSkiTRYQzSF9NqPIxrHLb
   ARYUiPqxtjjt55bP9XzYG+4O633UOgMe0eWEhI5nA410dJ8MxI9tl4t0X
   dNG5bMZ/bNEWlEcbuIyafIBuTpLUDM3CzWgAJ62ot+dE2Qx7e5GggoXjv
   y97t5oFZf9g79y+5UgZ+XXgIunDhPIft8OnEzZ7obR6wI0HPsUDoCwcqw
   6IhJ3JLFa69bCBUyzzLaP7ZD2S7mLq9vvCLNeiNozbN0vj3ZGnmyxxkgL
   A==;
X-CSE-ConnectionGUID: JvT483qPQKWIq+Jam2Lr3Q==
X-CSE-MsgGUID: cXqx+fpTTZ6vJ8yH5nq+bA==
X-IPAS-Result: =?us-ascii?q?A0AnAADJn4Rq/44QJK1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?hc/dF5DSYxyiVgDnhuBfg8BAQEPRA0EAQGEP0YCjWsCJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rI?=
 =?us-ascii?q?wgZgipYAYJ0AxHEH4F5M4EBgygBgVTbMAELFAEFgTMBhT6IIl0YAYR8Jxsbg?=
 =?us-ascii?q?XKBFYE7gi6BBYFcAoglBIIigQyBWol3A4dcSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2eoEJXoErKmEBEheBCYIKAoJzggYCA?=
 =?us-ascii?q?UlFDgsYDUgRLDcUGQQ+bgeOOCCCMxB7EwEpAhVqblsCMKUon1GBPgoog3aMI?=
 =?us-ascii?q?ZU6GjOFW6URC5h9jgqWUIRpgWg8gVlwFYMiCUoZD44qAwsLg2CBDMstJzICC?=
 =?us-ascii?q?TIBAQcCBw4DC4FokAAEgXoBAQ?=
IronPort-Data: A9a23:S4/gLa3vOxbrZCMrOPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzcFm
 DNJDTjQPayPY2L9Lox1bovl8xxQvpCBmoVrTApk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tbTpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLl8KYd1D495OIl5v7
 L86ITVXSgrYvrfjqF67YrEEasULJc3vOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME6ojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZgOG3YIaJIY3bLSlTtk2ov
 3KF8XzFPiNEKv7P2BrY9GvvjMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:+q0Dka4vFXxEbg7y6APXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:kGDVLm3Q/ySg671sv7PcAbxfON4ZLi2G1U/pAHCZECVLQbjPbUXLwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3ABYrBwg1gY1dMT/n/C+v8D2fR2jUj6JS3GAMDiak?=
 =?us-ascii?q?6iZeaF3xhG2qblXe9a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="812844399"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id F33D41800017F;
	Tue, 18 Aug 2026 18:15:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 47056CD03C5; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 10/10] python3-aiohttp: fix CVE-2026-54280
Date: Tue, 18 Aug 2026 11:15:28 -0700
Message-Id: <20260818181528.3405276-11-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260818181528.3405276-1-dkelaiya@cisco.com>
References: <20260818181528.3405276-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129238

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/a762eda5242f6490d6ba667533193f8b473ad587
[2] https://github.com/advisories/GHSA-9x8q-7h8h-wcw9

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54280.patch      | 138 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54280.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54280.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54280.patch
new file mode 100644
index 0000000000..c598a5194c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54280.patch
@@ -0,0 +1,138 @@
+From 724ae4d652417c4490a71ea0b16b8804dad3004f Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sun, 7 Jun 2026 05:47:16 +0000
+Subject: [PATCH] [PR #12831/1ac92dae backport][3.14] Payload close on
+ disconnect (#12843)
+
+CVE: CVE-2026-54280
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/a762eda5242f6490d6ba667533193f8b473ad587]
+
+Co-authored-by: J. Nick Koston <nick@koston.org>
+(cherry picked from commit a762eda5242f6490d6ba667533193f8b473ad587)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12831.bugfix.rst   |  1 +
+ aiohttp/web_response.py    |  6 ++--
+ tests/test_web_response.py | 73 +++++++++++++++++++++++++++++++++++++-
+ 3 files changed, 77 insertions(+), 3 deletions(-)
+ create mode 100644 CHANGES/12831.bugfix.rst
+
+diff --git a/CHANGES/12831.bugfix.rst b/CHANGES/12831.bugfix.rst
+new file mode 100644
+index 000000000..bf460ffcc
+--- /dev/null
++++ b/CHANGES/12831.bugfix.rst
+@@ -0,0 +1 @@
++Fixed :meth:`aiohttp.web.Response.write_eof` skipping ``Payload.close()`` when the body write was interrupted by an error or cancellation, for example when a client disconnects mid-response; the payload close hook now runs in a ``finally`` so a :class:`~aiohttp.payload.Payload` body always releases its resources -- by :user:`bdraco`.
+diff --git a/aiohttp/web_response.py b/aiohttp/web_response.py
+index 364270e4d..cea5d4b45 100644
+--- a/aiohttp/web_response.py
++++ b/aiohttp/web_response.py
+@@ -779,8 +779,10 @@ class Response(StreamResponse):
+         if body is None or self._must_be_empty_body:
+             await super().write_eof()
+         elif isinstance(self._body, Payload):
+-            await self._body.write(self._payload_writer)
+-            await self._body.close()
++            try:
++                await self._body.write(self._payload_writer)
++            finally:
++                await self._body.close()
+             await super().write_eof()
+         else:
+             await super().write_eof(cast(bytes, body))
+diff --git a/tests/test_web_response.py b/tests/test_web_response.py
+index 5a4fb7e66..f094cd3d2 100644
+--- a/tests/test_web_response.py
++++ b/tests/test_web_response.py
+@@ -1,3 +1,4 @@
++import asyncio
+ import collections.abc
+ import datetime
+ import gzip
+@@ -18,7 +19,7 @@ from aiohttp.abc import AbstractStreamWriter
+ from aiohttp.helpers import ETag
+ from aiohttp.http_writer import StreamWriter, _serialize_headers
+ from aiohttp.multipart import BodyPartReader, MultipartWriter
+-from aiohttp.payload import BytesPayload, StringPayload
++from aiohttp.payload import BytesPayload, Payload, StringPayload
+ from aiohttp.test_utils import make_mocked_request
+ from aiohttp.web import ContentCoding, Response, StreamResponse, json_response
+ 
+@@ -1370,6 +1371,76 @@ async def test_consecutive_write_eof() -> None:
+     writer.write_eof.assert_called_once_with(data)
+ 
+ 
++class _ClosingPayload(Payload):
++    """Payload test double that records whether close() ran."""
++
++    def __init__(self) -> None:
++        super().__init__(None)
++        self.close_called = False
++        self.started = asyncio.Event()
++        self.release = asyncio.Event()
++        self.fail = False
++
++    async def write(self, writer: AbstractStreamWriter) -> None:
++        self.started.set()
++        if self.fail:
++            raise ConnectionResetError("client gone")
++        await self.release.wait()
++
++    async def close(self) -> None:
++        self.close_called = True
++        await super().close()
++
++    def decode(self, encoding: str = "utf-8", errors: str = "strict") -> str:
++        assert False
++
++
++async def test_write_eof_closes_payload_on_success() -> None:
++    writer = mock.create_autospec(AbstractStreamWriter, spec_set=True, instance=True)
++    req = make_request("GET", "/", writer=writer)
++    payload = _ClosingPayload()
++    payload.release.set()
++    resp = web.Response(body=payload)
++
++    await resp.prepare(req)
++    await resp.write_eof()
++
++    assert payload.close_called
++    assert writer.write_eof.called
++
++
++async def test_write_eof_closes_payload_on_write_error() -> None:
++    writer = mock.create_autospec(AbstractStreamWriter, spec_set=True, instance=True)
++    req = make_request("GET", "/", writer=writer)
++    payload = _ClosingPayload()
++    payload.fail = True
++    resp = web.Response(body=payload)
++
++    await resp.prepare(req)
++    with pytest.raises(ConnectionResetError):
++        await resp.write_eof()
++
++    assert payload.close_called
++    assert not writer.write_eof.called
++
++
++async def test_write_eof_closes_payload_on_cancel() -> None:
++    writer = mock.create_autospec(AbstractStreamWriter, spec_set=True, instance=True)
++    req = make_request("GET", "/", writer=writer)
++    payload = _ClosingPayload()
++    resp = web.Response(body=payload)
++
++    await resp.prepare(req)
++    task = asyncio.ensure_future(resp.write_eof())
++    await payload.started.wait()
++    task.cancel()
++    with pytest.raises(asyncio.CancelledError):
++        await task
++
++    assert payload.close_called
++    assert not writer.write_eof.called
++
++
+ def test_set_text_with_content_type() -> None:
+     resp = Response()
+     resp.content_type = "text/html"
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 9102175f24..b9d08ac97b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
     file://CVE-2026-54277.patch \
     file://CVE-2026-54278.patch \
     file://CVE-2026-54279.patch \
+    file://CVE-2026-54280.patch \
 "
 
 CVE_PRODUCT = "aiohttp"
-- 
2.35.6


