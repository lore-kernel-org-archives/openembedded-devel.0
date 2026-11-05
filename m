Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28859.1793862502181832854
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cZikn5h3;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=18543; q=dns/txt;
  s=iport01; t=1793862502; x=1795072102;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SK08MsGbiIcAfo8gMpFZwx3QhXX7krb5YekfmbmglGs=;
  b=cZikn5h3vQMWqZuhJIQlR/0kZ4S3DJMu18dB1RemDHBOdb8LNA9pTUkO
   AenpTI9R/9TAA6zqjL8zmZaWBZ41SPmP+xY0vroWKXtNjr4yIorObEL+a
   XLZKvNScN28yiBxdaIHtxS8zF/9Qns7PT7T2Hgz9HRJMuJJujqzXU75pa
   72Z/+BvlApZUv4bEpc8LLW9CJlitQojUNSdkRXuJwagG6pGPufs/eB7O/
   qMdO3pZLqky7cYQFbQ/qQrbI3m7wGc0qjpHWNqJXIwZMxpbjPjXTC7vWC
   j1LzmSa/i28aRoIF+J9wPGnuEbQ10HlfbxlpswIcaCJfmvQofUS7yNo7L
   A==;
X-CSE-ConnectionGUID: uKMO/SwoRvGMXVLS/VJU7w==
X-CSE-MsgGUID: zWjzCEqaR660yUpVZOz/+w==
X-IPAS-Result: =?us-ascii?q?A0AnAAC/Kexq/5P/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKHOIIhA4ETnQ4UgWoPAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDA?=
 =?us-ascii?q?QIWGSsjCBmDAgGCdAMRvD6BeTOBAYMpAT8CQ1DZS4FoAQsUAYE4AYU/iCNdG?=
 =?us-ascii?q?AGEfScbgUlEgRWCc3aBBYFcAQGBGS9XhgcEgy6BWoEDjBUCgVKGcUiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBd?=
 =?us-ascii?q?gKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCD?=
 =?us-ascii?q?QxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB5Ivgjk4HwEBehMBBwMgAQRML?=
 =?us-ascii?q?xJnDUOlWp9TgT6EKowkj0KFeBozhVulFguWGoJjhVSFY4JTlgFQhGmBaDyBK?=
 =?us-ascii?q?BsECwczGggbFTuCZwlKGQ+OKw4LgWiBeIF/g2XIdyYyAgkyAQEHAgcOAwuBa?=
 =?us-ascii?q?JF+AQE?=
IronPort-Data: A9a23:Axz4M6OPP/9dhtDvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUor12AAz
 WQXDzuAOPbfZGGnftFza4i1/E0A7Z6AmoNqSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2IsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+hNKWZxBpIfwPhYJFFw0
 cdfFhIwMQ/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzM3wsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kVAqgeC8aYeKEjCMbddqnFSzi
 3vPxTqnWgAnLOKt7ijCsW3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:3LH9/6q2HNUiW7LCE3qm70oaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:xn+OpGwNqSsbbeRLN5ltBgUJOeUCNUbCy03ODGqIN0JSD4O3dACPrfY=
X-Talos-MUID: 9a23:m3tYdQWOlqwtwFLq/C3ThiNJGd5h2frwUFEwias0nNvDdjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="543909157"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:08:21 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 63AF4180008A7
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 07:08:21 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id BA012CC124C; Wed,  4 Nov 2026 23:08:20 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 6/6] python3-tornado: Fix CVE-2026-116578
Date: Wed,  4 Nov 2026 23:08:19 -0800
Message-Id: <20261105070819.2086816-7-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105070819.2086816-1-yurade@cisco.com>
References: <20261105070819.2086816-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131866
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [4],
using the commit shown in [1], [2] and [3].

[1] https://github.com/tornadoweb/tornado/commit/940ea725bdd9bc68231d68a105eef17ea6e11233
[2] https://github.com/tornadoweb/tornado/commit/ccb6a2e5482f17997efd4a74b8200d5b4babc035
[3] https://github.com/tornadoweb/tornado/commit/cc75ab0eb3af459c714895a49f682ad354f50117
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-116578

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-tornado/CVE-2026-116578_p1.patch  |  62 ++++++
 .../python3-tornado/CVE-2026-116578_p2.patch  | 106 ++++++++++
 .../python3-tornado/CVE-2026-116578_p3.patch  | 192 ++++++++++++++++++
 .../python/python3-tornado_6.5.7.bb           |   3 +
 4 files changed, 363 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p3.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p1.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p1.patch
new file mode 100644
index 0000000000..5a146dfda5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p1.patch
@@ -0,0 +1,62 @@
+From 940ea725bdd9bc68231d68a105eef17ea6e11233 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Tue, 6 Oct 2026 13:06:04 -0400
+Subject: [PATCH] web: Block open redirects in RedirectHandler
+
+When the redirect target is formatted from parts of the input, and
+one of those parts appears at the start of the new URL, this can
+be used to construct protocol-relative URLs which effectively
+make an open redirect. Now we refuse to redirect to a
+protocol-relative URL unless the double slash was present in the
+configured pattern.
+
+CVE: CVE-2026-116578
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/940ea725bdd9bc68231d68a105eef17ea6e11233]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 12 ++++++++++++
+ tornado/web.py           |  4 ++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 3ecb3ef5..6008fb50 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -3565,6 +3565,18 @@ class RedirectHandlerTest(WebTestCase):
+         self.assertEqual(response.code, 301)
+         self.assertEqual(response.headers["Location"], "/b/a/c")
+ 
++    def test_redirect_double_slash(self):
++        # Note that the redirect pattern we're using reorders the components.
++        response = self.fetch("/a/example.com/b", follow_redirects=False)
++        self.assertEqual(response.code, 301)
++        self.assertEqual(response.headers["Location"], "/example.com/a/b")
++
++        # With a double slash this becomes //example.com/a/b, which is a protocol-relative
++        # redirect to another host, which we disallow because it is an open redirect.
++        with ExpectLog(app_log, "Uncaught exception"):
++            response = self.fetch("/a//example.com/a/b", follow_redirects=False)
++        self.assertEqual(response.code, 500)
++
+ 
+ class AcceptLanguageTest(WebTestCase):
+     """Test evaluation of Accept-Language header"""
+diff --git a/tornado/web.py b/tornado/web.py
+index d3257221..be3b07c0 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -2707,6 +2707,10 @@ class RedirectHandler(RequestHandler):
+                 to_url,
+                 list(httputil.qs_to_qsl(self.request.query_arguments)),  # type: ignore
+             )
++        if to_url.startswith("//") and not self._url.startswith("//"):
++            raise ValueError(
++                "Redirect URL cannot start with '//' if template does not."
++            )
+         self.redirect(to_url, permanent=self._permanent)
+ 
+ 
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p2.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p2.patch
new file mode 100644
index 0000000000..9a41ca93eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p2.patch
@@ -0,0 +1,106 @@
+From ccb6a2e5482f17997efd4a74b8200d5b4babc035 Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Sat, 10 Oct 2026 16:48:22 +0000
+Subject: [PATCH] web: Catch backslash and whitespace variants of
+ protocol-relative redirects
+
+The open-redirect checks in RedirectHandler and StaticFileHandler only
+looked for a literal leading "//". Browsers follow the WHATWG URL spec,
+which treats backslashes like slashes and drops tabs and newlines, so
+Location headers such as "/\evil.com" or "/<TAB>/evil.com" are also
+protocol-relative redirects to another host.
+
+RedirectHandler was exploitable this way because path arguments are
+url-decoded before they are substituted into the template, so a link
+to e.g. /%5Cevil.com/... produced a raw backslash in the redirect.
+StaticFileHandler checks the undecoded request path, which a browser
+cannot make contain a raw backslash, but harden it the same way.
+
+CVE: CVE-2026-116578
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/ccb6a2e5482f17997efd4a74b8200d5b4babc035]
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_01Jhn71YM65mTQ8sdDrEMwS8
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 16 ++++++++++++++++
+ tornado/web.py           | 18 ++++++++++++++++--
+ 2 files changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 6008fb50..b6b62e96 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -1763,6 +1763,13 @@ class StaticDefaultFilenameRootTest(WebTestCase):
+             )
+         self.assertEqual(response.code, 403)
+ 
++    def test_no_open_redirect_backslash(self):
++        # Browsers treat a backslash like a slash, so a redirect to /\evil.com
++        # is protocol-relative too. This form doesn't need the server-side path.
++        with ExpectLog(gen_log, ".*cannot redirect path with two initial slashes"):
++            response = self.fetch("/\\evil.com/../dir", follow_redirects=False)
++        self.assertEqual(response.code, 403)
++
+ 
+ class StaticFileWithPathTest(WebTestCase):
+     def get_app_kwargs(self):
+@@ -3577,6 +3584,15 @@ class RedirectHandlerTest(WebTestCase):
+             response = self.fetch("/a//example.com/a/b", follow_redirects=False)
+         self.assertEqual(response.code, 500)
+ 
++        # Browsers treat backslashes like slashes and ignore tabs and newlines,
++        # so these variants are also protocol-relative. Path arguments are
++        # url-decoded, so they can be smuggled in with percent-encoding.
++        for path in ["/a/%5Cexample.com/b", "/a/%09/example.com/b"]:
++            with self.subTest(path=path):
++                with ExpectLog(app_log, "Uncaught exception"):
++                    response = self.fetch(path, follow_redirects=False)
++                self.assertEqual(response.code, 500)
++
+ 
+ class AcceptLanguageTest(WebTestCase):
+     """Test evaluation of Accept-Language header"""
+diff --git a/tornado/web.py b/tornado/web.py
+index be3b07c0..62c0f7d5 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -2707,7 +2707,7 @@ class RedirectHandler(RequestHandler):
+                 to_url,
+                 list(httputil.qs_to_qsl(self.request.query_arguments)),  # type: ignore
+             )
+-        if to_url.startswith("//") and not self._url.startswith("//"):
++        if _is_protocol_relative(to_url) and not _is_protocol_relative(self._url):
+             raise ValueError(
+                 "Redirect URL cannot start with '//' if template does not."
+             )
+@@ -3034,7 +3034,7 @@ class StaticFileHandler(RequestHandler):
+             # but there is some prefix to the path that was already
+             # trimmed by the routing
+             if not self.request.path.endswith("/"):
+-                if self.request.path.startswith("//"):
++                if _is_protocol_relative(self.request.path):
+                     # A redirect with two initial slashes is a "protocol-relative" URL.
+                     # This means the next path segment is treated as a hostname instead
+                     # of a part of the path, making this effectively an open redirect.
+@@ -3926,3 +3926,17 @@ def _create_signature_v2(secret: Union[str, bytes], s: bytes) -> bytes:
+ 
+ def is_absolute(path: str) -> bool:
+     return any(path.startswith(x) for x in ["/", "http:", "https:"])
++
++
++def _is_protocol_relative(url: str) -> bool:
++    """Returns True if a browser would treat ``url`` as a protocol-relative URL.
++
++    A protocol-relative URL (``//example.com/path``) names a host, so redirecting
++    to one that was built from untrusted input is an open redirect. Browsers
++    follow the WHATWG URL spec, which strips leading control characters and
++    spaces, removes tabs and newlines anywhere in the URL, and treats backslashes
++    like forward slashes, so a plain ``startswith("//")`` check is not enough.
++    """
++    url = url.lstrip("".join(chr(i) for i in range(0x21)))
++    url = url.replace("\t", "").replace("\n", "").replace("\r", "")
++    return url[:1] in ("/", "\\") and url[1:2] in ("/", "\\")
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p3.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p3.patch
new file mode 100644
index 0000000000..e57924d6bf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p3.patch
@@ -0,0 +1,192 @@
+From cc75ab0eb3af459c714895a49f682ad354f50117 Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Sat, 10 Oct 2026 17:56:53 +0000
+Subject: [PATCH] web: Don't let RedirectHandler substitutions change the
+ scheme or netloc
+
+Rather than looking only for protocol-relative URLs, RedirectHandler now
+requires the scheme and netloc (user info, host, and port) of the
+redirect to be the same as those of the template formatted with
+placeholder values. This also covers templates like
+"https://example.com{0}", where a substitution could extend the host
+(".evil.com") or add user info ("@evil.com"), and templates beginning
+with a substitution, which could otherwise be given an absolute URL.
+Such requests, and protocol-relative ones, now get a 400 response
+instead of a 500 from an uncaught ValueError.
+
+A consequence is that substitutions can no longer be used in the scheme
+or netloc part of a template.
+
+CVE: CVE-2026-116578
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/cc75ab0eb3af459c714895a49f682ad354f50117]
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_01Jhn71YM65mTQ8sdDrEMwS8
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 42 ++++++++++++++++++++++++++---
+ tornado/web.py           | 58 ++++++++++++++++++++++++++++++++--------
+ 2 files changed, 85 insertions(+), 15 deletions(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index b6b62e96..1438b6f3 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -3549,6 +3549,8 @@ class RedirectHandlerTest(WebTestCase):
+         return [
+             ("/src", WebRedirectHandler, {"url": "/dst"}),
+             ("/src2", WebRedirectHandler, {"url": "/dst2?foo=bar"}),
++            (r"/any/(.*)", WebRedirectHandler, {"url": "{0}"}),
++            (r"/moved(.*)", WebRedirectHandler, {"url": "https://example.com{0}"}),
+             (r"/(.*?)/(.*?)/(.*)", WebRedirectHandler, {"url": "/{1}/{0}/{2}"}),
+         ]
+ 
+@@ -3580,18 +3582,50 @@ class RedirectHandlerTest(WebTestCase):
+ 
+         # With a double slash this becomes //example.com/a/b, which is a protocol-relative
+         # redirect to another host, which we disallow because it is an open redirect.
+-        with ExpectLog(app_log, "Uncaught exception"):
++        with ExpectLog(gen_log, ".*Redirect URL cannot change the scheme or netloc"):
+             response = self.fetch("/a//example.com/a/b", follow_redirects=False)
+-        self.assertEqual(response.code, 500)
++        self.assertEqual(response.code, 400)
+ 
+         # Browsers treat backslashes like slashes and ignore tabs and newlines,
+         # so these variants are also protocol-relative. Path arguments are
+         # url-decoded, so they can be smuggled in with percent-encoding.
+         for path in ["/a/%5Cexample.com/b", "/a/%09/example.com/b"]:
+             with self.subTest(path=path):
+-                with ExpectLog(app_log, "Uncaught exception"):
++                with ExpectLog(
++                    gen_log, ".*Redirect URL cannot change the scheme or netloc"
++                ):
++                    response = self.fetch(path, follow_redirects=False)
++                self.assertEqual(response.code, 400)
++
++    def test_redirect_cannot_change_host(self):
++        # Substitutions directly after the host can extend it or add userinfo.
++        response = self.fetch("/moved/x", follow_redirects=False)
++        self.assertEqual(response.code, 301)
++        self.assertEqual(response.headers["Location"], "https://example.com/x")
++        for path in ["/moved.evil.com/x", "/moved@evil.com/x", "/moved:8080/x"]:
++            with self.subTest(path=path):
++                with ExpectLog(
++                    gen_log, ".*Redirect URL cannot change the scheme or netloc"
++                ):
++                    response = self.fetch(path, follow_redirects=False)
++                self.assertEqual(response.code, 400)
++
++    def test_template_starting_with_substitution(self):
++        # A relative URL is fine, but the client cannot supply an absolute one.
++        response = self.fetch("/any/foo/bar", follow_redirects=False)
++        self.assertEqual(response.code, 301)
++        self.assertEqual(response.headers["Location"], "foo/bar")
++        for path in [
++            "/any/https://evil.com/",
++            "/any/%5C%5Cevil.com/",
++            "/any/javascript:alert(1)",
++        ]:
++            with self.subTest(path=path):
++                with ExpectLog(
++                    gen_log, ".*Redirect URL cannot change the scheme or netloc"
++                ):
+                     response = self.fetch(path, follow_redirects=False)
+-                self.assertEqual(response.code, 500)
++                self.assertEqual(response.code, 400)
+ 
+ 
+ class AcceptLanguageTest(WebTestCase):
+diff --git a/tornado/web.py b/tornado/web.py
+index 62c0f7d5..0b67216a 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -2693,6 +2693,14 @@ class RedirectHandler(RequestHandler):
+     .. versionchanged:: 5.0
+        If any query arguments are present, they will be copied to the
+        destination URL.
++
++    .. versionchanged:: 6.6
++       Substituted values may no longer change the scheme or netloc (user
++       info, host, and port) of the destination URL. For example, with a
++       ``url`` of ``"/{0}/b"``, a request that would redirect to
++       ``//example.com/b`` (a protocol-relative URL pointing to another host)
++       now fails with a 400 error. As a consequence, substitutions cannot be
++       used in the scheme or netloc part of the ``url``.
+     """
+ 
+     def initialize(self, url: str, permanent: bool = True) -> None:
+@@ -2701,16 +2709,24 @@ class RedirectHandler(RequestHandler):
+ 
+     def get(self, *args: Any, **kwargs: Any) -> None:
+         to_url = self._url.format(*args, **kwargs)
++        # The scheme and netloc of the redirect must come from the template, not
++        # from the request. Find out what they are by formatting the template
++        # with a placeholder that cannot extend a scheme or netloc.
++        expected_url = self._url.format(
++            *("/" for _ in args), **{k: "/" for k in kwargs}
++        )
++        try:
++            unchanged = _scheme_and_netloc(to_url) == _scheme_and_netloc(expected_url)
++        except ValueError:
++            unchanged = False
++        if not unchanged:
++            raise HTTPError(400, "Redirect URL cannot change the scheme or netloc")
+         if self.request.query_arguments:
+             # TODO: figure out typing for the next line.
+             to_url = httputil.url_concat(
+                 to_url,
+                 list(httputil.qs_to_qsl(self.request.query_arguments)),  # type: ignore
+             )
+-        if _is_protocol_relative(to_url) and not _is_protocol_relative(self._url):
+-            raise ValueError(
+-                "Redirect URL cannot start with '//' if template does not."
+-            )
+         self.redirect(to_url, permanent=self._permanent)
+ 
+ 
+@@ -3928,15 +3944,35 @@ def is_absolute(path: str) -> bool:
+     return any(path.startswith(x) for x in ["/", "http:", "https:"])
+ 
+ 
++def _normalize_url_like_browser(url: str) -> str:
++    """Approximates how a browser cleans up a URL before parsing it.
++
++    Browsers follow the WHATWG URL spec, which strips leading and trailing
++    control characters and spaces, removes tabs and newlines anywhere in the
++    URL, and (for http and https) treats backslashes like forward slashes. Checks
++    on redirect URLs built from untrusted input must account for this.
++    """
++    url = url.strip("".join(chr(i) for i in range(0x21)))
++    url = url.replace("\t", "").replace("\n", "").replace("\r", "")
++    return url.replace("\\", "/")
++
++
+ def _is_protocol_relative(url: str) -> bool:
+     """Returns True if a browser would treat ``url`` as a protocol-relative URL.
+ 
+     A protocol-relative URL (``//example.com/path``) names a host, so redirecting
+-    to one that was built from untrusted input is an open redirect. Browsers
+-    follow the WHATWG URL spec, which strips leading control characters and
+-    spaces, removes tabs and newlines anywhere in the URL, and treats backslashes
+-    like forward slashes, so a plain ``startswith("//")`` check is not enough.
++    to one that was built from untrusted input is an open redirect.
+     """
+-    url = url.lstrip("".join(chr(i) for i in range(0x21)))
+-    url = url.replace("\t", "").replace("\n", "").replace("\r", "")
+-    return url[:1] in ("/", "\\") and url[1:2] in ("/", "\\")
++    return _normalize_url_like_browser(url).startswith("//")
++
++
++def _scheme_and_netloc(url: str) -> tuple[str, str]:
++    """Returns the scheme and netloc a browser would see in ``url``.
++
++    The netloc includes the user info and port as well as the host.
++
++    Both are empty for a relative URL. Raises `ValueError` for some malformed
++    URLs.
++    """
++    parts = urllib.parse.urlsplit(_normalize_url_like_browser(url))
++    return parts.scheme.lower(), parts.netloc.lower()
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index 87b6721320..dd61da78be 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -19,6 +19,9 @@ SRC_URI += "file://CVE-2026-91990.patch \
             file://CVE-2026-116577_p1.patch \
             file://CVE-2026-116577_p2.patch \
             file://CVE-2026-116577_p3.patch \
+            file://CVE-2026-116578_p1.patch \
+            file://CVE-2026-116578_p2.patch \
+            file://CVE-2026-116578_p3.patch \
 "
 
 inherit pypi python_setuptools_build_meta
-- 
2.35.6

