Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A88D20694
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:48:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43749.1764856119915365544
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 05:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J/e4yt9q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=443304842b=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4DeGNI1144168
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Dec 2025 05:48:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=X0uh8rD8olMwCzgNPXxC
	gtfL8yviQ7T27I0sPw9Fcug=; b=J/e4yt9qMWNmdvZ6Z7IwmE9V1AKT/q47Jrqu
	hsCY/TXbWZ2W94OURljBG2nrJrngqJh21nC5RKkfr65ZgziJj6yhp/Ard3O4cYge
	/fE2NDBjVbzF7G5p0Q8galmQwY02plWbz9Atri+HtMzlSTjKJ79OlkWKKnY4CKZC
	pXfKSFE3Ab+DHUm5JNCP1f3HOVNkP8INYyOCuCEPL+vTZ0AcVnlcJg5jU6Vd24PC
	mGFjCn/zrjU/XAG9kzw1cJz4Y1fduAOMIRof4BIv3xZ2bvn51CLgPaAWKdEWw74L
	C8iIEgyS09dHcX9xwdJ3mrK9s6bp1G3eF96uWNfLKWxrEWrvZw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05pa5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 05:48:39 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 4 Dec 2025 05:48:38 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 4 Dec 2025 05:48:37 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2024-53907
Date: Thu, 4 Dec 2025 19:18:36 +0530
Message-ID: <20251204134836.970431-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BQaZZMZ42TvFhZui7-ihahO_yIOPAw4m
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=69319137 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=fxJcL_dCAAAA:8 a=-fZLveSSi43YWqYRV2oA:9 a=L03L2QfmqWoA:10
 a=1WNtSb5ECZgA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BQaZZMZ42TvFhZui7-ihahO_yIOPAw4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMiBTYWx0ZWRfX/jamN3LHfA+0
 MM4Xe8/TxlzmU1KW2ASGrmCHI2iimZKVWW6cf02+q6QJUHrrzuCzzFby8DrlR2Lo3cvmrrFdqMH
 QIm1YnjgnoU0eunKEtyFt2meIsoFtpRmWddduMlmjc5Ed9UtZAwLAl9nc11c6JZJ3UP1mOSeH1H
 2c6xwuvlGSqDGAtc86jQ2acUeCLt9nLuaXPEziX5rz49MG1pdWJBLdnWowMVWposuRK+RVMDknx
 bqKFKqMQRCmsDf37qniHJv57vBPjvFrKCfsWM/fq29fWxM+pCLZXMaHfa1otwLWeladklGFmu+w
 dYyrV5BZr9SCbpkd9i/YW4T4iuK6GL1FT3yXlzAyHt2iPrno8chvX8zV63GpbzSIPLf74F+drVM
 9oGcTiAWEQ9o+nYBl4/oYqG+kyGAAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 13:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122320

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-53907

Upstream-patch:
https://github.com/django/django/commit/790eb058b0716c536a2f2e8d1c6d5079d776c22b/

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../CVE-2024-53907.patch                      | 124 ++++++++++++++++++
 .../python/python3-django_3.2.25.bb           |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-53907.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-53907.patch b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-53907.patch
new file mode 100644
index 0000000000..577f042b0a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-53907.patch
@@ -0,0 +1,124 @@
+From 790eb058b0716c536a2f2e8d1c6d5079d776c22b Mon Sep 17 00:00:00 2001
+From: Marc Deslauriers <marc.deslauriers@ubuntu.com>
+Date: Wed, 30 Apr 2025 10:34:27 -0400
+Subject: [PATCH] Fixed CVE-2024-53907 -- Mitigated potential DoS in
+ strip_tags().
+
+Thanks to jiangniao for the report, and Shai Berger and Natalia Bidart
+for the reviews.
+
+CVE: CVE-2024-53907
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/790eb058b0716c536a2f2e8d1c6d5079d776c22b
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/utils/html.py           | 10 ++++++++--
+ docs/releases/3.2.25.txt       | 16 ++++++++++++++++
+ tests/utils_tests/test_html.py |  7 +++++++
+ 3 files changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index 44c6b7b..5887bf1 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -8,6 +8,7 @@ from urllib.parse import (
+     parse_qsl, quote, unquote, urlencode, urlsplit, urlunsplit,
+ )
+ 
++from django.core.exceptions import SuspiciousOperation
+ from django.utils.encoding import punycode
+ from django.utils.functional import Promise, keep_lazy, keep_lazy_text
+ from django.utils.http import RFC3986_GENDELIMS, RFC3986_SUBDELIMS
+@@ -30,6 +31,7 @@ simple_url_2_re = _lazy_re_compile(
+ )
+ 
+ MAX_URL_LENGTH = 2048
++MAX_STRIP_TAGS_DEPTH = 50
+ 
+ 
+ @keep_lazy(str, SafeString)
+@@ -181,15 +183,19 @@ def _strip_once(value):
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
+diff --git a/docs/releases/3.2.25.txt b/docs/releases/3.2.25.txt
+index 67dc8a2..f21bb47 100644
+--- a/docs/releases/3.2.25.txt
++++ b/docs/releases/3.2.25.txt
+@@ -66,6 +66,22 @@ CVE-2024-41991: Potential denial-of-service vulnerability in ``django.utils.html
+ subject to a potential denial-of-service attack via certain inputs with a very
+ large number of Unicode characters.
+ 
++CVE-2024-53907: Denial-of-service possibility in ``strip_tags()``
++=================================================================
++
++:func:`~django.utils.html.strip_tags` would be extremely slow to evaluate
++certain inputs containing large sequences of nested incomplete HTML entities.
++The ``strip_tags()`` method is used to implement the corresponding
++:tfilter:`striptags` template filter, which was thus also vulnerable.
++
++``strip_tags()`` now has an upper limit of recursive calls to ``HTMLParser``
++before raising a :exc:`.SuspiciousOperation` exception.
++
++Remember that absolutely NO guarantee is provided about the results of
++``strip_tags()`` being HTML safe. So NEVER mark safe the result of a
++``strip_tags()`` call without escaping it first, for example with
++:func:`django.utils.html.escape`.
++
+ Bugfixes
+ ========
+ 
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
+index 93458ac..231f5d8 100644
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
+@@ -92,12 +93,18 @@ class TestUtilsHtml(SimpleTestCase):
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
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index c5d97ae482..04dbe1cd19 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -13,6 +13,7 @@ SRC_URI += "\
        file://CVE-2024-39329.patch \
        file://CVE-2024-39330.patch \
        file://CVE-2024-41991.patch \
+       file://CVE-2024-53907.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-- 
2.35.5


