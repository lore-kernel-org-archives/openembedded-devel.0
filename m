Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA233CA5FB1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:43 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63553.1790617415702148386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XylsrbhU;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8668; q=dns/txt;
  s=iport01; t=1790617415; x=1791827015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oc4e3YtOWdxsX0H7/VJgwBGUc2oqy3A+tD59HM/nEEg=;
  b=XylsrbhUxgpE9cOnJfj9L0d5Y+P5lyCz9pzlyVpxnb0KP0570HSvc9oS
   dAQr9jUyZGzSVrZ1tbRQOww5nhO0BodxVv3o8uzuulZfxXq6bhrh4VS0M
   yQDomOkHijwiWGQ2pN0rrY9grmHWuimCn53tddcIjC0Daz/dZZKbkYfiJ
   6ke0OKAcmKteH/NkzPIDnbhRQNxU2Slh4LOnuZkf6O5Os3/HgojW26lUu
   uFaUftwOZgR9jsCU/WY5sNUn6OnQCJb7z/aSJVid8ooCI5DGgW8Lf4tPs
   4vKfwftTRKW2Gl6WPYbpajEMMfB+r3r0wQsf3mEZxIfPcUMSNVav6BXrM
   Q==;
X-CSE-ConnectionGUID: 1MusgNiGQo2DLMlVXOeMJg==
X-CSE-MsgGUID: fTHH9N5zQIGHi2ZPt8TySw==
X-IPAS-Result: =?us-ascii?q?A0BIAgC9prpq/5P/Ja1aglmCV3VgQ0mWSgOeGoF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOCQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBNoI+AxHCRYF5M4EBg?=
 =?us-ascii?q?ykBPwJDUNsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYE7gi6BBYFcAQGBJxGGb?=
 =?us-ascii?q?QSCIoEMgVoekyVIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghkjGTZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVBChJHJiIIE?=
 =?us-ascii?q?gkBExowC4EhOEEJKBEYDUgRLDcVGQQ+bgeQLh6BcnMBgQ0BKxdoEjwrHDQCp?=
 =?us-ascii?q?VihDwoog3aMIpU6GjOEBIFXkkCSVAuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD?=
 =?us-ascii?q?44rDguDYIF/yjonMgIJMgEBBwIHDgMLgWiQAAEngVYBAQ?=
IronPort-Data: A9a23:ETgZUKM0UAt+9kLvrR32lsFynXyQoLVcMsEvi/4bfWQNrUor1mcEm
 zBMUDyHaPuCamOhLd5yaIm2oExQvMeAmodqS3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgf0gW4sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66xLEVo5G4w3w+EtLUVr8
 cIoDz0oTB/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzM3wsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsiuCxaoCLIYDiqcN9kHq4h
 jPgonbAIz46NYat8SbVzmOXmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EC/1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:NkNJJqrOrhbeHKLNtXl2yrsaV5oJeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: 9a23:wWv7428ulfrOd3QxG/yVvxcxB9sqVHzy9XCKD2udDVhZb7Cwa1DFrQ==
X-Talos-MUID: 9a23:HcZnoQVYJdUfbI/q/DHQpBEzEpp62oWBKEFXo60a6/WVDjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="520422634"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id E72BB18000276;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 48A5DCBEFAB; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 08/13] python3-aiohttp: fix CVE-2026-54274
Date: Mon, 28 Sep 2026 10:43:18 -0700
Message-Id: <20260928174323.1810308-9-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130456

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1]. The
advisory identifying the fix is referenced in [2].

[1] https://github.com/aio-libs/aiohttp/commit/14b6ee851fb16ec199acb950de0c82d476799e7d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-54274

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54274.patch      | 195 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 196 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch
new file mode 100644
index 0000000000..c5566f75d6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch
@@ -0,0 +1,195 @@
+From 23b4506906b28c91439bce6d5cbce2b9989ffe61 Mon Sep 17 00:00:00 2001
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
+Backport Changes:
+- Adapt the fix from aiohttp/_websocket/reader_py.py in aiohttp 3.14
+  to aiohttp/http_websocket.py in 3.9.5, mapping OP_CODE_* to
+  WSMsgType.* and _payload_bytes_to_read to _payload_length.
+- Preserve the older parser's two partial-message size-check removals,
+  accounting for the additional deletion relative to upstream.
+- Omit WebSocketDataQueue annotations because that type is not imported
+  by the 3.9.5 websocket parser test module.
+
+Co-authored-by: Sam Bull <git@sambull.org>
+(cherry picked from commit 14b6ee851fb16ec199acb950de0c82d476799e7d)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12817.bugfix.rst       |  1 +
+ aiohttp/http_websocket.py      | 43 ++++++++++++++-------
+ tests/test_websocket_parser.py | 68 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 98 insertions(+), 14 deletions(-)
+ create mode 100644 CHANGES/12817.bugfix.rst
+
+diff --git a/CHANGES/12817.bugfix.rst b/CHANGES/12817.bugfix.rst
+new file mode 100644
+index 000000000..c8a35e309
+--- /dev/null
++++ b/CHANGES/12817.bugfix.rst
+@@ -0,0 +1 @@
++Tightened up some websocket parser checks -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/http_websocket.py b/aiohttp/http_websocket.py
+index 39f2e4a5c..6d95f386d 100644
+--- a/aiohttp/http_websocket.py
++++ b/aiohttp/http_websocket.py
+@@ -370,13 +370,6 @@ class WebSocketReader:
+                     if opcode != WSMsgType.CONTINUATION:
+                         self._opcode = opcode
+                     self._partial.extend(payload)
+-                    if self._max_msg_size and len(self._partial) >= self._max_msg_size:
+-                        raise WebSocketError(
+-                            WSCloseCode.MESSAGE_TOO_BIG,
+-                            "Message size {} exceeds limit {}".format(
+-                                len(self._partial), self._max_msg_size
+-                            ),
+-                        )
+                 else:
+                     # previous frame was non finished
+                     # we should get continuation opcode
+@@ -394,13 +387,6 @@ class WebSocketReader:
+                         self._opcode = None
+ 
+                     self._partial.extend(payload)
+-                    if self._max_msg_size and len(self._partial) >= self._max_msg_size:
+-                        raise WebSocketError(
+-                            WSCloseCode.MESSAGE_TOO_BIG,
+-                            "Message size {} exceeds limit {}".format(
+-                                len(self._partial), self._max_msg_size
+-                            ),
+-                        )
+ 
+                     # Decompress process must to be done after all packets
+                     # received.
+@@ -482,6 +468,19 @@ class WebSocketReader:
+                             "Received frame with non-zero reserved bits",
+                         )
+ 
++                    if opcode not in {
++                        WSMsgType.CONTINUATION,
++                        WSMsgType.TEXT,
++                        WSMsgType.BINARY,
++                        WSMsgType.CLOSE,
++                        WSMsgType.PING,
++                        WSMsgType.PONG,
++                    }:
++                        raise WebSocketError(
++                            WSCloseCode.PROTOCOL_ERROR,
++                            f"Unexpected opcode={opcode!r}",
++                        )
++
+                     if opcode > 0x7 and fin == 0:
+                         raise WebSocketError(
+                             WSCloseCode.PROTOCOL_ERROR,
+@@ -555,6 +554,22 @@ class WebSocketReader:
+                         else WSParserState.READ_PAYLOAD
+                     )
+ 
++                # Reject oversized data frames before buffering any payload
++                # bytes. Control frames are capped at 125 bytes (checked in
++                # READ_HEADER) so only text/binary/continuation need this.
++                if self._max_msg_size and self._frame_opcode in {
++                    WSMsgType.TEXT,
++                    WSMsgType.BINARY,
++                    WSMsgType.CONTINUATION,
++                }:
++                    projected_size = self._payload_length + len(self._partial)
++                    if projected_size >= self._max_msg_size:
++                        raise WebSocketError(
++                            WSCloseCode.MESSAGE_TOO_BIG,
++                            f"Message size {projected_size} "
++                            f"exceeds limit {self._max_msg_size}",
++                        )
++
+             # read payload mask
+             if self._state == WSParserState.READ_PAYLOAD_MASK:
+                 if buf_length - start_pos >= 4:
+diff --git a/tests/test_websocket_parser.py b/tests/test_websocket_parser.py
+index 3bdd8108e..b9efe9dcf 100644
+--- a/tests/test_websocket_parser.py
++++ b/tests/test_websocket_parser.py
+@@ -498,6 +498,74 @@ def test_compressed_msg_too_large(out) -> None:
+     assert ctx.value.code == WSCloseCode.MESSAGE_TOO_BIG
+ 
+ 
++@pytest.mark.parametrize("fin", (0x80, 0x00), ids=("fin", "non-fin"))
++def test_msg_too_large_at_header(out, fin: int) -> None:
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
++def test_msg_too_large_across_fragments(out) -> None:
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
++def test_msg_too_large_text_after_non_fin_text(out) -> None:
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
++    out, opcode: int
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
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 58ae583423..5710e38943 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-34525_p2.patch \
            file://CVE-2026-47265.patch \
            file://CVE-2026-50269.patch \
+           file://CVE-2026-54274.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


