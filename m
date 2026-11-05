Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28858.1793862502132422203
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Axx29mhp;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5754; q=dns/txt;
  s=iport01; t=1793862502; x=1795072102;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7IwY7AtzvKUwedeocAnsI6b4cRsjtgb+i2rViI/9Vyk=;
  b=Axx29mhpx2Ud9hhNgaXE8MotZ4SnWchU7FZxMj/KJ+GPgUXxPpfgBoXv
   4rUFG1YnzC3GwmImJYGprV7ZE6FWraHKlloHECiM23MykDIinkmkOI8zZ
   TYw9eNPs/5zidVbyjSc0EcGQCW1kqZSn3uJ25T4l4bVLuUkdhnB76hm1V
   NA/hlO0eY7s6Wwhn7b6S0AlV8G1kgUqoIY3YSOduvDFkAuQahyoQPipDY
   BE5VLC0J0Xa2bhWL1ISv3sgrQo7kcTPFXgAPqje7xRHf7RjvhbMx4ic3x
   VESNM8W4/tPfWatMowWWZV9Nv2uz54/y+lucQIg3BE/AocdgtmkmPHN65
   A==;
X-CSE-ConnectionGUID: GK/DhZzbQGq8PM8wVB9ZKA==
X-CSE-MsgGUID: MfhMmwq6S9ygWEOca20oWw==
X-IPAS-Result: =?us-ascii?q?A0AaAABGKuxq/4r/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKHOIIhA54hgX4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BA?=
 =?us-ascii?q?gQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAzIBGAE9H?=
 =?us-ascii?q?AMBAi8rIwgZgwIBgnQDEbw+giyBAYMpAT8CQ1DZS4FoAQsUAYE4AYU/iCNdG?=
 =?us-ascii?q?AGEfScbgUlEhH6BBYFcAQGBJwYLEIZeBIMugVqBA4wVAoFShnFIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyheIYEIgXYCg?=
 =?us-ascii?q?lGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0Mc?=
 =?us-ascii?q?jkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MRMV0BExgXNjIGG6cCoRGEK?=
 =?us-ascii?q?owkj0KFeBozhASBV5JCklQLmH2OCpU1TFCEaYFoPIFHCwczGggbFTuCZwlKG?=
 =?us-ascii?q?Q+KHoQNDguBaIF4gX+DZch3JjICCTIBAQcCBw4DC4FokAABJ4FWAQE?=
IronPort-Data: A9a23:jNdaLayh84fZPVdGPxd6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVTm
 DccWGrTb66NZ2T2fd1+OoWx/RwCuJODxt8xTAZprFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJG4VeqEYyPR9OE5Xp
 cQ9eC8zREGxpMvjldpXSsE07igiBNPgMIVavjRryivUSK5/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bM3WjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeS2boGPK4PQLSlTtmOWp
 kfD4H2nOUALO+Oy7jGMqCqrufCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:rgnYeKwUJrjE8y97xqWxKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:Qz3EY2GNDQSbrX2cqmJI1wk4GvI3eETy1SfoBh+nN0w4ep68HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AC4h+vQw4hT+wDtlINnu2QPJV/f6aqIGgCGUIjox?=
 =?us-ascii?q?YgJiVOhNdHDyU1mywfZByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="543632972"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:08:21 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 05C73180001FC
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 07:08:21 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 9D6C5CC12A7; Wed,  4 Nov 2026 23:08:20 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 1/6] python3-tornado: Fix CVE-2026-103261
Date: Wed,  4 Nov 2026 23:08:14 -0800
Message-Id: <20261105070819.2086816-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105070819.2086816-1-yurade@cisco.com>
References: <20261105070819.2086816-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131863
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/tornadoweb/tornado/commit/03945136ea9746eccf61caf88edae39642e59c93
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-103261

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-tornado/CVE-2026-103261.patch     | 98 +++++++++++++++++++
 .../python/python3-tornado_6.5.7.bb           |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103261.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103261.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103261.patch
new file mode 100644
index 0000000000..f603b4b24a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103261.patch
@@ -0,0 +1,98 @@
+From 03945136ea9746eccf61caf88edae39642e59c93 Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Sun, 13 Sep 2026 03:32:19 +0000
+Subject: [PATCH] httputil: Apply the argument count limit to query strings
+
+parse_body_arguments limits the number of fields in a urlencoded body
+(added in 6.5.8), but HTTPServerRequest.__init__ parsed the query string
+with no such limit, so the same superlinear parsing cost was reachable
+through the request line instead of the body.
+
+Measured on the unpatched code, a query string with 400k fields took
+3.2s of CPU to parse. In the default configuration the request line is
+bounded by max_header_size (64KB), which caps this at roughly 12,700
+arguments and ~47ms per request, but that is still an order of magnitude
+past the limit the body path enforces, and applications are free to
+raise max_header_size.
+
+Pass the same max_arguments limit here. Over-limit query strings now
+raise HTTPInputError, which the server already turns into a 400.
+
+The limit is read from the global _DEFAULT_PARSE_BODY_CONFIG because
+HTTPServerRequest has no access to any per-connection configuration.
+This is the same limitation the body path already has in practice:
+_parse_body calls parse_body_arguments without a config, so the body
+limit is likewise only adjustable through set_parse_body_config.
+
+CVE: CVE-2026-103261
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/03945136ea9746eccf61caf88edae39642e59c93]
+
+Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_01JD7LUuFMdyPJB1Dwdq6fPg
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/httputil.py           | 14 +++++++++++++-
+ tornado/test/httputil_test.py | 15 +++++++++++++++
+ 2 files changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/tornado/httputil.py b/tornado/httputil.py
+index b80c796c..6a5db233 100644
+--- a/tornado/httputil.py
++++ b/tornado/httputil.py
+@@ -550,7 +550,19 @@ class HTTPServerRequest:
+ 
+         if uri is not None:
+             self.path, sep, self.query = uri.partition("?")
+-        self.arguments = parse_qs_bytes(self.query, keep_blank_values=True)
++        try:
++            self.arguments = parse_qs_bytes(
++                self.query,
++                keep_blank_values=True,
++                # The query string is bounded by max_header_size, but parsing
++                # is expensive enough per field to be worth limiting. Use the
++                # same limit as a urlencoded body. This reads the global
++                # config because HTTPServerRequest has no access to the
++                # per-connection configuration; see set_parse_body_config.
++                max_num_fields=_DEFAULT_PARSE_BODY_CONFIG.urlencoded.max_arguments,
++            )
++        except Exception as e:
++            raise HTTPInputError("Invalid query string: %s" % e) from e
+         self.query_arguments = copy.deepcopy(self.arguments)
+         self.body_arguments = {}  # type: Dict[str, List[bytes]]
+ 
+diff --git a/tornado/test/httputil_test.py b/tornado/test/httputil_test.py
+index afb15879..0e9d5c41 100644
+--- a/tornado/test/httputil_test.py
++++ b/tornado/test/httputil_test.py
+@@ -11,6 +11,7 @@ from tornado.httputil import (
+     HTTPInputError,
+     HTTPFile,
+     ParseMultipartConfig,
++    _DEFAULT_PARSE_BODY_CONFIG,
+ )
+ from tornado.escape import utf8, native_str
+ from tornado.log import gen_log
+@@ -658,6 +659,20 @@ class HTTPServerRequestTest(unittest.TestCase):
+         )
+         self.assertNotIn("Canary", repr(request))
+ 
++    def test_query_arguments_within_limit(self):
++        n = _DEFAULT_PARSE_BODY_CONFIG.urlencoded.max_arguments
++        request = HTTPServerRequest(uri="/?" + "&".join("a=%d" % i for i in range(n)))
++        self.assertEqual(len(request.arguments["a"]), n)
++
++    def test_max_query_arguments(self):
++        # The query string is subject to the same limit on the number of
++        # arguments as a urlencoded body: parsing is superlinear enough in
++        # the number of fields to be worth bounding.
++        n = _DEFAULT_PARSE_BODY_CONFIG.urlencoded.max_arguments + 1
++        with self.assertRaises(HTTPInputError) as cm:
++            HTTPServerRequest(uri="/?" + "&".join("a=%d" % i for i in range(n)))
++        self.assertIn("Max number of fields exceeded", str(cm.exception))
++
+ 
+ class ParseRequestStartLineTest(unittest.TestCase):
+     METHOD = "GET"
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index 332d5875e6..a1b016d818 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -11,6 +11,7 @@ SRC_URI[sha256sum] = "66c513a76cda70d53907bc27cf1447557699c2e95aa48ba27a442ff61c
 SRC_URI += "file://CVE-2026-91990.patch \
             file://CVE-2026-82397.patch \
             file://CVE-2026-91991.patch \
+            file://CVE-2026-103261.patch \
 "
 
 inherit pypi python_setuptools_build_meta
-- 
2.35.6

