Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03498CCF9E1
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 06:18:53 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.2526.1761113918823027070
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 23:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NUDGdPuN;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6cea7c527bso16163a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 23:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761113918; x=1761718718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXyJMLMBhC1Riiy3uiWojazl40JO5p0zDiWzh3tHuHE=;
        b=NUDGdPuNBqpgUlx8SBZMs5BS7vt9LqBsfnhYpwrYJnGGFl36hF0/fZ0GZmaUrblicl
         LsgjbWWY5WNfxtS4+27URLLCjcNL+HSkYgKyHPNYaHvCkd1wddCAJiyn+bIZlBhP5CWG
         Tluhhh17Xrvb2jxIraq1zD0qCwWk+bX+05xYeG3FfEohswBIW3BQ6hcFPlGZ3XFF6nVz
         j+O21/y6lLtLHC0MJJnnVbJGidUXu39x96ZNRLMaVV7zOb/Ux9fqvPew6XZRA7BC2fO9
         eMsvzpeBBtv01dWmtJR2Tion6UIKlvy1FcjQScI+j4/Tg4k7m5d5K+fN6uwsawr817LZ
         UP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113918; x=1761718718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXyJMLMBhC1Riiy3uiWojazl40JO5p0zDiWzh3tHuHE=;
        b=tkkBacHiywFy4zsYOqTemjHcNRYCJHUHc0w5orHBV7qpvv09phJT4R63foanfXGArl
         RdaN3Q0HcxbFxzJNu0HWCkG+ulQrFDbOXinQ4Yc5zMudFlTfL6uNZroTeB9DG0T1JDe6
         nim3q16C7inFwFJBvEayR/k2ZCdmxvaqgqqaWqTEZOGoAJr3PlkUp2WR3JQnpnEVboXD
         l+XOfmZz+ZszfX+Aho/mJWc4RW3cmsX/+VWzCGKTfGENny6iU1ffO6m3l5liaS4v038w
         QNF7ViSg/AMpVZ7KF14N6kEeS7MGmlNCz3TxZdXQYIq7z32rSXtE1l2KzOtq7uowd0/j
         Ir2w==
X-Gm-Message-State: AOJu0YwhMIIl5pICiyKLnz3wNi1bl99/k/W2UG9vzm/8pS44mz9s7ryq
	gE5zQdrYuUDgzL9ukRr09fI7Yhv+LpE28I7dTSdFK4jInW/n49sBhZ2EP0tPjQ==
X-Gm-Gg: ASbGncuU9tkprIU8Lm5QC2XyI1Yka43zBiOm8zR09z5Px540lBgTDbhJysYY9Kqw394
	EZcewlYhKkqVszYEqpbFJ+bGO4Id9icJyaTWAL7Db1nWWjY7VzzjG1EB3GX/KaXWY+EF8sl8ElW
	HEpqpapiaxvIl5TSJZf+vDUSDwMpMSLvLYyc5vbXY6pdxLP7NIR2J/7KEK2WN8IrQsH4e0ZQ8pw
	lQ/5NvfR/IdR+MzBs2FpOuR1R9wa1kyMLYQ/rzyeyaDKw1gYORDQ50h/7z9Rry4QOyOX5n2kZ4T
	en9aQHx8ZFMTi4cL9Wy58mpH6e2goRvjE7Pimnqnm/3zSgNhkHRAPJlZmWQWxu4x/umxa1ROTeo
	0ta6ij2z1z/pXEjlZ30HVRHGuAnX46FNePeMMTNMT5IOjyYlcsjH4kmEl6hEsTM8F8RoQ8qnc8m
	IHTly0Tnu2srnBjA==
X-Google-Smtp-Source: AGHT+IEFY04wPwlfN99IVqdqiPbktzfdgcSt13ICmcW62G89wV9MLMrsrdGaeV2Y3WkRSEWqEJTt0g==
X-Received: by 2002:a17:902:ced0:b0:256:9c51:d752 with SMTP id d9443c01a7336-290cb65f0e5mr278656755ad.56.1761113917863;
        Tue, 21 Oct 2025 23:18:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fde09sm127857485ad.93.2025.10.21.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:18:37 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 5/8] python3-django: patch CVE-2025-57833
Date: Wed, 22 Oct 2025 19:17:56 +1300
Message-ID: <20251022061803.887676-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
References: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 06:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120888

Details https://nvd.nist.gov/vuln/detail/CVE-2025-57833

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2025-57833.patch                      | 83 +++++++++++++++++++
 .../python/python3-django_4.2.20.bb           |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-57833.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-57833.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-57833.patch
new file mode 100644
index 0000000000..d04589a149
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-57833.patch
@@ -0,0 +1,83 @@
+From 5826d1b59363e0208ebbd4a59d3b3ef39cfe14d5 Mon Sep 17 00:00:00 2001
+From: Jake Howard <git@theorangeone.net>
+Date: Wed, 13 Aug 2025 14:13:42 +0200
+Subject: [PATCH] [4.2.x] Fixed CVE-2025-57833 -- Protected FilteredRelation
+ against SQL injection in column aliases.
+
+Thanks Eyal Gabay (EyalSec) for the report.
+
+Backport of 51711717098d3f469f795dfa6bc3758b24f69ef7 from main.
+CVE: CVE-2025-57833
+Upstream-Status: Backport [https://github.com/django/django/commit/31334e6965ad136a5e369993b01721499c5d1a92]
+(cherry picked from commit 31334e6965ad136a5e369993b01721499c5d1a92)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ django/db/models/sql/query.py |  1 +
+ tests/annotations/tests.py    | 24 ++++++++++++++++++++++++
+ 2 files changed, 25 insertions(+)
+
+diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
+index e68fd9efb7..5a1b68507b 100644
+--- a/django/db/models/sql/query.py
++++ b/django/db/models/sql/query.py
+@@ -1620,6 +1620,7 @@ class Query(BaseExpression):
+         return target_clause
+ 
+     def add_filtered_relation(self, filtered_relation, alias):
++        self.check_alias(alias)
+         filtered_relation.alias = alias
+         lookups = dict(get_children_from_q(filtered_relation.condition))
+         relation_lookup_parts, relation_field_parts, _ = self.solve_lookup_type(
+diff --git a/tests/annotations/tests.py b/tests/annotations/tests.py
+index e0cdbf1e0b..a8474abc77 100644
+--- a/tests/annotations/tests.py
++++ b/tests/annotations/tests.py
+@@ -12,6 +12,7 @@ from django.db.models import (
+     Exists,
+     ExpressionWrapper,
+     F,
++    FilteredRelation,
+     FloatField,
+     Func,
+     IntegerField,
+@@ -1121,6 +1122,15 @@ class NonAggregateAnnotationTestCase(TestCase):
+         with self.assertRaisesMessage(ValueError, msg):
+             Book.objects.annotate(**{crafted_alias: Value(1)})
+ 
++    def test_alias_filtered_relation_sql_injection(self):
++        crafted_alias = """injected_name" from "annotations_book"; --"""
++        msg = (
++            "Column aliases cannot contain whitespace characters, quotation marks, "
++            "semicolons, or SQL comments."
++        )
++        with self.assertRaisesMessage(ValueError, msg):
++            Book.objects.annotate(**{crafted_alias: FilteredRelation("author")})
++
+     def test_alias_forbidden_chars(self):
+         tests = [
+             'al"ias',
+@@ -1146,6 +1156,11 @@ class NonAggregateAnnotationTestCase(TestCase):
+                 with self.assertRaisesMessage(ValueError, msg):
+                     Book.objects.annotate(**{crafted_alias: Value(1)})
+ 
++                with self.assertRaisesMessage(ValueError, msg):
++                    Book.objects.annotate(
++                        **{crafted_alias: FilteredRelation("authors")}
++                    )
++
+ 
+ class AliasTests(TestCase):
+     @classmethod
+@@ -1418,3 +1433,12 @@ class AliasTests(TestCase):
+         )
+         with self.assertRaisesMessage(ValueError, msg):
+             Book.objects.alias(**{crafted_alias: Value(1)})
++
++    def test_alias_filtered_relation_sql_injection(self):
++        crafted_alias = """injected_name" from "annotations_book"; --"""
++        msg = (
++            "Column aliases cannot contain whitespace characters, quotation marks, "
++            "semicolons, or SQL comments."
++        )
++        with self.assertRaisesMessage(ValueError, msg):
++            Book.objects.alias(**{crafted_alias: FilteredRelation("authors")})
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
index 9d25af074f..4aca046b71 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -10,6 +10,7 @@ SRC_URI += " \
     file://CVE-2025-48432-4.patch \
     file://CVE-2025-48432-5.patch \
     file://CVE-2025-48432-6.patch \
+    file://CVE-2025-57833.patch \
 "
 
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"

