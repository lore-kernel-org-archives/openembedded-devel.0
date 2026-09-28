Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1F2CA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:41 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63553.1790617415702148386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZlRjhAGG;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6972; q=dns/txt;
  s=iport01; t=1790617416; x=1791827016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IvgBmqVbDjGS+4nZ47XCiI5773wfZMJQolizsBkXylY=;
  b=ZlRjhAGG+5fk6Al+XIUsEuKU9U5X+xrQekNFkXPs5RHj5D8FUQGO8LD0
   LzjBa/zfSH5KsN7gJBaYYpW+bJigmjTJjZxK/EPFvalsjAJnx48CnJeKB
   P0Q72U5/N2f2fMtIpqg7qBJDda0Nw+z5skzeKYi+KRHNcNUpWSclnqEeN
   jUl1oeI3y73YX+1BRhuAy2nTcDHkZ7Eb8wR5DeqWqd6kpjBqQiVgjTcPP
   xyPb5Dr1oLOW93N195e9ZuSYFVKiaemrq3ZJFMBAjRZfyXDF38Ft97u1P
   MqWICfgPvDxoKRg+BJEii8veyhbML4hVNdjMhSJjWmKdpUIJ6EUdb2Ae3
   w==;
X-CSE-ConnectionGUID: oflYzhynTWq1x/rNBYBDGA==
X-CSE-MsgGUID: 1qbt077jQQmR/FmzKbOYFg==
X-IPAS-Result: =?us-ascii?q?A0AaAAC9prpq/47/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJhFeIG4lYA4tkkjaBfg8BAQEPRA0EAQGEP0YCjgkCJjQJD?=
 =?us-ascii?q?gECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDIwQLA?=
 =?us-ascii?q?RgBLRAcAwECAwImAgIgCyMIGYMCAYI6AzcDEcJFen8zgQGDKQE/AkNQ2EsNg?=
 =?us-ascii?q?loBCxQBgQouAYU/gn8gAYUDXRgBhHwnGxuBcoQIdoEFgRpCAQECgSWEFIJqB?=
 =?us-ascii?q?IIigQyBWh6TJUiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XL1gbBgWBH?=
 =?us-ascii?q?YEgghkjGTZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVBChJHJiIIE?=
 =?us-ascii?q?gkBExowC4EhOEEJKBEYDUgRLDcVGQQ9AW4HkC4egmUBgQ0BKQEBgWwoNJNUj?=
 =?us-ascii?q?2WCIYE1nmlxCiiDdowijz6FfBozqm8LmH2OCoQJkXdQhGmBaDyBRwsHcBWDI?=
 =?us-ascii?q?glKGQ+OKw4Lg2CBf4MUxyYnMgIBCDIBAQcCBw4DC4FokAACJgeBTwEB?=
IronPort-Data: A9a23:6iFWL61Bl/do0cxnlfbD5YBwkn2cJEfYwER7XKvMYLTBsI5bpzNRn
 DROWGmPPvuKZGOnft52aoSxpk1QusLQxoNqSgo53Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7g28uYjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGC08yDJ8Y6+BLPngX5
 bsCDho8RDysrrfjqF67YrEEasULNsLnOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiaC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OW3aIaPIILQFK25mG7Bv
 2japzumACgjMebY5z+X0XiLt8HAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEqt94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:06yLZayiICN3wVywS8tRKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+sjztCWE7wr5N0tApTntAsS9qDbnhPxICOoqTNOftXfd2FdARbsKheCJ/9SjIVyaygc378
 ldmsZFZOEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:L1W8Qmwl2AzAdaFIs1Y4BgUTFMQUYH3MykvvOhaoTnxPYoy/ZXC5rfY=
X-Talos-MUID: 9a23:PHF8LQnn/DA8Sz0qnipydno7Lc10u/vxCnk0lK9BlcyWFiZXChmS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="520422629"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 8815518000377;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 340F5CBF204; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 04/13] python3-aiohttp: fix CVE-2026-34520
Date: Mon, 28 Sep 2026 10:43:14 -0700
Message-Id: <20260928174323.1810308-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130459

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1].
The CVE record is referenced in [2]. It also backports
the C-parser null-byte validation and adapts its
regression test from [3].

[1] https://github.com/aio-libs/aiohttp/commit/9370b9714a7a56003cacd31a9b4ae16eab109ba4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-34520
[3] https://github.com/aio-libs/aiohttp/commit/db560cfeab32aa35f3d06f7a24238bedc01ffe2b

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-34520.patch      | 121 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34520.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34520.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34520.patch
new file mode 100644
index 0000000000..2492a23a3d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34520.patch
@@ -0,0 +1,121 @@
+From 661f91935d061a3d7d554f2c808c8a14f3122991 Mon Sep 17 00:00:00 2001
+From: Rodrigo Nogueira <rodrigo.b.nogueira@gmail.com>
+Date: Wed, 11 Mar 2026 20:38:17 -0300
+Subject: [PATCH] [PR #12231/7043bc56 backport][3.13] Adjust header value
+ character checks to RFC 9110 (#12235)
+
+CVE: CVE-2026-34520
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/9370b9714a7a56003cacd31a9b4ae16eab109ba4]
+
+Backport Changes:
+- Included the C-parser null-byte validation from upstream prerequisite
+  commit db560cfeab32aa35f3d06f7a24238bedc01ffe2b because the Scarthgap
+  3.9.5 recipe patch stack does not contain that prerequisite.
+- Used the target's local `raw_value` bytes object when raising
+  `InvalidHeader`, since aiohttp 3.9.5 converts
+  `_raw_value` before checking.
+- Added a response-parser regression test for the C-parser validation.
+- Omitted the generated aiohttp/_http_parser.c changes because the
+  Scarthgap recipe regenerates this file from _http_parser.pyx with
+  Cython.
+
+Co-authored-by: rodrigo.nogueira <rodrigo.nogueira@prf.gov.br>
+(cherry picked from commit 9370b9714a7a56003cacd31a9b4ae16eab109ba4)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12231.bugfix.rst  |  2 ++
+ aiohttp/_http_parser.pyx  |  7 +++++++
+ aiohttp/http_parser.py    |  9 ++++++++-
+ tests/test_http_parser.py | 17 +++++++++++++++++
+ 4 files changed, 34 insertions(+), 1 deletion(-)
+ create mode 100644 CHANGES/12231.bugfix.rst
+
+diff --git a/CHANGES/12231.bugfix.rst b/CHANGES/12231.bugfix.rst
+new file mode 100644
+index 000000000..cd74bd1e7
+--- /dev/null
++++ b/CHANGES/12231.bugfix.rst
+@@ -0,0 +1,2 @@
++Adjusted pure-Python request header value validation to align with RFC 9110 control-character handling, while preserving lax response parser behavior, and added regression tests for Host/header control-character cases.
++-- by :user:`rodrigobnogueira`.
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index cc8b13cfb..496498d6f 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -387,5 +387,12 @@ cdef class HttpParser:
+             value = raw_value.decode('utf-8', 'surrogateescape')
+ 
++            # reject null bytes in header values - matches the Python parser
++            # check at http_parser.py. llhttp in lenient mode doesn't reject
++            # these itself, so we need to catch them here.
++            # ref: RFC 9110 section 5.5 (CTL chars forbidden in field values)
++            if "\x00" in value:
++                raise InvalidHeader(raw_value)
++
+             self._headers.add(name, value)
+             if len(self._headers) > self._max_headers:
+                 raise BadHttpMessage("Too many headers received")
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 95ac28252..a7fec7f01 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -73,6 +73,10 @@ ASCIISET: Final[Set[str]] = set(string.printable)
+ #     token = 1*tchar
+ _TCHAR_SPECIALS: Final[str] = re.escape("!#$%&'*+-.^_`|~")
+ TOKENRE: Final[Pattern[str]] = re.compile(f"[0-9A-Za-z{_TCHAR_SPECIALS}]+")
++# https://www.rfc-editor.org/rfc/rfc9110#section-5.5-5
++_FIELD_VALUE_FORBIDDEN_CTL_RE: Final[Pattern[str]] = re.compile(
++    r"[\x00-\x08\x0a-\x1f\x7f]"
++)
+ VERSRE: Final[Pattern[str]] = re.compile(r"HTTP/(\d)\.(\d)", re.ASCII)
+ DIGITS: Final[Pattern[str]] = re.compile(r"\d+", re.ASCII)
+ HEXDIGITS: Final[Pattern[bytes]] = re.compile(rb"[0-9a-fA-F]+")
+@@ -200,7 +204,10 @@ class HeadersParser:
+             value = bvalue.decode("utf-8", "surrogateescape")
+ 
+             # https://www.rfc-editor.org/rfc/rfc9110.html#section-5.5-5
+-            if "\n" in value or "\r" in value or "\x00" in value:
++            if self._lax:
++                if "\n" in value or "\r" in value or "\x00" in value:
++                    raise InvalidHeader(bvalue)
++            elif _FIELD_VALUE_FORBIDDEN_CTL_RE.search(value):
+                 raise InvalidHeader(bvalue)
+ 
+             headers.add(name, value)
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index cb562f598..be7446e0a 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -210,6 +210,9 @@ def test_bad_header_name(parser: Any, rfc9110_5_6_2_token_delim: str) -> None:
+         "Foo : bar",  # https://www.rfc-editor.org/rfc/rfc9112.html#section-5.1-2
+         "Foo\t: bar",
+         "\xffoo: bar",
++        "Foo: abc\x01def",  # CTL bytes forbidden per RFC 9110 §5.5
++        "Foo: abc\x7fdef",  # DEL is also a CTL byte
++        "Foo: abc\x1fdef",
+     ),
+ )
+ def test_bad_headers(parser: Any, hdr: str) -> None:
+@@ -218,6 +221,20 @@ def test_bad_headers(parser: Any, hdr: str) -> None:
+         parser.feed_data(text)
+ 
+ 
++def test_ctl_host_header_bad_characters(parser: HttpRequestParser) -> None:
++    """CTL byte in Host header must be rejected."""
++    text = b"GET /test HTTP/1.1\r\nHost: trusted.example\x01@bad.test\r\n\r\n"
++    with pytest.raises(http_exceptions.BadHttpMessage):
++        parser.feed_data(text)
++
++
++def test_null_byte_in_response_header_value(
++    response: HttpResponseParser,
++) -> None:
++    with pytest.raises(http_exceptions.InvalidHeader):
++        response.feed_data(b"HTTP/1.1 200 OK\r\nFoo: abc\x00def\r\n\r\n")
++
++
+ def test_unpaired_surrogate_in_header_py(loop: Any, protocol: Any) -> None:
+     parser = HttpRequestParserPy(
+         protocol,
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index fecf871d9f..b7741d5ed4 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-34519.patch \
            file://CVE-2026-34516.patch \
            file://CVE-2026-34517.patch \
+           file://CVE-2026-34520.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


