Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1E5CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 06:18:33 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.2511.1761113903385475105
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 23:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JG4MsLce;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2897522a1dfso65189085ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 23:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761113903; x=1761718703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpA/8RmPakfCa/GjfujGsqrALuVX2LUDI/QhiO8BVMI=;
        b=JG4MsLcerq8iB5WZRoK97Q9nyU/aTJY1z6BJ+cw7HMr/tiSPxHrQna5HFAYqosv84F
         7YSvfapE16iJwU50bq+pE+N02yeMXW1HGtHUIxJJOn8HQQkfg30QDbLO3T3xwif4OZAa
         nBG+oeS7JqDmZekgpS8iSniHCW2E2ZFN2llIETrF6BEppjJh4MBHdIwKjEB1LP8eqyo5
         ytimVSrLjewA0jcDHa2al66T6+TAkyD7zHyMRy6PMfWWadKMIqRH8aheBH842hcB2I6Q
         noxSUe5HugWA9Syx47FUc5jRYqKVnszw26rYpUVr3YJRwkOp4/853g3YU90dv1x7Hb/j
         Tg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113903; x=1761718703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpA/8RmPakfCa/GjfujGsqrALuVX2LUDI/QhiO8BVMI=;
        b=ljrmJSFRyU5n4y8wzegTpVAYAtHySNf48dlHY1h1k6VXUe5B8qwfEsTDkHj+4NburX
         HEHbeEu4k0yRVhX/nzfAkPLau7eHJohNOA+WQT5YLyaxgjvRRAG1h79SUOL0zSjQPJq+
         KqGXPExD0q5fcJQGDNhrcvynxYCRYQB3fJXfOhvcs4p3eYuqRMh5BBbwy5SksGNRQosP
         JZ242640A4ehhm+enp1SLaaN0heagL2BF2TO5l2vE7r/2Zy2dCbGRo6DMFjtCDgJdP/Z
         94cztpyu96CywGEuGEmv9nOMzk/k9K0dahU28o6Tth174T+KQ4NHQohV1cr01NXKp/Va
         mq5Q==
X-Gm-Message-State: AOJu0YxI1SVZv96l6foxBKKyVdsQo80JiF0lkVrSF7sMzMV8NYyLEe0a
	FZOPnDWujAM8nGbk3ftdtu00LzAoaFxZCTe7OMjRB0qqIvBjVRCZg10zc4c74A==
X-Gm-Gg: ASbGncvLdMFYEWryH/yb5sWPL8w5jM2jwoeyLFYmMy0z1aPPKYKYhesvcziQerpz5FU
	t5rCddLGqb3nWIJ2ZJYmXnL8FqiR9ns0nG1ZJJKFjfwmzGacRxjew7L3uvcj/VcfuESGrMB2lLy
	OBrIs4zIsFLVL4v5xDOfTpvyiTPFQbv0i/DMQVCHFcbBq81x1RG127YiTxqfMii0USS3aioPKt6
	VhTORjwnqmfqmlYe6iCVscenV3lPfhQn5GLbpns4CEaNYwllCKelnCdicDTg6kXUEjzd0q/7w0j
	4JDJo5EJ10L921WjDstdG12ekUKvSZZgt48XuPY3HsCi9bwDNuBcqM7hhSN5/YMenDG73exfOib
	HsWaKk0lSX9OrTCz7QzLL02TyeWKgC+X9W+BnregpQgQePVNc6wmSnrg2bGuD4EtDj/SBmz42rA
	6FUz9UAYIfZIVRDekorUZmSKO7yUeUIcZVTus=
X-Google-Smtp-Source: AGHT+IHSIgSkM/ZWicDWe+gfM7wyz97Ui809AYXqCxChcvCmM3NgMCIFtgjqYBkKS6UKI9ReGKP5hQ==
X-Received: by 2002:a17:902:f68c:b0:27b:defc:802d with SMTP id d9443c01a7336-290caf82b93mr273418105ad.28.1761113902571;
        Tue, 21 Oct 2025 23:18:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fde09sm127857485ad.93.2025.10.21.23.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:18:22 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 2/8] python3-django: patch CVE-2025-26699
Date: Wed, 22 Oct 2025 19:17:53 +1300
Message-ID: <20251022061803.887676-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
References: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 06:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120885

This fixes a regression in Django 4.2.20, introduced when fixing CVE-2025-26699

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2025-26699.patch                      | 102 ++++++++++++++++++
 .../python/python3-django_4.2.20.bb           |   4 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-26699.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-26699.patch
new file mode 100644
index 0000000000..54a43b123d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-26699.patch
@@ -0,0 +1,102 @@
+From 3407ea136bd619591d259221d8712b72b3f3b9a0 Mon Sep 17 00:00:00 2001
+From: Matti Pohjanvirta <matti.pohjanvirta@iki.fi>
+Date: Sun, 20 Apr 2025 18:22:51 +0300
+Subject: [PATCH] [4.2.x] Fixed #36341 -- Preserved whitespaces in wordwrap
+ template filter.
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
+CVE: CVE-2025-26699
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
index 3fb8b03224..0b9ff1b8c0 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -1,6 +1,10 @@
 require python-django.inc
 inherit setuptools3
 
+SRC_URI += " \
+    file://CVE-2025-26699.patch \
+"
+
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
 
 RDEPENDS:${PN} += "\

