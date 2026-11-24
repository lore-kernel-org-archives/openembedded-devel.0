Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12366.1795500918506451965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:15:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fKMYhbYL;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11019; q=dns/txt;
  s=iport01; t=1795500918; x=1796710518;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oEnXb/YiS/8hKshi5ySStKWAs9+d8E5pkWod3AlzLzI=;
  b=fKMYhbYLe3YeFKNTQxAphXL6hWYOqlISC03lsGjKelEH/cWwUgu+VmEl
   Axu2Ktn3O5HJ5nyBFBjvvjlzXTPAqIya9Ol0bfQIzacUIsQu2KipneWGx
   MijfGg06uchJo4k6bYdEPOk/gX7FdpU96OwFwp2rSCRuEce/RKr+sLc5V
   EF3FfGihkrLx04YE8Wr1OjVHX+VCKTaKYVxzG/eZjJOfCRkCq5PN1HB76
   N2N3dGK270F3wcG9eM28KGu76HR0gGHOcoirNwVDAFWDnJ6z40QFq+7En
   9Qufju+f8JHQY1xsP1M5S2InhDzg5+N3lKnxLKywnhPFmjEMz+lpH1k5d
   A==;
X-CSE-ConnectionGUID: sl4tCq9yREKur7I9rCjS9w==
X-CSE-MsgGUID: tBlTl4eZRwuB4A46qeYu3Q==
X-IPAS-Result: =?us-ascii?q?A0BJAgDhKgVr/8tK/pBaHgEBCxIMggULgld1YENJA5Qng?=
 =?us-ascii?q?iEDgROdFoF+DwEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCd?=
 =?us-ascii?q?AMRunaBeTOBAYMpAT8CQ1DZS4FoAQsUAYE4hUKIJF0YAYR9JxuBSUSBFYJ0d?=
 =?us-ascii?q?oEFgVwCiCYEgy6BVIEChCqBEIZbAoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTC?=
 =?us-ascii?q?SVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bC?=
 =?us-ascii?q?oEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD5uB5QUgkJXAQF6EwEHIgEBBBNoB?=
 =?us-ascii?q?gxPGDRLkyaSBIE1n1yEK4wkj0KFeBozhVulFwuWGoJjhVSFY4JTlgFQhGqBa?=
 =?us-ascii?q?DyBWTMaCBsVO4JnCUoZD445gXOBeIVkyHcmMgIJAy8BAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:xmXn5Kr5rkyDPlH6C41BgE/04yReBmJNZBIvgKrLsJaIsI4StFCzt
 garIBmCOqmKYTHxfIp+bIW+px4Av8XQm4c1HQFpqyE8QntE8ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8kg35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v1zXX1l7
 K0JEh0ucwrcprOs67CAG/Y506zPLOGzVG8eknht13TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9MYH49tL/Aan3XYiBCoV6YjaE2+GPUigd21dABNfKLIoXRH5kEwC50o
 Era1WDFBk0XBuaA1BDZ2y7yn+L+gHjCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:uL6UqagLQm0l6zA5x/cQKWzqWnBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AxkGuxWhzcmjT5uY+LD/obTdJqjJuaXmB0FzJcl6?=
 =?us-ascii?q?CJEV0UuK0GEW7+pg1jJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AjCwV+g+QIl7IHVUwE3NpA8qQf9tC55iqVE0/q4o?=
 =?us-ascii?q?bkZWtaXJpNgaA1w3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="60132496"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:15:14 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 24C0B180005F3
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:15:14 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id CC7A0CC12A8; Mon, 23 Nov 2026 22:15:12 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][wrynose][PATCH 3/3] python3-tornado: Fix CVE-2026-126347
Date: Mon, 23 Nov 2026 22:15:12 -0800
Message-Id: <20261124061512.1663330-3-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124061512.1663330-1-yurade@cisco.com>
References: <20261124061512.1663330-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132930
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/tornadoweb/tornado/commit/c503241622c0efe7c40110d89834ce8b7fead1e4
[2] https://ubuntu.com/security/CVE-2026-126347

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-tornado/CVE-2026-126347.patch     | 220 ++++++++++++++++++
 .../python/python3-tornado_6.5.7.bb           |   1 +
 2 files changed, 221 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-126347.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-126347.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-126347.patch
new file mode 100644
index 0000000000..fb53985fcf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-126347.patch
@@ -0,0 +1,220 @@
+From c503241622c0efe7c40110d89834ce8b7fead1e4 Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Thu, 29 Oct 2026 19:34:37 +0000
+Subject: [PATCH] web: Fix RedirectHandler open redirect with three or more leading slashes
+
+The scheme/netloc check added in 6.6.0 used urlsplit, which follows RFC
+3986 and sees an empty netloc in "///example.com". Browsers follow the
+WHATWG URL spec, which skips any run of slashes (and backslashes) before
+the host when resolving against an http or https URL, so a template like
+"/{0}" or "/{0}/b" could still be used as an open redirect with a request
+like "/a///example.com/". Collapse leading slash runs before comparing.
+
+Collapsing slashes is not enough on its own, because the expected scheme
+and netloc came from formatting the template with "/" as a placeholder,
+which turns "/{0}/b" into "///b". Instead, take the expected scheme and
+netloc from the part of the template before the first substitution. This
+also fixes a regression in 6.6.0, in which templates like "/{0}.html"
+rejected every request (the placeholder made "//.html").
+
+Also reject templates whose host would come entirely from a substitution
+(such as "https://{0}" or "https:{0}"), which 6.6.0 intended to reject
+but which could get through with extra slashes, and run the check after
+query arguments are appended, since url_concat can change the URL (on
+some Python versions it turns "https:host" into "https:///host").
+Redirect URLs that url_concat cannot parse, or that contain characters
+not allowed in a header, now get a 400 instead of a 500.
+
+CVE: CVE-2026-126347
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/c503241622c0efe7c40110d89834ce8b7fead1e4]
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_01VamvWqdwiBTCFwhDLCbBee
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 80 +++++++++++++++++++++++++++++++++++++++-
+ tornado/web.py           | 49 +++++++++++++++++-------
+ 2 files changed, 115 insertions(+), 14 deletions(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 1b6ad2b0..f1ec81f2 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -3789,6 +3789,9 @@ class RedirectHandlerTest(WebTestCase):
+             ("/src2", WebRedirectHandler, {"url": "/dst2?foo=bar"}),
+             (r"/any/(.*)", WebRedirectHandler, {"url": "{0}"}),
+             (r"/moved(.*)", WebRedirectHandler, {"url": "https://example.com{0}"}),
++            (r"/(.*)/target", WebRedirectHandler, {"url": "/{0}/destination"}),
++            (r"/hostless/(.*)", WebRedirectHandler, {"url": "https://{0}"}),
++            (r"/schemeonly/(.*)", WebRedirectHandler, {"url": "https:{0}"}),
+             (r"/(.*?)/(.*?)/(.*)", WebRedirectHandler, {"url": "/{1}/{0}/{2}"}),
+         ]
+ 
+@@ -3827,7 +3830,81 @@ class RedirectHandlerTest(WebTestCase):
+         # Browsers treat backslashes like slashes and ignore tabs and newlines,
+         # so these variants are also protocol-relative. Path arguments are
+         # url-decoded, so they can be smuggled in with percent-encoding.
+-        for path in ["/a/%5Cexample.com/b", "/a/%09/example.com/b"]:
++        # Browsers also skip any number of slashes before the host, so three
++        # or more slashes are just as protocol-relative as two.
++        for path in [
++            "/a/%5Cexample.com/b",
++            "/a/%09/example.com/b",
++            "/a///example.com/b",
++            "/a////example.com/b",
++            "/a/%2F%2F%5Cexample.com/b",
++        ]:
++            with self.subTest(path=path):
++                with ExpectLog(
++                    gen_log, ".*Redirect URL cannot change the scheme or netloc"
++                ):
++                    response = self.fetch(path, follow_redirects=False)
++                self.assertEqual(response.code, 400)
++
++    def test_substitution_after_first_slash(self):
++        # The substitution comes right after the first slash, so it can add a
++        # second slash (or more) but that must not reject ordinary values.
++        for path, location in [
++            ("/ok/target", "/ok/destination"),
++            ("/a/b/target", "/a/b/destination"),
++            ("/ok/target?x=1", "/ok/destination?x=1"),
++        ]:
++            with self.subTest(path=path):
++                response = self.fetch(path, follow_redirects=False)
++                self.assertEqual(response.code, 301)
++                self.assertEqual(response.headers["Location"], location)
++        for path in [
++            "/%2Fevil.com/target",
++            "/%2F%2Fevil.com/target",
++            "/%5C%5Cevil.com/target",
++            "/%09//evil.com/target",
++            "/%2Fevil.com/target?x=1",
++        ]:
++            with self.subTest(path=path):
++                with ExpectLog(
++                    gen_log, ".*Redirect URL cannot change the scheme or netloc"
++                ):
++                    response = self.fetch(path, follow_redirects=False)
++                self.assertEqual(response.code, 400)
++
++    def test_invalid_characters(self):
++        # These would otherwise be a 500 error from set_header.
++        for path in ["/any/%0Afoo", "/any/a%00b", "/any/%2F%2F%5B?x=1"]:
++            with self.subTest(path=path):
++                with ExpectLog(gen_log, ".*Redirect URL (contains invalid|cannot)"):
++                    response = self.fetch(path, follow_redirects=False)
++                self.assertEqual(response.code, 400)
++
++    def test_non_ascii(self):
++        # Non-ASCII characters (including ones that look like slashes) are
++        # fine, and are sent as UTF-8.
++        for value in ["\u00e9", "\u4e2d\u6587", "\uff0f\uff0fexample.com"]:
++            with self.subTest(value=value):
++                response = self.fetch(
++                    "/any/" + urllib.parse.quote(value), follow_redirects=False
++                )
++                self.assertEqual(response.code, 301)
++                # Header values are decoded as latin1.
++                self.assertEqual(
++                    response.headers["Location"], utf8(value).decode("latin1")
++                )
++
++    def test_substitution_in_host(self):
++        # Substitutions cannot supply the host, even with extra slashes
++        # (which urlsplit and browsers disagree about) or a query string
++        # (which some versions of urlunsplit turn into extra slashes).
++        for path in [
++            "/hostless/evil.com",
++            "/hostless//evil.com",
++            "/schemeonly/evil.com",
++            "/schemeonly/evil.com?x=1",
++            "/schemeonly////evil.com",
++        ]:
+             with self.subTest(path=path):
+                 with ExpectLog(
+                     gen_log, ".*Redirect URL cannot change the scheme or netloc"
+@@ -3856,6 +3933,7 @@ class RedirectHandlerTest(WebTestCase):
+         for path in [
+             "/any/https://evil.com/",
+             "/any/%5C%5Cevil.com/",
++            "/any////evil.com/",
+             "/any/javascript:alert(1)",
+         ]:
+             with self.subTest(path=path):
+diff --git a/tornado/web.py b/tornado/web.py
+index 0609b4f0..6e6725f0 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -73,6 +73,7 @@ import os.path
+ import re
+ import socket
+ import stat
++import string
+ import sys
+ import threading
+ import time
+@@ -2713,23 +2714,40 @@ class RedirectHandler(RequestHandler):
+     def get(self, *args: Any, **kwargs: Any) -> None:
+         to_url = self._url.format(*args, **kwargs)
+         # The scheme and netloc of the redirect must come from the template, not
+-        # from the request. Find out what they are by formatting the template
+-        # with a placeholder that cannot extend a scheme or netloc.
+-        expected_url = self._url.format(
+-            *("/" for _ in args), **{k: "/" for k in kwargs}
+-        )
++        # from the request. Find out what they are from the part of the template
++        # before the first substitution. (Formatting the whole template with a
++        # placeholder doesn't work: whatever the placeholder is, it can turn the
++        # template into a URL with a different netloc, as "/" does for "/{0}/b".)
++        prefix = ""
++        has_substitution = False
++        for literal, field, _, _ in string.Formatter().parse(self._url):
++            prefix += literal
++            if field is not None:
++                has_substitution = True
++                break
+         try:
+-            unchanged = _scheme_and_netloc(to_url) == _scheme_and_netloc(expected_url)
++            if self.request.query_arguments:
++                # Query arguments are added before the check because url_concat
++                # can change the rest of the URL.
++                # TODO: figure out typing for the next line.
++                to_url = httputil.url_concat(
++                    to_url,
++                    list(httputil.qs_to_qsl(self.request.query_arguments)),  # type: ignore
++                )
++            scheme, netloc = _scheme_and_netloc(prefix)
++            unchanged = _scheme_and_netloc(to_url) == (scheme, netloc)
++            if has_substitution and scheme in ("http", "https") and not netloc:
++                # The host would come entirely from a substitution (or a
++                # browser would find one where urlsplit doesn't, as in
++                # "https:///host").
++                unchanged = False
+         except ValueError:
+             unchanged = False
+         if not unchanged:
+             raise HTTPError(400, "Redirect URL cannot change the scheme or netloc")
+-        if self.request.query_arguments:
+-            # TODO: figure out typing for the next line.
+-            to_url = httputil.url_concat(
+-                to_url,
+-                list(httputil.qs_to_qsl(self.request.query_arguments)),  # type: ignore
+-            )
++        if httputil._FORBIDDEN_HEADER_CHARS_RE.search(to_url):
++            # Let this be a 400 rather than a 500 from set_header.
++            raise HTTPError(400, "Redirect URL contains invalid characters")
+         self.redirect(to_url, permanent=self._permanent)
+ 
+ 
+@@ -4067,5 +4085,10 @@ def _scheme_and_netloc(url: str) -> tuple[str, str]:
+     Both are empty for a relative URL. Raises `ValueError` for some malformed
+     URLs.
+     """
+-    parts = urllib.parse.urlsplit(_normalize_url_like_browser(url))
++    url = _normalize_url_like_browser(url)
++    # urlsplit follows RFC 3986, in which "///example.com" has an empty netloc,
++    # but browsers resolving it against an http or https URL skip any number of
++    # slashes before the host. Collapse them so urlsplit sees the same host.
++    url = re.sub(r"^//+", "//", url)
++    parts = urllib.parse.urlsplit(url)
+     return parts.scheme.lower(), parts.netloc.lower()
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index 3a131fc382..a4fe5b7d07 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://CVE-2026-91990.patch \
             file://CVE-2026-123534_p1.patch \
             file://CVE-2026-123534_p2.patch \
             file://CVE-2026-123534_p3.patch \
+            file://CVE-2026-126347.patch \
 "
 
 inherit pypi python_setuptools_build_meta
-- 
2.53.0

