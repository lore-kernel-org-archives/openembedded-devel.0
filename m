Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1953CF364B0
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150637.1775804720759816398
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IIlz/Iff;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A4uSWh1889323
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=bpZFYDAKrOmQyrTfJT6mxbr/Eo9DxwxKOoH7gN78aow=; b=IIlz/IffThl1
	qD6nRvG+D18+xxHFSUWm6ay4Bkt+hED4zCOupDIYyI6qRK1/VjeGcPl6UOvRy4JW
	+pjTPCtdY61Vdw2bzidW8so8ID6wcTiQzMbR/BTN2YrxTMWV2uRpBNaURumSuB8z
	66CCOgMX49uQF1O9P40y1M3yAq/2/VxIRohZJoT/lDAdQ3pMFC1zMYilpqiJBkjn
	UMX455J4+NNY2VOo0aXNSV7U2P+71+RZhRiBLW4L9oj0jlmStYUzZ9IrmjwFPErl
	4CzGZHZw9MB3CWqQ4dZDzddyqnoALA78ZYGiZReNy/cwpQnvCTu1UgCFdAmXIbLE
	9ujsHG1vdA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqn78a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 10 Apr 2026 00:05:18 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 10 Apr 2026 00:05:17 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][scarthgap][PATCH v2 09/11] python3-django: fix CVE-2025-57833
Date: Fri, 10 Apr 2026 15:05:06 +0800
Message-ID: <20260410070508.1104455-10-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d8a12f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=VWcOui0qAAAA:8 a=QVxT2wuq3_Tkpv4swMoA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=QrT887owLcKFfbcY6Lji:22
X-Proofpoint-ORIG-GUID: DtVpMmXNKl73gBoGaUcorFh_Mwxoo-Qn
X-Proofpoint-GUID: DtVpMmXNKl73gBoGaUcorFh_Mwxoo-Qn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX0LrJLwzoy7V8
 nI0jMJRHY34rcovvJCYliaB5ZOHD77JGZADF/yUmoR2v+Y8JNAw5BR1qu9o1hihUdaw8Uwu0dsF
 qq4ynpdz5XwIy5lI755FJ7leVi3cTFNI+v+4QTd+JEsAeYxbXj5Q5ZE56jkdj/L4ENwn60GDj/x
 iemkWkyluZ8gzWOvH8FifGS+J0QflGH29hPirvMCPC6nWw2fnJ+blsGnlmujDA2ZgDRATkh6v12
 lQEyzF+MzwDB5vIUXjjBu2oSaFh5MryA9AirA7aXbOGOx1IIGcoRfXouTw4swQValQvPjFJzz8I
 ocZmxvuNMzaq+wZVW0a4HUSSK+zvnhZTlMi+lVRFdde1u2mPJyt5ylU5lNHlZR58uh6yFACsAMN
 bei8cGvyQEX4CakcAfd0mI90QOEwfWf4PKKfMUbjZ2oM8IOR1dHRfMGDlrcFv6S9wsCjW7i0+qR
 QW+cX773u6Rs7ZS1IXw==
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
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126231

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

FilteredRelation was subject to SQL injection in column aliases, using a
suitably crafted dictionary, with dictionary expansion, as the **kwargs
passed QuerySet.annotate() or QuerySet.alias().

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-57833

Upstream-patch:
https://github.com/django/django/commit/31334e6965ad136a5e369993b01721499c5d1a92

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../CVE-2025-57833.patch                      | 88 +++++++++++++++++++
 .../python/python3-django_5.0.14.bb           |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-57833.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-57833.patch b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-57833.patch
new file mode 100644
index 0000000000..cef0b30a59
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-57833.patch
@@ -0,0 +1,88 @@
+From 61b7449dc4ed51ce1fecd7b5a22b52fbc961c5bf Mon Sep 17 00:00:00 2001
+From: Jake Howard <git@theorangeone.net>
+Date: Wed, 13 Aug 2025 14:13:42 +0200
+Subject: [PATCH 1/2] [4.2.x] Fixed CVE-2025-57833 -- Protected
+ FilteredRelation against SQL injection in column aliases.
+
+Thanks Eyal Gabay (EyalSec) for the report.
+
+Backport of 51711717098d3f469f795dfa6bc3758b24f69ef7 from main.
+
+CVE: CVE-2025-57833
+
+Upstream-Status: Backport [https://github.com/django/django/commit/31334e6965ad136a5e369993b01721499c5d1a92]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ django/db/models/sql/query.py |  1 +
+ tests/annotations/tests.py    | 24 ++++++++++++++++++++++++
+ 2 files changed, 25 insertions(+)
+
+diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
+index fe6baca607a9..6a86a184d8b4 100644
+--- a/django/db/models/sql/query.py
++++ b/django/db/models/sql/query.py
+@@ -1663,6 +1663,7 @@ class Query(BaseExpression):
+         return target_clause, needed_inner
+ 
+     def add_filtered_relation(self, filtered_relation, alias):
++        self.check_alias(alias)
+         filtered_relation.alias = alias
+         relation_lookup_parts, relation_field_parts, _ = self.solve_lookup_type(
+             filtered_relation.relation_name
+diff --git a/tests/annotations/tests.py b/tests/annotations/tests.py
+index f1260b41926b..01fa6958db7b 100644
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
+@@ -1132,6 +1133,15 @@ class NonAggregateAnnotationTestCase(TestCase):
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
+@@ -1157,6 +1167,11 @@ class NonAggregateAnnotationTestCase(TestCase):
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
+@@ -1429,3 +1444,12 @@ class AliasTests(TestCase):
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
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
index 84dd9dd5f4..0f6a55a0b3 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
@@ -7,6 +7,7 @@ CVE_STATUS[CVE-2025-27556] = "not-applicable-platform: Issue only applies on Win
 SRC_URI += "file://CVE-2025-64460.patch \
             file://CVE-2025-64459-1.patch \
             file://CVE-2025-64459-2.patch \
+            file://CVE-2025-57833.patch \
            "
 SRC_URI[sha256sum] = "29019a5763dbd48da1720d687c3522ef40d1c61be6fb2fad27ed79e9f655bc11"
 
-- 
2.34.1


