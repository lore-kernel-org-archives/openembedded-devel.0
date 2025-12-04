Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7E0D20697
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:41:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43614.1764855678638404101
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 05:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fhm/4MRy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=443304842b=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B46bFGJ863150
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Dec 2025 13:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mLBcdYcLFDWeTfCtVSOA
	zABRWqeUBwFJkqJvm+/w+2Y=; b=fhm/4MRyshZNHeJpyueMtnykQVG6N3EiY9Tx
	DzKc2/Qk35tLmGJNUldvPSUTzSv02gyZMCN9U0pyoZjguEyDnhL0uG8Ipe5mfvBx
	J5/LQU/+Km7LyWYBq9KyU5+u5Owby1VmehoMRAxARoMhZcodgbsDywCzEQAyy0oE
	0oSe+y2HpSDOquTELPTK5KRfD5XIEts+pALS0Sxi+jRu7AhowOUckAgTikVNWhH5
	oyFfoF86YVN1pooRbulTPfOnxwiAPsO2cLo4ZCftvpeoYbn06Dg/1MGJa+XYfsLu
	Q22pQpA5NLQcKqCUFLiHoIr6W3D5MhmZv8TORE8VxnXFqenplw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6ed23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 13:41:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 4 Dec 2025 05:41:15 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 4 Dec 2025 05:41:14 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2024-41991
Date: Thu, 4 Dec 2025 19:11:13 +0530
Message-ID: <20251204134113.960199-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMSBTYWx0ZWRfXwAtEBelGjvBl
 cbBSa9KVKxzOEJwf3baDteXD/1r7CCo3XLIxGeSvP3bxQ4+0htOBmjIi4g0r28m+Sp3S0r87BAn
 AkxSkyGDPK9Vqcdj+QC3jWETmndOhHVZ7U9YT7070LGtGJY2OAYBaAO5O+iPax0YtDwogVU/7bo
 Rg4Drj3doXDr00RRGiZfwXZ1ZmxxeJf9HbZ1slhl10s54DbHtewgagSfYFueHgZoeefGdkrNmvC
 3DUrau9dbFfEOzmdsp/f1Fdw8uBIMQvupar023rbe+HOqZcjJtlZ98H4AThNSV/KE1chhOW+pkn
 kqbKJ3ErtQ80hovZhx7SxFpcg52QdcWVQOXPkimoBtLOVtfFkxKQdrmXBF5RR69DxTuLF8yaRlf
 ACilQyP4zi7LBUh+c2YK5YyNkh6U1g==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=69318f7d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=A1X0JdhQAAAA:8 a=1XWaLZrsAAAA:8
 a=t7CeM3EgAAAA:8 a=fxJcL_dCAAAA:8 a=P5wrnlEIAAAA:8 a=6d3UJljkSgCbymwdqX8A:9
 a=lqcHg5cX4UMA:10 a=r-HJ9bD__24A:10 a=Wpz8ju6o9T4A:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=aoaxo0Z0h-rxbPFMW5aL:22
X-Proofpoint-ORIG-GUID: lrCYasOBC1rBxhXSEWrrujYYnxaNdcEF
X-Proofpoint-GUID: lrCYasOBC1rBxhXSEWrrujYYnxaNdcEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040111
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B46bFGJ863150
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122319

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-41991

Upstream-patch:
https://github.com/django/django/commit/efea1ef7e2190e3f77ca0651b5458297b=
c0f6a9f/

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com=
>
---
 .../CVE-2024-41991.patch                      | 143 ++++++++++++++++++
 .../python/python3-django_3.2.25.bb           |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.=
2.25/CVE-2024-41991.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/CV=
E-2024-41991.patch b/meta-python/recipes-devtools/python/python3-django-3=
.2.25/CVE-2024-41991.patch
new file mode 100644
index 0000000000..1531de5b2f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-=
41991.patch
@@ -0,0 +1,143 @@
+From efea1ef7e2190e3f77ca0651b5458297bc0f6a9f Mon Sep 17 00:00:00 2001
+From: Marc Deslauriers <marc.deslauriers@ubuntu.com>
+Date: Wed, 30 Apr 2025 10:34:27 -0400
+Subject: [PATCH] Fixed CVE-2024-41991 -- Prevented potential ReDoS in
+ django.utils.html.urlize() and AdminURLFieldWidget.
+
+Thanks Seokchan Yoon for the report.
+
+Co-authored-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.co=
m>
+
+CVE: CVE-2024-41991
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/efea1ef7e2190e3f77ca0651b5458297=
bc0f6a9f/
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.co=
m>
+---
+ django/contrib/admin/widgets.py |  2 +-
+ django/utils/html.py            | 10 ++++++++--
+ docs/releases/3.2.25.txt        |  7 +++++++
+ tests/admin_widgets/tests.py    |  7 ++++++-
+ tests/utils_tests/test_html.py  | 13 +++++++++++++
+ 5 files changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/django/contrib/admin/widgets.py b/django/contrib/admin/widg=
ets.py
+index aeb7477..b7dd0d8 100644
+--- a/django/contrib/admin/widgets.py
++++ b/django/contrib/admin/widgets.py
+@@ -339,7 +339,7 @@ class AdminURLFieldWidget(forms.URLInput):
+         context =3D super().get_context(name, value, attrs)
+         context['current_label'] =3D _('Currently:')
+         context['change_label'] =3D _('Change:')
+-        context['widget']['href'] =3D smart_urlquote(context['widget'][=
'value']) if value else ''
++        context['widget']['href'] =3D smart_urlquote(context['widget'][=
'value']) if url_valid else ''
+         context['url_valid'] =3D url_valid
+         return context
+=20
+diff --git a/django/utils/html.py b/django/utils/html.py
+index 3bc02b8..44c6b7b 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -29,6 +29,8 @@ simple_url_2_re =3D _lazy_re_compile(
+     re.IGNORECASE
+ )
+=20
++MAX_URL_LENGTH =3D 2048
++
+=20
+ @keep_lazy(str, SafeString)
+ def escape(text):
+@@ -298,6 +300,10 @@ def urlize(text, trim_url_limit=3DNone, nofollow=3D=
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
+@@ -316,9 +322,9 @@ def urlize(text, trim_url_limit=3DNone, nofollow=3DF=
alse, autoescape=3DFalse):
+             # Make URL we want to point to.
+             url =3D None
+             nofollow_attr =3D ' rel=3D"nofollow"' if nofollow else ''
+-            if simple_url_re.match(middle):
++            if len(middle) <=3D MAX_URL_LENGTH and simple_url_re.match(=
middle):
+                 url =3D smart_urlquote(html.unescape(middle))
+-            elif simple_url_2_re.match(middle):
++            elif len(middle) <=3D MAX_URL_LENGTH and simple_url_2_re.ma=
tch(middle):
+                 url =3D smart_urlquote('http://%s' % html.unescape(midd=
le))
+             elif ':' not in middle and is_email_simple(middle):
+                 local, domain =3D middle.rsplit('@', 1)
+diff --git a/docs/releases/3.2.25.txt b/docs/releases/3.2.25.txt
+index 60236d5..67dc8a2 100644
+--- a/docs/releases/3.2.25.txt
++++ b/docs/releases/3.2.25.txt
+@@ -59,6 +59,13 @@ directory-traversal via certain inputs when calling :=
meth:`save()
+=20
+ Built-in ``Storage`` sub-classes were not affected by this vulnerabilit=
y.
+=20
++CVE-2024-41991: Potential denial-of-service vulnerability in ``django.u=
tils.html.urlize()`` and ``AdminURLFieldWidget``
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
++
++:tfilter:`urlize`, :tfilter:`urlizetrunc`, and ``AdminURLFieldWidget`` =
were
++subject to a potential denial-of-service attack via certain inputs with=
 a very
++large number of Unicode characters.
++
+ Bugfixes
+ =3D=3D=3D=3D=3D=3D=3D=3D
+=20
+diff --git a/tests/admin_widgets/tests.py b/tests/admin_widgets/tests.py
+index f701f1a..c532199 100644
+--- a/tests/admin_widgets/tests.py
++++ b/tests/admin_widgets/tests.py
+@@ -353,7 +353,12 @@ class AdminSplitDateTimeWidgetTest(SimpleTestCase):
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
+index 30f5ba6..93458ac 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -255,6 +255,15 @@ class TestUtilsHtml(SimpleTestCase):
+                 'Search for <a href=3D"http://google.com/?q=3D">google.=
com/?q=3D</a>!'
+             ),
+             ('foo@example.com', '<a href=3D"mailto:foo@example.com">foo=
@example.com</a>'),
++            (
++                "test@" + "=ED=95=9C.=EA=B8=80." * 15 + "aaa",
++                '<a href=3D"mailto:test@'
++                + "xn--6q8b.xn--bj0b." * 15
++                + 'aaa">'
++                + "test@"
++                + "=ED=95=9C.=EA=B8=80." * 15
++                + "aaa</a>",
++            ),
+         )
+         for value, output in tests:
+             with self.subTest(value=3Dvalue):
+@@ -263,6 +272,10 @@ class TestUtilsHtml(SimpleTestCase):
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
+--=20
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb=
 b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index 2d94b2109c..c5d97ae482 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -12,6 +12,7 @@ SRC_URI +=3D "\
        file://CVE-2025-57833.patch \
        file://CVE-2024-39329.patch \
        file://CVE-2024-39330.patch \
+       file://CVE-2024-41991.patch \
 "
=20
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
--=20
2.35.5


