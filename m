Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88974C5DF86
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:36 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15269.1787076932678337791
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YFbYRkWz;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8074; q=dns/txt;
  s=iport01; t=1787076933; x=1788286533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nMRj8H9APp/MnaAUZYPGAN1fzXsNW2/WOyMfPXETn9c=;
  b=YFbYRkWzMT88vInbglFMmLJlq0d1NxaprduDt67LQi2g9Pcb4GJcwM6p
   kJsSnwfAxOH+kPlm9SSGOgXszBgpbEfgtiVMoqGM+k+RmVTRiCRjGvcwH
   tVO06EKRuOHU5ugCECL+b0jrPokD4jzRwiNXA8Qmd6zBSGyM9+GUv4oW3
   ZMHgoZJUW8GZHRCEwwLPLl/hpC2wxjpu/1NFc4WEZVe99vUggmDOqrw9V
   GvFvnI8t/Z7Qe4PfYr9pgBKOyWSNdxUd5oORKbgJlfNoFSW5/fU7nTrEM
   /Sk2ww3183ONw2YmCO6ZD31VkGokJqo3YLGXASF/nM0IM24q4g/G3fQSx
   g==;
X-CSE-ConnectionGUID: Lom95vaGSwybJKjy5vs0iw==
X-CSE-MsgGUID: yANQdguTQ5WLGxx10jKCRw==
X-IPAS-Result: =?us-ascii?q?A0BIAgDJn4Rq/5EQJK1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNawImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgE2gj4DEcQfgXkzgQGDK?=
 =?us-ascii?q?AExBYEe2zABCxQBBYEzhT+IIl0YAYR8JxsbgXKBFYE7gi6BBYFcAoE4hm0Eg?=
 =?us-ascii?q?iKBDIFaHpE4SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BK?=
 =?us-ascii?q?IQ3Ixk2eoEJXoErKmEBEheBCYIKAoJzggYCAUlFDgsYDUgRLDcUGQQ+bgeOO?=
 =?us-ascii?q?CCCQ4EOASsXaBI8ewKlWKEPCiiDdowhlToaM4QEgVeSQJJRC5h9jgqWUIRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD44qDguDYMw5JzICCTIBAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:2S7LZaJsM3nZ89hbFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS1DwOm
 GdJXT+BaPrfN2ehKYt+a97goxhT65OGydM3T1Ed+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2crajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1KC0RnYJMR1d1oEGts1
 v4JdS4WNhGc0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBXbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzMXwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQhieG0aIqEIYDiqcN9j2++n
 27J4ljAXy4+G8yPkGKH0VmWmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:1jvEwawY34io8bVT56qiKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:3VgamG8A5a9kTw+8HcaVv2oTH5F4bHTy92jBKW2bC3c0VqbNSEDFrQ==
X-Talos-MUID: 9a23:7WcM8AlYcH5o/qOA64uzdnpzHeFR76uzNHlQrrEpq9ndbS5TEA2C2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="811108934"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 8659718000207;
	Tue, 18 Aug 2026 18:15:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 2A3AECD02BB; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 04/10] python3-aiohttp: fix CVE-2026-54274
Date: Tue, 18 Aug 2026 11:15:22 -0700
Message-Id: <20260818181528.3405276-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260818181528.3405276-1-dkelaiya@cisco.com>
References: <20260818181528.3405276-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129240

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/14b6ee851fb16ec199acb950de0c82d476799e7d
[2] https://github.com/advisories/GHSA-xcgm-r5h9-7989

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54274.patch      | 182 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch
new file mode 100644
index 0000000000..27a2438cc1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch
@@ -0,0 +1,182 @@
+From f971aaedd8dc9cab84f09b97a412744084115113 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sat, 6 Jun 2026 00:05:19 +0100
+Subject: [PATCH] [PR #12817/69344c6e backport][3.14] Improve websocket checks
+ (#12818)
+
+**This is a backport of PR #12817 as merged into master
+(69344c6efa3e5dd80b1c88079fa06d4e902a3b83).**
+
+CVE: CVE-2026-54274
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/14b6ee851fb16ec199acb950de0c82d476799e7d]
+
+Co-authored-by: Sam Bull <git@sambull.org>
+(cherry picked from commit 14b6ee851fb16ec199acb950de0c82d476799e7d)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12817.bugfix.rst        |  1 +
+ aiohttp/_websocket/reader_py.py | 42 +++++++++++++-------
+ tests/test_websocket_parser.py  | 68 +++++++++++++++++++++++++++++++++
+ 3 files changed, 98 insertions(+), 13 deletions(-)
+ create mode 100644 CHANGES/12817.bugfix.rst
+
+diff --git a/CHANGES/12817.bugfix.rst b/CHANGES/12817.bugfix.rst
+new file mode 100644
+index 000000000..c8a35e309
+--- /dev/null
++++ b/CHANGES/12817.bugfix.rst
+@@ -0,0 +1 @@
++Tightened up some websocket parser checks -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/_websocket/reader_py.py b/aiohttp/_websocket/reader_py.py
+index 5166d7ec2..16c5f3be6 100644
+--- a/aiohttp/_websocket/reader_py.py
++++ b/aiohttp/_websocket/reader_py.py
+@@ -202,12 +202,6 @@ class WebSocketReader:
+                 if opcode != OP_CODE_CONTINUATION:
+                     self._opcode = opcode
+                 self._partial += payload
+-                if self._max_msg_size and len(self._partial) >= self._max_msg_size:
+-                    raise WebSocketError(
+-                        WSCloseCode.MESSAGE_TOO_BIG,
+-                        f"Message size {len(self._partial)} "
+-                        f"exceeds limit {self._max_msg_size}",
+-                    )
+                 return
+ 
+             has_partial = bool(self._partial)
+@@ -230,13 +224,6 @@ class WebSocketReader:
+             else:
+                 assembled_payload = payload
+ 
+-            if self._max_msg_size and len(assembled_payload) >= self._max_msg_size:
+-                raise WebSocketError(
+-                    WSCloseCode.MESSAGE_TOO_BIG,
+-                    f"Message size {len(assembled_payload)} "
+-                    f"exceeds limit {self._max_msg_size}",
+-                )
+-
+             # Decompress process must to be done after all packets
+             # received.
+             if compressed:
+@@ -361,6 +348,19 @@ class WebSocketReader:
+                         "Received frame with non-zero reserved bits",
+                     )
+ 
++                if opcode not in {
++                    OP_CODE_CONTINUATION,
++                    OP_CODE_TEXT,
++                    OP_CODE_BINARY,
++                    OP_CODE_CLOSE,
++                    OP_CODE_PING,
++                    OP_CODE_PONG,
++                }:
++                    raise WebSocketError(
++                        WSCloseCode.PROTOCOL_ERROR,
++                        f"Unexpected opcode={opcode!r}",
++                    )
++
+                 if opcode > 0x7 and fin == 0:
+                     raise WebSocketError(
+                         WSCloseCode.PROTOCOL_ERROR,
+@@ -413,6 +413,22 @@ class WebSocketReader:
+                 else:
+                     self._payload_bytes_to_read = len_flag
+ 
++                # Reject oversized data frames before buffering any payload
++                # bytes. Control frames are capped at 125 bytes (checked in
++                # READ_HEADER) so only text/binary/continuation need this.
++                if self._max_msg_size and self._frame_opcode in {
++                    OP_CODE_TEXT,
++                    OP_CODE_BINARY,
++                    OP_CODE_CONTINUATION,
++                }:
++                    projected_size = self._payload_bytes_to_read + len(self._partial)
++                    if projected_size >= self._max_msg_size:
++                        raise WebSocketError(
++                            WSCloseCode.MESSAGE_TOO_BIG,
++                            f"Message size {projected_size} "
++                            f"exceeds limit {self._max_msg_size}",
++                        )
++
+                 self._state = READ_PAYLOAD_MASK if self._has_mask else READ_PAYLOAD
+ 
+             # read payload mask
+diff --git a/tests/test_websocket_parser.py b/tests/test_websocket_parser.py
+index 603310958..3a283e0a3 100644
+--- a/tests/test_websocket_parser.py
++++ b/tests/test_websocket_parser.py
+@@ -643,6 +643,74 @@ def test_compressed_msg_too_large(out) -> None:
+     assert ctx.value.code == WSCloseCode.MESSAGE_TOO_BIG
+ 
+ 
++@pytest.mark.parametrize("fin", (0x80, 0x00), ids=("fin", "non-fin"))
++def test_msg_too_large_at_header(out: WebSocketDataQueue, fin: int) -> None:
++    max_msg_size = 256
++    parser = WebSocketReader(out, max_msg_size, compress=False)
++
++    # Header alone: TEXT, 64-bit length, declares 1 MiB of payload.
++    header = PACK_LEN3(fin | WSMsgType.TEXT, 127, 1024 * 1024)
++    with pytest.raises(
++        WebSocketError, match=r"^Message size 1048576 exceeds limit 256$"
++    ) as ctx:
++        parser._feed_data(header)
++    assert ctx.value.code == WSCloseCode.MESSAGE_TOO_BIG
++
++
++def test_msg_too_large_across_fragments(out: WebSocketDataQueue) -> None:
++    # Individual fragments fit under max_msg_size but accumulate past it.
++    max_msg_size = 256
++    parser = WebSocketReader(out, max_msg_size, compress=False)
++
++    first = build_frame(b"a" * 100, WSMsgType.TEXT, is_fin=False)
++    parser._feed_data(first)
++    middle = build_frame(b"b" * 100, WSMsgType.CONTINUATION, is_fin=False)
++    parser._feed_data(middle)
++
++    # Third 100-byte fragment would push the accumulated total to 300.
++    last = build_frame(b"c" * 100, WSMsgType.CONTINUATION, is_fin=False)
++    with pytest.raises(
++        WebSocketError, match=r"^Message size 300 exceeds limit 256$"
++    ) as ctx:
++        parser._feed_data(last)
++    assert ctx.value.code == WSCloseCode.MESSAGE_TOO_BIG
++
++
++def test_msg_too_large_text_after_non_fin_text(out: WebSocketDataQueue) -> None:
++    # Protocol-violating sequence: a fresh TEXT arrives while a fragmented
++    # message is still open.
++    max_msg_size = 256
++    parser = WebSocketReader(out, max_msg_size, compress=False)
++
++    first = build_frame(b"a" * 200, WSMsgType.TEXT, is_fin=False)
++    parser._feed_data(first)
++
++    # Second TEXT header alone announces 100 bytes; 100 + 200 partial = 300.
++    second_header = PACK_LEN1(WSMsgType.TEXT, 100)
++    with pytest.raises(
++        WebSocketError, match=r"^Message size 300 exceeds limit 256$"
++    ) as ctx:
++        parser._feed_data(second_header)
++    assert ctx.value.code == WSCloseCode.MESSAGE_TOO_BIG
++
++
++@pytest.mark.parametrize(
++    "opcode",
++    (0x3, 0x4, 0x5, 0x6, 0x7, 0xB, 0xC, 0xD, 0xE, 0xF),
++    ids=lambda v: f"0x{v:x}",
++)
++def test_reserved_opcode_rejected_at_header(
++    out: WebSocketDataQueue, opcode: int
++) -> None:
++    # RFC 6455 reserves opcodes 0x3-0x7 (non-control) and 0xB-0xF (control).
++    parser = WebSocketReader(out, max_msg_size=256, compress=False)
++
++    header = PACK_LEN3(0x80 | opcode, 127, 1024 * 1024)
++    with pytest.raises(WebSocketError, match=rf"^Unexpected opcode={opcode}$") as ctx:
++        parser._feed_data(header)
++    assert ctx.value.code == WSCloseCode.PROTOCOL_ERROR
++
++
+ class TestWebSocketError:
+     def test_ctor(self) -> None:
+         err = WebSocketError(WSCloseCode.PROTOCOL_ERROR, "Something invalid")
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 33ef64a59b..a40f522e4d 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -10,6 +10,7 @@ SRC_URI += " \
     file://CVE-2026-34993.patch \
     file://CVE-2026-47265.patch \
     file://CVE-2026-50269.patch \
+    file://CVE-2026-54274.patch \
 "
 
 CVE_PRODUCT = "aiohttp"
-- 
2.35.6


