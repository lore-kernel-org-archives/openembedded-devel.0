Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2EFCCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 06:18:52 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.2514.1761113910647801306
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 23:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jjQtbK/K;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27c369f898fso92102485ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 23:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761113910; x=1761718710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7gGl8u9BSN0D91ejodoybmW7RxMR3CQiu0OCLR7k/o=;
        b=jjQtbK/K/0FUOF++lAJJ91mgYZNOd5DgU3zJrmOKYRbAow/D53oWieHN8crjCZPIua
         StMyaaqR6IF1rX9DrsI397YdnWn1ImbN7kpzoAvReEZmjYG4LPKmMUc1EW0aRJca7KQu
         RUAvD3vyN2OEMWSkwe5BVwt/+fsQLIfD9OwSjRCnAZ8LJrkPOuKtDgU+8w2xuQ0pb7Wj
         btrUFWG/EYRiwSZk4ifNNriZ1OFQE0AhLco6sQ1vGL1A2dsrjOV47mFDtw/C5aMQFlzO
         61xeBljG1sI7l9fnkEqcIUdl687GIK5SYxXrWYq21mBbIHP15kDBAom4qkZ5P8q9gECA
         1+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113910; x=1761718710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7gGl8u9BSN0D91ejodoybmW7RxMR3CQiu0OCLR7k/o=;
        b=uJmuGeMyxYP2HJZrjChOm5dYg3CJ7eccpEr9sEsuLVpDIHKRYSIkq+EJNftpvAMb4I
         8+utgM12IXHF1z/hVGDF8kMjYLc1Ms0yN2udBs3OcpRTMsprzVNqCb+2wLeq2RyDfmZU
         LVov+71V8an2jOoivJzqUmB3bI6QtNyBS66GIQuVlXmjuDo+7AgTcUqS950MH7zONQGT
         lvg1Xu29GIZzPpSWcQh90SHhI+ZwEbCqsKVgpUm7e5vAPc7XF7hOBNy6GsF41NDSeFkz
         VLnMsPhNRV3WvTRSQgPClXeAmW4+W2jwNq1z5Jp5O3gWndEOK3cdDbQ1uy2Fv3QJlbzH
         P7rw==
X-Gm-Message-State: AOJu0YzWQd7vzEcqE/r7ga5rbuLuIL1MnJC50Mte/6PXp8lW072jwX0L
	ariPEd0+6jJiYw0qVZWcUZqu8T0O9U6E43KnV3kV++22obk+XApQCF8O7yBrxw==
X-Gm-Gg: ASbGncvJSu7xc42TCfObEKA4BhNZIrbWjPtQSbVqFNlpU7NwEWq28w5jywXJeL+gXd9
	XpokImxWbkl9qF4z+AMsr/XHlrDQ/QbozQUXRYE8UTZLSankvUiUerMGS3TGRcGaOFEg1V7AmdS
	C2o586mSzmdeC4+aiCBtRYBnXqE8Q5K2ytPCbqwu/PeB4AUOukuSnjRtme3qqq//6Ix2dZmXjia
	kwhEiLbxjspB/cCSa8fgwsZOSUw9VM2saFAer3PiOLyOEHS17l/gmDeWOobMKLH9wJ+qjOrkaZ3
	L+6cFfRaD+CzMTo21LabTV80QH56NZ++X7FqjG5g7to57yrVyiMIS9URb5O1MsuzNWdG913Yuxm
	FdvUEXdUQpKGiVYGDceJ69iiz1W7QuoxPWIhA7/R80y94TZ7uXFZwZgDVV1RigskcAyZKGCmgdP
	5AjaVrp3lY6nQWBGpP+1VsMNB7
X-Google-Smtp-Source: AGHT+IFEyFFz41R127mh281MKOs5cURYVKOZSXX8S3Br751upUGl6LukRL10n80EorMRQEpDk9ASqg==
X-Received: by 2002:a17:903:46c7:b0:274:aab9:4ed4 with SMTP id d9443c01a7336-290cb65f861mr262201475ad.57.1761113909764;
        Tue, 21 Oct 2025 23:18:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fde09sm127857485ad.93.2025.10.21.23.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:18:29 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 3/8] python3-django: patch CVE-2025-32873
Date: Wed, 22 Oct 2025 19:17:54 +1300
Message-ID: <20251022061803.887676-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
References: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 06:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120886

Details https://nvd.nist.gov/vuln/detail/CVE-2025-32873

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2025-32873.patch                      | 85 +++++++++++++++++++
 .../python/python3-django_4.2.20.bb           |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-32873.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-32873.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-32873.patch
new file mode 100644
index 0000000000..4c7bda962a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-32873.patch
@@ -0,0 +1,85 @@
+From 1bd7650f2978c0824772e3d12f6c8b3ecefa10e0 Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Tue, 8 Apr 2025 16:30:17 +0200
+Subject: [PATCH] [4.2.x] Fixed CVE-2025-32873 -- Mitigated potential DoS in
+ strip_tags().
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Thanks to Elias Myllymäki for the report, and Shai Berger and Jake
+Howard for the reviews.
+
+Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
+
+Backport of 9f3419b519799d69f2aba70b9d25abe2e70d03e0 from main.
+
+CVE: CVE-2025-32873
+Upstream-Status: Backport [https://github.com/django/django/commit/9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c]
+(cherry picked from commit 9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ django/utils/html.py           |  6 ++++++
+ tests/utils_tests/test_html.py | 15 ++++++++++++++-
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index a3a7238cba..84c37d1186 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -17,6 +17,9 @@ from django.utils.text import normalize_newlines
+ MAX_URL_LENGTH = 2048
+ MAX_STRIP_TAGS_DEPTH = 50
+ 
++# HTML tag that opens but has no closing ">" after 1k+ chars.
++long_open_tag_without_closing_re = _lazy_re_compile(r"<[a-zA-Z][^>]{1000,}")
++
+ 
+ @keep_lazy(SafeString)
+ def escape(text):
+@@ -175,6 +178,9 @@ def _strip_once(value):
+ def strip_tags(value):
+     """Return the given HTML with all tags stripped."""
+     value = str(value)
++    for long_open_tag in long_open_tag_without_closing_re.finditer(value):
++        if long_open_tag.group().count("<") >= MAX_STRIP_TAGS_DEPTH:
++            raise SuspiciousOperation
+     # Note: in typical case this loop executes _strip_once twice (the second
+     # execution does not remove any more tags).
+     strip_tags_depth = 0
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
+index 579bb2a1e3..25168e2348 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -115,17 +115,30 @@ class TestUtilsHtml(SimpleTestCase):
+             ("><!" + ("&" * 16000) + "D", "><!" + ("&" * 16000) + "D"),
+             ("X<<<<br>br>br>br>X", "XX"),
+             ("<" * 50 + "a>" * 50, ""),
++            (">" + "<a" * 500 + "a", ">" + "<a" * 500 + "a"),
++            ("<a" * 49 + "a" * 951, "<a" * 49 + "a" * 951),
++            ("<" + "a" * 1_002, "<" + "a" * 1_002),
+         )
+         for value, output in items:
+             with self.subTest(value=value, output=output):
+                 self.check_output(strip_tags, value, output)
+                 self.check_output(strip_tags, lazystr(value), output)
+ 
+-    def test_strip_tags_suspicious_operation(self):
++    def test_strip_tags_suspicious_operation_max_depth(self):
+         value = "<" * 51 + "a>" * 51, "<a>"
+         with self.assertRaises(SuspiciousOperation):
+             strip_tags(value)
+ 
++    def test_strip_tags_suspicious_operation_large_open_tags(self):
++        items = [
++            ">" + "<a" * 501,
++            "<a" * 50 + "a" * 950,
++        ]
++        for value in items:
++            with self.subTest(value=value):
++                with self.assertRaises(SuspiciousOperation):
++                    strip_tags(value)
++
+     def test_strip_tags_files(self):
+         # Test with more lengthy content (also catching performance regressions)
+         for filename in ("strip_tags1.html", "strip_tags2.txt"):
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
index 0b9ff1b8c0..85321e51a2 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -3,6 +3,7 @@ inherit setuptools3
 
 SRC_URI += " \
     file://CVE-2025-26699.patch \
+    file://CVE-2025-32873.patch \
 "
 
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"

