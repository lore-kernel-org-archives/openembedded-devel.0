Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28858.1793862502132422203
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=W7dWv6lm;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=19146; q=dns/txt;
  s=iport01; t=1793862502; x=1795072102;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BSaQJSS78OJSvYNV9R4cNRP5oC45hU8L4MEAE8NBD0s=;
  b=W7dWv6lmUW6e7AjG+P2QqNBhGAw7BAifmhOqeWxpj6+7G/PFe0kfoZVx
   SQxN6MrCYxjjGRcPO3l5AYU539/G0LITYUDbLoiSFV033/pmQ87uXleD4
   bCFPaUXMwkaPwNBOxTNnweas0QdRPc8Ea70soVfph5s2RqomAHBYZVz2P
   Z5IK+ENNjDm0Cs358GpO6s2O0Lm3ei8wBRYQ93B/fgKH0qBkAGeWc6k35
   jgdB53do29eu/OPERbpiPOaERuxy+EeAGTv1SE/PvfOrKuDCiz4HxZpBm
   aFtm393Owh3ljMtzmoCfPJYlLXBA298wg56ofpuX1E53Q1YbFdTgJ17CI
   Q==;
X-CSE-ConnectionGUID: 3TxpuU/GSjWgFL1iNEwFpA==
X-CSE-MsgGUID: H5OU1aA1TGWhWK2qmV6riA==
X-IPAS-Result: =?us-ascii?q?A0AaAABGKuxq/4z/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKHOIIhA4ETkg2LARSBag8BAQEPRA0EAQGEP0YCjh0CJ?=
 =?us-ascii?q?jQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJ?=
 =?us-ascii?q?wsBGAE9HAMBAi8rIwgZgwIBgnQDEQa8OIF5M4EBgykBPwJDUNlLgWgBCxQBg?=
 =?us-ascii?q?TgBhT+II10YAUSEOScbgUlEgRQBgnN2gQWBJjYBAQKBRECGIASCDYEhgVoeZ?=
 =?us-ascii?q?YIiiXMCgVKGcUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdg?=
 =?us-ascii?q?R6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB5Ivg?=
 =?us-ascii?q?h5TGQcBDR8EShMBCh8BAQQTPyUEBBU/JgcBJw8CCx4UknEyj2SCIYE1n1yEK?=
 =?us-ascii?q?owkj0KFeBozhASBV6UWC5h9glmLMZYBUIRpgWg8gUcLBzMaCBsVO4JnCUoZD?=
 =?us-ascii?q?44uCwuBaIF4gX9agjpRyHcmMgIBCDIBAQcCBw4DC4FokR5gAQE?=
IronPort-Data: A9a23:PD/JhakRpcfqdVdokp2g6Nbo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXW2mEb/uOa2WhLYsnbdvkphgPscDXyINrSgFqq38wH1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdYk6v5qPCZhz
 v4nJx4pNxGlqv2Y2JvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrmjiaTRUpXqepLE85C7YywkZPL3FbYaOJIfQFJoL9qqej
 kKb2FmgCzhDCPOgyQWmqGupuLHVnAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:f8b+n6o0+tAz2RV6dlGzDjAaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AHeeSPGkw91NGfnEpl9fmN2RceI/XOSbh3G/NHgi?=
 =?us-ascii?q?XMmRWR5OxEF621bxKi+M7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AdhaIQwx8rWqc9Q0WePajlXSNROqaqITzL31UmLx?=
 =?us-ascii?q?fh+a7NRNTYS6YsmqtQ6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="543632976"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:08:21 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 61D48180001EB
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 07:08:21 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id B465ECC124B; Wed,  4 Nov 2026 23:08:20 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 5/6] python3-tornado: Fix CVE-2026-116577
Date: Wed,  4 Nov 2026 23:08:18 -0800
Message-Id: <20261105070819.2086816-6-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105070819.2086816-1-yurade@cisco.com>
References: <20261105070819.2086816-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131865
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [4],
using the commit shown in [1], [2] and [3].

[1] https://github.com/tornadoweb/tornado/commit/1b7a1dc9f340f52de929852e8125aa12f25297c9
[2] https://github.com/tornadoweb/tornado/commit/09591f65286a600c2196df9c33b792b889a6bccb
[3] https://github.com/tornadoweb/tornado/commit/3ef5ec3fc7a158ecd0ca7bfc5fcee42fa2773094
[4] https://github.com/tornadoweb/tornado/pull/3765
[5] https://nvd.nist.gov/vuln/detail/CVE-2026-116577

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-tornado/CVE-2026-116577_p1.patch  | 195 ++++++++++++++++++
 .../python3-tornado/CVE-2026-116577_p2.patch  |  99 +++++++++
 .../python3-tornado/CVE-2026-116577_p3.patch  | 101 +++++++++
 .../python/python3-tornado_6.5.7.bb           |   3 +
 4 files changed, 398 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p3.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p1.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p1.patch
new file mode 100644
index 0000000000..0c4db00069
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p1.patch
@@ -0,0 +1,195 @@
+From 1b7a1dc9f340f52de929852e8125aa12f25297c9 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Tue, 6 Oct 2026 09:59:02 -0400
+Subject: [PATCH] httputil: Remove support for "obsolete line folding"
+
+This optional part of the HTTP specification is no longer used
+in practice, and continuing to support it adds complexity and risk
+of DoS via quadratic performance on malicious data.
+
+CVE: CVE-2026-116577
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/1b7a1dc9f340f52de929852e8125aa12f25297c9]
+
+Backport Changes:
+- Kept unittest.TestCase for HTTPHeadersTest because 6.5.7's httputil_test.py
+  does not import tornado.test.util.TestCase.
+- Updated test_multi_line_headers to preserve folded-header acceptance for Curl
+  and expect a 599 response from simple_httpclient.
+- The httputil_test.py hunk removes two extra target-version lines because
+  6.5.7 formats the removed multiline .replace() expression across three lines.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/httputil.py             | 34 +++++++++---------------
+ tornado/test/httpclient_test.py | 17 +++++++++++--
+ tornado/test/httputil_test.py   | 47 +++------------------------------
+ 3 files changed, 29 insertions(+), 69 deletions(-)
+
+diff --git a/tornado/httputil.py b/tornado/httputil.py
+index 6a5db233..45e1883d 100644
+--- a/tornado/httputil.py
++++ b/tornado/httputil.py
+@@ -195,7 +195,6 @@ class HTTPHeaders(StrMutableMapping):
+         # on demand (and cleared whenever the list is modified).
+         self._as_list: dict[str, list[str]] = {}
+         self._combined_cache: dict[str, str] = {}
+-        self._last_key = None  # type: Optional[str]
+         if len(args) == 1 and len(kwargs) == 0 and isinstance(args[0], HTTPHeaders):
+             # Copy constructor
+             for k, v in args[0].get_all():
+@@ -219,7 +218,6 @@ class HTTPHeaders(StrMutableMapping):
+             if _FORBIDDEN_HEADER_CHARS_RE.search(value):
+                 raise HTTPInputError("Invalid header value %r" % value)
+         norm_name = _normalize_header(name)
+-        self._last_key = norm_name
+         if norm_name in self:
+             self._combined_cache.pop(norm_name, None)
+             self._as_list[norm_name].append(value)
+@@ -260,6 +258,11 @@ class HTTPHeaders(StrMutableMapping):
+            In Tornado 7.0, certain deprecated features of HTTP will become errors.
+            Specifically, line folding and the use of LF (with CR) as a line separator
+            will be removed.
++
++        .. versionchanged:: 6.6
++           Support for line folding was removed due to security/DoS concerns. This removal
++           was ahead of the original removal schedule announced for Tornado 7.0.
++           Support for LF without CR remains until Tornado 7.0.
+         """
+         if m := re.search(r"\r?\n$", line):
+             # RFC 9112 section 2.2: a recipient MAY recognize a single LF as a line
+@@ -270,27 +273,14 @@ class HTTPHeaders(StrMutableMapping):
+             # Empty line, or the final CRLF of a header block.
+             return
+         if line[0] in HTTP_WHITESPACE:
+-            # continuation of a multi-line header
+-            # TODO(7.0): Remove support for line folding.
+-            if self._last_key is None:
+-                raise HTTPInputError("first header line cannot start with whitespace")
+-            new_part = " " + line.strip(HTTP_WHITESPACE)
+-            if _chars_are_bytes:
+-                if not _ABNF.field_value.fullmatch(new_part[1:]):
+-                    raise HTTPInputError("Invalid header continuation %r" % new_part)
+-            else:
+-                if _FORBIDDEN_HEADER_CHARS_RE.search(new_part):
+-                    raise HTTPInputError("Invalid header value %r" % new_part)
+-            self._as_list[self._last_key][-1] += new_part
+-            self._combined_cache.pop(self._last_key, None)
+-        else:
+-            try:
+-                name, value = line.split(":", 1)
+-            except ValueError:
+-                raise HTTPInputError("no colon in header line")
+-            self.add(
+-                name, value.strip(HTTP_WHITESPACE), _chars_are_bytes=_chars_are_bytes
++            raise HTTPInputError(
++                "header line cannot start with whitespace, folding not supported"
+             )
++        try:
++            name, value = line.split(":", 1)
++        except ValueError:
++            raise HTTPInputError("no colon in header line")
++        self.add(name, value.strip(HTTP_WHITESPACE), _chars_are_bytes=_chars_are_bytes)
+ 
+     @classmethod
+     def parse(cls, headers: str, *, _chars_are_bytes: bool = True) -> "HTTPHeaders":
+diff --git a/tornado/test/httpclient_test.py b/tornado/test/httpclient_test.py
+index 46300200..4cb2e850 100644
+--- a/tornado/test/httpclient_test.py
++++ b/tornado/test/httpclient_test.py
+@@ -734,10 +734,14 @@ def test_multi_line_headers(self):
+                     % (resp.body, value, container),
+                 )
+ 
+     def test_multi_line_headers(self):
+-        # Multi-line http headers are rare but rfc-allowed
+-        # http://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.2
++        # Line folding is an obsolete way of representing headers split across multiple lines.
++        # https://www.rfc-editor.org/info/rfc9112/#section-5.2
++        #
++        # They must either be folded into a single line or rejected.
++        # Tornado 6.6 removed support for line folding in simple_httpclient, but they are
++        # still supported in libcurl.
+         sock, port = bind_unused_port()
+         with closing(sock):
+ 
+             @gen.coroutine
+@@ -760,10 +764,15 @@ def test_multi_line_headers(self):
+ 
+             netutil.add_accept_handler(sock, accept_callback)  # type: ignore
+             try:
+                 resp = self.fetch("http://127.0.0.1:%d/" % port)
+-                resp.rethrow()
+-                self.assertEqual(resp.headers["X-XSS-Protection"], "1; mode=block")
++                if self.http_client.__class__.__module__ == "tornado.curl_httpclient":
++                    resp.rethrow()
++                    self.assertEqual(
++                        resp.headers["X-XSS-Protection"], "1; mode=block"
++                    )
++                else:
++                    self.assertEqual(resp.code, 599)
+             finally:
+                 self.io_loop.remove_handler(sock.fileno())
+ 
+     @gen_test
+diff --git a/tornado/test/httputil_test.py b/tornado/test/httputil_test.py
+index 0e9d5c41..40108d9c 100644
+--- a/tornado/test/httputil_test.py
++++ b/tornado/test/httputil_test.py
+@@ -384,50 +384,11 @@ Content-Disposition: form-data; name="files"; filename="ab.txt"
+ 
+ 
+ class HTTPHeadersTest(unittest.TestCase):
+-    def test_multi_line(self):
+-        # Lines beginning with whitespace are appended to the previous line
+-        # with any leading whitespace replaced by a single space.
+-        # Note that while multi-line headers are a part of the HTTP spec,
+-        # their use is strongly discouraged.
+-        data = """\
+-Foo: bar
+- baz
+-Asdf: qwer
+-\tzxcv
+-Foo: even
+-     more
+-     lines
+-""".replace(
+-            "\n", "\r\n"
+-        )
+-        headers = HTTPHeaders.parse(data)
+-        self.assertEqual(headers["asdf"], "qwer zxcv")
+-        self.assertEqual(headers.get_list("asdf"), ["qwer zxcv"])
+-        self.assertEqual(headers["Foo"], "bar baz,even more lines")
+-        self.assertEqual(headers.get_list("foo"), ["bar baz", "even more lines"])
+-        self.assertEqual(
+-            sorted(list(headers.get_all())),
+-            [("Asdf", "qwer zxcv"), ("Foo", "bar baz"), ("Foo", "even more lines")],
+-        )
+-        # Verify case insensitivity in-operator
+-        self.assertTrue("asdf" in headers)
+-        self.assertTrue("Asdf" in headers)
+-
+-    def test_continuation(self):
++    def test_folding_rejected(self):
+         data = "Foo: bar\r\n\tasdf"
+-        headers = HTTPHeaders.parse(data)
+-        self.assertEqual(headers["Foo"], "bar asdf")
+-
+-        # If the first line starts with whitespace, it's a
+-        # continuation line with nothing to continue, so reject it
+-        # (with a proper error).
+-        data = " Foo: bar"
+-        self.assertRaises(HTTPInputError, HTTPHeaders.parse, data)
+-
+-        # \f (formfeed) is whitespace according to str.isspace, but
+-        # not according to the HTTP spec.
+-        data = "Foo: bar\r\n\fasdf"
+-        self.assertRaises(HTTPInputError, HTTPHeaders.parse, data)
++        with self.assertRaises(HTTPInputError):
++            # Folded continuation lines are not supported.
++            HTTPHeaders.parse(data)
+ 
+     def test_forbidden_ascii_characters(self):
+         # Control characters and ASCII whitespace other than space, tab, and CRLF are not allowed in
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p2.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p2.patch
new file mode 100644
index 0000000000..0d1a7e5732
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p2.patch
@@ -0,0 +1,99 @@
+From 09591f65286a600c2196df9c33b792b889a6bccb Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Tue, 6 Oct 2026 14:14:19 +0000
+Subject: [PATCH] http1connection: Notify client delegate of header parse
+ errors
+
+Previously, an HTTPInputError raised while parsing response headers
+happened before the delegate was marked as needing on_connection_close,
+and close() cleared the stream's close callback, so simple_httpclient
+never completed the request and it hung until the timeout. Now the
+delegate is told the connection closed, matching the behavior for
+errors raised after headers_received.
+
+Update test_multi_line_headers to expect an error from simple_httpclient
+now that line folding is no longer supported (curl still accepts it).
+
+CVE: CVE-2026-116577
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/09591f65286a600c2196df9c33b792b889a6bccb]
+
+Backport Changes:
+- Added a supports_line_folding flag to the shared test; Curl keeps the
+  acceptance check while Simple expects HTTPError for folded response headers.
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_016cNR4NyeuzQ1qFdqCk1yum
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/http1connection.py           |  5 +++++
+ tornado/test/httpclient_test.py      | 19 +++++++++++++------
+ tornado/test/curl_httpclient_test.py |  2 ++
+ 3 files changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/tornado/http1connection.py b/tornado/http1connection.py
+--- a/tornado/http1connection.py
++++ b/tornado/http1connection.py
+@@ -316,6 +316,11 @@ async def _read_message
+             gen_log.info("Malformed HTTP message from %s: %s", self.context, e)
+             if not self.is_client:
+                 await self.stream.write(b"HTTP/1.1 400 Bad Request\r\n\r\n")
++            elif not need_delegate_close:
++                # The error came before headers_received, so the delegate
++                # doesn't know about this message yet. Tell it the
++                # connection is closed so a client request doesn't hang.
++                need_delegate_close = True
+             self.close()
+             return False
+         finally:
+
+diff --git a/tornado/test/httpclient_test.py b/tornado/test/httpclient_test.py
+--- a/tornado/test/httpclient_test.py
++++ b/tornado/test/httpclient_test.py
+@@ -263,6 +263,9 @@ class HTTPClientCommonTestCase
+ 
+ 
+ class HTTPClientCommonTestCase(AsyncHTTPTestCase):
++    # Set by subclasses whose client accepts obsolete line folding in
++    # response headers (see test_multi_line_headers).
++    supports_line_folding = False
+     # Set by subclasses whose client decodes ``Content-Encoding: br``. No
+     # implementation asks for brotli, so this is only true where the client
+     # decodes an encoding it did not request (see BrotliBombHandler).
+@@ -764,14 +765,18 @@ class HTTPClientCommonTestCase
+ 
+             netutil.add_accept_handler(sock, accept_callback)  # type: ignore
+             try:
+-                resp = self.fetch("http://127.0.0.1:%d/" % port)
+-                if self.http_client.__class__.__module__ == "tornado.curl_httpclient":
++                if self.supports_line_folding:
++                    resp = self.fetch("http://127.0.0.1:%d/" % port)
+                     resp.rethrow()
+-                    self.assertEqual(
+-                        resp.headers["X-XSS-Protection"], "1; mode=block"
+-                    )
++                    self.assertEqual(resp.headers["X-XSS-Protection"], "1; mode=block")
+                 else:
+-                    self.assertEqual(resp.code, 599)
++                    with ExpectLog(
++                        gen_log, "Malformed HTTP message.*folding", level=logging.INFO
++                    ):
++                        with self.assertRaises(HTTPError):
++                            self.fetch(
++                                "http://127.0.0.1:%d/" % port, raise_error=True
++                            )
+             finally:
+                 self.io_loop.remove_handler(sock.fileno())
+ 
+
+diff --git a/tornado/test/curl_httpclient_test.py b/tornado/test/curl_httpclient_test.py
+--- a/tornado/test/curl_httpclient_test.py
++++ b/tornado/test/curl_httpclient_test.py
+@@ -45,6 +45,8 @@ class CurlHTTPClientCommonTestCase
+     # not we listed it in Accept-Encoding, so brotli is reachable whenever
+     # libcurl was built with it (which is common).
+     decompresses_brotli = pycurl is not None and "brotli" in pycurl.version
++    # libcurl still accepts obsolete line folding in response headers.
++    supports_line_folding = True
+ 
+     def get_http_client(self):
+         client = CurlAsyncHTTPClient(defaults=dict(allow_ipv6=False))
diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p3.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p3.patch
new file mode 100644
index 0000000000..33670c88b5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p3.patch
@@ -0,0 +1,101 @@
+From 3ef5ec3fc7a158ecd0ca7bfc5fcee42fa2773094 Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Tue, 6 Oct 2026 15:28:59 +0000
+Subject: [PATCH] test: Accept either outcome in test_multi_line_headers
+
+Rather than declaring per-implementation whether line folding is
+supported (which was wrong when --httpclient changes the default
+client), accept either a correctly unfolded header or a 599 error.
+
+CVE: CVE-2026-116577
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/3ef5ec3fc7a158ecd0ca7bfc5fcee42fa2773094]
+
+Backport Changes:
+- Rebased the test update on p2's 6.5.7-specific test body. Its fetch call and
+  error assertion use a different line layout, accounting for two additional
+  deleted lines in httpclient_test.py compared with upstream.
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_016cNR4NyeuzQ1qFdqCk1yum
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/httpclient_test.py      |  37 +++++++++++++++++-----------------
+ tornado/test/curl_httpclient_test.py |   2 --
+ 2 files changed, 19 insertions(+), 20 deletions(-)
+
+diff --git a/tornado/test/httpclient_test.py b/tornado/test/httpclient_test.py
+index bb7de5c4..449f35a4 100644
+--- a/tornado/test/httpclient_test.py
++++ b/tornado/test/httpclient_test.py
+@@ -263,9 +263,6 @@ class HTTPClientCommonTestCase(AsyncHTTPTestCase):
+ 
+ 
+ class HTTPClientCommonTestCase(AsyncHTTPTestCase):
+-    # Set by subclasses whose client accepts obsolete line folding in
+-    # response headers (see test_multi_line_headers).
+-    supports_line_folding = False
+     # Set by subclasses whose client decodes ``Content-Encoding: br``. No
+     # implementation asks for brotli, so this is only true where the client
+     # decodes an encoding it did not request (see BrotliBombHandler).
+@@ -741,9 +738,10 @@ def test_multi_line_headers(self):
+         # Line folding is an obsolete way of representing headers split across multiple lines.
+         # https://www.rfc-editor.org/info/rfc9112/#section-5.2
+         #
+-        # They must either be folded into a single line or rejected.
+-        # Tornado 6.6 removed support for line folding in simple_httpclient, but they are
+-        # still supported in libcurl.
++        # The spec requires user agents to unfold them, but simple_httpclient
++        # rejects them as of Tornado 6.6 while libcurl still accepts them. Either
++        # outcome is acceptable here; what matters is that the client doesn't hang
++        # and doesn't misparse the header.
+         sock, port = bind_unused_port()
+         with closing(sock):
+ 
+@@ -767,18 +765,21 @@ def test_multi_line_headers(self):
+ 
+             netutil.add_accept_handler(sock, accept_callback)  # type: ignore
+             try:
+-                if self.supports_line_folding:
+-                    resp = self.fetch("http://127.0.0.1:%d/" % port)
+-                    resp.rethrow()
+-                    self.assertEqual(resp.headers["X-XSS-Protection"], "1; mode=block")
+-                else:
+-                    with ExpectLog(
+-                        gen_log, "Malformed HTTP message.*folding", level=logging.INFO
+-                    ):
+-                        with self.assertRaises(HTTPError):
+-                            self.fetch(
+-                                "http://127.0.0.1:%d/" % port, raise_error=True
+-                            )
++                with ExpectLog(
++                    gen_log,
++                    "Malformed HTTP message.*folding",
++                    level=logging.INFO,
++                    required=False,
++                ):
++                    try:
++                        resp = self.fetch("http://127.0.0.1:%d/" % port)
++                    except HTTPError as e:
++                        self.assertEqual(e.code, 599)
++                    else:
++                        resp.rethrow()
++                        self.assertEqual(
++                            resp.headers["X-XSS-Protection"], "1; mode=block"
++                        )
+             finally:
+                 self.io_loop.remove_handler(sock.fileno())
+ 
+
+diff --git a/tornado/test/curl_httpclient_test.py b/tornado/test/curl_httpclient_test.py
+index 7a53f206..d7eb1adf 100644
+--- a/tornado/test/curl_httpclient_test.py
++++ b/tornado/test/curl_httpclient_test.py
+@@ -45,8 +45,6 @@ class CurlHTTPClientCommonTestCase
+     # not we listed it in Accept-Encoding, so brotli is reachable whenever
+     # libcurl was built with it (which is common).
+     decompresses_brotli = pycurl is not None and "brotli" in pycurl.version
+-    # libcurl still accepts obsolete line folding in response headers.
+-    supports_line_folding = True
+ 
+     def get_http_client(self):
+         client = CurlAsyncHTTPClient(defaults=dict(allow_ipv6=False))
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index 1dd2ff3c32..87b6721320 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -16,6 +16,9 @@ SRC_URI += "file://CVE-2026-91990.patch \
             file://CVE-2026-103263.patch \
             file://CVE-2026-103263-dependent.patch \
             file://CVE-2026-115927.patch \
+            file://CVE-2026-116577_p1.patch \
+            file://CVE-2026-116577_p2.patch \
+            file://CVE-2026-116577_p3.patch \
 "
 
 inherit pypi python_setuptools_build_meta
-- 
2.35.6

