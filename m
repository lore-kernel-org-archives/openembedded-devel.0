Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAACCA5FAE
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:42 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63550.1790617413037125375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=i/c4CJoF;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=17517; q=dns/txt;
  s=iport01; t=1790617413; x=1791827013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ItbZtDmn/uCrjFyegp2dHQcKuIrnWCKNE8Qswv1JF4I=;
  b=i/c4CJoFbaQR77tQ+WrKPvJ38jwYmfd5Fgtrhp0cV45adNyOgURUO9GX
   PHtxqJgvkUhWlcZIbyyehyXy+TWyL6wvXm8qPDkIngvh+bICAXUTpA1RE
   BfB2a1eWS0bWIiRXADrL8lkylQe0KbqshL8WVc0cwS1a+Q0VuXTZZ490u
   fDuBjWsK9df02uIygrPMVEpVDu106xNEIULY96XMxKU5Q3FIXGmNa7EjO
   lwFWKtEbstGL9grRzb4Njw1NQzTjNZ2H6aA3xmnDHdIsm+nMhrWlu7ahu
   GOo3kjnN7p+V4cbihJXqVxe43sIIL1e87qwItQmuxANrNH2+RRIc8KpL3
   w==;
X-CSE-ConnectionGUID: S4JTaBgwS3mzBtBMPjXdag==
X-CSE-MsgGUID: nqeP6IAqTxaJQ0YaueZ+gQ==
X-IPAS-Result: =?us-ascii?q?A0AaAAC9prpq/43/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJhFeIG4lYA4tkhWWMUYF+DwEBAQ9EDQQBAYQ/RgKOCQImN?=
 =?us-ascii?q?AkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMjB?=
 =?us-ascii?q?AsBGAEtEBwDAQIDAiYCAiALIwgQCYMCAYI6AzcDEcJFen8zgQGDKQE/AkNQ2?=
 =?us-ascii?q?EsNgloBCxQBgQouAYU/gn8gAYUDXRgBhHwnGxuBcoEVg2mBBYEaQgEBAoFGg?=
 =?us-ascii?q?3OCagSCIoEMgVqBA5JASIECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPhcvW?=
 =?us-ascii?q?BsGBYEdgSCCGSMZNnqBCV6BKylgARAXgQeCBwKCVIIBAgFJQw4HRVMJJUEKE?=
 =?us-ascii?q?kcmIggSCQETGjALgSE4QQkoERgNSBEsNxUZBD0BbgeQLh6BdGoHAYENARsOA?=
 =?us-ascii?q?QEXC12BFRgGFgKTLSUKj1uCIYE1nmlxCiiDdowijz6FfBozhVulFAuYfY4Kh?=
 =?us-ascii?q?AmRKzQYUIRpgWg8OYEOCwdwFTuCZwlKGQ+BHI0PDguDYIF/gxTHJicyAgEIM?=
 =?us-ascii?q?gEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:uOaeDK3n7RaoBjTycfbD5YNwkn2cJEfYwER7XKvMYLTBsI5bpzYPn
 DMeX2vQM/fcNGOmfYxxOo6wp0tT75SGyd83Slc93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7g28uYjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNx0UAYQy9flMWmRc3
 +AyDQgPXhyKiLfjqF67YrEEasULNsLnOsYb/3pn1zycVapgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiZC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OW3YIePIIDQHq25mG6ev
 2/+oUXQGy0KPf6mkQuM73+exeD2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:f7vbZK6+ywJAKEnMoQPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 aTdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AobLozWm7uTWV85fvidufpGdO9/TXOUaB7kvZCUC?=
 =?us-ascii?q?nMj1sWpeJY3qo+pNomsU7zg=3D=3D?=
X-Talos-MUID: 9a23:w1fgzQmOQLBBiGaJ6VmadnpkLcpQvYWHEXwdmLc/4/iNKCFCeDik2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="528522423"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id E0AC0180005C6;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 38E20CBF21E; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 05/13] python3-aiohttp: fix CVE-2026-34525
Date: Mon, 28 Sep 2026 10:43:15 -0700
Message-Id: <20260928174323.1810308-6-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130453

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix commits shown in
[1] and [2]. The advisory identifying the fix is referenced in
[3].

[1] https://github.com/aio-libs/aiohttp/commit/e00ca3cca92c465c7913c4beb763a72da9ed8349
[2] https://github.com/aio-libs/aiohttp/commit/53e2e6fc58b89c6185be7820bd2c9f40216b3000
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34525

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-34525_p1.patch   | 128 +++++++
 .../python3-aiohttp/CVE-2026-34525_p2.patch   | 331 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   2 +
 3 files changed, 461 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p1.patch
new file mode 100644
index 0000000000..d18479e540
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p1.patch
@@ -0,0 +1,128 @@
+From 4032dcab4b75e875cb81e9a8726214c38b66747a Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sun, 15 Mar 2026 13:58:08 +0000
+Subject: [PATCH] [PR #12240/345d2537 backport][3.13] Reject duplicate
+ singleton headers in C extension parser (#12241)
+
+**This is a backport of PR #12240 as merged into master
+(345d25371562dd56de099f1fcd5720e96c6e7702).**
+
+CVE: CVE-2026-34525
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/e00ca3cca92c465c7913c4beb763a72da9ed8349]
+
+Co-authored-by: Rodrigo Nogueira <rodrigo.b.nogueira@gmail.com>
+(cherry picked from commit e00ca3cca92c465c7913c4beb763a72da9ed8349)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12240.bugfix.rst  |  5 +++++
+ aiohttp/_http_parser.pyx  | 22 +++++++++++++++++++++
+ tests/test_http_parser.py | 41 +++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 68 insertions(+)
+ create mode 100644 CHANGES/12240.bugfix.rst
+
+diff --git a/CHANGES/12240.bugfix.rst b/CHANGES/12240.bugfix.rst
+new file mode 100644
+index 000000000..49508b3f5
+--- /dev/null
++++ b/CHANGES/12240.bugfix.rst
+@@ -0,0 +1,5 @@
++Rejected duplicate singleton headers (``Host``, ``Content-Type``,
++``Content-Length``, etc.) in the C extension HTTP parser to match
++the pure Python parser behavior, preventing potential host-based
++access control bypasses via parser differentials
++-- by :user:`rodrigobnogueira`.
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 213ce2f0c..bb7bf673d 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -72,6 +72,20 @@ cdef object StreamReader = _StreamReader
+ cdef object DeflateBuffer = _DeflateBuffer
+ 
+ 
++# https://www.rfc-editor.org/rfc/rfc9110.html#section-5.5-6
++cdef tuple SINGLETON_HEADERS = (
++    hdrs.CONTENT_LENGTH,
++    hdrs.CONTENT_LOCATION,
++    hdrs.CONTENT_RANGE,
++    hdrs.CONTENT_TYPE,
++    hdrs.ETAG,
++    hdrs.HOST,
++    hdrs.MAX_FORWARDS,
++    hdrs.SERVER,
++    hdrs.TRANSFER_ENCODING,
++    hdrs.USER_AGENT,
++)
++
+ cdef inline object extend(object buf, const char* at, size_t length):
+     cdef Py_ssize_t s
+     cdef char* ptr
+@@ -438,6 +452,14 @@ cdef class HttpParser:
+         raw_headers = tuple(self._raw_headers)
+         headers = CIMultiDictProxy(self._headers)
+ 
++        # https://www.rfc-editor.org/rfc/rfc9110.html#name-collected-abnf
++        bad_hdr = next(
++            (h for h in SINGLETON_HEADERS if len(headers.getall(h, ())) > 1),
++            None,
++        )
++        if bad_hdr is not None:
++            raise BadHttpMessage(f"Duplicate '{bad_hdr}' header found.")
++
+         if self._cparser.type == cparser.HTTP_REQUEST:
+             h_upg = headers.get("upgrade", "")
+             allowed = upgrade and h_upg.isascii() and h_upg.lower() in ALLOWED_UPGRADES
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index be7446e0a..b0a282f3e 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -263,6 +263,47 @@ def test_content_length_transfer_encoding(parser: Any) -> None:
+         parser.feed_data(text)
+ 
+ 
++@pytest.mark.parametrize(
++    "hdr",
++    (
++        "Content-Length",
++        "Content-Location",
++        "Content-Range",
++        "Content-Type",
++        "ETag",
++        "Host",
++        "Max-Forwards",
++        "Server",
++        "Transfer-Encoding",
++        "User-Agent",
++    ),
++)
++def test_duplicate_singleton_header_rejected(
++    parser: HttpRequestParser, hdr: str
++) -> None:
++    val1, val2 = ("1", "2") if hdr == "Content-Length" else ("value1", "value2")
++    text = (
++        f"GET /test HTTP/1.1\r\n"
++        f"Host: example.com\r\n"
++        f"{hdr}: {val1}\r\n"
++        f"{hdr}: {val2}\r\n"
++        f"\r\n"
++    ).encode()
++    with pytest.raises(http_exceptions.BadHttpMessage, match="Duplicate"):
++        parser.feed_data(text)
++
++
++def test_duplicate_host_header_rejected(parser: HttpRequestParser) -> None:
++    text = (
++        b"GET /admin HTTP/1.1\r\n"
++        b"Host: admin.example\r\n"
++        b"Host: public.example\r\n"
++        b"\r\n"
++    )
++    with pytest.raises(http_exceptions.BadHttpMessage, match="Duplicate.*Host"):
++        parser.feed_data(text)
++
++
+ def test_bad_chunked_py(loop: Any, protocol: Any) -> None:
+     """Test that invalid chunked encoding doesn't allow content-length to be used."""
+     parser = HttpRequestParserPy(
+
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p2.patch
new file mode 100644
index 0000000000..57fa7e43a9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p2.patch
@@ -0,0 +1,331 @@
+From 285d606756b2de628b957ac8792ce8f0539ec6f6 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Tue, 31 Mar 2026 10:34:37 -1000
+Subject: [PATCH] [PR #12302/2dc02ee0 backport][3.13] Skip duplicate singleton
+ header check in lax mode (#12303)
+
+Co-authored-by: J. Nick Koston <nick@koston.org>
+Co-authored-by: pre-commit-ci[bot] <66853113+pre-commit-ci[bot]@users.noreply.github.com>
+Fixes home-assistant/core#166956
+Fixes https://github.com/getmoto/moto/issues/9930
+Fixes #12301
+Fixes https://github.com/catalyst-cooperative/pudl-archiver/issues/1059
+
+CVE: CVE-2026-34525
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/53e2e6fc58b89c6185be7820bd2c9f40216b3000]
+
+(cherry picked from commit 53e2e6fc58b89c6185be7820bd2c9f40216b3000)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12302.bugfix.rst  |  3 ++
+ aiohttp/_http_parser.pyx  | 27 ++++++-----
+ aiohttp/http_parser.py    | 40 ++++++++--------
+ tests/test_http_parser.py | 97 ++++++++++++++++++++++++++++++++++++---
+ 4 files changed, 131 insertions(+), 36 deletions(-)
+ create mode 100644 CHANGES/12302.bugfix.rst
+
+diff --git a/CHANGES/12302.bugfix.rst b/CHANGES/12302.bugfix.rst
+new file mode 100644
+index 000000000..fe9e8fbd6
+--- /dev/null
++++ b/CHANGES/12302.bugfix.rst
+@@ -0,0 +1,3 @@
++Skipped the duplicate singleton header check in lax mode (the default for response
++parsing). In strict mode (request parsing, or ``-X dev``), all RFC 9110 singletons
++are still enforced -- by :user:`bdraco`.
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index bb7bf673d..8e9ecae69 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -72,8 +72,11 @@ cdef object StreamReader = _StreamReader
+ cdef object DeflateBuffer = _DeflateBuffer
+ 
+ 
+-# https://www.rfc-editor.org/rfc/rfc9110.html#section-5.5-6
+-cdef tuple SINGLETON_HEADERS = (
++# RFC 9110 singleton headers — duplicates are rejected in strict mode.
++# In lax mode (response parser default), the check is skipped entirely
++# since real-world servers (e.g. Google APIs, Werkzeug) commonly send
++# duplicate headers like Content-Type or Server.
++cdef frozenset SINGLETON_HEADERS = frozenset({
+     hdrs.CONTENT_LENGTH,
+     hdrs.CONTENT_LOCATION,
+     hdrs.CONTENT_RANGE,
+@@ -84,7 +87,7 @@ cdef tuple SINGLETON_HEADERS = (
+     hdrs.SERVER,
+     hdrs.TRANSFER_ENCODING,
+     hdrs.USER_AGENT,
+-)
++})
+ 
+ cdef inline object extend(object buf, const char* at, size_t length):
+     cdef Py_ssize_t s
+@@ -304,6 +307,7 @@ cdef class HttpParser:
+         size_t _max_headers
+         bint _response_with_body
+         bint _read_until_eof
++        bint _lax
+ 
+         bint    _started
+         object  _url
+@@ -311,6 +315,7 @@ cdef class HttpParser:
+         str     _path
+         str     _reason
+         object  _headers
++        set     _seen_singletons
+         list    _raw_headers
+         bint    _upgraded
+         list    _messages
+@@ -377,6 +382,8 @@ cdef class HttpParser:
+         self._upgraded = False
+         self._auto_decompress = auto_decompress
+         self._content_encoding = None
++        self._lax = False
++        self._seen_singletons = set()
+ 
+         self._csettings.on_url = cb_on_url
+         self._csettings.on_status = cb_on_status
+@@ -407,6 +414,10 @@ cdef class HttpParser:
+             if "\x00" in value:
+                 raise InvalidHeader(raw_value)
+ 
++            if not self._lax and name in SINGLETON_HEADERS:
++                if name in self._seen_singletons:
++                    raise BadHttpMessage(f"Duplicate '{name}' header found.")
++                self._seen_singletons.add(name)
+             self._headers.add(name, value)
+             if len(self._headers) > self._max_headers:
+                 raise BadHttpMessage("Too many headers received")
+@@ -452,14 +463,6 @@ cdef class HttpParser:
+         raw_headers = tuple(self._raw_headers)
+         headers = CIMultiDictProxy(self._headers)
+ 
+-        # https://www.rfc-editor.org/rfc/rfc9110.html#name-collected-abnf
+-        bad_hdr = next(
+-            (h for h in SINGLETON_HEADERS if len(headers.getall(h, ())) > 1),
+-            None,
+-        )
+-        if bad_hdr is not None:
+-            raise BadHttpMessage(f"Duplicate '{bad_hdr}' header found.")
+-
+         if self._cparser.type == cparser.HTTP_REQUEST:
+             h_upg = headers.get("upgrade", "")
+             allowed = upgrade and h_upg.isascii() and h_upg.lower() in ALLOWED_UPGRADES
+@@ -695,6 +698,7 @@ cdef class HttpResponseParser(HttpParser):
+             cparser.llhttp_set_lenient_headers(self._cparser, 1)
+             cparser.llhttp_set_lenient_optional_cr_before_lf(self._cparser, 1)
+             cparser.llhttp_set_lenient_spaces_after_chunk_size(self._cparser, 1)
++            self._lax = True
+ 
+     cdef object _on_status_complete(self):
+         if self._buf:
+@@ -708,6 +712,7 @@ cdef int cb_on_message_begin(cparser.llhttp_t* parser) except -1:
+ 
+     pyparser._started = True
+     pyparser._headers = CIMultiDict()
++    pyparser._seen_singletons = set()
+     pyparser._raw_headers = []
+     PyByteArray_Resize(pyparser._buf, 0)
+     pyparser._path = None
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index a7fec7f01..4d7931ef6 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -87,6 +87,26 @@ VERSRE: Final[Pattern[str]] = re.compile(r"HTTP/(\d)\.(\d)", re.ASCII)
+ DIGITS: Final[Pattern[str]] = re.compile(r"\d+", re.ASCII)
+ HEXDIGITS: Final[Pattern[bytes]] = re.compile(rb"[0-9a-fA-F]+")
+ 
++# RFC 9110 singleton headers — duplicates are rejected in strict mode.
++# In lax mode (response parser default), the check is skipped entirely
++# since real-world servers (e.g. Google APIs, Werkzeug) commonly send
++# duplicate headers like Content-Type or Server.
++# Lowercased for case-insensitive matching against wire names.
++SINGLETON_HEADERS: Final[frozenset[str]] = frozenset(
++    {
++        "content-length",
++        "content-location",
++        "content-range",
++        "content-type",
++        "etag",
++        "host",
++        "max-forwards",
++        "server",
++        "transfer-encoding",
++        "user-agent",
++    }
++)
++
+ 
+ class RawRequestMessage(NamedTuple):
+     method: str
+@@ -216,6 +236,8 @@ class HeadersParser:
+             elif _FIELD_VALUE_FORBIDDEN_CTL_RE.search(value):
+                 raise InvalidHeader(bvalue)
+ 
++            if not self._lax and name in headers and name.lower() in SINGLETON_HEADERS:
++                raise BadHttpMessage(f"Duplicate '{name}' header found.")
+             headers.add(name, value)
+             raw_headers.append((bname, bvalue))
+ 
+@@ -526,24 +548,6 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+         upgrade = False
+         chunked = False
+ 
+-        # https://www.rfc-editor.org/rfc/rfc9110.html#section-5.5-6
+-        # https://www.rfc-editor.org/rfc/rfc9110.html#name-collected-abnf
+-        singletons = (
+-            hdrs.CONTENT_LENGTH,
+-            hdrs.CONTENT_LOCATION,
+-            hdrs.CONTENT_RANGE,
+-            hdrs.CONTENT_TYPE,
+-            hdrs.ETAG,
+-            hdrs.HOST,
+-            hdrs.MAX_FORWARDS,
+-            hdrs.SERVER,
+-            hdrs.TRANSFER_ENCODING,
+-            hdrs.USER_AGENT,
+-        )
+-        bad_hdr = next((h for h in singletons if len(headers.getall(h, ())) > 1), None)
+-        if bad_hdr is not None:
+-            raise BadHttpMessage(f"Duplicate '{bad_hdr}' header found.")
+-
+         # keep-alive
+         conn = headers.get(hdrs.CONNECTION)
+         if conn:
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index b0a282f3e..3e1f7dfaa 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -267,32 +267,76 @@ def test_content_length_transfer_encoding(parser: Any) -> None:
+     "hdr",
+     (
+         "Content-Length",
++        "Host",
++        "Transfer-Encoding",
++    ),
++)
++def test_duplicate_singleton_header_rejected(
++    parser: HttpRequestParser, hdr: str
++) -> None:
++    val1, val2 = ("1", "2") if hdr == "Content-Length" else ("value1", "value2")
++    text = (
++        f"GET /test HTTP/1.1\r\n"
++        f"Host: example.com\r\n"
++        f"{hdr}: {val1}\r\n"
++        f"{hdr}: {val2}\r\n"
++        "\r\n"
++    ).encode()
++    with pytest.raises(http_exceptions.BadHttpMessage, match="Duplicate"):
++        parser.feed_data(text)
++
++
++@pytest.mark.parametrize(
++    "hdr",
++    (
+         "Content-Location",
+         "Content-Range",
+         "Content-Type",
+         "ETag",
+-        "Host",
+         "Max-Forwards",
+         "Server",
+-        "Transfer-Encoding",
+         "User-Agent",
+     ),
+ )
+-def test_duplicate_singleton_header_rejected(
++def test_duplicate_non_security_singleton_header_rejected_strict(
+     parser: HttpRequestParser, hdr: str
+ ) -> None:
+-    val1, val2 = ("1", "2") if hdr == "Content-Length" else ("value1", "value2")
++    """Non-security singletons are rejected in strict mode (requests)."""
+     text = (
+         f"GET /test HTTP/1.1\r\n"
+         f"Host: example.com\r\n"
+-        f"{hdr}: {val1}\r\n"
+-        f"{hdr}: {val2}\r\n"
+-        f"\r\n"
++        f"{hdr}: value1\r\n"
++        f"{hdr}: value2\r\n"
++        "\r\n"
+     ).encode()
+     with pytest.raises(http_exceptions.BadHttpMessage, match="Duplicate"):
+         parser.feed_data(text)
+ 
+ 
++@pytest.mark.parametrize(
++    "hdr",
++    (
++        # Content-Length is excluded because llhttp rejects duplicates
++        # at the C level before our singleton check runs.
++        "Content-Location",
++        "Content-Range",
++        "Content-Type",
++        "ETag",
++        "Max-Forwards",
++        "Server",
++        "Transfer-Encoding",
++        "User-Agent",
++    ),
++)
++def test_duplicate_singleton_header_accepted_in_lax_mode(
++    response: HttpResponseParser, hdr: str
++) -> None:
++    """All singleton duplicates are accepted in lax mode (response parser default)."""
++    text = (f"HTTP/1.1 200 OK\r\n{hdr}: value1\r\n{hdr}: value2\r\n\r\n").encode()
++    messages, upgrade, tail = response.feed_data(text)
++    assert len(messages) == 1
++
++
+ def test_duplicate_host_header_rejected(parser: HttpRequestParser) -> None:
+     text = (
+         b"GET /admin HTTP/1.1\r\n"
+@@ -304,6 +348,45 @@ def test_duplicate_host_header_rejected(parser: HttpRequestParser) -> None:
+         parser.feed_data(text)
+ 
+ 
++@pytest.mark.parametrize(
++    ("hdr1", "hdr2"),
++    (
++        ("content-length", "Content-Length"),
++        ("Content-Length", "content-length"),
++        ("transfer-encoding", "Transfer-Encoding"),
++        ("Transfer-Encoding", "transfer-encoding"),
++    ),
++)
++def test_duplicate_singleton_header_different_casing_rejected(
++    parser: HttpRequestParser, hdr1: str, hdr2: str
++) -> None:
++    """Singleton check must be case-insensitive per RFC 9110."""
++    val1, val2 = ("1", "2") if "content-length" in hdr1.lower() else ("v1", "v2")
++    text = (
++        f"GET /test HTTP/1.1\r\n"
++        f"Host: example.com\r\n"
++        f"{hdr1}: {val1}\r\n"
++        f"{hdr2}: {val2}\r\n"
++        "\r\n"
++    ).encode()
++    with pytest.raises(http_exceptions.BadHttpMessage, match="Duplicate"):
++        parser.feed_data(text)
++
++
++def test_duplicate_host_header_different_casing_rejected(
++    parser: HttpRequestParser,
++) -> None:
++    """Duplicate Host with different casing must also be rejected."""
++    text = (
++        b"GET /test HTTP/1.1\r\n"
++        b"host: evil.example\r\n"
++        b"Host: good.example\r\n"
++        b"\r\n"
++    )
++    with pytest.raises(http_exceptions.BadHttpMessage, match="Duplicate"):
++        parser.feed_data(text)
++
++
+ def test_bad_chunked_py(loop: Any, protocol: Any) -> None:
+     """Test that invalid chunked encoding doesn't allow content-length to be used."""
+     parser = HttpRequestParserPy(
+
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index b7741d5ed4..921dc01dc3 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -25,6 +25,8 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-34516.patch \
            file://CVE-2026-34517.patch \
            file://CVE-2026-34520.patch \
+           file://CVE-2026-34525_p1.patch \
+           file://CVE-2026-34525_p2.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


