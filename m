Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA6FC624C9
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 04:57:51 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22958.1788152269429499428
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 21:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gcQHYdZx;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15818; q=dns/txt;
  s=iport01; t=1788152269; x=1789361869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7GFiNmy6LGnB0nWc7KXsar3NRs8VKjyVJwkueT62OeI=;
  b=gcQHYdZxDQaMHW80haywSzHFExvnTVRaE6JDIOIJOzWC2rXfHJ5QWhPy
   XAblPaVKWb2Vpv1hyij5wQl+PLZ/FtfQ81Mfpa4MxG0l0kFdzF7/5CxXR
   S3A04FxW37ZxESb7xGGbAVMpKLbc+Mb1LflSTxpjmBGIng9Wpx6jr4rEb
   X6/Gq3OZ0ZmrhfsQcS1Pb+9GVFGjBohaLKwp/fDqyEEywok9b0xZ3IfH4
   OzyalcX5/exivLDI3X2LIxtlsKL4XP2wI1ecRZN3q2SB0XTrFpCUE1xu6
   5hbytykPyxp8dMsLjQy4ew4hVYxOZQhArScugei3OIzdFLzqjnzCk+N7F
   A==;
X-CSE-ConnectionGUID: msKgOcuZS7+EGfKuIEPm4A==
X-CSE-MsgGUID: g0HuDPdBSLOV0pOlWoi90A==
X-IPAS-Result: =?us-ascii?q?A0DNAgCvCJVq/5UQJK1aglmCGD90XkNJlkoDi2SSN4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKNcwImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGFQEHMg2GWgECAQMnCwEYAS0QHAMBAi8gCyMIGYIqWAGCOgM3A?=
 =?us-ascii?q?xHCA4F5M4EBgygBPwJDUNhLDYJYAQsUAYE4hT+CfwSBEIQPXRgBhHwnGxuBc?=
 =?us-ascii?q?oR+gQWBGkIBAYEnBguGbQSCInoSgVqBF4hIiEBIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohA8jGTZ6gQlegSspYAESF4EJgggCglqCB?=
 =?us-ascii?q?QIBSUMOB0dTCQQLGA1IESw3FRkEPm4HjnofgVhTID03GgEqASJjPkEQUhGlK?=
 =?us-ascii?q?6AecQoog3aMIo8+hXwaM4QEgVeSQJJRC5h9jgqECZFXcIRpgWoCOIFHCwdwF?=
 =?us-ascii?q?TuCZwlKGQ+DN4oOZQ4Lg2CBf4NlxlUnMgIJMgEBBwIHDgMLgWiQAAEngVYBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:b+O+VKlfdG5Oq1W25bFWYgjo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKXmHQafaIZWWnLtF0PI22/UMEvJPUyoBlTVNqrChnHltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsPrb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYgD2elQCnx8z
 qNbBR8DTQ2iqtqznJvuH4GAhux7RCXqFIobvnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEeUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIqJI4faGpkExy50o
 ErJp0TkLikWHue77gTd6lWouejOzHvSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:3BAzI6D+kgQQHzLlHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:3VsKH2PJsyJ/0O5DXTJE+2kfB/IeLT7w43nzPm6VMWM1YejA
X-Talos-MUID: =?us-ascii?q?9a23=3Aj5EG0Qwr4br+l6m4hegqstkUhvmaqKv2KF0hqZk?=
 =?us-ascii?q?sgO2jC3RoHDOiizXmGqZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="841387491"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 04:57:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 37E2818000159;
	Mon, 31 Aug 2026 04:57:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id CF22BCD02BA; Sun, 30 Aug 2026 21:57:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 3/9] python3-aiohttp: fix CVE-2025-69229
Date: Sun, 30 Aug 2026 21:57:38 -0700
Message-Id: <20260831045744.3321483-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260831045744.3321483-1-dkelaiya@cisco.com>
References: <20260831045744.3321483-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 04:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129603

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix commits shown in
[1], [2], [3], and [4].
The advisory identifying the fix is referenced in [5].

[1] https://github.com/aio-libs/aiohttp/commit/dc3170b56904bdf814228fae70a5501a42a6c712
[2] https://github.com/aio-libs/aiohttp/commit/271532ea355c65480c8ecc14137dfbb72aec8f6f
[3] https://github.com/aio-libs/aiohttp/commit/4ed97a4e46eaf61bd0f05063245f613469700229
[4] https://github.com/aio-libs/aiohttp/commit/1e4120e87daec963c67f956111e6bca44d7c3dea
[5] https://nvd.nist.gov/vuln/detail/CVE-2025-69229

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2025-69229_p1.patch   | 113 ++++++++
 .../python3-aiohttp/CVE-2025-69229_p2.patch   | 256 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   2 +
 3 files changed, 371 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p1.patch
new file mode 100644
index 0000000000..363b0c442e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p1.patch
@@ -0,0 +1,113 @@
+From cf6672ba61da0d4e52483ade0b06dea11cf4be55 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 3 Jan 2026 03:57:17 +0000
+Subject: [PATCH] Use collections.deque for chunk splits (#11892) (#11912)
+
+CVE: CVE-2025-69229
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/dc3170b56904bdf814228fae70a5501a42a6c712]
+
+(cherry picked from commit 271532ea355c65480c8ecc14137dfbb72aec8f6f)
+
+---------
+
+Co-authored-by: Finder <nakamurajames123@gmail.com>
+(cherry picked from commit dc3170b56904bdf814228fae70a5501a42a6c712)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/streams.py        |  8 ++++----
+ tests/test_http_parser.py | 14 +++++++++-----
+ 2 files changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/aiohttp/streams.py b/aiohttp/streams.py
+index b9b9c3fd9..eb652ff45 100644
+--- a/aiohttp/streams.py
++++ b/aiohttp/streams.py
+@@ -122,7 +122,7 @@ class StreamReader(AsyncStreamReaderMixin):
+         self._loop = loop
+         self._size = 0
+         self._cursor = 0
+-        self._http_chunk_splits: Optional[List[int]] = None
++        self._http_chunk_splits: Optional[Deque[int]] = None
+         self._buffer: Deque[bytes] = collections.deque()
+         self._buffer_offset = 0
+         self._eof = False
+@@ -263,7 +263,7 @@ class StreamReader(AsyncStreamReaderMixin):
+                 raise RuntimeError(
+                     "Called begin_http_chunk_receiving when" "some data was already fed"
+                 )
+-            self._http_chunk_splits = []
++            self._http_chunk_splits = collections.deque()
+ 
+     def end_http_chunk_receiving(self) -> None:
+         if self._http_chunk_splits is None:
+@@ -419,7 +419,7 @@ class StreamReader(AsyncStreamReaderMixin):
+                 raise self._exception
+ 
+             while self._http_chunk_splits:
+-                pos = self._http_chunk_splits.pop(0)
++                pos = self._http_chunk_splits.popleft()
+                 if pos == self._cursor:
+                     return (b"", True)
+                 if pos > self._cursor:
+@@ -491,7 +491,7 @@ class StreamReader(AsyncStreamReaderMixin):
+         chunk_splits = self._http_chunk_splits
+         # Prevent memory leak: drop useless chunk splits
+         while chunk_splits and chunk_splits[0] < self._cursor:
+-            chunk_splits.pop(0)
++            chunk_splits.popleft()
+ 
+         if self._size < self._low_water and self._protocol._reading_paused:
+             self._protocol.resume_reading()
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 0a868f286..62830c2bd 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -1188,7 +1188,8 @@ def test_http_request_chunked_payload(parser) -> None:
+     parser.feed_data(b"4\r\ndata\r\n4\r\nline\r\n0\r\n\r\n")
+ 
+     assert b"dataline" == b"".join(d for d in payload._buffer)
+-    assert [4, 8] == payload._http_chunk_splits
++    assert payload._http_chunk_splits is not None
++    assert [4, 8] == list(payload._http_chunk_splits)
+     assert payload.is_eof()
+ 
+ 
+@@ -1203,7 +1204,8 @@ def test_http_request_chunked_payload_and_next_message(parser) -> None:
+     )
+ 
+     assert b"dataline" == b"".join(d for d in payload._buffer)
+-    assert [4, 8] == payload._http_chunk_splits
++    assert payload._http_chunk_splits is not None
++    assert [4, 8] == list(payload._http_chunk_splits)
+     assert payload.is_eof()
+ 
+     assert len(messages) == 1
+@@ -1227,12 +1229,13 @@ def test_http_request_chunked_payload_chunks(parser) -> None:
+     parser.feed_data(b"test: test\r\n")
+ 
+     assert b"dataline" == b"".join(d for d in payload._buffer)
+-    assert [4, 8] == payload._http_chunk_splits
++    assert payload._http_chunk_splits is not None
++    assert [4, 8] == list(payload._http_chunk_splits)
+     assert not payload.is_eof()
+ 
+     parser.feed_data(b"\r\n")
+     assert b"dataline" == b"".join(d for d in payload._buffer)
+-    assert [4, 8] == payload._http_chunk_splits
++    assert [4, 8] == list(payload._http_chunk_splits)
+     assert payload.is_eof()
+ 
+ 
+@@ -1243,7 +1246,8 @@ def test_parse_chunked_payload_chunk_extension(parser) -> None:
+     parser.feed_data(b"4;test\r\ndata\r\n4\r\nline\r\n0\r\ntest: test\r\n\r\n")
+ 
+     assert b"dataline" == b"".join(d for d in payload._buffer)
+-    assert [4, 8] == payload._http_chunk_splits
++    assert payload._http_chunk_splits is not None
++    assert [4, 8] == list(payload._http_chunk_splits)
+     assert payload.is_eof()
+ 
+ 
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p2.patch
new file mode 100644
index 0000000000..48c5695c6d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p2.patch
@@ -0,0 +1,256 @@
+From 3f47a9e32de41ca21d63510eec253f6e5aed55f2 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 3 Jan 2026 15:23:14 +0000
+Subject: [PATCH] Limit number of chunks before pausing reading (#11894)
+ (#11916)
+
+CVE: CVE-2025-69229
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/4ed97a4e46eaf61bd0f05063245f613469700229]
+
+Backport Changes:
+- Omitted the entire `StreamReader.__slots__` block because
+  aiohttp 3.9.5 does not use `__slots__` and allows instance
+  attributes through its normal instance dictionary.
+  The new `_high_water_chunks` and `_low_water_chunks`
+  attributes are initialized directly in `__init__`, so no
+  slots declaration is required.
+
+(cherry picked from commit 1e4120e87daec963c67f956111e6bca44d7c3dea)
+
+Co-authored-by: J. Nick Koston <nick@koston.org>
+(cherry picked from commit 4ed97a4e46eaf61bd0f05063245f613469700229)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/streams.py    |  23 +++++-
+ tests/test_streams.py | 170 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 192 insertions(+), 1 deletion(-)
+
+diff --git a/aiohttp/streams.py b/aiohttp/streams.py
+index eb652ff45..121528842 100644
+--- a/aiohttp/streams.py
++++ b/aiohttp/streams.py
+@@ -119,6 +119,11 @@ class StreamReader(AsyncStreamReaderMixin):
+         self._high_water = limit * 2
+         if loop is None:
+             loop = asyncio.get_event_loop()
++        # Ensure high_water_chunks >= 3 so it's always > low_water_chunks.
++        self._high_water_chunks = max(3, limit // 4)
++        # Use max(2, ...) because there's always at least 1 chunk split remaining
++        # (the current position), so we need low_water >= 2 to allow resume.
++        self._low_water_chunks = max(2, self._high_water_chunks // 2)
+         self._loop = loop
+         self._size = 0
+         self._cursor = 0
+@@ -289,6 +294,15 @@ class StreamReader(AsyncStreamReaderMixin):
+ 
+         self._http_chunk_splits.append(self.total_bytes)
+ 
++        # If we get too many small chunks before self._high_water is reached, then any
++        # .read() call becomes computationally expensive, and could block the event loop
++        # for too long, hence an additional self._high_water_chunks here.
++        if (
++            len(self._http_chunk_splits) > self._high_water_chunks
++            and not self._protocol._reading_paused
++        ):
++            self._protocol.pause_reading()
++
+         # wake up readchunk when end of http chunk received
+         waiter = self._waiter
+         if waiter is not None:
+@@ -493,7 +507,14 @@ class StreamReader(AsyncStreamReaderMixin):
+         while chunk_splits and chunk_splits[0] < self._cursor:
+             chunk_splits.popleft()
+ 
+-        if self._size < self._low_water and self._protocol._reading_paused:
++        if (
++            self._protocol._reading_paused
++            and self._size < self._low_water
++            and (
++                self._http_chunk_splits is None
++                or len(self._http_chunk_splits) < self._low_water_chunks
++            )
++        ):
+             self._protocol.resume_reading()
+         return data
+ 
+diff --git a/tests/test_streams.py b/tests/test_streams.py
+index 115371c80..ed65b567a 100644
+--- a/tests/test_streams.py
++++ b/tests/test_streams.py
+@@ -1550,3 +1550,173 @@ async def test_stream_reader_iter_chunks_chunked_encoding(protocol) -> None:
+ 
+ def test_isinstance_check() -> None:
+     assert isinstance(streams.EMPTY_PAYLOAD, streams.StreamReader)
++
++
++async def test_stream_reader_pause_on_high_water_chunks(
++    protocol: mock.Mock,
++) -> None:
++    """Test that reading is paused when chunk count exceeds high water mark."""
++    loop = asyncio.get_event_loop()
++    # Use small limit so high_water_chunks is small: limit // 4 = 10
++    stream = streams.StreamReader(protocol, limit=40, loop=loop)
++
++    assert stream._high_water_chunks == 10
++    assert stream._low_water_chunks == 5
++
++    # Feed chunks until we exceed high_water_chunks
++    for i in range(12):
++        stream.begin_http_chunk_receiving()
++        stream.feed_data(b"x")  # 1 byte per chunk
++        stream.end_http_chunk_receiving()
++
++    # pause_reading should have been called when chunk count exceeded 10
++    protocol.pause_reading.assert_called()
++
++
++async def test_stream_reader_resume_on_low_water_chunks(
++    protocol: mock.Mock,
++) -> None:
++    """Test that reading resumes when chunk count drops below low water mark."""
++    loop = asyncio.get_event_loop()
++    # Use small limit so high_water_chunks is small: limit // 4 = 10
++    stream = streams.StreamReader(protocol, limit=40, loop=loop)
++
++    assert stream._high_water_chunks == 10
++    assert stream._low_water_chunks == 5
++
++    # Feed chunks until we exceed high_water_chunks
++    for i in range(12):
++        stream.begin_http_chunk_receiving()
++        stream.feed_data(b"x")  # 1 byte per chunk
++        stream.end_http_chunk_receiving()
++
++    # Simulate that reading was paused
++    protocol._reading_paused = True
++    protocol.pause_reading.reset_mock()
++
++    # Read data to reduce both size and chunk count
++    # Reading will consume chunks and reduce _http_chunk_splits
++    data = await stream.read(10)
++    assert data == b"xxxxxxxxxx"
++
++    # resume_reading should have been called when both size and chunk count
++    # dropped below their respective low water marks
++    protocol.resume_reading.assert_called()
++
++
++async def test_stream_reader_no_resume_when_chunks_still_high(
++    protocol: mock.Mock,
++) -> None:
++    """Test that reading doesn't resume if chunk count is still above low water."""
++    loop = asyncio.get_event_loop()
++    # Use small limit so high_water_chunks is small: limit // 4 = 10
++    stream = streams.StreamReader(protocol, limit=40, loop=loop)
++
++    # Feed many chunks
++    for i in range(12):
++        stream.begin_http_chunk_receiving()
++        stream.feed_data(b"x")
++        stream.end_http_chunk_receiving()
++
++    # Simulate that reading was paused
++    protocol._reading_paused = True
++
++    # Read only a few bytes - chunk count will still be high
++    data = await stream.read(2)
++    assert data == b"xx"
++
++    # resume_reading should NOT be called because chunk count is still >= low_water_chunks
++    protocol.resume_reading.assert_not_called()
++
++
++async def test_stream_reader_read_non_chunked_response(
++    protocol: mock.Mock,
++) -> None:
++    """Test that non-chunked responses work correctly (no chunk tracking)."""
++    loop = asyncio.get_event_loop()
++    stream = streams.StreamReader(protocol, limit=40, loop=loop)
++
++    # Non-chunked: just feed data without begin/end_http_chunk_receiving
++    stream.feed_data(b"Hello World")
++
++    # _http_chunk_splits should be None for non-chunked responses
++    assert stream._http_chunk_splits is None
++
++    # Reading should work without issues
++    data = await stream.read(5)
++    assert data == b"Hello"
++
++    data = await stream.read(6)
++    assert data == b" World"
++
++
++async def test_stream_reader_resume_non_chunked_when_paused(
++    protocol: mock.Mock,
++) -> None:
++    """Test that resume works for non-chunked responses when paused due to size."""
++    loop = asyncio.get_event_loop()
++    # Small limit so we can trigger pause via size
++    stream = streams.StreamReader(protocol, limit=10, loop=loop)
++
++    # Feed data that exceeds high_water (limit * 2 = 20)
++    stream.feed_data(b"x" * 25)
++
++    # Simulate that reading was paused due to size
++    protocol._reading_paused = True
++    protocol.pause_reading.assert_called()
++
++    # Read enough to drop below low_water (limit = 10)
++    data = await stream.read(20)
++    assert data == b"x" * 20
++
++    # resume_reading should be called (size is now 5 < low_water 10)
++    protocol.resume_reading.assert_called()
++
++
++@pytest.mark.parametrize("limit", [1, 2, 4])
++async def test_stream_reader_small_limit_resumes_reading(
++    protocol: mock.Mock,
++    limit: int,
++) -> None:
++    """Test that small limits still allow resume_reading to be called.
++
++    Even with very small limits, high_water_chunks should be at least 3
++    and low_water_chunks should be at least 2, with high > low to ensure
++    proper flow control.
++    """
++    loop = asyncio.get_event_loop()
++    stream = streams.StreamReader(protocol, limit=limit, loop=loop)
++
++    # Verify minimum thresholds are enforced and high > low
++    assert stream._high_water_chunks >= 3
++    assert stream._low_water_chunks >= 2
++    assert stream._high_water_chunks > stream._low_water_chunks
++
++    # Set up pause/resume side effects
++    def pause_reading() -> None:
++        protocol._reading_paused = True
++
++    protocol.pause_reading.side_effect = pause_reading
++
++    def resume_reading() -> None:
++        protocol._reading_paused = False
++
++    protocol.resume_reading.side_effect = resume_reading
++
++    # Feed 4 chunks (triggers pause at > high_water_chunks which is >= 3)
++    for char in b"abcd":
++        stream.begin_http_chunk_receiving()
++        stream.feed_data(bytes([char]))
++        stream.end_http_chunk_receiving()
++
++    # Reading should now be paused
++    assert protocol._reading_paused is True
++    assert protocol.pause_reading.called
++
++    # Read all data - should resume (chunk count drops below low_water_chunks)
++    data = stream.read_nowait()
++    assert data == b"abcd"
++    assert stream._size == 0
++
++    protocol.resume_reading.assert_called()
++    assert protocol._reading_paused is False
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 765796b8cd..69cad8cb44 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -12,6 +12,8 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2025-69225.patch \
            file://CVE-2025-69226.patch \
            file://CVE-2025-69228.patch \
+           file://CVE-2025-69229_p1.patch \
+           file://CVE-2025-69229_p2.patch \
            file://CVE-2025-69227.patch \
            "
 
-- 
2.35.6


