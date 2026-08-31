Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1283FC624C8
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 04:57:52 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22957.1788152269275233289
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 21:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=f6F+eVjv;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8351; q=dns/txt;
  s=iport01; t=1788152269; x=1789361869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LEs985LE3WRjSvdleMTa3lNSEc2CXA7+w/sYRat5l7Q=;
  b=f6F+eVjvhC9mmqr34GerUvaZ+zHF6GtSMwkrqKjfrVnPAH+6G0uKjxYT
   NZZ5L6m5C1uwb2zSmZrWIe2A7in5ILOWbKCQVyYxdtplAZl7U08/ICFfH
   VbzvzzA+2NeBHxj011y7JQy1JF87iVpRElzRAjvSklWZ55Ww/OtStYd6F
   PNJQNEvF0L+9mXbdMJnFhug/OB1oazmv1QF1qixORepeTBlQaKE6L5kBa
   jhBsEFofcgopEXIKIiNT7A1VOA2CqTCEOnpaRxYhCWexv0SaodR7yd1qL
   /ycknPjeZfWjjWaOGUM72hmTf8IxO3rCKSOZBzwpGKLyyhe9iVvhVvgoI
   Q==;
X-CSE-ConnectionGUID: g95PSEaVQ8Kw2U6XGcAKgg==
X-CSE-MsgGUID: SotVk6j+QHm30PxzyB7MNg==
X-IPAS-Result: =?us-ascii?q?A0BLAgAsCZVq/5UQJK1aHgEBCxIMggULgld0XkNJhFeRc?=
 =?us-ascii?q?wOeG4F+DwEBAQ9EDQQBAYQ/RgKNcwImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMECwEYAS0QHAMBAgMCJgICKyMIEAmDA?=
 =?us-ascii?q?gGCdAMRwgF6fzOBAYMoAT8CQ1DbMAELFAGBCi6FP4MfAYUCXRgBhHwnGxuBc?=
 =?us-ascii?q?oQIdoEFgVwBAYU7gmoEgiKBDIFaHpIBSIECHANZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPhc1WBsGBYEdgSiEDyMZNnqBCV6BKylgARIXgQmCCAKCWoIFAgFJQ?=
 =?us-ascii?q?w4HR1MJBAsYDUgRLDcVGQQ9AW4HjnofgksBgQ0BKgEXgX0pEZNYkXyhDwoog?=
 =?us-ascii?q?3aMIpU6GjOqbAuYfY4KlgBQhGmBaDyBRwsHcBWDIglKGQ+OKg4Lg2CBf8o6J?=
 =?us-ascii?q?zICCTIBAQcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:zQ8YJKzfA93y0ajmDVJ6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUFm
 mEdWW/UbPjeazb1KdxwYIywoRkAvZDWy9JgSgo9+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaTpMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJE5nYLUj1+9JODFt6
 qYldgAiZTmgiO3jldpXSsE07igiBMDvOIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiRC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+Oi3a4aJJoLUHa25mG6jo
 X74/Dr7QSg6MYfH8SqX41jzo8nAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:d28VO6mVu2P/h0MA4q/Thn1nH3rpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726TtN9xYgBGpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdAUrsD0WKK+VSJcEfDH6xmpM
 JdmsNFZuEYY2IXsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: =?us-ascii?q?9a23=3A1adXZWnFAM1Ak/7g1CXRGeDL3UrXOXKMkU/rDka?=
 =?us-ascii?q?GMDZKV+eoF2+/84pHnMU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxoeM/A9QIgLXG9o65bZdN1OQf/xv/5qtVkJOqLU?=
 =?us-ascii?q?D4JG8JT5hEWi4qjviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="823444660"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 04:57:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 37DAD18000149;
	Mon, 31 Aug 2026 04:57:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C5E16CCD9B2; Sun, 30 Aug 2026 21:57:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 1/9] python3-aiohttp: fix CVE-2025-69224
Date: Sun, 30 Aug 2026 21:57:36 -0700
Message-Id: <20260831045744.3321483-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260831045744.3321483-1-dkelaiya@cisco.com>
References: <20260831045744.3321483-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 04:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129602

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix commits shown in
[1] and [2]. The advisory identifying the fix is referenced in
[3].

The generated aiohttp/_http_parser.c changes are omitted. Add
python3-cython-native and regenerate the C source from the patched
_http_parser.pyx during do_configure.

[1] https://github.com/aio-libs/aiohttp/commit/32677f2adfd907420c078dda6b79225c6f4ebce0
[2] https://github.com/aio-libs/aiohttp/commit/5affd64f86d28a16a8f8e6fea2d217c99bf7831f
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-69224

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2025-69224.patch      | 161 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |  10 ++
 2 files changed, 171 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
new file mode 100644
index 0000000000..d1a830e077
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
@@ -0,0 +1,161 @@
+From 4c27b675ef3d1c5b3b0f379525be575ec0d8d15e Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 3 Jan 2026 00:02:45 +0000
+Subject: [PATCH] Reject non-ascii characters in some headers (#11886) (#11902)
+
+CVE: CVE-2025-69224
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/32677f2adfd907420c078dda6b79225c6f4ebce0]
+
+Backport Changes:
+- Adapted the pure-Python `Transfer-Encoding` validation inline because
+  aiohttp 3.9.5 lacks the upstream `_is_chunked_te()` call path.
+- Backported the request/response upgrade distinction needed to apply the
+  non-ASCII request-header check while preserving CONNECT and HTTP 101
+  response handling.
+- Added the `ALLOWED_UPGRADES` definition from upstream prerequisite commit
+  c99a1e27375285149ea82cbdcc2f2c40e57596dc because aiohttp 3.9.5
+  predates it and the Cython parser otherwise fails to compile.
+- Retained aiohttp 3.9.5's supported `gzip`, `deflate`, and `br` content
+  encodings; omitted upstream zstd-specific code and test context because
+  this version lacks zstd decompression support.
+- Retained target-compatible `Any` test annotations because the older test
+  module does not import `HttpRequestParser`.
+
+(cherry picked from commit 5affd64f86d28a16a8f8e6fea2d217c99bf7831f)
+(cherry picked from commit 32677f2adfd907420c078dda6b79225c6f4ebce0)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/_http_parser.pyx  | 18 +++++++++++++-----
+ aiohttp/http_parser.py    |  8 +++++---
+ tests/test_http_parser.py | 32 ++++++++++++++++++++++++++++++--
+ 3 files changed, 48 insertions(+), 10 deletions(-)
+
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 7ea9b32ca..f1c130395 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -47,6 +47,7 @@ include "_headers.pxi"
+ 
+ from aiohttp cimport _find_header
+ 
++ALLOWED_UPGRADES = frozenset({"websocket"})
+ DEF DEFAULT_FREELIST_SIZE = 250
+ 
+ cdef extern from "Python.h":
+@@ -425,8 +426,14 @@ cdef class HttpParser:
+         raw_headers = tuple(self._raw_headers)
+         headers = CIMultiDictProxy(self._headers)
+ 
+-        if upgrade or self._cparser.method == cparser.HTTP_CONNECT:
+-            self._upgraded = True
++        if self._cparser.type == cparser.HTTP_REQUEST:
++            h_upg = headers.get("upgrade", "")
++            allowed = upgrade and h_upg.isascii() and h_upg.lower() in ALLOWED_UPGRADES
++            if allowed or self._cparser.method == cparser.HTTP_CONNECT:
++                self._upgraded = True
++        else:
++            if upgrade and self._cparser.status_code == 101:
++                self._upgraded = True
+ 
+         # do not support old websocket spec
+         if SEC_WEBSOCKET_KEY1 in headers:
+@@ -436,9 +443,10 @@ cdef class HttpParser:
+         enc = self._content_encoding
+         if enc is not None:
+             self._content_encoding = None
+-            enc = enc.lower()
+-            if enc in ('gzip', 'deflate', 'br'):
+-                encoding = enc
++            if enc.isascii():
++                enc = enc.lower()
++                if enc in ('gzip', 'deflate', 'br'):
++                    encoding = enc
+ 
+         if self._cparser.type == cparser.HTTP_REQUEST:
+             msg = _new_request_message(
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 0a80c5c6d..5768bd623 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -232,7 +232,9 @@ class HeadersParser:
+ 
+ def _is_supported_upgrade(headers: CIMultiDictProxy[str]) -> bool:
+     """Check if the upgrade header is supported."""
+-    return headers.get(hdrs.UPGRADE, "").lower() in {"tcp", "websocket"}
++    u = headers.get(hdrs.UPGRADE, "")
++    # .lower() can transform non-ascii characters.
++    return u.isascii() and u.lower() in {"tcp", "websocket"}
+ 
+ 
+ class HttpParser(abc.ABC, Generic[_MsgT]):
+@@ -542,7 +544,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+ 
+         # encoding
+         enc = headers.get(hdrs.CONTENT_ENCODING)
+-        if enc:
++        if enc and enc.isascii():
+             enc = enc.lower()
+             if enc in ("gzip", "deflate", "br"):
+                 encoding = enc
+@@ -550,7 +552,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+         # chunking
+         te = headers.get(hdrs.TRANSFER_ENCODING)
+         if te is not None:
+-            if "chunked" == te.lower():
++            if te.isascii() and "chunked" == te.lower():
+                 chunked = True
+             else:
+                 raise BadHttpMessage("Request has invalid `Transfer-Encoding`")
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 2f34f0bc0..021b6e4ae 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -482,6 +482,20 @@ def test_request_chunked(parser) -> None:
+     assert isinstance(payload, streams.StreamReader)
+ 
+ 
++def test_te_header_non_ascii(parser: Any) -> None:
++    # K = Kelvin sign, not valid ascii.
++    text = "GET /test HTTP/1.1\r\nTransfer-Encoding: chunKed\r\n\r\n"
++    with pytest.raises(http_exceptions.BadHttpMessage):
++        parser.feed_data(text.encode())
++
++
++def test_upgrade_header_non_ascii(parser: Any) -> None:
++    # K = Kelvin sign, not valid ascii.
++    text = "GET /test HTTP/1.1\r\nUpgrade: websocKet\r\n\r\n"
++    messages, upgrade, tail = parser.feed_data(text.encode())
++    assert not upgrade
++
++
+ def test_request_te_chunked_with_content_length(parser: Any) -> None:
+     text = (
+         b"GET /test HTTP/1.1\r\n"
+@@ -555,8 +569,22 @@ def test_compression_brotli(parser) -> None:
+     assert msg.compression == "br"
+ 
+ 
+-def test_compression_unknown(parser) -> None:
+-    text = b"GET /test HTTP/1.1\r\n" b"content-encoding: compress\r\n\r\n"
++@pytest.mark.parametrize(
++    "enc",
++    (
++        "deﬂate".encode(),  # "ﬂ".upper() == "FL"
++    ),
++)
++def test_compression_non_ascii(parser: Any, enc: bytes) -> None:
++    text = b"GET /test HTTP/1.1\r\ncontent-encoding: " + enc + b"\r\n\r\n"
++    messages, upgrade, tail = parser.feed_data(text)
++    msg = messages[0][0]
++    # Non-ascii input should not evaluate to a valid encoding scheme.
++    assert msg.compression is None
++
++
++def test_compression_unknown(parser: Any) -> None:
++    text = b"GET /test HTTP/1.1\r\ncontent-encoding: compress\r\n\r\n"
+     messages, upgrade, tail = parser.feed_data(text)
+     msg = messages[0][0]
+     assert msg.compression is None
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 84a9f2e668..ffdc25791b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "edea7d15772ceeb29db4aff55e482d4bcfb6ae160ce144f2682de02f6d
 
 SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2025-53643.patch \
+           file://CVE-2025-69224.patch \
            file://CVE-2025-69225.patch \
            file://CVE-2025-69226.patch \
            file://CVE-2025-69228.patch \
@@ -16,6 +17,15 @@ SRC_URI += "file://CVE-2024-52304.patch \
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
 
+DEPENDS += "python3-cython-native"
+
+do_configure:prepend() {
+    cython3 -3 -Werror \
+        -I ${S}/aiohttp \
+        -o ${S}/aiohttp/_http_parser.c \
+        ${S}/aiohttp/_http_parser.pyx
+}
+
 RDEPENDS:${PN} = "\
     python3-aiohappyeyeballs \
     python3-aiosignal \
-- 
2.35.6


