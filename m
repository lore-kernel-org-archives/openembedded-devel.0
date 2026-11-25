Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36203.1795584017420542249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PNoYTd1B;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=48384; q=dns/txt;
  s=iport01; t=1795584017; x=1796793617;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Eq6nRyTK2C45fkhO/bWUbpPcF3E38ZqDTfAdmq2+8+E=;
  b=PNoYTd1BQlwYVhHpLC8PlE4yyjb5hx6AR22+iFN2umPbsb+wfSMquSMr
   eC29lzGgSMngVQFpGC6+CkV1UiAlFpPYQ6dKDuy2JzOp9T/igVOD1UX+N
   r/9S7X0I4zy4HlFPG2m/ozgc2Rm7aGZL4RByU07xSOH61cAppmEF/i4tD
   21dl1VsXhaE/gSRxlBUnbi7p0aN0jJj9ltc7q3uzFPqguoD5SqpOHb0dh
   WiO681+G8J6K+x5q4xOQqPKJk05AWEpes3JRyHuYvjdrZX9++4JRow7t3
   a2Nri6DSoOpybfMc2L9hbdc1DfmIXTWYfRnH9wYef/aiUr0hiaJPDREg6
   A==;
X-CSE-ConnectionGUID: p1ZaAkd1QICcpZZFvvXp5g==
X-CSE-MsgGUID: hyLrteGpQJOd3OXdaI8PuQ==
X-IPAS-Result: =?us-ascii?q?A0BZAACpbAZr/9NK/pBaHQEBAQEJARIBBQUBgX4GAQsBg?=
 =?us-ascii?q?hc/dWFCSQOUJ4IhA4ETggqOM4xZFIFqDwEBAQ9EDQQBAYQ/RgKOIgImNgcOA?=
 =?us-ascii?q?QIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMaAQwLA?=
 =?us-ascii?q?Rk9HAIBAQIWGSQHIwgZgipYAYJxAwIBEboDgXkzgQGDKoFU2zMBCxQBgTgBg?=
 =?us-ascii?q?XKDT4glXRgBhH4nGxuBcoEVgnR2gQWBXAKBGR8QV4YHBIIigQyBVIEChTUDh?=
 =?us-ascii?q?lkCgUmIUkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BE?=
 =?us-ascii?q?oEDXYErKF4hgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhCzQYDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeUE4JuGwsHAQ0IGQIMDg4bBwkKARMSBQFQBzoIAQYOOgQRLw5Ak?=
 =?us-ascii?q?mgBFDCPWIIioREKKIN5jCSVOhozhASBV5JDkT2BFwuYfY4KiQSMXQgYAxY3h?=
 =?us-ascii?q?GqBbwsqgVlwFTuCZwlKGQ9XjVQDCwuDYIVkyHcjNQIJAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?AABAyQEgVIBAQ?=
IronPort-Data: A9a23:ruuK2a+Aro17CqN2P8W1DrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mcWUTzVM/+KYjDxethza962o01Uu8TVyIQ3GwQ4rStEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kuZL8R0+V7WFhv3
 vcAGgIjcA6zn7+5lefTpulE3qzPLeHiMZlavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOnWjOX9PYH46tO6znnDldjRCgFmUvqEwpWPUyWSd1ZCzaouIIYPTG625mG6Yt
 0bc42nWGig4E9DE7gqJ+1P8vvL2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:DMOz8KtBti5vuhpL4SpGzcRh7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AA/Lkf2gll9F1cDorYRilR+OzBTJuaiTvxV7TLxa?=
 =?us-ascii?q?BKE1iUI+nZ0GOyLs5nJ87?=
X-Talos-MUID: 9a23:iKl6jgVgpRShRj/q/D/9oCt+Oehw2oaJBBsqoZkPmpm8KBUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62953716"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:20:13 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 721BE18000317
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:20:12 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 89618CBF231; Tue, 24 Nov 2026 21:20:09 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 09/10] python3-aiohttp: fix CVE-2026-128132
Date: Tue, 24 Nov 2026 21:20:05 -0800
Message-Id: <20261125052006.3116497-10-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125052006.3116497-1-asparmar@cisco.com>
References: <20261125052006.3116497-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132985
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the WebSocket queue backpressure fix for
CVE-2026-128132 from the upstream stable branch [1].

Account for per-message object overhead and stop parsing buffered frames
when the queue crosses its high-water limit.

[1] https://github.com/aio-libs/aiohttp/commit/0ae507423f681161efa77d20052b4054397c7fb6
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-5rmc-48h2-hvcm

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python3-aiohttp/CVE-2026-128132.patch     | 1242 +++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |    1 +
 2 files changed, 1243 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128132.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128132.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128132.patch
new file mode 100644
index 0000000000..97a7cb7ead
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128132.patch
@@ -0,0 +1,1242 @@
+From 62c5f7aa938f592676662c306f9d05baca3e521d Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Fri, 28 Aug 2026 16:59:56 +0100
+Subject: [PATCH] Fix memory consumption on empty/small messages (#13393)
+ (#13545) (#13546)
+
+(cherry picked from commit 5e54037933fa8422be5fa8a2002d118ed2d4e5e0)
+
+Co-authored-by: J. Nick Koston <nick@koston.org>
+
+CVE: CVE-2026-128132
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/0ae507423f681161efa77d20052b4054397c7fb6]
+
+Backport Changes:
+- Retain the current constructors and callback interfaces, which have
+  no decode_text or data_received_cb options. Preserve response ownership
+  of stalled parsers and all upstream close/error cleanup paths.
+- Keep existing typing imports and annotations for the current API.
+- Remove decode_text arguments from the added parser tests, and keep
+  their socket-read bound local because helpers has no DEFAULT_CHUNK_SIZE.
+- Keep only the added regression tests when resolving newer test-file
+  context, retaining the queued-fragment checks already in the source.
+- Omit CHANGES/13393.breaking.rst and CHANGES/13393.bugfix.rst, which
+  record upstream release notes.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ aiohttp/_websocket/reader_c.pxd        |  12 +-
+ aiohttp/_websocket/reader_py.py        |  55 +++-
+ aiohttp/client.py                      |  10 +-
+ aiohttp/client_ws.py                   |  58 ++--
+ aiohttp/web_ws.py                      |  99 ++++---
+ tests/test_client_ws_functional.py     | 163 ++++++++++-
+ tests/test_web_websocket_functional.py | 178 ++++++++++++
+ tests/test_websocket_parser.py         | 361 +++++++++++++++++++++++++
+ 8 files changed, 859 insertions(+), 77 deletions(-)
+
+diff --git a/aiohttp/_websocket/reader_c.pxd b/aiohttp/_websocket/reader_c.pxd
+index fcb7b4d..ab2d4c8 100644
+--- a/aiohttp/_websocket/reader_c.pxd
++++ b/aiohttp/_websocket/reader_c.pxd
+@@ -38,11 +38,13 @@ cdef set MESSAGE_TYPES_WITH_CONTENT
+ cdef tuple EMPTY_FRAME
+ cdef tuple EMPTY_FRAME_ERROR
+ 
++cdef unsigned int MSG_SIZE_OVERHEAD
++
+ cdef class WebSocketDataQueue:
+ 
+-    cdef unsigned int _size
++    cdef readonly unsigned int _size
+     cdef public object _protocol
+-    cdef unsigned int _limit
++    cdef readonly unsigned int _limit
+     cdef object _loop
+     cdef bint _eof
+     cdef object _waiter
+@@ -50,6 +52,7 @@ cdef class WebSocketDataQueue:
+     cdef public object _buffer
+     cdef object _get_buffer
+     cdef object _put_buffer
++    cdef readonly object _stalled_reader
+ 
+     cdef void _release_waiter(self)
+ 
+@@ -60,6 +63,11 @@ cdef class WebSocketDataQueue:
+ 
+ cdef class WebSocketReader:
+ 
++    # cdef classes are not weak-referenceable without this; the queue parks a
++    # weakref here while parsing is stalled.
++    cdef object __weakref__
++    cdef object _weak_self
++
+     cdef WebSocketDataQueue queue
+     cdef unsigned int _max_msg_size
+ 
+diff --git a/aiohttp/_websocket/reader_py.py b/aiohttp/_websocket/reader_py.py
+index e9472bd..06bd9d1 100644
+--- a/aiohttp/_websocket/reader_py.py
++++ b/aiohttp/_websocket/reader_py.py
+@@ -3,12 +3,14 @@
+ import asyncio
+ import builtins
+ import sys
++import weakref
+ from collections import deque
+ from typing import Deque, Final, Optional, Set, Tuple, Union
+ 
+ from ..base_protocol import BaseProtocol
+ from ..compression_utils import ZLibDecompressor
+ from ..helpers import _EXC_SENTINEL, set_exception
++from ..log import ws_logger
+ from ..streams import EofStream
+ from .helpers import UNPACK_CLOSE_CODE, UNPACK_LEN3, websocket_mask
+ from .models import (
+@@ -55,6 +57,15 @@ COMPRESSED_TRUE = 1
+ 
+ TUPLE_NEW = tuple.__new__
+ 
++# Overhead added to each message to ensure that tiny messages can't use
++# unreasonable amounts of memory.
++MSG_SIZE_OVERHEAD: Final[int] = 128
++
++STALLED_READER_COLLECTED: Final[str] = (
++    "WebSocketReader was garbage collected while stalled; "
++    "callers of set_parser() must hold a strong reference"
++)
++
+ cython_int = int  # Typed to int in Python, but cython with use a signed int in the pxd
+ 
+ 
+@@ -77,6 +88,7 @@ class WebSocketDataQueue:
+         self._buffer: Deque[Tuple[WSMessage, int]] = deque()
+         self._get_buffer = self._buffer.popleft
+         self._put_buffer = self._buffer.append
++        self._stalled_reader: "weakref.ref[WebSocketReader] | None" = None
+ 
+     def is_eof(self) -> bool:
+         return self._eof
+@@ -108,7 +120,7 @@ class WebSocketDataQueue:
+         self._exception = None  # Break cyclic references
+ 
+     def feed_data(self, data: "WSMessage", size: "cython_int") -> None:
+-        self._size += size
++        self._size += size + MSG_SIZE_OVERHEAD
+         self._put_buffer((data, size))
+         self._release_waiter()
+         if self._size > self._limit and not self._protocol._reading_paused:
+@@ -128,8 +140,33 @@ class WebSocketDataQueue:
+     def _read_from_buffer(self) -> WSMessage:
+         if self._buffer:
+             data, size = self._get_buffer()
+-            self._size -= size
+-            if self._size < self._limit and self._protocol._reading_paused:
++            self._size -= size + MSG_SIZE_OVERHEAD
++            if self._stalled_reader is not None and self._size <= self._limit // 2:
++                # Resume parsing once the queue drains to the low-water mark.
++                # Each resume re-slices the parser's unparsed tail, so waiting
++                # for headroom makes a drain cost one copy per batch of
++                # messages instead of one per message.
++                if (reader := self._stalled_reader()) is not None:
++                    reader.feed_data(b"")
++                else:
++                    # The stash died with the reader. Deliver what was already
++                    # queued, then surface the contract violation on the next
++                    # read instead of hanging. Log as well, since a caller that
++                    # stops reading early never sees the deferred exception. A
++                    # real failure that was already recorded stays the reported
++                    # cause.
++                    self._stalled_reader = None
++                    ws_logger.warning(STALLED_READER_COLLECTED)
++                    if self._exception is None:
++                        self.set_exception(RuntimeError(STALLED_READER_COLLECTED))
++            # Resuming the transport while a stash remains would admit
++            # another socket read into the tail for every couple of messages
++            # drained, moving the memory bound from the queue into the tail.
++            if (
++                self._stalled_reader is None
++                and self._size < self._limit
++                and self._protocol._reading_paused
++            ):
+                 self._protocol.resume_reading()
+             return data
+         if self._exception is not None:
+@@ -143,6 +180,9 @@ class WebSocketReader:
+     ) -> None:
+         self.queue = queue
+         self._max_msg_size = max_msg_size
++        # Parked on the queue while parsing is stalled; created once so
++        # stalling does not allocate.
++        self._weak_self = weakref.ref(self)
+ 
+         self._exc: Optional[Exception] = None
+         self._partial = bytearray()
+@@ -322,6 +362,7 @@ class WebSocketReader:
+ 
+     def _feed_data(self, data: bytes) -> None:
+         """Return the next frame from the socket."""
++        self.queue._stalled_reader = None
+         if self._tail:
+             data, self._tail = self._tail + data, b""
+ 
+@@ -330,6 +371,14 @@ class WebSocketReader:
+         data_cstr = data
+ 
+         while True:
++            if start_pos < data_len and self.queue._size > self.queue._limit:
++                # Over the high-water mark with unparsed bytes left: stash the
++                # remainder and stall. Gating on unparsed bytes keeps a read
++                # that ended on a frame boundary from arming an empty stall,
++                # which would hold the transport paused with nothing to drain.
++                self.queue._stalled_reader = self._weak_self
++                break
++
+             # read header
+             if self._state == READ_HEADER:
+                 if data_len - start_pos < 2:
+diff --git a/aiohttp/client.py b/aiohttp/client.py
+index fafc5d3..8c642ef 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -1198,9 +1198,6 @@ class ClientSession:
+             transport = conn.transport
+             assert transport is not None
+             reader = WebSocketDataQueue(conn_proto, 2**16, loop=self._loop)
+-            conn_proto.set_parser(
+-                WebSocketReader(reader, max_msg_size, compress=bool(compress)), reader
+-            )
+             writer = WebSocketWriter(
+                 conn_proto,
+                 transport,
+@@ -1212,7 +1209,7 @@ class ClientSession:
+             resp.close()
+             raise
+         else:
+-            return self._ws_response_class(
++            ws_resp = self._ws_response_class(
+                 reader,
+                 writer,
+                 protocol,
+@@ -1225,6 +1222,11 @@ class ClientSession:
+                 compress=compress,
+                 client_notakeover=notakeover,
+             )
++            ws_resp._parser = WebSocketReader(
++                reader, max_msg_size, compress=bool(compress)
++            )
++            conn_proto.set_parser(ws_resp._parser, reader)
++            return ws_resp
+ 
+     def _prepare_headers(self, headers: Optional[LooseHeaders]) -> "CIMultiDict[str]":
+         """Add default headers and transform it to CIMultiDict"""
+diff --git a/aiohttp/client_ws.py b/aiohttp/client_ws.py
+index daa57d1..1a85bdd 100644
+--- a/aiohttp/client_ws.py
++++ b/aiohttp/client_ws.py
+@@ -7,7 +7,7 @@ from typing import Any, Optional, Type, cast
+ 
+ import attr
+ 
+-from ._websocket.reader import WebSocketDataQueue
++from ._websocket.reader import WebSocketDataQueue, WebSocketReader
+ from .client_exceptions import ClientError, ServerTimeoutError, WSMessageTypeError
+ from .client_reqrep import ClientResponse
+ from .helpers import calculate_timeout_when, set_result
+@@ -64,6 +64,10 @@ class ClientWebSocketResponse:
+ 
+         self._writer = writer
+         self._reader = reader
++        # Set by ClientSession._ws_connect; owns the parser so a stalled
++        # reader parked on the queue by weakref stays alive while this
++        # response can still be drained.
++        self._parser: Optional[WebSocketReader] = None
+         self._protocol = protocol
+         self._closed = False
+         self._closing = False
+@@ -172,6 +176,8 @@ class ClientWebSocketResponse:
+         if self._closed:
+             return
+         self._set_closed()
++        # close() is never reached after this; release the parser here.
++        self._parser = None
+         self._close_code = WSCloseCode.ABNORMAL_CLOSURE
+         self._exception = exc
+         self._response.close()
+@@ -275,25 +281,8 @@ class ClientWebSocketResponse:
+ 
+         self._set_closed()
+         try:
+-            await self._writer.close(code, message)
+-        except asyncio.CancelledError:
+-            self._close_code = WSCloseCode.ABNORMAL_CLOSURE
+-            self._response.close()
+-            raise
+-        except Exception as exc:
+-            self._close_code = WSCloseCode.ABNORMAL_CLOSURE
+-            self._exception = exc
+-            self._response.close()
+-            return True
+-
+-        if self._close_code:
+-            self._response.close()
+-            return True
+-
+-        while True:
+             try:
+-                async with async_timeout.timeout(self._timeout.ws_close):
+-                    msg = await self._reader.read()
++                await self._writer.close(code, message)
+             except asyncio.CancelledError:
+                 self._close_code = WSCloseCode.ABNORMAL_CLOSURE
+                 self._response.close()
+@@ -304,11 +293,33 @@ class ClientWebSocketResponse:
+                 self._response.close()
+                 return True
+ 
+-            if msg.type is WSMsgType.CLOSE:
+-                self._close_code = msg.data
++            if self._close_code:
+                 self._response.close()
+                 return True
+ 
++            while True:
++                try:
++                    async with async_timeout.timeout(self._timeout.ws_close):
++                        msg = await self._reader.read()
++                except asyncio.CancelledError:
++                    self._close_code = WSCloseCode.ABNORMAL_CLOSURE
++                    self._response.close()
++                    raise
++                except Exception as exc:
++                    self._close_code = WSCloseCode.ABNORMAL_CLOSURE
++                    self._exception = exc
++                    self._response.close()
++                    return True
++
++                if msg.type is WSMsgType.CLOSE:
++                    self._close_code = msg.data
++                    self._response.close()
++                    return True
++        finally:
++            # Once closed the response can no longer be drained; release the
++            # parser and the stash it retains.
++            self._parser = None
++
+     async def receive(self, timeout: Optional[float] = None) -> WSMessage:
+         receive_timeout = timeout or self._timeout.ws_receive
+ 
+@@ -347,7 +358,10 @@ class ClientWebSocketResponse:
+                 await self.close()
+                 return WSMessage(WSMsgType.CLOSED, None, None)
+             except ClientError:
+-                # Likely ServerDisconnectedError when connection is lost
++                # Likely ServerDisconnectedError when connection is lost.
++                # close() is not called on this path, so release the parser
++                # and the stash it retains here.
++                self._parser = None
+                 self._set_closed()
+                 self._close_code = WSCloseCode.ABNORMAL_CLOSURE
+                 return WS_CLOSED_MESSAGE
+diff --git a/aiohttp/web_ws.py b/aiohttp/web_ws.py
+index 575f9a3..134274c 100644
+--- a/aiohttp/web_ws.py
++++ b/aiohttp/web_ws.py
+@@ -65,6 +65,7 @@ class WebSocketResponse(StreamResponse):
+     _ws_protocol: Optional[str] = None
+     _writer: Optional[WebSocketWriter] = None
+     _reader: Optional[WebSocketDataQueue] = None
++    _parser: Optional[WebSocketReader] = None
+     _closed: bool = False
+     _closing: bool = False
+     _conn_lost: int = 0
+@@ -193,6 +194,8 @@ class WebSocketResponse(StreamResponse):
+         if self._closed:
+             return
+         self._set_closed()
++        # close() is never reached after this; release the parser here.
++        self._parser = None
+         self._set_code_close_transport(WSCloseCode.ABNORMAL_CLOSURE)
+         self._exception = exc
+         if self._waiting and not self._closing and self._reader is not None:
+@@ -336,11 +339,12 @@ class WebSocketResponse(StreamResponse):
+         loop = self._loop
+         assert loop is not None
+         self._reader = WebSocketDataQueue(request._protocol, 2**16, loop=loop)
+-        request.protocol.set_parser(
+-            WebSocketReader(
+-                self._reader, self._max_msg_size, compress=bool(self._compress)
+-            )
++        # Owns the parser so a stalled reader parked on the queue by weakref
++        # stays alive while this response can still be drained.
++        self._parser = WebSocketReader(
++            self._reader, self._max_msg_size, compress=bool(self._compress)
+         )
++        request.protocol.set_parser(self._parser)
+         # disable HTTP keepalive for WebSocket
+         request.protocol.keep_alive(False)
+ 
+@@ -455,48 +459,53 @@ class WebSocketResponse(StreamResponse):
+         self._set_closed()
+ 
+         try:
+-            await self._writer.close(code, message)
+-            writer = self._payload_writer
+-            assert writer is not None
+-            if drain:
+-                await writer.drain()
+-        except (asyncio.CancelledError, asyncio.TimeoutError):
+-            self._set_code_close_transport(WSCloseCode.ABNORMAL_CLOSURE)
+-            raise
+-        except Exception as exc:
+-            self._exception = exc
+-            self._set_code_close_transport(WSCloseCode.ABNORMAL_CLOSURE)
+-            return True
+-
+-        reader = self._reader
+-        assert reader is not None
+-        # we need to break `receive()` cycle before we can call
+-        # `reader.read()` as `close()` may be called from different task
+-        if self._waiting:
+-            assert self._loop is not None
+-            assert self._close_wait is None
+-            self._close_wait = self._loop.create_future()
+-            reader.feed_data(WS_CLOSING_MESSAGE, 0)
+-            await self._close_wait
+-
+-        if self._closing:
+-            self._close_transport()
+-            return True
++            try:
++                await self._writer.close(code, message)
++                writer = self._payload_writer
++                assert writer is not None
++                if drain:
++                    await writer.drain()
++            except (asyncio.CancelledError, asyncio.TimeoutError):
++                self._set_code_close_transport(WSCloseCode.ABNORMAL_CLOSURE)
++                raise
++            except Exception as exc:
++                self._exception = exc
++                self._set_code_close_transport(WSCloseCode.ABNORMAL_CLOSURE)
++                return True
+ 
+-        try:
+-            async with async_timeout.timeout(self._timeout):
+-                while True:
+-                    msg = await reader.read()
+-                    if msg.type is WSMsgType.CLOSE:
+-                        self._set_code_close_transport(msg.data)
+-                        return True
+-        except asyncio.CancelledError:
+-            self._set_code_close_transport(WSCloseCode.ABNORMAL_CLOSURE)
+-            raise
+-        except Exception as exc:
+-            self._exception = exc
+-            self._set_code_close_transport(WSCloseCode.ABNORMAL_CLOSURE)
+-            return True
++            reader = self._reader
++            assert reader is not None
++            # we need to break `receive()` cycle before we can call
++            # `reader.read()` as `close()` may be called from different task
++            if self._waiting:
++                assert self._loop is not None
++                assert self._close_wait is None
++                self._close_wait = self._loop.create_future()
++                reader.feed_data(WS_CLOSING_MESSAGE, 0)
++                await self._close_wait
++
++            if self._closing:
++                self._close_transport()
++                return True
++
++            try:
++                async with async_timeout.timeout(self._timeout):
++                    while True:
++                        msg = await reader.read()
++                        if msg.type is WSMsgType.CLOSE:
++                            self._set_code_close_transport(msg.data)
++                            return True
++            except asyncio.CancelledError:
++                self._set_code_close_transport(WSCloseCode.ABNORMAL_CLOSURE)
++                raise
++            except Exception as exc:
++                self._exception = exc
++                self._set_code_close_transport(WSCloseCode.ABNORMAL_CLOSURE)
++                return True
++        finally:
++            # Once closed the response can no longer be drained; release the
++            # parser and the stash it retains.
++            self._parser = None
+ 
+     def _set_closing(self, code: WSCloseCode) -> None:
+         """Set the close code and mark the connection as closing."""
+diff --git a/tests/test_client_ws_functional.py b/tests/test_client_ws_functional.py
+index a67769c..0bb1288 100644
+--- a/tests/test_client_ws_functional.py
++++ b/tests/test_client_ws_functional.py
+@@ -1,4 +1,9 @@
+ import asyncio
++import base64
++import contextlib
++import gc
++import hashlib
++import socket
+ import struct
+ import sys
+ import zlib
+@@ -19,7 +24,7 @@ from aiohttp import (
+ from aiohttp._websocket.reader import WebSocketDataQueue
+ from aiohttp._websocket.models import WS_DEFLATE_TRAILING
+ from aiohttp.client_ws import ClientWSTimeout
+-from aiohttp.http import WebSocketError, WSCloseCode
++from aiohttp.http import WS_KEY, WebSocketError, WSCloseCode
+ from aiohttp.pytest_plugin import AiohttpClient
+ 
+ if sys.version_info >= (3, 11):
+@@ -1314,3 +1319,159 @@ async def test_client_rejects_compressed_frame_without_negotiation(
+     assert msg.type is WSMsgType.ERROR, msg
+     assert isinstance(msg.data, WebSocketError)
+     assert msg.data.code == WSCloseCode.PROTOCOL_ERROR
++
++
++async def test_stashed_frames_survive_connection_loss(
++    unused_port_socket: socket.socket,
++) -> None:
++    """Frames stashed by receive-queue backpressure outlive the connection.
++
++    Mirror of the server-side test: a peer can pack more complete frames into
++    one read than the queue's high-water mark allows, so the parser stalls
++    with the rest in its tail. ``connection_lost()`` drops the protocol's
++    reference to the parser, so only ``ClientWebSocketResponse._parser`` keeps
++    it alive; without that the queue's weak link dies and the stash is lost.
++    """
++    sent = 8000
++
++    writers: list[asyncio.StreamWriter] = []
++
++    async def raw_server(
++        reader: asyncio.StreamReader, writer: asyncio.StreamWriter
++    ) -> None:
++        writers.append(writer)
++        request = await reader.readuntil(b"\r\n\r\n")
++        key = next(
++            line.split(b":", 1)[1].strip()
++            for line in request.split(b"\r\n")
++            if line.lower().startswith(b"sec-websocket-key")
++        )
++        accept = base64.b64encode(hashlib.sha1(key + WS_KEY).digest())
++        writer.write(
++            b"HTTP/1.1 101 Switching Protocols\r\n"
++            b"Upgrade: websocket\r\n"
++            b"Connection: Upgrade\r\n"
++            b"Sec-WebSocket-Accept: " + accept + b"\r\n\r\n"
++            # One oversized read: empty unmasked TEXT frames, 2 bytes each.
++            + b"\x81\x00" * sent
++        )
++        await writer.drain()
++
++    server = await asyncio.start_server(raw_server, sock=unused_port_socket)
++    port = unused_port_socket.getsockname()[1]
++    try:
++        async with aiohttp.ClientSession() as session:
++            ws = await session.ws_connect(f"http://127.0.0.1:{port}/")
++            queue = ws._reader
++            # Usually the whole burst rides along with the 101 response and
++            # is parsed before ws_connect() returns, so the wait is a
++            # fallback for split reads only.
++            for _ in range(1000):  # pragma: no cover
++                if queue._stalled_reader is not None:
++                    break
++                await asyncio.sleep(0.01)
++            assert queue._stalled_reader is not None, "parser never stalled"
++            stalled = len(queue._buffer)
++
++            # Tear the connection down for real: closing the transport is what
++            # drives connection_lost(), which drops the protocol's reference to
++            # the parser. A paused transport never sees the peer's FIN, so this
++            # cannot be triggered by the peer going away.
++            connection = ws._conn
++            assert connection is not None
++            protocol = connection.protocol
++            assert protocol is not None
++            assert protocol.transport is not None
++            protocol.transport.close()
++            for _ in range(1000):  # pragma: no branch
++                if protocol._payload_parser is None:
++                    break
++                await asyncio.sleep(0)
++            assert protocol._payload_parser is None, "connection_lost never ran"
++
++            count = 0
++            while (msg := await ws.receive()).type is WSMsgType.TEXT:
++                count += 1
++            # A clean drain ends with the queue's close, not an error.
++            assert msg.type is WSMsgType.CLOSED
++    finally:
++        for writer in writers:
++            writer.close()
++            with contextlib.suppress(Exception):
++                await writer.wait_closed()
++        server.close()
++        await server.wait_closed()
++
++    assert stalled < count <= sent
++
++
++async def test_stalled_parser_outlives_connection_lost(
++    aiohttp_client: AiohttpClient,
++) -> None:
++    """Frames the parser stopped short of are delivered after the peer vanishes.
++
++    Once the queue is over its high-water mark the parser stops mid-read and
++    parks the rest of the read on itself, reachable from the queue only through
++    a weak reference. Connection loss releases the protocol's reference to the
++    parser, so the response has to be the owner or those frames are collected
++    and the application silently sees a short stream.
++    """
++
++    async def handler(request: web.Request) -> web.WebSocketResponse:
++        ws = web.WebSocketResponse()
++        await ws.prepare(request)
++        # Hold the connection open. TestServer cancels the handler on
++        # connection loss; swallow it so the handler exits normally.
++        with contextlib.suppress(asyncio.CancelledError):
++            await ws.receive()
++        return ws
++
++    app = web.Application()
++    app.router.add_get("/", handler)
++    client = await aiohttp_client(app)
++    ws = await client.ws_connect("/")
++
++    # Empty server->client TEXT frames: two bytes on the wire, but each one is
++    # charged MSG_SIZE_OVERHEAD in the queue, so a single read crosses the
++    # high-water mark and the parser stalls part way through it.
++    sent = 8000
++    assert ws._conn is not None
++    protocol = ws._conn.protocol
++    assert protocol is not None
++    transport = protocol.transport
++    assert transport is not None
++    protocol.data_received(b"\x81\x00" * sent)
++    assert ws._reader._stalled_reader is not None, "parser never stalled"
++
++    # Simulate the peer vanishing: the socket is gone and the protocol drops
++    # its reference to the parser, exactly as the event loop would do it.
++    transport.abort()
++    protocol.connection_lost(None)
++    for _ in range(3):  # PyPy can need more than one pass
++        gc.collect()
++
++    count = 0
++    while (await ws.receive()).type is not WSMsgType.CLOSED:
++        count += 1
++    assert count == sent
++    # Exhausting the queue releases the parser and the stash it retains.
++    assert ws._parser is None
++
++
++async def test_close_releases_parser(aiohttp_client: AiohttpClient) -> None:
++    """A normal close handshake releases the parser and the state it holds."""
++
++    async def handler(request: web.Request) -> web.WebSocketResponse:
++        ws = web.WebSocketResponse()
++        await ws.prepare(request)
++        await ws.receive()  # the peer's CLOSE
++        return ws
++
++    app = web.Application()
++    app.router.add_get("/", handler)
++    client = await aiohttp_client(app)
++    resp = await client.ws_connect("/")
++
++    assert resp._parser is not None
++    await resp.close()
++    assert resp._parser is None
+diff --git a/tests/test_web_websocket_functional.py b/tests/test_web_websocket_functional.py
+index 6035b77..c607d17 100644
+--- a/tests/test_web_websocket_functional.py
++++ b/tests/test_web_websocket_functional.py
+@@ -2,6 +2,8 @@
+ 
+ import asyncio
+ import contextlib
++import gc
++import socket
+ import sys
+ import weakref
+ from typing import Any, NoReturn, Optional
+@@ -1577,3 +1579,179 @@ async def test_pipelined_request_after_two_declined_upgrades(
+ 
+     assert handled == ["/second"]
+     assert data.count(b"HTTP/1.1 426 ") == 2, data
++
++
++async def test_stashed_frames_survive_connection_loss(
++    unused_port_socket: socket.socket,
++) -> None:
++    """Frames stashed by receive-queue backpressure outlive the connection.
++
++    A peer can pack far more complete frames into one read than the queue's
++    high-water mark allows, so the parser stops part-way and leaves the rest
++    in its tail. ``connection_lost()`` then drops the protocol's reference to
++    the parser, so only ``WebSocketResponse._parser`` keeps it alive; without
++    that the queue's weak link dies with the connection and every stashed
++    frame is silently lost.
++    """
++    sent = 8000
++    # (frames queued when the parser stalled, frames delivered in total)
++    received: asyncio.Future[tuple[int, int]] = (
++        asyncio.get_running_loop().create_future()
++    )
++
++    async def handler(request: web.Request) -> web.WebSocketResponse:
++        ws = web.WebSocketResponse()
++        await ws.prepare(request)
++        try:
++            queue = ws._reader
++            assert queue is not None
++
++            # Wait for the parser to stall with frames still stashed in its
++            # tail. The transport is paused from here, so the peer's FIN
++            # cannot be observed until reading resumes.
++            for _ in range(1000):  # pragma: no branch
++                if queue._stalled_reader is not None:
++                    break
++                await asyncio.sleep(0.01)
++            assert queue._stalled_reader is not None, "parser never stalled"
++            stalled = len(queue._buffer)
++
++            # Tear the connection down for real: closing the transport is
++            # what drives connection_lost(), which drops the protocol's only
++            # reference to the parser, leaving ws._parser holding it.
++            protocol = request.protocol
++            transport = protocol.transport
++            assert transport is not None
++            transport.close()
++            for _ in range(1000):  # pragma: no branch
++                if protocol._payload_parser is None:
++                    break
++                await asyncio.sleep(0)
++            assert protocol._payload_parser is None, "connection_lost never ran"
++
++            count = 0
++            while (msg := await ws.receive()).type is WSMsgType.TEXT:
++                count += 1
++            # A clean drain ends with the queue's close, not an error.
++            assert msg.type is WSMsgType.CLOSED
++
++            received.set_result((stalled, count))
++        except Exception as exc:  # pragma: no cover
++            # Surface handler failures instead of an opaque timeout.
++            received.set_exception(exc)
++            raise
++        return ws
++
++    # A plain AppRunner, not the aiohttp_server fixture: TestServer forces
++    # handler_cancellation=True, which kills the handler on connection loss.
++    # Production defaults to False, and that is the case where the stash
++    # still has to be drainable.
++    app = web.Application()
++    app.router.add_route("GET", "/ws", handler)
++    runner = web.AppRunner(app)
++    await runner.setup()
++    try:
++        await web.SockSite(runner, unused_port_socket).start()
++        port = unused_port_socket.getsockname()[1]
++
++        reader, writer = await asyncio.open_connection("127.0.0.1", port)
++        try:
++            writer.write(_RAW_UPGRADE)
++            await writer.drain()
++            await asyncio.wait_for(reader.readuntil(b"\r\n\r\n"), timeout=5)
++
++            # Written as one call, but whether it arrives as one read is the
++            # kernel's choice.
++            writer.write(b"\x81\x80\x00\x00\x00\x00" * sent)
++            await writer.drain()
++
++            stalled, count = await asyncio.wait_for(received, timeout=10)
++            assert stalled < count <= sent
++        finally:
++            writer.close()
++            with contextlib.suppress(ConnectionResetError):
++                await writer.wait_closed()
++    finally:
++        await runner.cleanup()
++
++
++async def test_stalled_parser_outlives_connection_lost(
++    aiohttp_client: AiohttpClient,
++) -> None:
++    """Frames the parser stopped short of are delivered after the peer vanishes.
++
++    Once the queue is over its high-water mark the parser stops mid-read and
++    parks the rest of the read on itself, reachable from the queue only through
++    a weak reference. Connection loss releases the protocol's reference to the
++    parser, so the response has to be the owner or those frames are collected
++    and the handler silently sees a short stream.
++    """
++    sent = 8000
++    received: asyncio.Future[int] = asyncio.get_running_loop().create_future()
++
++    async def handler(request: web.Request) -> web.WebSocketResponse:
++        ws = web.WebSocketResponse()
++        await ws.prepare(request)
++        try:
++            protocol = request.protocol
++            transport = request.transport
++            assert transport is not None
++            # Empty masked client->server TEXT frames: six bytes on the wire,
++            # but each one is charged MSG_SIZE_OVERHEAD in the queue, so a
++            # single read crosses the high-water mark and the parser stalls
++            # part way through.
++            protocol.data_received(b"\x81\x80\x00\x00\x00\x00" * sent)
++            queue = ws._reader
++            assert queue is not None
++            assert queue._stalled_reader is not None, "parser never stalled"
++
++            # Simulate the peer vanishing: the socket is gone and the
++            # protocol drops its reference to the parser, as the event loop
++            # would do it. Detach the handler task first: TestServer forces
++            # handler_cancellation=True (production defaults to False), and
++            # the cancellation would land on this very task at its next yield.
++            protocol._task_handler = None
++            transport.abort()
++            protocol.connection_lost(None)
++            for _ in range(3):  # PyPy can need more than one pass
++                gc.collect()
++
++            count = 0
++            while (await ws.receive()).type is not WSMsgType.CLOSED:
++                count += 1
++            # Exhausting the queue releases the parser and its stash.
++            assert ws._parser is None
++            received.set_result(count)
++        except Exception as exc:  # pragma: no cover
++            # Surface handler failures instead of an opaque timeout.
++            received.set_exception(exc)
++            raise
++        return ws
++
++    app = web.Application()
++    app.router.add_get("/", handler)
++    client = await aiohttp_client(app)
++    await client.ws_connect("/")
++
++    assert await asyncio.wait_for(received, 10) == sent
++
++
++async def test_close_releases_parser(aiohttp_client: AiohttpClient) -> None:
++    """A normal close handshake releases the parser and the state it holds."""
++    released: asyncio.Future[bool] = asyncio.get_running_loop().create_future()
++
++    async def handler(request: web.Request) -> web.WebSocketResponse:
++        ws = web.WebSocketResponse()
++        await ws.prepare(request)
++        assert ws._parser is not None
++        await ws.close()
++        released.set_result(ws._parser is None)
++        return ws
++
++    app = web.Application()
++    app.router.add_get("/", handler)
++    client = await aiohttp_client(app)
++    ws = await client.ws_connect("/")
++
++    await ws.receive()  # the server's CLOSE
++    assert await asyncio.wait_for(released, 5) is True
+diff --git a/tests/test_websocket_parser.py b/tests/test_websocket_parser.py
+index c3ec201..22a469d 100644
+--- a/tests/test_websocket_parser.py
++++ b/tests/test_websocket_parser.py
+@@ -1,8 +1,10 @@
+ import asyncio
++import gc
+ import pickle
+ import random
+ import struct
+ import sys
++import weakref
+ from typing import Union
+ from unittest import mock
+ 
+@@ -19,6 +21,7 @@ from aiohttp._websocket.helpers import (
+ )
+ from aiohttp._websocket.models import WS_DEFLATE_TRAILING
+ from aiohttp._websocket.reader import WebSocketDataQueue
++from aiohttp._websocket.reader_py import MSG_SIZE_OVERHEAD
+ from aiohttp._websocket.reader_py import (
+     WebSocketDataQueue as PyWebSocketDataQueue,
+     WebSocketReader as PyWebSocketReader,
+@@ -27,6 +30,7 @@ from aiohttp.base_protocol import BaseProtocol
+ from aiohttp.compression_utils import ZLibBackend
+ from aiohttp.http import WebSocketError, WSCloseCode, WSMessage, WSMsgType
+ from aiohttp.http_websocket import WebSocketReader
++from aiohttp.streams import EofStream
+ 
+ 
+ class PatchableWebSocketReader(WebSocketReader):
+@@ -1008,3 +1012,360 @@ async def test_max_msg_size_zero_opts_out_of_the_fold(
+     parser.feed_data(b"x")
+     msg = await out.read()
+     assert msg.data == b"x" * payload_len
++
++
++DEFAULT_CHUNK_SIZE = 256 * 1024
++
++
++def _compressed_burst(payload: bytes, count: int) -> bytes:
++    """`count` complete, independently deflated BINARY messages in one read."""
++    return (
++        build_frame(payload, WSMsgType.BINARY, ZLibBackend=ZLibBackend, use_mask=True)
++        * count
++    )
++
++
++async def test_empty_messages_apply_backpressure(protocol: BaseProtocol) -> None:
++    # Zero-length messages are not free: each one is a queued object. They used
++    # to add nothing to the queue's byte counter, so a peer could stream empty
++    # frames forever without the transport ever being paused.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 4 * 1024 * 1024, compress=False)
++
++    sent = 10000
++    parser.feed_data(build_frame(b"", WSMsgType.TEXT, use_mask=True) * sent)
++
++    assert protocol._reading_paused is True
++    assert len(out._buffer) < sent
++    # Overshoot is capped at the one message that crossed the mark.
++    assert out._size <= out._limit + MSG_SIZE_OVERHEAD
++
++
++async def test_compressed_burst_stops_at_high_water(protocol: BaseProtocol) -> None:
++    # permessage-deflate reaches ~1000:1, so a single read can carry dozens of
++    # complete frames that each inflate to max_msg_size. pause_reading() only
++    # stops the transport from delivering more data; the parser has to stop
++    # too, or the whole read is inflated into the queue in one go.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=True)
++
++    payload = b"\0" * (512 * 1024)
++    burst = _compressed_burst(payload, 32)
++    assert len(burst) < 2**16  # the whole burst is one plausible socket read
++
++    parser.feed_data(burst)
++
++    assert protocol._reading_paused is True
++    # Overshoot is capped at the one message that crossed the mark, not the
++    # 16 MiB the peer asked us to inflate.
++    assert len(out._buffer) == 1
++
++
++async def test_read_arriving_over_high_water_inflates_nothing(
++    protocol: BaseProtocol,
++) -> None:
++    # pause_reading() does not retract a read already in flight (the proactor
++    # transport completes its outstanding overlapped read, and a transport
++    # without flow control ignores the pause entirely). Such a read must not
++    # buy the peer one more inflated message before the parser stops again.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=True)
++
++    payload = b"\0" * (512 * 1024)
++    parser.feed_data(_compressed_burst(payload, 2))
++    assert len(out._buffer) == 1
++
++    # Lands while the queue is still over the mark and nothing has drained.
++    parser.feed_data(_compressed_burst(payload, 2))
++    assert len(out._buffer) == 1
++
++    # All four are still delivered once the application catches up.
++    for _ in range(4):
++        msg = await asyncio.wait_for(out.read(), 5)
++        assert msg.data == payload
++
++
++async def test_backpressure_does_not_drop_stashed_frames(
++    protocol: BaseProtocol,
++) -> None:
++    # The frames the parser stopped short of must still be delivered as the
++    # application drains the queue, with no further socket data to drive it.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=True)
++
++    payload = b"\0" * (512 * 1024)
++    parser.feed_data(_compressed_burst(payload, 32))
++
++    for _ in range(32):
++        msg = await asyncio.wait_for(out.read(), 5)
++        assert msg.data == payload
++
++    assert not out._buffer
++    # feed_data() adds MSG_SIZE_OVERHEAD and _read_from_buffer() subtracts it;
++    # _size is an unsigned int under Cython, so if those ever drift the
++    # subtraction wraps to ~4G rather than going negative. _size < _limit is
++    # then permanently false and the connection wedges silently: the transport
++    # is never resumed and the stalled parser is never driven again.
++    assert out._size == 0
++    assert protocol._reading_paused is False
++
++
++async def test_drain_resumes_parsing_in_batches(protocol: BaseProtocol) -> None:
++    # The parser is re-driven only at the low-water mark. Each resume
++    # re-slices the whole unparsed tail, so re-driving on every pop would
++    # make draining a burst of tiny messages quadratic in its size.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=False)
++
++    sent = 8000
++    parser.feed_data(build_frame(b"", WSMsgType.TEXT, use_mask=True) * sent)
++    stalled = len(out._buffer)
++    assert stalled < sent
++
++    # Above the low-water mark a pop must not re-drive the parser.
++    await asyncio.wait_for(out.read(), 5)
++    assert len(out._buffer) == stalled - 1
++
++    # The pop that reaches the low-water mark refills the queue in one batch.
++    low_water_msgs = (out._limit // 2) // MSG_SIZE_OVERHEAD
++    for _ in range(stalled - 1 - low_water_msgs):
++        await asyncio.wait_for(out.read(), 5)
++    assert len(out._buffer) > low_water_msgs
++    assert out._size > out._limit
++
++
++async def test_transport_stays_paused_while_stash_remains(
++    protocol: BaseProtocol,
++) -> None:
++    # Resuming the transport before the stash is exhausted would admit a
++    # fresh socket read into the tail for every couple of messages drained,
++    # moving the memory bound from the queue into the tail.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=False)
++
++    sent = 8000
++    parser.feed_data(build_frame(b"", WSMsgType.TEXT, use_mask=True) * sent)
++    assert protocol._reading_paused is True
++
++    count = 0
++    while out._stalled_reader is not None:
++        await asyncio.wait_for(out.read(), 5)
++        count += 1
++        if out._stalled_reader is not None:
++            assert protocol._reading_paused is True, f"resumed after {count} pops"
++    assert count < sent
++
++    # The pop that exhausted the stash resumed the transport.
++    assert protocol._reading_paused is False
++
++
++async def test_read_ending_on_frame_boundary_does_not_stall(
++    protocol: BaseProtocol,
++) -> None:
++    # A read that crosses the high-water mark but ends exactly on a frame
++    # boundary leaves nothing stashed, so the parser must not arm the stall;
++    # ordinary backpressure then resumes at the queue limit, not the low-water
++    # mark reserved for draining a stash.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 1024, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=False)
++
++    # 17 empty frames * MSG_SIZE_OVERHEAD crosses out._limit (2048); the whole
++    # burst is complete frames, so parsing ends with an empty tail.
++    parser.feed_data(build_frame(b"", WSMsgType.TEXT, use_mask=True) * 17)
++    assert out._size > out._limit
++    assert protocol._reading_paused is True
++    assert out._stalled_reader is None, "empty-tail read must not arm the stall"
++
++    # Draining back under the limit resumes well above _limit // 2, so the
++    # low-water mark reserved for stashes is not in play.
++    await asyncio.wait_for(out.read(), 5)
++    await asyncio.wait_for(out.read(), 5)
++    assert out._limit // 2 < out._size < out._limit
++    assert protocol._reading_paused is False
++
++
++async def test_backpressure_stash_survives_eof(protocol: BaseProtocol) -> None:
++    # A peer that bursts and then disconnects must not lose the tail: at EOF
++    # there is no resume to ride on, so draining has to keep driving the parser.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=True)
++
++    payload = b"\0" * (512 * 1024)
++    parser.feed_data(_compressed_burst(payload, 8))
++    parser.feed_eof()
++
++    for _ in range(8):
++        msg = await asyncio.wait_for(out.read(), 5)
++        assert msg.data == payload
++
++    with pytest.raises(EofStream):
++        await asyncio.wait_for(out.read(), 5)
++
++
++async def test_stalled_reader_reference_released_after_drain(
++    protocol: BaseProtocol,
++) -> None:
++    # The queue holds the reader back only while parsing is stalled. Keeping it
++    # any longer would leave reader <-> queue as a cycle outliving the
++    # connection, reclaimable only by the collector rather than by refcounting.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=True)
++
++    payload = b"\0" * (512 * 1024)
++    parser.feed_data(_compressed_burst(payload, 4))
++    stalled = out._stalled_reader
++    assert stalled is not None and stalled() is parser
++
++    for _ in range(4):
++        await asyncio.wait_for(out.read(), 5)
++
++    assert out._stalled_reader is None
++
++
++async def test_set_exception_still_delivers_stashed_frames(
++    protocol: BaseProtocol,
++) -> None:
++    # set_exception() is also the transport-died hook (WebSocketResponse._cancel).
++    # _read_from_buffer() only raises once the buffer is empty, so complete
++    # frames the parser stopped short of must still be delivered first, exactly
++    # as they were before the parser learned to stall.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, DEFAULT_CHUNK_SIZE, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=False)
++
++    sent = 8000
++    parser.feed_data(build_frame(b"", WSMsgType.TEXT, use_mask=True) * sent)
++    stalled = len(out._buffer)
++    assert stalled < sent
++
++    out.set_exception(ConnectionResetError())
++
++    for _ in range(sent):
++        await asyncio.wait_for(out.read(), 5)
++    with pytest.raises(ConnectionResetError):
++        await out.read()
++
++
++async def test_parse_error_abandons_the_stash(protocol: BaseProtocol) -> None:
++    # A parse error poisons the reader, so re-driving it from a drain is a
++    # no-op and the error surfaces once the buffer is empty.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=True)
++
++    payload = b"\0" * (512 * 1024)
++    # The reserved opcode sits behind the stash, so it is only reached on a
++    # drain-driven resume.
++    parser.feed_data(
++        _compressed_burst(payload, 3) + build_frame(b"", 0x3, use_mask=True)
++    )
++    stalled = out._stalled_reader
++    assert stalled is not None and stalled() is parser
++
++    for _ in range(3):
++        await asyncio.wait_for(out.read(), 5)
++    with pytest.raises(WebSocketError):
++        await asyncio.wait_for(out.read(), 5)
++
++
++async def test_queue_does_not_keep_stalled_reader_alive(
++    protocol: BaseProtocol,
++) -> None:
++    # The one case feed_eof() cannot clean up: the connection dies while
++    # parsing is stalled, then the application drops the response without
++    # draining. The queue's link back must be weak or reader <-> queue
++    # survives as a cycle that only the collector can reclaim.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=True)
++
++    parser.feed_data(_compressed_burst(b"\0" * (512 * 1024), 4))
++    parser.feed_eof()
++    # `parser` deliberately never appears in an assert: pytest's assertion
++    # rewriting keeps temporaries for the failure message, and a lingering
++    # reference to it would mask the very thing under test.
++    stalled = out._stalled_reader
++    assert stalled is not None
++
++    ref = weakref.ref(parser)
++    del parser, stalled
++    # `out` deliberately stays alive across the collection: a strong link back
++    # would keep the reader reachable from a live root, so this proves the link
++    # is weak rather than merely testing reclamation timing. Collect instead of
++    # disabling the gc -- PyPy has no refcounting to reclaim eagerly, and can
++    # need more than one pass to clear the weakref.
++    for _ in range(3):
++        gc.collect()
++
++    assert ref() is None, "queue kept the stalled reader alive"
++
++
++def _queue_with_collected_reader(
++    protocol: BaseProtocol, loop: asyncio.AbstractEventLoop, *, eof: bool
++) -> WebSocketDataQueue:
++    """A queue whose reader stalled on a burst and was then collected."""
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=True)
++    parser.feed_data(_compressed_burst(b"\0" * (512 * 1024), 4))
++    if eof:
++        parser.feed_eof()
++    del parser
++    for _ in range(3):
++        gc.collect()
++    return out
++
++
++async def test_collected_stalled_reader_surfaces_contract_error(
++    protocol: BaseProtocol, caplog: pytest.LogCaptureFixture
++) -> None:
++    # Every strong reference to the reader was dropped while it was stalled,
++    # so the stash is gone. Whatever was already queued is still delivered,
++    # then the contract violation surfaces instead of a silent short stream.
++    # It is also logged, for callers that stop reading before the exception.
++    loop = asyncio.get_running_loop()
++    out = _queue_with_collected_reader(protocol, loop, eof=True)
++
++    for _ in range(len(out._buffer)):
++        await asyncio.wait_for(out.read(), 5)
++    assert "must hold a strong reference" in caplog.text
++    with pytest.raises(RuntimeError, match="must hold a strong reference"):
++        await out.read()
++
++
++async def test_collected_stalled_reader_preserves_existing_exception(
++    protocol: BaseProtocol,
++) -> None:
++    # set_exception() is also the transport-died hook; losing the reader on
++    # top of that must not replace the real cause with the contract error.
++    loop = asyncio.get_running_loop()
++    out = _queue_with_collected_reader(protocol, loop, eof=False)
++    out.set_exception(ConnectionResetError())
++
++    for _ in range(len(out._buffer)):
++        await asyncio.wait_for(out.read(), 5)
++    with pytest.raises(ConnectionResetError):
++        await out.read()
++
++
++async def test_burst_under_high_water_is_parsed_in_one_read(
++    protocol: BaseProtocol,
++) -> None:
++    # Ordinary pipelined traffic that fits under the mark must not be stalled
++    # or split across reads by the backpressure check.
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, 1024 * 1024, compress=False)
++
++    parser.feed_data(build_frame(b"hello", WSMsgType.TEXT, use_mask=True) * 50)
++
++    assert len(out._buffer) == 50
++    assert protocol._reading_paused is False
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 91d11cf124..473ab87614 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -40,6 +40,7 @@ SRC_URI += " \
     file://CVE-2026-128127.patch \
     file://CVE-2026-128128.patch \
     file://CVE-2026-128129.patch \
+    file://CVE-2026-128132.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6

