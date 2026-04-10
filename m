Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6179CE99048
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150887.1775804723015854611
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C843k6rN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A4uSWl1889323
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=S6cEZu8OnH8CASPsmIJ4Z91GuNJHYBJmPx2/xN4LNV0=; b=C843k6rNTyGz
	pTo0pL6P8wgT9b8dLA5it3ZnINGSivkcHTsNJ7FD4OW8ixMD5K9XWhF4NDm6igsP
	laPTaG9ErlntN7VOHthUBWulzoK21faHzzu2OzKYMyQ3zuQ2T3+b1Wp4Ry++cf4Q
	ipaUJkm//nJ+gjWaV+5U1ggfjJAWP7v/thbf5ChoEr4s+GG946+W0uUGzkopHp1T
	eM6z82iGq5C5lywZ12hB1cXMZ+GlEsVWuN2EVNvC+b1Rml3pi0QCmbRa4jZVG41Z
	uhGtf58dmpAeJbDAGH3M37/V1QnNTj+myY6Dch4nVgHehPcHNL37pzTzKMUpBr0A
	geds3bei8A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqn78a-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 10 Apr 2026 00:05:19 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 10 Apr 2026 00:05:18 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][scarthgap][PATCH v2 10/11] python3-django: fix CVE-2025-59681
Date: Fri, 10 Apr 2026 15:05:07 +0800
Message-ID: <20260410070508.1104455-11-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d8a131 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=epTmVMiNAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=4iZjGnfvTQSL3jFuhDIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NB9-BllVB2XPphXIPQOwOnbSUmND-MD7
X-Proofpoint-GUID: NB9-BllVB2XPphXIPQOwOnbSUmND-MD7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfXwhDz08Wo+wz5
 9lejOrV0nncluF3HM5MuQwoBBq0UY0to63XFkuh6pjMZ8jlgb67jOeyZ6ypqHJ31H5VrQz7PAEq
 DhEI7yi4qwe9ExJ+yBLbhGM/aYWJ0Qf4ICd5AoZcal3uwVjqUD2dsYdgpInf6FYRpo6v85LPz/n
 ARTJHjF72shdGA58JH3zAiA/SrbmJINrJeFCI5sCBAFWYEPE0u1atvRAUQugO0JdmVUiUSRl4xo
 bnTD1fxywmnPK1ojQ4r03W84qUMPgdmKqVrc/lTiiiG3dHXff8i3P6vpftYeCqNAh9ImwRCcnPv
 4mpf/Oafwgx/xL1JQ9jibpNVM4eWi8h/cWQ7e3PAp5YdXsWXrpI1IV0NzbPAHL+re+MlJgY3XJj
 2bIKxwJBS/IphowHZXj7eFZo71FDUErB5O+lryy7TuhMw6JxHsTdGTPwCPKHmYUTtJOfXgyFk+X
 cplXxuGP6DBXURpphUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126232

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

QuerySet.annotate(), QuerySet.alias(), QuerySet.aggregate(), and
QuerySet.extra() methods were subject to SQL injection in column aliases, using
a suitably crafted dictionary, with dictionary expansion, as the **kwargs
passed to these methods on MySQL and MariaDB.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-59681

Upstream-patch:
https://github.com/django/django/commit/38d9ef8c7b5cb6ef51b933e51a20e0e0063f33d5

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../CVE-2025-59681.patch                      | 179 ++++++++++++++++++
 .../python/python3-django_5.0.14.bb           |   1 +
 2 files changed, 180 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-59681.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-59681.patch b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-59681.patch
new file mode 100644
index 0000000000..c62a848aa7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-59681.patch
@@ -0,0 +1,179 @@
+From 3626cf164dd785625a5f8402c621019707094782 Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Wed, 10 Sep 2025 09:53:52 +0200
+Subject: [PATCH 2/2] [4.2.x] Fixed CVE-2025-59681 -- Protected
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
+
+Upstream-Status: Backport [https://github.com/django/django/commit/38d9ef8c7b5cb6ef51b933e51a20e0e
+0063f33d5]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ django/db/models/sql/query.py             |  8 ++++----
+ tests/aggregation/tests.py                |  4 ++--
+ tests/annotations/tests.py                | 23 ++++++++++++-----------
+ tests/expressions/test_queryset_values.py |  8 ++++----
+ tests/queries/tests.py                    |  4 ++--
+ 5 files changed, 24 insertions(+), 23 deletions(-)
+
+diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
+index 6a86a184d8b4..aa348ddf5ff8 100644
+--- a/django/db/models/sql/query.py
++++ b/django/db/models/sql/query.py
+@@ -47,9 +47,9 @@ from django.utils.tree import Node
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
+@@ -1188,8 +1188,8 @@ class Query(BaseExpression):
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
+index 48266d97746b..277c0507f7d9 100644
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
+index 01fa6958db7b..ac40408977ae 100644
+--- a/tests/annotations/tests.py
++++ b/tests/annotations/tests.py
+@@ -1127,8 +1127,8 @@ class NonAggregateAnnotationTestCase(TestCase):
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
+@@ -1136,8 +1136,8 @@ class NonAggregateAnnotationTestCase(TestCase):
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
+@@ -1154,13 +1154,14 @@ class NonAggregateAnnotationTestCase(TestCase):
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
+@@ -1439,8 +1440,8 @@ class AliasTests(TestCase):
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
+@@ -1448,8 +1449,8 @@ class AliasTests(TestCase):
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
+index 47bd1358de54..080ee06183dc 100644
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
+index 5df231949194..91dce6170361 100644
+--- a/tests/queries/tests.py
++++ b/tests/queries/tests.py
+@@ -1942,8 +1942,8 @@ class Queries5Tests(TestCase):
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
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
index 0f6a55a0b3..8a7cd2be16 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://CVE-2025-64460.patch \
             file://CVE-2025-64459-1.patch \
             file://CVE-2025-64459-2.patch \
             file://CVE-2025-57833.patch \
+            file://CVE-2025-59681.patch \
            "
 SRC_URI[sha256sum] = "29019a5763dbd48da1720d687c3522ef40d1c61be6fb2fad27ed79e9f655bc11"
 
-- 
2.34.1


