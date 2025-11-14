Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C199ACE7AF9
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:03:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16297.1763121829331813990
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Eg5zpgGP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3413d47351=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE6lZqo575898
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Ozv7oqFOyufBu4CaB3/8
	2Ey3D98sfqYjrrqQ98jF3/w=; b=Eg5zpgGPMvLYD58wgrqeR/uLBpvY83Kc7Nj6
	yXa+BxUz6dFHgwQplTFewG2XFF4h9iBeA5kaOfARCLbWsRYEKIFc6PkYrvb5Azc1
	7t0NPHuSaLWNvm6JvaLW63BzcVgavIoD2aazOBy9A85W9k7TtIztLOovg25/Aj9C
	rpj0F+HvNpGqwtabzT6AgHxIvbBJMAWvtYLmi2WG49ZY27mMbeYkLadHRyozHyR9
	v5nKjNZ7Jifz7knOIfqUKy07AthrDYar32Xz5oOnL32yJrwCGykx8IVAjjN+vQ/n
	vt173x571BS7toZ3SJjG9kpnpqmwJrdJFi0QCvVzPSaH4liN5Q==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4adtr5gg1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:03:47 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 14 Nov 2025 04:03:46 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 14 Nov 2025 04:03:45 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2024-27351
Date: Fri, 14 Nov 2025 17:33:43 +0530
Message-ID: <20251114120343.4109634-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=KY/fcAYD c=1 sm=1 tr=0 ts=69171aa3 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=JUY6PVayAAAA:8
 a=pGLkceISAAAA:8 a=7HBi5KukCDfdszrnIUAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=32l4pQc4xq9dSJlKNEIc:22
X-Proofpoint-GUID: -VF60rBU9KCxfeuEGdIjFt9awmZN_GAa
X-Proofpoint-ORIG-GUID: -VF60rBU9KCxfeuEGdIjFt9awmZN_GAa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5NiBTYWx0ZWRfX9D0KzAlETT/H
 QVZzt8YrcXp6Yx0uAGS7rLpsQDBEMDr2OdZNOlG8LsiFSkJ0tcZdejCR0i+MtVTxzM6g08fb4dQ
 xretVyuo0vfoSpK2mPdSnQm91NXMN9BiUqrdEJoCLI7a4lF6+jxV/wLqBqj+4944Czkyf23D7qr
 7DUS6txHT8ll8GrVZ8m42kwcWGJM53XWbqHmeB3bKfYNp5tDJhgwli8AhOnnuOeQUHQ+GlimMVt
 X1QR8L8ztlhccmMhSLhQHI4IupwP1BRpR7djQcfch+lmaQdVApKXE36fmDGS/ipr1m3eLqLVk4+
 FkKsBH1ozvEdQmz90yXrKQXSfbno+7laIUrcfS//Ih17oXspmqt35qu1vFCSwLQJRf8WCAG/XGD
 3ovwvfO4QP3VWHJDGZdXOl27RmGA+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140096
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AE6lZqo575898
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121707

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-27351

Upstream-patch:
https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d1=
a9c3521

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com=
>
---
 .../CVE-2024-27351.patch                      | 149 ++++++++++++++++++
 .../CVE-2024-27351.patch                      | 145 +++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 .../python/python3-django_3.2.23.bb           |   1 +
 4 files changed, 296 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-2.=
2.28/CVE-2024-27351.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.=
2.23/CVE-2024-27351.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.28/CV=
E-2024-27351.patch b/meta-python/recipes-devtools/python/python3-django-2=
.2.28/CVE-2024-27351.patch
new file mode 100644
index 0000000000..f240b0852e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-=
27351.patch
@@ -0,0 +1,149 @@
+From 072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521 Mon Sep 17 00:00:00 2001
+From: Shai Berger <shai@platonix.com>
+Date: Mon, 19 Feb 2024 13:56:37 +0100
+Subject: [PATCH] Fixed CVE-2024-27351 -- Prevented potential ReDoS in
+ Truncator.words().
+
+Thanks Seokchan Yoon for the report.
+
+CVE: CVE-2024-27351
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d=
1a9c3521
+
+Signed-off-by: Shai Berger <shai@platonix.com>
+Co-Authored-By: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.co=
m>
+---
+ django/utils/text.py           | 57 ++++++++++++++++++++++++++++++++--
+ docs/releases/2.2.28.txt       |  8 +++++
+ tests/utils_tests/test_text.py | 26 ++++++++++++++++
+ 3 files changed, 89 insertions(+), 2 deletions(-)
+
+diff --git a/django/utils/text.py b/django/utils/text.py
+index 06a377b..2c4040e 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -15,8 +15,61 @@ def capfirst(x):
+     return x and str(x)[0].upper() + str(x)[1:]
+
+
+-# Set up regular expressions
+-re_words =3D re.compile(r'<[^>]+?>|([^<>\s]+)', re.S)
++# ----- Begin security-related performance workaround -----
++
++# We used to have, below
++#
++# re_words =3D _lazy_re_compile(r"<[^>]+?>|([^<>\s]+)", re.S)
++#
++# But it was shown that this regex, in the way we use it here, has some
++# catastrophic edge-case performance features. Namely, when it is appli=
ed to
++# text with only open brackets "<<<...". The class below provides the s=
ervices
++# and correct answers for the use cases, but in these edge cases does i=
t much
++# faster.
++re_notag =3D _lazy_re_compile(r"([^<>\s]+)", re.S)
++re_prt =3D _lazy_re_compile(r"<|([^<>\s]+)", re.S)
++
++
++class WordsRegex:
++    @staticmethod
++    def search(text, pos):
++        # Look for "<" or a non-tag word.
++        partial =3D re_prt.search(text, pos)
++        if partial is None or partial[1] is not None:
++            return partial
++
++        # "<" was found, look for a closing ">".
++        end =3D text.find(">", partial.end(0))
++        if end < 0:
++            # ">" cannot be found, look for a word.
++            return re_notag.search(text, pos + 1)
++        else:
++            # "<" followed by a ">" was found -- fake a match.
++            end +=3D 1
++            return FakeMatch(text[partial.start(0): end], end)
++
++
++class FakeMatch:
++    __slots__ =3D ["_text", "_end"]
++
++    def end(self, group=3D0):
++        assert group =3D=3D 0, "This specific object takes only group=3D=
0"
++        return self._end
++
++    def __getitem__(self, group):
++        if group =3D=3D 1:
++            return None
++        assert group =3D=3D 0, "This specific object takes only group i=
n {0,1}"
++        return self._text
++
++    def __init__(self, text, end):
++        self._text, self._end =3D text, end
++
++
++# ----- End security-related performance workaround -----
++
++# Set up regular expressions.
++re_words =3D WordsRegex
+ re_chars =3D re.compile(r'<[^>]+?>|(.)', re.S)
+ re_tag =3D re.compile(r'<(/)?(\S+?)(?:(\s*/)|\s.*?)?>', re.S)
+ re_newlines =3D re.compile(r'\r\n|\r')  # Used in normalize_newlines
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index c653cb6..8f79fd0 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -6,6 +6,14 @@ Django 2.2.28 release notes
+
+ Django 2.2.28 fixes two security issues with severity "high" in 2.2.27.
+
++CVE-2024-27351: Potential regular expression denial-of-service in ``dja=
ngo.utils.text.Truncator.words()``
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
++
++``django.utils.text.Truncator.words()`` method (with ``html=3DTrue``) a=
nd
++:tfilter:`truncatewords_html` template filter were subject to a potenti=
al
++regular expression denial-of-service attack using a suitably crafted st=
ring
++(follow up to :cve:`2019-14232` and :cve:`2023-43665`).
++
+ CVE-2022-28346: Potential SQL injection in ``QuerySet.annotate()``, ``a=
ggregate()``, and ``extra()``
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+=20
+diff --git a/tests/utils_tests/test_text.py b/tests/utils_tests/test_tex=
t.py
+index cb3063d..7e9f2b3 100644
+--- a/tests/utils_tests/test_text.py
++++ b/tests/utils_tests/test_text.py
+@@ -156,6 +156,32 @@ class TestUtilsText(SimpleTestCase):
+         truncator =3D text.Truncator('<p>I &lt;3 python, what about you=
?</p>')
+         self.assertEqual('<p>I &lt;3 python,=E2=80=A6</p>', truncator.w=
ords(3, html=3DTrue))
+=20
++        # Only open brackets.
++        test =3D "<" * 60_000
++        truncator =3D text.Truncator(test)
++        self.assertEqual(truncator.words(1, html=3DTrue), test)
++
++        # Tags with special chars in attrs.
++        truncator =3D text.Truncator(
++            """<i style=3D"margin: 5%; font: *;">Hello, my dear lady!</=
i>"""
++        )
++        self.assertEqual(
++            """<i style=3D"margin: 5%; font: *;">Hello, my dear=E2=80=A6=
</i>""",
++            truncator.words(3, html=3DTrue),
++        )
++
++        # Tags with special non-latin chars in attrs.
++        truncator =3D text.Truncator("""<p data-x=3D"=D7=90">Hello, my =
dear lady!</p>""")
++        self.assertEqual(
++            """<p data-x=3D"=D7=90">Hello, my dear=E2=80=A6</p>""",
++            truncator.words(3, html=3DTrue),
++        )
++
++        # Misplaced brackets.
++        truncator =3D text.Truncator("hello >< world")
++        self.assertEqual(truncator.words(1, html=3DTrue), "hello=E2=80=A6=
")
++        self.assertEqual(truncator.words(2, html=3DTrue), "hello >< wor=
ld")
++
+     @patch("django.utils.text.Truncator.MAX_LENGTH_HTML", 10_000)
+     def test_truncate_words_html_size_limit(self):
+         max_len =3D text.Truncator.MAX_LENGTH_HTML
+--=20
+2.35.5
+
diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.23/CV=
E-2024-27351.patch b/meta-python/recipes-devtools/python/python3-django-3=
.2.23/CVE-2024-27351.patch
new file mode 100644
index 0000000000..1251a41bb5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-=
27351.patch
@@ -0,0 +1,145 @@
+From 072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521 Mon Sep 17 00:00:00 2001
+From: Shai Berger <shai@platonix.com>
+Date: Mon, 19 Feb 2024 13:56:37 +0100
+Subject: [PATCH] Fixed CVE-2024-27351 -- Prevented potential ReDoS in
+ Truncator.words().
+
+Thanks Seokchan Yoon for the report.
+
+CVE: CVE-2024-27351
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d=
1a9c3521
+
+Signed-off-by: Shai Berger <shai@platonix.com>
+Co-Authored-By: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.co=
m>
+---
+ django/utils/text.py           | 57 ++++++++++++++++++++++++++++++++--
+ docs/releases/3.2.23.txt       |  8 +++++
+ tests/utils_tests/test_text.py | 26 ++++++++++++++++
+ 3 files changed, 89 insertions(+), 2 deletions(-)
+
+diff --git a/django/utils/text.py b/django/utils/text.py
+index 83e258f..88da9a2 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -18,8 +18,61 @@ def capfirst(x):
+     return x and str(x)[0].upper() + str(x)[1:]
+
+
+-# Set up regular expressions
+-re_words =3D _lazy_re_compile(r'<[^>]+?>|([^<>\s]+)', re.S)
++# ----- Begin security-related performance workaround -----
++
++# We used to have, below
++#
++# re_words =3D _lazy_re_compile(r"<[^>]+?>|([^<>\s]+)", re.S)
++#
++# But it was shown that this regex, in the way we use it here, has some
++# catastrophic edge-case performance features. Namely, when it is appli=
ed to
++# text with only open brackets "<<<...". The class below provides the s=
ervices
++# and correct answers for the use cases, but in these edge cases does i=
t much
++# faster.
++re_notag =3D _lazy_re_compile(r"([^<>\s]+)", re.S)
++re_prt =3D _lazy_re_compile(r"<|([^<>\s]+)", re.S)
++
++
++class WordsRegex:
++    @staticmethod
++    def search(text, pos):
++        # Look for "<" or a non-tag word.
++        partial =3D re_prt.search(text, pos)
++        if partial is None or partial[1] is not None:
++            return partial
++
++        # "<" was found, look for a closing ">".
++        end =3D text.find(">", partial.end(0))
++        if end < 0:
++            # ">" cannot be found, look for a word.
++            return re_notag.search(text, pos + 1)
++        else:
++            # "<" followed by a ">" was found -- fake a match.
++            end +=3D 1
++            return FakeMatch(text[partial.start(0): end], end)
++
++
++class FakeMatch:
++    __slots__ =3D ["_text", "_end"]
++
++    def end(self, group=3D0):
++        assert group =3D=3D 0, "This specific object takes only group=3D=
0"
++        return self._end
++
++    def __getitem__(self, group):
++        if group =3D=3D 1:
++            return None
++        assert group =3D=3D 0, "This specific object takes only group i=
n {0,1}"
++        return self._text
++
++    def __init__(self, text, end):
++        self._text, self._end =3D text, end
++
++
++# ----- End security-related performance workaround -----
++
++# Set up regular expressions.
++re_words =3D WordsRegex
+ re_chars =3D _lazy_re_compile(r'<[^>]+?>|(.)', re.S)
+ re_tag =3D _lazy_re_compile(r'<(/)?(\S+?)(?:(\s*/)|\s.*?)?>', re.S)
+ re_newlines =3D _lazy_re_compile(r'\r\n|\r')  # Used in normalize_newli=
nes
+diff --git a/docs/releases/3.2.23.txt b/docs/releases/3.2.23.txt
+index ba23d11..dd9d68a 100644
+--- a/docs/releases/3.2.23.txt
++++ b/docs/releases/3.2.23.txt
+@@ -17,3 +17,11 @@ large number of Unicode characters.
+ In order to avoid the vulnerability, invalid values longer than
+ ``UsernameField.max_length`` are no longer normalized, since they canno=
t pass
+ validation anyway.
++
++CVE-2024-27351: Potential regular expression denial-of-service in ``dja=
ngo.utils.text.Truncator.words()``
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
++
++``django.utils.text.Truncator.words()`` method (with ``html=3DTrue``) a=
nd
++:tfilter:`truncatewords_html` template filter were subject to a potenti=
al
++regular expression denial-of-service attack using a suitably crafted st=
ring
++(follow up to :cve:`2019-14232` and :cve:`2023-43665`).
+diff --git a/tests/utils_tests/test_text.py b/tests/utils_tests/test_tex=
t.py
+index 0a6f0bc..758919c 100644
+--- a/tests/utils_tests/test_text.py
++++ b/tests/utils_tests/test_text.py
+@@ -159,6 +159,32 @@ class TestUtilsText(SimpleTestCase):
+         truncator =3D text.Truncator('<p>I &lt;3 python, what about you=
?</p>')
+         self.assertEqual('<p>I &lt;3 python,=E2=80=A6</p>', truncator.w=
ords(3, html=3DTrue))
+
++        # Only open brackets.
++        test =3D "<" * 60_000
++        truncator =3D text.Truncator(test)
++        self.assertEqual(truncator.words(1, html=3DTrue), test)
++
++        # Tags with special chars in attrs.
++        truncator =3D text.Truncator(
++            """<i style=3D"margin: 5%; font: *;">Hello, my dear lady!</=
i>"""
++        )
++        self.assertEqual(
++            """<i style=3D"margin: 5%; font: *;">Hello, my dear=E2=80=A6=
</i>""",
++            truncator.words(3, html=3DTrue),
++        )
++
++        # Tags with special non-latin chars in attrs.
++        truncator =3D text.Truncator("""<p data-x=3D"=D7=90">Hello, my =
dear lady!</p>""")
++        self.assertEqual(
++            """<p data-x=3D"=D7=90">Hello, my dear=E2=80=A6</p>""",
++            truncator.words(3, html=3DTrue),
++        )
++
++        # Misplaced brackets.
++        truncator =3D text.Truncator("hello >< world")
++        self.assertEqual(truncator.words(1, html=3DTrue), "hello=E2=80=A6=
")
++        self.assertEqual(truncator.words(2, html=3DTrue), "hello >< wor=
ld")
++
+     @patch("django.utils.text.Truncator.MAX_LENGTH_HTML", 10_000)
+     def test_truncate_words_html_size_limit(self):
+         max_len =3D text.Truncator.MAX_LENGTH_HTML
+--
+2.35.5
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=
 b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 0478fd3883..f394397453 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -24,6 +24,7 @@ SRC_URI +=3D "file://CVE-2023-31047.patch \
             file://CVE-2024-45230.patch \
             file://CVE-2024-45231.patch \
             file://CVE-2024-53907.patch \
+            file://CVE-2024-27351.patch \
            "
=20
 SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951e52ac=
d51f6abda33a7413"
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb=
 b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
index beecaa607c..e049b6552c 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
@@ -6,6 +6,7 @@ SRC_URI[sha256sum] =3D "82968f3640e29ef4a773af2c28448f5f7=
a08d001c6ac05b32d02aeee65
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-sqlparse \
 "
+SRC_URI +=3D "file://CVE-2024-27351.patch"
=20
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch,=20
--=20
2.40.0


