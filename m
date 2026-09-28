Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66FDCA5FB2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:43 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63550.1790617413037125375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WXIy20k+;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6230; q=dns/txt;
  s=iport01; t=1790617413; x=1791827013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NJgI3N3hU+VxxGmzLSIkBWT3+F9XS35G7F/XTuHEQck=;
  b=WXIy20k+qDCdPuO+ccVyjaJ05LiDVC/jtuFKAFBcPAKe3JZ1AjNmNRjU
   FeSztM8TKQzlfdMtOa3CFtJpYJFugMeJDH18AAU9SJcfVUL3z2paJFO0C
   i3sEogj+HoEwUBq3NdjikVRBmW+XIztl+CdjLuRORtJ2sfaONf5FVahwU
   3kDjD8ZEqurLTmLtWkYnWeQOz2odfHeUTiSUz9xJTG0+m6AQul9ZjPOgE
   vOnVGQgaCPke5ZWczQVWULvA3NKjaC/BLQ8gMzjIUgay7vkO0daZahUJi
   pae1+xQNZTl6w/fNNUhizEguxZXhoX25yn70vMuHG4fBxw3TFf4suQC3f
   g==;
X-CSE-ConnectionGUID: OTJdruwTRkePves2pxd9Mg==
X-CSE-MsgGUID: oH6/alXbSpC2nnCD8JMK7w==
X-IPAS-Result: =?us-ascii?q?A0A4AAC9prpq/4v/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YAoBOEmEV4gbiVgDnhqBfg8BAQEPRA0EAQGEP0YCjgkCJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDIwQLARgBLRAJE?=
 =?us-ascii?q?wMBAgMCJgICKyMIGYMCAYJ0AxGnIZsken8zgQGDKQE/AkNQ2zIBCxQBgQouA?=
 =?us-ascii?q?YU/gx8BhQNdGAGEfCcbG4FyglCBOHaBBYFcAQGBOIQDgmoEgiKBDIFak0NIg?=
 =?us-ascii?q?QIcA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+Fy9YGwYFgR2BIIIZIxk2eoEJX?=
 =?us-ascii?q?oErKWABEBeBB4IHAoJUggECAUlDDgdFUwklQQoSRyYiCBIJARMaMAuBIThBC?=
 =?us-ascii?q?SgRGA1IESw3FRkEPQFuB5AuHoJlgQ4BKgF7gRk0pVqhDwoog3aMIpU6GjOqb?=
 =?us-ascii?q?wuYfY4KlWgYUIRpgWg8gUcLB3AVgyIJShkPjisOC4NggX/KOicyAgkyAQEHA?=
 =?us-ascii?q?gcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:Zjoogalkk4GqLiYNYJbp8Iro5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbUW+AM/7ea2Ojeo13b9nl/BxX75CHmNMxSQVkr31jF1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDpFsfLb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Faok2OptHH5yz
 /8VEC4AdUqbl+7n5b3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIIIzXH58JxBrwS
 mTu+ESnRRgeBNak0RHf9HSHqr/tuACkR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:47vigK9g6LnecSk+4cJuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HJoB17726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:Kc211GxlOpc5sc6PUnl+BgUzJuIpaGDC8E3TLnemBH0zUK2ZGHqfrfY=
X-Talos-MUID: 9a23:7hKjiwr4UTAmmmYRuZUezzZCaoBh55SkM1gmy5MAkOXUFwlTZCjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="528522424"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id EC1CD1800023D;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 53D39CBEF6B; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 10/13] python3-aiohttp: fix CVE-2026-54277
Date: Mon, 28 Sep 2026 10:43:20 -0700
Message-Id: <20260928174323.1810308-11-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130450

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1]. The
advisory identifying the fix is referenced in [2].

The generated aiohttp/_http_parser.c changes are omitted. The
recipe-time Cython regeneration introduced with CVE-2025-69224
regenerates that file from the patched _http_parser.pyx before the
accelerated parser is compiled.

[1] https://github.com/aio-libs/aiohttp/commit/5ab61bb4cd88f19b712f12c7c9295fe262bf804d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-54277

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54277.patch      | 96 +++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch
new file mode 100644
index 0000000000..4042abe623
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch
@@ -0,0 +1,96 @@
+From 83788a36c646a1bdfba912267feab5db796a828e Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 7 Jun 2026 00:33:03 -0500
+Subject: [PATCH] [PR #12826/36df6c13 backport][3.14] Enforce max_line_size on
+ fragmented request target and reason in C parser (#12837)
+
+CVE: CVE-2026-54277
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/5ab61bb4cd88f19b712f12c7c9295fe262bf804d]
+
+Backport Changes:
+- Omitted generated `aiohttp/_http_parser.c` changes because the
+  Scarthgap recipe regenerates that file from `_http_parser.pyx`
+  during `do_configure`.
+- This fix depends on the max_line_size buffer logic introduced by
+  CVE-2026-22815. Keep CVE-2026-22815.patch earlier in SRC_URI.
+
+(cherry picked from commit 5ab61bb4cd88f19b712f12c7c9295fe262bf804d)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12826.bugfix.rst  |  1 +
+ aiohttp/_http_parser.pyx  |  4 ++--
+ tests/test_http_parser.py | 22 ++++++++++++++++++++++
+ 3 files changed, 25 insertions(+), 2 deletions(-)
+ create mode 100644 CHANGES/12826.bugfix.rst
+
+diff --git a/CHANGES/12826.bugfix.rst b/CHANGES/12826.bugfix.rst
+new file mode 100644
+index 000000000..7e095615d
+--- /dev/null
++++ b/CHANGES/12826.bugfix.rst
+@@ -0,0 +1 @@
++Fixed the C HTTP parser not enforcing ``max_line_size`` on a request target or response reason phrase that is split across multiple reads; each fragment was checked on its own, so an accumulated line could exceed the limit without raising ``LineTooLong``. The accumulated length is now checked, matching the pure-Python parser -- by :user:`bdraco`.
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 8e9ecae69..01a0f859c 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -718,7 +718,7 @@ cdef int cb_on_url(cparser.llhttp_t* parser,
+                    const char *at, size_t length) except -1:
+     cdef HttpParser pyparser = <HttpParser>parser.data
+     try:
+-        if length > pyparser._max_line_size:
++        if len(pyparser._buf) + length > pyparser._max_line_size:
+             status = pyparser._buf + at[:length]
+             raise LineTooLong(status[:100] + b"...", pyparser._max_line_size)
+         extend(pyparser._buf, at, length)
+@@ -733,7 +733,7 @@ cdef int cb_on_status(cparser.llhttp_t* parser,
+                       const char *at, size_t length) except -1:
+     cdef HttpParser pyparser = <HttpParser>parser.data
+     try:
+-        if length > pyparser._max_line_size:
++        if len(pyparser._buf) + length > pyparser._max_line_size:
+             reason = pyparser._buf + at[:length]
+             raise LineTooLong(reason[:100] + b"...", pyparser._max_line_size)
+         extend(pyparser._buf, at, length)
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 3e1f7dfaa..a724aae63 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -1161,6 +1161,17 @@ def test_http_request_max_status_line_under_limit(parser: HttpRequestParser) ->
+     assert msg.url == URL("/path" + path.decode())
+ 
+ 
++def test_http_request_max_status_line_fragmented(
++    parser: HttpRequestParser,
++) -> None:
++    # Split an overlong request target across reads so that each callback
++    # fragment is under the limit but the accumulated target is not.
++    match = "400, message:\n  Got more than 8190 bytes when reading"
++    with pytest.raises(http_exceptions.LineTooLong, match=match):
++        parser.feed_data(b"GET /" + b"a" * 8000)
++        parser.feed_data(b"a" * 8000 + b" HTTP/1.1\r\nHost: a\r\n\r\n")
++
++
+ def test_http_response_parser_utf8(response) -> None:
+     text = "HTTP/1.1 200 Ok\r\nx-test:тест\r\n\r\n".encode()
+ 
+@@ -1238,6 +1249,17 @@ def test_http_response_parser_status_line_under_limit(
+     assert msg.reason == reason.decode()
+ 
+ 
++def test_http_response_parser_status_line_too_long_fragmented(
++    response: HttpResponseParser,
++) -> None:
++    # Split an overlong reason phrase across reads so that each callback
++    # fragment is under the limit but the accumulated reason is not.
++    match = "400, message:\n  Got more than 8190 bytes when reading"
++    with pytest.raises(http_exceptions.LineTooLong, match=match):
++        response.feed_data(b"HTTP/1.1 200 " + b"a" * 8000)
++        response.feed_data(b"a" * 8000 + b"\r\n\r\n")
++
++
+ def test_http_response_parser_bad_version(response) -> None:
+     with pytest.raises(http_exceptions.BadHttpMessage):
+         response.feed_data(b"HT/11 200 Ok\r\n\r\n")
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 42402f799b..98dd5363db 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-50269.patch \
            file://CVE-2026-54274.patch \
            file://CVE-2026-54275.patch \
+           file://CVE-2026-54277.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


