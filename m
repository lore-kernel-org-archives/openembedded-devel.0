Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D312FCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 03:27:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1125.1763350078522846203
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 19:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Iew4i3EI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34167910e3=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH2brLA365489
	for <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 19:27:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=dfuZXop8/skGbU6H0E7t
	/vzxe9Sa1e9rSFw7j3Xn2MQ=; b=Iew4i3EICLjVFswnsf226QhgMKoGiQBarWqe
	/8bYM9HKJZRU46SEZsX6RLwX6nKpkzFp/SAszRYEVhAMyHPxsL/B7ZYU8qZ79xwB
	+s1M9DRPN+KbgGW3uH3nNuHwtJZZ7CXMLjACMfm9Z2eGLm2nVA+BjI1iGN289y60
	0c7dG5aLdh8xL5fe8WnsqcBs1a8BqXMJW4tkmO5aMRDom3tHvvJlqpCjUucLjwaO
	Z1KW1KZ/euDJcloFa2XKeq9Ejuzs1lLGSKf2yMlFBPG0flGSQyle7cHrnQ//Z3U8
	lyMLqU2lzEPO59bsh6qfPVgcEm8ZZ+jQiU7jqXOU12FC86y5iQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswj97g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 19:27:57 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 19:27:56 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 19:27:55 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2024-56374
Date: Mon, 17 Nov 2025 08:57:54 +0530
Message-ID: <20251117032754.3885964-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691a963d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=ArP49Si0AAAA:8 a=t7CeM3EgAAAA:8 a=l7q3S0e3bX1SYfcgVKMA:9
 a=1-XXx92sLnUDa7cx:21 a=glZLBWN_5F3qvmUqPDV8:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hKJKVH0y4ERnFJNgpLqALU6F5RqJnblJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAyNyBTYWx0ZWRfX6IOmbM5BfPE1
 dQ33VPCaL4WZcWt+KteP32eMdVCmJlFtQqJPqm49D12JBymrMQrX0Y0T+grRC5ADV2H8Muvl7Wi
 pzaQlKHgZporXLmpV3XQ5oxo9CEIRspebeZJ+1srlLNBy713AGV+3U4AwQAeKA8eBOze52wSMBw
 pHaNLxdBH97hj6g9ebL9aGppU0aplARGm1Ypw3vc16Sd/EMyatSBfGRVpvUMYZQZzzYbIRJtqaF
 9snwGmn8bJB9889zVhdXBY65uuGZLSDa0nnUso6blvSDIK/W2PPGGt6QtUE0XBfMfcxELWlxH0a
 cOWS3UbsC9J0RAISdOdfhkKI5mMwihUnQrhJ/jrv3C7snSIZ52XyXOZpNQ1fsRRgbJU24FryWeu
 g/nA4ExxkFs5pgXl8b+cvzKNLz/Ykw==
X-Proofpoint-ORIG-GUID: hKJKVH0y4ERnFJNgpLqALU6F5RqJnblJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 03:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121753

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-56374

Upstream-patch:
https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../CVE-2024-56374.patch                      | 315 ++++++++++++++++
 .../CVE-2024-56374.patch                      | 306 +++++++++++++++
 .../CVE-2024-56374.patch                      | 354 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 .../python/python3-django_3.2.23.bb           |   1 +
 .../python/python3-django_4.2.17.bb           |   5 +-
 6 files changed, 981 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-56374.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-56374.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2024-56374.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-56374.patch
new file mode 100644
index 0000000000..e6f1f7f419
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-56374.patch
@@ -0,0 +1,315 @@
+From 69094122141408d93590a7c22cb9ca8016143a5d Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Mon, 6 Jan 2025 15:51:45 -0300
+Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6
+ validation.
+
+Thanks Saravana Kumar for the report, and Sarah Boyce and Mariusz
+Felisiak for the reviews.
+
+CVE: CVE-2024-56374
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e
+
+Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>
+Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/db/models/fields/__init__.py           |  6 +--
+ django/forms/fields.py                        |  7 +++-
+ django/utils/ipv6.py                          | 22 ++++++++--
+ docs/ref/forms/fields.txt                     | 13 +++++-
+ docs/releases/2.2.28.txt                      | 12 ++++++
+ .../field_tests/test_genericipaddressfield.py | 35 +++++++++++++++-
+ tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--
+ 7 files changed, 120 insertions(+), 15 deletions(-)
+
+diff --git a/django/db/models/fields/__init__.py b/django/db/models/fields/__init__.py
+index e2d1846..c77702f 100644
+--- a/django/db/models/fields/__init__.py
++++ b/django/db/models/fields/__init__.py
+@@ -26,7 +26,7 @@ from django.utils.dateparse import (
+ )
+ from django.utils.duration import duration_microseconds, duration_string
+ from django.utils.functional import Promise, cached_property
+-from django.utils.ipv6 import clean_ipv6_address
++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
+ from django.utils.itercompat import is_iterable
+ from django.utils.text import capfirst
+ from django.utils.translation import gettext_lazy as _
+@@ -1904,7 +1904,7 @@ class GenericIPAddressField(Field):
+         self.default_validators, invalid_error_message = \
+             validators.ip_address_validators(protocol, unpack_ipv4)
+         self.default_error_messages['invalid'] = invalid_error_message
+-        kwargs['max_length'] = 39
++        kwargs["max_length"] = MAX_IPV6_ADDRESS_LENGTH
+         super().__init__(verbose_name, name, *args, **kwargs)
+
+     def check(self, **kwargs):
+@@ -1931,7 +1931,7 @@ class GenericIPAddressField(Field):
+             kwargs['unpack_ipv4'] = self.unpack_ipv4
+         if self.protocol != "both":
+             kwargs['protocol'] = self.protocol
+-        if kwargs.get("max_length") == 39:
++        if kwargs.get("max_length") == self.max_length:
+             del kwargs['max_length']
+         return name, path, args, kwargs
+
+diff --git a/django/forms/fields.py b/django/forms/fields.py
+index f939338..b3156b9 100644
+--- a/django/forms/fields.py
++++ b/django/forms/fields.py
+@@ -29,7 +29,7 @@ from django.forms.widgets import (
+ from django.utils import formats
+ from django.utils.dateparse import parse_duration
+ from django.utils.duration import duration_string
+-from django.utils.ipv6 import clean_ipv6_address
++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
+ from django.utils.translation import gettext_lazy as _, ngettext_lazy
+
+ __all__ = (
+@@ -1162,6 +1162,7 @@ class GenericIPAddressField(CharField):
+     def __init__(self, *, protocol='both', unpack_ipv4=False, **kwargs):
+         self.unpack_ipv4 = unpack_ipv4
+         self.default_validators = validators.ip_address_validators(protocol, unpack_ipv4)[0]
++        kwargs.setdefault("max_length", MAX_IPV6_ADDRESS_LENGTH)
+         super().__init__(**kwargs)
+
+     def to_python(self, value):
+@@ -1169,7 +1170,9 @@ class GenericIPAddressField(CharField):
+             return ''
+         value = value.strip()
+         if value and ':' in value:
+-            return clean_ipv6_address(value, self.unpack_ipv4)
++            return clean_ipv6_address(
++                value, self.unpack_ipv4, max_length=self.max_length
++            )
+         return value
+
+
+diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py
+index ddb8c80..aed7902 100644
+--- a/django/utils/ipv6.py
++++ b/django/utils/ipv6.py
+@@ -3,9 +3,23 @@ import ipaddress
+ from django.core.exceptions import ValidationError
+ from django.utils.translation import gettext_lazy as _
+
++MAX_IPV6_ADDRESS_LENGTH = 39
+
+-def clean_ipv6_address(ip_str, unpack_ipv4=False,
+-                       error_message=_("This is not a valid IPv6 address.")):
++
++def _ipv6_address_from_str(ip_str, max_length=MAX_IPV6_ADDRESS_LENGTH):
++    if len(ip_str) > max_length:
++        raise ValueError(
++            f"Unable to convert {ip_str} to an IPv6 address (value too long)."
++        )
++    return ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
++
++
++def clean_ipv6_address(
++    ip_str,
++    unpack_ipv4=False,
++    error_message=_("This is not a valid IPv6 address."),
++    max_length=MAX_IPV6_ADDRESS_LENGTH,
++	):
+     """
+     Clean an IPv6 address string.
+
+@@ -23,7 +37,7 @@ def clean_ipv6_address(ip_str, unpack_ipv4=False,
+     Return a compressed IPv6 address or the same value.
+     """
+     try:
+-        addr = ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
++        addr = _ipv6_address_from_str(ip_str, max_length)
+     except ValueError:
+         raise ValidationError(error_message, code='invalid')
+
+@@ -40,7 +54,7 @@ def is_valid_ipv6_address(ip_str):
+     Return whether or not the `ip_str` string is a valid IPv6 address.
+     """
+     try:
+-        ipaddress.IPv6Address(ip_str)
++        _ipv6_address_from_str(ip_str)
+     except ValueError:
+         return False
+     return True
+diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
+index 3a888ef..688890a 100644
+--- a/docs/ref/forms/fields.txt
++++ b/docs/ref/forms/fields.txt
+@@ -791,7 +791,7 @@ For each field, we describe the default widget used if you don't specify
+     * Empty value: ``''`` (an empty string)
+     * Normalizes to: A string. IPv6 addresses are normalized as described below.
+     * Validates that the given value is a valid IP address.
+-    * Error message keys: ``required``, ``invalid``
++    * Error message keys: ``required``, ``invalid``, ``max_length``
+
+     The IPv6 address normalization follows :rfc:`4291#section-2.2` section 2.2,
+     including using the IPv4 format suggested in paragraph 3 of that section, like
+@@ -799,7 +799,7 @@ For each field, we describe the default widget used if you don't specify
+     ``2001::1``, and ``::ffff:0a0a:0a0a`` to ``::ffff:10.10.10.10``. All characters
+     are converted to lowercase.
+
+-    Takes two optional arguments:
++    Takes three optional arguments:
+
+     .. attribute:: protocol
+
+@@ -814,6 +814,15 @@ For each field, we describe the default widget used if you don't specify
+         ``192.0.2.1``. Default is disabled. Can only be used
+         when ``protocol`` is set to ``'both'``.
+
++    .. attribute:: max_length
++
++        Defaults to 39, and behaves the same way as it does for
++        :class:`CharField`.
++
++    .. versionchanged:: 4.2.18
++
++        The default value for ``max_length`` was set to 39 characters.
++
+ ``MultipleChoiceField``
+ -----------------------
+
+diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
+index 63877eb..9853d95 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -6,6 +6,18 @@ Django 2.2.28 release notes
+
+ Django 2.2.28 fixes two security issues with severity "high" in 2.2.27.
+
++CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation
++============================================================================
++
++Lack of upper bound limit enforcement in strings passed when performing IPv6
++validation could lead to a potential denial-of-service attack. The undocumented
++and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_address`` were
++vulnerable, as was the  :class:`django.forms.GenericIPAddressField` form field,
++which has now been updated to define a ``max_length`` of 39 characters.
++
++The :class:`django.db.models.GenericIPAddressField` model field was not
++affected.
++
+ CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
+ =========================================================================================
+
+diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py b/tests/forms_tests/field_tests/test_genericipaddressfield.py
+index 97a83e3..4c79d78 100644
+--- a/tests/forms_tests/field_tests/test_genericipaddressfield.py
++++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py
+@@ -1,5 +1,6 @@
+ from django.forms import GenericIPAddressField, ValidationError
+ from django.test import SimpleTestCase
++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH
+
+
+ class GenericIPAddressFieldTest(SimpleTestCase):
+@@ -89,6 +90,35 @@ class GenericIPAddressFieldTest(SimpleTestCase):
+         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
+             f.clean('1:2')
+
++    def test_generic_ipaddress_max_length_custom(self):
++        # Valid IPv4-mapped IPv6 address, len 45.
++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
++        f = GenericIPAddressField(max_length=len(addr))
++        f.clean(addr)
++
++    def test_generic_ipaddress_max_length_validation_error(self):
++        # Valid IPv4-mapped IPv6 address, len 45.
++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
++
++        cases = [
++            ({}, MAX_IPV6_ADDRESS_LENGTH),  # Default value.
++            ({"max_length": len(addr) - 1}, len(addr) - 1),
++        ]
++        for kwargs, max_length in cases:
++            max_length_plus_one = max_length + 1
++            msg = (
++                f"Ensure this value has at most {max_length} characters (it has "
++                f"{max_length_plus_one}).'"
++            )
++            with self.subTest(max_length=max_length):
++                f = GenericIPAddressField(**kwargs)
++                with self.assertRaisesMessage(ValidationError, msg):
++                    f.clean("x" * max_length_plus_one)
++                with self.assertRaisesMessage(
++                    ValidationError, "This is not a valid IPv6 address."
++                ):
++                    f.clean(addr)
++
+     def test_generic_ipaddress_as_generic_not_required(self):
+         f = GenericIPAddressField(required=False)
+         self.assertEqual(f.clean(''), '')
+@@ -103,7 +133,10 @@ class GenericIPAddressFieldTest(SimpleTestCase):
+         with self.assertRaisesMessage(ValidationError, "'Enter a valid IPv4 or IPv6 address.'"):
+             f.clean('256.125.1.5')
+         self.assertEqual(f.clean(' fe80::223:6cff:fe8a:2e8a '), 'fe80::223:6cff:fe8a:2e8a')
+-        self.assertEqual(f.clean(' 2a02::223:6cff:fe8a:2e8a '), '2a02::223:6cff:fe8a:2e8a')
++        self.assertEqual(
++            f.clean(" " * MAX_IPV6_ADDRESS_LENGTH + " 2a02::223:6cff:fe8a:2e8a "),
++            "2a02::223:6cff:fe8a:2e8a",
++            )
+         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
+             f.clean('12345:2:3:4')
+         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
+diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv6.py
+index 4e434f3..1ac6763 100644
+--- a/tests/utils_tests/test_ipv6.py
++++ b/tests/utils_tests/test_ipv6.py
+@@ -1,9 +1,17 @@
+-import unittest
++import traceback
++from io import StringIO
+
+-from django.utils.ipv6 import clean_ipv6_address, is_valid_ipv6_address
++from django.core.exceptions import ValidationError
++from django.test import SimpleTestCase
++from django.utils.ipv6 import (
++    MAX_IPV6_ADDRESS_LENGTH,
++    clean_ipv6_address,
++    is_valid_ipv6_address,
++)
++from django.utils.version import PY310
+
+
+-class TestUtilsIPv6(unittest.TestCase):
++class TestUtilsIPv6(SimpleTestCase):
+
+     def test_validates_correct_plain_address(self):
+         self.assertTrue(is_valid_ipv6_address('fe80::223:6cff:fe8a:2e8a'))
+@@ -55,3 +63,29 @@ class TestUtilsIPv6(unittest.TestCase):
+         self.assertEqual(clean_ipv6_address('::ffff:0a0a:0a0a', unpack_ipv4=True), '10.10.10.10')
+         self.assertEqual(clean_ipv6_address('::ffff:1234:1234', unpack_ipv4=True), '18.52.18.52')
+         self.assertEqual(clean_ipv6_address('::ffff:18.52.18.52', unpack_ipv4=True), '18.52.18.52')
++
++    def test_address_too_long(self):
++        addresses = [
++            "0000:0000:0000:0000:0000:ffff:192.168.100.228",  # IPv4-mapped IPv6 address
++            "0000:0000:0000:0000:0000:ffff:192.168.100.228%123456",  # % scope/zone
++            "fe80::223:6cff:fe8a:2e8a:1234:5678:00000",  # MAX_IPV6_ADDRESS_LENGTH + 1
++        ]
++        msg = "This is the error message."
++        value_error_msg = "Unable to convert %s to an IPv6 address (value too long)."
++        for addr in addresses:
++            with self.subTest(addr=addr):
++                self.assertGreater(len(addr), MAX_IPV6_ADDRESS_LENGTH)
++                self.assertEqual(is_valid_ipv6_address(addr), False)
++                with self.assertRaisesMessage(ValidationError, msg) as ctx:
++                    clean_ipv6_address(addr, error_message=msg)
++                exception_traceback = StringIO()
++                if PY310:
++                    traceback.print_exception(ctx.exception, file=exception_traceback)
++                else:
++                    traceback.print_exception(
++                        type(ctx.exception),
++                        value=ctx.exception,
++                        tb=ctx.exception.__traceback__,
++                        file=exception_traceback,
++                    )
++                self.assertIn(value_error_msg % addr, exception_traceback.getvalue())
+--
+2.35.5
diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-56374.patch
new file mode 100644
index 0000000000..acb9ae23c4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-56374.patch
@@ -0,0 +1,306 @@
+From c11be4dd31d1dedc9ba6e3a1e70bc0a27dbbaa2d Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Mon, 6 Jan 2025 15:51:45 -0300
+Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6
+ validation.
+
+Thanks Saravana Kumar for the report, and Sarah Boyce and Mariusz
+Felisiak for the reviews.
+
+CVE: CVE-2024-56374
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e
+
+Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>
+Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ django/db/models/fields/__init__.py           |  4 +-
+ django/forms/fields.py                        |  7 +++-
+ django/utils/ipv6.py                          | 22 ++++++++--
+ docs/ref/forms/fields.txt                     | 13 +++++-
+ docs/releases/3.2.23.txt                      | 13 ++++++
+ .../field_tests/test_genericipaddressfield.py | 35 +++++++++++++++-
+ tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--
+ 7 files changed, 120 insertions(+), 14 deletions(-)
+
+diff --git a/django/db/models/fields/__init__.py b/django/db/models/fields/__init__.py
+index 167c3d2..148201d 100644
+--- a/django/db/models/fields/__init__.py
++++ b/django/db/models/fields/__init__.py
+@@ -22,7 +22,7 @@ from django.utils.dateparse import (
+ )
+ from django.utils.duration import duration_microseconds, duration_string
+ from django.utils.functional import Promise, cached_property
+-from django.utils.ipv6 import clean_ipv6_address
++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
+ from django.utils.itercompat import is_iterable
+ from django.utils.text import capfirst
+ from django.utils.translation import gettext_lazy as _
+@@ -1940,7 +1940,7 @@ class GenericIPAddressField(Field):
+             kwargs['unpack_ipv4'] = self.unpack_ipv4
+         if self.protocol != "both":
+             kwargs['protocol'] = self.protocol
+-        if kwargs.get("max_length") == 39:
++        if kwargs.get("max_length") == self.max_length:
+             del kwargs['max_length']
+         return name, path, args, kwargs
+ 
+diff --git a/django/forms/fields.py b/django/forms/fields.py
+index 8adb09e..6969c4a 100644
+--- a/django/forms/fields.py
++++ b/django/forms/fields.py
+@@ -28,7 +28,7 @@ from django.forms.widgets import (
+ from django.utils import formats
+ from django.utils.dateparse import parse_datetime, parse_duration
+ from django.utils.duration import duration_string
+-from django.utils.ipv6 import clean_ipv6_address
++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
+ from django.utils.regex_helper import _lazy_re_compile
+ from django.utils.translation import gettext_lazy as _, ngettext_lazy
+ 
+@@ -1179,6 +1179,7 @@ class GenericIPAddressField(CharField):
+     def __init__(self, *, protocol='both', unpack_ipv4=False, **kwargs):
+         self.unpack_ipv4 = unpack_ipv4
+         self.default_validators = validators.ip_address_validators(protocol, unpack_ipv4)[0]
++        kwargs.setdefault("max_length", MAX_IPV6_ADDRESS_LENGTH)
+         super().__init__(**kwargs)
+ 
+     def to_python(self, value):
+@@ -1186,7 +1187,9 @@ class GenericIPAddressField(CharField):
+             return ''
+         value = value.strip()
+         if value and ':' in value:
+-            return clean_ipv6_address(value, self.unpack_ipv4)
++            return clean_ipv6_address(
++                value, self.unpack_ipv4, max_length=self.max_length
++            )
+         return value
+ 
+ 
+diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py
+index ddb8c80..aed7902 100644
+--- a/django/utils/ipv6.py
++++ b/django/utils/ipv6.py
+@@ -3,9 +3,23 @@ import ipaddress
+ from django.core.exceptions import ValidationError
+ from django.utils.translation import gettext_lazy as _
+ 
++MAX_IPV6_ADDRESS_LENGTH = 39
+ 
+-def clean_ipv6_address(ip_str, unpack_ipv4=False,
+-                       error_message=_("This is not a valid IPv6 address.")):
++
++def _ipv6_address_from_str(ip_str, max_length=MAX_IPV6_ADDRESS_LENGTH):
++    if len(ip_str) > max_length:
++        raise ValueError(
++            f"Unable to convert {ip_str} to an IPv6 address (value too long)."
++        )
++    return ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
++
++
++def clean_ipv6_address(
++    ip_str,
++    unpack_ipv4=False,
++    error_message=_("This is not a valid IPv6 address."),
++    max_length=MAX_IPV6_ADDRESS_LENGTH,
++	):
+     """
+     Clean an IPv6 address string.
+ 
+@@ -23,7 +37,7 @@ def clean_ipv6_address(ip_str, unpack_ipv4=False,
+     Return a compressed IPv6 address or the same value.
+     """
+     try:
+-        addr = ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
++        addr = _ipv6_address_from_str(ip_str, max_length)
+     except ValueError:
+         raise ValidationError(error_message, code='invalid')
+ 
+@@ -40,7 +54,7 @@ def is_valid_ipv6_address(ip_str):
+     Return whether or not the `ip_str` string is a valid IPv6 address.
+     """
+     try:
+-        ipaddress.IPv6Address(ip_str)
++        _ipv6_address_from_str(ip_str)
+     except ValueError:
+         return False
+     return True
+diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
+index 5b485f2..45973eb 100644
+--- a/docs/ref/forms/fields.txt
++++ b/docs/ref/forms/fields.txt
+@@ -847,7 +847,7 @@ For each field, we describe the default widget used if you don't specify
+     * Empty value: ``''`` (an empty string)
+     * Normalizes to: A string. IPv6 addresses are normalized as described below.
+     * Validates that the given value is a valid IP address.
+-    * Error message keys: ``required``, ``invalid``
++    * Error message keys: ``required``, ``invalid``, ``max_length``
+ 
+     The IPv6 address normalization follows :rfc:`4291#section-2.2` section 2.2,
+     including using the IPv4 format suggested in paragraph 3 of that section, like
+@@ -855,7 +855,7 @@ For each field, we describe the default widget used if you don't specify
+     ``2001::1``, and ``::ffff:0a0a:0a0a`` to ``::ffff:10.10.10.10``. All characters
+     are converted to lowercase.
+ 
+-    Takes two optional arguments:
++    Takes three optional arguments:
+ 
+     .. attribute:: protocol
+ 
+@@ -870,6 +870,15 @@ For each field, we describe the default widget used if you don't specify
+         ``192.0.2.1``. Default is disabled. Can only be used
+         when ``protocol`` is set to ``'both'``.
+ 
++    .. attribute:: max_length
++
++        Defaults to 39, and behaves the same way as it does for
++        :class:`CharField`.
++
++    .. versionchanged:: 4.2.18
++
++        The default value for ``max_length`` was set to 39 characters.
++
+ ``MultipleChoiceField``
+ -----------------------
+ 
+diff --git a/docs/releases/3.2.23.txt b/docs/releases/3.2.23.txt
+index da75eca..9a9b52d 100644
+--- a/docs/releases/3.2.23.txt
++++ b/docs/releases/3.2.23.txt
+@@ -32,3 +32,16 @@ CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text
+ The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
+ potential denial-of-service attack when used with very long strings.
+ 
++
++CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation
++============================================================================
++
++Lack of upper bound limit enforcement in strings passed when performing IPv6
++validation could lead to a potential denial-of-service attack. The undocumented
++and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_address`` were
++vulnerable, as was the  :class:`django.forms.GenericIPAddressField` form field,
++which has now been updated to define a ``max_length`` of 39 characters.
++
++The :class:`django.db.models.GenericIPAddressField` model field was not
++affected.
++
+diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py b/tests/forms_tests/field_tests/test_genericipaddressfield.py
+index 92dbd71..fc3f129 100644
+--- a/tests/forms_tests/field_tests/test_genericipaddressfield.py
++++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py
+@@ -1,6 +1,7 @@
+ from django.core.exceptions import ValidationError
+ from django.forms import GenericIPAddressField
+ from django.test import SimpleTestCase
++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH
+ 
+ 
+ class GenericIPAddressFieldTest(SimpleTestCase):
+@@ -90,6 +91,35 @@ class GenericIPAddressFieldTest(SimpleTestCase):
+         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
+             f.clean('1:2')
+ 
++    def test_generic_ipaddress_max_length_custom(self):
++        # Valid IPv4-mapped IPv6 address, len 45.
++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
++        f = GenericIPAddressField(max_length=len(addr))
++        f.clean(addr)
++
++    def test_generic_ipaddress_max_length_validation_error(self):
++        # Valid IPv4-mapped IPv6 address, len 45.
++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
++
++        cases = [
++            ({}, MAX_IPV6_ADDRESS_LENGTH),  # Default value.
++            ({"max_length": len(addr) - 1}, len(addr) - 1),
++        ]
++        for kwargs, max_length in cases:
++            max_length_plus_one = max_length + 1
++            msg = (
++                f"Ensure this value has at most {max_length} characters (it has "
++                f"{max_length_plus_one}).'"
++            )
++            with self.subTest(max_length=max_length):
++                f = GenericIPAddressField(**kwargs)
++                with self.assertRaisesMessage(ValidationError, msg):
++                    f.clean("x" * max_length_plus_one)
++                with self.assertRaisesMessage(
++                    ValidationError, "This is not a valid IPv6 address."
++                ):
++                    f.clean(addr)
++
+     def test_generic_ipaddress_as_generic_not_required(self):
+         f = GenericIPAddressField(required=False)
+         self.assertEqual(f.clean(''), '')
+@@ -104,7 +134,10 @@ class GenericIPAddressFieldTest(SimpleTestCase):
+         with self.assertRaisesMessage(ValidationError, "'Enter a valid IPv4 or IPv6 address.'"):
+             f.clean('256.125.1.5')
+         self.assertEqual(f.clean(' fe80::223:6cff:fe8a:2e8a '), 'fe80::223:6cff:fe8a:2e8a')
+-        self.assertEqual(f.clean(' 2a02::223:6cff:fe8a:2e8a '), '2a02::223:6cff:fe8a:2e8a')
++        self.assertEqual(
++            f.clean(" " * MAX_IPV6_ADDRESS_LENGTH + " 2a02::223:6cff:fe8a:2e8a "),
++            "2a02::223:6cff:fe8a:2e8a",
++            )
+         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
+             f.clean('12345:2:3:4')
+         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
+diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv6.py
+index 4e434f3..1ac6763 100644
+--- a/tests/utils_tests/test_ipv6.py
++++ b/tests/utils_tests/test_ipv6.py
+@@ -1,9 +1,17 @@
+-import unittest
++import traceback
++from io import StringIO
+ 
+-from django.utils.ipv6 import clean_ipv6_address, is_valid_ipv6_address
++from django.core.exceptions import ValidationError
++from django.test import SimpleTestCase
++from django.utils.ipv6 import (
++    MAX_IPV6_ADDRESS_LENGTH,
++    clean_ipv6_address,
++    is_valid_ipv6_address,
++)
++from django.utils.version import PY310
+ 
+ 
+-class TestUtilsIPv6(unittest.TestCase):
++class TestUtilsIPv6(SimpleTestCase):
+ 
+     def test_validates_correct_plain_address(self):
+         self.assertTrue(is_valid_ipv6_address('fe80::223:6cff:fe8a:2e8a'))
+@@ -55,3 +63,29 @@ class TestUtilsIPv6(unittest.TestCase):
+         self.assertEqual(clean_ipv6_address('::ffff:0a0a:0a0a', unpack_ipv4=True), '10.10.10.10')
+         self.assertEqual(clean_ipv6_address('::ffff:1234:1234', unpack_ipv4=True), '18.52.18.52')
+         self.assertEqual(clean_ipv6_address('::ffff:18.52.18.52', unpack_ipv4=True), '18.52.18.52')
++
++    def test_address_too_long(self):
++        addresses = [
++            "0000:0000:0000:0000:0000:ffff:192.168.100.228",  # IPv4-mapped IPv6 address
++            "0000:0000:0000:0000:0000:ffff:192.168.100.228%123456",  # % scope/zone
++            "fe80::223:6cff:fe8a:2e8a:1234:5678:00000",  # MAX_IPV6_ADDRESS_LENGTH + 1
++        ]
++        msg = "This is the error message."
++        value_error_msg = "Unable to convert %s to an IPv6 address (value too long)."
++        for addr in addresses:
++            with self.subTest(addr=addr):
++                self.assertGreater(len(addr), MAX_IPV6_ADDRESS_LENGTH)
++                self.assertEqual(is_valid_ipv6_address(addr), False)
++                with self.assertRaisesMessage(ValidationError, msg) as ctx:
++                    clean_ipv6_address(addr, error_message=msg)
++                exception_traceback = StringIO()
++                if PY310:
++                    traceback.print_exception(ctx.exception, file=exception_traceback)
++                else:
++                    traceback.print_exception(
++                        type(ctx.exception),
++                        value=ctx.exception,
++                        tb=ctx.exception.__traceback__,
++                        file=exception_traceback,
++                    )
++                self.assertIn(value_error_msg % addr, exception_traceback.getvalue())
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2024-56374.patch
new file mode 100644
index 0000000000..cee4be249e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2024-56374.patch
@@ -0,0 +1,354 @@
+From ed42ea878033ef6b8bbc811140108816021b1d50 Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Mon, 6 Jan 2025 15:51:45 -0300
+Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6
+
+ validation.
+
+Thanks Saravana Kumar for the report, and Sarah Boyce and Mariusz
+Felisiak for the reviews.
+
+CVE: CVE-2024-56374
+
+Upstream-Status: Backport
+https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e
+
+Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>
+Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+
+%% original patch: CVE-2024-56374.patch
+---
+ Django.egg-info/PKG-INFO                      | 11 ++---
+ Django.egg-info/entry_points.txt              |  1 +
+ django/db/models/fields/__init__.py           |  6 +--
+ django/forms/fields.py                        |  7 +++-
+ django/utils/ipv6.py                          | 19 +++++++--
+ docs/ref/forms/fields.txt                     | 13 +++++-
+ docs/releases/4.2.17.txt                      | 11 +++++
+ .../field_tests/test_genericipaddressfield.py | 33 ++++++++++++++-
+ tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--
+ 9 files changed, 119 insertions(+), 22 deletions(-)
+
+diff --git a/Django.egg-info/PKG-INFO b/Django.egg-info/PKG-INFO
+index 77b00b7..6159219 100644
+--- a/Django.egg-info/PKG-INFO
++++ b/Django.egg-info/PKG-INFO
+@@ -11,6 +11,7 @@ Project-URL: Release notes, https://docs.djangoproject.com/en/stable/releases/
+ Project-URL: Funding, https://www.djangoproject.com/fundraising/
+ Project-URL: Source, https://github.com/django/django
+ Project-URL: Tracker, https://code.djangoproject.com/
++Platform: UNKNOWN
+ Classifier: Development Status :: 5 - Production/Stable
+ Classifier: Environment :: Web Environment
+ Classifier: Framework :: Django
+@@ -31,17 +32,11 @@ Classifier: Topic :: Internet :: WWW/HTTP :: WSGI
+ Classifier: Topic :: Software Development :: Libraries :: Application Frameworks
+ Classifier: Topic :: Software Development :: Libraries :: Python Modules
+ Requires-Python: >=3.8
++Provides-Extra: argon2
++Provides-Extra: bcrypt
+ License-File: LICENSE
+ License-File: LICENSE.python
+ License-File: AUTHORS
+-Requires-Dist: asgiref<4,>=3.6.0
+-Requires-Dist: backports.zoneinfo; python_version < "3.9"
+-Requires-Dist: sqlparse>=0.3.1
+-Requires-Dist: tzdata; sys_platform == "win32"
+-Provides-Extra: argon2
+-Requires-Dist: argon2-cffi>=19.1.0; extra == "argon2"
+-Provides-Extra: bcrypt
+-Requires-Dist: bcrypt; extra == "bcrypt"
+ 
+ ======
+ Django
+diff --git a/Django.egg-info/entry_points.txt b/Django.egg-info/entry_points.txt
+index eaeb88e..22df67e 100644
+--- a/Django.egg-info/entry_points.txt
++++ b/Django.egg-info/entry_points.txt
+@@ -1,2 +1,3 @@
+ [console_scripts]
+ django-admin = django.core.management:execute_from_command_line
++
+diff --git a/django/db/models/fields/__init__.py b/django/db/models/fields/__init__.py
+index b65948d..0cfba4e 100644
+--- a/django/db/models/fields/__init__.py
++++ b/django/db/models/fields/__init__.py
+@@ -25,7 +25,7 @@ from django.utils.dateparse import (
+ )
+ from django.utils.duration import duration_microseconds, duration_string
+ from django.utils.functional import Promise, cached_property
+-from django.utils.ipv6 import clean_ipv6_address
++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
+ from django.utils.itercompat import is_iterable
+ from django.utils.text import capfirst
+ from django.utils.translation import gettext_lazy as _
+@@ -2160,7 +2160,7 @@ class GenericIPAddressField(Field):
+             invalid_error_message,
+         ) = validators.ip_address_validators(protocol, unpack_ipv4)
+         self.default_error_messages["invalid"] = invalid_error_message
+-        kwargs["max_length"] = 39
++        kwargs["max_length"] = MAX_IPV6_ADDRESS_LENGTH
+         super().__init__(verbose_name, name, *args, **kwargs)
+ 
+     def check(self, **kwargs):
+@@ -2187,7 +2187,7 @@ class GenericIPAddressField(Field):
+             kwargs["unpack_ipv4"] = self.unpack_ipv4
+         if self.protocol != "both":
+             kwargs["protocol"] = self.protocol
+-        if kwargs.get("max_length") == 39:
++        if kwargs.get("max_length") == self.max_length:
+             del kwargs["max_length"]
+         return name, path, args, kwargs
+ 
+diff --git a/django/forms/fields.py b/django/forms/fields.py
+index 01cd831..e62417f 100644
+--- a/django/forms/fields.py
++++ b/django/forms/fields.py
+@@ -42,7 +42,7 @@ from django.forms.widgets import (
+ from django.utils import formats
+ from django.utils.dateparse import parse_datetime, parse_duration
+ from django.utils.duration import duration_string
+-from django.utils.ipv6 import clean_ipv6_address
++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
+ from django.utils.regex_helper import _lazy_re_compile
+ from django.utils.translation import gettext_lazy as _
+ from django.utils.translation import ngettext_lazy
+@@ -1284,6 +1284,7 @@ class GenericIPAddressField(CharField):
+         self.default_validators = validators.ip_address_validators(
+             protocol, unpack_ipv4
+         )[0]
++        kwargs.setdefault("max_length", MAX_IPV6_ADDRESS_LENGTH)
+         super().__init__(**kwargs)
+ 
+     def to_python(self, value):
+@@ -1291,7 +1292,9 @@ class GenericIPAddressField(CharField):
+             return ""
+         value = value.strip()
+         if value and ":" in value:
+-            return clean_ipv6_address(value, self.unpack_ipv4)
++            return clean_ipv6_address(
++                value, self.unpack_ipv4, max_length=self.max_length
++            )
+         return value
+ 
+ 
+diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py
+index 88dd6ec..de41a97 100644
+--- a/django/utils/ipv6.py
++++ b/django/utils/ipv6.py
+@@ -3,9 +3,22 @@ import ipaddress
+ from django.core.exceptions import ValidationError
+ from django.utils.translation import gettext_lazy as _
+ 
++MAX_IPV6_ADDRESS_LENGTH = 39
++
++
++def _ipv6_address_from_str(ip_str, max_length=MAX_IPV6_ADDRESS_LENGTH):
++    if len(ip_str) > max_length:
++        raise ValueError(
++            f"Unable to convert {ip_str} to an IPv6 address (value too long)."
++        )
++    return ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
++
+ 
+ def clean_ipv6_address(
+-    ip_str, unpack_ipv4=False, error_message=_("This is not a valid IPv6 address.")
++    ip_str,
++    unpack_ipv4=False,
++    error_message=_("This is not a valid IPv6 address."),
++    max_length=MAX_IPV6_ADDRESS_LENGTH,
+ ):
+     """
+     Clean an IPv6 address string.
+@@ -24,7 +37,7 @@ def clean_ipv6_address(
+     Return a compressed IPv6 address or the same value.
+     """
+     try:
+-        addr = ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
++        addr = _ipv6_address_from_str(ip_str, max_length)
+     except ValueError:
+         raise ValidationError(error_message, code="invalid")
+ 
+@@ -41,7 +54,7 @@ def is_valid_ipv6_address(ip_str):
+     Return whether or not the `ip_str` string is a valid IPv6 address.
+     """
+     try:
+-        ipaddress.IPv6Address(ip_str)
++        _ipv6_address_from_str(ip_str)
+     except ValueError:
+         return False
+     return True
+diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
+index 1a7274e..76b4587 100644
+--- a/docs/ref/forms/fields.txt
++++ b/docs/ref/forms/fields.txt
+@@ -719,7 +719,7 @@ For each field, we describe the default widget used if you don't specify
+     * Empty value: ``''`` (an empty string)
+     * Normalizes to: A string. IPv6 addresses are normalized as described below.
+     * Validates that the given value is a valid IP address.
+-    * Error message keys: ``required``, ``invalid``
++    * Error message keys: ``required``, ``invalid``, ``max_length``
+ 
+     The IPv6 address normalization follows :rfc:`4291#section-2.2` section 2.2,
+     including using the IPv4 format suggested in paragraph 3 of that section, like
+@@ -727,7 +727,7 @@ For each field, we describe the default widget used if you don't specify
+     ``2001::1``, and ``::ffff:0a0a:0a0a`` to ``::ffff:10.10.10.10``. All characters
+     are converted to lowercase.
+ 
+-    Takes two optional arguments:
++    Takes three optional arguments:
+ 
+     .. attribute:: protocol
+ 
+@@ -742,6 +742,15 @@ For each field, we describe the default widget used if you don't specify
+         ``192.0.2.1``. Default is disabled. Can only be used
+         when ``protocol`` is set to ``'both'``.
+ 
++    .. attribute:: max_length
++
++        Defaults to 39, and behaves the same way as it does for
++        :class:`CharField`.
++
++    .. versionchanged:: 4.2.18
++
++        The default value for ``max_length`` was set to 39 characters.
++
+ ``ImageField``
+ --------------
+ 
+diff --git a/docs/releases/4.2.17.txt b/docs/releases/4.2.17.txt
+index 0475a96..1392724 100644
+--- a/docs/releases/4.2.17.txt
++++ b/docs/releases/4.2.17.txt
+@@ -39,3 +39,14 @@ CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text
+ The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
+ potential denial-of-service attack when used with very long strings.
+ 
++CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation
++============================================================================
++
++Lack of upper bound limit enforcement in strings passed when performing IPv6
++validation could lead to a potential denial-of-service attack. The undocumented
++and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_address`` were
++vulnerable, as was the  :class:`django.forms.GenericIPAddressField` form field,
++which has now been updated to define a ``max_length`` of 39 characters.
++
++The :class:`django.db.models.GenericIPAddressField` model field was not
++affected.
+diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py b/tests/forms_tests/field_tests/test_genericipaddressfield.py
+index 80722f5..ef00a72 100644
+--- a/tests/forms_tests/field_tests/test_genericipaddressfield.py
++++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py
+@@ -1,6 +1,7 @@
+ from django.core.exceptions import ValidationError
+ from django.forms import GenericIPAddressField
+ from django.test import SimpleTestCase
++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH
+ 
+ 
+ class GenericIPAddressFieldTest(SimpleTestCase):
+@@ -125,6 +126,35 @@ class GenericIPAddressFieldTest(SimpleTestCase):
+         ):
+             f.clean("1:2")
+ 
++    def test_generic_ipaddress_max_length_custom(self):
++        # Valid IPv4-mapped IPv6 address, len 45.
++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
++        f = GenericIPAddressField(max_length=len(addr))
++        f.clean(addr)
++
++    def test_generic_ipaddress_max_length_validation_error(self):
++        # Valid IPv4-mapped IPv6 address, len 45.
++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
++
++        cases = [
++            ({}, MAX_IPV6_ADDRESS_LENGTH),  # Default value.
++            ({"max_length": len(addr) - 1}, len(addr) - 1),
++        ]
++        for kwargs, max_length in cases:
++            max_length_plus_one = max_length + 1
++            msg = (
++                f"Ensure this value has at most {max_length} characters (it has "
++                f"{max_length_plus_one}).'"
++            )
++            with self.subTest(max_length=max_length):
++                f = GenericIPAddressField(**kwargs)
++                with self.assertRaisesMessage(ValidationError, msg):
++                    f.clean("x" * max_length_plus_one)
++                with self.assertRaisesMessage(
++                    ValidationError, "This is not a valid IPv6 address."
++                ):
++                    f.clean(addr)
++
+     def test_generic_ipaddress_as_generic_not_required(self):
+         f = GenericIPAddressField(required=False)
+         self.assertEqual(f.clean(""), "")
+@@ -150,7 +180,8 @@ class GenericIPAddressFieldTest(SimpleTestCase):
+             f.clean(" fe80::223:6cff:fe8a:2e8a "), "fe80::223:6cff:fe8a:2e8a"
+         )
+         self.assertEqual(
+-            f.clean(" 2a02::223:6cff:fe8a:2e8a "), "2a02::223:6cff:fe8a:2e8a"
++            f.clean(" " * MAX_IPV6_ADDRESS_LENGTH + " 2a02::223:6cff:fe8a:2e8a "),
++            "2a02::223:6cff:fe8a:2e8a",
+         )
+         with self.assertRaisesMessage(
+             ValidationError, "'This is not a valid IPv6 address.'"
+diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv6.py
+index bf78ed9..2d06507 100644
+--- a/tests/utils_tests/test_ipv6.py
++++ b/tests/utils_tests/test_ipv6.py
+@@ -1,9 +1,17 @@
+-import unittest
++import traceback
++from io import StringIO
+ 
+-from django.utils.ipv6 import clean_ipv6_address, is_valid_ipv6_address
++from django.core.exceptions import ValidationError
++from django.test import SimpleTestCase
++from django.utils.ipv6 import (
++    MAX_IPV6_ADDRESS_LENGTH,
++    clean_ipv6_address,
++    is_valid_ipv6_address,
++)
++from django.utils.version import PY310
+ 
+ 
+-class TestUtilsIPv6(unittest.TestCase):
++class TestUtilsIPv6(SimpleTestCase):
+     def test_validates_correct_plain_address(self):
+         self.assertTrue(is_valid_ipv6_address("fe80::223:6cff:fe8a:2e8a"))
+         self.assertTrue(is_valid_ipv6_address("2a02::223:6cff:fe8a:2e8a"))
+@@ -64,3 +72,29 @@ class TestUtilsIPv6(unittest.TestCase):
+         self.assertEqual(
+             clean_ipv6_address("::ffff:18.52.18.52", unpack_ipv4=True), "18.52.18.52"
+         )
++
++    def test_address_too_long(self):
++        addresses = [
++            "0000:0000:0000:0000:0000:ffff:192.168.100.228",  # IPv4-mapped IPv6 address
++            "0000:0000:0000:0000:0000:ffff:192.168.100.228%123456",  # % scope/zone
++            "fe80::223:6cff:fe8a:2e8a:1234:5678:00000",  # MAX_IPV6_ADDRESS_LENGTH + 1
++        ]
++        msg = "This is the error message."
++        value_error_msg = "Unable to convert %s to an IPv6 address (value too long)."
++        for addr in addresses:
++            with self.subTest(addr=addr):
++                self.assertGreater(len(addr), MAX_IPV6_ADDRESS_LENGTH)
++                self.assertEqual(is_valid_ipv6_address(addr), False)
++                with self.assertRaisesMessage(ValidationError, msg) as ctx:
++                    clean_ipv6_address(addr, error_message=msg)
++                exception_traceback = StringIO()
++                if PY310:
++                    traceback.print_exception(ctx.exception, file=exception_traceback)
++                else:
++                    traceback.print_exception(
++                        type(ctx.exception),
++                        value=ctx.exception,
++                        tb=ctx.exception.__traceback__,
++                        file=exception_traceback,
++                    )
++                self.assertIn(value_error_msg % addr, exception_traceback.getvalue())
+-- 
+2.35.5
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 24eee95f03..f4b8da69b5 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -26,6 +26,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-53907.patch \
             file://CVE-2024-27351.patch \
             file://CVE-2025-26699.patch \
+            file://CVE-2024-56374.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
index 92a3886cbc..b8e8759467 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
@@ -9,6 +9,7 @@ RDEPENDS:${PN} += "\
 SRC_URI += "\
 	file://CVE-2024-27351.patch \
 	file://CVE-2025-26699.patch \
+	file://CVE-2024-56374.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
index c2b517a441..5377b96c79 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
@@ -7,7 +7,10 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
 "
 
-SRC_URI += "file://CVE-2025-26699.patch"
+SRC_URI += "\
+	file://CVE-2025-26699.patch \
+	file://CVE-2024-56374.patch \
+"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-- 
2.40.0


