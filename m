Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497F0C5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 15:59:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33978.1724601560440042027
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 08:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8967a4d043=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PFiVWg006461
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 08:59:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1k8rpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 08:59:19 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 25 Aug 2024 08:59:18 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 25 Aug 2024 08:59:17 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: Fix CVE-2024-42005
Date: Sun, 25 Aug 2024 15:59:14 +0000
Message-ID: <20240825155914.2844598-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OKB2Y-liegvDdLGKor3PKIhd--BP1UVM
X-Authority-Analysis: v=2.4 cv=McQ+uI/f c=1 sm=1 tr=0 ts=66cb54d7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=vh6ZLsrIWgAaeWovB90A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=96-UuAdfYG6OSYlHWuPe:22
X-Proofpoint-GUID: OKB2Y-liegvDdLGKor3PKIhd--BP1UVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-25_13,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=970 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408250128
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 15:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111933

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in Django 5.0 before 5.0.8 and 4.2 before 4.2.15.
QuerySet.values() and values_list() methods on models with a JSONField are
subject to SQL injection in column aliases via a crafted JSON object key
as a passed *arg.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-42005

Upstream-patch:
https://github.com/django/django/commit/f4af67b9b41e0f4c117a8741da3abbd1c869ab28

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-django/CVE-2024-42005.patch       | 84 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-42005.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-42005.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-42005.patch
new file mode 100644
index 000000000..e6b58fca7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-42005.patch
@@ -0,0 +1,84 @@
+From f4af67b9b41e0f4c117a8741da3abbd1c869ab28 Mon Sep 17 00:00:00 2001
+From: Simon Charette <charette.s@gmail.com>
+Date: Thu, 25 Jul 2024 18:19:13 +0200
+Subject: [PATCH] Fixed CVE-2024-42005 -- Mitigated QuerySet.values()  SQL
+ injection attacks against JSON fields.
+
+Thanks Eyal (eyalgabay) for the report.
+
+CVE: CVE-2024-42005
+
+Upstream-Status: Backport [https://github.com/django/django/commit/f4af67b9b41e0f4c117a8741da3abbd1c869ab28]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/db/models/sql/query.py             |  2 ++
+ tests/expressions/models.py               |  7 +++++++
+ tests/expressions/test_queryset_values.py | 17 +++++++++++++++--
+ 3 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
+index 1e823cf..9b054bd 100644
+--- a/django/db/models/sql/query.py
++++ b/django/db/models/sql/query.py
+@@ -2019,6 +2019,8 @@ class Query:
+             self.clear_select_fields()
+
+         if fields:
++            for field in fields:
++                self.check_alias(field)
+             field_names = []
+             extra_names = []
+             annotation_names = []
+diff --git a/tests/expressions/models.py b/tests/expressions/models.py
+index 33f7850..fb80938 100644
+--- a/tests/expressions/models.py
++++ b/tests/expressions/models.py
+@@ -97,3 +97,10 @@ class UUID(models.Model):
+
+     def __str__(self):
+         return "%s" % self.uuid
++
++
++class JSONFieldModel(models.Model):
++    data = models.JSONField(null=True)
++
++    class Meta:
++        required_db_features = {"supports_json_field"}
+diff --git a/tests/expressions/test_queryset_values.py b/tests/expressions/test_queryset_values.py
+index 0804531..bd52b8e 100644
+--- a/tests/expressions/test_queryset_values.py
++++ b/tests/expressions/test_queryset_values.py
+@@ -1,8 +1,8 @@
+ from django.db.models.aggregates import Sum
+ from django.db.models.expressions import F
+-from django.test import TestCase
++from django.test import TestCase, skipUnlessDBFeature
+
+-from .models import Company, Employee
++from .models import Company, Employee, JSONFieldModel
+
+
+ class ValuesExpressionsTests(TestCase):
+@@ -36,6 +36,19 @@ class ValuesExpressionsTests(TestCase):
+         with self.assertRaisesMessage(ValueError, msg):
+             Company.objects.values(**{crafted_alias: F("ceo__salary")})
+
++    @skipUnlessDBFeature("supports_json_field")
++    def test_values_expression_alias_sql_injection_json_field(self):
++        crafted_alias = """injected_name" from "expressions_company"; --"""
++        msg = (
++            "Column aliases cannot contain whitespace characters, quotation marks, "
++            "semicolons, or SQL comments."
++        )
++        with self.assertRaisesMessage(ValueError, msg):
++            JSONFieldModel.objects.values(f"data__{crafted_alias}")
++
++        with self.assertRaisesMessage(ValueError, msg):
++            JSONFieldModel.objects.values_list(f"data__{crafted_alias}")
++
+     def test_values_expression_group_by(self):
+         # values() applies annotate() first, so values selected are grouped by
+         # id, not firstname.
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index cbd2c69c0..7f5861f5d 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2023-43665.patch \
             file://CVE-2023-46695.patch \
             file://CVE-2024-24680.patch \
+            file://CVE-2024-42005.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.40.0


