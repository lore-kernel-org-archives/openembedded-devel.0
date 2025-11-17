Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7637CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 03:35:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1281.1763350522946238540
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 19:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=q1LO8s5X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34167910e3=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH2tWFt1131187
	for <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 19:35:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=cznC8rowU13AhQmaXVps
	GnHK1AdnEf2777J1YFIb2Bg=; b=q1LO8s5X7ho7/RZ70JKKF0MEPwEAwLV+J5+G
	5EgszsDJRk8fvETzM52d+rHMPUQHgaHiYYQktTdezPmiKueB+imNjQ2fMHpjHj5t
	6mkcZswNe6VOEga2m0V+RIzpc4uuE/OrF+w1ZPrZdv9U8lEwvVl7n80p15j00bot
	ii69SHVFBMDiOs/0GzsQD4N/rG2kPJdv3FmWJd10em35glhB2B9VcpB5MeQ6BQaf
	Zsh0sZnthpO4VuQlXEdbSDVJ4HpcrwqdOCndf3VHCXixydiD5rw3EDC38XGw5YME
	zUBtscHnrDG/KARUZ5jFyCjVRaof5Z1lqjBwcKRPETUKmF2YPA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2sbrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 19:35:22 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 19:35:21 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 19:35:20 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2025-57833
Date: Mon, 17 Nov 2025 09:05:19 +0530
Message-ID: <20251117033519.3893499-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAyOSBTYWx0ZWRfX0XRjPX+9PGMV
 USdoGoPaJAyrPOUNYt1p0SrGTs1JNASFoBrzsraRto+goqUWQQ3YQU8pYJ8/xiE3E7x9CMz+LO8
 kT9FRQTTPRVI7trBiMAV58Dsyx4T1MuCcczbJdMvM1qvSN0FTwoTU9gCIPOYhRh52xvWVrtW4i9
 n5koigCRLGf1Rjomjr2c+frWmwBYvAp1ZXw5kZX9rRjkWhChh6NQ2XYvCxuyAaegrJSwrUZGYcG
 WYEiwwc1TowGhO7C2R1p75Ir6+xOQAViYxsmjDUvmiG3OfRt8RaItiwFKzJ5yGzXfpHcDM/hy4Y
 aV7AJhX9EYx2AMfu4RwZErv7l0sT8LvvU5lfhiTdWBgO8dS7cLkgd6hV+s6vtB74nwQ3qEJNuly
 nB0TSxnNzZUZwL9R+bVobbMuQfGNmQ==
X-Proofpoint-ORIG-GUID: GPr9fY71h77g25hLMx3A8dNRRE27z7kW
X-Proofpoint-GUID: GPr9fY71h77g25hLMx3A8dNRRE27z7kW
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691a97fa cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=VWcOui0qAAAA:8 a=ZWfh1_taU_7_8XZ8-UUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=QrT887owLcKFfbcY6Lji:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 03:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121754

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-57833

Upstream-patch:
https://github.com/django/django/commit/31334e6965ad136a5e369993b01721499c5d1a92

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../CVE-2025-57833.patch                      |  96 ++++++++++++++++
 .../CVE-2025-57833.patch                      | 107 ++++++++++++++++++
 .../CVE-2025-57833.patch                      | 106 +++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 .../python/python3-django_3.2.23.bb           |   1 +
 .../python/python3-django_4.2.17.bb           |   1 +
 6 files changed, 312 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-57833.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-57833.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-57833.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-57833.patch b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-57833.patch
new file mode 100644
index 0000000000..8fe0eb36c2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-57833.patch
@@ -0,0 +1,96 @@
+From 31334e6965ad136a5e369993b01721499c5d1a92 Mon Sep 17 00:00:00 2001
+From: Jake Howard <git@theorangeone.net>
+Date: Wed, 13 Aug 2025 14:13:42 +0200
+Subject: [PATCH] Fixed CVE-2025-57833 -- Protected FilteredRelation against
+ SQL injection in column aliases.
+
+Thanks Eyal Gabay (EyalSec) for the report.
+
+Backport of 51711717098d3f469f795dfa6bc3758b24f69ef7 from main.
+
+CVE: CVE-2025-57833
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/31334e6965ad136a5e369993b01721499c5d1a92
+
+Signed-off-by: Jake Howard <git@theorangeone.net>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/db/models/sql/query.py |  1 +
+ docs/releases/2.2.28.txt      |  7 +++++++
+ tests/annotations/tests.py    | 18 ++++++++++++++++--
+ 3 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
+index 9b054bd..96a6f5f 100644
+--- a/django/db/models/sql/query.py
++++ b/django/db/models/sql/query.py
+@@ -1369,6 +1369,7 @@ class Query:
+         return target_clause
+ 
+     def add_filtered_relation(self, filtered_relation, alias):
++        self.check_alias(alias)
+         filtered_relation.alias = alias
+         lookups = dict(get_children_from_q(filtered_relation.condition))
+         for lookup in chain((filtered_relation.relation_name,), lookups):
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index 9853d95..1a824c1 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -6,6 +6,13 @@ Django 2.2.28 release notes
+ 
+ Django 2.2.28 fixes two security issues with severity "high" in 2.2.27.
+ 
++CVE-2025-57833: Potential SQL injection in ``FilteredRelation`` column aliases
++==============================================================================
++
++:class:`.FilteredRelation` was subject to SQL injection in column aliases,
++using a suitably crafted dictionary, with dictionary expansion, as the
++``**kwargs`` passed to :meth:`.QuerySet.annotate` or :meth:`.QuerySet.alias`.
++
+ CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation
+ ============================================================================
+ 
+diff --git a/tests/annotations/tests.py b/tests/annotations/tests.py
+index 27cd7eb..cdffb07 100644
+--- a/tests/annotations/tests.py
++++ b/tests/annotations/tests.py
+@@ -3,8 +3,8 @@ from decimal import Decimal
+ 
+ from django.core.exceptions import FieldDoesNotExist, FieldError
+ from django.db.models import (
+-    BooleanField, CharField, Count, DateTimeField, ExpressionWrapper, F, Func,
+-    IntegerField, NullBooleanField, OuterRef, Q, Subquery, Sum, Value,
++    BooleanField, CharField, Count, DateTimeField, ExpressionWrapper, F,  FilteredRelation,
++    Func, IntegerField, NullBooleanField, OuterRef, Q, Subquery, Sum, Value,
+ )
+ from django.db.models.expressions import RawSQL
+ from django.db.models.functions import Length, Lower
+@@ -608,6 +608,15 @@ class NonAggregateAnnotationTestCase(TestCase):
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
+@@ -632,3 +641,8 @@ class NonAggregateAnnotationTestCase(TestCase):
+             with self.subTest(crafted_alias):
+                 with self.assertRaisesMessage(ValueError, msg):
+                     Book.objects.annotate(**{crafted_alias: Value(1)})
++
++                with self.assertRaisesMessage(ValueError, msg):
++                    Book.objects.annotate(
++                        **{crafted_alias: FilteredRelation("authors")}
++                    )
+-- 
+2.35.5
+
diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-57833.patch b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-57833.patch
new file mode 100644
index 0000000000..4056dbbc4e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-57833.patch
@@ -0,0 +1,107 @@
+From 9c8cc0c011772179c21d62b17aadee5c3ee3c2aa Mon Sep 17 00:00:00 2001
+From: Jake Howard <git@theorangeone.net>
+Date: Wed, 13 Aug 2025 14:13:42 +0200
+Subject: [PATCH] Fixed CVE-2025-57833 -- Protected FilteredRelation against
+ SQL injection in column aliases.
+
+Thanks Eyal Gabay (EyalSec) for the report.
+
+Backport of 51711717098d3f469f795dfa6bc3758b24f69ef7 from main.
+
+CVE: CVE-2025-57833
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/31334e6965ad136a5e369993b01721499c5d1a92
+
+Signed-off-by: Jake Howard <git@theorangeone.net>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/db/models/sql/query.py |  1 +
+ docs/releases/3.2.23.txt      |  7 +++++++
+ tests/annotations/tests.py    | 25 ++++++++++++++++++++++++-
+ 3 files changed, 32 insertions(+), 1 deletion(-)
+
+diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
+index 230b6fa..e56ff81 100644
+--- a/django/db/models/sql/query.py
++++ b/django/db/models/sql/query.py
+@@ -1466,6 +1466,7 @@ class Query(BaseExpression):
+         return target_clause
+ 
+     def add_filtered_relation(self, filtered_relation, alias):
++        self.check_alias(alias)
+         filtered_relation.alias = alias
+         lookups = dict(get_children_from_q(filtered_relation.condition))
+         relation_lookup_parts, relation_field_parts, _ = self.solve_lookup_type(filtered_relation.relation_name)
+diff --git a/docs/releases/3.2.23.txt b/docs/releases/3.2.23.txt
+index 9a9b52d..329aed1 100644
+--- a/docs/releases/3.2.23.txt
++++ b/docs/releases/3.2.23.txt
+@@ -45,3 +45,10 @@ which has now been updated to define a ``max_length`` of 39 characters.
+ The :class:`django.db.models.GenericIPAddressField` model field was not
+ affected.
+ 
++CVE-2025-57833: Potential SQL injection in ``FilteredRelation`` column aliases
++==============================================================================
++
++:class:`.FilteredRelation` was subject to SQL injection in column aliases,
++using a suitably crafted dictionary, with dictionary expansion, as the
++``**kwargs`` passed to :meth:`.QuerySet.annotate` or :meth:`.QuerySet.alias`.
++
+diff --git a/tests/annotations/tests.py b/tests/annotations/tests.py
+index 8082c7a..00d4ee6 100644
+--- a/tests/annotations/tests.py
++++ b/tests/annotations/tests.py
+@@ -4,7 +4,7 @@ from decimal import Decimal
+ from django.core.exceptions import FieldDoesNotExist, FieldError
+ from django.db.models import (
+     BooleanField, Case, CharField, Count, DateTimeField, DecimalField, Exists,
+-    ExpressionWrapper, F, FloatField, Func, IntegerField, Max,
++    ExpressionWrapper, F, FilteredRelation, FloatField, Func, IntegerField, Max,
+     NullBooleanField, OuterRef, Q, Subquery, Sum, Value, When,
+ )
+ from django.db.models.expressions import RawSQL
+@@ -775,6 +775,15 @@ class NonAggregateAnnotationTestCase(TestCase):
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
+@@ -800,6 +809,11 @@ class NonAggregateAnnotationTestCase(TestCase):
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
+@@ -1039,3 +1053,12 @@ class AliasTests(TestCase):
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
+-- 
+2.35.5
+
diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-57833.patch b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-57833.patch
new file mode 100644
index 0000000000..0f06215209
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-57833.patch
@@ -0,0 +1,106 @@
+From 31334e6965ad136a5e369993b01721499c5d1a92 Mon Sep 17 00:00:00 2001
+From: Jake Howard <git@theorangeone.net>
+Date: Wed, 13 Aug 2025 14:13:42 +0200
+Subject: [PATCH] Fixed CVE-2025-57833 -- Protected FilteredRelation against
+ SQL injection in column aliases.
+
+Thanks Eyal Gabay (EyalSec) for the report.
+
+Backport of 51711717098d3f469f795dfa6bc3758b24f69ef7 from main.
+
+CVE: CVE-2025-57833
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/31334e6965ad136a5e369993b01721499c5d1a92
+
+Signed-off-by: Jake Howard <git@theorangeone.net>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/db/models/sql/query.py |  1 +
+ docs/releases/4.2.17.txt      |  7 +++++++
+ tests/annotations/tests.py    | 24 ++++++++++++++++++++++++
+ 3 files changed, 32 insertions(+)
+
+diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
+index e68fd9e..5a1b685 100644
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
+diff --git a/docs/releases/4.2.17.txt b/docs/releases/4.2.17.txt
+index 1392724..3a0815b 100644
+--- a/docs/releases/4.2.17.txt
++++ b/docs/releases/4.2.17.txt
+@@ -50,3 +50,10 @@ which has now been updated to define a ``max_length`` of 39 characters.
+ 
+ The :class:`django.db.models.GenericIPAddressField` model field was not
+ affected.
++
++CVE-2025-57833: Potential SQL injection in ``FilteredRelation`` column aliases
++==============================================================================
++
++:class:`.FilteredRelation` was subject to SQL injection in column aliases,
++using a suitably crafted dictionary, with dictionary expansion, as the
++``**kwargs`` passed to :meth:`.QuerySet.annotate` or :meth:`.QuerySet.alias`.
+diff --git a/tests/annotations/tests.py b/tests/annotations/tests.py
+index e0cdbf1..a8474ab 100644
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
+-- 
+2.35.5
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index f4b8da69b5..82cdcb2328 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-27351.patch \
             file://CVE-2025-26699.patch \
             file://CVE-2024-56374.patch \
+            file://CVE-2025-57833.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
index b8e8759467..b5a6c8d41b 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
@@ -10,6 +10,7 @@ SRC_URI += "\
 	file://CVE-2024-27351.patch \
 	file://CVE-2025-26699.patch \
 	file://CVE-2024-56374.patch \
+	file://CVE-2025-57833.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
index 5377b96c79..f2fe1f6e90 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
@@ -10,6 +10,7 @@ RDEPENDS:${PN} += "\
 SRC_URI += "\
 	file://CVE-2025-26699.patch \
 	file://CVE-2024-56374.patch \
+	file://CVE-2025-57833.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-- 
2.40.0


