Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0BAE7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:18:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18293.1736515101631080144
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=310530b8e5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ACY406030806
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 05:18:21 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fphu14f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 05:18:20 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 10 Jan 2025 05:18:20 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 10 Jan 2025 05:18:18 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 7/9] python3-django: Fix CVE-2024-45230
Date: Fri, 10 Jan 2025 13:18:00 +0000
Message-ID: <20250110131802.2774557-8-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250110131802.2774557-1-soumya.sambu@windriver.com>
References: <20250110131802.2774557-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QYCtg-I8xhfNSDv0X89areWtT3v4P5EQ
X-Authority-Analysis: v=2.4 cv=Oa1iDgTY c=1 sm=1 tr=0 ts=67811e1d cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=wjU5IotzqukA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=-fKjk79AAAAA:8 a=eVaB8b0zAAAA:8 a=A1X0JdhQAAAA:8
 a=t7CeM3EgAAAA:8 a=5xKDCnF05613G-5557cA:9 a=r-HJ9bD__24A:10 a=Wpz8ju6o9T4A:10 a=yfRUlTaMxgxjPDvNZr5O:22 a=1GssNLKajTEuMcgeIWwI:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QYCtg-I8xhfNSDv0X89areWtT3v4P5EQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501100104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114774

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in Django 5.1 before 5.1.1, 5.0 before 5.0.9, and
4.2 before 4.2.16. The urlize() and urlizetrunc() template filters are
subject to a potential denial-of-service attack via very large inputs with
a specific sequence of characters.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-45230

Upstream-patch:
https://github.com/django/django/commit/d147a8ebbdf28c17cafbbe2884f0bc57e2bf82e2

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-django/CVE-2024-45230.patch       | 137 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-45230.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-45230.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-45230.patch
new file mode 100644
index 000000000..b3474dc49
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-45230.patch
@@ -0,0 +1,137 @@
+From d147a8ebbdf28c17cafbbe2884f0bc57e2bf82e2 Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Mon, 12 Aug 2024 15:17:57 +0200
+Subject: [PATCH] [4.2.x] Fixed CVE-2024-45230 -- Mitigated potential DoS in
+ urlize and urlizetrunc template filters.
+
+Thanks MProgrammer (https://hackerone.com/mprogrammer) for the report.
+
+CVE: CVE-2024-45230
+
+Upstream-Status: Backport [https://github.com/django/django/commit/d147a8ebbdf28c17cafbbe2884f0bc57e2bf82e2]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/utils/html.py                          | 22 +++++++++++--------
+ docs/ref/templates/builtins.txt               | 11 ++++++++++
+ .../filter_tests/test_urlize.py               | 22 +++++++++++++++++++
+ tests/utils_tests/test_html.py                |  1 +
+ 4 files changed, 47 insertions(+), 9 deletions(-)
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index 79f06bd..d129334 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -1,5 +1,6 @@
+ """HTML utilities suitable for global use."""
+
++import html
+ import json
+ import re
+ from html.parser import HTMLParser
+@@ -327,16 +328,19 @@ def urlize(text, trim_url_limit=None, nofollow=False, autoescape=False):
+             if trailing_punctuation_chars_has_semicolon() and middle.endswith(";"):
+                 # Only strip if not part of an HTML entity.
+                 potential_entity = middle[amp:]
+-                escaped = unescape(potential_entity)
++                escaped = html.unescape(potential_entity)
+                 if escaped == potential_entity or escaped.endswith(";"):
+-                    rstripped = middle.rstrip(";")
+-                    amount_stripped = len(middle) - len(rstripped)
+-                    if amp > -1 and amount_stripped > 1:
+-                        # Leave a trailing semicolon as might be an entity.
+-                        trail = middle[len(rstripped) + 1 :] + trail
+-                        middle = rstripped + ";"
++                    rstripped = middle.rstrip(TRAILING_PUNCTUATION_CHARS)
++                    trail_start = len(rstripped)
++                    amount_trailing_semicolons = len(middle) - len(middle.rstrip(";"))
++                    if amp > -1 and amount_trailing_semicolons > 1:
++                        # Leave up to most recent semicolon as might be an entity.
++                        recent_semicolon = middle[trail_start:].index(";")
++                        middle_semicolon_index = recent_semicolon + trail_start + 1
++                        trail = middle[middle_semicolon_index:] + trail
++                        middle = rstripped + middle[trail_start:middle_semicolon_index]
+                     else:
+-                        trail = middle[len(rstripped) :] + trail
++                        trail = middle[trail_start:] + trail
+                         middle = rstripped
+                     trimmed_something = True
+
+@@ -373,7 +377,7 @@ def urlize(text, trim_url_limit=None, nofollow=False, autoescape=False):
+             url = None
+             nofollow_attr = ' rel="nofollow"' if nofollow else ''
+             if len(middle) <= MAX_URL_LENGTH and simple_url_re.match(middle):
+-                url = smart_urlquote(unescape(middle))
++                url = smart_urlquote(html.unescape(middle))
+             elif len(middle) <= MAX_URL_LENGTH and simple_url_2_re.match(middle):
+                 url = smart_urlquote('http://%s' % unescape(middle))
+             elif ':' not in middle and is_email_simple(middle):
+diff --git a/docs/ref/templates/builtins.txt b/docs/ref/templates/builtins.txt
+index 4faab38..1990ed0 100644
+--- a/docs/ref/templates/builtins.txt
++++ b/docs/ref/templates/builtins.txt
+@@ -2483,6 +2483,17 @@ Django's built-in :tfilter:`escape` filter. The default value for
+     email addresses that contain single quotes (``'``), things won't work as
+     expected. Apply this filter only to plain text.
+
++.. warning::
++
++    Using ``urlize`` or ``urlizetrunc`` can incur a performance penalty, which
++    can become severe when applied to user controlled values such as content
++    stored in a :class:`~django.db.models.TextField`. You can use
++    :tfilter:`truncatechars` to add a limit to such inputs:
++
++    .. code-block:: html+django
++
++        {{ value|truncatechars:500|urlize }}
++
+ .. templatefilter:: urlizetrunc
+
+ ``urlizetrunc``
+diff --git a/tests/template_tests/filter_tests/test_urlize.py b/tests/template_tests/filter_tests/test_urlize.py
+index 649a965..1991301 100644
+--- a/tests/template_tests/filter_tests/test_urlize.py
++++ b/tests/template_tests/filter_tests/test_urlize.py
+@@ -260,6 +260,28 @@ class FunctionTests(SimpleTestCase):
+             'A test <a href="http://testing.com/example" rel="nofollow">http://testing.com/example</a>.,:;)&quot;!'
+         )
+
++    def test_trailing_semicolon(self):
++        self.assertEqual(
++            urlize("http://example.com?x=&amp;", autoescape=False),
++            '<a href="http://example.com?x=" rel="nofollow">'
++            "http://example.com?x=&amp;</a>",
++        )
++        self.assertEqual(
++            urlize("http://example.com?x=&amp;;", autoescape=False),
++            '<a href="http://example.com?x=" rel="nofollow">'
++            "http://example.com?x=&amp;</a>;",
++        )
++        self.assertEqual(
++            urlize("http://example.com?x=&amp;;;", autoescape=False),
++            '<a href="http://example.com?x=" rel="nofollow">'
++            "http://example.com?x=&amp;</a>;;",
++        )
++        self.assertEqual(
++            urlize("http://example.com?x=&amp.;...;", autoescape=False),
++            '<a href="http://example.com?x=" rel="nofollow">'
++            "http://example.com?x=&amp</a>.;...;",
++        )
++
+     def test_brackets(self):
+         """
+         #19070 - Check urlize handles brackets properly
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
+index 1a5c963..b382843 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -289,6 +289,7 @@ class TestUtilsHtml(SimpleTestCase):
+             "&:" + ";" * 100_000,
+             "&.;" * 100_000,
+             ".;" * 100_000,
++            "&" + ";:" * 100_000,
+         )
+         for value in tests:
+             with self.subTest(value=value):
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index b46fdfc42..275a61622 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-41989-0004.patch \
             file://CVE-2024-41990.patch \
             file://CVE-2024-41991.patch \
+            file://CVE-2024-45230.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.40.0


