Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFABE9D414
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:29:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24638.1770222572019427869
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 08:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3PLNqOU;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso8430325e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770222570; x=1770827370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEyvX+RX0DkJBR4yNvVoyJhxRTmtrCn9YFDsR694Elo=;
        b=e3PLNqOU2WJvEyemYukdgA+QO/rIdVyjkNAmk8AV9Vj/tOAJn/b4AAx7PwpT/bnmPG
         QFl5Cf3+DRmeVYifnolu0jmbEQ1qXRzVL5ARbc9X/2J2ZbuEgtFskEbbepcoEJxbT2HK
         GvsSQIMtz9anXTxUzX+Yl9PYQaX3rdTptJw0r/+f1EUbbcjkV4ZKY4JLJbRlLzXC1LEx
         hVnb5a3updszhq2qJ5FPJ/c2t5Aw9EvRf2+yOqCIcWRiAnsNO2qAhHyRqk8hVwE5XH3g
         2BdU460P9smMfE4nz01/ucZLbQ11/noeS8EIKpiagJKeYBZzfydyyJolbDUpM1XW//G2
         6mNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222570; x=1770827370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FEyvX+RX0DkJBR4yNvVoyJhxRTmtrCn9YFDsR694Elo=;
        b=QMMoUHZUdNfd7Uq3W+IFbcG3/g7n/lgluUsvu/mqOWUbDwoIsCsTsO0K0pe0DTuoSR
         L/UWq8GLbjC/I4WXb2SnEgUYTIAwGUzJKMK+thAKqACLh1UBue2UukoxCx2mvsiHVYox
         eCa2Fhk0KmyZfXAR0ypc5tMyiF+eP62xCP8F5HgvGQrhCgrQCfIjwu7qKLspBNWIQ3Ku
         TWClemXslK98Y7nuPlFfBdvz8GxFcIy1eiJnhOAf7qFd1QaKI1Y0Zkd6aKj55umlNYFx
         35e4ngwOiMrVFo9UMvp9BRqq9BHl8LexBvEUoVM5wqFuNRkTdxBbvPyqu0YBJm/ftvu2
         fNTQ==
X-Gm-Message-State: AOJu0Yz7DM80b6HCysNfkMne+QLzSMyJFFRDuapU5RULYjaOzwoO6hn/
	IG8fU1q61e0fQbY+UOm4tK6x16WB42LuIyrBdzSwhB3CxwNWzVS6Rk/zQl3emQ==
X-Gm-Gg: AZuq6aJCsvvFCyERlVB+rT1zYSjW1bbiOPlbepzJYzHci8JvLb4SFoD2MruPnUSnN4M
	lViLwt6Mp4SLCiMtvpILEBo7g7WqbCI17aUDJpNP6VO9iFC4GXYZ412VLFAGNsysKOGZtHM4mJ0
	afvl7aornEvYTxqb2LH5rWRbXKvc5o7MVdTlOL5txnx3LCs87UUHOGI0jEPpBE3GGmxq5pF9TL2
	OSXKoBVH4QoCV2uKwGxVaQIFk7P5oeqty9vxlDPbpTRZBbRJVlOY8l2MLbfUFV1GiALTauuRpEA
	JUDsn6iaJC4H4CYB6MR864DegOVz3Zw5/eFV6cn+drFSDWgwYdOTPFu5eGgpbm7hS1VekomIOWn
	xCWv3oqQkye2VJPs2HgibvLK5rklfKbfCzqyEoQ8/hotsQZ9uZ1R22+d+JxpprODyqJNT0yDF/t
	W3Bpz26sh7
X-Received: by 2002:a05:600c:5250:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-4830e925fdemr49092775e9.7.1770222569854;
        Wed, 04 Feb 2026 08:29:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec6fc89sm23293325e9.6.2026.02.04.08.29.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 6/7] python3-aiohttp: patch CVE-2025-69229
Date: Wed,  4 Feb 2026 17:29:21 +0100
Message-ID: <20260204162924.3042284-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204162924.3042284-1-skandigraun@gmail.com>
References: <20260204162924.3042284-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 16:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124141

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69229

Backport the patches referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-aiohttp/CVE-2025-69229-1.patch    | 111 ++++++++
 .../python3-aiohttp/CVE-2025-69229-2.patch    | 255 ++++++++++++++++++
 .../python/python3-aiohttp_3.12.15.bb         |   2 +
 3 files changed, 368 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229-2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229-1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229-1.patch
new file mode 100644
index 0000000000..70feb03258
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229-1.patch
@@ -0,0 +1,111 @@
+From 9e03b5732805f3cf3c5c249761e2fb8ace2223d3 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 3 Jan 2026 03:57:17 +0000
+Subject: [PATCH 1/2] Use collections.deque for chunk splits (#11892) (#11912)
+
+From: Sam Bull <git@sambull.org>
+
+(cherry picked from commit 271532ea355c65480c8ecc14137dfbb72aec8f6f)
+
+---------
+
+Co-authored-by: Finder <nakamurajames123@gmail.com>
+
+CVE: CVE-2025-69229
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/dc3170b56904bdf814228fae70a5501a42a6c712]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ aiohttp/streams.py        |  8 ++++----
+ tests/test_http_parser.py | 14 +++++++++-----
+ 2 files changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/aiohttp/streams.py b/aiohttp/streams.py
+index 7a3f64d..108257e 100644
+--- a/aiohttp/streams.py
++++ b/aiohttp/streams.py
+@@ -148,7 +148,7 @@ class StreamReader(AsyncStreamReaderMixin):
+         self._loop = loop
+         self._size = 0
+         self._cursor = 0
+-        self._http_chunk_splits: Optional[List[int]] = None
++        self._http_chunk_splits: Optional[Deque[int]] = None
+         self._buffer: Deque[bytes] = collections.deque()
+         self._buffer_offset = 0
+         self._eof = False
+@@ -295,7 +295,7 @@ class StreamReader(AsyncStreamReaderMixin):
+                 raise RuntimeError(
+                     "Called begin_http_chunk_receiving when some data was already fed"
+                 )
+-            self._http_chunk_splits = []
++            self._http_chunk_splits = collections.deque()
+ 
+     def end_http_chunk_receiving(self) -> None:
+         if self._http_chunk_splits is None:
+@@ -454,7 +454,7 @@ class StreamReader(AsyncStreamReaderMixin):
+                 raise self._exception
+ 
+             while self._http_chunk_splits:
+-                pos = self._http_chunk_splits.pop(0)
++                pos = self._http_chunk_splits.popleft()
+                 if pos == self._cursor:
+                     return (b"", True)
+                 if pos > self._cursor:
+@@ -527,7 +527,7 @@ class StreamReader(AsyncStreamReaderMixin):
+         chunk_splits = self._http_chunk_splits
+         # Prevent memory leak: drop useless chunk splits
+         while chunk_splits and chunk_splits[0] < self._cursor:
+-            chunk_splits.pop(0)
++            chunk_splits.popleft()
+ 
+         if self._size < self._low_water and self._protocol._reading_paused:
+             self._protocol.resume_reading()
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index d4c1768..b9d917f 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -1223,7 +1223,8 @@ def test_http_request_chunked_payload(parser) -> None:
+     parser.feed_data(b"4\r\ndata\r\n4\r\nline\r\n0\r\n\r\n")
+ 
+     assert b"dataline" == b"".join(d for d in payload._buffer)
+-    assert [4, 8] == payload._http_chunk_splits
++    assert payload._http_chunk_splits is not None
++    assert [4, 8] == list(payload._http_chunk_splits)
+     assert payload.is_eof()
+ 
+ 
+@@ -1238,7 +1239,8 @@ def test_http_request_chunked_payload_and_next_message(parser) -> None:
+     )
+ 
+     assert b"dataline" == b"".join(d for d in payload._buffer)
+-    assert [4, 8] == payload._http_chunk_splits
++    assert payload._http_chunk_splits is not None
++    assert [4, 8] == list(payload._http_chunk_splits)
+     assert payload.is_eof()
+ 
+     assert len(messages) == 1
+@@ -1262,12 +1264,13 @@ def test_http_request_chunked_payload_chunks(parser) -> None:
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
+@@ -1278,7 +1281,8 @@ def test_parse_chunked_payload_chunk_extension(parser) -> None:
+     parser.feed_data(b"4;test\r\ndata\r\n4\r\nline\r\n0\r\ntest: test\r\n\r\n")
+ 
+     assert b"dataline" == b"".join(d for d in payload._buffer)
+-    assert [4, 8] == payload._http_chunk_splits
++    assert payload._http_chunk_splits is not None
++    assert [4, 8] == list(payload._http_chunk_splits)
+     assert payload.is_eof()
+ 
+ 
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229-2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229-2.patch
new file mode 100644
index 0000000000..e67832f09e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229-2.patch
@@ -0,0 +1,255 @@
+From e124809ca5f17e608c09fc79423f9c357208a3c5 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 3 Jan 2026 15:23:14 +0000
+Subject: [PATCH 2/2] Limit number of chunks before pausing reading (#11894)
+ (#11916)
+
+From: Sam Bull <git@sambull.org>
+
+(cherry picked from commit 1e4120e87daec963c67f956111e6bca44d7c3dea)
+
+Co-authored-by: J. Nick Koston <nick@koston.org>
+
+CVE: CVE-2025-69229
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/4ed97a4e46eaf61bd0f05063245f613469700229]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ aiohttp/streams.py    |  25 ++++++-
+ tests/test_streams.py | 170 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 194 insertions(+), 1 deletion(-)
+
+diff --git a/aiohttp/streams.py b/aiohttp/streams.py
+index 108257e..9329534 100644
+--- a/aiohttp/streams.py
++++ b/aiohttp/streams.py
+@@ -116,6 +116,8 @@ class StreamReader(AsyncStreamReaderMixin):
+         "_protocol",
+         "_low_water",
+         "_high_water",
++        "_low_water_chunks",
++        "_high_water_chunks",
+         "_loop",
+         "_size",
+         "_cursor",
+@@ -145,6 +147,11 @@ class StreamReader(AsyncStreamReaderMixin):
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
+@@ -321,6 +328,15 @@ class StreamReader(AsyncStreamReaderMixin):
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
+@@ -529,7 +545,14 @@ class StreamReader(AsyncStreamReaderMixin):
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
+index 1b65f77..c5bc671 100644
+--- a/tests/test_streams.py
++++ b/tests/test_streams.py
+@@ -1552,3 +1552,173 @@ async def test_stream_reader_iter_chunks_chunked_encoding(protocol) -> None:
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
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
index 55ff57d05c..84dd369753 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
@@ -9,6 +9,8 @@ SRC_URI += "file://CVE-2025-69224.patch \
             file://CVE-2025-69226.patch \
             file://CVE-2025-69227.patch \
             file://CVE-2025-69228.patch \
+            file://CVE-2025-69229-1.patch \
+            file://CVE-2025-69229-2.patch \
 "
 SRC_URI[sha256sum] = "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
 

