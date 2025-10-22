Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94834CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 23:27:17 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.8321.1761175636828911251
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 16:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SzGqaXDI;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b6ce696c18bso115143a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761175636; x=1761780436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5vU6Yq39HmNeo1b0ZZY0rUj7ENO7+WY0pON3c/LQY4=;
        b=SzGqaXDI3KRxM5m9wv5dR8hul+jDgTkaGorhXRQmtlgCJo58SIjTljtGPWbw/qdnam
         Nm9Myjru9w26lus5NRroNNO1CJCGuETjiMf3CveYc4xw5bQKwAKzj2UfZLDz07Ehk1fO
         UTqmiUcAejYuh6rD7W1yxqqpoJwjNvlg/Mx5/hYACouBUn9ngtN2w89qLLYDcGGclDcM
         BfmF4zc5HjaZnEZLuv5UC7tO1x6SSSCMlGR6qIAZnXdHPP4xfCc+vMI1PmIRSDA5AUjc
         v7L9x/znEHEykV7sYm/TFZrrn8m/gzQ1sJkl1wkXWQ2z1/cLn/cOvogbBDWV88PvbEr8
         ooVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175636; x=1761780436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5vU6Yq39HmNeo1b0ZZY0rUj7ENO7+WY0pON3c/LQY4=;
        b=DI1ncbz0lBRPBGFfMwyyagJAlCoi9lK2upDvUNARkrKWT5koqVoOslewD0ggz4+qM+
         7oBI6V0EKiFba6z8A6Nrh9C5B9RuU0y+ZE5epUnhZOHJbYPqX+KzbXSyNKeL07CXzMsi
         WK+n6NiF55vdian2ON3ChI+2ebcg5ydv0xNVZTImwy/RJSeMRPIj5V3f89zdCwo4JXcM
         RGnDN5PWhaE+DEmj13HzQ958cMRfYM5qbht9irIsGGET66SmROGFxegjIEkM+XT8kmL2
         dJaz7nEemsza1AMfAYpoqX1Z2XnK++jVKtY2T8SAAakLbeWI+2DwyvI7prsz4V11Yk7z
         Pqmw==
X-Gm-Message-State: AOJu0YyVDuILmRHbHpd0f90wQ5MWwKnfkepEwEV1mjGjcYvs8Zxyx5uF
	5SCx74x09SsTDmqYeFCTM2JPJJ6kioJGiNvOmY2IwEMhl4p9woLATkbK3FgLlA==
X-Gm-Gg: ASbGncuIH7y/LChMQ3Lrh0vBopvy83iPyrUD3KWRiPetj3A0UfRHPxjr+akFpAcmxwT
	F+6fhNrrjAxzXuvB13m4eoALhYTUi0dMjNsOQu/VUJdukvJR3Spwv/yjrbnWktIubfPuwfanxtU
	6LZOh7QYB+zs6fzWfgc/XiRY0I++Pole8NUqFZfbgT38H9inMC0mmjSYmIlh3YWx1pBdaSL+DqK
	+pjRJfMxPO1IiSjhka2LKRznpgj7GAV8hSK/Dt+OOuggPhDS1c3Q9nI1nmzchIA34L6brFVxRib
	66E20xZWksHpPeup5NGIrx6Sopx77wkAV7Xn/JilcyMymiCE/JISlYEkhD4W0xshPbeBJdzVgog
	PR52py+DYRQ8YI264L3Poo1BlPLpRMTSF+8gThEIexIl9wtputlRh1maFKzkAQ6M9pUU7/cfah0
	csk1FwM/OXWl83pyS8rjzN6hIW
X-Google-Smtp-Source: AGHT+IE4aQOnEkZGfl2F2IwHXBe4ujkzHY55Wxu2B1uV12U5PIVP+p6paY0T+K7bHCxIIMpixcph3w==
X-Received: by 2002:a17:902:f691:b0:278:bfae:3244 with SMTP id d9443c01a7336-290cba4382amr286191535ad.54.1761175635931;
        Wed, 22 Oct 2025 16:27:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01919aasm331129a91.17.2025.10.22.16.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:27:15 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 3/8] python3-django: patch CVE-2025-32873
Date: Thu, 23 Oct 2025 12:26:26 +1300
Message-ID: <20251022232633.1703690-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 23:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120904

Details https://nvd.nist.gov/vuln/detail/CVE-2025-32873

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2025-32873.patch                      | 86 +++++++++++++++++++
 .../python/python3-django_4.2.20.bb           |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-32873.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-32873.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-32873.patch
new file mode 100644
index 0000000000..cb1e32846a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-32873.patch
@@ -0,0 +1,86 @@
+From 3571c537ae0b504cf1326807908682f28aff9613 Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Tue, 8 Apr 2025 16:30:17 +0200
+Subject: [PATCH] CVE-2025-32873
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[4.2.x] Fixed CVE-2025-32873 -- Mitigated potential DoS in strip_tags().
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
index 1bb14aeb71..39451dd07e 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -3,6 +3,7 @@ inherit setuptools3
 
 SRC_URI += " \
     file://fix-regression-introduced-when-fixing-CVE-2025-26699.patch \
+    file://CVE-2025-32873.patch \
 "
 
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"

