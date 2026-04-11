Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B57AF3ED4A
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 11:15:13 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.191327.1775906109186136657
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2026 04:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BsZ9meux;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so1128883a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 04:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775906108; x=1776510908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gY9WxmluAPBKsjxydi+8qg0euDOAeUA2vp6I4D0XgG4=;
        b=BsZ9meux8zHK5T+3KhBrImnYlip4TqGFTXwHK6x7wsQ5MKNbWrEl3uNw3q4kUtlnwY
         ifef30mjmybfbyG+78qtXjik92RrJNT5P0VtAn5qnQX9n3YlzR2uqi9aIwxCRXat1ziT
         6hNYRc4ORUNlWdfae7d1hLzNg1JZCiEU6UJ2QZEVkd0032BpIcCbLD5hmk27nj7yXObM
         qby0VQkZhzIY+hZXvYO4U1kz3ZLsgCZWBtq5rYN1EhkDj3I45uGOWGduBdgK6kuy91lR
         0W4aQuGpjCUNig8SBqrNd8QHQH2iD0njIaE4g0btKwy4NTFehk+or5Xq0d4GYFLu4yvu
         Dc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775906108; x=1776510908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gY9WxmluAPBKsjxydi+8qg0euDOAeUA2vp6I4D0XgG4=;
        b=V72Yg27O2MykYzTFlkosQSxDDfADF6RlS4sQOgbND+CpR/+W0CQEejpptla5aLv3Eq
         wLOtHCG1UGWVOKKYRpemUAP1iL9kp47V3Fjea1noGIKI1oWR2nnsMlVyWt6Xn76jW4sc
         w8Trdcq3JViRPK+HkVBjlFP3O6cLLS1dmG1KhkX5VD3l1pvLGvyhpUwPnodn0O+/LW1J
         QoyjWuvMgIiUN2Bl+VTXV7OFvCxNHxp+cGRmvoWYxRU7dgINkLqZjYDduc4kdSR35600
         8mqLibg+VvMHY+/RFBFewqm0bL+Pw5TKFcOkgZsWkwBfPkmbX1Ao++1+d27zCefyFzN3
         OcqA==
X-Gm-Message-State: AOJu0Yx+AtBZBTAe9z/AbDKyBd4X4GrqPi7cNblRfPf9mOzSro4rp4re
	IDXwkRSmVRt0Y9ylDbu7zt6VYkKaF6LZE7CAeN65KHnN2TxY74mnfUlax3kBbw==
X-Gm-Gg: AeBDieuj0Ysx9n/gZKpelfb8P/XB8Zi8u7IkLFfflDsHb/Ax9GFPMc89Aiv/nes6W9w
	7uGFLVwps/GX4IzH4JsUNTbs4ykqsQRQRCuPdYsODhgs2BEMWhk0AuO1nDnV2aLB3D7hb9evK7S
	GLBYlGyROsnGj7Pn1EVvBm00RgPYrF5kOkgSpkHDmMqsJ5NVnVy0lDXyZhjuOULXF/0H/eHu6VE
	9r/aoaV4bPHhAwKZWjWPPTtpFDdZyvkJC+Equq4UTnK1pg6zrOJCp6hQz7/u7/SoeQI+7X6+LEh
	xLQQCnMo0mR/JO4LSrQ/cPUQiEkSTnygxdwmAZA6gmzajl2/3dmrIt+siLWPhbpJGnePHHfoeid
	12JUQAW5OOMSaemowUFp/mIUXkDz2Jwq+/mu9ikgCeL1r3W+OpH41My4R3dkDoZMTPTA/2K+XpT
	PNRSlV07ohjHWwi3XGSEshzgy2P3GT6TFvPYjF
X-Received: by 2002:a05:6a20:6a1d:b0:39c:3de:efec with SMTP id adf61e73a8af0-39fe3ca18fbmr8583615637.14.1775906107924;
        Sat, 11 Apr 2026 04:15:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c793488d824sm130447a12.16.2026.04.11.04.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:15:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 4/5] python3-tornado: fix CVE-2026-35536
Date: Sat, 11 Apr 2026 23:14:48 +1200
Message-ID: <20260411111451.2739610-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411111451.2739610-1-ankur.tyagi85@gmail.com>
References: <20260411111451.2739610-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 11:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126256

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport the commit[1] from version 6.5.5 which fixes this vulnerability
according to the NVD[2].

[1] https://github.com/tornadoweb/tornado/commit/24a2d96ea115f663b223887deb0060f13974c104
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-35536

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-tornado/CVE-2026-35536.patch      | 155 ++++++++++++++++++
 .../python/python3-tornado_6.4.2.bb           |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-35536.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-35536.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-35536.patch
new file mode 100644
index 0000000000..783d0aa116
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-35536.patch
@@ -0,0 +1,155 @@
+From 66587e51009457274cedec28f5fd43000d129e4e Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Fri, 6 Mar 2026 14:50:25 -0500
+Subject: [PATCH] web: Validate characters in all cookie attributes.
+
+Our previous control character check was missing a check for
+U+007F, and also semicolons, which are only allowed in quoted
+parts of values. This commit checks all attributes and
+updates the set of disallowed characters.
+
+CVE: CVE-2026-35536
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/24a2d96ea115f663b223887deb0060f13974c104]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tornado/test/web_test.py | 65 ++++++++++++++++++++++++++++++++++++++++
+ tornado/web.py           | 27 +++++++++++++++--
+ 2 files changed, 89 insertions(+), 3 deletions(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 801a80ed..ae39e8fc 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -1,3 +1,5 @@
++import http
++
+ from tornado.concurrent import Future
+ from tornado import gen
+ from tornado.escape import (
+@@ -291,11 +293,67 @@ class CookieTest(WebTestCase):
+                 self.set_cookie("unicode_args", "blah", domain="foo.com", path="/foo")
+ 
+         class SetCookieSpecialCharHandler(RequestHandler):
++            # "Special" characters are allowed in cookie values, but trigger special quoting.
+             def get(self):
+                 self.set_cookie("equals", "a=b")
+                 self.set_cookie("semicolon", "a;b")
+                 self.set_cookie("quote", 'a"b')
+ 
++        class SetCookieForbiddenCharHandler(RequestHandler):
++            def get(self):
++                # Control characters and semicolons raise errors in cookie names and attributes
++                # (but not values, which are tested in SetCookieSpecialCharHandler)
++                for char in list(map(chr, range(0x20))) + [chr(0x7F), ";"]:
++                    try:
++                        self.set_cookie("foo" + char, "bar")
++                        self.write(
++                            "Didn't get expected exception for char %r in name\n" % char
++                        )
++                    except http.cookies.CookieError as e:
++                        if "Invalid cookie attribute name" not in str(e):
++                            self.write(
++                                "unexpected exception for char %r in name: %s\n"
++                                % (char, e)
++                            )
++
++                    try:
++                        self.set_cookie("foo", "bar", domain="example" + char + ".com")
++                        self.write(
++                            "Didn't get expected exception for char %r in domain\n"
++                            % char
++                        )
++                    except http.cookies.CookieError as e:
++                        if "Invalid cookie attribute domain" not in str(e):
++                            self.write(
++                                "unexpected exception for char %r in domain: %s\n"
++                                % (char, e)
++                            )
++
++                    try:
++                        self.set_cookie("foo", "bar", path="/" + char)
++                        self.write(
++                            "Didn't get expected exception for char %r in path\n" % char
++                        )
++                    except http.cookies.CookieError as e:
++                        if "Invalid cookie attribute path" not in str(e):
++                            self.write(
++                                "unexpected exception for char %r in path: %s\n"
++                                % (char, e)
++                            )
++
++                    try:
++                        self.set_cookie("foo", "bar", samesite="a" + char)
++                        self.write(
++                            "Didn't get expected exception for char %r in samesite\n"
++                            % char
++                        )
++                    except http.cookies.CookieError as e:
++                        if "Invalid cookie attribute samesite" not in str(e):
++                            self.write(
++                                "unexpected exception for char %r in samesite: %s\n"
++                                % (char, e)
++                            )
++
+         class SetCookieOverwriteHandler(RequestHandler):
+             def get(self):
+                 self.set_cookie("a", "b", domain="example.com")
+@@ -329,6 +387,7 @@ class CookieTest(WebTestCase):
+             ("/get", GetCookieHandler),
+             ("/set_domain", SetCookieDomainHandler),
+             ("/special_char", SetCookieSpecialCharHandler),
++            ("/forbidden_char", SetCookieForbiddenCharHandler),
+             ("/set_overwrite", SetCookieOverwriteHandler),
+             ("/set_max_age", SetCookieMaxAgeHandler),
+             ("/set_expires_days", SetCookieExpiresDaysHandler),
+@@ -385,6 +444,12 @@ class CookieTest(WebTestCase):
+             response = self.fetch("/get", headers={"Cookie": header})
+             self.assertEqual(response.body, utf8(expected))
+ 
++    def test_set_cookie_forbidden_char(self):
++        response = self.fetch("/forbidden_char")
++        self.assertEqual(response.code, 200)
++        self.maxDiff = 10000
++        self.assertMultiLineEqual(to_unicode(response.body), "")
++
+     def test_set_cookie_overwrite(self):
+         response = self.fetch("/set_overwrite")
+         headers = response.headers.get_list("Set-Cookie")
+diff --git a/tornado/web.py b/tornado/web.py
+index 8a740504..4b70ea93 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -643,9 +643,30 @@ class RequestHandler(object):
+         # The cookie library only accepts type str, in both python 2 and 3
+         name = escape.native_str(name)
+         value = escape.native_str(value)
+-        if re.search(r"[\x00-\x20]", name + value):
+-            # Don't let us accidentally inject bad stuff
+-            raise ValueError("Invalid cookie %r: %r" % (name, value))
++        if re.search(r"[\x00-\x20]", value):
++            # Legacy check for control characters in cookie values. This check is no longer needed
++            # since the cookie library escapes these characters correctly now. It will be removed
++            # in the next feature release.
++            raise ValueError(f"Invalid cookie {name!r}: {value!r}")
++        for attr_name, attr_value in [
++            ("name", name),
++            ("domain", domain),
++            ("path", path),
++            ("samesite", samesite),
++        ]:
++            # Cookie attributes may not contain control characters or semicolons (except when
++            # escaped in the value). A check for control characters was added to the http.cookies
++            # library in a Feb 2026 security release; as of March it still does not check for
++            # semicolons.
++            #
++            # When a semicolon check is added to the standard library (and the release has had time
++            # for adoption), this check may be removed, but be mindful of the fact that this may
++            # change the timing of the exception (to the generation of the Set-Cookie header in
++            # flush()). We m
++            if attr_value is not None and re.search(r"[\x00-\x20\x3b\x7f]", attr_value):
++                raise http.cookies.CookieError(
++                    f"Invalid cookie attribute {attr_name}={attr_value!r} for cookie {name!r}"
++                )
+         if not hasattr(self, "_new_cookie"):
+             self._new_cookie = (
+                 http.cookies.SimpleCookie()
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
index 3dabcab38b..25f1b2a310 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
@@ -11,6 +11,7 @@ SRC_URI[sha256sum] = "92bad5b4746e9879fd7bf1eb21dce4e3fc5128d71601f80005afa39237
 SRC_URI += "file://CVE-2025-47287.patch \
             file://CVE-2025-67724.patch \
             file://CVE-2025-67726.patch \
+            file://CVE-2026-35536.patch \
 "
 
 inherit pypi python_setuptools_build_meta

