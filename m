Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A68FCF6BE6
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 07:46:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1673.1767858383781600927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 23:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U3yDU4CC;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso20794985e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 23:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767858382; x=1768463182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFwna7vBWeO+Oi4EeruL27s1vBTXfY2ay4Y+KEXx95M=;
        b=U3yDU4CCxGI0S30oOwc9N1zLrfOxCMFy6+/DHXBLYCGv2qGAuG3hibS71avJiGGCax
         7JQrSxzyJDQBIgo+XWgGTKis+2+vfIRh54l+8k+LTpkWtCt3Vy2FtWWondkFg55fGodH
         TzEyBofxy3jWsUklc6irsbMBGPkYPe2zeh1cl9OdH89lCpiXEpWv5e4gUqUZL4KRqLgz
         fLZTl4R6V55LkQluGfYW6Hcda5YI8PKWQ4nyqKecCn2OrgD9RZdMzzaFzcAv+04Kk8rp
         OLTsHoHw3LliaYMT81m/VF/h7GklttjVPmUiBWYr7ENohl609Hj97tQC696jKsQytecx
         IZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767858382; x=1768463182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aFwna7vBWeO+Oi4EeruL27s1vBTXfY2ay4Y+KEXx95M=;
        b=DdfVhG8FHqoGB/bpZKbWWZxaRpz8/2iXsws8anOrF9sZConC/bIV0Mq2+Nz1bqcP+A
         gdN/fRXbJ2n2kcG5Tbux43vSEWzoOtJ0EPCSnINUjBGfiQCDW8ALfeRHXha6PjAcReTv
         jp2Yy8hTl5aeCDjYF3uVCy3S6tzBjJYZ3dHAxFES50R/IMD36ghTtZj8jfz3gs8IBE8q
         hkbzXglNZRlslV0xxCC5u3pDyusoOW/Q2NPWeHS6TuafB76k3jT1OQl3ftgtYNKd5moB
         rICLkJ1S0Qmf7Q1s1f7/NnjGj0M7QRgdtr60UjgRs74ojjn7kY+33Sr41XN5sAic8WK4
         FMdw==
X-Gm-Message-State: AOJu0Yzk5HFcgRORNZ0LyHIJ5HLYtSyGiXsD3tI6mYjXd1nkMqdUh5BK
	UcfSuT3dxZTjSZ4FivVvuh1TkbchaAzivai9rRKubUnhqozhG2kP2mCYHRyWkQ==
X-Gm-Gg: AY/fxX7NSrhmxfP/oi5bgddhIE6my4LMrjjJP1ZF9qHXQruOXvKjo74w1mW1RbmNDcl
	10bQLglxWV2fHFIqJZvsjCB5i+TL8D7LYjdZRjjcxmyK1A+G9916i8t5WsEjbnfIMxsat8rV2XA
	OyE8UJP16HYlvBUus97HX3TEYwRUP8rMVONvqBY7u4DlwcZWVz6q037iDzOSkSE5v0ufOHV5aD4
	YNUMF+IXcdM51wPsMtLMOqbCjvTIXQPAUWzmWVAiXWqb+ouyhH6aziEQcabjhPzhNLekJFka4xJ
	L7Zb3FFvG+FaI14CoK/b0Y17hq9FDVb/RpG1Qi2+pN1BSpfntnu2TooylETyK9U2Oi7T+hwtynU
	Lf7EHdH/4JlxA1OgtM6u79xzw6Gs1DBS0RCgnYTMJT+USZC/IKttdj8Uoyaz/oaOaUr9X+QoJl0
	BUeVMCohLU
X-Google-Smtp-Source: AGHT+IE/vu6td9htvFKdpxwBBVXHCVe+CYk7j0mDyzqBR+SY9xDJlh+7gUZffhPbm039stSQ0XMevA==
X-Received: by 2002:a05:600c:4ed3:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47d84b34785mr71954645e9.21.1767858381894;
        Wed, 07 Jan 2026 23:46:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm15200292f8f.11.2026.01.07.23.46.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 23:46:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 4/5] python3-tornado: patch CVE-2024-52804
Date: Thu,  8 Jan 2026 08:46:16 +0100
Message-ID: <20260108074618.2782232-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108074618.2782232-1-skandigraun@gmail.com>
References: <20260108074618.2782232-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 07:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123251

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-52804

Pick the patch mentioned by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-tornado/CVE-2024-52804.patch      | 142 ++++++++++++++++++
 .../python/python3-tornado_6.1.bb             |   4 +-
 2 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2024-52804.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2024-52804.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2024-52804.patch
new file mode 100644
index 0000000000..0279c6859c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2024-52804.patch
@@ -0,0 +1,142 @@
+From b4918d1e62a3f53cdba19d1b1af5938c7b6b1720 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Thu, 21 Nov 2024 14:48:05 -0500
+Subject: [PATCH] httputil: Fix quadratic performance of cookie parsing
+
+Maliciously-crafted cookies can cause Tornado to
+spend an unreasonable amount of CPU time and block
+the event loop.
+
+This change replaces the quadratic algorithm with
+a more efficient one. The implementation is copied
+from the Python 3.13 standard library (the
+previous one was from Python 3.5).
+
+Fixes CVE-2024-52804
+See CVE-2024-7592 for a similar vulnerability in cpython.
+
+Thanks to github.com/kexinoh for the report.
+
+CVE: CVE-2024-52804
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/d5ba4a1695fbf7c6a3e54313262639b198291533]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tornado/httputil.py           | 38 ++++++++---------------------
+ tornado/test/httputil_test.py | 46 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 56 insertions(+), 28 deletions(-)
+
+diff --git a/tornado/httputil.py b/tornado/httputil.py
+index bd32cd0..bb50786 100644
+--- a/tornado/httputil.py
++++ b/tornado/httputil.py
+@@ -1052,15 +1052,20 @@ def qs_to_qsl(qs: Dict[str, List[AnyStr]]) -> Iterable[Tuple[str, AnyStr]]:
+             yield (k, v)
+ 
+ 
+-_OctalPatt = re.compile(r"\\[0-3][0-7][0-7]")
+-_QuotePatt = re.compile(r"[\\].")
+-_nulljoin = "".join
++_unquote_sub = re.compile(r"\\(?:([0-3][0-7][0-7])|(.))").sub
++
++
++def _unquote_replace(m: re.Match) -> str:
++    if m[1]:
++        return chr(int(m[1], 8))
++    else:
++        return m[2]
+ 
+ 
+ def _unquote_cookie(s: str) -> str:
+     """Handle double quotes and escaping in cookie values.
+ 
+-    This method is copied verbatim from the Python 3.5 standard
++    This method is copied verbatim from the Python 3.13 standard
+     library (http.cookies._unquote) so we don't have to depend on
+     non-public interfaces.
+     """
+@@ -1081,30 +1086,7 @@ def _unquote_cookie(s: str) -> str:
+     #    \012 --> \n
+     #    \"   --> "
+     #
+-    i = 0
+-    n = len(s)
+-    res = []
+-    while 0 <= i < n:
+-        o_match = _OctalPatt.search(s, i)
+-        q_match = _QuotePatt.search(s, i)
+-        if not o_match and not q_match:  # Neither matched
+-            res.append(s[i:])
+-            break
+-        # else:
+-        j = k = -1
+-        if o_match:
+-            j = o_match.start(0)
+-        if q_match:
+-            k = q_match.start(0)
+-        if q_match and (not o_match or k < j):  # QuotePatt matched
+-            res.append(s[i:k])
+-            res.append(s[k + 1])
+-            i = k + 2
+-        else:  # OctalPatt matched
+-            res.append(s[i:j])
+-            res.append(chr(int(s[j + 1 : j + 4], 8)))
+-            i = j + 4
+-    return _nulljoin(res)
++    return _unquote_sub(_unquote_replace, s)
+ 
+ 
+ def parse_cookie(cookie: str) -> Dict[str, str]:
+diff --git a/tornado/test/httputil_test.py b/tornado/test/httputil_test.py
+index 0fad403..25faf66 100644
+--- a/tornado/test/httputil_test.py
++++ b/tornado/test/httputil_test.py
+@@ -519,3 +519,49 @@ class ParseCookieTest(unittest.TestCase):
+         self.assertEqual(
+             parse_cookie("  =  b  ;  ;  =  ;   c  =  ;  "), {"": "b", "c": ""}
+         )
++
++    def test_unquote(self):
++        # Copied from
++        # https://github.com/python/cpython/blob/dc7a2b6522ec7af41282bc34f405bee9b306d611/Lib/test/test_http_cookies.py#L62
++        cases = [
++            (r'a="b=\""', 'b="'),
++            (r'a="b=\\"', "b=\\"),
++            (r'a="b=\="', "b=="),
++            (r'a="b=\n"', "b=n"),
++            (r'a="b=\042"', 'b="'),
++            (r'a="b=\134"', "b=\\"),
++            (r'a="b=\377"', "b=\xff"),
++            (r'a="b=\400"', "b=400"),
++            (r'a="b=\42"', "b=42"),
++            (r'a="b=\\042"', "b=\\042"),
++            (r'a="b=\\134"', "b=\\134"),
++            (r'a="b=\\\""', 'b=\\"'),
++            (r'a="b=\\\042"', 'b=\\"'),
++            (r'a="b=\134\""', 'b=\\"'),
++            (r'a="b=\134\042"', 'b=\\"'),
++        ]
++        for encoded, decoded in cases:
++            with self.subTest(encoded):
++                c = parse_cookie(encoded)
++                self.assertEqual(c["a"], decoded)
++
++    def test_unquote_large(self):
++        # Adapted from
++        # https://github.com/python/cpython/blob/dc7a2b6522ec7af41282bc34f405bee9b306d611/Lib/test/test_http_cookies.py#L87
++        # Modified from that test because we handle semicolons differently from the stdlib.
++        #
++        # This is a performance regression test: prior to improvements in Tornado 6.4.2, this test
++        # would take over a minute with n= 100k. Now it runs in tens of milliseconds.
++        n = 100000
++        for encoded in r"\\", r"\134":
++            with self.subTest(encoded):
++                start = time.time()
++                data = 'a="b=' + encoded * n + '"'
++                value = parse_cookie(data)["a"]
++                end = time.time()
++                self.assertEqual(value[:3], "b=\\")
++                self.assertEqual(value[-3:], "\\\\\\")
++                self.assertEqual(len(value), n + 2)
++
++                # Very loose performance check to avoid false positives
++                self.assertLess(end - start, 1, "Test took too long")
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.1.bb b/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
index d4cb58febc..0d96cbd10e 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
@@ -6,7 +6,9 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI += "file://CVE-2023-28370.patch"
+SRC_URI += "file://CVE-2023-28370.patch \
+            file://CVE-2024-52804.patch \
+"
 SRC_URI[md5sum] = "f324f5e7607798552359d6ab054c4321"
 SRC_URI[sha256sum] = "33c6e81d7bd55b468d2e793517c909b139960b6c790a60b7991b9b6b76fb9791"
 

