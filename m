Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB0BCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 23:27:17 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.8325.1761175634965805253
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 16:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MPgmH65N;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3327f8ed081so235676a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 16:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761175634; x=1761780434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saZA9fcNAi2rikXcd/HjdxfFH5D6caLJo6CQbjzWY3s=;
        b=MPgmH65NfZHitwCGWBZJFnerOHHJPzgbBjWBOwFIUOFMgRzSh/2f28hbXBwthM08AZ
         415tdYpCWErkmUJrczvm6BO9jTiRN6ggv9is0djVhkoMOdtt6IhfgLovp2xbivgYUV2z
         fXcl34mDEZuerSl+pVdiQzQJXt4wghjB2ONK+pdGa0fuqSsyXXiMDIcjM6eEShYV02x3
         UsuU+LBEGNwBy14z04WVtBc8dtu936f8eXEVHcNcwSYb6gqhZmgfm6la+oKQQgfEPjGs
         VJXFfpQ4BxKkV1ca1oXXrbG+ztF4dM6BZn012lQ70IQX4sJcIhAaf/A5lcpvkmI8owQK
         ct+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175634; x=1761780434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saZA9fcNAi2rikXcd/HjdxfFH5D6caLJo6CQbjzWY3s=;
        b=LDxV68a36LMXANvXTJ9pkxYtLtb7UxgBcVmmvaiseXwA7GQcOIQAb6yKpNvnRrUeut
         nQqYZW4s23lOPnQAgCglfQTB4Q6aK2wNggxOTbMlXmbd/2fIUKVmVAbGu+6HHU/9uWS+
         yAxgHQ8qguZeHDSSzobLdyq/g9LXIfUMumJCs1vJqhALRMylK5Xqnnv3UeiNbKYhl4tl
         FgaaKSNb/6IYptX2prmDvOtnImCg8dLsV61Os/2QeIY1OlC580uIZzNbUyQL1OQURhRz
         Jp8KBFkrBMvie1LBMEqnfM4T0tJ4SA5S0MNzPR641Y9AunmH61Ue+Uxo5++HKJKHSz/x
         vqHQ==
X-Gm-Message-State: AOJu0YzXkRiBMrX92K47bfDePTjmk1gcY7L6XIXKiFwfEbm0KOHhAjhr
	CwSOLrKoza+/FxH6tFAlqKcNAciOI7gPKZfEZi53kcuM48XD517tUt+PKGRZ1A==
X-Gm-Gg: ASbGnctqRR4mE0rcXtS1mJu6pLSErvnt+dy4MCa2R/9Sn41TDXcCVFmGIo4/CRRj3Ct
	K7DsIkmxW74oOtvyhcDaJY2s8jIXBrRLndBe+PvyftOcSIKWOs7gKFqlTofMLRG4YNm1UDgdFnC
	dhaVwhscTbolJicYHd/5Fs3QCgXAK7mZC4A0ib3qhAL6SeRs/tqh1v7+VKEgcVkoyiEegaymRP4
	Gt3wRCkehHiVoMU7KEM18iPANuGjMAnvdCP+on7Lx1d2gPJsngNP8yajgk8PLmbpxhfzybaXUqQ
	vsV5nop5tEfZh2tXtrJvWC5TBLD1EmqsXclqJc/R6GTaKeXvoRwHrQyqbyY+jqrTkmzImtBYhs/
	bHGXmPLRQFv0i8wyWsmo5HUOQZk2a0XodDi8Zvw0T1k8dfmira4slT+M0Kgg3nqSRX+Fyebafev
	dAeBpyjMIGZna+s52GsOUnyIQ4
X-Google-Smtp-Source: AGHT+IGKRknTdlaBo/Rjo3/jHOwl+dw7QMN+LVwiIkRs7eysJW5txbYFG6S03vkMBO+BwgY3Iae9UA==
X-Received: by 2002:a17:90b:3fc6:b0:329:e9da:35e9 with SMTP id 98e67ed59e1d1-33bcf84e3e2mr25288878a91.2.1761175633870;
        Wed, 22 Oct 2025 16:27:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01919aasm331129a91.17.2025.10.22.16.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:27:13 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 2/8] python-django: fix 4.2.20 regression
Date: Thu, 23 Oct 2025 12:26:25 +1300
Message-ID: <20251022232633.1703690-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 23:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120903

This fixes a regression in Django 4.2.20, introduced when fixing CVE-2025-26699

Details https://code.djangoproject.com/ticket/36341

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ntroduced-when-fixing-CVE-2025-26699.patch | 102 ++++++++++++++++++
 .../python/python3-django_4.2.20.bb           |   4 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/fix-regression-introduced-when-fixing-CVE-2025-26699.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/fix-regression-introduced-when-fixing-CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/fix-regression-introduced-when-fixing-CVE-2025-26699.patch
new file mode 100644
index 0000000000..0b4dd69f2c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/fix-regression-introduced-when-fixing-CVE-2025-26699.patch
@@ -0,0 +1,102 @@
+From 9e8a009a7360349d5adb96e896a0a17f53dc9826 Mon Sep 17 00:00:00 2001
+From: Matti Pohjanvirta <matti.pohjanvirta@iki.fi>
+Date: Sun, 20 Apr 2025 18:22:51 +0300
+Subject: [PATCH] Fix regression introduced when fixing CVE-2025-26699
+
+[4.2.x] Fixed #36341 -- Preserved whitespaces in wordwrap template filter.
+
+Regression in 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b.
+
+This work improves the django.utils.text.wrap() function to ensure that
+empty lines and lines with whitespace only are kept instead of being
+dropped.
+
+Thanks Matti Pohjanvirta for the report and fix.
+
+Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
+
+Backport of 1e9db35836d42a3c72f3d1015c2f302eb6fee046 from main.
+
+Upstream-Status: Backport [https://github.com/django/django/commit/e61e3daaf037507211028494d61f24382be31e5a]
+(cherry picked from commit e61e3daaf037507211028494d61f24382be31e5a)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ django/utils/text.py                          | 13 +++++-
+ .../filter_tests/test_wordwrap.py             | 41 +++++++++++++++++++
+ 2 files changed, 52 insertions(+), 2 deletions(-)
+
+diff --git a/django/utils/text.py b/django/utils/text.py
+index 81ae88dc76..b018f2601f 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -102,10 +102,19 @@ def wrap(text, width):
+         width=width,
+         break_long_words=False,
+         break_on_hyphens=False,
++        replace_whitespace=False,
+     )
+     result = []
+-    for line in text.splitlines(True):
+-        result.extend(wrapper.wrap(line))
++    for line in text.splitlines():
++        wrapped = wrapper.wrap(line)
++        if not wrapped:
++            # If `line` contains only whitespaces that are dropped, restore it.
++            result.append(line)
++        else:
++            result.extend(wrapped)
++    if text.endswith("\n"):
++        # If `text` ends with a newline, preserve it.
++        result.append("")
+     return "\n".join(result)
+ 
+ 
+diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
+index 4afa1dd234..1692332e1e 100644
+--- a/tests/template_tests/filter_tests/test_wordwrap.py
++++ b/tests/template_tests/filter_tests/test_wordwrap.py
+@@ -89,3 +89,44 @@ class FunctionTests(SimpleTestCase):
+             "I'm afraid",
+             wordwrap(long_text, 10),
+         )
++
++    def test_wrap_preserve_newlines(self):
++        cases = [
++            (
++                "this is a long paragraph of text that really needs to be wrapped\n\n"
++                "that is followed by another paragraph separated by an empty line\n",
++                "this is a long paragraph of\ntext that really needs to be\nwrapped\n\n"
++                "that is followed by another\nparagraph separated by an\nempty line\n",
++                30,
++            ),
++            ("\n\n\n", "\n\n\n", 5),
++            ("\n\n\n\n\n\n", "\n\n\n\n\n\n", 5),
++        ]
++        for text, expected, width in cases:
++            with self.subTest(text=text):
++                self.assertEqual(wordwrap(text, width), expected)
++
++    def test_wrap_preserve_whitespace(self):
++        width = 5
++        width_spaces = " " * width
++        cases = [
++            (
++                f"first line\n{width_spaces}\nsecond line",
++                f"first\nline\n{width_spaces}\nsecond\nline",
++            ),
++            (
++                "first line\n \t\t\t \nsecond line",
++                "first\nline\n \t\t\t \nsecond\nline",
++            ),
++            (
++                f"first line\n{width_spaces}\nsecond line\n\nthird{width_spaces}\n",
++                f"first\nline\n{width_spaces}\nsecond\nline\n\nthird\n",
++            ),
++            (
++                f"first line\n{width_spaces}{width_spaces}\nsecond line",
++                f"first\nline\n{width_spaces}{width_spaces}\nsecond\nline",
++            ),
++        ]
++        for text, expected in cases:
++            with self.subTest(text=text):
++                self.assertEqual(wordwrap(text, width), expected)
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
index 3fb8b03224..1bb14aeb71 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -1,6 +1,10 @@
 require python-django.inc
 inherit setuptools3
 
+SRC_URI += " \
+    file://fix-regression-introduced-when-fixing-CVE-2025-26699.patch \
+"
+
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
 
 RDEPENDS:${PN} += "\

