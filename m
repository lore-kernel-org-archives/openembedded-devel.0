Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD44C9833E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 00:39:50 +0000 (UTC)
Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29269.1790469581569545464
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 17:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AY1LYR3l;
 spf=pass (domain: gmail.com, ip: 74.125.227.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39d654f02baso831145a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 17:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469581; x=1791074381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OhjvG7RBmMLMxl1tw4VJYcsXX77DE5uwytv6s3oyt7Y=;
        b=AY1LYR3l5pyAubis0CeDtFUUmp4G0iVE4bEsq9TpFvoloWWmMG4LfoxJggFhuaEWXf
         xCcWOzHz6qBbOihYW2yMh2rPA/Sf9byYVbcbEYx5VqOfBThAUm1H8IACpXTSR02OT78z
         iC+3sntqBlsgKLoqpmUJ3VncOAenGEeEIT7GZstpQq9iEB8apCZOA3Er8mht29ZxGUmd
         pSJH+vYVvky6eKhB46scP5NDngnfmsWz0xRsxezQML7xxAgLifGcVF5G2Ha0KvFKAtMv
         ErrfAkYgrleJeYbNG5olDpzAhL+FRbCnItBorJNOGy378c7hKyn9L0HnpLCNC2dWY9uc
         fnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469581; x=1791074381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OhjvG7RBmMLMxl1tw4VJYcsXX77DE5uwytv6s3oyt7Y=;
        b=cydNg9kUgp/9mA3KrYaAXTujQxgaKs4pWVBPf/oufGPHdzrvi+k3NsefyFciGDL5bO
         /yp8X1bj34xqE0+hi+KZzzrl//GFbS4HGr/KWP7AI6ly7RbiLj2wMC7tAXb7lHY07pVo
         VSoSv/drajB4QozNeYuNGAtl3C9XEYHPeVb/i1ic660d3xoNXtY0YX3pJb3CY+XA7j+G
         yuIkZXqxSoWejBXFVh6AZ7/MMbMmNXYRT6EgVlaoP5uTTRMHRvhg/lyjQoe9X6aF+bzC
         1hj7BKpY14ygeVu3vGGkXmvDEYM1l+n0e7uqZdq1x/GwGPxHN3gi3CxNxQzq7EPKChYI
         tziA==
X-Gm-Message-State: AFq9FYJq+BRSk0V/Of0TjJUkhP1vrve2/yHmKKNiDicIsjSe8iS+LKum
	AJTzFTnrI/riXDLBb9InCOZyIaGQnZfelM3s9FfMtzqkbkrYnxCUxjRFk94dWg==
X-Gm-Gg: AYBFou2qfQ2MJ80o0HjLDbww/5j24MRm7e3Fw7AN3aBxhiiihhaB/zcmWHbiYjQ7VHG
	VGdUHNYmHmkL4wC97J3OrldM+QbPSsY7kaIOWaovwz3Z4uVsqZEJHliHLSjDt2uQhuuV92QtTBg
	8fUR7O/YuiMOBl3WoTE53/MMsO5cKFWLlF+U6UgAyGKbeO1k8UNhEavWhR0/1ppVcWPoqFHFjK1
	KPygfUpzSCNqoZMp4aVCy5Xm4lvTf2JZrYejsWIngKNZfOKhKqRFLg56BN6DuJTwQtdfSN5y7vM
	d049KLH1rsgBLbk87KyfUtTQNzPtuK+7mwCsnTF5tznabmXlmO/JEn/iL+E2iWhR8MNcGNKYlL5
	DiyzAAKYzaRxP33bjnwyGu42O1q0Vpq0iaGI5+hm0jPZ0z1Rp8gy+EC9m4MnmG88cYthe4+5tsy
	MeFUXTgBTemO5p6kGAAA01kfceYMBj4Od4ULtHgu/4T6Ra4wY3BFXXXvwMj0hjFknRo76Pq00di
	Sl9c5qodFwG9h7ih+WDDBQ=
X-Received: by 2002:a17:90b:2683:b0:3a0:dbe7:971b with SMTP id 98e67ed59e1d1-3a0dbe79bc2mr2460769a91.67.1790469580827;
        Sat, 26 Sep 2026 17:39:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm2876420a91.1.2026.09.26.17.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:39:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 6/11] python3-tornado: patch CVE-2026-82397
Date: Sun, 27 Sep 2026 13:39:16 +1300
Message-ID: <20260927003921.746786-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
References: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 00:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130325

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-82397

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-tornado/CVE-2026-82397.patch      | 149 ++++++++++++++++++
 .../python/python3-tornado_6.5.7.bb           |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-82397.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-82397.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-82397.patch
new file mode 100644
index 0000000000..71278d5d23
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-82397.patch
@@ -0,0 +1,149 @@
+From eba9e5652af3edbf9d8f2375194b5c63362d0c91 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Wed, 5 Aug 2026 21:20:58 -0400
+Subject: [PATCH] httputil: Enforce a new limit on the number of arguments in a
+ request
+
+Large POST bodies can be very expensive to parse in the worst case,
+so use the (new in Python 3.8) max_num_fields argument to limit the
+cost. A new field in ParseBodyConfig allows users to configure this
+limit. The default is 1000, which is the same as that used in php and
+node.js.
+
+(cherry picked from commit 8d6363ed7b69d5f0da806efe34d256627a2191de)
+
+CVE: CVE-2026-82397
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/8d6363ed7b69d5f0da806efe34d256627a2191de]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tornado/escape.py             | 16 ++++++++++++++--
+ tornado/httputil.py           | 26 +++++++++++++++++++++++++-
+ tornado/test/httputil_test.py | 18 ++++++++++++++++++
+ 3 files changed, 57 insertions(+), 3 deletions(-)
+
+diff --git a/tornado/escape.py b/tornado/escape.py
+index 8515bf58..a1c16b36 100644
+--- a/tornado/escape.py
++++ b/tornado/escape.py
+@@ -171,7 +171,11 @@ def url_unescape(
+ 
+ 
+ def parse_qs_bytes(
+-    qs: Union[str, bytes], keep_blank_values: bool = False, strict_parsing: bool = False
++    qs: Union[str, bytes],
++    keep_blank_values: bool = False,
++    strict_parsing: bool = False,
++    *,
++    max_num_fields: Optional[int] = None,
+ ) -> Dict[str, List[bytes]]:
+     """Parses a query string like urlparse.parse_qs,
+     but takes bytes and returns the values as byte strings.
+@@ -179,13 +183,21 @@ def parse_qs_bytes(
+     Keys still become type str (interpreted as latin1 in python3!)
+     because it's too painful to keep them as byte strings in
+     python3 and in practice they're nearly always ascii anyway.
++
++    .. versionadded:: 6.5.8
++       The ``max_num_fields`` argument. ValueError is raised if this limit is exceeded.
+     """
+     # This is gross, but python3 doesn't give us another way.
+     # Latin1 is the universal donor of character encodings.
+     if isinstance(qs, bytes):
+         qs = qs.decode("latin1")
+     result = urllib.parse.parse_qs(
+-        qs, keep_blank_values, strict_parsing, encoding="latin1", errors="strict"
++        qs,
++        keep_blank_values,
++        strict_parsing,
++        encoding="latin1",
++        errors="strict",
++        max_num_fields=max_num_fields,
+     )
+     encoded = {}
+     for k, v in result.items():
+diff --git a/tornado/httputil.py b/tornado/httputil.py
+index f698db21..b80c796c 100644
+--- a/tornado/httputil.py
++++ b/tornado/httputil.py
+@@ -947,6 +947,23 @@ class ParseMultipartConfig:
+     """
+ 
+ 
++@dataclasses.dataclass
++class ParseUrlEncodedConfig:
++    """This class configures the parsing of ``application/x-www-form-urlencoded`` request bodies.
++
++    Its primary purpose is to place limits on the size and complexity of request messages
++    to avoid potential denial-of-service attacks.
++
++    .. versionadded:: 6.5.8
++    """
++
++    max_arguments: int = 1000
++    """The maximum number of arguments accepted in a urlencoded request.
++
++    Each ``<input>`` element in an HTML form corresponds to at least one argument.
++    """
++
++
+ @dataclasses.dataclass
+ class ParseBodyConfig:
+     """This class configures the parsing of request bodies.
+@@ -957,6 +974,9 @@ class ParseBodyConfig:
+     multipart: ParseMultipartConfig = dataclasses.field(
+         default_factory=ParseMultipartConfig
+     )
++    urlencoded: ParseUrlEncodedConfig = dataclasses.field(
++        default_factory=ParseUrlEncodedConfig
++    )
+     """Configuration for ``multipart/form-data`` request bodies."""
+ 
+ 
+@@ -1015,7 +1035,11 @@ def parse_body_arguments(
+             )
+         try:
+             # real charset decoding will happen in RequestHandler.decode_argument()
+-            uri_arguments = parse_qs_bytes(body, keep_blank_values=True)
++            uri_arguments = parse_qs_bytes(
++                body,
++                keep_blank_values=True,
++                max_num_fields=config.urlencoded.max_arguments,
++            )
+         except Exception as e:
+             raise HTTPInputError("Invalid x-www-form-urlencoded body: %s" % e) from e
+         for name, values in uri_arguments.items():
+diff --git a/tornado/test/httputil_test.py b/tornado/test/httputil_test.py
+index 92683ae9..afb15879 100644
+--- a/tornado/test/httputil_test.py
++++ b/tornado/test/httputil_test.py
+@@ -1,4 +1,5 @@
+ from tornado.httputil import (
++    parse_body_arguments,
+     url_concat,
+     parse_multipart_form_data,
+     HTTPHeaders,
+@@ -95,6 +96,23 @@ class QsParseTest(unittest.TestCase):
+         self.assertIn(("b", "2"), qsl)
+ 
+ 
++class UrlEncodedDataTest(unittest.TestCase):
++    def test_urlencoded_data(self):
++        data = b"a=1&b=2&a=3"
++        args, files = form_data_args()
++        parse_body_arguments("application/x-www-form-urlencoded", data, args, files)
++        self.assertEqual(args["a"], [b"1", b"3"])
++        self.assertEqual(args["b"], [b"2"])
++        self.assertEqual(files, {})
++
++    def test_max_arguments(self):
++        data = b"".join(b"a=1&" for _ in range(1001))
++        args, files = form_data_args()
++        with self.assertRaises(HTTPInputError) as cm:
++            parse_body_arguments("application/x-www-form-urlencoded", data, args, files)
++        self.assertIn("Max number of fields exceeded", str(cm.exception))
++
++
+ class MultipartFormDataTest(unittest.TestCase):
+     def test_file_upload(self):
+         data = b"""\
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index 5d3db11b6b..ce7b903ef7 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI[sha256sum] = "66c513a76cda70d53907bc27cf1447557699c2e95aa48ba27a442ff61c3ddfc2"
 
 SRC_URI += "file://CVE-2026-91990.patch \
+            file://CVE-2026-82397.patch \
 "
 
 inherit pypi python_setuptools_build_meta

