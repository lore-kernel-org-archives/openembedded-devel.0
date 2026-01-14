Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A2AD2A018
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:15 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9346.1768395672842189354
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B9hA+MWP;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso2716957b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395672; x=1769000472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=790QPs9U1iHURTHzEPpF09g/NOTd/Ysws1CpkLnA30s=;
        b=B9hA+MWPKyPdoNqzj1hZIcqzimiAJbL/x/3/3SHr7GUYr+/FJCOzPlZWvVGuz1kEfb
         pbeti+y6WB3soqh7PjVV4ydKzZ2k7jBJ0Ujv8nJnb5YFgRwTcNv7zQJ1THF78+w3BRrd
         AcVpqjTPoflAUfcD5eueVEbS+sOFEXJTrzEZwI0PH18Hj5SJvBD8VVTqapg3hRnIzK0u
         UD54UFZVXUcUFv5leV+bKAeHVWwBvsAytvwnCuulFmSX+2DYTctQyd78IRS20jcxtppY
         vPWqAvbQK4l1lmCD9pfUfK/tUAlGlGecwA4isZ689H9ocnGAIin7iUrjrTLzjvBtg/K4
         HXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395672; x=1769000472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=790QPs9U1iHURTHzEPpF09g/NOTd/Ysws1CpkLnA30s=;
        b=GiZDd7+cEJIADznRiI2/rb4fu+4YCFGA3ByE49cIR1yFmrpbUTZ5NJydOGPQAPKzZB
         6ft6k4ZCZwAemgqH/PA/y++qNjaxggLggmSoIGJWwNN2+KyP4TgZWASeXBvTka+7oG9B
         mxufwiJ8yPCwgazLqo0qoBfxh8X4OuTfj37BP8dOvwwxumfLLVy52jcwacKaZGDZk72y
         lZJyqD7eyg6TxBSRgp+KnyYkwcm/opZNle0rf6jsJeTUfCi+c1kk7CtJ5Mg8d+J0aEGP
         jZLYVYE0jiAEzfTYDrHqDzl7+cKUuBglpSxfabRu+ISvxJUW6Pgxb3Jp7bG15Xw8DGNi
         UZwg==
X-Gm-Message-State: AOJu0YzO9PlkaIdb8lG9ed5P8i7lDT9lTh8ubXIEKXnYZuu9MhnFFWKo
	V6P5N+4C20k4BLcGCDDXfNg5Ec2Z4IL3WINSR6uXfNNPKPmnETGSKt9xvyOTeg==
X-Gm-Gg: AY/fxX5cXmUnqKDp2JutB6m3AJTK0ZXvtWAkNr91oxhMEFYqcl1wH/WFWsgCR/Q6n4Z
	KO4IIqyTbXSB6RO3+oOeLQ7mQk2SnZ+xry21ssDwqRemKGp4TyIbrWqhX1jV8kmc3GIyXv9QYIh
	Nvp9xGke6kWaTxo29bLcArOc899jhuvsy7jf7xWELIVnU7nePHvhd4hR+e4cLKXmi2+DMnrDYMR
	tdmdrrWg2/++4FYJk7sDT/urs9xhvDjwpZQJ7moJadWq8IFtQbAPBMie4OFEvLTG7ej2O74qcbM
	R5pEx0b9RSjpDyOhv5fcZvgaOX2SPqotq8pUY4nBfq37AJ302hJ0yZ6z9+7FBSvOXYYP4iguw10
	a/Eg2+w/+O4YopDwLERHmmWKOwN03WukxS/P/o2hHdqAIvNcB/Ne5fdzXNyRg1+hpolEJfESUS8
	I8hOrXaVLsvgwi1V5o5IfOFik=
X-Received: by 2002:a05:6a00:440c:b0:81e:cbb0:db14 with SMTP id d2e1a72fcca58-81f81d2c44amr2306022b3a.21.1768395671499;
        Wed, 14 Jan 2026 05:01:11 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 03/20] python3-aiohttp: patch CVE-2025-53643
Date: Thu, 15 Jan 2026 02:00:40 +1300
Message-ID: <20260114130100.1016416-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123456

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53643

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-aiohttp/CVE-2025-53643.patch      | 189 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   4 +-
 2 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
new file mode 100644
index 0000000000..99ed1ca395
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
@@ -0,0 +1,189 @@
+From 2b45c0cc5f94a4aab25e80580db73c5da1152030 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 9 Jul 2025 19:55:22 +0100
+Subject: [PATCH] Add trailer parsing logic (#11269) (#11287)
+
+CVE: CVE-2025-53643
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/e8d774f635dc6d1cd3174d0e38891da5de0e2b6a]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ aiohttp/http_parser.py | 70 ++++++++++++++++++++++--------------------
+ aiohttp/multipart.py   |  2 +-
+ 2 files changed, 38 insertions(+), 34 deletions(-)
+
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 7a552458e..0a80c5c6d 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -142,8 +142,8 @@ class HeadersParser:
+         # note: "raw" does not mean inclusion of OWS before/after the field value
+         raw_headers = []
+ 
+-        lines_idx = 1
+-        line = lines[1]
++        lines_idx = 0
++        line = lines[lines_idx]
+         line_count = len(lines)
+ 
+         while line:
+@@ -397,6 +397,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                                 response_with_body=self.response_with_body,
+                                 auto_decompress=self._auto_decompress,
+                                 lax=self.lax,
++                                headers_parser=self._headers_parser,
+                             )
+                             if not payload_parser.done:
+                                 self._payload_parser = payload_parser
+@@ -416,6 +417,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                                 readall=True,
+                                 auto_decompress=self._auto_decompress,
+                                 lax=self.lax,
++                                headers_parser=self._headers_parser,
+                             )
+                         elif not empty_body and length is None and self.read_until_eof:
+                             payload = StreamReader(
+@@ -435,6 +437,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                                 response_with_body=self.response_with_body,
+                                 auto_decompress=self._auto_decompress,
+                                 lax=self.lax,
++                                headers_parser=self._headers_parser,
+                             )
+                             if not payload_parser.done:
+                                 self._payload_parser = payload_parser
+@@ -471,6 +474,10 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+ 
+                     eof = True
+                     data = b""
++                    if isinstance(
++                        underlying_exc, (InvalidHeader, TransferEncodingError)
++                    ):
++                        raise
+ 
+                 if eof:
+                     start_pos = 0
+@@ -635,7 +642,7 @@ class HttpRequestParser(HttpParser[RawRequestMessage]):
+             compression,
+             upgrade,
+             chunked,
+-        ) = self.parse_headers(lines)
++        ) = self.parse_headers(lines[1:])
+ 
+         if close is None:  # then the headers weren't set in the request
+             if version_o <= HttpVersion10:  # HTTP 1.0 must asks to not close
+@@ -715,7 +722,7 @@ class HttpResponseParser(HttpParser[RawResponseMessage]):
+             compression,
+             upgrade,
+             chunked,
+-        ) = self.parse_headers(lines)
++        ) = self.parse_headers(lines[1:])
+ 
+         if close is None:
+             if version_o <= HttpVersion10:
+@@ -755,6 +762,8 @@ class HttpPayloadParser:
+         response_with_body: bool = True,
+         auto_decompress: bool = True,
+         lax: bool = False,
++        *,
++        headers_parser: HeadersParser,
+     ) -> None:
+         self._length = 0
+         self._type = ParseState.PARSE_NONE
+@@ -763,6 +772,8 @@ class HttpPayloadParser:
+         self._chunk_tail = b""
+         self._auto_decompress = auto_decompress
+         self._lax = lax
++        self._headers_parser = headers_parser
++        self._trailer_lines: list[bytes] = []
+         self.done = False
+ 
+         # payload decompression wrapper
+@@ -850,7 +861,7 @@ class HttpPayloadParser:
+                             size_b = chunk[:i]  # strip chunk-extensions
+                             # Verify no LF in the chunk-extension
+                             if b"\n" in (ext := chunk[i:pos]):
+-                                exc = BadHttpMessage(
++                                exc = TransferEncodingError(
+                                     f"Unexpected LF in chunk-extension: {ext!r}"
+                                 )
+                                 set_exception(self.payload, exc)
+@@ -871,7 +882,7 @@ class HttpPayloadParser:
+ 
+                         chunk = chunk[pos + len(SEP) :]
+                         if size == 0:  # eof marker
+-                            self._chunk = ChunkState.PARSE_MAYBE_TRAILERS
++                            self._chunk = ChunkState.PARSE_TRAILERS
+                             if self._lax and chunk.startswith(b"\r"):
+                                 chunk = chunk[1:]
+                         else:
+@@ -909,38 +920,31 @@ class HttpPayloadParser:
+                         self._chunk_tail = chunk
+                         return False, b""
+ 
+-                # if stream does not contain trailer, after 0\r\n
+-                # we should get another \r\n otherwise
+-                # trailers needs to be skipped until \r\n\r\n
+-                if self._chunk == ChunkState.PARSE_MAYBE_TRAILERS:
+-                    head = chunk[: len(SEP)]
+-                    if head == SEP:
+-                        # end of stream
+-                        self.payload.feed_eof()
+-                        return True, chunk[len(SEP) :]
+-                    # Both CR and LF, or only LF may not be received yet. It is
+-                    # expected that CRLF or LF will be shown at the very first
+-                    # byte next time, otherwise trailers should come. The last
+-                    # CRLF which marks the end of response might not be
+-                    # contained in the same TCP segment which delivered the
+-                    # size indicator.
+-                    if not head:
+-                        return False, b""
+-                    if head == SEP[:1]:
+-                        self._chunk_tail = head
+-                        return False, b""
+-                    self._chunk = ChunkState.PARSE_TRAILERS
+-
+-                # read and discard trailer up to the CRLF terminator
+                 if self._chunk == ChunkState.PARSE_TRAILERS:
+                     pos = chunk.find(SEP)
+-                    if pos >= 0:
+-                        chunk = chunk[pos + len(SEP) :]
+-                        self._chunk = ChunkState.PARSE_MAYBE_TRAILERS
+-                    else:
++                    if pos < 0:  # No line found
+                         self._chunk_tail = chunk
+                         return False, b""
+ 
++                    line = chunk[:pos]
++                    chunk = chunk[pos + len(SEP) :]
++                    if SEP == b"\n":  # For lax response parsing
++                        line = line.rstrip(b"\r")
++                    self._trailer_lines.append(line)
++
++                    # \r\n\r\n found, end of stream
++                    if self._trailer_lines[-1] == b"":
++                        # Headers and trailers are defined the same way,
++                        # so we reuse the HeadersParser here.
++                        try:
++                            trailers, raw_trailers = self._headers_parser.parse_headers(
++                                self._trailer_lines
++                            )
++                        finally:
++                            self._trailer_lines.clear()
++                        self.payload.feed_eof()
++                        return True, chunk
++
+         # Read all bytes until eof
+         elif self._type == ParseState.PARSE_UNTIL_EOF:
+             self.payload.feed_data(chunk, len(chunk))
+diff --git a/aiohttp/multipart.py b/aiohttp/multipart.py
+index 71fc2654a..520ee539e 100644
+--- a/aiohttp/multipart.py
++++ b/aiohttp/multipart.py
+@@ -723,7 +723,7 @@ class MultipartReader:
+             raise ValueError(f"Invalid boundary {chunk!r}, expected {self._boundary!r}")
+ 
+     async def _read_headers(self) -> "CIMultiDictProxy[str]":
+-        lines = [b""]
++        lines = []
+         while True:
+             chunk = await self._content.readline()
+             chunk = chunk.strip()
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index ea117576bc..d3782f2d48 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
 SRC_URI[sha256sum] = "edea7d15772ceeb29db4aff55e482d4bcfb6ae160ce144f2682de02f6d693551"
 
-SRC_URI += "file://CVE-2024-52304.patch"
+SRC_URI += "file://CVE-2024-52304.patch \
+            file://CVE-2025-53643.patch \
+"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi

