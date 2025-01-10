Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F386E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:18:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18291.1736515088564783050
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=310530b8e5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ACY403030806
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 05:18:08 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fphu13n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 05:18:07 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 10 Jan 2025 05:18:07 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 10 Jan 2025 05:18:05 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 1/9] python3-django: Fix CVE-2024-38875
Date: Fri, 10 Jan 2025 13:17:53 +0000
Message-ID: <20250110131802.2774557-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: rkl2GGhWMPpBOph1WymtqIyPB0DXG1Dv
X-Authority-Analysis: v=2.4 cv=Oa1iDgTY c=1 sm=1 tr=0 ts=67811e0f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=wjU5IotzqukA:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=e6582CBVAAAA:8 a=A1X0JdhQAAAA:8 a=_e-hbl8HA18Bt5yNO00A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=sx-6YtKYhV5tk8JtjkN5:22
X-Proofpoint-GUID: rkl2GGhWMPpBOph1WymtqIyPB0DXG1Dv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501100104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50ACY403030806
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114767

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in Django 4.2 before 4.2.14 and 5.0 before 5.0.7.
urlize and urlizetrunc were subject to a potential denial of service atta=
ck
via certain inputs with a very large number of brackets.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-38875
https://github.com/advisories/GHSA-qg2p-9jwr-mmqf

Upstream-patch:
https://github.com/django/django/commit/79f368764295df109a37192f6182fb6f3=
61d85b5

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-django/CVE-2024-38875.patch       | 161 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 2 files changed, 162 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2024-38875.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-=
38875.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024=
-38875.patch
new file mode 100644
index 000000000..8ccb888c6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-38875.p=
atch
@@ -0,0 +1,161 @@
+From 79f368764295df109a37192f6182fb6f361d85b5 Mon Sep 17 00:00:00 2001
+From: Adam Johnson <me@adamj.eu>
+Date: Mon, 24 Jun 2024 15:30:59 +0200
+Subject: [PATCH] [4.2.x] Fixed CVE-2024-38875 -- Mitigated potential DoS=
 in
+ urlize and urlizetrunc template filters.
+
+Thank you to Elias Myllym=C3=A4ki for the report.
+
+Co-authored-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.co=
m>
+
+CVE: CVE-2024-38875
+
+Upstream-Status: Backport [https://github.com/django/django/commit/79f36=
8764295df109a37192f6182fb6f361d85b5]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/utils/html.py           | 90 +++++++++++++++++++++++++---------
+ tests/utils_tests/test_html.py |  7 +++
+ 2 files changed, 73 insertions(+), 21 deletions(-)
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index 7a33d5f..f1b74ab 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -234,6 +234,15 @@ def smart_urlquote(url):
+
+     return urlunsplit((scheme, netloc, path, query, fragment))
+
++class CountsDict(dict):
++    def __init__(self, *args, word, **kwargs):
++        super().__init__(*args, *kwargs)
++        self.word =3D word
++
++    def __missing__(self, key):
++        self[key] =3D self.word.count(key)
++        return self[key]
++
+
+ @keep_lazy_text
+ def urlize(text, trim_url_limit=3DNone, nofollow=3DFalse, autoescape=3D=
False):
+@@ -268,36 +277,69 @@ def urlize(text, trim_url_limit=3DNone, nofollow=3D=
False, autoescape=3DFalse):
+         return text.replace('&amp;', '&').replace('&lt;', '<').replace(
+             '&gt;', '>').replace('&quot;', '"').replace('&#39;', "'")
+
+-    def trim_punctuation(lead, middle, trail):
++    def wrapping_punctuation_openings():
++        return "".join(dict(WRAPPING_PUNCTUATION).keys())
++
++    def trailing_punctuation_chars_no_semicolon():
++        return TRAILING_PUNCTUATION_CHARS.replace(";", "")
++
++    def trailing_punctuation_chars_has_semicolon():
++        return ";" in TRAILING_PUNCTUATION_CHARS
++
++    def trim_punctuation(word):
+         """
+         Trim trailing and wrapping punctuation from `middle`. Return th=
e items
+         of the new state.
+         """
++        # Strip all opening wrapping punctuation.
++        middle =3D word.lstrip(wrapping_punctuation_openings())
++        lead =3D word[: len(word) - len(middle)]
++        trail =3D ""
++
+         # Continue trimming until middle remains unchanged.
+         trimmed_something =3D True
+-        while trimmed_something:
++        counts =3D CountsDict(word=3Dmiddle)
++        while trimmed_something and middle:
+             trimmed_something =3D False
+             # Trim wrapping punctuation.
+             for opening, closing in WRAPPING_PUNCTUATION:
+-                if middle.startswith(opening):
+-                    middle =3D middle[len(opening):]
+-                    lead +=3D opening
+-                    trimmed_something =3D True
+-                # Keep parentheses at the end only if they're balanced.
+-                if (middle.endswith(closing) and
+-                        middle.count(closing) =3D=3D middle.count(openi=
ng) + 1):
+-                    middle =3D middle[:-len(closing)]
+-                    trail =3D closing + trail
+-                    trimmed_something =3D True
+-            # Trim trailing punctuation (after trimming wrapping punctu=
ation,
+-            # as encoded entities contain ';'). Unescape entites to avo=
id
+-            # breaking them by removing ';'.
+-            middle_unescaped =3D unescape(middle)
+-            stripped =3D middle_unescaped.rstrip(TRAILING_PUNCTUATION_C=
HARS)
+-            if middle_unescaped !=3D stripped:
+-                trail =3D middle[len(stripped):] + trail
+-                middle =3D middle[:len(stripped) - len(middle_unescaped=
)]
++                if counts[opening] < counts[closing]:
++                    rstripped =3D middle.rstrip(closing)
++                    if rstripped !=3D middle:
++                        strip =3D counts[closing] - counts[opening]
++                        trail =3D middle[-strip:]
++                        middle =3D middle[:-strip]
++                        trimmed_something =3D True
++                        counts[closing] -=3D strip
++
++            rstripped =3D middle.rstrip(trailing_punctuation_chars_no_s=
emicolon())
++            if rstripped !=3D middle:
++                trail =3D middle[len(rstripped) :] + trail
++                middle =3D rstripped
+                 trimmed_something =3D True
++
++            if trailing_punctuation_chars_has_semicolon() and middle.en=
dswith(";"):
++                # Only strip if not part of an HTML entity.
++                amp =3D middle.rfind("&")
++                if amp =3D=3D -1:
++                    can_strip =3D True
++                else:
++                    potential_entity =3D middle[amp:]
++                    escaped =3D unescape(potential_entity)
++                    can_strip =3D (escaped =3D=3D potential_entity) or =
escaped.endswith(";")
++
++                if can_strip:
++                    rstripped =3D middle.rstrip(";")
++                    amount_stripped =3D len(middle) - len(rstripped)
++                    if amp > -1 and amount_stripped > 1:
++                        # Leave a trailing semicolon as might be an ent=
ity.
++                        trail =3D middle[len(rstripped) + 1 :] + trail
++                        middle =3D rstripped + ";"
++                    else:
++                        trail =3D middle[len(rstripped) :] + trail
++                        middle =3D rstripped
++                    trimmed_something =3D True
++
+         return lead, middle, trail
+
+     def is_email_simple(value):
+@@ -321,9 +363,7 @@ def urlize(text, trim_url_limit=3DNone, no
+             # lead: Current punctuation trimmed from the beginning of t=
he word.
+             # middle: Current state of the word.
+             # trail: Current punctuation trimmed from the end of the wo=
rd.
+-            lead, middle, trail =3D '', word, ''
+-            # Deal with punctuation.
+-            lead, middle, trail =3D trim_punctuation(lead, middle, trai=
l)
++            lead, middle, trail =3D trim_punctuation(word)
+
+             # Make URL we want to point to.
+             url =3D None
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_htm=
l.py
+index 5cc2d9b..715c1c6 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -267,6 +267,13 @@ class TestUtilsHtml(SimpleTestCase):
+             'foo@.example.com',
+             'foo@localhost',
+             'foo@localhost.',
++            # trim_punctuation catastrophic tests
++            "(" * 100_000 + ":" + ")" * 100_000,
++            "(" * 100_000 + "&:" + ")" * 100_000,
++            "([" * 100_000 + ":" + "])" * 100_000,
++            "[(" * 100_000 + ":" + ")]" * 100_000,
++            "([[" * 100_000 + ":" + "]])" * 100_000,
++            "&:" + ";" * 100_000,
+         )
+         for value in tests:
+             with self.subTest(value=3Dvalue):
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=
 b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 7f5861f5d..f082de9d7 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -12,6 +12,7 @@ SRC_URI +=3D "file://CVE-2023-31047.patch \
             file://CVE-2023-46695.patch \
             file://CVE-2024-24680.patch \
             file://CVE-2024-42005.patch \
+            file://CVE-2024-38875.patch \
            "
=20
 SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951e52ac=
d51f6abda33a7413"
--=20
2.40.0


