Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97520E7719E
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:18:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18359.1736515096976368345
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=310530b8e5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AC04Wf031616
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:16 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkjwf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 10 Jan 2025 05:18:14 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 10 Jan 2025 05:18:13 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 4/9] python3-django: Fix CVE-2024-41989
Date: Fri, 10 Jan 2025 13:17:57 +0000
Message-ID: <20250110131802.2774557-5-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250110131802.2774557-1-soumya.sambu@windriver.com>
References: <20250110131802.2774557-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Mpu5Qprajn_0swY-eiYxQWIMn_ZDR7cs
X-Authority-Analysis: v=2.4 cv=bJjsIO+Z c=1 sm=1 tr=0 ts=67811e17 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=wjU5IotzqukA:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=7FnnzURzAAAA:8 a=JUY6PVayAAAA:8 a=kvuU974JuIwsqa45KtsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=_frjtlfxy5TH4jG2oejy:22 a=32l4pQc4xq9dSJlKNEIc:22
X-Proofpoint-ORIG-GUID: Mpu5Qprajn_0swY-eiYxQWIMn_ZDR7cs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501100104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50AC04Wf031616
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114771

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in Django 5.0 before 5.0.8 and 4.2 before 4.2.15.=
 The
floatformat template filter is subject to significant memory consumption =
when
given a string representation of a number in scientific notation with a l=
arge
exponent.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-41989

Upstream-patches:
https://github.com/django/django/commit/08c5a787262c1ae57f6517d4574b54a5f=
caad124
https://github.com/django/django/commit/4b066bde692078b194709d517b27e55de=
fae787c
https://github.com/django/django/commit/dcd974698301a38081c141ccba6dcafa5=
ed2c80e
https://github.com/django/django/commit/fc76660f589ac07e45e9cd34ccb8087ae=
b11904b

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-django/CVE-2024-41989-0001.patch  | 48 +++++++++++
 .../python3-django/CVE-2024-41989-0002.patch  | 48 +++++++++++
 .../python3-django/CVE-2024-41989-0003.patch  | 57 +++++++++++++
 .../python3-django/CVE-2024-41989-0004.patch  | 81 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  4 +
 5 files changed, 238 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2024-41989-0001.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2024-41989-0002.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2024-41989-0003.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2024-41989-0004.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-=
41989-0001.patch b/meta-python/recipes-devtools/python/python3-django/CVE=
-2024-41989-0001.patch
new file mode 100644
index 000000000..04c0cf91e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0=
001.patch
@@ -0,0 +1,48 @@
+From 08c5a787262c1ae57f6517d4574b54a5fcaad124 Mon Sep 17 00:00:00 2001
+From: Vlastimil Z=C3=ADma <ziima@users.noreply.github.com>
+Date: Mon, 24 Oct 2022 12:59:34 +0200
+Subject: [PATCH] Fixed #34098 -- Fixed loss of precision for Decimal val=
ues in
+  floatformat filter.
+
+Regression in 12f7928f5a455e330c0a7f19bc86b37baca12811.
+
+CVE: CVE-2024-41989
+
+Upstream-Status: Backport [https://github.com/django/django/commit/08c5a=
787262c1ae57f6517d4574b54a5fcaad124]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/template/defaultfilters.py                     | 2 +-
+ tests/template_tests/filter_tests/test_floatformat.py | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/django/template/defaultfilters.py b/django/template/default=
filters.py
+index a1d77f5..9ca530c 100644
+--- a/django/template/defaultfilters.py
++++ b/django/template/defaultfilters.py
+@@ -123,7 +123,7 @@ def floatformat(text, arg=3D-1):
+     of that value.
+     """
+     try:
+-        input_val =3D repr(text)
++        input_val =3D str(text)
+         d =3D Decimal(input_val)
+     except InvalidOperation:
+         try:
+diff --git a/tests/template_tests/filter_tests/test_floatformat.py b/tes=
ts/template_tests/filter_tests/test_floatformat.py
+index cfc3eaf..acad66d 100644
+--- a/tests/template_tests/filter_tests/test_floatformat.py
++++ b/tests/template_tests/filter_tests/test_floatformat.py
+@@ -44,6 +44,10 @@ class FunctionTests(SimpleTestCase):
+         self.assertEqual(floatformat(0.12345, 2), '0.12')
+         self.assertEqual(floatformat(Decimal('555.555'), 2), '555.56')
+         self.assertEqual(floatformat(Decimal('09.000')), '9')
++        self.assertEqual(
++            floatformat(Decimal("123456.123456789012345678901"), 21),
++            "123456.123456789012345678901",
++        )
+         self.assertEqual(floatformat('foo'), '')
+         self.assertEqual(floatformat(13.1031, 'bar'), '13.1031')
+         self.assertEqual(floatformat(18.125, 2), '18.13')
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-=
41989-0002.patch b/meta-python/recipes-devtools/python/python3-django/CVE=
-2024-41989-0002.patch
new file mode 100644
index 000000000..51cf79ffb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0=
002.patch
@@ -0,0 +1,48 @@
+From 4b066bde692078b194709d517b27e55defae787c Mon Sep 17 00:00:00 2001
+From: David Wobrock <david.wobrock@gmail.com>
+Date: Wed, 18 Jan 2023 22:54:17 +0100
+Subject: [PATCH] Fixed #34272 -- Fixed floatformat crash on zero with tr=
ailing
+ zeros to zero decimal places.
+
+Regression in 08c5a787262c1ae57f6517d4574b54a5fcaad124.
+
+Thanks Andrii Lahuta for the report.
+
+CVE: CVE-2024-41989
+
+Upstream-Status: Backport [https://github.com/django/django/commit/4b066=
bde692078b194709d517b27e55defae787c]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/template/defaultfilters.py                     | 2 +-
+ tests/template_tests/filter_tests/test_floatformat.py | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/django/template/defaultfilters.py b/django/template/default=
filters.py
+index 9ca530c..e72593b 100644
+--- a/django/template/defaultfilters.py
++++ b/django/template/defaultfilters.py
+@@ -140,7 +140,7 @@ def floatformat(text, arg=3D-1):
+     except (ValueError, OverflowError, InvalidOperation):
+         return input_val
+
+-    if not m and p < 0:
++    if not m and p <=3D 0:
+         return mark_safe(formats.number_format('%d' % (int(d)), 0))
+
+     exp =3D Decimal(1).scaleb(-abs(p))
+diff --git a/tests/template_tests/filter_tests/test_floatformat.py b/tes=
ts/template_tests/filter_tests/test_floatformat.py
+index acad66d..538f501 100644
+--- a/tests/template_tests/filter_tests/test_floatformat.py
++++ b/tests/template_tests/filter_tests/test_floatformat.py
+@@ -65,6 +65,8 @@ class FunctionTests(SimpleTestCase):
+         self.assertEqual(floatformat(0, 7), '0.0000000')
+         self.assertEqual(floatformat(0, 10), '0.0000000000')
+         self.assertEqual(floatformat(0.000000000000000000015, 20), '0.0=
0000000000000000002')
++        self.assertEqual(floatformat("0.00", 0), "0")
++        self.assertEqual(floatformat(Decimal("0.00"), 0), "0")
+
+     def test_infinity(self):
+         pos_inf =3D float(1e30000)
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-=
41989-0003.patch b/meta-python/recipes-devtools/python/python3-django/CVE=
-2024-41989-0003.patch
new file mode 100644
index 000000000..649a58f82
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0=
003.patch
@@ -0,0 +1,57 @@
+From dcd974698301a38081c141ccba6dcafa5ed2c80e Mon Sep 17 00:00:00 2001
+From: "Panagiotis H.M. Issaris" <takis@issaris.com>
+Date: Wed, 22 Feb 2023 20:46:16 +0100
+Subject: [PATCH] Fixed #34363 -- Fixed floatformat crash on zero with tr=
ailing
+ zeros.
+
+Regression in 08c5a787262c1ae57f6517d4574b54a5fcaad124.
+Follow up to 4b066bde692078b194709d517b27e55defae787c.
+
+CVE: CVE-2024-41989
+
+Upstream-Status: Backport [https://github.com/django/django/commit/dcd97=
4698301a38081c141ccba6dcafa5ed2c80e]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/template/defaultfilters.py                     | 3 ++-
+ tests/template_tests/filter_tests/test_floatformat.py | 4 ++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/django/template/defaultfilters.py b/django/template/default=
filters.py
+index e72593b..1aba321 100644
+--- a/django/template/defaultfilters.py
++++ b/django/template/defaultfilters.py
+@@ -2,7 +2,7 @@
+ import random as random_module
+ import re
+ import types
+-from decimal import ROUND_HALF_UP, Context, Decimal, InvalidOperation
++from decimal import ROUND_HALF_UP, Context, Decimal, InvalidOperation, =
getcontext
+ from functools import wraps
+ from operator import itemgetter
+ from pprint import pformat
+@@ -149,6 +149,7 @@ def floatformat(text, arg=3D-1):
+     units =3D len(tupl[1])
+     units +=3D -tupl[2] if m else tupl[2]
+     prec =3D abs(p) + units + 1
++    prec =3D max(getcontext().prec, prec)
+
+     # Avoid conversion to scientific notation by accessing `sign`, `dig=
its`,
+     # and `exponent` from Decimal.as_tuple() directly.
+diff --git a/tests/template_tests/filter_tests/test_floatformat.py b/tes=
ts/template_tests/filter_tests/test_floatformat.py
+index 538f501..413ba4b 100644
+--- a/tests/template_tests/filter_tests/test_floatformat.py
++++ b/tests/template_tests/filter_tests/test_floatformat.py
+@@ -67,6 +67,10 @@ class FunctionTests(SimpleTestCase):
+         self.assertEqual(floatformat(0.000000000000000000015, 20), '0.0=
0000000000000000002')
+         self.assertEqual(floatformat("0.00", 0), "0")
+         self.assertEqual(floatformat(Decimal("0.00"), 0), "0")
++        self.assertEqual(floatformat("0.0000", 2), "0.00")
++        self.assertEqual(floatformat(Decimal("0.0000"), 2), "0.00")
++        self.assertEqual(floatformat("0.000000", 4), "0.0000")
++        self.assertEqual(floatformat(Decimal("0.000000"), 4), "0.0000")
+
+     def test_infinity(self):
+         pos_inf =3D float(1e30000)
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-=
41989-0004.patch b/meta-python/recipes-devtools/python/python3-django/CVE=
-2024-41989-0004.patch
new file mode 100644
index 000000000..1cd99df8b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0=
004.patch
@@ -0,0 +1,81 @@
+From fc76660f589ac07e45e9cd34ccb8087aeb11904b Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Fri, 12 Jul 2024 11:38:34 +0200
+Subject: [PATCH] [4.2.x] Fixed CVE-2024-41989 -- Prevented excessive mem=
ory
+ consumption in floatformat.
+
+Thanks Elias Myllym=C3=A4ki for the report.
+
+Co-authored-by: Shai Berger <shai@platonix.com>
+
+CVE: CVE-2024-41989
+
+Upstream-Status: Backport [https://github.com/django/django/commit/fc766=
60f589ac07e45e9cd34ccb8087aeb11904b]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/template/defaultfilters.py               | 13 +++++++++++++
+ .../filter_tests/test_floatformat.py            | 17 +++++++++++++++++
+ 2 files changed, 30 insertions(+)
+
+diff --git a/django/template/defaultfilters.py b/django/template/default=
filters.py
+index a1d77f5..4884852 100644
+--- a/django/template/defaultfilters.py
++++ b/django/template/defaultfilters.py
+@@ -135,6 +135,19 @@ def floatformat(text, arg=3D-1):
+     except ValueError:
+         return input_val
+
++    _, digits, exponent =3D d.as_tuple()
++    try:
++        number_of_digits_and_exponent_sum =3D len(digits) + abs(exponen=
t)
++    except TypeError:
++        # Exponent values can be "F", "n", "N".
++        number_of_digits_and_exponent_sum =3D 0
++
++    # Values with more than 200 digits, or with a large exponent, are r=
eturned "as is"
++    # to avoid high memory consumption and potential denial-of-service =
attacks.
++    # The cut-off of 200 is consistent with django.utils.numberformat.f=
loatformat().
++    if number_of_digits_and_exponent_sum > 200:
++        return input_val
++
+     try:
+         m =3D int(d) - d
+     except (ValueError, OverflowError, InvalidOperation):
+diff --git a/tests/template_tests/filter_tests/test_floatformat.py b/tes=
ts/template_tests/filter_tests/test_floatformat.py
+index cfc3eaf..bd0a998 100644
+--- a/tests/template_tests/filter_tests/test_floatformat.py
++++ b/tests/template_tests/filter_tests/test_floatformat.py
+@@ -55,6 +55,7 @@ class FunctionTests(SimpleTestCase):
+         self.assertEqual(floatformat(1.5e-15, 20), '0.00000000000000150=
000')
+         self.assertEqual(floatformat(1.5e-15, -20), '0.0000000000000015=
0000')
+         self.assertEqual(floatformat(1.00000000000000015, 16), '1.00000=
00000000002')
++        self.assertEqual(floatformat("1e199"), "1" + "0" * 199)
+
+     def test_zero_values(self):
+         self.assertEqual(floatformat(0, 6), '0.000000')
+@@ -68,6 +69,22 @@ class FunctionTests(SimpleTestCase):
+         self.assertEqual(floatformat(pos_inf), 'inf')
+         self.assertEqual(floatformat(neg_inf), '-inf')
+         self.assertEqual(floatformat(pos_inf / pos_inf), 'nan')
++        self.assertEqual(floatformat("inf"), "inf")
++        self.assertEqual(floatformat("NaN"), "NaN")
++
++    def test_too_many_digits_to_render(self):
++        cases =3D [
++            "1e200",
++            "1E200",
++            "1E10000000000000000",
++            "-1E10000000000000000",
++            "1e10000000000000000",
++            "-1e10000000000000000",
++            "1" + "0" * 1_000_000,
++        ]
++        for value in cases:
++            with self.subTest(value=3Dvalue):
++                self.assertEqual(floatformat(value), value)
+
+     def test_float_dunder_method(self):
+         class FloatWrapper:
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=
 b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index d06f48b1b..dc7e12ad7 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -15,6 +15,10 @@ SRC_URI +=3D "file://CVE-2023-31047.patch \
             file://CVE-2024-38875.patch \
             file://CVE-2023-23969.patch \
             file://CVE-2024-39614.patch \
+            file://CVE-2024-41989-0001.patch \
+            file://CVE-2024-41989-0002.patch \
+            file://CVE-2024-41989-0003.patch \
+            file://CVE-2024-41989-0004.patch \
            "
=20
 SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951e52ac=
d51f6abda33a7413"
--=20
2.40.0


