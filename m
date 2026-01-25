Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2487DD715FF
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 00:36:39 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30904.1769301395604168640
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 16:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mwoFEEEB;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso24091795ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 16:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769301395; x=1769906195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CvieCJSMvjKx1hDbEBV5QcF1Hg4chsZJzt45PDrBkNg=;
        b=mwoFEEEBzaSCCw+ZNYitb7DM75q/IaJI544pbxHVbZGxIwg3GY4sFU+m0g8AMT6NGA
         DcqUWV9XE9CRaGYNW0MdsiT+WSQwhWwKWG37fR+p5UJgX8ermoZ5n9GbBHfKUbZmsGVi
         +ZevNZp8VLySrEnQbUVEGcQrcHne8MuJHk1d8lOWxug79cmKNq6bo5xdyaV5l0huO6+f
         2M15Oa1xgjaI58qDhMCfxxhAoeQMLXV7wTIEJig9HLxI9IWpVIpllYt/b5rv9DwG5Uqc
         BhuuQ/deo/Gdwq1CAaG3P29NVyQgeB30NTiX8wSb6mldIMriTKhDlaJ8midW9Bm3ejRe
         HBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769301395; x=1769906195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvieCJSMvjKx1hDbEBV5QcF1Hg4chsZJzt45PDrBkNg=;
        b=wuyKoUyTM1MaYUIcT8iiOc4BjYSI+D1rtFaIyElx9vLoZtJwHpEitlIM8qNha8ZhwS
         Ox39fmUtwlsifbV76RmCoqwQv5TaWcAGsrvZBEBrd4HglK8aGxyeIe0b9F+8NhQ03vVu
         3Sj4zZJeSutY4ldD+M00xmbyLbJqf7Ifdm6susrYw4rSMBBlh1n66CuFPmNaUV1qhfOX
         nDlAzQwcXWt33BaUhAg8TRI/VleogSk2el2upr7TyksBiJDDM+X8tujhoJlzhGLiE8wr
         MeBcbVzI/I4DVjqGyS4K9zpcNGamWm/xB5bv+k9CORN9LrDWI3HdmBzajXZrIi3lsPjY
         Yh6A==
X-Gm-Message-State: AOJu0YwzLQbutABSnmZjE2gNdVPQI1zxzs3U1GGra7DOYwHOhaSVYoSh
	saF25/bQOD3N8aQMZhHJ8ajbFSYtkkjUig/VZMdAlEGbeXHE1R4Sbuwg11Ik+puZ
X-Gm-Gg: AZuq6aLSo/raKkVxstfwna3jnMpmD+2k2xFT0tAqi8JUptjT2HarjuYFrpqBvfOcS1R
	bDxkDsvl84rK2NB1sbpf2mDajEHXCsPr86znAUgJLqEwMWmHkIqDL+ZDvxniEQa/LArF4KrT4T0
	1gSSg4tRIIAkS3K2lNwt9IMmyHUkGq38Zv7EfJRYMvHhKV+LIqlsgjC8phxdPJcG2AQAlrSg2zs
	sycEsml2FS679aoCaI3ykgYl0y6XuOtXYnq+QZM4Rl7kk1wXYS33IgbHUN58Y+JNh2t8h6ynEO3
	ReBrSDp/AfGr9cmov5iRkULX0jv0Y64ehk2jGUOYh7MIbX5M6gPLS/4UFBSeH1s16YZipxMIlmy
	1P2qWJ0P+INxm69biuZAVVDGRKYbez5Z9MyD5qdMrcTWcfEfgvGCaISMLfocES8rnyAalnac1wr
	OhGRc60w4PCOme+UfUBnWoPILZ
X-Received: by 2002:a17:902:ebcb:b0:2a0:8f6f:1a12 with SMTP id d9443c01a7336-2a845221ff2mr3726125ad.17.1769301394452;
        Sat, 24 Jan 2026 16:36:34 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcdb8csm54949635ad.31.2026.01.24.16.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 16:36:33 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 1/2] python3-aiohttp: patch CVE-2025-53643
Date: Sun, 25 Jan 2026 13:36:22 +1300
Message-ID: <20260125003623.394883-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 00:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123827

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53643

Dropped changes to the test and changelog from the original commit.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
changes in v2:
- Include the changes done to the original commit.
---
 .../python3-aiohttp/CVE-2025-53643.patch      | 192 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   4 +-
 2 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
new file mode 100644
index 0000000000..54d69fbe3f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
@@ -0,0 +1,192 @@
+From 2b45c0cc5f94a4aab25e80580db73c5da1152030 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 9 Jul 2025 19:55:22 +0100
+Subject: [PATCH] Add trailer parsing logic (#11269) (#11287)
+
+CVE: CVE-2025-53643
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/e8d774f635dc6d1cd3174d0e38891da5de0e2b6a]
+
+Dropped changes to the test and changelog from the original commit.
+
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

