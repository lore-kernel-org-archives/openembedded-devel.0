Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4D5CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:47:01 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5222.1763369219830070742
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 00:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RnRQtH7Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso17161525e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 00:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763369218; x=1763974018; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BmX99h7CqnZpd94PAjz4jTt0PwBpzaKqNeE/6LWnNR0=;
        b=RnRQtH7QVr6ZZVU+0B6OwpLmQ95d2J+viCWrQI77lA2EaZTbCqu4bY1ja73pNXbUgx
         kHxtpb9z07JcyaZcSZWMUuOuFUEbXSCrZ1q0pIjDY7Ek6bJ2z/nRzM7U7vvMQkVleSVK
         4Zg+7H4rSw0sYS1dQ3lwpeOo59pH/yq0FQkTmSh0VXTh+QyGxTM6/k/ErjZqJyZ+sw4J
         wNsMC/vWylPYCyTL6ILj2zzg2PYo6gvQrI9E05LxywSB/9g6Gu5lJhwPH/6vAIH76E7Q
         l9cxkF1hc3RD2w0ZWuM98E2qPqo5nnPRuMXUzh+JyGOD9mon0jBhLRY2fs/Qq+NmSZQu
         87OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763369218; x=1763974018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmX99h7CqnZpd94PAjz4jTt0PwBpzaKqNeE/6LWnNR0=;
        b=lZ8I6y5nsQS3LWi4S9i23Ure+/7bOQyrW/Rzwgu6egyEP0lUEehJjZxeyoViogvZEN
         RWY3MpFY/v30o8WWscZDYHwHSBDFv8B8EwaFKIWyx6boj0qANfSRUT+iGk7CqRgZHClO
         /v2bwrtMhk09yRLteiPLAtcyx4IMJAT7IRWY404Yp2HnhBevkcZTXhFhhU0okPhWt/jE
         Fo5NzvJS0H+1NYw+XT9E8fvpUc1t3DWy5psHSdlLm1YW5T8CqENpKcfNEsGRZWEyNIr4
         aNNdJpsVdWsZoKlYjspW3JbMpQuvr/mAP1UpmUWYk+nvvnssgzK8MJcCXR1RH/2Zc9OV
         Zb4w==
X-Forwarded-Encrypted: i=1; AJvYcCXOY4cYPMdTwtS09uBMGsWw14cwfVRl5WDYHYgRRg7wtRSTzvpSGLKUAKFN0kszrjnyHoZMg82P3dbcbX3WW/ueIJ8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxwr0cy4LR/ZhrWCu2Kuzy0eEnY5362YvdDsnxhGTLvPnQnWVvD
	do2gHMZEiE6YcZS+iBYjfKtDAQnPvlmn7hYnCBN8+lmaoQUjMPmIWcc5cVcNg7vI
X-Gm-Gg: ASbGnctRskJJL4T6m1efiXSAD/7w3rstlXW1o82EQCyMzVfgiKDDAOEJx+0dG55ntAy
	OhNQiGP7PE2qCHhgBEXYSPgbfppg7UTZgo/sc2dyKP7PIjISjyyKrBfShmE4hfSEoI3F+598JHq
	jM/+nVRxOzFPPbb5MOIgCUqOfkKxnD/9jjrB/zEfSznVVGHrBrj4OgY5ULdoygrGS7Eg6nn7g1E
	70AOJ43QthgluwK4jj1Oc4FI3E0s9pLnlTqvaHKJniEIyxy+4n96saiS1AkNYzpAsYGnmNE48/q
	+eRZMR48bQXjM6dGAR4CFF+AFGyetP1asSaC2QokAnjCL1PJw62LzfIPMKBR9hvn06Kz+enkwTA
	QZV6YfLsMBxsQ1OaM06Kwgjg/U4XAaFBP8ivYFejCbVDuXyHSYzn3TSAvbhHPbmzmOIKwT3JoyV
	/PJdO90daT
X-Google-Smtp-Source: AGHT+IExQSVL9ZWmnHkP9Ceb49v/kTEYxYJ4AI7ekHhNuR+StUxPTqGET2pUWKGGUQhCPgD6oO788g==
X-Received: by 2002:a05:600c:a07:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4778fe55101mr102234755e9.4.1763369217244;
        Mon, 17 Nov 2025 00:46:57 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477969b3c12sm131562255e9.13.2025.11.17.00.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:46:56 -0800 (PST)
Message-ID: <1099b052-a3ed-45de-b4ce-7b39b2f5afa4@gmail.com>
Date: Mon, 17 Nov 2025 09:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix
 CVE-2024-56374
To: saravanan.kadambathursubramaniyam@windriver.com,
 openembedded-devel@lists.openembedded.org
References: <20251117032754.3885964-1-saravanan.kadambathursubramaniyam@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251117032754.3885964-1-saravanan.kadambathursubramaniyam@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 08:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121765

Would like to add two notes/questions:

1. I think the 4.2.x recipe could be updated to the latest version in
the series, which would have this patch
2. For the 2.2.28 recipe this patch modifies some files in
the Django.egg-info folder, which is not clear for me. Could you please
help with that, is that an accidental inclusion, or is it required for
some reason?

On 11/17/25 04:27, Kadambathur Subramaniyam, Saravanan via
lists.openembedded.org wrote:
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-56374
>
> Upstream-patch:
> https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e
>
> Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> ---
>  .../CVE-2024-56374.patch                      | 315 ++++++++++++++++
>  .../CVE-2024-56374.patch                      | 306 +++++++++++++++
>  .../CVE-2024-56374.patch                      | 354 ++++++++++++++++++
>  .../python/python3-django_2.2.28.bb           |   1 +
>  .../python/python3-django_3.2.23.bb           |   1 +
>  .../python/python3-django_4.2.17.bb           |   5 +-
>  6 files changed, 981 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-56374.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-56374.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2024-56374.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-56374.patch
> new file mode 100644
> index 0000000000..e6f1f7f419
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-56374.patch
> @@ -0,0 +1,315 @@
> +From 69094122141408d93590a7c22cb9ca8016143a5d Mon Sep 17 00:00:00 2001
> +From: Natalia <124304+nessita@users.noreply.github.com>
> +Date: Mon, 6 Jan 2025 15:51:45 -0300
> +Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6
> + validation.
> +
> +Thanks Saravana Kumar for the report, and Sarah Boyce and Mariusz
> +Felisiak for the reviews.
> +
> +CVE: CVE-2024-56374
> +
> +Upstream-Status: Backport
> +https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e
> +
> +Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>
> +Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> +---
> + django/db/models/fields/__init__.py           |  6 +--
> + django/forms/fields.py                        |  7 +++-
> + django/utils/ipv6.py                          | 22 ++++++++--
> + docs/ref/forms/fields.txt                     | 13 +++++-
> + docs/releases/2.2.28.txt                      | 12 ++++++
> + .../field_tests/test_genericipaddressfield.py | 35 +++++++++++++++-
> + tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--
> + 7 files changed, 120 insertions(+), 15 deletions(-)
> +
> +diff --git a/django/db/models/fields/__init__.py b/django/db/models/fields/__init__.py
> +index e2d1846..c77702f 100644
> +--- a/django/db/models/fields/__init__.py
> ++++ b/django/db/models/fields/__init__.py
> +@@ -26,7 +26,7 @@ from django.utils.dateparse import (
> + )
> + from django.utils.duration import duration_microseconds, duration_string
> + from django.utils.functional import Promise, cached_property
> +-from django.utils.ipv6 import clean_ipv6_address
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
> + from django.utils.itercompat import is_iterable
> + from django.utils.text import capfirst
> + from django.utils.translation import gettext_lazy as _
> +@@ -1904,7 +1904,7 @@ class GenericIPAddressField(Field):
> +         self.default_validators, invalid_error_message = \
> +             validators.ip_address_validators(protocol, unpack_ipv4)
> +         self.default_error_messages['invalid'] = invalid_error_message
> +-        kwargs['max_length'] = 39
> ++        kwargs["max_length"] = MAX_IPV6_ADDRESS_LENGTH
> +         super().__init__(verbose_name, name, *args, **kwargs)
> +
> +     def check(self, **kwargs):
> +@@ -1931,7 +1931,7 @@ class GenericIPAddressField(Field):
> +             kwargs['unpack_ipv4'] = self.unpack_ipv4
> +         if self.protocol != "both":
> +             kwargs['protocol'] = self.protocol
> +-        if kwargs.get("max_length") == 39:
> ++        if kwargs.get("max_length") == self.max_length:
> +             del kwargs['max_length']
> +         return name, path, args, kwargs
> +
> +diff --git a/django/forms/fields.py b/django/forms/fields.py
> +index f939338..b3156b9 100644
> +--- a/django/forms/fields.py
> ++++ b/django/forms/fields.py
> +@@ -29,7 +29,7 @@ from django.forms.widgets import (
> + from django.utils import formats
> + from django.utils.dateparse import parse_duration
> + from django.utils.duration import duration_string
> +-from django.utils.ipv6 import clean_ipv6_address
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
> + from django.utils.translation import gettext_lazy as _, ngettext_lazy
> +
> + __all__ = (
> +@@ -1162,6 +1162,7 @@ class GenericIPAddressField(CharField):
> +     def __init__(self, *, protocol='both', unpack_ipv4=False, **kwargs):
> +         self.unpack_ipv4 = unpack_ipv4
> +         self.default_validators = validators.ip_address_validators(protocol, unpack_ipv4)[0]
> ++        kwargs.setdefault("max_length", MAX_IPV6_ADDRESS_LENGTH)
> +         super().__init__(**kwargs)
> +
> +     def to_python(self, value):
> +@@ -1169,7 +1170,9 @@ class GenericIPAddressField(CharField):
> +             return ''
> +         value = value.strip()
> +         if value and ':' in value:
> +-            return clean_ipv6_address(value, self.unpack_ipv4)
> ++            return clean_ipv6_address(
> ++                value, self.unpack_ipv4, max_length=self.max_length
> ++            )
> +         return value
> +
> +
> +diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py
> +index ddb8c80..aed7902 100644
> +--- a/django/utils/ipv6.py
> ++++ b/django/utils/ipv6.py
> +@@ -3,9 +3,23 @@ import ipaddress
> + from django.core.exceptions import ValidationError
> + from django.utils.translation import gettext_lazy as _
> +
> ++MAX_IPV6_ADDRESS_LENGTH = 39
> +
> +-def clean_ipv6_address(ip_str, unpack_ipv4=False,
> +-                       error_message=_("This is not a valid IPv6 address.")):
> ++
> ++def _ipv6_address_from_str(ip_str, max_length=MAX_IPV6_ADDRESS_LENGTH):
> ++    if len(ip_str) > max_length:
> ++        raise ValueError(
> ++            f"Unable to convert {ip_str} to an IPv6 address (value too long)."
> ++        )
> ++    return ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
> ++
> ++
> ++def clean_ipv6_address(
> ++    ip_str,
> ++    unpack_ipv4=False,
> ++    error_message=_("This is not a valid IPv6 address."),
> ++    max_length=MAX_IPV6_ADDRESS_LENGTH,
> ++	):
> +     """
> +     Clean an IPv6 address string.
> +
> +@@ -23,7 +37,7 @@ def clean_ipv6_address(ip_str, unpack_ipv4=False,
> +     Return a compressed IPv6 address or the same value.
> +     """
> +     try:
> +-        addr = ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
> ++        addr = _ipv6_address_from_str(ip_str, max_length)
> +     except ValueError:
> +         raise ValidationError(error_message, code='invalid')
> +
> +@@ -40,7 +54,7 @@ def is_valid_ipv6_address(ip_str):
> +     Return whether or not the `ip_str` string is a valid IPv6 address.
> +     """
> +     try:
> +-        ipaddress.IPv6Address(ip_str)
> ++        _ipv6_address_from_str(ip_str)
> +     except ValueError:
> +         return False
> +     return True
> +diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
> +index 3a888ef..688890a 100644
> +--- a/docs/ref/forms/fields.txt
> ++++ b/docs/ref/forms/fields.txt
> +@@ -791,7 +791,7 @@ For each field, we describe the default widget used if you don't specify
> +     * Empty value: ``''`` (an empty string)
> +     * Normalizes to: A string. IPv6 addresses are normalized as described below.
> +     * Validates that the given value is a valid IP address.
> +-    * Error message keys: ``required``, ``invalid``
> ++    * Error message keys: ``required``, ``invalid``, ``max_length``
> +
> +     The IPv6 address normalization follows :rfc:`4291#section-2.2` section 2.2,
> +     including using the IPv4 format suggested in paragraph 3 of that section, like
> +@@ -799,7 +799,7 @@ For each field, we describe the default widget used if you don't specify
> +     ``2001::1``, and ``::ffff:0a0a:0a0a`` to ``::ffff:10.10.10.10``. All characters
> +     are converted to lowercase.
> +
> +-    Takes two optional arguments:
> ++    Takes three optional arguments:
> +
> +     .. attribute:: protocol
> +
> +@@ -814,6 +814,15 @@ For each field, we describe the default widget used if you don't specify
> +         ``192.0.2.1``. Default is disabled. Can only be used
> +         when ``protocol`` is set to ``'both'``.
> +
> ++    .. attribute:: max_length
> ++
> ++        Defaults to 39, and behaves the same way as it does for
> ++        :class:`CharField`.
> ++
> ++    .. versionchanged:: 4.2.18
> ++
> ++        The default value for ``max_length`` was set to 39 characters.
> ++
> + ``MultipleChoiceField``
> + -----------------------
> +
> +diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
> +index 63877eb..9853d95 100644
> +--- a/docs/releases/2.2.28.txt
> ++++ b/docs/releases/2.2.28.txt
> +@@ -6,6 +6,18 @@ Django 2.2.28 release notes
> +
> + Django 2.2.28 fixes two security issues with severity "high" in 2.2.27.
> +
> ++CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation
> ++============================================================================
> ++
> ++Lack of upper bound limit enforcement in strings passed when performing IPv6
> ++validation could lead to a potential denial-of-service attack. The undocumented
> ++and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_address`` were
> ++vulnerable, as was the  :class:`django.forms.GenericIPAddressField` form field,
> ++which has now been updated to define a ``max_length`` of 39 characters.
> ++
> ++The :class:`django.db.models.GenericIPAddressField` model field was not
> ++affected.
> ++
> + CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
> + =========================================================================================
> +
> +diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py b/tests/forms_tests/field_tests/test_genericipaddressfield.py
> +index 97a83e3..4c79d78 100644
> +--- a/tests/forms_tests/field_tests/test_genericipaddressfield.py
> ++++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py
> +@@ -1,5 +1,6 @@
> + from django.forms import GenericIPAddressField, ValidationError
> + from django.test import SimpleTestCase
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH
> +
> +
> + class GenericIPAddressFieldTest(SimpleTestCase):
> +@@ -89,6 +90,35 @@ class GenericIPAddressFieldTest(SimpleTestCase):
> +         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
> +             f.clean('1:2')
> +
> ++    def test_generic_ipaddress_max_length_custom(self):
> ++        # Valid IPv4-mapped IPv6 address, len 45.
> ++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
> ++        f = GenericIPAddressField(max_length=len(addr))
> ++        f.clean(addr)
> ++
> ++    def test_generic_ipaddress_max_length_validation_error(self):
> ++        # Valid IPv4-mapped IPv6 address, len 45.
> ++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
> ++
> ++        cases = [
> ++            ({}, MAX_IPV6_ADDRESS_LENGTH),  # Default value.
> ++            ({"max_length": len(addr) - 1}, len(addr) - 1),
> ++        ]
> ++        for kwargs, max_length in cases:
> ++            max_length_plus_one = max_length + 1
> ++            msg = (
> ++                f"Ensure this value has at most {max_length} characters (it has "
> ++                f"{max_length_plus_one}).'"
> ++            )
> ++            with self.subTest(max_length=max_length):
> ++                f = GenericIPAddressField(**kwargs)
> ++                with self.assertRaisesMessage(ValidationError, msg):
> ++                    f.clean("x" * max_length_plus_one)
> ++                with self.assertRaisesMessage(
> ++                    ValidationError, "This is not a valid IPv6 address."
> ++                ):
> ++                    f.clean(addr)
> ++
> +     def test_generic_ipaddress_as_generic_not_required(self):
> +         f = GenericIPAddressField(required=False)
> +         self.assertEqual(f.clean(''), '')
> +@@ -103,7 +133,10 @@ class GenericIPAddressFieldTest(SimpleTestCase):
> +         with self.assertRaisesMessage(ValidationError, "'Enter a valid IPv4 or IPv6 address.'"):
> +             f.clean('256.125.1.5')
> +         self.assertEqual(f.clean(' fe80::223:6cff:fe8a:2e8a '), 'fe80::223:6cff:fe8a:2e8a')
> +-        self.assertEqual(f.clean(' 2a02::223:6cff:fe8a:2e8a '), '2a02::223:6cff:fe8a:2e8a')
> ++        self.assertEqual(
> ++            f.clean(" " * MAX_IPV6_ADDRESS_LENGTH + " 2a02::223:6cff:fe8a:2e8a "),
> ++            "2a02::223:6cff:fe8a:2e8a",
> ++            )
> +         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
> +             f.clean('12345:2:3:4')
> +         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
> +diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv6.py
> +index 4e434f3..1ac6763 100644
> +--- a/tests/utils_tests/test_ipv6.py
> ++++ b/tests/utils_tests/test_ipv6.py
> +@@ -1,9 +1,17 @@
> +-import unittest
> ++import traceback
> ++from io import StringIO
> +
> +-from django.utils.ipv6 import clean_ipv6_address, is_valid_ipv6_address
> ++from django.core.exceptions import ValidationError
> ++from django.test import SimpleTestCase
> ++from django.utils.ipv6 import (
> ++    MAX_IPV6_ADDRESS_LENGTH,
> ++    clean_ipv6_address,
> ++    is_valid_ipv6_address,
> ++)
> ++from django.utils.version import PY310
> +
> +
> +-class TestUtilsIPv6(unittest.TestCase):
> ++class TestUtilsIPv6(SimpleTestCase):
> +
> +     def test_validates_correct_plain_address(self):
> +         self.assertTrue(is_valid_ipv6_address('fe80::223:6cff:fe8a:2e8a'))
> +@@ -55,3 +63,29 @@ class TestUtilsIPv6(unittest.TestCase):
> +         self.assertEqual(clean_ipv6_address('::ffff:0a0a:0a0a', unpack_ipv4=True), '10.10.10.10')
> +         self.assertEqual(clean_ipv6_address('::ffff:1234:1234', unpack_ipv4=True), '18.52.18.52')
> +         self.assertEqual(clean_ipv6_address('::ffff:18.52.18.52', unpack_ipv4=True), '18.52.18.52')
> ++
> ++    def test_address_too_long(self):
> ++        addresses = [
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228",  # IPv4-mapped IPv6 address
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228%123456",  # % scope/zone
> ++            "fe80::223:6cff:fe8a:2e8a:1234:5678:00000",  # MAX_IPV6_ADDRESS_LENGTH + 1
> ++        ]
> ++        msg = "This is the error message."
> ++        value_error_msg = "Unable to convert %s to an IPv6 address (value too long)."
> ++        for addr in addresses:
> ++            with self.subTest(addr=addr):
> ++                self.assertGreater(len(addr), MAX_IPV6_ADDRESS_LENGTH)
> ++                self.assertEqual(is_valid_ipv6_address(addr), False)
> ++                with self.assertRaisesMessage(ValidationError, msg) as ctx:
> ++                    clean_ipv6_address(addr, error_message=msg)
> ++                exception_traceback = StringIO()
> ++                if PY310:
> ++                    traceback.print_exception(ctx.exception, file=exception_traceback)
> ++                else:
> ++                    traceback.print_exception(
> ++                        type(ctx.exception),
> ++                        value=ctx.exception,
> ++                        tb=ctx.exception.__traceback__,
> ++                        file=exception_traceback,
> ++                    )
> ++                self.assertIn(value_error_msg % addr, exception_traceback.getvalue())
> +--
> +2.35.5
> diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-56374.patch
> new file mode 100644
> index 0000000000..acb9ae23c4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-56374.patch
> @@ -0,0 +1,306 @@
> +From c11be4dd31d1dedc9ba6e3a1e70bc0a27dbbaa2d Mon Sep 17 00:00:00 2001
> +From: Natalia <124304+nessita@users.noreply.github.com>
> +Date: Mon, 6 Jan 2025 15:51:45 -0300
> +Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6
> + validation.
> +
> +Thanks Saravana Kumar for the report, and Sarah Boyce and Mariusz
> +Felisiak for the reviews.
> +
> +CVE: CVE-2024-56374
> +
> +Upstream-Status: Backport
> +https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e
> +
> +Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>
> +Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> +---
> + django/db/models/fields/__init__.py           |  4 +-
> + django/forms/fields.py                        |  7 +++-
> + django/utils/ipv6.py                          | 22 ++++++++--
> + docs/ref/forms/fields.txt                     | 13 +++++-
> + docs/releases/3.2.23.txt                      | 13 ++++++
> + .../field_tests/test_genericipaddressfield.py | 35 +++++++++++++++-
> + tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--
> + 7 files changed, 120 insertions(+), 14 deletions(-)
> +
> +diff --git a/django/db/models/fields/__init__.py b/django/db/models/fields/__init__.py
> +index 167c3d2..148201d 100644
> +--- a/django/db/models/fields/__init__.py
> ++++ b/django/db/models/fields/__init__.py
> +@@ -22,7 +22,7 @@ from django.utils.dateparse import (
> + )
> + from django.utils.duration import duration_microseconds, duration_string
> + from django.utils.functional import Promise, cached_property
> +-from django.utils.ipv6 import clean_ipv6_address
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
> + from django.utils.itercompat import is_iterable
> + from django.utils.text import capfirst
> + from django.utils.translation import gettext_lazy as _
> +@@ -1940,7 +1940,7 @@ class GenericIPAddressField(Field):
> +             kwargs['unpack_ipv4'] = self.unpack_ipv4
> +         if self.protocol != "both":
> +             kwargs['protocol'] = self.protocol
> +-        if kwargs.get("max_length") == 39:
> ++        if kwargs.get("max_length") == self.max_length:
> +             del kwargs['max_length']
> +         return name, path, args, kwargs
> + 
> +diff --git a/django/forms/fields.py b/django/forms/fields.py
> +index 8adb09e..6969c4a 100644
> +--- a/django/forms/fields.py
> ++++ b/django/forms/fields.py
> +@@ -28,7 +28,7 @@ from django.forms.widgets import (
> + from django.utils import formats
> + from django.utils.dateparse import parse_datetime, parse_duration
> + from django.utils.duration import duration_string
> +-from django.utils.ipv6 import clean_ipv6_address
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
> + from django.utils.regex_helper import _lazy_re_compile
> + from django.utils.translation import gettext_lazy as _, ngettext_lazy
> + 
> +@@ -1179,6 +1179,7 @@ class GenericIPAddressField(CharField):
> +     def __init__(self, *, protocol='both', unpack_ipv4=False, **kwargs):
> +         self.unpack_ipv4 = unpack_ipv4
> +         self.default_validators = validators.ip_address_validators(protocol, unpack_ipv4)[0]
> ++        kwargs.setdefault("max_length", MAX_IPV6_ADDRESS_LENGTH)
> +         super().__init__(**kwargs)
> + 
> +     def to_python(self, value):
> +@@ -1186,7 +1187,9 @@ class GenericIPAddressField(CharField):
> +             return ''
> +         value = value.strip()
> +         if value and ':' in value:
> +-            return clean_ipv6_address(value, self.unpack_ipv4)
> ++            return clean_ipv6_address(
> ++                value, self.unpack_ipv4, max_length=self.max_length
> ++            )
> +         return value
> + 
> + 
> +diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py
> +index ddb8c80..aed7902 100644
> +--- a/django/utils/ipv6.py
> ++++ b/django/utils/ipv6.py
> +@@ -3,9 +3,23 @@ import ipaddress
> + from django.core.exceptions import ValidationError
> + from django.utils.translation import gettext_lazy as _
> + 
> ++MAX_IPV6_ADDRESS_LENGTH = 39
> + 
> +-def clean_ipv6_address(ip_str, unpack_ipv4=False,
> +-                       error_message=_("This is not a valid IPv6 address.")):
> ++
> ++def _ipv6_address_from_str(ip_str, max_length=MAX_IPV6_ADDRESS_LENGTH):
> ++    if len(ip_str) > max_length:
> ++        raise ValueError(
> ++            f"Unable to convert {ip_str} to an IPv6 address (value too long)."
> ++        )
> ++    return ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
> ++
> ++
> ++def clean_ipv6_address(
> ++    ip_str,
> ++    unpack_ipv4=False,
> ++    error_message=_("This is not a valid IPv6 address."),
> ++    max_length=MAX_IPV6_ADDRESS_LENGTH,
> ++	):
> +     """
> +     Clean an IPv6 address string.
> + 
> +@@ -23,7 +37,7 @@ def clean_ipv6_address(ip_str, unpack_ipv4=False,
> +     Return a compressed IPv6 address or the same value.
> +     """
> +     try:
> +-        addr = ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
> ++        addr = _ipv6_address_from_str(ip_str, max_length)
> +     except ValueError:
> +         raise ValidationError(error_message, code='invalid')
> + 
> +@@ -40,7 +54,7 @@ def is_valid_ipv6_address(ip_str):
> +     Return whether or not the `ip_str` string is a valid IPv6 address.
> +     """
> +     try:
> +-        ipaddress.IPv6Address(ip_str)
> ++        _ipv6_address_from_str(ip_str)
> +     except ValueError:
> +         return False
> +     return True
> +diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
> +index 5b485f2..45973eb 100644
> +--- a/docs/ref/forms/fields.txt
> ++++ b/docs/ref/forms/fields.txt
> +@@ -847,7 +847,7 @@ For each field, we describe the default widget used if you don't specify
> +     * Empty value: ``''`` (an empty string)
> +     * Normalizes to: A string. IPv6 addresses are normalized as described below.
> +     * Validates that the given value is a valid IP address.
> +-    * Error message keys: ``required``, ``invalid``
> ++    * Error message keys: ``required``, ``invalid``, ``max_length``
> + 
> +     The IPv6 address normalization follows :rfc:`4291#section-2.2` section 2.2,
> +     including using the IPv4 format suggested in paragraph 3 of that section, like
> +@@ -855,7 +855,7 @@ For each field, we describe the default widget used if you don't specify
> +     ``2001::1``, and ``::ffff:0a0a:0a0a`` to ``::ffff:10.10.10.10``. All characters
> +     are converted to lowercase.
> + 
> +-    Takes two optional arguments:
> ++    Takes three optional arguments:
> + 
> +     .. attribute:: protocol
> + 
> +@@ -870,6 +870,15 @@ For each field, we describe the default widget used if you don't specify
> +         ``192.0.2.1``. Default is disabled. Can only be used
> +         when ``protocol`` is set to ``'both'``.
> + 
> ++    .. attribute:: max_length
> ++
> ++        Defaults to 39, and behaves the same way as it does for
> ++        :class:`CharField`.
> ++
> ++    .. versionchanged:: 4.2.18
> ++
> ++        The default value for ``max_length`` was set to 39 characters.
> ++
> + ``MultipleChoiceField``
> + -----------------------
> + 
> +diff --git a/docs/releases/3.2.23.txt b/docs/releases/3.2.23.txt
> +index da75eca..9a9b52d 100644
> +--- a/docs/releases/3.2.23.txt
> ++++ b/docs/releases/3.2.23.txt
> +@@ -32,3 +32,16 @@ CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text
> + The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
> + potential denial-of-service attack when used with very long strings.
> + 
> ++
> ++CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation
> ++============================================================================
> ++
> ++Lack of upper bound limit enforcement in strings passed when performing IPv6
> ++validation could lead to a potential denial-of-service attack. The undocumented
> ++and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_address`` were
> ++vulnerable, as was the  :class:`django.forms.GenericIPAddressField` form field,
> ++which has now been updated to define a ``max_length`` of 39 characters.
> ++
> ++The :class:`django.db.models.GenericIPAddressField` model field was not
> ++affected.
> ++
> +diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py b/tests/forms_tests/field_tests/test_genericipaddressfield.py
> +index 92dbd71..fc3f129 100644
> +--- a/tests/forms_tests/field_tests/test_genericipaddressfield.py
> ++++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py
> +@@ -1,6 +1,7 @@
> + from django.core.exceptions import ValidationError
> + from django.forms import GenericIPAddressField
> + from django.test import SimpleTestCase
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH
> + 
> + 
> + class GenericIPAddressFieldTest(SimpleTestCase):
> +@@ -90,6 +91,35 @@ class GenericIPAddressFieldTest(SimpleTestCase):
> +         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
> +             f.clean('1:2')
> + 
> ++    def test_generic_ipaddress_max_length_custom(self):
> ++        # Valid IPv4-mapped IPv6 address, len 45.
> ++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
> ++        f = GenericIPAddressField(max_length=len(addr))
> ++        f.clean(addr)
> ++
> ++    def test_generic_ipaddress_max_length_validation_error(self):
> ++        # Valid IPv4-mapped IPv6 address, len 45.
> ++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
> ++
> ++        cases = [
> ++            ({}, MAX_IPV6_ADDRESS_LENGTH),  # Default value.
> ++            ({"max_length": len(addr) - 1}, len(addr) - 1),
> ++        ]
> ++        for kwargs, max_length in cases:
> ++            max_length_plus_one = max_length + 1
> ++            msg = (
> ++                f"Ensure this value has at most {max_length} characters (it has "
> ++                f"{max_length_plus_one}).'"
> ++            )
> ++            with self.subTest(max_length=max_length):
> ++                f = GenericIPAddressField(**kwargs)
> ++                with self.assertRaisesMessage(ValidationError, msg):
> ++                    f.clean("x" * max_length_plus_one)
> ++                with self.assertRaisesMessage(
> ++                    ValidationError, "This is not a valid IPv6 address."
> ++                ):
> ++                    f.clean(addr)
> ++
> +     def test_generic_ipaddress_as_generic_not_required(self):
> +         f = GenericIPAddressField(required=False)
> +         self.assertEqual(f.clean(''), '')
> +@@ -104,7 +134,10 @@ class GenericIPAddressFieldTest(SimpleTestCase):
> +         with self.assertRaisesMessage(ValidationError, "'Enter a valid IPv4 or IPv6 address.'"):
> +             f.clean('256.125.1.5')
> +         self.assertEqual(f.clean(' fe80::223:6cff:fe8a:2e8a '), 'fe80::223:6cff:fe8a:2e8a')
> +-        self.assertEqual(f.clean(' 2a02::223:6cff:fe8a:2e8a '), '2a02::223:6cff:fe8a:2e8a')
> ++        self.assertEqual(
> ++            f.clean(" " * MAX_IPV6_ADDRESS_LENGTH + " 2a02::223:6cff:fe8a:2e8a "),
> ++            "2a02::223:6cff:fe8a:2e8a",
> ++            )
> +         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
> +             f.clean('12345:2:3:4')
> +         with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
> +diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv6.py
> +index 4e434f3..1ac6763 100644
> +--- a/tests/utils_tests/test_ipv6.py
> ++++ b/tests/utils_tests/test_ipv6.py
> +@@ -1,9 +1,17 @@
> +-import unittest
> ++import traceback
> ++from io import StringIO
> + 
> +-from django.utils.ipv6 import clean_ipv6_address, is_valid_ipv6_address
> ++from django.core.exceptions import ValidationError
> ++from django.test import SimpleTestCase
> ++from django.utils.ipv6 import (
> ++    MAX_IPV6_ADDRESS_LENGTH,
> ++    clean_ipv6_address,
> ++    is_valid_ipv6_address,
> ++)
> ++from django.utils.version import PY310
> + 
> + 
> +-class TestUtilsIPv6(unittest.TestCase):
> ++class TestUtilsIPv6(SimpleTestCase):
> + 
> +     def test_validates_correct_plain_address(self):
> +         self.assertTrue(is_valid_ipv6_address('fe80::223:6cff:fe8a:2e8a'))
> +@@ -55,3 +63,29 @@ class TestUtilsIPv6(unittest.TestCase):
> +         self.assertEqual(clean_ipv6_address('::ffff:0a0a:0a0a', unpack_ipv4=True), '10.10.10.10')
> +         self.assertEqual(clean_ipv6_address('::ffff:1234:1234', unpack_ipv4=True), '18.52.18.52')
> +         self.assertEqual(clean_ipv6_address('::ffff:18.52.18.52', unpack_ipv4=True), '18.52.18.52')
> ++
> ++    def test_address_too_long(self):
> ++        addresses = [
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228",  # IPv4-mapped IPv6 address
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228%123456",  # % scope/zone
> ++            "fe80::223:6cff:fe8a:2e8a:1234:5678:00000",  # MAX_IPV6_ADDRESS_LENGTH + 1
> ++        ]
> ++        msg = "This is the error message."
> ++        value_error_msg = "Unable to convert %s to an IPv6 address (value too long)."
> ++        for addr in addresses:
> ++            with self.subTest(addr=addr):
> ++                self.assertGreater(len(addr), MAX_IPV6_ADDRESS_LENGTH)
> ++                self.assertEqual(is_valid_ipv6_address(addr), False)
> ++                with self.assertRaisesMessage(ValidationError, msg) as ctx:
> ++                    clean_ipv6_address(addr, error_message=msg)
> ++                exception_traceback = StringIO()
> ++                if PY310:
> ++                    traceback.print_exception(ctx.exception, file=exception_traceback)
> ++                else:
> ++                    traceback.print_exception(
> ++                        type(ctx.exception),
> ++                        value=ctx.exception,
> ++                        tb=ctx.exception.__traceback__,
> ++                        file=exception_traceback,
> ++                    )
> ++                self.assertIn(value_error_msg % addr, exception_traceback.getvalue())
> +-- 
> +2.40.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2024-56374.patch
> new file mode 100644
> index 0000000000..cee4be249e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2024-56374.patch
> @@ -0,0 +1,354 @@
> +From ed42ea878033ef6b8bbc811140108816021b1d50 Mon Sep 17 00:00:00 2001
> +From: Natalia <124304+nessita@users.noreply.github.com>
> +Date: Mon, 6 Jan 2025 15:51:45 -0300
> +Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6
> +
> + validation.
> +
> +Thanks Saravana Kumar for the report, and Sarah Boyce and Mariusz
> +Felisiak for the reviews.
> +
> +CVE: CVE-2024-56374
> +
> +Upstream-Status: Backport
> +https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e
> +
> +Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>
> +Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> +
> +%% original patch: CVE-2024-56374.patch
> +---
> + Django.egg-info/PKG-INFO                      | 11 ++---
> + Django.egg-info/entry_points.txt              |  1 +
> + django/db/models/fields/__init__.py           |  6 +--
> + django/forms/fields.py                        |  7 +++-
> + django/utils/ipv6.py                          | 19 +++++++--
> + docs/ref/forms/fields.txt                     | 13 +++++-
> + docs/releases/4.2.17.txt                      | 11 +++++
> + .../field_tests/test_genericipaddressfield.py | 33 ++++++++++++++-
> + tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--
> + 9 files changed, 119 insertions(+), 22 deletions(-)
> +
> +diff --git a/Django.egg-info/PKG-INFO b/Django.egg-info/PKG-INFO
> +index 77b00b7..6159219 100644
> +--- a/Django.egg-info/PKG-INFO
> ++++ b/Django.egg-info/PKG-INFO
> +@@ -11,6 +11,7 @@ Project-URL: Release notes, https://docs.djangoproject.com/en/stable/releases/
> + Project-URL: Funding, https://www.djangoproject.com/fundraising/
> + Project-URL: Source, https://github.com/django/django
> + Project-URL: Tracker, https://code.djangoproject.com/
> ++Platform: UNKNOWN
> + Classifier: Development Status :: 5 - Production/Stable
> + Classifier: Environment :: Web Environment
> + Classifier: Framework :: Django
> +@@ -31,17 +32,11 @@ Classifier: Topic :: Internet :: WWW/HTTP :: WSGI
> + Classifier: Topic :: Software Development :: Libraries :: Application Frameworks
> + Classifier: Topic :: Software Development :: Libraries :: Python Modules
> + Requires-Python: >=3.8
> ++Provides-Extra: argon2
> ++Provides-Extra: bcrypt
> + License-File: LICENSE
> + License-File: LICENSE.python
> + License-File: AUTHORS
> +-Requires-Dist: asgiref<4,>=3.6.0
> +-Requires-Dist: backports.zoneinfo; python_version < "3.9"
> +-Requires-Dist: sqlparse>=0.3.1
> +-Requires-Dist: tzdata; sys_platform == "win32"
> +-Provides-Extra: argon2
> +-Requires-Dist: argon2-cffi>=19.1.0; extra == "argon2"
> +-Provides-Extra: bcrypt
> +-Requires-Dist: bcrypt; extra == "bcrypt"
> + 
> + ======
> + Django
> +diff --git a/Django.egg-info/entry_points.txt b/Django.egg-info/entry_points.txt
> +index eaeb88e..22df67e 100644
> +--- a/Django.egg-info/entry_points.txt
> ++++ b/Django.egg-info/entry_points.txt
> +@@ -1,2 +1,3 @@
> + [console_scripts]
> + django-admin = django.core.management:execute_from_command_line
> ++
> +diff --git a/django/db/models/fields/__init__.py b/django/db/models/fields/__init__.py
> +index b65948d..0cfba4e 100644
> +--- a/django/db/models/fields/__init__.py
> ++++ b/django/db/models/fields/__init__.py
> +@@ -25,7 +25,7 @@ from django.utils.dateparse import (
> + )
> + from django.utils.duration import duration_microseconds, duration_string
> + from django.utils.functional import Promise, cached_property
> +-from django.utils.ipv6 import clean_ipv6_address
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
> + from django.utils.itercompat import is_iterable
> + from django.utils.text import capfirst
> + from django.utils.translation import gettext_lazy as _
> +@@ -2160,7 +2160,7 @@ class GenericIPAddressField(Field):
> +             invalid_error_message,
> +         ) = validators.ip_address_validators(protocol, unpack_ipv4)
> +         self.default_error_messages["invalid"] = invalid_error_message
> +-        kwargs["max_length"] = 39
> ++        kwargs["max_length"] = MAX_IPV6_ADDRESS_LENGTH
> +         super().__init__(verbose_name, name, *args, **kwargs)
> + 
> +     def check(self, **kwargs):
> +@@ -2187,7 +2187,7 @@ class GenericIPAddressField(Field):
> +             kwargs["unpack_ipv4"] = self.unpack_ipv4
> +         if self.protocol != "both":
> +             kwargs["protocol"] = self.protocol
> +-        if kwargs.get("max_length") == 39:
> ++        if kwargs.get("max_length") == self.max_length:
> +             del kwargs["max_length"]
> +         return name, path, args, kwargs
> + 
> +diff --git a/django/forms/fields.py b/django/forms/fields.py
> +index 01cd831..e62417f 100644
> +--- a/django/forms/fields.py
> ++++ b/django/forms/fields.py
> +@@ -42,7 +42,7 @@ from django.forms.widgets import (
> + from django.utils import formats
> + from django.utils.dateparse import parse_datetime, parse_duration
> + from django.utils.duration import duration_string
> +-from django.utils.ipv6 import clean_ipv6_address
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_address
> + from django.utils.regex_helper import _lazy_re_compile
> + from django.utils.translation import gettext_lazy as _
> + from django.utils.translation import ngettext_lazy
> +@@ -1284,6 +1284,7 @@ class GenericIPAddressField(CharField):
> +         self.default_validators = validators.ip_address_validators(
> +             protocol, unpack_ipv4
> +         )[0]
> ++        kwargs.setdefault("max_length", MAX_IPV6_ADDRESS_LENGTH)
> +         super().__init__(**kwargs)
> + 
> +     def to_python(self, value):
> +@@ -1291,7 +1292,9 @@ class GenericIPAddressField(CharField):
> +             return ""
> +         value = value.strip()
> +         if value and ":" in value:
> +-            return clean_ipv6_address(value, self.unpack_ipv4)
> ++            return clean_ipv6_address(
> ++                value, self.unpack_ipv4, max_length=self.max_length
> ++            )
> +         return value
> + 
> + 
> +diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py
> +index 88dd6ec..de41a97 100644
> +--- a/django/utils/ipv6.py
> ++++ b/django/utils/ipv6.py
> +@@ -3,9 +3,22 @@ import ipaddress
> + from django.core.exceptions import ValidationError
> + from django.utils.translation import gettext_lazy as _
> + 
> ++MAX_IPV6_ADDRESS_LENGTH = 39
> ++
> ++
> ++def _ipv6_address_from_str(ip_str, max_length=MAX_IPV6_ADDRESS_LENGTH):
> ++    if len(ip_str) > max_length:
> ++        raise ValueError(
> ++            f"Unable to convert {ip_str} to an IPv6 address (value too long)."
> ++        )
> ++    return ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
> ++
> + 
> + def clean_ipv6_address(
> +-    ip_str, unpack_ipv4=False, error_message=_("This is not a valid IPv6 address.")
> ++    ip_str,
> ++    unpack_ipv4=False,
> ++    error_message=_("This is not a valid IPv6 address."),
> ++    max_length=MAX_IPV6_ADDRESS_LENGTH,
> + ):
> +     """
> +     Clean an IPv6 address string.
> +@@ -24,7 +37,7 @@ def clean_ipv6_address(
> +     Return a compressed IPv6 address or the same value.
> +     """
> +     try:
> +-        addr = ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))
> ++        addr = _ipv6_address_from_str(ip_str, max_length)
> +     except ValueError:
> +         raise ValidationError(error_message, code="invalid")
> + 
> +@@ -41,7 +54,7 @@ def is_valid_ipv6_address(ip_str):
> +     Return whether or not the `ip_str` string is a valid IPv6 address.
> +     """
> +     try:
> +-        ipaddress.IPv6Address(ip_str)
> ++        _ipv6_address_from_str(ip_str)
> +     except ValueError:
> +         return False
> +     return True
> +diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
> +index 1a7274e..76b4587 100644
> +--- a/docs/ref/forms/fields.txt
> ++++ b/docs/ref/forms/fields.txt
> +@@ -719,7 +719,7 @@ For each field, we describe the default widget used if you don't specify
> +     * Empty value: ``''`` (an empty string)
> +     * Normalizes to: A string. IPv6 addresses are normalized as described below.
> +     * Validates that the given value is a valid IP address.
> +-    * Error message keys: ``required``, ``invalid``
> ++    * Error message keys: ``required``, ``invalid``, ``max_length``
> + 
> +     The IPv6 address normalization follows :rfc:`4291#section-2.2` section 2.2,
> +     including using the IPv4 format suggested in paragraph 3 of that section, like
> +@@ -727,7 +727,7 @@ For each field, we describe the default widget used if you don't specify
> +     ``2001::1``, and ``::ffff:0a0a:0a0a`` to ``::ffff:10.10.10.10``. All characters
> +     are converted to lowercase.
> + 
> +-    Takes two optional arguments:
> ++    Takes three optional arguments:
> + 
> +     .. attribute:: protocol
> + 
> +@@ -742,6 +742,15 @@ For each field, we describe the default widget used if you don't specify
> +         ``192.0.2.1``. Default is disabled. Can only be used
> +         when ``protocol`` is set to ``'both'``.
> + 
> ++    .. attribute:: max_length
> ++
> ++        Defaults to 39, and behaves the same way as it does for
> ++        :class:`CharField`.
> ++
> ++    .. versionchanged:: 4.2.18
> ++
> ++        The default value for ``max_length`` was set to 39 characters.
> ++
> + ``ImageField``
> + --------------
> + 
> +diff --git a/docs/releases/4.2.17.txt b/docs/releases/4.2.17.txt
> +index 0475a96..1392724 100644
> +--- a/docs/releases/4.2.17.txt
> ++++ b/docs/releases/4.2.17.txt
> +@@ -39,3 +39,14 @@ CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text
> + The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
> + potential denial-of-service attack when used with very long strings.
> + 
> ++CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation
> ++============================================================================
> ++
> ++Lack of upper bound limit enforcement in strings passed when performing IPv6
> ++validation could lead to a potential denial-of-service attack. The undocumented
> ++and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_address`` were
> ++vulnerable, as was the  :class:`django.forms.GenericIPAddressField` form field,
> ++which has now been updated to define a ``max_length`` of 39 characters.
> ++
> ++The :class:`django.db.models.GenericIPAddressField` model field was not
> ++affected.
> +diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py b/tests/forms_tests/field_tests/test_genericipaddressfield.py
> +index 80722f5..ef00a72 100644
> +--- a/tests/forms_tests/field_tests/test_genericipaddressfield.py
> ++++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py
> +@@ -1,6 +1,7 @@
> + from django.core.exceptions import ValidationError
> + from django.forms import GenericIPAddressField
> + from django.test import SimpleTestCase
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH
> + 
> + 
> + class GenericIPAddressFieldTest(SimpleTestCase):
> +@@ -125,6 +126,35 @@ class GenericIPAddressFieldTest(SimpleTestCase):
> +         ):
> +             f.clean("1:2")
> + 
> ++    def test_generic_ipaddress_max_length_custom(self):
> ++        # Valid IPv4-mapped IPv6 address, len 45.
> ++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
> ++        f = GenericIPAddressField(max_length=len(addr))
> ++        f.clean(addr)
> ++
> ++    def test_generic_ipaddress_max_length_validation_error(self):
> ++        # Valid IPv4-mapped IPv6 address, len 45.
> ++        addr = "0000:0000:0000:0000:0000:ffff:192.168.100.228"
> ++
> ++        cases = [
> ++            ({}, MAX_IPV6_ADDRESS_LENGTH),  # Default value.
> ++            ({"max_length": len(addr) - 1}, len(addr) - 1),
> ++        ]
> ++        for kwargs, max_length in cases:
> ++            max_length_plus_one = max_length + 1
> ++            msg = (
> ++                f"Ensure this value has at most {max_length} characters (it has "
> ++                f"{max_length_plus_one}).'"
> ++            )
> ++            with self.subTest(max_length=max_length):
> ++                f = GenericIPAddressField(**kwargs)
> ++                with self.assertRaisesMessage(ValidationError, msg):
> ++                    f.clean("x" * max_length_plus_one)
> ++                with self.assertRaisesMessage(
> ++                    ValidationError, "This is not a valid IPv6 address."
> ++                ):
> ++                    f.clean(addr)
> ++
> +     def test_generic_ipaddress_as_generic_not_required(self):
> +         f = GenericIPAddressField(required=False)
> +         self.assertEqual(f.clean(""), "")
> +@@ -150,7 +180,8 @@ class GenericIPAddressFieldTest(SimpleTestCase):
> +             f.clean(" fe80::223:6cff:fe8a:2e8a "), "fe80::223:6cff:fe8a:2e8a"
> +         )
> +         self.assertEqual(
> +-            f.clean(" 2a02::223:6cff:fe8a:2e8a "), "2a02::223:6cff:fe8a:2e8a"
> ++            f.clean(" " * MAX_IPV6_ADDRESS_LENGTH + " 2a02::223:6cff:fe8a:2e8a "),
> ++            "2a02::223:6cff:fe8a:2e8a",
> +         )
> +         with self.assertRaisesMessage(
> +             ValidationError, "'This is not a valid IPv6 address.'"
> +diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv6.py
> +index bf78ed9..2d06507 100644
> +--- a/tests/utils_tests/test_ipv6.py
> ++++ b/tests/utils_tests/test_ipv6.py
> +@@ -1,9 +1,17 @@
> +-import unittest
> ++import traceback
> ++from io import StringIO
> + 
> +-from django.utils.ipv6 import clean_ipv6_address, is_valid_ipv6_address
> ++from django.core.exceptions import ValidationError
> ++from django.test import SimpleTestCase
> ++from django.utils.ipv6 import (
> ++    MAX_IPV6_ADDRESS_LENGTH,
> ++    clean_ipv6_address,
> ++    is_valid_ipv6_address,
> ++)
> ++from django.utils.version import PY310
> + 
> + 
> +-class TestUtilsIPv6(unittest.TestCase):
> ++class TestUtilsIPv6(SimpleTestCase):
> +     def test_validates_correct_plain_address(self):
> +         self.assertTrue(is_valid_ipv6_address("fe80::223:6cff:fe8a:2e8a"))
> +         self.assertTrue(is_valid_ipv6_address("2a02::223:6cff:fe8a:2e8a"))
> +@@ -64,3 +72,29 @@ class TestUtilsIPv6(unittest.TestCase):
> +         self.assertEqual(
> +             clean_ipv6_address("::ffff:18.52.18.52", unpack_ipv4=True), "18.52.18.52"
> +         )
> ++
> ++    def test_address_too_long(self):
> ++        addresses = [
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228",  # IPv4-mapped IPv6 address
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228%123456",  # % scope/zone
> ++            "fe80::223:6cff:fe8a:2e8a:1234:5678:00000",  # MAX_IPV6_ADDRESS_LENGTH + 1
> ++        ]
> ++        msg = "This is the error message."
> ++        value_error_msg = "Unable to convert %s to an IPv6 address (value too long)."
> ++        for addr in addresses:
> ++            with self.subTest(addr=addr):
> ++                self.assertGreater(len(addr), MAX_IPV6_ADDRESS_LENGTH)
> ++                self.assertEqual(is_valid_ipv6_address(addr), False)
> ++                with self.assertRaisesMessage(ValidationError, msg) as ctx:
> ++                    clean_ipv6_address(addr, error_message=msg)
> ++                exception_traceback = StringIO()
> ++                if PY310:
> ++                    traceback.print_exception(ctx.exception, file=exception_traceback)
> ++                else:
> ++                    traceback.print_exception(
> ++                        type(ctx.exception),
> ++                        value=ctx.exception,
> ++                        tb=ctx.exception.__traceback__,
> ++                        file=exception_traceback,
> ++                    )
> ++                self.assertIn(value_error_msg % addr, exception_traceback.getvalue())
> +-- 
> +2.35.5
> +
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> index 24eee95f03..f4b8da69b5 100644
> --- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> @@ -26,6 +26,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
>              file://CVE-2024-53907.patch \
>              file://CVE-2024-27351.patch \
>              file://CVE-2025-26699.patch \
> +            file://CVE-2024-56374.patch \
>             "
>  
>  SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
> index 92a3886cbc..b8e8759467 100644
> --- a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
> @@ -9,6 +9,7 @@ RDEPENDS:${PN} += "\
>  SRC_URI += "\
>  	file://CVE-2024-27351.patch \
>  	file://CVE-2025-26699.patch \
> +	file://CVE-2024-56374.patch \
>  "
>  
>  # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
> diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
> index c2b517a441..5377b96c79 100644
> --- a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
> @@ -7,7 +7,10 @@ RDEPENDS:${PN} += "\
>      ${PYTHON_PN}-sqlparse \
>  "
>  
> -SRC_URI += "file://CVE-2025-26699.patch"
> +SRC_URI += "\
> +	file://CVE-2025-26699.patch \
> +	file://CVE-2024-56374.patch \
> +"
>  
>  # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
>  # default. To build the 4.x branch, 
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121753): https://lists.openembedded.org/g/openembedded-devel/message/121753
> Mute This Topic: https://lists.openembedded.org/mt/116332483/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


