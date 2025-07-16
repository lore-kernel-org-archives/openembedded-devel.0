Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748C5C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 07:38:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16285.1752651481509258299
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 00:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9292c8cf09=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G7SilC2142796
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 00:38:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0skyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 00:38:00 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 16 Jul 2025 00:38:00 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 16 Jul 2025 00:37:59 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [kirkstone][meta-python][PATCH] python3-aiohttp: fix CVE-2025-53643 and drop CVE-2024-42367 patch
Date: Wed, 16 Jul 2025 15:37:58 +0800
Message-ID: <20250716073758.3031818-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: X-xj0sjlLGohm0_irW2NdDHgJ5aCVt0V
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=687756d8 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=VlckX9PKAAAA:8 a=0lhnMm1FAAAA:8 a=IjlBHzCGA2x03h5M30sA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ZmiM9RdZ4sPD_HvZpKn1:22 a=9CHbX8HeWodPCPcMgNm7:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX+N10kXLPncSi
 LSanMQmTXisI1uhRR8lgsY/rJJK3D9JN2E1/pyi+xmkzs410XuSYfz1UsjmNc76K1xMl1k8F8mT
 PRAXkyTAr7QRZWXbDz7QQ4LKfZBpfuiST+WwV404imc0h9mMOVZbZJUI+J5L0UE4WHI1DsEI7+5
 bL/tY33kcDcKg7gJPXeOLONOpy3GQnVG8pNnnwNfOKa0CG+0lSq89yGmVyHwIiLAY5l7WoRDeKD
 bd4CurkBKsuc8XKEBO6/3Vl83dgbsxYL+dFHybzrQ6TWxShZQETnqxTRAIjbwje13ISMnCMj36O
 i6CZ1T7ff7bEDDNDb6ALuQNr3Gtf/RY8IQ/ZniakBdtkoZ+qQ6XA/dPnmVX7y9F3ZjMbb/dpO5h
 FiiJ++OK
X-Proofpoint-GUID: X-xj0sjlLGohm0_irW2NdDHgJ5aCVt0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 07:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118590

From: Jiaying Song <jiaying.song.cn@windriver.com>

- Fix CVE-2025-53643:
AIOHTTP is an asynchronous HTTP client/server framework for asyncio and
Python. Prior to version 3.12.14, the Python parser is vulnerable to a
request smuggling vulnerability due to not parsing trailer sections of
an HTTP request. If a pure Python version of aiohttp is installed (i.e.
without the usual C extensions) or AIOHTTP_NO_EXTENSIONS is enabled,
then an attacker may be able to execute a request smuggling attack to
bypass certain firewalls or proxy protections. Version 3.12.14 contains
a patch for this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-53643

- Drop CVE-2024-42367.patch:
According to upstream discussion and advisory [1][2], aiohttp 3.8.6 is
not affected by CVE-2024-42367, and the patch is therefore no longer
needed.

[1] https://github.com/advisories/GHSA-jwhx-xcg6-8xhj
[2] https://github.com/aio-libs/aiohttp/issues/11149

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python3-aiohttp/CVE-2024-42367.patch      |  65 ------
 .../python3-aiohttp/CVE-2025-53643.patch      | 197 ++++++++++++++++++
 .../python/python3-aiohttp_3.8.6.bb           |   2 +-
 3 files changed, 198 insertions(+), 66 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch
deleted file mode 100644
index dadec31f3a..0000000000
--- a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From e19cb50fb529bbe75cc4f1b68eeb0a3f631ad0d0 Mon Sep 17 00:00:00 2001
-From: "J. Nick Koston" <nick@koston.org>
-Date: Thu, 8 Aug 2024 11:19:28 -0500
-Subject: [PATCH] Do not follow symlinks for compressed file variants (#8652)
-
-CVE: CVE-2024-42367
-
-Upstream-Status: Backport
-[https://github.com/aio-libs/aiohttp/commit/ce2e9758814527589b10759a20783fb03b98339f]
-
-Co-authored-by: Steve Repsher <steverep@users.noreply.github.com>
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
----
- CHANGES/8652.bugfix.rst     |  1 +
- aiohttp/web_fileresponse.py | 26 ++++++++++++++++++++++++++
- 2 files changed, 27 insertions(+)
- create mode 100644 CHANGES/8652.bugfix.rst
-
-diff --git a/CHANGES/8652.bugfix.rst b/CHANGES/8652.bugfix.rst
-new file mode 100644
-index 000000000..3a1003e50
---- /dev/null
-+++ b/CHANGES/8652.bugfix.rst
-@@ -0,0 +1 @@
-+Fixed incorrectly following symlinks for compressed file variants -- by :user:`steverep`.
-diff --git a/aiohttp/web_fileresponse.py b/aiohttp/web_fileresponse.py
-index f41ed3fd0..35dbd41e1 100644
---- a/aiohttp/web_fileresponse.py
-+++ b/aiohttp/web_fileresponse.py
-@@ -127,6 +127,32 @@ class FileResponse(StreamResponse):
-         self.content_length = 0
-         return await super().prepare(request)
- 
-+    def _get_file_path_stat_encoding(
-+        self, accept_encoding: str
-+    ) -> Tuple[pathlib.Path, os.stat_result, Optional[str]]:
-+        """Return the file path, stat result, and encoding.
-+
-+        If an uncompressed file is returned, the encoding is set to
-+        :py:data:`None`.
-+
-+        This method should be called from a thread executor
-+        since it calls os.stat which may block.
-+        """
-+        file_path = self._path
-+        for file_extension, file_encoding in ENCODING_EXTENSIONS.items():
-+            if file_encoding not in accept_encoding:
-+                continue
-+
-+            compressed_path = file_path.with_suffix(file_path.suffix + file_extension)
-+            with suppress(OSError):
-+                # Do not follow symlinks and ignore any non-regular files.
-+                st = compressed_path.lstat()
-+                if S_ISREG(st.st_mode):
-+                    return compressed_path, st, file_encoding
-+
-+        # Fallback to the uncompressed file
-+        return file_path, file_path.stat(), None
-+
-     async def prepare(self, request: "BaseRequest") -> Optional[AbstractStreamWriter]:
-         filepath = self._path
- 
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
new file mode 100644
index 0000000000..19eef35bb2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
@@ -0,0 +1,197 @@
+From 4c4dec318f21e2eae9c69cd5b83cb54b4f9bb746 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 9 Jul 2025 19:55:22 +0100
+Subject: [PATCH] Add trailer parsing logic (#11269) (#11287)
+
+(cherry picked from commit 7dd4b5535e6bf9c2d2f05fde638517bff065ba74)
+
+CVE: CVE-2025-53643
+
+Upstream-Status: Backport
+[https://github.com/aio-libs/aiohttp/commit/e8d774f635dc6d1cd3174d0e38891da5de0e2b6a]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ aiohttp/http_parser.py | 70 ++++++++++++++++++++++--------------------
+ aiohttp/multipart.py   |  2 +-
+ 2 files changed, 38 insertions(+), 34 deletions(-)
+
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 1ee126940..175eb7f68 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -147,8 +147,8 @@ class HeadersParser:
+         headers: CIMultiDict[str] = CIMultiDict()
+         raw_headers = []
+ 
+-        lines_idx = 1
+-        line = lines[1]
++        lines_idx = 0
++        line = lines[lines_idx]
+         line_count = len(lines)
+ 
+         while line:
+@@ -386,6 +386,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                                 response_with_body=self.response_with_body,
+                                 auto_decompress=self._auto_decompress,
+                                 lax=self.lax,
++                                headers_parser=self._headers_parser,
+                             )
+                             if not payload_parser.done:
+                                 self._payload_parser = payload_parser
+@@ -405,6 +406,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                                 readall=True,
+                                 auto_decompress=self._auto_decompress,
+                                 lax=self.lax,
++                                headers_parser=self._headers_parser,
+                             )
+                         else:
+                             if (
+@@ -429,6 +431,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                                     response_with_body=self.response_with_body,
+                                     auto_decompress=self._auto_decompress,
+                                     lax=self.lax,
++                                    headers_parser=self._headers_parser,
+                                 )
+                                 if not payload_parser.done:
+                                     self._payload_parser = payload_parser
+@@ -462,6 +465,10 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
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
+@@ -617,7 +624,7 @@ class HttpRequestParser(HttpParser[RawRequestMessage]):
+             compression,
+             upgrade,
+             chunked,
+-        ) = self.parse_headers(lines)
++        ) = self.parse_headers(lines[1:])
+ 
+         if close is None:  # then the headers weren't set in the request
+             if version_o <= HttpVersion10:  # HTTP 1.0 must asks to not close
+@@ -696,7 +703,7 @@ class HttpResponseParser(HttpParser[RawResponseMessage]):
+             compression,
+             upgrade,
+             chunked,
+-        ) = self.parse_headers(lines)
++       ) = self.parse_headers(lines[1:])
+ 
+         if close is None:
+             close = version_o <= HttpVersion10
+@@ -727,6 +734,8 @@ class HttpPayloadParser:
+         response_with_body: bool = True,
+         auto_decompress: bool = True,
+         lax: bool = False,
++        *,
++        headers_parser: HeadersParser,
+     ) -> None:
+         self._length = 0
+         self._type = ParseState.PARSE_NONE
+@@ -735,6 +744,8 @@ class HttpPayloadParser:
+         self._chunk_tail = b""
+         self._auto_decompress = auto_decompress
+         self._lax = lax
++        self._headers_parser = headers_parser
++        self._trailer_lines: list[bytes] = []
+         self.done = False
+ 
+         # payload decompression wrapper
+@@ -822,7 +833,7 @@ class HttpPayloadParser:
+                             size_b = chunk[:i]  # strip chunk-extensions
+                             # Verify no LF in the chunk-extension
+                             if b"\n" in (ext := chunk[i:pos]):
+-                                exc = BadHttpMessage(
++                                exc = TransferEncodingError(
+                                     f"Unexpected LF in chunk-extension: {ext!r}"
+                                 )
+                                 set_exception(self.payload, exc)
+@@ -843,7 +854,7 @@ class HttpPayloadParser:
+ 
+                         chunk = chunk[pos + len(SEP) :]
+                         if size == 0:  # eof marker
+-                            self._chunk = ChunkState.PARSE_MAYBE_TRAILERS
++                            self._chunk = ChunkState.PARSE_TRAILERS
+                             if self._lax and chunk.startswith(b"\r"):
+                                 chunk = chunk[1:]
+                         else:
+@@ -881,38 +892,31 @@ class HttpPayloadParser:
+                         self._chunk_tail = chunk
+                         return False, b""
+ 
+-                # if stream does not contain trailer, after 0\r\n
+-                # we should get another \r\n otherwise
+-                # trailers needs to be skiped until \r\n\r\n
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
+index 9cd49bb5d..2457f80ec 100644
+--- a/aiohttp/multipart.py
++++ b/aiohttp/multipart.py
+@@ -718,7 +718,7 @@ class MultipartReader:
+             raise ValueError(f"Invalid boundary {chunk!r}, expected {self._boundary!r}")
+ 
+     async def _read_headers(self) -> "CIMultiDictProxy[str]":
+-        lines = [b""]
++        lines = []
+         while True:
+             chunk = await self._content.readline()
+             chunk = chunk.strip()
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
index fdecf9ef4c..50103da47d 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
@@ -10,7 +10,7 @@ SRC_URI += "file://CVE-2024-23334.patch \
             file://CVE-2024-52304.patch \
             file://CVE-2023-49082.patch \
             file://CVE-2024-27306.patch \
-            file://CVE-2024-42367.patch \
+            file://CVE-2025-53643.patch \
            "
 
 SRC_URI[sha256sum] = "b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c"
-- 
2.34.1


