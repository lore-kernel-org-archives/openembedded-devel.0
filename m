Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAAEE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:18:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18358.1736515094003233233
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=310530b8e5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ABkiVV013985
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 05:18:13 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkpb0ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 05:18:13 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 10 Jan 2025 05:18:12 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 10 Jan 2025 05:18:11 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 3/9] python3-django: Fix CVE-2024-39614
Date: Fri, 10 Jan 2025 13:17:56 +0000
Message-ID: <20250110131802.2774557-4-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250110131802.2774557-1-soumya.sambu@windriver.com>
References: <20250110131802.2774557-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=67811e15 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=wjU5IotzqukA:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=ArP49Si0AAAA:8
 a=t7CeM3EgAAAA:8 a=AcjRHnbFtS_InKSXY68A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=glZLBWN_5F3qvmUqPDV8:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: yrcCn2N7a32LCp2XqeagoztoIAyCWSPU
X-Proofpoint-GUID: yrcCn2N7a32LCp2XqeagoztoIAyCWSPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501100104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50ABkiVV013985
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114770

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in Django 5.0 before 5.0.7 and 4.2 before 4.2.14.
get_supported_language_variant() was subject to a potential denial-of-ser=
vice
attack when used with very long strings containing specific characters.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-39614

Upstream-patch:
https://github.com/django/django/commit/17358fb35fb7217423d4c4877ccb6d1a3=
a40b1c3

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-django/CVE-2024-39614.patch       | 138 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2024-39614.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-=
39614.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024=
-39614.patch
new file mode 100644
index 000000000..340cfceac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39614.p=
atch
@@ -0,0 +1,138 @@
+From 17358fb35fb7217423d4c4877ccb6d1a3a40b1c3 Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Wed, 26 Jun 2024 12:11:54 +0200
+Subject: [PATCH] [4.2.x] Fixed CVE-2024-39614 -- Mitigated potential DoS=
 in
+ get_supported_language_variant().
+
+Language codes are now parsed with a maximum length limit of 500 chars.
+
+Thanks to MProgrammer for the report.
+
+CVE: CVE-2024-39614
+
+Upstream-Status: Backport [https://github.com/django/django/commit/17358=
fb35fb7217423d4c4877ccb6d1a3a40b1c3]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/utils/translation/trans_real.py | 24 ++++++++++++++++++++----
+ docs/ref/utils.txt                     | 10 ++++++++++
+ tests/i18n/tests.py                    | 11 +++++++++++
+ 3 files changed, 41 insertions(+), 4 deletions(-)
+
+diff --git a/django/utils/translation/trans_real.py b/django/utils/trans=
lation/trans_real.py
+index 7f658cf..56b4ef1 100644
+--- a/django/utils/translation/trans_real.py
++++ b/django/utils/translation/trans_real.py
+@@ -30,8 +30,10 @@ _default =3D None
+ CONTEXT_SEPARATOR =3D "\x04"
+
+ # Maximum number of characters that will be parsed from the Accept-Lang=
uage
+-# header to prevent possible denial of service or memory exhaustion att=
acks.
+-ACCEPT_LANGUAGE_HEADER_MAX_LENGTH =3D 500
++# header or cookie to prevent possible denial of service or memory exha=
ustion
++# attacks. About 10x longer than the longest value shown on MDN=E2=80=99=
s
++# Accept-Language page.
++LANGUAGE_CODE_MAX_LENGTH =3D 500
+
+ # Format of Accept-Language header values. From RFC 2616, section 14.4 =
and 3.9
+ # and RFC 3066, section 2.1
+@@ -472,11 +474,25 @@ def get_supported_language_variant(lang_code, stri=
ct=3DFalse):
+     If `strict` is False (the default), look for a country-specific var=
iant
+     when neither the language code nor its generic variant is found.
+
++    The language code is truncated to a maximum length to avoid potenti=
al
++    denial of service attacks.
++
+     lru_cache should have a maxsize to prevent from memory exhaustion a=
ttacks,
+     as the provided language codes are taken from the HTTP request. See=
 also
+     <https://www.djangoproject.com/weblog/2007/oct/26/security-fix/>.
+     """
+     if lang_code:
++        # Truncate the language code to a maximum length to avoid poten=
tial
++        # denial of service attacks.
++        if len(lang_code) > LANGUAGE_CODE_MAX_LENGTH:
++            if (
++                not strict
++                and (index :=3D lang_code.rfind("-", 0, LANGUAGE_CODE_M=
AX_LENGTH)) > 0
++            ):
++                # There is a generic variant under the maximum length a=
ccepted length.
++                lang_code =3D lang_code[:index]
++            else:
++                raise ValueError("'lang_code' exceeds the maximum accep=
ted length")
+         # If 'fr-ca' is not supported, try special fallback or language=
-only 'fr'.
+         possible_lang_codes =3D [lang_code]
+         try:
+@@ -598,12 +614,12 @@ def parse_accept_lang_header(lang_string):
+     `functools.lru_cache()` to avoid repetitive parsing of common heade=
r values.
+     """
+     # If the header value doesn't exceed the maximum allowed length, pa=
rse it.
+-    if len(lang_string) <=3D ACCEPT_LANGUAGE_HEADER_MAX_LENGTH:
++    if len(lang_string) <=3D LANGUAGE_CODE_MAX_LENGTH:
+         return _parse_accept_lang_header(lang_string)
+
+     # If there is at least one comma in the value, parse up to the last=
 comma,
+     # skipping any truncated parts at the end of the header value.
+-    index =3D lang_string.rfind(",", 0, ACCEPT_LANGUAGE_HEADER_MAX_LENG=
TH)
++    index =3D lang_string.rfind(",", 0, LANGUAGE_CODE_MAX_LENGTH)
+     if index > 0:
+         return _parse_accept_lang_header(lang_string[:index])
+
+diff --git a/docs/ref/utils.txt b/docs/ref/utils.txt
+index 390f167..63a56e5 100644
+--- a/docs/ref/utils.txt
++++ b/docs/ref/utils.txt
+@@ -1142,6 +1142,11 @@ functions without the ``u``.
+     ``lang_code`` is ``'es-ar'`` and ``'es'`` is in :setting:`LANGUAGES=
` but
+     ``'es-ar'`` isn't.
+
++    ``lang_code`` has a maximum accepted length of 500 characters. A
++    :exc:`ValueError` is raised if ``lang_code`` exceeds this limit and
++    ``strict`` is ``True``, or if there is no generic variant and ``str=
ict``
++    is ``False``.
++
+     If ``strict`` is ``False`` (the default), a country-specific varian=
t may
+     be returned when neither the language code nor its generic variant =
is found.
+     For example, if only ``'es-co'`` is in :setting:`LANGUAGES`, that's
+@@ -1150,6 +1155,11 @@ functions without the ``u``.
+
+     Raises :exc:`LookupError` if nothing is found.
+
++    .. versionchanged:: 4.2.14
++
++        In older versions, ``lang_code`` values over 500 characters wer=
e
++        processed without raising a :exc:`ValueError`.
++
+ .. function:: to_locale(language)
+
+     Turns a language name (en-us) into a locale name (en_US).
+diff --git a/tests/i18n/tests.py b/tests/i18n/tests.py
+index 6efc3a5..0e93395 100644
+--- a/tests/i18n/tests.py
++++ b/tests/i18n/tests.py
+@@ -39,6 +39,7 @@ from django.utils.translation import (
+ from django.utils.translation.reloader import (
+     translation_file_changed, watch_for_translation_changes,
+ )
++from django.utils.translation.trans_real import LANGUAGE_CODE_MAX_LENGT=
H
+
+ from .forms import CompanyForm, I18nForm, SelectDateForm
+ from .models import Company, TestModel
+@@ -1462,6 +1463,16 @@ class MiscTests(SimpleTestCase):
+             g('xyz')
+         with self.assertRaises(LookupError):
+             g('xy-zz')
++        msg =3D "'lang_code' exceeds the maximum accepted length"
++        with self.assertRaises(LookupError):
++            g("x" * LANGUAGE_CODE_MAX_LENGTH)
++        with self.assertRaisesMessage(ValueError, msg):
++            g("x" * (LANGUAGE_CODE_MAX_LENGTH + 1))
++        # 167 * 3 =3D 501 which is LANGUAGE_CODE_MAX_LENGTH + 1.
++        self.assertEqual(g("en-" * 167), "en")
++        with self.assertRaisesMessage(ValueError, msg):
++            g("en-" * 167, strict=3DTrue)
++        self.assertEqual(g("en-" * 30000), "en")  # catastrophic test
+
+     def test_get_supported_language_variant_null(self):
+         g =3D trans_null.get_supported_language_variant
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=
 b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index d8fc147f1..d06f48b1b 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -14,6 +14,7 @@ SRC_URI +=3D "file://CVE-2023-31047.patch \
             file://CVE-2024-42005.patch \
             file://CVE-2024-38875.patch \
             file://CVE-2023-23969.patch \
+            file://CVE-2024-39614.patch \
            "
=20
 SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951e52ac=
d51f6abda33a7413"
--=20
2.40.0


