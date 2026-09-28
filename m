Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0C5CA5FA6
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:41 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63553.1790617415702148386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YynaORwi;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9263; q=dns/txt;
  s=iport01; t=1790617416; x=1791827016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uUgnKloZRHaW0sdezHaEz0kdJgm43hLNFImJVb3Dg1o=;
  b=YynaORwiybTNVteCNBWwf4Lig7F2lXx5+PYfJ4lXwFH/oJs/Le/YIXR1
   QJRiVBuhmwJO0ZimBaQqMcoTzmVQo+BrmHw+3I+hD230xAFKZGHUodX5N
   JgiqyvnZ/ZRreKlISbEneNUkia+/hZHLNIPlHK3aa39VH20hzWxyWmXEG
   RQV4xgyeePKwntLOuHho5rqK/07IbiPjO7U9mYV4tFCLxGYvKSJwnrAuM
   L09Bo6TPYv0SEG+sNVSTxXgoYIYD4LVMTSU3GPfI0NOM/38UpnyEfV+gq
   UGX2wBSizT3tabzhqY7qZz5q5HdJoQuQ/pCbXTVd4JYHEahui+X1txG7O
   g==;
X-CSE-ConnectionGUID: pwF1Ui+GSYm9GnCMBv+TuA==
X-CSE-MsgGUID: kg3gkfJtSleJMnORHkEBDA==
X-IPAS-Result: =?us-ascii?q?A0BJAgC9prpq/47/Ja1aHgEBCxIMggULghg/dWBDSZZKA?=
 =?us-ascii?q?54agX4PAQEBD0QNBAEBhD9GAo4JAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAx0KCwEYAS0QHAMBAi8rIwgQCYIqWAGCd?=
 =?us-ascii?q?AMRwkWBeTOBAYMpAT8CQ1DbMgELFAGBOIVAiCNdGAGEfCcbG4FyglCBOHaBB?=
 =?us-ascii?q?YFcAQGBOBCGXQSCIoEMgVqBA4c3iwlIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEgghkjGTZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB?=
 =?us-ascii?q?0VTCSVBChJHJiIIEgkBExowC4EhOEEJKBEYDUgRLDcVGQQ+bgeQLh6CZYEOA?=
 =?us-ascii?q?SoBgTQ1Kx4WMqUooQ8KKIN2jCKVOhozhASBV5JAklQLmH2OCpU9KxhQhGmBa?=
 =?us-ascii?q?DyBRwsHcBU7gmcJShkPjisDCwuDYIF/g2XGVScyAgkyAQEHAgcOAwuBaJABg?=
 =?us-ascii?q?X0BAQ?=
IronPort-Data: A9a23:nnwkzKBBIp9S/RVW/3riw5YqxClBgxIJ4kV8jS/XYbTApGxw1zZSx
 zMcWWDTaamIZ2SgLd92PN/lpEIAvZKBx9ViOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYA7/i2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2+pAVXw3fqIjy+MmLmdl0
 NYGawwQR0XW7w626OrTpuhEnM8vKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY1BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FEriOS3aoSOJLRmQ+1WkR2Xp
 Wzk41/9DzM/Mvul6Tmo2F6F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMFBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:iLv/Va2CiIcIUyY6kUBL8gqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: 9a23:795SH2PVZBAOcO5DQDZJrXMVWe8eQ3iM43H7BmWmSlp0YejA
X-Talos-MUID: 9a23:uLEfnwRXvcRytV1ZRXTvi2ptN8lK/5+qBWIol7I8m8qpHwBZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="520422636"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id ED08218000201;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 59423CBEF6C; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 11/13] python3-aiohttp: fix CVE-2026-54278
Date: Mon, 28 Sep 2026 10:43:21 -0700
Message-Id: <20260928174323.1810308-12-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130458

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1]. The
advisory identifying the fix is referenced in [2].

[1] https://github.com/aio-libs/aiohttp/commit/4f7480e474cccc6a8cc2c92ad3f17a31dedf8232
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-54278

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54278.patch      | 209 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 210 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch
new file mode 100644
index 0000000000..f5ab4f775b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch
@@ -0,0 +1,209 @@
+From 804b9d48880222f72b98943a5ecf06d98b1c5074 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 7 Jun 2026 00:39:29 -0500
+Subject: [PATCH] [PR #12828/13b635d7 backport][3.14] Bounded unread compressed
+ drain (#12845)
+
+CVE: CVE-2026-54278
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/4f7480e474cccc6a8cc2c92ad3f17a31dedf8232]
+
+Backport Changes:
+- aiohttp 3.9.5's earlier decompression backport can buffer
+  one decompressed chunk larger than the read buffer.
+  In addition to snapshotting the initial chunk count, cap an
+  unbounded read at StreamReader._high_water so one such
+  chunk cannot be returned as a multi-megabyte bytes object.
+- aiohttp 3.9.5 does not expose DEFAULT_CHUNK_SIZE. Use its equivalent
+  64 KiB read-buffer value directly in the functional test.
+- Import the existing AiohttpClient and AiohttpServer aliases from
+  aiohttp.pytest_plugin because this branch's test module did not
+  already import them.
+- Mark the mock protocol paused in
+  test_readany_does_not_drain_reentrant_refill because aiohttp 3.9.5
+  gates low-water resume_reading() calls on that state.
+- Send the functional test's body after receiving the early 401
+  response so aiohttp 3.9.5 deterministically processes it through
+  lingering cleanup.
+
+(cherry picked from commit 4f7480e474cccc6a8cc2c92ad3f17a31dedf8232)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12828.bugfix.rst     |  1 +
+ aiohttp/streams.py           | 23 ++++++++++---
+ tests/test_streams.py        | 29 ++++++++++++++++
+ tests/test_web_functional.py | 64 ++++++++++++++++++++++++++++++++++++
+ 4 files changed, 112 insertions(+), 5 deletions(-)
+ create mode 100644 CHANGES/12828.bugfix.rst
+
+diff --git a/CHANGES/12828.bugfix.rst b/CHANGES/12828.bugfix.rst
+new file mode 100644
+index 000000000..9893577a5
+--- /dev/null
++++ b/CHANGES/12828.bugfix.rst
+@@ -0,0 +1 @@
++Fixed :meth:`~aiohttp.StreamReader.readany` and :meth:`~aiohttp.StreamReader.read_nowait` joining data fed back into the buffer during the call (when draining below the low water mark resumes reading) into a single unbounded :class:`bytes`; a call now returns only the chunks that were buffered when it started, keeping the drain of an unread auto-decompressed request body bounded by the read buffer -- by :user:`bdraco`.
+diff --git a/aiohttp/streams.py b/aiohttp/streams.py
+index dffaf374b..0d4d633ef 100644
+--- a/aiohttp/streams.py
++++ b/aiohttp/streams.py
+@@ -526,14 +526,27 @@ class StreamReader(AsyncStreamReaderMixin):
+         """Read not more than n bytes, or whole buffer if n == -1"""
+         self._timer.assert_timeout()
+ 
+-        chunks = []
+-        while self._buffer:
+-            chunk = self._read_nowait_chunk(n)
+-            chunks.append(chunk)
+-            if n != -1:
++        if n == -1:
++            # Drain only chunks present now; _read_nowait_chunk() can
++            # re-entrantly resume_reading() and refill the buffer.
++            count = len(self._buffer)
++            n = self._high_water
++            chunks = []
++            for _ in range(count):
++                chunk = self._read_nowait_chunk(n)
++                chunks.append(chunk)
+                 n -= len(chunk)
+                 if n == 0:
+                     break
++            return b"".join(chunks)
++
++        chunks: list[bytes] = []
++        while self._buffer:
++            chunk = self._read_nowait_chunk(n)
++            chunks.append(chunk)
++            n -= len(chunk)
++            if n == 0:
++                break
+ 
+         return b"".join(chunks) if chunks else b""
+ 
+diff --git a/tests/test_streams.py b/tests/test_streams.py
+index 2076bc9ba..e35dc0709 100644
+--- a/tests/test_streams.py
++++ b/tests/test_streams.py
+@@ -1721,3 +1721,32 @@ async def test_stream_reader_small_limit_resumes_reading(
+ 
+     protocol.resume_reading.assert_called()
+     assert protocol._reading_paused is False
++
++
++async def test_readany_does_not_drain_reentrant_refill(
++    protocol: mock.Mock,
++) -> None:
++    """A single readany() must not reassemble data fed re-entrantly.
++
++    Draining below the low water mark resumes reading, which can synchronously
++    refill the buffer (e.g. decompressing another chunk). Joining that refill in
++    one call would reassemble an unbounded body.
++    """
++    loop = asyncio.get_running_loop()
++    stream = streams.StreamReader(protocol, limit=4, loop=loop)
++
++    refills = [b"second", b"third"]
++
++    def resume_reading() -> None:
++        if refills:
++            stream.feed_data(refills.pop(0))
++
++    protocol.resume_reading.side_effect = resume_reading
++
++    protocol._reading_paused = True
++    stream.feed_data(b"first")
++
++    # Popping "first" refills "second", but this readany() returns only "first".
++    assert await stream.readany() == b"first"
++    assert await stream.readany() == b"second"
++    assert await stream.readany() == b"third"
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index 96dcd1c98..e6d01bffd 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -4,6 +4,7 @@ import json
+ import pathlib
+ import socket
+ import zlib
++from contextlib import suppress
+ from typing import Any, Optional
+ from unittest import mock
+ 
+@@ -22,6 +23,8 @@ from aiohttp import (
+     web,
+ )
+ from aiohttp.hdrs import CONTENT_LENGTH, CONTENT_TYPE, TRANSFER_ENCODING
++from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
++from aiohttp.streams import StreamReader
+ from aiohttp.test_utils import make_mocked_coro
+ from aiohttp.typedefs import Handler
+ 
+@@ -1617,6 +1620,67 @@ async def test_response_prepared_with_clone(aiohttp_client) -> None:
+     await resp.release()
+ 
+ 
++@pytest.mark.parametrize("decompressed_size", [4 * 1024 * 1024, 32 * 1024 * 1024])
++async def test_unread_compressed_body_drain_is_bounded(
++    aiohttp_server: AiohttpServer,
++    monkeypatch: pytest.MonkeyPatch,
++    decompressed_size: int,
++) -> None:
++    """Draining an unread compressed body stays bounded by the read buffer.
++
++    A handler that rejects before reading still drains the payload during
++    lingering close; a small compressed body must not force a large transient
++    allocation (a deflate-bomb style DoS).
++    """
++    drain_reads: list[int] = []
++    drained = asyncio.Event()
++    readany = StreamReader.readany
++
++    async def record_readany(self: StreamReader) -> bytes:
++        data = await readany(self)
++        assert data
++        drain_reads.append(len(data))
++        drained.set()
++        return data
++
++    monkeypatch.setattr(StreamReader, "readany", record_readany)
++
++    async def handler(request: web.Request) -> web.Response:
++        return web.Response(status=401)
++
++    app = web.Application(client_max_size=1024)
++    app.router.add_post("/", handler)
++    server = await aiohttp_server(app)
++
++    body = zlib.compress(b"a" * decompressed_size)
++    assert len(body) < decompressed_size
++    head = (
++        b"POST / HTTP/1.1\r\n"
++        b"Host: localhost\r\n"
++        b"Content-Encoding: deflate\r\n"
++        b"Content-Length: %d\r\n"
++        b"Connection: keep-alive\r\n\r\n"
++    ) % len(body)
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(head)
++        await writer.drain()
++        status_line = await asyncio.wait_for(reader.readline(), 5)
++        assert status_line.startswith(b"HTTP/1.1 401 ")
++        writer.write(body)
++        await writer.drain()
++        await asyncio.wait_for(drained.wait(), 5)
++    finally:
++        writer.close()
++        with suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    # Bounded by the buffer, not the decompressed size.
++    assert max(drain_reads) <= 3 * 2**16
++    assert max(drain_reads) < decompressed_size
++
++
+ async def test_app_max_client_size(aiohttp_client) -> None:
+     async def handler(request):
+         await request.post()
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 98dd5363db..f91c9cb181 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-54274.patch \
            file://CVE-2026-54275.patch \
            file://CVE-2026-54277.patch \
+           file://CVE-2026-54278.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


