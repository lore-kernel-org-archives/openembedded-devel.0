Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890B0CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 23:27:27 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.8326.1761175641912408270
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 16:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iq9K5OGC;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b67684e2904so89480a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 16:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761175641; x=1761780441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8H0hptqct0wZayQZNSWDST1n6Tgg1mMVL78YDJKVTg=;
        b=Iq9K5OGCqlWIqvi/WBrT0EzfIX/aijxyz7+fc09ZqxLmTL5BHSTX6eimAHilbwccDE
         GRrQvHWVZgDanrRc/Kcrqx08MDPnkgjoPrQoU8iiqS3Ueh/kvECSob91ja8GWhDT9FWu
         FGkACxSlduhSkUKjoZ3jTK+B0D+XnCfj1NCnV+4dRFCRB1/+KOrS0mxYYYpgkRSeVQ3b
         R+mJyVEsbPaVksP11Y5sJJLeiJAVjDuO6GTA0Zt9eA/AbPEiEFrMbdvx+P9kDo7dDNOV
         BVytetGShOw8CvnawWt7xf/vcnoH/Ag89vqnwgdFrj1Uerp1JSINDW2A6WzoartECdWu
         EDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175641; x=1761780441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8H0hptqct0wZayQZNSWDST1n6Tgg1mMVL78YDJKVTg=;
        b=VwnuvQdYVkfIi8VFESSdbMahLTyBCzq6pzlUm3cXZwaLUxwp9rhpkfVHcQQnV56Bv1
         4xO40ZddejgH4lgze6MWVIIwIZyZi6dsOhpHBLtkdkNj0GANRiO95MZGk1HnY1yvA9xn
         DvNxonbUqxBK6LOP4Sd4E2/9GCnxr3x9J8+fxFNPUgqpMsIQbQTcd1a6Yjhl46XwZe+K
         8Sw+srC2Hexu0MzfDwrEt6k8vWHcNXCpGZFJfUk6LH1eIz5SmPWq+RqTb/hga7fQQxYb
         CzDmHuXHDSAXpKhn3ifsTNdZF13HQMGg+3izjemuY9ekXqRAtGVTA7+n9yFgbIWXOaLa
         tgLw==
X-Gm-Message-State: AOJu0YySJjHIvfJKECXWNHHXzXI1CnQGmxXNrqx8wofiJQXB/RVvj9Va
	cbhI+Q6LBRKR8G4Av4B6LX+WAIR6VIBnU2SyLP1t6KTlfPVnGa+ADzdJTPmhLg==
X-Gm-Gg: ASbGnctPvC9Q6uQNIHniaOqdTd8ZuBnsCRPJPzDjcXPRCJw3vNky58XFs1IlUbM50uE
	51ToqAtz7FGQXDsjYhjgGcy6POq4n0tIh5Y9IjJA6caQVpakGoSuMl7/bVWc28sdAGoSlbSvGcf
	SXISvWEAYIwtDSTLlWXsqkxjhJWKFPyJz7cGJqaxaBpowlLOL5qAJfqxPoTHzmYNN4+ZnZw0kG/
	o7M+miN/dIyzcpE5rB4/Hr8fQW/w2XpjTe8XlPAbpGXTQxNJByODgIwjT1FdlVPTLk5Itl5Hasf
	Lig6SeMfEfbC9EoyfUEE+qFSyvlF7ybVDHL+1gEb/dlKG1pQ4DXK7zkLwl/XsSQZUkBJBSv/RNT
	N+52eUsuAK0j+XdjXNjgb5cwHYjOCY6rXkTCRTz56h5memTy4fTJOAPxib/3O5KCavSLX/G2rfH
	r+uV6B1+ARTS7p+ADJ6Aqg//Bm
X-Google-Smtp-Source: AGHT+IFODNBydVrgYsHLJLBH2xnD34bhREwo59kcZGU0MTAVrc5+DpAft7B4JQ75DKBvtKPV/2RSeg==
X-Received: by 2002:a17:902:cf0a:b0:291:2b6f:cf64 with SMTP id d9443c01a7336-2912b6fd015mr250031965ad.55.1761175641004;
        Wed, 22 Oct 2025 16:27:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01919aasm331129a91.17.2025.10.22.16.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:27:20 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 5/8] python3-django: patch CVE-2025-57833
Date: Thu, 23 Oct 2025 12:26:28 +1300
Message-ID: <20251022232633.1703690-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 23:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120906

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
index ae99758543..caebfe0e46 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -10,6 +10,7 @@ SRC_URI += " \
     file://CVE-2025-48432-4.patch \
     file://CVE-2025-48432-5.patch \
     file://CVE-2025-48432-6.patch \
+    file://CVE-2025-57833.patch \
 "
 
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"

