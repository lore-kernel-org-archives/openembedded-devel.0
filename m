Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806E0D31A1F
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 07:34:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5342.1768376084413117386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 23:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NKX/qzyb;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so62273885e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 23:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768376083; x=1768980883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pdzQy0UHTh+pNktZG60U2OtcL5/l9nkR3EWWyzKHs5w=;
        b=NKX/qzybE/svjl8ryRhhxqyu2Du2SNQo0hXUVw0U4BICWJaLGXMJ2OFrqHw1+pU7HA
         8Va6T9V2FeUkjhHVPkU3+0kccpG6Zv+pAlM07EMg/dKSJgHyC5aly8wnyQoYt49OEmv6
         dR1sG4NuptmNAPcsGqlFgNhJP5cssm+9310COaR4SyA9n1J7QZp68PJ2dgp+V3/EMrYV
         jKOhGdOrXcCceqxDKwdsC4I7c8b/3GloJvWe4L4aHf4GYNo3UsCbRO5C1yuPaH6vJCDF
         rlNXUYVecL37l3/If0NfK6K6dj4ZLQyXQekoNwWQOi8/pGxdYV2W/prCKslD7G9t8Mfd
         Rf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376083; x=1768980883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdzQy0UHTh+pNktZG60U2OtcL5/l9nkR3EWWyzKHs5w=;
        b=rfFU2lR9HszAJ9C7FvkTixZXryrOXeK9hPw2RZ9lp+6YD+L5Bol7XayRYQBwuA3Q97
         oagrmAEXE3Zl31zUfVf51z8TUVrdhKPPB4txx1FMwo+SZ5dPfZUyaIYa03lCWSu/smVd
         sqN3EcRdG3Yr5Us85yhQuKei7SivvGIjfn8R5N09VqlFnA/DMkYLmF0Uc5v6gB0TKDsy
         hz4300C/wU0Qe9kdj9ssYpu6mtRqXUfGDf9voydso62JmMNlbgqLNTvT8aq+t0KF1fn4
         AX45H8PYCIsWHYx4OuNefVr4CxrTm00d46UOmmhKmtCjPP32QMD5Q2tRXbqAEwMgdN7f
         L1Eg==
X-Gm-Message-State: AOJu0YwcUANLtmjBplrS93f7Fd60XR7DAChE6WfvKaRh0o1PN5DFED/u
	m+TqsOuCGzQjbmD9iuJQ25iq5Bf578qhszG01INub0XkjGC2XqYUZiuQS/xFyw==
X-Gm-Gg: AY/fxX6v6G+eoyFVryHxEU8Dj2eUc/LMvKq/DTa6tGGPPu39ZL/lAaVGa9orE/NmkL5
	MrgiuGdifxRGOafQVcVn5kfzBEK14+wICy7M+NM7OqwA3OTSbmIw8ioyvX4YIk9PHsdhTfbpV8m
	oQJUJlC4KC9KQmlpnN2zgz0W1iA9KvVUjhf/OShYhfeSLhQc/ADTCTBCptugYQRivGRpJ9LWNue
	WhC9aGWx+DXn/ojtiukrt2HUSF4QA6HZx/L+C/ZRNy1ElT2BzFXl9s58JJsifIlpd/pUXJxBXrH
	txL4QvZnf8RZmNBvpLfUksbuwllNZD+MsyUBBb6QsFzF0pLiB4lQgWrNlaUbmFNrzHdKhAUcnJj
	kRtPmj7/ndghKxdy6qV9RC3EmPUYPlDRtiRpJPQazJ57xDUyzkPWcwxZkeQ+a3RccJ0TL/UuEPo
	o0ICVQpxtW
X-Received: by 2002:a05:600c:444a:b0:47b:e0ff:60f9 with SMTP id 5b1f17b1804b1-47ee4819dafmr10208085e9.20.1768376082233;
        Tue, 13 Jan 2026 23:34:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm47598289f8f.28.2026.01.13.23.34.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 23:34:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/5] python3-twisted: patch CVE-2022-24801
Date: Wed, 14 Jan 2026 08:34:35 +0100
Message-ID: <20260114073440.210915-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 07:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123446

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-24801

Pick the commits from the pull request that is referenced by the NVD report.

(The full set is consisting of 13 patches, but the ones that only updated
news/readme/typo fixes in comments were not backported)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-twisted/CVE-2022-24801-1.patch    | 132 ++++++++++++++++++
 .../python3-twisted/CVE-2022-24801-2.patch    |  63 +++++++++
 .../python3-twisted/CVE-2022-24801-3.patch    |  25 ++++
 .../python3-twisted/CVE-2022-24801-4.patch    |  25 ++++
 .../python3-twisted/CVE-2022-24801-5.patch    |  71 ++++++++++
 .../python3-twisted/CVE-2022-24801-6.patch    | 129 +++++++++++++++++
 .../python3-twisted/CVE-2022-24801-7.patch    |  27 ++++
 .../python3-twisted/CVE-2022-24801-8.patch    | 108 ++++++++++++++
 .../python3-twisted/CVE-2022-24801-9.patch    |  25 ++++
 .../python/python3-twisted_22.2.0.bb          |  16 ++-
 10 files changed, 618 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-5.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-6.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-7.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-8.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-9.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-1.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-1.patch
new file mode 100644
index 0000000000..f7b6824612
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-1.patch
@@ -0,0 +1,132 @@
+From 832a878c9c324ad23dde6cf16520b7768c1a8c5c Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Sat, 5 Mar 2022 23:26:55 -0800
+Subject: [PATCH] Some tests for GHSA-c2jg-hw38-jrqq
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/22b067793cbcd0fb5dee04cfd9115fa85a7ca110]
+CVE: CVE-2022-24801
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/twisted/web/test/test_http.py | 102 ++++++++++++++++++++++++++++++
+ 1 file changed, 102 insertions(+)
+
+diff --git a/src/twisted/web/test/test_http.py b/src/twisted/web/test/test_http.py
+index 86c85d2..0549ed0 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -1843,6 +1843,56 @@ class ParsingTests(unittest.TestCase):
+             [b"t \ta \tb"],
+         )
+ 
++    def test_headerStripWhitespace(self):
++        """
++        Leading and trailing space and tab characters are stripped from
++        headers. Other forms of whitespace are preserved.
++
++        See RFC 7230 section 3.2.3 and 3.2.4.
++        """
++        processed = []
++
++        class MyRequest(http.Request):
++            def process(self):
++                processed.append(self)
++                self.finish()
++
++        requestLines = [
++            b"GET / HTTP/1.0",
++            b"spaces:   spaces were stripped   ",
++            b"tabs: \t\ttabs were stripped\t\t",
++            b"spaces-and-tabs: \t \t spaces and tabs were stripped\t \t",
++            b"line-tab:   \v vertical tab was preserved\v\t",
++            b"form-feed: \f form feed was preserved \f  ",
++            b"",
++            b"",
++        ]
++
++        self.runRequest(b"\n".join(requestLines), MyRequest, 0)
++        [request] = processed
++        # All leading and trailing whitespace is stripped from the
++        # header-value.
++        self.assertEqual(
++            request.requestHeaders.getRawHeaders(b"spaces"),
++            [b"spaces were stripped"],
++        )
++        self.assertEqual(
++            request.requestHeaders.getRawHeaders(b"tabs"),
++            [b"tabs were stripped"],
++        )
++        self.assertEqual(
++            request.requestHeaders.getRawHeaders(b"spaces-and-tabs"),
++            [b"spaces and tabs were stripped"],
++        )
++        self.assertEqual(
++            request.requestHeaders.getRawHeaders(b"line-tab"),
++            [b"\v vertical tab was preserved\v"],
++        )
++        self.assertEqual(
++            request.requestHeaders.getRawHeaders(b"form-feed"),
++            [b"\f form feed was preserved \f"],
++        )
++
+     def test_tooManyHeaders(self):
+         """
+         C{HTTPChannel} enforces a limit of C{HTTPChannel.maxHeaders} on the
+@@ -2407,6 +2457,58 @@ Hello,
+             ]
+         )
+ 
++    def test_contentLengthMalformed(self):
++        """
++        A request with a non-integer C{Content-Length} header fails with a 400
++        response without calling L{Request.process}.
++        """
++        self.assertRequestRejected(
++            [
++                b"GET /a HTTP/1.1",
++                b"Content-Length: MORE THAN NINE THOUSAND!",
++                b"Host: host.invalid",
++                b"",
++                b"",
++                b"x" * 9001,
++            ]
++        )
++
++    def test_contentLengthTooPositive(self):
++        """
++        A request with a C{Content-Length} header that begins with a L{+} fails
++        with a 400 response without calling L{Request.process}.
++
++        This is a potential request smuggling vector: see GHSA-c2jg-hw38-jrqq.
++        """
++        self.assertRequestRejected(
++            [
++                b"GET /a HTTP/1.1",
++                b"Content-Length: +100",
++                b"Host: host.invalid",
++                b"",
++                b"",
++                b"x" * 100,
++            ]
++        )
++
++    def test_contentLengthNegative(self):
++        """
++        A request with a C{Content-Length} header that is negative fails with
++        a 400 response without calling L{Request.process}.
++
++        This is a potential request smuggling vector: see GHSA-c2jg-hw38-jrqq.
++        """
++        self.assertRequestRejected(
++            [
++                b"GET /a HTTP/1.1",
++                b"Content-Length: -100",
++                b"Host: host.invalid",
++                b"",
++                b"",
++                b"x" * 200,
++            ]
++        )
++
+     def test_duplicateContentLengthsWithPipelinedRequests(self):
+         """
+         Two pipelined requests, the first of which includes multiple
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-2.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-2.patch
new file mode 100644
index 0000000000..c9164b54f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-2.patch
@@ -0,0 +1,63 @@
+From 232c32ca0ecc3f9d263e2184253a839ce99b4f31 Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Mon, 7 Mar 2022 00:02:55 -0800
+Subject: [PATCH] Replace obs-fold with a single space
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/79ee8c564ca0d4c2910c8859e0a6014d2dc40005]
+CVE: CVE-2022-24801
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/twisted/web/http.py           |  2 +-
+ src/twisted/web/test/test_http.py | 13 +++++++++----
+ 2 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index b99480f..5491953 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -2246,7 +2246,7 @@ class HTTPChannel(basic.LineReceiver, policies.TimeoutMixin):
+                 self.setRawMode()
+         elif line[0] in b" \t":
+             # Continuation of a multi line header.
+-            self.__header = self.__header + b"\n" + line
++            self.__header += b" " + line.lstrip(b" \t")
+         # Regular header line.
+         # Processing of header line is delayed to allow accumulating multi
+         # line headers.
+diff --git a/src/twisted/web/test/test_http.py b/src/twisted/web/test/test_http.py
+index 0549ed0..8a7adc0 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -1795,7 +1795,12 @@ class ParsingTests(unittest.TestCase):
+         Line folded headers are handled by L{HTTPChannel} by replacing each
+         fold with a single space by the time they are made available to the
+         L{Request}. Any leading whitespace in the folded lines of the header
+-        value is preserved.
++        value is replaced with a single space, per:
++
++            A server that receives an obs-fold in a request message ... MUST
++            ... replace each received obs-fold with one or more SP octets prior
++            to interpreting the field value or forwarding the message
++            downstream.
+ 
+         See RFC 7230 section 3.2.4.
+         """
+@@ -1832,15 +1837,15 @@ class ParsingTests(unittest.TestCase):
+         )
+         self.assertEqual(
+             request.requestHeaders.getRawHeaders(b"space"),
+-            [b"space  space"],
++            [b"space space"],
+         )
+         self.assertEqual(
+             request.requestHeaders.getRawHeaders(b"spaces"),
+-            [b"spaces   spaces    spaces"],
++            [b"spaces spaces spaces"],
+         )
+         self.assertEqual(
+             request.requestHeaders.getRawHeaders(b"tab"),
+-            [b"t \ta \tb"],
++            [b"t a b"],
+         )
+ 
+     def test_headerStripWhitespace(self):
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-3.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-3.patch
new file mode 100644
index 0000000000..5a9a287986
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-3.patch
@@ -0,0 +1,25 @@
+From 5897923d523b357f93eb844e386bcc52c5490cdc Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Mon, 7 Mar 2022 00:03:50 -0800
+Subject: [PATCH] Strip only spaces and tabs from header values
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/c3a4e1d015740c1d87a3ec7d57570257e75b0062]
+CVE: CVE-2022-24801
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/twisted/web/http.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index 5491953..262da0b 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -2327,7 +2327,7 @@ class HTTPChannel(basic.LineReceiver, policies.TimeoutMixin):
+             return False
+ 
+         header = header.lower()
+-        data = data.strip()
++        data = data.strip(b" \t")
+ 
+         if not self._maybeChooseTransferDecoder(header, data):
+             return False
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-4.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-4.patch
new file mode 100644
index 0000000000..94c4b9c550
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-4.patch
@@ -0,0 +1,25 @@
+From c6838374d0e323b78877ae546e1471c400e4652d Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Mon, 7 Mar 2022 00:32:14 -0800
+Subject: [PATCH] Reject non-digit Content-Length
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/8ebfa8f6577431226e109ff98ba48f5152a2c416]
+CVE: CVE-2022-24801
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/twisted/web/http.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index 262da0b..5316d81 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -2274,6 +2274,8 @@ class HTTPChannel(basic.LineReceiver, policies.TimeoutMixin):
+ 
+         # Can this header determine the length?
+         if header == b"content-length":
++            if not data.isdigit():
++                return fail()
+             try:
+                 length = int(data)
+             except ValueError:
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-5.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-5.patch
new file mode 100644
index 0000000000..4c014bf669
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-5.patch
@@ -0,0 +1,71 @@
+From 8859df3b77eabf99a9b40c5e595bccaae4539ae0 Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Sun, 13 Mar 2022 23:19:39 -0700
+Subject: [PATCH] Test for malformed chunk size and extensions
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/f22d0d9c889822adb7eaf84b42a20ff5f7c4d421]
+CVE: CVE-2022-24801
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/twisted/web/test/test_http.py | 34 +++++++++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/src/twisted/web/test/test_http.py b/src/twisted/web/test/test_http.py
+index 8a7adc0..e686aeb 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -1371,6 +1371,22 @@ class ChunkedTransferEncodingTests(unittest.TestCase):
+         p.dataReceived(b"3; x-foo=bar\r\nabc\r\n")
+         self.assertEqual(L, [b"abc"])
+ 
++    def test_extensionsMalformed(self):
++        """
++        L{_ChunkedTransferDecoder.dataReceived} raises
++        L{_MalformedChunkedDataError} when the chunk extension fields contain
++        invalid characters.
++
++        This is a potential request smuggling vector: see GHSA-c2jg-hw38-jrqq.
++        """
++        for b in [*range(0, 0x09), *range(0x10, 0x21), *range(0x74, 0x80)]:
++            data = b"3; " + bytes((b,)) + b"\r\nabc\r\n"
++            p = http._ChunkedTransferDecoder(
++                lambda b: None,  # pragma: nocov
++                lambda b: None,  # pragma: nocov
++            )
++            self.assertRaises(http._MalformedChunkedDataError, p.dataReceived, data)
++
+     def test_oversizedChunkSizeLine(self):
+         """
+         L{_ChunkedTransferDecoder.dataReceived} raises
+@@ -1426,6 +1442,22 @@ class ChunkedTransferEncodingTests(unittest.TestCase):
+             http._MalformedChunkedDataError, p.dataReceived, b"-3\r\nabc\r\n"
+         )
+ 
++    def test_malformedChunkSizeHex(self):
++        """
++        L{_ChunkedTransferDecoder.dataReceived} raises
++        L{_MalformedChunkedDataError} when the chunk size is prefixed with
++        "0x", as if it were a Python integer literal.
++
++        This is a potential request smuggling vector: see GHSA-c2jg-hw38-jrqq.
++        """
++        p = http._ChunkedTransferDecoder(
++            lambda b: None,  # pragma: nocov
++            lambda b: None,  # pragma: nocov
++        )
++        self.assertRaises(
++            http._MalformedChunkedDataError, p.dataReceived, b"0x3\r\nabc\r\n"
++        )
++
+     def test_malformedChunkEnd(self):
+         r"""
+         L{_ChunkedTransferDecoder.dataReceived} raises
+@@ -1538,6 +1570,8 @@ class ChunkingTests(unittest.TestCase, ResponseTestMixin):
+             chunked = b"".join(http.toChunk(s))
+             self.assertEqual((s, b""), http.fromChunk(chunked))
+         self.assertRaises(ValueError, http.fromChunk, b"-5\r\nmalformed!\r\n")
++        self.assertRaises(ValueError, http.fromChunk, b"0xa\r\nmalformed!\r\n")
++        self.assertRaises(ValueError, http.fromChunk, b"0XA\r\nmalformed!\r\n")
+ 
+     def testConcatenatedChunks(self):
+         chunked = b"".join([b"".join(http.toChunk(t)) for t in self.strings])
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-6.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-6.patch
new file mode 100644
index 0000000000..26007d9e04
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-6.patch
@@ -0,0 +1,129 @@
+From e33f7fc231845487f969a9c0fbf7956226ac8dfa Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Sun, 13 Mar 2022 23:51:52 -0700
+Subject: [PATCH] Reject malformed chunk sizes
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/0275152f147506c82868ff1dabd9bf655ab67946]
+CVE: CVE-2022-24801
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/twisted/web/http.py           | 35 +++++++++++++++++++++++----
+ src/twisted/web/test/test_http.py | 40 +++++++++++++++++++++++++++++++
+ 2 files changed, 71 insertions(+), 4 deletions(-)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index 5316d81..940ff9f 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -108,7 +108,7 @@ import tempfile
+ import time
+ import warnings
+ from io import BytesIO
+-from typing import AnyStr, Callable, Optional
++from typing import AnyStr, Callable, Optional, Tuple
+ from urllib.parse import (
+     ParseResultBytes,
+     unquote_to_bytes as unquote,
+@@ -410,7 +410,33 @@ def toChunk(data):
+     return (networkString(f"{len(data):x}"), b"\r\n", data, b"\r\n")
+ 
+ 
+-def fromChunk(data):
++def _ishexdigits(b: bytes) -> bool:
++    """
++    Is the string case-insensitively hexidecimal?
++
++    It must be composed of one or more characters in the ranges a-f, A-F
++    and 0-9.
++    """
++    for c in b:
++        if c not in b'0123456789abcdefABCDEF':
++            return False
++    return bool(b)
++
++
++def _hexint(b: bytes) -> int:
++    """
++    Decode a hexadecimal integer.
++
++    Unlike L{int(b, 16)}, this raises L{ValueError} when the integer has
++    a prefix like C{b'0x'}, C{b'+'}, or C{b'-'}, which is desirable when
++    parsing network protocols.
++    """
++    if not _ishexdigits(b):
++        raise ValueError(b)
++    return int(b, 16)
++
++
++def fromChunk(data: bytes) -> Tuple[bytes, bytes]:
+     """
+     Convert chunk to string.
+ 
+@@ -422,7 +448,7 @@ def fromChunk(data):
+         byte string.
+     """
+     prefix, rest = data.split(b"\r\n", 1)
+-    length = int(prefix, 16)
++    length = _hexint(prefix)
+     if length < 0:
+         raise ValueError("Chunk length must be >= 0, not %d" % (length,))
+     if rest[length : length + 2] != b"\r\n":
+@@ -1883,8 +1909,9 @@ class _ChunkedTransferDecoder:
+         endOfLengthIndex = self._buffer.find(b";", 0, eolIndex)
+         if endOfLengthIndex == -1:
+             endOfLengthIndex = eolIndex
++        rawLength = self._buffer[0:endOfLengthIndex]
+         try:
+-            length = int(self._buffer[0:endOfLengthIndex], 16)
++            length = _hexint(rawLength)
+         except ValueError:
+             raise _MalformedChunkedDataError("Chunk-size must be an integer.")
+ 
+diff --git a/src/twisted/web/test/test_http.py b/src/twisted/web/test/test_http.py
+index e686aeb..201991f 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -4472,3 +4472,43 @@ class HTTPClientSanitizationTests(unittest.SynchronousTestCase):
+                 transport.value().splitlines(),
+                 [b": ".join([sanitizedBytes, sanitizedBytes])],
+             )
++
++
++class HexHelperTests(unittest.SynchronousTestCase):
++    """
++    Test the L{http._hexint} and L{http._ishexdigits} helper functions.
++    """
++
++    badStrings = (b"", b"0x1234", b"feds", b"-123" b"+123")
++
++    def test_isHex(self):
++        """
++        L{_ishexdigits()} returns L{True} for nonempy bytestrings containing
++        hexadecimal digits.
++        """
++        for s in (b"10", b"abcdef", b"AB1234", b"fed", b"123467890"):
++            self.assertIs(True, http._ishexdigits(s))
++
++    def test_decodes(self):
++        """
++        L{_hexint()} returns the integer equivalent of the input.
++        """
++        self.assertEqual(10, http._hexint(b"a"))
++        self.assertEqual(0x10, http._hexint(b"10"))
++        self.assertEqual(0xABCD123, http._hexint(b"abCD123"))
++
++    def test_isNotHex(self):
++        """
++        L{_ishexdigits()} returns L{False} for bytestrings that don't contain
++        hexadecimal digits, including the empty string.
++        """
++        for s in self.badStrings:
++            self.assertIs(False, http._ishexdigits(s))
++
++    def test_decodeNotHex(self):
++        """
++        L{_hexint()} raises L{ValueError} for bytestrings that can't
++        be decoded.
++        """
++        for s in self.badStrings:
++            self.assertRaises(ValueError, http._hexint, s)
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-7.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-7.patch
new file mode 100644
index 0000000000..3fb4f432b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-7.patch
@@ -0,0 +1,27 @@
+From a2fd35cf03bd3a847fd47a6f1a812e359c2dafda Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Sun, 13 Mar 2022 23:57:23 -0700
+Subject: [PATCH] Remove unreachable branch
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/696bfeaf5a1fa7ff952f860c89e2bdcfacef7d7a]
+CVE: CVE-2022-24801
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/twisted/web/http.py | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index 940ff9f..ea77f57 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -1915,9 +1915,7 @@ class _ChunkedTransferDecoder:
+         except ValueError:
+             raise _MalformedChunkedDataError("Chunk-size must be an integer.")
+ 
+-        if length < 0:
+-            raise _MalformedChunkedDataError("Chunk-size must not be negative.")
+-        elif length == 0:
++        if length == 0:
+             self.state = "TRAILER"
+         else:
+             self.state = "BODY"
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-8.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-8.patch
new file mode 100644
index 0000000000..e426d4d8f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-8.patch
@@ -0,0 +1,108 @@
+From 29b4c6ab9a917200a37d6fca1243a7f57caba922 Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Sun, 27 Mar 2022 22:17:30 -0700
+Subject: [PATCH] Correct chunk extension byte validation
+
+Go back to the RFC to figure out the correct allowed ranges.
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/fa9caa54d63399b4ccdfbf0429ba1b504ccc7c89]
+CVE: CVE-2022-24801
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/twisted/web/http.py           | 49 ++++++++++++++++++++++++++++++-
+ src/twisted/web/test/test_http.py |  8 ++++-
+ 2 files changed, 55 insertions(+), 2 deletions(-)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index ea77f57..81df437 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -418,7 +418,7 @@ def _ishexdigits(b: bytes) -> bool:
+     and 0-9.
+     """
+     for c in b:
+-        if c not in b'0123456789abcdefABCDEF':
++        if c not in b"0123456789abcdefABCDEF":
+             return False
+     return bool(b)
+ 
+@@ -1816,6 +1816,47 @@ class _IdentityTransferDecoder:
+ maxChunkSizeLineLength = 1024
+ 
+ 
++_chunkExtChars = (
++    b"\t !\"#$%&'()*+,-./0123456789:;<=>?@"
++    b"ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`"
++    b"abcdefghijklmnopqrstuvwxyz{|}~"
++    b"\x80\x81\x82\x83\x84\x85\x86\x87\x88\x89\x8a\x8b\x8c\x8d\x8e\x8f"
++    b"\x90\x91\x92\x93\x94\x95\x96\x97\x98\x99\x9a\x9b\x9c\x9d\x9e\x9f"
++    b"\xa0\xa1\xa2\xa3\xa4\xa5\xa6\xa7\xa8\xa9\xaa\xab\xac\xad\xae\xaf"
++    b"\xb0\xb1\xb2\xb3\xb4\xb5\xb6\xb7\xb8\xb9\xba\xbb\xbc\xbd\xbe\xbf"
++    b"\xc0\xc1\xc2\xc3\xc4\xc5\xc6\xc7\xc8\xc9\xca\xcb\xcc\xcd\xce\xcf"
++    b"\xd0\xd1\xd2\xd3\xd4\xd5\xd6\xd7\xd8\xd9\xda\xdb\xdc\xdd\xde\xdf"
++    b"\xe0\xe1\xe2\xe3\xe4\xe5\xe6\xe7\xe8\xe9\xea\xeb\xec\xed\xee\xef"
++    b"\xf0\xf1\xf2\xf3\xf4\xf5\xf6\xf7\xf8\xf9\xfa\xfb\xfc\xfd\xfe\xff"
++)
++"""
++Characters that are valid in a chunk extension.
++
++See RFC 7230 section 4.1.1:
++
++     chunk-ext      = *( ";" chunk-ext-name [ "=" chunk-ext-val ] )
++
++     chunk-ext-name = token
++     chunk-ext-val  = token / quoted-string
++
++Section 3.2.6:
++
++     token          = 1*tchar
++
++     tchar          = "!" / "#" / "$" / "%" / "&" / "'" / "*"
++                    / "+" / "-" / "." / "^" / "_" / "`" / "|" / "~"
++                    / DIGIT / ALPHA
++                    ; any VCHAR, except delimiters
++
++     quoted-string  = DQUOTE *( qdtext / quoted-pair ) DQUOTE
++     qdtext         = HTAB / SP /%x21 / %x23-5B / %x5D-7E / obs-text
++     obs-text       = %x80-FF
++
++We don't check if chunk extensions are well-formed beyond validating that they
++don't contain characters outside this range.
++"""
++
++
+ class _ChunkedTransferDecoder:
+     """
+     Protocol for decoding I{chunked} Transfer-Encoding, as defined by RFC 7230,
+@@ -1915,6 +1956,12 @@ class _ChunkedTransferDecoder:
+         except ValueError:
+             raise _MalformedChunkedDataError("Chunk-size must be an integer.")
+ 
++        ext = self._buffer[endOfLengthIndex + 1 : eolIndex]
++        if ext and ext.translate(None, _chunkExtChars) != b"":
++            raise _MalformedChunkedDataError(
++                f"Invalid characters in chunk extensions: {ext!r}."
++            )
++
+         if length == 0:
+             self.state = "TRAILER"
+         else:
+diff --git a/src/twisted/web/test/test_http.py b/src/twisted/web/test/test_http.py
+index 201991f..eccb9b0 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -1379,7 +1379,13 @@ class ChunkedTransferEncodingTests(unittest.TestCase):
+ 
+         This is a potential request smuggling vector: see GHSA-c2jg-hw38-jrqq.
+         """
+-        for b in [*range(0, 0x09), *range(0x10, 0x21), *range(0x74, 0x80)]:
++        invalidControl = (
++            b"\x00\x01\x02\x03\x04\x05\x06\x07\x08\n\x0b\x0c\r\x0e\x0f"
++            b"\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f"
++        )
++        invalidDelimiter = b"\\"
++        invalidDel = b"\x7f"
++        for b in invalidControl + invalidDelimiter + invalidDel:
+             data = b"3; " + bytes((b,)) + b"\r\nabc\r\n"
+             p = http._ChunkedTransferDecoder(
+                 lambda b: None,  # pragma: nocov
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-9.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-9.patch
new file mode 100644
index 0000000000..e49afde74b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-9.patch
@@ -0,0 +1,25 @@
+From 349771026e1eb80cab7a19ceb8b80aa6d1bb3184 Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Fri, 1 Apr 2022 20:47:59 -0700
+Subject: [PATCH] Address review feedback
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/2bbd6c89110f0d44d2bb109c14d787f65bca9df8]
+CVE: CVE-2022-24801
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/twisted/web/http.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index 81df437..4a2ce1d 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -420,7 +420,7 @@ def _ishexdigits(b: bytes) -> bool:
+     for c in b:
+         if c not in b"0123456789abcdefABCDEF":
+             return False
+-    return bool(b)
++    return b != b""
+ 
+ 
+ def _hexint(b: bytes) -> int:
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index 5b23ceeb91..8e140f387e 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -12,9 +12,19 @@ SRC_URI[sha256sum] = "57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba5
 PYPI_PACKAGE = "Twisted"
 
 SRC_URI += "file://CVE-2024-41671-0001.patch \
-            file://CVE-2024-41671-0002.patch \
-            file://CVE-2024-41810.patch \
-            file://CVE-2023-46137.patch"
+           file://CVE-2024-41671-0002.patch \
+           file://CVE-2024-41810.patch \
+           file://CVE-2023-46137.patch \
+           file://CVE-2022-24801-1.patch \
+           file://CVE-2022-24801-2.patch \
+           file://CVE-2022-24801-3.patch \
+           file://CVE-2022-24801-4.patch \
+           file://CVE-2022-24801-5.patch \
+           file://CVE-2022-24801-6.patch \
+           file://CVE-2022-24801-7.patch \
+           file://CVE-2022-24801-8.patch \
+           file://CVE-2022-24801-9.patch \
+           "
 
 inherit pypi python_setuptools_build_meta
 

