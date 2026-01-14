Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C856D37E20
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:45 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9364.1768395699168150588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mhCID3Ab;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81f47610542so1810385b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395698; x=1769000498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFLFIL7+TI+9K9uDzLIHpjX31lXdcO4fumQ//+n1YRE=;
        b=mhCID3AbypWyH3dtM7wmWqYSqAFm2v2zSFRTVBQX7fC5XVFYtMfiDgPLUmYmZzQruH
         dbBlKYHYI+1W31TRNBx0WOnkvsSwjYKaryjtdDmgokY8tf1ThQcGq4f5LCeGTQGpKkFj
         ANgJoqaLsZJwqmUcTCIIrnADfi5dl/ztHVifnau1l2syhwrZWta72SLBOOgnmAGIyDIJ
         OHlsKCMeEQRcGkL7fHJOlLwHuVX0hRG1pUcjKAf1YBTolhkZX8crnGIQJ3e5vAjLflS1
         hIevMjNmVa8fFa9tmqRjt1+HHwSLwKr+jSHtoYCEl2253gGCK+4m9jzyiLLvNvL/+fEO
         mWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395698; x=1769000498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tFLFIL7+TI+9K9uDzLIHpjX31lXdcO4fumQ//+n1YRE=;
        b=KBzYf5CjaoporRdeuEymKQmi4qCV9KViNTXp9PRF6n/eOiyGArs0IBEDNP/ZGEwLJA
         y1CiKL20KMw5+SLNLMQ/CQpGY+qwSHHARSig4nXQxzjC3MgzukdpiFIrZ0YGUTCeoTMx
         FJ8a9S+yLSRCix9ZJ9d2xI9rrHLqyxKhK2zPAZhqqV2e6FfvZImto4HeYB8e/EEmp9VP
         j9EECAtAtjy98AY/GtcminmqqHxopPFwDzN/dGjbTOjieTqebS3Vncr23UDIFs0ZwqPU
         w4mwuP0eMKB5x5q5AIllh+Br/oJZi6NjAoa9a9D7HLloveKsFafFDIVNIG3iL8fuoZ0v
         l94A==
X-Gm-Message-State: AOJu0YxoWjyoEOC9JjrUg+mxez2FWNsg/6IbVBS8h9MIy4qv4ZKe8Mgf
	ayjdT7SgdfNwdRS7V9Y8sVNGT90nXWUcbYBHFnS6ic3dFc/eR8enKpfevdaXLg==
X-Gm-Gg: AY/fxX5rnydLxyj9Sx6GhmP2Qv4euLUY1HAEk6X+KpmBB5/P4bOEA5dsPI6SBqXIn88
	T+Jz+V4696t8iLiAr+c+Eou2iREsfh/wRy71SPpPe8dylZH9UHpfsrhmRWjY6xHvnWZ4GRzH2B4
	nNt/jgCKpzwwpEmH4757DzXmKTwggV9F8KcZXhTkrGn/xcjDFABWUKK4JU1Bg/WuF+DxPXc1zwt
	9B5WxoDeri0K+XGERGIDd2nN6nWoOykFId33KbUYHfE03ITHVmz2fz9PdxTwLJkcWmPEN+PTTyt
	Xy2vJKE/nHulBTXoCL+iYqrs/VPH0bripFw45FssmdNWu1bwQwWwmVz7LnjZds3VGnSrEKPDNVr
	5qX4nyJQ+n06DNsxx96fowr94ZQGY7o/AKfqyYWGf08lLvvMiWvvEd1Gzt/HdAYhTlNplnqSM7K
	HlSVTILizSRvfZlU1nuOScEj8=
X-Received: by 2002:a05:6a00:2906:b0:81f:8084:7ea0 with SMTP id d2e1a72fcca58-81f81c7b7b5mr2110372b3a.7.1768395698080;
        Wed, 14 Jan 2026 05:01:38 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:37 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 14/20] python3-tornado: patch CVE-2025-67726
Date: Thu, 15 Jan 2026 02:00:51 +1300
Message-ID: <20260114130100.1016416-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123467

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-67726

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-tornado/CVE-2025-67726.patch      | 99 +++++++++++++++++++
 .../python/python3-tornado_6.4.2.bb           |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67726.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67726.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67726.patch
new file mode 100644
index 0000000000..7b210aea42
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67726.patch
@@ -0,0 +1,99 @@
+From 4cdca826270483d8b774461a5fdd64f61af62659 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Wed, 10 Dec 2025 10:55:02 -0500
+Subject: [PATCH] httputil: Fix quadratic behavior in _parseparam
+
+Prior to this change, _parseparam had O(n^2) behavior when parsing
+certain inputs, which could be a DoS vector. This change adapts
+logic from the equivalent function in the python standard library
+in https://github.com/python/cpython/pull/136072/files
+
+CVE: CVE-2025-67726
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/771472cfdaeebc0d89a9cc46e249f8891a6b29cd]
+(cherry picked from commit 771472cfdaeebc0d89a9cc46e249f8891a6b29cd)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tornado/httputil.py           | 29 ++++++++++++++++++++++-------
+ tornado/test/httputil_test.py | 23 +++++++++++++++++++++++
+ 2 files changed, 45 insertions(+), 7 deletions(-)
+
+diff --git a/tornado/httputil.py b/tornado/httputil.py
+index 090a977d..bbacd4a4 100644
+--- a/tornado/httputil.py
++++ b/tornado/httputil.py
+@@ -926,19 +926,34 @@ def parse_response_start_line(line: str) -> ResponseStartLine:
+ # It has also been modified to support valueless parameters as seen in
+ # websocket extension negotiations, and to support non-ascii values in
+ # RFC 2231/5987 format.
++#
++# _parseparam has been further modified with the logic from
++# https://github.com/python/cpython/pull/136072/files
++# to avoid quadratic behavior when parsing semicolons in quoted strings.
++#
++# TODO: See if we can switch to email.message.Message for this functionality.
++# This is the suggested replacement for the cgi.py module now that cgi has
++# been removed from recent versions of Python.  We need to verify that
++# the email module is consistent with our existing behavior (and all relevant
++# RFCs for multipart/form-data) before making this change.
+ 
+ 
+ def _parseparam(s: str) -> Generator[str, None, None]:
+-    while s[:1] == ";":
+-        s = s[1:]
+-        end = s.find(";")
+-        while end > 0 and (s.count('"', 0, end) - s.count('\\"', 0, end)) % 2:
+-            end = s.find(";", end + 1)
++    start = 0
++    while s.find(";", start) == start:
++        start += 1
++        end = s.find(";", start)
++        ind, diff = start, 0
++        while end > 0:
++            diff += s.count('"', ind, end) - s.count('\\"', ind, end)
++            if diff % 2 == 0:
++                break
++            end, ind = ind, s.find(";", end + 1)
+         if end < 0:
+             end = len(s)
+-        f = s[:end]
++        f = s[start:end]
+         yield f.strip()
+-        s = s[end:]
++        start = end
+ 
+ 
+ def _parse_header(line: str) -> Tuple[str, Dict[str, str]]:
+diff --git a/tornado/test/httputil_test.py b/tornado/test/httputil_test.py
+index 9494d0c1..22b1681b 100644
+--- a/tornado/test/httputil_test.py
++++ b/tornado/test/httputil_test.py
+@@ -262,6 +262,29 @@ Foo
+         self.assertEqual(file["filename"], "ab.txt")
+         self.assertEqual(file["body"], b"Foo")
+ 
++    def test_disposition_param_linear_performance(self):
++        # This is a regression test for performance of parsing parameters
++        # to the content-disposition header, specifically for semicolons within
++        # quoted strings.
++        def f(n):
++            start = time.time()
++            message = (
++                b"--1234\r\nContent-Disposition: form-data; "
++                + b'x="'
++                + b";" * n
++                + b'"; '
++                + b'name="files"; filename="a.txt"\r\n\r\nFoo\r\n--1234--\r\n'
++            )
++            args: dict[str, list[bytes]] = {}
++            files: dict[str, list[HTTPFile]] = {}
++            parse_multipart_form_data(b"1234", message, args, files)
++            return time.time() - start
++
++        d1 = f(1_000)
++        d2 = f(10_000)
++        if d2 / d1 > 20:
++            self.fail(f"Disposition param parsing is not linear: {d1=} vs {d2=}")
++
+ 
+ class HTTPHeadersTest(unittest.TestCase):
+     def test_multi_line(self):
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
index ce53ef75ad..3dabcab38b 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] = "92bad5b4746e9879fd7bf1eb21dce4e3fc5128d71601f80005afa39237
 
 SRC_URI += "file://CVE-2025-47287.patch \
             file://CVE-2025-67724.patch \
+            file://CVE-2025-67726.patch \
 "
 
 inherit pypi python_setuptools_build_meta

