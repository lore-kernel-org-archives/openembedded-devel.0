Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36179.1795583899216529360
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BZ5mIAfF;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=28734; q=dns/txt;
  s=iport01; t=1795583900; x=1796793500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lUS8E2udqwVe0PHaSk4NIOqE7T635Vs1gh2Vhh+qB68=;
  b=BZ5mIAfFLG79lyUyeKSsLoAU+XmnYUv18CTwcZTxui3Y8QImAAPEr6GK
   NGEyZVigLZNZsUtFRubYnch6sZNHwAiiWkds5c9z2frkQZfEUpCfAc/ls
   +mbgp1bfp2HQI3ljduUdaVm5fVtpAdF7YFGPzEasxhRINxtvfgdw7gYad
   IuXmWjokIAEHAnQfn9w22Tns9z1MWIPcQgmhPEjgaSLI/HXo9GqQGvmz+
   5DDUMnbXyuWbFzesUj/OB62MXsmDt/XgQUyXUZ4aT8O1s7Uo7m48f5EB5
   OuZnNHQlAmyDaT/89ofE5z599IAQJz+gMlreTQKhbKSZ6K2NmoCy4pjMf
   g==;
X-CSE-ConnectionGUID: vtba2UBKS+mMhm7m9tHHOQ==
X-CSE-MsgGUID: ksKERKKxTwu9IVKANq3AiA==
X-IPAS-Result: =?us-ascii?q?A0AbAAAhbQZr/9FK/pBaHAEBAQEBAQcBARIBAQQEAQFMg?=
 =?us-ascii?q?TAHAQELAYJWdWBDSQOEVIgbiVkDgROKU4VqjFkUgRADVw8BAQEPRA0EAQGEM?=
 =?us-ascii?q?A9GAk8VjT4CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8NkBIBAgEDGgkECwEWAgEtEBwDAQIDAiYCAiALGgkIEAkagmgBgjoDNwMRu?=
 =?us-ascii?q?gN6fzOBAYMpAUNBUNhMDYJaAQsUAYEKLgGFQYMAIAGFBF0YAYR+JxsbgXKBF?=
 =?us-ascii?q?YE7gTl2gQVLAQFNQgEBAQEBF4EsAoN0gmoEgg0VgQyBVH0OgheDFQOGWQKBS?=
 =?us-ascii?q?YUhgzFIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7Fy9YGwYFgRyBHoESg?=
 =?us-ascii?q?QNdgSsoXQEhgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhCzQYDUgRL?=
 =?us-ascii?q?DcVGQQ9AW4HlBODFAYBAWAtAQcDEQ4BARcJAjsoDA8UGQgFHg0DCwETBQYJA?=
 =?us-ascii?q?gsCBCySVxACOgqPWYIhgTWeHk1xCiiDeYwkjz6FfBozhASBV4s9A4cDklQLm?=
 =?us-ascii?q?H2CWYJ6hWSCU4QKkVQLCw0DTYRqgWg8OYEgcBWDIglKGQ+OKw4Lg2CCNoJdy?=
 =?us-ascii?q?UgmMgIBCAMvAQEHAgcOAwuBaIRhiyEtgU8BAQ?=
IronPort-Data: A9a23:qITmHaP9/6QBTE3vrR3ylsFynXyQoLVcMsEvi/4bfWQNrUokhDAOm
 jNMXWCAO/uONmv8KIx1Otnn9B8PvpTczdFkT3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+tyBkhsAKc7waVyJGFLq
 vlJNBAtSSnW0opawJrjIgVtrs0uNozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2I+BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FIpieixaYGPEjCMbcZOvWuih
 UHWw3vkUzAkF/W50GGs81v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvqS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:sCH8GqiFWANCSgNyeuE6I3n103BQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHnJYVcqKRYdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILXFuFfBOLZqlWKcREWtNQtsJ
 uIGJIRNDSfNzRHZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3A4NCo32hh7KWRCOcrtc2gjDm4RjJubGHXxS3tCWy?=
 =?us-ascii?q?DSmNMSLjKTA6M2INDqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ADRzFdgxXzltQcP3PpOOCs2Km5X+aqKe1K203srY?=
 =?us-ascii?q?Wh9aZZA1OGB67lW+eQ6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60184132"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:18:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id BCB0B180001A3;
	Wed, 25 Nov 2026 05:18:14 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 73DE1CBF203; Tue, 24 Nov 2026 21:18:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 3/9] python3-aiohttp: fix CVE-2026-111748
Date: Tue, 24 Nov 2026 21:18:05 -0800
Message-Id: <20261125051811.2524271-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051811.2524271-1-dkelaiya@cisco.com>
References: <20261125051811.2524271-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132971
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the protocol-scheme fix [1] to aiohttp 3.9.5, as identified
by [3]. Derive Request.scheme from the transport rather than the
untrusted scheme in an absolute-form request target.

Include the authority-validation correction [2] to reject malformed
targets before URL parsing, independently of yarl normalization.
Retain the upstream parser and request regressions. Use cached
transport details and explicitly evaluate URL.port before reading
raw_host because yarl 1.9.4 defers encoded-URL port validation.
The recipe regenerates the C parser from the patched Cython source.

[1] https://github.com/aio-libs/aiohttp/commit/6d4e7b01f9b951aa084a75d7356e907d4ee80411
[2] https://github.com/aio-libs/aiohttp/commit/186065caf37d5999e91fd3d4ddfd03b43eb08801
[3] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-f9xw-jh8m-3mwq

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111748_p1.patch  | 410 ++++++++++++++++++
 .../python3-aiohttp/CVE-2026-111748_p2.patch  | 259 +++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   2 +
 3 files changed, 671 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p1.patch
new file mode 100644
index 0000000000..9f1ec42706
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p1.patch
@@ -0,0 +1,410 @@
+From 6d4e7b01f9b951aa084a75d7356e907d4ee80411 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sun, 27 Sep 2026 18:11:00 +0100
+Subject: [PATCH] Use protocol scheme for absolute-form requests (#13821)
+ (#13827) (#13828)
+
+CVE: CVE-2026-111748
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/6d4e7b01f9b951aa084a75d7356e907d4ee80411]
+
+Backport Changes:
+- Omit the enum hunk because HTTP_OPTIONS is already declared.
+- Cache transport details before URL normalization because
+  RequestHandler has no ssl_context attribute in aiohttp 3.9.5.
+- Apply explicit clone(scheme=...) and clone(host=...) overrides to
+  the cached absolute URL so Request.url stays consistent. Keep
+  authority-form URLs scheme-less unless clone supplies a scheme.
+- Evaluate URL.port before accepting raw_host in both parsers:
+  yarl 1.9.4 defers port validation for encoded URLs.
+- Adapt the constructor mock to transport.get_extra_info() and add
+  the upstream absolute-URL clone tests missing from aiohttp 3.9.5.
+- Keep 3.9.5's existing websocket-key test annotation; the omitted
+  typing-only update does not change its regression assertions.
+
+(cherry picked from commit a921cfd0fec28d5a9e5bf8d6f4372b8fa63c49df)
+(cherry picked from commit 93d91e37e7c6035d09e89646b3de737735ed91b5)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13821.bugfix.rst     |  1 +
+ aiohttp/_http_parser.pyx     | 31 ++++++++++++++++---
+ aiohttp/http_parser.py       | 28 ++++++++++++++---
+ aiohttp/web_request.py       | 20 ++++++++----
+ tests/test_http_parser.py    | 59 ++++++++++++++++++++++++++++++++++++
+ tests/test_web_functional.py | 46 ++++++++++++++++++++++++++--
+ tests/test_web_request.py    | 52 ++++++++++++++++++++++++++-----
+ 7 files changed, 214 insertions(+), 23 deletions(-)
+ create mode 100644 CHANGES/13821.bugfix.rst
+
+diff --git a/CHANGES/13821.bugfix.rst b/CHANGES/13821.bugfix.rst
+new file mode 100644
+index 00000000..f35418d2
+--- /dev/null
++++ b/CHANGES/13821.bugfix.rst
+@@ -0,0 +1 @@
++Fixed the web server trusting the scheme of an absolute-form request-target -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 4eb57893..7d97bfe8 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -668,12 +668,21 @@ cdef class HttpRequestParser(HttpParser):
+             return
+         self._path = self._buf.decode('utf-8', 'surrogateescape')
+         try:
+-            idx3 = len(self._path)
+             if self._cparser.method == cparser.HTTP_CONNECT:
+                 # authority-form,
+                 # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.3
+-                self._url = URL.build(authority=self._path, encoded=True)
+-            elif idx3 > 1 and self._path[0] == '/':
++                try:
++                    self._url = URL.build(authority=self._path, encoded=True)
++                    _ = self._url.port
++                    host = self._url.raw_host
++                except ValueError:
++                    host = None
++                if host is None:
++                    raise InvalidURLError(
++                        self._path.encode(errors="surrogateescape")
++                        .decode("latin1")
++                    )
++            elif self._path[0] == '/':
+                 # origin-form,
+                 # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.1
+                 idx1 = self._path.find("?")
+@@ -704,10 +713,24 @@ cdef class HttpRequestParser(HttpParser):
+                     fragment=fragment,
+                     encoded=True,
+                 )
++            elif self._path == '*' and self._cparser.method == cparser.HTTP_OPTIONS:
++                # asterisk-form,
++                self._url = URL(self._path, encoded=True)
+             else:
+                 # absolute-form for proxy maybe,
+                 # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.2
+-                self._url = URL(self._path, encoded=True)
++                try:
++                    self._url = URL(self._path, encoded=True)
++                    _ = self._url.port
++                    host = self._url.raw_host
++                except ValueError:
++                    host = None
++                # https://www.rfc-editor.org/rfc/rfc9110#section-4.2.1-4
++                if host is None:
++                    raise InvalidURLError(
++                        self._path.encode(errors="surrogateescape")
++                        .decode("latin1")
++                    )
+         finally:
+             PyByteArray_Resize(self._buf, 0)
+ 
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 37a0dff4..789c2bdc 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -641,7 +641,19 @@ class HttpRequestParser(HttpParser[RawRequestMessage]):
+         if method == "CONNECT":
+             # authority-form,
+             # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.3
+-            url = URL.build(authority=path, encoded=True)
++            try:
++                url = URL.build(authority=path, encoded=True)
++                _ = url.port
++                host = url.raw_host
++            except ValueError:
++                # Duplicated so mypy understands that url must be defined below.
++                raise InvalidURLError(
++                    path.encode(errors="surrogateescape").decode("latin1")
++                )
++            if host is None:
++                raise InvalidURLError(
++                    path.encode(errors="surrogateescape").decode("latin1")
++                )
+         elif path.startswith("/"):
+             # origin-form,
+             # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.1
+@@ -664,9 +676,17 @@ class HttpRequestParser(HttpParser[RawRequestMessage]):
+         else:
+             # absolute-form for proxy maybe,
+             # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.2
+-            url = URL(path, encoded=True)
+-            if url.scheme == "":
+-                # not absolute-form
++            try:
++                url = URL(path, encoded=True)
++                _ = url.port
++                host = url.raw_host
++            except ValueError:
++                # Duplicated so mypy understands that url must be defined below.
++                raise InvalidURLError(
++                    path.encode(errors="surrogateescape").decode("latin1")
++                )
++            # https://www.rfc-editor.org/rfc/rfc9110#section-4.2.1-4
++            if host is None:
+                 raise InvalidURLError(
+                     path.encode(errors="surrogateescape").decode("latin1")
+                 )
+diff --git a/aiohttp/web_request.py b/aiohttp/web_request.py
+index f9de5957..06c0bffc 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -173,14 +173,27 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+         self._method = message.method
+         self._version = message.version
+         self._cache: Dict[str, Any] = {}
++        transport = self._protocol.transport
++        assert transport is not None
++        self._transport_sslcontext = transport.get_extra_info("sslcontext")
++        self._transport_peername = transport.get_extra_info("peername")
+         url = message.url
+         if url.is_absolute():
++            if scheme is None and url.scheme:
++                # Absolute URL is peer-controlled, use the protocol.
++                scheme = "https" if self._transport_sslcontext else "http"
++            if scheme is not None:
++                # Authority-form (CONNECT) has no scheme: leave the target
++                # unchanged unless clone(scheme=...) overrides it.
++                url = url.with_scheme(scheme)
++                self._cache["scheme"] = scheme
++            if host is not None:
++                url = url.with_host(host)
+             # absolute URL is given,
+             # override auto-calculating url, host, and scheme
+             # all other properties should be good
+             self._cache["url"] = url
+             self._cache["host"] = url.host
+-            self._cache["scheme"] = url.scheme
+             self._rel_url = url.relative()
+         else:
+             self._rel_url = message.url
+@@ -192,11 +205,6 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+         self._client_max_size = client_max_size
+         self._loop = loop
+ 
+-        transport = self._protocol.transport
+-        assert transport is not None
+-        self._transport_sslcontext = transport.get_extra_info("sslcontext")
+-        self._transport_peername = transport.get_extra_info("peername")
+-
+         if scheme is not None:
+             self._cache["scheme"] = scheme
+         if host is not None:
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index b29518ab..ebbb58d8 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -866,6 +866,65 @@ def test_url_absolute(parser: Any) -> None:
+     assert msg.url == URL("https://www.google.com/path/to.html")
+ 
+ 
++def test_url_authority_form_only_connect(parser: HttpRequestParser) -> None:
++    # https://www.rfc-editor.org/info/rfc9112/#section-3.2.3-1
++    with pytest.raises(http_exceptions.InvalidURLError):
++        parser.feed_data(b"GET www.google.com:443 HTTP/1.1\r\nHost: a\r\n\r\n")
++
++
++@pytest.mark.parametrize(
++    "target",
++    (
++        b"https:///protected",
++        b"https:////protected",
++        b"https://:80/protected",
++        b"https://user@/protected",
++    ),
++    ids=("empty-host", "empty-host-extra-slash", "port-only", "userinfo-only"),
++)
++def test_url_absolute_form_empty_host_rejected(
++    parser: HttpRequestParser, target: bytes
++) -> None:
++    # https://www.rfc-editor.org/rfc/rfc9110#section-4.2.2-4
++    with pytest.raises(http_exceptions.InvalidURLError):
++        parser.feed_data(b"GET " + target + b" HTTP/1.1\r\nHost: a\r\n\r\n")
++
++
++def test_url_absolute_form_invalid_port_rejected(parser: HttpRequestParser) -> None:
++    # yarl raises ValueError for an out-of-range port; that must surface as
++    # a 400, not escape the parser as a bare ValueError.
++    with pytest.raises(http_exceptions.InvalidURLError):
++        parser.feed_data(b"GET http://example.com:65536/x HTTP/1.1\r\nHost: a\r\n\r\n")
++
++
++def test_url_connect_invalid_port_rejected(parser: HttpRequestParser) -> None:
++    with pytest.raises(http_exceptions.InvalidURLError):
++        parser.feed_data(b"CONNECT example.com:65536 HTTP/1.1\r\nHost: a\r\n\r\n")
++
++
++def test_url_connect_empty_host_rejected(parser: HttpRequestParser) -> None:
++    with pytest.raises(http_exceptions.InvalidURLError):
++        parser.feed_data(b"CONNECT :80 HTTP/1.1\r\nHost: a\r\n\r\n")
++
++
++def test_url_origin_form_bare_slash(parser: HttpRequestParser) -> None:
++    messages, upgrade, tail = parser.feed_data(b"GET / HTTP/1.1\r\nHost: a\r\n\r\n")
++    assert messages[0][0].url == URL("/")
++
++
++def test_url_asterisk_form_options(parser: HttpRequestParser) -> None:
++    # https://www.rfc-editor.org/rfc/rfc9112#section-3.2.4
++    messages, upgrade, tail = parser.feed_data(b"OPTIONS * HTTP/1.1\r\nHost: a\r\n\r\n")
++    assert messages[0][0].url == URL("*")
++
++
++def test_url_asterisk_form_only_options(parser: HttpRequestParser) -> None:
++    # asterisk-form is only valid for OPTIONS; for other methods "*" is
++    # neither origin-form nor a valid absolute-form target.
++    with pytest.raises(http_exceptions.InvalidURLError):
++        parser.feed_data(b"GET * HTTP/1.1\r\nHost: a\r\n\r\n")
++
++
+ def test_headers_old_websocket_key1(parser: Any) -> None:
+     text = b"GET /test HTTP/1.1\r\n" b"SEC-WEBSOCKET-KEY1: line\r\n\r\n"
+ 
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index a0e3a8ea..262257b8 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -1863,8 +1863,50 @@ async def test_unread_compressed_body_drain_is_bounded(
+     assert max(drain_reads) < decompressed_size
+ 
+ 
+-async def test_app_max_client_size(aiohttp_client) -> None:
+-    async def handler(request):
++async def test_absolute_form_target_does_not_spoof_scheme(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    """A plaintext absolute-form target with https must not look secure."""
++
++    async def handler(request: web.Request) -> web.Response:
++        return web.json_response(
++            {
++                "scheme": request.scheme,
++                "secure": request.secure,
++                "url": str(request.url),
++                "host": request.host,
++            }
++        )
++
++    app = web.Application()
++    app.router.add_get("/probe", handler)
++    server = await aiohttp_server(app)
++
++    reader, writer = await asyncio.open_connection(server.host, server.port)
++    try:
++        writer.write(
++            b"GET https://trusted.example/probe HTTP/1.1\r\n"
++            b"Host: trusted.example\r\n"
++            b"Connection: close\r\n\r\n"
++        )
++        await writer.drain()
++        raw = await asyncio.wait_for(reader.read(), 5)
++    finally:
++        writer.close()
++        with suppress(ConnectionResetError, BrokenPipeError):
++            await writer.wait_closed()
++
++    assert raw.startswith(b"HTTP/1.1 200 ")
++    assert json.loads(raw.split(b"\r\n\r\n", 1)[1]) == {
++        "scheme": "http",
++        "secure": False,
++        "url": "http://trusted.example/probe",
++        "host": "trusted.example",
++    }
++
++
++async def test_app_max_client_size(aiohttp_client: AiohttpClient) -> None:
++    async def handler(request: web.Request) -> NoReturn:
+         await request.post()
+         return web.Response(body=b"ok")
+ 
+diff --git a/tests/test_web_request.py b/tests/test_web_request.py
+index c1d61f89..79ddcdeb 100644
+--- a/tests/test_web_request.py
++++ b/tests/test_web_request.py
+@@ -9,13 +9,15 @@ import pytest
+ from multidict import CIMultiDict, CIMultiDictProxy, MultiDict
+ from yarl import URL
+ 
+-from aiohttp import HttpVersion
++from aiohttp import HttpVersion, web
++from aiohttp.abc import AbstractStreamWriter
+ from aiohttp.base_protocol import BaseProtocol
+ from aiohttp.http_exceptions import BadHttpMessage, LineTooLong
+ from aiohttp.http_parser import RawRequestMessage
+ from aiohttp.streams import StreamReader
+ from aiohttp.test_utils import make_mocked_request
+-from aiohttp.web import BaseRequest, HTTPRequestEntityTooLarge
++from aiohttp.web import HTTPRequestEntityTooLarge
++from aiohttp.web_protocol import RequestHandler
+ from aiohttp.web_request import ETag
+ 
+ 
+@@ -24,6 +26,19 @@ def protocol():
+     return mock.Mock(_reading_paused=False)
+ 
+ 
++def make_base_request(
++    message: RawRequestMessage, protocol: RequestHandler
++) -> web.BaseRequest:
++    return web.BaseRequest(
++        message,
++        mock.create_autospec(StreamReader, spec_set=True, instance=True),
++        protocol,
++        mock.create_autospec(AbstractStreamWriter, spec_set=True, instance=True),
++        mock.create_autospec(asyncio.Task, spec_set=True, instance=True),
++        mock.create_autospec(asyncio.AbstractEventLoop, spec_set=True, instance=True),
++    )
++
++
+ def test_base_ctor() -> None:
+     message = RawRequestMessage(
+         "GET",
+@@ -38,9 +53,10 @@ def test_base_ctor() -> None:
+         URL("/path/to?a=1&b=2"),
+     )
+ 
+-    req = BaseRequest(
+-        message, mock.Mock(), mock.Mock(), mock.Mock(), mock.Mock(), mock.Mock()
+-    )
++    protocol = mock.create_autospec(RequestHandler, spec_set=True, instance=True)
++    protocol.transport = mock.Mock()
++    protocol.transport.get_extra_info.return_value = None
++    req = make_base_request(message, protocol)
+ 
+     assert "GET" == req.method
+     assert HttpVersion(1, 1) == req.version
+@@ -165,12 +181,34 @@ def test_non_ascii_raw_path() -> None:
+ 
+ def test_absolute_url() -> None:
+     req = make_mocked_request("GET", "https://example.com/path/to?a=1")
+-    assert req.url == URL("https://example.com/path/to?a=1")
+-    assert req.scheme == "https"
++    assert req.url == URL("http://example.com/path/to?a=1")
++    # The scheme of an absolute-form target is peer-controlled and must not
++    # override the transport-derived scheme.
++    assert req.scheme == "http"
++    assert not req.secure
+     assert req.host == "example.com"
+     assert req.rel_url == URL.build(path="/path/to", query={"a": "1"})
+ 
+ 
++def test_clone_absolute_scheme() -> None:
++    req = make_mocked_request("GET", "https://example.com/path/to?a=1")
++    assert req.scheme == "http"
++    req2 = req.clone(scheme="https")
++    assert req2.scheme == "https"
++    assert req2.url.scheme == "https"
++    req3 = req2.clone(scheme="http")
++    assert req3.scheme == "http"
++    assert req3.url.scheme == "http"
++
++
++def test_clone_absolute_host() -> None:
++    req = make_mocked_request("GET", "https://example.com/path/to?a=1")
++    assert req.host == "example.com"
++    req2 = req.clone(host="foo.test")
++    assert req2.host == "foo.test"
++    assert req2.url.host == "foo.test"
++
++
+ def test_content_length() -> None:
+     req = make_mocked_request("Get", "/", CIMultiDict([("CONTENT-LENGTH", "123")]))
+ 
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p2.patch
new file mode 100644
index 0000000000..58bca9f8f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p2.patch
@@ -0,0 +1,259 @@
+From 186065caf37d5999e91fd3d4ddfd03b43eb08801 Mon Sep 17 00:00:00 2001
+From: Andrew Svetlov <andrew.svetlov@gmail.com>
+Date: Tue, 29 Sep 2026 11:25:53 +0200
+Subject: [PATCH] Reject absolute-form targets without an authority before
+ parsing (#13858) (#13860)
+
+<!-- Thank you for your contribution! -->
+
+Follow-up to #13855 for aio-libs/yarl#1937. With that change, yarl's
+default WHATWG mode reads a host from `http:host/p`, `http:/host/p` and
+`http:///host/p`, as browsers do. The Python and Cython request parsers
+passed an absolute-form request target to `URL()` and rejected it only
+if yarl found no host. They now first check that the target has `//`
+followed by a non-empty authority, so `GET http:///protected` and `GET
+http:/protected` stay rejected as RFC 9110 requires, whatever yarl
+version is installed.
+
+The client tests used `http:///example.com` and `http:///path` as URLs
+without a host. They now use `http://` where an invalid URL is needed,
+and `http:///example.com` is dropped from the invalid URL test data.
+With yarl#1937 it is `http://example.com/`, and as a redirect it leads
+to `example.com`, as in browsers.
+
+No with the released yarl, where such targets were already rejected.
+With yarl#1937, the server keeps rejecting absolute-form targets without
+an authority instead of reading a host from them.
+
+No, it is one string check shared by both parsers.
+
+Follow-up to #13855; needed by aio-libs/yarl#1937.
+
+- [x] I think the code is well written
+- [x] Unit tests for the changes exist
+- [ ] Documentation reflects the changes: N/A, no documented behavior
+changes
+- [ ] If you provide code modification, please add yourself to
+`CONTRIBUTORS.txt`: N/A, already listed
+- [x] Add a new news fragment into the `CHANGES/` folder
+
+Drafted with Claude Code (Claude Opus 5.5); reviewed by @asvetlov.
+
+<details>
+<summary>Agent run details (optional, for reviewers)</summary>
+
+Tests with the Cython extensions built (llhttp generated, `make
+cythonize`, `build_ext --inplace`): `pytest tests -n auto`, 5246 passed,
+22 skipped, 17 xfailed, both with yarl master (f761c37) and with the
+yarl#1937 branch (8d0f111). Pure-Python run of `test_http_parser.py`,
+`test_client_functional.py` and `test_client_session.py` with the
+yarl#1937 branch: 884 passed.
+Lint: black, isort, codespell passed. The local pre-commit flake8 hook
+fails to load `flake8-requirements` (`pkg_resources` missing), so flake8
+(E, F, W) was run directly and passed. yesqa was skipped for the same
+reason, because it wrongly strips `# noqa: I900`.
+</details>
+
+(cherry picked from commit ce960dd17e34f143762c14c32b9e14435ea7ce11)
+
+<!-- Thank you for your contribution! -->
+
+## What do these changes do?
+
+<!-- Please give a short brief about these changes. -->
+
+## Are there changes in behavior for the user?
+
+<!-- Outline any notable behaviour for the end users. -->
+
+## Is it a substantial burden for the maintainers to support this?
+
+<!--
+Stop right there! Pause. Just for a minute... Can you think of anything
+obvious that would complicate the ongoing development of this project?
+
+Try to consider if you'd be able to maintain it throughout the next
+5 years. Does it seem viable? Tell us your thoughts! We'd very much
+love to hear what the consequences of merging this patch might be...
+
+This will help us assess if your change is something we'd want to
+entertain early in the review process. Thank you in advance!
+-->
+
+## Related issue number
+
+<!-- Will this resolve any open issues? -->
+<!-- Remember to prefix with 'Fixes' if it closes an issue (e.g. 'Fixes
+#123'). -->
+
+## Checklist
+
+- [ ] I think the code is well written
+- [ ] Unit tests for the changes exist
+- [ ] Documentation reflects the changes
+- [ ] If you provide code modification, please add yourself to
+`CONTRIBUTORS.txt`
+  * The format is &lt;Name&gt; &lt;Surname&gt;.
+  * Please keep alphabetical order, the file is sorted by names.
+- [ ] Add a new news fragment into the `CHANGES/` folder
+  * name it `<issue_or_pr_num>.<type>.rst` (e.g. `588.bugfix.rst`)
+  * if you don't have an issue number, change it to the pull request
+    number after creating the PR
+    * `.bugfix`: A bug fix for something the maintainers deemed an
+      improper undesired behavior that got corrected to match
+      pre-agreed expectations.
+    * `.feature`: A new behavior, public APIs. That sort of stuff.
+    * `.deprecation`: A declaration of future API removals and breaking
+      changes in behavior.
+    * `.breaking`: When something public is removed in a breaking way.
+      Could be deprecated in an earlier release.
+    * `.doc`: Notable updates to the documentation structure or build
+      process.
+    * `.packaging`: Notes for downstreams about unobvious side effects
+      and tooling. Changes in the test invocation considerations and
+      runtime assumptions.
+    * `.contrib`: Stuff that affects the contributor experience. e.g.
+      Running tests, building the docs, setting up the development
+      environment.
+    * `.misc`: Changes that are hard to assign to any of the above
+      categories.
+  * Make sure to use full sentences with correct case and punctuation,
+    for example:
+    ```rst
+    Fixed issue with non-ascii contents in doctest text files
+    -- by :user:`contributor-gh-handle`.
+    ```
+
+    Use the past tense or the present tense a non-imperative mood,
+    referring to what's changed compared to the last released version
+    of this project.
+
+CVE: CVE-2026-111748
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/186065caf37d5999e91fd3d4ddfd03b43eb08801]
+
+Backport Changes:
+- Omit THREAT_MODEL.md because that file is absent in aiohttp 3.9.5.
+- Omit updates to the newer invalid-URL/redirect fixture groups and
+  response-payload tests, which do not exist in this version.
+- Preserve p1's explicit URL.port check inside the authority guard;
+  yarl 1.9.4 defers port validation for encoded URLs.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13858.bugfix.rst  |  7 +++++++
+ aiohttp/_http_parser.pyx  | 16 +++++++++-------
+ aiohttp/http_parser.py    | 16 ++++++++++++++++
+ tests/test_http_parser.py | 17 ++++++++++++++++-
+ 4 files changed, 48 insertions(+), 8 deletions(-)
+ create mode 100644 CHANGES/13858.bugfix.rst
+
+diff --git a/CHANGES/13858.bugfix.rst b/CHANGES/13858.bugfix.rst
+new file mode 100644
+index 00000000..9bd2d110
+--- /dev/null
++++ b/CHANGES/13858.bugfix.rst
+@@ -0,0 +1,7 @@
++Rejected absolute-form request targets without ``//`` or with an empty
++host, such as ``http:/example.com/`` or ``http:///example.com/``, before
++parsing them with yarl, which reads a host from them in its WHATWG mode;
++RFC 9110 requires a host for ``http`` and ``https``. The invalid URL test
++data no longer uses ``http:///example.com``, which such a yarl version
++parses as ``http://example.com/``, as browsers do
++-- by :user:`asvetlov`.
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 7d97bfe8..a5309a4c 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -31,7 +31,7 @@ from .http_exceptions import (
+     PayloadEncodingError,
+     TransferEncodingError,
+ )
+-from .http_parser import DeflateBuffer as _DeflateBuffer
++from .http_parser import DeflateBuffer as _DeflateBuffer, _has_authority
+ from .http_writer import (
+     HttpVersion as _HttpVersion,
+     HttpVersion10 as _HttpVersion10,
+@@ -719,12 +719,14 @@ cdef class HttpRequestParser(HttpParser):
+             else:
+                 # absolute-form for proxy maybe,
+                 # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.2
+-                try:
+-                    self._url = URL(self._path, encoded=True)
+-                    _ = self._url.port
+-                    host = self._url.raw_host
+-                except ValueError:
+-                    host = None
++                host = None
++                if _has_authority(self._path):
++                    try:
++                        self._url = URL(self._path, encoded=True)
++                        _ = self._url.port
++                        host = self._url.raw_host
++                    except ValueError:
++                        pass
+                 # https://www.rfc-editor.org/rfc/rfc9110#section-4.2.1-4
+                 if host is None:
+                     raise InvalidURLError(
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 789c2bdc..9b637938 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -87,6 +87,18 @@ VERSRE: Final[Pattern[str]] = re.compile(r"HTTP/(\d)\.(\d)", re.ASCII)
+ DIGITS: Final[Pattern[str]] = re.compile(r"\d+", re.ASCII)
+ HEXDIGITS: Final[Pattern[bytes]] = re.compile(rb"[0-9a-fA-F]+")
+ 
++
++def _has_authority(target: str) -> bool:
++    """Tell if an absolute-form request target has "//" and a non-empty authority.
++
++    RFC 9110 section 4.2 requires a host for http and https. yarl's default
++    WHATWG mode reads a host from "http:host/p" or "http:///host/p", so the
++    target is checked before it is parsed.
++    """
++    rest = target.partition(":")[2]
++    return rest[:2] == "//" and rest[2:3] not in ("", "/", "?", "#")
++
++
+ # RFC 9110 singleton headers — duplicates are rejected in strict mode.
+ # In lax mode (response parser default), the check is skipped entirely
+ # since real-world servers (e.g. Google APIs, Werkzeug) commonly send
+@@ -676,6 +688,10 @@ class HttpRequestParser(HttpParser[RawRequestMessage]):
+         else:
+             # absolute-form for proxy maybe,
+             # https://datatracker.ietf.org/doc/html/rfc7230#section-5.3.2
++            if not _has_authority(path):
++                raise InvalidURLError(
++                    path.encode(errors="surrogateescape").decode("latin1")
++                )
+             try:
+                 url = URL(path, encoded=True)
+                 _ = url.port
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index ebbb58d8..1b8c2da9 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -879,8 +879,23 @@ def test_url_authority_form_only_connect(parser: HttpRequestParser) -> None:
+         b"https:////protected",
+         b"https://:80/protected",
+         b"https://user@/protected",
++        b"https://",
++        b"https://?q",
++        b"http:protected/x",
++        b"http:/protected/x",
++        b"http:\\\\protected/x",
++    ),
++    ids=(
++        "empty-host",
++        "empty-host-extra-slash",
++        "port-only",
++        "userinfo-only",
++        "no-authority",
++        "empty-host-query",
++        "no-slashes",
++        "one-slash",
++        "backslashes",
+     ),
+-    ids=("empty-host", "empty-host-extra-slash", "port-only", "userinfo-only"),
+ )
+ def test_url_absolute_form_empty_host_rejected(
+     parser: HttpRequestParser, target: bytes
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 90475a5aff..db40e59a6b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -38,6 +38,8 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-54273_p2.patch \
            file://CVE-2026-111750.patch \
            file://CVE-2026-111749.patch \
+           file://CVE-2026-111748_p1.patch \
+           file://CVE-2026-111748_p2.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6
