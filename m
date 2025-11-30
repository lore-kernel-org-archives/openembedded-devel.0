Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CE5CFD376
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 11:49:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2776.1764503344665995159
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 03:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VKMZ/+kv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4429d7dc3a=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUBlFp01613782
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ohGEVvF4P7X7r33OhbxP
	uua4ED5BLeIJUDuEOuLSYXg=; b=VKMZ/+kvEAzewGG1ZFUKCOJql+JKT9DBurJE
	DGp9N0YOILv88xGlu8m5oV50rNX99kOsxWfx9YFVBYrTzMU6z6d8bW9wgK1X4nZ9
	Nzv7Cq5ry5RSEUCtjXCmxVDjbmWLFJ8VZs/PB6qwkfruwohX/1bMIad5r8Eo74df
	l9q1IcL9fipBX6V4Xa/FZH9crJUJaeXNSae3R5BSX87mcLqby+SNT/33b8kHNrNx
	PwCtjsLncBfUE5HxvXw/a7rUYsyN0En0NxOn55vr/fxUVuSOn1SA7ZLd35PKuuRb
	h9kxAq7FZv3xcwmLyswdJZOuJyTLQLZw70w5Rik31hFqElA+Rg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21rwev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:49:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 03:49:01 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 03:49:00 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2025-57833
Date: Sun, 30 Nov 2025 17:18:59 +0530
Message-ID: <20251130114859.3038596-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9oo4OFeZuGWemaZEzyBO3SGC_XyC_BzT
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692c2f2f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=VWcOui0qAAAA:8 a=2Om2nTN-MMAe3DiD8JwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=QrT887owLcKFfbcY6Lji:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwMSBTYWx0ZWRfX/3t5dfSslCI1
 muCkgVhwaa+g5MYVFPGKkzzqponrMpVAdp4XmFM+kkAKaMpe+o3oQtCh3sqLkGvZbIxjr4nuix1
 J+bsdy+WAHrs3yihjeCkBH2mm24xfmkLmy6AtOyiGcOU7pyasaDMIp1Efr9f8qr65xAH3I9WCxZ
 Bg/4dUbu1SenCmaE6cMzy4KQclF1tXctWJl40J1ahw0iJviUw3kjdypqOHzySZzls97BVkQKDP+
 ZpEnuJ0EGK2j/eSRifDy8hBuz6Zzz7YK7kstWouf8W4zhRp1aCHgYroGhn77J2FP/MhjLGYffFN
 AgcTnUR0bXTMKJCJF/UejjI15Sbr7SJSkU7BsbtZyegi1TRtod8AXTrTAC6ytsUSfvwQdCJHzbL
 DiNybMjcZOEpfJXlrkB2Tv2pcyHoig==
X-Proofpoint-ORIG-GUID: 9oo4OFeZuGWemaZEzyBO3SGC_XyC_BzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122167

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-57833

Upstream-patch:
https://github.com/django/django/commit/31334e6965ad136a5e369993b01721499c5d1a92

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../CVE-2025-57833.patch                      | 110 ++++++++++++++++++
 .../python3-django/CVE-2025-57833.patch       |  95 +++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 .../python/python3-django_3.2.25.bb           |   1 +
 4 files changed, 207 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-57833.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-57833.patch b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-57833.patch
new file mode 100644
index 0000000000..f5252329b6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-57833.patch
@@ -0,0 +1,110 @@
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
+ docs/releases/3.2.25.txt      |  7 +++++++
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
+diff --git a/docs/releases/3.2.25.txt b/docs/releases/3.2.25.txt
+index 93ab341..a2a58b5 100644
+--- a/docs/releases/3.2.25.txt
++++ b/docs/releases/3.2.25.txt
+@@ -33,6 +33,13 @@ which has now been updated to define a ``max_length`` of 39 characters.
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
+ Bugfixes
+ ========
+ 
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
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch
new file mode 100644
index 0000000000..9d4edb8d7c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch
@@ -0,0 +1,95 @@
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
+
+%% original patch: CVE-2025-57833.patch
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
+index 0e092f0..f3fb298 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -117,3 +117,10 @@ which has now been updated to define a ``max_length`` of 39 characters.
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
+2.40.0
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
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index 452f2f87a6..fe438016f9 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -9,6 +9,7 @@ RDEPENDS:${PN} += "\
 SRC_URI += "\
        file://CVE-2025-26699.patch \
        file://CVE-2024-56374.patch \
+       file://CVE-2025-57833.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-- 
2.35.5


