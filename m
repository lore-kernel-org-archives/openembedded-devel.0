Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03474C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 12:24:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.70931.1701347044378421905
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 04:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sU40oLu9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0698061647=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AUB5IPu027401;
	Thu, 30 Nov 2023 12:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=bEHin899gPEsurQS18
	x5P0wKPCKKsasyn/lCPMluWs4=; b=sU40oLu9y4gHzXVcJyzQhWN3IT6X8/jaqo
	JdoS0OH/rAfquD67vpUl2tM/C++7JBtiiukQWVfoUz06wZ52aQqH02onHcr7hYWT
	1WaLRNhRtoc6rNk8HfA3bD5eg1vOaTBFrllse2mxyxN6z3z1JY2WpXhgYPwMVsAw
	XCoLPlQTrpT0MM3WsWH7rIjV/xnibB1f01qPU08BxeeRd70m7W28xSyHLYfoMxOc
	dzlbTEXj3swE0NTn72kFXPFN9DITzaw/Hx/KZ+qiza4N7DfpMjs4ttklVtdSXM+4
	9Y7uyIVDgYGs9Pt+VAaWeIqrIAVUzILxECtpqrezgieEB9ElIWnw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph0w8g86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Nov 2023 12:24:02 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 04:24:07 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH 1/3] python3-django: Fix for CVE-2023-43665 and CVE-2023-46695
Date: Thu, 30 Nov 2023 12:23:37 +0000
Message-ID: <20231130122339.363700-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: ymkNQVc8UddlA9XkBbSE1wGkgGPW1JzX
X-Proofpoint-GUID: ymkNQVc8UddlA9XkBbSE1wGkgGPW1JzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300092
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3AUB5IPu027401
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 12:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107173

From: Narpat Mali <narpat.mali@windriver.com>

CVE-2023-43665:
In Django 3.2 before 3.2.22, 4.1 before 4.1.12, and 4.2 before 4.2.6, the
django.utils.text.Truncator chars() and words() methods (when used with
html=3DTrue) are subject to a potential DoS (denial of service) attack vi=
a
certain inputs with very long, potentially malformed HTML text. The chars=
()
and words() methods are used to implement the truncatechars_html and
truncatewords_html template filters, which are thus also vulnerable.
NOTE: this issue exists because of an incomplete fix for CVE-2019-14232.

CVE-2023-46695:
An issue was discovered in Django 3.2 before 3.2.23, 4.1 before 4.1.13, a=
nd
4.2 before 4.2.7. The NFKC normalization is slow on Windows. As a consequ=
ence,
django.contrib.auth.forms.UsernameField is subject to a potential DoS (de=
nial of
service) attack via certain inputs with a very large number of Unicode ch=
aracters.

References:
https://www.djangoproject.com/weblog/2023/oct/04/security-releases/
https://www.djangoproject.com/weblog/2023/nov/01/security-releases/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-django/CVE-2023-43665.patch       | 199 ++++++++++++++++++
 .../python3-django/CVE-2023-46695.patch       |  90 ++++++++
 .../python/python3-django_2.2.28.bb           |   2 +
 3 files changed, 291 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2023-43665.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2023-46695.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2023-=
43665.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2023=
-43665.patch
new file mode 100644
index 0000000000..dbfb9b68a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-43665.p=
atch
@@ -0,0 +1,199 @@
+From b269a0063e9b10a6c88c92b24d1b92c7421950de Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Wed, 29 Nov 2023 12:20:01 +0000
+Subject: [PATCH 1/2] Fixed CVE-2023-43665 -- Mitigated potential DoS in
+ django.utils.text.Truncator when truncating HTML text.
+
+Thanks Wenchao Li of Alibaba Group for the report.
+
+CVE: CVE-2023-43665
+
+Upstream-Status: Backport [https://github.com/django/django/commit/ccdad=
e1a0262537868d7ca64374de3d957ca50c5]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ django/utils/text.py            | 18 ++++++++++++++++-
+ docs/ref/templates/builtins.txt | 20 +++++++++++++++++++
+ docs/releases/2.2.28.txt        | 20 +++++++++++++++++++
+ tests/utils_tests/test_text.py  | 35 ++++++++++++++++++++++++---------
+ 4 files changed, 83 insertions(+), 10 deletions(-)
+
+diff --git a/django/utils/text.py b/django/utils/text.py
+index 1fae7b2..06a377b 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -57,7 +57,14 @@ def wrap(text, width):
+ class Truncator(SimpleLazyObject):
+     """
+     An object used to truncate text, either by characters or words.
++
++    When truncating HTML text (either chars or words), input will be li=
mited to
++    at most `MAX_LENGTH_HTML` characters.
+     """
++
++    # 5 million characters are approximately 4000 text pages or 3 web p=
ages.
++    MAX_LENGTH_HTML =3D 5_000_000
++
+     def __init__(self, text):
+         super().__init__(lambda: str(text))
+
+@@ -154,6 +161,11 @@ class Truncator(SimpleLazyObject):
+         if words and length <=3D 0:
+             return ''
+
++        size_limited =3D False
++        if len(text) > self.MAX_LENGTH_HTML:
++            text =3D text[: self.MAX_LENGTH_HTML]
++            size_limited =3D True
++
+         html4_singlets =3D (
+             'br', 'col', 'link', 'base', 'img',
+             'param', 'area', 'hr', 'input'
+@@ -203,10 +215,14 @@ class Truncator(SimpleLazyObject):
+                 # Add it to the start of the open tags list
+                 open_tags.insert(0, tagname)
+
++        truncate_text =3D self.add_truncation_text("", truncate)
++
+         if current_len <=3D length:
++            if size_limited and truncate_text:
++                text +=3D truncate_text
+             return text
++
+         out =3D text[:end_text_pos]
+-        truncate_text =3D self.add_truncation_text('', truncate)
+         if truncate_text:
+             out +=3D truncate_text
+         # Close any tags still open
+diff --git a/docs/ref/templates/builtins.txt b/docs/ref/templates/builti=
ns.txt
+index c4b0fa3..4faab38 100644
+--- a/docs/ref/templates/builtins.txt
++++ b/docs/ref/templates/builtins.txt
+@@ -2318,6 +2318,16 @@ If ``value`` is ``"<p>Joel is a slug</p>"``, the =
output will be
+
+ Newlines in the HTML content will be preserved.
+
++.. admonition:: Size of input string
++
++    Processing large, potentially malformed HTML strings can be
++    resource-intensive and impact service performance. ``truncatechars_=
html``
++    limits input to the first five million characters.
++
++.. versionchanged:: 2.2.28
++
++    In older versions, strings over five million characters were proces=
sed.
++
+ .. templatefilter:: truncatewords
+
+ ``truncatewords``
+@@ -2356,6 +2366,16 @@ If ``value`` is ``"<p>Joel is a slug</p>"``, the =
output will be
+
+ Newlines in the HTML content will be preserved.
+
++.. admonition:: Size of input string
++
++    Processing large, potentially malformed HTML strings can be
++    resource-intensive and impact service performance. ``truncatewords_=
html``
++    limits input to the first five million characters.
++
++.. versionchanged:: 2.2.28
++
++    In older versions, strings over five million characters were proces=
sed.
++
+ .. templatefilter:: unordered_list
+
+ ``unordered_list``
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index 40eb230..6a38e9c 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -56,3 +56,23 @@ CVE-2023-41164: Potential denial of service vulnerabi=
lity in ``django.utils.enco
+ ``django.utils.encoding.uri_to_iri()`` was subject to potential denial =
of
+ service attack via certain inputs with a very large number of Unicode
+ characters.
++
++Backporting the CVE-2023-43665 fix on Django 2.2.28.
++
++CVE-2023-43665: Denial-of-service possibility in ``django.utils.text.Tr=
uncator``
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
++
++Following the fix for :cve:`2019-14232`, the regular expressions used i=
n the
++implementation of ``django.utils.text.Truncator``'s ``chars()`` and ``w=
ords()``
++methods (with ``html=3DTrue``) were revised and improved. However, thes=
e regular
++expressions still exhibited linear backtracking complexity, so when giv=
en a
++very long, potentially malformed HTML input, the evaluation would still=
 be
++slow, leading to a potential denial of service vulnerability.
++
++The ``chars()`` and ``words()`` methods are used to implement the
++:tfilter:`truncatechars_html` and :tfilter:`truncatewords_html` templat=
e
++filters, which were thus also vulnerable.
++
++The input processed by ``Truncator``, when operating in HTML mode, has =
been
++limited to the first five million characters in order to avoid potentia=
l
++performance and memory issues.
+diff --git a/tests/utils_tests/test_text.py b/tests/utils_tests/test_tex=
t.py
+index 27e440b..cb3063d 100644
+--- a/tests/utils_tests/test_text.py
++++ b/tests/utils_tests/test_text.py
+@@ -1,5 +1,6 @@
+ import json
+ import sys
++from unittest.mock import patch
+
+ from django.core.exceptions import SuspiciousFileOperation
+ from django.test import SimpleTestCase
+@@ -87,11 +88,17 @@ class TestUtilsText(SimpleTestCase):
+         # lazy strings are handled correctly
+         self.assertEqual(text.Truncator(lazystr('The quick brown fox'))=
.chars(10), 'The quick=E2=80=A6')
+
+-    def test_truncate_chars_html(self):
++    @patch("django.utils.text.Truncator.MAX_LENGTH_HTML", 10_000)
++    def test_truncate_chars_html_size_limit(self):
++        max_len =3D text.Truncator.MAX_LENGTH_HTML
++        bigger_len =3D text.Truncator.MAX_LENGTH_HTML + 1
++        valid_html =3D "<p>Joel is a slug</p>"  # 14 chars
+         perf_test_values =3D [
+-            (('</a' + '\t' * 50000) + '//>', None),
+-            ('&' * 50000, '&' * 9 + '=E2=80=A6'),
+-            ('_X<<<<<<<<<<<>', None),
++            ("</a" + "\t" * (max_len - 6) + "//>", None),
++            ("</p" + "\t" * bigger_len + "//>", "</p" + "\t" * 6 + "=E2=
=80=A6"),
++            ("&" * bigger_len, "&" * 9 + "=E2=80=A6"),
++            ("_X<<<<<<<<<<<>", None),
++            (valid_html * bigger_len, "<p>Joel is a=E2=80=A6</p>"),  # =
10 chars
+         ]
+         for value, expected in perf_test_values:
+             with self.subTest(value=3Dvalue):
+@@ -149,15 +156,25 @@ class TestUtilsText(SimpleTestCase):
+         truncator =3D text.Truncator('<p>I &lt;3 python, what about you=
?</p>')
+         self.assertEqual('<p>I &lt;3 python,=E2=80=A6</p>', truncator.w=
ords(3, html=3DTrue))
+
++    @patch("django.utils.text.Truncator.MAX_LENGTH_HTML", 10_000)
++    def test_truncate_words_html_size_limit(self):
++        max_len =3D text.Truncator.MAX_LENGTH_HTML
++        bigger_len =3D text.Truncator.MAX_LENGTH_HTML + 1
++        valid_html =3D "<p>Joel is a slug</p>"  # 4 words
+         perf_test_values =3D [
+-            ('</a' + '\t' * 50000) + '//>',
+-            '&' * 50000,
+-            '_X<<<<<<<<<<<>',
++            ("</a" + "\t" * (max_len - 6) + "//>", None),
++            ("</p" + "\t" * bigger_len + "//>", "</p" + "\t" * (max_len=
 - 3) + "=E2=80=A6"),
++            ("&" * max_len, None),  # no change
++            ("&" * bigger_len, "&" * max_len + "=E2=80=A6"),
++            ("_X<<<<<<<<<<<>", None),
++            (valid_html * bigger_len, valid_html * 12 + "<p>Joel is=E2=80=
=A6</p>"),  # 50 words
+         ]
+-        for value in perf_test_values:
++        for value, expected in perf_test_values:
+             with self.subTest(value=3Dvalue):
+                 truncator =3D text.Truncator(value)
+-                self.assertEqual(value, truncator.words(50, html=3DTrue=
))
++                self.assertEqual(
++                    expected if expected else value, truncator.words(50=
, html=3DTrue)
++                )
+
+     def test_wrap(self):
+         digits =3D '1234 67 9'
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2023-=
46695.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2023=
-46695.patch
new file mode 100644
index 0000000000..b7dda41f8f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-46695.p=
atch
@@ -0,0 +1,90 @@
+From 32bc7fa517be1d50239827520cc13f3112d3d748 Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Wed, 29 Nov 2023 12:49:41 +0000
+Subject: [PATCH 2/2] Fixed CVE-2023-46695 -- Fixed potential DoS in
+ UsernameField on Windows.
+
+Thanks MProgrammer (https://hackerone.com/mprogrammer) for the report.
+
+CVE: CVE-2023-46695
+
+Upstream-Status: Backport [https://github.com/django/django/commit/f9a7f=
b8466a7ba4857eaf930099b5258f3eafb2b]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ django/contrib/auth/forms.py   | 10 +++++++++-
+ docs/releases/2.2.28.txt       | 14 ++++++++++++++
+ tests/auth_tests/test_forms.py |  8 +++++++-
+ 3 files changed, 30 insertions(+), 2 deletions(-)
+
+diff --git a/django/contrib/auth/forms.py b/django/contrib/auth/forms.py
+index e6f73fe..26d3ca7 100644
+--- a/django/contrib/auth/forms.py
++++ b/django/contrib/auth/forms.py
+@@ -68,7 +68,15 @@ class ReadOnlyPasswordHashField(forms.Field):
+
+ class UsernameField(forms.CharField):
+     def to_python(self, value):
+-        return unicodedata.normalize('NFKC', super().to_python(value))
++        value =3D super().to_python(value)
++        if self.max_length is not None and len(value) > self.max_length=
:
++            # Normalization can increase the string length (e.g.
++            # "=EF=AC=80" -> "ff", "=C2=BD" -> "1=E2=81=842") but canno=
t reduce it, so there is no
++            # point in normalizing invalid data. Moreover, Unicode
++            # normalization is very slow on Windows and can be a DoS at=
tack
++            # vector.
++            return value
++        return unicodedata.normalize("NFKC", value)
+
+
+ class UserCreationForm(forms.ModelForm):
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index 6a38e9c..c653cb6 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -76,3 +76,17 @@ filters, which were thus also vulnerable.
+ The input processed by ``Truncator``, when operating in HTML mode, has =
been
+ limited to the first five million characters in order to avoid potentia=
l
+ performance and memory issues.
++
++Backporting the CVE-2023-46695 fix on Django 2.2.28.
++
++CVE-2023-46695: Potential denial of service vulnerability in ``Username=
Field`` on Windows
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++The :func:`NFKC normalization <python:unicodedata.normalize>` is slow o=
n
++Windows. As a consequence, ``django.contrib.auth.forms.UsernameField`` =
was
++subject to a potential denial of service attack via certain inputs with=
 a very
++large number of Unicode characters.
++
++In order to avoid the vulnerability, invalid values longer than
++``UsernameField.max_length`` are no longer normalized, since they canno=
t pass
++validation anyway.
+diff --git a/tests/auth_tests/test_forms.py b/tests/auth_tests/test_form=
s.py
+index bed23af..e73d4b8 100644
+--- a/tests/auth_tests/test_forms.py
++++ b/tests/auth_tests/test_forms.py
+@@ -6,7 +6,7 @@ from django import forms
+ from django.contrib.auth.forms import (
+     AdminPasswordChangeForm, AuthenticationForm, PasswordChangeForm,
+     PasswordResetForm, ReadOnlyPasswordHashField, ReadOnlyPasswordHashW=
idget,
+-    SetPasswordForm, UserChangeForm, UserCreationForm,
++    SetPasswordForm, UserChangeForm, UserCreationForm, UsernameField,
+ )
+ from django.contrib.auth.models import User
+ from django.contrib.auth.signals import user_login_failed
+@@ -132,6 +132,12 @@ class UserCreationFormTest(TestDataMixin, TestCase)=
:
+         self.assertNotEqual(user.username, ohm_username)
+         self.assertEqual(user.username, 'test=CE=A9')  # U+03A9 GREEK C=
APITAL LETTER OMEGA
+
++    def test_invalid_username_no_normalize(self):
++        field =3D UsernameField(max_length=3D254)
++        # Usernames are not normalized if they are too long.
++        self.assertEqual(field.to_python("=C2=BD" * 255), "=C2=BD" * 25=
5)
++        self.assertEqual(field.to_python("=EF=AC=80" * 254), "ff" * 254=
)
++
+     def test_duplicate_normalized_unicode(self):
+         """
+         To prevent almost identical usernames, visually identical but d=
iffering
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=
 b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index c35323f455..8c955e6bd8 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -8,6 +8,8 @@ inherit setuptools3
 SRC_URI +=3D "file://CVE-2023-31047.patch \
             file://CVE-2023-36053.patch \
             file://CVE-2023-41164.patch \
+            file://CVE-2023-43665.patch \
+            file://CVE-2023-46695.patch \
            "
=20
 SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951e52ac=
d51f6abda33a7413"
--=20
2.40.0


