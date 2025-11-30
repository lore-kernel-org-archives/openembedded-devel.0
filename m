Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2194DCFD376
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 11:35:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2680.1764502527755583738
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 03:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EjwclU6a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4429d7dc3a=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUBGXMw3027216
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 03:35:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=WtwGbw8WfkLJ9QPXEx4t
	bQYJvSnVL3h9NMl1uwl4uGo=; b=EjwclU6avgejrvNMmtetD6VqKYEk7YpNZkjy
	IJZ0P4HryneQ6rJaf2zzBGbK+E11wXwW9lp0hBTSbwgNraxkVgnHjSpflZ5GDAnw
	e8SCljZ5VTzQCZPQ+rXhEG+7qf1m86ytOtbC6PoDwa6IhAO7c0GgQrkzcQUYIhvy
	8Cqqw3Y8hoN7yBt/2wyXdR2W0c/jTAIHosrv7eDfKSR+KCrnqtrUc5/Rmz+22tFt
	hQpBaKg2TNjGIO4ocEy3GZ2QnlCNxfaFJw8+F2hdkgE3hmzNAJTUTP2gth8eu1Wl
	WPcp0XdGEhFbSEHFFjBN55KP0UrP0Yfq6M8GDp+i5V0Ixz4wLA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mrjp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 03:35:26 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 03:35:25 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 03:35:24 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2025-26699
Date: Sun, 30 Nov 2025 17:05:23 +0530
Message-ID: <20251130113523.3025530-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7JUGvr2-F_J7zRP7lvZM3WQRRENzAAt5
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=692c2bfe cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=q-zLW3pldK18cxlpzH8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7JUGvr2-F_J7zRP7lvZM3WQRRENzAAt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDA5OSBTYWx0ZWRfX2zzrmkXyqRyp
 tKyrUF4pvT8HN/WEizoo8l+0gcoMYhAkulrXAGHPav9t2IZQ79B+65x2p2M+E/9t8G11QS8vgDP
 xUwgNqsPsw7RaI70Vqle8Am48umGwD/g0b8VNpYjAEdfmI1BZZ7hrBqPGw0OSx4Xe45tS5qC47p
 CiOmWs3RmVOQEvulJ2uuiGynLk+zvS6ePEIjrLIDFinNO9q450wtBT2lTcwUnCznjhgKan9yVvo
 Fi9FDQabrpRZX01WAbyUXkHv7XeV0rtF64/9vVvpJhIIURqP3MLOMZKPMZrr31X98NZKyKeAYNK
 A1+8KfteFoLcQj1//LyOO+toOW7i3Dh7Cr/13OPwfFvgtso6KRZnMmUGG9qz57bGxx54XqRjOx8
 Eeth2Jn06d/dJy9i1bE/5A62BVjgSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122165

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-26699

Upstream-patch:
https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../CVE-2025-26699.patch                      | 106 +++++++++++++++++
 .../python3-django/CVE-2025-26699.patch       | 107 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 .../python/python3-django_3.2.25.bb           |   3 +
 4 files changed, 217 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-26699.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-26699.patch
new file mode 100644
index 0000000000..21845e9ab5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-26699.patch
@@ -0,0 +1,106 @@
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
+ docs/releases/3.2.25.txt                      |  6 +++++
+ .../filter_tests/test_wordwrap.py             | 11 ++++++++
+ 3 files changed, 27 insertions(+), 17 deletions(-)
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
+diff --git a/docs/releases/3.2.25.txt b/docs/releases/3.2.25.txt
+index a3a9098..f8d9ce2 100644
+--- a/docs/releases/3.2.25.txt
++++ b/docs/releases/3.2.25.txt
+@@ -15,6 +15,12 @@ CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils
+ regular expression denial-of-service attack using a suitably crafted string
+ (follow up to :cve:`2019-14232` and :cve:`2023-43665`).
+ 
++CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
++=========================================================================================
++
++The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
++potential denial-of-service attack when used with very long strings.
++
+ Bugfixes
+ ========
+ 
+diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
+index 02f8605..f61842c 100644
+--- a/tests/template_tests/filter_tests/test_wordwrap.py
++++ b/tests/template_tests/filter_tests/test_wordwrap.py
+@@ -51,3 +51,14 @@ class FunctionTests(SimpleTestCase):
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
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
new file mode 100644
index 0000000000..44e182057a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
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
+
+%% original patch: CVE-2025-26699.patch
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
+index 7227452..7096d13 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -99,3 +99,9 @@ CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils
+ regular expression denial-of-service attack using a suitably crafted string
+ (follow up to :cve:`2019-14232` and :cve:`2023-43665`).
+ 
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
+2.40.0
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
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index 29977fa013..fb6cb97710 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -6,6 +6,9 @@ SRC_URI[sha256sum] = "7ca38a78654aee72378594d63e51636c04b8e28574f5505dff630895b5
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
 "
+SRC_URI += "\
+       file://CVE-2025-26699.patch \
+"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
-- 
2.35.5


