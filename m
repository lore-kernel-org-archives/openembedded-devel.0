Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36180.1795583900532832989
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=g1ADrroc;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16765; q=dns/txt;
  s=iport01; t=1795583900; x=1796793500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SQnHceLsFUqtBQahbaKT5FK92HCkbk/k9eg+gdGPX6o=;
  b=g1ADrrocNkis10avDfmc4KYemNjAauOqQ9TrUVt0LA/+Kc1Wnb0/M80V
   9d2XUAFlPgOAZL+qzcOK/HkM2yW9Jdh4kLm6AcIBAslUxy6KNN82rpHMv
   C2z/D/3myrGLNfDTnd0Td53LfGnWNyUKjXmf+1wzCe2U0C/71q1rixTdi
   2O4Pwv803hmJg5pOoHFBowangrzr6ukwcAvDU5AcUYjCxvkEvPRCtxBEI
   qq5aV7xRjkjjNlLEMkf+zQdQvd50kQQMCVucFVluBFsj7k4t5T7fR4WWt
   yb8DwH4pwLWbLYNeDwFbG9K4WbOtZ3T68qgn3kkglWJLLtUcNAGVfATPj
   g==;
X-CSE-ConnectionGUID: 3EL6qaQxTByaPhofg50X+g==
X-CSE-MsgGUID: i7t9+rD1Q8m3WIQL6TDnuQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgAhbQZr/9BK/pBaglmCGD91YENJA5ZIA5FQjFmBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYIqWAGCdAMRugOBe?=
 =?us-ascii?q?TOBAYMpAYFU2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVgTuCL4EFgVwCgUiGX?=
 =?us-ascii?q?gSCDRWBDIEHTYY3A4ZZAoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?zsXgQcbBgWBHIEegRKBA12BKyhdASGBCIF1AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdH?=
 =?us-ascii?q?hkOAikGFiELNBgNSBEsNxUZBD5uB5QTgxsBDQhEBwIYEwEqAQSBAQwjIxFEB?=
 =?us-ascii?q?hYykkUZCQGSP4E1n1wKKIN5jCSVOhozhASUGpJUC5h9glmLMZVpGFCEaoFoP?=
 =?us-ascii?q?IFZcBWDIglKGQ9YjWGDa85bJjICCQMvAQEHAgcOAwuBaJAABIEaYAEB?=
IronPort-Data: A9a23:kQJ7IKzMReVg/7eKKeV6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkVTy
 zEcWGyEaarZZ2f8fd4kbdmy/UJT7JfVztRkTwtuq1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaD9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBobGdMB899nPUtf/
 MQYLz4CM0izxO3jldpXSsE07igiBMDmJsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkyQC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+Oa1aYqJI4fVLSlTtkfHu
 jOF5UigO0Efb+O+8B7bzl6qm9aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:3BPNVK/drRdb4bkb+Tluk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3Aqy1SiGjlI5Bv5MgWtx+48/0PgjJuKVD5km7ZGl+?=
 =?us-ascii?q?EI3dgcL2SR1DNoJMnnJ87?=
X-Talos-MUID: 9a23:uzKAoQZTw2MOc+BTtmDw1XJ4GJ5Rs6H1N2E0tcs6l8+ZDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60184137"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:18:16 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 48DD918000214;
	Wed, 25 Nov 2026 05:18:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 8899ACBF234; Tue, 24 Nov 2026 21:18:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 6/9] python3-aiohttp: fix CVE-2026-111064
Date: Tue, 24 Nov 2026 21:18:08 -0800
Message-Id: <20261125051811.2524271-7-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051811.2524271-1-dkelaiya@cisco.com>
References: <20261125051811.2524271-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132973
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the idle-connection timeout fix [1] to aiohttp 3.9.5,
as identified by [2]. Start the keepalive deadline when the connection
is established and use the existing timeout to bound the wait for
the first request headers.

[1] https://github.com/aio-libs/aiohttp/commit/be846822b4b3a5a54b6163e794b42dc06fba54a3
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-5wr8-gcqf-gqf3

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111064.patch     | 398 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 399 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch
new file mode 100644
index 0000000..7caf9c3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch
@@ -0,0 +1,398 @@
+From be846822b4b3a5a54b6163e794b42dc06fba54a3 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Tue, 29 Sep 2026 00:08:22 +0100
+Subject: [PATCH] Close idle connections (#13681) (#13838)
+
+CVE: CVE-2026-111064
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/be846822b4b3a5a54b6163e794b42dc06fba54a3]
+
+Backport Changes:
+- Use 3.9.5's _keepalive_time and task creation, preserve None as
+  disabled, and reuse the existing 75-second default.
+- Replace the old periodic timer check using the stored start time.
+  An early callback rearms at the deadline. A finished waiter stays
+  open.
+- Document that the initial deadline covers only request headers.
+  Omit the 3.14.4 version marker and already-correct default update.
+- Cover timer setup, rearming, and waiter states with mocked loops
+  and transports. Use the 3.9.5 raw-server fixture to check idle,
+  partial-header and post-request expiry on loopback. Synchronize the
+  slow handler with the initial deadline and check its response.
+  Adapt the WebSocket fixture signature and omit unrelated typing.
+
+(cherry picked from commit e07684ef9056183bbefba1ae3f717a23f243631e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13681.bugfix.rst               |    1 
+ aiohttp/web_protocol.py                |   38 +++++-----
+ docs/web_reference.rst                 |    5 +
+ tests/test_web_protocol.py             |   76 +++++++++++++++++++++
+ tests/test_web_server.py               |  118 ++++++++++++++++++++++++++++++++
+ tests/test_web_websocket_functional.py |   30 ++++++++
+ 6 files changed, 250 insertions(+), 18 deletions(-)
+ create mode 100644 CHANGES/13681.bugfix.rst
+
+diff --git a/CHANGES/13681.bugfix.rst b/CHANGES/13681.bugfix.rst
+new file mode 100644
+index 0000000000000000000000000000000000000000..e39b73a91fa2833b1492054e31b18fea9e265029
+--- /dev/null
++++ b/CHANGES/13681.bugfix.rst
+@@ -0,0 +1 @@
++Fixed idle connections not being closed if no request was received -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/web_protocol.py b/aiohttp/web_protocol.py
+index 39a1b68502fb48b8d0640c8fd4ebd6e7308512d6..314c5c79274aee2fffaf17afb91ae0349ac8a798 100644
+--- a/aiohttp/web_protocol.py
++++ b/aiohttp/web_protocol.py
+@@ -109,8 +109,7 @@ class RequestHandler(BaseProtocol):
+     status line, bad headers or incomplete payload. If any error occurs,
+     connection gets closed.
+ 
+-    keepalive_timeout -- number of seconds before closing
+-                         keep-alive connection
++    keepalive_timeout -- number of seconds before closing an idle connection.
+ 
+     tcp_keepalive -- TCP keep-alive is on, default is on
+ 
+@@ -138,8 +137,6 @@ class RequestHandler(BaseProtocol):
+ 
+     """
+ 
+-    KEEPALIVE_RESCHEDULE_DELAY = 1
+-
+     __slots__ = (
+         "max_field_size",
+         "max_headers",
+@@ -206,7 +203,7 @@ class RequestHandler(BaseProtocol):
+         super().__init__(loop)
+ 
+         self._request_count = 0
+-        self._keepalive = False
++        self._keepalive = True
+         self._current_request: Optional[BaseRequest] = None
+         self._manager: Optional[Server] = manager
+         self._request_handler: Optional[_RequestHandler] = manager.request_handler
+@@ -310,7 +307,15 @@ class RequestHandler(BaseProtocol):
+         if self._tcp_keepalive:
+             tcp_keepalive(real_transport)
+ 
+-        self._task_handler = self._loop.create_task(self.start())
++        loop = self._loop
++        # Need to enable keepalive timeout at start of connection, as there's no other
++        # protection against a dead connection that doesn't send a request at all.
++        if self._keepalive_timeout is not None and self._keepalive_timeout > 0:
++            self._keepalive_time = loop.time()
++            close_time = self._keepalive_time + self._keepalive_timeout
++            self._keepalive_handle = loop.call_at(close_time, self._process_keepalive)
++
++        self._task_handler = loop.create_task(self.start())
+         assert self._manager is not None
+         self._manager.connection_made(self, real_transport)
+ 
+@@ -483,23 +488,20 @@ class RequestHandler(BaseProtocol):
+         self.logger.exception(*args, **kw)
+ 
+     def _process_keepalive(self) -> None:
++        self._keepalive_handle = None
+         if self._force_close or not self._keepalive:
+             return
+ 
+-        next = self._keepalive_time + self._keepalive_timeout
++        loop = self._loop
++        close_time = self._keepalive_time + self._keepalive_timeout
++        if loop.time() < close_time:
++            # Keep alive close check fired too early, reschedule
++            self._keepalive_handle = loop.call_at(close_time, self._process_keepalive)
++            return
+ 
+         # handler in idle state
+-        if self._waiter:
+-            if self._loop.time() > next:
+-                self.force_close()
+-                return
+-
+-        # not all request handlers are done,
+-        # reschedule itself to next second
+-        self._keepalive_handle = self._loop.call_later(
+-            self.KEEPALIVE_RESCHEDULE_DELAY,
+-            self._process_keepalive,
+-        )
++        if self._waiter and not self._waiter.done():
++            self.force_close()
+ 
+     async def _handle_request(
+         self,
+diff --git a/docs/web_reference.rst b/docs/web_reference.rst
+index cc6201b42c09e36c993bd387af028bdd632cdaea..1f934021d7a44a0a66f7ed1e890e5cdc25ed00bf 100644
+--- a/docs/web_reference.rst
++++ b/docs/web_reference.rst
+@@ -2988,6 +2988,11 @@ Utilities
+    :param float keepalive_timeout: a delay before a TCP connection is
+                                    closed after a HTTP request. The delay
+                                    allows for reuse of a TCP connection.
++                                   The same delay bounds how long a newly
++                                   accepted connection may take to deliver
++                                   its first complete request headers;
++                                   connections that stay idle or send
++                                   incomplete headers are closed.
+ 
+       .. versionadded:: 3.8
+ 
+diff --git a/tests/test_web_protocol.py b/tests/test_web_protocol.py
+index dcda53965fb85711a2c9a6b573e554e73f2fcbd9..084b72edba0301dc17fc951f114b3751afae0934 100644
+--- a/tests/test_web_protocol.py
++++ b/tests/test_web_protocol.py
+@@ -1,4 +1,5 @@
+ import asyncio
++from typing import Optional, Tuple
+ from unittest import mock
+ 
+ import pytest
+@@ -17,6 +18,81 @@ def dummy_manager() -> Server:
+     )  # type: ignore[no-any-return]
+ 
+ 
++def _connect_with_keepalive(
++    dummy_manager: Server, timeout: Optional[float]
++) -> Tuple[RequestHandler, mock.Mock, mock.Mock]:
++    loop = mock.Mock(spec=asyncio.AbstractEventLoop)
++    loop.time.return_value = 10.0
++    transport = mock.Mock(spec=asyncio.Transport)
++    transport.get_extra_info.return_value = None
++    handler = RequestHandler(
++        dummy_manager,
++        loop=loop,
++        keepalive_timeout=timeout,  # type: ignore[arg-type]
++        tcp_keepalive=False,
++    )
++
++    with mock.patch.object(RequestHandler, "start", new=mock.Mock()):
++        handler.connection_made(transport)
++
++    return handler, loop, transport
++
++
++@pytest.mark.parametrize("timeout", [2.0, 0.0, None])
++def test_connection_made_schedules_initial_keepalive(
++    dummy_manager: Server, timeout: Optional[float]
++) -> None:
++    handler, loop, _ = _connect_with_keepalive(dummy_manager, timeout)
++
++    if timeout:
++        loop.call_at.assert_called_once_with(12.0, handler._process_keepalive)
++        assert handler._keepalive_handle is loop.call_at.return_value
++    else:
++        loop.call_at.assert_not_called()
++        assert handler._keepalive_handle is None
++
++
++def test_initial_keepalive_rearms_if_called_early(dummy_manager: Server) -> None:
++    handler, loop, transport = _connect_with_keepalive(dummy_manager, 2.0)
++    handler._waiter = mock.Mock(spec=asyncio.Future)
++    handler._waiter.done.return_value = False
++    callback = loop.call_at.call_args.args[1]
++    loop.call_at.reset_mock()
++    loop.time.return_value = 11.0
++    loop.call_at.return_value = mock.sentinel.rearmed
++
++    callback()
++
++    loop.call_at.assert_called_once_with(12.0, callback)
++    assert handler._keepalive_handle is mock.sentinel.rearmed
++    transport.close.assert_not_called()
++
++
++@pytest.mark.parametrize(
++    "waiter_done", [False, True, None], ids=["pending", "resolved", "dispatched"]
++)
++def test_initial_keepalive_deadline(
++    dummy_manager: Server, waiter_done: Optional[bool]
++) -> None:
++    handler, loop, transport = _connect_with_keepalive(dummy_manager, 2.0)
++    if waiter_done is not None:
++        waiter = mock.Mock(spec=asyncio.Future)
++        waiter.done.return_value = waiter_done
++        handler._waiter = waiter
++    callback = loop.call_at.call_args.args[1]
++    loop.call_at.reset_mock()
++    loop.time.return_value = 12.0
++
++    callback()
++
++    assert handler._keepalive_handle is None
++    loop.call_at.assert_not_called()
++    if waiter_done is False:
++        transport.close.assert_called_once_with()
++    else:
++        transport.close.assert_not_called()
++
++
+ def test_pause_msg_queue_reading_without_transport(
+     loop: asyncio.AbstractEventLoop,
+     dummy_manager: Server,
+diff --git a/tests/test_web_server.py b/tests/test_web_server.py
+index d0fd95acdb4b17fcf8dc1a390e2a48d6ae68441c..6442224d86efe24be82c75969afe384329378c2b 100644
+--- a/tests/test_web_server.py
++++ b/tests/test_web_server.py
+@@ -253,3 +253,121 @@ async def test_no_handler_cancellation(aiohttp_unused_port) -> None:
+         assert done_event.is_set()
+     finally:
+         await asyncio.gather(runner.shutdown(), site.stop())
++
++
++async def test_initial_keepalive_is_armed_on_loopback(
++    aiohttp_raw_server, aiohttp_client
++) -> None:
++    keepalive_timeout = 30.0
++    connection_made = web.Server.connection_made
++    opened = []
++    handled = []
++
++    def observe_connection(
++        server: web.Server,
++        protocol: web.RequestHandler,
++        transport: asyncio.Transport,
++    ) -> None:
++        connection_made(server, protocol, transport)
++        opened.append((protocol, protocol._keepalive_handle, protocol._keepalive_time))
++
++    async def handler(request: web.BaseRequest) -> web.Response:
++        handled.append(request.protocol)
++        return web.Response(text="ok")
++
++    server = await aiohttp_raw_server(handler, keepalive_timeout=keepalive_timeout)
++    cli = await aiohttp_client(server, timeout=client.ClientTimeout(total=10))
++    with mock.patch.object(web.Server, "connection_made", observe_connection):
++        async with cli.get("/") as response:
++            assert response.status == 200
++            assert await response.text() == "ok"
++
++    [(protocol, timer, connection_time)] = opened
++    assert handled == [protocol]
++    assert isinstance(timer, asyncio.TimerHandle)
++    assert not timer.cancelled()
++    assert timer.when() == connection_time + keepalive_timeout
++
++
++@pytest.mark.parametrize(
++    "send_headers", [False, True], ids=["idle", "partial-headers"]
++)
++async def test_initial_keepalive_closes_on_loopback(
++    aiohttp_raw_server, send_headers: bool
++) -> None:
++    handler = mock.AsyncMock()
++    server = await aiohttp_raw_server(handler, keepalive_timeout=1.0)
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++
++    try:
++        if send_headers:
++            writer.write(b"GET / HTTP/1.1\r\nHost: localhost\r\n")
++            await writer.drain()
++
++        assert await asyncio.wait_for(reader.read(1), timeout=5) == b""
++        handler.assert_not_awaited()
++    finally:
++        writer.close()
++        await writer.wait_closed()
++
++
++async def test_keepalive_expires_on_loopback_after_complete_request(
++    aiohttp_raw_server, monkeypatch: pytest.MonkeyPatch
++) -> None:
++    expired = False
++    process_keepalive = web.RequestHandler._process_keepalive
++
++    def observe_expiry(protocol: web.RequestHandler) -> None:
++        nonlocal expired
++        was_open = not protocol._force_close
++        process_keepalive(protocol)
++        if was_open and protocol._force_close:
++            expired = True
++
++    monkeypatch.setattr(web.RequestHandler, "_process_keepalive", observe_expiry)
++
++    async def handler(request: web.BaseRequest) -> web.Response:
++        return web.Response(body=b"ok")
++
++    server = await aiohttp_raw_server(handler, keepalive_timeout=0.5)
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(b"GET / HTTP/1.1\r\nHost: example.com\r\n\r\n")
++        await writer.drain()
++        headers = await asyncio.wait_for(reader.readuntil(b"\r\n\r\n"), timeout=5)
++        assert headers.startswith(b"HTTP/1.1 200 ")
++        assert b"connection: close" not in headers.lower()
++        assert await asyncio.wait_for(reader.readexactly(2), timeout=5) == b"ok"
++
++        # Keep the client open so EOF comes from the server's keepalive timer.
++        assert await asyncio.wait_for(reader.read(1), timeout=5) == b""
++        assert expired
++    finally:
++        writer.close()
++        await writer.wait_closed()
++
++
++async def test_handler_slower_than_first_request_deadline(
++    aiohttp_raw_server, aiohttp_client, monkeypatch: pytest.MonkeyPatch
++) -> None:
++    """The initial deadline can expire while a complete request is handled."""
++    deadline_processed = asyncio.Event()
++    process_keepalive = web.RequestHandler._process_keepalive
++
++    def observe_deadline(protocol: web.RequestHandler) -> None:
++        process_keepalive(protocol)
++        if protocol._current_request is not None and protocol._keepalive_handle is None:
++            deadline_processed.set()
++
++    monkeypatch.setattr(web.RequestHandler, "_process_keepalive", observe_deadline)
++
++    async def handler(request: web.BaseRequest) -> web.Response:
++        await asyncio.wait_for(deadline_processed.wait(), timeout=5)
++        assert not request.protocol._force_close
++        return web.Response(text="ok")
++
++    server = await aiohttp_raw_server(handler, keepalive_timeout=0.5)
++    cli = await aiohttp_client(server, timeout=client.ClientTimeout(total=10))
++    async with cli.get("/") as response:
++        assert response.status == 200
++        assert await response.text() == "ok"
+diff --git a/tests/test_web_websocket_functional.py b/tests/test_web_websocket_functional.py
+index b471b131c1ef704d46712476b11a16693c862559..686845ce9964f1aa04f810181a4852153950c0f0 100644
+--- a/tests/test_web_websocket_functional.py
++++ b/tests/test_web_websocket_functional.py
+@@ -776,6 +776,36 @@ async def test_websocket_disable_keepalive(loop, aiohttp_client) -> None:
+     assert data == "OK"
+ 
+ 
++async def test_websocket_disable_keepalive_no_armed_handle(
++    aiohttp_server, aiohttp_client
++) -> None:
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
++    client = await aiohttp_client(server)
++
++    ws = await client.ws_connect("/")
++    data = await ws.receive_str()
++    assert data == "OK"
++
++    await ws.receive()  # Handle close
++
++
+ async def test_bug3380(loop, aiohttp_client) -> None:
+     async def handle_null(request):
+         return aiohttp.web.json_response({"err": None})
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 8d7fe9f..16ec0a6 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -43,6 +43,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-111066_p1.patch \
            file://CVE-2026-111066_p2.patch \
            file://CVE-2026-111065.patch \
+           file://CVE-2026-111064.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6
