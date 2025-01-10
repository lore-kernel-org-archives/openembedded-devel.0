Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B40AE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:18:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18365.1736515106098293873
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=310530b8e5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AC1JYh001733
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:25 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkjwfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 10 Jan 2025 05:18:24 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 10 Jan 2025 05:18:22 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 9/9] python3-django: Fix CVE-2024-53907
Date: Fri, 10 Jan 2025 13:18:02 +0000
Message-ID: <20250110131802.2774557-10-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250110131802.2774557-1-soumya.sambu@windriver.com>
References: <20250110131802.2774557-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0YCiSl8aosNVsnSEufJWdS9mtlNVXk6W
X-Authority-Analysis: v=2.4 cv=bJjsIO+Z c=1 sm=1 tr=0 ts=67811e21 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=wjU5IotzqukA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=OvEf_YXlgf8g0QuRK4cA:9
 a=L03L2QfmqWoA:10 a=1WNtSb5ECZgA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0YCiSl8aosNVsnSEufJWdS9mtlNVXk6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501100104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114776

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in Django 5.1 before 5.1.4, 5.0 before 5.0.10, and 4.2
before 4.2.17. The strip_tags() method and striptags template filter are subject
to a potential denial-of-service attack via certain inputs containing large
sequences of nested incomplete HTML entities.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-53907

Upstream-patch:
https://github.com/django/django/commit/790eb058b0716c536a2f2e8d1c6d5079d776c22b

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-django/CVE-2024-53907.patch       | 92 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-53907.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-53907.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-53907.patch
new file mode 100644
index 000000000..5a6af7061
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-53907.patch
@@ -0,0 +1,92 @@
+From 790eb058b0716c536a2f2e8d1c6d5079d776c22b Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Wed, 13 Nov 2024 15:06:23 +0100
+Subject: [PATCH] [4.2.x] Fixed CVE-2024-53907 -- Mitigated potential DoS in
+ strip_tags().
+
+Thanks to jiangniao for the report, and Shai Berger and Natalia Bidart
+for the reviews.
+
+CVE: CVE-2024-53907
+
+Upstream-Status: Backport [https://github.com/django/django/commit/790eb058b0716c536a2f2e8d1c6d5079d776c22b]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+
+---
+ django/utils/html.py           | 10 ++++++++--
+ tests/utils_tests/test_html.py |  7 +++++++
+ 2 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index 3cf1bfc..0d5ffd2 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -8,12 +8,14 @@ from urllib.parse import (
+     parse_qsl, quote, unquote, urlencode, urlsplit, urlunsplit,
+ )
+ 
++from django.core.exceptions import SuspiciousOperation
+ from django.utils.functional import Promise, keep_lazy, keep_lazy_text
+ from django.utils.http import RFC3986_GENDELIMS, RFC3986_SUBDELIMS
+ from django.utils.safestring import SafeData, SafeText, mark_safe
+ from django.utils.text import normalize_newlines
+ 
+ MAX_URL_LENGTH = 2048
++MAX_STRIP_TAGS_DEPTH = 50
+ 
+ # Configuration for urlize() function.
+ TRAILING_PUNCTUATION_CHARS = '.,:;!'
+@@ -185,15 +187,19 @@ def _strip_once(value):
+ @keep_lazy_text
+ def strip_tags(value):
+     """Return the given HTML with all tags stripped."""
+-    # Note: in typical case this loop executes _strip_once once. Loop condition
+-    # is redundant, but helps to reduce number of executions of _strip_once.
+     value = str(value)
++    # Note: in typical case this loop executes _strip_once twice (the second
++    # execution does not remove any more tags).
++    strip_tags_depth = 0
+     while '<' in value and '>' in value:
++        if strip_tags_depth >= MAX_STRIP_TAGS_DEPTH:
++            raise SuspiciousOperation
+         new_value = _strip_once(value)
+         if value.count('<') == new_value.count('<'):
+             # _strip_once wasn't able to detect more tags.
+             break
+         value = new_value
++        strip_tags_depth += 1
+     return value
+ 
+ 
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
+index 8fe2f24..2f412e1 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -1,6 +1,7 @@
+ import os
+ from datetime import datetime
+ 
++from django.core.exceptions import SuspiciousOperation
+ from django.test import SimpleTestCase
+ from django.utils.functional import lazystr
+ from django.utils.html import (
+@@ -90,12 +91,18 @@ class TestUtilsHtml(SimpleTestCase):
+             ('<script>alert()</script>&h', 'alert()h'),
+             ('><!' + ('&' * 16000) + 'D', '><!' + ('&' * 16000) + 'D'),
+             ('X<<<<br>br>br>br>X', 'XX'),
++            ("<" * 50 + "a>" * 50, ""),
+         )
+         for value, output in items:
+             with self.subTest(value=value, output=output):
+                 self.check_output(strip_tags, value, output)
+                 self.check_output(strip_tags, lazystr(value), output)
+ 
++    def test_strip_tags_suspicious_operation(self):
++        value = "<" * 51 + "a>" * 51, "<a>"
++        with self.assertRaises(SuspiciousOperation):
++            strip_tags(value)
++
+     def test_strip_tags_files(self):
+         # Test with more lengthy content (also catching performance regressions)
+         for filename in ('strip_tags1.html', 'strip_tags2.txt'):
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 4444d943c..0478fd388 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -23,6 +23,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-41991.patch \
             file://CVE-2024-45230.patch \
             file://CVE-2024-45231.patch \
+            file://CVE-2024-53907.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.40.0


