Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBB2C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:22:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18097.1752657745590072755
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9292c8cf09=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G502r61895174
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 02:22:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0spuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 02:22:24 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 16 Jul 2025 02:22:24 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 16 Jul 2025 02:22:23 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Changqing.Li@windriver.com>
Subject: [walnascar][meta-python][PATCH] python3-aiohttp: fix CVE-2025-53643
Date: Wed, 16 Jul 2025 17:22:22 +0800
Message-ID: <20250716092222.1020100-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: aooU6bgrnKvm64aC57WlC6ytecNwryXB
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=68776f51 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=0lhnMm1FAAAA:8 a=E-yJ0chgORDrtm9eJikA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=9CHbX8HeWodPCPcMgNm7:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX8n0QkchKJadY
 bfXvm1l7enYhCAm+nxSbzFNpc1Mw0V9GiOlvzq5GuAuHE5jVJc/U0aVFq2J9s+3V7Pf1CmLi9kL
 UUB24DFODWGcea5uWlHUNzeMpoKgIywSZfnc1ug3SsimCo45bvxgyJsvary0d9zxOG7d6oIMJzh
 7Qz+vw55IP2GGX5fe7k7yNF0qdg1Hy1O5RAzsFjxQYpoC7/8cUZItO2ID56Vsfs8GCLIXwdRNPO
 ks82VwK9jtR9MNRrdjGsc4TvsUyVN2lxG+6zK04axi/a8BfiDMs0Y9Pgpaqb0ImnstX+i0BLU3h
 O26AyfqnScClz0Sl02qzmPWDC+qVXVdnUmKJsmaEwE1cxF2mEiXBB+8+dIhzqjzhBApPTCQW7+9
 pxUgcAaq
X-Proofpoint-GUID: aooU6bgrnKvm64aC57WlC6ytecNwryXB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 09:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118595

From: Jiaying Song <jiaying.song.cn@windriver.com>

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

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python3-aiohttp/CVE-2025-53643.patch      | 526 ++++++++++++++++++
 .../python/python3-aiohttp_3.11.16.bb         |   2 +
 2 files changed, 528 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
new file mode 100644
index 0000000000..fd8f83d563
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
@@ -0,0 +1,526 @@
+From 5a3e141bca22757e60b3c584b8ac7eee90708b8b Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 9 Jul 2025 19:55:22 +0100
+Subject: [PATCH] Add trailer parsing logic (#11269) (#11287)
+
+(cherry picked from commit 7dd4b5535e6bf9c2d2f05fde638517bff065ba74)
+
+CVE-2025-53643.patch
+
+Upstream-Status: Backport
+[https://github.com/aio-libs/aiohttp/commit/e8d774f635dc6d1cd3174d0e38891da5de0e2b6a]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ CHANGES/11269.feature.rst |   1 +
+ aiohttp/http_parser.py    |  70 +++++++++---------
+ aiohttp/multipart.py      |   2 +-
+ tests/test_http_parser.py | 148 ++++++++++++++++----------------------
+ 4 files changed, 100 insertions(+), 121 deletions(-)
+ create mode 100644 CHANGES/11269.feature.rst
+
+diff --git a/CHANGES/11269.feature.rst b/CHANGES/11269.feature.rst
+new file mode 100644
+index 000000000..92cf173be
+--- /dev/null
++++ b/CHANGES/11269.feature.rst
+@@ -0,0 +1 @@
++Added initial trailer parsing logic to Python HTTP parser -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 1b8b5b4d4..7d8db6d6f 100644
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
+@@ -400,6 +400,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                                 response_with_body=self.response_with_body,
+                                 auto_decompress=self._auto_decompress,
+                                 lax=self.lax,
++                                headers_parser=self._headers_parser,
+                             )
+                             if not payload_parser.done:
+                                 self._payload_parser = payload_parser
+@@ -418,6 +419,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                                 compression=msg.compression,
+                                 auto_decompress=self._auto_decompress,
+                                 lax=self.lax,
++                                headers_parser=self._headers_parser,
+                             )
+                         elif not empty_body and length is None and self.read_until_eof:
+                             payload = StreamReader(
+@@ -436,6 +438,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+                                 response_with_body=self.response_with_body,
+                                 auto_decompress=self._auto_decompress,
+                                 lax=self.lax,
++                                headers_parser=self._headers_parser,
+                             )
+                             if not payload_parser.done:
+                                 self._payload_parser = payload_parser
+@@ -473,6 +476,10 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
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
+@@ -721,7 +728,7 @@ class HttpResponseParser(HttpParser[RawResponseMessage]):
+             compression,
+             upgrade,
+             chunked,
+-        ) = self.parse_headers(lines)
++        ) = self.parse_headers(lines[1:])
+ 
+         if close is None:
+             if version_o <= HttpVersion10:
+@@ -764,6 +771,8 @@ class HttpPayloadParser:
+         response_with_body: bool = True,
+         auto_decompress: bool = True,
+         lax: bool = False,
++        *,
++        headers_parser: HeadersParser,
+     ) -> None:
+         self._length = 0
+         self._type = ParseState.PARSE_UNTIL_EOF
+@@ -772,6 +781,8 @@ class HttpPayloadParser:
+         self._chunk_tail = b""
+         self._auto_decompress = auto_decompress
+         self._lax = lax
++        self._headers_parser = headers_parser
++        self._trailer_lines: list[bytes] = []
+         self.done = False
+ 
+         # payload decompression wrapper
+@@ -848,7 +859,7 @@ class HttpPayloadParser:
+                             size_b = chunk[:i]  # strip chunk-extensions
+                             # Verify no LF in the chunk-extension
+                             if b"\n" in (ext := chunk[i:pos]):
+-                                exc = BadHttpMessage(
++                                exc = TransferEncodingError(
+                                     f"Unexpected LF in chunk-extension: {ext!r}"
+                                 )
+                                 set_exception(self.payload, exc)
+@@ -869,7 +880,7 @@ class HttpPayloadParser:
+ 
+                         chunk = chunk[pos + len(SEP) :]
+                         if size == 0:  # eof marker
+-                            self._chunk = ChunkState.PARSE_MAYBE_TRAILERS
++                            self._chunk = ChunkState.PARSE_TRAILERS
+                             if self._lax and chunk.startswith(b"\r"):
+                                 chunk = chunk[1:]
+                         else:
+@@ -907,38 +918,31 @@ class HttpPayloadParser:
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
+index bd4d8ae1d..6faff0e9f 100644
+--- a/aiohttp/multipart.py
++++ b/aiohttp/multipart.py
+@@ -767,7 +767,7 @@ class MultipartReader:
+             raise ValueError(f"Invalid boundary {chunk!r}, expected {self._boundary!r}")
+ 
+     async def _read_headers(self) -> "CIMultiDictProxy[str]":
+-        lines = [b""]
++        lines = []
+         while True:
+             chunk = await self._content.readline()
+             chunk = chunk.strip()
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 58fef625f..385452c1c 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -17,6 +17,7 @@ from aiohttp.base_protocol import BaseProtocol
+ from aiohttp.http_parser import (
+     NO_EXTENSIONS,
+     DeflateBuffer,
++    HeadersParser,
+     HttpPayloadParser,
+     HttpRequestParser,
+     HttpRequestParserPy,
+@@ -244,41 +245,13 @@ def test_content_length_transfer_encoding(parser: Any) -> None:
+         parser.feed_data(text)
+ 
+ 
+-def test_bad_chunked_py(loop: Any, protocol: Any) -> None:
++def test_bad_chunked(parser: HttpRequestParser) -> None:
+     """Test that invalid chunked encoding doesn't allow content-length to be used."""
+-    parser = HttpRequestParserPy(
+-        protocol,
+-        loop,
+-        2**16,
+-        max_line_size=8190,
+-        max_field_size=8190,
+-    )
+-    text = (
+-        b"GET / HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked\r\n\r\n0_2e\r\n\r\n"
+-        + b"GET / HTTP/1.1\r\nHost: a\r\nContent-Length: 5\r\n\r\n0\r\n\r\n"
+-    )
+-    messages, upgrade, tail = parser.feed_data(text)
+-    assert isinstance(messages[0][1].exception(), http_exceptions.TransferEncodingError)
+-
+-
+-@pytest.mark.skipif(
+-    "HttpRequestParserC" not in dir(aiohttp.http_parser),
+-    reason="C based HTTP parser not available",
+-)
+-def test_bad_chunked_c(loop: Any, protocol: Any) -> None:
+-    """C parser behaves differently. Maybe we should align them later."""
+-    parser = HttpRequestParserC(
+-        protocol,
+-        loop,
+-        2**16,
+-        max_line_size=8190,
+-        max_field_size=8190,
+-    )
+     text = (
+         b"GET / HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked\r\n\r\n0_2e\r\n\r\n"
+         + b"GET / HTTP/1.1\r\nHost: a\r\nContent-Length: 5\r\n\r\n0\r\n\r\n"
+     )
+-    with pytest.raises(http_exceptions.BadHttpMessage):
++    with pytest.raises(http_exceptions.BadHttpMessage, match="0_2e"):
+         parser.feed_data(text)
+ 
+ 
+@@ -1158,8 +1131,8 @@ async def test_http_response_parser_bad_chunked_strict_py(loop, protocol) -> Non
+     text = (
+         b"HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n5 \r\nabcde\r\n0\r\n\r\n"
+     )
+-    messages, upgrade, tail = response.feed_data(text)
+-    assert isinstance(messages[0][1].exception(), http_exceptions.TransferEncodingError)
++    with pytest.raises(http_exceptions.TransferEncodingError, match="5"):
++        response.feed_data(text)
+ 
+ 
+ @pytest.mark.dev_mode
+@@ -1295,7 +1268,27 @@ def test_parse_chunked_payload_chunk_extension(parser) -> None:
+     assert payload.is_eof()
+ 
+ 
+-def test_parse_no_length_or_te_on_post(loop: Any, protocol: Any, request_cls: Any):
++async def test_request_chunked_with_trailer(parser: HttpRequestParser) -> None:
++    text = b"GET /test HTTP/1.1\r\nTransfer-Encoding: chunked\r\n\r\n4\r\ntest\r\n0\r\ntest: trailer\r\nsecond: test trailer\r\n\r\n"
++    messages, upgraded, tail = parser.feed_data(text)
++    assert not tail
++    msg, payload = messages[0]
++    assert await payload.read() == b"test"
++
++    # TODO: Add assertion of trailers when API added.
++
++
++async def test_request_chunked_reject_bad_trailer(parser: HttpRequestParser) -> None:
++    text = b"GET /test HTTP/1.1\r\nTransfer-Encoding: chunked\r\n\r\n0\r\nbad\ntrailer\r\n\r\n"
++    with pytest.raises(http_exceptions.BadHttpMessage, match=r"b'bad\\ntrailer'"):
++        parser.feed_data(text)
++
++
++def test_parse_no_length_or_te_on_post(
++    loop: asyncio.AbstractEventLoop,
++    protocol: BaseProtocol,
++    request_cls: type[HttpRequestParser],
++) -> None:
+     parser = request_cls(protocol, loop, limit=2**16)
+     text = b"POST /test HTTP/1.1\r\n\r\n"
+     msg, payload = parser.feed_data(text)[0][0]
+@@ -1478,19 +1471,10 @@ async def test_parse_chunked_payload_split_chunks(response: Any) -> None:
+     assert await reader.read() == b"firstsecond"
+ 
+ 
+-@pytest.mark.skipif(NO_EXTENSIONS, reason="Only tests C parser.")
+-async def test_parse_chunked_payload_with_lf_in_extensions_c_parser(
+-    loop: asyncio.AbstractEventLoop, protocol: BaseProtocol
++async def test_parse_chunked_payload_with_lf_in_extensions(
++    parser: HttpRequestParser,
+ ) -> None:
+-    """Test the C-parser with a chunked payload that has a LF in the chunk extensions."""
+-    # The C parser will raise a BadHttpMessage from feed_data
+-    parser = HttpRequestParserC(
+-        protocol,
+-        loop,
+-        2**16,
+-        max_line_size=8190,
+-        max_field_size=8190,
+-    )
++    """Test chunked payload that has a LF in the chunk extensions."""
+     payload = (
+         b"GET / HTTP/1.1\r\nHost: localhost:5001\r\n"
+         b"Transfer-Encoding: chunked\r\n\r\n2;\nxx\r\n4c\r\n0\r\n\r\n"
+@@ -1501,31 +1485,6 @@ async def test_parse_chunked_payload_with_lf_in_extensions_c_parser(
+         parser.feed_data(payload)
+ 
+ 
+-async def test_parse_chunked_payload_with_lf_in_extensions_py_parser(
+-    loop: asyncio.AbstractEventLoop, protocol: BaseProtocol
+-) -> None:
+-    """Test the py-parser with a chunked payload that has a LF in the chunk extensions."""
+-    # The py parser will not raise the BadHttpMessage directly, but instead
+-    # it will set the exception on the StreamReader.
+-    parser = HttpRequestParserPy(
+-        protocol,
+-        loop,
+-        2**16,
+-        max_line_size=8190,
+-        max_field_size=8190,
+-    )
+-    payload = (
+-        b"GET / HTTP/1.1\r\nHost: localhost:5001\r\n"
+-        b"Transfer-Encoding: chunked\r\n\r\n2;\nxx\r\n4c\r\n0\r\n\r\n"
+-        b"GET /admin HTTP/1.1\r\nHost: localhost:5001\r\n"
+-        b"Transfer-Encoding: chunked\r\n\r\n0\r\n\r\n"
+-    )
+-    messages, _, _ = parser.feed_data(payload)
+-    reader = messages[0][1]
+-    assert isinstance(reader.exception(), http_exceptions.BadHttpMessage)
+-    assert "\\nxx" in str(reader.exception())
+-
+-
+ def test_partial_url(parser: HttpRequestParser) -> None:
+     messages, upgrade, tail = parser.feed_data(b"GET /te")
+     assert len(messages) == 0
+@@ -1612,7 +1571,7 @@ def test_parse_bad_method_for_c_parser_raises(loop, protocol):
+ class TestParsePayload:
+     async def test_parse_eof_payload(self, protocol: BaseProtocol) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out)
++        p = HttpPayloadParser(out, headers_parser=HeadersParser())
+         p.feed_data(b"data")
+         p.feed_eof()
+ 
+@@ -1622,7 +1581,7 @@ class TestParsePayload:
+     async def test_parse_length_payload_eof(self, protocol: BaseProtocol) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+ 
+-        p = HttpPayloadParser(out, length=4)
++        p = HttpPayloadParser(out, length=4, headers_parser=HeadersParser())
+         p.feed_data(b"da")
+ 
+         with pytest.raises(http_exceptions.ContentLengthError):
+@@ -1632,7 +1591,7 @@ class TestParsePayload:
+         self, protocol: BaseProtocol
+     ) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, chunked=True)
++        p = HttpPayloadParser(out, chunked=True, headers_parser=HeadersParser())
+         with pytest.raises(http_exceptions.TransferEncodingError):
+             p.feed_data(b"blah\r\n")
+         assert isinstance(out.exception(), http_exceptions.TransferEncodingError)
+@@ -1641,7 +1600,7 @@ class TestParsePayload:
+         self, protocol: BaseProtocol
+     ) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, chunked=True)
++        p = HttpPayloadParser(out, chunked=True, headers_parser=HeadersParser())
+         p.feed_data(b"4\r\nasdf\r\n0\r\n")
+         p.feed_data(b"\r\n")
+ 
+@@ -1652,7 +1611,7 @@ class TestParsePayload:
+         self, protocol: BaseProtocol
+     ) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, chunked=True)
++        p = HttpPayloadParser(out, chunked=True, headers_parser=HeadersParser())
+         p.feed_data(b"4\r\nasdf\r\n0\r\n\r")
+         p.feed_data(b"\n")
+ 
+@@ -1663,7 +1622,7 @@ class TestParsePayload:
+         self, protocol: BaseProtocol
+     ) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, chunked=True)
++        p = HttpPayloadParser(out, chunked=True, headers_parser=HeadersParser())
+         p.feed_data(b"4\r\nasdf\r\n0\r\n")
+         p.feed_data(b"Content-MD5: 912ec803b2ce49e4a541068d495ab570\r\n")
+         p.feed_data(b"\r\n")
+@@ -1675,7 +1634,7 @@ class TestParsePayload:
+         self, protocol: BaseProtocol
+     ) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, chunked=True)
++        p = HttpPayloadParser(out, chunked=True, headers_parser=HeadersParser())
+         p.feed_data(b"4\r\nasdf\r\n0\r\n")
+         p.feed_data(b"Content-MD5: 912ec803b2ce49e4a541068d495ab570\r\n\r")
+         p.feed_data(b"\n")
+@@ -1687,7 +1646,7 @@ class TestParsePayload:
+         self, protocol: BaseProtocol
+     ) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, chunked=True)
++        p = HttpPayloadParser(out, chunked=True, headers_parser=HeadersParser())
+         p.feed_data(b"4\r\nasdf\r\n0\r\nContent-MD5: ")
+         p.feed_data(b"912ec803b2ce49e4a541068d495ab570\r\n\r\n")
+ 
+@@ -1698,7 +1657,7 @@ class TestParsePayload:
+         self, protocol: BaseProtocol
+     ) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, chunked=True)
++        p = HttpPayloadParser(out, chunked=True, headers_parser=HeadersParser())
+         p.feed_data(b"4\r\nasdf\r\n0\r\nC")
+         p.feed_data(b"ontent-MD5: 912ec803b2ce49e4a541068d495ab570\r\n\r\n")
+ 
+@@ -1707,7 +1666,7 @@ class TestParsePayload:
+ 
+     async def test_http_payload_parser_length(self, protocol: BaseProtocol) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, length=2)
++        p = HttpPayloadParser(out, length=2, headers_parser=HeadersParser())
+         eof, tail = p.feed_data(b"1245")
+         assert eof
+ 
+@@ -1720,7 +1679,9 @@ class TestParsePayload:
+ 
+         length = len(COMPRESSED)
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, length=length, compression="deflate")
++        p = HttpPayloadParser(
++            out, length=length, compression="deflate", headers_parser=HeadersParser()
++        )
+         p.feed_data(COMPRESSED)
+         assert b"data" == out._buffer[0]
+         assert out.is_eof()
+@@ -1734,7 +1695,9 @@ class TestParsePayload:
+ 
+         length = len(COMPRESSED)
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, length=length, compression="deflate")
++        p = HttpPayloadParser(
++            out, length=length, compression="deflate", headers_parser=HeadersParser()
++        )
+         p.feed_data(COMPRESSED)
+         assert b"data" == out._buffer[0]
+         assert out.is_eof()
+@@ -1747,7 +1710,9 @@ class TestParsePayload:
+ 
+         length = len(COMPRESSED)
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, length=length, compression="deflate")
++        p = HttpPayloadParser(
++            out, length=length, compression="deflate", headers_parser=HeadersParser()
++        )
+         p.feed_data(COMPRESSED)
+ 
+         assert b"data" == out._buffer[0]
+@@ -1757,7 +1722,9 @@ class TestParsePayload:
+         self, protocol: BaseProtocol
+     ) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, compression="deflate")
++        p = HttpPayloadParser(
++            out, compression="deflate", headers_parser=HeadersParser()
++        )
+         # Feeding one correct byte should be enough to choose exact
+         # deflate decompressor
+         p.feed_data(b"x")
+@@ -1769,7 +1736,9 @@ class TestParsePayload:
+         self, protocol: BaseProtocol
+     ) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, compression="deflate")
++        p = HttpPayloadParser(
++            out, compression="deflate", headers_parser=HeadersParser()
++        )
+         # Feeding one wrong byte should be enough to choose exact
+         # deflate decompressor
+         p.feed_data(b"K")
+@@ -1781,7 +1750,7 @@ class TestParsePayload:
+         self, protocol: BaseProtocol
+     ) -> None:
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, length=0)
++        p = HttpPayloadParser(out, length=0, headers_parser=HeadersParser())
+         assert p.done
+         assert out.is_eof()
+ 
+@@ -1789,7 +1758,12 @@ class TestParsePayload:
+     async def test_http_payload_brotli(self, protocol: BaseProtocol) -> None:
+         compressed = brotli.compress(b"brotli data")
+         out = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
+-        p = HttpPayloadParser(out, length=len(compressed), compression="br")
++        p = HttpPayloadParser(
++            out,
++            length=len(compressed),
++            compression="br",
++            headers_parser=HeadersParser(),
++        )
+         p.feed_data(compressed)
+         assert b"brotli data" == out._buffer[0]
+         assert out.is_eof()
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb
index 960272e9a3..5267ad800b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
 SRC_URI[sha256sum] = "16f8a2c9538c14a557b4d309ed4d0a7c60f0253e8ed7b6c9a2859a7582f8b1b8"
 
+SRC_URI += "file://CVE-2025-53643.patch"
+
 inherit python_setuptools_build_meta pypi
 
 RDEPENDS:${PN} = "\
-- 
2.34.1


