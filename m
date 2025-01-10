Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A788EC02181
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:18:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18362.1736515100602399983
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=310530b8e5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AC04Wg031616
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:20 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkjwf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 10 Jan 2025 05:18:18 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 10 Jan 2025 05:18:17 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 6/9] python3-django: Fix CVE-2024-41991
Date: Fri, 10 Jan 2025 13:17:59 +0000
Message-ID: <20250110131802.2774557-7-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250110131802.2774557-1-soumya.sambu@windriver.com>
References: <20250110131802.2774557-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: ANkn73M6ok9gcitYVwUIzPPp1bdSyUDN
X-Authority-Analysis: v=2.4 cv=bJjsIO+Z c=1 sm=1 tr=0 ts=67811e1b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=wjU5IotzqukA:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=A1X0JdhQAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=P5wrnlEIAAAA:8 a=JVjilfhLtxwzEDy9TDgA:9 a=lqcHg5cX4UMA:10 a=r-HJ9bD__24A:10 a=Wpz8ju6o9T4A:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=FdTzh2GWekK77mhwV6Dw:22 a=aoaxo0Z0h-rxbPFMW5aL:22
X-Proofpoint-ORIG-GUID: ANkn73M6ok9gcitYVwUIzPPp1bdSyUDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501100104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50AC04Wg031616
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114773

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in Django 5.0 before 5.0.8 and 4.2 before 4.2.15.=
 The
urlize and urlizetrunc template filters, and the AdminURLFieldWidget widg=
et,
are subject to a potential denial-of-service attack via certain inputs wi=
th a
very large number of Unicode characters.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-41991

Upstream-patch:
https://github.com/django/django/commit/efea1ef7e2190e3f77ca0651b5458297b=
c0f6a9f

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-django/CVE-2024-41991.patch       | 122 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2024-41991.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-=
41991.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024=
-41991.patch
new file mode 100644
index 000000000..c050a4ad3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-41991.p=
atch
@@ -0,0 +1,122 @@
+From efea1ef7e2190e3f77ca0651b5458297bc0f6a9f Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Wed, 10 Jul 2024 20:30:12 +0200
+Subject: [PATCH] [4.2.x] Fixed CVE-2024-41991 -- Prevented potential ReD=
oS in
+ django.utils.html.urlize() and AdminURLFieldWidget.
+
+Thanks Seokchan Yoon for the report.
+
+Co-authored-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.co=
m>
+
+CVE: CVE-2024-41991
+
+Upstream-Status: Backport [https://github.com/django/django/commit/efea1=
ef7e2190e3f77ca0651b5458297bc0f6a9f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/contrib/admin/widgets.py |  2 +-
+ django/utils/html.py            | 10 ++++++++--
+ tests/admin_widgets/tests.py    |  7 ++++++-
+ tests/utils_tests/test_html.py  | 13 +++++++++++++
+ 4 files changed, 28 insertions(+), 4 deletions(-)
+
+diff --git a/django/contrib/admin/widgets.py b/django/contrib/admin/widg=
ets.py
+index a56baee..47647e8 100644
+--- a/django/contrib/admin/widgets.py
++++ b/django/contrib/admin/widgets.py
+@@ -344,7 +344,7 @@ class AdminURLFieldWidget(forms.URLInput):
+         context =3D super().get_context(name, value, attrs)
+         context['current_label'] =3D _('Currently:')
+         context['change_label'] =3D _('Change:')
+-        context['widget']['href'] =3D smart_urlquote(context['widget'][=
'value']) if value else ''
++        context['widget']['href'] =3D smart_urlquote(context['widget'][=
'value']) if url_valid else ''
+         context['url_valid'] =3D url_valid
+         return context
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index 84e157d..52a3389 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -12,6 +12,8 @@ from django.utils.http import RFC3986_GENDELIMS, RFC39=
86_SUBDELIMS
+ from django.utils.safestring import SafeData, SafeText, mark_safe
+ from django.utils.text import normalize_newlines
+
++MAX_URL_LENGTH =3D 2048
++
+ # Configuration for urlize() function.
+ TRAILING_PUNCTUATION_CHARS =3D '.,:;!'
+ WRAPPING_PUNCTUATION =3D [('(', ')'), ('[', ']')]
+@@ -353,6 +355,10 @@ def urlize(text, trim_url_limit=3DNone, nofollow=3D=
False, autoescape=3DFalse):
+         except ValueError:
+             # value contains more than one @.
+             return False
++        # Max length for domain name labels is 63 characters per RFC 10=
34.
++        # Helps to avoid ReDoS vectors in the domain part.
++        if len(p2) > 63:
++            return False
+         # Dot must be in p2 (e.g. example.com)
+         if '.' not in p2 or p2.startswith('.'):
+             return False
+@@ -371,9 +377,9 @@ def urlize(text, trim_url_limit=3DNone, nofollow=3DF=
alse, autoescape=3DFalse):
+             # Make URL we want to point to.
+             url =3D None
+             nofollow_attr =3D ' rel=3D"nofollow"' if nofollow else ''
+-            if simple_url_re.match(middle):
++            if len(middle) <=3D MAX_URL_LENGTH and simple_url_re.match(=
middle):
+                 url =3D smart_urlquote(unescape(middle))
+-            elif simple_url_2_re.match(middle):
++            elif len(middle) <=3D MAX_URL_LENGTH and simple_url_2_re.ma=
tch(middle):
+                 url =3D smart_urlquote('http://%s' % unescape(middle))
+             elif ':' not in middle and is_email_simple(middle):
+                 local, domain =3D middle.rsplit('@', 1)
+diff --git a/tests/admin_widgets/tests.py b/tests/admin_widgets/tests.py
+index 4c14a47..e373f1a 100644
+--- a/tests/admin_widgets/tests.py
++++ b/tests/admin_widgets/tests.py
+@@ -336,7 +336,12 @@ class AdminSplitDateTimeWidgetTest(SimpleTestCase):
+ class AdminURLWidgetTest(SimpleTestCase):
+     def test_get_context_validates_url(self):
+         w =3D widgets.AdminURLFieldWidget()
+-        for invalid in ['', '/not/a/full/url/', 'javascript:alert("Dang=
er XSS!")']:
++        for invalid in [
++            "",
++            "/not/a/full/url/",
++            'javascript:alert("Danger XSS!")',
++            "http://" + "=ED=95=9C.=EA=B8=80." * 1_000_000 + "com",
++        ]:
+             with self.subTest(url=3Dinvalid):
+                 self.assertFalse(w.get_context('name', invalid, {})['ur=
l_valid'])
+         self.assertTrue(w.get_context('name', 'http://example.com', {})=
['url_valid'])
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_htm=
l.py
+index 5abab8d..1956655 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -254,6 +254,15 @@ class TestUtilsHtml(SimpleTestCase):
+             ),
+             ('foo@example.com', '<a href=3D"mailto:foo@example.com">foo=
@example.com</a>'),
+         )
++            (
++                "test@" + "=ED=95=9C.=EA=B8=80." * 15 + "aaa",
++                '<a href=3D"mailto:test@'
++                + "xn--6q8b.xn--bj0b." * 15
++                + 'aaa">'
++                + "test@"
++                + "=ED=95=9C.=EA=B8=80." * 15
++                + "aaa</a>",
++            ),
+         for value, output in tests:
+             with self.subTest(value=3Dvalue):
+                 self.assertEqual(urlize(value), output)
+@@ -261,6 +270,10 @@ class TestUtilsHtml(SimpleTestCase):
+     def test_urlize_unchanged_inputs(self):
+         tests =3D (
+             ('a' + '@a' * 50000) + 'a',  # simple_email_re catastrophic=
 test
++            # Unicode domain catastrophic tests.
++            "a@" + "=ED=95=9C.=EA=B8=80." * 1_000_000 + "a",
++            "http://" + "=ED=95=9C.=EA=B8=80." * 1_000_000 + "com",
++            "www." + "=ED=95=9C.=EA=B8=80." * 1_000_000 + "com",
+             ('a' + '.' * 1000000) + 'a',  # trailing_punctuation catast=
rophic test
+             'foo@',
+             '@foo.com',
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=
 b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 57ab72bc9..b46fdfc42 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -20,6 +20,7 @@ SRC_URI +=3D "file://CVE-2023-31047.patch \
             file://CVE-2024-41989-0003.patch \
             file://CVE-2024-41989-0004.patch \
             file://CVE-2024-41990.patch \
+            file://CVE-2024-41991.patch \
            "
=20
 SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951e52ac=
d51f6abda33a7413"
--=20
2.40.0


