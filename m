Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9C1CA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:44 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63547.1790617412808715790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VUawnaeF;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=37452; q=dns/txt;
  s=iport01; t=1790617413; x=1791827013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xnKXtIfCadqQPvj2ZLsr2kILT8JKxs6XpuMJAGU13Vk=;
  b=VUawnaeFA7YJfeazJmyXS+iYB16RTXqByo0SvPuiAxDfbohfsS/4AFDH
   5QPiOK7nYpQzeSSfOwq8p3keSP6RdhO+Ph2vrb4fLmz8Tq2qcFl2SfXmm
   OifHi10AK8OLjDCmqtsNDZ3v/Tp+XNCJiYLnHYnPRZDSvBLVyd6KCpYsl
   WFpUK1QQOVJt83Syrm8f08+PEsuvDfc2cycQ45BnIOHfyKuxp7eAWVDud
   EUnEr6XW2bngNovCn/fSHmfdq3UuFrx4GkNnvcKUtAjw7FfU7bs+trZ/a
   3kGDrj1XnQG9hr779LjOG5UC6vA2X8PNwv3apoJIsTJH2htbEBz7J7Pem
   w==;
X-CSE-ConnectionGUID: ocO5xfVIR52+NA8FBQKIlg==
X-CSE-MsgGUID: GEKqcl3/Rx24sVeutF44bg==
X-IPAS-Result: =?us-ascii?q?A0D1AwBOprpq/4r/Ja1aglmCGD91XAQaKUmWSgOLZIVlj?=
 =?us-ascii?q?FGBfg8BAQEPRA0EAQGEP0YCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDGgEMCwEYAS0QHAMBAi8gCyMIGYIqWAGCO?=
 =?us-ascii?q?gM3AxHCV4F5M4EBgykBPwJDUNhLDYJaAQsUAYE4hUCCf4UkXRgBg2uBEScbG?=
 =?us-ascii?q?4FygRWBO4IugQWBGkIBAYE4EAmGVASCIoEMgVqBA5JASIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4EHGwYFgR2BIIIZIxk2eoEJXoErKWABEBeBB4IHA?=
 =?us-ascii?q?oJUggECAUlDDgdFUwklQQoSRyYiCBIJARMaMAuBIThBCSgRGA1IESw3FRkEP?=
 =?us-ascii?q?m4HkC4eglMLBgEBFRswLQEHDBcBBHsGFQYTMggWARApBQYCMJJoAQFCApF6o?=
 =?us-ascii?q?B5xCiiDdowijz6FfBozhASBV5JAklQLmH2OCoQJkV8LDQNNhGmBaDyBRwsHc?=
 =?us-ascii?q?BU7gmcJShkPjisDCwuDYIF/yjonMgIJMgEBBwIHDgMLgWiEY4seASaBVgEB?=
IronPort-Data: A9a23:h9wXY6u1eB9bjBUpBQyGWFCPnufnVAZfMUV32f8akzHdYApBsoF/q
 tZmKTrXO6yIZTCmf4tyadvgoBtUvpHWmIM2TwNurn8wFCpEgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKs/PZ+Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/e1QXHFAy
 90idWpOSDnTqciP45O/Rbw57igjBJGD0II3oHpsy3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxHYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHTGZ4MzxnH/
 woq+UzWLzIDP9jEjgCVqC63uOLSgQ2nBIgdQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:JNHy46DT5WYeMb/lHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AXz2pc2vQoKvjg1h/IiZ1UWn96IsieVqA3HnuAnX?=
 =?us-ascii?q?lUyVPYe27Y2az2adrxp8=3D?=
X-Talos-MUID: 9a23:kXdUYAXb9Pzvg2Lq/BDBpyhpMJwv2bT0VFsznIgalZXYPyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="514319771"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id F39541800029F;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 65311CBEF6F; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 13/13] python3-aiohttp: fix CVE-2026-54273
Date: Mon, 28 Sep 2026 10:43:23 -0700
Message-Id: <20260928174323.1810308-14-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130452

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1]. The
advisory identifying the fix is referenced in [4].

The follow-up from [2] is kept as a separate recipe patch. It adapts
the declined WebSocket-upgrade replay from [3], applies the queue
pause after replay, and includes the corresponding regression tests.

The generated aiohttp/_http_parser.c changes are omitted. The
recipe-time Cython regeneration introduced with CVE-2025-69224
regenerates that file from the patched _http_parser.pyx before the
accelerated parser is compiled.

[1] https://github.com/aio-libs/aiohttp/commit/dfdfa9d5aad5d21f91c79fb2ceeba0f8046cb6cf
[2] https://github.com/aio-libs/aiohttp/commit/47babd8c23ca79e2bae6cc8dcb5752b61e369fc7
[3] https://github.com/aio-libs/aiohttp/commit/8943d34337c133aa2a33f1fd10a30950d8dcb20e
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-54273

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54273_p1.patch   | 798 ++++++++++++++++++
 .../python3-aiohttp/CVE-2026-54273_p2.patch   | 181 ++++
 .../python/python3-aiohttp_3.9.5.bb           |   2 +
 3 files changed, 981 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p1.patch
new file mode 100644
index 0000000000..2fc96d59a7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p1.patch
@@ -0,0 +1,798 @@
+From d41ceb6e193960ebd24867485cfcb396ab5f4fc7 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 7 Jun 2026 01:16:13 -0500
+Subject: [PATCH] [PR #12830/93a2b1c3 backport][3.14] Bound pipelined request
+ queue per connection (#12854)
+
+CVE: CVE-2026-54273
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/dfdfa9d5aad5d21f91c79fb2ceeba0f8046cb6cf]
+
+Backport Changes:
+- Adapted the C parser to retain paused input in an internal tail and
+  declared `llhttp_resume()`. aiohttp 3.9.5 predates the upstream
+  parser pause and resume plumbing.
+- Adapted `RequestHandler` and `BaseProtocol` field names and parser
+  ownership to the aiohttp 3.9.5 protocol layout. This preserves its
+  no-transport read-pause semantics.
+- Adapted regression tests to the 3.9.5 request-state and upgrade
+  field names, existing `2**16` parser-limit fixture, and older
+  typing imports. Omitted two unrelated tests from the upstream
+  parent that require the newer `data_received_cb` API.
+- Omitted generated `aiohttp/_http_parser.c` changes because the
+  Scarthgap recipe regenerates that file from `_http_parser.pyx`
+  during `do_configure`.
+
+(cherry picked from commit dfdfa9d5aad5d21f91c79fb2ceeba0f8046cb6cf)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12830.bugfix.rst     |   1 +
+ aiohttp/_cparser.pxd         |   1 +
+ aiohttp/_http_parser.pyx     |  52 ++++++++++++--
+ aiohttp/base_protocol.py     |  22 +++++-
+ aiohttp/http_parser.py       |  20 ++++++
+ aiohttp/web_protocol.py      |  69 +++++++++++++++++-
+ docs/spelling_wordlist.txt   |   1 +
+ tests/test_http_parser.py    |  72 +++++++++++++++++++
+ tests/test_web_functional.py | 133 ++++++++++++++++++++++++++++++++++-
+ tests/test_web_protocol.py   | 110 +++++++++++++++++++++++++++++
+ 10 files changed, 470 insertions(+), 11 deletions(-)
+ create mode 100644 CHANGES/12830.bugfix.rst
+ create mode 100644 tests/test_web_protocol.py
+
+diff --git a/CHANGES/12830.bugfix.rst b/CHANGES/12830.bugfix.rst
+new file mode 100644
+index 0000000..d44d76d
+--- /dev/null
++++ b/CHANGES/12830.bugfix.rst
+@@ -0,0 +1 @@
++Bounded the number of parsed-but-unhandled pipelined HTTP/1 requests buffered per connection on the server; once the queue reaches an internal limit the parser stops emitting and the transport is paused, resuming as the request handler drains the queue, so a client keeping one handler busy can no longer accumulate an unbounded backlog of pipelined requests -- by :user:`bdraco`.
+diff --git a/aiohttp/_cparser.pxd b/aiohttp/_cparser.pxd
+index c2cd5a9..b7de1d4 100644
+--- a/aiohttp/_cparser.pxd
++++ b/aiohttp/_cparser.pxd
+@@ -145,6 +145,7 @@ cdef extern from "../vendor/llhttp/build/llhttp.h":
+ 
+     int llhttp_should_keep_alive(const llhttp_t* parser)
+ 
++    void llhttp_resume(llhttp_t* parser)
+     void llhttp_resume_after_upgrade(llhttp_t* parser)
+ 
+     llhttp_errno_t llhttp_get_errno(const llhttp_t* parser)
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 89a0370..4eb5789 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -319,6 +319,9 @@ cdef class HttpParser:
+         list    _raw_headers
+         bint    _upgraded
+         list    _messages
++        bytes   _tail
++        Py_ssize_t _msg_in_flight
++        Py_ssize_t _max_msg_queue_size
+         object  _payload
+         bint    _payload_error
+         object  _payload_exception
+@@ -353,6 +356,7 @@ cdef class HttpParser:
+         size_t max_field_size=8190, payload_exception=None,
+         bint response_with_body=True, bint read_until_eof=False,
+         bint auto_decompress=True,
++        Py_ssize_t max_msg_queue_size=0,
+     ):
+         cparser.llhttp_settings_init(self._csettings)
+         cparser.llhttp_init(self._cparser, mode, self._csettings)
+@@ -364,6 +368,9 @@ cdef class HttpParser:
+         self._timer = timer
+ 
+         self._buf = bytearray()
++        self._tail = b''
++        self._msg_in_flight = 0
++        self._max_msg_queue_size = max_msg_queue_size
+         self._payload = None
+         self._payload_error = 0
+         self._payload_exception = payload_exception
+@@ -544,6 +551,11 @@ cdef class HttpParser:
+ 
+     ### Public API ###
+ 
++    def message_consumed(self):
++        # Protocol drained a queued message; free a slot for parsing.
++        if self._msg_in_flight > 0:
++            self._msg_in_flight -= 1
++
+     def feed_eof(self):
+         cdef bytes desc
+ 
+@@ -564,35 +576,55 @@ cdef class HttpParser:
+             if self._messages:
+                 return self._messages[-1][0]
+ 
+-    def feed_data(self, data):
++    def feed_data(self, incoming_data):
+         cdef:
+             size_t data_len
+             size_t nb
++            size_t pos
++            char* base
+             cdef cparser.llhttp_errno_t errno
++            cdef bytes data
++
++        if type(incoming_data) is not bytes:
++            data = bytes(incoming_data)
++        else:
++            data = incoming_data
++
++        if self._tail:
++            data, self._tail = self._tail + data, b''
+ 
+         PyObject_GetBuffer(data, &self.py_buf, PyBUF_SIMPLE)
++        base = <char*>self.py_buf.buf
+         data_len = <size_t>self.py_buf.len
+ 
+         errno = cparser.llhttp_execute(
+             self._cparser,
+-            <char*>self.py_buf.buf,
++            base,
+             data_len)
+ 
+         if errno is cparser.HPE_PAUSED_UPGRADE:
+             cparser.llhttp_resume_after_upgrade(self._cparser)
+ 
+-            nb = cparser.llhttp_get_error_pos(self._cparser) - <char*>self.py_buf.buf
++            nb = cparser.llhttp_get_error_pos(self._cparser) - base
++        elif errno is cparser.HPE_PAUSED:
++            cparser.llhttp_resume(self._cparser)
++            pos = cparser.llhttp_get_error_pos(self._cparser) - base
++            self._tail = data[pos:]
+ 
+         PyBuffer_Release(&self.py_buf)
+ 
+-        if errno not in (cparser.HPE_OK, cparser.HPE_PAUSED_UPGRADE):
++        if errno not in (
++            cparser.HPE_OK,
++            cparser.HPE_PAUSED,
++            cparser.HPE_PAUSED_UPGRADE,
++        ):
+             if self._payload_error == 0:
+                 if self._last_error is not None:
+                     ex = self._last_error
+                     self._last_error = None
+                 else:
+                     after = cparser.llhttp_get_error_pos(self._cparser)
+-                    before = data[:after - <char*>self.py_buf.buf]
++                    before = data[:after - base]
+                     after_b = after.split(b"\r\n", 1)[0]
+                     before = before.rsplit(b"\r\n", 1)[-1]
+                     data = before + after_b
+@@ -623,12 +655,12 @@ cdef class HttpRequestParser(HttpParser):
+         size_t max_line_size=8190, size_t max_headers=128,
+         size_t max_field_size=8190, payload_exception=None,
+         bint response_with_body=True, bint read_until_eof=False,
+-        bint auto_decompress=True,
++        bint auto_decompress=True, Py_ssize_t max_msg_queue_size=0,
+     ):
+         self._init(cparser.HTTP_REQUEST, protocol, loop, limit, timer,
+                    max_line_size, max_headers, max_field_size,
+                    payload_exception, response_with_body, read_until_eof,
+-                   auto_decompress)
++                   auto_decompress, max_msg_queue_size)
+ 
+     cdef object _on_status_complete(self):
+         cdef int idx1, idx2
+@@ -832,6 +864,12 @@ cdef int cb_on_message_complete(cparser.llhttp_t* parser) except -1:
+         pyparser._last_error = exc
+         return -1
+     else:
++        if pyparser._max_msg_queue_size:
++            pyparser._msg_in_flight += 1
++            if pyparser._msg_in_flight >= pyparser._max_msg_queue_size:
++                # Queue full: pause llhttp between messages. feed_data() buffers
++                # the remainder as tail; resumes once the queue drains.
++                return cparser.HPE_PAUSED
+         return 0
+ 
+ 
+diff --git a/aiohttp/base_protocol.py b/aiohttp/base_protocol.py
+index dc1f24f..bd4f931 100644
+--- a/aiohttp/base_protocol.py
++++ b/aiohttp/base_protocol.py
+@@ -4,6 +4,13 @@ from typing import Optional, cast
+ from .helpers import set_exception
+ from .tcp_helpers import tcp_nodelay
+ 
++# Raised by transport.pause_reading()/resume_reading() when the transport
++# does not support flow control; safe to ignore.
++# NOTE: Catch these with a plain try/except/pass, never contextlib.suppress():
++# pause/resume run on the hot read path and suppress() is ~6x slower than
++# try/except here (it builds a context manager and unpacks this tuple per call).
++PAUSE_RESUME_READING_ERRORS = (AttributeError, NotImplementedError, RuntimeError)
++
+ 
+ class BaseProtocol(asyncio.Protocol):
+     __slots__ = (
+@@ -46,15 +53,26 @@ class BaseProtocol(asyncio.Protocol):
+         if not self._reading_paused and self.transport is not None:
+             try:
+                 self.transport.pause_reading()
+-            except (AttributeError, NotImplementedError, RuntimeError):
++            except PAUSE_RESUME_READING_ERRORS:
++                # Transport lacks flow control; nothing to pause. Intentionally
++                # ignored (see PAUSE_RESUME_READING_ERRORS; do not use suppress).
+                 pass
+             self._reading_paused = True
+ 
++    def _reading_paused_for_msg_queue(self) -> bool:
++        """Keep the transport paused for protocol-specific reasons (overridden)."""
++        return False
++
+     def resume_reading(self) -> None:
+         if self._reading_paused and self.transport is not None:
++            self._reading_paused = False
++            if self._reading_paused_for_msg_queue():
++                return
+             try:
+                 self.transport.resume_reading()
+-            except (AttributeError, NotImplementedError, RuntimeError):
++            except PAUSE_RESUME_READING_ERRORS:
++                # Transport lacks flow control; nothing to resume. Intentionally
++                # ignored (see PAUSE_RESUME_READING_ERRORS; do not use suppress).
+                 pass
+             self._reading_paused = False
+ 
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 08950aa..6cf49c7 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -270,6 +270,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+         response_with_body: bool = True,
+         read_until_eof: bool = False,
+         auto_decompress: bool = True,
++        max_msg_queue_size: int = 0,
+     ) -> None:
+         self.protocol = protocol
+         self.loop = loop
+@@ -294,11 +295,19 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+         self._headers_parser = HeadersParser(
+             max_line_size, max_headers, max_field_size, self.lax
+         )
++        # Stop emitting messages once this many are queued unconsumed (0 = off).
++        self._max_msg_queue_size = max_msg_queue_size
++        self._msg_in_flight = 0
+ 
+     @abc.abstractmethod
+     def parse_message(self, lines: List[bytes]) -> _MsgT:
+         pass
+ 
++    def message_consumed(self) -> None:
++        """Protocol drained a queued message; free a slot for parsing."""
++        if self._msg_in_flight > 0:
++            self._msg_in_flight -= 1
++
+     def feed_eof(self) -> Optional[_MsgT]:
+         if self._payload_parser is not None:
+             self._payload_parser.feed_eof()
+@@ -340,6 +349,15 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+             # read HTTP message (request/response line + headers), \r\n\r\n
+             # and split by lines
+             if self._payload_parser is None and not self._upgraded:
++                if (
++                    self._max_msg_queue_size
++                    and self._msg_in_flight >= self._max_msg_queue_size
++                ):
++                    # Queue full: buffer the rest and stop. Safe pause point;
++                    # any preceding body is consumed before the next request
++                    # line. Resumes via feed_data(b"") when the queue drains.
++                    self._tail = data[start_pos:]
++                    break
+                 pos = data.find(SEP, start_pos)
+                 # consume \r\n
+                 if pos == start_pos and not self._lines:
+@@ -481,6 +499,8 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                             payload = EMPTY_PAYLOAD
+ 
+                         messages.append((msg, payload))
++                        if self._max_msg_queue_size:
++                            self._msg_in_flight += 1
+                 else:
+                     self._tail = data[start_pos:]
+                     if len(self._tail) > self.max_line_size:
+diff --git a/aiohttp/web_protocol.py b/aiohttp/web_protocol.py
+index a73bb43..baa0290 100644
+--- a/aiohttp/web_protocol.py
++++ b/aiohttp/web_protocol.py
+@@ -25,7 +25,7 @@ import attr
+ import yarl
+ 
+ from .abc import AbstractAccessLogger, AbstractStreamWriter
+-from .base_protocol import BaseProtocol
++from .base_protocol import PAUSE_RESUME_READING_ERRORS, BaseProtocol
+ from .helpers import ceil_timeout, set_exception
+ from .http import (
+     HttpProcessingError,
+@@ -44,6 +44,11 @@ from .web_response import Response, StreamResponse
+ 
+ __all__ = ("RequestHandler", "RequestPayloadError", "PayloadAccessError")
+ 
++# Max parsed-but-unhandled pipelined requests buffered per connection before
++# reading is paused. Bounds memory a client can pin by keeping one handler busy
++# and pipelining behind it; reading resumes as the queue drains.
++MAX_MSG_QUEUE_SIZE = 32
++
+ if TYPE_CHECKING:
+     from .web_server import Server
+ 
+@@ -150,6 +155,9 @@ class RequestHandler(BaseProtocol):
+         "_keepalive_timeout",
+         "_lingering_time",
+         "_messages",
++        "_max_msg_queue_size",
++        "_msg_queue_resume_size",
++        "_msg_queue_paused",
+         "_message_tail",
+         "_waiter",
+         "_task_handler",
+@@ -187,6 +195,14 @@ class RequestHandler(BaseProtocol):
+         auto_decompress: bool = True,
+         timeout_ceil_threshold: float = 5,
+     ):
++        self._max_msg_queue_size = MAX_MSG_QUEUE_SIZE
++        # Low-water mark: resume reading once the queue drains to half the limit
++        # so we refill in batches instead of churning pause/resume per request.
++        self._msg_queue_resume_size = MAX_MSG_QUEUE_SIZE // 2
++        # Set before super().__init__ so _reading_paused_for_msg_queue() is safe
++        # if BaseProtocol ever triggers a resume during init.
++        self._msg_queue_paused = False
++
+         super().__init__(loop)
+ 
+         self._request_count = 0
+@@ -224,6 +240,7 @@ class RequestHandler(BaseProtocol):
+             max_headers=max_headers,
+             payload_exception=RequestPayloadError,
+             auto_decompress=auto_decompress,
++            max_msg_queue_size=MAX_MSG_QUEUE_SIZE,
+         )
+ 
+         self._timeout_ceil_threshold: float = 5
+@@ -371,6 +388,14 @@ class RequestHandler(BaseProtocol):
+                 # don't set result twice
+                 waiter.set_result(None)
+ 
++            # Queue full: pause the transport (the parser already stopped
++            # emitting). start() resumes as it drains the queue.
++            if (
++                not self._msg_queue_paused
++                and len(self._messages) >= self._max_msg_queue_size
++            ):
++                self._pause_msg_queue_reading()
++
+             self._upgrade = upgraded
+             if upgraded and tail:
+                 self._message_tail = tail
+@@ -385,6 +410,36 @@ class RequestHandler(BaseProtocol):
+             if eof:
+                 self.close()
+ 
++    def _reading_paused_for_msg_queue(self) -> bool:
++        return self._msg_queue_paused
++
++    def _pause_msg_queue_reading(self) -> None:
++        self._msg_queue_paused = True
++        if self.transport is not None:
++            try:
++                self.transport.pause_reading()
++            except PAUSE_RESUME_READING_ERRORS:
++                # Transport lacks flow control; nothing to pause. Intentionally
++                # ignored (see PAUSE_RESUME_READING_ERRORS; do not use suppress).
++                pass
++
++    def _resume_msg_queue_reading(self) -> None:
++        if not self._upgrade:
++            # Reparse buffered pipelined requests while still marked paused so
++            # a refill past the limit does not re-pause an already-paused
++            # transport; only resume below once it stayed under the limit.
++            self.data_received(b"")
++            if len(self._messages) >= self._max_msg_queue_size:
++                return
++        self._msg_queue_paused = False
++        if not self._reading_paused and self.transport is not None:
++            try:
++                self.transport.resume_reading()
++            except PAUSE_RESUME_READING_ERRORS:
++                # Transport lacks flow control; nothing to resume. Intentionally
++                # ignored (see PAUSE_RESUME_READING_ERRORS; do not use suppress).
++                pass
++
+     def keep_alive(self, val: bool) -> None:
+         """Set keep-alive connection mode.
+ 
+@@ -517,6 +572,18 @@ class RequestHandler(BaseProtocol):
+ 
+             message, payload = self._messages.popleft()
+ 
++            # Free a parser slot; resume reading once drained to low water so
++            # pipelining keeps flowing while this request is handled.
++            # no branch: _request_parser is only None after connection_lost,
++            # whose path exits this loop, so the None case is not reachable.
++            if self._request_parser is not None:  # pragma: no branch
++                self._request_parser.message_consumed()
++            if (
++                self._msg_queue_paused
++                and len(self._messages) <= self._msg_queue_resume_size
++            ):
++                self._resume_msg_queue_reading()
++
+             start = loop.time()
+ 
+             manager.requests_count += 1
+diff --git a/docs/spelling_wordlist.txt b/docs/spelling_wordlist.txt
+index 34399e6..3fb6d35 100644
+--- a/docs/spelling_wordlist.txt
++++ b/docs/spelling_wordlist.txt
+@@ -228,6 +228,7 @@ peername
+ performant
+ pickleable
+ ping
++pipelined
+ pipelining
+ pluggable
+ plugin
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 24b4e50..213761c 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -111,6 +111,78 @@ def test_c_parser_loaded():
+     assert "RawResponseMessageC" in dir(aiohttp.http_parser)
+ 
+ 
++_PIPELINED_GET = b"GET / HTTP/1.1\r\nHost: a\r\n\r\n"
++
++
++def _build_request_parser(
++    request_cls: type[HttpRequestParser],
++    protocol: BaseProtocol,
++    loop: asyncio.AbstractEventLoop,
++    max_msg_queue_size: int,
++) -> HttpRequestParser:
++    return request_cls(
++        protocol,
++        loop,
++        2**16,
++        max_line_size=8190,
++        max_headers=128,
++        max_field_size=8190,
++        max_msg_queue_size=max_msg_queue_size,
++    )
++
++
++def test_max_msg_queue_size_caps_emitted_messages(
++    request_cls: type[HttpRequestParser],
++    protocol: BaseProtocol,
++    loop: asyncio.AbstractEventLoop,
++) -> None:
++    parser = _build_request_parser(request_cls, protocol, loop, 4)
++    messages, upgraded, _tail = parser.feed_data(_PIPELINED_GET * 10)
++    assert len(messages) == 4
++    assert not upgraded
++
++
++def test_max_msg_queue_size_resumes_after_consume(
++    request_cls: type[HttpRequestParser],
++    protocol: BaseProtocol,
++    loop: asyncio.AbstractEventLoop,
++) -> None:
++    limit = 4
++    total = 10
++    parser = _build_request_parser(request_cls, protocol, loop, limit)
++    messages, _upgraded, _tail = parser.feed_data(_PIPELINED_GET * total)
++    seen = 0
++    while messages:
++        assert len(messages) <= limit
++        seen += len(messages)
++        for _msg, _payload in messages:
++            parser.message_consumed()
++        messages, _upgraded, _tail = parser.feed_data(b"")
++    assert seen == total
++
++
++def test_max_msg_queue_size_zero_is_unbounded(
++    request_cls: type[HttpRequestParser],
++    protocol: BaseProtocol,
++    loop: asyncio.AbstractEventLoop,
++) -> None:
++    parser = _build_request_parser(request_cls, protocol, loop, 0)
++    messages, _upgraded, _tail = parser.feed_data(_PIPELINED_GET * 50)
++    assert len(messages) == 50
++
++
++def test_message_consumed_underflow_is_ignored(
++    request_cls: type[HttpRequestParser],
++    protocol: BaseProtocol,
++    loop: asyncio.AbstractEventLoop,
++) -> None:
++    parser = _build_request_parser(request_cls, protocol, loop, 4)
++    # No message is in flight; consuming must not underflow the counter.
++    parser.message_consumed()
++    messages, _upgraded, _tail = parser.feed_data(_PIPELINED_GET * 4)
++    assert len(messages) == 4
++
++
+ def test_parse_headers(parser: Any) -> None:
+     text = b"""GET /test HTTP/1.1\r
+ test: a line\r
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index e6d01bf..533b132 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -5,7 +5,7 @@ import pathlib
+ import socket
+ import zlib
+ from contextlib import suppress
+-from typing import Any, Optional
++from typing import Any, NoReturn, Optional
+ from unittest import mock
+ 
+ import pytest
+@@ -27,6 +27,7 @@ from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
+ from aiohttp.streams import StreamReader
+ from aiohttp.test_utils import make_mocked_coro
+ from aiohttp.typedefs import Handler
++from aiohttp.web_protocol import MAX_MSG_QUEUE_SIZE, RequestHandler
+ 
+ try:
+     import brotlicffi as brotli
+@@ -1620,6 +1621,136 @@ async def test_response_prepared_with_clone(aiohttp_client) -> None:
+     await resp.release()
+ 
+ 
++async def test_http1_pipelined_requests_are_count_limited(
++    aiohttp_server: AiohttpServer,
++    monkeypatch: pytest.MonkeyPatch,
++) -> None:
++    """Requests pipelined behind a busy handler must not grow unbounded.
++
++    A client can keep one handler active and pipeline many complete requests
++    behind it; the per-connection queue stays bounded by MAX_MSG_QUEUE_SIZE.
++    """
++    pipelined_requests = 500
++    slow_handler_started = asyncio.Event()
++    queue_observed = asyncio.Event()
++    max_queued = 0
++    data_received = RequestHandler.data_received
++
++    def observe_data_received(self: RequestHandler, data: bytes) -> None:
++        nonlocal max_queued
++        data_received(self, data)
++        if self._current_request is not None and self._messages:
++            max_queued = max(max_queued, len(self._messages))
++            queue_observed.set()
++
++    monkeypatch.setattr(RequestHandler, "data_received", observe_data_received)
++
++    async def slow_handler(request: web.Request) -> web.Response:
++        slow_handler_started.set()
++        await asyncio.sleep(0.5)
++        return web.Response(text="slow")
++
++    async def fast_handler(request: web.Request) -> NoReturn:
++        # The pipelined requests are only counted, never handled: the test
++        # closes the connection while the slow handler still holds the loop.
++        assert False
++
++    app = web.Application()
++    app.router.add_get("/slow", slow_handler)
++    app.router.add_get("/x", fast_handler)
++    server = await aiohttp_server(app)
++
++    def raw_get(path: str) -> bytes:
++        return (
++            f"GET {path} HTTP/1.1\r\nHost: localhost\r\n"
++            "Connection: keep-alive\r\n\r\n"
++        ).encode("ascii")
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(raw_get("/slow"))
++        await writer.drain()
++        await asyncio.wait_for(slow_handler_started.wait(), 1)
++
++        writer.write(raw_get("/x") * pipelined_requests)
++        await writer.drain()
++        await asyncio.wait_for(queue_observed.wait(), 1)
++    finally:
++        writer.close()
++        with suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    # Tight lower bound also catches over-aggressive pausing (e.g. clamping to 1).
++    assert MAX_MSG_QUEUE_SIZE // 2 < max_queued <= MAX_MSG_QUEUE_SIZE
++
++
++async def test_http1_pipelined_queue_resumes_after_drain(
++    aiohttp_server: AiohttpServer,
++    monkeypatch: pytest.MonkeyPatch,
++) -> None:
++    """A paused pipeline queue resumes reading once handlers drain it.
++
++    Once enough requests are pipelined behind a busy handler to fill the queue,
++    reading is paused; as the handlers drain the queue past the low-water mark
++    reading must resume so the remaining buffered requests are still served.
++    """
++    # Several times the limit so the queue refills and re-pauses while draining.
++    pipelined_requests = MAX_MSG_QUEUE_SIZE * 3
++    first_started = asyncio.Event()
++    release_first = asyncio.Event()
++    resumed = asyncio.Event()
++    handled: list[str] = []
++    all_handled = asyncio.Event()
++
++    resume = RequestHandler._resume_msg_queue_reading
++
++    def observe_resume(self: RequestHandler) -> None:
++        resume(self)
++        resumed.set()
++
++    monkeypatch.setattr(RequestHandler, "_resume_msg_queue_reading", observe_resume)
++
++    async def handler(request: web.Request) -> web.Response:
++        if request.path == "/first":
++            first_started.set()
++            await release_first.wait()
++        handled.append(request.path)
++        if len(handled) == pipelined_requests + 1:
++            all_handled.set()
++        return web.Response()
++
++    app = web.Application()
++    app.router.add_get("/{tail:.*}", handler)
++    server = await aiohttp_server(app)
++
++    def raw_get(path: str) -> bytes:
++        return (
++            f"GET {path} HTTP/1.1\r\nHost: localhost\r\n"
++            "Connection: keep-alive\r\n\r\n"
++        ).encode("ascii")
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(raw_get("/first"))
++        await writer.drain()
++        await asyncio.wait_for(first_started.wait(), 1)
++
++        writer.write(b"".join(raw_get(f"/r{i}") for i in range(pipelined_requests)))
++        await writer.drain()
++
++        # Let the busy handler finish so the queue drains and reading resumes.
++        release_first.set()
++        await asyncio.wait_for(resumed.wait(), 5)
++        # Every pipelined request is still served only if reading resumed.
++        await asyncio.wait_for(all_handled.wait(), 5)
++    finally:
++        writer.close()
++        with suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    assert len(handled) == pipelined_requests + 1
++
++
+ @pytest.mark.parametrize("decompressed_size", [4 * 1024 * 1024, 32 * 1024 * 1024])
+ async def test_unread_compressed_body_drain_is_bounded(
+     aiohttp_server: AiohttpServer,
+diff --git a/tests/test_web_protocol.py b/tests/test_web_protocol.py
+new file mode 100644
+index 0000000..dcda539
+--- /dev/null
++++ b/tests/test_web_protocol.py
+@@ -0,0 +1,110 @@
++import asyncio
++from unittest import mock
++
++import pytest
++
++from aiohttp.web_protocol import RequestHandler
++from aiohttp.web_server import Server
++
++
++@pytest.fixture
++def dummy_manager() -> Server:
++    return mock.create_autospec(
++        Server,
++        request_handler=mock.Mock(),
++        request_factory=mock.Mock(),
++        instance=True,
++    )  # type: ignore[no-any-return]
++
++
++def test_pause_msg_queue_reading_without_transport(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    """Pausing with no transport still records the paused state."""
++    handler = RequestHandler(dummy_manager, loop=loop)
++    handler.transport = None
++
++    handler._pause_msg_queue_reading()
++
++    assert handler._msg_queue_paused is True
++
++
++def test_resume_msg_queue_reading_after_upgrade_skips_reparse(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    """Resume after an upgrade clears the pause and resumes without reparsing."""
++    handler = RequestHandler(dummy_manager, loop=loop)
++    transport = mock.Mock()
++    handler.transport = transport
++    handler._upgrade = True
++    handler._msg_queue_paused = True
++    handler._reading_paused = False
++
++    with mock.patch.object(RequestHandler, "data_received") as data_received:
++        handler._resume_msg_queue_reading()
++
++    data_received.assert_not_called()
++    assert handler._msg_queue_paused is False
++    transport.resume_reading.assert_called_once_with()
++
++
++def test_resume_msg_queue_reading_without_transport(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    """Resume clears the pause but does not touch a missing transport."""
++    handler = RequestHandler(dummy_manager, loop=loop)
++    handler.transport = None
++    handler._upgrade = True  # skip the reparse branch
++    handler._msg_queue_paused = True
++
++    handler._resume_msg_queue_reading()
++
++    assert handler._msg_queue_paused is False
++
++
++def test_resume_reading_stays_paused_for_msg_queue(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    """Base resume_reading must not un-pause the transport while queue-paused."""
++    handler = RequestHandler(dummy_manager, loop=loop)
++    transport = mock.Mock()
++    handler.transport = transport
++    handler._msg_queue_paused = True
++
++    handler.resume_reading()
++
++    transport.resume_reading.assert_not_called()
++
++
++def test_pause_msg_queue_reading_ignores_unsupported_transport(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    """A transport without flow control raising on pause is ignored."""
++    handler = RequestHandler(dummy_manager, loop=loop)
++    # Bare asyncio.Transport.pause_reading() raises NotImplementedError.
++    handler.transport = asyncio.Transport()
++
++    handler._pause_msg_queue_reading()
++
++    assert handler._msg_queue_paused is True
++
++
++def test_resume_msg_queue_reading_ignores_unsupported_transport(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    """A transport without flow control raising on resume is ignored."""
++    handler = RequestHandler(dummy_manager, loop=loop)
++    # Bare asyncio.Transport.resume_reading() raises NotImplementedError.
++    handler.transport = asyncio.Transport()
++    handler._upgrade = True  # skip the reparse branch
++    handler._msg_queue_paused = True
++
++    handler._resume_msg_queue_reading()
++
++    assert handler._msg_queue_paused is False
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch
new file mode 100644
index 0000000000..d4f33b6c44
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch
@@ -0,0 +1,181 @@
+From d460210c19b97fde184843d17487e336698d59da Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sun, 9 Aug 2026 17:17:34 +0100
+Subject: [PATCH] [PR #13356/72eaa429 backport][3.14] Stop handing back
+ pipelined requests the parser buffered (#13360)
+
+**This is a backport of PR #13356 as merged into master
+(72eaa429cf89b1e20212590f3e704444239569fb).**
+
+---------
+
+Co-authored-by: Rodrigo Nogueira <rodrigo.b.nogueira@gmail.com>
+
+CVE: CVE-2026-54273
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/47babd8c23ca79e2bae6cc8dcb5752b61e369fc7]
+
+Backport Changes:
+- Adapted the required 8943d343 replay behavior to aiohttp 3.9.5
+  `_request_parser` and `_upgrade` fields. Replayed messages are
+  retained and queued, and the returned parser tail is preserved.
+- Applied the 47babd8c queue-pause check after replay and retained
+  its pure-Python parser tail fix, change note, parser test, and
+  declined-upgrade functional regression test.
+
+(cherry picked from commit 47babd8c23ca79e2bae6cc8dcb5752b61e369fc7)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13356.bugfix.rst     |  4 +++
+ aiohttp/http_parser.py       |  2 ++
+ aiohttp/web_protocol.py      | 18 +++++++++++--
+ tests/test_http_parser.py    | 18 +++++++++++++
+ tests/test_web_functional.py | 51 ++++++++++++++++++++++++++++++++++++
+ 5 files changed, 91 insertions(+), 2 deletions(-)
+ create mode 100644 CHANGES/13356.bugfix.rst
+
+diff --git a/CHANGES/13356.bugfix.rst b/CHANGES/13356.bugfix.rst
+new file mode 100644
+index 0000000..a961723
+--- /dev/null
++++ b/CHANGES/13356.bugfix.rst
+@@ -0,0 +1,4 @@
++Fixed requests pipelined behind a request whose upgrade the handler declined
++going unanswered once there were more of them than the per-connection queue
++holds. With the pure-Python parser the same requests were also served more
++than once -- by :user:`rodrigobnogueira`.
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 6cf49c7..37a0dff 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -357,6 +357,8 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                     # any preceding body is consumed before the next request
+                     # line. Resumes via feed_data(b"") when the queue drains.
+                     self._tail = data[start_pos:]
++                    # The remainder now lives in self._tail only. Don't return it.
++                    data = EMPTY
+                     break
+                 pos = data.find(SEP, start_pos)
+                 # consume \r\n
+diff --git a/aiohttp/web_protocol.py b/aiohttp/web_protocol.py
+index baa0290..39a1b68 100644
+--- a/aiohttp/web_protocol.py
++++ b/aiohttp/web_protocol.py
+@@ -687,8 +687,22 @@ class RequestHandler(BaseProtocol):
+             self._request_parser.set_upgraded(False)
+             self._upgrade = False
+             if self._message_tail:
+-                self._request_parser.feed_data(self._message_tail)
+-                self._message_tail = b""
++                messages, _upgraded, tail = self._request_parser.feed_data(
++                    self._message_tail
++                )
++                self._message_tail = tail
++                for msg, payload in messages:
++                    self._request_count += 1
++                    self._messages.append((msg, payload))
++                # Pause the transport, like in data_received().
++                if (
++                    not self._msg_queue_paused
++                    and len(self._messages) >= self._max_msg_queue_size
++                ):
++                    self._pause_msg_queue_reading()
++                # This shouldn't be possible. If a future refactor results in this
++                # failing, then the code may need to be updated to set the waiter.
++                assert self._waiter is None
+         try:
+             prepare_meth = resp.prepare
+         except AttributeError:
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 213761c..b29518a 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -142,6 +142,24 @@ def test_max_msg_queue_size_caps_emitted_messages(
+     assert not upgraded
+ 
+ 
++async def test_max_msg_queue_size_keeps_tail_to_itself(
++    request_cls: type[HttpRequestParser],
++    protocol: BaseProtocol,
++) -> None:
++    """The remainder is buffered for the next feed, so it must not be returned.
++
++    Handing it back as well gives the caller a second copy of bytes the parser
++    is already holding, and both copies get parsed.
++    """
++    loop = asyncio.get_running_loop()
++    parser = _build_request_parser(request_cls, protocol, loop, 4)
++
++    messages, _upgraded, tail = parser.feed_data(_PIPELINED_GET * 10)
++
++    assert len(messages) == 4
++    assert tail == b""
++
++
+ def test_max_msg_queue_size_resumes_after_consume(
+     request_cls: type[HttpRequestParser],
+     protocol: BaseProtocol,
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index 533b132..a0e3a8e 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -1751,6 +1751,57 @@ async def test_http1_pipelined_queue_resumes_after_drain(
+     assert len(handled) == pipelined_requests + 1
+ 
+ 
++async def test_http1_pipelined_behind_declined_upgrade_served_once(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    """Requests pipelined behind a declined upgrade are each served once.
++
++    The bytes following an upgrade request are buffered whole, then re-fed once
++    the handler answers it normally. More of them than the queue holds must
++    still be served, and none of them twice.
++    """
++    pipelined_requests = MAX_MSG_QUEUE_SIZE + 8
++    handled: list[str] = []
++    all_handled = asyncio.Event()
++
++    async def handler(request: web.Request) -> web.Response:
++        handled.append(request.path)
++        if len(handled) == pipelined_requests + 1:
++            all_handled.set()
++        return web.Response()
++
++    app = web.Application()
++    app.router.add_get("/{tail:.*}", handler)
++    server = await aiohttp_server(app)
++
++    def raw_get(path: str) -> bytes:
++        return (
++            f"GET {path} HTTP/1.1\r\nHost: localhost\r\n"
++            "Connection: keep-alive\r\n\r\n"
++        ).encode("ascii")
++
++    # An upgrade the handler answers normally, then the pipeline, in one write.
++    upgrade = (
++        b"GET /upgrade HTTP/1.1\r\nHost: localhost\r\n"
++        b"Connection: Upgrade\r\nUpgrade: websocket\r\n\r\n"
++    )
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(
++            upgrade + b"".join(raw_get(f"/r{i}") for i in range(pipelined_requests))
++        )
++        await writer.drain()
++        await asyncio.wait_for(all_handled.wait(), 10)
++    finally:
++        writer.close()
++        with suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    assert len(handled) == pipelined_requests + 1
++    assert len(set(handled)) == len(handled)
++
++
+ @pytest.mark.parametrize("decompressed_size", [4 * 1024 * 1024, 32 * 1024 * 1024])
+ async def test_unread_compressed_body_drain_is_bounded(
+     aiohttp_server: AiohttpServer,
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 88ae49dec4..893d5124f7 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -34,6 +34,8 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-54277.patch \
            file://CVE-2026-54278.patch \
            file://CVE-2026-54279.patch \
+           file://CVE-2026-54273_p1.patch \
+           file://CVE-2026-54273_p2.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


