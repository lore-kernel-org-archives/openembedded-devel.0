Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36148.1795584013072891348
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:20:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d9UUhxOa;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=20701; q=dns/txt;
  s=iport01; t=1795584014; x=1796793614;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=H6NsjzMZHArVpTw3lZWdS+b6c44+hXMXvze72zfg+Kg=;
  b=d9UUhxOa/3VhKxOmE2Fob4dyBIp3QjZHqCOThjrZNjtoPjo+dOT2Hv3Y
   M4AYrOkwVY6U6qCRIaugwuaLy3BvvXpiUckb/H+HER7lq86VsuONNPcu3
   iWNNL4WJS1wcwkKPXHEe30pkavVFsxeo6bNJckpYb+Ln8kPMOzCn7d4lx
   sFq4gVbvICDEWTnfqVptN9O6Zu2Roa4d5iRWfqFPDuyNLKFhpZ2R8CZxN
   PfazThc5K3P0unGSoPyYnt7uK5lsEwZ7ZgYg7D2lamNXIMrPtmCTMTXLX
   wzBHvwjFFQH5xApxJOrMTZH8iKfcuZiwsvh1/WLciGaxPdwmSrHc27GxJ
   A==;
X-CSE-ConnectionGUID: Z0/26MMrRT6MCXTFV0vyQg==
X-CSE-MsgGUID: RZrVfd7pSsmH6QzaIshd5A==
X-IPAS-Result: =?us-ascii?q?A0BJAgAhbQZr/81K/pBaglmCV3VhQkkDlCeCIQOBE50Wg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYJ0AgERugOBe?=
 =?us-ascii?q?TOBAYMpAYFU2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVgTuBOXaBBYFcAoE4h?=
 =?us-ascii?q?m4EgiJ6EoFUHmSMEQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F?=
 =?us-ascii?q?4EHGwYFgRyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOA?=
 =?us-ascii?q?ikGFiELNBgNSBEsNxUZBD5uB5QTgxoBFicOQwEHIwEEgQGBJxylWaERCiiDe?=
 =?us-ascii?q?YwklToaM4QElBqSVAuYfY4KllGEaoFoPIFZcBU7gmcJShkPjisOC4NgzlsjN?=
 =?us-ascii?q?QIJAy8BAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:zh8OSa3M2TOjeCkCNfbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzcDx
 mpKDT2CMvaOMWP1Lt1yPYTi8EMPu5OAmNM3SFNt3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcubzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGPhlxZ9M93/xNPT9r3
 swkBg5VcAG6iLfjqF67YrEEasULJcTxeYdasXZ6wHSBUbAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEmojx5nYj/7DLo3h/+hnHz2aRVTqUmeouw85G27IAlZjuC2a4qJIIziqcN9pHSCm
 GzKoHzCGRQ6auWNwBue8n7xr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:iG9Ula47Y2njTURVyQPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:EALLJm0x2Jhh2SzZrkShnLxfKJhiKCP46W3qHxGdIlZVZoPNV06p9/Yx
X-Talos-MUID: 9a23:lNJP0QuQ1HcHRrMnOc2nvgN4CslkvLyVE0Utz6wUsuifNSAtEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60338428"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:20:11 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id B94E6180001DB
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:20:10 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 6D706CC2EF1; Tue, 24 Nov 2026 21:20:09 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 01/10] python3-aiohttp: fix CVE-2026-123817
Date: Tue, 24 Nov 2026 21:19:57 -0800
Message-Id: <20261125052006.3116497-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125052006.3116497-1-asparmar@cisco.com>
References: <20261125052006.3116497-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132977
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream 3.14 backport for CVE-2026-123817.
The fragment cap fix [1] and its follow-up [2] bound retained read
objects without pausing an incomplete WebSocket frame. The public
CVE advisory is referenced in [3].

Regenerate the compiled WebSocket reader from the patched source so
the accelerated implementation receives the fix as well.

[1] https://github.com/aio-libs/aiohttp/commit/09bcaa73ff084a0c539bbf16a0a78743acb7141f
[2] https://github.com/aio-libs/aiohttp/commit/6a4f6682817839313b04b8e5cea2b39c1a88ab4f
[3] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-2g87-pp6c-29x5

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python3-aiohttp/CVE-2026-123817_p1.patch  | 120 +++++++
 .../python3-aiohttp/CVE-2026-123817_p2.patch  | 317 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   9 +
 3 files changed, 446 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-123817_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-123817_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-123817_p1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-123817_p1.patch
new file mode 100644
index 0000000000..607bbb8312
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-123817_p1.patch
@@ -0,0 +1,120 @@
+From 56fdb8bc54ff8882eeb6950fb5899959df4dd865 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 8 Aug 2026 22:39:27 +0100
+Subject: [PATCH] Limit number of queued WS fragments (#13352) (#13355)
+
+(cherry picked from commit 288cf469ba800a071fcddca61434d6ab9dcf689d)
+
+CVE: CVE-2026-123817
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/09bcaa73ff084a0c539bbf16a0a78743acb7141f]
+
+Backport Changes:
+- Omit the unavailable decode_text test-constructor argument.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES/13352.bugfix.rst        |  1 +
+ aiohttp/_websocket/reader_c.pxd |  1 +
+ aiohttp/_websocket/reader_py.py |  9 +++++++
+ tests/test_websocket_parser.py  | 44 +++++++++++++++++++++++++++++++++
+ 4 files changed, 55 insertions(+)
+ create mode 100644 CHANGES/13352.bugfix.rst
+
+diff --git a/CHANGES/13352.bugfix.rst b/CHANGES/13352.bugfix.rst
+new file mode 100644
+index 0000000..a10a0d7
+--- /dev/null
++++ b/CHANGES/13352.bugfix.rst
+@@ -0,0 +1 @@
++Capped the number of per-read payload fragments the WebSocket reader retains in memory -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/_websocket/reader_c.pxd b/aiohttp/_websocket/reader_c.pxd
+index a7620d8..7f676c9 100644
+--- a/aiohttp/_websocket/reader_c.pxd
++++ b/aiohttp/_websocket/reader_c.pxd
+@@ -69,6 +69,7 @@ cdef class WebSocketReader:
+     cdef bint _frame_fin
+     cdef int _frame_opcode
+     cdef list _payload_fragments
++    cdef Py_ssize_t _max_fragments
+     cdef Py_ssize_t _frame_payload_len
+ 
+     cdef bytes _tail
+diff --git a/aiohttp/_websocket/reader_py.py b/aiohttp/_websocket/reader_py.py
+index 16c5f3b..27f1fee 100644
+--- a/aiohttp/_websocket/reader_py.py
++++ b/aiohttp/_websocket/reader_py.py
+@@ -145,6 +145,9 @@ class WebSocketReader:
+         self._frame_fin = False
+         self._frame_opcode: int = OP_CODE_NOT_SET
+         self._payload_fragments: list[bytes] = []
++        # Limit number of fragments, so a large number of tiny fragments
++        # doesn't exceed reasonable memory usage.
++        self._max_fragments = max(1024, max_msg_size // 256) if max_msg_size else 0
+         self._frame_payload_len = 0
+ 
+         self._tail: bytes = b""
+@@ -457,6 +460,12 @@ class WebSocketReader:
+                     # If we don't have a complete frame, we need to save the
+                     # data for the next call to feed_data.
+                     self._payload_fragments.append(data_cstr[f_start_pos:f_end_pos])
++                    if (
++                        self._max_fragments
++                        and len(self._payload_fragments) > self._max_fragments
++                        and not self.queue._protocol._reading_paused
++                    ):
++                        self.queue._protocol.pause_reading()
+                     break
+ 
+                 payload: Union[bytes, bytearray]
+diff --git a/tests/test_websocket_parser.py b/tests/test_websocket_parser.py
+index 3a283e0..5589bd3 100644
+--- a/tests/test_websocket_parser.py
++++ b/tests/test_websocket_parser.py
+@@ -756,3 +756,47 @@ def test_flow_control_multi_byte_text(
+         large_payload_size,
+     )
+     assert protocol._reading_paused is True
++
++
++async def test_incomplete_frame_pauses_when_fragment_limit_exceeded(
++    protocol: BaseProtocol,
++) -> None:
++    max_msg_size = 64 * 1024
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, max_msg_size, compress=False)
++
++    payload_len = 32 * 1024
++    parser.feed_data(PACK_LEN2(0x80 | WSMsgType.BINARY, 126, payload_len))
++    assert protocol._reading_paused is False
++
++    # Feed the payload two bytes per read so the pause is
++    # driven purely by the fragment count, not the total byte count.
++    paused_after = None
++    for i in range(payload_len // 2 - 1):  # pragma: no branch
++        parser.feed_data(b"xx")
++        if protocol._reading_paused:
++            paused_after = i + 1  # type: ignore[unreachable]
++            break
++
++    assert paused_after is not None
++    # Paused long before the frame could complete (16384 two-byte reads).
++    assert paused_after < payload_len // 2  # type: ignore[unreachable]
++
++
++async def test_incomplete_frame_not_paused_for_normal_reads(
++    protocol: BaseProtocol,
++) -> None:
++    max_msg_size = 64 * 1024
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, max_msg_size, compress=False)
++
++    # Normal traffic (a frame delivered in a handful of reasonably sized reads)
++    # must never trip the fragment-limit backpressure.
++    payload_len = 32 * 1024
++    parser.feed_data(PACK_LEN2(0x80 | WSMsgType.BINARY, 126, payload_len))
++    # 32 KiB in 4 KiB reads -> 8 fragments, far below the cap.
++    for _ in range(payload_len // 4096):
++        parser.feed_data(b"x" * 4096)
++    assert protocol._reading_paused is False
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-123817_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-123817_p2.patch
new file mode 100644
index 0000000000..112b5d2547
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-123817_p2.patch
@@ -0,0 +1,317 @@
+From 26ba4107c50be5fcd1c7a2488f9aa13254b92eaa Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Tue, 1 Sep 2026 00:17:32 +0100
+Subject: [PATCH] Patchback/backports/3.14/2a84c9ba7083870297eaee8d86ef4a36413d1b00/pr
+ 13488 (#13612)
+
+CVE: CVE-2026-123817
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/6a4f6682817839313b04b8e5cea2b39c1a88ab4f]
+
+Backport Changes:
+- Omit decode_text=False, absent from the current constructor.
+- Add the pure-Python reader aliases without MSG_SIZE_OVERHEAD, which
+  is absent from the target version.
+
+Co-authored-by: J. Nick Koston <nick@koston.org>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES/13352.bugfix.rst        |   2 +-
+ CHANGES/13488.bugfix.rst        |   1 +
+ aiohttp/_websocket/reader_c.pxd |   1 +
+ aiohttp/_websocket/reader_py.py |  27 +++--
+ tests/test_websocket_parser.py  | 172 ++++++++++++++++++++++++++++----
+ 5 files changed, 173 insertions(+), 30 deletions(-)
+ create mode 120000 CHANGES/13488.bugfix.rst
+
+diff --git a/CHANGES/13352.bugfix.rst b/CHANGES/13352.bugfix.rst
+index a10a0d7..dd0d94e 100644
+--- a/CHANGES/13352.bugfix.rst
++++ b/CHANGES/13352.bugfix.rst
+@@ -1 +1 @@
+-Capped the number of per-read payload fragments the WebSocket reader retains in memory -- by :user:`Dreamsorcerer`.
++Bounded the per-read object overhead the WebSocket reader retains while reassembling a frame delivered across many small reads; the reads are joined once when the frame completes, and folded into a single buffer if they exceed a fragment cap, so a frame dribbled in tiny reads cannot pin unbounded per-read overhead -- by :user:`Dreamsorcerer` and :user:`bdraco`.
+diff --git a/CHANGES/13488.bugfix.rst b/CHANGES/13488.bugfix.rst
+new file mode 120000
+index 0000000..955ee54
+--- /dev/null
++++ b/CHANGES/13488.bugfix.rst
+@@ -0,0 +1 @@
++13352.bugfix.rst
+\ No newline at end of file
+diff --git a/aiohttp/_websocket/reader_c.pxd b/aiohttp/_websocket/reader_c.pxd
+index 7f676c9..4f8a1b2 100644
+--- a/aiohttp/_websocket/reader_c.pxd
++++ b/aiohttp/_websocket/reader_c.pxd
+@@ -69,6 +69,7 @@ cdef class WebSocketReader:
+     cdef bint _frame_fin
+     cdef int _frame_opcode
+     cdef list _payload_fragments
++    cdef bytearray _payload_buffer
+     cdef Py_ssize_t _max_fragments
+     cdef Py_ssize_t _frame_payload_len
+ 
+diff --git a/aiohttp/_websocket/reader_py.py b/aiohttp/_websocket/reader_py.py
+index 27f1fee..6499fa7 100644
+--- a/aiohttp/_websocket/reader_py.py
++++ b/aiohttp/_websocket/reader_py.py
+@@ -144,10 +144,12 @@ class WebSocketReader:
+         self._opcode: int = OP_CODE_NOT_SET
+         self._frame_fin = False
+         self._frame_opcode: int = OP_CODE_NOT_SET
++        # Reads of an in-flight frame, joined once when it completes.
+         self._payload_fragments: list[bytes] = []
+-        # Limit number of fragments, so a large number of tiny fragments
+-        # doesn't exceed reasonable memory usage.
++        # Fold reads into _payload_buffer past this count to bound the object
++        # count (bytes are bounded by max_msg_size).
+         self._max_fragments = max(1024, max_msg_size // 256) if max_msg_size else 0
++        self._payload_buffer = bytearray()
+         self._frame_payload_len = 0
+ 
+         self._tail: bytes = b""
+@@ -457,22 +459,29 @@ class WebSocketReader:
+                 start_pos = f_end_pos
+ 
+                 if self._payload_bytes_to_read != 0:
+-                    # If we don't have a complete frame, we need to save the
+-                    # data for the next call to feed_data.
+-                    self._payload_fragments.append(data_cstr[f_start_pos:f_end_pos])
++                    if f_start_pos < f_end_pos:  # skip a header-only read
++                        self._payload_fragments.append(data_cstr[f_start_pos:f_end_pos])
+                     if (
+                         self._max_fragments
+                         and len(self._payload_fragments) > self._max_fragments
+-                        and not self.queue._protocol._reading_paused
+                     ):
+-                        self.queue._protocol.pause_reading()
++                        # Fold to bound the object count. Not a pause: nothing
++                        # resumes reading until the frame is queued.
++                        self._payload_buffer += b"".join(self._payload_fragments)
++                        self._payload_fragments.clear()
+                     break
+ 
+                 payload: Union[bytes, bytearray]
+                 if had_fragments:
+-                    # We have to join the payload fragments get the payload
+                     self._payload_fragments.append(data_cstr[f_start_pos:f_end_pos])
+-                    if self._has_mask:
++                    if self._payload_buffer:  # folded prefix
++                        self._payload_buffer += b"".join(self._payload_fragments)
++                        if self._has_mask:
++                            assert self._frame_mask is not None
++                            websocket_mask(self._frame_mask, self._payload_buffer)
++                        payload = self._payload_buffer
++                        self._payload_buffer = bytearray()  # detach; payload aliases it
++                    elif self._has_mask:
+                         assert self._frame_mask is not None
+                         payload_bytearray = bytearray(b"".join(self._payload_fragments))
+                         websocket_mask(self._frame_mask, payload_bytearray)
+diff --git a/tests/test_websocket_parser.py b/tests/test_websocket_parser.py
+index 5589bd3..abb412b 100644
+--- a/tests/test_websocket_parser.py
++++ b/tests/test_websocket_parser.py
+@@ -18,6 +18,10 @@ from aiohttp._websocket.helpers import (
+ )
+ from aiohttp._websocket.models import WS_DEFLATE_TRAILING
+ from aiohttp._websocket.reader import WebSocketDataQueue
++from aiohttp._websocket.reader_py import (
++    WebSocketDataQueue as PyWebSocketDataQueue,
++    WebSocketReader as PyWebSocketReader,
++)
+ from aiohttp.base_protocol import BaseProtocol
+ from aiohttp.compression_utils import ZLibBackend
+ from aiohttp.http import WebSocketError, WSCloseCode, WSMessage, WSMsgType
+@@ -758,45 +762,173 @@ def test_flow_control_multi_byte_text(
+     assert protocol._reading_paused is True
+ 
+ 
+-async def test_incomplete_frame_pauses_when_fragment_limit_exceeded(
++async def test_incomplete_frame_retained_objects_stay_bounded(
+     protocol: BaseProtocol,
+ ) -> None:
++    """Reads fold into one buffer past the cap, bounding the object count.
++
++    Uses the pure-Python reader so the internals are reachable.
++    """
+     max_msg_size = 64 * 1024
+     loop = asyncio.get_running_loop()
+-    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
+-    parser = WebSocketReader(out, max_msg_size, compress=False)
++    out = PyWebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = PyWebSocketReader(out, max_msg_size, compress=False)
+ 
+     payload_len = 32 * 1024
+     parser.feed_data(PACK_LEN2(0x80 | WSMsgType.BINARY, 126, payload_len))
+-    assert protocol._reading_paused is False
+ 
+-    # Feed the payload two bytes per read so the pause is
+-    # driven purely by the fragment count, not the total byte count.
+-    paused_after = None
+-    for i in range(payload_len // 2 - 1):  # pragma: no branch
++    # Two bytes per read runs past the cap; the list folds and stays bounded.
++    for _ in range(payload_len // 2 - 1):
+         parser.feed_data(b"xx")
+-        if protocol._reading_paused:
+-            paused_after = i + 1  # type: ignore[unreachable]
+-            break
++        assert len(parser._payload_fragments) <= parser._max_fragments
++
++    parser.feed_data(b"xx")
++    msg = await out.read()
++    assert msg.data == b"x" * payload_len
++    assert len(parser._payload_fragments) == 0
++    assert len(parser._payload_buffer) == 0
++
++
++def _fold_cap(max_msg_size: int) -> int:
++    """The fragment count the reader folds at (single source of truth)."""
++    return PyWebSocketReader(
++        mock.Mock(), max_msg_size, compress=False
++    )._max_fragments
+ 
+-    assert paused_after is not None
+-    # Paused long before the frame could complete (16384 two-byte reads).
+-    assert paused_after < payload_len // 2  # type: ignore[unreachable]
+ 
++@pytest.mark.parametrize("mask", [False, True])
++async def test_frame_split_across_many_reads_is_delivered_intact(
++    protocol: BaseProtocol, mask: bool
++) -> None:
++    """A frame arriving two bytes per read (past the fold cap) is delivered whole."""
++    max_msg_size = 64 * 1024
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, max_msg_size, compress=False)
++
++    payload = bytes(range(256)) * 32  # 8 KiB of varied, distinctive bytes
++    frame = build_frame(payload, WSMsgType.BINARY, use_mask=mask)
+ 
+-async def test_incomplete_frame_not_paused_for_normal_reads(
++    # Guard the reads stay past the fold cap even if the cap constants change.
++    assert len(frame) // 2 > _fold_cap(max_msg_size)
++    chunks = [frame[i : i + 2] for i in range(0, len(frame), 2)]
++    for chunk in chunks[:-1]:
++        parser.feed_data(chunk)
++        assert not out._buffer
++        assert protocol._reading_paused is False
++
++    parser.feed_data(chunks[-1])
++    msg = await out.read()
++    assert msg.data == payload
++
++
++async def test_consecutive_folded_frames_do_not_bleed(
+     protocol: BaseProtocol,
+ ) -> None:
++    """Two frames folded on one reader stay independent (buffer detached, not cleared)."""
++    max_msg_size = 64 * 1024
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, max_msg_size, compress=False)
++
++    first = bytes(range(256)) * 32  # 8 KiB
++    second = bytes(reversed(range(256))) * 24  # 6 KiB, distinct content
++
++    for payload in (first, second):
++        frame = build_frame(payload, WSMsgType.BINARY, use_mask=True)
++        assert len(frame) // 2 > _fold_cap(max_msg_size)  # reads exceed the cap
++        for i in range(0, len(frame), 2):
++            parser.feed_data(frame[i : i + 2])
++        # .clear() would deliver frame 1 empty; buffer reuse would corrupt frame 2.
++        msg = await out.read()
++        assert msg.data == payload
++
++
++async def test_fragmented_message_survives_fold(protocol: BaseProtocol) -> None:
++    """A multi-frame message whose frames each fold reassembles correctly.
++
++    A non-final folded frame hands a bytearray to ``self._partial += payload``.
++    """
+     max_msg_size = 64 * 1024
+     loop = asyncio.get_running_loop()
+     out = WebSocketDataQueue(protocol, 2**16, loop=loop)
+     parser = WebSocketReader(out, max_msg_size, compress=False)
+ 
+-    # Normal traffic (a frame delivered in a handful of reasonably sized reads)
+-    # must never trip the fragment-limit backpressure.
++    first = bytes(range(256)) * 32  # 8 KiB
++    second = bytes(reversed(range(256))) * 24  # 6 KiB
++    frames = [
++        build_frame(first, WSMsgType.BINARY, is_fin=False, use_mask=True),
++        build_frame(second, WSMsgType.CONTINUATION, is_fin=True, use_mask=True),
++    ]
++    for frame in frames:
++        assert len(frame) // 2 > _fold_cap(max_msg_size)
++        for i in range(0, len(frame), 2):
++            parser.feed_data(frame[i : i + 2])
++
++    msg = await out.read()
++    assert msg.data == first + second
++
++
++async def test_compressed_frame_survives_fold(protocol: BaseProtocol) -> None:
++    """A PMCE frame folded past the cap still decompresses (folded bytearray path)."""
++    max_msg_size = 64 * 1024
++    loop = asyncio.get_running_loop()
++    out = WebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = WebSocketReader(out, max_msg_size, compress=True)
++
++    # Incompressible, so the deflated frame stays large enough to fold.
++    rng = random.Random(0)
++    payload = bytes(rng.getrandbits(8) for _ in range(8 * 1024))
++    frame = build_frame(
++        payload, WSMsgType.BINARY, ZLibBackend=ZLibBackend, use_mask=True
++    )
++    assert len(frame) // 2 > _fold_cap(max_msg_size)
++
++    for i in range(0, len(frame), 2):
++        parser.feed_data(frame[i : i + 2])
++    msg = await out.read()
++    assert msg.data == payload
++
++
++async def test_frame_split_under_cap_uses_list_without_folding(
++    protocol: BaseProtocol,
++) -> None:
++    """A frame under the cap stays in the list, never folds, never pauses."""
++    max_msg_size = 64 * 1024
++    loop = asyncio.get_running_loop()
++    out = PyWebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = PyWebSocketReader(out, max_msg_size, compress=False)
++
+     payload_len = 32 * 1024
+     parser.feed_data(PACK_LEN2(0x80 | WSMsgType.BINARY, 126, payload_len))
+-    # 32 KiB in 4 KiB reads -> 8 fragments, far below the cap.
+-    for _ in range(payload_len // 4096):
++    reads = payload_len // 4096
++    assert reads < parser._max_fragments  # stays under the cap: no fold
++    for _ in range(reads):
+         parser.feed_data(b"x" * 4096)
+-    assert protocol._reading_paused is False
++        assert protocol._reading_paused is False
++        assert len(parser._payload_buffer) == 0  # never folded
++
++    msg = await out.read()
++    assert msg.data == b"x" * payload_len
++
++
++async def test_max_msg_size_zero_opts_out_of_the_fold(
++    protocol: BaseProtocol,
++) -> None:
++    """max_msg_size=0 disables every limit, including the fold."""
++    loop = asyncio.get_running_loop()
++    out = PyWebSocketDataQueue(protocol, 2**16, loop=loop)
++    parser = PyWebSocketReader(out, 0, compress=False)
++    assert parser._max_fragments == 0
++
++    payload_len = 4096  # well past the 1024 floor
++    parser.feed_data(PACK_LEN2(0x80 | WSMsgType.BINARY, 126, payload_len))
++    for _ in range(payload_len - 1):
++        parser.feed_data(b"x")
++    # No fold: every read accumulates in the list, the buffer is untouched.
++    assert len(parser._payload_fragments) == payload_len - 1
++    assert len(parser._payload_buffer) == 0
++
++    parser.feed_data(b"x")
++    msg = await out.read()
++    assert msg.data == b"x" * payload_len
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 98fd4bdba3..619d2c6658 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -32,6 +32,8 @@ SRC_URI += " \
     file://CVE-2026-111063_p1.patch \
     file://CVE-2026-111063_p2.patch \
     file://CVE-2026-111064.patch \
+    file://CVE-2026-123817_p1.patch \
+    file://CVE-2026-123817_p2.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
@@ -50,6 +52,13 @@ do_configure:prepend() {
         -I ${S}/aiohttp \
         -o ${S}/aiohttp/_http_parser.c \
         ${S}/aiohttp/_http_parser.pyx
+
+    cp ${S}/aiohttp/_websocket/reader_py.py \
+        ${S}/aiohttp/_websocket/reader_c.py
+    cython3 -3 -Werror \
+        -I ${S}/aiohttp \
+        -o ${S}/aiohttp/_websocket/reader_c.c \
+        ${S}/aiohttp/_websocket/reader_c.py
 }
 
 PACKAGECONFIG ??= ""
-- 
2.35.6

