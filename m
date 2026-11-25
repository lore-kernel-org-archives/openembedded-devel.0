Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36150.1795584016827035741
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QSVE1+14;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=26571; q=dns/txt;
  s=iport01; t=1795584017; x=1796793617;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=8tdrVAwA3X49bFWKriRb22nqa3GbOmxKh2TPBbHtKDs=;
  b=QSVE1+14Vuf35+kXE1eTxdGvR3heQbUat7z1sfQqrBd88n/xIOLHTv1z
   DBc3TvRmCEH7tOrLWFKhGtt0O0gYR2hJkgWZOLpTbEw2cHd3R3qJNfXvt
   dUlTlhE6UXaBm4sNS+qc6HtVwfZBXZMPuph30BH8wRI0jsfzf5dM2FC88
   XDWteNTSAgEiJ4O7+sPmCZPZLBXg11EJ9xWDDS0oOy7+5Zx+Wg8EIR6L7
   LCk+0hoy8WNIBFn4fU7GRW8qngrtgGwlN/mjOyM34H9AD1AWEufKpzz/F
   oluINuudmp8g9EKCPmnkqfCJcPcn8F30uTO3crHzQ0g9UceC4t7i4WFwH
   Q==;
X-CSE-ConnectionGUID: /4dzo9deT82PNsghdHJsAA==
X-CSE-MsgGUID: bf1peMZLTD27gN545cfNDw==
X-IPAS-Result: =?us-ascii?q?A0BLAgAsbAZr/8xK/pBaglmCGD91YUJJA5QngiEDkVCMW?=
 =?us-ascii?q?YF+DwEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMaDQsBGAE9HAMBAi8rIwgQCYIqWAGCdAIBE?=
 =?us-ascii?q?boEgXkzgQGDKQGBVNszAQsUAYE4gg2DNYglXRgBhH4nGxuBcoEVg2qBBYFcA?=
 =?us-ascii?q?oE4EAmGVQSCIoEMgVSBAowRAoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXUCglGCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbCoEMJ?=
 =?us-ascii?q?x0eGQ4CKQYWIQs0GA1IESw3FRkEPm4HlBODCwkHPT4GDQEFAhQKBQGBIE0XK?=
 =?us-ascii?q?BY4kmcBFTCPWIIioREKKIN5jCSVOhozhASUGpJUC5h9glmLMZVjBhgDTYRqg?=
 =?us-ascii?q?Wg8gVlwFTuCZwlKGQ+OKwMLC4NgzlsjNQIJAy8BAQcCBw4DC4FokAABAQIkg?=
 =?us-ascii?q?VYBAQ?=
IronPort-Data: A9a23:edVe4a4+CPuzEOmUmSSDRQxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mUcXGHUPPzeYGX8fNAlbN7lpEMFu5+DxtBgSAdv+CE2Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOsPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eetEU6OEmDWxyp
 aYgDisCbhyjpfmf6efuIgVsrpxLwMjDNY4F/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0En1lQ/UPrSmM+hnWH2aThRsnqepLE85C7YywkZPL3FboKOJIDTGJ49ckCwr
 Gyf52ncMDUmGIbAxhzYri+niMnjgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:dpMixquV8yckZDLxWH7LTrM17skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AskZ7V2jUYzlDobgkXZ114l1x8jJuNSHR3nCBL0K?=
 =?us-ascii?q?EWTxRbqaaSVOw2rhNup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AEEsOxAwQ63OkrFPrY1y4wOq0UQ2aqK6gUVgAtKc?=
 =?us-ascii?q?ih+XeaiNWZmvAhzqRbpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60364153"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:20:12 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 4AB3B1800022F
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:20:12 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 82A13CBF22F; Tue, 24 Nov 2026 21:20:09 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 07/10] python3-aiohttp: fix CVE-2026-128129
Date: Tue, 24 Nov 2026 21:20:03 -0800
Message-Id: <20261125052006.3116497-8-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125052006.3116497-1-asparmar@cisco.com>
References: <20261125052006.3116497-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132982
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upgrade-tail flow control fix for CVE-2026-128129
from the upstream stable branch [1].

Pause reads while upgraded request data fills the bounded tail and
resume safely when an upgrade is accepted or declined.

The embedded backport notes describe the required prerequisite or
follow-up changes and the adaptations to the current APIs.

[1] https://github.com/aio-libs/aiohttp/commit/3d850ee9b92573c7e913821cbcb96005beb3f4df
[2] https://github.com/aio-libs/aiohttp/commit/716c83d2b697e56fd74f95a1aa3a451fd2fb02e8
[3] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-pw86-h8fm-j323

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python3-aiohttp/CVE-2026-128129.patch     | 677 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 678 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128129.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128129.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128129.patch
new file mode 100644
index 0000000000..70235cda0e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128129.patch
@@ -0,0 +1,677 @@
+From 4a4fb46343ee9407de28754700a5620aa1cdc1d2 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 22 Aug 2026 15:03:24 +0100
+Subject: [PATCH] Fix limit on message tail (#13501) (#13511)
+
+(cherry picked from commit c207cadb257e0959b192ffca0548eca8c71eb96a)
+
+CVE: CVE-2026-128129
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/3d850ee9b92573c7e913821cbcb96005beb3f4df]
+
+Backport Changes:
+- Retain the current _request_parser and _upgrade attribute names.
+- Fold the declined-upgrade replay guard and regression tests from
+  716c83d2b697e56fd74f95a1aa3a451fd2fb02e8. Without its guard the
+  pipelined WebSocket handshake test times out after ordinary queued
+  responses consume the buffered frame data as HTTP.
+- Retain the upstream dummy_reader fixture and WebSocketReader import
+  required by the added parser-handoff regression test.
+- Keep the socket-read bound local to the regression tests because the
+  current helpers module does not expose DEFAULT_CHUNK_SIZE.
+- Omit CHANGES/13501.bugfix.rst, which records an upstream release note.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ aiohttp/web_protocol.py                |  67 ++++++--
+ tests/test_web_functional.py           | 221 +++++++++++++++++++++++++
+ tests/test_web_protocol.py             |  90 ++++++++++
+ tests/test_web_websocket_functional.py | 155 +++++++++++++++++
+ 4 files changed, 522 insertions(+), 11 deletions(-)
+
+diff --git a/aiohttp/web_protocol.py b/aiohttp/web_protocol.py
+index c04aa10..5968d10 100644
+--- a/aiohttp/web_protocol.py
++++ b/aiohttp/web_protocol.py
+@@ -164,6 +164,7 @@ class RequestHandler(BaseProtocol):
+         "_msg_queue_resume_size",
+         "_msg_queue_paused",
+         "_message_tail",
++        "_read_bufsize",
+         "_handler_waiter",
+         "_waiter",
+         "_task_handler",
+@@ -209,6 +210,7 @@ class RequestHandler(BaseProtocol):
+         # Low-water mark: resume reading once the queue drains to half the limit
+         # so we refill in batches instead of churning pause/resume per request.
+         self._msg_queue_resume_size = MAX_MSG_QUEUE_SIZE // 2
++        self._read_bufsize = read_bufsize
+         self._msg_queue_paused = False
+         super().__init__(loop)
+ 
+@@ -421,6 +423,9 @@ class RequestHandler(BaseProtocol):
+             self._payload_parser.feed_data(self._message_tail)
+             self._message_tail = b""
+ 
++        if self._msg_queue_paused:
++            self._resume_msg_queue_reading()
++
+     def eof_received(self) -> None:
+         pass
+ 
+@@ -464,6 +469,11 @@ class RequestHandler(BaseProtocol):
+         # no parser, just store
+         elif self._payload_parser is None and self._upgrade and data:
+             self._message_tail += data
++            if (
++                not self._msg_queue_paused
++                and len(self._message_tail) >= self._read_bufsize
++            ):
++                self._pause_msg_queue_reading()
+ 
+         # feed payload
+         elif data:
+@@ -485,6 +495,10 @@ class RequestHandler(BaseProtocol):
+                 pass
+ 
+     def _resume_msg_queue_reading(self) -> None:
++        # Tested empty-first so a read_bufsize of 0 cannot wedge the connection.
++        if self._message_tail and len(self._message_tail) >= self._read_bufsize:
++            return
++
+         if not self._upgrade:
+             # Reparse buffered pipelined requests while still marked paused so
+             # a refill past the limit does not re-pause an already-paused
+@@ -765,25 +779,56 @@ class RequestHandler(BaseProtocol):
+         prematurely.
+         """
+         request._finish()
+-        if self._request_parser is not None:
++
++        # Handle feeding the message tail following an upgrade request that
++        # was declined.
++        # The upgrade request is the last request before the parser paused,
++        # so wait for self._messages to be empty.
++        # payload_parser is not None if the upgrade was accepted.
++        if (
++            self._upgrade
++            and not self._messages
++            and self._payload_parser is None
++            and self._request_parser is not None
++        ):
+             self._request_parser.set_upgraded(False)
+             self._upgrade = False
+             if self._message_tail:
+-                messages, _upgraded, tail = self._request_parser.feed_data(
+-                    self._message_tail
+-                )
++                messages: Sequence[_MsgType]
++                try:
++                    messages, upgraded, tail = self._request_parser.feed_data(
++                        self._message_tail
++                    )
++                except HttpProcessingError as parse_exc:
++                    # Garbage (or an oversized request line) buffered behind the
++                    # upgrade: answer 400 instead of letting the error escape
++                    # and lose this response, like data_received() does.
++                    messages = [
++                        (
++                            _ErrInfo(
++                                status=400,
++                                exc=parse_exc,
++                                message=parse_exc.message,
++                            ),
++                            EMPTY_PAYLOAD,
++                        )
++                    ]
++                    upgraded = False
++                    tail = b""
++                # A further upgrade request in the tail buffers its own remainder.
++                self._upgrade = upgraded
+                 self._message_tail = tail
+                 for msg, payload in messages:
+                     self._request_count += 1
+                     self._messages.append((msg, payload))
+-                # Pause the transport, like in data_received().
+-                if (
+-                    not self._msg_queue_paused
+-                    and len(self._messages) >= self._max_msg_queue_size
+-                ):
++                if len(self._messages) >= self._max_msg_queue_size:
++                    # Pause the transport, like in data_received().
+                     self._pause_msg_queue_reading()
+-                # This should not be possible. If a future refactor results in
+-                # this failing, update the code to set the waiter.
++                elif self._msg_queue_paused:
++                    # Resume reading now the tail has been parsed.
++                    self._resume_msg_queue_reading()
++                # This shouldn't be possible. If a future refactor results in this
++                # failing, then the code may need to be updated to set the waiter.
+                 assert self._waiter is None
+         try:
+             prepare_meth = resp.prepare
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index c5c4b5b..c9146ca 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -26,8 +26,11 @@ from aiohttp import (
+     multipart,
+     web,
+ )
++from aiohttp._websocket.writer import WebSocketWriter
++from aiohttp.base_protocol import BaseProtocol
+ from aiohttp.compression_utils import ZLibBackend, ZLibCompressObjProtocol
+ from aiohttp.hdrs import CONTENT_LENGTH, CONTENT_TYPE, TRANSFER_ENCODING
++from aiohttp.http import WSMsgType
+ from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
+ from aiohttp.streams import StreamReader
+ from aiohttp.typedefs import Handler
+@@ -1871,6 +1874,224 @@ async def test_http1_pipelined_behind_declined_upgrade_served_once(
+     assert len(set(handled)) == len(handled)
+ 
+ 
++DEFAULT_CHUNK_SIZE = 256 * 1024
++
++
++async def test_upgrade_tail_is_byte_limited(
++    aiohttp_server: AiohttpServer,
++    monkeypatch: pytest.MonkeyPatch,
++) -> None:
++    """Bytes buffered behind an in-flight upgrade must not grow unbounded.
++
++    A request the parser flagged as an upgrade has no payload, so everything
++    arriving while its handler runs is buffered whole until the handler either
++    prepares a websocket or answers normally. Only ``read_bufsize`` of it may be
++    held before reading is paused, regardless of how much is sent.
++    """
++    # Above the default so a ceiling that ignores read_bufsize fails the lower
++    # bound, and well below what is sent so no cap at all fails the upper one.
++    read_bufsize = 1024 * 1024
++    handler_started = asyncio.Event()
++    release_handler = asyncio.Event()
++    reading_paused = asyncio.Event()
++    max_tail = 0
++    data_received = RequestHandler.data_received
++
++    def observe_data_received(self: RequestHandler, data: bytes) -> None:
++        nonlocal max_tail
++        data_received(self, data)
++        if self._message_tail:
++            max_tail = max(max_tail, len(self._message_tail))
++            if self._msg_queue_paused:
++                reading_paused.set()
++
++    monkeypatch.setattr(RequestHandler, "data_received", observe_data_received)
++
++    async def upgrade_handler(request: web.Request) -> web.Response:
++        handler_started.set()
++        await release_handler.wait()
++        return web.Response(text="declined")
++
++    app = web.Application()
++    app.router.add_get("/upgrade", upgrade_handler)
++    server = await aiohttp_server(app, read_bufsize=read_bufsize)
++
++    chunk = b"A" * (64 * 1024)
++    chunks = (4 * 1024 * 1024) // len(chunk)
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(
++            b"GET /upgrade HTTP/1.1\r\nHost: localhost\r\n"
++            b"Connection: Upgrade\r\nUpgrade: websocket\r\n\r\n"
++        )
++        await writer.drain()
++        await asyncio.wait_for(handler_started.wait(), 1)
++
++        async def send_until_paused() -> None:
++            for _ in range(chunks):  # pragma: no branch
++                if reading_paused.is_set():
++                    break
++                writer.write(chunk)
++                await writer.drain()
++
++        sender = asyncio.create_task(send_until_paused())
++        try:
++            # Only elapses if nothing caps the buffer, in which case the
++            # assertions below report what was actually buffered.
++            with suppress(asyncio.TimeoutError):
++                await asyncio.wait_for(reading_paused.wait(), 5)
++        finally:
++            sender.cancel()
++            with suppress(asyncio.CancelledError):
++                await sender
++    finally:
++        release_handler.set()
++        writer.close()
++        with suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    assert reading_paused.is_set(), f"reading never paused, buffered {max_tail} bytes"
++    # pause_reading() only takes effect after the read in flight, and asyncio
++    # reads at most DEFAULT_CHUNK_SIZE per call, so one extra chunk may land.
++    assert read_bufsize <= max_tail < read_bufsize + DEFAULT_CHUNK_SIZE
++
++
++async def test_upgrade_tail_resumes_reading_after_websocket_prepare(
++    aiohttp_server: AiohttpServer,
++    monkeypatch: pytest.MonkeyPatch,
++) -> None:
++    """A websocket paused while its tail filled up must keep reading.
++
++    A client may pipeline frames straight after the handshake request, filling
++    the tail buffer and pausing reading before the handler prepares. Once the
++    websocket owns the connection the tail is handed over, so reading has to
++    resume or whatever the client sent meanwhile is never read.
++    """
++    handshake_seen = asyncio.Event()
++    reading_paused = asyncio.Event()
++    release_handler = asyncio.Event()
++    last_received = asyncio.Event()
++    received: list[str] = []
++    data_received = RequestHandler.data_received
++
++    def observe_data_received(self: RequestHandler, data: bytes) -> None:
++        data_received(self, data)
++        if self._msg_queue_paused:
++            reading_paused.set()
++
++    monkeypatch.setattr(RequestHandler, "data_received", observe_data_received)
++
++    async def ws_handler(request: web.Request) -> web.WebSocketResponse:
++        handshake_seen.set()
++        await release_handler.wait()
++        ws = web.WebSocketResponse()
++        await ws.prepare(request)
++        async for msg in ws:  # pragma: no branch
++            assert isinstance(msg.data, str)
++            received.append(msg.data)
++            if msg.data == "last":
++                last_received.set()
++                break
++        return ws
++
++    app = web.Application()
++    app.router.add_get("/ws", ws_handler)
++    read_bufsize = 64 * 1024
++    server = await aiohttp_server(app, read_bufsize=read_bufsize)
++
++    # Enough pipelined frames to fill the tail, so reading must pause.
++    frame_payload = "B" * (32 * 1024)
++    frames = (read_bufsize // len(frame_payload)) + 2
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(
++            b"GET /ws HTTP/1.1\r\nHost: localhost\r\n"
++            b"Connection: Upgrade\r\nUpgrade: websocket\r\n"
++            b"Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\n"
++            b"Sec-WebSocket-Version: 13\r\n\r\n"
++        )
++        await writer.drain()
++        await asyncio.wait_for(handshake_seen.wait(), 1)
++
++        # Encode client frames off to the side, as tests/test_websocket_writer.py
++        # does, and put the bytes on the wire ourselves.
++        encoded = bytearray()
++        frame_transport = mock.create_autospec(
++            asyncio.Transport, spec_set=True, instance=True
++        )
++        # Defaults to a truthy Mock, which WebSocketWriter reads as closing.
++        frame_transport.is_closing.return_value = False
++        frame_transport.write.side_effect = encoded.extend
++        ws_writer = WebSocketWriter(
++            mock.create_autospec(BaseProtocol, spec_set=True, instance=True),
++            frame_transport,
++            use_mask=True,
++        )
++
++        for _ in range(frames):
++            await ws_writer.send_frame(frame_payload.encode(), WSMsgType.TEXT)
++        writer.write(encoded)
++        await writer.drain()
++        await asyncio.wait_for(reading_paused.wait(), 5)
++
++        # Sent while reading is paused, so this frame is only ever read if the
++        # handover to the websocket resumes the transport.
++        encoded.clear()
++        await ws_writer.send_frame(b"last", WSMsgType.TEXT)
++        writer.write(encoded)
++        await writer.drain()
++        release_handler.set()
++
++        await asyncio.wait_for(reader.readuntil(b"\r\n\r\n"), 5)
++        await asyncio.wait_for(last_received.wait(), 5)
++    finally:
++        release_handler.set()
++        writer.close()
++        with suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    assert received == [frame_payload] * frames + ["last"]
++
++
++async def test_bad_pipelined_data_behind_declined_upgrade_answers_400(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    """Junk buffered behind an upgrade must not swallow the upgrade response.
++
++    The tail is only parsed once the handler answers, so a parse error there
++    has to be reported as a 400 like it would be from data_received(); letting
++    it escape loses the response that was about to be written.
++    """
++
++    async def upgrade_handler(request: web.Request) -> web.Response:
++        return web.Response(text="declined")
++
++    app = web.Application()
++    app.router.add_get("/upgrade", upgrade_handler)
++    server = await aiohttp_server(app)
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(
++            b"GET /upgrade HTTP/1.1\r\nHost: localhost\r\n"
++            b"Connection: Upgrade\r\nUpgrade: websocket\r\n\r\n"
++            b"\x00" * 64
++        )
++        await writer.drain()
++        response = await asyncio.wait_for(reader.read(), 5)
++    finally:
++        writer.close()
++        with suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    assert b"declined" in response, response
++    # A 400 only follows if the parse error was reported instead of escaping,
++    # and "declined" only arrives if it did not abort this response first.
++    assert b" 400 " in response, response
++
++
+ @pytest.mark.parametrize("decompressed_size", [4 * 1024 * 1024, 32 * 1024 * 1024])
+ async def test_unread_compressed_body_drain_is_bounded(
+     aiohttp_server: AiohttpServer,
+diff --git a/tests/test_web_protocol.py b/tests/test_web_protocol.py
+index 879be20..a3bce7b 100644
+--- a/tests/test_web_protocol.py
++++ b/tests/test_web_protocol.py
+@@ -3,6 +3,7 @@ from unittest import mock
+ 
+ import pytest
+ 
++from aiohttp.http import WebSocketReader
+ from aiohttp.web_protocol import RequestHandler
+ from aiohttp.web_server import Server
+ 
+@@ -17,6 +18,13 @@ def dummy_manager() -> Server:
+     )
+ 
+ 
++@pytest.fixture
++def dummy_reader() -> tuple[WebSocketReader, mock.Mock]:
++    m = mock.create_autospec(WebSocketReader, spec_set=True, instance=True)
++    m.feed_data.return_value = False, b""
++    return m, m
++
++
+ def test_pause_msg_queue_reading_without_transport(
+     loop: asyncio.AbstractEventLoop,
+     dummy_manager: Server,
+@@ -65,6 +73,88 @@ def test_resume_msg_queue_reading_without_transport(
+     assert handler._msg_queue_paused is False
+ 
+ 
++def test_resume_msg_queue_reading_stays_paused_for_full_tail(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    """Resume is refused while an in-flight upgrade holds read_bufsize of tail.
++
++    The tail is drained by set_parser()/finish_response(), so resuming before
++    then would let the buffer grow past its ceiling one read at a time.
++    """
++    handler = RequestHandler(dummy_manager, loop=loop, read_bufsize=1024)
++    transport = mock.create_autospec(asyncio.Transport, spec_set=True, instance=True)
++    handler.transport = transport
++    handler._upgrade = True
++    handler._msg_queue_paused = True
++    handler._message_tail = b"x" * 1024
++
++    handler._resume_msg_queue_reading()
++
++    assert handler._msg_queue_paused is True
++    transport.resume_reading.assert_not_called()
++
++
++def test_resume_msg_queue_reading_with_room_left_in_tail(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    """A tail under read_bufsize does not hold the transport paused."""
++    handler = RequestHandler(dummy_manager, loop=loop, read_bufsize=1024)
++    transport = mock.create_autospec(asyncio.Transport, spec_set=True, instance=True)
++    handler.transport = transport
++    handler._upgrade = True
++    handler._msg_queue_paused = True
++    handler._message_tail = b"x" * 1023
++
++    handler._resume_msg_queue_reading()
++
++    assert handler._msg_queue_paused is False
++    transport.resume_reading.assert_called_once_with()
++
++
++def test_resume_msg_queue_reading_with_zero_read_bufsize(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    """An empty tail resumes even when read_bufsize leaves it no room.
++
++    Guards the degenerate ``read_bufsize=0`` case: comparing sizes alone would
++    match an empty tail and wedge the connection paused for good.
++    """
++    handler = RequestHandler(dummy_manager, loop=loop, read_bufsize=0)
++    transport = mock.create_autospec(asyncio.Transport, spec_set=True, instance=True)
++    handler.transport = transport
++    handler._upgrade = True
++    handler._msg_queue_paused = True
++
++    handler._resume_msg_queue_reading()
++
++    assert handler._msg_queue_paused is False
++    transport.resume_reading.assert_called_once_with()
++
++
++def test_set_parser_resumes_reading_paused_for_tail(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++    dummy_reader: tuple[WebSocketReader, mock.Mock],
++) -> None:
++    """Handing a full tail to the upgraded protocol resumes reading."""
++    handler = RequestHandler(dummy_manager, loop=loop, read_bufsize=1024)
++    transport = mock.create_autospec(asyncio.Transport, spec_set=True, instance=True)
++    handler.transport = transport
++    handler._upgrade = True
++    handler._msg_queue_paused = True
++    handler._message_tail = b"x" * 1024
++
++    handler.set_parser(dummy_reader[0])
++
++    dummy_reader[1].feed_data.assert_called_once_with(b"x" * 1024)
++    assert handler._message_tail == b""
++    assert handler._msg_queue_paused is False
++    transport.resume_reading.assert_called_once_with()
++
++
+ def test_resume_reading_stays_paused_for_msg_queue(
+     loop: asyncio.AbstractEventLoop,
+     dummy_manager: Server,
+diff --git a/tests/test_web_websocket_functional.py b/tests/test_web_websocket_functional.py
+index 871987e..6035b77 100644
+--- a/tests/test_web_websocket_functional.py
++++ b/tests/test_web_websocket_functional.py
+@@ -13,6 +13,7 @@ import aiohttp
+ from aiohttp import web
+ from aiohttp.http import WSCloseCode, WSMsgType
+ from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
++from aiohttp.web_protocol import MAX_MSG_QUEUE_SIZE
+ 
+ 
+ async def test_websocket_can_prepare(loop, aiohttp_client) -> None:
+@@ -1422,3 +1423,157 @@ async def test_websocket_prepared_property(
+     assert msg.type is WSMsgType.TEXT
+     assert msg.data == "test"
+     await ws.close()
++
++
++def _raw_get(path: str) -> bytes:
++    return f"GET {path} HTTP/1.1\r\nHost: localhost\r\n\r\n".encode("ascii")
++
++
++_RAW_UPGRADE = (
++    b"GET /ws HTTP/1.1\r\n"
++    b"Host: localhost\r\n"
++    b"Upgrade: websocket\r\n"
++    b"Connection: Upgrade\r\n"
++    b"Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\n"
++    b"Sec-WebSocket-Version: 13\r\n"
++    b"\r\n"
++)
++
++
++def _masked_text_frame(payload: bytes) -> bytes:
++    """Build a client text frame; frames sent to a server must be masked."""
++    assert len(payload) < 126
++    mask = b"\x37\xfa\x21\x3d"
++    return (
++        b"\x81"
++        + bytes((0x80 | len(payload),))
++        + mask
++        + bytes(b ^ mask[i % 4] for i, b in enumerate(payload))
++    )
++
++
++async def test_websocket_frames_pipelined_behind_request_burst(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    """A websocket upgraded from within a request burst still reads frames.
++
++    The parser stops at the upgrade request and buffers everything after it,
++    which is websocket data once the handshake succeeds. Answering the requests
++    queued ahead of the upgrade must neither consume that buffer as HTTP nor
++    leave the transport paused by the pipeline queue after switching protocols.
++    """
++    # More than the queue holds, so reading pauses and the parser buffers.
++    pipelined_requests = MAX_MSG_QUEUE_SIZE + 8
++    handled: list[str] = []
++
++    async def handler(request: web.Request) -> web.Response:
++        handled.append(request.path)
++        return web.Response()
++
++    async def ws_handler(request: web.Request) -> web.WebSocketResponse:
++        ws = web.WebSocketResponse()
++        await ws.prepare(request)
++        await ws.send_str(await ws.receive_str())
++        return ws
++
++    app = web.Application()
++    app.router.add_get("/ws", ws_handler)
++    app.router.add_get("/{tail:.*}", handler)
++    server = await aiohttp_server(app)
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(
++            b"".join(_raw_get(f"/r{i}") for i in range(pipelined_requests))
++            + _RAW_UPGRADE
++            + _masked_text_frame(b"frame-ok")
++        )
++        await writer.drain()
++
++        # Without the fix the frame is eaten by the http parser and the paused
++        # transport is never resumed, so nothing is echoed back.
++        await asyncio.wait_for(reader.readuntil(b"\x81\x08frame-ok"), timeout=10)
++    finally:
++        writer.close()
++        with contextlib.suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    assert handled == [f"/r{i}" for i in range(pipelined_requests)]
++
++
++async def test_pipelined_request_after_declined_upgrade_behind_burst(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    """A declined upgrade replays its tail even when queued behind a request.
++
++    Only the upgrade request's own response settles whether the buffered bytes
++    are websocket data or pipelined HTTP, so an earlier request completing must
++    leave them alone and the declining response still has to replay them.
++    """
++    handled: list[str] = []
++
++    async def handler(request: web.Request) -> web.Response:
++        handled.append(request.path)
++        return web.Response(text=f"{request.path[1:]}-ok")
++
++    async def ws_handler(request: web.Request) -> NoReturn:
++        raise web.HTTPUpgradeRequired()
++
++    app = web.Application()
++    app.router.add_get("/ws", ws_handler)
++    app.router.add_get("/{tail:.*}", handler)
++    server = await aiohttp_server(app)
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(_raw_get("/first") + _RAW_UPGRADE + _raw_get("/second"))
++        await writer.drain()
++
++        # Without the replay the trailing request stalls until keep-alive expires.
++        data = await asyncio.wait_for(reader.readuntil(b"second-ok"), timeout=10)
++    finally:
++        writer.close()
++        with contextlib.suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    assert handled == ["/first", "/second"]
++    assert data.count(b"HTTP/1.1 200 OK") == 2, data
++    assert b"426" in data, data
++
++
++async def test_pipelined_request_after_two_declined_upgrades(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    """A second upgrade inside a replayed tail buffers its own remainder again.
++
++    Replaying a declined upgrade's tail can turn up another upgrade request,
++    which puts the parser back into upgraded mode. Losing that leaves the bytes
++    behind the second upgrade buffered with nothing left to replay them.
++    """
++    handled: list[str] = []
++
++    async def handler(request: web.Request) -> web.Response:
++        handled.append(request.path)
++        return web.Response(text="second-ok")
++
++    async def ws_handler(request: web.Request) -> NoReturn:
++        raise web.HTTPUpgradeRequired()
++
++    app = web.Application()
++    app.router.add_get("/ws", ws_handler)
++    app.router.add_get("/{tail:.*}", handler)
++    server = await aiohttp_server(app)
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(_RAW_UPGRADE + _RAW_UPGRADE + _raw_get("/second"))
++        await writer.drain()
++
++        data = await asyncio.wait_for(reader.readuntil(b"second-ok"), timeout=10)
++    finally:
++        writer.close()
++        with contextlib.suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    assert handled == ["/second"]
++    assert data.count(b"HTTP/1.1 426 ") == 2, data
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 06e0156e14..1ddfec27aa 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -39,6 +39,7 @@ SRC_URI += " \
     file://CVE-2026-128126.patch \
     file://CVE-2026-128127.patch \
     file://CVE-2026-128128.patch \
+    file://CVE-2026-128129.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6

