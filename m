Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857A6CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:42:46 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15844.1792132956136156653
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hwSgad+9;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8326; q=dns/txt;
  s=iport01; t=1792132956; x=1793342556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fgKtzwkmrwrsxKjAqYtqXQYXCyeiiRrw62tdMspC14o=;
  b=hwSgad+9iWAURqiVa/T3TlF6ta3439dBB7PQ9Mh7CxcfkOmGus4/yP9Y
   lkMOI4IkecZOruhS/3HwCwLUE9x8GZUqNbjEhl4r1TwBUmsaTJ57yAScS
   Dbex+oqPH/mSNDP+BPUCahxuCMfbE9rnWzi0RfyzCLoTkM4QitYZKedo7
   fA03NhhSXUWjdAspXmxtICZ5HADVf2z3DizAIC5lkVps3KV7hPsl1e1/l
   fIlcGGi9TlEfNDf94fZ9Sgtrtv/djTiEK5pnFOyj+WGqljO8Fim/oJze0
   WeWsXkHk7bX0mLL0JpdkmW0f5S0TED52zBxMAm6Pcg4K32b9/YDKuuopo
   Q==;
X-CSE-ConnectionGUID: DxOenbbSSMSKUiE40gv60g==
X-CSE-MsgGUID: xUgEQ2K/RnyD7DqHT1l0nw==
X-IPAS-Result: =?us-ascii?q?A0BJAgDLxdFq/5X/Ja1aglmCV3VgQ0kDlkcDnhyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxG8eoF5M4EBg?=
 =?us-ascii?q?ykBMQWBHtsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYE7gi6BBYFcAoglBIIig?=
 =?us-ascii?q?QyBWoFJk35IgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETG?=
 =?us-ascii?q?jALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CZQF6EwEqA?=
 =?us-ascii?q?ReBHXgck16Re6EPCiiDdowilToaM4QElBeSVAuYfY4KlV9whGmBaDyBWXAVg?=
 =?us-ascii?q?yIJShkPjisOC4NgzlonMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:l+kNvqxyi2HBelhQujt6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUAm
 zYaXWCFO/2MZGqnc94ja4608EpT7cOBndJrSQRqqFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJG0mGoAe8OxMOkR11
 sEZBWxVYQ7d3+3jldpXSsE07igiBNPgMIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cMnWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZCwa4SNJoDUGJg9ckCwt
 l/J0l2jIVYgMs2zlhac0k71grfJgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:H9sPkK1UI89kw0RCGuBMUwqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3ArI6y32u3pjimIa/+q74CjquU6IsJYlrQyn3aGHS?=
 =?us-ascii?q?dMkVUSZDJEVCOpvtrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxAWNbg4Ltu0su/Eq/GO97NqSxox43quDMRou1q8?=
 =?us-ascii?q?AquXbGTVQB26Z1DKoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536044655"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:42:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 24E9F180001DD;
	Fri, 16 Oct 2026 06:42:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C4768CBF203; Thu, 15 Oct 2026 23:42:34 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 3/3] python3-aiohttp: fix CVE-2026-69244
Date: Thu, 15 Oct 2026 23:42:19 -0700
Message-Id: <20261016064219.3910025-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016064219.3910025-1-dkelaiya@cisco.com>
References: <20261016064219.3910025-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131066

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1]. The recipe regenerates the C HTTP parser
from the corrected Cython source during configuration.

[1] https://github.com/aio-libs/aiohttp/commit/49f65d54150397892f7bcc4aae887767d51c322d
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-cq5v-8q36-5273

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-69244.patch      | 159 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 160 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch
new file mode 100644
index 0000000000..6fc982356a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch
@@ -0,0 +1,159 @@
+From bfa3f83ad150bf6bc660dd0e3178375942b9528a Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Wed, 22 Jul 2026 11:14:50 -1000
+Subject: [PATCH] [PR #13222/f4866933 backport][3.14] Build C parser error
+ message from bounded buffer slice (#13223)
+
+CVE: CVE-2026-69244
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/49f65d54150397892f7bcc4aae887767d51c322d]
+
+Backport Changes:
+- Used mock protocols in three parser-error regression tests:
+  the 3.13.5 test setup differs from upstream, and these tests
+  need no transport behavior to check the bounded error snippet.
+- Omitted generated _http_parser.c because the Wrynose recipe
+  regenerates it from _http_parser.pyx during do_configure.
+
+(cherry picked from commit 49f65d54150397892f7bcc4aae887767d51c322d)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13222.bugfix.rst  |  1 +
+ aiohttp/_http_parser.pyx  |  9 ++--
+ tests/test_http_parser.py | 92 +++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 98 insertions(+), 4 deletions(-)
+ create mode 100644 CHANGES/13222.bugfix.rst
+
+diff --git a/CHANGES/13222.bugfix.rst b/CHANGES/13222.bugfix.rst
+new file mode 100644
+index 000000000..dcdda1705
+--- /dev/null
++++ b/CHANGES/13222.bugfix.rst
+@@ -0,0 +1 @@
++Fixed error message construction in the C HTTP parser -- by :user:`bdraco`.
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 478d82ecb..ffbd53fde 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -623,11 +623,12 @@ cdef class HttpParser:
+                     ex = self._last_error
+                     self._last_error = None
+                 else:
+-                    after = cparser.llhttp_get_error_pos(self._cparser)
+-                    before = data[:after - base]
+-                    after_b = after.split(b"\r\n", 1)[0]
++                    error_pos = cparser.llhttp_get_error_pos(self._cparser)
++                    error_off = error_pos - base
++                    before = data[:error_off]
++                    after = data[error_off:].split(b"\r\n", 1)[0]
+                     before = before.rsplit(b"\r\n", 1)[-1]
+-                    data = before + after_b
++                    data = before + after
+                     pointer = " " * (len(repr(before))-1) + "^"
+                     ex = parser_error_from_errno(self._cparser, data, pointer)
+                 self._payload = None
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 92e59af1c..4cdd94cb6 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -1607,6 +1607,98 @@ async def test_http_response_parser_bad_chunked_strict_c(loop, protocol) -> None
+         response.feed_data(text)
+ 
+ 
++# The C parser builds its error message from a snippet of the fed buffer. That
++# snippet must be sliced out of the bounded ``data`` bytes object; materializing the
++# raw llhttp error-position pointer instead runs strlen past the end of the buffer.
++# These tests pin the snippet to bytes that lie inside the fed input, and cover error
++# positions right at the buffer end where the over-read used to happen.
++
++_CHUNKED_RESP_HDR = b"HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n"
++
++# (malformed body appended to a chunked response header, expected error snippet,
++# llhttp error reason)
++_BAD_CHUNKED_RESPONSES = [
++    (b"0\rX\r\n\r\n", b"0\rX", "Expected LF after chunk size"),
++    (b"5\r\nhello\rX\r\n0\r\n\r\n", b"hello\rX", "Expected LF after chunk data"),
++    (b"5\r\nhelloXY\r\n0\r\n\r\n", b"helloXY", "Expected LF after chunk data"),
++    (b"1\r\nA\rB\r\n0\r\n\r\n", b"A\rB", "Expected LF after chunk data"),
++    (b"0_2e\r\n\r\n", b"0_2e", "Invalid character in chunk size"),
++]
++
++# Same, but the buffer ends exactly at the offending byte so the error position sits
++# at the end of the input with no trailing CRLF to bound the old strlen-based slice.
++_BAD_CHUNKED_RESPONSES_AT_END = [
++    (b"0\rX", b"0\rX", "Expected LF after chunk size"),
++    (b"5\r\nhello\rX", b"hello\rX", "Expected LF after chunk data"),
++    (b"0_", b"0_", "Invalid character in chunk size"),
++]
++
++_BAD_REQUESTS_AT_END = [
++    (b"GET / HTTP/1.1\r\nHost: x\n", b"Host: x\n"),
++    (b"POST / HTTP/1.1\r\nHost: x\r\nA: b\x01", b"A: b\x01"),
++]
++
++
++@pytest.mark.skipif(NO_EXTENSIONS, reason="Only tests C parser.")
++@pytest.mark.parametrize(
++    ("body", "snippet", "reason"),
++    _BAD_CHUNKED_RESPONSES + _BAD_CHUNKED_RESPONSES_AT_END,
++)
++async def test_c_parser_error_snippet_bounded_response(
++    body: bytes, snippet: bytes, reason: str
++) -> None:
++    loop = asyncio.get_running_loop()
++    protocol = mock.Mock()
++    response = HttpResponseParserC(
++        protocol, loop, 2**16, max_line_size=8190, max_field_size=8190
++    )
++    protocol._parser = response
++    text = _CHUNKED_RESP_HDR + body
++    assert snippet in text
++    match = f"{re.escape(reason)}[\\s\\S]*{re.escape(repr(snippet))}"
++    with pytest.raises(http_exceptions.BadHttpMessage, match=match):
++        response.feed_data(text)
++
++
++@pytest.mark.skipif(NO_EXTENSIONS, reason="Only tests C parser.")
++@pytest.mark.parametrize(("text", "snippet"), _BAD_REQUESTS_AT_END)
++def test_c_parser_error_snippet_at_buffer_end_request(
++    loop: asyncio.AbstractEventLoop,
++    text: bytes,
++    snippet: bytes,
++) -> None:
++    protocol = mock.Mock()
++    parser = HttpRequestParserC(
++        protocol, loop, 2**16, max_line_size=8190, max_field_size=8190
++    )
++    protocol._parser = parser
++    assert snippet in text
++    with pytest.raises(http_exceptions.BadHttpMessage, match=re.escape(repr(snippet))):
++        parser.feed_data(text)
++
++
++@pytest.mark.skipif(NO_EXTENSIONS, reason="Only tests C parser.")
++@pytest.mark.parametrize("split", [1, 2, 3, 5])
++@pytest.mark.parametrize(("body", "snippet", "reason"), _BAD_CHUNKED_RESPONSES)
++async def test_c_parser_error_snippet_fragmented_response(
++    body: bytes, snippet: bytes, reason: str, split: int
++) -> None:
++    # Feed the malformed body in two pieces so the second feed runs through the
++    # tail-prepend path before the error is reported; the parser must report a clean
++    # error rather than reading past the buffer. The snippet offset shifts with the
++    # split, so pin the stable llhttp reason instead.
++    loop = asyncio.get_running_loop()
++    protocol = mock.Mock()
++    response = HttpResponseParserC(
++        protocol, loop, 2**16, max_line_size=8190, max_field_size=8190
++    )
++    protocol._parser = response
++    response.feed_data(_CHUNKED_RESP_HDR)
++    with pytest.raises(http_exceptions.BadHttpMessage, match=re.escape(reason)):
++        response.feed_data(body[:split])
++        response.feed_data(body[split:])
++
++
+ async def test_http_response_parser_notchunked(response) -> None:
+     text = b"HTTP/1.1 200 OK\r\nTransfer-Encoding: notchunked\r\n\r\n1\r\nT\r\n3\r\nest\r\n0\r\n\r\n"
+     messages, upgrade, tail = response.feed_data(text)
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 417760c9ca..bd5b5fe4d9 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -21,6 +21,7 @@ SRC_URI += " \
     file://CVE-2026-54273_p2.patch \
     file://CVE-2026-59881.patch \
     file://CVE-2026-69243.patch \
+    file://CVE-2026-69244.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6


