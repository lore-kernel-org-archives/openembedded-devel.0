Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CB4E98FC9
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:19:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126490.1775715557531827189
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YMBGKYg5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NUVwS1189662
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2026 06:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=bpZFYDAKrOmQyrTfJT6mxbr/Eo9DxwxKOoH7gN78aow=; b=YMBGKYg50UXb
	X1h4KQVaXhqHTSw8EJPbim14+Wcn9OUJCxtOEKEwit4uNur/0Vc1y31RYES/71R8
	ETx0mCiqPPxByls2maSUw3Ux/nAyLlxSnghY/L2xSeyWpdkbHFrPiEjpXMxILloC
	aLZguG9+/0GmrDBGRMHoOliCD8xqgXAXh+o40sSqlGsse6JaT3eHyphhmz2nzxwU
	xgRKP4XHyoqCVRw2naDUmUM8Dx3r3xwkHhVw8JFikLCC8bH7BPEMredYP0IuMp5/
	5uDaWljI3S/lYHDfOnJB4N/NpvilJc666p+GziY4AXyWbszzi6AC+y5kMHhRwbiH
	GiVePyIvaA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrybrbm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 06:19:16 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:19:15 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:19:14 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][scarthgap][PATCH 09/11] python3-django: fix CVE-2025-57833
Date: Thu, 9 Apr 2026 14:19:02 +0800
Message-ID: <20260409061904.1694992-10-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
References: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d744e4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=VWcOui0qAAAA:8 a=QVxT2wuq3_Tkpv4swMoA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=QrT887owLcKFfbcY6Lji:22
X-Proofpoint-GUID: SB6gxyXnYcXIKLsW-iNNlumUFhHKlkP3
X-Proofpoint-ORIG-GUID: SB6gxyXnYcXIKLsW-iNNlumUFhHKlkP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX+CyY+0XMdNqz
 IxSFFBygIZhcyEguxw390Fa9Zf6otFGDMx4csTtr4RA4CJPyke4ZB0+miuaVABpGrczj+Px62d3
 gVTrnNQXHwyzQCY8RMZlsFyCIoN2UFiwbNhVLtxQmGE2/yz1DcJQTrWqVRUjCSNfcP/1oPLBtkG
 P+r97HJEci4FA3uKTkuBzLfjFyeNr5NCapehvR1l/pA3y5WhjB0+yPmrihbuLeac53SEtkOdRMl
 wEEb3+OCYQnWOZY8iDN1ZE0FY5ohn6wDod/vXrrBuzpvK/7SsDoLS4UlEhF60gjOlPxGgcohc3h
 8LSTrT7fTgPg5AJN+bYor5Qmfa7NOsB+U6IlCRz+OHDoGwQXENFJND58yC92D8+JN+1EpOTDH2Q
 0B6tVE9LXVe1X1JzDygqOWP86ENoBbBAbYHTHfuFfFhD34zJmYfjgl/VqJyD6jaLX7lg+cCldi4
 aFBkV17kmcTuBNQAn4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 06:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126120

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


