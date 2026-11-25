Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36202.1795584016467055052
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=k14HGb90;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9925; q=dns/txt;
  s=iport01; t=1795584016; x=1796793616;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OFL8ZVGLpBf/8wAP3PSbHiio26HtbpyqW8I2kLa4v2M=;
  b=k14HGb90JtWGZKyPd2HJ0pqBcTY1v3q4L+eHtGHVOYAOKtn5z2XCQTjD
   wrhGnfr0U/gfQuKvcNw14AcvdAKoNccXFoRT+vQ+Wl4DCkBEIhTkec1Ya
   bmhSeGcDPL7XaCGrFNeI2EkduOFU6oZNjURLh2Z78DoIwITjVbZtLiTjq
   Y6edNolgV3Hg1yjlUu3x6vMc8/fOdOxqATZ3RwSwuNBw3GWuhBRFUK/yS
   HCOFTsLw+OzWW2p3HyOrNKPVWEDd2lnFJHLWctFOUhO4HZlgwYA98W8Ml
   3IN743ZFwL98ND8KwIZthdYQp+ar1sX1f7xy2Yauk4cv9SQh3O06rKzqR
   Q==;
X-CSE-ConnectionGUID: 7WTwaM7eQBKztwT9apmc6A==
X-CSE-MsgGUID: cepQhl6sRzmXb1OHOdNVVw==
X-IPAS-Result: =?us-ascii?q?A0BJAgAhbQZr/8tK/pBaglmCV3VhQkkDlCeCIQORUIxZg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYJ0AgERugOBe?=
 =?us-ascii?q?TOBAYMpAYFU2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVg2qBBYFcAoE4hm4Eg?=
 =?us-ascii?q?iKBDIFUHox1AoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbB?=
 =?us-ascii?q?gWBHIEegRKBA12BKyheIYEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CKQYWI?=
 =?us-ascii?q?Qs0GA1IESw3FRkEPm4HlBODGwEOLlEBByR/BmgQBygRDZJzYJIEgTWfXAoog?=
 =?us-ascii?q?3mMJJU6GjOFW6UXC5h9jgqVaWiEaoFoPIFZcBWDIglKGQ+OKwMLC4NgzlsjN?=
 =?us-ascii?q?QIJAy8BAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:UXyS+6AZHfI1txVW/37iw5YqxClBgxIJ4kV8jS/XYbTApDx23jBSy
 WtOXWvTO66MYGCgLdl/PYqxp0gPvZeDzdNlOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEnMpSE0gTYoAh0MVlHX5yp
 PUALTtTR0XW7w626OrTpuhEj8k5ac2uN4QFtzQ4l3fSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWEHgBfoO3WjPn8eE4o3huKhnFH0ciZTrxSeoq9fD237klQogOSxboK9ltqiTshNp0ac+
 Hn87WHJCEg9FPuT7wS77Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVkOzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:SQKbMaGzfPotF0wPpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:6NZdgG2J40u1qv08L/9q6bxfRf8ZbXT4k3rpCWyqFXlVGbSNTFTO0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3A9zSRnQ6bdl6k0NvU2C3R+sbnxoxj7ryXCERTiq8?=
 =?us-ascii?q?UvvmObAtQHDu7sgqoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60184460"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:20:12 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 4AF4D18000A5F
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:20:12 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 7F2D4CBF22E; Tue, 24 Nov 2026 21:20:09 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 06/10] python3-aiohttp: fix CVE-2026-128128
Date: Tue, 24 Nov 2026 21:20:02 -0800
Message-Id: <20261125052006.3116497-7-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125052006.3116497-1-asparmar@cisco.com>
References: <20261125052006.3116497-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132983
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the WebSocket declared-length checks for
CVE-2026-128128 from the upstream stable branch [1].

Avoid signed size arithmetic overflow in the accelerated reader and
reject lengths that cannot fit the parser size type.

The embedded backport notes describe the required prerequisite or
follow-up changes and the adaptations to the current APIs.

[1] https://github.com/aio-libs/aiohttp/commit/8cfbe9abe5e11b84006a10f9bdf82bf607671dab
[2] https://github.com/aio-libs/aiohttp/commit/bd89ad6704783015bc4d97dd847509023199904e
[3] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-3rp8-rxj8-mvjw

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python3-aiohttp/CVE-2026-128128.patch     | 206 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 207 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128128.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128128.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128128.patch
new file mode 100644
index 0000000000..6dd219a678
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128128.patch
@@ -0,0 +1,206 @@
+From 1ac5baa4a25023efa0856c2c4585401bf33f304b Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sat, 22 Aug 2026 17:49:48 +0100
+Subject: [PATCH] [PR #13415/8c8906a1 backport][3.14] Fix oversized frames on
+ websocket messages (#13494)
+
+**This is a backport of PR #13415 as merged into master
+(8c8906a19f64e52ef6a7d44d65217eb3c5af413f).**
+
+Co-authored-by: Sam Bull <git@sambull.org>
+
+CVE: CVE-2026-128128
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/8cfbe9abe5e11b84006a10f9bdf82bf607671dab]
+
+Backport Changes:
+- Fold the frame-length range check and regression tests from upstream
+  bd89ad6704783015bc4d97dd847509023199904e so declared lengths that
+  exceed Py_ssize_t are rejected before conversion on 32-bit builds.
+- Remove decode_text arguments from the added tests because the current
+  WebSocketReader does not expose that option and always decodes text.
+- Omit CHANGES/13415.bugfix.rst, which records an upstream release note.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ aiohttp/_websocket/reader_c.pxd |  4 ++
+ aiohttp/_websocket/reader_py.py | 27 ++++++++++--
+ tests/test_websocket_parser.py  | 76 +++++++++++++++++++++++++++++++++
+ 3 files changed, 103 insertions(+), 4 deletions(-)
+
+diff --git a/aiohttp/_websocket/reader_c.pxd b/aiohttp/_websocket/reader_c.pxd
+index 4f8a1b2..fcb7b4d 100644
+--- a/aiohttp/_websocket/reader_c.pxd
++++ b/aiohttp/_websocket/reader_c.pxd
+@@ -8,6 +8,8 @@ cdef unsigned int READ_PAYLOAD_LENGTH
+ cdef unsigned int READ_PAYLOAD_MASK
+ cdef unsigned int READ_PAYLOAD
+ 
++cdef unsigned long long MAX_PAYLOAD_LEN
++
+ cdef int OP_CODE_NOT_SET
+ cdef int OP_CODE_CONTINUATION
+ cdef int OP_CODE_TEXT
+@@ -107,6 +109,8 @@ cdef class WebSocketReader:
+         has_mask=bint,
+         fin=bint,
+         had_fragments=Py_ssize_t,
++        partial_len=Py_ssize_t,
++        frame_len="unsigned long long",
+         payload_bytearray=bytearray,
+     )
+     cpdef void _feed_data(self, bytes data) except *
+diff --git a/aiohttp/_websocket/reader_py.py b/aiohttp/_websocket/reader_py.py
+index 6499fa7..e9472bd 100644
+--- a/aiohttp/_websocket/reader_py.py
++++ b/aiohttp/_websocket/reader_py.py
+@@ -2,6 +2,7 @@
+ 
+ import asyncio
+ import builtins
++import sys
+ from collections import deque
+ from typing import Deque, Final, Optional, Set, Tuple, Union
+ 
+@@ -27,6 +28,12 @@ READ_PAYLOAD_LENGTH = 2
+ READ_PAYLOAD_MASK = 3
+ READ_PAYLOAD = 4
+ 
++# Largest declared payload length the reader can represent: the compiled
++# reader stores it in a Py_ssize_t, which holds 2**31-1 on the 32-bit builds
++# (the win32 and armv7l wheels) and 2**63-1 everywhere else.
++# TODO: Remove when we drop 32 bit support (and from reader_c.pxd).
++MAX_PAYLOAD_LEN = sys.maxsize
++
+ WS_MSG_TYPE_BINARY = WSMsgType.BINARY
+ WS_MSG_TYPE_TEXT = WSMsgType.TEXT
+ 
+@@ -413,7 +420,16 @@ class WebSocketReader:
+                 elif len_flag > 126:
+                     if data_len - start_pos < 8:
+                         break
+-                    self._payload_bytes_to_read = UNPACK_LEN3(data, start_pos)[0]
++                    # The declared length is an unsigned 64-bit integer that
++                    # does not necessarily fit _payload_bytes_to_read.
++                    frame_len = UNPACK_LEN3(data, start_pos)[0]
++                    if frame_len > MAX_PAYLOAD_LEN:
++                        raise WebSocketError(
++                            WSCloseCode.MESSAGE_TOO_BIG,
++                            f"Message size {int(frame_len) + len(self._partial)} "
++                            f"exceeds limit {self._max_msg_size or MAX_PAYLOAD_LEN}",
++                        )
++                    self._payload_bytes_to_read = frame_len
+                     start_pos += 8
+                 else:
+                     self._payload_bytes_to_read = len_flag
+@@ -426,11 +442,14 @@ class WebSocketReader:
+                     OP_CODE_BINARY,
+                     OP_CODE_CONTINUATION,
+                 }:
+-                    projected_size = self._payload_bytes_to_read + len(self._partial)
+-                    if projected_size >= self._max_msg_size:
++                    # partial_len declared in reader_c.pxd to keep it in C.
++                    partial_len = len(self._partial)
++                    # payload_bytes_to_read is a signed Py_ssize_t C value,
++                    # use subtraction here to avoid an integer overflow.
++                    if self._payload_bytes_to_read >= self._max_msg_size - partial_len:
+                         raise WebSocketError(
+                             WSCloseCode.MESSAGE_TOO_BIG,
+-                            f"Message size {projected_size} "
++                            f"Message size {int(self._payload_bytes_to_read) + partial_len} "
+                             f"exceeds limit {self._max_msg_size}",
+                         )
+ 
+diff --git a/tests/test_websocket_parser.py b/tests/test_websocket_parser.py
+index abb412b..c3ec201 100644
+--- a/tests/test_websocket_parser.py
++++ b/tests/test_websocket_parser.py
+@@ -2,6 +2,7 @@ import asyncio
+ import pickle
+ import random
+ import struct
++import sys
+ from typing import Union
+ from unittest import mock
+ 
+@@ -698,6 +699,81 @@ def test_msg_too_large_text_after_non_fin_text(out: WebSocketDataQueue) -> None:
+     assert ctx.value.code == WSCloseCode.MESSAGE_TOO_BIG
+ 
+ 
++def test_msg_too_large_declared_length_near_ssize_t_max(
++    out: WebSocketDataQueue,
++) -> None:
++    # Regression test: the header-time size check compares
++    # `payload_bytes_to_read + len(partial)` against max_msg_size. In the
++    # compiled Cython reader payload_bytes_to_read is a signed Py_ssize_t C
++    # value, and RFC 6455 allows a declared length up to 2**63-1, so a naive
++    # addition can wrap around to a negative number and bypass the limit
++    # entirely once anything is already buffered in `partial`.
++    max_msg_size = 4 * 1024 * 1024
++    parser = WebSocketReader(out, max_msg_size, compress=False)
++
++    # Buffer one byte in `partial` via a non-fin fragment.
++    first = build_frame(b"a", WSMsgType.TEXT, is_fin=False)
++    parser._feed_data(first)
++
++    # Continuation header alone declares the largest length RFC 6455
++    # allows: 2**63-1.
++    header = PACK_LEN3(WSMsgType.CONTINUATION, 127, 2**63 - 1)
++    with pytest.raises(
++        WebSocketError,
++        match=rf"^Message size {2**63} exceeds limit {max_msg_size}$",
++    ) as ctx:
++        parser._feed_data(header)
++    assert ctx.value.code == WSCloseCode.MESSAGE_TOO_BIG
++
++
++@pytest.mark.parametrize(
++    "declared",
++    (sys.maxsize + 1, 2**64 - 1),
++    ids=("ssize_t_max_plus_one", "uint64_max"),
++)
++@pytest.mark.parametrize(
++    "max_msg_size", (4 * 1024 * 1024, 0), ids=("bounded", "unbounded")
++)
++def test_msg_too_large_declared_length_above_ssize_t_max(
++    out: WebSocketDataQueue, max_msg_size: int, declared: int
++) -> None:
++    # RFC 6455 allows an unsigned 64-bit declared length, which does not fit
++    # the signed Py_ssize_t payload_bytes_to_read of the compiled reader:
++    # anything above sys.maxsize (2**31-1 on the 32-bit builds) has to be
++    # rejected before it is stored there, or storing it raises OverflowError
++    # and escapes as an abnormal closure instead of MESSAGE_TOO_BIG. Such a
++    # frame can never be buffered, so an unlimited max_msg_size is checked
++    # too.
++    parser = WebSocketReader(out, max_msg_size, compress=False)
++
++    header = PACK_LEN3(0x80 | WSMsgType.TEXT, 127, declared)
++    with pytest.raises(
++        WebSocketError,
++        match=rf"^Message size {declared} exceeds limit {max_msg_size or sys.maxsize}$",
++    ) as ctx:
++        parser._feed_data(header)
++    assert ctx.value.code == WSCloseCode.MESSAGE_TOO_BIG
++
++
++def test_msg_too_large_above_ssize_t_max_reports_buffered_fragments(
++    out: WebSocketDataQueue,
++) -> None:
++    # The reported size adds what is already buffered, so the message reads the
++    # same whether the declared length is caught by the Py_ssize_t range check
++    # or by the max_msg_size comparison below it.
++    max_msg_size = 4 * 1024 * 1024
++    parser = WebSocketReader(out, max_msg_size, compress=False)
++
++    parser._feed_data(build_frame(b"a", WSMsgType.TEXT, is_fin=False))
++
++    header = PACK_LEN3(WSMsgType.CONTINUATION, 127, 2**64 - 1)
++    with pytest.raises(
++        WebSocketError, match=rf"^Message size {2**64} exceeds limit {max_msg_size}$"
++    ) as ctx:
++        parser._feed_data(header)
++    assert ctx.value.code == WSCloseCode.MESSAGE_TOO_BIG
++
++
+ @pytest.mark.parametrize(
+     "opcode",
+     (0x3, 0x4, 0x5, 0x6, 0x7, 0xB, 0xC, 0xD, 0xE, 0xF),
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 3ac8f15bbf..06e0156e14 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -38,6 +38,7 @@ SRC_URI += " \
     file://CVE-2026-128125.patch \
     file://CVE-2026-128126.patch \
     file://CVE-2026-128127.patch \
+    file://CVE-2026-128128.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6

