Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAEDC02181
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:18:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18360.1736515097912468352
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=310530b8e5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A6kRJk028511
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 05:18:17 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkpb0x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 05:18:17 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 10 Jan 2025 05:18:16 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 10 Jan 2025 05:18:15 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 5/9] python3-django: Fix CVE-2024-41990
Date: Fri, 10 Jan 2025 13:17:58 +0000
Message-ID: <20250110131802.2774557-6-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250110131802.2774557-1-soumya.sambu@windriver.com>
References: <20250110131802.2774557-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=67811e19 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=wjU5IotzqukA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=2N7d-k5NNLHIYPc-VPQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wGDBcD5dRJuZ4HaiPcBouZeQxE5Kviq3
X-Proofpoint-GUID: wGDBcD5dRJuZ4HaiPcBouZeQxE5Kviq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501100104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114772

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in Django 5.0 before 5.0.8 and 4.2 before 4.2.15.
The urlize() and urlizetrunc() template filters are subject to a potential
denial-of-service attack via very large inputs with a specific sequence of
characters.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-41990

Upstream-patch:
https://github.com/django/django/commit/d0a82e26a74940bf0c78204933c3bdd6a283eb88

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-django/CVE-2024-41990.patch       | 69 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-41990.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-41990.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-41990.patch
new file mode 100644
index 000000000..f4be19520
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-41990.patch
@@ -0,0 +1,69 @@
+From d0a82e26a74940bf0c78204933c3bdd6a283eb88 Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Thu, 18 Jul 2024 13:19:34 +0200
+Subject: [PATCH] [4.2.x] Fixed CVE-2024-41990 -- Mitigated potential DoS in
+ urlize and urlizetrunc template filters.
+
+Thanks to MProgrammer for the report.
+
+CVE: CVE-2024-41990
+
+Upstream-Status: Backport [https://github.com/django/django/commit/d0a82e26a74940bf0c78204933c3bdd6a283eb88]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/utils/html.py           | 18 ++++++++----------
+ tests/utils_tests/test_html.py |  2 ++
+ 2 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index f1b74ab..84e157d 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -315,7 +315,11 @@ def urlize(text, trim_url_limit=None, nofollow=False, autoescape=False):
+                         trimmed_something = True
+                         counts[closing] -= strip
+
+-            rstripped = middle.rstrip(trailing_punctuation_chars_no_semicolon())
++            amp = middle.rfind("&")
++            if amp == -1:
++                rstripped = middle.rstrip(TRAILING_PUNCTUATION_CHARS)
++            else:
++                rstripped = middle.rstrip(trailing_punctuation_chars_no_semicolon())
+             if rstripped != middle:
+                 trail = middle[len(rstripped) :] + trail
+                 middle = rstripped
+@@ -323,15 +327,9 @@ def urlize(text, trim_url_limit=None, nofollow=False, autoescape=False):
+
+             if trailing_punctuation_chars_has_semicolon() and middle.endswith(";"):
+                 # Only strip if not part of an HTML entity.
+-                amp = middle.rfind("&")
+-                if amp == -1:
+-                    can_strip = True
+-                else:
+-                    potential_entity = middle[amp:]
+-                    escaped = unescape(potential_entity)
+-                    can_strip = (escaped == potential_entity) or escaped.endswith(";")
+-
+-                if can_strip:
++                potential_entity = middle[amp:]
++                escaped = unescape(potential_entity)
++                if escaped == potential_entity or escaped.endswith(";"):
+                     rstripped = middle.rstrip(";")
+                     amount_stripped = len(middle) - len(rstripped)
+                     if amp > -1 and amount_stripped > 1:
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
+index 715c1c6..5abab8d 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -274,6 +274,8 @@ class TestUtilsHtml(SimpleTestCase):
+             "[(" * 100_000 + ":" + ")]" * 100_000,
+             "([[" * 100_000 + ":" + "]])" * 100_000,
+             "&:" + ";" * 100_000,
++            "&.;" * 100_000,
++            ".;" * 100_000,
+         )
+         for value in tests:
+             with self.subTest(value=value):
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index dc7e12ad7..57ab72bc9 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-41989-0002.patch \
             file://CVE-2024-41989-0003.patch \
             file://CVE-2024-41989-0004.patch \
+            file://CVE-2024-41990.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.40.0


