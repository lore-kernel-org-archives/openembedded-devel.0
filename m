Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79597CCA476
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 01:22:37 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.11274.1760232155207762147
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 18:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rf/Kdw7y;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b5a631b9c82so1951969a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760232154; x=1760836954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IEcFa+ZK7Fgqy6l3Fc48j/EpX+XGQjmv1PEedUNKod0=;
        b=Rf/Kdw7y8NUvNmPZgYl7EQoMRSd/jcpj7QqWUEgQ07N2R1FbMT5/1TaPXmrLo8hwbn
         3J4GmmjP2TuC6HX6wwci9LAFe6mKzkKEIaan8DvKxij7UnPaHcERnnmweOONzs03pAMN
         x+D3eozbACGck8+FO9B3XQRq/vmEtT8ACGCuRfbtS2Pi4+wF3ZaadE/fUZxzHlGdTYS0
         RvwePIYYP+7KosH1QROAC/oj2u1QiB534Drwd8tlXKqewwM42tsUiQK7Bstp97oSIWs/
         zS4mooZVCqIOIx34Z7RaqpHnFvI1NpCKRNXdPDQB1sFfGCX6oUwrN1LOgUwvqGUk91N0
         JNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760232154; x=1760836954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEcFa+ZK7Fgqy6l3Fc48j/EpX+XGQjmv1PEedUNKod0=;
        b=Gxu9p7Dr4J/qKwU9OnxrJpMngK4HW/Nsx2SsEq1v/3ak43rtHoEnGtJyTfFRz58Lra
         2ozoqm6quuUGh8yMjkRUY7CbbOElwki1+kFO26cmqq4LLN73niyY3orpcD8wFNewdYbw
         u5dQt3XlZaK/N5BCg4BatLFjqWqKA8hcfTG1PoTtoazbHTyXbyuB3LALmISdgEO82oF/
         rIQrlAvA0WlHhOqTrwAdChWtIX+9Mi7FAxVvRvpObVtv0M+IugxX0QlVwzCCv/gawBLT
         uXSmwD6jqkEuoekB4C3/7pWeox5a8QFletD7MCqkNiW177hq/gQOIUlFFZtbm/0WCngC
         Kx5A==
X-Gm-Message-State: AOJu0YzN9H66/kz4eZtcu0dEbsKYVNtWNsOZVxEmEpAgW+mf7Opm98SR
	wrQ0Bkk5YPPAbP4d1YsCrjJhFecYNOoQ4B5TDYRVj/L4pduKBsXHXZFbpr3bog==
X-Gm-Gg: ASbGncvVsyOMALbJr4tkT3lKyxQBmBKNYabPLtiwMCAAahDYF7Pu8iTo8OLVSt1+UTD
	PHQCYWyDBsEu4cuM75ME0rjBuzOp51DyuzLzJFnz54w/iNmsAF5aygE0BDac1jQrbltzrQV9hK1
	PKPVOWy4J8Cse2NvP1QD6WXmfDh8672UrQFup5dqKCEjGzXuc5UCTCfoQuifuc+yQLkceC3nKfQ
	QHGV+DFe86dB4NrAsXq8oU6s9XyEdbCn4Ka4NnEfJFm4eyQ55+9AJxTX3ZVwBoI7ijWviFrqV79
	i8TkxkGU08bZV6uCD0L8WqushQjYayfXGpsri7Yx6rXzahay7HwNwB+TPiSjliRCfsDyhjsoifT
	ojL8VqCzeD/ZrqaQADwFD67PIOG0173cK5imEhZB2iI4tnLYsE6Dj43ya9DHJe5AjVz1feXM=
X-Google-Smtp-Source: AGHT+IELa8ZkgkW0g8BDd1lWmMBps6dLe+P1PwYBeQscafgiJPV8H75P9GI3dqEL6pGN+4bz/mDPjQ==
X-Received: by 2002:a17:903:2a8e:b0:24e:e5c9:ecf7 with SMTP id d9443c01a7336-290272b536emr221984405ad.34.1760232154203;
        Sat, 11 Oct 2025 18:22:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f362fasm94541355ad.97.2025.10.11.18.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 18:22:33 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
X-Google-Original-From: Ankur Tyagi <ankur.tyagi@navicogroup.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][walnascar][PATCH] python3-django: patch CVE-2025-59681
Date: Sun, 12 Oct 2025 14:22:25 +1300
Message-ID: <20251012012226.3314502-1-ankur.tyagi@navicogroup.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 01:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120516

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Discovered in v4.2 but not in v5.0

Details https://nvd.nist.gov/vuln/detail/CVE-2025-59681

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-CVE-2025-59681.patch                 | 174 ++++++++++++++++++
 .../python/python3-django_4.2.20.bb           |   2 +
 2 files changed, 176 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/0001-CVE-2025-59681.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/0001-CVE-2025-59681.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/0001-CVE-2025-59681.patch
new file mode 100644
index 0000000000..19f6f7a15c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/0001-CVE-2025-59681.patch
@@ -0,0 +1,174 @@
+From a475c3872c9955fda54442cf795a1048c91e7672 Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Wed, 10 Sep 2025 09:53:52 +0200
+Subject: [PATCH] CVE-2025-59681
+
+[4.2.x] Fixed CVE-2025-59681 -- Protected QuerySet.annotate(), alias(), aggregate(), and extra() against SQL injection in column aliases on MySQL/MariaDB.
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
+ django/db/models/sql/query.py             |  8 +++---
+ tests/aggregation/tests.py                |  4 +--
+ tests/annotations/tests.py                | 33 ++++++++++++++++++-----
+ tests/expressions/test_queryset_values.py |  8 +++---
+ tests/queries/tests.py                    |  4 +--
+ 5 files changed, 38 insertions(+), 19 deletions(-)
+
+diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
+index e68fd9efb7..f5a433b8a7 100644
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
+index e0cdbf1e0b..22fdf742f8 100644
+--- a/tests/annotations/tests.py
++++ b/tests/annotations/tests.py
+@@ -1115,12 +1115,21 @@ class NonAggregateAnnotationTestCase(TestCase):
+     def test_alias_sql_injection(self):
+         crafted_alias = """injected_name" from "annotations_book"; --"""
+         msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
++            "Column aliases cannot contain whitespace characters, hashes, quotation  "
++            "marks, semicolons, or SQL comments."
+         )
+         with self.assertRaisesMessage(ValueError, msg):
+             Book.objects.annotate(**{crafted_alias: Value(1)})
+ 
++    def test_alias_filtered_relation_sql_injection(self):
++        crafted_alias = """injected_name" from "annotations_book"; --"""
++        msg = (
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
++        )
++        with self.assertRaisesMessage(ValueError, msg):
++            Book.objects.annotate(**{crafted_alias: FilteredRelation("author")})
++
+     def test_alias_forbidden_chars(self):
+         tests = [
+             'al"ias',
+@@ -1133,13 +1142,14 @@ class NonAggregateAnnotationTestCase(TestCase):
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
+@@ -1413,8 +1423,17 @@ class AliasTests(TestCase):
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
++
++    def test_alias_filtered_relation_sql_injection(self):
++        crafted_alias = """injected_name" from "annotations_book"; --"""
++        msg = (
++            "Column aliases cannot contain whitespace characters, hashes, quotation "
++            "marks, semicolons, or SQL comments."
++        )
++        with self.assertRaisesMessage(ValueError, msg):
++            Book.objects.alias(**{crafted_alias: FilteredRelation("authors")})
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
index 8644b282c6..3f1e24d9be 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -1,6 +1,8 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
+SRC_URI += "file://0001-CVE-2025-59681.patch"
+
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
 
 RDEPENDS:${PN} += "\

