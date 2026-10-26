Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35868.1792987107957283002
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 20:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LQ6N3haj;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4950979eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 20:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987107; x=1793591907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3ucMiA3RPbOkOv7GkKIsN7Sp6150xZtAG4sgD8hI68=;
        b=LQ6N3haj0p/CIiDiNu8PfjyOoOKCC+tnxbdVbkEKvCVvT0z2tJPsV5ejCmLySB7kNO
         m0B/paRKiGD1yJFvPfeDQbP4ycojgl8bqlTqjyyLBRcYxvgkLoSDnzYRUru2BfpsYkPF
         8N4TBdU5flpaV6m0CsVkCQ9ZB/nIL9Rl/3ZMXD7M+Ey5zP/XN6wGoc0vpYUZggMCG7bU
         fqNHSodCoV91N8V1cx5hDeFIEek8+a0sWaQvDRIcW4RbpYWSLkbe8er/6SeUWbZBBu3A
         dCTdYRNqG5AJhrwxi2MJI99wgiT5BVjL07aBeFx4mQ+F02Sp8dXFRkMVduupz/O9vcVI
         VuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987107; x=1793591907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3ucMiA3RPbOkOv7GkKIsN7Sp6150xZtAG4sgD8hI68=;
        b=zggTzAoO4Bg+5Of70NV9EsUq0rmP+7+7rWjH0W7qmVtdLAeb9uH93Z9o8Mm0VxIk4C
         teWyyW9lyAMzOcIyxzOjI6musM7MjlnqEecgVI6xsKvsQVX7rhwAyygMjQqdCx6fuXpb
         vFGndVJya5OJXpdrU5QpMqdBimy17mS+/Gg/xm4JiNksGabfS8eYLhU32IRt54l4qwJe
         ppoGogi8VD58ZHxZEimGE085TJEz9fYmmiOh4Va+pBYMLUq0MFvtjBa10OoiUu0cPWNS
         FaVzUevKIUlHAItU9XpUbl5c2BQrZVs6E+PIcKPw/cGzzJOiXQkitOSphfxxClJB1hYc
         dh+w==
X-Gm-Message-State: AFq9FYIhiE1u9xPzbSzgUmXHM+JUZo6r+7pZwnNL3erUcWbHs/eFllJ3
	Sb1fu4zl4kI/KIh3on4ya1QQwL+z0LyXLcA8cKk9B1EOG3Ne/3Y4hsCHUNFHvGHChuk=
X-Gm-Gg: AYBFou3WnRj68BQGWzg1jjD2/AxDdcPl/CEuvjLhol8Sit9qJyc6GcCWRisS/47GhGb
	NUUouAp8nffHQ68zNbHKQ5a3eI4gqer9eN2klipPT/frxFbF4CVAr5AkY/Q28i7eH9uWKPGiBbb
	zsEXq6Ek+CucD3oceuS9lcF2RLAWvo8YT4gOL1mdw367/B2xShZuhHpbsJ3hkz5aB+ErXrz4Gg4
	FYOey+r0TYWoU3wobb0kPClfj/hrnB7WvmWZlj4u8SgNH2RuIiwfb3hTeUIXvCT7faSEZyF5NV/
	cJj5gDEnqnXBl7h76QLUsoDbkqEf32LWjh8DqM3WGPWxQ6xXwKqVlXsgMbu4A2Av35+w6YygNbz
	ZuLM55RC7nWRvZk8/e6/jw/gkhkwvCLsucsOgvJhdCPQgoWt5FnNm+i8ffDH8gqsOLLuWc6e7gk
	QzXvD0b+kQHFMSAXym1QYU91bcKvtU6kMOfumxF6hOEo+gTC+CfmnOWIx/RVpVANJwmw/DW2EbP
	1QJpupVRLJRKKa3+gEOOVithYWQ+GJj55q8kvZL32ZElNnRRlALJfuiwsPm/fHvR7Igj2eyu3fc
	reb6jC3dYZc8idKupKepmFTrTCfMu3EoUXVXNuySqZRaI0p507vLm43cvypaUzWcKoCUuPjG7I/
	OPn59ErgUIO0znkdkucdO/tFqeZpUs/YnkvZvZr0EzHz0ErFAVu6kiavF7Yl8l4iZWJClcnxhNk
	OfX3WK107tUgzPILVlZfvvcklvGg1EtL9HYfnI05gjigIg5w/BjMwUco8dJoedeD+IHTLqo6cYS
	wNQsq6Ksf2zJDNtHiFP0n0SCYEnFIM=
X-Received: by 2002:a05:693c:3944:b0:369:ec31:8fd5 with SMTP id 5a478bee46e88-369ec31a168mr12119152eec.3.1792987107105;
        Sun, 25 Oct 2026 20:58:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm13277417eec.15.2026.10.25.20.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:58:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 7/8] python3-simple-websocket: Add recipe
Date: Sun, 25 Oct 2026 20:58:13 -0700
Message-ID: <20261026035814.55254-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
References: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131419
Content-Type: text/plain; charset="utf-8"

Simple WebSocket server and client for Python, built on wsproto.

Backport the upstream conversion of the async tests to pytest-asyncio;
the 1.1.0 tests call asyncio.get_event_loop(), which fails on Python
3.14 when there is no current event loop. Add it to the fast ptest list;
all 47 tests pass on qemuriscv64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ptest-packagelists-meta-python.inc        |   1 +
 ...test-improvements-for-Python-3.14-48.patch | 422 ++++++++++++++++++
 .../python/python3-simple-websocket_1.1.0.bb  |  19 +
 3 files changed, 442 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-simple-websocket/0001-Async-test-improvements-for-Python-3.14-48.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-simple-websocket_1.1.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 92183897c7..6e4af06aaa 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -103,6 +103,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-serpent \
     python3-service-identity \
     python3-setproctitle \
+    python3-simple-websocket \
     python3-simpleeval \
     python3-six \
     python3-smpplib \
diff --git a/meta-python/recipes-devtools/python/python3-simple-websocket/0001-Async-test-improvements-for-Python-3.14-48.patch b/meta-python/recipes-devtools/python/python3-simple-websocket/0001-Async-test-improvements-for-Python-3.14-48.patch
new file mode 100644
index 0000000000..2be661c29e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simple-websocket/0001-Async-test-improvements-for-Python-3.14-48.patch
@@ -0,0 +1,422 @@
+From 03832db418f11a818051eefcd774495798b203af Mon Sep 17 00:00:00 2001
+From: Miguel Grinberg <miguel.grinberg@gmail.com>
+Date: Sun, 12 Apr 2026 10:38:44 +0100
+Subject: [PATCH] Async test improvements for Python 3.14 (#48)
+
+Python 3.14 no longer creates an event loop in asyncio.get_event_loop(),
+so the make_sync() test helper fails with "There is no current event
+loop in thread 'MainThread'". Run the async tests with pytest-asyncio.
+
+Upstream-Status: Backport [https://github.com/miguelgrinberg/simple-websocket/commit/2005dbb96b5b42a4ebf309d10ac1d33daaddb99f]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/helpers.py        | 25 -------------------------
+ tests/test_aioclient.py | 39 ++++++++++++++-------------------------
+ tests/test_aioserver.py | 39 +++++++++++++--------------------------
+ tests/test_server.py    |  2 +-
+ 4 files changed, 28 insertions(+), 77 deletions(-)
+ delete mode 100644 tests/helpers.py
+
+diff --git a/tests/helpers.py b/tests/helpers.py
+deleted file mode 100644
+index a7c1a46..0000000
+--- a/tests/helpers.py
++++ /dev/null
+@@ -1,25 +0,0 @@
+-import asyncio
+-from unittest import mock
+-
+-
+-def AsyncMock(*args, **kwargs):
+-    """Return a mock asynchronous function."""
+-    m = mock.MagicMock(*args, **kwargs)
+-
+-    async def mock_coro(*args, **kwargs):
+-        return m(*args, **kwargs)
+-
+-    mock_coro.mock = m
+-    return mock_coro
+-
+-
+-def _run(coro):
+-    """Run the given coroutine."""
+-    return asyncio.get_event_loop().run_until_complete(coro)
+-
+-
+-def make_sync(coro):
+-    """Wrap a coroutine so that it can be executed by pytest."""
+-    def wrapper(*args, **kwargs):
+-        return _run(coro(*args, **kwargs))
+-    return wrapper
+diff --git a/tests/test_aioclient.py b/tests/test_aioclient.py
+index 01a772a..5ec12ff 100644
+--- a/tests/test_aioclient.py
++++ b/tests/test_aioclient.py
+@@ -1,15 +1,14 @@
+ import asyncio
+-import unittest
+ from unittest import mock
+ import pytest  # noqa: F401
+
+ from wsproto.events import AcceptConnection, CloseConnection, TextMessage, \
+     BytesMessage, Ping
+ import simple_websocket
+-from .helpers import make_sync, AsyncMock
+
+
+-class AioSimpleWebSocketClientTestCase(unittest.TestCase):
++@pytest.mark.asyncio
++class TestAioSimpleWebSocketClient:
+     async def get_client(self, mock_wsconn, url, events=[], subprotocols=None,
+                          headers=None):
+         mock_wsconn().events.side_effect = \
+@@ -19,11 +18,10 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+         return await simple_websocket.AioClient.connect(
+             url, subprotocols=subprotocols, headers=headers)
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_make_client(self, mock_wsconn, mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         client = await self.get_client(mock_wsconn, 'ws://example.com/ws?a=1')
+@@ -40,12 +38,11 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+         assert client.port == 80
+         assert client.path == '/ws?a=1'
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_make_client_subprotocol(self, mock_wsconn,
+                                            mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         client = await self.get_client(mock_wsconn, 'ws://example.com/ws?a=1',
+@@ -55,12 +52,11 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+             b"Request(host='example.com', target='/ws?a=1', extensions=[], "
+             b"extra_headers=[], subprotocols=['foo'])")
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_make_client_subprotocols(self, mock_wsconn,
+                                             mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         client = await self.get_client(mock_wsconn, 'ws://example.com/ws?a=1',
+@@ -70,12 +66,11 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+             b"Request(host='example.com', target='/ws?a=1', extensions=[], "
+             b"extra_headers=[], subprotocols=['foo', 'bar'])")
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_make_client_headers(self, mock_wsconn,
+                                        mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         client = await self.get_client(mock_wsconn, 'ws://example.com/ws?a=1',
+@@ -84,12 +79,11 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+             b"Request(host='example.com', target='/ws?a=1', extensions=[], "
+             b"extra_headers=[('Foo', 'Bar')], subprotocols=[])")
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_make_client_headers2(self, mock_wsconn,
+                                         mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         client = await self.get_client(
+@@ -100,11 +94,10 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+             b"extra_headers=[('Foo', 'Bar'), ('Foo', 'Baz')], "
+             b"subprotocols=[])")
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_send(self, mock_wsconn, mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         client = await self.get_client(mock_wsconn, 'ws://example.com/ws')
+@@ -123,11 +116,10 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+             b"Message(data=b'hello', frame_finished=True, "
+             b"message_finished=True)")
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_receive(self, mock_wsconn, mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         client = await self.get_client(
+@@ -142,12 +134,11 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+         assert await client.receive() == b'hello'
+         assert await client.receive(timeout=0) is None
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_receive_after_close(self, mock_wsconn,
+                                        mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         client = await self.get_client(
+@@ -160,11 +151,10 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+         with pytest.raises(simple_websocket.ConnectionClosed):
+             await client.receive()
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_receive_ping(self, mock_wsconn, mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+@@ -176,11 +166,11 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+             await asyncio.sleep(0.01)
+         wsock.write.assert_any_call(b"Pong(payload=b'hello')")
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_receive_empty(self, mock_wsconn, mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(side_effect=[b'x', b'x', b'']))
++        rsock = mock.MagicMock(read=mock.AsyncMock(
++            side_effect=[b'x', b'x', b'']))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         client = await self.get_client(
+@@ -193,11 +183,10 @@ class AioSimpleWebSocketClientTestCase(unittest.TestCase):
+         assert await client.receive() == 'hello'
+         assert await client.receive(timeout=0) is None
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_close(self, mock_wsconn, mock_open_connection):
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         client = await self.get_client(
+diff --git a/tests/test_aioserver.py b/tests/test_aioserver.py
+index a274019..071e035 100644
+--- a/tests/test_aioserver.py
++++ b/tests/test_aioserver.py
+@@ -1,15 +1,14 @@
+ import asyncio
+-import unittest
+ from unittest import mock
+ import pytest  # noqa: F401
+
+ from wsproto.events import Request, CloseConnection, TextMessage, \
+     BytesMessage, Ping, Pong
+ import simple_websocket
+-from .helpers import make_sync, AsyncMock
+
+
+-class AioSimpleWebSocketServerTestCase(unittest.TestCase):
++@pytest.mark.asyncio
++class TestAioSimpleWebSocketServer:
+     async def get_server(self, mock_wsconn, request, events=[],
+                          client_subprotocols=None, server_subprotocols=None,
+                          **kwargs):
+@@ -29,12 +28,11 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+         return await simple_websocket.AioServer.accept(
+             aiohttp=request, subprotocols=server_subprotocols, **kwargs)
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_aiohttp(self, mock_wsconn, mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         server = await self.get_server(mock_wsconn, mock_request)
+@@ -53,19 +51,17 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+             b'Sec-Websocket-Version: 13\r\n\r\n')
+         assert server.is_server
+
+-    @make_sync
+     async def test_invalid_request(self):
+         with pytest.raises(ValueError):
+             await simple_websocket.AioServer.accept(aiohttp='foo', asgi='bar')
+         with pytest.raises(ValueError):
+             await simple_websocket.AioServer.accept(asgi='bar', sock='baz')
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_send(self, mock_wsconn, mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         server = await self.get_server(mock_wsconn, mock_request)
+@@ -84,12 +80,11 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+             b"Message(data=b'hello', frame_finished=True, "
+             b"message_finished=True)")
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_receive(self, mock_wsconn, mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         server = await self.get_server(mock_wsconn, mock_request, events=[
+@@ -103,13 +98,12 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+         assert await server.receive() == b'hello'
+         assert await server.receive(timeout=0) is None
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_receive_after_close(self, mock_wsconn,
+                                        mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         server = await self.get_server(mock_wsconn, mock_request, events=[
+@@ -121,13 +115,12 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+         with pytest.raises(simple_websocket.ConnectionClosed):
+             await server.receive()
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_receive_split_messages(self, mock_wsconn,
+                                           mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         server = await self.get_server(mock_wsconn, mock_request, events=[
+@@ -151,12 +144,11 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+         assert await server.receive() == b'hello'
+         assert await server.receive(timeout=0) is None
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_receive_ping(self, mock_wsconn, mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         server = await self.get_server(mock_wsconn, mock_request, events=[
+@@ -166,12 +158,11 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+             await asyncio.sleep(0.01)
+         wsock.write.assert_any_call(b"Pong(payload=b'hello')")
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_receive_empty(self, mock_wsconn, mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         server = await self.get_server(mock_wsconn, mock_request, events=[
+@@ -183,12 +174,11 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+         assert await server.receive() == 'hello'
+         assert await server.receive(timeout=0) is None
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_receive_large(self, mock_wsconn, mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         server = await self.get_server(mock_wsconn, mock_request, events=[
+@@ -201,12 +191,11 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+         assert await server.receive() == 'hello'
+         assert await server.receive(timeout=0) is None
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_close(self, mock_wsconn, mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         server = await self.get_server(mock_wsconn, mock_request)
+@@ -222,7 +211,6 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+             b'CloseConnection(code=<CloseReason.NORMAL_CLOSURE: 1000>, '
+             b'reason=None)')
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     @mock.patch('simple_websocket.aiows.time')
+@@ -230,7 +218,7 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+     async def test_ping_pong(self, mock_wait_for, mock_time, mock_wsconn,
+                              mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock())
++        rsock = mock.MagicMock(read=mock.AsyncMock())
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+         server = await self.get_server(mock_wsconn, mock_request, events=[
+@@ -246,12 +234,11 @@ class AioSimpleWebSocketServerTestCase(unittest.TestCase):
+         assert wsock.write.call_args_list[2][0][0].startswith(b'Ping')
+         assert wsock.write.call_args_list[3][0][0].startswith(b'Close')
+
+-    @make_sync
+     @mock.patch('simple_websocket.aiows.asyncio.open_connection')
+     @mock.patch('simple_websocket.aiows.WSConnection')
+     async def test_subprotocols(self, mock_wsconn, mock_open_connection):
+         mock_request = mock.MagicMock(headers={})
+-        rsock = mock.MagicMock(read=AsyncMock(return_value=b'x'))
++        rsock = mock.MagicMock(read=mock.AsyncMock(return_value=b'x'))
+         wsock = mock.MagicMock()
+         mock_open_connection.return_value = (rsock, wsock)
+
+diff --git a/tests/test_server.py b/tests/test_server.py
+index 7be5d15..ca5fe99 100644
+--- a/tests/test_server.py
++++ b/tests/test_server.py
+@@ -92,7 +92,7 @@ class SimpleWebSocketServerTestCase(unittest.TestCase):
+             b"message_finished=True)")
+         server.connected = True
+         server.send(b'hello')
+-        mock_socket.send.assert_called_with(
++        mock_socket.send.assert_any_call(
+             b"Message(data=b'hello', frame_finished=True, "
+             b"message_finished=True)")
+
diff --git a/meta-python/recipes-devtools/python/python3-simple-websocket_1.1.0.bb b/meta-python/recipes-devtools/python/python3-simple-websocket_1.1.0.bb
new file mode 100644
index 0000000000..35c568cf7c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simple-websocket_1.1.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Simple WebSocket server and client for Python"
+HOMEPAGE = "https://github.com/miguelgrinberg/simple-websocket"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9d272c9fe2437531b5bbecf4fcc82e24"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+SRC_URI += "file://0001-Async-test-improvements-for-Python-3.14-48.patch"
+SRC_URI[sha256sum] = "7939234e7aa067c534abdab3a9ed933ec9ce4691b0713c78acb195560aa52ae4"
+
+RDEPENDS:${PN} += " \
+    python3-asyncio \
+    python3-io \
+    python3-wsproto \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest-asyncio \
+"
