Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1307.1793950037989779656
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Wn2khoz/;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12705; q=dns/txt;
  s=iport01; t=1793950038; x=1795159638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jAB92yRzpuxIvULUQvrGgbe2owRQvhM0QV7Dp0y78Ak=;
  b=Wn2khoz/Gf/heUhzNL31mCxGvk21LPlxoHz9QZSB8nt1Za2/kHKdVsNU
   pCsboZjFXnYNWFPwBJcdyzJBaGLC7HEpiLXMqUVB5r91VjfXnwahwcosf
   SN+8J/pirhoW98DSgv3stXIvmANmrXoPv63uF9YLu3riBz11roXWJFaG0
   tAqtTc4UBk8Vs7W2OUdcM0gVCnWe1Sh1npfhuJvmdvmTA9H44JuS2T6zE
   n/Ugwa69QzaXyFNzKc5pj9XqWklyNOhvGXNbpFRS7JP2egUDn1Kd4RvUd
   +iHwTUx9ibPWRR0iPsfCUCdT8yd7zR7ytvYX9BKx03inH+UcZCqNpdeC9
   w==;
X-CSE-ConnectionGUID: ISxbqs2+RWKUsBfH3/sbHw==
X-CSE-MsgGUID: +/EnmFaYTq6oLWiwH87HHg==
X-IPAS-Result: =?us-ascii?q?A0BJAgDmf+1q/43/Ja1aglmCGD91YENJA5ZIA5FMjFWBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYIqWAGCdAMRvBKBe?=
 =?us-ascii?q?TOBAYMpAYFU2zMBCxQBgTiFQIgjXRgBhH0nGxuBcoEVgTuCLoEFgVwCgUiGX?=
 =?us-ascii?q?gSCIoEMgVoBhjwDhVOBBQKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmPhsKLxgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5I9gxIOCEQDBBoGDQEqAQSBAQxGEUQGFjKSZwECkj6hEQoog?=
 =?us-ascii?q?3iMJIcnjhMaM4QElBmSVAuYfY4KlWMCBBgDTYRpgWg8gVlwFYMiCUoZD1iNU?=
 =?us-ascii?q?w4Lg2DMMSYyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:5XXMRKme32uZP292J3u0J0ro5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYCjyGPvqPajPyeNAnOdm08ExQupeBxtYyTFNl+3gzE1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs//b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fawj6uxuGjsNz
 8M7FSsnYDDYwPm84K3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIJoDbG5sFxxfwS
 mTuvCPUBBQ0Pe2j0GSC1k2tmc+fwgPbV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmIHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:rKKf1KOTkd7QscBcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AN4jPR2uiiBQjDxaPu5SSQ9506IsESW3X1WyKYHW?=
 =?us-ascii?q?HKltyYrO1EhiL8oN7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AVcCHdg4TB729J03tx2Wh7f87xowrpImoDW4EoKk?=
 =?us-ascii?q?f5c6gCi1vG2fCrBS4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544966819"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:27:17 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id DB46518000191;
	Fri,  6 Nov 2026 07:27:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3CBCBCBEF8A; Thu,  5 Nov 2026 23:27:16 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 7/7] python3-aiohttp: fix CVE-2026-111064
Date: Thu,  5 Nov 2026 23:27:02 -0800
Message-Id: <20261106072702.502813-8-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106072702.502813-1-dkelaiya@cisco.com>
References: <20261106072702.502813-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 07:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131968
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the initial idle-connection timeout fix [1] to aiohttp
3.13.5, as identified by [2]. Start the keepalive deadline when the
connection is established so peers that send no request or trickle
incomplete headers cannot keep it open indefinitely.

Retain the existing timeout default and the upstream regressions
for idle peers, trickled headers, disabled deadlines, slow handlers
and WebSocket keepalive cleanup.

[1] https://github.com/aio-libs/aiohttp/commit/be846822b4b3a5a54b6163e794b42dc06fba54a3
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-5wr8-gcqf-gqf3

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111064.patch     | 285 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 286 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch
new file mode 100644
index 0000000000..9962a22ecb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch
@@ -0,0 +1,285 @@
+From be846822b4b3a5a54b6163e794b42dc06fba54a3 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Tue, 29 Sep 2026 00:08:22 +0100
+Subject: [PATCH] Close idle connections (#13681) (#13838)
+
+(cherry picked from commit e07684ef9056183bbefba1ae3f717a23f243631e)
+
+CVE: CVE-2026-111064
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/be846822b4b3a5a54b6163e794b42dc06fba54a3]
+
+Backport Changes:
+- Retain aiohttp 3.13.5's documented keepalive_timeout=3630 default
+  instead of changing it to the newer branch's 75-second default.
+- Import Any and AiohttpServer from existing modules for the
+  upstream server and WebSocket regression tests.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13681.bugfix.rst               |   1 +
+ aiohttp/web_protocol.py                |  12 ++-
+ docs/web_reference.rst                 |   9 ++
+ tests/test_web_server.py               | 118 ++++++++++++++++++++++++-
+ tests/test_web_websocket_functional.py |  34 ++++++-
+ 5 files changed, 167 insertions(+), 7 deletions(-)
+ create mode 100644 CHANGES/13681.bugfix.rst
+
+diff --git a/CHANGES/13681.bugfix.rst b/CHANGES/13681.bugfix.rst
+new file mode 100644
+index 0000000..e39b73a
+--- /dev/null
++++ b/CHANGES/13681.bugfix.rst
+@@ -0,0 +1 @@
++Fixed idle connections not being closed if no request was received -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/web_protocol.py b/aiohttp/web_protocol.py
+index d9843f9..c04aa10 100644
+--- a/aiohttp/web_protocol.py
++++ b/aiohttp/web_protocol.py
+@@ -117,8 +117,7 @@ class RequestHandler(BaseProtocol):
+     status line, bad headers or incomplete payload. If any error occurs,
+     connection gets closed.
+ 
+-    keepalive_timeout -- number of seconds before closing
+-                         keep-alive connection
++    keepalive_timeout -- number of seconds before closing an idle connection.
+ 
+     tcp_keepalive -- TCP keep-alive is on, default is on
+ 
+@@ -215,7 +214,7 @@ class RequestHandler(BaseProtocol):
+ 
+         # _request_count is the number of requests processed with the same connection.
+         self._request_count = 0
+-        self._keepalive = False
++        self._keepalive = True
+         self._current_request: Optional[BaseRequest] = None
+         self._manager: Optional[Server] = manager
+         self._request_handler: Optional[_RequestHandler] = manager.request_handler
+@@ -367,6 +366,13 @@ class RequestHandler(BaseProtocol):
+         self._manager.connection_made(self, real_transport)
+ 
+         loop = self._loop
++        # Need to enable keepalive timeout at start of connection, as there's no other
++        # protection against a dead connection that doesn't send a request at all.
++        if self._keepalive_timeout > 0:
++            close_time = loop.time() + self._keepalive_timeout
++            self._next_keepalive_close_time = close_time
++            self._keepalive_handle = loop.call_at(close_time, self._process_keepalive)
++
+         if sys.version_info >= (3, 12):
+             task = asyncio.Task(self.start(), loop=loop, eager_start=True)
+         else:
+diff --git a/docs/web_reference.rst b/docs/web_reference.rst
+index 83a9c7f..ddb43e8 100644
+--- a/docs/web_reference.rst
++++ b/docs/web_reference.rst
+@@ -3135,6 +3135,10 @@ Utilities
+    :param float keepalive_timeout: a delay before a TCP connection is
+                                    closed after a HTTP request. The delay
+                                    allows for reuse of a TCP connection.
++                                   The same delay bounds how long a newly
++                                   accepted connection may take to deliver
++                                   its first complete request; connections
++                                   that stay idle or incomplete are closed.
+ 
+                                    When deployed behind a reverse proxy
+                                    it's important for this value to be
+@@ -3144,6 +3148,11 @@ Utilities
+ 
+       .. versionadded:: 3.8
+ 
++      .. versionchanged:: 3.14.4
++
++         The timeout is now also applied while waiting for the first
++         request, closing connections that never send a complete request.
++
+    :param ssl_context: :class:`ssl.SSLContext` for HTTPS server,
+                        ``None`` for HTTP connection.
+ 
+diff --git a/tests/test_web_server.py b/tests/test_web_server.py
+index 09b7d0b..7595aec 100644
+--- a/tests/test_web_server.py
++++ b/tests/test_web_server.py
+@@ -1,7 +1,7 @@
+ import asyncio
+ import socket
+ from contextlib import suppress
+-from typing import NoReturn
++from typing import Any, NoReturn
+ from unittest import mock
+ 
+ import pytest
+@@ -417,3 +417,119 @@ async def test_no_handler_cancellation(unused_port_socket: socket.socket) -> Non
+         assert done_event.is_set()
+     finally:
+         await asyncio.gather(runner.shutdown(), site.stop())
++
++
++async def test_idle_connection_closed_before_first_request(
++    aiohttp_raw_server: AiohttpRawServer,
++) -> None:
++    """A connection that never sends a request must not be held open forever."""
++
++    async def handler(request: web.BaseRequest) -> web.Response:
++        assert False
++
++    server = await aiohttp_raw_server(handler, keepalive_timeout=0.2)
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        # The server must close the connection once keepalive_timeout
++        # expires without a complete request having arrived.
++        assert await asyncio.wait_for(reader.read(), timeout=5) == b""
++    finally:
++        writer.close()
++        await writer.wait_closed()
++
++
++async def test_trickled_headers_closed_at_first_request_deadline(
++    aiohttp_raw_server: AiohttpRawServer, monkeypatch: pytest.MonkeyPatch
++) -> None:
++    """Partial header bytes must not extend the first-request deadline."""
++
++    async def handler(request: web.BaseRequest) -> web.Response:
++        assert False
++
++    server = await aiohttp_raw_server(handler, keepalive_timeout=0.4)
++    runner = server.runner
++    assert runner is not None
++    server_impl = runner.server
++    assert server_impl is not None
++
++    disconnected = asyncio.Event()
++    original_connection_lost = server_impl.connection_lost
++
++    def connection_lost(protocol: Any, exc: BaseException | None = None) -> None:
++        original_connection_lost(protocol, exc)
++        disconnected.set()
++
++    monkeypatch.setattr(server_impl, "connection_lost", connection_lost)
++
++    _, writer = await asyncio.open_connection(server.host, server.port)
++
++    async def trickle_until_closed() -> None:
++        writer.write(b"GET / HTTP/1.1\r\nHost: example.com\r\nX-Slow: ")
++        # asyncio's drain() raises a ConnectionError once the connection is
++        # lost; uvloop's write() raises RuntimeError on the closed transport.
++        with pytest.raises((ConnectionError, RuntimeError)):
++            while True:
++                await writer.drain()
++                await asyncio.sleep(0.05)
++                writer.write(b"a")
++
++    try:
++        # The deadline must fire despite the steady trickle of bytes.
++        await asyncio.wait_for(trickle_until_closed(), timeout=5)
++        await asyncio.wait_for(disconnected.wait(), timeout=5)
++        assert not server_impl.connections
++        assert server_impl.requests_count == 0
++    finally:
++        writer.close()
++        with suppress(ConnectionError, RuntimeError):
++            await writer.wait_closed()
++
++
++async def test_keepalive_timeout_zero_no_first_request_deadline(
++    aiohttp_raw_server: AiohttpRawServer,
++) -> None:
++    """keepalive_timeout=0 must not impose a deadline on the first request."""
++
++    async def handler(request: web.BaseRequest) -> web.Response:
++        return web.Response(text="ok")
++
++    server = await aiohttp_raw_server(handler, keepalive_timeout=0)
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        # A zero timeout must not arm a deadline that fires at accept time:
++        # the connection has to survive an idle pause and serve the request.
++        await asyncio.sleep(0.1)
++        writer.write(b"GET / HTTP/1.1\r\nHost: example.com\r\n\r\n")
++        await writer.drain()
++        head = await asyncio.wait_for(reader.readuntil(b"\r\n\r\n"), timeout=5)
++        assert head.startswith(b"HTTP/1.1 200 ")
++        # Between requests a zero timeout still closes the idle connection
++        # right after the response, so the body is followed by EOF.
++        assert await asyncio.wait_for(reader.read(), timeout=5) == b"ok"
++    finally:
++        writer.close()
++        await writer.wait_closed()
++
++
++async def test_handler_slower_than_first_request_deadline(
++    aiohttp_raw_server: AiohttpRawServer,
++) -> None:
++    """A parsed request being handled is not subject to the idle deadline."""
++
++    async def handler(request: web.BaseRequest) -> web.Response:
++        await asyncio.sleep(0.4)  # Longer than keepalive_timeout.
++        return web.Response(text="ok")
++
++    server = await aiohttp_raw_server(handler, keepalive_timeout=0.2)
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(b"GET / HTTP/1.1\r\nHost: example.com\r\n\r\n")
++        await writer.drain()
++        head = await asyncio.wait_for(reader.readuntil(b"\r\n\r\n"), timeout=5)
++        assert head.startswith(b"HTTP/1.1 200 ")
++    finally:
++        writer.close()
++        await writer.wait_closed()
+diff --git a/tests/test_web_websocket_functional.py b/tests/test_web_websocket_functional.py
+index f7f5c31..871987e 100644
+--- a/tests/test_web_websocket_functional.py
++++ b/tests/test_web_websocket_functional.py
+@@ -12,7 +12,7 @@ import pytest
+ import aiohttp
+ from aiohttp import web
+ from aiohttp.http import WSCloseCode, WSMsgType
+-from aiohttp.pytest_plugin import AiohttpClient
++from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
+ 
+ 
+ async def test_websocket_can_prepare(loop, aiohttp_client) -> None:
+@@ -953,9 +953,37 @@ async def test_websocket_disable_keepalive(loop, aiohttp_client) -> None:
+     assert data == "OK"
+ 
+ 
+-async def test_receive_str_nonstring(
+-    loop: asyncio.AbstractEventLoop, aiohttp_client: AiohttpClient
++async def test_websocket_disable_keepalive_no_armed_handle(
++    aiohttp_server: AiohttpServer, aiohttp_client: AiohttpClient
+ ) -> None:
++    """keep_alive(False) when no keepalive timer was armed (keepalive_timeout=0)."""
++
++    async def handler(request: web.Request) -> web.StreamResponse:
++        ws = web.WebSocketResponse()
++        assert ws.can_prepare(request)
++        # A zero timeout arms no deadline at connection_made().
++        assert request.protocol._keepalive_handle is None
++        await ws.prepare(request)
++        assert not request.protocol._keepalive
++        assert request.protocol._keepalive_handle is None
++
++        await ws.send_str("OK")
++        await ws.close()
++        return ws
++
++    app = web.Application()
++    app.router.add_route("GET", "/", handler)
++    server = await aiohttp_server(app, keepalive_timeout=0)
++    client = await aiohttp_client(server)  # type: ignore[var-annotated]
++
++    ws = await client.ws_connect("/")
++    data = await ws.receive_str()
++    assert data == "OK"
++
++    await ws.receive()  # Handle close
++
++
++async def test_receive_str_nonstring(aiohttp_client: AiohttpClient) -> None:
+     async def handler(request: web.Request) -> web.WebSocketResponse:
+         ws = web.WebSocketResponse()
+         assert ws.can_prepare(request)
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index c6167ef607..98fd4bdba3 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -31,6 +31,7 @@ SRC_URI += " \
     file://CVE-2026-111748_p2.patch \
     file://CVE-2026-111063_p1.patch \
     file://CVE-2026-111063_p2.patch \
+    file://CVE-2026-111064.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6
