Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C85BD2069B
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:51:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43793.1764856271653290564
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 05:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CceSPcmv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=443304842b=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4DR29E1549055
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Dec 2025 13:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=aUIL/5bdC8RTSCdDYza5
	7wwL1E5B6YSQGBUbD5WNf/w=; b=CceSPcmvaMlTQob6NMkRfXfox3xHsMR3Gx3g
	cEiZVIqDZy1CCwVXgggaO6aZ5LZXYF1C7w08JUFV3yO5vr/5gbpR8DNen0EMD6RE
	GDaBAh5gXVyL48tYs6wDuLBViKDrmDx2lcHlV+4/jT5gBu4GbW/bFqYDxLZ6DRtS
	sP57PM/flzq2Ld+0+D667hSx0atZLJeDyZQ1ZU/RD3aXYYvQKU415wBfB0M4x4Gt
	qAf5pzYVtU4NNMZYV6e5+iAqx6AvixR1TJT907Uvu78zLVL4Om/tapY38Go7lZwg
	fiKM/LmALTiPN4Axeqhdnl2EEZDvkXkv8X6X+xIoeNW8MLgIRg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6edcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 13:51:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 4 Dec 2025 05:51:09 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 4 Dec 2025 05:51:08 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2025-32873
Date: Thu, 4 Dec 2025 19:21:06 +0530
Message-ID: <20251204135106.971710-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMiBTYWx0ZWRfXwilmazBjzPAg
 22URI3ep2aeRGxf6/i64UDzNsC4XE/sLNnurkC8oSs912AyB3hiSCwr8PetQy+TpsjA3U89eIve
 artt7CMguEBauTUJPYvsScy888+aEzOBxGjYMyoRtHvltoxDPcQ1ZRJaNsTD5L6yfDw8GkafXWb
 abemBLKYaMNS6iv41lJ9CTvV7O1xt/F66zR9mS0Q576IVTU+BRPIXjyZKyywC7UWZWOQYV+u424
 wSqlehgT+kGvt/Tf+h/+9zQ5xpasTd/lkl/DWjdc2e3QGTczxymUWrefdXK+2qJ9VlFg4SoCxlr
 Xc983BeX1msSLtBlS0ga1FY/lrRXZJHpp4Wj4BCV3Wp111BzdXxmGPVsYguYKhHxMdET9+N33JC
 iD9U2xrvd38PD40MCwF/kF+mHl1tdA==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=693191ce cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=fxJcL_dCAAAA:8 a=1Uybnkrj48FxV8wdWEkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4ACsb_ZP5Mt6rNjmqO4aA9B5ggpp9HsW
X-Proofpoint-GUID: 4ACsb_ZP5Mt6rNjmqO4aA9B5ggpp9HsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 13:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122321

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-32873

Upstream-patch:
https://github.com/django/django/commit/9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c/

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../CVE-2025-32873.patch                      | 110 ++++++++++++++++++
 .../python3-django/CVE-2025-32873.patch       | 107 +++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 .../python/python3-django_3.2.25.bb           |   1 +
 4 files changed, 219 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-32873.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-32873.patch b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-32873.patch
new file mode 100644
index 0000000000..ae417c92c1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-32873.patch
@@ -0,0 +1,110 @@
+From 9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c Mon Sep 17 00:00:00 2001
+From: Marc Deslauriers <marc.deslauriers@ubuntu.com>
+Date: Wed, 30 Apr 2025 10:34:27 -0400
+Subject: [PATCH] Fixed CVE-2025-32873 -- Mitigated potential DoS in 
+ strip_tags().
+
+Thanks to Elias Myllymaki for the report, and Shai Berger and Jake
+Howard for the reviews.
+
+Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
+
+Backport of 9f3419b from main.
+
+CVE: CVE-2025-32873
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c/
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/utils/html.py           |  6 ++++++
+ docs/releases/3.2.25.txt       | 11 +++++++++++
+ tests/utils_tests/test_html.py | 15 ++++++++++++++-
+ 3 files changed, 31 insertions(+), 1 deletion(-)
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index 5887bf1..1a3033e 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -33,6 +33,9 @@ simple_url_2_re = _lazy_re_compile(
+ MAX_URL_LENGTH = 2048
+ MAX_STRIP_TAGS_DEPTH = 50
+ 
++# HTML tag that opens but has no closing ">" after 1k+ chars.
++long_open_tag_without_closing_re = _lazy_re_compile(r"<[a-zA-Z][^>]{1000,}")
++
+ 
+ @keep_lazy(str, SafeString)
+ def escape(text):
+@@ -184,6 +187,9 @@ def _strip_once(value):
+ def strip_tags(value):
+     """Return the given HTML with all tags stripped."""
+     value = str(value)
++    for long_open_tag in long_open_tag_without_closing_re.finditer(value):
++        if long_open_tag.group().count("<") >= MAX_STRIP_TAGS_DEPTH:
++            raise SuspiciousOperation
+     # Note: in typical case this loop executes _strip_once twice (the second
+     # execution does not remove any more tags).
+     strip_tags_depth = 0
+diff --git a/docs/releases/3.2.25.txt b/docs/releases/3.2.25.txt
+index f21bb47..2e113cc 100644
+--- a/docs/releases/3.2.25.txt
++++ b/docs/releases/3.2.25.txt
+@@ -82,6 +82,17 @@ Remember that absolutely NO guarantee is provided about the results of
+ ``strip_tags()`` call without escaping it first, for example with
+ :func:`django.utils.html.escape`.
+ 
++CVE-2025-32873: Denial-of-service possibility in ``strip_tags()``
++=================================================================
++
++:func:`~django.utils.html.strip_tags` would be slow to evaluate certain inputs
++containing large sequences of incomplete HTML tags. This function is used to
++implement the :tfilter:`striptags` template filter, which was thus also
++vulnerable.
++
++:func:`~django.utils.html.strip_tags` now raises a :exc:`.SuspiciousOperation`
++exception if it encounters an unusually large number of unclosed opening tags.
++
+ Bugfixes
+ ========
+ 
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
+index 231f5d8..5c2de01 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -94,17 +94,30 @@ class TestUtilsHtml(SimpleTestCase):
+             ('><!' + ('&' * 16000) + 'D', '><!' + ('&' * 16000) + 'D'),
+             ('X<<<<br>br>br>br>X', 'XX'),
+             ("<" * 50 + "a>" * 50, ""),
++            (">" + "<a" * 500 + "a", ">" + "<a" * 500 + "a"),
++            ("<a" * 49 + "a" * 951, "<a" * 49 + "a" * 951),
++            ("<" + "a" * 1_002, "<" + "a" * 1_002),
+         )
+         for value, output in items:
+             with self.subTest(value=value, output=output):
+                 self.check_output(strip_tags, value, output)
+                 self.check_output(strip_tags, lazystr(value), output)
+ 
+-    def test_strip_tags_suspicious_operation(self):
++    def test_strip_tags_suspicious_operation_max_depth(self):
+         value = "<" * 51 + "a>" * 51, "<a>"
+         with self.assertRaises(SuspiciousOperation):
+             strip_tags(value)
+ 
++    def test_strip_tags_suspicious_operation_large_open_tags(self):
++        items = [
++            ">" + "<a" * 501,
++            "<a" * 50 + "a" * 950,
++        ]
++        for value in items:
++            with self.subTest(value=value):
++                with self.assertRaises(SuspiciousOperation):
++                    strip_tags(value)
++
+     def test_strip_tags_files(self):
+         # Test with more lengthy content (also catching performance regressions)
+         for filename in ('strip_tags1.html', 'strip_tags2.txt'):
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch
new file mode 100644
index 0000000000..701f9b5746
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch
@@ -0,0 +1,107 @@
+From 9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c Mon Sep 17 00:00:00 2001
+From: Marc Deslauriers <marc.deslauriers@ubuntu.com>
+Date: Wed, 30 Apr 2025 10:34:27 -0400
+Subject: [PATCH] Fixed CVE-2025-32873 -- Mitigated potential DoS in
+ strip_tags().
+
+Thanks to Elias Myllymaki for the report, and Shai Berger and Jake
+Howard for the reviews.
+
+Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
+
+Backport of 9f3419b519799d69f2aba70b9d25abe2e70d03e0 from main.
+
+CVE: CVE-2025-32873
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/utils/html.py           |  6 ++++++
+ docs/releases/2.2.28.txt       | 11 +++++++++++
+ tests/utils_tests/test_html.py | 15 ++++++++++++++-
+ 3 files changed, 31 insertions(+), 1 deletion(-)
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index 0d5ffd2..858a517 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -37,6 +37,9 @@ _html_escapes = {
+     ord("'"): '&#39;',
+ }
+ 
++# HTML tag that opens but has no closing ">" after 1k+ chars.
++long_open_tag_without_closing_re = _lazy_re_compile(r"<[a-zA-Z][^>]{1000,}")
++
+ 
+ @keep_lazy(str, SafeText)
+ def escape(text):
+@@ -188,6 +191,9 @@ def _strip_once(value):
+ def strip_tags(value):
+     """Return the given HTML with all tags stripped."""
+     value = str(value)
++    for long_open_tag in long_open_tag_without_closing_re.finditer(value):
++        if long_open_tag.group().count("<") >= MAX_STRIP_TAGS_DEPTH:
++            raise SuspiciousOperation
+     # Note: in typical case this loop executes _strip_once twice (the second
+     # execution does not remove any more tags).
+     strip_tags_depth = 0
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index 3503f38..1676bbd 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -143,3 +143,14 @@ directory-traversal via certain inputs when calling :meth:`save()
+ 
+ Built-in ``Storage`` sub-classes were not affected by this vulnerability.
+ 
++CVE-2025-32873: Denial-of-service possibility in ``strip_tags()``
++=================================================================
++
++:func:`~django.utils.html.strip_tags` would be slow to evaluate certain inputs
++containing large sequences of incomplete HTML tags. This function is used to
++implement the :tfilter:`striptags` template filter, which was thus also
++vulnerable.
++
++:func:`~django.utils.html.strip_tags` now raises a :exc:`.SuspiciousOperation`
++exception if it encounters an unusually large number of unclosed opening tags.
++
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
+index 2f412e1..653deb2 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -92,17 +92,30 @@ class TestUtilsHtml(SimpleTestCase):
+             ('><!' + ('&' * 16000) + 'D', '><!' + ('&' * 16000) + 'D'),
+             ('X<<<<br>br>br>br>X', 'XX'),
+             ("<" * 50 + "a>" * 50, ""),
++            (">" + "<a" * 500 + "a", ">" + "<a" * 500 + "a"),
++            ("<a" * 49 + "a" * 951, "<a" * 49 + "a" * 951),
++            ("<" + "a" * 1_002, "<" + "a" * 1_002),
+         )
+         for value, output in items:
+             with self.subTest(value=value, output=output):
+                 self.check_output(strip_tags, value, output)
+                 self.check_output(strip_tags, lazystr(value), output)
+ 
+-    def test_strip_tags_suspicious_operation(self):
++    def test_strip_tags_suspicious_operation_max_depth(self):
+         value = "<" * 51 + "a>" * 51, "<a>"
+         with self.assertRaises(SuspiciousOperation):
+             strip_tags(value)
+ 
++    def test_strip_tags_suspicious_operation_large_open_tags(self):
++        items = [
++            ">" + "<a" * 501,
++            "<a" * 50 + "a" * 950,
++        ]
++        for value in items:
++            with self.subTest(value=value):
++                with self.assertRaises(SuspiciousOperation):
++                    strip_tags(value)
++
+     def test_strip_tags_files(self):
+         # Test with more lengthy content (also catching performance regressions)
+         for filename in ('strip_tags1.html', 'strip_tags2.txt'):
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index b5b2570ddb..87830e4bc3 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2025-57833.patch \
             file://CVE-2024-39329.patch \
             file://CVE-2024-39330.patch \
+            file://CVE-2025-32873.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index 04dbe1cd19..68b60a784e 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -14,6 +14,7 @@ SRC_URI += "\
        file://CVE-2024-39330.patch \
        file://CVE-2024-41991.patch \
        file://CVE-2024-53907.patch \
+       file://CVE-2025-32873.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-- 
2.35.5


