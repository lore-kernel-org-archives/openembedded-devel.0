Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAF1CFD376
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 11:41:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2663.1764502898060404532
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 03:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QGQBY/nf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4429d7dc3a=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUBccDC3694830
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 03:41:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=vZRd1809sJsqTelGc9Wv
	MMYf3ifRM2Epwr0STy+EmhA=; b=QGQBY/nfLhf+qd3v4T+332BR3qpG1BAzKEIV
	4QKVZp6D7vdQQoyv4RzAEs18A3/S4fnJP4FDuuwcOVXERbvIQ3/b77Vgp3YkGKbR
	jSz0mgVa5dTlg+s12eMVKUeEqSk4S5XLiAiivxbUIS+ItjPeqp0sVOOKWIkqlEDX
	kGZi0MEpfiqxtWE+Dq3xnxlOIgVA+nF7zMU/STYMk6YuNBZ/yWMwIBntKIa09+yS
	ZrTVDAoo/uDa7rHctEpvqkRZ0B99cULdfrCc6joa8LnkJN33irnkOR57rW+Wc67e
	v50E5/UHgUf1Wi/PAOfnptsqs8JzgnhbXQfE0wyp75W4qlSo2Q==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05gpp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 03:41:37 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 03:41:36 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 03:41:35 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix CVE-2024-56374
Date: Sun, 30 Nov 2025 17:11:29 +0530
Message-ID: <20251130114129.3032195-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ENkBWo1eA7Wgw9JAmdNb0_vVx8LJh4FS
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692c2d71 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=bggezZYU0h9PQfbbIUcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ENkBWo1eA7Wgw9JAmdNb0_vVx8LJh4FS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwMCBTYWx0ZWRfXwy3hkw/Quu/O
 Ck6MKRPS11uuX8aam3oGA/UU+1wd9y6hSOktcIQdwCsIxqRk3bfoBlq+M6/t/dq89PsK4w+PnM5
 ygduz/DDwZNLym7OOltk+5S0REZgNFlDnzzCj8cqO4SMVMS/V74fxWTowL/XvjwjN3Fl1quxbaa
 F7o0BsR3hq9A6Yf5jgIfKiKR6u5btiq+CGaixkok269MMbJjqwqOHl/QbS8R9LErWq8EJGlcxYd
 ByR+DJZhrBNiVbL7PX1FoGVR41Ud8XK+MbRJhxT0vykbSpuGez7EbWwtZDu7ePcPRVoEtN1T+AC
 L6Wg6cV/uL+/drgsUv0GUdvMZSsg01AlTiEAZTak/tzfT81FHJLKXw4MdViQkvmx8WV/H9fHNPg
 4fqntpKdLPRP0qLJTDLueO1k02V57Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122166

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-56374

Upstream-patch:
https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../CVE-2024-56374.patch                      | 308 +++++++++++++++++
 .../python3-django/CVE-2024-56374.patch       | 315 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 .../python/python3-django_3.2.25.bb           |   1 +
 4 files changed, 625 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-56374.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-56374.patch
new file mode 100644
index 0000000000..90ab279624
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-56374.patch
@@ -0,0 +1,308 @@
+From ad866a1ca3e7d60da888d25d27e46a8adb2ed36e Mon Sep 17 00:00:00 2001
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
+ docs/releases/3.2.25.txt                      | 12 ++++++
+ .../field_tests/test_genericipaddressfield.py | 35 +++++++++++++++-
+ tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--
+ 7 files changed, 119 insertions(+), 14 deletions(-)
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
+diff --git a/docs/releases/3.2.25.txt b/docs/releases/3.2.25.txt
+index f8d9ce2..93ab341 100644
+--- a/docs/releases/3.2.25.txt
++++ b/docs/releases/3.2.25.txt
+@@ -21,6 +21,18 @@ CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text
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
++
+ Bugfixes
+ ========
+ 
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
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch
new file mode 100644
index 0000000000..3b86eacc41
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch
@@ -0,0 +1,315 @@
+From ad866a1ca3e7d60da888d25d27e46a8adb2ed36e Mon Sep 17 00:00:00 2001
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
+
+%% original patch: CVE-2024-56374.patch
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
+index 7096d13..0e092f0 100644
+--- a/docs/releases/2.2.28.txt
++++ b/docs/releases/2.2.28.txt
+@@ -105,3 +105,15 @@ CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text
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
++
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
+2.40.0
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
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index fb6cb97710..452f2f87a6 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -8,6 +8,7 @@ RDEPENDS:${PN} += "\
 "
 SRC_URI += "\
        file://CVE-2025-26699.patch \
+       file://CVE-2024-56374.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-- 
2.35.5


