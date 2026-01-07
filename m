Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479E5CF6C1F
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:28:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2339.1767778074771869100
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j9DUUEQP;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477563e28a3so4501285e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767778073; x=1768382873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsMuwsLlP+tiZV+eGtJSNGo1a2WKJi2fB31tky09xS0=;
        b=j9DUUEQPyDjIA2GxV3CnggNWprCJ5zHaBqlGdJ/dazMRAQYMg3FeG3G57H2CjAcCNk
         lTBImm7FQmNjf+4GVZK+nIQjmK1e4lj96BmlfEKoPcEb6YKOZvCCr8I7ngci8D8ERfKS
         bU/OiunkBQtHpakJlZjXrnhJG14PJKTlaVXwQZNcX3lG/7OdFLEg5wcCVDiYkYvXF8NL
         Wt4J9fmzFvkyzX6OHegQZu1LfNthJ5BU1nCiQkixZ1DbeE1EG5JmnJnTq+9OeyP5N9Kp
         zGOweBFdUiXO6XZBn3XTiN2Q5d1DGPw+/oBEjn8UeOdjZfyLJwNO8IU8ZB2f3Z+O16Z6
         Hfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778073; x=1768382873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PsMuwsLlP+tiZV+eGtJSNGo1a2WKJi2fB31tky09xS0=;
        b=YDVVJrzZZ8EQX8Vv4SU900oVbInXvLWlG1AIiyEo8xJVC0NrLhUW5n+vUqK4+0TCQ7
         HGIGUmJCP390eVduNWaVaCIsXURitqXR4MT4aJ47HgRhaT/D5bt064qutXegjV3/HgvP
         ddxqAf+nTQ60Kj2EvaqpLQyIRXcBl6BygXuXgIeg2Ej0/m1kN/rtdx/m3y2/4XFVB/rp
         rP4g/mT1/tUz7mYX0gDzRMIT0qeojgll9V+t/hWU5XJxtDDX06cQ30glAoZIow2TGxxG
         iO1dEJ/BqwoAd2UQdyrIENtzYHLlOcXK0Sb6GesBMo5qRb7q+/K9sApxknm2zMMfDfUk
         28/A==
X-Gm-Message-State: AOJu0YwHQm5K9q3wwMmautIJ8GUodPISPpDryDBklDbe12AuE8a25Q3F
	dbTIL5kS/C1gqUcEaEZoCOftM9mAt4JysgFLVRO7SWdNeh+nAL5o2wQWODmcWA==
X-Gm-Gg: AY/fxX7u+YL4RY7mQUR2xi9iwyHPhEIfzVbhFRJBgw+NoGcSgk3y62a/zvmudyuvywH
	tOARx+er1wABxmhKIRuFWBDknjklldhHQOG8yCqyjz7BgoLPBiVN6KqJmuVlBjNz0b7o++pl1jm
	pTEB7SFiJ+c/vUV6cpc80B/BUkV5S9eKVuRQNgQEv+PV1K43WHu9I5A87NHYFuugc3jX4t4lMKi
	RPpUQtkdTsnrB+ZBPRnZLiMtb3rX5D8jD11TPZGtbH+9pVGsfKM7MhV98t+43cH9b5OIgH2t+Ed
	Ww/mOu78bF0khcjOvubsoJChyl+53vfDWeA66b/98MCXLEEVkcgWAe3Gz1WFNvBnkcO4+PNp0ze
	SbzSMk6muwqNoDg+GM5qqbc7foJBWdP3Y7c52ZqHiqqPxhIK6REANtvqKbmh/xFi84L4B+uriAe
	cj0adLjabLeOZ27pNIOow=
X-Google-Smtp-Source: AGHT+IGVbhCZuh7SxSkm3WZGjgW5qoQOasOHBuXO2hCuybG6Wc89FVPktAgkuSRTW+dpGdVhOtsVLw==
X-Received: by 2002:a05:600c:4ec7:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-47d8483cc5cmr21645465e9.2.1767778072978;
        Wed, 07 Jan 2026 01:27:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719d057sm7236255e9.16.2026.01.07.01.27.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:27:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 4/5] python3-waitress: patch CVE-2024-49769
Date: Wed,  7 Jan 2026 10:27:47 +0100
Message-ID: <20260107092748.1930960-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107092748.1930960-1-skandigraun@gmail.com>
References: <20260107092748.1930960-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123187

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-49769

Pick the patch that is referenced in the NVD report (which is
a merge commit. The patches here are the individual patches from
that merge).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-waitress/CVE-2024-49769-1.patch   |  27 +++
 .../python3-waitress/CVE-2024-49769-2.patch   |  53 +++++
 .../python3-waitress/CVE-2024-49769-3.patch   |  34 +++
 .../python3-waitress/CVE-2024-49769-4.patch   |  34 +++
 .../python3-waitress/CVE-2024-49769-5.patch   | 211 ++++++++++++++++++
 .../python3-waitress/CVE-2024-49769-6.patch   |  41 ++++
 .../python/python3-waitress_2.1.2.bb          |   6 +
 7 files changed, 406 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-5.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-6.patch

diff --git a/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-1.patch b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-1.patch
new file mode 100644
index 0000000000..a8a0a2e594
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-1.patch
@@ -0,0 +1,27 @@
+From fdabcb31093507f50fcaeb46012ec8df8bf76359 Mon Sep 17 00:00:00 2001
+From: Delta Regeer <bertjw@regeer.org>
+Date: Sun, 3 Mar 2024 16:15:51 -0700
+Subject: [PATCH] HTTPChannel is always created from accept, explicitly set
+ self.connected to True
+
+CVE: CVE-2024-49769
+Upstream-Status: Backport [https://github.com/Pylons/waitress/commit/03cc640fe7106902899f82115c26e37002bca7f1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/waitress/channel.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/waitress/channel.py b/src/waitress/channel.py
+index 756adce..cf19ef2 100644
+--- a/src/waitress/channel.py
++++ b/src/waitress/channel.py
+@@ -67,8 +67,7 @@ class HTTPChannel(wasyncore.dispatcher):
+         self.outbuf_lock = threading.Condition()
+ 
+         wasyncore.dispatcher.__init__(self, sock, map=map)
+-
+-        # Don't let wasyncore.dispatcher throttle self.addr on us.
++        self.connected = True
+         self.addr = addr
+         self.requests = []
+ 
diff --git a/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-2.patch b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-2.patch
new file mode 100644
index 0000000000..a34ee4fb11
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-2.patch
@@ -0,0 +1,53 @@
+From 646d7bfa81185b961b4797965f5c7ff0e380bc5c Mon Sep 17 00:00:00 2001
+From: Delta Regeer <bertjw@regeer.org>
+Date: Sun, 3 Mar 2024 16:16:48 -0700
+Subject: [PATCH] Assume socket is not connected when passed to
+ wasyncore.dispatcher
+
+No longer call getpeername() on the remote socket either, as it is not
+necessary for any of the places where waitress requires that self.addr
+in a subclass of the dispatcher needs it.
+
+This removes a race condition when setting up a HTTPChannel where we
+accepted the socket, and know the remote address, yet call getpeername()
+again which would have the unintended side effect of potentially setting
+self.connected to False because the remote has already shut down part of
+the socket.
+
+This issue was uncovered in #418, where the server would go into a hard
+loop because self.connected was used in various parts of the code base.
+
+CVE: CVE-2024-49769
+Upstream-Status: Backport [https://github.com/Pylons/waitress/commit/840aebce1c4c1bfd9036f402c1f5d5a4d2f4a1c2]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/waitress/wasyncore.py | 16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/src/waitress/wasyncore.py b/src/waitress/wasyncore.py
+index b3459e0..b5ddce2 100644
+--- a/src/waitress/wasyncore.py
++++ b/src/waitress/wasyncore.py
+@@ -298,22 +298,6 @@ class dispatcher:
+             # get a socket from a blocking source.
+             sock.setblocking(0)
+             self.set_socket(sock, map)
+-            self.connected = True
+-            # The constructor no longer requires that the socket
+-            # passed be connected.
+-            try:
+-                self.addr = sock.getpeername()
+-            except OSError as err:
+-                if err.args[0] in (ENOTCONN, EINVAL):
+-                    # To handle the case where we got an unconnected
+-                    # socket.
+-                    self.connected = False
+-                else:
+-                    # The socket is broken in some unknown way, alert
+-                    # the user and remove it from the map (to prevent
+-                    # polling of broken sockets).
+-                    self.del_channel(map)
+-                    raise
+         else:
+             self.socket = None
+ 
diff --git a/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-3.patch b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-3.patch
new file mode 100644
index 0000000000..165ede95c7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-3.patch
@@ -0,0 +1,34 @@
+From 28377c0e0fdd8669fb250e69745caf1c27ba541b Mon Sep 17 00:00:00 2001
+From: Delta Regeer <bertjw@regeer.org>
+Date: Sun, 3 Mar 2024 16:23:33 -0700
+Subject: [PATCH] Remove test for getpeername()
+
+CVE: CVE-2024-49769
+Upstream-Status: Backport [https://github.com/Pylons/waitress/commit/86c680df4e4bdd40c78dec771cddcee059e802c4]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/test_wasyncore.py | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/tests/test_wasyncore.py b/tests/test_wasyncore.py
+index e833c7e..5f38bd9 100644
+--- a/tests/test_wasyncore.py
++++ b/tests/test_wasyncore.py
+@@ -1451,17 +1451,6 @@ class Test_dispatcher(unittest.TestCase):
+ 
+         return dispatcher(sock=sock, map=map)
+ 
+-    def test_unexpected_getpeername_exc(self):
+-        sock = dummysocket()
+-
+-        def getpeername():
+-            raise OSError(errno.EBADF)
+-
+-        map = {}
+-        sock.getpeername = getpeername
+-        self.assertRaises(socket.error, self._makeOne, sock=sock, map=map)
+-        self.assertEqual(map, {})
+-
+     def test___repr__accepting(self):
+         sock = dummysocket()
+         map = {}
diff --git a/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-4.patch b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-4.patch
new file mode 100644
index 0000000000..6ea5bdb065
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-4.patch
@@ -0,0 +1,34 @@
+From ee501847c38e21be0683ba81925472f219044a65 Mon Sep 17 00:00:00 2001
+From: Delta Regeer <bertjw@regeer.org>
+Date: Sun, 3 Mar 2024 16:26:22 -0700
+Subject: [PATCH] Don't exit handle_write early -- even if socket is not
+ connected
+
+Calling handle_close() multiple times does not hurt anything, and is
+safe.
+
+CVE: CVE-2024-49769
+Upstream-Status: Backport [https://github.com/Pylons/waitress/commit/8cba302b1ac08c2874ae179b2af2445e89311bac]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/waitress/channel.py | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/src/waitress/channel.py b/src/waitress/channel.py
+index cf19ef2..f4d9677 100644
+--- a/src/waitress/channel.py
++++ b/src/waitress/channel.py
+@@ -91,13 +91,7 @@ class HTTPChannel(wasyncore.dispatcher):
+         # Precondition: there's data in the out buffer to be sent, or
+         # there's a pending will_close request
+ 
+-        if not self.connected:
+-            # we dont want to close the channel twice
+-
+-            return
+-
+         # try to flush any pending output
+-
+         if not self.requests:
+             # 1. There are no running tasks, so we don't need to try to lock
+             #    the outbuf before sending
diff --git a/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-5.patch b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-5.patch
new file mode 100644
index 0000000000..14fe56e021
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-5.patch
@@ -0,0 +1,211 @@
+From aa161b98cc787f266d8ef358f00fc5b2b3944157 Mon Sep 17 00:00:00 2001
+From: Delta Regeer <bertjw@regeer.org>
+Date: Sun, 3 Mar 2024 16:35:39 -0700
+Subject: [PATCH] Remove code not used by waitress from vendored asyncore
+
+CVE: CVE-2024-49769
+Upstream-Status: Backport [https://github.com/Pylons/waitress/commit/63678e652d912e67621580123c603e37c319d8c4]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/waitress/wasyncore.py | 45 ------------------
+ tests/test_wasyncore.py   | 96 ++++++++-------------------------------
+ 2 files changed, 18 insertions(+), 123 deletions(-)
+
+diff --git a/src/waitress/wasyncore.py b/src/waitress/wasyncore.py
+index b5ddce2..117f78a 100644
+--- a/src/waitress/wasyncore.py
++++ b/src/waitress/wasyncore.py
+@@ -379,23 +379,6 @@ class dispatcher:
+         self.addr = addr
+         return self.socket.bind(addr)
+ 
+-    def connect(self, address):
+-        self.connected = False
+-        self.connecting = True
+-        err = self.socket.connect_ex(address)
+-        if (
+-            err in (EINPROGRESS, EALREADY, EWOULDBLOCK)
+-            or err == EINVAL
+-            and os.name == "nt"
+-        ):  # pragma: no cover
+-            self.addr = address
+-            return
+-        if err in (0, EISCONN):
+-            self.addr = address
+-            self.handle_connect_event()
+-        else:
+-            raise OSError(err, errorcode[err])
+-
+     def accept(self):
+         # XXX can return either an address pair or None
+         try:
+@@ -557,34 +540,6 @@ class dispatcher:
+         self.close()
+ 
+ 
+-# ---------------------------------------------------------------------------
+-# adds simple buffered output capability, useful for simple clients.
+-# [for more sophisticated usage use asynchat.async_chat]
+-# ---------------------------------------------------------------------------
+-
+-
+-class dispatcher_with_send(dispatcher):
+-    def __init__(self, sock=None, map=None):
+-        dispatcher.__init__(self, sock, map)
+-        self.out_buffer = b""
+-
+-    def initiate_send(self):
+-        num_sent = 0
+-        num_sent = dispatcher.send(self, self.out_buffer[:65536])
+-        self.out_buffer = self.out_buffer[num_sent:]
+-
+-    handle_write = initiate_send
+-
+-    def writable(self):
+-        return (not self.connected) or len(self.out_buffer)
+-
+-    def send(self, data):
+-        if self.debug:  # pragma: no cover
+-            self.log_info("sending %s" % repr(data))
+-        self.out_buffer = self.out_buffer + data
+-        self.initiate_send()
+-
+-
+ def close_all(map=None, ignore_all=False):
+     if map is None:  # pragma: no cover
+         map = socket_map
+diff --git a/tests/test_wasyncore.py b/tests/test_wasyncore.py
+index 5f38bd9..44b8e19 100644
+--- a/tests/test_wasyncore.py
++++ b/tests/test_wasyncore.py
+@@ -1,6 +1,7 @@
+ import _thread as thread
+ import contextlib
+ import errno
++from errno import EALREADY, EINPROGRESS, EINVAL, EISCONN, EWOULDBLOCK, errorcode
+ import functools
+ import gc
+ from io import BytesIO
+@@ -641,62 +642,6 @@ class DispatcherTests(unittest.TestCase):
+         self.assertTrue(err != "")
+ 
+ 
+-class dispatcherwithsend_noread(asyncore.dispatcher_with_send):  # pragma: no cover
+-    def readable(self):
+-        return False
+-
+-    def handle_connect(self):
+-        pass
+-
+-
+-class DispatcherWithSendTests(unittest.TestCase):
+-    def setUp(self):
+-        pass
+-
+-    def tearDown(self):
+-        asyncore.close_all()
+-
+-    @reap_threads
+-    def test_send(self):
+-        evt = threading.Event()
+-        sock = socket.socket()
+-        sock.settimeout(3)
+-        port = bind_port(sock)
+-
+-        cap = BytesIO()
+-        args = (evt, cap, sock)
+-        t = threading.Thread(target=capture_server, args=args)
+-        t.start()
+-        try:
+-            # wait a little longer for the server to initialize (it sometimes
+-            # refuses connections on slow machines without this wait)
+-            time.sleep(0.2)
+-
+-            data = b"Suppose there isn't a 16-ton weight?"
+-            d = dispatcherwithsend_noread()
+-            d.create_socket()
+-            d.connect((HOST, port))
+-
+-            # give time for socket to connect
+-            time.sleep(0.1)
+-
+-            d.send(data)
+-            d.send(data)
+-            d.send(b"\n")
+-
+-            n = 1000
+-
+-            while d.out_buffer and n > 0:  # pragma: no cover
+-                asyncore.poll()
+-                n -= 1
+-
+-            evt.wait()
+-
+-            self.assertEqual(cap.getvalue(), data * 2)
+-        finally:
+-            join_thread(t, timeout=TIMEOUT)
+-
+-
+ @unittest.skipUnless(
+     hasattr(asyncore, "file_wrapper"), "asyncore.file_wrapper required"
+ )
+@@ -839,6 +784,23 @@ class BaseClient(BaseTestHandler):
+         self.create_socket(family)
+         self.connect(address)
+ 
++    def connect(self, address):
++        self.connected = False
++        self.connecting = True
++        err = self.socket.connect_ex(address)
++        if (
++            err in (EINPROGRESS, EALREADY, EWOULDBLOCK)
++            or err == EINVAL
++            and os.name == "nt"
++        ):  # pragma: no cover
++            self.addr = address
++            return
++        if err in (0, EISCONN):
++            self.addr = address
++            self.handle_connect_event()
++        else:
++            raise OSError(err, errorcode[err])
++
+     def handle_connect(self):
+         pass
+ 
+@@ -1486,13 +1448,6 @@ class Test_dispatcher(unittest.TestCase):
+         inst.set_reuse_addr()
+         self.assertTrue(sock.errored)
+ 
+-    def test_connect_raise_socket_error(self):
+-        sock = dummysocket()
+-        map = {}
+-        sock.connect_ex = lambda *arg: 1
+-        inst = self._makeOne(sock=sock, map=map)
+-        self.assertRaises(socket.error, inst.connect, 0)
+-
+     def test_accept_raise_TypeError(self):
+         sock = dummysocket()
+         map = {}
+@@ -1661,21 +1616,6 @@ class Test_dispatcher(unittest.TestCase):
+         self.assertTrue(sock.closed)
+ 
+ 
+-class Test_dispatcher_with_send(unittest.TestCase):
+-    def _makeOne(self, sock=None, map=None):
+-        from waitress.wasyncore import dispatcher_with_send
+-
+-        return dispatcher_with_send(sock=sock, map=map)
+-
+-    def test_writable(self):
+-        sock = dummysocket()
+-        map = {}
+-        inst = self._makeOne(sock=sock, map=map)
+-        inst.out_buffer = b"123"
+-        inst.connected = True
+-        self.assertTrue(inst.writable())
+-
+-
+ class Test_close_all(unittest.TestCase):
+     def _callFUT(self, map=None, ignore_all=False):
+         from waitress.wasyncore import close_all
diff --git a/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-6.patch b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-6.patch
new file mode 100644
index 0000000000..dedfa0d41c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress/CVE-2024-49769-6.patch
@@ -0,0 +1,41 @@
+From 4a5ce98ecaed785a14781700106d60c4072c9b87 Mon Sep 17 00:00:00 2001
+From: Delta Regeer <bertjw@regeer.org>
+Date: Sun, 3 Mar 2024 16:37:12 -0700
+Subject: [PATCH] When closing the socket, set it to None
+
+This avoids calling close() twice on the same socket if self.close() or
+self.handle_close() is called multiple times
+
+CVE: CVE-2024-49769
+Upstream-Status: Backport [https://github.com/Pylons/waitress/commit/9d99c89ae4aa8449313eea210a5ec9f3994a87b2]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/waitress/wasyncore.py | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/waitress/wasyncore.py b/src/waitress/wasyncore.py
+index 117f78a..f0cd23e 100644
+--- a/src/waitress/wasyncore.py
++++ b/src/waitress/wasyncore.py
+@@ -437,6 +437,8 @@ class dispatcher:
+                 if why.args[0] not in (ENOTCONN, EBADF):
+                     raise
+ 
++            self.socket = None
++
+     # log and log_info may be overridden to provide more sophisticated
+     # logging and warning methods. In general, log is for 'hit' logging
+     # and 'log_info' is for informational, warning and error logging.
+@@ -487,7 +489,11 @@ class dispatcher:
+         # handle_expt_event() is called if there might be an error on the
+         # socket, or if there is OOB data
+         # check for the error condition first
+-        err = self.socket.getsockopt(socket.SOL_SOCKET, socket.SO_ERROR)
++        err = (
++            self.socket.getsockopt(socket.SOL_SOCKET, socket.SO_ERROR)
++            if self.socket is not None
++            else 1
++        )
+         if err != 0:
+             # we can get here when select.select() says that there is an
+             # exceptional condition on the socket
diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb b/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
index dbb8b05e52..a480c1ac55 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
@@ -14,6 +14,12 @@ SRC_URI += "file://CVE-2024-49768-1.patch \
            file://CVE-2024-49768-2.patch \
            file://CVE-2024-49768-3.patch \
            file://CVE-2024-49768-4.patch \
+           file://CVE-2024-49769-1.patch \
+           file://CVE-2024-49769-2.patch \
+           file://CVE-2024-49769-3.patch \
+           file://CVE-2024-49769-4.patch \
+           file://CVE-2024-49769-5.patch \
+           file://CVE-2024-49769-6.patch \
            "
 SRC_URI[sha256sum] = "780a4082c5fbc0fde6a2fcfe5e26e6efc1e8f425730863c04085769781f51eba"
 

