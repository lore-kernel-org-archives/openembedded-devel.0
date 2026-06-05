Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA35BCD6E7B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 09:52:47 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4806.1780653158170296309
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2026 02:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cBD4MvfM;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11330; q=dns/txt;
  s=iport01; t=1780653158; x=1781862758;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N4bkMVmBlRRdU8x4DcUCuZwdZb5HgblLu3rsU2q7V00=;
  b=cBD4MvfMnEg+pznOPwVoJW/5wO0sVVQLgEXmuBLBbZP3SnMyosHKgQcN
   EdYjQhvq2x53ER84xZq3pSLly3hrHh/kdPALO1PDkweY5QJrVazh67m9w
   ZbwKaB7A0DP7LWSkfiES46shJBNCDaHlg9rU5xXG2abAEYDeM1Nipqc9M
   VhWrvC6GJHeyKgNvr1LejGuN9nYqymFPRsPeYTYEMVQVrkB9Ei5Gd7rH1
   zm7LYsQ2zc9Sykyk+UDEKMVv28Rp0SzWcDdW02MQ9ZtK+oAKas2WxW4kd
   RTHRmAZsyvvYwPT9CM7tJapHA90EnQLcWX6tsGAptVYazJzm+q7TSEHQV
   Q==;
X-CSE-ConnectionGUID: RhXVBLQdSRu861px1SuGUg==
X-CSE-MsgGUID: EooqBSS4SIaeTiCmxMQmVQ==
X-IPAS-Result: =?us-ascii?q?A0AnAABvmyJq/5D/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJA4xwhzeCIZFNjFEUgWoPAQEBD0QNBAEBhEBCAo03AiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBLQsBGAFZAwECWiMhg?=
 =?us-ascii?q?wIBgnMCARGxZ4F5M4EBgygBPwJDUNsrAQsUAYE4AYU+iB5bGAGEeycbG4Fyh?=
 =?us-ascii?q?H2BBYFcAQGBKwEMBgEIhl0EgiKBDIFdHlyCJYEAilxIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQsbBwWBSoFJaoEEhRIjHwM5gReBfIEoZ2kVMToQA?=
 =?us-ascii?q?wsYDUgRLDcUGwQ+bgeMKxcPgjctBCgBNAEKHwEBF24bI0EoHpJzJAIBEZAMg?=
 =?us-ascii?q?iGhDgoog3SMIZU6GjOFW6UQC5h7jgmVOjgNUIRogWg8OTBeCwdwFTuCZwlKG?=
 =?us-ascii?q?Q+OKg4Lg2CBf4MUUcA3JDUCCQMvAQEHAgcOAwuBaJABgXwBAQ?=
IronPort-Data: A9a23:RjPTgK9nmRehnCzGErcjDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GBLUW/QbviIYWeme9t2bt6zoBwFvZXSyoNrTABlpH9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4muyyHjEAX9gWAsbDpIs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kMPb0m0MJODVp06
 KxGcSgdNyueqN+5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0En1lQ/UPrSmM+zm3XidjdYoXqepLE85C7YywkZPL3FbIuNJIDTHZwM9qqej
 k/B+H3TOSpGD/2WxAaE2Xe8o9bKoxquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:73/J7a0VAZqQgWFbT9EeNQqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoWpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:p+rsh2+V1Sm/ZnahzEmVv3QUKv4PVkTR903NcxHhEXYwc6C6dFDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AWYPnTw8d1B7Dnp1vHfSEn7iQf+pv5L2EM3tRqrQ?=
 =?us-ascii?q?PtvWFHilgHg6Ysg3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,188,1774310400"; 
   d="scan'208";a="490641011"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Jun 2026 09:52:37 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 06A40180003D6
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Jun 2026 09:52:37 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id A1FE6CB6A93; Fri,  5 Jun 2026 02:52:36 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][scarthgap][PATCH] python3-tornado: Fix CVE-2026-31958
Date: Fri,  5 Jun 2026 02:51:42 -0700
Message-ID: <20260605095141.997950-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jun 2026 09:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127405

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix as referenced in [2], which addresses a Tornado flaw where
crafted multipart/form-data requests can trigger excessive synchronous parsing and cause
denial of service using the commit shown in [1].

[1] https://github.com/tornadoweb/tornado/commit/119a195e290c43ad2d63a2cf012c29d43d6ed839
[2] https://security-tracker.debian.org/tracker/CVE-2026-31958

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-31958

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../python3-tornado/CVE-2026-31958.patch      | 262 ++++++++++++++++++
 .../python/python3-tornado_6.4.2.bb           |   1 +
 2 files changed, 263 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-31958.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-31958.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-31958.patch
new file mode 100644
index 0000000000..8f28a652b7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-31958.patch
@@ -0,0 +1,262 @@
+From 6cb66a8d34fa0961c3573ad1fb91b77a2507b5ab Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Tue, 3 Mar 2026 14:36:14 -0500
+Subject: [PATCH] httputil: Add limits on multipart form data parsing
+
+The new default limits prevent a DoS vulnerability involving
+requests with many multipart parts. It also adds a defense-in-depth
+limit on the size of multipart headers, which would have mitigated
+the vulnerability fixed in 6.5.3.
+
+New data structures are added to allow users to configure these limits,
+and to disable multipart parsing entirely if they choose. However,
+due to the complexity of the plumbing required to pass these
+configuration options through the stack, the only configuration
+provided in this commit is the ability to set a global default.
+
+CVE: CVE-2026-31958
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/119a195e290c43ad2d63a2cf012c29d43d6ed839]
+
+(cherry picked from commit 119a195e290c43ad2d63a2cf012c29d43d6ed839)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ tornado/httputil.py           | 100 +++++++++++++++++++++++++++++++++-
+ tornado/test/httputil_test.py |  36 ++++++++++++
+ 2 files changed, 134 insertions(+), 2 deletions(-)
+
+diff --git a/tornado/httputil.py b/tornado/httputil.py
+index bbacd4a4..18113d61 100644
+--- a/tornado/httputil.py
++++ b/tornado/httputil.py
+@@ -22,6 +22,7 @@ via `tornado.web.RequestHandler.request`.
+ import calendar
+ import collections.abc
+ import copy
++import dataclasses
+ import datetime
+ import email.utils
+ from functools import lru_cache
+@@ -744,12 +745,90 @@ def _int_or_none(val: str) -> Optional[int]:
+     return int(val)
+ 
+ 
++@dataclasses.dataclass
++class ParseMultipartConfig:
++    """This class configures the parsing of ``multipart/form-data`` request bodies.
++
++    Its primary purpose is to place limits on the size and complexity of request messages
++    to avoid potential denial-of-service attacks.
++
++    .. versionadded:: 6.5.5
++    """
++
++    enabled: bool = True
++    """Set this to false to disable the parsing of ``multipart/form-data`` requests entirely.
++
++    This may be desirable for applications that do not need to handle this format, since
++    multipart request have a history of DoS vulnerabilities in Tornado. Multipart requests
++    are used primarily for ``<input type="file">`` in HTML forms, or in APIs that mimic this
++    format. File uploads that use the HTTP ``PUT`` method generally do not use the multipart
++    format.
++    """
++
++    max_parts: int = 100
++    """The maximum number of parts accepted in a multipart request.
++
++    Each ``<input>`` element in an HTML form corresponds to at least one "part".
++    """
++
++    max_part_header_size: int = 10 * 1024
++    """The maximum size of the headers for each part of a multipart request.
++
++    The header for a part contains the name of the form field and optionally the filename
++    and content type of the uploaded file.
++    """
++
++
++@dataclasses.dataclass
++class ParseBodyConfig:
++    """This class configures the parsing of request bodies.
++
++    .. versionadded:: 6.5.5
++    """
++
++    multipart: ParseMultipartConfig = dataclasses.field(
++        default_factory=ParseMultipartConfig
++    )
++    """Configuration for ``multipart/form-data`` request bodies."""
++
++
++_DEFAULT_PARSE_BODY_CONFIG = ParseBodyConfig()
++
++
++def set_parse_body_config(config: ParseBodyConfig) -> None:
++    r"""Sets the **global** default configuration for parsing request bodies.
++
++    This global setting is provided as a stopgap for applications that need to raise the limits
++    introduced in Tornado 6.5.5, or who wish to disable the parsing of multipart/form-data bodies
++    entirely. Non-global configuration for this functionality will be introduced in a future
++    release.
++
++    >>> content_type = "multipart/form-data; boundary=foo"
++    >>> multipart_body = b"--foo--\r\n"
++    >>> parse_body_arguments(content_type, multipart_body, {}, {})
++    >>> multipart_config = ParseMultipartConfig(enabled=False)
++    >>> config = ParseBodyConfig(multipart=multipart_config)
++    >>> set_parse_body_config(config)
++    >>> parse_body_arguments(content_type, multipart_body, {}, {})
++    Traceback (most recent call last):
++        ...
++    tornado.httputil.HTTPInputError: ...: multipart/form-data parsing is disabled
++    >>> set_parse_body_config(ParseBodyConfig())  # reset to defaults
++
++    .. versionadded:: 6.5.5
++    """
++    global _DEFAULT_PARSE_BODY_CONFIG
++    _DEFAULT_PARSE_BODY_CONFIG = config
++
++
+ def parse_body_arguments(
+     content_type: str,
+     body: bytes,
+     arguments: Dict[str, List[bytes]],
+     files: Dict[str, List[HTTPFile]],
+     headers: Optional[HTTPHeaders] = None,
++    *,
++    config: Optional[ParseBodyConfig] = None,
+ ) -> None:
+     """Parses a form request body.
+ 
+@@ -759,6 +838,8 @@ def parse_body_arguments(
+     and ``files`` parameters are dictionaries that will be updated
+     with the parsed contents.
+     """
++    if config is None:
++        config = _DEFAULT_PARSE_BODY_CONFIG
+     if content_type.startswith("application/x-www-form-urlencoded"):
+         if headers and "Content-Encoding" in headers:
+             raise HTTPInputError(
+@@ -779,10 +860,15 @@ def parse_body_arguments(
+             )
+         try:
+             fields = content_type.split(";")
++            if fields[0].strip() != "multipart/form-data":
++                # This catches "Content-Type: multipart/form-dataxyz"
++                raise HTTPInputError("Invalid content type")
+             for field in fields:
+                 k, sep, v = field.strip().partition("=")
+                 if k == "boundary" and v:
+-                    parse_multipart_form_data(utf8(v), body, arguments, files)
++                    parse_multipart_form_data(
++                        utf8(v), body, arguments, files, config=config.multipart
++                    )
+                     break
+             else:
+                 raise HTTPInputError("multipart boundary not found")
+@@ -795,6 +881,8 @@ def parse_multipart_form_data(
+     data: bytes,
+     arguments: Dict[str, List[bytes]],
+     files: Dict[str, List[HTTPFile]],
++    *,
++    config: Optional[ParseMultipartConfig] = None,
+ ) -> None:
+     """Parses a ``multipart/form-data`` body.
+ 
+@@ -807,6 +895,10 @@ def parse_multipart_form_data(
+        Now recognizes non-ASCII filenames in RFC 2231/5987
+        (``filename*=``) format.
+     """
++    if config is None:
++        config = _DEFAULT_PARSE_BODY_CONFIG.multipart
++    if not config.enabled:
++        raise HTTPInputError("multipart/form-data parsing is disabled")
+     # The standard allows for the boundary to be quoted in the header,
+     # although it's rare (it happens at least for google app engine
+     # xmpp).  I think we're also supposed to handle backslash-escapes
+@@ -818,12 +910,16 @@ def parse_multipart_form_data(
+     if final_boundary_index == -1:
+         raise HTTPInputError("Invalid multipart/form-data: no final boundary found")
+     parts = data[:final_boundary_index].split(b"--" + boundary + b"\r\n")
++    if len(parts) > config.max_parts:
++        raise HTTPInputError("multipart/form-data has too many parts")
+     for part in parts:
+         if not part:
+             continue
+         eoh = part.find(b"\r\n\r\n")
+         if eoh == -1:
+             raise HTTPInputError("multipart/form-data missing headers")
++        if eoh > config.max_part_header_size:
++            raise HTTPInputError("multipart/form-data part header too large")
+         headers = HTTPHeaders.parse(part[:eoh].decode("utf-8"))
+         disp_header = headers.get("Content-Disposition", "")
+         disposition, disp_params = _parse_header(disp_header)
+@@ -1031,7 +1127,7 @@ def doctests():
+     # type: () -> unittest.TestSuite
+     import doctest
+ 
+-    return doctest.DocTestSuite()
++    return doctest.DocTestSuite(optionflags=doctest.ELLIPSIS)
+ 
+ 
+ _netloc_re = re.compile(r"^(.+):(\d+)$")
+diff --git a/tornado/test/httputil_test.py b/tornado/test/httputil_test.py
+index 22b1681b..4dc697ea 100644
+--- a/tornado/test/httputil_test.py
++++ b/tornado/test/httputil_test.py
+@@ -9,6 +9,7 @@ from tornado.httputil import (
+     qs_to_qsl,
+     HTTPInputError,
+     HTTPFile,
++    ParseMultipartConfig,
+ )
+ from tornado.escape import utf8, native_str
+ from tornado.log import gen_log
+@@ -281,10 +282,45 @@ Foo
+             return time.time() - start
+ 
+         d1 = f(1_000)
++        # Note that headers larger than this are blocked by the default configuration.
+         d2 = f(10_000)
+         if d2 / d1 > 20:
+             self.fail(f"Disposition param parsing is not linear: {d1=} vs {d2=}")
+ 
++    def test_multipart_config(self):
++        boundary = b"1234"
++        body = b"""--1234
++Content-Disposition: form-data; name="files"; filename="ab.txt"
++
++--1234--""".replace(
++            b"\n", b"\r\n"
++        )
++        config = ParseMultipartConfig()
++        args, files = form_data_args()
++        parse_multipart_form_data(boundary, body, args, files, config=config)
++        self.assertEqual(files["files"][0]["filename"], "ab.txt")
++
++        config_no_parts = ParseMultipartConfig(max_parts=0)
++        with self.assertRaises(HTTPInputError) as cm:
++            parse_multipart_form_data(
++                boundary, body, args, files, config=config_no_parts
++            )
++        self.assertIn("too many parts", str(cm.exception))
++
++        config_small_headers = ParseMultipartConfig(max_part_header_size=10)
++        with self.assertRaises(HTTPInputError) as cm:
++            parse_multipart_form_data(
++                boundary, body, args, files, config=config_small_headers
++            )
++        self.assertIn("header too large", str(cm.exception))
++
++        config_disabled = ParseMultipartConfig(enabled=False)
++        with self.assertRaises(HTTPInputError) as cm:
++            parse_multipart_form_data(
++                boundary, body, args, files, config=config_disabled
++            )
++        self.assertIn("multipart/form-data parsing is disabled", str(cm.exception))
++
+ 
+ class HTTPHeadersTest(unittest.TestCase):
+     def test_multi_line(self):
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
index f513679b62..5874893f13 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://CVE-2025-47287.patch \
             file://CVE-2025-67724.patch \
             file://CVE-2025-67726.patch \
             file://CVE-2026-35536.patch \
+            file://CVE-2026-31958.patch \
 "
 
 inherit pypi python_setuptools_build_meta
-- 
2.35.6


