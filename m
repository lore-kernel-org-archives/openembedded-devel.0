Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F0FC5DF8C
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:37 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15142.1787076933147785365
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Azuyfi6k;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8162; q=dns/txt;
  s=iport01; t=1787076933; x=1788286533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VpCWzxAAJhCY7rPV/MKoAmbVsGzpn5sjdKYOE+h9wRU=;
  b=Azuyfi6k1PnDeTXUVFsPYLhwqLw/gUuUs0NDru/S7/g46r75AQkBYoaw
   libkf09ZYd/I8Cl3TdjcFxz9+1mkMTWtAfwU/Nb+Mzz0PFhK9SwOtYaOV
   oIJONUC5pT7PEdyxF1or5OKIb3SNMBMFMWdSvNjEr8RZAZKMNHz+TlfQz
   3ZU/Jzufnon8zIbuLSl/xYJ7D+hgAX8NbnV8K5nExRoFLjyyrTd9jhKQt
   F+YZDUtGfl7W4GwAJsoxKLMXjwM3bPnBIi1ve0xCz0L/ux7uy1x44decD
   LC/qAqK2NEEQPMA1gZJ2/Ws01yPf+ZuySAVM9OVvDhnut5fuYw7ldPqJE
   Q==;
X-CSE-ConnectionGUID: PzqrXjVHSBqZ6TT2bxwoEA==
X-CSE-MsgGUID: lltU+7S2Rm+wmGklnrlH7g==
X-IPAS-Result: =?us-ascii?q?A0BJAgBIoIRq/44QJK1aHgEBCxIMggULghg/dF5DSZZKA?=
 =?us-ascii?q?4ETnQiBfg8BAQEPRA0EAQGEP0YCjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMdCgsBGAEtEBwDAQIvKyMIEAmCKlgBg?=
 =?us-ascii?q?nQDEcRGgXkzgQGDKAGBVNswAQsUAQWBM4U/iCJdGAGEfCcbG4FygRWBO4E4d?=
 =?us-ascii?q?oEFgVwCgTgQhl0EgiKBDIFagS2QKUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDRsGBYEdgSiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJRQ4LG?=
 =?us-ascii?q?A1IESw3FBkEPm4HjjgggkOBDgEqAYE0gRQypSihDwoog3aMIZU6GjOEBIFXk?=
 =?us-ascii?q?kCSUQuYfY4KlT0rGFCEaYFoPIFZcBU7gmcJShkPjioOC4NghWTGVScyAgkyA?=
 =?us-ascii?q?QEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:Md9poaxk4ikpQBi5inl6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVUn
 WJODGrXaKuCNzTxe94iOoSz901T7JTXmoNnTVM/pFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaz1MsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHkkJJco+NhXOktXx
 6IkFGoHfg+EqsvjldpXSsE07igiBMDvOIVavjRryivUSK57B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiaC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+Oi0aIqOJ43XGK25mG6co
 n77vDvCWCsfd8Oa5jmB9GioprDAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBWy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:P5aFX6xgf2TKD8ApxzMvKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:gaetWGG1+us+ZGLzqmJf5lcOKsIbUkb31UWOH3PiA3Z2T5C8HAo=
X-Talos-MUID: 9a23:4rzzKAb7DeERDOBTszvwuXI9D51S5uexDW8OlZMcv+nbOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="810835955"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 04A33180004B9;
	Tue, 18 Aug 2026 18:15:32 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3BF69CD02BF; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 08/10] python3-aiohttp: fix CVE-2026-54278
Date: Tue, 18 Aug 2026 11:15:26 -0700
Message-Id: <20260818181528.3405276-9-dkelaiya@cisco.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129239

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/4f7480e474cccc6a8cc2c92ad3f17a31dedf8232
[2] https://github.com/advisories/GHSA-g3cq-j2xw-wf74

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54278.patch      | 182 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch
new file mode 100644
index 0000000000..13a3cecd21
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch
@@ -0,0 +1,182 @@
+From 0a0f845786316ed4dd9fdd785f5f694dee74bba5 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 7 Jun 2026 00:39:29 -0500
+Subject: [PATCH] [PR #12828/13b635d7 backport][3.14] Bounded unread compressed
+ drain (#12845)
+
+CVE: CVE-2026-54278
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/4f7480e474cccc6a8cc2c92ad3f17a31dedf8232]
+
+(cherry picked from commit 4f7480e474cccc6a8cc2c92ad3f17a31dedf8232)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12828.bugfix.rst     |  1 +
+ aiohttp/streams.py           | 17 +++++++---
+ tests/test_streams.py        | 28 ++++++++++++++++
+ tests/test_web_functional.py | 63 ++++++++++++++++++++++++++++++++++++
+ 4 files changed, 104 insertions(+), 5 deletions(-)
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
+index 921827eb3..b52c20742 100644
+--- a/aiohttp/streams.py
++++ b/aiohttp/streams.py
+@@ -572,14 +572,21 @@ class StreamReader(AsyncStreamReaderMixin):
+         """Read not more than n bytes, or whole buffer if n == -1"""
+         self._timer.assert_timeout()
+ 
+-        chunks = []
++        if n == -1:
++            # Drain only chunks present now; _read_nowait_chunk() can
++            # re-entrantly resume_reading() and refill the buffer.
++            count = len(self._buffer)
++            if count == 1:
++                return self._read_nowait_chunk(-1)
++            return b"".join([self._read_nowait_chunk(-1) for _ in range(count)])
++
++        chunks: list[bytes] = []
+         while self._buffer:
+             chunk = self._read_nowait_chunk(n)
+             chunks.append(chunk)
+-            if n != -1:
+-                n -= len(chunk)
+-                if n == 0:
+-                    break
++            n -= len(chunk)
++            if n == 0:
++                break
+ 
+         return b"".join(chunks) if chunks else b""
+ 
+diff --git a/tests/test_streams.py b/tests/test_streams.py
+index 93686746e..8b4fcf322 100644
+--- a/tests/test_streams.py
++++ b/tests/test_streams.py
+@@ -1723,3 +1723,31 @@ async def test_stream_reader_small_limit_resumes_reading(
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
++    stream.feed_data(b"first")
++
++    # Popping "first" refills "second", but this readany() returns only "first".
++    assert await stream.readany() == b"first"
++    assert await stream.readany() == b"second"
++    assert await stream.readany() == b"third"
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index fe9cce27b..e2fd40432 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -5,6 +5,8 @@ import pathlib
+ import socket
+ import sys
+ from typing import Any, Dict, Generator, NoReturn, Optional, Tuple
++import zlib
++from contextlib import suppress
+ from unittest import mock
+ 
+ import pytest
+@@ -23,7 +25,9 @@ from aiohttp import (
+ )
+ from aiohttp.compression_utils import ZLibBackend, ZLibCompressObjProtocol
+ from aiohttp.hdrs import CONTENT_LENGTH, CONTENT_TYPE, TRANSFER_ENCODING
++from aiohttp.helpers import DEFAULT_CHUNK_SIZE
+ from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
++from aiohttp.streams import StreamReader
+ from aiohttp.typedefs import Handler
+ from aiohttp.web_protocol import RequestHandler
+ 
+@@ -1683,6 +1687,65 @@ async def test_response_prepared_with_clone(aiohttp_client) -> None:
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
++        writer.write(head + body)
++        await writer.drain()
++        status_line = await asyncio.wait_for(reader.readline(), 5)
++        assert status_line.startswith(b"HTTP/1.1 401 ")
++        await asyncio.wait_for(drained.wait(), 5)
++    finally:
++        writer.close()
++        with suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    # Bounded by the buffer, not the decompressed size.
++    assert max(drain_reads) <= 3 * DEFAULT_CHUNK_SIZE
++    assert max(drain_reads) < decompressed_size
++
++
+ async def test_app_max_client_size(aiohttp_client) -> None:
+     async def handler(request):
+         await request.post()
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 1a6baebfe9..9a53c3b518 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -14,6 +14,7 @@ SRC_URI += " \
     file://CVE-2026-54275.patch \
     file://CVE-2026-54276.patch \
     file://CVE-2026-54277.patch \
+    file://CVE-2026-54278.patch \
 "
 
 CVE_PRODUCT = "aiohttp"
-- 
2.35.6


