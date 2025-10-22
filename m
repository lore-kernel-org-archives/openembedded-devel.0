Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94445CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 23:27:27 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.8327.1761175644284793830
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 16:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C8+hyKBh;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so135458b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 16:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761175643; x=1761780443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvLLiM3ZbMLZLyiZkK9eXTKfGGJTzfqR7w4KCAG0xUg=;
        b=C8+hyKBh/TepZEdCP4ULgFFl6JXj7IVFtOCu7sND2hDcdWE+U8PmBlLlaRcSxjr/NE
         xPOh4PVKVV6zq7E4/tl+1L94TN4M2xkuCP0BK0tjfHLSE6o0QXJI/JMcC0z5hMNsSVyJ
         KGMNWOZnKE7R6lbWCIYIU8SL8McLMOQD3THaS4zSexS6LbkAW5WUJkB8IDNnRbHL2fTG
         E1QfSaY7UE4iZz5g7f4JBrNaldYUfZ1MgYfN0Qg0oDEbixdW/TmAgrAZrVJPZO0GED1W
         Ve6SlH7GOrSvdoy+rjcxutOonaBEeDtjK3eTqmUqGkx/16rpAeUI2sbkcAYRuCgbgmVe
         5vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175643; x=1761780443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvLLiM3ZbMLZLyiZkK9eXTKfGGJTzfqR7w4KCAG0xUg=;
        b=vXbfLrqTbcmlB4eg4POT2XtQYq7L+//MOa9ZGVpsTOLlZPMAmWtRgkL4/wKLhzZMte
         uXll8YrN+E04F2TT6pLdMGYdrTlitzjuaL60J8nqIzXXMf5KvOcY7Q4hfCs42+Q/A6Xa
         orYPJ4khzfvglYD2NToypLApNnr717478EKD8jWrQrkx81tPeNHkYy2kGTfOTuyLK7ku
         2TBPo3tMBcHUxYedMbzs3opQLmFtKQTnM5ljZ/LGBuZDDpuRZ2Oz2OTrUE9iF7DdZZ8w
         ircELAoz+kbgpgpvq0+VMMQyspzyOEYdSl+/lrCeWdNZkbr2nFkaDSLMa+pNw/bM/tgD
         P6eA==
X-Gm-Message-State: AOJu0Yxb4i1hQkKKOLQYF37qZ9Jt5cx/BqH7jnoGQ+H9BMgPvDvuNhWB
	iSWcZldztnz5hex52dZi4fXzfLx6AnNmeJ9th/IBe0oEe5Z4qYjXSnbO/IZVOA==
X-Gm-Gg: ASbGncvJndRRfyCpjepVDv4mW54ztrX/8W7ltak25QxnCREaRcIYkVtZejO727hh9ex
	6eNVNm9pcHXr/hnpVTzPp6jQhZ7SLHCU/tYKewPbs0cZFriNOZXXW/YeSH/ffsFIeYWaaAXKAJl
	4d8zQG0qU15FUj38yBwfzQbuqkPYiVOg7b4dCLY49uPmqpYh4kDtNV8uvQSsvUcaLKnXVZPxh4e
	LHufKPEJBTrxAgS0Hv+MCs0WFhPQgpHJYbMcJGRiieWp+EHRtxDCe1Nklbk/iPDRFK9eiakzEbm
	0pGQabD+Awss7MI+vs6LhUKMUur9tgf06kHMqvglZNDw5WavVUl3JeLZNPIiDY2mjiiVXIk2JQR
	ohb2GGSBUPcJiSqx3KhS80aaym4DeICMlzqEjlLIf5j9E6Yr4eAk9AF5ybng1GL2t/KJTz0FpMg
	nX73cNzBVvWW3WstA09Jkdp9vc
X-Google-Smtp-Source: AGHT+IF/3iknX40fBhEqMnBw6T/TcGB8HAxJ1vOCOP0esyTkaV0x80Y//p7RyNgq83KNNf/1aLzNpQ==
X-Received: by 2002:a05:6a21:6daa:b0:306:2a14:d0d4 with SMTP id adf61e73a8af0-334a8625728mr28568478637.43.1761175643339;
        Wed, 22 Oct 2025 16:27:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01919aasm331129a91.17.2025.10.22.16.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:27:22 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 6/8] python3-django: patch CVE-2025-59681
Date: Thu, 23 Oct 2025 12:26:29 +1300
Message-ID: <20251022232633.1703690-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 23:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120907

Details https://nvd.nist.gov/vuln/detail/CVE-2025-59681

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2025-59681.patch                      | 174 ++++++++++++++++++
 .../python/python3-django_4.2.20.bb           |   1 +
 2 files changed, 175 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-59681.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-59681.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-59681.patch
new file mode 100644
index 0000000000..681638ac4f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-59681.patch
@@ -0,0 +1,174 @@
+From af61d1752df85a1ba1c320282128f2fccdad0107 Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Wed, 10 Sep 2025 09:53:52 +0200
+Subject: [PATCH] [4.2.x] Fixed CVE-2025-59681 -- Protected
+ QuerySet.annotate(), alias(), aggregate(), and extra() against SQL injection
+ in column aliases on MySQL/MariaDB.
+
+Thanks sw0rd1ight for the report.
+
+Follow up to 93cae5cb2f9a4ef1514cf1a41f714fef08005200.
+
+Backport of 41b43c74bda19753c757036673ea9db74acf494a from main.
+
+CVE: CVE-2025-59681
+Upstream-Status: Backport [https://github.com/django/django/commit/38d9ef8c7b5cb6ef51b933e51a20e0e0063f33d5]
+(cherry picked from commit 38d9ef8c7b5cb6ef51b933e51a20e0e0063f33d5)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ django/db/models/sql/query.py             |  8 ++++----
+ tests/aggregation/tests.py                |  4 ++--
+ tests/annotations/tests.py                | 23 ++++++++++++-----------
+ tests/expressions/test_queryset_values.py |  8 ++++----
+ tests/queries/tests.py                    |  4 ++--
+ 5 files changed, 24 insertions(+), 23 deletions(-)
+
+diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
+index 5a1b68507b..3b8071eab4 100644
+--- a/django/db/models/sql/query.py
++++ b/django/db/models/sql/query.py
+@@ -46,9 +46,9 @@ from django.utils.tree import Node
+ 
+ __all__ = ["Query", "RawQuery"]
+ 
+-# Quotation marks ('"`[]), whitespace characters, semicolons, or inline
++# Quotation marks ('"`[]), whitespace characters, semicolons, hashes, or inline
+ # SQL comments are forbidden in column aliases.
+-FORBIDDEN_ALIAS_PATTERN = _lazy_re_compile(r"['`\"\]\[;\s]|--|/\*|\*/")
++FORBIDDEN_ALIAS_PATTERN = _lazy_re_compile(r"['`\"\]\[;\s]|#|--|/\*|\*/")
+ 
+ # Inspired from
+ # https://www.postgresql.org/docs/current/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS
+@@ -1123,8 +1123,8 @@ class Query(BaseExpression):
+     def check_alias(self, alias):
+         if FORBIDDEN_ALIAS_PATTERN.search(alias):
+             raise ValueError(
+-                "Column aliases cannot contain whitespace characters, quotation marks, "
+-                "semicolons, or SQL comments."
++                "Column aliases cannot contain whitespace characters, hashes, "
++                "quotation marks, semicolons, or SQL comments."
+             )
+ 
+     def add_annotation(self, annotation, alias, select=True):
+diff --git a/tests/aggregation/tests.py b/tests/aggregation/tests.py
+index 48266d9774..277c0507f7 100644
+--- a/tests/aggregation/tests.py
++++ b/tests/aggregation/tests.py
+@@ -2090,8 +2090,8 @@ class AggregateTestCase(TestCase):
+     def test_alias_sql_injection(self):
+         crafted_alias = """injected_name" from "aggregation_author"; --"""
+         msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
+         )
+         with self.assertRaisesMessage(ValueError, msg):
+             Author.objects.aggregate(**{crafted_alias: Avg("age")})
+diff --git a/tests/annotations/tests.py b/tests/annotations/tests.py
+index a8474abc77..4879f19a78 100644
+--- a/tests/annotations/tests.py
++++ b/tests/annotations/tests.py
+@@ -1116,8 +1116,8 @@ class NonAggregateAnnotationTestCase(TestCase):
+     def test_alias_sql_injection(self):
+         crafted_alias = """injected_name" from "annotations_book"; --"""
+         msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
+         )
+         with self.assertRaisesMessage(ValueError, msg):
+             Book.objects.annotate(**{crafted_alias: Value(1)})
+@@ -1125,8 +1125,8 @@ class NonAggregateAnnotationTestCase(TestCase):
+     def test_alias_filtered_relation_sql_injection(self):
+         crafted_alias = """injected_name" from "annotations_book"; --"""
+         msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
+         )
+         with self.assertRaisesMessage(ValueError, msg):
+             Book.objects.annotate(**{crafted_alias: FilteredRelation("author")})
+@@ -1143,13 +1143,14 @@ class NonAggregateAnnotationTestCase(TestCase):
+             "ali/*as",
+             "alias*/",
+             "alias;",
+-            # [] are used by MSSQL.
++            # [] and # are used by MSSQL.
+             "alias[",
+             "alias]",
++            "ali#as",
+         ]
+         msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
+         )
+         for crafted_alias in tests:
+             with self.subTest(crafted_alias):
+@@ -1428,8 +1429,8 @@ class AliasTests(TestCase):
+     def test_alias_sql_injection(self):
+         crafted_alias = """injected_name" from "annotations_book"; --"""
+         msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
+         )
+         with self.assertRaisesMessage(ValueError, msg):
+             Book.objects.alias(**{crafted_alias: Value(1)})
+@@ -1437,8 +1438,8 @@ class AliasTests(TestCase):
+     def test_alias_filtered_relation_sql_injection(self):
+         crafted_alias = """injected_name" from "annotations_book"; --"""
+         msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
+         )
+         with self.assertRaisesMessage(ValueError, msg):
+             Book.objects.alias(**{crafted_alias: FilteredRelation("authors")})
+diff --git a/tests/expressions/test_queryset_values.py b/tests/expressions/test_queryset_values.py
+index 47bd1358de..080ee06183 100644
+--- a/tests/expressions/test_queryset_values.py
++++ b/tests/expressions/test_queryset_values.py
+@@ -37,8 +37,8 @@ class ValuesExpressionsTests(TestCase):
+     def test_values_expression_alias_sql_injection(self):
+         crafted_alias = """injected_name" from "expressions_company"; --"""
+         msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
+         )
+         with self.assertRaisesMessage(ValueError, msg):
+             Company.objects.values(**{crafted_alias: F("ceo__salary")})
+@@ -47,8 +47,8 @@ class ValuesExpressionsTests(TestCase):
+     def test_values_expression_alias_sql_injection_json_field(self):
+         crafted_alias = """injected_name" from "expressions_company"; --"""
+         msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
+         )
+         with self.assertRaisesMessage(ValueError, msg):
+             JSONFieldModel.objects.values(f"data__{crafted_alias}")
+diff --git a/tests/queries/tests.py b/tests/queries/tests.py
+index a6a2b252eb..b8488fef75 100644
+--- a/tests/queries/tests.py
++++ b/tests/queries/tests.py
+@@ -1943,8 +1943,8 @@ class Queries5Tests(TestCase):
+     def test_extra_select_alias_sql_injection(self):
+         crafted_alias = """injected_name" from "queries_note"; --"""
+         msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
+         )
+         with self.assertRaisesMessage(ValueError, msg):
+             Note.objects.extra(select={crafted_alias: "1"})
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
index caebfe0e46..443b4dbbfc 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -11,6 +11,7 @@ SRC_URI += " \
     file://CVE-2025-48432-5.patch \
     file://CVE-2025-48432-6.patch \
     file://CVE-2025-57833.patch \
+    file://CVE-2025-59681.patch \
 "
 
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"

