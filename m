Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36132.1795583897000547374
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=inSRsoUA;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=42734; q=dns/txt;
  s=iport01; t=1795583898; x=1796793498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qMVhY0WOF3mbkAp1byClObxr/I9P4iSfnmB8HvAEb8I=;
  b=inSRsoUA+eXjQNcuASsFkAnLg+5k8lI2Ba0kD/NFdr0crZZJEdhE+GNQ
   DhITGFr7/fowmLodiSaYsN+3CxXgq91v55EZI2I9dTFT7kcAkG2UBgZs5
   5nvrre2NN0ABvWeRJj90SVN8IIGtKWo9QAqXReUPK+XcHSKbbEBCqn96U
   DqO3BsRhqX/k05/cCWnaKWIeyETJbEs5W9neKaxHmYtYoc+19i7Hhheqp
   AXjf3YT3yhPAe80mMpbjmqyWRgc+lDUz84VCR4gcJJ2cdfV6+TPvnBXmF
   9sf1uHst+A0h8bl8R6a7XlAy1+VazgrHSTnE66JheFNXm98JbmmaubQHw
   w==;
X-CSE-ConnectionGUID: P56LDI5mQ0qa2/nRvbXXqQ==
X-CSE-MsgGUID: Ur+5nj2iTcSUXBKfOMCasg==
X-IPAS-Result: =?us-ascii?q?A0AaAAAGbgZr/8xK/pBaHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBghc/dWBDSQOMb4lZA4ETkD2MWYF+DwEBAQ9EDQQBAYQ/RgKOIgImN?=
 =?us-ascii?q?AkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMaA?=
 =?us-ascii?q?QwLARgBLRAcAwECLysjCBAJgipYAYJ0AxG6AYF5M4EBgykBMQLcVAELFAGBO?=
 =?us-ascii?q?AGFQYglXRgBhH4nGxuBcoEVgTuBOXaBBYFcAgKBNhAJhlUEgg0VgQyBVIECg?=
 =?us-ascii?q?iCDFQOGWQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFg?=
 =?us-ascii?q?RyBHoESgQNdgSsoXQEhgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhC?=
 =?us-ascii?q?zQYDUgRLDcVGQQ+bgeUE4JuHQkHARUXTgkKAQcUCgUBfyEUMAQhIwYJAgUBB?=
 =?us-ascii?q?QIwkmAHAggUHgqReoE1n1wKKIN5jCSVOhozhASBV5JDklQLlhqCY44KlWkLD?=
 =?us-ascii?q?QFPhGqBaDyBWXAVO4JnCUoZD44rDgsceAEBAYJJhRPJSCYyAgkDLwEBBwIHD?=
 =?us-ascii?q?gMLgWiQAAEBAiSBVgEB?=
IronPort-Data: A9a23:LH1jeqnKwja//Q9Wv0sZqfvo5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKX2iCbveLa2CnLohyPoS/o0oB7ZaAnNNjSAs6rXhmQ1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsf/b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbVFpMJbIDxLz
 KQBIWpKaCqdjdKG2YvuH4GAhux7RCXqFIoSoDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUUTUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGISNJIXVFJoI9qqej
 l/cvDn/AEsbCNek9Aqv0XyLo8TGhiyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjNCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:woq2wqzZ18EMJhv+RZU2KrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:y55T8m7YvxtIXof0rtsszBNKPuwEL3jklG7ZeQi+M3hjeI2McArF
X-Talos-MUID: 9a23:GIVLmQkaWiwyBnkZ4h/vdnpfLoQ15ab0CXwGqqg2keqKEglbMiyS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60617975"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:18:17 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 62D5A1800022F;
	Wed, 25 Nov 2026 05:18:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 96D94CBEF98; Tue, 24 Nov 2026 21:18:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 8/9] python3-aiohttp: fix CVE-2026-69243 and CVE-2026-128129
Date: Tue, 24 Nov 2026 21:18:10 -0800
Message-Id: <20261125051811.2524271-9-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051811.2524271-1-dkelaiya@cisco.com>
References: <20261125051811.2524271-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132967
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upgrade framing fix [1] to aiohttp 3.9.5, as
identified by [4]. Both HTTP parsers must finish reading a framed
request body before handing back an upgraded connection.

Include the declined-upgrade follow-up [2] so the server returns to
HTTP parsing at the correct request boundary. Include the tail limit
and error-handling correction [3] so replay uses the normal HTTP
error path and resumes reads after the buffer drains.
The tail limit also fixes CVE-2026-128129, documented in [5].

[1] https://github.com/aio-libs/aiohttp/commit/6ae358f0983c3f4d6f67692b2f8e65dc8e091c98
[2] https://github.com/aio-libs/aiohttp/commit/716c83d2b697e56fd74f95a1aa3a451fd2fb02e8
[3] https://github.com/aio-libs/aiohttp/commit/3d850ee9b92573c7e913821cbcb96005beb3f4df
[4] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-mfx4-hv73-q22v
[5] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-pw86-h8fm-j323

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../CVE-2026-69243_CVE-2026-128129.patch      | 673 ++++++++++++++++++
 .../python3-aiohttp/CVE-2026-69243_p1.patch   | 300 ++++++++
 .../python3-aiohttp/CVE-2026-69243_p2.patch   |  93 +++
 .../python/python3-aiohttp_3.9.5.bb           |   3 +
 4 files changed, 1069 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_CVE-2026-128129.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_CVE-2026-128129.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_CVE-2026-128129.patch
new file mode 100644
index 0000000..20de364
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_CVE-2026-128129.patch
@@ -0,0 +1,673 @@
+From 3d850ee9b92573c7e913821cbcb96005beb3f4df Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 22 Aug 2026 15:03:24 +0100
+Subject: [PATCH] Fix limit on message tail (#13501) (#13511)
+
+CVE: CVE-2026-69243 CVE-2026-128129
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/3d850ee9b92573c7e913821cbcb96005beb3f4df]
+
+Backport Changes:
+- Reuse Scarthgap's HTTP receive path to replay a declined upgrade
+  after the request body drains and queue the usual 400 on errors.
+- Check the tail limit on its first read, later reads and refills.
+  Leave reads paused while a queued parse error is awaiting its 400.
+- Adapt upstream flow-control tests to 3.9.5's _upgrade flag and
+  mock reader. Keep checks at and below the limit, with an empty
+  tail at a zero limit, and after a reader is set. Also check the
+  first tail fill and refills on the older HTTP receive path.
+- Exercise drain before replay with a real payload from a normal
+  POST in both parsers. Inject pending state and replay errors to
+  check request ordering, read resumption and the queued HTTP 400.
+- Adapt raw HTTP regressions to 3.9.5's server fixture. Check
+  Content-Length and chunked upgrades with a pipelined request on
+  one loopback connection using both parsers. Cover combined and
+  fragmented sends, with bodies read by the handler or left for
+  the protocol to finish before replaying the following request.
+- Keep client-driven WebSocket acceptance and connection reuse.
+  Use injected-state checks for isolated flow-control transitions.
+
+(cherry picked from commit c207cadb257e0959b192ffca0548eca8c71eb96a)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13501.bugfix.rst              |    1 
+ aiohttp/web_protocol.py               |   56 ++++----
+ tests/test_web_protocol.py            |  238 +++++++++++++++++++++++++++++++++
+ tests/test_web_upgrade_integration.py |  236 +++++++++++++++++++++++++++++++++
+ 4 files changed, 504 insertions(+), 27 deletions(-)
+ create mode 100644 CHANGES/13501.bugfix.rst
+ create mode 100644 tests/test_web_upgrade_integration.py
+
+diff --git a/CHANGES/13501.bugfix.rst b/CHANGES/13501.bugfix.rst
+new file mode 100644
+index 0000000..4c45225
+--- /dev/null
++++ b/CHANGES/13501.bugfix.rst
+@@ -0,0 +1 @@
++Fixed a limit on message tail after an upgrade request -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/web_protocol.py b/aiohttp/web_protocol.py
+index 2a48feb..2c2c8ca 100644
+--- a/aiohttp/web_protocol.py
++++ b/aiohttp/web_protocol.py
+@@ -156,6 +156,7 @@ class RequestHandler(BaseProtocol):
+         "_msg_queue_resume_size",
+         "_msg_queue_paused",
+         "_message_tail",
++        "_read_bufsize",
+         "_waiter",
+         "_task_handler",
+         "_upgrade",
+@@ -196,6 +197,7 @@ class RequestHandler(BaseProtocol):
+         # Low-water mark: resume reading once the queue drains to half the limit
+         # so we refill in batches instead of churning pause/resume per request.
+         self._msg_queue_resume_size = MAX_MSG_QUEUE_SIZE // 2
++        self._read_bufsize = read_bufsize
+         # Set before super().__init__ so _reading_paused_for_msg_queue() is safe
+         # if BaseProtocol ever triggers a resume during init.
+         self._msg_queue_paused = False
+@@ -365,6 +367,9 @@ class RequestHandler(BaseProtocol):
+             self._payload_parser.feed_data(self._message_tail)
+             self._message_tail = b""
+ 
++        if self._msg_queue_paused:
++            self._resume_msg_queue_reading()
++
+     def eof_received(self) -> None:
+         pass
+ 
+@@ -393,21 +398,18 @@ class RequestHandler(BaseProtocol):
+                 # don't set result twice
+                 waiter.set_result(None)
+ 
+-            # Queue full: pause the transport (the parser already stopped
+-            # emitting). start() resumes as it drains the queue.
+-            if (
+-                not self._msg_queue_paused
+-                and len(self._messages) >= self._max_msg_queue_size
+-            ):
+-                self._pause_msg_queue_reading()
+-
+             self._upgrade = upgraded
+             if upgraded and tail:
+                 self._message_tail = tail
+ 
++            if not self._msg_queue_paused and self._msg_queue_needs_pause():
++                self._pause_msg_queue_reading()
++
+         # no parser, just store
+         elif self._payload_parser is None and self._upgrade and data:
+             self._message_tail += data
++            if not self._msg_queue_paused and self._msg_queue_needs_pause():
++                self._pause_msg_queue_reading()
+ 
+         # feed payload
+         elif data:
+@@ -418,6 +420,15 @@ class RequestHandler(BaseProtocol):
+     def _reading_paused_for_msg_queue(self) -> bool:
+         return self._msg_queue_paused
+ 
++    def _msg_queue_needs_pause(self) -> bool:
++        # Leave reads paused until a queued parse error sends its 400 response.
++        if self._messages and isinstance(self._messages[-1][0], _ErrInfo):
++            return True
++        # An empty tail must allow reads to resume even with read_bufsize=0.
++        return len(self._messages) >= self._max_msg_queue_size or (
++            bool(self._message_tail) and len(self._message_tail) >= self._read_bufsize
++        )
++
+     def _pause_msg_queue_reading(self) -> None:
+         self._msg_queue_paused = True
+         if self.transport is not None:
+@@ -429,12 +440,15 @@ class RequestHandler(BaseProtocol):
+                 pass
+ 
+     def _resume_msg_queue_reading(self) -> None:
++        if self._msg_queue_needs_pause():
++            return
++
+         if not self._upgrade:
+             # Reparse buffered pipelined requests while still marked paused so
+             # a refill past the limit does not re-pause an already-paused
+             # transport; only resume below once it stayed under the limit.
+             self.data_received(b"")
+-            if len(self._messages) >= self._max_msg_queue_size:
++            if self._msg_queue_needs_pause():
+                 return
+         self._msg_queue_paused = False
+         if not self._reading_paused and self.transport is not None:
+@@ -582,6 +596,7 @@ class RequestHandler(BaseProtocol):
+                 self._request_parser.message_consumed()
+             if (
+                 self._msg_queue_paused
++                and not isinstance(message, _ErrInfo)
+                 and len(self._messages) <= self._msg_queue_resume_size
+             ):
+                 self._resume_msg_queue_reading()
+@@ -655,24 +670,11 @@ class RequestHandler(BaseProtocol):
+                     self._request_parser.set_upgraded(False)
+                     self._upgrade = False
+                     if self._message_tail:
+-                        messages, upgraded, tail = self._request_parser.feed_data(
+-                            self._message_tail
+-                        )
+-                        # A further upgrade request in the tail buffers its own remainder.
+-                        self._upgrade = upgraded
+-                        self._message_tail = tail
+-                        for msg, payload in messages:
+-                            self._request_count += 1
+-                            self._messages.append((msg, payload))
+-                        # Pause the transport, like in data_received().
+-                        if (
+-                            not self._msg_queue_paused
+-                            and len(self._messages) >= self._max_msg_queue_size
+-                        ):
+-                            self._pause_msg_queue_reading()
+-                        # This shouldn't be possible. If a future refactor results in this
+-                        # failing, then the code may need to be updated to set the waiter.
+-                        assert self._waiter is None
++                        tail, self._message_tail = self._message_tail, b""
++                        # Reuse HTTP parsing, including its 400 error handling.
++                        self.data_received(tail)
++                    if self._msg_queue_paused:
++                        self._resume_msg_queue_reading()
+ 
+                 set_exception(payload, PayloadAccessError())
+ 
+diff --git a/tests/test_web_protocol.py b/tests/test_web_protocol.py
+index 084b72edba0301dc17fc951f114b3751afae0934..fb0dfc92fcc6f0c854d4903fa01a2dba567082f1 100644
+--- a/tests/test_web_protocol.py
++++ b/tests/test_web_protocol.py
+@@ -4,7 +4,11 @@ from unittest import mock
+ 
+ import pytest
+ 
++from aiohttp.http_exceptions import HttpProcessingError
++from aiohttp.http_parser import HttpRequestParser, HttpRequestParserPy
++from aiohttp.streams import StreamReader
+ from aiohttp.web_protocol import RequestHandler
++from aiohttp.web_response import Response, StreamResponse
+ from aiohttp.web_server import Server
+ 
+ 
+@@ -141,6 +145,240 @@ def test_resume_msg_queue_reading_without_transport(
+     assert handler._msg_queue_paused is False
+ 
+ 
++def test_resume_msg_queue_reading_stays_paused_for_full_tail(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    """Resume is refused while an in-flight upgrade holds read_bufsize of tail.
++
++    The tail is drained by set_parser() or declined-upgrade replay, so resuming before
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
++) -> None:
++    """Handing a full tail to the upgraded protocol resumes reading."""
++    handler = RequestHandler(dummy_manager, loop=loop, read_bufsize=1024)
++    transport = mock.create_autospec(asyncio.Transport, spec_set=True, instance=True)
++    handler.transport = transport
++    handler._upgrade = True
++    handler._msg_queue_paused = True
++    handler._message_tail = b"x" * 1024
++
++    reader = mock.Mock()
++    handler.set_parser(reader)
++
++    reader.feed_data.assert_called_once_with(b"x" * 1024)
++    assert handler._message_tail == b""
++    assert handler._msg_queue_paused is False
++    transport.resume_reading.assert_called_once_with()
++
++
++@pytest.mark.parametrize(
++    "chunks", [(b"tail", b""), (b"ta", b"il")], ids=["parser-return", "later-read"]
++)
++def test_received_upgrade_tail_pauses_at_read_limit(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++    chunks: tuple[bytes, bytes],
++) -> None:
++    handler = RequestHandler(dummy_manager, loop=loop, read_bufsize=4)
++    transport = mock.Mock(spec=asyncio.Transport)
++    handler.transport = transport
++    parser = mock.Mock()
++    handler._request_parser = parser
++    initial, later = chunks
++    parser.feed_data.return_value = ((), True, initial)
++
++    handler.data_received(b"event")
++    if later:
++        transport.pause_reading.assert_not_called()
++        handler.data_received(later)
++
++    parser.feed_data.assert_called_once_with(b"event")
++    assert handler._message_tail == b"tail"
++    transport.pause_reading.assert_called_once_with()
++
++
++def test_refill_keeps_reads_paused_for_full_upgrade_tail(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++) -> None:
++    handler = RequestHandler(dummy_manager, loop=loop, read_bufsize=4)
++    transport = mock.Mock(spec=asyncio.Transport)
++    handler.transport = transport
++    handler._msg_queue_paused = True
++    parser = mock.Mock()
++    handler._request_parser = parser
++    parser.feed_data.return_value = ((), True, b"tail")
++
++    handler._resume_msg_queue_reading()
++
++    parser.feed_data.assert_called_once_with(b"")
++    assert handler._message_tail == b"tail"
++    assert handler._msg_queue_paused
++    transport.resume_reading.assert_not_called()
++
++
++@pytest.mark.parametrize("replay_fails", [False, True])
++@pytest.mark.parametrize(
++    "request_parser_cls",
++    tuple(dict.fromkeys((HttpRequestParserPy, HttpRequestParser))),
++    ids=lambda parser_cls: "python" if parser_cls is HttpRequestParserPy else "c",
++)
++async def test_declined_upgrade_replays_after_body_drains(
++    loop: asyncio.AbstractEventLoop,
++    dummy_manager: Server,
++    replay_fails: bool,
++    request_parser_cls: type[HttpRequestParser],
++    monkeypatch: pytest.MonkeyPatch,
++) -> None:
++    events: list[str] = []
++
++    async def respond(_request: object) -> Response:
++        return Response()
++
++    dummy_manager.request_handler = respond
++    dummy_manager.requests_count = 0
++    request = mock.Mock()
++    request.writer.output_size = 0
++    dummy_manager.request_factory.return_value = request
++    handler = RequestHandler(dummy_manager, loop=loop, read_bufsize=4)
++    transport = mock.Mock(spec=asyncio.Transport)
++    handler.transport = transport
++    http_parser = request_parser_cls(handler, loop, 2**16)
++    parser = mock.Mock(wraps=http_parser)
++    handler._request_parser = parser
++    headers = (
++        b"POST /submit HTTP/1.1\r\n"
++        b"Host: example.test\r\n"
++        b"Content-Length: 4\r\n\r\n"
++    )
++    messages, upgraded, tail = http_parser.feed_data(headers)
++    [(message, body)] = messages
++    assert message.method == "POST"
++    assert not upgraded and not tail and not body.is_eof()
++
++    readany = StreamReader.readany
++
++    async def drain(payload: StreamReader) -> bytes:
++        assert payload is body
++        assert not body.is_eof()
++        # Supply the remaining bytes of the ordinary HTTP body when the
++        # protocol starts draining it.
++        messages, upgraded, tail = http_parser.feed_data(b"body")
++        assert not messages and not upgraded and not tail
++        data = await readany(payload)
++        assert data == b"body"
++        events.append("drain")
++        return data
++
++    monkeypatch.setattr(StreamReader, "readany", drain)
++
++    def receive(data: bytes) -> tuple[tuple[tuple[object, object], ...], bool, bytes]:
++        if data == b"event":
++            # Seed the upgrade state separately from the real HTTP parsing.
++            return ((message, body),), True, b"tail"
++        if data == b"tail":
++            events.append("replay")
++            assert body.at_eof()
++            if replay_fails:
++                raise HttpProcessingError(message="mock failure")
++            messages, upgraded, tail = http_parser.feed_data(
++                b"GET /next HTTP/1.1\r\nHost: example.test\r\n\r\n"
++            )
++            [(next_message, next_body)] = messages
++            assert next_message.path == "/next"
++            assert not upgraded and not tail and next_body.at_eof()
++            return tuple(messages), upgraded, tail
++        assert data == b""
++        return (), False, b""
++
++    parser.feed_data.side_effect = receive
++    handler.data_received(b"event")
++
++    async def finish(
++        _handler: RequestHandler,
++        _request: object,
++        response: StreamResponse,
++        _start: float,
++    ) -> bool:
++        response._keep_alive = not events
++        events.append(f"status {response.status}")
++        return False
++
++    with mock.patch.object(RequestHandler, "finish_response", new=finish):
++        task = handler._task_handler = loop.create_task(handler.start())
++        try:
++            await asyncio.wait_for(task, timeout=2)
++        finally:
++            if handler._keepalive_handle is not None:
++                handler._keepalive_handle.cancel()
++
++    assert not handler._messages
++    transport.pause_reading.assert_called_once_with()
++    parser.set_upgraded.assert_called_once_with(False)
++    expected_status = 400 if replay_fails else 200
++    assert events == ["status 200", "drain", "replay", f"status {expected_status}"]
++    if replay_fails:
++        transport.resume_reading.assert_not_called()
++    else:
++        transport.resume_reading.assert_called_once_with()
++
++
+ def test_resume_reading_stays_paused_for_msg_queue(
+     loop: asyncio.AbstractEventLoop,
+     dummy_manager: Server,
+diff --git a/tests/test_web_upgrade_integration.py b/tests/test_web_upgrade_integration.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..7a4798a05c2fc23bb841edcab752a8459e8166f6
+--- /dev/null
++++ b/tests/test_web_upgrade_integration.py
+@@ -0,0 +1,236 @@
++from asyncio import Event, Transport, open_connection, wait_for
++from base64 import b64encode
++from typing import List, Optional
++
++import pytest
++
++from aiohttp import ClientTimeout, hdrs, web, web_protocol
++from aiohttp.http_parser import HttpRequestParser, HttpRequestParserPy
++from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
++
++
++@pytest.mark.parametrize("framing", ["empty", "content-length", "chunked"])
++async def test_declined_websocket_upgrade_keeps_http_connection(
++    aiohttp_client: AiohttpClient, framing: str,
++) -> None:
++    transports: List[Optional[Transport]] = []
++    upgrade_pending_at_prepare: List[bool] = []
++    body = b"example body" if framing != "empty" else b""
++
++    async def decline(request: web.Request) -> web.Response:
++        transports.append(request.transport)
++        assert await request.read() == body
++        if framing == "content-length":
++            assert request.content_length == len(body)
++        elif framing == "chunked":
++            assert request.headers[hdrs.TRANSFER_ENCODING] == "chunked"
++        return web.Response(text="upgrade declined")
++
++    async def normal(request: web.Request) -> web.Response:
++        transports.append(request.transport)
++        return web.Response(text="http response")
++
++    async def record_upgrade_state(
++        request: web.Request, response: web.StreamResponse
++    ) -> None:
++        if request.path == "/upgrade":
++            upgrade_pending_at_prepare.append(request.protocol._upgrade)
++
++    app = web.Application()
++    app.router.add_get("/upgrade", decline)
++    app.router.add_get("/", normal)
++    app.on_response_prepare.append(record_upgrade_state)
++    client = await aiohttp_client(app, timeout=ClientTimeout(total=5))
++
++    headers = {
++        hdrs.CONNECTION: "Upgrade",
++        hdrs.UPGRADE: "websocket",
++        hdrs.SEC_WEBSOCKET_KEY: b64encode(b"test upgrade key").decode("ascii"),
++        hdrs.SEC_WEBSOCKET_VERSION: "13",
++    }
++    async with client.get(
++        "/upgrade",
++        headers=headers,
++        data=body or None,
++        chunked=True if framing == "chunked" else None,
++    ) as response:
++        assert response.status == 200
++        assert await response.text() == "upgrade declined"
++
++    assert upgrade_pending_at_prepare == [True]
++
++    async with client.get("/") as response:
++        assert response.status == 200
++        assert await response.text() == "http response"
++
++    assert len(transports) == 2
++    assert transports[0] is not None
++    assert transports[0] is transports[1]
++
++
++async def test_accepted_websocket_upgrade_delivers_message(
++    aiohttp_client: AiohttpClient,
++) -> None:
++    async def upgrade(request: web.Request) -> web.WebSocketResponse:
++        websocket = web.WebSocketResponse()
++        await websocket.prepare(request)
++        await websocket.send_str("ready")
++        return websocket
++
++    app = web.Application()
++    app.router.add_get("/upgrade", upgrade)
++    client = await aiohttp_client(app, timeout=ClientTimeout(total=5))
++
++    async with client.ws_connect("/upgrade") as websocket:
++        assert await websocket.receive_str(timeout=5) == "ready"
++
++
++@pytest.mark.parametrize(
++    "parser_class",
++    tuple(dict.fromkeys((HttpRequestParserPy, HttpRequestParser))),
++    ids=lambda cls: "python" if cls is HttpRequestParserPy else "c",
++)
++@pytest.mark.parametrize("chunked", [False, True], ids=["content-length", "chunked"])
++@pytest.mark.parametrize("fragmented", [False, True], ids=["combined", "split-body"])
++@pytest.mark.parametrize("read_body", [False, True], ids=["unread-body", "read-body"])
++async def test_body_upgrade_and_pipelined_request_on_loopback(
++    aiohttp_server: AiohttpServer,
++    monkeypatch: pytest.MonkeyPatch,
++    parser_class,
++    chunked: bool,
++    fragmented: bool,
++    read_body: bool,
++) -> None:
++    monkeypatch.setattr(web_protocol, "HttpRequestParser", parser_class)
++    body = b"request-body\r\n"
++    started = Event()
++    following_request = Event()
++    requests: List[web.Request] = []
++
++    async def decline(request: web.Request) -> web.Response:
++        assert request.headers[hdrs.UPGRADE] == "websocket"
++        assert isinstance(request.protocol._request_parser, parser_class)
++        requests.append(request)
++        started.set()
++        if read_body:
++            assert await request.read() == body
++        return web.Response(body=b"declined")
++
++    async def next_request(request: web.Request) -> web.Response:
++        assert len(requests) == 1
++        assert request.transport is requests[0].transport
++        assert requests[0].content.is_eof()
++        requests.append(request)
++        following_request.set()
++        return web.Response(body=b"next response")
++
++    app = web.Application()
++    app.router.add_get("/upgrade", decline)
++    app.router.add_get("/next", next_request)
++    server = await aiohttp_server(app, read_bufsize=32)
++    reader, writer = await open_connection(server.host, server.port)
++    if chunked:
++        framing = b"Transfer-Encoding: chunked\r\n"
++        wire_body = b"%x\r\n%s\r\n0\r\n\r\n" % (len(body), body)
++    else:
++        framing = b"Content-Length: %d\r\n" % len(body)
++        wire_body = body
++    headers = (
++        b"GET /upgrade HTTP/1.1\r\n"
++        b"Host: localhost\r\n"
++        b"Connection: Upgrade\r\n"
++        b"Upgrade: websocket\r\n"
++        b"Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\n"
++        b"Sec-WebSocket-Version: 13\r\n"
++        + framing
++        + b"\r\n"
++    )
++    tail = b"GET /next HTTP/1.1\r\nHost: localhost\r\n\r\n"
++
++    async def read_response(expected: bytes) -> None:
++        response_headers = await reader.readuntil(b"\r\n\r\n")
++        assert response_headers.startswith(b"HTTP/1.1 200 ")
++        assert b"content-length: " + str(len(expected)).encode() in response_headers.lower()
++        assert await reader.readexactly(len(expected)) == expected
++
++    async def exchange() -> None:
++        if fragmented:
++            writer.write(headers + wire_body[:-1])
++            await writer.drain()
++            await started.wait()
++            assert not requests[0].content.is_eof()
++            assert not following_request.is_set()
++            writer.write(wire_body[-1:] + tail)
++        else:
++            writer.write(headers + wire_body + tail)
++        await writer.drain()
++        await read_response(b"declined")
++        await read_response(b"next response")
++        assert following_request.is_set()
++        assert [request.path for request in requests] == ["/upgrade", "/next"]
++
++    try:
++        await wait_for(exchange(), timeout=5)
++    finally:
++        writer.close()
++        await writer.wait_closed()
++
++
++async def test_injected_upgrade_tail_replays_and_resumes_reads(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    tail = b"GET /replay HTTP/1.1\r\nHost: localhost\r\n\r\n"
++    transports: List[Transport] = []
++
++    async def seed_pending_state(request: web.Request) -> web.Response:
++        transport = request.transport
++        assert transport is not None
++        transports.append(transport)
++        protocol = request.protocol
++        assert transport.is_reading()
++        assert protocol._message_tail == b""
++
++        # Seed the pending flag after the ordinary GET reached its handler.
++        # Pass a complete request to the receive callback without a socket send.
++        protocol._upgrade = True
++        protocol.data_received(tail)
++        assert protocol._message_tail == tail
++        assert not transport.is_reading()
++        return web.Response(body=b"first")
++
++    async def replay(request: web.Request) -> web.Response:
++        assert request.transport is transports[0]
++        assert transports[0].is_reading()
++        assert not request.protocol._message_tail
++        return web.Response(body=b"replayed")
++
++    async def normal(request: web.Request) -> web.Response:
++        assert request.transport is transports[0]
++        return web.Response(body=b"normal")
++
++    app = web.Application()
++    app.router.add_get("/seed", seed_pending_state)
++    app.router.add_get("/replay", replay)
++    app.router.add_get("/", normal)
++    server = await aiohttp_server(app, read_bufsize=len(tail))
++    reader, writer = await open_connection(server.host, server.port)
++
++    async def read_response(body: bytes) -> None:
++        headers = await reader.readuntil(b"\r\n\r\n")
++        assert headers.startswith(b"HTTP/1.1 200 ")
++        assert await reader.readexactly(len(body)) == body
++
++    async def exchange() -> None:
++        writer.write(b"GET /seed HTTP/1.1\r\nHost: localhost\r\n\r\n")
++        await writer.drain()
++        await read_response(b"first")
++        await read_response(b"replayed")
++        writer.write(b"GET / HTTP/1.1\r\nHost: localhost\r\n\r\n")
++        await writer.drain()
++        await read_response(b"normal")
++
++    try:
++        await wait_for(exchange(), timeout=5)
++    finally:
++        writer.close()
++        await writer.wait_closed()
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_p1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_p1.patch
new file mode 100644
index 0000000..9e3ddb7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_p1.patch
@@ -0,0 +1,300 @@
+From 6ae358f0983c3f4d6f67692b2f8e65dc8e091c98 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Tue, 30 Jun 2026 20:21:57 +0100
+Subject: [PATCH] [PR #13016/8ef76ab8 backport][3.14] Fix body reads after
+ failed WS upgrade (#13017)
+
+**This is a backport of PR #13016 as merged into master
+(8ef76ab8029d0f2d88449fe115feb42ded646c7c).**
+
+CVE: CVE-2026-69243
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/6ae358f0983c3f4d6f67692b2f8e65dc8e091c98]
+
+Backport Changes:
+- Adapt the headers callback to 3.9.5's immediate-upgrade path while
+  retaining llhttp's no-body response result from the upstream fix.
+- Let a pending upgrade reach llhttp's own pause even at the queue
+  limit. The 3.9.5 queue callback would otherwise pause it first.
+- Use the older boolean payload completion path in the Python parser.
+- Use the 3.9.5 fixtures for the empty-body and upstream framed-body
+  parser tests. Add fragmented Content-Length and chunked upgrade
+  cases that keep HTTP parsing active until the body is complete
+  and return only the following bytes as the upgraded tail.
+- Place raw HTTP regressions in the shared follow-up to cover
+  body framing, replay and connection reuse together.
+
+Co-authored-by: Sam Bull <git@sambull.org>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13016.bugfix.rst  |    1 
+ aiohttp/_http_parser.pyx  |   29 +++++++++----
+ aiohttp/http_parser.py    |   22 ++++++++--
+ tests/test_http_parser.py |   99 +++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 136 insertions(+), 15 deletions(-)
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
+index a5309a4cd..6f5975b78 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -318,6 +318,7 @@ cdef class HttpParser:
+         set     _seen_singletons
+         list    _raw_headers
+         bint    _upgraded
++        bint    _pending_upgrade
+         list    _messages
+         bytes   _tail
+         Py_ssize_t _msg_in_flight
+@@ -387,6 +388,7 @@ cdef class HttpParser:
+         self._response_with_body = response_with_body
+         self._read_until_eof = read_until_eof
+         self._upgraded = False
++        self._pending_upgrade = False
+         self._auto_decompress = auto_decompress
+         self._content_encoding = None
+         self._lax = False
+@@ -474,10 +476,15 @@ cdef class HttpParser:
+             h_upg = headers.get("upgrade", "")
+             allowed = upgrade and h_upg.isascii() and h_upg.lower() in ALLOWED_UPGRADES
+             if allowed or self._cparser.method == cparser.HTTP_CONNECT:
+-                self._upgraded = True
++                # https://www.rfc-editor.org/info/rfc9110/#section-7.8-15
++                # Defer the protocol switch until the complete request has been
++                # received.
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
+@@ -606,6 +613,10 @@ cdef class HttpParser:
+             cparser.llhttp_resume_after_upgrade(self._cparser)
+ 
+             nb = cparser.llhttp_get_error_pos(self._cparser) - base
++            if self._pending_upgrade:
++                # A supported upgrade whose request body has now been fully read.
++                self._upgraded = True
++                self._pending_upgrade = False
+         elif errno is cparser.HPE_PAUSED:
+             cparser.llhttp_resume(self._cparser)
+             pos = cparser.llhttp_get_error_pos(self._cparser) - base
+@@ -852,13 +863,9 @@ cdef int cb_on_headers_complete(cparser.llhttp_t* parser) except -1:
+         pyparser._last_error = exc
+         return -1
+     else:
+-        if (
+-            pyparser._cparser.upgrade or
+-            pyparser._cparser.method == cparser.HTTP_CONNECT
+-        ):
+-            return 2
+-        else:
+-            return 0
++        if not pyparser._response_with_body:
++            return 1
++        return 0
+ 
+ 
+ cdef int cb_on_body(cparser.llhttp_t* parser,
+@@ -891,10 +898,12 @@ cdef int cb_on_message_complete(cparser.llhttp_t* parser) except -1:
+     else:
+         if pyparser._max_msg_queue_size:
+             pyparser._msg_in_flight += 1
+-            if pyparser._msg_in_flight >= pyparser._max_msg_queue_size:
++            if (pyparser._msg_in_flight >= pyparser._max_msg_queue_size
++                    and not pyparser._pending_upgrade):
+                 # Queue full: pause llhttp between messages. feed_data() buffers
+                 # the remainder as tail; resumes once the queue drains.
+                 return cparser.HPE_PAUSED
++            # A pending upgrade stops at llhttp's protocol pause instead.
+         return 0
+ 
+ 
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index f306cf308..618daed04 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -300,6 +300,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+         self._lines: List[bytes] = []
+         self._tail = b""
+         self._upgraded = False
++        self._pending_upgrade = False
+         self._payload = None
+         self._payload_parser: Optional[HttpPayloadParser] = None
+         self._auto_decompress = auto_decompress
+@@ -422,9 +423,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
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
+@@ -440,8 +439,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                             self.method and method_must_be_empty_body(self.method)
+                         )
+                         if not empty_body and (
+-                            ((length is not None and length > 0) or msg.chunked)
+-                            and not self._upgraded
++                            (length is not None and length > 0) or msg.chunked
+                         ):
+                             payload = StreamReader(
+                                 self.protocol,
+@@ -467,6 +465,10 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
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
+@@ -513,6 +515,11 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
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
+@@ -559,6 +566,11 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                     start_pos = 0
+                     data_len = len(data)
+                     self._payload_parser = None
++                    if self._pending_upgrade:
++                        # Body fully read: the deferred upgrade takes effect and
++                        # the rest of the connection is the upgraded protocol.
++                        self._upgraded = True
++                        self._pending_upgrade = False
+                     continue
+             else:
+                 break
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 500dd4c17603000b12645d1c80760a2b6b7630e7..cae4206c68819943e5156174c19bbdfec3805cb1 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -777,6 +777,105 @@ def test_conn_upgrade(parser: Any) -> None:
+     assert upgrade
+ 
+ 
++def test_empty_websocket_upgrade_with_content_length(
++    parser: HttpRequestParser,
++) -> None:
++    request = (
++        b"GET /ws HTTP/1.1\r\n"
++        b"Host: example.test\r\n"
++        b"Connection: Upgrade\r\n"
++        b"Upgrade: websocket\r\n"
++        b"Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\n"
++        b"Sec-WebSocket-Version: 13\r\n"
++        b"Content-Length: 0\r\n\r\n"
++    )
++    messages, upgraded, tail = parser.feed_data(request)
++
++    [(message, payload)] = messages
++    assert message.upgrade
++    assert upgraded
++    assert payload.at_eof()
++    assert tail == b""
++
++
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
++@pytest.mark.parametrize("chunked", (False, True), ids=("content-length", "chunked"))
++async def test_http_request_upgrade_waits_for_complete_body(
++    parser: HttpRequestParser, chunked: bool
++) -> None:
++    payload_bytes = b"payload"
++    if chunked:
++        framing = b"Transfer-Encoding: chunked\r\n"
++        body = b"7\r\npayload\r\n0\r\n\r\n"
++    else:
++        framing = b"Content-Length: 7\r\n"
++        body = payload_bytes
++    headers = (
++        b"GET /ws HTTP/1.1\r\n"
++        b"Host: example.test\r\n"
++        b"Connection: Upgrade\r\n"
++        b"Upgrade: websocket\r\n"
++        + framing
++        + b"\r\n"
++    )
++    after = b"GET /after HTTP/1.1\r\nHost: example.test\r\n\r\n"
++    messages, upgraded, tail = parser.feed_data(headers)
++
++    [(message, payload)] = messages
++    assert message.upgrade
++    assert not upgraded
++    assert tail == b""
++    assert not payload.is_eof()
++
++    # Keep the upgrade pending across every incomplete body boundary.
++    for offset in range(len(body) - 1):
++        messages, upgraded, tail = parser.feed_data(body[offset : offset + 1])
++        assert not messages
++        assert not upgraded
++        assert tail == b""
++        assert not payload.is_eof()
++
++    messages, upgraded, tail = parser.feed_data(body[-1:] + after)
++
++    assert not messages
++    assert upgraded
++    assert tail == after
++    assert payload.is_eof()
++    assert await payload.read() == payload_bytes
++    assert payload.at_eof()
++
++
+ def test_bad_upgrade(parser) -> None:
+     """Test not upgraded if missing Upgrade header."""
+     text = b"GET /test HTTP/1.1\r\nconnection: upgrade\r\n\r\n"
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_p2.patch
new file mode 100644
index 0000000..965d67f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_p2.patch
@@ -0,0 +1,93 @@
+From 716c83d2b697e56fd74f95a1aa3a451fd2fb02e8 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Mon, 17 Aug 2026 23:56:36 +0100
+Subject: [PATCH] Fix pipelining a rejected upgrade (#13468) (#13472)
+
+CVE: CVE-2026-69243
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/716c83d2b697e56fd74f95a1aa3a451fd2fb02e8]
+
+Backport Changes:
+- Use Scarthgap's _request_parser and _upgrade attributes.
+- Handle the declined upgrade in start() after the request body is
+  drained, so a response sent earlier cannot leave a deferred upgrade
+  stuck waiting for tail replay.
+- Omit the raw HTTP functional tests. Cover replay and flow control
+  with mocked parser and transport tests in p3.
+
+(cherry picked from commit 066026095fc8a44276eb6485c0e97f6642a25bbd)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/web_protocol.py | 53 +++++++++++++++++++++++++----------------
+ 1 file changed, 33 insertions(+), 20 deletions(-)
+
+diff --git a/aiohttp/web_protocol.py b/aiohttp/web_protocol.py
+index 39a1b6850..996952b31 100644
+--- a/aiohttp/web_protocol.py
++++ b/aiohttp/web_protocol.py
+@@ -639,6 +639,39 @@ class RequestHandler(BaseProtocol):
+                         self.log_debug("Uncompleted request.")
+                         self.close()
+ 
++                # Handle feeding the message tail following an upgrade request that
++                # was declined.
++                # The upgrade request is the last request before the parser paused,
++                # so wait for self._messages to be empty.
++                # payload_parser is not None if the upgrade was accepted.
++                if (
++                    self._upgrade
++                    and not self._messages
++                    and self._payload_parser is None
++                    and self._request_parser is not None
++                ):
++                    self._request_parser.set_upgraded(False)
++                    self._upgrade = False
++                    if self._message_tail:
++                        messages, upgraded, tail = self._request_parser.feed_data(
++                            self._message_tail
++                        )
++                        # A further upgrade request in the tail buffers its own remainder.
++                        self._upgrade = upgraded
++                        self._message_tail = tail
++                        for msg, payload in messages:
++                            self._request_count += 1
++                            self._messages.append((msg, payload))
++                        # Pause the transport, like in data_received().
++                        if (
++                            not self._msg_queue_paused
++                            and len(self._messages) >= self._max_msg_queue_size
++                        ):
++                            self._pause_msg_queue_reading()
++                        # This shouldn't be possible. If a future refactor results in this
++                        # failing, then the code may need to be updated to set the waiter.
++                        assert self._waiter is None
++
+                 set_exception(payload, PayloadAccessError())
+ 
+             except asyncio.CancelledError:
+@@ -683,26 +716,6 @@ class RequestHandler(BaseProtocol):
+         can get exception information. Returns True if the client disconnects
+         prematurely.
+         """
+-        if self._request_parser is not None:
+-            self._request_parser.set_upgraded(False)
+-            self._upgrade = False
+-            if self._message_tail:
+-                messages, _upgraded, tail = self._request_parser.feed_data(
+-                    self._message_tail
+-                )
+-                self._message_tail = tail
+-                for msg, payload in messages:
+-                    self._request_count += 1
+-                    self._messages.append((msg, payload))
+-                # Pause the transport, like in data_received().
+-                if (
+-                    not self._msg_queue_paused
+-                    and len(self._messages) >= self._max_msg_queue_size
+-                ):
+-                    self._pause_msg_queue_reading()
+-                # This shouldn't be possible. If a future refactor results in this
+-                # failing, then the code may need to be updated to set the waiter.
+-                assert self._waiter is None
+         try:
+             prepare_meth = resp.prepare
+         except AttributeError:
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index f86a594..bbd7b27 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -46,6 +46,9 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-111064.patch \
            file://CVE-2026-111063_p1.patch \
            file://CVE-2026-111063_p2.patch \
+           file://CVE-2026-69243_p1.patch \
+           file://CVE-2026-69243_p2.patch \
+           file://CVE-2026-69243_CVE-2026-128129.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6
