Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD910CCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:42:46 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16159.1792132956216575615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MyVDmUT4;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12744; q=dns/txt;
  s=iport01; t=1792132956; x=1793342556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OjZ1Lp5IwLTA1mTTAzvLXE1FMvXoaTxxveRjkJuRH2E=;
  b=MyVDmUT4PHfNeGn/9qYy1xZPGpmXjgbDD0Lps79anAgDJs6FRiAlXRcy
   fYP2YXROQboNKSTgrpVpBk8EqIAveHg/cxEerz4l97NhaHvIDXTUtay1T
   Lxa5MRzs9rjgFevOQEE9BKI7Pujk21NpfGYCmnHRReFXdKpGKMyCQ5KLy
   EVjNJ8tXmTnevoWB7QL/zCFDe5fYUz5t0vAtA2bfDgM7ZzCMwsLTv+qiS
   VZiJLyEBD6JbKRyA7FvT29bTP8WEzvJ31vypp3YEmw8i92yJsmP6xK+FJ
   lQM1DBrydb31IT/f4Evez0bWMVAQkTY/atxYct/BMwAOzbhy3RS4xUge8
   w==;
X-CSE-ConnectionGUID: 4UfxRhQZTmCmlE9T4YPEbA==
X-CSE-MsgGUID: EeeOYEKKToGZCaOjq4N9Ww==
X-IPAS-Result: =?us-ascii?q?A0BLAgDLxdFq/5P/Ja1aglmCGD91YENJA5ZHA4ETkDeMU?=
 =?us-ascii?q?oF+DwEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgQCYMCAYJ0AxG8e?=
 =?us-ascii?q?oF5M4EBgykBMQKBIdsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYE7gTh2gQWBX?=
 =?us-ascii?q?AICgTYQCYZUBIIigQyBWoEDlERIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTC?=
 =?us-ascii?q?SVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+b?=
 =?us-ascii?q?geSFB6CZRYXRw0NASoBf4EtEQUBBQIwkmAHAjkKkXuBNZ9aCiiDdowilToaM?=
 =?us-ascii?q?4QEgVeSQJJUC5h9jgqVZxgBT4RpgWg8gVlwFTuCZwlKGQ+OKw4LgRQBAoJJh?=
 =?us-ascii?q?RPJRycyAgkDLwEBBwIHDgMLgWiQAQEmgVYBAQ?=
IronPort-Data: A9a23:5IrZsa/9ZHUy3ERWIGS9DrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GYYWWuPbvvYMGfzfNlxa4vj9R4AsMXRnIU2HAtp+X9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lqAIMIwOZOM11L3
 vkcBWExMiG7quiflefTpulE3qzPLeHxN48Z/3UlxjbDALN/GdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0In1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYGLJo3RH5kM9qqej
 k/L8kPILzI5CNuw+xGM1XC12smeojyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFcCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:TzRA6KqxHVrV6LpNT2H6ouMaV5oJeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3A+9Zvbmshgpgo9rFoLBEEDUN36It5T3PN9nfpEXO?=
 =?us-ascii?q?9ImNtZeypFW6o1alNxp8=3D?=
X-Talos-MUID: 9a23:ESbUdAUQ+5W3EfDq/BLhiRZTGeRL36OBOmsEtpcf5+/VCjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536493241"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:42:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 200C51800025B;
	Fri, 16 Oct 2026 06:42:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id BE6FBCBF202; Thu, 15 Oct 2026 23:42:34 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 2/3] python3-aiohttp: fix CVE-2026-69243
Date: Thu, 15 Oct 2026 23:42:18 -0700
Message-Id: <20261016064219.3910025-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016064219.3910025-1-dkelaiya@cisco.com>
References: <20261016064219.3910025-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131067

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1]. It adapts the Python and C HTTP parser
paths to read a rejected WebSocket upgrade request body before
switching protocols.

[1] https://github.com/aio-libs/aiohttp/commit/6ae358f0983c3f4d6f67692b2f8e65dc8e091c98
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-mfx4-hv73-q22v

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-69243.patch      | 307 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 308 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243.patch
new file mode 100644
index 0000000000..090a82f2f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243.patch
@@ -0,0 +1,307 @@
+From 3267a26ebb0c28cc70b0caf5836d20ff1b7c2f39 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Tue, 30 Jun 2026 20:21:57 +0100
+Subject: [PATCH] [PR #13016/8ef76ab8 backport][3.14] Fix body reads after
+ failed WS upgrade (#13017)
+
+This is a backport of PR #13016 as merged into master
+(8ef76ab8029d0f2d88449fe115feb42ded646c7c).
+
+CVE: CVE-2026-69243
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/6ae358f0983c3f4d6f67692b2f8e65dc8e091c98]
+
+Backport Changes:
+- Adapted deferred upgrades to the 3.13.5 llhttp pause and tail
+  buffering path, including the CVE-2026-54273 queue limit.
+- Adapted the pure Python parser to its boolean payload result.
+- Used the 3.13.5 buffer size in the earlier 54273 test.
+- Kept the existing pipelined-upgrade regression test and added
+  the upstream body-read regression test.
+- Omitted generated _http_parser.c because the Wrynose recipe
+  regenerates it from _http_parser.pyx during do_configure.
+
+Co-authored-by: Sam Bull <git@sambull.org>
+(cherry picked from commit 6ae358f0983c3f4d6f67692b2f8e65dc8e091c98)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13016.bugfix.rst     |  1 +
+ aiohttp/_http_parser.pyx     | 20 +++++++++----
+ aiohttp/http_parser.py       | 21 ++++++++++----
+ tests/test_http_parser.py    | 48 ++++++++++++++++++++++++++++++++
+ tests/test_web_functional.py | 54 ++++++++++++++++++++++++++++++++++--
+ 5 files changed, 131 insertions(+), 13 deletions(-)
+ create mode 100644 CHANGES/13016.bugfix.rst
+
+diff --git a/CHANGES/13016.bugfix.rst b/CHANGES/13016.bugfix.rst
+new file mode 100644
+index 000000000..a984f64e3
+--- /dev/null
++++ b/CHANGES/13016.bugfix.rst
+@@ -0,0 +1 @@
++Fixed request body not being read on rejected WebSocket upgrades -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 0d0762748..478d82ecb 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -318,6 +318,7 @@ cdef class HttpParser:
+         set     _seen_singletons
+         list    _raw_headers
+         bint    _upgraded
++        bint    _pending_upgrade
+         list    _messages
+         Py_ssize_t _msg_in_flight
+         Py_ssize_t _max_msg_queue_size
+@@ -387,6 +388,7 @@ cdef class HttpParser:
+         self._response_with_body = response_with_body
+         self._read_until_eof = read_until_eof
+         self._upgraded = False
++        self._pending_upgrade = False
+         self._auto_decompress = auto_decompress
+         self._content_encoding = None
+         self._lax = False
+@@ -466,10 +468,13 @@ cdef class HttpParser:
+             h_upg = headers.get("upgrade", "")
+             allowed = upgrade and h_upg.isascii() and h_upg.lower() in ALLOWED_UPGRADES
+             if allowed or self._cparser.method == cparser.HTTP_CONNECT:
+-                self._upgraded = True
++                # Wait until the complete request body has been parsed.
++                self._pending_upgrade = True
+         else:
+             if upgrade and self._cparser.status_code == 101:
+-                self._upgraded = True
++                # llhttp pauses for a 101 on its own; just mark the pending
++                # switch so feed_data returns the upgraded-protocol tail.
++                self._pending_upgrade = True
+ 
+         # do not support old websocket spec
+         if SEC_WEBSOCKET_KEY1 in headers:
+@@ -597,6 +602,10 @@ cdef class HttpParser:
+         if errno is cparser.HPE_PAUSED_UPGRADE:
+             cparser.llhttp_resume_after_upgrade(self._cparser)
+             nb = cparser.llhttp_get_error_pos(self._cparser) - base
++            if self._pending_upgrade:
++                # A supported upgrade whose request body has now been fully read.
++                self._upgraded = True
++                self._pending_upgrade = False
+         elif errno is cparser.HPE_PAUSED:
+             cparser.llhttp_resume(self._cparser)
+             pos = cparser.llhttp_get_error_pos(self._cparser) - base
+@@ -818,10 +827,9 @@ cdef int cb_on_headers_complete(cparser.llhttp_t* parser) except -1:
+         pyparser._last_error = exc
+         return -1
+     else:
+-        if pyparser._upgraded or pyparser._cparser.method == cparser.HTTP_CONNECT:
+-            return 2
+-        else:
+-            return 0
++        if not pyparser._response_with_body:
++            return 1
++        return 0
+ 
+ 
+ cdef int cb_on_body(cparser.llhttp_t* parser,
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 32375f83a..f4458dc9d 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -289,6 +289,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+         self._lines: List[bytes] = []
+         self._tail = b""
+         self._upgraded = False
++        self._pending_upgrade = False
+         self._payload = None
+         self._payload_parser: Optional[HttpPayloadParser] = None
+         self._auto_decompress = auto_decompress
+@@ -417,9 +418,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                         if SEC_WEBSOCKET_KEY1 in msg.headers:
+                             raise InvalidHeader(SEC_WEBSOCKET_KEY1)
+ 
+-                        self._upgraded = msg.upgrade and _is_supported_upgrade(
+-                            msg.headers
+-                        )
++                        upgraded = msg.upgrade and _is_supported_upgrade(msg.headers)
+ 
+                         method = getattr(msg, "method", self.method)
+                         # code is only present on responses
+@@ -431,8 +430,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                             method and method in EMPTY_BODY_METHODS
+                         )
+                         if not empty_body and (
+-                            ((length is not None and length > 0) or msg.chunked)
+-                            and not self._upgraded
++                            (length is not None and length > 0) or msg.chunked
+                         ):
+                             payload = StreamReader(
+                                 self.protocol,
+@@ -457,6 +455,10 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                             )
+                             if not payload_parser.done:
+                                 self._payload_parser = payload_parser
++                                # https://www.rfc-editor.org/info/rfc9110/#section-7.8-15
++                                # Defer any requested upgrade until the
++                                # complete request has been read.
++                                self._pending_upgrade = upgraded
+                         elif method == METH_CONNECT:
+                             assert isinstance(msg, RawRequestMessage)
+                             payload = StreamReader(
+@@ -501,6 +503,11 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                             )
+                             if not payload_parser.done:
+                                 self._payload_parser = payload_parser
++                        elif upgraded:
++                            # No body to read, so the connection switches to
++                            # the upgraded protocol immediately.
++                            self._upgraded = True
++                            payload = EMPTY_PAYLOAD
+                         else:
+                             payload = EMPTY_PAYLOAD
+ 
+@@ -548,6 +555,10 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                     start_pos = 0
+                     data_len = len(data)
+                     self._payload_parser = None
++                    if self._pending_upgrade:
++                        # The body is complete; the protocol switch may begin.
++                        self._upgraded = True
++                        self._pending_upgrade = False
+                     continue
+             else:
+                 break
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index a4e6bc056..92e59af1c 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -1217,6 +1217,54 @@ async def test_http_request_upgrade_unknown(parser: Any) -> None:
+     assert await messages[0][-1].read() == b"{}"
+ 
+ 
++@pytest.mark.parametrize("chunked", (False, True), ids=("content-length", "chunked"))
++async def test_http_request_upgrade_with_body_read(
++    parser: HttpRequestParser, chunked: bool
++) -> None:
++    body_request = b"foobarbaz\r\n\r\n"
++    if chunked:
++        framing = b"Transfer-Encoding: chunked\r\n"
++        body = b"%x\r\n%s\r\n0\r\n\r\n" % (len(body_request), body_request)
++    else:
++        framing = b"Content-Length: %d\r\n" % len(body_request)
++        body = body_request
++    after = b"GET /after HTTP/1.1\r\nHost: a\r\n\r\n"
++    text = (
++        b"GET /ws HTTP/1.1\r\nHost: a\r\n"
++        b"Connection: Upgrade\r\nUpgrade: websocket\r\n"
++        + framing
++        + b"\r\n"
++        + body
++        + after
++    )
++    messages, upgrade, tail = parser.feed_data(text)
++    assert len(messages) == 1
++    msg, payload = messages[0]
++    assert msg.method == "GET"
++    assert msg.path == "/ws"
++    assert msg.upgrade
++    assert await payload.read() == body_request
++    # The connection switches protocols only after the body is fully read.
++    assert upgrade
++    assert tail == after
++
++
++def test_http_request_upgrade_empty_body_allowed(parser: HttpRequestParser) -> None:
++    text = (
++        b"GET /ws HTTP/1.1\r\n"
++        b"Host: a\r\n"
++        b"Connection: Upgrade\r\n"
++        b"Upgrade: websocket\r\n"
++        b"Content-Length: 0\r\n\r\n"
++        b"some raw data"
++    )
++    messages, upgrade, tail = parser.feed_data(text)
++    msg = messages[0][0]
++    assert msg.upgrade
++    assert upgrade
++    assert tail == b"some raw data"
++
++
+ @pytest.fixture
+ def xfail_c_parser_url(request) -> None:
+     if isinstance(request.getfixturevalue("parser"), HttpRequestParserPy):
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index b958bef9d..0d2824a9c 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -25,7 +25,6 @@ from aiohttp import (
+ )
+ from aiohttp.compression_utils import ZLibBackend, ZLibCompressObjProtocol
+ from aiohttp.hdrs import CONTENT_LENGTH, CONTENT_TYPE, TRANSFER_ENCODING
+-from aiohttp.helpers import DEFAULT_CHUNK_SIZE
+ from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
+ from aiohttp.streams import StreamReader
+ from aiohttp.typedefs import Handler
+@@ -1923,7 +1922,7 @@ async def test_unread_compressed_body_drain_is_bounded(
+             await writer.wait_closed()
+ 
+     # Bounded by the buffer, not the decompressed size.
+-    assert max(drain_reads) <= 3 * DEFAULT_CHUNK_SIZE
++    assert max(drain_reads) <= 3 * 2**16
+     assert max(drain_reads) < decompressed_size
+ 
+ 
+@@ -2624,3 +2623,54 @@ async def test_keepalive_expires_on_time(aiohttp_client: AiohttpClient) -> None:
+ 
+         # Ensure the keep alive handle expires
+         assert request_handler._keepalive_handle is None
++
++
++async def test_declined_websocket_upgrade_reads_body(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    body_read = b""
++
++    async def ws_handler(request: web.Request) -> web.Response:
++        nonlocal body_read
++        # Decline the upgrade; read the body as a normal handler may.
++        body_read = await request.read()
++        return web.Response(text="declined")
++
++    async def after_handler(request: web.Request) -> web.Response:
++        return web.Response(text="after")
++
++    app = web.Application()
++    app.router.add_get("/ws", ws_handler)
++    app.router.add_get("/after", after_handler)
++    server = await aiohttp_server(app)
++
++    body = b"FooBarBaz\r\n\r\n"
++    # Use raw connection in order to pipeline requests.
++    pipeline = (
++        (
++            b"GET /ws HTTP/1.1\r\n"
++            b"Host: localhost\r\n"
++            b"Connection: Upgrade\r\n"
++            b"Upgrade: websocket\r\n"
++            b"Content-Length: %d\r\n\r\n" % len(body)
++        )
++        + body
++        + b"GET /after HTTP/1.1\r\nHost: localhost\r\nConnection: close\r\n\r\n"
++    )
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(pipeline)
++        await writer.drain()
++        # The trailing request sends Connection: close, so the server closes
++        # once it has answered it -- reading to EOF gathers both responses.
++        response = await asyncio.wait_for(reader.read(), 5)
++    finally:
++        writer.close()
++        with suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    assert body_read == body
++    # Both the upgrade request and the pipelined request were served.
++    assert response.count(b"HTTP/1.") == 2, response
++    assert response.count(b" 200 ") == 2, response
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index b34a0fa3eb..417760c9ca 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -20,6 +20,7 @@ SRC_URI += " \
     file://CVE-2026-54273_p1.patch \
     file://CVE-2026-54273_p2.patch \
     file://CVE-2026-59881.patch \
+    file://CVE-2026-69243.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6


