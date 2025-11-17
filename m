Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CD8CD4F3E
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 03:14:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.798.1763349283108878720
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 19:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ePeJ/j/d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34167910e3=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH1DCCs2868490
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 03:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=BUCc2kXczWnjddm0lkzF
	IIOYv62kWLBpnPfysp+s3zU=; b=ePeJ/j/dlqlXcbeQ2MULbzmo3+IIaocildzd
	POAkPfA2rMO/j5Ho1P9JtB1jucRfe4pa+F/vYafGVhXAp/BNcytm4zrD96Sjke6j
	A77xzZd61b7bAYw8LjMEkzMg+ryrAzQ4qkP3m5Z6Z0GoMCeNueOzK/aysxshizjV
	gGxqG3K9KaAQ4xGTtc07baOSfXVwhVAHOwigY9MzjgPUD2huAdvr+MY77Gnbfi+N
	hTkH0GnOme5rS6J4ZhdXXWPn4aXXagyHI26SC5a/+owxfDWMI89YwTj4gOQNFgy/
	fH15yXZ1wjeNE37sKCZ840MICreRWy6u+RMwNsLv6+sAVXvL+w==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwhfyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 03:14:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 19:14:40 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 19:14:39 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2025-26699
Date: Mon, 17 Nov 2025 08:44:38 +0530
Message-ID: <20251117031438.3872441-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAyNiBTYWx0ZWRfX/HstrS1gUn1x
 vqdwI79CQtb826x8zo1OOQE3LmNSUJlRqIUlIbEoYDS2dt6Hp5RicN8GaWpKDY92fUW/aMM/uup
 Ho8qPidx4hnLWn5NJYZ58kFg4IoQcgW5eVXOcMpbjtl63vAAwc6xYaIv8NFJ1obkcjJeUBGUdcX
 cnQsZ9Ed4P8oZWPf6XdkU5J0i2V0iXG6L2cROvgdXq+ViDk2d30hlB+khxS6AQqkMYQ8zeKPlo8
 UoulZa5IzHPXyazuihRsdLS29FnH6ST2wCVl6c3xk3r0IIAqpW2wK53x/l1e4Bgnyb+vRFGR0Ca
 4Kh1igMO03V52C7BRFzE31T7GBMuG8I1yAnCZGbwYrLcZ0WVZ3bgAsI6CoSNhCwrQAUkUpBnMWV
 ph4FBbTlnNHFDgLWR98R2GtSfBt4Nw==
X-Proofpoint-GUID: hYjoYbOsy9R93d4lYyiMsvR6P6PLuMk0
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691a9322 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Tuvc9QHLCOpYVrGmulcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hYjoYbOsy9R93d4lYyiMsvR6P6PLuMk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 03:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121752

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-26699

Upstream-patch:
https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../CVE-2025-26699.patch                      | 107 ++++++++++++++++++
 .../CVE-2025-26699.patch                      | 105 +++++++++++++++++
 .../CVE-2025-26699.patch                      | 107 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 .../python/python3-django_3.2.23.bb           |   5 +-
 .../python/python3-django_4.2.17.bb           |   2 +
 6 files changed, 326 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-26699.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-26699.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-26699.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-26699.patch
new file mode 100644
index 0000000000..d1c3767069
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-26699.patch
@@ -0,0 +1,107 @@
+From e88f7376fe68dbf4ebaf11fad1513ce700b45860 Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Tue, 25 Feb 2025 09:40:54 +0100
+Subject: [PATCH] Fixed CVE-2025-26699 -- Mitigated potential DoS in wordwrap
+ template filter.
+
+Thanks sw0rd1ight for the report.
+
+Backport of 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b from main.
+
+CVE: CVE-2025-26699
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860
+
+Signed-off-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/utils/text.py                          | 28 ++++++++-----------
+ docs/releases/2.2.28.txt                      |  6 ++++
+ .../filter_tests/test_wordwrap.py             | 12 ++++++++
+ 3 files changed, 29 insertions(+), 17 deletions(-)
+
+diff --git a/django/utils/text.py b/django/utils/text.py
+index 2c4040e..c474d56 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -1,5 +1,6 @@
+ import html.entities
+ import re
++import textwrap
+ import unicodedata
+ from gzip import GzipFile
+ from io import BytesIO
+@@ -88,23 +89,16 @@ def wrap(text, width):
+     Don't wrap long words, thus the output text may have lines longer than
+     ``width``.
+     """
+-    def _generator():
+-        for line in text.splitlines(True):  # True keeps trailing linebreaks
+-            max_width = min((line.endswith('\n') and width + 1 or width), width)
+-            while len(line) > max_width:
+-                space = line[:max_width + 1].rfind(' ') + 1
+-                if space == 0:
+-                    space = line.find(' ') + 1
+-                    if space == 0:
+-                        yield line
+-                        line = ''
+-                        break
+-                yield '%s\n' % line[:space - 1]
+-                line = line[space:]
+-                max_width = min((line.endswith('\n') and width + 1 or width), width)
+-            if line:
+-                yield line
+-    return ''.join(_generator())
++
++    wrapper = textwrap.TextWrapper(
++        width=width,
++        break_long_words=False,
++        break_on_hyphens=False,
++    )
++    result = []
++    for line in text.splitlines(True):
++        result.extend(wrapper.wrap(line))
++    return "\n".join(result)
+
+
+ class Truncator(SimpleLazyObject):
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index 8f79fd0..63877eb 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -6,6 +6,12 @@ Django 2.2.28 release notes
+
+ Django 2.2.28 fixes two security issues with severity "high" in 2.2.27.
+
++CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
++=========================================================================================
++
++The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
++potential denial-of-service attack when used with very long strings.
++
+ CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils.text.Truncator.words()``
+ =========================================================================================================
+
+diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
+index 02f8605..c1c1fe9 100644
+--- a/tests/template_tests/filter_tests/test_wordwrap.py
++++ b/tests/template_tests/filter_tests/test_wordwrap.py
+@@ -51,3 +51,15 @@ class FunctionTests(SimpleTestCase):
+             ), 14),
+             'this is a long\nparagraph of\ntext that\nreally needs\nto be wrapped\nI\'m afraid',
+         )
++
++    def test_wrap_long_text(self):
++        long_text = (
++            "this is a long paragraph of text that really needs"
++            " to be wrapped I'm afraid " * 20_000
++        )
++        self.assertIn(
++            "this is a\nlong\nparagraph\nof text\nthat\nreally\nneeds to\nbe wrapped\n"
++            "I'm afraid",
++            wordwrap(long_text, 10),
++        )
++
+--
+2.35.5
diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-26699.patch
new file mode 100644
index 0000000000..e9552bbfbc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-26699.patch
@@ -0,0 +1,105 @@
+From e88f7376fe68dbf4ebaf11fad1513ce700b45860 Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Tue, 25 Feb 2025 09:40:54 +0100
+Subject: [PATCH] Fixed CVE-2025-26699 -- Mitigated potential DoS in wordwrap
+ template filter.
+
+Thanks sw0rd1ight for the report.
+
+Backport of 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b from main.
+
+CVE: CVE-2025-26699
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860
+
+Signed-off-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/utils/text.py                          | 27 +++++++------------
+ docs/releases/3.2.23.txt                      |  7 +++++
+ .../filter_tests/test_wordwrap.py             | 12 +++++++++
+ 3 files changed, 29 insertions(+), 17 deletions(-)
+
+diff --git a/django/utils/text.py b/django/utils/text.py
+index 88da9a2..cabd76f 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -1,5 +1,6 @@
+ import html.entities
+ import re
++import textwrap
+ import unicodedata
+ import warnings
+ from gzip import GzipFile
+@@ -91,23 +92,15 @@ def wrap(text, width):
+     Don't wrap long words, thus the output text may have lines longer than
+     ``width``.
+     """
+-    def _generator():
+-        for line in text.splitlines(True):  # True keeps trailing linebreaks
+-            max_width = min((line.endswith('\n') and width + 1 or width), width)
+-            while len(line) > max_width:
+-                space = line[:max_width + 1].rfind(' ') + 1
+-                if space == 0:
+-                    space = line.find(' ') + 1
+-                    if space == 0:
+-                        yield line
+-                        line = ''
+-                        break
+-                yield '%s\n' % line[:space - 1]
+-                line = line[space:]
+-                max_width = min((line.endswith('\n') and width + 1 or width), width)
+-            if line:
+-                yield line
+-    return ''.join(_generator())
++    wrapper = textwrap.TextWrapper(
++        width=width,
++        break_long_words=False,
++        break_on_hyphens=False,
++    )
++    result = []
++    for line in text.splitlines(True):
++        result.extend(wrapper.wrap(line))
++    return "\n".join(result)
+ 
+ 
+ class Truncator(SimpleLazyObject):
+diff --git a/docs/releases/3.2.23.txt b/docs/releases/3.2.23.txt
+index dd9d68a..da75eca 100644
+--- a/docs/releases/3.2.23.txt
++++ b/docs/releases/3.2.23.txt
+@@ -25,3 +25,10 @@ CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils
+ :tfilter:`truncatewords_html` template filter were subject to a potential
+ regular expression denial-of-service attack using a suitably crafted string
+ (follow up to :cve:`2019-14232` and :cve:`2023-43665`).
++
++CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
++=========================================================================================
++
++The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
++potential denial-of-service attack when used with very long strings.
++
+diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
+index 02f8605..e6f2afb 100644
+--- a/tests/template_tests/filter_tests/test_wordwrap.py
++++ b/tests/template_tests/filter_tests/test_wordwrap.py
+@@ -51,3 +51,15 @@ class FunctionTests(SimpleTestCase):
+             ), 14),
+             'this is a long\nparagraph of\ntext that\nreally needs\nto be wrapped\nI\'m afraid',
+         )
++
++    def test_wrap_long_text(self):
++        long_text = (
++            "this is a long paragraph of text that really needs"
++            " to be wrapped I'm afraid " * 20_000
++        )
++        self.assertIn(
++            "this is a\nlong\nparagraph\nof text\nthat\nreally\nneeds to\nbe wrapped\n"
++            "I'm afraid",
++            wordwrap(long_text, 10),
++        )
++
+-- 
+2.35.5
+
diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-26699.patch
new file mode 100644
index 0000000000..6a4e32bd27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-26699.patch
@@ -0,0 +1,107 @@
+From e88f7376fe68dbf4ebaf11fad1513ce700b45860 Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Tue, 25 Feb 2025 09:40:54 +0100
+Subject: [PATCH] Fixed CVE-2025-26699 -- Mitigated potential DoS in wordwrap
+ template filter.
+
+Thanks sw0rd1ight for the report.
+
+Backport of 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b from main.
+
+CVE: CVE-2025-26699
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860
+
+Signed-off-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/utils/text.py                          | 28 +++++++------------
+ docs/releases/4.2.17.txt                      |  8 ++++++
+ .../filter_tests/test_wordwrap.py             | 11 ++++++++
+ 3 files changed, 29 insertions(+), 18 deletions(-)
+
+diff --git a/django/utils/text.py b/django/utils/text.py
+index e1b835e..81ae88d 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -1,6 +1,7 @@
+ import gzip
+ import re
+ import secrets
++import textwrap
+ import unicodedata
+ from gzip import GzipFile
+ from gzip import compress as gzip_compress
+@@ -97,24 +98,15 @@ def wrap(text, width):
+     ``width``.
+     """
+ 
+-    def _generator():
+-        for line in text.splitlines(True):  # True keeps trailing linebreaks
+-            max_width = min((line.endswith("\n") and width + 1 or width), width)
+-            while len(line) > max_width:
+-                space = line[: max_width + 1].rfind(" ") + 1
+-                if space == 0:
+-                    space = line.find(" ") + 1
+-                    if space == 0:
+-                        yield line
+-                        line = ""
+-                        break
+-                yield "%s\n" % line[: space - 1]
+-                line = line[space:]
+-                max_width = min((line.endswith("\n") and width + 1 or width), width)
+-            if line:
+-                yield line
+-
+-    return "".join(_generator())
++    wrapper = textwrap.TextWrapper(
++        width=width,
++        break_long_words=False,
++        break_on_hyphens=False,
++    )
++    result = []
++    for line in text.splitlines(True):
++        result.extend(wrapper.wrap(line))
++    return "\n".join(result)
+ 
+ 
+ class Truncator(SimpleLazyObject):
+diff --git a/docs/releases/4.2.17.txt b/docs/releases/4.2.17.txt
+index 9a6aee3..0475a96 100644
+--- a/docs/releases/4.2.17.txt
++++ b/docs/releases/4.2.17.txt
+@@ -31,3 +31,11 @@ was subject to SQL injection if untrusted data was used as a ``lhs`` value.
+ 
+ Applications that use the :lookup:`has_key <jsonfield.has_key>` lookup through
+ the ``__`` syntax are unaffected.
++
++
++CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
++=========================================================================================
++
++The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
++potential denial-of-service attack when used with very long strings.
++
+diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
+index 88fbd27..4afa1dd 100644
+--- a/tests/template_tests/filter_tests/test_wordwrap.py
++++ b/tests/template_tests/filter_tests/test_wordwrap.py
+@@ -78,3 +78,14 @@ class FunctionTests(SimpleTestCase):
+             "this is a long\nparagraph of\ntext that\nreally needs\nto be wrapped\n"
+             "I'm afraid",
+         )
++
++    def test_wrap_long_text(self):
++        long_text = (
++            "this is a long paragraph of text that really needs"
++            " to be wrapped I'm afraid " * 20_000
++        )
++        self.assertIn(
++            "this is a\nlong\nparagraph\nof text\nthat\nreally\nneeds to\nbe wrapped\n"
++            "I'm afraid",
++            wordwrap(long_text, 10),
++        )
+-- 
+2.35.5
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index f394397453..24eee95f03 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-45231.patch \
             file://CVE-2024-53907.patch \
             file://CVE-2024-27351.patch \
+            file://CVE-2025-26699.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
index e049b6552c..92a3886cbc 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
@@ -6,7 +6,10 @@ SRC_URI[sha256sum] = "82968f3640e29ef4a773af2c28448f5f7a08d001c6ac05b32d02aeee65
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
 "
-SRC_URI += "file://CVE-2024-27351.patch"
+SRC_URI += "\
+	file://CVE-2024-27351.patch \
+	file://CVE-2025-26699.patch \
+"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
index dfce4b85c2..c2b517a441 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
@@ -7,6 +7,8 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
 "
 
+SRC_URI += "file://CVE-2025-26699.patch"
+
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
 # PREFERRED_VERSION_python3-django = "4.2.17" can be added to local.conf
-- 
2.40.0


