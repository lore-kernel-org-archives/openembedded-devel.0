Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7E0D31A3F
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:45 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9363.1768395698599429962
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eMXTyTsb;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso2717252b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395698; x=1769000498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unpG5niYztAhWwQVm3iaMuhgg4HmbL1WiJHujDsFmYk=;
        b=eMXTyTsbrEJTGidUhGMGrxyNIEtJF3XEfMLh9/avO7t8eUgiKt/5FHctaEvBhan3q7
         9yaLpLyyjxyb8pKrGZfq5OONr09UGRaL/+5guKXoLpPJb2uiYp+vckFx/bwwlHxZ49sf
         S6Wg+J7r4OuJ/f9/mvLZri30ewR6Yp7fmQ6xCS83MgMu8vAWgedbrrloiTPYzKCzO0/J
         WUknIG6/H/o2YuFUkwpuky3kY7z5DTt8DM21sn5vvLtvi8iIGX12auasMjYyEf9oHiOf
         lVZ+RsjJtQYVZGqfzmuLTyrfVWnH1G64hi7DKCts+DlzRRrN3ns3mPnT54fgPgkGMhrf
         IDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395698; x=1769000498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=unpG5niYztAhWwQVm3iaMuhgg4HmbL1WiJHujDsFmYk=;
        b=XoIuUZ7gf4mt/5nvEX5KqzftQFDWUb0qb+1Kjr07B38RHIBzqvI7gdlE2tCUz/N+sC
         s2Xd5Ow8/AtCaPVJj6x9kSlImnS+OE9l6+TtxkkLUOkDQS+JKkhPuT58pbcB2l/soTEJ
         BRY05y+felJysDQ5rS3bldJgw+yCdXySns+f1R7EY6d54TyM6ChG8tU1Djl4urX05v1O
         oMsvXlP75MI2iVqbzeKQR+BQkkLMKyCp8qJh54HBq0dLQmo/XIMZ2lMWiSIb+321sWFB
         TBPuRyuSB9/rOQC/0zrmK6cwBFJk4jP8EOUeeNVnba8ZrX6HvCtrILXbYL71gX2LY+o8
         EMfw==
X-Gm-Message-State: AOJu0Yzl1LJV5XYBbQ6SUepLig/iz6g8oVhzvmLbryKWYNDtDiiVl68l
	OExWhpcJGfyuPaj/v2IBCpVLJG04GBBsTH4XIyDzpsPVorD6S3K39DiQD+TqwQ==
X-Gm-Gg: AY/fxX7gv46mHhEfuvUQGrJtFEtUoKeWXUX7OY43ezy45Ah9E3BL7+YFgFyx6u3XJF5
	ZFyg8IunkA3QuhpvJu+Oj1kz5yPXBOzNVEaTedSoSGXDTsVufeXhhUDoDQKyf/ounV8OXdv3Btu
	vwt8SQ6KbVVHUXCbLZM8gjYSa0XMuVYyq9BAeWM5Vsa7naMtmfl5a/jHMMQ4BWci2thwN3tcwoj
	gKvkepjdK7bfwXnA16KAnkJ2S7xPdyaEw0LSQv1/02EM0MPK/vz4o6HLiAAfPmjNfQRaRmITXg+
	vhyT7ta2AxOurwpYD44QR559KmNaLKdOB5mbvE4M6K4dqJeBssOxW/2Y9LAmu0MeeNM627yGW/+
	y3wTvgr60LfmBQpGnrmnM9Yqd4h9fkuHjnsiKN2iSwe4oTQoeKLIUEZvNwoCdxjPTS688S3Zc/2
	DfWXFXWvHb6ZkuksqD8LdDUvw=
X-Received: by 2002:a05:6a00:8017:b0:81f:4e2b:4943 with SMTP id d2e1a72fcca58-81f81d48123mr2242586b3a.27.1768395695996;
        Wed, 14 Jan 2026 05:01:35 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:35 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 13/20] python3-tornado: patch CVE-2025-67724
Date: Thu, 15 Jan 2026 02:00:50 +1300
Message-ID: <20260114130100.1016416-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123466

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-67724

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-tornado/CVE-2025-67724.patch      | 118 ++++++++++++++++++
 .../python/python3-tornado_6.4.2.bb           |   4 +-
 2 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67724.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67724.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67724.patch
new file mode 100644
index 0000000000..78cdae9666
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67724.patch
@@ -0,0 +1,118 @@
+From 990054627cef3966a626162138164a77580d33ad Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Wed, 10 Dec 2025 15:15:25 -0500
+Subject: [PATCH] web: Harden against invalid HTTP reason phrases
+
+We allow applications to set custom reason phrases for the HTTP status
+line (to support custom status codes), but if this were exposed to
+untrusted data it could be exploited in various ways. This commit
+guards against invalid reason phrases in both HTTP headers and in
+error pages.
+
+CVE: CVE-2025-67724
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/9c163aebeaad9e6e7d28bac1f33580eb00b0e421]
+(cherry picked from commit 9c163aebeaad9e6e7d28bac1f33580eb00b0e421)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tornado/test/web_test.py | 15 ++++++++++++++-
+ tornado/web.py           | 25 +++++++++++++++++++------
+ 2 files changed, 33 insertions(+), 7 deletions(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index fec66f39..801a80ed 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -1712,7 +1712,7 @@ class StatusReasonTest(SimpleHandlerTestCase):
+     class Handler(RequestHandler):
+         def get(self):
+             reason = self.request.arguments.get("reason", [])
+-            self.set_status(
++            raise HTTPError(
+                 int(self.get_argument("code")),
+                 reason=to_unicode(reason[0]) if reason else None,
+             )
+@@ -1735,6 +1735,19 @@ class StatusReasonTest(SimpleHandlerTestCase):
+         self.assertEqual(response.code, 682)
+         self.assertEqual(response.reason, "Unknown")
+ 
++    def test_header_injection(self):
++        response = self.fetch("/?code=200&reason=OK%0D%0AX-Injection:injected")
++        self.assertEqual(response.code, 200)
++        self.assertEqual(response.reason, "Unknown")
++        self.assertNotIn("X-Injection", response.headers)
++
++    def test_reason_xss(self):
++        response = self.fetch("/?code=400&reason=<script>alert(1)</script>")
++        self.assertEqual(response.code, 400)
++        self.assertEqual(response.reason, "Unknown")
++        self.assertNotIn(b"script", response.body)
++        self.assertIn(b"Unknown", response.body)
++
+ 
+ class DateHeaderTest(SimpleHandlerTestCase):
+     class Handler(RequestHandler):
+diff --git a/tornado/web.py b/tornado/web.py
+index 8ec5601b..8a740504 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -350,8 +350,10 @@ class RequestHandler(object):
+ 
+         :arg int status_code: Response status code.
+         :arg str reason: Human-readable reason phrase describing the status
+-            code. If ``None``, it will be filled in from
+-            `http.client.responses` or "Unknown".
++            code (for example, the "Not Found" in ``HTTP/1.1 404 Not Found``).
++            Normally determined automatically from `http.client.responses`; this
++            argument should only be used if you need to use a non-standard
++            status code.
+ 
+         .. versionchanged:: 5.0
+ 
+@@ -360,6 +362,14 @@ class RequestHandler(object):
+         """
+         self._status_code = status_code
+         if reason is not None:
++            if "<" in reason or not httputil._ABNF.reason_phrase.fullmatch(reason):
++                # Logically this would be better as an exception, but this method
++                # is called on error-handling paths that would need some refactoring
++                # to tolerate internal errors cleanly.
++                #
++                # The check for "<" is a defense-in-depth against XSS attacks (we also
++                # escape the reason when rendering error pages).
++                reason = "Unknown"
+             self._reason = escape.native_str(reason)
+         else:
+             self._reason = httputil.responses.get(status_code, "Unknown")
+@@ -1295,7 +1305,8 @@ class RequestHandler(object):
+                 reason = exception.reason
+         self.set_status(status_code, reason=reason)
+         try:
+-            self.write_error(status_code, **kwargs)
++            if status_code != 304:
++                self.write_error(status_code, **kwargs)
+         except Exception:
+             app_log.error("Uncaught exception in write_error", exc_info=True)
+         if not self._finished:
+@@ -1323,7 +1334,7 @@ class RequestHandler(object):
+             self.finish(
+                 "<html><title>%(code)d: %(message)s</title>"
+                 "<body>%(code)d: %(message)s</body></html>"
+-                % {"code": status_code, "message": self._reason}
++                % {"code": status_code, "message": escape.xhtml_escape(self._reason)}
+             )
+ 
+     @property
+@@ -2469,9 +2480,11 @@ class HTTPError(Exception):
+         mode).  May contain ``%s``-style placeholders, which will be filled
+         in with remaining positional parameters.
+     :arg str reason: Keyword-only argument.  The HTTP "reason" phrase
+-        to pass in the status line along with ``status_code``.  Normally
++        to pass in the status line along with ``status_code`` (for example,
++        the "Not Found" in ``HTTP/1.1 404 Not Found``).  Normally
+         determined automatically from ``status_code``, but can be used
+-        to use a non-standard numeric code.
++        to use a non-standard numeric code. This is not a general-purpose
++        error message.
+     """
+ 
+     def __init__(
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
index e24354b54a..ce53ef75ad 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "92bad5b4746e9879fd7bf1eb21dce4e3fc5128d71601f80005afa39237ad620b"
 
-SRC_URI += "file://CVE-2025-47287.patch"
+SRC_URI += "file://CVE-2025-47287.patch \
+            file://CVE-2025-67724.patch \
+"
 
 inherit pypi python_setuptools_build_meta
 

