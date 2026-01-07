Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5F3CD0432
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:28:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2385.1767778073900406402
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BE1qd5Mq;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so15699045e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767778072; x=1768382872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/0eiwOvhbF1KEvNrTA/vgsGE/488VttoRooQIzvib0=;
        b=BE1qd5Mqy54MKNreVNFK9kG88AD6ubAJ4vE9GAEh7iU4K4hwsd2rXHHwxf0IZpaYiX
         9gGsLeuAMhd3pcGixK1R2PJffBX0yII5KhkESMRJpLxiW/38kTMtVgFZhgteeQ+UeCJD
         WmnkWDj+XMar1Mib01604+jaSjKzaYiX81Z3S8LuullmxlUTIO/uF1wMEG0vtFvO2RtM
         DOyUfeOVmExm0lE6DdP2G7tdWfHb0Gumk6Hc7sXicmNtlJCxEw8tlrUp5T6XnQ/K/Ee/
         yVh+vYBR7xAuJ1F4vX9Q15Ja35YZaPBO29lqkmS1DqptBFjymi9CvnvaHF7ZYt6GxcNL
         gj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778072; x=1768382872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/0eiwOvhbF1KEvNrTA/vgsGE/488VttoRooQIzvib0=;
        b=v2Ky9K//3eTQVv5AmKaisL3TYU6DRkpEvfEqdDCu1+yK9xu9vlXkvDzULT4PMbTb+K
         Tm8m+gj1P05g8RnpM8k5kSZtk+PLTvhsTbYXCE6+vAkqm9xAPTf7uTEvkCq38lRIiUl5
         qaoXK9M5mhzc9nmfIIuPXaj2nUKFbQM+U5/d9HQk+Iqn/JPxZcBP9Ls2J6O2mKrL8h8H
         fiLte0hezecHAJMIwPWCUrNQA09CJdDqgpSf9Nt4H6hJrurnrMt2UYyW0o14NDbsWBSb
         ev01SMbw3lcveh5O9EbNhTuywdAhhVOCH/tqyGLZVca0Bne8nkS3d3RCk7b9b5Rvlp/V
         PFFA==
X-Gm-Message-State: AOJu0YwgPWoEvxiB3+ZzkGq1KsFmpFiNy6iRJVB1Y35fxxyoGorqy6oh
	JEHOazdb+pLR8iYkEsVbzfGVl8lvw7iJq4meIZFEU8mvDa5mnOfBlvpvMvHx3g==
X-Gm-Gg: AY/fxX4hritmtvyQ5b79UCxvRndMcUeE7Ev/M9CahHawuqzMLaYC3sABczebelXPzgK
	3kNmJqxjVt1qWJI5cs1yWQiKlgMc5CKqvkVHK3SRvyZdmWRZgzHytTONhPLVMqqZaBM4mxBGMUH
	y8KXBmU+MF0/xpv0dN5aboro4RCKj4dsOTDujPidy4qIEVaosR8mX7bIhcVB6CQt05ltzBgmfp+
	Vtq8qnfD6BYGDlRC8ZG3fVafraRf6ViwfljCRj3UMBx0CbLcXKYnNlpD626OMxlZpAIfgGZuSLO
	GW2N66McPnMFRSeJ15+zpTx6A8wSucORCSGZrXS5HGfxZw448bw1epyx0h3Bc8hX+fh/y1mlzeM
	dmZJZse5hMARrALYdY7Oemb96Me/Dx4E3a2TPhGL7TI0kLzqZNN+e7xViGszB/Y+4MXLWEdUhpR
	NZz1I03ISO
X-Google-Smtp-Source: AGHT+IFPe3yigz2cAAUpjvgM33l47jxVh6MtzExGugzd4NTfgIQzWjqappZ6DL2irEHZTB5qnPQr4w==
X-Received: by 2002:a5d:5d02:0:b0:42b:2fb5:73c9 with SMTP id ffacd0b85a97d-432c3775aecmr2110884f8f.58.1767778071974;
        Wed, 07 Jan 2026 01:27:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719d057sm7236255e9.16.2026.01.07.01.27.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:27:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/5] python3-waitress: patch CVE-2024-49768
Date: Wed,  7 Jan 2026 10:27:46 +0100
Message-ID: <20260107092748.1930960-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107092748.1930960-1-skandigraun@gmail.com>
References: <20260107092748.1930960-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123186

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-49768

Pick the patch mentioned in the NVD report (which is a merge commit,
and the patches here are the individual commits from that merge)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-waitress/CVE-2024-49768-1.patch   | 162 ++++++++++++++++++
 .../python3-waitress/CVE-2024-49768-2.patch   |  89 ++++++++++
 .../python3-waitress/CVE-2024-49768-3.patch   |  60 +++++++
 .../python3-waitress/CVE-2024-49768-4.patch   |  34 ++++
 .../python/python3-waitress_2.1.2.bb          |   5 +
 5 files changed, 350 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-4.patch

diff --git a/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-1.patch b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-1.patch
new file mode 100644
index 0000000000..5d80a267fd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-1.patch
@@ -0,0 +1,162 @@
+From f2ffe56f990a74450143901ac1cfd7138f75ec78 Mon Sep 17 00:00:00 2001
+From: Delta Regeer <bertjw@regeer.org>
+Date: Sat, 26 Oct 2024 22:10:36 -0600
+Subject: [PATCH] Make DummySock() look more like an actual socket
+
+This forces DummySock() to look like a properly connected socket where
+there is a buffer that is read from by the remote, and a buffer that is
+written to by the remote.
+
+The local side does the opposite, this way data written by the local
+side can be read by the remote without operating on the same buffer.
+
+CVE: CVE-2024-49768
+Upstream-Status: Backport [https://github.com/Pylons/waitress/commit/6943dcf556610ece2ff3cddb39e59a05ef110661]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/test_channel.py | 57 +++++++++++++++++++++++++++++++++----------
+ 1 file changed, 44 insertions(+), 13 deletions(-)
+
+diff --git a/tests/test_channel.py b/tests/test_channel.py
+index 8467ae7..7d677e9 100644
+--- a/tests/test_channel.py
++++ b/tests/test_channel.py
+@@ -18,7 +18,7 @@ class TestHTTPChannel(unittest.TestCase):
+         map = {}
+         inst = self._makeOne(sock, "127.0.0.1", adj, map=map)
+         inst.outbuf_lock = DummyLock()
+-        return inst, sock, map
++        return inst, sock.local(), map
+ 
+     def test_ctor(self):
+         inst, _, map = self._makeOneWithMap()
+@@ -218,7 +218,7 @@ class TestHTTPChannel(unittest.TestCase):
+         def send(_):
+             return 0
+ 
+-        sock.send = send
++        sock.remote.send = send
+ 
+         wrote = inst.write_soon(b"a")
+         self.assertEqual(wrote, 1)
+@@ -236,7 +236,7 @@ class TestHTTPChannel(unittest.TestCase):
+         def send(_):
+             return 0
+ 
+-        sock.send = send
++        sock.remote.send = send
+ 
+         outbufs = inst.outbufs
+         wrote = inst.write_soon(wrapper)
+@@ -270,7 +270,7 @@ class TestHTTPChannel(unittest.TestCase):
+         def send(_):
+             return 0
+ 
+-        sock.send = send
++        sock.remote.send = send
+ 
+         inst.adj.outbuf_high_watermark = 3
+         inst.current_outbuf_count = 4
+@@ -286,7 +286,7 @@ class TestHTTPChannel(unittest.TestCase):
+         def send(_):
+             return 0
+ 
+-        sock.send = send
++        sock.remote.send = send
+ 
+         inst.adj.outbuf_high_watermark = 3
+         inst.total_outbufs_len = 4
+@@ -315,7 +315,7 @@ class TestHTTPChannel(unittest.TestCase):
+             inst.connected = False
+             raise Exception()
+ 
+-        sock.send = send
++        sock.remote.send = send
+ 
+         inst.adj.outbuf_high_watermark = 3
+         inst.total_outbufs_len = 4
+@@ -345,7 +345,7 @@ class TestHTTPChannel(unittest.TestCase):
+             inst.connected = False
+             raise Exception()
+ 
+-        sock.send = send
++        sock.remote.send = send
+ 
+         wrote = inst.write_soon(b"xyz")
+         self.assertEqual(wrote, 3)
+@@ -376,7 +376,7 @@ class TestHTTPChannel(unittest.TestCase):
+         inst.total_outbufs_len = len(inst.outbufs[0])
+         inst.adj.send_bytes = 1
+         inst.adj.outbuf_high_watermark = 2
+-        sock.send = lambda x, do_close=True: False
++        sock.remote.send = lambda x, do_close=True: False
+         inst.will_close = False
+         inst.last_activity = 0
+         result = inst.handle_write()
+@@ -400,7 +400,7 @@ class TestHTTPChannel(unittest.TestCase):
+ 
+     def test__flush_some_full_outbuf_socket_returns_zero(self):
+         inst, sock, map = self._makeOneWithMap()
+-        sock.send = lambda x: False
++        sock.remote.send = lambda x: False
+         inst.outbufs[0].append(b"abc")
+         inst.total_outbufs_len = sum(len(x) for x in inst.outbufs)
+         result = inst._flush_some()
+@@ -907,7 +907,8 @@ class DummySock:
+     closed = False
+ 
+     def __init__(self):
+-        self.sent = b""
++        self.local_sent = b""
++        self.remote_sent = b""
+ 
+     def setblocking(self, *arg):
+         self.blocking = True
+@@ -925,14 +926,44 @@ class DummySock:
+         self.closed = True
+ 
+     def send(self, data):
+-        self.sent += data
++        self.remote_sent += data
+         return len(data)
+ 
+     def recv(self, buffer_size):
+-        result = self.sent[:buffer_size]
+-        self.sent = self.sent[buffer_size:]
++        result = self.local_sent[:buffer_size]
++        self.local_sent = self.local_sent[buffer_size:]
+         return result
+ 
++    def local(self):
++        outer = self
++
++        class LocalDummySock:
++            def send(self, data):
++                outer.local_sent += data
++                return len(data)
++
++            def recv(self, buffer_size):
++                result = outer.remote_sent[:buffer_size]
++                outer.remote_sent = outer.remote_sent[buffer_size:]
++                return result
++
++            def close(self):
++                outer.closed = True
++
++            @property
++            def sent(self):
++                return outer.remote_sent
++
++            @property
++            def closed(self):
++                return outer.closed
++
++            @property
++            def remote(self):
++                return outer
++
++        return LocalDummySock()
++
+ 
+ class DummyLock:
+     notified = False
diff --git a/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-2.patch b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-2.patch
new file mode 100644
index 0000000000..88d6aba0e2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-2.patch
@@ -0,0 +1,89 @@
+From 7f40812194ebbf189692f530422204b41204eecb Mon Sep 17 00:00:00 2001
+From: Delta Regeer <bertjw@regeer.org>
+Date: Sat, 26 Oct 2024 22:12:14 -0600
+Subject: [PATCH] Add a new test to validate the lookahead race condition
+
+CVE: CVE-2024-49768
+Upstream-Status: Backport [https://github.com/Pylons/waitress/commit/6943dcf556610ece2ff3cddb39e59a05ef110661]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/test_channel.py | 55 ++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 54 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test_channel.py b/tests/test_channel.py
+index 7d677e9..d798091 100644
+--- a/tests/test_channel.py
++++ b/tests/test_channel.py
+@@ -805,11 +805,12 @@ class TestHTTPChannelLookahead(TestHTTPChannel):
+         )
+         return [body]
+ 
+-    def _make_app_with_lookahead(self):
++    def _make_app_with_lookahead(self, recv_bytes=8192):
+         """
+         Setup a channel with lookahead and store it and the socket in self
+         """
+         adj = DummyAdjustments()
++        adj.recv_bytes = recv_bytes
+         adj.channel_request_lookahead = 5
+         channel, sock, map = self._makeOneWithMap(adj=adj)
+         channel.server.application = self.app_check_disconnect
+@@ -901,6 +902,58 @@ class TestHTTPChannelLookahead(TestHTTPChannel):
+         self.assertEqual(data.split("\r\n")[-1], "finished")
+         self.assertEqual(self.request_body, b"x")
+ 
++    def test_lookahead_bad_request_drop_extra_data(self):
++        """
++        Send two requests, the first one being bad, split on the recv_bytes
++        limit, then emulate a race that could happen whereby we read data from
++        the socket while the service thread is cleaning up due to an error
++        processing the request.
++        """
++
++        invalid_request = [
++            "GET / HTTP/1.1",
++            "Host: localhost:8080",
++            "Content-length: -1",
++            "",
++        ]
++
++        invalid_request_len = len("".join([x + "\r\n" for x in invalid_request]))
++
++        second_request = [
++            "POST / HTTP/1.1",
++            "Host: localhost:8080",
++            "Content-Length: 1",
++            "",
++            "x",
++        ]
++
++        full_request = invalid_request + second_request
++
++        self._make_app_with_lookahead(recv_bytes=invalid_request_len)
++        self._send(*full_request)
++        self.channel.handle_read()
++        self.assertEqual(len(self.channel.requests), 1)
++        self.channel.server.tasks[0].service()
++        self.assertTrue(self.channel.close_when_flushed)
++        # Read all of the next request
++        self.channel.handle_read()
++        self.channel.handle_read()
++        # Validate that there is no more data to be read
++        self.assertEqual(self.sock.remote.local_sent, b"")
++        # Validate that we dropped the data from the second read, and did not
++        # create a new request
++        self.assertEqual(len(self.channel.requests), 0)
++        data = self.sock.recv(256).decode("ascii")
++        self.assertFalse(self.channel.readable())
++        self.assertTrue(self.channel.writable())
++
++        # Handle the write, which will close the socket
++        self.channel.handle_write()
++        self.assertTrue(self.sock.closed)
++
++        data = self.sock.recv(256)
++        self.assertEqual(len(data), 0)
++
+ 
+ class DummySock:
+     blocking = False
diff --git a/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-3.patch b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-3.patch
new file mode 100644
index 0000000000..086c569233
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-3.patch
@@ -0,0 +1,60 @@
+From 5cf72c7d9f60e96a3ca65e410098e11d8053749d Mon Sep 17 00:00:00 2001
+From: Delta Regeer <bertjw@regeer.org>
+Date: Sat, 26 Oct 2024 22:13:08 -0600
+Subject: [PATCH] Fix a race condition on recv_bytes boundary when request is
+ invalid
+
+A remote client may send a request that is exactly recv_bytes long,
+followed by a secondary request using HTTP pipelining.
+
+When request lookahead is disabled (default) we won't read any more
+requests, and when the first request fails due to a parsing error, we
+simply close the connection.
+
+However when request lookahead is enabled, it is possible to process and
+receive the first request, start sending the error message back to the
+client while we read the next request and queue it. This will allow the
+secondar request to be serviced by the worker thread while the
+connection should be closed.
+
+The fix here checks if we should not have read the data in the first
+place (because the conection is going to be torn down) while we hold the
+`requests_lock` which means the service thread can't be in the middle of
+flipping the `close_when_flushed` flag.
+
+CVE: CVE-2024-49768
+Upstream-Status: Backport [https://github.com/Pylons/waitress/commit/f4ba1c260cf17156b582c6252496213ddc96b591]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/waitress/channel.py | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/waitress/channel.py b/src/waitress/channel.py
+index eb59dd3..756adce 100644
+--- a/src/waitress/channel.py
++++ b/src/waitress/channel.py
+@@ -147,7 +147,7 @@ class HTTPChannel(wasyncore.dispatcher):
+         # 1. We're not already about to close the connection.
+         # 2. We're not waiting to flush remaining data before closing the
+         #    connection
+-        # 3. There are not too many tasks already queued
++        # 3. There are not too many tasks already queued (if lookahead is enabled)
+         # 4. There's no data in the output buffer that needs to be sent
+         #    before we potentially create a new task.
+ 
+@@ -203,6 +203,15 @@ class HTTPChannel(wasyncore.dispatcher):
+             return False
+ 
+         with self.requests_lock:
++            # Don't bother processing anymore data if this connection is about
++            # to close. This may happen if readable() returned True, on the
++            # main thread before the service thread set the close_when_flushed
++            # flag, and we read data but our service thread is attempting to
++            # shut down the connection due to an error. We want to make sure we
++            # do this while holding the request_lock so that we can't race
++            if self.will_close or self.close_when_flushed:
++                return False
++
+             while data:
+                 if self.request is None:
+                     self.request = self.parser_class(self.adj)
diff --git a/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-4.patch b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-4.patch
new file mode 100644
index 0000000000..11c9dd4ccd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49768-4.patch
@@ -0,0 +1,34 @@
+From c516dad4f749d1b1b1c675680a76c1f6d2523857 Mon Sep 17 00:00:00 2001
+From: Delta Regeer <bertjw@regeer.org>
+Date: Sat, 26 Oct 2024 22:22:32 -0600
+Subject: [PATCH] Add documentation for channel_request_lookahead
+
+CVE: CVE-2024-49768
+Upstream-Status: Backport [https://github.com/Pylons/waitress/commit/810a435f9e9e293bd3446a5ce2df86f59c4e7b1b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ docs/arguments.rst | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/docs/arguments.rst b/docs/arguments.rst
+index f9b9310..ba1797a 100644
+--- a/docs/arguments.rst
++++ b/docs/arguments.rst
+@@ -301,3 +301,17 @@ url_prefix
+     be stripped of the prefix.
+ 
+     Default: ``''``
++
++channel_request_lookahead
++    Sets the amount of requests we can continue to read from the socket, while
++    we are processing current requests. The default value won't allow any
++    lookahead, increase it above ``0`` to enable.
++
++    When enabled this inserts a callable ``waitress.client_disconnected`` into
++    the environment that allows the task to check if the client disconnected
++    while waiting for the response at strategic points in the execution and to
++    cancel the operation.
++
++    Default: ``0``
++
++    .. versionadded:: 2.0.0
diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb b/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
index 061586b5df..dbb8b05e52 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
@@ -10,6 +10,11 @@ RDEPENDS:${PN} += " \
         python3-logging \
 "
 
+SRC_URI += "file://CVE-2024-49768-1.patch \
+           file://CVE-2024-49768-2.patch \
+           file://CVE-2024-49768-3.patch \
+           file://CVE-2024-49768-4.patch \
+           "
 SRC_URI[sha256sum] = "780a4082c5fbc0fde6a2fcfe5e26e6efc1e8f425730863c04085769781f51eba"
 
 inherit python_setuptools_build_meta pypi

