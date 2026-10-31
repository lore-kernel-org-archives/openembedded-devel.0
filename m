Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.766.1793419255346126379
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 21:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lzD4txh/;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a1947498bso936854eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 21:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419255; x=1794024055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xOnGgJz5g1zyw+Bw3pRRXBN336l6W37gp+RkHqk9kQw=;
        b=lzD4txh/sayghK7wWZY4GiYvzYxUwAvjmnnRJyQXMDvhx6DH1fwPYdB20eqRWwf/H6
         ldPZ44HEqZi9PysSgUm7w7MsqHJTNguiUoUW9lyhG4Q0BSwBldnwO5QQhFtZWAE8sX33
         HU3wWkI27mApwEEUNOB+2JzjqMJiwxFfOtPlLI8CNufHp2v4YZlIKhcJhbDaCWIcMXra
         U4ARERM7cAbsL5yRdSzyWDYO50ahMBNohQ66UnguxF+WbcvMTQMyld2kL0j7YQgFQYRP
         CmAWMDKrhnpqrBcHQOZRWfvRCrHa0O3BYDmMG03tgBCWWiUUsiF8/QBLPvXN+Jr7gd5s
         V8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419255; x=1794024055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOnGgJz5g1zyw+Bw3pRRXBN336l6W37gp+RkHqk9kQw=;
        b=xMFyZOFIaS5JW/K00ZGBu4amvjppnjVIOKAWtenAZaZSAdP6u4oyA6MLfLZhJ1OTHi
         9Iq7siZqFPKWValcQOOeAxD2ENunkGSCXmvGNfx5gYEhYQC6vHdQ3fy1iXm5Lp6cRlpu
         1McUnvwYfz6O9ZggeDzx3rqulFv+ni7GRBJAE+Gh+Gg2b5msZNeWysSr4tgjNGhRy06J
         obfXOaXuT+5fdeUdOmjBDfZnbGRms98ggJuD3w4Hb1oLOmO1D+Fjat0kk3hFfaQevFH3
         oNlIqzu/nM00ORRUk+KGhIyqudTVrqAen04qgLkW4c2NAgEhzhERL/n0SCposyOpXZS4
         EqIw==
X-Gm-Message-State: AFq9FYLYdFG9UUXeDyATpqMJ+1wLygYhruYZCsFNlRYUqb7FMAWGSnkP
	GpCD7RaAO9lI0/8agu6rr7oqyRcCtbqBfXQQERiLrywm/JvWdYOimpLdNmJJYufG7F8=
X-Gm-Gg: AYBFou3KaNxiDj+o06XbBtVyqn2nzlYeZjwlius2qwXexjm7PjIYc72LlGTKLFG0dJi
	zFdoGNK3sLclRCgY6pNo3D7xDnJUfZuyw2GQLFHBaJoOxffv4co/VInenJDdzMe/ibore42fhwU
	ARcGhB83pMz0u9PpyTTv2pFTx8cKHjw3eXFfO5W7xPuP5L0DPeRQdIKKo6jrsM9J2N5BapleEo6
	2tW8GpRygS1L2Y59eZ6z1CfcdVdBJTaKc1RJfMB8t0BrU6mmVBjJxq1HRwDUfaHnWQKxYaZKR6X
	gxkk/YRNcOxeFAplGORg5ESstF6if3k3f3sCS9KCR2gacsBgb3d7TNCeubDlPazJk35c2nbeZZE
	oH83nOpbtduo6iRt4/qTCz2U4GR7DWQUrBXvJmIlY4AK00ATiQAn382iLnYP3FkzDNf/SXy6wqi
	x8pu0tyEYp2C3hio96qxqynbgsBYZ10LHyxVRzRRKFeGODbPrYKx5wvl+tHxF0NezMlZ7+wCUPx
	/v2cmBuOhj++yvf2r5SMMGETqU0JQnlHq0kBECTz7FlekHNOlKqhYrZTGvdhvlIhylFMdCzquMf
	qDrOlzepsGjEhUX6N+/2C8s/YK12GguPhnbvZsrJ6RbSE/uISwBLc2/wEFpaA15+EpZeUkoTHNx
	5oriOveWMhIosVHcVj23auxLPvgm1mOfGAuJpxbSzdIotfC/VxT7WjQsQvI7s9AWbBtp9IgOQpS
	Uw8KwkFtT6fe3xv7rTq4oKL3MYG7KD6VWeMlxnfYLf+fSQ4nM4tbCH5t9pcr2GrClCs0yjNm2sp
	/XpHYkHQFKO29Ihk5ZBW0/QScyYb9tROWv0w17ftE7+YTENerSFxkTwWm6es1zZj4grTpLegyMB
	j3Dg
X-Received: by 2002:a05:693c:41c2:20b0:36a:5042:85b1 with SMTP id 5a478bee46e88-36a50428d57mr2326663eec.2.1793419254520;
        Fri, 30 Oct 2026 21:00:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm11853728eec.28.2026.10.30.21.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:00:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/3] python3-simple-websocket: Do not need network access in client ptests
Date: Fri, 30 Oct 2026 21:00:49 -0700
Message-ID: <20261031040051.2131713-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 04:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131721
Content-Type: text/plain; charset="utf-8"

The client unit tests mock socket.socket but not socket.getaddrinfo(), so
every test resolves example.com. Without working DNS in the image (e.g.
yoe-musl-sysvinit qemux86-64) all of tests/test_client.py fails.

Backport the upstream fix that uses localhost instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ess-requirement-in-client-unit-tests.patch | 141 ++++++++++++++++++
 .../python/python3-simple-websocket_1.1.0.bb  |   4 +-
 2 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-simple-websocket/0002-Removed-net-access-requirement-in-client-unit-tests.patch

diff --git a/meta-python/recipes-devtools/python/python3-simple-websocket/0002-Removed-net-access-requirement-in-client-unit-tests.patch b/meta-python/recipes-devtools/python/python3-simple-websocket/0002-Removed-net-access-requirement-in-client-unit-tests.patch
new file mode 100644
index 0000000000..7266ee57f3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simple-websocket/0002-Removed-net-access-requirement-in-client-unit-tests.patch
@@ -0,0 +1,141 @@
+From 159e030c7c23060de989cebec6d98d776c75bcbd Mon Sep 17 00:00:00 2001
+From: Miguel Grinberg <miguel.grinberg@gmail.com>
+Date: Sun, 13 Oct 2024 15:11:39 +0100
+Subject: [PATCH] Removed net access requirement in client unit tests (Fixes
+ #40)
+
+Upstream-Status: Backport [https://github.com/miguelgrinberg/simple-websocket/commit/159e030c7c23060de989cebec6d98d776c75bcbd]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/test_client.py | 34 +++++++++++++++++-----------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/tests/test_client.py b/tests/test_client.py
+index d986520..898b423 100644
+--- a/tests/test_client.py
++++ b/tests/test_client.py
+@@ -22,16 +22,16 @@ def get_client(self, mock_wsconn, url, events=[], subprotocols=None,
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_make_client(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.return_value = b'x'
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws?a=1')
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws?a=1')
+         assert client.sock == mock_socket()
+         assert client.receive_bytes == 4096
+         assert client.input_buffer == []
+         assert client.event.__class__.__name__ == 'Event'
+         client.sock.send.assert_called_with(
+-            b"Request(host='example.com', target='/ws?a=1', extensions=[], "
++            b"Request(host='localhost', target='/ws?a=1', extensions=[], "
+             b"extra_headers=[], subprotocols=[])")
+         assert not client.is_server
+-        assert client.host == 'example.com'
++        assert client.host == 'localhost'
+         assert client.port == 80
+         assert client.path == '/ws?a=1'
+
+@@ -39,42 +39,42 @@ def test_make_client(self, mock_wsconn, mock_socket):
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_make_client_subprotocol(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.return_value = b'x'
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws?a=1',
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws?a=1',
+                                  subprotocols='foo')
+         assert client.subprotocols == ['foo']
+         client.sock.send.assert_called_with(
+-            b"Request(host='example.com', target='/ws?a=1', extensions=[], "
++            b"Request(host='localhost', target='/ws?a=1', extensions=[], "
+             b"extra_headers=[], subprotocols=['foo'])")
+
+     @mock.patch('simple_websocket.ws.socket.socket')
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_make_client_subprotocols(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.return_value = b'x'
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws?a=1',
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws?a=1',
+                                  subprotocols=['foo', 'bar'])
+         assert client.subprotocols == ['foo', 'bar']
+         client.sock.send.assert_called_with(
+-            b"Request(host='example.com', target='/ws?a=1', extensions=[], "
++            b"Request(host='localhost', target='/ws?a=1', extensions=[], "
+             b"extra_headers=[], subprotocols=['foo', 'bar'])")
+
+     @mock.patch('simple_websocket.ws.socket.socket')
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_make_client_headers(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.return_value = b'x'
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws?a=1',
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws?a=1',
+                                  headers={'Foo': 'Bar'})
+         client.sock.send.assert_called_with(
+-            b"Request(host='example.com', target='/ws?a=1', extensions=[], "
++            b"Request(host='localhost', target='/ws?a=1', extensions=[], "
+             b"extra_headers=[('Foo', 'Bar')], subprotocols=[])")
+
+     @mock.patch('simple_websocket.ws.socket.socket')
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_make_client_headers2(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.return_value = b'x'
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws?a=1',
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws?a=1',
+                                  headers=[('Foo', 'Bar'), ('Foo', 'Baz')])
+         client.sock.send.assert_called_with(
+-            b"Request(host='example.com', target='/ws?a=1', extensions=[], "
++            b"Request(host='localhost', target='/ws?a=1', extensions=[], "
+             b"extra_headers=[('Foo', 'Bar'), ('Foo', 'Baz')], "
+             b"subprotocols=[])")
+
+@@ -82,7 +82,7 @@ def test_make_client_headers2(self, mock_wsconn, mock_socket):
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_send(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.return_value = b'x'
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws')
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws')
+         while client.connected:
+             time.sleep(0.01)
+         with pytest.raises(simple_websocket.ConnectionClosed):
+@@ -102,7 +102,7 @@ def test_send(self, mock_wsconn, mock_socket):
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_receive(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.return_value = b'x'
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws', events=[
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws', events=[
+             [TextMessage('hello')],
+             [BytesMessage(b'hello')],
+         ])
+@@ -117,7 +117,7 @@ def test_receive(self, mock_wsconn, mock_socket):
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_receive_after_close(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.return_value = b'x'
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws', events=[
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws', events=[
+             [TextMessage('hello')],
+         ])
+         while client.connected:
+@@ -130,7 +130,7 @@ def test_receive_after_close(self, mock_wsconn, mock_socket):
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_receive_ping(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.return_value = b'x'
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws', events=[
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws', events=[
+             [Ping(b'hello')],
+         ])
+         while client.connected:
+@@ -141,7 +141,7 @@ def test_receive_ping(self, mock_wsconn, mock_socket):
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_receive_empty(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.side_effect = [b'x', b'x', b'']
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws', events=[
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws', events=[
+             [TextMessage('hello')],
+         ])
+         while client.connected:
+@@ -154,7 +154,7 @@ def test_receive_empty(self, mock_wsconn, mock_socket):
+     @mock.patch('simple_websocket.ws.WSConnection')
+     def test_close(self, mock_wsconn, mock_socket):
+         mock_socket.return_value.recv.return_value = b'x'
+-        client = self.get_client(mock_wsconn, 'ws://example.com/ws')
++        client = self.get_client(mock_wsconn, 'ws://localhost/ws')
+         while client.connected:
+             time.sleep(0.01)
+         with pytest.raises(simple_websocket.ConnectionClosed):
diff --git a/meta-python/recipes-devtools/python/python3-simple-websocket_1.1.0.bb b/meta-python/recipes-devtools/python/python3-simple-websocket_1.1.0.bb
index 35c568cf7c..2438495dd3 100644
--- a/meta-python/recipes-devtools/python/python3-simple-websocket_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-simple-websocket_1.1.0.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9d272c9fe2437531b5bbecf4fcc82e24"

 inherit pypi python_setuptools_build_meta ptest-python-pytest

-SRC_URI += "file://0001-Async-test-improvements-for-Python-3.14-48.patch"
+SRC_URI += "file://0001-Async-test-improvements-for-Python-3.14-48.patch \
+           file://0002-Removed-net-access-requirement-in-client-unit-tests.patch \
+           "
 SRC_URI[sha256sum] = "7939234e7aa067c534abdab3a9ed933ec9ce4691b0713c78acb195560aa52ae4"

 RDEPENDS:${PN} += " \
