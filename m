Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075D1D30CFE
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:45 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9360.1768395695498392515
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ez7mnuC9;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f4e136481so1720395b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395695; x=1769000495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTR+hl4LQQFdFfzIICc3ePb8o5zig11QpxEms0DsGvc=;
        b=Ez7mnuC90yzw23QJnA9BWH1QlIzL09JH1O5grNnJMIQ9U9k/BAJUwHsB7X/+QrXlxt
         OFLiz/NmMYg9lRCm7D+aw+n5Dnv+gs0NsIU1ETXDjhTZ2D8lvF2DX9d2+bJbBjur3ElO
         RwU5D5XXMaRsW3TJ/JIIUZ9CbLq6kctBXQ1UCraMwLjY/CC1ukt/c52VCPw6l9Qw3u1G
         PjA5+kHE6pLVoVsN15ABOTvgp1UJnl8EmAbHSy8GuJGTDlln/3bBtSi3cIX6PPuAl49g
         EmavH43R8N7wdXO8t6Fu5cN1IopMb1K2hhjCIOPJjP3vQ34kUISThwfc5X1GBNdZ7z7s
         VIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395695; x=1769000495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WTR+hl4LQQFdFfzIICc3ePb8o5zig11QpxEms0DsGvc=;
        b=PxG5SH9SnuSv0SchVVsXP1Ig3iiBZJNmIn33wH3DnlChyjl66CkyXDODEeWsEP85Pf
         0SJH1yMDyLwE+E0egHLcU4MEzvRAW2863wqAswqSlOkUeiRRmkOz7psU7BrO1pl7d4qP
         YeONMvmgP3y7pNVWrEV5mkbCHAv7F/5BXhMSlwCyuTg8yHTBm5ANdbSMvnj7UN1CGhmQ
         DiVdLPxsaczRWJI0gIE6gk0UgYL0zmi7ZIWX6Lb0HSgUm16jab0uSZdqyjOPapUMv0Wk
         Vjx79krKfbJQIdUYgYkTtn+OtDoFYMIZjnpWZ9jPIu6f/cg1FvX3e+tPnuHp9F2PmRjj
         RRFQ==
X-Gm-Message-State: AOJu0YxIChQwDCwGdH8sZfUdP7x/RfOXnRZhscG9ekAgysXTWUZkpjHr
	hvF1zAIf+tS48rWFJGmO86ddyTWMLN5ijU277R9MQfzQBAfvbsr+2YaQE88/Qg==
X-Gm-Gg: AY/fxX681U0EKV6rP4JMEirCXf6gcijS8q/w4zIL375KcsFRl3JLPsk4QJC6i6cXCLh
	sFMSpO9+i44a3XIU+NDS1LbsqXyfPNROXyAZSl3mhGGuSlxyXGOAuDQLNbKEIqgn+E+a/wB4Tv2
	sVLk0lvAHt/LJNgbS4kCxEgFivZPEHP0JwiMFrkwvNtALl1lg2DHJA2VTNyrtpK+nf2COtbignI
	gNYxyLwdEF68Nz33KS8X8cMd37eHBZLGWdKmahaxXBV03KtD4mgg/aeYtfFRY4+CYU7TJOuzQ3i
	8EMVvFlayIKZqVg6Gq7UkM3QjGqBbhcuGq7oDW52hM2Em1uKm159PWqKDxF40hKZtkRVSyZnqIr
	Qp12Mxdc3DXLFE1mae6jkMbfJHMAl04fBosoTVUvbfvAtoahLW2EmtBAUBk/OnegL+DD9S4s1gC
	1rDDaw7nS63ZagBZxvmr9hwdU=
X-Received: by 2002:a05:6a20:7f9c:b0:34f:68e9:da94 with SMTP id adf61e73a8af0-38bed10fa94mr2739295637.30.1768395693543;
        Wed, 14 Jan 2026 05:01:33 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:33 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 12/20] python3-tornado: patch CVE-2025-47287
Date: Thu, 15 Jan 2026 02:00:49 +1300
Message-ID: <20260114130100.1016416-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123465

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-47287

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-tornado/CVE-2025-47287.patch      | 232 ++++++++++++++++++
 .../python/python3-tornado_6.4.2.bb           |   2 +
 2 files changed, 234 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2025-47287.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-47287.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-47287.patch
new file mode 100644
index 0000000000..02439c43e0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-47287.patch
@@ -0,0 +1,232 @@
+From 85a6a33e774376ec5b286d3a4857c569b8a8c4a8 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Thu, 8 May 2025 13:29:43 -0400
+Subject: [PATCH] httputil: Raise errors instead of logging in
+ multipart/form-data parsing
+
+We used to continue after logging an error, which allowed repeated
+errors to spam the logs. The error raised here will still be logged,
+but only once per request, consistent with other error handling in
+Tornado.
+
+CVE: CVE-2025-47287
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/cc61050e8f26697463142d99864b562e8470b41d]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tornado/httputil.py             | 30 +++++++++++-------------------
+ tornado/test/httpserver_test.py |  4 ++--
+ tornado/test/httputil_test.py   | 13 ++++++++-----
+ tornado/web.py                  | 17 +++++++++++++----
+ 4 files changed, 34 insertions(+), 30 deletions(-)
+
+diff --git a/tornado/httputil.py b/tornado/httputil.py
+index ebdc8059..090a977d 100644
+--- a/tornado/httputil.py
++++ b/tornado/httputil.py
+@@ -34,7 +34,6 @@ import unicodedata
+ from urllib.parse import urlencode, urlparse, urlunparse, parse_qsl
+ 
+ from tornado.escape import native_str, parse_qs_bytes, utf8
+-from tornado.log import gen_log
+ from tornado.util import ObjectDict, unicode_type
+ 
+ 
+@@ -762,25 +761,22 @@ def parse_body_arguments(
+     """
+     if content_type.startswith("application/x-www-form-urlencoded"):
+         if headers and "Content-Encoding" in headers:
+-            gen_log.warning(
+-                "Unsupported Content-Encoding: %s", headers["Content-Encoding"]
++            raise HTTPInputError(
++                "Unsupported Content-Encoding: %s" % headers["Content-Encoding"]
+             )
+-            return
+         try:
+             # real charset decoding will happen in RequestHandler.decode_argument()
+             uri_arguments = parse_qs_bytes(body, keep_blank_values=True)
+         except Exception as e:
+-            gen_log.warning("Invalid x-www-form-urlencoded body: %s", e)
+-            uri_arguments = {}
++            raise HTTPInputError("Invalid x-www-form-urlencoded body: %s" % e) from e
+         for name, values in uri_arguments.items():
+             if values:
+                 arguments.setdefault(name, []).extend(values)
+     elif content_type.startswith("multipart/form-data"):
+         if headers and "Content-Encoding" in headers:
+-            gen_log.warning(
+-                "Unsupported Content-Encoding: %s", headers["Content-Encoding"]
++            raise HTTPInputError(
++                "Unsupported Content-Encoding: %s" % headers["Content-Encoding"]
+             )
+-            return
+         try:
+             fields = content_type.split(";")
+             for field in fields:
+@@ -789,9 +785,9 @@ def parse_body_arguments(
+                     parse_multipart_form_data(utf8(v), body, arguments, files)
+                     break
+             else:
+-                raise ValueError("multipart boundary not found")
++                raise HTTPInputError("multipart boundary not found")
+         except Exception as e:
+-            gen_log.warning("Invalid multipart/form-data: %s", e)
++            raise HTTPInputError("Invalid multipart/form-data: %s" % e) from e
+ 
+ 
+ def parse_multipart_form_data(
+@@ -820,26 +816,22 @@ def parse_multipart_form_data(
+         boundary = boundary[1:-1]
+     final_boundary_index = data.rfind(b"--" + boundary + b"--")
+     if final_boundary_index == -1:
+-        gen_log.warning("Invalid multipart/form-data: no final boundary")
+-        return
++        raise HTTPInputError("Invalid multipart/form-data: no final boundary found")
+     parts = data[:final_boundary_index].split(b"--" + boundary + b"\r\n")
+     for part in parts:
+         if not part:
+             continue
+         eoh = part.find(b"\r\n\r\n")
+         if eoh == -1:
+-            gen_log.warning("multipart/form-data missing headers")
+-            continue
++            raise HTTPInputError("multipart/form-data missing headers")
+         headers = HTTPHeaders.parse(part[:eoh].decode("utf-8"))
+         disp_header = headers.get("Content-Disposition", "")
+         disposition, disp_params = _parse_header(disp_header)
+         if disposition != "form-data" or not part.endswith(b"\r\n"):
+-            gen_log.warning("Invalid multipart/form-data")
+-            continue
++            raise HTTPInputError("Invalid multipart/form-data")
+         value = part[eoh + 4 : -2]
+         if not disp_params.get("name"):
+-            gen_log.warning("multipart/form-data value missing name")
+-            continue
++            raise HTTPInputError("multipart/form-data missing name")
+         name = disp_params["name"]
+         if disp_params.get("filename"):
+             ctype = headers.get("Content-Type", "application/unknown")
+diff --git a/tornado/test/httpserver_test.py b/tornado/test/httpserver_test.py
+index 0b29a39c..5d5fb13a 100644
+--- a/tornado/test/httpserver_test.py
++++ b/tornado/test/httpserver_test.py
+@@ -1131,9 +1131,9 @@ class GzipUnsupportedTest(GzipBaseTest, AsyncHTTPTestCase):
+         # Gzip support is opt-in; without it the server fails to parse
+         # the body (but parsing form bodies is currently just a log message,
+         # not a fatal error).
+-        with ExpectLog(gen_log, "Unsupported Content-Encoding"):
++        with ExpectLog(gen_log, ".*Unsupported Content-Encoding"):
+             response = self.post_gzip("foo=bar")
+-        self.assertEqual(json_decode(response.body), {})
++        self.assertEqual(response.code, 400)
+ 
+ 
+ class StreamingChunkSizeTest(AsyncHTTPTestCase):
+diff --git a/tornado/test/httputil_test.py b/tornado/test/httputil_test.py
+index 975900aa..9494d0c1 100644
+--- a/tornado/test/httputil_test.py
++++ b/tornado/test/httputil_test.py
+@@ -12,7 +12,6 @@ from tornado.httputil import (
+ )
+ from tornado.escape import utf8, native_str
+ from tornado.log import gen_log
+-from tornado.testing import ExpectLog
+ from tornado.test.util import ignore_deprecation
+ 
+ import copy
+@@ -195,7 +194,9 @@ Foo
+             b"\n", b"\r\n"
+         )
+         args, files = form_data_args()
+-        with ExpectLog(gen_log, "multipart/form-data missing headers"):
++        with self.assertRaises(
++            HTTPInputError, msg="multipart/form-data missing headers"
++        ):
+             parse_multipart_form_data(b"1234", data, args, files)
+         self.assertEqual(files, {})
+ 
+@@ -209,7 +210,7 @@ Foo
+             b"\n", b"\r\n"
+         )
+         args, files = form_data_args()
+-        with ExpectLog(gen_log, "Invalid multipart/form-data"):
++        with self.assertRaises(HTTPInputError, msg="Invalid multipart/form-data"):
+             parse_multipart_form_data(b"1234", data, args, files)
+         self.assertEqual(files, {})
+ 
+@@ -222,7 +223,7 @@ Foo--1234--""".replace(
+             b"\n", b"\r\n"
+         )
+         args, files = form_data_args()
+-        with ExpectLog(gen_log, "Invalid multipart/form-data"):
++        with self.assertRaises(HTTPInputError, msg="Invalid multipart/form-data"):
+             parse_multipart_form_data(b"1234", data, args, files)
+         self.assertEqual(files, {})
+ 
+@@ -236,7 +237,9 @@ Foo
+             b"\n", b"\r\n"
+         )
+         args, files = form_data_args()
+-        with ExpectLog(gen_log, "multipart/form-data value missing name"):
++        with self.assertRaises(
++            HTTPInputError, msg="multipart/form-data value missing name"
++        ):
+             parse_multipart_form_data(b"1234", data, args, files)
+         self.assertEqual(files, {})
+ 
+diff --git a/tornado/web.py b/tornado/web.py
+index 03939647..8ec5601b 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -1751,6 +1751,14 @@ class RequestHandler(object):
+         try:
+             if self.request.method not in self.SUPPORTED_METHODS:
+                 raise HTTPError(405)
++
++            # If we're not in stream_request_body mode, this is the place where we parse the body.
++            if not _has_stream_request_body(self.__class__):
++                try:
++                    self.request._parse_body()
++                except httputil.HTTPInputError as e:
++                    raise HTTPError(400, "Invalid body: %s" % e) from e
++
+             self.path_args = [self.decode_argument(arg) for arg in args]
+             self.path_kwargs = dict(
+                 (k, self.decode_argument(v, name=k)) for (k, v) in kwargs.items()
+@@ -1941,7 +1949,7 @@ def _has_stream_request_body(cls: Type[RequestHandler]) -> bool:
+ 
+ 
+ def removeslash(
+-    method: Callable[..., Optional[Awaitable[None]]]
++    method: Callable[..., Optional[Awaitable[None]]],
+ ) -> Callable[..., Optional[Awaitable[None]]]:
+     """Use this decorator to remove trailing slashes from the request path.
+ 
+@@ -1970,7 +1978,7 @@ def removeslash(
+ 
+ 
+ def addslash(
+-    method: Callable[..., Optional[Awaitable[None]]]
++    method: Callable[..., Optional[Awaitable[None]]],
+ ) -> Callable[..., Optional[Awaitable[None]]]:
+     """Use this decorator to add a missing trailing slash to the request path.
+ 
+@@ -2394,8 +2402,9 @@ class _HandlerDelegate(httputil.HTTPMessageDelegate):
+         if self.stream_request_body:
+             future_set_result_unless_cancelled(self.request._body_future, None)
+         else:
++            # Note that the body gets parsed in RequestHandler._execute so it can be in
++            # the right exception handler scope.
+             self.request.body = b"".join(self.chunks)
+-            self.request._parse_body()
+             self.execute()
+ 
+     def on_connection_close(self) -> None:
+@@ -3267,7 +3276,7 @@ class GZipContentEncoding(OutputTransform):
+ 
+ 
+ def authenticated(
+-    method: Callable[..., Optional[Awaitable[None]]]
++    method: Callable[..., Optional[Awaitable[None]]],
+ ) -> Callable[..., Optional[Awaitable[None]]]:
+     """Decorate methods with this to require that the user be logged in.
+ 
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
index 751f32913a..e24354b54a 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "92bad5b4746e9879fd7bf1eb21dce4e3fc5128d71601f80005afa39237ad620b"
 
+SRC_URI += "file://CVE-2025-47287.patch"
+
 inherit pypi python_setuptools_build_meta
 
 # Requires _compression which is currently located in misc

